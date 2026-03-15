/**
 * generate-audio-google.cjs — Batch generate Google Cloud TTS audio for Bible chapters
 *
 * Usage:
 *   node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv
 *   node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv --book=genesis
 *   node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv --start=GEN:5
 *   node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv --dry-run
 *   node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv --limit=5
 *
 * Requires:
 *   - google-tts-key.json in project root
 *   - GOOGLE_APPLICATION_CREDENTIALS in .env.local
 *   - npm install @google-cloud/text-to-speech
 *
 * Outputs:
 *   audio-output/{translation}/{BOOK_CODE}/{chapter}.mp3
 *
 * Features:
 *   - Resume support: skips chapters where MP3 already exists
 *   - Rate limiting: 1-second delay between API calls
 *   - Progress logging with character counts
 *   - Free-tier tracking (1M chars/month for Chirp3-HD)
 *   - Verse-level timestamps via SSML marks
 *   - Cost estimation at $30/1M chars
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

const OUT_DIR = path.join(__dirname, '..', 'audio-output');
const LOG_FILE = path.join(__dirname, '.google-tts-log.json');
const DELAY_MS = 1000;
const MAX_RETRIES = 3;
const COST_PER_MILLION = 30; // $30 per 1M chars for Chirp3-HD

// ── BOOK_CODE_MAP ──
const BOOK_CODE_MAP = {
  "Genesis":"GEN","Exodus":"EXO","Leviticus":"LEV","Numbers":"NUM","Deuteronomy":"DEU",
  "Joshua":"JOS","Judges":"JDG","Ruth":"RUT","1 Samuel":"1SA","2 Samuel":"2SA",
  "1 Kings":"1KI","2 Kings":"2KI","1 Chronicles":"1CH","2 Chronicles":"2CH",
  "Ezra":"EZR","Nehemiah":"NEH","Esther":"EST","Job":"JOB","Psalms":"PSA",
  "Proverbs":"PRO","Ecclesiastes":"ECC","Song of Solomon":"SNG","Isaiah":"ISA",
  "Jeremiah":"JER","Lamentations":"LAM","Ezekiel":"EZK","Daniel":"DAN",
  "Hosea":"HOS","Joel":"JOL","Amos":"AMO","Obadiah":"OBA","Jonah":"JON",
  "Micah":"MIC","Nahum":"NAM","Habakkuk":"HAB","Zephaniah":"ZEP","Haggai":"HAG",
  "Zechariah":"ZEC","Malachi":"MAL","Matthew":"MAT","Mark":"MRK","Luke":"LUK",
  "John":"JHN","Acts":"ACT","Romans":"ROM","1 Corinthians":"1CO","2 Corinthians":"2CO",
  "Galatians":"GAL","Ephesians":"EPH","Philippians":"PHP","Colossians":"COL",
  "1 Thessalonians":"1TH","2 Thessalonians":"2TH","1 Timothy":"1TI","2 Timothy":"2TI",
  "Titus":"TIT","Philemon":"PHM","Hebrews":"HEB","James":"JAS","1 Peter":"1PE",
  "2 Peter":"2PE","1 John":"1JN","2 John":"2JN","3 John":"3JN","Jude":"JUD",
  "Revelation":"REV",
};

function bookToSlug(name) {
  return name.toLowerCase().replace(/\s+/g, '-');
}

// ── Parse CLI args ──
const args = {};
process.argv.slice(2).forEach(a => {
  if (a.startsWith('--')) {
    const [key, ...valParts] = a.slice(2).split('=');
    args[key] = valParts.join('=') || true;
  }
});

const LANG_CODE = args.lang;
const TRANSLATION_ID = args.translation;
const VOICE_NAME = args.voice || null; // auto-detect Chirp3-HD if not specified
const DRY_RUN = !!args['dry-run'];
const START_AT = args.start || null;
const SINGLE_BOOK = args.book || null;
const LIMIT = args.limit ? parseInt(args.limit) : null;

if (!LANG_CODE || !TRANSLATION_ID) {
  console.error('Usage: node scripts/generate-audio-google.cjs --lang=ml-IN --translation=mal_irv');
  console.error('');
  console.error('Options:');
  console.error('  --lang=LANG_CODE         Google TTS language code (e.g., ml-IN, hi-IN, ta-IN)');
  console.error('  --translation=CDN_ID     Bible CDN translation ID (e.g., mal_irv, HINIRV)');
  console.error('  --voice=VOICE_NAME       Google TTS voice (auto-detects Chirp3-HD if omitted)');
  console.error('  --book=SLUG              Generate only one book (e.g., genesis, psalms)');
  console.error('  --start=CODE:CH          Resume from chapter (e.g., GEN:5, PSA:23)');
  console.error('  --limit=N                Generate only N chapters (for testing)');
  console.error('  --dry-run                Count characters without API calls');
  process.exit(1);
}

// ── Load usage log (track free-tier usage) ──
function loadLog() {
  try {
    if (fs.existsSync(LOG_FILE)) return JSON.parse(fs.readFileSync(LOG_FILE, 'utf8'));
  } catch {}
  return { totalChars: 0, totalCost: 0, sessions: [] };
}

function saveLog(log) {
  fs.writeFileSync(LOG_FILE, JSON.stringify(log, null, 2));
}

// ── Build chapter list from verse-counts.json ──
function buildChapterList() {
  const vcPath = path.join(__dirname, '..', 'public', 'data', 'verse-counts.json');
  const verseCounts = JSON.parse(fs.readFileSync(vcPath, 'utf-8'));

  const chapters = [];
  const bookOrder = Object.keys(BOOK_CODE_MAP);

  for (const bookName of bookOrder) {
    const slug = bookToSlug(bookName);
    if (SINGLE_BOOK && slug !== SINGLE_BOOK) continue;

    const bookCode = BOOK_CODE_MAP[bookName];
    const bookChapters = verseCounts[bookName];
    if (!bookChapters) continue;

    const chapterNums = Object.keys(bookChapters).map(Number).sort((a, b) => a - b);
    for (const chNum of chapterNums) {
      chapters.push({
        book: bookName,
        bookCode,
        chapter: chNum,
        verseCount: bookChapters[chNum],
      });
    }
  }

  return chapters;
}

// ── Fetch chapter text from Bible CDN ──
async function fetchChapterText(bookCode, chapterNum) {
  const url = `https://bible.helloao.org/api/${TRANSLATION_ID}/${bookCode}/${chapterNum}.json`;

  for (let attempt = 0; attempt < MAX_RETRIES; attempt++) {
    try {
      const res = await fetch(url);
      if (!res.ok) {
        if (res.status === 404) return null; // Chapter doesn't exist in this translation
        throw new Error(`CDN returned ${res.status}`);
      }

      const data = await res.json();
      const content = data.chapter?.content || [];
      const verses = content.filter(c => c.type === 'verse');

      if (verses.length === 0) return null;

      // Extract verse texts with verse numbers
      const verseTexts = verses.map(v => {
        const text = v.content
          .map(part => typeof part === 'string' ? part : (part.text || ''))
          .join('')
          .trim();
        return { num: parseInt(v.number), text };
      }).filter(v => v.text.length > 0);

      return verseTexts;
    } catch (err) {
      if (attempt < MAX_RETRIES - 1) {
        await new Promise(r => setTimeout(r, 2000));
        continue;
      }
      throw err;
    }
  }
}

// ── Auto-detect Chirp3-HD voice for the language ──
async function detectVoice(langCode) {
  if (VOICE_NAME) return VOICE_NAME;

  console.log(`  Auto-detecting Chirp3-HD voice for ${langCode}...`);
  const [result] = await client.listVoices({ languageCode: langCode });
  const voices = (result.voices || []).filter(v =>
    v.languageCodes.some(lc => lc.startsWith(langCode.split('-')[0]))
  );

  // Prefer Chirp3-HD, then Chirp-HD, then Neural2, then WaveNet
  const chirp3hd = voices.find(v => v.name.includes('Chirp3-HD'));
  if (chirp3hd) {
    console.log(`  Found: ${chirp3hd.name}`);
    return chirp3hd.name;
  }

  const chirphd = voices.find(v => v.name.includes('Chirp-HD'));
  if (chirphd) {
    console.log(`  Fallback: ${chirphd.name}`);
    return chirphd.name;
  }

  const neural2 = voices.find(v => v.name.includes('Neural2'));
  if (neural2) {
    console.log(`  Fallback: ${neural2.name}`);
    return neural2.name;
  }

  const wavenet = voices.find(v => v.name.includes('Wavenet'));
  if (wavenet) {
    console.log(`  Fallback: ${wavenet.name}`);
    return wavenet.name;
  }

  console.error(`  No suitable voice found for ${langCode}`);
  process.exit(1);
}

// ── Break long sentences for Chirp3-HD ──
// Chirp3-HD rejects sentences longer than ~400 bytes for Indic scripts.
// Split at commas/semicolons, or at spaces if no punctuation found.
const MAX_SENTENCE_BYTES = 400;

function breakLongSentences(text) {
  const trimmed = text.trim();
  // If short enough, just ensure it ends with a period
  if (Buffer.byteLength(trimmed, 'utf8') <= MAX_SENTENCE_BYTES) {
    if (/[.!?।؟。]$/.test(trimmed)) return trimmed;
    return trimmed + '.';
  }

  // Split at commas, semicolons, colons — replace with period to create sentence breaks
  // Preserve the text but add periods at natural pause points
  let result = trimmed;

  // First try: split at semicolons and colons
  result = result.replace(/;/g, '.').replace(/:/g, '.');

  // Check if that's enough
  const sentences = result.split(/(?<=[.!?।؟。])\s*/);
  const allShort = sentences.every(s => Buffer.byteLength(s, 'utf8') <= MAX_SENTENCE_BYTES);

  if (!allShort) {
    // Still too long — split at commas too
    result = result.replace(/,/g, '.');
  }

  // Final check — if still too long, force-split at spaces every ~MAX_SENTENCE_BYTES
  const finalSentences = result.split(/(?<=[.!?।؟。])\s*/);
  const output = [];
  for (const sentence of finalSentences) {
    if (Buffer.byteLength(sentence, 'utf8') <= MAX_SENTENCE_BYTES) {
      output.push(sentence);
    } else {
      // Force split at spaces
      const words = sentence.split(/\s+/);
      let current = '';
      for (const word of words) {
        const test = current ? current + ' ' + word : word;
        if (Buffer.byteLength(test, 'utf8') > MAX_SENTENCE_BYTES && current) {
          output.push(current + '.');
          current = word;
        } else {
          current = test;
        }
      }
      if (current) output.push(current);
    }
  }

  let final = output.join(' ').trim();
  if (!/[.!?।؟。]$/.test(final)) final += '.';
  return final;
}

