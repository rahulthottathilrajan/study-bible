/**
 * Audition all 30 Gemini 2.5 Flash TTS voices with KJV Bible text.
 *
 * Usage:
 *   node scripts/audition-gemini-voices.cjs
 *   node scripts/audition-gemini-voices.cjs --voice=Achird          # single voice
 *   node scripts/audition-gemini-voices.cjs --text="Custom text"    # custom text
 *
 * Output: audition-samples/{voice-name}.wav  (+ .mp3 if ffmpeg is installed)
 *
 * Requires: GEMINI_API_KEY in .env.local
 */

const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

/* ── load env ── */
function loadEnv() {
  const envPath = path.join(__dirname, "..", ".env.local");
  if (!fs.existsSync(envPath)) { console.error("Missing .env.local"); process.exit(1); }
  const lines = fs.readFileSync(envPath, "utf8").split("\n");
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith("#")) continue;
    const eqIdx = trimmed.indexOf("=");
    if (eqIdx < 0) continue;
    const key = trimmed.slice(0, eqIdx).trim();
    const val = trimmed.slice(eqIdx + 1).trim();
    if (!process.env[key]) process.env[key] = val;
  }
}
loadEnv();
const API_KEY = process.env.GEMINI_API_KEY;
if (!API_KEY) { console.error("Missing GEMINI_API_KEY in .env.local"); process.exit(1); }

