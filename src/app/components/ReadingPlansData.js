// ─── ReadingPlansData.js ─────────────────────────────────────────────────────
// All reading plan metadata, day-by-day readings, and helper functions.
// Extracted from ReadingPlans.js for maintainability.
// ─────────────────────────────────────────────────────────────────────────────

// ─── Difficulty badge colours (light + dark) ─────────────────────────────────
export const DIFF = {
  "Beginner":   { bg:"#D1FAE5", color:"#065F46", bgDark:"#065F4633", colorDark:"#4ADE80" },
  "Accessible": { bg:"#CCFBF1", color:"#0F766E", bgDark:"#0F766E33", colorDark:"#2DD4BF" },
  "Moderate":   { bg:"#FEF3C7", color:"#92400E", bgDark:"#92400E33", colorDark:"#FBBF24" },
  "Advanced":   { bg:"#FFE4E6", color:"#9F1239", bgDark:"#9F123933", colorDark:"#FB7185" },
};

// ─── Canonical chapter counts (KJV, 66 books, 1 189 chapters) ───────────────
export const BOOK_CHAPTERS = [
  { book:"Genesis",chapters:50 },{ book:"Exodus",chapters:40 },
  { book:"Leviticus",chapters:27 },{ book:"Numbers",chapters:36 },
  { book:"Deuteronomy",chapters:34 },{ book:"Joshua",chapters:24 },
  { book:"Judges",chapters:21 },{ book:"Ruth",chapters:4 },
  { book:"1 Samuel",chapters:31 },{ book:"2 Samuel",chapters:24 },
  { book:"1 Kings",chapters:22 },{ book:"2 Kings",chapters:25 },
  { book:"1 Chronicles",chapters:29 },{ book:"2 Chronicles",chapters:36 },
  { book:"Ezra",chapters:10 },{ book:"Nehemiah",chapters:13 },
  { book:"Esther",chapters:10 },{ book:"Job",chapters:42 },
  { book:"Psalms",chapters:150 },{ book:"Proverbs",chapters:31 },
  { book:"Ecclesiastes",chapters:12 },{ book:"Song of Solomon",chapters:8 },
  { book:"Isaiah",chapters:66 },{ book:"Jeremiah",chapters:52 },
  { book:"Lamentations",chapters:5 },{ book:"Ezekiel",chapters:48 },
  { book:"Daniel",chapters:12 },{ book:"Hosea",chapters:14 },
  { book:"Joel",chapters:3 },{ book:"Amos",chapters:9 },
  { book:"Obadiah",chapters:1 },{ book:"Jonah",chapters:4 },
  { book:"Micah",chapters:7 },{ book:"Nahum",chapters:3 },
  { book:"Habakkuk",chapters:3 },{ book:"Zephaniah",chapters:3 },
  { book:"Haggai",chapters:2 },{ book:"Zechariah",chapters:14 },
  { book:"Malachi",chapters:4 },
  { book:"Matthew",chapters:28 },{ book:"Mark",chapters:16 },
  { book:"Luke",chapters:24 },{ book:"John",chapters:21 },
  { book:"Acts",chapters:28 },{ book:"Romans",chapters:16 },
  { book:"1 Corinthians",chapters:16 },{ book:"2 Corinthians",chapters:13 },
  { book:"Galatians",chapters:6 },{ book:"Ephesians",chapters:6 },
  { book:"Philippians",chapters:4 },{ book:"Colossians",chapters:4 },
  { book:"1 Thessalonians",chapters:5 },{ book:"2 Thessalonians",chapters:3 },
  { book:"1 Timothy",chapters:6 },{ book:"2 Timothy",chapters:4 },
  { book:"Titus",chapters:3 },{ book:"Philemon",chapters:1 },
  { book:"Hebrews",chapters:13 },{ book:"James",chapters:5 },
  { book:"1 Peter",chapters:5 },{ book:"2 Peter",chapters:3 },
  { book:"1 John",chapters:5 },{ book:"2 John",chapters:1 },
  { book:"3 John",chapters:1 },{ book:"Jude",chapters:1 },
  { book:"Revelation",chapters:22 },
];

const NT_BOOKS = BOOK_CHAPTERS.slice(39);

