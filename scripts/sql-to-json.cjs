/**
 * sql-to-json.cjs — Parse SQL seed files → static JSON
 *
 * Reads:
 *   sql/nt-chapters/*-chapter-*.sql  → public/data/{book-slug}.json
 *   sql/quiz/quiz-seed-*.sql          → public/data/quizzes/{book-slug}.json
 *
 * Usage: node scripts/sql-to-json.cjs
 */
const fs = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const NT_DIR = path.join(ROOT, 'sql', 'nt-chapters');
const QUIZ_DIR = path.join(ROOT, 'sql', 'quiz');
const DATA_DIR = path.join(ROOT, 'public', 'data');
const QUIZ_OUT = path.join(DATA_DIR, 'quizzes');

fs.mkdirSync(DATA_DIR, { recursive: true });
fs.mkdirSync(QUIZ_OUT, { recursive: true });

// ─── Helpers ───

function slugify(name) {
  return name.toLowerCase().replace(/\s+/g, '-');
}

// Testament lookup (needed for output JSON)
const NT_BOOKS = new Set([
  'Matthew','Mark','Luke','John','Acts','Romans','1 Corinthians','2 Corinthians',
  'Galatians','Ephesians','Philippians','Colossians','1 Thessalonians','2 Thessalonians',
  '1 Timothy','2 Timothy','Titus','Philemon','Hebrews','James','1 Peter','2 Peter',
  '1 John','2 John','3 John','Jude','Revelation'
]);

// ─── SQL Parsing Utilities ───

/**
 * Read a SQL single-quoted string starting at `from`.
 * Handles '' (escaped single quotes). Returns { value, end } or null.
 */
function readSQLString(sql, from) {
  let pos = sql.indexOf("'", from);
  if (pos === -1) return null;
  pos++; // skip opening '
  let result = '';
  while (pos < sql.length) {
    if (sql[pos] === "'" && sql[pos + 1] === "'") {
      result += "'";
      pos += 2;
    } else if (sql[pos] === "'") {
      return { value: result, end: pos + 1 };
    } else {
      result += sql[pos];
      pos++;
    }
  }
  return { value: result, end: pos };
}

/**
 * Parse SQL VALUES tuples from raw text (content between "VALUES" and ") AS" or end).
 * Returns array of arrays. Each inner array: mix of strings, numbers, null.
 * Handles: single-quoted strings with '' escapes, NULL, integers, -- comments.
 */
function parseSQLValues(text) {
  const tuples = [];
  let i = 0;
  const len = text.length;

  while (i < len) {
    // Skip to next opening (
    while (i < len && text[i] !== '(') {
      // Skip -- comments
      if (text[i] === '-' && text[i + 1] === '-') {
        while (i < len && text[i] !== '\n') i++;
      }
      i++;
    }
    if (i >= len) break;
    i++; // skip (

    const values = [];
    while (i < len) {
      // Skip whitespace
      while (i < len && /[\s\n\r]/.test(text[i])) i++;
      if (i >= len || text[i] === ')') break;
      if (text[i] === ',') { i++; continue; }

      // Skip -- comments within tuple (shouldn't happen but be safe)
      if (text[i] === '-' && text[i + 1] === '-') {
        while (i < len && text[i] !== '\n') i++;
        continue;
      }

      if (text[i] === "'") {
        // Parse string
        i++; // skip opening '
        let str = '';
        while (i < len) {
          if (text[i] === "'" && text[i + 1] === "'") {
            str += "'";
            i += 2;
          } else if (text[i] === "'") {
            i++; // skip closing '
            break;
          } else {
            str += text[i];
            i++;
          }
        }
        values.push(str);
      } else {
        // Parse non-string: number or NULL
        let word = '';
        while (i < len && !/[\s,)\n\r]/.test(text[i])) {
          word += text[i];
          i++;
        }
        if (word.toUpperCase() === 'NULL') values.push(null);
        else if (/^-?\d+(\.\d+)?$/.test(word)) values.push(Number(word));
        else if (word && word !== ';') values.push(word); // ignore stray semicolons
      }
    }
    if (text[i] === ')') i++; // skip closing )

    if (values.length > 0) tuples.push(values);
  }

  return tuples;
}

