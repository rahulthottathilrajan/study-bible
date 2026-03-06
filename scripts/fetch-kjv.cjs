/**
 * fetch-kjv.cjs — Fetch full KJV text for all 66 books from public domain source,
 * merge with enriched data from sql-to-json.cjs output.
 *
 * Source: https://raw.githubusercontent.com/aruljohn/Bible-kjv/master/{BookName}.json
 *
 * Usage: node scripts/fetch-kjv.cjs
 * (Run AFTER scripts/sql-to-json.cjs)
 */
const fs = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const DATA_DIR = path.join(ROOT, 'public', 'data');

fs.mkdirSync(DATA_DIR, { recursive: true });

function slugify(name) {
  return name.toLowerCase().replace(/\s+/g, '-');
}

// All 66 books with metadata (from constants.js BIBLE_BOOKS)
const BIBLE_BOOKS = [
  { name:"Genesis", testament:"OT", chapters:50 },
  { name:"Exodus", testament:"OT", chapters:40 },
  { name:"Leviticus", testament:"OT", chapters:27 },
  { name:"Numbers", testament:"OT", chapters:36 },
  { name:"Deuteronomy", testament:"OT", chapters:34 },
  { name:"Joshua", testament:"OT", chapters:24 },
  { name:"Judges", testament:"OT", chapters:21 },
  { name:"Ruth", testament:"OT", chapters:4 },
  { name:"1 Samuel", testament:"OT", chapters:31 },
  { name:"2 Samuel", testament:"OT", chapters:24 },
  { name:"1 Kings", testament:"OT", chapters:22 },
  { name:"2 Kings", testament:"OT", chapters:25 },
  { name:"1 Chronicles", testament:"OT", chapters:29 },
  { name:"2 Chronicles", testament:"OT", chapters:36 },
  { name:"Ezra", testament:"OT", chapters:10 },
  { name:"Nehemiah", testament:"OT", chapters:13 },
  { name:"Esther", testament:"OT", chapters:10 },
  { name:"Job", testament:"OT", chapters:42 },
  { name:"Psalms", testament:"OT", chapters:150 },
  { name:"Proverbs", testament:"OT", chapters:31 },
  { name:"Ecclesiastes", testament:"OT", chapters:12 },
  { name:"Song of Solomon", testament:"OT", chapters:8 },
  { name:"Isaiah", testament:"OT", chapters:66 },
  { name:"Jeremiah", testament:"OT", chapters:52 },
  { name:"Lamentations", testament:"OT", chapters:5 },
  { name:"Ezekiel", testament:"OT", chapters:48 },
  { name:"Daniel", testament:"OT", chapters:12 },
  { name:"Hosea", testament:"OT", chapters:14 },
  { name:"Joel", testament:"OT", chapters:3 },
  { name:"Amos", testament:"OT", chapters:9 },
  { name:"Obadiah", testament:"OT", chapters:1 },
  { name:"Jonah", testament:"OT", chapters:4 },
  { name:"Micah", testament:"OT", chapters:7 },
  { name:"Nahum", testament:"OT", chapters:3 },
  { name:"Habakkuk", testament:"OT", chapters:3 },
  { name:"Zephaniah", testament:"OT", chapters:3 },
  { name:"Haggai", testament:"OT", chapters:2 },
  { name:"Zechariah", testament:"OT", chapters:14 },
  { name:"Malachi", testament:"OT", chapters:4 },
  { name:"Matthew", testament:"NT", chapters:28 },
  { name:"Mark", testament:"NT", chapters:16 },
  { name:"Luke", testament:"NT", chapters:24 },
  { name:"John", testament:"NT", chapters:21 },
  { name:"Acts", testament:"NT", chapters:28 },
  { name:"Romans", testament:"NT", chapters:16 },
  { name:"1 Corinthians", testament:"NT", chapters:16 },
  { name:"2 Corinthians", testament:"NT", chapters:13 },
  { name:"Galatians", testament:"NT", chapters:6 },
  { name:"Ephesians", testament:"NT", chapters:6 },
  { name:"Philippians", testament:"NT", chapters:4 },
  { name:"Colossians", testament:"NT", chapters:4 },
  { name:"1 Thessalonians", testament:"NT", chapters:5 },
  { name:"2 Thessalonians", testament:"NT", chapters:3 },
  { name:"1 Timothy", testament:"NT", chapters:6 },
  { name:"2 Timothy", testament:"NT", chapters:4 },
  { name:"Titus", testament:"NT", chapters:3 },
  { name:"Philemon", testament:"NT", chapters:1 },
  { name:"Hebrews", testament:"NT", chapters:13 },
  { name:"James", testament:"NT", chapters:5 },
  { name:"1 Peter", testament:"NT", chapters:5 },
  { name:"2 Peter", testament:"NT", chapters:3 },
  { name:"1 John", testament:"NT", chapters:5 },
  { name:"2 John", testament:"NT", chapters:1 },
  { name:"3 John", testament:"NT", chapters:1 },
  { name:"Jude", testament:"NT", chapters:1 },
  { name:"Revelation", testament:"NT", chapters:22 },
];

