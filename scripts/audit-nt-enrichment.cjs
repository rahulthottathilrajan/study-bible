#!/usr/bin/env node
/* NT enrichment audit — coverage + depth report per book/chapter. */
const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

function loadEnvLocal() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) return;
  for (const line of fs.readFileSync(envPath, 'utf8').split(/\r?\n/)) {
    const m = line.match(/^([A-Z0-9_]+)\s*=\s*(.+)$/);
    if (m) process.env[m[1]] = m[2].trim().replace(/^["']|["']$/g, '');
  }
}

const NT_BOOKS = [
  'Matthew','Mark','Luke','John','Acts','Romans','1 Corinthians','2 Corinthians',
  'Galatians','Ephesians','Philippians','Colossians','1 Thessalonians','2 Thessalonians',
  '1 Timothy','2 Timothy','Titus','Philemon','Hebrews','James','1 Peter','2 Peter',
  '1 John','2 John','3 John','Jude','Revelation'
];

async function main() {
  loadEnvLocal();
  const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
    connectionTimeoutMillis: 15000,
  });
  await client.connect();

  // Per-chapter audit
  const sql = `
    SELECT b.name AS book, c.chapter_number AS ch,
      COUNT(DISTINCT v.id) AS verses,
      COUNT(DISTINCT ws.id) AS ws,
      COUNT(DISTINCT cr.id) AS cr,
      COUNT(DISTINCT v.id) FILTER (WHERE v.study_note IS NOT NULL) AS notes
    FROM books b
    JOIN chapters c ON c.book_id = b.id
    LEFT JOIN verses v ON v.chapter_id = c.id
    LEFT JOIN word_studies ws ON ws.verse_id = v.id
    LEFT JOIN cross_references cr ON cr.verse_id = v.id
    WHERE b.name = ANY($1::text[])
    GROUP BY b.name, c.chapter_number
    ORDER BY b.name, c.chapter_number
  `;
  const r = await client.query(sql, [NT_BOOKS]);

  // Group by book
  const byBook = new Map();
  for (const row of r.rows) {
    if (!byBook.has(row.book)) byBook.set(row.book, []);
    byBook.get(row.book).push(row);
  }

  const totals = { books: 0, chapters: 0, verses: 0, ws: 0, cr: 0, notes: 0 };
  const concerns = [];

  for (const book of NT_BOOKS) {
    const rows = byBook.get(book) || [];
    if (rows.length === 0) {
      concerns.push(`MISSING ENTIRE BOOK: ${book}`);
      continue;
    }
    totals.books++;
    let bWs = 0, bCr = 0, bV = 0, bN = 0;
    const lowChapters = [];
    for (const row of rows) {
      bV += Number(row.verses);
      bWs += Number(row.ws);
      bCr += Number(row.cr);
      bN += Number(row.notes);
      // Flag chapters with depth concerns
      const v = Number(row.verses), w = Number(row.ws), c = Number(row.cr), n = Number(row.notes);
      if (v > 0 && w === 0) lowChapters.push(`Ch${row.ch}: 0 ws (verses=${v})`);
      else if (v > 0 && w < 15) lowChapters.push(`Ch${row.ch}: thin ws=${w} (verses=${v})`);
      if (v > 0 && c === 0) lowChapters.push(`Ch${row.ch}: 0 cr (verses=${v})`);
      else if (v > 0 && c < 30) lowChapters.push(`Ch${row.ch}: thin cr=${c} (verses=${v})`);
      if (v > 0 && n < v * 0.5) lowChapters.push(`Ch${row.ch}: thin notes=${n}/${v}`);
    }
    totals.chapters += rows.length;
    totals.verses += bV;
    totals.ws += bWs;
    totals.cr += bCr;
    totals.notes += bN;
    const avgWs = (bWs / rows.length).toFixed(1);
    const avgCr = (bCr / rows.length).toFixed(1);
    console.log(`${book.padEnd(18)} chs=${String(rows.length).padStart(2)} v=${String(bV).padStart(4)} ws=${String(bWs).padStart(5)} (avg ${avgWs.padStart(5)})  cr=${String(bCr).padStart(5)} (avg ${avgCr.padStart(5)})  notes=${String(bN).padStart(4)}`);
    if (lowChapters.length) {
      concerns.push(`${book}:`);
      for (const lc of lowChapters) concerns.push(`  ${lc}`);
    }
  }

  console.log(`\n=== NT TOTALS ===`);
  console.log(`Books: ${totals.books}/27`);
  console.log(`Chapters: ${totals.chapters}/260`);
  console.log(`Verses: ${totals.verses} (study_notes: ${totals.notes})`);
  console.log(`Word studies: ${totals.ws}`);
  console.log(`Cross-refs: ${totals.cr}`);
  console.log(`Avg ws/chapter: ${(totals.ws / totals.chapters).toFixed(1)}`);
  console.log(`Avg cr/chapter: ${(totals.cr / totals.chapters).toFixed(1)}`);

  if (concerns.length) {
    console.log(`\n=== DEPTH/COVERAGE CONCERNS (${concerns.filter(c=>!c.startsWith('  ')).length} books flagged) ===`);
    for (const c of concerns) console.log(c);
  } else {
    console.log(`\n=== NO COVERAGE/DEPTH CONCERNS ===`);
  }

  await client.end();
}

main().catch(err => { console.error('Fatal:', err); process.exit(2); });