// ─── Chapter Metadata Parser ───

function parseChapterMeta(sql) {
  const insertIdx = sql.indexOf('INSERT INTO chapters');
  if (insertIdx === -1) return null;

  const selectIdx = sql.indexOf('SELECT b.id,', insertIdx);
  if (selectIdx === -1) return null;

  let pos = selectIdx + 'SELECT b.id,'.length;

  // Skip whitespace, read chapter number
  while (pos < sql.length && /[\s\n\r]/.test(sql[pos])) pos++;
  let chNumStr = '';
  while (pos < sql.length && /\d/.test(sql[pos])) { chNumStr += sql[pos]; pos++; }

  // Skip to first comma after chapter number
  while (pos < sql.length && sql[pos] !== ',') pos++;
  pos++; // skip comma

  // Read 5 SQL strings: overview, theme, key_word_original, key_word_meaning, outline
  const fields = [];
  for (let f = 0; f < 5; f++) {
    const str = readSQLString(sql, pos);
    if (!str) break;
    fields.push(str.value);
    pos = str.end;
    // Skip to next value separator
    while (pos < sql.length && sql[pos] !== ',' && !sql.startsWith('FROM', pos)) pos++;
    if (sql[pos] === ',') pos++;
  }

  if (fields.length < 5) return null;

  let outline = [];
  try {
    outline = JSON.parse(fields[4]);
  } catch (e) {
    console.warn(`  WARN: Failed to parse outline JSON, wrapping as string: ${(fields[4] || '').substring(0, 60)}...`);
    outline = fields[4] ? [fields[4]] : [];
  }

  return {
    overview: fields[0] || null,
    theme: fields[1] || null,
    keyWordOriginal: fields[2] || null,
    keyWordMeaning: fields[3] || null,
    outline
  };
}

// ─── Verse Parser ───

function parseVerses(sql) {
  const insertIdx = sql.indexOf('INSERT INTO verses');
  if (insertIdx === -1) return [];

  // Find CROSS JOIN (VALUES
  const cjIdx = sql.indexOf('CROSS JOIN (VALUES', insertIdx);
  if (cjIdx === -1) return [];

  // Find closing ) AS v(
  const asIdx = sql.indexOf(') AS v(', cjIdx);
  if (asIdx === -1) return [];

  const valuesText = sql.substring(cjIdx + 'CROSS JOIN (VALUES'.length, asIdx);
  const tuples = parseSQLValues(valuesText);

  return tuples.map(t => {
    if (t.length < 2) return null;
    if (t.length !== 6 && t.length !== 2) {
      console.warn(`  WARN: Verse tuple has ${t.length} fields (expected 2 or 6), verse ${t[0]}`);
    }
    return {
      verse_number: t[0],
      kjv_text: t[1],
      original_text: t.length > 2 ? t[2] : null,
      transliteration: t.length > 3 ? t[3] : null,
      study_note: t.length > 4 ? t[4] : null,
      doctrinal_note: t.length > 5 ? t[5] : null,
    };
  }).filter(Boolean);
}

// ─── Word Studies Parser ───
// Handles two patterns:
//   A) Separate INSERT per verse: WHERE ... v.verse_number = N
//   B) Single INSERT with CASE: v.verse_number = CASE ws.word_order WHEN X THEN Y ... END