// The GitHub repo uses PascalCase without spaces for numbered books
const GITHUB_NAME_MAP = {
  'Song of Solomon': 'SongofSolomon',
  '1 Samuel': '1Samuel',
  '2 Samuel': '2Samuel',
  '1 Kings': '1Kings',
  '2 Kings': '2Kings',
  '1 Chronicles': '1Chronicles',
  '2 Chronicles': '2Chronicles',
  '1 Corinthians': '1Corinthians',
  '2 Corinthians': '2Corinthians',
  '1 Thessalonians': '1Thessalonians',
  '2 Thessalonians': '2Thessalonians',
  '1 Timothy': '1Timothy',
  '2 Timothy': '2Timothy',
  '1 Peter': '1Peter',
  '2 Peter': '2Peter',
  '1 John': '1John',
  '2 John': '2John',
  '3 John': '3John',
};

const BASE_URL = 'https://raw.githubusercontent.com/aruljohn/Bible-kjv/master';

async function fetchBook(bookName) {
  const ghName = GITHUB_NAME_MAP[bookName] || bookName;
  const url = `${BASE_URL}/${encodeURIComponent(ghName)}.json`;
  const res = await fetch(url);
  if (!res.ok) throw new Error(`HTTP ${res.status} for ${ghName}`);
  return res.json();
}

async function main() {
  console.log('=== KJV Text Fetcher & Merger ===\n');

  let totalVerses = 0;
  let enrichedChapters = 0;
  let kjvOnlyChapters = 0;

  for (const bookDef of BIBLE_BOOKS) {
    const slug = slugify(bookDef.name);
    const outPath = path.join(DATA_DIR, `${slug}.json`);

    // Load existing enriched JSON (from sql-to-json.cjs) if it exists
    let enriched = null;
    if (fs.existsSync(outPath)) {
      try { enriched = JSON.parse(fs.readFileSync(outPath, 'utf8')); }
      catch { enriched = null; }
    }

    // Fetch KJV text from GitHub
    let kjvData;
    try {
      kjvData = await fetchBook(bookDef.name);
    } catch (e) {
      console.error(`  ERROR fetching ${bookDef.name}: ${e.message}`);
      continue;
    }

    // Build merged result
    const result = {
      book: bookDef.name,
      testament: bookDef.testament,
      chapters: {}
    };

    let bookVerses = 0;
    for (const ch of kjvData.chapters) {
      const chNum = String(ch.chapter);

      if (enriched?.chapters?.[chNum]?.verses?.length > 0) {
        // Use enriched data (has study notes, Greek/Hebrew, etc.)
        result.chapters[chNum] = enriched.chapters[chNum];
        enrichedChapters++;
      } else {
        // KJV text only
        result.chapters[chNum] = {
          verses: ch.verses.map(v => ({
            verse_number: parseInt(v.verse),
            kjv_text: v.text
          }))
        };
        kjvOnlyChapters++;
      }

      bookVerses += (result.chapters[chNum].verses || []).length;
    }

    fs.writeFileSync(outPath, JSON.stringify(result));
    totalVerses += bookVerses;

    const enrichedCount = enriched ? Object.keys(enriched.chapters || {}).length : 0;
    const totalCh = Object.keys(result.chapters).length;
    const status = enrichedCount > 0 ? `${enrichedCount}/${totalCh} enriched` : 'KJV only';
    console.log(`  ${slug}.json — ${totalCh} chapters, ${bookVerses} verses (${status})`);
  }

  console.log(`\n=== Summary ===`);
  console.log(`${BIBLE_BOOKS.length} books written to public/data/`);
  console.log(`${totalVerses} total verses`);
  console.log(`${enrichedChapters} enriched chapters, ${kjvOnlyChapters} KJV-only chapters`);
  console.log('\nDone!');
}

main().catch(e => { console.error('Fatal error:', e); process.exit(1); });