// ── Split verses into chunks that fit within 5000-byte API limit ──
// Malayalam/Tamil/etc. use ~3 bytes per char in UTF-8
const MAX_BYTES = 4800; // leave 200 bytes of headroom

function splitIntoChunks(verseTexts) {
  const chunks = [];
  let currentChunk = [];
  let currentBytes = 0;

  for (const v of verseTexts) {
    const verseText = breakLongSentences(v.text);
    const verseBytes = Buffer.byteLength(verseText + ' ', 'utf8');

    if (currentBytes + verseBytes > MAX_BYTES && currentChunk.length > 0) {
      chunks.push(currentChunk);
      currentChunk = [];
      currentBytes = 0;
    }

    currentChunk.push({ ...v, text: verseText });
    currentBytes += verseBytes;
  }

  if (currentChunk.length > 0) chunks.push(currentChunk);
  return chunks;
}

// ── Synthesize one chunk (with retry) ──
async function synthesizeChunk(verses, voiceName, retryCount = 0) {
  // Use plain text — Chirp3-HD handles it better than SSML for long content
  const text = verses.map(v => v.text).join(' ');

  try {
    const request = {
      input: { text },
      voice: { languageCode: LANG_CODE, name: voiceName },
      audioConfig: { audioEncoding: 'MP3', speakingRate: 1.0, pitch: 0 },
    };

    const [response] = await client.synthesizeSpeech(request);
    return response;
  } catch (err) {
    if (retryCount < MAX_RETRIES) {
      const wait = err.code === 8 ? 30000 : 5000;
      console.log(`    Chunk retry ${retryCount + 1}/${MAX_RETRIES} (${wait / 1000}s)...`);
      await new Promise(r => setTimeout(r, wait));
      return synthesizeChunk(verses, voiceName, retryCount + 1);
    }
    throw err;
  }
}

