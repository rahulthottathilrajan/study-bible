/**
 * Export Greek and Hebrew lesson data from Supabase to static JSON.
 *
 * Produces:
 *   public/data/greek-lessons.json  — all Greek lessons, alphabet, vocabulary grouped by category
 *   public/data/hebrew-lessons.json — all Hebrew lessons, alphabet, vocabulary grouped by category
 *
 * Usage: node scripts/export-language-lessons.cjs
 */

const { Client } = require("pg");
const fs = require("fs");
const path = require("path");

// Load .env.local manually (no dotenv dependency)
const envPath = path.join(__dirname, "..", ".env.local");
if (fs.existsSync(envPath)) {
  fs.readFileSync(envPath, "utf8").split("\n").forEach(line => {
    const m = line.match(/^([^#=]+)=(.+)$/);
    if (m) process.env[m[1].trim()] = m[2].trim();
  });
}

const DATABASE_URL = process.env.DATABASE_URL;
if (!DATABASE_URL) { console.error("DATABASE_URL not set"); process.exit(1); }

async function run() {
  const client = new Client({ connectionString: DATABASE_URL, ssl: { rejectUnauthorized: false } });
  await client.connect();
  console.log("Connected to Supabase.");

  // ═══ GREEK ═══
  console.log("\n--- Exporting Greek lessons ---");

  const { rows: greekLessons } = await client.query(
    `SELECT * FROM greek_lessons ORDER BY category, lesson_number`
  );
  console.log(`  greek_lessons: ${greekLessons.length} rows`);

  const { rows: greekAlphabet } = await client.query(
    `SELECT * FROM greek_alphabet ORDER BY lesson_id`
  );
  console.log(`  greek_alphabet: ${greekAlphabet.length} rows`);

  const { rows: greekVocab } = await client.query(
    `SELECT * FROM greek_vocabulary ORDER BY lesson_id, id`
  );
  console.log(`  greek_vocabulary: ${greekVocab.length} rows`);

  // Group by category
  const greekByCategory = {};
  for (const lesson of greekLessons) {
    const cat = lesson.category || "alphabet";
    if (!greekByCategory[cat]) greekByCategory[cat] = [];
    // Attach alphabet and vocabulary data to the lesson
    const alpha = greekAlphabet.find(a => a.lesson_id === lesson.id) || null;
    const vocab = greekVocab.filter(v => v.lesson_id === lesson.id);
    greekByCategory[cat].push({
      ...lesson,
      _alphabet: alpha,
      _vocabulary: vocab,
    });
  }

  const greekOut = {
    exportedAt: new Date().toISOString(),
    totalLessons: greekLessons.length,
    categories: greekByCategory,
  };

  const greekPath = path.join(__dirname, "..", "public", "data", "greek-lessons.json");
  fs.writeFileSync(greekPath, JSON.stringify(greekOut, null, 2));
  console.log(`  Written to ${greekPath} (${(fs.statSync(greekPath).size / 1024).toFixed(1)} KB)`);

  // ═══ HEBREW ═══
  console.log("\n--- Exporting Hebrew lessons ---");

  const { rows: hebrewLessons } = await client.query(
    `SELECT * FROM hebrew_lessons ORDER BY category, lesson_number`
  );
  console.log(`  hebrew_lessons: ${hebrewLessons.length} rows`);

  const { rows: hebrewAlphabet } = await client.query(
    `SELECT * FROM hebrew_alphabet ORDER BY lesson_id`
  );
  console.log(`  hebrew_alphabet: ${hebrewAlphabet.length} rows`);

  const { rows: hebrewVocab } = await client.query(
    `SELECT * FROM hebrew_vocabulary ORDER BY lesson_id, id`
  );
  console.log(`  hebrew_vocabulary: ${hebrewVocab.length} rows`);

  const hebrewByCategory = {};
  for (const lesson of hebrewLessons) {
    const cat = lesson.category || "alphabet";
    if (!hebrewByCategory[cat]) hebrewByCategory[cat] = [];
    const alpha = hebrewAlphabet.find(a => a.lesson_id === lesson.id) || null;
    const vocab = hebrewVocab.filter(v => v.lesson_id === lesson.id);
    hebrewByCategory[cat].push({
      ...lesson,
      _alphabet: alpha,
      _vocabulary: vocab,
    });
  }

  const hebrewOut = {
    exportedAt: new Date().toISOString(),
    totalLessons: hebrewLessons.length,
    categories: hebrewByCategory,
  };

  const hebrewPath = path.join(__dirname, "..", "public", "data", "hebrew-lessons.json");
  fs.writeFileSync(hebrewPath, JSON.stringify(hebrewOut, null, 2));
  console.log(`  Written to ${hebrewPath} (${(fs.statSync(hebrewPath).size / 1024).toFixed(1)} KB)`);

  await client.end();
  console.log("\nDone! Static JSON files ready.");
  console.log("Greek categories:", Object.keys(greekByCategory).map(k => `${k} (${greekByCategory[k].length})`).join(", "));
  console.log("Hebrew categories:", Object.keys(hebrewByCategory).map(k => `${k} (${hebrewByCategory[k].length})`).join(", "));
}

run().catch(err => { console.error("Export failed:", err); process.exit(1); });
