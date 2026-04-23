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
loadEnvLocal();
(async () => {
  const c = new Client({ connectionString: process.env.DATABASE_URL, ssl: { rejectUnauthorized: false }});
  await c.connect();
  const samples = [
    ['Mark', 1], ['Romans', 1], ['1 Corinthians', 13], ['Hebrews', 11],
    ['1 John', 1], ['Galatians', 3], ['John', 3], ['Acts', 2]
  ];
  for (const [book, ch] of samples) {
    const r = await c.query(`
      SELECT v.verse_number, ws.original_word, ws.transliteration, ws.strongs_number,
             LENGTH(ws.meaning) AS mlen, LEFT(ws.meaning, 100) AS preview
      FROM word_studies ws
      JOIN verses v ON ws.verse_id = v.id
      JOIN chapters cc ON v.chapter_id = cc.id
      JOIN books b ON cc.book_id = b.id
      WHERE b.name = $1 AND cc.chapter_number = $2
      ORDER BY v.verse_number, ws.word_order LIMIT 4`,
      [book, ch]);
    console.log(`\n--- ${book} ${ch} ---`);
    for (const row of r.rows) {
      console.log(`  v${row.verse_number} | ${row.original_word} (${row.transliteration}) ${row.strongs_number || '-'} | len=${row.mlen}`);
      console.log(`    "${row.preview}..."`);
    }
  }
  await c.end();
})();
