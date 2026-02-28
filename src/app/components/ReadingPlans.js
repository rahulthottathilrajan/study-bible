"use client";
import { useState, useCallback } from "react";
import { supabase } from "@/app/lib/supabase";

// ─── Theme ────────────────────────────────────────────────────────────────────
const T = {
  bg:       "#F5EDD6",
  wall:     "#EDE0C4",
  wood:     "linear-gradient(180deg, #C8974E 0%, #A0733A 50%, #8B5E2A 100%)",
  woodEdge: "#6B4423",
  text:     "#2C1A0E",
  muted:    "#8B6239",
  cream:    "#FEF6E4",
  font:     "'Georgia', serif",
};

const DIFF = {
  "Beginner":   { bg: "#D1FAE5", color: "#065F46" },
  "Accessible": { bg: "#CCFBF1", color: "#0F766E" },
  "Moderate":   { bg: "#FEF3C7", color: "#92400E" },
  "Advanced":   { bg: "#FFE4E6", color: "#9F1239" },
};

function lightenHex(hex, amount = 30) {
  const num = parseInt(hex.replace("#",""), 16);
  const r = Math.min(255, (num >> 16) + amount);
  const g = Math.min(255, ((num >> 8) & 0xff) + amount);
  const b = Math.min(255, (num & 0xff) + amount);
  return "#" + ((r << 16) | (g << 8) | b).toString(16).padStart(6, "0");
}