function parseWordStudies(sql) {
  const result = {}; // { "verse_number": [{ original_word, transliteration, strongs_number, meaning }] }

  let searchFrom = 0;
  while (true) {
    const insertIdx = sql.indexOf('INSERT INTO word_studies', searchFrom);
    if (insertIdx === -1) break;

    // Find the next INSERT or end of file for block boundary
    const nextInsertIdx = sql.indexOf('INSERT INTO', insertIdx + 24);
    // But also check for "-- Step" comments which might delimit sections
    const blockEnd = nextInsertIdx === -1 ? sql.length : nextInsertIdx;
    const block = sql.substring(insertIdx, blockEnd);

    // Pattern D: FROM (VALUES ...) AS alias(cols) CROSS JOIN LATERAL (... CASE alias.word_order ...)
    // Used by some legacy NT chapter seeds (e.g. john-chapter-02..05). The VALUES tuples lack
    // verse_number; mapping comes from a CASE inside the LATERAL subquery.
    const fromValuesIdx = block.indexOf('FROM (VALUES');
    const lateralIdx = block.indexOf('CROSS JOIN LATERAL');
    if (fromValuesIdx !== -1 && lateralIdx !== -1 && lateralIdx > fromValuesIdx) {
      const aliasMatch = block.substring(fromValuesIdx).match(/\)\s*AS\s+(\w+)\s*\(([^)]+)\)/);
      if (aliasMatch) {
        const alias = aliasMatch[1];
        const cols = aliasMatch[2].split(',').map(c => c.trim());
        const valuesEnd = fromValuesIdx + aliasMatch.index;
        const valuesText = block.substring(fromValuesIdx + 'FROM (VALUES'.length, valuesEnd);
        const tuples = parseSQLValues(valuesText);
        const caseMatch = block.substring(lateralIdx).match(new RegExp(`CASE\\s+${alias}\\.word_order\\s*([\\s\\S]*?)END`));
        if (caseMatch) {
          const mapping = {};
          for (const m of caseMatch[1].matchAll(/WHEN\s+(\d+)\s+THEN\s+(\d+)/g)) {
            mapping[parseInt(m[1])] = parseInt(m[2]);
          }
          const wordIdx = cols.indexOf('original_word');
          const transIdx = cols.indexOf('transliteration');
          const strongsIdx = cols.indexOf('strongs_number');
          const meaningIdx = cols.indexOf('meaning');
          const usageIdx = cols.indexOf('usage_notes');
          const orderIdx = cols.indexOf('word_order');
          for (const t of tuples) {
            if (orderIdx === -1 || t.length <= orderIdx) continue;
            const wo = parseInt(t[orderIdx]);
            const verseNum = mapping[wo];
            if (verseNum === undefined) continue;
            const meaning = (usageIdx !== -1 && t[usageIdx])
              ? `${t[meaningIdx]} — ${t[usageIdx]}`
              : t[meaningIdx];
            const key = String(verseNum);
            if (!result[key]) result[key] = [];
            result[key].push({
              original_word: t[wordIdx],
              transliteration: t[transIdx],
              strongs_number: t[strongsIdx],
              meaning
            });
          }
          searchFrom = blockEnd;
          continue;
        }
      }
    }

    // Find CROSS JOIN (VALUES
    const cjIdx = block.indexOf('CROSS JOIN (VALUES');
    if (cjIdx === -1) { searchFrom = blockEnd; continue; }

    // Find closing ) AS <alias>(<columns>)
    const aliasMatch = block.substring(cjIdx).match(/\)\s*AS\s+(\w+)\s*\(([^)]+)\)/);
    if (!aliasMatch) { searchFrom = blockEnd; continue; }
    const alias = aliasMatch[1];
    const columns = aliasMatch[2].split(',').map(c => c.trim());
    const asIdx = cjIdx + aliasMatch.index;

    const valuesText = block.substring(cjIdx + 'CROSS JOIN (VALUES'.length, asIdx);
    const tuples = parseSQLValues(valuesText);

    // Determine verse mapping from WHERE clause
    const afterAs = block.substring(asIdx);

    // Pattern A: tuples include verse_number as first column (consolidated single INSERT)
    if (columns[0] === 'verse_number') {
      for (const t of tuples) {
        if (t.length < 5) continue;
        const verseNum = parseInt(t[0]);
        if (isNaN(verseNum)) continue;
        const key = String(verseNum);
        if (!result[key]) result[key] = [];
        result[key].push({
          original_word: t[1],
          transliteration: t[2],
          strongs_number: t[3],
          meaning: t[4]
        });
      }
      searchFrom = blockEnd;
      continue;
    }

    // Pattern B: CASE pattern (legacy)
    const caseMatch = afterAs.match(new RegExp(`CASE\\s+${alias}\\.word_order\\s*([\\s\\S]*?)END`));
    if (caseMatch) {
      const mapping = {};
      const whenThens = [...caseMatch[1].matchAll(/WHEN\s+(\d+)\s+THEN\s+(\d+)/g)];
      whenThens.forEach(m => { mapping[parseInt(m[1])] = parseInt(m[2]); });

      for (const t of tuples) {
        if (t.length < 5) continue;
        // Support both 5-field (word,trans,strongs,meaning,order) and
        // 6-field (word,trans,strongs,definition,usage_note,order) tuples
        const word = t[0], trans = t[1], strongs = t[2];
        const wordOrder = t[t.length - 1]; // always last field
        const meaning = t.length >= 6 ? t[3] + ' — ' + t.slice(4, -1).join(' ') : t[3];
        const verseNum = mapping[wordOrder];
        if (verseNum === undefined) continue;
        const key = String(verseNum);
        if (!result[key]) result[key] = [];
        result[key].push({ original_word: word, transliteration: trans, strongs_number: strongs, meaning });
      }
    } else {
      // Pattern C: per-verse INSERT with literal v.verse_number = N
      const directMatch = afterAs.match(/v\.verse_number\s*=\s*(\d+)/);
      if (directMatch) {
        const verseNum = parseInt(directMatch[1]);
        const key = String(verseNum);
        if (!result[key]) result[key] = [];
        for (const t of tuples) {
          if (t.length < 4) continue;
          result[key].push({
            original_word: t[0],
            transliteration: t[1],
            strongs_number: t[2],
            meaning: t[3]
          });
        }
      }
    }

    searchFrom = blockEnd;
  }

  return result;
}