// ── Generate audio for one chapter (handles chunking) ──
async function generateChapter(chapter, voiceName, verseTexts) {
  const outDir = path.join(OUT_DIR, TRANSLATION_ID, chapter.bookCode);
  const mp3Path = path.join(outDir, `${chapter.chapter}.mp3`);
  const tsPath = path.join(outDir, `${chapter.chapter}-ts.json`);

  // Resume: skip if already done
  if (fs.existsSync(mp3Path)) {
    return { skipped: true };
  }

  const plainText = verseTexts.map(v => v.text).join(' ');

  if (DRY_RUN) {
    return { dryRun: true, chars: plainText.length };
  }

  if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

  try {
    const chunks = splitIntoChunks(verseTexts);
    const audioBuffers = [];
    const chunkMeta = [];

    for (let ci = 0; ci < chunks.length; ci++) {
      if (chunks.length > 1 && ci > 0) {
        await new Promise(r => setTimeout(r, 500)); // brief pause between chunks
      }

      const response = await synthesizeChunk(chunks[ci], voiceName);
      audioBuffers.push(response.audioContent);

      // Track verse char counts within this chunk for proportional timestamp estimation
      const chunkChars = chunks[ci].reduce((sum, v) => sum + v.text.length, 0);
      chunkMeta.push({
        verses: chunks[ci],
        audioSize: response.audioContent.length,
        totalChars: chunkChars,
      });
    }

    // Concatenate MP3 buffers
    const fullAudio = Buffer.concat(audioBuffers);
    fs.writeFileSync(mp3Path, fullAudio);

    // Estimate total duration from MP3 size
    // Google TTS MP3 at 24kHz is typically ~32kbps
    const totalDuration = (fullAudio.length * 8) / (32 * 1000);

    // Build verse-level timestamps proportionally (char count → time)
    const totalChars = chunkMeta.reduce((sum, cm) => sum + cm.totalChars, 0);
    const timestamps = {
      book: chapter.book,
      chapter: chapter.chapter,
      translation: TRANSLATION_ID,
      voice: voiceName,
      duration: parseFloat(totalDuration.toFixed(3)),
      verses: [],
      words: [],
    };

    let timeCursor = 0;
    for (const cm of chunkMeta) {
      const chunkDuration = (cm.audioSize / fullAudio.length) * totalDuration;
      for (const v of cm.verses) {
        const verseFraction = v.text.length / cm.totalChars;
        const verseDuration = chunkDuration * verseFraction;
        timestamps.verses.push({
          num: v.num,
          start: parseFloat(timeCursor.toFixed(3)),
          end: parseFloat((timeCursor + verseDuration).toFixed(3)),
        });
        timeCursor += verseDuration;
      }
    }

    fs.writeFileSync(tsPath, JSON.stringify(timestamps));

    return {
      success: true,
      chars: plainText.length,
      mp3Size: fullAudio.length,
      duration: totalDuration,
      verses: timestamps.verses.length,
      chunks: chunks.length,
    };
  } catch (err) {
    return { error: err.message };
  }
}

