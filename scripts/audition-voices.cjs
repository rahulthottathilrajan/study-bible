/**
 * audition-voices.cjs — Test ElevenLabs voices with Genesis 1:1-10
 *
 * Usage:  node scripts/audition-voices.cjs
 * Requires ELEVENLABS_API_KEY in .env.local
 *
 * 1. Lists available voices (filters for narration/audiobook)
 * 2. Generates test MP3s with top candidates
 * 3. Saves to audio-test/ for manual comparison
 *
 * KJV archaic language test: "thee", "thou", "hath", "begat", "saith"
 * Free tier: 10K chars/month — Genesis 1:1-10 is ~500 chars
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

const API_KEY = process.env.ELEVENLABS_API_KEY;
if (!API_KEY) {
  console.error('Missing ELEVENLABS_API_KEY in .env.local');
  console.error('Sign up at https://elevenlabs.io and paste your API key');
  process.exit(1);
}

const BASE_URL = 'https://api.elevenlabs.io/v1';
const OUT_DIR = path.join(__dirname, '..', 'audio-test');

// ── Extract Genesis 1:1-10 text ──
function getTestText() {
  const genesisPath = path.join(__dirname, '..', 'public', 'data', 'genesis.json');
  const data = JSON.parse(fs.readFileSync(genesisPath, 'utf-8'));
  const ch1 = data.chapters['1'];
  if (!ch1 || !ch1.verses) {
    console.error('Cannot read Genesis chapter 1');
    process.exit(1);
  }
  // Take verses 1-10 — plain text, no verse numbers (natural reading)
  const verses = ch1.verses.filter(v => v.verse_number <= 10);
  return verses.map(v => v.kjv_text).join(' ');
}

// ── Fetch Hindi Genesis 1:1-10 from CDN ──
async function getHindiTestText() {
  try {
    const res = await fetch('https://bible.helloao.org/api/HINIRV/GEN/1.json');
    if (!res.ok) throw new Error(`CDN returned ${res.status}`);
    const data = await res.json();
    // Extract verse text from CDN format
    const content = data.chapter?.content || [];
    const verses = content.filter(c => c.type === 'verse' && parseInt(c.number) <= 10);
    if (verses.length === 0) throw new Error('No verses found');
    return verses.map(v => {
      // Each verse has content array of strings/objects
      return v.content.map(part => typeof part === 'string' ? part : (part.text || '')).join('');
    }).join(' ');
  } catch (err) {
    console.error(`Could not fetch Hindi text: ${err.message}`);
    return null;
  }
}

// ── Fetch available voices ──
async function listVoices() {
  const res = await fetch(`${BASE_URL}/voices`, {
    headers: { 'xi-api-key': API_KEY },
  });
  if (!res.ok) {
    console.error(`Failed to fetch voices: ${res.status} ${res.statusText}`);
    const body = await res.text();
    console.error(body);
    process.exit(1);
  }
  const data = await res.json();
  return data.voices || [];
}

// ── Generate MP3 with a specific voice ──
async function generateAudio(voiceId, voiceName, text) {
  console.log(`  Generating with "${voiceName}" (${voiceId})...`);

  const res = await fetch(`${BASE_URL}/text-to-speech/${voiceId}`, {
    method: 'POST',
    headers: {
      'xi-api-key': API_KEY,
      'Content-Type': 'application/json',
      'Accept': 'audio/mpeg',
    },
    body: JSON.stringify({
      text,
      model_id: 'eleven_multilingual_v2',
      voice_settings: {
        stability: 0.65,
        similarity_boost: 0.75,
        style: 0.3,
        use_speaker_boost: true,
      },
    }),
  });

  if (!res.ok) {
    const errBody = await res.text();
    console.error(`  ERROR: ${res.status} — ${errBody}`);
    return false;
  }

  const buffer = Buffer.from(await res.arrayBuffer());
  const safeName = voiceName.replace(/[^a-zA-Z0-9_-]/g, '_').toLowerCase();
  const outPath = path.join(OUT_DIR, `${safeName}_${voiceId.slice(0, 8)}.mp3`);
  fs.writeFileSync(outPath, buffer);
  console.log(`  ✓ Saved: ${outPath} (${(buffer.length / 1024).toFixed(0)} KB)`);
  return true;
}

// ── Generate MP3 with timestamps (for karaoke test) ──
async function generateWithTimestamps(voiceId, voiceName, text) {
  console.log(`  Generating with timestamps for "${voiceName}"...`);

  const res = await fetch(`${BASE_URL}/text-to-speech/${voiceId}/with-timestamps`, {
    method: 'POST',
    headers: {
      'xi-api-key': API_KEY,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      text,
      model_id: 'eleven_multilingual_v2',
      voice_settings: {
        stability: 0.65,
        similarity_boost: 0.75,
        style: 0.3,
        use_speaker_boost: true,
      },
    }),
  });

  if (!res.ok) {
    const errBody = await res.text();
    console.error(`  ERROR: ${res.status} — ${errBody}`);
    return;
  }

  const data = await res.json();

  // Save audio (base64)
  if (data.audio_base64) {
    const audioBuffer = Buffer.from(data.audio_base64, 'base64');
    const safeName = voiceName.replace(/[^a-zA-Z0-9_-]/g, '_').toLowerCase();
    const mp3Path = path.join(OUT_DIR, `${safeName}_timestamps.mp3`);
    fs.writeFileSync(mp3Path, audioBuffer);
    console.log(`  ✓ Audio: ${mp3Path} (${(audioBuffer.length / 1024).toFixed(0)} KB)`);
  }

  // Save timestamp data
  if (data.alignment) {
    const safeName = voiceName.replace(/[^a-zA-Z0-9_-]/g, '_').toLowerCase();
    const tsPath = path.join(OUT_DIR, `${safeName}_timestamps.json`);
    fs.writeFileSync(tsPath, JSON.stringify(data.alignment, null, 2));
    console.log(`  ✓ Timestamps: ${tsPath}`);
    // ElevenLabs returns flat arrays: characters[], character_start_times_seconds[], character_end_times_seconds[]
    const chars = data.alignment.characters || [];
    const starts = data.alignment.character_start_times_seconds || [];
    const ends = data.alignment.character_end_times_seconds || [];
    console.log(`  Alignment: ${chars.length} characters`);
    if (chars.length > 0 && starts.length > 0) {
      console.log(`  Duration: ${ends[ends.length - 1].toFixed(1)}s`);
      console.log(`  Sample (first 10 chars):`);
      for (let i = 0; i < Math.min(10, chars.length); i++) {
        console.log(`    "${chars[i]}" → ${starts[i].toFixed(3)}s - ${ends[i].toFixed(3)}s`);
      }
    }
  }
}

// ── Main ──
async function main() {
  // Ensure output directory exists
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

  const text = getTestText();
  console.log(`\nTest text (${text.length} chars):`);
  console.log(`"${text.slice(0, 120)}..."\n`);

  // Step 1: List all voices
  console.log('═══ Fetching ElevenLabs voices... ═══\n');
  const allVoices = await listVoices();
  console.log(`Total voices available: ${allVoices.length}\n`);

  // Filter for narration / audiobook use cases
  const narrationVoices = allVoices.filter(v => {
    const labels = v.labels || {};
    const useCase = (labels.use_case || '').toLowerCase();
    const desc = (labels.description || '').toLowerCase();
    const accent = (labels.accent || '').toLowerCase();
    return (
      useCase.includes('narrat') ||
      useCase.includes('audiobook') ||
      useCase.includes('meditation') ||
      desc.includes('deep') ||
      desc.includes('calm') ||
      desc.includes('authoritative') ||
      desc.includes('warm') ||
      desc.includes('gentle')
    );
  });

  // Also include pre-made voices good for narration (known good IDs)
  const premadeGood = allVoices.filter(v =>
    v.category === 'premade' &&
    !narrationVoices.find(nv => nv.voice_id === v.voice_id)
  );

  console.log(`Narration/audiobook voices: ${narrationVoices.length}`);
  console.log(`Other premade voices: ${premadeGood.length}\n`);

  // Print all narration voices
  console.log('─── Narration Voices ───');
  narrationVoices.forEach(v => {
    const labels = v.labels || {};
    console.log(`  ${v.name} (${v.voice_id.slice(0, 8)}...) — ${labels.accent || '?'}, ${labels.description || '?'}, use: ${labels.use_case || '?'}`);
  });

  // Print first 10 premade voices
  console.log('\n─── Top Premade Voices ───');
  premadeGood.slice(0, 10).forEach(v => {
    const labels = v.labels || {};
    console.log(`  ${v.name} (${v.voice_id.slice(0, 8)}...) — ${labels.accent || '?'}, ${labels.description || '?'}, use: ${labels.use_case || '?'}`);
  });

  // Pick candidates: narration voices first, then top premade
  const candidates = [...narrationVoices.slice(0, 3), ...premadeGood.slice(0, 2)];

  if (candidates.length === 0) {
    console.log('\nNo suitable candidates found. Using first 3 voices...');
    candidates.push(...allVoices.slice(0, 3));
  }

  console.log(`\n═══ Generating ${candidates.length} test MP3s... ═══\n`);

  for (let i = 0; i < candidates.length; i++) {
    const v = candidates[i];
    console.log(`[${i + 1}/${candidates.length}] ${v.name}`);
    await generateAudio(v.voice_id, v.name, text);

    // Generate with timestamps for the first candidate (to test karaoke data)
    if (i === 0) {
      await generateWithTimestamps(v.voice_id, v.name, text);
    }

    // Rate limit: 2 second delay between generations
    if (i < candidates.length - 1) {
      await new Promise(r => setTimeout(r, 2000));
    }
    console.log('');
  }

  // Save a summary of all voices for reference
  const summary = allVoices.map(v => ({
    name: v.name,
    voice_id: v.voice_id,
    category: v.category,
    labels: v.labels,
  }));
  fs.writeFileSync(
    path.join(OUT_DIR, 'all-voices.json'),
    JSON.stringify(summary, null, 2)
  );
  console.log(`\n✓ All voices list saved to audio-test/all-voices.json`);
  console.log(`✓ Listen to MP3s in audio-test/ and pick your favourite!`);
  console.log(`\nTo test a specific voice by ID:`);
  console.log(`  node scripts/audition-voices.cjs --voice=VOICE_ID_HERE`);
}

// ── CLI: --voice=ID to test a specific voice, --hindi to test Hindi ──
const voiceArg = process.argv.find(a => a.startsWith('--voice='));
const hindiFlag = process.argv.includes('--hindi');

if (voiceArg) {
  const voiceId = voiceArg.split('=')[1];
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

  (async () => {
    // Test with English
    const text = getTestText();
    console.log(`\nTesting voice: ${voiceId}`);
    console.log(`English text (${text.length} chars)\n`);
    await generateAudio(voiceId, `custom_${voiceId.slice(0, 8)}`, text);
    await generateWithTimestamps(voiceId, `custom_${voiceId.slice(0, 8)}`, text);

    // Test with Hindi if requested
    if (hindiFlag) {
      console.log('\n─── Hindi Test ───');
      const hindiText = await getHindiTestText();
      if (hindiText) {
        console.log(`Hindi text (${hindiText.length} chars): "${hindiText.slice(0, 80)}..."\n`);
        await generateAudio(voiceId, `hindi_${voiceId.slice(0, 8)}`, hindiText);
      }
    }
    console.log('\nDone!');
  })();
} else if (hindiFlag) {
  // Just test Hindi with George (first narration voice)
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });
  (async () => {
    console.log('\n═══ Hindi Voice Test ═══\n');
    const hindiText = await getHindiTestText();
    if (!hindiText) { console.error('Could not fetch Hindi text'); process.exit(1); }
    console.log(`Hindi text (${hindiText.length} chars): "${hindiText.slice(0, 80)}..."\n`);

    const voices = await listVoices();
    // Use George or first narration voice
    const george = voices.find(v => v.name.includes('George'));
    const voice = george || voices[0];
    console.log(`Using voice: ${voice.name} (${voice.voice_id})\n`);
    await generateAudio(voice.voice_id, `hindi_${voice.name.replace(/[^a-zA-Z0-9]/g, '_').toLowerCase()}`, hindiText);
    console.log('\nDone! Listen to the Hindi MP3 in audio-test/');
  })();
} else {
  main().catch(err => {
    console.error('Fatal error:', err);
    process.exit(1);
  });
}