// ─── Plans Data ───────────────────────────────────────────────────────────────
const READING_PLANS = [
  {
    id:"bible-in-a-year", title:"Bible in a Year",
    subtitle:"From Genesis to Revelation in 365 days",
    duration:"365 days", dailyTime:"~15 min/day", difficulty:"Moderate",
    description:"Read through the entire KJV Bible in one year. Each day combines Old Testament narrative, Psalms/Proverbs, and New Testament — so you always have variety and never get stuck in one section for weeks.",
    structure:"3 readings per day: OT passage + Psalm/Proverb + NT passage",
    color:"#B8860B", icon:"📅", shelf:"full", chapters:1189,
    whatYoullRead:["Old Testament: Genesis → Malachi","New Testament: Matthew → Revelation","A Psalm or Proverb woven in each day","You finish the entire Word of God in 12 months"],
  },
  {
    id:"chronological", title:"Chronological Bible",
    subtitle:"Scripture in the order events happened",
    duration:"365 days", dailyTime:"~15 min/day", difficulty:"Moderate",
    description:"Instead of Genesis to Revelation, this plan rearranges the Bible in historical sequence. Job appears alongside Genesis, the Psalms are read during David's reign, and the Prophets sit inside the history they were speaking into.",
    structure:"~3 chapters/day, historically sequenced across all 66 books",
    color:"#7C5C2E", icon:"📆", shelf:"full", chapters:1189,
    whatYoullRead:["Creation & Patriarchs: Genesis, Job woven together","The Exodus: Exodus through Deuteronomy","Conquest & Judges: Joshua, Judges, Ruth","United Kingdom: Samuel, Kings, Psalms of David, Proverbs","Divided Kingdom & Exile: Isaiah, Jeremiah, the Prophets","New Testament in historical order"],
  },
  {
    id:"mcheyne", title:"M'Cheyne Plan",
    subtitle:"4 chapters a day — the classic Scottish devotional",
    duration:"365 days", dailyTime:"~20 min/day", difficulty:"Advanced",
    description:"Designed by Robert Murray M'Cheyne in 1842, this plan reads through the New Testament and Psalms twice, and the Old Testament once, in a year. Four readings each day — morning and evening, family and personal. Generations of believers have been formed by it.",
    structure:"4 readings/day: 2 OT + 2 NT/Psalms passages",
    color:"#4B3F72", icon:"🔢", shelf:"full", chapters:1189,
    whatYoullRead:["Old Testament once: Genesis to Malachi","New Testament twice: Matthew to Revelation","Psalms twice — all 150","Family track: OT narrative + Gospels","Personal track: Psalms + Epistles"],
  },
  {
    id:"nt-90", title:"New Testament in 90 Days",
    subtitle:"The Gospels, letters, and Revelation",
    duration:"90 days", dailyTime:"~10 min/day", difficulty:"Accessible",
    description:"A focused, achievable journey through the 27 books of the New Testament. Perfect for new believers, or anyone wanting to ground themselves in the life of Christ and the early church before tackling the full Bible.",
    structure:"~3 chapters/day through Matthew → Revelation",
    color:"#1B7A6E", icon:"📖", shelf:"nt", chapters:260,
    whatYoullRead:["The four Gospels: Matthew, Mark, Luke, John","Acts — the birth of the church","Paul's letters: Romans → Philemon","General Epistles: Hebrews → Jude","Revelation"],
  },
  {
    id:"life-of-jesus", title:"The Life of Jesus",
    subtitle:"30 days through all four Gospels",
    duration:"30 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"Walk through the life of Christ in a single month — from the eternal Word of John 1, through the Sermon on the Mount, the miracles, the upper room, the cross, and the resurrection. Each day is a focused passage, not a marathon.",
    structure:"Harmonised daily passages from Matthew, Mark, Luke, John",
    color:"#7C3AED", icon:"🕊️", shelf:"nt", chapters:89,
    whatYoullRead:["Day 1–5: Birth and early ministry","Day 6–12: Sermon on the Mount and miracles","Day 13–20: Parables and Jerusalem","Day 21–26: The upper room and the cross","Day 27–30: Resurrection and Great Commission"],
  },
  {
    id:"holy-week", title:"Holy Week",
    subtitle:"The Passion across all four Gospels",
    duration:"7 days", dailyTime:"~15 min/day", difficulty:"Accessible",
    description:"Seven days. Four Gospels. One week that changed everything. From the triumphal entry into Jerusalem to the empty tomb, day by day — his words, his silences, his death, and his resurrection.",
    structure:"Daily harmonised readings from Matthew, Mark, Luke, and John",
    color:"#991B1B", icon:"✝️", shelf:"nt", chapters:28,
    whatYoullRead:["Day 1 — Palm Sunday: The triumphal entry","Day 2–3: Temple teaching, Olivet discourse","Day 4: The anointing at Bethany","Day 5 — Thursday: Last Supper, Gethsemane (John 13–17)","Day 6 — Good Friday: Trials, crucifixion, burial","Day 7 — Easter: The empty tomb"],
  },
  {
    id:"torah", title:"The Torah — 40 Days",
    subtitle:"Five books of Moses: the foundation",
    duration:"40 days", dailyTime:"~12 min/day", difficulty:"Moderate",
    description:"Genesis through Deuteronomy — the Torah is the root of the entire Bible. Every covenant, every type and shadow, every story of redemption in the New Testament has its seeds here.",
    structure:"~4 chapters/day, Genesis through Deuteronomy",
    color:"#B45309", icon:"📜", shelf:"ot", chapters:187,
    whatYoullRead:["Genesis: Creation, Fall, Flood, the Patriarchs","Exodus: Passover, Sinai, the Tabernacle","Leviticus: Holiness, sacrifice, the priesthood","Numbers: Wilderness, rebellion, God's faithfulness","Deuteronomy: Moses' farewell — the covenant renewed"],
  },
  {
    id:"historical-books", title:"The Historical Books",
    subtitle:"Joshua to Esther: Israel in the land",
    duration:"60 days", dailyTime:"~10 min/day", difficulty:"Moderate",
    description:"From the conquest of Canaan to the courts of Persia, the Historical Books trace Israel's rise, glory, collapse, and survival. The story of a God who keeps his promises even when his people do not.",
    structure:"~3 chapters/day through Joshua to Esther",
    color:"#92400E", icon:"⚔️", shelf:"ot", chapters:249,
    whatYoullRead:["Joshua: The Promised Land entered","Judges & Ruth: Sin, judgment, redemption","1–2 Samuel: Saul, David, and the kingdom","1–2 Kings: Solomon, division, exile","Ezra, Nehemiah, Esther: Return and rebuilding"],
  },
  {
    id:"psalms-proverbs", title:"Psalms & Proverbs",
    subtitle:"Worship and wisdom for every season",
    duration:"60 days", dailyTime:"~7 min/day", difficulty:"Beginner",
    description:"The two great wisdom books of the Old Testament. Psalms teaches us how to pray — in joy, grief, fear, and praise. Proverbs teaches us how to live — with integrity, diligence, and the fear of the LORD.",
    structure:"2–3 Psalms per day + 1 Proverbs chapter",
    color:"#D97706", icon:"🌟", shelf:"ot", chapters:181,
    whatYoullRead:["All 150 Psalms — lament, praise, trust, triumph","All 31 chapters of Proverbs","Morning Psalms for worship, evening Proverbs for reflection","A complete picture of Israel's devotional life"],
  },
  {
    id:"epistles", title:"The Epistles",
    subtitle:"Paul's letters and the General Epistles",
    duration:"45 days", dailyTime:"~10 min/day", difficulty:"Moderate",
    description:"Romans through Jude — the letters that built the church. Paul, Peter, James, John, and Jude wrote to real communities facing real struggles. Their words are as urgent today.",
    structure:"1–2 letters per week, chapter-by-chapter",
    color:"#0369A1", icon:"✉️", shelf:"ep", chapters:87,
    whatYoullRead:["Week 1–2: Romans & Galatians — justification by faith","Week 3: Ephesians, Philippians, Colossians","Week 4: Thessalonians, Timothy, Titus","Week 5–6: Hebrews, James, Peter, John, Jude"],
  },
  {
    id:"prophets", title:"The Prophets",
    subtitle:"Isaiah to Malachi — the voice of God",
    duration:"90 days", dailyTime:"~12 min/day", difficulty:"Advanced",
    description:"The 17 prophetic books are the most underread section of the Bible — and the most quoted by Jesus and the New Testament. Major and minor prophets paired week by week.",
    structure:"Major prophet + paired minor prophet per week",
    color:"#9F1239", icon:"🔥", shelf:"ep", chapters:250,
    whatYoullRead:["Isaiah — the gospel before the gospel","Jeremiah & Lamentations — weeping with the prophet","Ezekiel — visions, judgment, the dry bones","Daniel — God's sovereignty over empires","The Twelve: Hosea through Malachi"],
  },
  {
    id:"storyline", title:"The Bible Storyline",
    subtitle:"The one story of Scripture in 21 days",
    duration:"21 days", dailyTime:"~12 min/day", difficulty:"Accessible",
    description:"Not every chapter — the spine of the whole story. From creation to fall, Abraham to Moses, David to exile, exile to Christ, cross to resurrection, church to new creation.",
    structure:"3 passages/day — OT narrative, Psalm, NT echo",
    color:"#065F46", icon:"🌿", shelf:"thematic", chapters:63,
    whatYoullRead:["Day 1–3: Creation, Fall, Flood, Abraham","Day 4–7: Exodus, Law, Promised Land","Day 8–11: David, Solomon, the divided kingdom","Day 12–14: Exile and the cry for return","Day 15–18: The Gospels — the King arrives","Day 19–21: Church, letters, new creation"],
  },
  {
    id:"sermon-on-the-mount", title:"Sermon on the Mount",
    subtitle:"Matthew 5–7: manifesto of the Kingdom",
    duration:"7 days", dailyTime:"~10 min/day", difficulty:"Beginner",
    description:"The greatest sermon ever preached. In seven days, read it slowly — the Beatitudes, the Lord's Prayer, the Golden Rule, the narrow gate. These words are meant to be lived, not just admired.",
    structure:"Matthew 5–7, one section per day",
    color:"#0284C7", icon:"🌅", shelf:"thematic", chapters:3,
    whatYoullRead:["Day 1: The Beatitudes","Day 2: Salt, light, and the Law fulfilled","Day 3: Giving, prayer, the Lord's Prayer","Day 4: Fasting, treasure, the eye as lamp","Day 5–6: Judging, the Golden Rule, the narrow gate","Day 7: The two builders"],
  },
  {
    id:"prophecy-fulfilment", title:"Prophecy & Fulfilment",
    subtitle:"The Messianic thread: Eden to the tomb",
    duration:"30 days", dailyTime:"~10 min/day", difficulty:"Accessible",
    description:"One unified story, one hero. Each day pairs an Old Testament prophecy with its New Testament fulfilment — showing that Jesus did not appear by accident but was always the one who was coming.",
    structure:"Daily OT prophecy + NT fulfilment passage",
    color:"#B91C1C", icon:"🔮", shelf:"thematic", chapters:60,
    whatYoullRead:["Week 1: The seed of woman, Abraham's blessing, Judah's sceptre","Week 2: The Prophet like Moses, Isaiah's suffering servant","Week 3: Son of David, the new covenant (Jeremiah 31)","Week 4: Triumphal entry, betrayal for 30 pieces of silver","Psalms of the cross: Psalm 22 & 69 alongside the crucifixion"],
  },
  {
    id:"prayers-of-the-bible", title:"Prayers of the Bible",
    subtitle:"Learn to pray with the saints",
    duration:"21 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"The Bible is full of people who prayed — and the Holy Spirit preserved their prayers for us. Abraham, Moses, Hannah, David, Daniel, Jesus, Paul — each one a school of prayer.",
    structure:"One great biblical prayer per day, with its context",
    color:"#047857", icon:"🙏", shelf:"thematic", chapters:21,
    whatYoullRead:["OT saints: Abraham, Moses, Hannah, Solomon, Daniel, Nehemiah","Psalms as prayer: lament (22), confession (51), praise (103)","Jesus praying: Gethsemane, the High Priestly Prayer (John 17)","Apostolic prayers: Paul for Ephesians, the church in Acts 4","The final prayer: 'Even so, come, Lord Jesus' (Rev 22:20)"],
  },
  {
    id:"advent", title:"Advent — 25 Days",
    subtitle:"From the first promise to the manger",
    duration:"25 days", dailyTime:"~8 min/day", difficulty:"Beginner",
    description:"A journey through the great Messianic promises of the Old Testament and their fulfilment in the birth of Christ. From Isaiah 7 to Luke 1, from Micah 5 to Matthew 2. Beautiful any time of year.",
    structure:"Daily OT prophecy + NT fulfilment passage",
    color:"#6D28D9", icon:"🕯️", shelf:"thematic", chapters:50,
    whatYoullRead:["Day 1–5: Genesis 3:15, Isaiah 9 & 11, Micah 5","Day 6–10: Ruth, Samuel, the Psalms of the King","Day 11–15: Isaiah 40, 42, 53, 61; Zechariah 9","Day 16–20: Luke 1, Matthew 1, the Magnificat","Day 21–25: Luke 2, Matthew 2, John 1:1–18"],
  },
];