/* ── constants ── */
const MODEL = "gemini-2.5-flash-preview-tts";
const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL}:generateContent?key=${API_KEY}`;

const ALL_VOICES = [
  "Zephyr", "Puck", "Charon", "Kore", "Fenrir", "Leda", "Orus", "Aoede",
  "Callirrhoe", "Autonoe", "Enceladus", "Iapetus", "Umbriel", "Algieba",
  "Despina", "Erinome", "Algenib", "Rasalgethi", "Laomedeia", "Achernar",
  "Alnilam", "Schedar", "Gacrux", "Pulcherrima", "Achird", "Zubenelgenubi",
  "Vindemiatrix", "Sadachbia", "Sadaltager", "Sulafat",
];

const KJV_SAMPLE = `In the beginning God created the heaven and the earth. `
  + `And the earth was without form, and void; and darkness was upon the face of the deep. `
  + `And the Spirit of God moved upon the face of the waters. `
  + `And God said, Let there be light: and there was light. `
  + `And God saw the light, that it was good: and God divided the light from the darkness. `
  + `And God called the light Day, and the darkness he called Night. `
  + `And the evening and the morning were the first day.`;

const DELAY_MS = 2000; // 2s between calls (preview rate limits)
const OUT_DIR = path.join(__dirname, "..", "audition-samples");

/* ── CLI args ── */
const args = Object.fromEntries(
  process.argv.slice(2).filter(a => a.startsWith("--")).map(a => {
    const [k, ...v] = a.slice(2).split("=");
    return [k, v.join("=") || true];
  })
);
const singleVoice = args.voice || null;
const customText = args.text || null;
const sampleText = customText || KJV_SAMPLE;

/* ── check ffmpeg ── */
let hasFfmpeg = false;
try { execSync("ffmpeg -version", { stdio: "ignore" }); hasFfmpeg = true; } catch {}

/* ── WAV header helper (PCM 16-bit mono 24kHz) ── */
function writeWavHeader(dataLength) {
  const sampleRate = 24000;
  const numChannels = 1;
  const bitsPerSample = 16;
  const byteRate = sampleRate * numChannels * (bitsPerSample / 8);
  const blockAlign = numChannels * (bitsPerSample / 8);
  const header = Buffer.alloc(44);

  header.write("RIFF", 0);
  header.writeUInt32LE(36 + dataLength, 4);
  header.write("WAVE", 8);
  header.write("fmt ", 12);
  header.writeUInt32LE(16, 16);           // PCM chunk size
  header.writeUInt16LE(1, 20);            // PCM format
  header.writeUInt16LE(numChannels, 22);
  header.writeUInt32LE(sampleRate, 24);
  header.writeUInt32LE(byteRate, 28);
  header.writeUInt16LE(blockAlign, 32);
  header.writeUInt16LE(bitsPerSample, 34);
  header.write("data", 36);
  header.writeUInt32LE(dataLength, 40);

  return header;
}

/* ── generate one voice sample ── */
async function generateVoice(voiceName, text) {
  const body = {
    contents: [{ parts: [{ text }] }],
    generationConfig: {
      response_modalities: ["AUDIO"],
      speech_config: {
        voice_config: {
          prebuilt_voice_config: { voice_name: voiceName },
        },
      },
    },
  };

  const res = await fetch(API_URL, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body),
  });

  if (!res.ok) {
    const err = await res.text();
    throw new Error(`API ${res.status}: ${err.slice(0, 200)}`);
  }

  const json = await res.json();
  const part = json.candidates?.[0]?.content?.parts?.[0];
  if (!part?.inlineData?.data) {
    throw new Error("No audio data in response");
  }

  return Buffer.from(part.inlineData.data, "base64");
}

/* ── main ── */
async function main() {
  const voices = singleVoice
    ? ALL_VOICES.filter(v => v.toLowerCase() === singleVoice.toLowerCase())
    : ALL_VOICES;

  if (voices.length === 0) {
    console.error(`Voice "${singleVoice}" not found. Available: ${ALL_VOICES.join(", ")}`);
    process.exit(1);
  }

  fs.mkdirSync(OUT_DIR, { recursive: true });

  console.log(`\n🎙  Gemini 2.5 Flash TTS — Voice Audition`);
  console.log(`   Model: ${MODEL}`);
  console.log(`   Voices: ${voices.length}`);
  console.log(`   Text: "${sampleText.slice(0, 60)}..."`);
  console.log(`   Output: ${OUT_DIR}/`);
  if (hasFfmpeg) console.log(`   ffmpeg: found — will also generate .mp3`);
  else console.log(`   ffmpeg: not found — WAV only (install ffmpeg for MP3)`);
  console.log();

  let success = 0;
  let failed = 0;

  for (let i = 0; i < voices.length; i++) {
    const voice = voices[i];
    const label = `[${i + 1}/${voices.length}]`;
    process.stdout.write(`${label} ${voice}... `);

    const start = Date.now();
    try {
      const pcmData = await generateVoice(voice, sampleText);
      const wavHeader = writeWavHeader(pcmData.length);
      const wavPath = path.join(OUT_DIR, `${voice.toLowerCase()}.wav`);
      fs.writeFileSync(wavPath, Buffer.concat([wavHeader, pcmData]));

      const duration = (pcmData.length / (24000 * 2)).toFixed(1); // 16-bit mono
      const elapsed = ((Date.now() - start) / 1000).toFixed(1);
      console.log(`done (${duration}s audio, ${elapsed}s) → ${voice.toLowerCase()}.wav`);

      // Convert to MP3 if ffmpeg available
      if (hasFfmpeg) {
        const mp3Path = path.join(OUT_DIR, `${voice.toLowerCase()}.mp3`);
        try {
          execSync(`ffmpeg -y -i "${wavPath}" -codec:a libmp3lame -q:a 2 "${mp3Path}" 2>/dev/null`);
        } catch { /* ignore ffmpeg errors */ }
      }

      success++;
    } catch (err) {
      console.log(`FAILED — ${err.message}`);
      failed++;
    }

    // Rate limit delay (skip after last)
    if (i < voices.length - 1) {
      await new Promise(r => setTimeout(r, DELAY_MS));
    }
  }

  console.log(`\n✓ Complete: ${success} succeeded, ${failed} failed`);
  console.log(`  Listen to samples in: ${OUT_DIR}/`);
}

main().catch(err => { console.error("Fatal:", err); process.exit(1); });
