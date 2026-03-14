/**
 * generate-all-podcast-audio.cjs — Generate MP3 for ALL episodes using Achird voice
 * and upload each to Supabase Storage.
 *
 * Usage:
 *   node scripts/generate-all-podcast-audio.cjs
 *   node scripts/generate-all-podcast-audio.cjs --local-only
 */

const fs = require('fs');
const path = require('path');

// ── Parse .env.local ──
function loadEnv() {
  const envPath = path.join(__dirname, '..', '.env.local');
  if (!fs.existsSync(envPath)) { console.error('Missing .env.local'); process.exit(1); }
  for (const line of fs.readFileSync(envPath, 'utf8').split('\n')) {
    const t = line.trim();
    if (!t || t.startsWith('#')) continue;
    const eq = t.indexOf('=');
    if (eq < 0) continue;
    const k = t.slice(0, eq).trim(), v = t.slice(eq + 1).trim();
    if (!process.env[k]) process.env[k] = v;
  }
}
loadEnv();

const credPath = process.env.GOOGLE_APPLICATION_CREDENTIALS;
if (credPath && !path.isAbsolute(credPath)) {
  process.env.GOOGLE_APPLICATION_CREDENTIALS = path.join(__dirname, '..', credPath);
}
if (!process.env.GOOGLE_APPLICATION_CREDENTIALS || !fs.existsSync(process.env.GOOGLE_APPLICATION_CREDENTIALS)) {
  console.error('Missing google-tts-key.json'); process.exit(1);
}

const textToSpeech = require('@google-cloud/text-to-speech');
const { createClient } = require('@supabase/supabase-js');

const ttsClient = new textToSpeech.TextToSpeechClient();
const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const VOICE = 'en-US-Chirp3-HD-Achird';
const LOCAL_ONLY = process.argv.includes('--local-only');
const OUT_DIR = path.join(__dirname, '..', 'audio-test', 'podcast');

function escapeSSML(text) {
  return text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function buildSSMLChunks(transcript) {
  const MAX_BYTES = 4500;
  const chunks = [];
  let currentSegments = [];
  let currentSize = 0;

  for (let i = 0; i < transcript.length; i++) {
    const seg = transcript[i];
    const escaped = escapeSSML(seg.text);
    const segSSML = `<p>${escaped}</p>\n<break time="400ms"/>\n`;
    const segSize = Buffer.byteLength(segSSML, 'utf8');

    if (currentSize + segSize > MAX_BYTES && currentSegments.length > 0) {
      chunks.push(currentSegments);
      currentSegments = [];
      currentSize = 0;
    }

    currentSegments.push({ index: i, seg, escaped });
    currentSize += segSize;
  }

  if (currentSegments.length > 0) chunks.push(currentSegments);

  return chunks.map(segs => {
    let ssml = '<speak>\n';
    for (const { index, seg, escaped } of segs) {
      ssml += `<p>${escaped}</p>\n`;
      if (index === 0) ssml += '<break time="800ms"/>\n';
      else if (seg.text.startsWith("Let's pray")) ssml += '<break time="1000ms"/>\n';
      else if (seg.text.startsWith("In ") && seg.text.includes("chapter")) ssml += '<break time="600ms"/>\n';
      else ssml += '<break time="400ms"/>\n';
    }
    ssml += '</speak>';
    return ssml;
  });
}

async function synthesizeEpisode(transcript) {
  const ssmlChunks = buildSSMLChunks(transcript);
  const audioBuffers = [];

  for (let i = 0; i < ssmlChunks.length; i++) {
    const ssml = ssmlChunks[i];
    const [response] = await ttsClient.synthesizeSpeech({
      input: { ssml },
      voice: { languageCode: 'en-US', name: VOICE },
      audioConfig: { audioEncoding: 'MP3', speakingRate: 0.95, sampleRateHertz: 24000 },
    });
    audioBuffers.push(response.audioContent);
    if (i < ssmlChunks.length - 1) await new Promise(r => setTimeout(r, 300));
  }

  return Buffer.concat(audioBuffers);
}

async function uploadToSupabase(audioBuffer, audioFilePath) {
  const { error } = await supabase.storage
    .from('podcasts')
    .upload(audioFilePath, audioBuffer, { contentType: 'audio/mpeg', upsert: true });

  if (error) {
    console.error(`    Upload error: ${error.message}`);
    return false;
  }
  return true;
}

async function main() {
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

  const jsonPath = path.join(__dirname, '..', 'public', 'data', 'podcasts', 'daily-word.json');
  const series = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));
  const epNums = Object.keys(series.episodes).map(Number).sort((a, b) => a - b);

  console.log(`\n=== Generating ALL ${epNums.length} episodes with ${VOICE} ===\n`);

  let success = 0;
  for (const num of epNums) {
    const ep = series.episodes[String(num)];
    const padded = String(num).padStart(3, '0');
    console.log(`[${num}/${epNums.length}] "${ep.title}" (${ep.transcript.length} segments)`);

    try {
      const audioBuffer = await synthesizeEpisode(ep.transcript);
      const sizeMB = (audioBuffer.length / (1024 * 1024)).toFixed(2);
      console.log(`  Generated: ${sizeMB} MB`);

      // Save locally
      const localPath = path.join(OUT_DIR, `ep-${padded}-achird.mp3`);
      fs.writeFileSync(localPath, audioBuffer);

      if (!LOCAL_ONLY) {
        const ok = await uploadToSupabase(audioBuffer, ep.audioFile);
        if (ok) {
          console.log(`  Uploaded: ${ep.audioFile}`);
          success++;
        }
      } else {
        success++;
      }
    } catch (err) {
      console.error(`  ERROR: ${err.message}`);
    }

    // Rate limit between episodes
    await new Promise(r => setTimeout(r, 500));
  }

  console.log(`\n=== Done! ${success}/${epNums.length} episodes generated ===`);
}

main().catch(err => {
  console.error('\nFatal error:', err.message);
  process.exit(1);
});
