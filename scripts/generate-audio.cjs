/**
 * generate-audio.cjs — Batch generate ElevenLabs audio for all KJV chapters
 *
 * Usage:
 *   node scripts/generate-audio.cjs --voice=VOICE_ID
 *   node scripts/generate-audio.cjs --voice=VOICE_ID --start=GEN:5
 *   node scripts/generate-audio.cjs --voice=VOICE_ID --book=genesis
 *   node scripts/generate-audio.cjs --voice=VOICE_ID --dry-run
 *
 * Requires ELEVENLABS_API_KEY in .env.local
 *
 * Outputs:
 *   audio-output/kjv/{BOOK_CODE}/{chapter}.mp3
 *   audio-output/kjv/{BOOK_CODE}/{chapter}-ts.json
 *
 * Features:
 *   - Resume support: skips chapters where MP3 already exists
 *   - Rate limiting: 2-second delay between API calls
 *   - Progress logging with character counts
 *   - Word-level timestamps for karaoke highlighting
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
  process.exit(1);
}

const BASE_URL = 'https://api.elevenlabs.io/v1';
const DATA_DIR = path.join(__dirname, '..', 'public', 'data');
const OUT_DIR = path.join(__dirname, '..', 'audio-output');
const DELAY_MS = 2000;
const MAX_RETRIES = 3;

// ── BOOK_CODE_MAP (same as constants.js) ──
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

// Book name → JSON file slug
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

const VOICE_ID = args.voice;
const DRY_RUN = !!args['dry-run'];
const START_AT = args.start || null; // e.g., "GEN:5"
const SINGLE_BOOK = args.book || null; // e.g., "genesis"

if (!VOICE_ID) {
  console.error('Usage: node scripts/generate-audio.cjs --voice=VOICE_ID');
  console.error('Run scripts/audition-voices.cjs first to pick a voice');
  process.exit(1);
}

// ── Build chapter list ──
function buildChapterList() {
  const chapters = [];
  const files = fs.readdirSync(DATA_DIR).filter(f =>
    f.endsWith('.json') && f !== 'verse-counts.json'
  );

  // Sort by canonical Bible order
  const bookOrder = Object.keys(BOOK_CODE_MAP).map(b => bookToSlug(b));

  const sortedFiles = files.sort((a, b) => {
    const aSlug = a.replace('.json', '');
    const bSlug = b.replace('.json', '');
    const aIdx = bookOrder.indexOf(aSlug);
    const bIdx = bookOrder.indexOf(bSlug);
    return (aIdx === -1 ? 999 : aIdx) - (bIdx === -1 ? 999 : bIdx);
  });

  for (const f of sortedFiles) {
    const slug = f.replace('.json', '');
    if (SINGLE_BOOK && slug !== SINGLE_BOOK) continue;

    try {
      const data = JSON.parse(fs.readFileSync(path.join(DATA_DIR, f), 'utf-8'));
      if (!data.chapters || !data.book) continue;

      const bookName = data.book;
      const bookCode = BOOK_CODE_MAP[bookName];
      if (!bookCode) continue;

      for (const [chNum, chData] of Object.entries(data.chapters)) {
        if (!chData.verses || chData.verses.length === 0) continue;

        // Build chapter text: plain verse text (no verse numbers — natural reading)
        // Store verse boundaries for timestamp mapping
        const verseTexts = chData.verses.map(v => ({ num: v.verse_number, text: v.kjv_text }));
        const text = verseTexts.map(v => v.text).join(' ');

        chapters.push({
          book: bookName,
          bookCode,
          chapter: parseInt(chNum),
          text,
          chars: text.length,
          verseCount: chData.verses.length,
          verseTexts, // for timestamp verse boundary mapping
        });
      }
    } catch (err) {
      console.warn(`Warning: Could not read ${f}: ${err.message}`);
    }
  }

  // Sort chapters by book order then chapter number
  chapters.sort((a, b) => {
    const aIdx = Object.keys(BOOK_CODE_MAP).indexOf(a.book);
    const bIdx = Object.keys(BOOK_CODE_MAP).indexOf(b.book);
    if (aIdx !== bIdx) return aIdx - bIdx;
    return a.chapter - b.chapter;
  });

  return chapters;
}

// ── Parse word-level timestamps from ElevenLabs alignment data ──
// ElevenLabs returns flat arrays: characters[], character_start_times_seconds[], character_end_times_seconds[]
// verseTexts: [{ num, text }] — used to map character positions to verse numbers
function parseTimestamps(alignment, verseTexts, bookName, chNum) {
  const result = {
    book: bookName,
    chapter: chNum,
    translation: 'kjv',
    voice: VOICE_ID,
    duration: 0,
    verses: [],
    words: [],
  };

  if (!alignment || !alignment.characters) return result;

  const chars = alignment.characters;
  const starts = alignment.character_start_times_seconds || [];
  const ends = alignment.character_end_times_seconds || [];
  if (chars.length === 0 || starts.length === 0) return result;

  // Duration = end of last character
  result.duration = ends[ends.length - 1] || 0;

  // Build verse boundary map: character offset → verse number
  // The full text is: verse1.text + " " + verse2.text + " " + ...
  const verseBoundaries = []; // [{ num, startChar, endChar }]
  let charOffset = 0;
  for (let i = 0; i < verseTexts.length; i++) {
    const vt = verseTexts[i];
    const start = charOffset;
    const end = charOffset + vt.text.length;
    verseBoundaries.push({ num: vt.num, startChar: start, endChar: end });
    charOffset = end + 1; // +1 for the space between verses
  }

  // Map character index to verse number
  function getVerseNum(charIdx) {
    for (let i = verseBoundaries.length - 1; i >= 0; i--) {
      if (charIdx >= verseBoundaries[i].startChar) return verseBoundaries[i].num;
    }
    return verseTexts[0]?.num || 1;
  }

  // Reconstruct words from character-level alignment
  let currentWord = '';
  let wordStartTime = null;
  let wordStartCharIdx = 0;
  let lastEndTime = 0;
  let lastVerseNum = -1;
  let verseWordIdx = 0;

  for (let i = 0; i < chars.length; i++) {
    const ch = chars[i];
    const startSec = starts[i] || 0;
    const endSec = ends[i] || 0;
    lastEndTime = endSec;

    if (ch === ' ' || ch === '\n' || ch === '\t') {
      if (currentWord.length > 0) {
        const verseNum = getVerseNum(wordStartCharIdx);
        if (verseNum !== lastVerseNum) {
          verseWordIdx = 0;
          lastVerseNum = verseNum;
        }
        result.words.push({
          text: currentWord,
          start: parseFloat(wordStartTime.toFixed(3)),
          end: parseFloat(endSec.toFixed(3)),
          verse: verseNum,
          verseWordIdx: verseWordIdx,
        });
        verseWordIdx++;
        currentWord = '';
        wordStartTime = null;
      }
    } else {
      if (wordStartTime === null) {
        wordStartTime = startSec;
        wordStartCharIdx = i;
      }
      currentWord += ch;
    }
  }

  // Last word
  if (currentWord.length > 0 && wordStartTime !== null) {
    const verseNum = getVerseNum(wordStartCharIdx);
    if (verseNum !== lastVerseNum) verseWordIdx = 0;
    result.words.push({
      text: currentWord,
      start: parseFloat(wordStartTime.toFixed(3)),
      end: parseFloat(lastEndTime.toFixed(3)),
      verse: verseNum,
      verseWordIdx: verseWordIdx,
    });
  }

  // Build verse-level timestamps from word data
  const verseMap = {};
  for (const w of result.words) {
    if (!verseMap[w.verse]) {
      verseMap[w.verse] = { start: w.start, end: w.end };
    } else {
      verseMap[w.verse].end = Math.max(verseMap[w.verse].end, w.end);
    }
  }

  result.verses = Object.entries(verseMap)
    .map(([num, times]) => ({
      num: parseInt(num),
      start: parseFloat(times.start.toFixed(3)),
      end: parseFloat(times.end.toFixed(3)),
    }))
    .sort((a, b) => a.num - b.num);

  // Round word timestamps
  result.words = result.words.map(w => ({
    ...w,
    start: parseFloat(w.start.toFixed(3)),
    end: parseFloat(w.end.toFixed(3)),
  }));

  return result;
}

// ── Generate audio + timestamps for one chapter ──
async function generateChapter(chapter, retryCount = 0) {
  const outDir = path.join(OUT_DIR, 'kjv', chapter.bookCode);
  const mp3Path = path.join(outDir, `${chapter.chapter}.mp3`);
  const tsPath = path.join(outDir, `${chapter.chapter}-ts.json`);

  // Resume: skip if already done
  if (fs.existsSync(mp3Path) && fs.existsSync(tsPath)) {
    return { skipped: true };
  }

  if (DRY_RUN) {
    return { dryRun: true, chars: chapter.chars };
  }

  // Ensure directory exists
  if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

  try {
    const res = await fetch(`${BASE_URL}/text-to-speech/${VOICE_ID}/with-timestamps`, {
      method: 'POST',
      headers: {
        'xi-api-key': API_KEY,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        text: chapter.text,
        model_id: 'eleven_multilingual_v2',
        voice_settings: {
          stability: 0.65,
          similarity_boost: 0.75,
          style: 0.3,
          use_speaker_boost: true,
        },
      }),
    });

    if (res.status === 429) {
      // Rate limited — wait and retry
      const retryAfter = parseInt(res.headers.get('retry-after') || '30');
      console.log(`  Rate limited. Waiting ${retryAfter}s...`);
      await new Promise(r => setTimeout(r, retryAfter * 1000));
      if (retryCount < MAX_RETRIES) {
        return generateChapter(chapter, retryCount + 1);
      }
      throw new Error('Max retries exceeded (rate limit)');
    }

    if (!res.ok) {
      const errBody = await res.text();
      throw new Error(`API error ${res.status}: ${errBody}`);
    }

    const data = await res.json();

    // Save MP3
    if (data.audio_base64) {
      const audioBuffer = Buffer.from(data.audio_base64, 'base64');
      fs.writeFileSync(mp3Path, audioBuffer);
    }

    // Parse and save timestamps
    const timestamps = parseTimestamps(
      data.alignment,
      chapter.verseTexts,
      chapter.book,
      chapter.chapter
    );
    fs.writeFileSync(tsPath, JSON.stringify(timestamps));

    return {
      success: true,
      chars: chapter.chars,
      mp3Size: fs.statSync(mp3Path).size,
      duration: timestamps.duration,
      words: timestamps.words.length,
      verses: timestamps.verses.length,
    };
  } catch (err) {
    if (retryCount < MAX_RETRIES) {
      console.log(`  Retry ${retryCount + 1}/${MAX_RETRIES}...`);
      await new Promise(r => setTimeout(r, 5000));
      return generateChapter(chapter, retryCount + 1);
    }
    return { error: err.message };
  }
}

// ── Main ──
async function main() {
  console.log('\n═══ ElevenLabs KJV Audio Generator ═══\n');
  console.log(`Voice: ${VOICE_ID}`);
  console.log(`Output: ${OUT_DIR}/kjv/`);
  if (DRY_RUN) console.log('Mode: DRY RUN (no API calls)');
  if (SINGLE_BOOK) console.log(`Book filter: ${SINGLE_BOOK}`);
  if (START_AT) console.log(`Starting at: ${START_AT}`);
  console.log('');

  const chapters = buildChapterList();
  console.log(`Total chapters: ${chapters.length}`);
  const totalChars = chapters.reduce((sum, c) => sum + c.chars, 0);
  console.log(`Total characters: ${totalChars.toLocaleString()}`);
  console.log(`Estimated cost (Creator $0.30/1K): $${(totalChars / 1000 * 0.30).toFixed(0)}`);
  console.log(`Estimated cost (Scale $0.18/1K):   $${(totalChars / 1000 * 0.18).toFixed(0)}`);
  console.log('');

  // Find start position
  let startIdx = 0;
  if (START_AT) {
    const [startCode, startCh] = START_AT.split(':');
    startIdx = chapters.findIndex(c =>
      c.bookCode === startCode && c.chapter === parseInt(startCh)
    );
    if (startIdx === -1) {
      console.error(`Start position ${START_AT} not found`);
      process.exit(1);
    }
    console.log(`Starting from index ${startIdx}: ${chapters[startIdx].book} ${chapters[startIdx].chapter}\n`);
  }

  let generated = 0, skipped = 0, errors = 0, charsProcessed = 0;
  const startTime = Date.now();

  for (let i = startIdx; i < chapters.length; i++) {
    const ch = chapters[i];
    const progress = `[${i + 1}/${chapters.length}]`;

    const result = await generateChapter(ch);

    if (result.skipped) {
      skipped++;
      console.log(`${progress} ${ch.book} ${ch.chapter} — SKIPPED (exists)`);
    } else if (result.dryRun) {
      console.log(`${progress} ${ch.book} ${ch.chapter} — ${ch.chars.toLocaleString()} chars, ${ch.verseCount} verses [DRY RUN]`);
    } else if (result.success) {
      generated++;
      charsProcessed += result.chars;
      const sizeKB = (result.mp3Size / 1024).toFixed(0);
      console.log(`${progress} ${ch.book} ${ch.chapter} — ${ch.chars.toLocaleString()} chars, ${result.verses} verses, ${result.words} words, ${result.duration.toFixed(1)}s, ${sizeKB}KB`);
    } else if (result.error) {
      errors++;
      console.error(`${progress} ${ch.book} ${ch.chapter} — ERROR: ${result.error}`);
    }

    // Rate limit delay between API calls
    if (result.success && i < chapters.length - 1) {
      await new Promise(r => setTimeout(r, DELAY_MS));
    }
  }

  const elapsed = ((Date.now() - startTime) / 1000 / 60).toFixed(1);
  console.log(`\n═══ Complete ═══`);
  console.log(`Generated: ${generated}, Skipped: ${skipped}, Errors: ${errors}`);
  console.log(`Characters processed: ${charsProcessed.toLocaleString()}`);
  console.log(`Time: ${elapsed} minutes`);
  if (generated > 0) {
    const cost = charsProcessed / 1000 * 0.30;
    console.log(`Estimated cost (Creator): $${cost.toFixed(2)}`);
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
