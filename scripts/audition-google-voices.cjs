/**
 * audition-google-voices.cjs — Test Google Cloud TTS voices with Genesis 1:1-10
 *
 * Usage:
 *   node scripts/audition-google-voices.cjs
 *   node scripts/audition-google-voices.cjs --lang=ml-IN
 *   node scripts/audition-google-voices.cjs --list
 *
 * Requires:
 *   - google-tts-key.json in project root
 *   - GOOGLE_APPLICATION_CREDENTIALS in .env.local
 *   - npm install @google-cloud/text-to-speech
 *
 * Tests: English (KJV), Hindi, Malayalam, Tamil, Telugu, Kannada
 * Voice types: Standard ($4/1M), WaveNet ($16/1M), Neural2 ($16/1M), Chirp 3 HD ($30/1M)
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

// Resolve GOOGLE_APPLICATION_CREDENTIALS to absolute path
const credPath = process.env.GOOGLE_APPLICATION_CREDENTIALS;
if (credPath && !path.isAbsolute(credPath)) {
  process.env.GOOGLE_APPLICATION_CREDENTIALS = path.join(__dirname, '..', credPath);
}

if (!process.env.GOOGLE_APPLICATION_CREDENTIALS || !fs.existsSync(process.env.GOOGLE_APPLICATION_CREDENTIALS)) {
  console.error('Missing google-tts-key.json — see setup instructions');
  process.exit(1);
}

const textToSpeech = require('@google-cloud/text-to-speech');
const client = new textToSpeech.TextToSpeechClient();

const OUT_DIR = path.join(__dirname, '..', 'audio-test', 'google');

// ── Languages to test ──
const LANGUAGES = {
  'en-US': { label: 'English (KJV)', cdnId: null },       // KJV from local JSON
  'hi-IN': { label: 'Hindi', cdnId: 'HINIRV' },
  'ml-IN': { label: 'Malayalam', cdnId: 'mal_irv' },
  'ta-IN': { label: 'Tamil', cdnId: 'tam_irv' },
  'te-IN': { label: 'Telugu', cdnId: 'tel_irv' },
  'kn-IN': { label: 'Kannada', cdnId: 'kan_irv' },
  'ne-NP': { label: 'Nepali', cdnId: null },
  'zh-CN': { label: 'Chinese', cdnId: 'cmn_cu1' },
  'ar-XA': { label: 'Arabic', cdnId: 'ARBNAV' },
  'fr-FR': { label: 'French', cdnId: 'fra_lsg' },
  'es-ES': { label: 'Spanish', cdnId: 'spa_r09' },
};

// ── Get English text from local JSON ──
function getEnglishText() {
  const genesisPath = path.join(__dirname, '..', 'public', 'data', 'genesis.json');
  const data = JSON.parse(fs.readFileSync(genesisPath, 'utf-8'));
  const ch1 = data.chapters['1'];
  if (!ch1 || !ch1.verses) {
    console.error('Cannot read Genesis chapter 1');
    process.exit(1);
  }
  const verses = ch1.verses.filter(v => v.verse_number <= 10);
  return verses.map(v => v.kjv_text).join(' ');
}

// ── Fetch translation text from CDN ──
async function getCdnText(cdnId) {
  try {
    const res = await fetch(`https://bible.helloao.org/api/${cdnId}/GEN/1.json`);
    if (!res.ok) throw new Error(`CDN returned ${res.status}`);
    const data = await res.json();
    const content = data.chapter?.content || [];
    const verses = content.filter(c => c.type === 'verse' && parseInt(c.number) <= 10);
    if (verses.length === 0) throw new Error('No verses found');
    return verses.map(v => {
      return v.content.map(part => typeof part === 'string' ? part : (part.text || '')).join('');
    }).join(' ');
  } catch (err) {
    console.error(`  Could not fetch ${cdnId} text: ${err.message}`);
    return null;
  }
}

// ── List available voices for a language ──
async function listVoicesForLanguage(langCode) {
  const [result] = await client.listVoices({ languageCode: langCode });
  return (result.voices || []).filter(v =>
    v.languageCodes.some(lc => lc.startsWith(langCode.split('-')[0]))
  );
}

// ── Generate audio with a specific voice ──
async function generateAudio(text, langCode, voiceName, voiceType) {
  const request = {
    input: { text },
    voice: {
      languageCode: langCode,
      name: voiceName,
    },
    audioConfig: {
      audioEncoding: 'MP3',
      speakingRate: 1.0,
      pitch: 0,
    },
  };

  const [response] = await client.synthesizeSpeech(request);

  const safeName = `${langCode}_${voiceName}_${voiceType}`.replace(/[^a-zA-Z0-9_-]/g, '_').toLowerCase();
  const outPath = path.join(OUT_DIR, `${safeName}.mp3`);
  fs.writeFileSync(outPath, response.audioContent);

  const sizeKB = (response.audioContent.length / 1024).toFixed(0);
  console.log(`    Saved: ${safeName}.mp3 (${sizeKB} KB)`);
  return outPath;
}

// ── Pick best voices per type for a language ──
function pickBestVoices(voices) {
  const byType = {};

  for (const v of voices) {
    // Determine voice type from name
    let type = 'Standard';
    if (v.name.includes('Neural2')) type = 'Neural2';
    else if (v.name.includes('Wavenet') || v.name.includes('WaveNet')) type = 'WaveNet';
    else if (v.name.includes('Studio')) type = 'Studio';
    else if (v.name.includes('Chirp3')) type = 'Chirp3-HD';
    else if (v.name.includes('Chirp')) type = 'Chirp';
    else if (v.name.includes('Journey')) type = 'Journey';
    else if (v.name.includes('News')) type = 'News';
    else if (v.name.includes('Polyglot')) type = 'Polyglot';
    else if (v.name.includes('Casual')) type = 'Casual';

    if (!byType[type]) byType[type] = [];
    byType[type].push(v);
  }

  // Pick one voice per type (prefer MALE for narration, or first available)
  const picks = [];
  for (const [type, typeVoices] of Object.entries(byType)) {
    const male = typeVoices.find(v => v.ssmlGender === 'MALE');
    picks.push({ voice: male || typeVoices[0], type });
  }

  return picks;
}

// ── CLI args ──
const args = {};
process.argv.slice(2).forEach(a => {
  if (a.startsWith('--')) {
    const [key, ...valParts] = a.slice(2).split('=');
    args[key] = valParts.join('=') || true;
  }
});

const LIST_ONLY = !!args.list;
const LANG_FILTER = args.lang || null;

// ── Main ──
async function main() {
  if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR, { recursive: true });

  console.log('\n=== Google Cloud TTS Voice Audition ===\n');

  // Determine which languages to test
  const langsToTest = LANG_FILTER
    ? { [LANG_FILTER]: LANGUAGES[LANG_FILTER] || { label: LANG_FILTER, cdnId: null } }
    : {
        'en-US': LANGUAGES['en-US'],
        'hi-IN': LANGUAGES['hi-IN'],
        'ml-IN': LANGUAGES['ml-IN'],
        'ta-IN': LANGUAGES['ta-IN'],
        'te-IN': LANGUAGES['te-IN'],
        'kn-IN': LANGUAGES['kn-IN'],
      };

  for (const [langCode, langInfo] of Object.entries(langsToTest)) {
    console.log(`\n--- ${langInfo.label} (${langCode}) ---\n`);

    // List voices
    const voices = await listVoicesForLanguage(langCode);
    if (voices.length === 0) {
      console.log(`  No voices found for ${langCode}`);
      continue;
    }

    console.log(`  ${voices.length} voices available:`);
    const picks = pickBestVoices(voices);

    // Print voice summary
    for (const { voice, type } of picks) {
      const gender = voice.ssmlGender === 'MALE' ? 'M' : voice.ssmlGender === 'FEMALE' ? 'F' : '?';
      const rate = voice.naturalSampleRateHertz;
      console.log(`    [${type}] ${voice.name} (${gender}, ${rate}Hz)`);
    }

    if (LIST_ONLY) continue;

    // Get text for this language
    let text;
    if (langCode === 'en-US') {
      text = getEnglishText();
    } else if (langInfo.cdnId) {
      text = await getCdnText(langInfo.cdnId);
    }

    if (!text) {
      console.log(`  Skipping — no text available`);
      continue;
    }

    console.log(`  Text: "${text.slice(0, 80)}..." (${text.length} chars)\n`);

    // Generate one MP3 per voice type
    for (const { voice, type } of picks) {
      try {
        console.log(`  [${type}] Generating with ${voice.name}...`);
        await generateAudio(text, langCode, voice.name, type);
      } catch (err) {
        console.error(`    ERROR: ${err.message}`);
      }
    }
  }

  console.log(`\n=== Done! Listen to MP3s in audio-test/google/ ===`);
  console.log(`Play the samples to compare voices\n`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
