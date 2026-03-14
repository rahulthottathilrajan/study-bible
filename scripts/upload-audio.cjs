/**
 * upload-audio.cjs — Upload generated audio to Supabase Storage
 *
 * Usage:
 *   node scripts/upload-audio.cjs
 *   node scripts/upload-audio.cjs --book=GEN
 *   node scripts/upload-audio.cjs --dry-run
 *
 * Requires in .env.local:
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY
 *
 * Uploads from audio-output/kjv/{BOOK_CODE}/ to Supabase Storage bucket 'bible-audio'
 * Path: bible-audio/kjv/{BOOK_CODE}/{chapter}.mp3 and {chapter}-ts.json
 *
 * - 10 concurrent uploads
 * - Progress logging
 * - Skip existing files (resume support)
 */

const fs = require('fs');
const path = require('path');

// ── Parse .env.local ──
function loadEnv() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) {
    console.error('Missing .env.local');
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

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
  console.error('Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const BUCKET = 'bible-audio';
const AUDIO_DIR = path.join(__dirname, '..', 'audio-output');
const CONCURRENCY = 10;
const MAX_RETRIES = 3;

// ── CLI args ──
const args = {};
process.argv.slice(2).forEach(a => {
  if (a.startsWith('--')) {
    const [key, ...valParts] = a.slice(2).split('=');
    args[key] = valParts.join('=') || true;
  }
});

const DRY_RUN = !!args['dry-run'];
const BOOK_FILTER = args.book || null;

// ── Check if file exists in bucket ──
async function fileExists(storagePath) {
  const res = await fetch(
    `${SUPABASE_URL}/storage/v1/object/info/public/${BUCKET}/${storagePath}`,
    { headers: { 'Authorization': `Bearer ${SUPABASE_KEY}`, 'apikey': SUPABASE_KEY } }
  );
  return res.ok;
}

// ── Upload a single file ──
async function uploadFile(localPath, storagePath, contentType, retryCount = 0) {
  const fileData = fs.readFileSync(localPath);

  const res = await fetch(
    `${SUPABASE_URL}/storage/v1/object/${BUCKET}/${storagePath}`,
    {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${SUPABASE_KEY}`,
        'apikey': SUPABASE_KEY,
        'Content-Type': contentType,
        'x-upsert': 'true',
      },
      body: fileData,
    }
  );

  if (!res.ok) {
    const errBody = await res.text();
    if (retryCount < MAX_RETRIES) {
      await new Promise(r => setTimeout(r, 2000));
      return uploadFile(localPath, storagePath, contentType, retryCount + 1);
    }
    throw new Error(`Upload failed for ${storagePath}: ${res.status} — ${errBody}`);
  }

  return true;
}

// ── Process batch of uploads with concurrency ──
async function uploadBatch(files, concurrency) {
  let uploaded = 0, skipped = 0, errors = 0;
  let idx = 0;

  async function worker() {
    while (idx < files.length) {
      const i = idx++;
      const file = files[i];
      const progress = `[${i + 1}/${files.length}]`;

      try {
        if (DRY_RUN) {
          const sizeKB = (fs.statSync(file.localPath).size / 1024).toFixed(0);
          console.log(`${progress} ${file.storagePath} — ${sizeKB}KB [DRY RUN]`);
          uploaded++;
          continue;
        }

        // Check if already uploaded (skip for speed)
        const exists = await fileExists(file.storagePath);
        if (exists) {
          skipped++;
          continue;
        }

        await uploadFile(file.localPath, file.storagePath, file.contentType);
        uploaded++;
        const sizeKB = (fs.statSync(file.localPath).size / 1024).toFixed(0);
        console.log(`${progress} ${file.storagePath} — ${sizeKB}KB`);
      } catch (err) {
        errors++;
        console.error(`${progress} ERROR: ${file.storagePath} — ${err.message}`);
      }
    }
  }

  const workers = Array(Math.min(concurrency, files.length)).fill(null).map(() => worker());
  await Promise.all(workers);

  return { uploaded, skipped, errors };
}

// ── Create bucket if it doesn't exist ──
async function ensureBucket() {
  // Check if bucket exists
  const listRes = await fetch(`${SUPABASE_URL}/storage/v1/bucket/${BUCKET}`, {
    headers: { 'Authorization': `Bearer ${SUPABASE_KEY}`, 'apikey': SUPABASE_KEY },
  });

  if (listRes.ok) {
    console.log(`Bucket "${BUCKET}" exists`);
    return;
  }

  // Create bucket (public)
  console.log(`Creating bucket "${BUCKET}" (public)...`);
  const createRes = await fetch(`${SUPABASE_URL}/storage/v1/bucket`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${SUPABASE_KEY}`,
      'apikey': SUPABASE_KEY,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      id: BUCKET,
      name: BUCKET,
      public: true,
      file_size_limit: 10485760, // 10MB per file
      allowed_mime_types: ['audio/mpeg', 'application/json'],
    }),
  });

  if (!createRes.ok) {
    const errBody = await createRes.text();
    console.error(`Failed to create bucket: ${createRes.status} — ${errBody}`);
    process.exit(1);
  }
  console.log(`Bucket "${BUCKET}" created successfully`);
}

