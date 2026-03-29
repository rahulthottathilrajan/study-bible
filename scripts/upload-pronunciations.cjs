/**
 * Upload pronunciation MP3s to Supabase Storage bucket "language-audio".
 *
 * Expects audio-pronunciations/greek/*.mp3 and audio-pronunciations/hebrew/*.mp3
 * Uploads to: language-audio/greek/{filename} and language-audio/hebrew/{filename}
 *
 * Usage: node scripts/upload-pronunciations.cjs
 *
 * Prerequisites: Create a PUBLIC bucket "language-audio" in Supabase Storage dashboard.
 */

const fs = require("fs");
const path = require("path");

// Load .env.local
const envPath = path.join(__dirname, "..", ".env.local");
if (fs.existsSync(envPath)) {
  fs.readFileSync(envPath, "utf8").split("\n").forEach(line => {
    const m = line.match(/^([^#=]+)=(.+)$/);
    if (m) process.env[m[1].trim()] = m[2].trim();
  });
}

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const BUCKET = "language-audio";

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error("Missing SUPABASE_URL or SUPABASE_KEY in .env.local");
  process.exit(1);
}

async function uploadFile(lang, filename, buffer) {
  const storagePath = `${lang}/${filename}`;
  const url = `${SUPABASE_URL}/storage/v1/object/${BUCKET}/${storagePath}`;

  const res = await fetch(url, {
    method: "PUT",
    headers: {
      "Authorization": `Bearer ${SUPABASE_KEY}`,
      "Content-Type": "audio/mpeg",
      "x-upsert": "true",
    },
    body: buffer,
  });

  if (!res.ok) {
    const text = await res.text();
    throw new Error(`${res.status} ${text}`);
  }
  return storagePath;
}

async function run() {
  const baseDir = path.join(__dirname, "..", "audio-pronunciations");

  for (const lang of ["greek", "hebrew"]) {
    const dir = path.join(baseDir, lang);
    if (!fs.existsSync(dir)) {
      console.log(`Skipping ${lang} — directory not found`);
      continue;
    }

    const files = fs.readdirSync(dir).filter(f => f.endsWith(".mp3"));
    console.log(`\n═══ Uploading ${files.length} ${lang} files ═══`);

    let ok = 0, fail = 0;
    for (const file of files) {
      const buffer = fs.readFileSync(path.join(dir, file));
      try {
        await uploadFile(lang, file, buffer);
        ok++;
        if (ok % 10 === 0 || ok === 1) console.log(`  ${ok}/${files.length} uploaded...`);
      } catch (e) {
        console.error(`  FAIL ${file}: ${e.message}`);
        fail++;
      }
    }
    console.log(`  ${lang}: ${ok} uploaded, ${fail} failed`);
  }

  const publicUrl = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}`;
  console.log(`\n✓ Done! Public URL pattern:`);
  console.log(`  ${publicUrl}/greek/word-g26.mp3`);
  console.log(`  ${publicUrl}/hebrew/word-h2617.mp3`);
}

run().catch(err => { console.error("Upload failed:", err); process.exit(1); });