// ─── Cross References Parser ───

function parseCrossRefs(sql) {
  const result = {}; // { "verse_number": [{ reference }] }

  let searchFrom = 0;
  while (true) {
    const insertIdx = sql.indexOf('INSERT INTO cross_references', searchFrom);
    if (insertIdx === -1) break;

    const nextInsertIdx = sql.indexOf('INSERT INTO', insertIdx + 28);
    const blockEnd = nextInsertIdx === -1 ? sql.length : nextInsertIdx;
    const block = sql.substring(insertIdx, blockEnd);

    // Pattern D: FROM (VALUES ...) AS alias(cols) CROSS JOIN LATERAL (...)
    // Used by some legacy NT chapter seeds. The VALUES tuples include verse_number directly.
    // Column names vary: 'reference' (newer) or 'referenced_verse' (older); same with 'context'/'note'.
    const fromValuesIdx = block.indexOf('FROM (VALUES');
    const lateralIdx = block.indexOf('CROSS JOIN LATERAL');
    if (fromValuesIdx !== -1 && lateralIdx !== -1 && lateralIdx > fromValuesIdx) {
      const aliasMatch = block.substring(fromValuesIdx).match(/\)\s*AS\s+(\w+)\s*\(([^)]+)\)/);
      if (aliasMatch) {
        const cols = aliasMatch[2].split(',').map(c => c.trim());
        const valuesEnd = fromValuesIdx + aliasMatch.index;
        const valuesText = block.substring(fromValuesIdx + 'FROM (VALUES'.length, valuesEnd);
        const tuples = parseSQLValues(valuesText);
        const verseIdx = cols.indexOf('verse_number');
        let refIdx = cols.indexOf('reference');
        if (refIdx === -1) refIdx = cols.indexOf('referenced_verse');
        if (verseIdx !== -1 && refIdx !== -1) {
          for (const t of tuples) {
            if (t.length <= Math.max(verseIdx, refIdx)) continue;
            const key = String(t[verseIdx]);
            if (!result[key]) result[key] = [];
            result[key].push({ reference: t[refIdx] });
          }
        }
        searchFrom = blockEnd;
        continue;
      }
    }

    // Standard pattern: CROSS JOIN (VALUES ...) AS alias(verse_number, reference, ref_order)
    const cjIdx = block.indexOf('CROSS JOIN (VALUES');
    if (cjIdx === -1) { searchFrom = blockEnd; continue; }

    const aliasMatch = block.substring(cjIdx).match(/\)\s*AS\s+\w+\s*\(([^)]+)\)/);
    if (!aliasMatch) { searchFrom = blockEnd; continue; }
    const columns = aliasMatch[1].split(',').map(c => c.trim());
    const asIdx = cjIdx + aliasMatch.index;

    const valuesText = block.substring(cjIdx + 'CROSS JOIN (VALUES'.length, asIdx);
    const tuples = parseSQLValues(valuesText);

    const verseIdx = columns.indexOf('verse_number');
    const refIdx = columns.indexOf('reference');
    if (verseIdx === -1 || refIdx === -1) { searchFrom = blockEnd; continue; }

    for (const t of tuples) {
      if (t.length <= Math.max(verseIdx, refIdx)) continue;
      const key = String(t[verseIdx]);
      if (!result[key]) result[key] = [];
      result[key].push({ reference: t[refIdx] });
    }

    searchFrom = blockEnd;
  }

  return result;
}

