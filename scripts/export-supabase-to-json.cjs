#!/usr/bin/env node
/**
 * export-supabase-to-json.cjs
 * Pulls enriched chapter + verse data from Supabase and merges it into
 * the local public/data/{book}.json files.
 *
 * Use this when chapters were seeded directly in Supabase (e.g. via the SQL
 * editor) but no local SQL files exist, so sql-to-json.cjs has no data to parse.
 *
 * WHAT IT DOES:
 *   1. Queries Supabase for enriched chapters (where overview IS NOT NULL)
 *   2. Queries the verse study data for those chapters
 *   3. Reads the existing public/data/{slug}.json (already has KJV text from fetch-kjv.cjs)
 *   4. Merges meta (overview, theme, keyWord, outline) + verse study fields
 *   5. Writes the updated JSON back to disk
 *
 * USAGE:
 *   node scripts/export-supabase-to-json.cjs
 *   node scripts/export-supabase-to-json.cjs --books genesis,exodus,leviticus
 *   node scripts/export-supabase-to-json.cjs --books matthew
 */

const { Client } = require('pg');
const fs   = require('fs');
const path = require('path');

const DATA_DIR = path.join(__dirname, '..', 'public', 'data');

// ── Parse CLI ─────────────────────────────────────────────────────────────────
const args = process.argv.slice(2);
const booksArg = (() => {
  const i = args.indexOf('--books');
  return i !== -1 ? args[i + 1] : null;
})();

// Default: the three OT books the user seeded manually
const DEFAULT_BOOKS = ['Genesis', 'Exodus', 'Leviticus'];
const booksToExport = booksArg
  ? booksArg.split(',').map(b => b.trim().replace(/^\w/, c => c.toUpperCase()))
  : DEFAULT_BOOKS;

// ── Load .env.local ───────────────────────────────────────────────────────────
function loadEnvLocal() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) return;
  for (const line of fs.readFileSync(envPath, 'utf8').split('\n')) {
    const m = line.match(/^([A-Z0-9_]+)\s*=\s*(.+)$/);
    if (m) process.env[m[1]] = m[2].trim().replace(/^["']|["']$/g, '');
  }
}

// ── Parse the outline field (stored as JSON string in DB) ─────────────────────
function parseOutline(raw) {
  if (!raw) return null;
  if (Array.isArray(raw)) return raw;
  try { return JSON.parse(raw); } catch { return raw; }
}

// ── Main ──────────────────────────────────────────────────────────────────────
async function main() {
  loadEnvLocal();

  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    console.error('\n❌  DATABASE_URL not set in .env.local\n');
    process.exit(1);
  }

  const client = new Client({
    connectionString,
    ssl: { rejectUnauthorized: false },
    connectionTimeoutMillis: 15000,
    statement_timeout: 60000,
  });

  await client.connect();
  console.log('\n=== Export Supabase → JSON ===');
  console.log(`  Books: ${booksToExport.join(', ')}\n`);

  let totalChapters = 0;
  let totalVerses   = 0;

  for (const bookName of booksToExport) {
    const slug     = bookName.toLowerCase().replace(/\s+/g, '-');
    const jsonPath = path.join(DATA_DIR, `${slug}.json`);

    if (!fs.existsSync(jsonPath)) {
      console.log(`  ⚠  ${bookName}: no local JSON at public/data/${slug}.json — skipping`);
      continue;
    }

    // ── 1. Get all enriched chapters for this book ────────────────────────────
    const chapRows = (await client.query(`
      SELECT c.chapter_number,
             c.overview,
             c.theme,
             c.key_word_original,
             c.key_word_meaning,
             c.outline
      FROM   chapters c
      JOIN   books b ON c.book_id = b.id
      WHERE  b.name = $1
        AND  c.overview IS NOT NULL
      ORDER  BY c.chapter_number
    `, [bookName])).rows;

    if (chapRows.length === 0) {
      console.log(`  -  ${bookName}: no enriched chapters in Supabase — skipping`);
      continue;
    }

    // ── 2. Get all verse study data for this book ─────────────────────────────
    const verseRows = (await client.query(`
      SELECT c.chapter_number,
             v.verse_number,
             v.original_text,
             v.transliteration,
             v.study_note,
             v.doctrinal_note,
             v.application_note,
             v.historical_context
      FROM   verses v
      JOIN   chapters c ON v.chapter_id = c.id
      JOIN   books    b ON c.book_id    = b.id
      WHERE  b.name = $1
        AND  (v.original_text IS NOT NULL
              OR v.study_note IS NOT NULL
              OR v.doctrinal_note IS NOT NULL)
      ORDER  BY c.chapter_number, v.verse_number
    `, [bookName])).rows;

    // Build lookup: chapterNumber → verseNumber → enrichment row
    const verseMap = {};
    for (const row of verseRows) {
      (verseMap[row.chapter_number] ??= {})[row.verse_number] = row;
    }

    // ── 3. Read existing JSON ─────────────────────────────────────────────────
    const data = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    let enrichedChapters = 0;
    let enrichedVerses   = 0;

    // ── 4. Merge ──────────────────────────────────────────────────────────────
    for (const chRow of chapRows) {
      const ch = data.chapters[chRow.chapter_number];
      if (!ch) {
        console.log(`  ⚠  ${bookName} ch${chRow.chapter_number}: not in local JSON — skipping`);
        continue;
      }

      // Add chapter meta
      ch.meta = {
        overview:        chRow.overview,
        theme:           chRow.theme,
        keyWordOriginal: chRow.key_word_original,
        keyWordMeaning:  chRow.key_word_meaning,
        outline:         parseOutline(chRow.outline),
      };

      // Enrich individual verses
      const chVerses = verseMap[chRow.chapter_number] ?? {};
      for (const verse of ch.verses) {
        const e = chVerses[verse.verse_number];
        if (!e) continue;
        if (e.original_text)     verse.original_text     = e.original_text;
        if (e.transliteration)   verse.transliteration   = e.transliteration;
        if (e.study_note)        verse.study_note        = e.study_note;
        if (e.doctrinal_note)    verse.doctrinal_note    = e.doctrinal_note;
        if (e.application_note)  verse.application_note  = e.application_note;
        if (e.historical_context) verse.historical_context = e.historical_context;
        enrichedVerses++;
      }

      enrichedChapters++;
    }

    // ── 5. Write back ─────────────────────────────────────────────────────────
    fs.writeFileSync(jsonPath, JSON.stringify(data));
    console.log(`  ✓  ${bookName}: ${enrichedChapters} chapters, ${enrichedVerses} verses enriched`);
    totalChapters += enrichedChapters;
    totalVerses   += enrichedVerses;
  }

  await client.end();
  console.log(`\n  Done. Total: ${totalChapters} chapters, ${totalVerses} verses merged.\n`);
}

main().catch(err => {
  console.error('\nFatal error:', err.message);
  process.exit(1);
});
