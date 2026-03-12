/**
 * embed-verses.cjs — Generate Gemini embeddings for all 31,102 KJV verses
 *
 * Usage:  node scripts/embed-verses.cjs
 * Requires in .env.local:
 *   GEMINI_API_KEY
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY
 *
 * - Reads all 66 public/data/*.json files
 * - Calls Gemini batchEmbedContents (100 verses per request)
 * - Upserts into Supabase verse_embeddings table
 * - Supports resume (skips already-embedded verses)
 * - Free tier: 1,500 req/day → ~312 batches fit in 1 day
 */

const fs = require('fs');
const path = require('path');

// ── Parse .env.local ────────────────────────────────────────
function loadEnv() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) {
    console.error('Missing .env.local — copy .env.example and fill in values');
    process.exit(1);
  }
  const lines = fs.readFileSync(envPath, 'utf8').split('\n');
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const eqIdx = trimmed.indexOf('=');
    if (eqIdx < 0) continue;
    const key = trimmed.slice(0, eqIdx).trim();
    const val = trimmed.slice(eqIdx + 1).trim();
    if (!process.env[key]) process.env[key] = val;
  }
}
loadEnv();

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_SERVICE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!GEMINI_API_KEY) { console.error('Missing GEMINI_API_KEY in .env.local'); process.exit(1); }
if (!SUPABASE_URL) { console.error('Missing NEXT_PUBLIC_SUPABASE_URL in .env.local'); process.exit(1); }
if (!SUPABASE_SERVICE_KEY) { console.error('Missing SUPABASE_SERVICE_ROLE_KEY in .env.local'); process.exit(1); }

const BATCH_SIZE = 100;
const DELAY_MS = 5000; // 5s between batches (avoid 429 rate limits)
const MAX_RETRIES = 3;
const GEMINI_URL = `https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:batchEmbedContents?key=${GEMINI_API_KEY}`;

// ── Supabase REST helpers ───────────────────────────────────
const supabaseHeaders = {
  'Content-Type': 'application/json',
  'apikey': SUPABASE_SERVICE_KEY,
  'Authorization': `Bearer ${SUPABASE_SERVICE_KEY}`,
  'Prefer': 'return=minimal',
};

async function supabaseSelect(table, select, params = '') {
  const url = `${SUPABASE_URL}/rest/v1/${table}?select=${select}${params}`;
  const res = await fetch(url, { headers: supabaseHeaders });
  if (!res.ok) throw new Error(`Supabase SELECT failed: ${res.status} ${await res.text()}`);
  return res.json();
}

async function supabaseUpsert(table, rows) {
  const url = `${SUPABASE_URL}/rest/v1/${table}`;
  const res = await fetch(url, {
    method: 'POST',
    headers: { ...supabaseHeaders, 'Prefer': 'resolution=merge-duplicates,return=minimal' },
    body: JSON.stringify(rows),
  });
  if (!res.ok) throw new Error(`Supabase UPSERT failed: ${res.status} ${await res.text()}`);
}

// ── Extract verses from static JSON ─────────────────────────
function extractVerses() {
  const dataDir = path.join(__dirname, '..', 'public', 'data');
  const files = fs.readdirSync(dataDir)
    .filter(f => f.endsWith('.json') && f !== 'verse-counts.json')
    .sort();

  const verses = [];
  for (const file of files) {
    const data = JSON.parse(fs.readFileSync(path.join(dataDir, file), 'utf8'));
    if (!data.book || !data.chapters) continue;

    const bookName = data.book;
    const chapterNums = Object.keys(data.chapters)
      .map(Number)
      .sort((a, b) => a - b);

    for (const chNum of chapterNums) {
      const ch = data.chapters[String(chNum)];
      if (!ch?.verses) continue;
      for (const v of ch.verses) {
        const ref = `${bookName} ${chNum}:${v.verse_number}`;
        verses.push({ verse_ref: ref, kjv_text: v.kjv_text });
      }
    }
  }
  return verses;
}