// ─── Plan metadata ──────────────────────────────────────────────────────────
// `chapters` is computed dynamically after readings are built — see bottom.
export const READING_PLANS = [
  {
    id:"bible-in-a-year", title:"Bible in a Year",
    subtitle:"From Genesis to Revelation in 365 days",
    duration:"365 days", dailyTime:"~15 min/day", difficulty:"Moderate",
    description:"Read through the entire KJV Bible in one year. Each day combines Old Testament narrative, Psalms/Proverbs, and New Testament — so you always have variety and never get stuck in one section for weeks.",
    structure:"3 readings per day: OT passage + Psalm/Proverb + NT passage",
    color:"#B8860B", icon:"\uD83D\uDCC5", shelf:"full", chapters:0,
    whatYoullRead:["Old Testament: Genesis \u2192 Malachi","New Testament: Matthew \u2192 Revelation","A Psalm or Proverb woven in each day","You finish the entire Word of God in 12 months"],
  },
  {
    id:"chronological", title:"Chronological Bible",
    subtitle:"Scripture in the order events happened",
    duration:"365 days", dailyTime:"~15 min/day", difficulty:"Moderate",
    description:"Instead of Genesis to Revelation, this plan rearranges the Bible in historical sequence. Job appears alongside Genesis, the Psalms are read during David\u2019s reign, and the Prophets sit inside the history they were speaking into.",
    structure:"~3 chapters/day, historically sequenced across all 66 books",
    color:"#7C5C2E", icon:"\uD83D\uDCC6", shelf:"full", chapters:0,
    whatYoullRead:["Creation & Patriarchs: Genesis, Job woven together","The Exodus: Exodus through Deuteronomy","Conquest & Judges: Joshua, Judges, Ruth","United Kingdom: Samuel, Kings, Psalms of David, Proverbs","Divided Kingdom & Exile: Isaiah, Jeremiah, the Prophets","New Testament in historical order"],
  },
  {
    id:"mcheyne", title:"M\u2019Cheyne Plan",
    subtitle:"4 chapters a day \u2014 the classic Scottish devotional",
    duration:"365 days", dailyTime:"~20 min/day", difficulty:"Advanced",
    description:"Designed by Robert Murray M\u2019Cheyne in 1842, this plan reads through the New Testament and Psalms twice, and the Old Testament once, in a year. Four readings each day \u2014 morning and evening, family and personal. Generations of believers have been formed by it.",
    structure:"4 readings/day: 2 OT + 2 NT/Psalms passages",
    color:"#4B3F72", icon:"\uD83D\uDD22", shelf:"full", chapters:0,
    whatYoullRead:["Old Testament once: Genesis to Malachi","New Testament twice: Matthew to Revelation","Psalms twice \u2014 all 150","Family track: OT narrative + Gospels","Personal track: Psalms + Epistles"],
  },
  {
    id:"nt-90", title:"New Testament in 90 Days",
    subtitle:"The Gospels, letters, and Revelation",
    duration:"90 days", dailyTime:"~10 min/day", difficulty:"Accessible",
    description:"A focused, achievable journey through the 27 books of the New Testament. Perfect for new believers, or anyone wanting to ground themselves in the life of Christ and the early church before tackling the full Bible.",
    structure:"~3 chapters/day through Matthew \u2192 Revelation",
    color:"#1B7A6E", icon:"\uD83D\uDCD6", shelf:"nt", chapters:0,
    whatYoullRead:["The four Gospels: Matthew, Mark, Luke, John","Acts \u2014 the birth of the church","Paul\u2019s letters: Romans \u2192 Philemon","General Epistles: Hebrews \u2192 Jude","Revelation"],
  },
  {
    id:"life-of-jesus", title:"The Life of Jesus",
    subtitle:"30 days through all four Gospels",
    duration:"30 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"Walk through the life of Christ in a single month \u2014 from the eternal Word of John 1, through the Sermon on the Mount, the miracles, the upper room, the cross, and the resurrection. Each day is a focused passage, not a marathon.",
    structure:"Harmonised daily passages from Matthew, Mark, Luke, John",
    color:"#7C3AED", icon:"\uD83D\uDD4A\uFE0F", shelf:"nt", chapters:0,
    whatYoullRead:["Day 1\u20135: Birth and early ministry","Day 6\u201312: Sermon on the Mount and miracles","Day 13\u201320: Parables and Jerusalem","Day 21\u201326: The upper room and the cross","Day 27\u201330: Resurrection and Great Commission"],
  },
  {
    id:"holy-week", title:"Holy Week",
    subtitle:"The Passion across all four Gospels",
    duration:"7 days", dailyTime:"~15 min/day", difficulty:"Accessible",
    description:"Seven days. Four Gospels. One week that changed everything. From the triumphal entry into Jerusalem to the empty tomb, day by day \u2014 his words, his silences, his death, and his resurrection.",
    structure:"Daily harmonised readings from Matthew, Mark, Luke, and John",
    color:"#991B1B", icon:"\u271D\uFE0F", shelf:"nt", chapters:0,
    whatYoullRead:["Day 1 \u2014 Palm Sunday: The triumphal entry","Day 2\u20133: Temple teaching, Olivet discourse","Day 4: The anointing at Bethany","Day 5 \u2014 Thursday: Last Supper, Gethsemane (John 13\u201317)","Day 6 \u2014 Good Friday: Trials, crucifixion, burial","Day 7 \u2014 Easter: The empty tomb"],
  },
  {
    id:"torah", title:"The Torah \u2014 40 Days",
    subtitle:"Five books of Moses: the foundation",
    duration:"40 days", dailyTime:"~12 min/day", difficulty:"Moderate",
    description:"Genesis through Deuteronomy \u2014 the Torah is the root of the entire Bible. Every covenant, every type and shadow, every story of redemption in the New Testament has its seeds here.",
    structure:"~4 chapters/day, Genesis through Deuteronomy",
    color:"#B45309", icon:"\uD83D\uDCDC", shelf:"ot", chapters:0,
    whatYoullRead:["Genesis: Creation, Fall, Flood, the Patriarchs","Exodus: Passover, Sinai, the Tabernacle","Leviticus: Holiness, sacrifice, the priesthood","Numbers: Wilderness, rebellion, God\u2019s faithfulness","Deuteronomy: Moses\u2019 farewell \u2014 the covenant renewed"],
  },
  {
    id:"historical-books", title:"The Historical Books",
    subtitle:"Joshua to Esther: Israel in the land",
    duration:"60 days", dailyTime:"~10 min/day", difficulty:"Moderate",
    description:"From the conquest of Canaan to the courts of Persia, the Historical Books trace Israel\u2019s rise, glory, collapse, and survival. The story of a God who keeps his promises even when his people do not.",
    structure:"~3 chapters/day through Joshua to Esther",
    color:"#92400E", icon:"\u2694\uFE0F", shelf:"ot", chapters:0,
    whatYoullRead:["Joshua: The Promised Land entered","Judges & Ruth: Sin, judgment, redemption","1\u20132 Samuel: Saul, David, and the kingdom","1\u20132 Kings: Solomon, division, exile","Ezra, Nehemiah, Esther: Return and rebuilding"],
  },
  {
    id:"psalms-proverbs", title:"Psalms & Proverbs",
    subtitle:"Worship and wisdom for every season",
    duration:"60 days", dailyTime:"~7 min/day", difficulty:"Beginner",
    description:"The two great wisdom books of the Old Testament. Psalms teaches us how to pray \u2014 in joy, grief, fear, and praise. Proverbs teaches us how to live \u2014 with integrity, diligence, and the fear of the LORD.",
    structure:"2\u20133 Psalms per day + 1 Proverbs chapter",
    color:"#D97706", icon:"\uD83C\uDF1F", shelf:"ot", chapters:0,
    whatYoullRead:["All 150 Psalms \u2014 lament, praise, trust, triumph","All 31 chapters of Proverbs","Morning Psalms for worship, evening Proverbs for reflection","A complete picture of Israel\u2019s devotional life"],
  },
  {
    id:"epistles", title:"The Epistles",
    subtitle:"Paul\u2019s letters and the General Epistles",
    duration:"45 days", dailyTime:"~10 min/day", difficulty:"Moderate",
    description:"Romans through Jude \u2014 the letters that built the church. Paul, Peter, James, John, and Jude wrote to real communities facing real struggles. Their words are as urgent today.",
    structure:"1\u20132 letters per week, chapter-by-chapter",
    color:"#0369A1", icon:"\u2709\uFE0F", shelf:"ep", chapters:0,
    whatYoullRead:["Week 1\u20132: Romans & Galatians \u2014 justification by faith","Week 3: Ephesians, Philippians, Colossians","Week 4: Thessalonians, Timothy, Titus","Week 5\u20136: Hebrews, James, Peter, John, Jude"],
  },
  {
    id:"prophets", title:"The Prophets",
    subtitle:"Isaiah to Malachi \u2014 the voice of God",
    duration:"90 days", dailyTime:"~12 min/day", difficulty:"Advanced",
    description:"The 17 prophetic books are the most underread section of the Bible \u2014 and the most quoted by Jesus and the New Testament. Major and minor prophets paired week by week.",
    structure:"Major prophet + paired minor prophet per week",
    color:"#9F1239", icon:"\uD83D\uDD25", shelf:"ep", chapters:0,
    whatYoullRead:["Isaiah \u2014 the gospel before the gospel","Jeremiah & Lamentations \u2014 weeping with the prophet","Ezekiel \u2014 visions, judgment, the dry bones","Daniel \u2014 God\u2019s sovereignty over empires","The Twelve: Hosea through Malachi"],
  },
  {
    id:"storyline", title:"The Bible Storyline",
    subtitle:"The one story of Scripture in 21 days",
    duration:"21 days", dailyTime:"~12 min/day", difficulty:"Accessible",
    description:"Not every chapter \u2014 the spine of the whole story. From creation to fall, Abraham to Moses, David to exile, exile to Christ, cross to resurrection, church to new creation.",
    structure:"3 passages/day \u2014 OT narrative, Psalm, NT echo",
    color:"#065F46", icon:"\uD83C\uDF3F", shelf:"thematic", chapters:0,
    whatYoullRead:["Day 1\u20133: Creation, Fall, Flood, Abraham","Day 4\u20137: Exodus, Law, Promised Land","Day 8\u201311: David, Solomon, the divided kingdom","Day 12\u201314: Exile and the cry for return","Day 15\u201318: The Gospels \u2014 the King arrives","Day 19\u201321: Church, letters, new creation"],
  },
  {
    id:"sermon-on-the-mount", title:"Sermon on the Mount",
    subtitle:"Matthew 5\u20137: manifesto of the Kingdom",
    duration:"7 days", dailyTime:"~10 min/day", difficulty:"Beginner",
    description:"The greatest sermon ever preached. In seven days, read it slowly \u2014 the Beatitudes, the Lord\u2019s Prayer, the Golden Rule, the narrow gate. These words are meant to be lived, not just admired.",
    structure:"Matthew 5\u20137, one section per day",
    color:"#0284C7", icon:"\uD83C\uDF05", shelf:"thematic", chapters:0,
    whatYoullRead:["Day 1: The Beatitudes","Day 2: Salt, light, and the Law fulfilled","Day 3: Giving, prayer, the Lord\u2019s Prayer","Day 4: Fasting, treasure, the eye as lamp","Day 5\u20136: Judging, the Golden Rule, the narrow gate","Day 7: The two builders"],
  },
  {
    id:"prophecy-fulfilment", title:"Prophecy & Fulfilment",
    subtitle:"The Messianic thread: Eden to the tomb",
    duration:"30 days", dailyTime:"~10 min/day", difficulty:"Accessible",
    description:"One unified story, one hero. Each day pairs an Old Testament prophecy with its New Testament fulfilment \u2014 showing that Jesus did not appear by accident but was always the one who was coming.",
    structure:"Daily OT prophecy + NT fulfilment passage",
    color:"#B91C1C", icon:"\uD83D\uDD2E", shelf:"thematic", chapters:0,
    whatYoullRead:["Week 1: The seed of woman, Abraham\u2019s blessing, Judah\u2019s sceptre","Week 2: The Prophet like Moses, Isaiah\u2019s suffering servant","Week 3: Son of David, the new covenant (Jeremiah 31)","Week 4: Triumphal entry, betrayal for 30 pieces of silver","Psalms of the cross: Psalm 22 & 69 alongside the crucifixion"],
  },
  {
    id:"prayers-of-the-bible", title:"Prayers of the Bible",
    subtitle:"Learn to pray with the saints",
    duration:"21 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"The Bible is full of people who prayed \u2014 and the Holy Spirit preserved their prayers for us. Abraham, Moses, Hannah, David, Daniel, Jesus, Paul \u2014 each one a school of prayer.",
    structure:"One great biblical prayer per day, with its context",
    color:"#047857", icon:"\uD83D\uDE4F", shelf:"thematic", chapters:0,
    whatYoullRead:["OT saints: Abraham, Moses, Hannah, Solomon, Daniel, Nehemiah","Psalms as prayer: lament (22), confession (51), praise (103)","Jesus praying: Gethsemane, the High Priestly Prayer (John 17)","Apostolic prayers: Paul for Ephesians, the church in Acts 4","The final prayer: \u2018Even so, come, Lord Jesus\u2019 (Rev 22:20)"],
  },
  {
    id:"advent", title:"Advent \u2014 25 Days",
    subtitle:"From the first promise to the manger",
    duration:"25 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"A journey through the great Messianic promises of the Old Testament and their fulfilment in the birth of Christ. From Isaiah 7 to Luke 1, from Micah 5 to Matthew 2. Beautiful any time of year.",
    structure:"Daily OT prophecy + NT fulfilment passage",
    color:"#6D28D9", icon:"\uD83D\uDD6F\uFE0F", shelf:"thematic", chapters:0,
    whatYoullRead:["Day 1\u20135: Genesis 3:15, Isaiah 9 & 11, Micah 5","Day 6\u201310: Ruth, Samuel, the Psalms of the King","Day 11\u201315: Isaiah 40, 42, 53, 61; Zechariah 9","Day 16\u201320: Luke 1, Matthew 1, the Magnificat","Day 21\u201325: Luke 2, Matthew 2, John 1:1\u201318"],
  },
];

