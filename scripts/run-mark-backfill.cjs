#!/usr/bin/env node
/**
 * run-mark-backfill.cjs — One-off: extract the BACKFILL append block (word_studies +
 * cross_references) from each Mark chapter SQL file and run just that block.
 * The file as a whole can't be re-run because its chapter/verse INSERTs lack
 * ON CONFLICT and would fail with 23505, rolling back the tx before the appends land.
 */
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

async function main() {
  const chapters = process.argv.slice(2);
  if (chapters.length === 0) {
    console.error('Usage: node scripts/run-mark-backfill.cjs 1 2 3 4 5');
    process.exit(2);
  }
  loadEnvLocal();
  if (!process.env.DATABASE_URL) {
    console.error('DATABASE_URL not set.');
    process.exit(2);
  }

  const client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
    connectionTimeoutMillis: 15000,
    statement_timeout: 120000,
  });
  await client.connect();
  console.log(`Connected. Running backfill for Mark chapters: ${chapters.join(', ')}\n`);

  const failures = [];
  for (const ch of chapters) {
    const pad = ch.padStart(2, '0');
    const file = path.join(__dirname, '..', 'sql', 'nt-chapters', `mark-chapter-${pad}.sql`);
    if (!fs.existsSync(file)) {
      console.error(`  MISSING   mark-chapter-${pad}.sql`);
      failures.push(pad);
      continue;
    }
    const content = fs.readFileSync(file, 'utf8');
    const marker = `-- MARK CHAPTER ${ch} — BACKFILL`;
    const idx = content.indexOf(marker);
    if (idx === -1) {
      console.error(`  NO MARKER mark-chapter-${pad}.sql (looking for "${marker}")`);
      failures.push(pad);
      continue;
    }
    const tail = content.substring(idx);
    try {
      await client.query('BEGIN');
      const before = await client.query(
        `SELECT
           (SELECT COUNT(*) FROM word_studies ws JOIN verses v ON ws.verse_id = v.id
            JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
            WHERE b.name = 'Mark' AND c.chapter_number = $1) AS ws,
           (SELECT COUNT(*) FROM cross_references cr JOIN verses v ON cr.verse_id = v.id
            JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
            WHERE b.name = 'Mark' AND c.chapter_number = $1) AS cr`,
        [Number(ch)]
      );
      await client.query(tail);
      const after = await client.query(
        `SELECT
           (SELECT COUNT(*) FROM word_studies ws JOIN verses v ON ws.verse_id = v.id
            JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
            WHERE b.name = 'Mark' AND c.chapter_number = $1) AS ws,
           (SELECT COUNT(*) FROM cross_references cr JOIN verses v ON cr.verse_id = v.id
            JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
            WHERE b.name = 'Mark' AND c.chapter_number = $1) AS cr`,
        [Number(ch)]
      );
      await client.query('COMMIT');
      const wsBefore = Number(before.rows[0].ws);
      const wsAfter = Number(after.rows[0].ws);
      const crBefore = Number(before.rows[0].cr);
      const crAfter = Number(after.rows[0].cr);
      console.log(
        `  applied   mark-chapter-${pad}.sql  ws: ${wsBefore}→${wsAfter} (+${wsAfter - wsBefore})  cr: ${crBefore}→${crAfter} (+${crAfter - crBefore})`
      );
    } catch (err) {
      await client.query('ROLLBACK').catch(() => {});
      console.error(`  FAILED    mark-chapter-${pad}.sql: [${err.code || '?'}] ${err.message}`);
      failures.push(pad);
    }
  }

  await client.end();
  console.log(`\n=== Summary ===  Failures: ${failures.length}`);
  if (failures.length) {
    console.log('Failed chapters:', failures.join(', '));
    process.exit(1);
  }
}

main().catch(err => {
  console.error('Fatal:', err);
  process.exit(2);
});