// ─── Readings Data Layer ─────────────────────────────────────────────────────
// All 66 books with chapter counts — used to auto-generate sequential plans
const BOOK_CHAPTERS = [
  // Old Testament
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
  // New Testament
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

// Generates day-by-day readings from a book sequence at a given chapters/day rate
// Returns: [{ day, label, passages: [{ book, chapter }] }]
function generateSequentialReadings(bookSequence, chapsPerDay) {
  // Flatten the sequence into a single ordered list of { book, chapter }
  const allPassages = [];
  for (const { book, chapters } of bookSequence) {
    for (let ch = 1; ch <= chapters; ch++) {
      allPassages.push({ book, chapter: ch });
    }
  }
  const readings = [];
  let day = 1;
  for (let i = 0; i < allPassages.length; i += chapsPerDay) {
    readings.push({
      day,
      label: `Day ${day}`,
      passages: allPassages.slice(i, i + chapsPerDay),
    });
    day++;
  }
  return readings;
}

// ── Sequential plan sequences ──────────────────────────────────────────────

const OT_BOOKS    = BOOK_CHAPTERS.slice(0, 39);
const NT_BOOKS    = BOOK_CHAPTERS.slice(39);
const PSALM_BOOKS = [{ book:"Psalms", chapters:150 }];
const PROV_BOOKS  = [{ book:"Proverbs", chapters:31 }];

// Bible in a Year: interleaved OT + Psalms/Proverbs + NT (3 chapters/day)
// We generate it as a flat OT sequence for simplicity — full interleaving
// would require a custom builder, so we use the sequential version here
const BIBLE_YEAR_READINGS = generateSequentialReadings(BOOK_CHAPTERS, 3);

// Chronological order (key resequencing — Job with Genesis, Psalms with David, etc.)
const CHRON_SEQUENCE = [
  { book:"Genesis",chapters:11 },{ book:"Job",chapters:42 },
  { book:"Genesis",chapters:39 },  // Gen 12–50 after Job
  { book:"Exodus",chapters:40 },{ book:"Leviticus",chapters:27 },
  { book:"Numbers",chapters:36 },{ book:"Deuteronomy",chapters:34 },
  { book:"Joshua",chapters:24 },{ book:"Judges",chapters:21 },
  { book:"Ruth",chapters:4 },{ book:"1 Samuel",chapters:31 },
  { book:"Psalms",chapters:41 },  // Psalms 1–41 (early Davidic)
  { book:"2 Samuel",chapters:24 },
  { book:"Psalms",chapters:31 },  // Psalms 42–72
  { book:"Proverbs",chapters:31 },{ book:"Ecclesiastes",chapters:12 },
  { book:"Song of Solomon",chapters:8 },
  { book:"1 Kings",chapters:11 },
  { book:"Psalms",chapters:48 },  // Psalms 73–119 (Asaph + wisdom)
  { book:"1 Kings",chapters:11 },{ book:"2 Kings",chapters:25 },
  { book:"1 Chronicles",chapters:29 },{ book:"2 Chronicles",chapters:36 },
  { book:"Psalms",chapters:30 },  // Psalms 120–150
  { book:"Isaiah",chapters:66 },{ book:"Jeremiah",chapters:52 },
  { book:"Lamentations",chapters:5 },{ book:"Ezekiel",chapters:48 },
  { book:"Daniel",chapters:12 },{ book:"Hosea",chapters:14 },
  { book:"Joel",chapters:3 },{ book:"Amos",chapters:9 },
  { book:"Obadiah",chapters:1 },{ book:"Jonah",chapters:4 },
  { book:"Micah",chapters:7 },{ book:"Nahum",chapters:3 },
  { book:"Habakkuk",chapters:3 },{ book:"Zephaniah",chapters:3 },
  { book:"Ezra",chapters:10 },{ book:"Nehemiah",chapters:13 },
  { book:"Esther",chapters:10 },{ book:"Haggai",chapters:2 },
  { book:"Zechariah",chapters:14 },{ book:"Malachi",chapters:4 },
  ...NT_BOOKS,
];
const CHRON_READINGS = generateSequentialReadings(CHRON_SEQUENCE, 3);

// M'Cheyne: 4 chapters/day (OT + NT + Psalms interleaved — simplified as sequential)
const MCHEYNE_READINGS = generateSequentialReadings(BOOK_CHAPTERS, 4);

// NT in 90 days: ~3 chapters/day through NT only
const NT_90_READINGS = generateSequentialReadings(NT_BOOKS, 3);

// Torah: 4–5 chapters/day through the Pentateuch
const TORAH_READINGS = generateSequentialReadings(
  BOOK_CHAPTERS.slice(0, 5), 5
);

// Historical Books: 4 chapters/day through Joshua → Esther
const HISTORICAL_READINGS = generateSequentialReadings(
  BOOK_CHAPTERS.slice(5, 17), 4
);

// Psalms & Proverbs: 3 chapters/day
const PSALMS_PROV_READINGS = generateSequentialReadings(
  [{ book:"Psalms", chapters:150 }, { book:"Proverbs", chapters:31 }], 3
);

// The Prophets: 3 chapters/day through all 17 prophetic books
const PROPHETS_READINGS = generateSequentialReadings(
  BOOK_CHAPTERS.slice(22, 39), 3
);

// The Epistles: 2 chapters/day through Romans → Jude
const EPISTLES_READINGS = generateSequentialReadings(
  BOOK_CHAPTERS.slice(45, 65), 2
);

// ── Curated / handcrafted plan readings ───────────────────────────────────

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
  { day:2, label:"Monday",       passages:[{ book:"Mark", chapter:11 },{ book:"Matthew", chapter:21 }] },
  { day:3, label:"Tuesday",      passages:[{ book:"Matthew", chapter:24 },{ book:"Matthew", chapter:25 }] },
  { day:4, label:"Wednesday",    passages:[{ book:"Matthew", chapter:26 },{ book:"Mark", chapter:14 }] },
  { day:5, label:"Thursday",     passages:[{ book:"John", chapter:13 },{ book:"John", chapter:14 },{ book:"John", chapter:17 }] },
  { day:6, label:"Good Friday",  passages:[{ book:"John", chapter:18 },{ book:"John", chapter:19 }] },
  { day:7, label:"Easter",       passages:[{ book:"John", chapter:20 },{ book:"Luke", chapter:24 }] },
];

const SERMON_READINGS = [
  { day:1, label:"The Beatitudes",        passages:[{ book:"Matthew", chapter:5 }] },
  { day:2, label:"Salt, Light & the Law", passages:[{ book:"Matthew", chapter:5 }] },
  { day:3, label:"Prayer & Fasting",      passages:[{ book:"Matthew", chapter:6 }] },
  { day:4, label:"Treasure & Anxiety",    passages:[{ book:"Matthew", chapter:6 }] },
  { day:5, label:"Judging & Asking",      passages:[{ book:"Matthew", chapter:7 }] },
  { day:6, label:"The Narrow Gate",       passages:[{ book:"Matthew", chapter:7 }] },
  { day:7, label:"The Two Builders",      passages:[{ book:"Matthew", chapter:7 }] },
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
  { day:12, label:"Solomon's Temple",   passages:[{ book:"1 Kings", chapter:8 },{ book:"Proverbs", chapter:1 }] },
  { day:13, label:"Division & Decline", passages:[{ book:"1 Kings", chapter:12 },{ book:"Amos", chapter:5 }] },
  { day:14, label:"Exile",              passages:[{ book:"2 Kings", chapter:25 },{ book:"Psalms", chapter:137 }] },
  { day:15, label:"Isaiah's Hope",      passages:[{ book:"Isaiah", chapter:40 },{ book:"Isaiah", chapter:53 }] },
  { day:16, label:"New Covenant",       passages:[{ book:"Jeremiah", chapter:31 },{ book:"Ezekiel", chapter:37 }] },
  { day:17, label:"Return",             passages:[{ book:"Ezra", chapter:1 },{ book:"Nehemiah", chapter:8 }] },
  { day:18, label:"The King Arrives",   passages:[{ book:"Luke", chapter:1 },{ book:"John", chapter:1 }] },
  { day:19, label:"Kingdom Teachings",  passages:[{ book:"Matthew", chapter:5 },{ book:"Luke", chapter:15 }] },
  { day:20, label:"Cross & Risen",      passages:[{ book:"John", chapter:19 },{ book:"John", chapter:20 }] },
  { day:21, label:"New Creation",       passages:[{ book:"Romans", chapter:8 },{ book:"Revelation", chapter:21 }] },
];