// ─── Shelf groupings ────────────────────────────────────────────────────────
export const SHELVES = [
  { id:"full",     label:"Full Bible & Chronological",  emoji:"\uD83D\uDCDA" },
  { id:"nt",       label:"New Testament & Gospels",     emoji:"\u2728" },
  { id:"ot",       label:"Old Testament & Wisdom",      emoji:"\uD83C\uDFDB\uFE0F" },
  { id:"ep",       label:"Epistles & Prophets",         emoji:"\uD83D\uDCDC" },
  { id:"thematic", label:"Thematic & Seasonal",         emoji:"\uD83C\uDF3F" },
];

// ─── Reading generation ─────────────────────────────────────────────────────

/**
 * Distributes a book sequence across exactly `targetDays` days.
 * Supports `startChapter` for split-book entries (e.g. chronological plan).
 */
function generateTargetDayReadings(bookSequence, targetDays) {
  const allPassages = [];
  for (const { book, chapters, startChapter = 1 } of bookSequence) {
    for (let ch = startChapter; ch < startChapter + chapters; ch++) {
      allPassages.push({ book, chapter: ch });
    }
  }
  const total = allPassages.length;
  const readings = [];
  let prevEnd = 0;
  for (let day = 1; day <= targetDays; day++) {
    const end = Math.round((day / targetDays) * total);
    if (end > prevEnd) {
      readings.push({ day, label: `Day ${day}`, passages: allPassages.slice(prevEnd, end) });
      prevEnd = end;
    }
  }
  return readings;
}

