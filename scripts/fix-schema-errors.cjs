#!/usr/bin/env node
/**
 * fix-schema-errors.cjs
 * Fixes three categories of schema mismatch in NT chapter SQL files.
 *
 * Bug A — John ch2-11 word_studies:
 *   Wrong column names: greek_word → original_word, definition → meaning
 *
 * Bug B — John ch2-11 cross_references:
 *   Wrong columns: (referenced_verse, relationship_type, note)
 *   → (reference, context, ref_order) using ROW_NUMBER() for order
 *
 * Bug C — Hebrews ch12-13 word_studies:
 *   SELECT uses "w." prefix but VALUES alias is "ws" → replace w. with ws.
 *
 * Bug D — Romans ch10 cross_references:
 *   INSERT column "cross_reference" → "reference"; SELECT missing ref_order
 */

const fs   = require('fs');
const path = require('path');

const SQL_DIR = path.join(__dirname, '..', 'sql', 'nt-chapters');
const DRY     = process.argv.includes('--dry-run');

function applyReplacements(content, replacements) {
  let changed = false;
  for (const [from, to] of replacements) {
    if (content.includes(from)) {
      content = content.split(from).join(to);
      changed = true;
    }
  }
  return { content, changed };
}

function fixFile(file, replacements) {
  const filePath = path.join(SQL_DIR, file);
  if (!fs.existsSync(filePath)) {
    return { status: 'missing' };
  }
  const original = fs.readFileSync(filePath, 'utf8');
  const { content, changed } = applyReplacements(original, replacements);
  if (!changed) return { status: 'skipped' };
  if (!DRY) fs.writeFileSync(filePath, content, 'utf8');
  return { status: 'fixed' };
}

// ── Bug A: John word_studies column renames ──────────────────────────────────
// John ch2-11 VALUES have 6 items: (word, trans, strongs, meaning, usage_notes, word_order)
// John ch1 VALUES have 5 items (meaning+usage_notes merged into one string) — already correct.
// Fix: rename greek_word→original_word, definition→meaning, AND add usage_notes column.
const JOHN_WS = [
  // Case 1: files not yet touched (original greek_word/definition names)
  [
    'INSERT INTO word_studies (verse_id, greek_word, transliteration, strongs_number, definition, word_order)',
    'INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, usage_notes, word_order)',
  ],
  [
    'SELECT v.id, ws.greek_word, ws.transliteration, ws.strongs_number, ws.definition, ws.word_order',
    'SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.usage_notes, ws.word_order',
  ],
  [
    'AS ws(greek_word, transliteration, strongs_number, definition, word_order)',
    'AS ws(original_word, transliteration, strongs_number, meaning, usage_notes, word_order)',
  ],
  // Case 2: files already had first round applied (original_word/meaning, missing usage_notes)
  [
    'INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, word_order)',
    'INSERT INTO word_studies (verse_id, original_word, transliteration, strongs_number, meaning, usage_notes, word_order)',
  ],
  [
    'SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order',
    'SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.usage_notes, ws.word_order',
  ],
  [
    'AS ws(original_word, transliteration, strongs_number, meaning, word_order)',
    'AS ws(original_word, transliteration, strongs_number, meaning, usage_notes, word_order)',
  ],
];

// ── Bug B+E: John cross_references column renames + LATERAL outer-FROM removal ─
// DB schema: (verse_id, reference, context, ref_order)
// SQL had:   (verse_id, referenced_verse, relationship_type, note)
// Fix: map referenced_verse→reference, note→context, add ROW_NUMBER() for ref_order
const JOHN_CR = [
  [
    'INSERT INTO cross_references (verse_id, referenced_verse, relationship_type, note)',
    'INSERT INTO cross_references (verse_id, reference, context, ref_order)',
  ],
  [
    'SELECT v.id, cr.referenced_verse, cr.relationship_type, cr.note',
    'SELECT v.id, cr.referenced_verse, cr.note, ROW_NUMBER() OVER ()::int',
  ],
];