// ── Call Gemini batchEmbedContents ───────────────────────────
async function embedBatch(verses, retryCount = 0) {
  const body = {
    requests: verses.map(v => ({
      model: 'models/gemini-embedding-001',
      content: { parts: [{ text: `${v.verse_ref}: ${v.kjv_text}` }] },
      taskType: 'RETRIEVAL_DOCUMENT',
      title: v.verse_ref,
      outputDimensionality: 768,
    })),
  };

  const res = await fetch(GEMINI_URL, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    const errText = await res.text();
    if ((res.status === 429 || res.status >= 500) && retryCount < MAX_RETRIES) {
      const wait = Math.pow(2, retryCount) * 30000; // 30s, 60s, 120s
      console.log(`  ⚠ ${res.status} error, retrying in ${wait / 1000}s (attempt ${retryCount + 1}/${MAX_RETRIES})...`);
      await sleep(wait);
      return embedBatch(verses, retryCount + 1);
    }
    throw new Error(`Gemini API error ${res.status}: ${errText}`);
  }

  const data = await res.json();
  if (!data.embeddings || data.embeddings.length !== verses.length) {
    throw new Error(`Expected ${verses.length} embeddings, got ${data.embeddings?.length || 0}`);
  }

  return data.embeddings.map(e => e.values);
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// ── Main ────────────────────────────────────────────────────
async function main() {
  console.log('─── Embedding Pipeline ───────────────────────────');
  console.log('Reading static JSON files...');

  const allVerses = extractVerses();
  console.log(`Found ${allVerses.length} verses across 66 books`);

  // Get already-embedded verse refs (resume capability)
  console.log('Checking existing embeddings...');
  let existingRefs = new Set();
  try {
    const rows = await supabaseSelect('verse_embeddings', 'verse_ref');
    existingRefs = new Set(rows.map(r => r.verse_ref));
    console.log(`Already embedded: ${existingRefs.size} verses`);
  } catch (e) {
    console.log('No existing embeddings found (table may be empty)');
  }

  // Filter to un-embedded verses
  const remaining = allVerses.filter(v => !existingRefs.has(v.verse_ref));
  if (remaining.length === 0) {
    console.log('All verses already embedded! Nothing to do.');
    return;
  }
  console.log(`Remaining to embed: ${remaining.length} verses`);

  // Batch processing
  const totalBatches = Math.ceil(remaining.length / BATCH_SIZE);
  let embedded = 0;
  let errors = 0;

  for (let i = 0; i < remaining.length; i += BATCH_SIZE) {
    const batchNum = Math.floor(i / BATCH_SIZE) + 1;
    const batch = remaining.slice(i, i + BATCH_SIZE);
    const first = batch[0].verse_ref;
    const last = batch[batch.length - 1].verse_ref;

    process.stdout.write(`Batch ${batchNum}/${totalBatches} — ${batch.length} verses (${first} → ${last})...`);

    try {
      // 1. Get embeddings from Gemini
      const embeddings = await embedBatch(batch);

      // 2. Prepare rows for Supabase upsert
      const rows = batch.map((v, idx) => ({
        verse_ref: v.verse_ref,
        kjv_text: v.kjv_text,
        embedding: JSON.stringify(embeddings[idx]),
      }));

      // 3. Upsert to Supabase
      await supabaseUpsert('verse_embeddings', rows);

      embedded += batch.length;
      console.log(` ✓ (${embedded}/${remaining.length} done)`);
    } catch (e) {
      errors++;
      console.log(` ✗ ERROR: ${e.message}`);
      console.log(`  Skipping batch ${batchNum} (${first} → ${last})`);
    }

    // Rate limit delay (skip after last batch)
    if (i + BATCH_SIZE < remaining.length) {
      await sleep(DELAY_MS);
    }
  }

  console.log('─── Done ────────────────────────────────────────');
  console.log(`Embedded: ${embedded} verses`);
  console.log(`Errors: ${errors} batches`);
  console.log(`Total in DB: ${existingRefs.size + embedded} / ${allVerses.length}`);
  if (errors > 0) {
    console.log('Re-run this script to retry failed batches.');
  }
}

main().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
