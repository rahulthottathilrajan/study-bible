/**
 * Download all Bible translations from bible.helloao.org CDN as static JSON.
 * This creates a local copy so the app doesn't depend on the CDN at runtime.
 *
 * Usage:
 *   node scripts/download-translations.cjs                    # All 10 translations
 *   node scripts/download-translations.cjs --translation=bsb  # Single translation
 *   node scripts/download-translations.cjs --dry-run           # Count only
 *
 * Output: public/data/translations/{cdnId}/{BOOK_CODE}/{chapter}.json
 *
 * Each file stores the pre-parsed verse map: { "1": "verse text...", "2": "..." }
 * This matches what fetchTranslatedVerses() returns, so the app can read it directly.
 */

const fs = require("fs");
const path = require("path");

const ROOT = path.join(__dirname, "..");
const OUT_DIR = path.join(ROOT, "public", "data", "translations");

const DELAY_MS = 100; // 100ms between requests to be polite to CDN
const RETRY_MAX = 3;
const CONCURRENCY = 5; // parallel downloads per translation

// cdnId = what the CDN expects in the URL (case-sensitive)
// localId = what we store locally (matches app's translation id)
const TRANSLATIONS = [
  { localId: "bsb", cdnId: "BSB", name: "Berean Standard Bible" },
  { localId: "HINIRV", cdnId: "HINIRV", name: "Hindi IRV" },
  { localId: "mal_irv", cdnId: "mal_irv", name: "Malayalam IRV" },
  { localId: "tam_irv", cdnId: "tam_irv", name: "Tamil IRV" },
  { localId: "tel_irv", cdnId: "tel_irv", name: "Telugu IRV" },
  { localId: "kan_irv", cdnId: "kan_irv", name: "Kannada IRV" },
  { localId: "fra_lsg", cdnId: "fra_lsg", name: "French Louis Segond" },
  { localId: "spa_r09", cdnId: "spa_r09", name: "Spanish Reina Valera" },
  { localId: "cmn_cu1", cdnId: "cmn_cu1", name: "Chinese Union Version" },
  { localId: "ARBNAV", cdnId: "ARBNAV", name: "New Arabic Version" },
];

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

const BIBLE_BOOKS = [
  { name:"Genesis", chapters:50 },{ name:"Exodus", chapters:40 },
  { name:"Leviticus", chapters:27 },{ name:"Numbers", chapters:36 },
  { name:"Deuteronomy", chapters:34 },{ name:"Joshua", chapters:24 },
  { name:"Judges", chapters:21 },{ name:"Ruth", chapters:4 },
  { name:"1 Samuel", chapters:31 },{ name:"2 Samuel", chapters:24 },
  { name:"1 Kings", chapters:22 },{ name:"2 Kings", chapters:25 },
  { name:"1 Chronicles", chapters:29 },{ name:"2 Chronicles", chapters:36 },
  { name:"Ezra", chapters:10 },{ name:"Nehemiah", chapters:13 },
  { name:"Esther", chapters:10 },{ name:"Job", chapters:42 },
  { name:"Psalms", chapters:150 },{ name:"Proverbs", chapters:31 },
  { name:"Ecclesiastes", chapters:12 },{ name:"Song of Solomon", chapters:8 },
  { name:"Isaiah", chapters:66 },{ name:"Jeremiah", chapters:52 },
  { name:"Lamentations", chapters:5 },{ name:"Ezekiel", chapters:48 },
  { name:"Daniel", chapters:12 },{ name:"Hosea", chapters:14 },
  { name:"Joel", chapters:3 },{ name:"Amos", chapters:9 },
  { name:"Obadiah", chapters:1 },{ name:"Jonah", chapters:4 },
  { name:"Micah", chapters:7 },{ name:"Nahum", chapters:3 },
  { name:"Habakkuk", chapters:3 },{ name:"Zephaniah", chapters:3 },
  { name:"Haggai", chapters:2 },{ name:"Zechariah", chapters:14 },
  { name:"Malachi", chapters:4 },{ name:"Matthew", chapters:28 },
  { name:"Mark", chapters:16 },{ name:"Luke", chapters:24 },
  { name:"John", chapters:21 },{ name:"Acts", chapters:28 },
  { name:"Romans", chapters:16 },{ name:"1 Corinthians", chapters:16 },
  { name:"2 Corinthians", chapters:13 },{ name:"Galatians", chapters:6 },
  { name:"Ephesians", chapters:6 },{ name:"Philippians", chapters:4 },
  { name:"Colossians", chapters:4 },{ name:"1 Thessalonians", chapters:5 },
  { name:"2 Thessalonians", chapters:3 },{ name:"1 Timothy", chapters:6 },
  { name:"2 Timothy", chapters:4 },{ name:"Titus", chapters:3 },
  { name:"Philemon", chapters:1 },{ name:"Hebrews", chapters:13 },
  { name:"James", chapters:5 },{ name:"1 Peter", chapters:5 },
  { name:"2 Peter", chapters:3 },{ name:"1 John", chapters:5 },
  { name:"2 John", chapters:1 },{ name:"3 John", chapters:1 },
  { name:"Jude", chapters:1 },{ name:"Revelation", chapters:22 },
];