// ─── Chronological sequence (with startChapter offsets) ─────────────────────
const CHRON_SEQUENCE = [
  { book:"Genesis", chapters:11 },
  { book:"Job", chapters:42 },
  { book:"Genesis", chapters:39, startChapter:12 },
  { book:"Exodus", chapters:40 },{ book:"Leviticus", chapters:27 },
  { book:"Numbers", chapters:36 },{ book:"Deuteronomy", chapters:34 },
  { book:"Joshua", chapters:24 },{ book:"Judges", chapters:21 },
  { book:"Ruth", chapters:4 },{ book:"1 Samuel", chapters:31 },
  { book:"Psalms", chapters:41 },
  { book:"2 Samuel", chapters:24 },
  { book:"Psalms", chapters:31, startChapter:42 },
  { book:"Proverbs", chapters:31 },{ book:"Ecclesiastes", chapters:12 },
  { book:"Song of Solomon", chapters:8 },
  { book:"1 Kings", chapters:11 },
  { book:"Psalms", chapters:48, startChapter:73 },
  { book:"1 Kings", chapters:11, startChapter:12 },
  { book:"2 Kings", chapters:25 },
  { book:"1 Chronicles", chapters:29 },{ book:"2 Chronicles", chapters:36 },
  { book:"Psalms", chapters:30, startChapter:121 },
  { book:"Isaiah", chapters:66 },{ book:"Jeremiah", chapters:52 },
  { book:"Lamentations", chapters:5 },{ book:"Ezekiel", chapters:48 },
  { book:"Daniel", chapters:12 },{ book:"Hosea", chapters:14 },
  { book:"Joel", chapters:3 },{ book:"Amos", chapters:9 },
  { book:"Obadiah", chapters:1 },{ book:"Jonah", chapters:4 },
  { book:"Micah", chapters:7 },{ book:"Nahum", chapters:3 },
  { book:"Habakkuk", chapters:3 },{ book:"Zephaniah", chapters:3 },
  { book:"Ezra", chapters:10 },{ book:"Nehemiah", chapters:13 },
  { book:"Esther", chapters:10 },{ book:"Haggai", chapters:2 },
  { book:"Zechariah", chapters:14 },{ book:"Malachi", chapters:4 },
  ...NT_BOOKS,
];

// ─── M'Cheyne 4-track plan ─────────────────────────────────────────────────
// Track 1 (Family AM): Genesis → 2 Chronicles  (OT history)
// Track 2 (Family PM): Matthew → Revelation     (full NT)
// Track 3 (Personal AM): Ezra → Song of Solomon + Isaiah → Malachi (OT wisdom + prophets)
// Track 4 (Personal PM): Psalms ×2 + Romans → Revelation (devotion + epistles)
function generateMcheyneReadings() {
  const track1Books = BOOK_CHAPTERS.slice(0, 14);  // Genesis → 2 Chronicles
  const track2Books = NT_BOOKS;                     // Matthew → Revelation
  const track3Books = [
    ...BOOK_CHAPTERS.slice(14, 22),                 // Ezra → Song of Solomon
    ...BOOK_CHAPTERS.slice(22, 39),                 // Isaiah → Malachi
  ];
  const track4Books = [
    { book:"Psalms", chapters:150 },
    { book:"Psalms", chapters:150 },                // Psalms twice
    ...BOOK_CHAPTERS.slice(44, 66),                 // Romans → Revelation
  ];

  const t1 = generateTargetDayReadings(track1Books, 365);
  const t2 = generateTargetDayReadings(track2Books, 365);
  const t3 = generateTargetDayReadings(track3Books, 365);
  const t4 = generateTargetDayReadings(track4Books, 365);

  return Array.from({ length: 365 }, (_, i) => ({
    day: i + 1,
    label: `Day ${i + 1}`,
    passages: [
      ...(t1[i]?.passages || []).map(p => ({ ...p, track:"Family AM" })),
      ...(t2[i]?.passages || []).map(p => ({ ...p, track:"Family PM" })),
      ...(t3[i]?.passages || []).map(p => ({ ...p, track:"Personal AM" })),
      ...(t4[i]?.passages || []).map(p => ({ ...p, track:"Personal PM" })),
    ],
  }));
}