// ─── PL/pgSQL Format Parser (legacy, e.g. genesis-chapter-01.sql) ───
// Uses DO $$ ... END $$ with per-verse INSERTs and RETURNING id INTO v_id

function parsePLpgSQLFile(filePath) {
  const sql = fs.readFileSync(filePath, 'utf8');

  // Extract book name from WHERE name = '...'
  const bookMatch = sql.match(/FROM\s+books\s+WHERE\s+name\s*=\s*'([^']+)'/);
  if (!bookMatch) return null;
  const bookName = bookMatch[1];

  // Extract chapter number from chapter_number = N (or from INSERT INTO chapters VALUES (..., N,))
  const chMatch = sql.match(/AND\s+chapter_number\s*=\s*(\d+)/);
  if (!chMatch) return null;
  const chapterNum = parseInt(chMatch[1]);

  // Parse chapter metadata from INSERT INTO chapters ... VALUES (...)
  let meta = null;
  const chapIdx = sql.indexOf('INSERT INTO chapters');
  if (chapIdx !== -1) {
    const valIdx = sql.indexOf('VALUES', chapIdx);
    if (valIdx !== -1) {
      // Skip (SELECT id ...) subquery and chapter number
      const subqStart = sql.indexOf('(SELECT', valIdx);
      if (subqStart !== -1) {
        const subqEnd = sql.indexOf(')', subqStart);
        let pos = subqEnd + 1;
        // Skip comma + whitespace + chapter number + comma
        while (pos < sql.length && sql[pos] !== ',') pos++;
        pos++; // skip comma after subquery close paren
        while (pos < sql.length && /[\s\n\r]/.test(sql[pos])) pos++;
        while (pos < sql.length && /\d/.test(sql[pos])) pos++;
        while (pos < sql.length && sql[pos] !== ',') pos++;
        pos++; // skip comma after chapter number

        const fields = [];
        for (let f = 0; f < 5; f++) {
          const str = readSQLString(sql, pos);
          if (!str) break;
          fields.push(str.value);
          pos = str.end;
          while (pos < sql.length && sql[pos] !== ',' && sql[pos] !== ')') pos++;
          if (sql[pos] === ',') pos++;
        }
        if (fields.length >= 5) {
          let outline = [];
          try { outline = JSON.parse(fields[4]); } catch { outline = fields[4] ? [fields[4]] : []; }
          meta = {
            overview: fields[0] || null,
            theme: fields[1] || null,
            keyWordOriginal: fields[2] || null,
            keyWordMeaning: fields[3] || null,
            outline
          };
        }
      }
    }
  }

  // Parse verses + word studies + cross refs from per-verse INSERT blocks
  const verses = [];
  const wordStudies = {};
  const crossRefs = {};

  // Split by verse markers: -- ═══ VERSE N ═══
  const verseBlocks = sql.split(/--\s*═+\s*VERSE\s+(\d+)\s*═+/);
  // verseBlocks: [preamble, "1", block1, "2", block2, ...]
  for (let i = 1; i < verseBlocks.length; i += 2) {
    const verseNum = parseInt(verseBlocks[i]);
    const block = verseBlocks[i + 1] || '';

    // Parse verse INSERT: VALUES (ch_id, N, 'kjv', 'original', 'transliteration', 'study_note', 'doctrinal_note'?)
    const vInsertIdx = block.indexOf('INSERT INTO verses');
    if (vInsertIdx === -1) continue;

    const vValuesIdx = block.indexOf('VALUES (ch_id,', vInsertIdx);
    if (vValuesIdx === -1) continue;

    let pos = vValuesIdx + 'VALUES (ch_id,'.length;
    // Skip whitespace + verse number + comma
    while (pos < block.length && /[\s\n\r]/.test(block[pos])) pos++;
    while (pos < block.length && /\d/.test(block[pos])) pos++;
    while (pos < block.length && block[pos] !== ',') pos++;
    pos++; // skip comma

    // Read string fields until ) RETURNING
    const vFields = [];
    while (pos < block.length) {
      while (pos < block.length && /[\s\n\r]/.test(block[pos])) pos++;
      if (block[pos] === ')') break;
      if (block[pos] === ',') { pos++; continue; }

      if (block[pos] === "'") {
        const str = readSQLString(block, pos);
        if (str) { vFields.push(str.value); pos = str.end; }
        else pos++;
      } else {
        let word = '';
        while (pos < block.length && !/[\s,)\n\r]/.test(block[pos])) { word += block[pos]; pos++; }
        if (word.toUpperCase() === 'NULL') vFields.push(null);
        else vFields.push(word);
      }
    }

    verses.push({
      verse_number: verseNum,
      kjv_text: vFields[0] || '',
      original_text: vFields.length > 1 ? vFields[1] : null,
      transliteration: vFields.length > 2 ? vFields[2] : null,
      study_note: vFields.length > 3 ? vFields[3] : null,
      doctrinal_note: vFields.length > 4 ? vFields[4] : null,
    });

    // Parse word studies in this block: VALUES (v_id, 'word', 'trans', 'G123', 'meaning', N)
    const wsIdx = block.indexOf('INSERT INTO word_studies', pos - block.length + vInsertIdx);
    const wsBlockIdx = block.indexOf('INSERT INTO word_studies');
    if (wsBlockIdx !== -1) {
      const wsValIdx = block.indexOf('VALUES', wsBlockIdx);
      if (wsValIdx !== -1) {
        const wsSemicolon = block.indexOf(';', wsValIdx);
        const wsText = block.substring(wsValIdx + 'VALUES'.length, wsSemicolon !== -1 ? wsSemicolon : undefined);
        const wsTuples = parseSQLValues(wsText);
        const key = String(verseNum);
        if (!wordStudies[key]) wordStudies[key] = [];
        for (const t of wsTuples) {
          if (t.length < 5) continue;
          // t[0] is 'v_id' (variable ref), skip it
          wordStudies[key].push({
            original_word: typeof t[0] === 'string' && t[0] === 'v_id' ? t[1] : t[0],
            transliteration: typeof t[0] === 'string' && t[0] === 'v_id' ? t[2] : t[1],
            strongs_number: typeof t[0] === 'string' && t[0] === 'v_id' ? t[3] : t[2],
            meaning: typeof t[0] === 'string' && t[0] === 'v_id' ? t[4] : t[3],
          });
        }
      }
    }

    // Parse cross references: VALUES (v_id, 'Ref', N)
    const crBlockIdx = block.indexOf('INSERT INTO cross_references');
    if (crBlockIdx !== -1) {
      const crValIdx = block.indexOf('VALUES', crBlockIdx);
      if (crValIdx !== -1) {
        const crSemicolon = block.indexOf(';', crValIdx);
        const crText = block.substring(crValIdx + 'VALUES'.length, crSemicolon !== -1 ? crSemicolon : undefined);
        const crTuples = parseSQLValues(crText);
        const key = String(verseNum);
        if (!crossRefs[key]) crossRefs[key] = [];
        for (const t of crTuples) {
          if (t.length < 2) continue;
          // t[0] is 'v_id', t[1] is reference
          const ref = typeof t[0] === 'string' && t[0] === 'v_id' ? t[1] : t[0];
          crossRefs[key].push({ reference: ref });
        }
      }
    }
  }

  return { bookName, chapterNum, meta, verses, wordStudies, crossRefs };
}

