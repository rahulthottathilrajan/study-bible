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
  const chapters = process.argv.slice(2).map(Number);
  for (const ch of chapters) {
    const ws = await c.query(`
      SELECT v.verse_number, ws.original_word, ws.transliteration
      FROM word_studies ws
      JOIN verses v ON ws.verse_id = v.id
      JOIN chapters cc ON v.chapter_id = cc.id
      JOIN books b ON cc.book_id = b.id
      WHERE b.name = 'Mark' AND cc.chapter_number = $1
      ORDER BY v.verse_number, ws.word_order`, [ch]);
    console.log(`\n--- Mark ${ch} existing word_studies (${ws.rows.length}) ---`);
    for (const r of ws.rows) {
      console.log(`  v${r.verse_number}: ${r.original_word} (${r.transliteration})`);
    }
    const cr = await c.query(`
      SELECT COUNT(*) AS n FROM cross_references cr
      JOIN verses v ON cr.verse_id = v.id
      JOIN chapters cc ON v.chapter_id = cc.id
      JOIN books b ON cc.book_id = b.id
      WHERE b.name = 'Mark' AND cc.chapter_number = $1`, [ch]);
    console.log(`  -- cross_references: ${cr.rows[0].n}`);
  }
  await c.end();
})();
