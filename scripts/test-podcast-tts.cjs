/**
 * test-podcast-tts.cjs — Generate a podcast episode MP3 using Google Cloud TTS Chirp3-HD
 * and upload it to Supabase Storage.
 *
 * Usage:
 *   node scripts/test-podcast-tts.cjs                  # Episode 3 (default)
 *   node scripts/test-podcast-tts.cjs --ep=5            # Specific episode
 *   node scripts/test-podcast-tts.cjs --voice=...       # Override voice name
 *   node scripts/test-podcast-tts.cjs --list            # List available Chirp3 voices
 *   node scripts/test-podcast-tts.cjs --local-only      # Generate MP3 but don't upload
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

// Resolve Google creds path
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

// ── CLI args ──
const args = {};
process.argv.slice(2).forEach(a => {
  if (a.startsWith('--')) {
    const [k, ...vParts] = a.slice(2).split('=');
    args[k] = vParts.join('=') || true;
  }
});
const EP_NUM = args.ep || '3';
const VOICE_OVERRIDE = args.voice || null;
const LIST_ONLY = !!args.list;
const LOCAL_ONLY = !!args['local-only'];

const OUT_DIR = path.join(__dirname, '..', 'audio-test', 'podcast');

// ── List Chirp3 voices ──
async function listChirp3Voices() {
  const [result] = await ttsClient.listVoices({ languageCode: 'en-US' });
  const voices = (result.voices || []).filter(v =>
    v.name.includes('Chirp3') && v.languageCodes.some(lc => lc.startsWith('en'))
  );
  console.log(`\nAvailable Chirp3 en-US voices (${voices.length}):\n`);
  for (const v of voices) {
    const gender = v.ssmlGender === 'MALE' ? 'M' : v.ssmlGender === 'FEMALE' ? 'F' : '?';
    console.log(`  ${v.name} (${gender}, ${v.naturalSampleRateHertz}Hz)`);
  }
  return voices;
}

// ── Pick a good narration voice ──
async function pickVoice() {
  if (VOICE_OVERRIDE) return VOICE_OVERRIDE;

  const [result] = await ttsClient.listVoices({ languageCode: 'en-US' });
  const chirp3 = (result.voices || []).filter(v =>
    v.name.includes('Chirp3') && v.languageCodes.some(lc => lc.startsWith('en'))
  );

  // Prefer male Chirp3-HD for devotional narration
  const male = chirp3.find(v => v.ssmlGender === 'MALE');
  const pick = male || chirp3[0];

  if (!pick) {
    // Fall back to Journey or Neural2
    const journey = (result.voices || []).find(v =>
      v.name.includes('Journey') && v.ssmlGender === 'MALE' && v.languageCodes.some(lc => lc.startsWith('en'))
    );
    if (journey) return journey.name;

    console.error('No suitable voice found!');
    process.exit(1);
  }

  return pick.name;
}

// ── Escape text for SSML ──
function escapeSSML(text) {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

// ── Build SSML chunks that stay under the 5000-byte limit ──
function buildSSMLChunks(transcript) {
  const MAX_BYTES = 4500; // leave headroom under 5000 limit
  const chunks = [];
  let currentSegments = [];
  let currentSize = 0;

  for (let i = 0; i < transcript.length; i++) {
    const seg = transcript[i];
    const escaped = escapeSSML(seg.text);
    // Estimate SSML size for this segment: <p>text</p>\n + break tag
    const segSSML = `<p>${escaped}</p>\n<break time="400ms"/>\n`;
    const segSize = Buffer.byteLength(segSSML, 'utf8');

    // If adding this segment would exceed limit, flush current chunk
    if (currentSize + segSize > MAX_BYTES && currentSegments.length > 0) {
      chunks.push(currentSegments);
      currentSegments = [];
      currentSize = 0;
    }

    currentSegments.push({ index: i, seg, escaped });
    currentSize += segSize;
  }

  if (currentSegments.length > 0) {
    chunks.push(currentSegments);
  }

  // Build SSML string for each chunk
  return chunks.map(segs => {
    let ssml = '<speak>\n';
    for (const { index, seg, escaped } of segs) {
      ssml += `<p>${escaped}</p>\n`;
      // Natural pauses
      if (index === 0) {
        ssml += '<break time="800ms"/>\n';
      } else if (seg.text.startsWith("Let's pray")) {
        ssml += '<break time="1000ms"/>\n';
      } else if (seg.text.startsWith("In ") && seg.text.includes("chapter")) {
        ssml += '<break time="600ms"/>\n';
      } else {
        ssml += '<break time="400ms"/>\n';
      }
    }
    ssml += '</speak>';
    return ssml;
  });
}

// ── Synthesize full episode (chunked) ──
async function synthesizeEpisode(transcript, voiceName) {
  const fullText = transcript.map(seg => seg.text).join('\n\n');
  const ssmlChunks = buildSSMLChunks(transcript);

  console.log(`  Voice: ${voiceName}`);
  console.log(`  Text: ${fullText.length} chars, ${transcript.length} segments`);
  console.log(`  SSML chunks: ${ssmlChunks.length} (each under 5000 bytes)`);
  console.log(`  Generating audio...`);

  const audioBuffers = [];
  for (let i = 0; i < ssmlChunks.length; i++) {
    const ssml = ssmlChunks[i];
    console.log(`    Chunk ${i + 1}/${ssmlChunks.length} (${Buffer.byteLength(ssml, 'utf8')} bytes)...`);

    const request = {
      input: { ssml },
      voice: {
        languageCode: 'en-US',
        name: voiceName,
      },
      audioConfig: {
        audioEncoding: 'MP3',
        speakingRate: 0.95,  // Slightly slower for devotional feel
        sampleRateHertz: 24000,
      },
    };

    const [response] = await ttsClient.synthesizeSpeech(request);
    audioBuffers.push(response.audioContent);

    // Small delay between API calls
    if (i < ssmlChunks.length - 1) {
      await new Promise(r => setTimeout(r, 500));
    }
  }

  // Concatenate MP3 buffers (MP3 is a streaming format — frames are self-contained)
  return Buffer.concat(audioBuffers);
}

// ── Upload to Supabase Storage ──
async function uploadToSupabase(audioBuffer, audioFilePath) {
  console.log(`\n  Uploading to Supabase: podcasts/${audioFilePath}`);

  // Ensure the bucket exists
  const { data: buckets } = await supabase.storage.listBuckets();
  const hasBucket = buckets?.some(b => b.name === 'podcasts');
  if (!hasBucket) {
    console.log('  Creating "podcasts" bucket...');
    const { error } = await supabase.storage.createBucket('podcasts', {
      public: true,
      fileSizeLimit: 52428800, // 50MB
    });
    if (error) {
      console.error('  Bucket creation error:', error.message);
      process.exit(1);
    }
    console.log('  Bucket created!');
  }

  const { data, error } = await supabase.storage
    .from('podcasts')
    .upload(audioFilePath, audioBuffer, {
      contentType: 'audio/mpeg',
      upsert: true,
    });

  if (error) {
    console.error('  Upload error:', error.message);
    process.exit(1);
  }

  const publicUrl = `${process.env.NEXT_PUBLIC_SUPABASE_URL}/storage/v1/object/public/podcasts/${audioFilePath}`;
  console.log(`  Upload complete!`);
  console.log(`  Public URL: ${publicUrl}`);
  return publicUrl;
}

// ── Main ──
async function main() {
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

  if (LIST_ONLY) {
    await listChirp3Voices();
    return;
  }

  console.log('\n=== Podcast TTS Test — Google Cloud Chirp3-HD ===\n');

  // Load episode data
  const jsonPath = path.join(__dirname, '..', 'public', 'data', 'podcasts', 'daily-word.json');
  const series = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));
  const episode = series.episodes[EP_NUM];

  if (!episode) {
    console.error(`Episode ${EP_NUM} not found in daily-word.json`);
    process.exit(1);
  }

  console.log(`Episode ${EP_NUM}: "${episode.title}"`);
  console.log(`Duration target: ${episode.duration}s (${(episode.duration / 60).toFixed(1)}m)`);
  console.log(`Transcript segments: ${episode.transcript.length}`);

  // Pick voice
  const voiceName = await pickVoice();

  // Synthesize
  const audioBuffer = await synthesizeEpisode(episode.transcript, voiceName);
  const sizeKB = (audioBuffer.length / 1024).toFixed(0);
  const sizeMB = (audioBuffer.length / (1024 * 1024)).toFixed(2);
  console.log(`  Generated: ${sizeMB} MB (${sizeKB} KB)`);

  // Save locally (include voice short name for comparison)
  const voiceShort = voiceName.replace('en-US-Chirp3-HD-', '').toLowerCase();
  const localPath = path.join(OUT_DIR, `ep-${EP_NUM.padStart(3, '0')}-${voiceShort}.mp3`);
  fs.writeFileSync(localPath, audioBuffer);
  console.log(`  Saved locally: ${localPath}`);

  if (LOCAL_ONLY) {
    console.log('\n  --local-only mode: skipping Supabase upload');
    console.log(`\n  Play it: start "" "${localPath}"`);
    return;
  }

  // Upload to Supabase
  const audioFilePath = episode.audioFile; // e.g., "daily-word/ep-003.mp3"
  const publicUrl = await uploadToSupabase(audioBuffer, audioFilePath);

  console.log(`\n=== Done! ===`);
  console.log(`  Local file: ${localPath}`);
  console.log(`  Supabase URL: ${publicUrl}`);
  console.log(`\n  Test in app: Open the podcast section and play episode ${EP_NUM}`);
  console.log(`  The PodcastPlayer will load audio from the Supabase URL.`);
}

main().catch(err => {
  console.error('\nFatal error:', err.message);
  if (err.details) console.error('Details:', err.details);
  process.exit(1);
});