/* ── CLI args ── */
const args = Object.fromEntries(
  process.argv.slice(2).filter(a => a.startsWith("--")).map(a => {
    const [k, ...v] = a.slice(2).split("=");
    return [k, v.join("=") || true];
  })
);
const singleTranslation = args.translation || null;
const dryRun = !!args["dry-run"];
const skipExisting = args["skip-existing"] !== "false"; // default true

/* ── Parse CDN response into verse map ── */
function parseVerses(data) {
  const verses = {};
  (data.chapter?.content || [])
    .filter(item => item.type === "verse")
    .forEach(item => {
      verses[item.number] = (item.content || [])
        .filter(c => typeof c === "string" || c.text)
        .map(c => typeof c === "string" ? c : c.text)
        .join("");
    });
  return verses;
}

/* ── Fetch with retry ── */
async function fetchWithRetry(url, retries = RETRY_MAX) {
  for (let attempt = 1; attempt <= retries; attempt++) {
    try {
      const res = await fetch(url);
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      return await res.json();
    } catch (e) {
      if (attempt === retries) throw e;
      await new Promise(r => setTimeout(r, 1000 * attempt));
    }
  }
}

/* ── Download one chapter ── */
async function downloadChapter(cdnId, bookCode, chapter, outDir) {
  const outPath = path.join(outDir, `${chapter}.json`);

  // Skip if already exists
  if (fs.existsSync(outPath) && fs.statSync(outPath).size > 10) {
    return { skipped: true };
  }

  const url = `https://bible.helloao.org/api/${cdnId}/${bookCode}/${chapter}.json`;
  const data = await fetchWithRetry(url);
  const verses = parseVerses(data);

  if (Object.keys(verses).length === 0) {
    return { empty: true };
  }

  fs.mkdirSync(outDir, { recursive: true });
  fs.writeFileSync(outPath, JSON.stringify(verses));
  return { verses: Object.keys(verses).length };
}

/* ── Worker pool for concurrent downloads ── */
async function processQueue(queue, concurrency) {
  let idx = 0;
  let completed = 0;
  let skipped = 0;
  let failed = 0;
  const total = queue.length;

  async function worker() {
    while (idx < queue.length) {
      const i = idx++;
      const task = queue[i];
      try {
        const result = await task.fn();
        if (result.skipped) {
          skipped++;
        } else {
          completed++;
        }
      } catch (e) {
        failed++;
        console.log(`    FAILED ${task.label}: ${e.message}`);
      }

      // Progress every 50 chapters
      const done = completed + skipped + failed;
      if (done % 50 === 0 || done === total) {
        process.stdout.write(`\r  Progress: ${done}/${total} (${completed} new, ${skipped} cached, ${failed} failed)`);
      }

      await new Promise(r => setTimeout(r, DELAY_MS));
    }
  }

  const workers = Array.from({ length: concurrency }, () => worker());
  await Promise.all(workers);
  console.log(); // newline after progress

  return { completed, skipped, failed };
}

/* ── Main ── */
async function main() {
  const translations = singleTranslation
    ? TRANSLATIONS.filter(t => t.localId === singleTranslation || t.cdnId === singleTranslation)
    : TRANSLATIONS;

  if (translations.length === 0) {
    console.error(`Translation "${singleTranslation}" not found.`);
    console.error(`Available: ${TRANSLATIONS.map(t => t.localId).join(", ")}`);
    process.exit(1);
  }

  const totalChapters = BIBLE_BOOKS.reduce((s, b) => s + b.chapters, 0); // 1,189

  console.log(`\n  Bible Translation Downloader`);
  console.log(`  Source:       bible.helloao.org CDN`);
  console.log(`  Translations: ${translations.length} (${translations.map(t => t.localId).join(", ")})`);
  console.log(`  Chapters:     ${totalChapters} per translation = ${totalChapters * translations.length} total`);
  console.log(`  Output:       public/data/translations/{cdnId}/{BOOK_CODE}/`);
  console.log(`  Concurrency:  ${CONCURRENCY}`);
  if (dryRun) { console.log(`  Mode:         DRY RUN\n`); return; }
  console.log();

  const startTime = Date.now();

  for (const trans of translations) {
    console.log(`── ${trans.name} (${trans.localId}) ──`);

    const queue = [];
    for (const book of BIBLE_BOOKS) {
      const bookCode = BOOK_CODE_MAP[book.name];
      if (!bookCode) continue;
      // Use localId for folder structure (matches app's translation id)
      const outDir = path.join(OUT_DIR, trans.localId, bookCode);

      for (let ch = 1; ch <= book.chapters; ch++) {
        queue.push({
          label: `${bookCode}:${ch}`,
          // Use cdnId for the API URL (case-sensitive)
          fn: () => downloadChapter(trans.cdnId, bookCode, ch, outDir),
        });
      }
    }

    const result = await processQueue(queue, CONCURRENCY);
    console.log(`  ${trans.localId}: ${result.completed} downloaded, ${result.skipped} cached, ${result.failed} failed\n`);
  }

  const elapsed = ((Date.now() - startTime) / 1000 / 60).toFixed(1);
  console.log(`  Complete in ${elapsed} minutes`);
  console.log(`  Output: public/data/translations/`);
}

main().catch(err => { console.error("Fatal:", err); process.exit(1); });