// ─── Hand-curated readings ──────────────────────────────────────────────────

const LIFE_OF_JESUS_READINGS = [
  { day:1,  label:"Day 1",  passages:[{ book:"John", chapter:1 },{ book:"Luke", chapter:1 }] },
  { day:2,  label:"Day 2",  passages:[{ book:"Luke", chapter:2 },{ book:"Matthew", chapter:2 }] },
  { day:3,  label:"Day 3",  passages:[{ book:"Luke", chapter:3 },{ book:"Matthew", chapter:3 }] },
  { day:4,  label:"Day 4",  passages:[{ book:"Matthew", chapter:4 },{ book:"Luke", chapter:4 }] },
  { day:5,  label:"Day 5",  passages:[{ book:"John", chapter:2 },{ book:"John", chapter:3 }] },
  { day:6,  label:"Day 6",  passages:[{ book:"Matthew", chapter:5 }] },
  { day:7,  label:"Day 7",  passages:[{ book:"Matthew", chapter:6 }] },
  { day:8,  label:"Day 8",  passages:[{ book:"Matthew", chapter:7 },{ book:"Luke", chapter:7 }] },
  { day:9,  label:"Day 9",  passages:[{ book:"Mark", chapter:4 },{ book:"Matthew", chapter:13 }] },
  { day:10, label:"Day 10", passages:[{ book:"Mark", chapter:5 },{ book:"Luke", chapter:8 }] },
  { day:11, label:"Day 11", passages:[{ book:"Mark", chapter:6 },{ book:"John", chapter:6 }] },
  { day:12, label:"Day 12", passages:[{ book:"Matthew", chapter:14 },{ book:"Mark", chapter:7 }] },
  { day:13, label:"Day 13", passages:[{ book:"Luke", chapter:10 },{ book:"Luke", chapter:11 }] },
  { day:14, label:"Day 14", passages:[{ book:"John", chapter:10 },{ book:"Luke", chapter:15 }] },
  { day:15, label:"Day 15", passages:[{ book:"Luke", chapter:16 },{ book:"John", chapter:11 }] },
  { day:16, label:"Day 16", passages:[{ book:"Matthew", chapter:19 },{ book:"Luke", chapter:18 }] },
  { day:17, label:"Day 17", passages:[{ book:"Luke", chapter:19 },{ book:"Matthew", chapter:21 }] },
  { day:18, label:"Day 18", passages:[{ book:"Matthew", chapter:22 },{ book:"Mark", chapter:12 }] },
  { day:19, label:"Day 19", passages:[{ book:"Matthew", chapter:24 },{ book:"Matthew", chapter:25 }] },
  { day:20, label:"Day 20", passages:[{ book:"John", chapter:12 },{ book:"Mark", chapter:14 }] },
  { day:21, label:"Day 21", passages:[{ book:"John", chapter:13 },{ book:"John", chapter:14 }] },
  { day:22, label:"Day 22", passages:[{ book:"John", chapter:15 },{ book:"John", chapter:16 }] },
  { day:23, label:"Day 23", passages:[{ book:"John", chapter:17 },{ book:"Matthew", chapter:26 }] },
  { day:24, label:"Day 24", passages:[{ book:"Luke", chapter:22 },{ book:"John", chapter:18 }] },
  { day:25, label:"Day 25", passages:[{ book:"Matthew", chapter:27 },{ book:"Mark", chapter:15 }] },
  { day:26, label:"Day 26", passages:[{ book:"Luke", chapter:23 },{ book:"John", chapter:19 }] },
  { day:27, label:"Day 27", passages:[{ book:"Matthew", chapter:28 },{ book:"Mark", chapter:16 }] },
  { day:28, label:"Day 28", passages:[{ book:"Luke", chapter:24 },{ book:"John", chapter:20 }] },
  { day:29, label:"Day 29", passages:[{ book:"John", chapter:21 },{ book:"Acts", chapter:1 }] },
  { day:30, label:"Day 30", passages:[{ book:"Acts", chapter:2 },{ book:"Revelation", chapter:1 }] },
];

const HOLY_WEEK_READINGS = [
  { day:1, label:"Palm Sunday",  passages:[{ book:"Matthew", chapter:21 },{ book:"John", chapter:12 }] },
  { day:2, label:"Monday",       passages:[{ book:"Mark", chapter:11 },{ book:"Luke", chapter:19 }] },
  { day:3, label:"Tuesday",      passages:[{ book:"Matthew", chapter:24 },{ book:"Matthew", chapter:25 }] },
  { day:4, label:"Wednesday",    passages:[{ book:"Matthew", chapter:26 },{ book:"Mark", chapter:14 }] },
  { day:5, label:"Thursday",     passages:[{ book:"John", chapter:13 },{ book:"John", chapter:14 },{ book:"John", chapter:17 }] },
  { day:6, label:"Good Friday",  passages:[{ book:"John", chapter:18 },{ book:"John", chapter:19 }] },
  { day:7, label:"Easter",       passages:[{ book:"John", chapter:20 },{ book:"Luke", chapter:24 }] },
];

const SERMON_READINGS = [
  { day:1, label:"The Beatitudes",            passages:[{ book:"Matthew", chapter:5, verseRange:"1\u201316" }] },
  { day:2, label:"Salt, Light & the Law",     passages:[{ book:"Matthew", chapter:5, verseRange:"17\u201348" }] },
  { day:3, label:"Prayer & Fasting",          passages:[{ book:"Matthew", chapter:6, verseRange:"1\u201318" }] },
  { day:4, label:"Treasure & Anxiety",        passages:[{ book:"Matthew", chapter:6, verseRange:"19\u201334" }] },
  { day:5, label:"Judging & Asking",          passages:[{ book:"Matthew", chapter:7, verseRange:"1\u201312" }] },
  { day:6, label:"The Narrow Gate",           passages:[{ book:"Matthew", chapter:7, verseRange:"13\u201323" }] },
  { day:7, label:"The Two Builders",          passages:[{ book:"Matthew", chapter:7, verseRange:"24\u201329" }] },
];