// ─── Parse One Chapter File ───

function parseChapterFile(filePath) {
  const sql = fs.readFileSync(filePath, 'utf8');

  // Try standard CROSS JOIN VALUES format first
  const bookMatch = sql.match(/WHERE\s+b\.name\s*=\s*'([^']+)'/);
  if (bookMatch) {
    const bookName = bookMatch[1];
    const chMatch = sql.match(/SELECT\s+b\.id\s*,\s*(\d+)\s*,/);
    if (!chMatch) { console.warn(`  No chapter number found in ${path.basename(filePath)}`); return null; }
    const chapterNum = parseInt(chMatch[1]);

    const meta = parseChapterMeta(sql);
    const verses = parseVerses(sql);
    const wordStudies = parseWordStudies(sql);
    const crossRefs = parseCrossRefs(sql);

    return { bookName, chapterNum, meta, verses, wordStudies, crossRefs };
  }

  // Fallback: PL/pgSQL format (e.g. genesis-chapter-01.sql)
  const plResult = parsePLpgSQLFile(filePath);
  if (plResult) return plResult;

  console.warn(`  Could not parse ${path.basename(filePath)}`);
  return null;
}

// ─── Quiz File Parser ───

function parseQuizFile(filePath) {
  const sql = fs.readFileSync(filePath, 'utf8');
  const results = {}; // { bookName: { "chNum": { difficulty: [...questions] } } }

  // Find all INSERT INTO chapter_quizzes blocks
  let searchFrom = 0;
  while (true) {
    const valuesIdx = sql.indexOf('VALUES', searchFrom);
    if (valuesIdx === -1) break;

    // Find the end: next INSERT or end of file
    const nextInsert = sql.indexOf('INSERT INTO', valuesIdx + 6);
    const blockEnd = nextInsert === -1 ? sql.length : nextInsert;
    const valuesText = sql.substring(valuesIdx + 'VALUES'.length, blockEnd);
    const tuples = parseSQLValues(valuesText);

    for (const t of tuples) {
      if (t.length < 11) continue;
      const [bookName, chNum, difficulty, qNum, question, optA, optB, optC, optD, answer, explanation] = t;

      if (!results[bookName]) results[bookName] = {};
      const ch = String(chNum);
      if (!results[bookName][ch]) results[bookName][ch] = {};
      if (!results[bookName][ch][difficulty]) results[bookName][ch][difficulty] = [];

      results[bookName][ch][difficulty].push({
        question_number: qNum,
        question,
        option_a: optA,
        option_b: optB,
        option_c: optC,
        option_d: optD,
        correct_answer: answer,
        explanation
      });
    }

    searchFrom = blockEnd;
  }

  return results;
}