const PROPHECY_READINGS = [
  { day:1,  label:"The First Promise",      passages:[{ book:"Genesis", chapter:3 }] },
  { day:2,  label:"Abraham's Blessing",     passages:[{ book:"Genesis", chapter:12 },{ book:"Galatians", chapter:3 }] },
  { day:3,  label:"The Sceptre of Judah",   passages:[{ book:"Genesis", chapter:49 },{ book:"Revelation", chapter:5 }] },
  { day:4,  label:"The Passover Lamb",      passages:[{ book:"Exodus", chapter:12 },{ book:"John", chapter:1 }] },
  { day:5,  label:"The Prophet like Moses", passages:[{ book:"Deuteronomy", chapter:18 },{ book:"Acts", chapter:3 }] },
  { day:6,  label:"The Lord's Anointed",    passages:[{ book:"Psalms", chapter:2 },{ book:"Acts", chapter:13 }] },
  { day:7,  label:"Psalm 22 — The Cross",   passages:[{ book:"Psalms", chapter:22 },{ book:"Matthew", chapter:27 }] },
  { day:8,  label:"The Eternal King",       passages:[{ book:"2 Samuel", chapter:7 },{ book:"Luke", chapter:1 }] },
  { day:9,  label:"Isaiah's Immanuel",      passages:[{ book:"Isaiah", chapter:7 },{ book:"Matthew", chapter:1 }] },
  { day:10, label:"A Child is Born",        passages:[{ book:"Isaiah", chapter:9 },{ book:"Luke", chapter:2 }] },
  { day:11, label:"The Root of Jesse",      passages:[{ book:"Isaiah", chapter:11 },{ book:"Romans", chapter:15 }] },
  { day:12, label:"The Servant's Call",     passages:[{ book:"Isaiah", chapter:42 },{ book:"Matthew", chapter:12 }] },
  { day:13, label:"Isaiah 53",             passages:[{ book:"Isaiah", chapter:53 },{ book:"1 Peter", chapter:2 }] },
  { day:14, label:"The Year of Jubilee",    passages:[{ book:"Isaiah", chapter:61 },{ book:"Luke", chapter:4 }] },
  { day:15, label:"The New Covenant",       passages:[{ book:"Jeremiah", chapter:31 },{ book:"Hebrews", chapter:8 }] },
  { day:16, label:"The Dry Bones",          passages:[{ book:"Ezekiel", chapter:37 },{ book:"Romans", chapter:6 }] },
  { day:17, label:"Son of Man",             passages:[{ book:"Daniel", chapter:7 },{ book:"Matthew", chapter:26 }] },
  { day:18, label:"The Faithful Lover",     passages:[{ book:"Hosea", chapter:11 },{ book:"Matthew", chapter:2 }] },
  { day:19, label:"Pentecost Foretold",     passages:[{ book:"Joel", chapter:2 },{ book:"Acts", chapter:2 }] },
  { day:20, label:"The Shepherd Struck",    passages:[{ book:"Zechariah", chapter:9 },{ book:"Matthew", chapter:21 }] },
  { day:21, label:"Thirty Pieces of Silver",passages:[{ book:"Zechariah", chapter:11 },{ book:"Matthew", chapter:26 }] },
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
  { day:5,  label:"Hannah's Vow",         passages:[{ book:"1 Samuel", chapter:1 }] },
  { day:6,  label:"Hannah's Song",        passages:[{ book:"1 Samuel", chapter:2 }] },
  { day:7,  label:"David's Lament",       passages:[{ book:"Psalms", chapter:22 }] },
  { day:8,  label:"David's Confession",   passages:[{ book:"Psalms", chapter:51 }] },
  { day:9,  label:"Praise of the Soul",   passages:[{ book:"Psalms", chapter:103 }] },
  { day:10, label:"Solomon's Dedication", passages:[{ book:"1 Kings", chapter:8 }] },
  { day:11, label:"Elijah's Prayer",      passages:[{ book:"1 Kings", chapter:18 }] },
  { day:12, label:"Hezekiah's Prayer",    passages:[{ book:"2 Kings", chapter:19 }] },
  { day:13, label:"Jonah's Prayer",       passages:[{ book:"Jonah", chapter:2 }] },
  { day:14, label:"Daniel's Confession",  passages:[{ book:"Daniel", chapter:9 }] },
  { day:15, label:"Nehemiah's Prayer",    passages:[{ book:"Nehemiah", chapter:1 }] },
  { day:16, label:"The Lord's Prayer",    passages:[{ book:"Matthew", chapter:6 }] },
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
  { day:9,  label:"The King's Psalm",     passages:[{ book:"Psalms", chapter:72 }] },
  { day:10, label:"Psalms of the King",   passages:[{ book:"Psalms", chapter:89 }] },
  { day:11, label:"Comfort My People",    passages:[{ book:"Isaiah", chapter:40 }] },
  { day:12, label:"The Chosen Servant",   passages:[{ book:"Isaiah", chapter:42 }] },
  { day:13, label:"The Suffering Servant",passages:[{ book:"Isaiah", chapter:53 }] },
  { day:14, label:"The Year of Jubilee",  passages:[{ book:"Isaiah", chapter:61 }] },
  { day:15, label:"The Triumphal Entry",  passages:[{ book:"Zechariah", chapter:9 }] },
  { day:16, label:"The Annunciation",     passages:[{ book:"Luke", chapter:1 }] },
  { day:17, label:"The Magnificat",       passages:[{ book:"Luke", chapter:1 }] },
  { day:18, label:"Joseph's Dream",       passages:[{ book:"Matthew", chapter:1 }] },
  { day:19, label:"The Genealogy of Grace",passages:[{ book:"Matthew", chapter:1 }] },
  { day:20, label:"Zechariah's Song",     passages:[{ book:"Luke", chapter:1 }] },
  { day:21, label:"The Birth of Jesus",   passages:[{ book:"Luke", chapter:2 }] },
  { day:22, label:"The Shepherds",        passages:[{ book:"Luke", chapter:2 }] },
  { day:23, label:"The Magi",             passages:[{ book:"Matthew", chapter:2 }] },
  { day:24, label:"Simeon & Anna",        passages:[{ book:"Luke", chapter:2 }] },
  { day:25, label:"The Word Made Flesh",  passages:[{ book:"John", chapter:1 }] },
];

// Master lookup: planId → readings array
const PLAN_READINGS = {
  "bible-in-a-year":     BIBLE_YEAR_READINGS,
  "chronological":       CHRON_READINGS,
  "mcheyne":             MCHEYNE_READINGS,
  "nt-90":               NT_90_READINGS,
  "life-of-jesus":       LIFE_OF_JESUS_READINGS,
  "holy-week":           HOLY_WEEK_READINGS,
  "torah":               TORAH_READINGS,
  "historical-books":    HISTORICAL_READINGS,
  "psalms-proverbs":     PSALMS_PROV_READINGS,
  "epistles":            EPISTLES_READINGS,
  "prophets":            PROPHETS_READINGS,
  "storyline":           STORYLINE_READINGS,
  "sermon-on-the-mount": SERMON_READINGS,
  "prophecy-fulfilment": PROPHECY_READINGS,
  "prayers-of-the-bible":PRAYERS_READINGS,
  "advent":              ADVENT_READINGS,
};