const STORYLINE_READINGS = [
  { day:1,  label:"Creation",           passages:[{ book:"Genesis", chapter:1 },{ book:"Genesis", chapter:2 }] },
  { day:2,  label:"The Fall",           passages:[{ book:"Genesis", chapter:3 },{ book:"Psalms", chapter:8 }] },
  { day:3,  label:"Flood & Babel",      passages:[{ book:"Genesis", chapter:6 },{ book:"Genesis", chapter:11 }] },
  { day:4,  label:"Call of Abraham",    passages:[{ book:"Genesis", chapter:12 },{ book:"Genesis", chapter:15 }] },
  { day:5,  label:"The Promise",        passages:[{ book:"Genesis", chapter:17 },{ book:"Genesis", chapter:22 }] },
  { day:6,  label:"Jacob & Joseph",     passages:[{ book:"Genesis", chapter:28 },{ book:"Genesis", chapter:37 }] },
  { day:7,  label:"The Exodus",         passages:[{ book:"Exodus", chapter:3 },{ book:"Exodus", chapter:12 }] },
  { day:8,  label:"Sinai & the Law",    passages:[{ book:"Exodus", chapter:19 },{ book:"Exodus", chapter:20 }] },
  { day:9,  label:"The Tabernacle",     passages:[{ book:"Exodus", chapter:25 },{ book:"Exodus", chapter:40 }] },
  { day:10, label:"Into the Land",      passages:[{ book:"Joshua", chapter:1 },{ book:"Joshua", chapter:6 }] },
  { day:11, label:"King David",         passages:[{ book:"2 Samuel", chapter:7 },{ book:"Psalms", chapter:23 }] },
  { day:12, label:"Solomon\u2019s Temple",   passages:[{ book:"1 Kings", chapter:8 },{ book:"Proverbs", chapter:1 }] },
  { day:13, label:"Division & Decline", passages:[{ book:"1 Kings", chapter:12 },{ book:"Amos", chapter:5 }] },
  { day:14, label:"Exile",              passages:[{ book:"2 Kings", chapter:25 },{ book:"Psalms", chapter:137 }] },
  { day:15, label:"Isaiah\u2019s Hope",      passages:[{ book:"Isaiah", chapter:40 },{ book:"Isaiah", chapter:53 }] },
  { day:16, label:"New Covenant",       passages:[{ book:"Jeremiah", chapter:31 },{ book:"Ezekiel", chapter:37 }] },
  { day:17, label:"Return",             passages:[{ book:"Ezra", chapter:1 },{ book:"Nehemiah", chapter:8 }] },
  { day:18, label:"The King Arrives",   passages:[{ book:"Luke", chapter:1 },{ book:"John", chapter:1 }] },
  { day:19, label:"Kingdom Teachings",  passages:[{ book:"Matthew", chapter:5 },{ book:"Luke", chapter:15 }] },
  { day:20, label:"Cross & Risen",      passages:[{ book:"John", chapter:19 },{ book:"John", chapter:20 }] },
  { day:21, label:"New Creation",       passages:[{ book:"Romans", chapter:8 },{ book:"Revelation", chapter:21 }] },
];

const PROPHECY_READINGS = [
  { day:1,  label:"The First Promise",      passages:[{ book:"Genesis", chapter:3 }] },
  { day:2,  label:"Abraham\u2019s Blessing",     passages:[{ book:"Genesis", chapter:12 },{ book:"Galatians", chapter:3 }] },
  { day:3,  label:"The Sceptre of Judah",   passages:[{ book:"Genesis", chapter:49 },{ book:"Revelation", chapter:5 }] },
  { day:4,  label:"The Passover Lamb",      passages:[{ book:"Exodus", chapter:12 },{ book:"John", chapter:1 }] },
  { day:5,  label:"The Prophet like Moses", passages:[{ book:"Deuteronomy", chapter:18 },{ book:"Acts", chapter:3 }] },
  { day:6,  label:"The Lord\u2019s Anointed",    passages:[{ book:"Psalms", chapter:2 },{ book:"Acts", chapter:13 }] },
  { day:7,  label:"Psalm 22 \u2014 The Cross",   passages:[{ book:"Psalms", chapter:22 },{ book:"Matthew", chapter:27 }] },
  { day:8,  label:"The Eternal King",       passages:[{ book:"2 Samuel", chapter:7 },{ book:"Luke", chapter:1 }] },
  { day:9,  label:"Isaiah\u2019s Immanuel",      passages:[{ book:"Isaiah", chapter:7 },{ book:"Matthew", chapter:1 }] },
  { day:10, label:"A Child is Born",        passages:[{ book:"Isaiah", chapter:9 },{ book:"Luke", chapter:2 }] },
  { day:11, label:"The Root of Jesse",      passages:[{ book:"Isaiah", chapter:11 },{ book:"Romans", chapter:15 }] },
  { day:12, label:"The Servant\u2019s Call",     passages:[{ book:"Isaiah", chapter:42 },{ book:"Matthew", chapter:12 }] },
  { day:13, label:"Isaiah 53",             passages:[{ book:"Isaiah", chapter:53 },{ book:"1 Peter", chapter:2 }] },
  { day:14, label:"The Year of Jubilee",    passages:[{ book:"Isaiah", chapter:61 },{ book:"Luke", chapter:4 }] },
  { day:15, label:"The New Covenant",       passages:[{ book:"Jeremiah", chapter:31 },{ book:"Hebrews", chapter:8 }] },
  { day:16, label:"The Dry Bones",          passages:[{ book:"Ezekiel", chapter:37 },{ book:"Romans", chapter:6 }] },
  { day:17, label:"Son of Man",             passages:[{ book:"Daniel", chapter:7 },{ book:"Matthew", chapter:26 }] },
  { day:18, label:"The Faithful Lover",     passages:[{ book:"Hosea", chapter:11 },{ book:"Matthew", chapter:2 }] },
  { day:19, label:"Pentecost Foretold",     passages:[{ book:"Joel", chapter:2 },{ book:"Acts", chapter:2 }] },
  { day:20, label:"The Shepherd Struck",    passages:[{ book:"Zechariah", chapter:13 },{ book:"Matthew", chapter:26 }] },
  { day:21, label:"Thirty Pieces of Silver",passages:[{ book:"Zechariah", chapter:11 },{ book:"Matthew", chapter:27 }] },
  { day:22, label:"They Shall Look",        passages:[{ book:"Zechariah", chapter:12 },{ book:"John", chapter:19 }] },
  { day:23, label:"The Messenger",          passages:[{ book:"Malachi", chapter:3 },{ book:"Luke", chapter:3 }] },
  { day:24, label:"Psalm 69",              passages:[{ book:"Psalms", chapter:69 },{ book:"John", chapter:2 }] },
  { day:25, label:"The Triumphal Entry",    passages:[{ book:"Zechariah", chapter:9 },{ book:"Matthew", chapter:21 }] },
  { day:26, label:"The Good Shepherd",      passages:[{ book:"Ezekiel", chapter:34 },{ book:"John", chapter:10 }] },
  { day:27, label:"The Stone Rejected",     passages:[{ book:"Psalms", chapter:118 },{ book:"Matthew", chapter:21 }] },
  { day:28, label:"Resurrection Hope",      passages:[{ book:"Psalms", chapter:16 },{ book:"Acts", chapter:2 }] },
  { day:29, label:"Exalted on High",        passages:[{ book:"Psalms", chapter:110 },{ book:"Hebrews", chapter:1 }] },
  { day:30, label:"All Things New",         passages:[{ book:"Isaiah", chapter:65 },{ book:"Revelation", chapter:21 }] },
];

