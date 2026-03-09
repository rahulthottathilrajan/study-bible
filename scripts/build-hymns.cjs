#!/usr/bin/env node
/**
 * build-hymns.cjs — Combines hymn data modules and generates:
 *   public/data/hymns/index.json          (lightweight catalogue, all languages)
 *   public/data/hymns/{lang}/{slug}.json   (per-hymn full data)
 *
 * Usage: node scripts/build-hymns.cjs
 */
const fs = require("fs");
const path = require("path");

const OUT_DIR = path.join(__dirname, "..", "public", "data", "hymns");

// ─── Language definitions ───
const LANGUAGES = [
  { id: "en", label: "English",   nativeLabel: "English" },
  { id: "ml", label: "Malayalam",  nativeLabel: "\u0D2E\u0D32\u0D2F\u0D3E\u0D33\u0D02" },
  { id: "ta", label: "Tamil",     nativeLabel: "\u0BA4\u0BAE\u0BBF\u0BB4\u0BCD" },
  { id: "te", label: "Telugu",    nativeLabel: "\u0C24\u0C46\u0C32\u0C41\u0C17\u0C41" },
  { id: "hi", label: "Hindi",     nativeLabel: "\u0939\u093F\u0928\u094D\u0926\u0940" },
  { id: "kn", label: "Kannada",   nativeLabel: "\u0C95\u0CA8\u0CCD\u0CA8\u0CA1" },
];

// Ensure per-language output dirs
LANGUAGES.forEach(l => fs.mkdirSync(path.join(OUT_DIR, l.id), { recursive: true }));

// ─── Load hymn data modules ───
const classicHymns = require("./hymn-data-classic.cjs");
const pentecostalHymns = require("./hymn-data-pentecostal.cjs");
const seasonalHymns = require("./hymn-data-seasonal.cjs");
const mlHymns = require("./hymn-data-ml.cjs");
const taHymns = require("./hymn-data-ta.cjs");
const teHymns = require("./hymn-data-te.cjs");
const hiHymns = require("./hymn-data-hi.cjs");
const knHymns = require("./hymn-data-kn.cjs");

// Default lang:"en" on English hymns, merge all
const allHymns = [
  ...classicHymns.map(h => ({ lang: "en", ...h })),
  ...pentecostalHymns.map(h => ({ lang: "en", ...h })),
  ...seasonalHymns.map(h => ({ lang: "en", ...h })),
  ...mlHymns,
  ...taHymns,
  ...teHymns,
  ...hiHymns,
  ...knHymns,
];

// ─── Deduplicate by id ───
const seen = new Set();
const hymns = [];
for (const h of allHymns) {
  if (seen.has(h.id)) {
    console.log(`  \u26A0 Skipping duplicate: ${h.id}`);
    continue;
  }
  seen.add(h.id);
  hymns.push(h);
}

// ─── Category definitions ───
const CATEGORIES = [
  { id: "classic",     label: "Classic Protestant",      icon: "\u271D\uFE0F" },
  { id: "pentecostal", label: "Holy Spirit & Revival",   icon: "\uD83D\uDD25" },
  { id: "christmas",   label: "Christmas & Advent",      icon: "\u2B50" },
  { id: "easter",      label: "Easter & Resurrection",   icon: "\uD83C\uDF05" },
  { id: "children",    label: "Children's Hymns",        icon: "\uD83D\uDC11" },
  { id: "worship",     label: "Worship & Adoration",     icon: "\uD83C\uDFB5" },
  { id: "grace",       label: "Grace & Mercy",           icon: "\uD83D\uDCA7" },
  { id: "praise",      label: "Praise & Thanksgiving",   icon: "\uD83D\uDE4C" },
  { id: "comfort",     label: "Comfort & Hope",          icon: "\uD83D\uDD4A\uFE0F" },
  { id: "communion",   label: "Communion & Fellowship",  icon: "\uD83C\uDF5E" },
  { id: "mission",     label: "Mission & Evangelism",     icon: "\uD83C\uDF0D" },
];

// ─── Count per category ───
const catCounts = {};
hymns.forEach(h => {
  (h.categories || []).forEach(c => { catCounts[c] = (catCounts[c] || 0) + 1; });
});

// ─── Count per language ───
const langCounts = {};
hymns.forEach(h => { const l = h.lang || "en"; langCounts[l] = (langCounts[l] || 0) + 1; });

// ─── Write individual hymn files to lang-specific dirs ───
let written = 0;
for (const h of hymns) {
  const lang = h.lang || "en";
  const dir = path.join(OUT_DIR, lang);
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, `${h.id}.json`), JSON.stringify(h, null, 2));
  written++;
}

// ─── Build index ───
const index = {
  version: 2,
  count: hymns.length,
  languages: LANGUAGES.map(l => ({
    ...l,
    count: langCounts[l.id] || 0,
  })).filter(l => l.count > 0),
  categories: CATEGORIES.map(c => ({
    ...c,
    count: catCounts[c.id] || 0,
  })).filter(c => c.count > 0),
  hymns: hymns.map(h => ({
    id: h.id,
    lang: h.lang || "en",
    title: h.title,
    titleRomanized: h.titleRomanized || null,
    author: h.author,
    year: h.year,
    firstLine: h.lyrics?.structure?.[0]?.lines?.[0] || "",
    firstLineRomanized: h.lyrics?.structure?.[0]?.linesRomanized?.[0] || null,
    categories: h.categories || [],
    translations: h.translations || [],
  })),
};

fs.writeFileSync(path.join(OUT_DIR, "index.json"), JSON.stringify(index, null, 2));

console.log(`\n\u2705 Build complete!`);
console.log(`   ${written} hymn files across ${Object.keys(langCounts).length} language(s)`);
console.log(`   Index \u2192 public/data/hymns/index.json`);
console.log(`   Languages: ${index.languages.map(l => `${l.label} (${l.count})`).join(", ")}`);
console.log(`   Categories: ${index.categories.map(c => `${c.label} (${c.count})`).join(", ")}`);
