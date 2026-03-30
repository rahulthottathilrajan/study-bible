/**
 * Generate HD audio for all Bible chapters using Edge TTS (free, no API key).
 *
 * Usage:
 *   node scripts/generate-audio-edge.cjs                          # All 66 books (KJV)
 *   node scripts/generate-audio-edge.cjs --book=genesis            # Single book
 *   node scripts/generate-audio-edge.cjs --start=PSA:23            # Resume from chapter
 *   node scripts/generate-audio-edge.cjs --limit=5                 # Limit to N chapters
 *   node scripts/generate-audio-edge.cjs --translation=bsb         # Different translation
 *   node scripts/generate-audio-edge.cjs --voice=en-US-AndrewNeural
 *   node scripts/generate-audio-edge.cjs --dry-run                 # Count only, no generation
 *
 * Output:
 *   audio-output/{translation}/{BOOK_CODE}/{chapter}.mp3
 *   audio-output/{translation}/{BOOK_CODE}/{chapter}-ts.json
 *
 * Default: KJV with en-US-BrianNeural voice
 */

const fs = require("fs");
const path = require("path");
const { EdgeTTS } = require("node-edge-tts");

/* ── Load env ── */
function loadEnv() {
  const envPath = path.join(__dirname, "..", ".env.local");
  if (!fs.existsSync(envPath)) return;
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

/* ── Constants ── */
const DEFAULT_VOICE = "en-US-BrianNeural";
const DEFAULT_TRANSLATION = "kjv";
const TIMEOUT_MS = 120000; // 120s timeout per chapter (long chapters like Psalm 119)
const RETRY_MAX = 3;
const RETRY_DELAY_MS = 3000;

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

const BOOK_SLUG_MAP = {
  "Genesis":"genesis","Exodus":"exodus","Leviticus":"leviticus","Numbers":"numbers",
  "Deuteronomy":"deuteronomy","Joshua":"joshua","Judges":"judges","Ruth":"ruth",
  "1 Samuel":"1-samuel","2 Samuel":"2-samuel","1 Kings":"1-kings","2 Kings":"2-kings",
  "1 Chronicles":"1-chronicles","2 Chronicles":"2-chronicles","Ezra":"ezra",
  "Nehemiah":"nehemiah","Esther":"esther","Job":"job","Psalms":"psalms",
  "Proverbs":"proverbs","Ecclesiastes":"ecclesiastes","Song of Solomon":"song-of-solomon",
  "Isaiah":"isaiah","Jeremiah":"jeremiah","Lamentations":"lamentations","Ezekiel":"ezekiel",
  "Daniel":"daniel","Hosea":"hosea","Joel":"joel","Amos":"amos","Obadiah":"obadiah",
  "Jonah":"jonah","Micah":"micah","Nahum":"nahum","Habakkuk":"habakkuk",
  "Zephaniah":"zephaniah","Haggai":"haggai","Zechariah":"zechariah","Malachi":"malachi",
  "Matthew":"matthew","Mark":"mark","Luke":"luke","John":"john","Acts":"acts",
  "Romans":"romans","1 Corinthians":"1-corinthians","2 Corinthians":"2-corinthians",
  "Galatians":"galatians","Ephesians":"ephesians","Philippians":"philippians",
  "Colossians":"colossians","1 Thessalonians":"1-thessalonians","2 Thessalonians":"2-thessalonians",
  "1 Timothy":"1-timothy","2 Timothy":"2-timothy","Titus":"titus","Philemon":"philemon",
  "Hebrews":"hebrews","James":"james","1 Peter":"1-peter","2 Peter":"2-peter",
  "1 John":"1-john","2 John":"2-john","3 John":"3-john","Jude":"jude",
  "Revelation":"revelation",
};

/* ── CLI args ── */
const args = Object.fromEntries(
  process.argv.slice(2).filter(a => a.startsWith("--")).map(a => {
    const [k, ...v] = a.slice(2).split("=");
    return [k, v.join("=") || true];
  })
);

const voiceName = args.voice || DEFAULT_VOICE;
const translation = args.translation || DEFAULT_TRANSLATION;
const singleBook = args.book || null;
const startFrom = args.start || null; // "PSA:23"
const limit = args.limit ? parseInt(args.limit, 10) : 0;
const dryRun = !!args["dry-run"];

/* ── Build chapter list from static JSON ── */
function buildChapterList() {
  const dataDir = path.join(__dirname, "..", "public", "data");
  const vcPath = path.join(dataDir, "verse-counts.json");
  const verseCounts = JSON.parse(fs.readFileSync(vcPath, "utf8"));

  const chapters = [];
  for (const [bookName, code] of Object.entries(BOOK_CODE_MAP)) {
    const slug = BOOK_SLUG_MAP[bookName];
    if (!slug) continue;
    if (singleBook && slug !== singleBook && code !== singleBook.toUpperCase()) continue;

    const bookVC = verseCounts[bookName];
    if (!bookVC) continue;
    const chCount = Object.keys(bookVC).length;

    for (let ch = 1; ch <= chCount; ch++) {
      chapters.push({ bookName, code, slug, chapter: ch });
    }
  }
  return chapters;
}

/* ── Fetch chapter text ── */
function getChapterText(slug, bookCode, chNum) {
  if (translation === "kjv" || translation === "bsb") {
    // KJV: read from static book JSON
    if (translation === "kjv") {
      const jsonPath = path.join(__dirname, "..", "public", "data", `${slug}.json`);
      if (!fs.existsSync(jsonPath)) return null;
      const bookData = JSON.parse(fs.readFileSync(jsonPath, "utf8"));
      const chData = bookData.chapters?.[String(chNum)];
      if (!chData) return null;
      return chData.verses.map(v => ({ num: v.verse_number, text: v.kjv_text }));
    }
    // BSB: read from downloaded translations (same voice as KJV)
    const transPath = path.join(__dirname, "..", "public", "data", "translations", "bsb", bookCode, `${chNum}.json`);
    if (!fs.existsSync(transPath)) return null;
    const verses = JSON.parse(fs.readFileSync(transPath, "utf8"));
    return Object.entries(verses).map(([num, text]) => ({ num: parseInt(num, 10), text })).sort((a, b) => a.num - b.num);
  }

  // Other translations: read from downloaded translation files
  const transPath = path.join(__dirname, "..", "public", "data", "translations", translation, bookCode, `${chNum}.json`);
  if (!fs.existsSync(transPath)) return null;
  const verses = JSON.parse(fs.readFileSync(transPath, "utf8"));
  return Object.entries(verses).map(([num, text]) => ({ num: parseInt(num, 10), text })).sort((a, b) => a.num - b.num);
}

/* ── Convert Edge TTS word boundaries to our timestamp format ── */
function buildTimestamps(wordBoundaries, verses, bookName, chNum, duration) {
  // Build verse-level timestamps from word boundaries
  const verseTimestamps = [];
  let currentVerse = null;
  let verseStart = 0;

  // Map words to verses by tracking verse prefix patterns
  // Edge TTS gives us word-level data — we need to map back to verse numbers
  const verseStarts = []; // { num, charOffset }
  let fullText = "";
  for (const v of verses) {
    verseStarts.push({ num: v.num, charOffset: fullText.length });
    fullText += v.text + " ";
  }

  // Build word-level data for karaoke
  const words = [];
  for (let i = 0; i < wordBoundaries.length; i++) {
    const wb = wordBoundaries[i];
    const startSec = wb.start / 1000;
    const endSec = wb.end / 1000;
    const text = wb.part.trim();
    if (!text) continue;

    // Determine which verse this word belongs to
    // Use the next word boundary's start (or audio end) to find verse
    let verseNum = verses[verses.length - 1].num; // default to last
    // Find word position in full text by accumulating
    for (let v = verseStarts.length - 1; v >= 0; v--) {
      // Check if this word's start time is after verse boundary
      // Use heuristic: match word count progress to verse boundaries
      if (v === 0 || startSec >= (verseTimestamps[v - 1]?.end || 0)) {
        verseNum = verseStarts[v].num;
        break;
      }
    }

    words.push({
      verse: verseNum,
      wordIdx: i,
      verseWordIdx: 0, // will be computed below
      text,
      start: startSec,
      end: endSec,
    });
  }

  // Compute verseWordIdx (per-verse word index for karaoke highlighting)
  const verseWordCounts = {};
  for (const w of words) {
    verseWordCounts[w.verse] = (verseWordCounts[w.verse] || 0);
    w.verseWordIdx = verseWordCounts[w.verse];
    verseWordCounts[w.verse]++;
  }

  // Build verse-level timestamps by grouping words per verse
  // More accurate: use word boundaries to find verse start/end times
  const verseWordGroups = {};
  for (const w of words) {
    if (!verseWordGroups[w.verse]) verseWordGroups[w.verse] = [];
    verseWordGroups[w.verse].push(w);
  }

  // Better approach: map verses by proportional text position
  const totalChars = verses.reduce((sum, v) => sum + v.text.length, 0);
  let charsSoFar = 0;
  for (const v of verses) {
    const fraction = charsSoFar / totalChars;
    const nextFraction = (charsSoFar + v.text.length) / totalChars;

    // Find first word boundary at or after this fraction of total time
    const vStart = fraction * duration;
    const vEnd = nextFraction * duration;

    // Try to find actual word boundaries for this verse
    const group = verseWordGroups[v.num];
    if (group && group.length > 0) {
      verseTimestamps.push({
        num: v.num,
        start: Math.round(group[0].start * 1000) / 1000,
        end: Math.round(group[group.length - 1].end * 1000) / 1000,
      });
    } else {
      verseTimestamps.push({
        num: v.num,
        start: Math.round(vStart * 1000) / 1000,
        end: Math.round(vEnd * 1000) / 1000,
      });
    }
    charsSoFar += v.text.length;
  }

  // Re-assign verse numbers to words using verse timestamp boundaries
  for (const w of words) {
    for (let i = verseTimestamps.length - 1; i >= 0; i--) {
      if (w.start >= verseTimestamps[i].start) {
        w.verse = verseTimestamps[i].num;
        break;
      }
    }
  }

  // Recompute verseWordIdx after verse reassignment
  const vwc2 = {};
  for (const w of words) {
    vwc2[w.verse] = (vwc2[w.verse] || 0);
    w.verseWordIdx = vwc2[w.verse];
    vwc2[w.verse]++;
  }

  return {
    book: bookName,
    chapter: chNum,
    translation,
    voice: voiceName,
    duration: Math.round(duration * 1000) / 1000,
    verses: verseTimestamps,
    words: words.map(w => ({
      verse: w.verse,
      verseWordIdx: w.verseWordIdx,
      text: w.text,
      start: w.start,
      end: w.end,
    })),
  };
}

/* ── Generate single chapter with retry ── */
async function generateChapter(bookName, code, slug, chNum) {
  const verses = getChapterText(slug, code, chNum);
  if (!verses || verses.length === 0) {
    return { skipped: true, reason: "no text" };
  }

  // Build full text — verse text only, no verse numbers spoken
  const fullText = verses.map(v => v.text).join(" ");
  const charCount = fullText.length;

  const outDir = path.join(__dirname, "..", "audio-output", translation, code);
  const mp3Path = path.join(outDir, `${chNum}.mp3`);
  const tsPath = path.join(outDir, `${chNum}-ts.json`);

  // Skip if already generated
  if (fs.existsSync(mp3Path) && fs.statSync(mp3Path).size > 0) {
    return { skipped: true, reason: "exists", charCount };
  }

  fs.mkdirSync(outDir, { recursive: true });

  let lastError = null;
  for (let attempt = 1; attempt <= RETRY_MAX; attempt++) {
    try {
      // Derive lang from voice name (e.g., "hi-IN-MadhurNeural" → "hi-IN")
      const voiceLang = voiceName.split("-").slice(0, 2).join("-");
      const tts = new EdgeTTS({
        voice: voiceName,
        lang: voiceLang,
        outputFormat: "audio-24khz-96kbitrate-mono-mp3",
        saveSubtitles: true,
        timeout: TIMEOUT_MS,
      });

      await tts.ttsPromise(fullText, mp3Path);

      // Read word boundaries from the .json subtitle file
      const subPath = mp3Path + ".json";
      let wordBoundaries = [];
      if (fs.existsSync(subPath)) {
        wordBoundaries = JSON.parse(fs.readFileSync(subPath, "utf8"));
        fs.unlinkSync(subPath); // Clean up — we'll write our own ts.json
      }

      // Calculate duration from MP3 file size (96kbps = 12000 bytes/sec)
      const mp3Size = fs.statSync(mp3Path).size;
      const duration = mp3Size / 12000;

      // Build and save timestamp data
      const tsData = buildTimestamps(wordBoundaries, verses, bookName, chNum, duration);
      fs.writeFileSync(tsPath, JSON.stringify(tsData, null, 2));

      return { charCount, duration, mp3Size };
    } catch (err) {
      lastError = err;
      if (attempt < RETRY_MAX) {
        console.log(`    retry ${attempt}/${RETRY_MAX} — ${err.message || err}`);
        await new Promise(r => setTimeout(r, RETRY_DELAY_MS));
      }
    }
  }

  throw lastError;
}

/* ── Main ── */
async function main() {
  let chapters = buildChapterList();

  // Apply --start filter
  if (startFrom) {
    const [startCode, startCh] = startFrom.split(":");
    const startIdx = chapters.findIndex(c => c.code === startCode && c.chapter === parseInt(startCh, 10));
    if (startIdx === -1) {
      console.error(`Start point ${startFrom} not found`);
      process.exit(1);
    }
    chapters = chapters.slice(startIdx);
  }

  // Apply --limit
  if (limit > 0) chapters = chapters.slice(0, limit);

  console.log(`\n  Edge TTS Bible Audio Generator`);
  console.log(`  Voice:       ${voiceName}`);
  console.log(`  Translation: ${translation}`);
  console.log(`  Chapters:    ${chapters.length}`);
  console.log(`  Output:      audio-output/${translation}/`);
  console.log(`  Cost:        $0.00 (free)`);
  if (dryRun) console.log(`  Mode:        DRY RUN (no generation)`);
  console.log();

  if (dryRun) {
    let totalChars = 0;
    for (const ch of chapters) {
      const verses = getChapterText(ch.slug, ch.code, ch.chapter);
      const chars = verses ? verses.reduce((s, v) => s + v.text.length, 0) : 0;
      totalChars += chars;
    }
    console.log(`  Total characters: ${totalChars.toLocaleString()}`);
    console.log(`  Estimated audio:  ~${Math.round(totalChars / 1000)} minutes`);
    return;
  }

  let generated = 0;
  let skipped = 0;
  let failed = 0;
  let totalChars = 0;
  const startTime = Date.now();
  let currentBook = "";

  for (let i = 0; i < chapters.length; i++) {
    const ch = chapters[i];

    // Print book header when book changes
    if (ch.bookName !== currentBook) {
      currentBook = ch.bookName;
      console.log(`\n── ${currentBook} ──`);
    }

    const label = `[${i + 1}/${chapters.length}]`;
    process.stdout.write(`  ${label} ${ch.code} ${ch.chapter}... `);

    try {
      const result = await generateChapter(ch.bookName, ch.code, ch.slug, ch.chapter);
      if (result.skipped) {
        console.log(`skipped (${result.reason})`);
        skipped++;
        if (result.charCount) totalChars += result.charCount;
      } else {
        const dur = result.duration.toFixed(1);
        const size = (result.mp3Size / 1024).toFixed(0);
        console.log(`done (${dur}s, ${size}KB, ${result.charCount} chars)`);
        generated++;
        totalChars += result.charCount;
      }
    } catch (err) {
      console.log(`FAILED — ${err.message || err}`);
      failed++;
    }
  }

  const elapsed = ((Date.now() - startTime) / 1000 / 60).toFixed(1);
  console.log(`\n  Complete in ${elapsed} minutes`);
  console.log(`  Generated: ${generated} | Skipped: ${skipped} | Failed: ${failed}`);
  console.log(`  Total chars: ${totalChars.toLocaleString()}`);
  console.log(`  Output: audio-output/${translation}/`);
  if (generated > 0) {
    console.log(`\n  Next step: node scripts/upload-audio.cjs --translation=${translation}`);
  }
}

main().catch(err => { console.error("Fatal:", err); process.exit(1); });
