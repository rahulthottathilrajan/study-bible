/**
 * embed-podcasts.cjs — Generate Gemini embeddings for podcast episodes
 *
 * Usage:  node scripts/embed-podcasts.cjs
 * Requires in .env.local:
 *   GEMINI_API_KEY
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY
 *
 * - Reads all public/data/podcasts/*.json files (excluding index.json)
 * - Concatenates title + description + transcript per episode
 * - Calls Gemini batchEmbedContents
 * - Upserts into Supabase podcast_embeddings table
 * - Supports resume (skips already-embedded episodes)
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

// ── Extract episodes from podcast JSON files ────────────────
function extractEpisodes() {
  const podcastDir = path.join(__dirname, '..', 'public', 'data', 'podcasts');
  if (!fs.existsSync(podcastDir)) {
    console.error('Podcast directory not found:', podcastDir);
    process.exit(1);
  }

  const files = fs.readdirSync(podcastDir)
    .filter(f => f.endsWith('.json') && f !== 'index.json')
    .sort();

  const episodes = [];
  for (const file of files) {
    const data = JSON.parse(fs.readFileSync(path.join(podcastDir, file), 'utf8'));
    const seriesSlug = data.slug;
    if (!seriesSlug || !data.episodes) continue;

    for (const [epNum, ep] of Object.entries(data.episodes)) {
      const transcriptText = (ep.transcript || []).map(t => t.text).join(' ');
      const contentText = `${ep.title} | ${ep.description} | ${transcriptText}`;
      const episodeRef = `${seriesSlug}:${epNum}`;

      episodes.push({
        episode_ref: episodeRef,
        title: ep.title,
        description: ep.description,
        content_text: contentText,
        series_slug: seriesSlug,
        episode_number: parseInt(epNum),
      });
    }
  }
  return episodes;
}

// ── Call Gemini batchEmbedContents ───────────────────────────
async function embedBatch(episodes, retryCount = 0) {
  const body = {
    requests: episodes.map(ep => ({
      model: 'models/gemini-embedding-001',
      content: { parts: [{ text: ep.content_text }] },
      taskType: 'RETRIEVAL_DOCUMENT',
      title: `${ep.series_slug} Episode ${ep.episode_number}: ${ep.title}`,
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
      const wait = Math.pow(2, retryCount) * 30000;
      console.log(`  Warning: ${res.status} error, retrying in ${wait / 1000}s (attempt ${retryCount + 1}/${MAX_RETRIES})...`);
      await new Promise(r => setTimeout(r, wait));
      return embedBatch(episodes, retryCount + 1);
    }
    throw new Error(`Gemini API error ${res.status}: ${errText}`);
  }

  const data = await res.json();
  if (!data.embeddings || data.embeddings.length !== episodes.length) {
    throw new Error(`Expected ${episodes.length} embeddings, got ${data.embeddings?.length || 0}`);
  }

  return data.embeddings.map(e => e.values);
}

// ── Main ────────────────────────────────────────────────────
async function main() {
  console.log('--- Podcast Embedding Pipeline ---');

  const allEpisodes = extractEpisodes();
  console.log(`Found ${allEpisodes.length} episodes`);

  if (allEpisodes.length === 0) {
    console.log('No episodes found. Nothing to do.');
    return;
  }

  // Check existing embeddings (resume capability)
  let existingRefs = new Set();
  try {
    const rows = await supabaseSelect('podcast_embeddings', 'episode_ref');
    existingRefs = new Set(rows.map(r => r.episode_ref));
    console.log(`Already embedded: ${existingRefs.size} episodes`);
  } catch {
    console.log('No existing embeddings found (table may be empty)');
  }

  const remaining = allEpisodes.filter(ep => !existingRefs.has(ep.episode_ref));
  if (remaining.length === 0) {
    console.log('All episodes already embedded! Nothing to do.');
    return;
  }
  console.log(`Remaining to embed: ${remaining.length} episodes`);

  try {
    // Embed all remaining episodes in one batch (small count)
    console.log(`Embedding ${remaining.length} episodes...`);
    const embeddings = await embedBatch(remaining);

    // Prepare rows for Supabase upsert
    const rows = remaining.map((ep, idx) => ({
      episode_ref: ep.episode_ref,
      title: ep.title,
      description: ep.description,
      content_text: ep.content_text,
      series_slug: ep.series_slug,
      episode_number: ep.episode_number,
      embedding: JSON.stringify(embeddings[idx]),
    }));

    await supabaseUpsert('podcast_embeddings', rows);
    console.log(`Embedded ${remaining.length} episodes successfully`);
  } catch (e) {
    console.error('Error:', e.message);
    process.exit(1);
  }

  console.log('--- Done ---');
  console.log(`Total in DB: ${existingRefs.size + remaining.length} episodes`);
}

main().catch(e => {
  console.error('Fatal error:', e);
  process.exit(1);
});