// ══════════════════════════════════════════════
// MAIN: Parse chapter seeds
// ══════════════════════════════════════════════

console.log('=== SQL-to-JSON Converter ===\n');

// 1. Parse chapter seed files
const chapterFiles = fs.readdirSync(NT_DIR)
  .filter(f => f.match(/-chapter-\d+\.sql$/))
  .sort();

console.log(`Found ${chapterFiles.length} chapter seed files in sql/nt-chapters/`);

const books = {}; // { bookName: { book, testament, chapters: { "N": { meta, verses, wordStudies, crossRefs } } } }

for (const file of chapterFiles) {
  const filePath = path.join(NT_DIR, file);
  const parsed = parseChapterFile(filePath);
  if (!parsed) continue;

  const { bookName, chapterNum, meta, verses, wordStudies, crossRefs } = parsed;

  if (!books[bookName]) {
    books[bookName] = {
      book: bookName,
      testament: NT_BOOKS.has(bookName) ? 'NT' : 'OT',
      chapters: {}
    };
  }

  const chData = {};
  if (meta) chData.meta = meta;
  if (verses.length > 0) chData.verses = verses;
  if (Object.keys(wordStudies).length > 0) chData.wordStudies = wordStudies;
  if (Object.keys(crossRefs).length > 0) chData.crossRefs = crossRefs;

  books[bookName].chapters[String(chapterNum)] = chData;

  const wsCount = Object.values(wordStudies).reduce((sum, arr) => sum + arr.length, 0);
  const crCount = Object.values(crossRefs).reduce((sum, arr) => sum + arr.length, 0);
  console.log(`  ${file} → ${bookName} ch${chapterNum}: ${verses.length}v, ${wsCount}ws, ${crCount}cr`);
}

