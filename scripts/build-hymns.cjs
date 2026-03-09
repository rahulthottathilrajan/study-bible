#!/usr/bin/env node
/**
 * build-hymns.cjs — Combines hymn data modules and generates:
 *   public/data/hymns/index.json   (lightweight catalogue)
 *   public/data/hymns/en/{slug}.json  (per-hymn full data)
 *
 * Usage: node scripts/build-hymns.cjs
 */
const fs = require("fs");
const path = require("path");

const OUT_DIR = path.join(__dirname, "..", "public", "data", "hymns");
const EN_DIR = path.join(OUT_DIR, "en");

// Ensure directories exist
fs.mkdirSync(EN_DIR, { recursive: true });

// ─── Load hymn data modules ───
const classicHymns = require("./hymn-data-classic.cjs");
const pentecostalHymns = require("./hymn-data-pentecostal.cjs");
const seasonalHymns = require("./hymn-data-seasonal.cjs");

const allHymns = [...classicHymns, ...pentecostalHymns, ...seasonalHymns];

// ─── Deduplicate by id ───
const seen = new Set();
const hymns = [];
for (const h of allHymns) {
  if (seen.has(h.id)) {
    console.log(`  ⚠ Skipping duplicate: ${h.id}`);
    continue;
  }
  seen.add(h.id);
  hymns.push(h);
}

// ─── Category definitions ───
const CATEGORIES = [
  { id: "classic",     label: "Classic Protestant",      icon: "✝️" },
  { id: "pentecostal", label: "Holy Spirit & Revival",   icon: "🔥" },
  { id: "christmas",   label: "Christmas & Advent",      icon: "⭐" },
  { id: "easter",      label: "Easter & Resurrection",   icon: "🌅" },
  { id: "children",    label: "Children's Hymns",        icon: "🐑" },
  { id: "worship",     label: "Worship & Adoration",     icon: "🎵" },
  { id: "grace",       label: "Grace & Mercy",           icon: "💧" },
  { id: "praise",      label: "Praise & Thanksgiving",   icon: "🙌" },
  { id: "comfort",     label: "Comfort & Hope",          icon: "🕊️" },
  { id: "communion",   label: "Communion & Fellowship",  icon: "🍞" },
  { id: "mission",     label: "Mission & Evangelism",     icon: "🌍" },
];

// ─── Count per category ───
const catCounts = {};
hymns.forEach(h => {
  (h.categories || []).forEach(c => { catCounts[c] = (catCounts[c] || 0) + 1; });
});

// ─── Write individual hymn files ───
let written = 0;
for (const h of hymns) {
  const filePath = path.join(EN_DIR, `${h.id}.json`);
  fs.writeFileSync(filePath, JSON.stringify(h, null, 2));
  written++;
}

// ─── Build index ───
const index = {
  version: 1,
  count: hymns.length,
  categories: CATEGORIES.map(c => ({
    ...c,
    count: catCounts[c.id] || 0,
  })).filter(c => c.count > 0),
  hymns: hymns.map(h => ({
    id: h.id,
    title: h.title,
    author: h.author,
    year: h.year,
    firstLine: h.lyrics?.structure?.[0]?.lines?.[0] || "",
    categories: h.categories || [],
    translations: h.translations || [],
  })),
};

fs.writeFileSync(path.join(OUT_DIR, "index.json"), JSON.stringify(index, null, 2));

console.log(`\n✅ Build complete!`);
console.log(`   ${written} hymn files → public/data/hymns/en/`);
console.log(`   Index → public/data/hymns/index.json`);
console.log(`   Categories: ${index.categories.map(c => `${c.label} (${c.count})`).join(", ")}`);