const PRAYERS_READINGS = [
  { day:1,  label:"Abraham Intercedes",   passages:[{ book:"Genesis", chapter:18 }] },
  { day:2,  label:"Jacob Wrestles",       passages:[{ book:"Genesis", chapter:32 }] },
  { day:3,  label:"Moses at the Bush",    passages:[{ book:"Exodus", chapter:3 }] },
  { day:4,  label:"The Song of Moses",    passages:[{ book:"Exodus", chapter:15 }] },
  { day:5,  label:"Hannah\u2019s Vow",         passages:[{ book:"1 Samuel", chapter:1 }] },
  { day:6,  label:"Hannah\u2019s Song",        passages:[{ book:"1 Samuel", chapter:2 }] },
  { day:7,  label:"David\u2019s Lament",       passages:[{ book:"Psalms", chapter:22 }] },
  { day:8,  label:"David\u2019s Confession",   passages:[{ book:"Psalms", chapter:51 }] },
  { day:9,  label:"Praise of the Soul",   passages:[{ book:"Psalms", chapter:103 }] },
  { day:10, label:"Solomon\u2019s Dedication", passages:[{ book:"1 Kings", chapter:8 }] },
  { day:11, label:"Elijah\u2019s Prayer",      passages:[{ book:"1 Kings", chapter:18 }] },
  { day:12, label:"Hezekiah\u2019s Prayer",    passages:[{ book:"2 Kings", chapter:19 }] },
  { day:13, label:"Jonah\u2019s Prayer",       passages:[{ book:"Jonah", chapter:2 }] },
  { day:14, label:"Daniel\u2019s Confession",  passages:[{ book:"Daniel", chapter:9 }] },
  { day:15, label:"Nehemiah\u2019s Prayer",    passages:[{ book:"Nehemiah", chapter:1 }] },
  { day:16, label:"The Lord\u2019s Prayer",    passages:[{ book:"Matthew", chapter:6 }] },
  { day:17, label:"Gethsemane",          passages:[{ book:"Matthew", chapter:26 }] },
  { day:18, label:"The High Priestly Prayer",passages:[{ book:"John", chapter:17 }] },
  { day:19, label:"The Church Prays",     passages:[{ book:"Acts", chapter:4 }] },
  { day:20, label:"Paul for the Ephesians",passages:[{ book:"Ephesians", chapter:3 }] },
  { day:21, label:"Even So, Come",        passages:[{ book:"Revelation", chapter:22 }] },
];

const ADVENT_READINGS = [
  { day:1,  label:"The First Promise",    passages:[{ book:"Genesis", chapter:3 }] },
  { day:2,  label:"A Child is Born",      passages:[{ book:"Isaiah", chapter:9 }] },
  { day:3,  label:"The Root of Jesse",    passages:[{ book:"Isaiah", chapter:11 }] },
  { day:4,  label:"A King from Bethlehem",passages:[{ book:"Micah", chapter:5 }] },
  { day:5,  label:"The New Covenant",     passages:[{ book:"Jeremiah", chapter:31 }] },
  { day:6,  label:"Ruth & Redemption",    passages:[{ book:"Ruth", chapter:4 }] },
  { day:7,  label:"David Anointed",       passages:[{ book:"1 Samuel", chapter:16 }] },
  { day:8,  label:"The Eternal Throne",   passages:[{ book:"2 Samuel", chapter:7 }] },
  { day:9,  label:"The King\u2019s Psalm",     passages:[{ book:"Psalms", chapter:72 }] },
  { day:10, label:"Psalms of the King",   passages:[{ book:"Psalms", chapter:89 }] },
  { day:11, label:"Comfort My People",    passages:[{ book:"Isaiah", chapter:40 }] },
  { day:12, label:"The Chosen Servant",   passages:[{ book:"Isaiah", chapter:42 }] },
  { day:13, label:"The Suffering Servant",passages:[{ book:"Isaiah", chapter:53 }] },
  { day:14, label:"The Year of Jubilee",  passages:[{ book:"Isaiah", chapter:61 }] },
  { day:15, label:"The Triumphal Entry",  passages:[{ book:"Zechariah", chapter:9 }] },
  { day:16, label:"The Annunciation",     passages:[{ book:"Luke", chapter:1 }] },
  { day:17, label:"The Magnificat",       passages:[{ book:"Luke", chapter:1 }] },
  { day:18, label:"Joseph\u2019s Dream",       passages:[{ book:"Matthew", chapter:1 }] },
  { day:19, label:"The Genealogy of Grace",passages:[{ book:"Matthew", chapter:1 }] },
  { day:20, label:"Zechariah\u2019s Song",     passages:[{ book:"Luke", chapter:1 }] },
  { day:21, label:"The Birth of Jesus",   passages:[{ book:"Luke", chapter:2 }] },
  { day:22, label:"The Shepherds",        passages:[{ book:"Luke", chapter:2 }] },
  { day:23, label:"The Magi",             passages:[{ book:"Matthew", chapter:2 }] },
  { day:24, label:"Simeon & Anna",        passages:[{ book:"Luke", chapter:2 }] },
  { day:25, label:"The Word Made Flesh",  passages:[{ book:"John", chapter:1 }] },
];

