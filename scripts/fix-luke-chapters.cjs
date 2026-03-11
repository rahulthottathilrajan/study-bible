#!/usr/bin/env node
/**
 * fix-luke-chapters.cjs
 * Fixes Luke chapter SQL files (ch7+) where the overview was written as
 * 4 separate SELECT expressions instead of one concatenated string.
 *
 * Problem:  INSERT INTO chapters (... overview, theme, key_word_original ...)
 *           SELECT b.id, N, 'para1', 'para2', 'para3', 'para4', 'kwo', 'kwm', 'outline'
 *           → 9 expressions for 7 columns → ERROR
 *
 * Fix:      SELECT b.id, N,
 *             'para1' || E'\n\n' || 'para2' || E'\n\n' || 'para3' || E'\n\n' || 'para4',
 *             'THEME',
 *             'kwo', 'kwm', 'outline'
 *           → 7 expressions for 7 columns → OK
 *
 * Usage:    node scripts/fix-luke-chapters.cjs
 *           node scripts/fix-luke-chapters.cjs --dry-run
 */

const fs   = require('fs');
const path = require('path');

const SQL_DIR = path.join(__dirname, '..', 'sql', 'nt-chapters');
const DRY     = process.argv.includes('--dry-run');

// ── Parse all single-quoted SQL string literals from a text block ───────────
// Handles '' as escaped single quote inside a string.
function extractStringLiterals(text) {
  const results = [];
  let i = 0;
  while (i < text.length) {
    if (text[i] === "'") {
      let lit = "'";
      i++;
      while (i < text.length) {
        if (text[i] === "'" && i + 1 < text.length && text[i + 1] === "'") {
          lit += "''";
          i += 2;
        } else if (text[i] === "'") {
          lit += "'";
          i++;
          break;
        } else {
          lit += text[i++];
        }
      }
      results.push(lit);
    } else {
      i++;
    }
  }
  return results;
}

// ── Fix a single file ────────────────────────────────────────────────────────
function fixFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');

  // Extract theme from the comment header
  const themeMatch = content.match(/^--\s*Theme:\s*(.+)$/m);
  const theme = themeMatch ? themeMatch[1].trim().replace(/'/g, "''") : '';

  // Find where the verse INSERT begins (we leave that part untouched)
  const verseInsertIdx = content.indexOf('\nINSERT INTO verses');
  if (verseInsertIdx === -1) return { changed: false, reason: 'no verse INSERT found' };

  const chapterSection = content.slice(0, verseInsertIdx);
  const verseSection   = content.slice(verseInsertIdx);

  // Locate the SELECT body of the chapter INSERT
  const selectKw  = 'SELECT b.id,';
  const selectIdx = chapterSection.indexOf(selectKw);
  const fromKw    = '\nFROM books b WHERE';
  const fromIdx   = chapterSection.lastIndexOf(fromKw);

  if (selectIdx === -1 || fromIdx === -1) {
    return { changed: false, reason: 'chapter SELECT/FROM not found' };
  }

  // Everything between "SELECT b.id," and the FROM clause
  const selectBody = chapterSection.slice(selectIdx + selectKw.length, fromIdx);

  // Extract chapter number (first token after the comma)
  const chNumMatch = selectBody.match(/^\s*(\d+)\s*,/);
  if (!chNumMatch) return { changed: false, reason: 'chapter number not found' };
  const chNum = chNumMatch[1];

  // The remainder after the chapter number comma is the content body
  const contentBody = selectBody.slice(selectBody.indexOf(chNum) + chNum.length + 1);

  // Parse all string literals from the content body
  const literals = extractStringLiterals(contentBody);

  // If there are only 5 literals, the file already has the correct format
  // (overview, theme, key_word_original, key_word_meaning, outline)
  if (literals.length === 5) {
    return { changed: false, reason: 'already correct (5 content literals)' };
  }

  // We expect 7 literals (4 overview paras) or 6 literals (3 overview paras)
  if (literals.length !== 7 && literals.length !== 6) {
    return { changed: false, reason: `unexpected literal count: ${literals.length}` };
  }

  let overviewParts, kwo, kwm, outline;
  if (literals.length === 7) {
    [,,,, kwo, kwm, outline] = literals;
    overviewParts = literals.slice(0, 4);
  } else {
    [,,, kwo, kwm, outline] = literals;
    overviewParts = literals.slice(0, 3);
  }

  // Reconstruct the chapter INSERT SELECT with concatenated overview + theme
  const beforeSelect = chapterSection.slice(0, selectIdx);
  const afterFrom    = chapterSection.slice(fromIdx);

  const overviewLines = overviewParts.map((p, i) =>
    i < overviewParts.length - 1 ? `  ${p} ||` : `  ${p},`
  );

  const newSelectBody = [
    `${selectKw} ${chNum},`,
    ...overviewLines,
    `  '${theme}',`,
    `  ${kwo},`,
    `  ${kwm},`,
    `  ${outline}`,
  ].join('\n');

  const newChapterSection = beforeSelect + newSelectBody + afterFrom;
  const newContent = newChapterSection + verseSection;

  if (!DRY) {
    fs.writeFileSync(filePath, newContent, 'utf8');
  }

  return { changed: true };
}

// ── Main ─────────────────────────────────────────────────────────────────────
const files = fs.readdirSync(SQL_DIR)
  .filter(f => f.match(/^luke-chapter-\d+\.sql$/))
  .sort();

console.log(`\n=== Fix Luke Chapter INSERTs ===${DRY ? ' (DRY RUN)' : ''}\n`);

let fixed = 0, skipped = 0, failed = 0;

for (const file of files) {
  const filePath = path.join(SQL_DIR, file);
  const result = fixFile(filePath);
  if (result.changed) {
    console.log(`  ✓ Fixed  : ${file}`);
    fixed++;
  } else {
    console.log(`  - Skipped: ${file} (${result.reason})`);
    skipped++;
  }
}

console.log(`\n  Fixed: ${fixed}  Skipped: ${skipped}  Failed: ${failed}\n`);
if (DRY && fixed > 0) console.log('  Run without --dry-run to apply changes.\n');