// ── Build file list from audio-output ──
function buildFileList() {
  const kjvDir = path.join(AUDIO_DIR, 'kjv');
  if (!fs.existsSync(kjvDir)) {
    console.error(`No audio files found at ${kjvDir}`);
    console.error('Run scripts/generate-audio.cjs first');
    process.exit(1);
  }

  const files = [];
  const bookDirs = fs.readdirSync(kjvDir);

  for (const bookCode of bookDirs) {
    if (BOOK_FILTER && bookCode !== BOOK_FILTER) continue;

    const bookDir = path.join(kjvDir, bookCode);
    if (!fs.statSync(bookDir).isDirectory()) continue;

    const bookFiles = fs.readdirSync(bookDir);
    for (const f of bookFiles) {
      const localPath = path.join(bookDir, f);
      const storagePath = `kjv/${bookCode}/${f}`;
      const contentType = f.endsWith('.mp3') ? 'audio/mpeg' : 'application/json';

      files.push({ localPath, storagePath, contentType });
    }
  }

  return files;
}

// ── Main ──
async function main() {
  console.log('\n═══ Upload Audio to Supabase Storage ═══\n');
  console.log(`Bucket: ${BUCKET}`);
  console.log(`Source: ${AUDIO_DIR}/kjv/`);
  if (DRY_RUN) console.log('Mode: DRY RUN');
  if (BOOK_FILTER) console.log(`Book filter: ${BOOK_FILTER}`);
  console.log('');

  // Ensure bucket exists
  if (!DRY_RUN) await ensureBucket();

  const files = buildFileList();
  const mp3Count = files.filter(f => f.localPath.endsWith('.mp3')).length;
  const tsCount = files.filter(f => f.localPath.endsWith('.json')).length;
  const totalSizeMB = files.reduce((sum, f) => sum + fs.statSync(f.localPath).size, 0) / (1024 * 1024);

  console.log(`Files to upload: ${files.length} (${mp3Count} MP3s, ${tsCount} timestamp JSONs)`);
  console.log(`Total size: ${totalSizeMB.toFixed(1)} MB`);
  console.log(`Concurrency: ${CONCURRENCY}\n`);

  const startTime = Date.now();
  const { uploaded, skipped, errors } = await uploadBatch(files, CONCURRENCY);
  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);

  console.log(`\n═══ Complete ═══`);
  console.log(`Uploaded: ${uploaded}, Skipped: ${skipped}, Errors: ${errors}`);
  console.log(`Time: ${elapsed}s`);

  if (uploaded > 0) {
    console.log(`\nPublic URL pattern:`);
    console.log(`  ${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/kjv/{BOOK_CODE}/{chapter}.mp3`);
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