// Helper: get today's reading entry for a plan given days completed
function getTodaysReading(planId, daysDone) {
  const readings = PLAN_READINGS[planId];
  if (!readings) return null;
  const idx = Math.min(daysDone, readings.length - 1);
  return readings[idx] || null;
}

// ─── Shelf definitions ────────────────────────────────────────────────────────
const SHELVES = [
  { id:"full",     label:"Full Bible & Chronological",  emoji:"📚" },
  { id:"nt",       label:"New Testament & Gospels",     emoji:"✨" },
  { id:"ot",       label:"Old Testament & Wisdom",      emoji:"🏛️" },
  { id:"ep",       label:"Epistles & Prophets",         emoji:"📜" },
  { id:"thematic", label:"Thematic & Seasonal",         emoji:"🌿" },
];

// ─── Main Component ───────────────────────────────────────────────────────────
export default function ReadingPlans({ nav }) {
  const [selectedPlan,  setSelectedPlan]  = useState(null);
  const [detailOpen,    setDetailOpen]    = useState(false);
  const [animIn,        setAnimIn]        = useState(false);
  const [activeTab,     setActiveTab]     = useState("library");
  const [activePlans,   setActivePlans]   = useState({});
  const [completedDays, setCompletedDays] = useState({});
  const [hoveredId,     setHoveredId]     = useState(null);

  // ── Supabase chapter availability check ──────────────────────────────────
  // Cache results so we never query the same chapter twice in a session
  // Key: "Book|chapter" → true (seeded) | false (not seeded) | "loading"
  const [seededCache, setSeededCache] = useState({});

  const checkChapterSeeded = useCallback(async (book, chapter) => {
    const key = `${book}|${chapter}`;
    // Already know the answer
    if (seededCache[key] === true || seededCache[key] === false) return seededCache[key];
    // Mark as loading so we don't fire duplicate queries
    setSeededCache(prev => ({ ...prev, [key]: "loading" }));
    try {
      const { data, error } = await supabase
        .from("verses")
        .select("id")
        .eq("book_name", book)
        .eq("chapter_num", chapter)
        .limit(1);
      const isSeeded = !error && data && data.length > 0;
      setSeededCache(prev => ({ ...prev, [key]: isSeeded }));
      return isSeeded;
    } catch {
      setSeededCache(prev => ({ ...prev, [key]: false }));
      return false;
    }
  }, [seededCache]);

  // Pre-check all passages for a given day's reading so the UI can render
  // immediately with correct states rather than showing loaders per-passage
  const primePassageCache = useCallback(async (planId, daysDone) => {
    const entry = getTodaysReading(planId, daysDone);
    if (!entry) return;
    for (const { book, chapter } of entry.passages) {
      const key = `${book}|${chapter}`;
      if (seededCache[key] === undefined) {
        checkChapterSeeded(book, chapter);
      }
    }
  }, [seededCache, checkChapterSeeded]);

  const openDetail = (plan) => {
    setSelectedPlan(plan);
    setDetailOpen(true);
    setTimeout(() => setAnimIn(true), 10);
  };

  const closeDetail = () => {
    setAnimIn(false);
    setTimeout(() => { setDetailOpen(false); setSelectedPlan(null); }, 350);
  };

  const startPlan = (plan) => {
    const currentDays = completedDays[plan.id] || 0;
    setActivePlans(prev => ({ ...prev, [plan.id]: { startedAt: new Date().toISOString() } }));
    setCompletedDays(prev => ({ ...prev, [plan.id]: currentDays }));
    // Prime the Supabase cache for today's passages immediately
    primePassageCache(plan.id, currentDays);
    closeDetail();
    setTimeout(() => setActiveTab("myPlans"), 360);
  };

  const markDayDone = (planId) => {
    const total = parseInt(READING_PLANS.find(p => p.id === planId).duration);
    const nextDay = Math.min((completedDays[planId] || 0) + 1, total);
    setCompletedDays(prev => ({ ...prev, [planId]: nextDay }));
    // Pre-check tomorrow's passages while user is still on the screen
    primePassageCache(planId, nextDay);
  };

  const myActivePlans = READING_PLANS.filter(p => activePlans[p.id]);

  return (
    <div style={{ minHeight: "100vh", background: T.wall, fontFamily: T.font }}>

      {/* ── HERO ── */}
      <div style={{
        background: "linear-gradient(160deg, #1A0E06 0%, #4A2410 60%, #2A1208 100%)",
        padding: "0 0 28px", position: "relative", overflow: "hidden",
      }}>
        {/* Subtle wood-grain streaks */}
        {[8,22,38,55,70,85].map(top => (
          <div key={top} style={{
            position:"absolute", left:0, right:0, top:`${top}%`,
            height:1, background:"rgba(255,255,255,0.025)",
          }} />
        ))}

        <div style={{ padding:"16px 20px 0", position:"relative" }}>
          <button onClick={() => nav("learn-home")} style={{
            background:"rgba(255,255,255,0.1)", border:"1px solid rgba(245,222,179,0.3)",
            borderRadius:20, color:"#F5DEB3", padding:"6px 14px",
            fontSize:13, cursor:"pointer", fontFamily:T.font,
          }}>← Back</button>
        </div>

        <div style={{ textAlign:"center", padding:"16px 24px 0", position:"relative" }}>
          <div style={{ fontSize:52, marginBottom:8 }}>📚</div>
          <h1 style={{
            color:"#F5DEB3", fontSize:28, fontWeight:700, margin:"0 0 6px",
            textShadow:"0 2px 12px rgba(0,0,0,0.6)", letterSpacing:"0.5px",
          }}>The Reading Room</h1>
          <p style={{ color:"rgba(245,222,179,0.7)", fontSize:14, margin:"0 0 20px" }}>
            16 guided journeys through the Word of God
          </p>

          <div style={{ display:"flex", justifyContent:"center", gap:28 }}>
            {[
              { label:"Plans",  value:"16" },
              { label:"Active", value: myActivePlans.length },
              { label:"Shelves",value:"5" },
            ].map(s => (
              <div key={s.label} style={{ textAlign:"center" }}>
                <div style={{ color:"#F5DEB3", fontSize:22, fontWeight:700 }}>{s.value}</div>
                <div style={{ color:"rgba(245,222,179,0.55)", fontSize:11 }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>

        <div style={{ display:"flex", justifyContent:"center", gap:8, padding:"18px 20px 0" }}>
          {[
            { key:"library", label:"📚 Library" },
            { key:"myPlans", label:`🔖 My Plans${myActivePlans.length ? ` (${myActivePlans.length})` : ""}` },
          ].map(t => (
            <button key={t.key} onClick={() => setActiveTab(t.key)} style={{
              padding:"8px 20px", borderRadius:20,
              border:`1.5px solid ${activeTab===t.key ? "#F5DEB3" : "rgba(245,222,179,0.3)"}`,
              background: activeTab===t.key ? "#F5DEB3" : "transparent",
              color: activeTab===t.key ? "#2C1A0E" : "#F5DEB3",
              fontWeight:600, fontSize:14, cursor:"pointer", fontFamily:T.font,
              transition:"all 0.2s",
            }}>{t.label}</button>
          ))}
        </div>
      </div>

      {/* ── LIBRARY ── */}
      {activeTab === "library" && (
        <div style={{ padding:"28px 0 60px" }}>

          {SHELVES.map(shelf => {
            const plans = READING_PLANS.filter(p => p.shelf === shelf.id);
            return (
              <div key={shelf.id} style={{ marginBottom:44 }}>

                {/* Shelf label */}
                <div style={{ padding:"0 22px 12px", display:"flex", alignItems:"center", gap:8 }}>
                  <span style={{ fontSize:16 }}>{shelf.emoji}</span>
                  <span style={{
                    fontSize:11, fontWeight:700, color:T.muted,
                    textTransform:"uppercase", letterSpacing:"2px",
                  }}>{shelf.label}</span>
                  <div style={{ flex:1, height:1, background:"#C9A96E", opacity:0.35, marginLeft:6 }} />
                </div>

                {/* Books */}
                <div style={{ padding:"8px 22px 0", display:"flex", gap:8, flexWrap:"wrap" }}>
                  {plans.map(plan => {
                    const isHovered = hoveredId === plan.id;
                    const isActive  = !!activePlans[plan.id];
                    const done      = completedDays[plan.id] || 0;
                    const total     = parseInt(plan.duration);
                    const pct       = isActive ? (done / total) : 0;
                    const light     = lightenHex(plan.color, 45);

                    return (
                      <div
                        key={plan.id}
                        onClick={() => openDetail(plan)}
                        onMouseEnter={() => setHoveredId(plan.id)}
                        onMouseLeave={() => setHoveredId(null)}
                        style={{
                          width:62, display:"flex", flexDirection:"column",
                          cursor:"pointer",
                          transform: isHovered ? "translateY(-16px)" : "translateY(0)",
                          transition:"transform 0.28s cubic-bezier(0.34,1.56,0.64,1)",
                          filter: isHovered
                            ? "drop-shadow(0 16px 20px rgba(0,0,0,0.5))"
                            : "drop-shadow(0 3px 5px rgba(0,0,0,0.28))",
                        }}
                      >
                        {/* Top edge (pages) */}
                        <div style={{
                          height:5, borderRadius:"3px 3px 0 0",
                          background:`linear-gradient(90deg, #f0e8d8, #e8dcc8, #f0e8d8)`,
                          borderTop:"1px solid #d4c4a0",
                        }} />

                        {/* Spine */}
                        <div style={{
                          minHeight:175,
                          background:`linear-gradient(90deg, ${plan.color}cc 0%, ${plan.color} 25%, ${light} 48%, ${plan.color} 72%, ${plan.color}aa 100%)`,
                          display:"flex", flexDirection:"column",
                          alignItems:"center", justifyContent:"space-between",
                          padding:"10px 0", position:"relative", overflow:"hidden",
                        }}>
                          {/* Highlight crease */}
                          <div style={{
                            position:"absolute", left:7, top:0, bottom:0, width:2,
                            background:"rgba(255,255,255,0.22)", borderRadius:1,
                          }} />
                          {/* Shadow crease */}
                          <div style={{
                            position:"absolute", right:5, top:0, bottom:0, width:1,
                            background:"rgba(0,0,0,0.15)",
                          }} />

                          {/* Progress fill from bottom */}
                          {isActive && (
                            <div style={{
                              position:"absolute", bottom:0, left:0, right:0,
                              height:`${pct*100}%`,
                              background:"rgba(255,255,255,0.18)",
                              transition:"height 0.5s ease",
                            }} />
                          )}

                          {/* Icon */}
                          <span style={{ fontSize:18, position:"relative",
                            filter:"drop-shadow(0 1px 3px rgba(0,0,0,0.5))" }}>
                            {plan.icon}
                          </span>

                          {/* Rotated title */}
                          <div style={{
                            writingMode:"vertical-rl",
                            transform:"rotate(180deg)",
                            color:"#fff",
                            fontSize:10.5,
                            fontWeight:700,
                            fontFamily:T.font,
                            textShadow:"0 1px 4px rgba(0,0,0,0.6)",
                            lineHeight:1.25,
                            maxHeight:115,
                            overflow:"hidden",
                            textAlign:"center",
                            letterSpacing:"0.4px",
                            position:"relative",
                          }}>
                            {plan.title}
                          </div>

                          {/* Duration */}
                          <div style={{
                            writingMode:"vertical-rl",
                            transform:"rotate(180deg)",
                            background:"rgba(0,0,0,0.28)",
                            borderRadius:3, padding:"3px 3px",
                            fontSize:8, color:"rgba(255,255,255,0.9)",
                            fontWeight:600, letterSpacing:"0.5px",
                            position:"relative",
                          }}>
                            {plan.duration}
                          </div>
                        </div>

                        {/* Bottom edge */}
                        <div style={{
                          height:7, borderRadius:"0 0 2px 2px",
                          background:`linear-gradient(180deg, ${plan.color}bb, ${plan.color}66)`,
                          borderBottom:"1px solid rgba(0,0,0,0.2)",
                        }} />

                        {/* Active indicator */}
                        {isActive && (
                          <div style={{
                            width:8, height:8, borderRadius:"50%",
                            background:"#4ADE80", margin:"5px auto 0",
                            boxShadow:"0 0 8px #4ADE80, 0 0 2px #fff",
                          }} />
                        )}
                      </div>
                    );
                  })}
                </div>

                {/* Wood shelf plank */}
                <div style={{ margin:"16px 14px 0" }}>
                  <div style={{
                    height:16, borderRadius:"2px 2px 4px 4px",
                    background:T.wood,
                    boxShadow:"0 5px 12px rgba(0,0,0,0.35), inset 0 1px 0 rgba(255,255,255,0.12), inset 0 -1px 0 rgba(0,0,0,0.1)",
                  }} />
                  <div style={{
                    height:6, marginTop:-1,
                    background:"linear-gradient(180deg, rgba(80,40,10,0.6), transparent)",
                    borderRadius:"0 0 4px 4px",
                  }} />
                </div>

              </div>
            );
          })}

          {/* Floor verse */}
          <p style={{
            textAlign:"center", color:T.muted, fontSize:13,
            fontStyle:"italic", padding:"8px 32px 0",
          }}>
            "Thy word is a lamp unto my feet, and a light unto my path." — Psalm 119:105
          </p>
        </div>
      )}

      {/* ── MY PLANS ── */}
      {activeTab === "myPlans" && (
        <div style={{ padding:"24px 16px 60px", maxWidth:600, margin:"0 auto" }}>
          {myActivePlans.length === 0 ? (
            <div style={{ textAlign:"center", padding:"60px 24px" }}>
              <div style={{ fontSize:56, marginBottom:16 }}>📖</div>
              <h3 style={{ color:T.text, fontSize:20, margin:"0 0 10px" }}>Your shelf is empty</h3>
              <p style={{ color:T.muted, fontSize:15, marginBottom:24, lineHeight:1.6 }}>
                Pull a book from the library to begin your journey.
              </p>
              <button onClick={() => setActiveTab("library")} style={{
                background:"linear-gradient(135deg, #4A2410, #1A0E06)",
                color:"#F5DEB3", border:"none", borderRadius:12,
                padding:"13px 28px", fontSize:15, fontWeight:600,
                cursor:"pointer", fontFamily:T.font,
              }}>Browse the Library</button>
            </div>
          ) : (
            <div style={{ display:"flex", flexDirection:"column", gap:16 }}>
              {myActivePlans.map(plan => {
                const done    = completedDays[plan.id] || 0;
                const total   = parseInt(plan.duration);
                const pct     = Math.round((done / total) * 100);
                const diff    = DIFF[plan.difficulty];
                const todayEntry = getTodaysReading(plan.id, done);

                return (
                  <div key={plan.id} style={{
                    background:T.cream, borderRadius:16, overflow:"hidden",
                    boxShadow:"0 2px 12px rgba(0,0,0,0.1)",
                    borderLeft:`5px solid ${plan.color}`,
                  }}>
                    <div style={{ padding:"18px 18px 16px" }}>

                      {/* ── Plan header ── */}
                      <div style={{ display:"flex", gap:12, alignItems:"center", marginBottom:14 }}>
                        <span style={{ fontSize:32 }}>{plan.icon}</span>
                        <div style={{ flex:1 }}>
                          <h3 style={{ margin:0, fontSize:16, fontWeight:700, color:T.text }}>{plan.title}</h3>
                          <p style={{ margin:0, fontSize:12, color:T.muted }}>{plan.subtitle}</p>
                        </div>
                        <span style={{ background:diff.bg, color:diff.color,
                          fontSize:11, fontWeight:600, padding:"3px 10px", borderRadius:10 }}>
                          {plan.difficulty}
                        </span>
                      </div>

                      {/* ── Progress bar ── */}
                      <div style={{ marginBottom:16 }}>
                        <div style={{ display:"flex", justifyContent:"space-between",
                          fontSize:13, fontWeight:600, color:T.text, marginBottom:6 }}>
                          <span>Day {done} of {total}</span>
                          <span style={{ color:plan.color }}>{pct}%</span>
                        </div>
                        <div style={{ height:8, background:"#E5E7EB", borderRadius:6, overflow:"hidden" }}>
                          <div style={{
                            height:"100%", width:`${pct}%`,
                            background:`linear-gradient(90deg, ${plan.color}, ${lightenHex(plan.color,30)})`,
                            borderRadius:6, transition:"width 0.5s ease",
                          }} />
                        </div>
                      </div>

                      {done >= total ? (
                        /* ── Complete state ── */
                        <div style={{ background:"#D1FAE5", borderRadius:12,
                          padding:"14px", marginBottom:14, textAlign:"center" }}>
                          <p style={{ margin:0, fontSize:15, color:"#065F46", fontWeight:700 }}>
                            🎉 Plan Complete — Well done!
                          </p>
                          <p style={{ margin:"4px 0 0", fontSize:12, color:"#047857" }}>
                            You've finished the entire plan.
                          </p>
                        </div>
                      ) : todayEntry ? (
                        /* ── Today's reading passages ── */
                        <div style={{
                          background:"#fff",
                          border:`1px solid ${plan.color}33`,
                          borderRadius:12, marginBottom:14, overflow:"hidden",
                        }}>
                          {/* Header row */}
                          <div style={{
                            background:`${plan.color}11`,
                            borderBottom:`1px solid ${plan.color}22`,
                            padding:"10px 14px",
                            display:"flex", alignItems:"center", gap:8,
                          }}>
                            <span style={{ fontSize:15 }}>📅</span>
                            <span style={{ fontSize:13, fontWeight:700, color:T.text }}>
                              {todayEntry.label}
                              {todayEntry.label !== `Day ${done + 1}` ? ` — Day ${done + 1}` : ""}
                            </span>
                          </div>

                          {/* Passage buttons */}
                          <div style={{ padding:"10px 12px", display:"flex", flexDirection:"column", gap:8 }}>
                            {todayEntry.passages.map(({ book, chapter }) => {
                              const cacheKey = `${book}|${chapter}`;
                              const cacheVal = seededCache[cacheKey];
                              const isSeeded   = cacheVal === true;
                              const isLoading  = cacheVal === "loading" || cacheVal === undefined;
                              const isUnseeded = cacheVal === false;

                              // Fire the check if not yet cached
                              if (cacheVal === undefined) {
                                checkChapterSeeded(book, chapter);
                              }

                              return (
                                <div key={cacheKey} style={{
                                  display:"flex", alignItems:"center",
                                  justifyContent:"space-between", gap:10,
                                  padding:"10px 12px", borderRadius:10,
                                  background: isSeeded ? `${plan.color}0D` : "#F9FAFB",
                                  border: `1px solid ${isSeeded ? plan.color + "33" : "#E5E7EB"}`,
                                }}>
                                  {/* Passage label */}
                                  <div style={{ display:"flex", alignItems:"center", gap:8 }}>
                                    <span style={{ fontSize:16 }}>
                                      {isSeeded ? "📖" : isLoading ? "⏳" : "🔒"}
                                    </span>
                                    <div>
                                      <p style={{
                                        margin:0, fontSize:14, fontWeight:700,
                                        color: isSeeded ? T.text : T.muted,
                                      }}>
                                        {book} {chapter}
                                      </p>
                                      <p style={{ margin:0, fontSize:11, color:T.muted }}>
                                        {isSeeded ? "Ready to read"
                                          : isLoading ? "Checking..."
                                          : "Coming soon"}
                                      </p>
                                    </div>
                                  </div>

                                  {/* Action button */}
                                  {isSeeded ? (
                                    <button
                                      onClick={() => nav("verses", { book, chapter })}
                                      style={{
                                        background:`linear-gradient(135deg, ${plan.color}, ${lightenHex(plan.color,20)})`,
                                        color:"#fff", border:"none", borderRadius:8,
                                        padding:"7px 14px", fontSize:13, fontWeight:700,
                                        cursor:"pointer", fontFamily:T.font,
                                        whiteSpace:"nowrap", flexShrink:0,
                                      }}
                                    >
                                      Read →
                                    </button>
                                  ) : isUnseeded ? (
                                    <span style={{
                                      background:"#F3F4F6", color:T.muted,
                                      borderRadius:8, padding:"7px 12px",
                                      fontSize:11, fontWeight:600, flexShrink:0,
                                    }}>
                                      Coming soon
                                    </span>
                                  ) : (
                                    <span style={{
                                      background:"#F3F4F6", color:T.muted,
                                      borderRadius:8, padding:"7px 12px",
                                      fontSize:11, flexShrink:0,
                                    }}>
                                      …
                                    </span>
                                  )}
                                </div>
                              );
                            })}
                          </div>
                        </div>
                      ) : null}

                      {/* ── Mark as read button ── */}
                      {done < total && (
                        <button
                          onClick={() => markDayDone(plan.id)}
                          style={{
                            width:"100%", padding:"12px", borderRadius:10, border:"none",
                            background:`linear-gradient(135deg, ${plan.color}, ${lightenHex(plan.color,20)})`,
                            color:"#fff", fontWeight:700, fontSize:14,
                            cursor:"pointer", fontFamily:T.font,
                          }}
                        >
                          ✓ Mark Day {done + 1} as Read
                        </button>
                      )}

                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      )}

      {/* ── FULL-SCREEN DETAIL ── */}
      {detailOpen && selectedPlan && (
        <div style={{
          position:"fixed", inset:0, zIndex:3000,
          opacity: animIn ? 1 : 0,
          transition:"opacity 0.3s ease",
          pointerEvents: animIn ? "auto" : "none",
        }}>
          {/* Backdrop */}
          <div onClick={closeDetail} style={{
            position:"absolute", inset:0,
            background:"rgba(10,5,2,0.6)",
          }} />

          {/* Book page panel */}
          <div style={{
            position:"absolute", inset:0,
            background: T.bg,
            transform: animIn ? "translateX(0)" : "translateX(100%)",
            transition:"transform 0.35s cubic-bezier(0.32,0.72,0,1)",
            display:"flex", flexDirection:"column",
            overflowY:"auto",
          }}>

            {/* Cover strip */}
            <div style={{
              background:`linear-gradient(150deg, ${selectedPlan.color} 0%, ${lightenHex(selectedPlan.color,25)} 55%, ${selectedPlan.color}cc 100%)`,
              padding:"0 0 32px", flexShrink:0, position:"relative", overflow:"hidden",
            }}>
              {/* Spine decoration */}
              <div style={{
                position:"absolute", left:18, top:0, bottom:0, width:3,
                background:"rgba(255,255,255,0.22)", borderRadius:2,
              }} />

              <div style={{ padding:"16px 20px", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
                <button onClick={closeDetail} style={{
                  background:"rgba(0,0,0,0.2)", border:"none", borderRadius:20,
                  color:"#fff", padding:"6px 14px", fontSize:13,
                  cursor:"pointer", fontFamily:T.font,
                }}>← Library</button>
                <button onClick={closeDetail} style={{
                  background:"rgba(0,0,0,0.2)", border:"none", borderRadius:"50%",
                  width:34, height:34, color:"#fff", fontSize:20, cursor:"pointer",
                  display:"flex", alignItems:"center", justifyContent:"center",
                }}>×</button>
              </div>

              <div style={{ textAlign:"center", padding:"4px 28px 0" }}>
                <div style={{ fontSize:56, marginBottom:10,
                  filter:"drop-shadow(0 4px 10px rgba(0,0,0,0.3))" }}>
                  {selectedPlan.icon}
                </div>
                <h1 style={{
                  color:"#fff", fontSize:24, fontWeight:700, margin:"0 0 8px",
                  textShadow:"0 2px 10px rgba(0,0,0,0.3)", lineHeight:1.25,
                }}>{selectedPlan.title}</h1>
                <p style={{ color:"rgba(255,255,255,0.82)", fontSize:14, margin:"0 0 18px" }}>
                  {selectedPlan.subtitle}
                </p>

                <div style={{ display:"flex", gap:6, justifyContent:"center", flexWrap:"wrap" }}>
                  {[selectedPlan.duration, selectedPlan.dailyTime,
                    `${selectedPlan.chapters.toLocaleString()} chapters`].map(s => (
                    <span key={s} style={{
                      background:"rgba(0,0,0,0.22)", borderRadius:20,
                      padding:"5px 12px", color:"#fff", fontSize:12, fontWeight:600,
                    }}>{s}</span>
                  ))}
                  <span style={{
                    background:DIFF[selectedPlan.difficulty].bg,
                    color:DIFF[selectedPlan.difficulty].color,
                    borderRadius:20, padding:"5px 12px", fontSize:12, fontWeight:600,
                  }}>{selectedPlan.difficulty}</span>
                </div>
              </div>
            </div>

            {/* Page body */}
            <div style={{ flex:1, padding:"26px 22px 48px", maxWidth:640, margin:"0 auto", width:"100%" }}>

              {/* Active progress */}
              {activePlans[selectedPlan.id] && (() => {
                const done  = completedDays[selectedPlan.id] || 0;
                const total = parseInt(selectedPlan.duration);
                const pct   = Math.round((done/total)*100);
                return (
                  <div style={{
                    background:"#fff", borderRadius:14, padding:"14px 16px",
                    marginBottom:18, boxShadow:"0 2px 8px rgba(0,0,0,0.06)",
                    border:`1px solid ${selectedPlan.color}33`,
                  }}>
                    <div style={{ display:"flex", justifyContent:"space-between",
                      fontSize:13, fontWeight:700, color:T.text, marginBottom:7 }}>
                      <span>Your Progress</span>
                      <span style={{ color:selectedPlan.color }}>Day {done} / {total} — {pct}%</span>
                    </div>
                    <div style={{ height:7, background:"#E5E7EB", borderRadius:6, overflow:"hidden" }}>
                      <div style={{
                        height:"100%", width:`${pct}%`,
                        background:`linear-gradient(90deg, ${selectedPlan.color}, ${lightenHex(selectedPlan.color,30)})`,
                        borderRadius:6,
                      }} />
                    </div>
                  </div>
                );
              })()}

              {/* Description */}
              <div style={{
                background:"#fff", borderRadius:14, padding:"18px",
                marginBottom:18, boxShadow:"0 2px 8px rgba(0,0,0,0.05)",
              }}>
                <p style={{ margin:0, fontSize:15, color:T.text, lineHeight:1.8, fontStyle:"italic" }}>
                  {selectedPlan.description}
                </p>
              </div>

              {/* What you'll read */}
              <div style={{
                background:"#fff", borderRadius:14, padding:"18px",
                marginBottom:18, boxShadow:"0 2px 8px rgba(0,0,0,0.05)",
              }}>
                <h3 style={{ margin:"0 0 12px", fontSize:14, fontWeight:700, color:T.text,
                  textTransform:"uppercase", letterSpacing:"1px",
                  display:"flex", alignItems:"center", gap:8 }}>
                  <span style={{ color:selectedPlan.color, fontSize:16 }}>◆</span>
                  What You'll Read
                </h3>
                {selectedPlan.whatYoullRead.map((item,i) => (
                  <div key={i} style={{
                    display:"flex", gap:10, alignItems:"flex-start",
                    padding:"8px 0", borderTop: i>0 ? `1px solid ${T.wall}` : "none",
                  }}>
                    <span style={{ color:selectedPlan.color, fontWeight:700, fontSize:13,
                      flexShrink:0, marginTop:2 }}>→</span>
                    <span style={{ fontSize:14, color:T.text, lineHeight:1.6 }}>{item}</span>
                  </div>
                ))}
              </div>

              {/* Structure */}
              <div style={{
                background:`${selectedPlan.color}0F`,
                border:`1px solid ${selectedPlan.color}30`,
                borderRadius:12, padding:"13px 16px", marginBottom:26,
              }}>
                <p style={{ margin:0, fontSize:13, color:T.muted, fontStyle:"italic" }}>
                  📋 <strong style={{ color:T.text }}>Structure:</strong> {selectedPlan.structure}
                </p>
              </div>

              {/* CTA */}
              {activePlans[selectedPlan.id] ? (
                <>
                  <div style={{
                    background:"#D1FAE5", borderRadius:12, padding:"13px",
                    textAlign:"center", marginBottom:12,
                    color:"#065F46", fontWeight:600, fontSize:14,
                  }}>
                    ✓ Day {completedDays[selectedPlan.id] || 0} of {parseInt(selectedPlan.duration)} complete
                  </div>
                  <button onClick={closeDetail} style={{
                    width:"100%", padding:"16px", borderRadius:14, border:"none",
                    background:`linear-gradient(135deg, ${selectedPlan.color}, ${lightenHex(selectedPlan.color,20)})`,
                    color:"#fff", fontWeight:700, fontSize:17, cursor:"pointer",
                    fontFamily:T.font, boxShadow:`0 4px 16px ${selectedPlan.color}55`,
                  }}>Continue Reading →</button>
                </>
              ) : (
                <button onClick={() => startPlan(selectedPlan)} style={{
                  width:"100%", padding:"17px", borderRadius:14, border:"none",
                  background:"linear-gradient(135deg, #1A0E06 0%, #4A2410 50%, #2A1208 100%)",
                  color:"#F5DEB3", fontWeight:700, fontSize:18, cursor:"pointer",
                  fontFamily:T.font, letterSpacing:"0.5px",
                  boxShadow:"0 6px 24px rgba(26,14,6,0.5)",
                }}>
                  Begin Reading →
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}