// Write enriched book JSONs
let bookCount = 0;
for (const [bookName, data] of Object.entries(books)) {
  const slug = slugify(bookName);
  const outPath = path.join(DATA_DIR, `${slug}.json`);
  fs.writeFileSync(outPath, JSON.stringify(data, null, 2));
  const chNums = Object.keys(data.chapters).sort((a, b) => a - b);
  console.log(`  Written ${slug}.json (${chNums.length} chapters: ${chNums.join(',')})`);
  bookCount++;
}

console.log(`\n${bookCount} enriched book files written to public/data/\n`);

// ══════════════════════════════════════════════
// MAIN: Parse quiz seeds
// ══════════════════════════════════════════════

const quizFiles = fs.readdirSync(QUIZ_DIR)
  .filter(f => f.match(/^quiz-seed-.*\.sql$/))
  .sort();

console.log(`Found ${quizFiles.length} quiz seed files in sql/quiz/`);

const allQuizzes = {}; // { bookName: { "chNum": { difficulty: [...] } } }

for (const file of quizFiles) {
  const filePath = path.join(QUIZ_DIR, file);
  const parsed = parseQuizFile(filePath);

  for (const [bookName, chaps] of Object.entries(parsed)) {
    if (!allQuizzes[bookName]) allQuizzes[bookName] = {};
    for (const [ch, diffs] of Object.entries(chaps)) {
      if (!allQuizzes[bookName][ch]) allQuizzes[bookName][ch] = {};
      for (const [diff, questions] of Object.entries(diffs)) {
        if (!allQuizzes[bookName][ch][diff]) allQuizzes[bookName][ch][diff] = [];
        allQuizzes[bookName][ch][diff].push(...questions);
      }
    }
  }

  // Count questions
  let qCount = 0;
  for (const chaps of Object.values(parsed)) {
    for (const diffs of Object.values(chaps)) {
      for (const qs of Object.values(diffs)) qCount += qs.length;
    }
  }
  console.log(`  ${file} → ${qCount} questions`);
}

// Write quiz JSONs per book
let quizBookCount = 0;
let totalQuestions = 0;
for (const [bookName, chaps] of Object.entries(allQuizzes)) {
  const slug = slugify(bookName);
  const outPath = path.join(QUIZ_OUT, `${slug}.json`);
  fs.writeFileSync(outPath, JSON.stringify(chaps, null, 2));

  let bqCount = 0;
  for (const diffs of Object.values(chaps)) {
    for (const qs of Object.values(diffs)) bqCount += qs.length;
  }
  console.log(`  Written quizzes/${slug}.json (${Object.keys(chaps).length} chapters, ${bqCount} questions)`);
  quizBookCount++;
  totalQuestions += bqCount;
}

console.log(`\n${quizBookCount} quiz files written (${totalQuestions} total questions)`);
console.log('\nDone! Run scripts/fetch-kjv.cjs next to add full KJV text for all 66 books.');
