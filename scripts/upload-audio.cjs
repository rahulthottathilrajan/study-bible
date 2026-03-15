/**
 * upload-audio.cjs — Upload generated audio to Supabase Storage
 *
 * Usage:
 *   node scripts/upload-audio.cjs --translation=mal_irv
 *   node scripts/upload-audio.cjs --translation=mal_irv --book=GEN
 *   node scripts/upload-audio.cjs --translation=mal_irv --concurrency=20
 *   node scripts/upload-audio.cjs --translation=mal_irv --dry-run
 *
 * Requires in .env.local:
 *   NEXT_PUBLIC_SUPABASE_URL
 *   SUPABASE_SERVICE_ROLE_KEY
 *
 * Uploads from audio-output/{translation}/{BOOK_CODE}/
 * to Supabase Storage bucket 'bible-audio/{translation}/{BOOK_CODE}/{chapter}.mp3'
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
const MAX_RETRIES = 3;

// ── CLI args ──
const args = {};
process.argv.slice(2).forEach(a => {
  if (a.startsWith('--')) {
    const [key, ...valParts] = a.slice(2).split('=');
    args[key] = valParts.join('=') || true;
  }
});

const TRANSLATION = args.translation;
const CONCURRENCY = parseInt(args.concurrency || '10');
const DRY_RUN = !!args['dry-run'];
const BOOK_FILTER = args.book || null;

if (!TRANSLATION) {
  console.error('Usage: node scripts/upload-audio.cjs --translation=mal_irv');
  console.error('');
  console.error('Options:');
  console.error('  --translation=ID   Translation folder in audio-output/ (required)');
  console.error('  --book=CODE        Upload only one book (e.g., GEN, PSA)');
  console.error('  --concurrency=N    Parallel uploads (default: 10)');
  console.error('  --dry-run          List files without uploading');
  process.exit(1);
}

const translationDir = path.join(AUDIO_DIR, TRANSLATION);
if (!fs.existsSync(translationDir)) {
  console.error(`No audio files found at ${translationDir}`);
  console.error('Run scripts/generate-audio-google.cjs first');
  process.exit(1);
}

// ── Upload a single file (with retry) ──
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
      await new Promise(r => setTimeout(r, 2000 * (retryCount + 1)));
      return uploadFile(localPath, storagePath, contentType, retryCount + 1);
    }
    throw new Error(`${res.status} — ${errBody}`);
  }

  return true;
}

// ── Process batch of uploads with concurrency ──
async function uploadBatch(files, concurrency) {
  let uploaded = 0, errors = 0;
  let idx = 0;
  const startTime = Date.now();

  async function worker() {
    while (idx < files.length) {
      const i = idx++;
      const file = files[i];

      try {
        if (DRY_RUN) {
          uploaded++;
          continue;
        }

        await uploadFile(file.localPath, file.storagePath, file.contentType);
        uploaded++;
      } catch (err) {
        errors++;
        console.error(`  ERROR: ${file.storagePath} — ${err.message}`);
      }

      // Progress every 50 files
      if ((i + 1) % 50 === 0 || i + 1 === files.length) {
        const pct = ((i + 1) / files.length * 100).toFixed(0);
        const elapsed = ((Date.now() - startTime) / 1000).toFixed(0);
        console.log(`  [${pct}%] ${uploaded} uploaded, ${errors} errors — ${elapsed}s`);
      }
    }
  }

  const workers = Array(Math.min(concurrency, files.length)).fill(null).map(() => worker());
  await Promise.all(workers);

  return { uploaded, errors };
}

// ── Create bucket if it doesn't exist ──
async function ensureBucket() {
  const listRes = await fetch(`${SUPABASE_URL}/storage/v1/bucket/${BUCKET}`, {
    headers: { 'Authorization': `Bearer ${SUPABASE_KEY}`, 'apikey': SUPABASE_KEY },
  });

  if (listRes.ok) {
    console.log(`Bucket "${BUCKET}" exists`);
    return;
  }

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
      file_size_limit: 10485760,
      allowed_mime_types: ['audio/mpeg', 'application/json'],
    }),
  });

  if (!createRes.ok) {
    const errBody = await createRes.text();
    if (errBody.includes('already exists')) {
      console.log(`Bucket "${BUCKET}" already exists`);
    } else {
      console.error(`Failed to create bucket: ${createRes.status} — ${errBody}`);
      process.exit(1);
    }
  } else {
    console.log(`Bucket "${BUCKET}" created successfully`);
  }
}

// ── Build file list ──
function buildFileList() {
  const files = [];
  const bookDirs = fs.readdirSync(translationDir).filter(d =>
    fs.statSync(path.join(translationDir, d)).isDirectory()
  );

  for (const bookCode of bookDirs.sort()) {
    if (BOOK_FILTER && bookCode !== BOOK_FILTER) continue;

    const bookDir = path.join(translationDir, bookCode);
    const entries = fs.readdirSync(bookDir).filter(f => f.endsWith('.mp3') || f.endsWith('.json'));

    for (const f of entries) {
      files.push({
        localPath: path.join(bookDir, f),
        storagePath: `${TRANSLATION}/${bookCode}/${f}`,
        contentType: f.endsWith('.mp3') ? 'audio/mpeg' : 'application/json',
      });
    }
  }

  return files;
}

// ── Main ──
async function main() {
  console.log('\n═══ Upload Bible Audio to Supabase Storage ═══\n');
  console.log(`Translation: ${TRANSLATION}`);
  console.log(`Source:      ${translationDir}`);
  console.log(`Bucket:      ${BUCKET}`);
  console.log(`Concurrency: ${CONCURRENCY}`);
  if (DRY_RUN) console.log('Mode:        DRY RUN');
  if (BOOK_FILTER) console.log(`Book filter: ${BOOK_FILTER}`);
  console.log('');

  if (!DRY_RUN) await ensureBucket();

  const files = buildFileList();
  const mp3Count = files.filter(f => f.localPath.endsWith('.mp3')).length;
  const tsCount = files.filter(f => f.localPath.endsWith('.json')).length;
  const totalSizeMB = files.reduce((sum, f) => sum + fs.statSync(f.localPath).size, 0) / (1024 * 1024);

  console.log(`Files: ${files.length} (${mp3Count} MP3s, ${tsCount} timestamp JSONs)`);
  console.log(`Size:  ${totalSizeMB.toFixed(1)} MB\n`);

  if (files.length === 0) {
    console.log('No files to upload.');
    return;
  }

  const startTime = Date.now();
  const { uploaded, errors } = await uploadBatch(files, CONCURRENCY);
  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1);

  console.log(`\n═══ Complete ═══`);
  console.log(`Uploaded: ${uploaded}, Errors: ${errors}`);
  console.log(`Time: ${elapsed}s`);

  if (uploaded > 0 && !DRY_RUN) {
    console.log(`\nPublic URL pattern:`);
    console.log(`  ${SUPABASE_URL}/storage/v1/object/public/${BUCKET}/${TRANSLATION}/{BOOK_CODE}/{chapter}.mp3`);
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