// ─── Lazy-initialised readings map ──────────────────────────────────────────
let _planReadings = null;

export function getPlanReadings() {
  if (_planReadings) return _planReadings;
  _planReadings = {
    "bible-in-a-year":     generateTargetDayReadings(BOOK_CHAPTERS, 365),
    "chronological":       generateTargetDayReadings(CHRON_SEQUENCE, 365),
    "mcheyne":             generateMcheyneReadings(),
    "nt-90":               generateTargetDayReadings(NT_BOOKS, 90),
    "life-of-jesus":       LIFE_OF_JESUS_READINGS,
    "holy-week":           HOLY_WEEK_READINGS,
    "torah":               generateTargetDayReadings(BOOK_CHAPTERS.slice(0, 5), 40),
    "historical-books":    generateTargetDayReadings(BOOK_CHAPTERS.slice(5, 17), 60),
    "psalms-proverbs":     generateTargetDayReadings(
      [{ book:"Psalms", chapters:150 }, { book:"Proverbs", chapters:31 }], 60
    ),
    "epistles":            generateTargetDayReadings(BOOK_CHAPTERS.slice(44, 65), 45),
    "prophets":            generateTargetDayReadings(BOOK_CHAPTERS.slice(22, 39), 90),
    "storyline":           STORYLINE_READINGS,
    "sermon-on-the-mount": SERMON_READINGS,
    "prophecy-fulfilment": PROPHECY_READINGS,
    "prayers-of-the-bible":PRAYERS_READINGS,
    "advent":              ADVENT_READINGS,
  };

  // Compute chapter counts dynamically so metadata is always accurate
  for (const plan of READING_PLANS) {
    const readings = _planReadings[plan.id];
    if (readings) {
      plan.chapters = readings.reduce((sum, r) => sum + r.passages.length, 0);
    }
  }

  return _planReadings;
}

// ─── Progress helpers ───────────────────────────────────────────────────────

/**
 * Build the completion key for a passage within a day.
 * Format: "day:Book|chapter" — day-scoped to avoid collisions when
 * the same chapter appears on multiple days (e.g. Sermon on the Mount).
 */
export function completionKey(day, book, chapter) {
  return `${day}:${book}|${chapter}`;
}

export function countCompletedDays(planId, completedSet) {
  const readings = getPlanReadings()[planId];
  if (!readings) return 0;
  return readings.filter(r =>
    r.passages.every(p => completedSet.has(completionKey(r.day, p.book, p.chapter)))
  ).length;
}

/**
 * One-time migration from old "Book|Ch" keys to new "day:Book|Ch" keys.
 * Returns mutated data (or original if no migration needed).
 */
export function migratePlanData(data) {
  if (!data || data._v >= 2) return data;
  let needsMigration = false;
  for (const planId of Object.keys(data)) {
    if (planId.startsWith("_")) continue;
    const chs = data[planId]?.completedChapters || [];
    if (chs.length > 0 && !chs[0].includes(":")) { needsMigration = true; break; }
  }
  if (!needsMigration) return data;

  const readings = getPlanReadings();
  const migrated = { ...data };
  for (const planId of Object.keys(migrated)) {
    if (planId.startsWith("_")) continue;
    const planReadings = readings[planId] || [];
    const oldSet = new Set(migrated[planId]?.completedChapters || []);
    const newChapters = [];
    for (const r of planReadings) {
      for (const p of r.passages) {
        if (oldSet.has(`${p.book}|${p.chapter}`)) {
          newChapters.push(completionKey(r.day, p.book, p.chapter));
        }
      }
    }
    migrated[planId] = { ...migrated[planId], completedChapters: newChapters };
  }
  migrated._v = 2;
  return migrated;
}

// ─── Streak & milestone helpers ─────────────────────────────────────────────

/** Milestone thresholds for share prompts */
export const MILESTONES = [7, 30, 100];
export const MILESTONE_PCTS = [25, 50, 75, 100];

/**
 * Compute reading plan streak: consecutive days with at least one completed day-entry,
 * walking backwards from today.
 */
export function getReadingStreak(planId, planData) {
  const entry = planData[planId];
  if (!entry?.startedAt || !entry.completedChapters?.length) return 0;

  const readings = getPlanReadings()[planId];
  if (!readings) return 0;

  const completedSet = new Set(entry.completedChapters);
  const startDate = new Date(entry.startedAt);
  startDate.setHours(0, 0, 0, 0);
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  // Build set of completed day numbers
  const completedDayNums = new Set();
  for (const r of readings) {
    if (r.passages.every(p => completedSet.has(completionKey(r.day, p.book, p.chapter)))) {
      completedDayNums.add(r.day);
    }
  }

  // Walk backwards from current day number
  const daysSinceStart = Math.floor((today - startDate) / 86400000);
  const currentDayNum = Math.min(daysSinceStart + 1, readings.length);
  let streak = 0;
  for (let d = currentDayNum; d >= 1; d--) {
    if (completedDayNums.has(d)) streak++;
    else break;
  }
  return streak;
}

/**
 * Find the first incomplete day for a plan. Returns the reading entry or null.
 */
export function getNextReading(planId, planData) {
  const entry = planData[planId];
  if (!entry) return null;
  const readings = getPlanReadings()[planId];
  if (!readings) return null;
  const completedSet = new Set(entry.completedChapters || []);
  return readings.find(r =>
    !r.passages.every(p => completedSet.has(completionKey(r.day, p.book, p.chapter)))
  ) || null;
}