// ── Bug E: John ch2-11 CROSS JOIN LATERAL outer-FROM conflict ─────────────────
// Both word_studies and cross_references INSERTs have:
//   FROM verses v JOIN chapters c JOIN books b CROSS JOIN (VALUES ...) CROSS JOIN LATERAL (...) v
// The outer "FROM verses v" conflicts with the LATERAL alias "v" ("table 'v' specified more than once").
// Fix: remove the outer FROM/JOIN chain so query starts directly with FROM (VALUES ...)
const JOHN_LATERAL = [
  [
    'FROM verses v\nJOIN chapters c ON v.chapter_id = c.id\nJOIN books b ON c.book_id = b.id\nCROSS JOIN (VALUES',
    'FROM (VALUES',
  ],
];

// ── Bug C: Hebrews word_studies alias typo ───────────────────────────────────
// SELECT used "w." but CROSS JOIN alias is "ws"
// Also Bug F: cross_references SELECT uses "r." but CROSS JOIN alias is "cr"
const HEBREWS_WS = [
  [
    'SELECT v.id, w.original_word, w.transliteration, w.strongs_number, w.meaning, w.word_order',
    'SELECT v.id, ws.original_word, ws.transliteration, ws.strongs_number, ws.meaning, ws.word_order',
  ],
  // cross_references: r. → cr.
  ['SELECT v.id, r.reference, r.ref_order', 'SELECT v.id, cr.reference, cr.ref_order'],
  ['AND v.verse_number = r.verse_number;', 'AND v.verse_number = cr.verse_number;'],
];

// ── Bug D: Romans cross_reference column rename ──────────────────────────────
const ROMANS_CR = [
  [
    'INSERT INTO cross_references (verse_id, cross_reference)',
    'INSERT INTO cross_references (verse_id, reference, ref_order)',
  ],
  [
    'SELECT v.id, cr.reference\n',
    'SELECT v.id, cr.reference, cr.ref_order\n',
  ],
];

// ── File → fix mapping ───────────────────────────────────────────────────────
const jobs = [
  // John ch2-10: word_studies (A), cross_references (B), LATERAL outer-FROM removal (E)
  ...Array.from({ length: 9 }, (_, i) => {
    const n = String(i + 2).padStart(2, '0');
    return [`john-chapter-${n}.sql`, [...JOHN_LATERAL, ...JOHN_WS, ...JOHN_CR]];
  }),
  // John ch11: same fixes + remove dangling external WHERE b/c clauses after each LATERAL
  ['john-chapter-11.sql', [
    ...JOHN_LATERAL,
    ...JOHN_WS,
    ...JOHN_CR,
    // After LATERAL fix removed the outer FROM, these WHERE clauses have no b/c in scope
    [') v\nWHERE b.name = \'John\' AND c.chapter_number = 11;', ') v;'],
  ]],
  // Hebrews ch12-13: word_studies alias (C)
  ['hebrews-chapter-12.sql', HEBREWS_WS],
  ['hebrews-chapter-13.sql', HEBREWS_WS],
  // Romans ch10: cross_references column rename (D)
  ['romans-chapter-10.sql', ROMANS_CR],
];

// ── Main ─────────────────────────────────────────────────────────────────────
console.log(`\n=== Fix Schema Errors ===${DRY ? ' (DRY RUN)' : ''}\n`);

let fixed = 0, skipped = 0, missing = 0;

for (const [file, replacements] of jobs) {
  const result = fixFile(file, replacements);
  if (result.status === 'fixed') {
    console.log(`  ✓ Fixed  : ${file}`);
    fixed++;
  } else if (result.status === 'skipped') {
    console.log(`  - Skipped: ${file} (already correct)`);
    skipped++;
  } else {
    console.log(`  ? Missing: ${file}`);
    missing++;
  }
}

console.log(`\n  Fixed: ${fixed}  Skipped: ${skipped}  Missing: ${missing}\n`);
if (DRY && fixed > 0) console.log('  Run without --dry-run to apply changes.\n');