// ── Escape XML special characters ──
function escapeXml(text) {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

// ── Main ──
async function main() {
  console.log('\n═══ Google Cloud TTS Bible Audio Generator ═══\n');
  console.log(`Language:    ${LANG_CODE}`);
  console.log(`Translation: ${TRANSLATION_ID}`);
  console.log(`Output:      ${OUT_DIR}/${TRANSLATION_ID}/`);
  console.log(`Voice type:  Chirp3-HD ($30/1M chars)`);
  if (DRY_RUN) console.log('Mode:        DRY RUN (no API calls)');
  if (SINGLE_BOOK) console.log(`Book filter: ${SINGLE_BOOK}`);
  if (START_AT) console.log(`Starting at: ${START_AT}`);
  if (LIMIT) console.log(`Limit:       ${LIMIT} chapters`);
  console.log('');

  // Auto-detect voice
  const voiceName = await detectVoice(LANG_CODE);
  console.log(`Voice:       ${voiceName}\n`);

  // Build chapter list
  const allChapters = buildChapterList();
  console.log(`Total chapters in Bible: ${allChapters.length}`);

  // Find start position
  let startIdx = 0;
  if (START_AT) {
    const [startCode, startCh] = START_AT.split(':');
    startIdx = allChapters.findIndex(c =>
      c.bookCode === startCode && c.chapter === parseInt(startCh)
    );
    if (startIdx === -1) {
      console.error(`Start position ${START_AT} not found`);
      process.exit(1);
    }
    console.log(`Starting from: ${allChapters[startIdx].book} ${allChapters[startIdx].chapter}`);
  }

  // Apply limit
  let chapters = allChapters.slice(startIdx);
  if (LIMIT) chapters = chapters.slice(0, LIMIT);
  console.log(`Chapters to process: ${chapters.length}\n`);

  // Load usage log
  const log = loadLog();
  const sessionStart = new Date().toISOString();

  let generated = 0, skipped = 0, errors = 0, noText = 0;
  let charsProcessed = 0;
  const startTime = Date.now();
  let currentBook = '';

  for (let i = 0; i < chapters.length; i++) {
    const ch = chapters[i];
    const progress = `[${i + 1}/${chapters.length}]`;

    // Print book header when book changes
    if (ch.book !== currentBook) {
      currentBook = ch.book;
      console.log(`\n── ${ch.book} (${ch.bookCode}) ──`);
    }

    // Fetch text from CDN
    let verseTexts;
    try {
      verseTexts = await fetchChapterText(ch.bookCode, ch.chapter);
    } catch (err) {
      errors++;
      console.error(`${progress} ${ch.book} ${ch.chapter} — CDN ERROR: ${err.message}`);
      continue;
    }

    if (!verseTexts || verseTexts.length === 0) {
      noText++;
      console.log(`${progress} ${ch.book} ${ch.chapter} — NO TEXT (not in CDN)`);
      continue;
    }

    const result = await generateChapter(ch, voiceName, verseTexts);

    if (result.skipped) {
      skipped++;
      console.log(`${progress} ${ch.book} ${ch.chapter} — SKIPPED (exists)`);
    } else if (result.dryRun) {
      charsProcessed += result.chars;
      console.log(`${progress} ${ch.book} ${ch.chapter} — ${result.chars.toLocaleString()} chars [DRY RUN]`);
    } else if (result.success) {
      generated++;
      charsProcessed += result.chars;
      const sizeKB = (result.mp3Size / 1024).toFixed(0);
      const chunkInfo = result.chunks > 1 ? `, ${result.chunks} chunks` : '';
      console.log(`${progress} ${ch.book} ${ch.chapter} — ${result.chars.toLocaleString()} chars, ${result.verses} verses, ${result.duration.toFixed(1)}s, ${sizeKB}KB${chunkInfo}`);
    } else if (result.error) {
      errors++;
      console.error(`${progress} ${ch.book} ${ch.chapter} — ERROR: ${result.error}`);

      // If billing/quota error, stop early
      if (result.error.includes('RESOURCE_EXHAUSTED') || result.error.includes('billing')) {
        console.error('\n⚠ Quota or billing limit reached. Stopping.');
        console.error('  Resume later with: --start=' + ch.bookCode + ':' + ch.chapter);
        break;
      }
    }

    // Rate limit delay
    if (result.success && i < chapters.length - 1) {
      await new Promise(r => setTimeout(r, DELAY_MS));
    }
  }

  const elapsed = ((Date.now() - startTime) / 1000 / 60).toFixed(1);
  const cost = (charsProcessed / 1_000_000) * COST_PER_MILLION;

  console.log(`\n═══ Complete ═══`);
  console.log(`Generated: ${generated}, Skipped: ${skipped}, No text: ${noText}, Errors: ${errors}`);
  console.log(`Characters processed: ${charsProcessed.toLocaleString()}`);
  console.log(`Cost this session: $${cost.toFixed(2)} (at $30/1M chars)`);
  console.log(`Time: ${elapsed} minutes`);

  if (generated > 0) {
    // Update log
    log.totalChars += charsProcessed;
    log.totalCost += cost;
    log.sessions.push({
      date: sessionStart,
      lang: LANG_CODE,
      translation: TRANSLATION_ID,
      voice: voiceName,
      chapters: generated,
      chars: charsProcessed,
      cost: parseFloat(cost.toFixed(2)),
    });
    saveLog(log);

    console.log(`\nCumulative usage: ${log.totalChars.toLocaleString()} chars, $${log.totalCost.toFixed(2)}`);
    const freeRemaining = Math.max(0, 1_000_000 - log.totalChars);
    console.log(`Free tier remaining (this month): ~${freeRemaining.toLocaleString()} chars`);
  }

  if (errors > 0 || noText > 0) {
    const lastProcessed = chapters[chapters.length - 1];
    console.log(`\nTo resume: node scripts/generate-audio-google.cjs --lang=${LANG_CODE} --translation=${TRANSLATION_ID} --start=${lastProcessed.bookCode}:${lastProcessed.chapter}`);
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
