// Phase 3 extraction: HebrewView.js + GreekView.js from page.js
const fs = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const pageFile = path.join(ROOT, 'src/app/page.js');
const hebrewViewFile = path.join(ROOT, 'src/app/views/HebrewView.js');
const greekViewFile = path.join(ROOT, 'src/app/views/GreekView.js');

const pageContent = fs.readFileSync(pageFile, 'utf8');
const pageLines = pageContent.split('\n');
console.log(`page.js has ${pageLines.length} lines`);

// Helper: extract lines (1-indexed, inclusive) from page
function extractLines(start, end) {
  return pageLines.slice(start - 1, end).join('\n');
}

// ─────────────────────────────────────────────
// Hebrew section line ranges (1-indexed, inclusive)
// ─────────────────────────────────────────────
const hebrewSections = [
  [533,  732],  // HebrewHome
  [734,  884],  // comment + HebrewLesson
  [886, 1010],  // comment + HebrewPractice
  [2004, 2087], // HebrewGrammarHome
  [2089, 2248], // HebrewGrammarLesson
  [2250, 2341], // HebrewReadingHome
  [2343, 2886], // HebrewReading
];

// ─────────────────────────────────────────────
// Greek section line ranges (1-indexed, inclusive)
// ─────────────────────────────────────────────
const greekSections = [
  [1012, 1194], // comment + GreekHome
  [1195, 1358], // GreekLesson
  [1360, 1474], // comment + GreekPractice
  [1476, 1557], // comment + GreekGrammarHome
  [1559, 1700], // comment + GreekGrammarLesson
  [1702, 1751], // comment + GreekReadingHome
  [1753, 1845], // comment + GreekReading
];

// Ranges to REMOVE from page.js (order doesn't matter — we'll use a set)
const removeRanges = [
  [533,  1012], // Hebrew Home, Lesson, Practice + GreekHome comment
  [1013, 1845], // All Greek functions
  [2004, 2886], // Hebrew Grammar and Reading
];

// Build set of 1-indexed line numbers to remove
const removeSet = new Set();
for (const [s, e] of removeRanges) {
  for (let i = s; i <= e; i++) removeSet.add(i);
}

// ─────────────────────────────────────────────
// Write HebrewView.js
// ─────────────────────────────────────────────
const hebrewFunctions = hebrewSections
  .map(([s, e]) => extractLines(s, e))
  .join('\n\n');

const hebrewViewContent = `"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";

export default function HebrewView() {
  const {
    view, darkMode, user,
    hebrewLessons, hebrewLesson, setHebrewLesson, hebrewAlphabet, setHebrewAlphabet, hebrewVocab, setHebrewVocab,
    hebrewCategory, setHebrewCategory, hebrewProgress,
    hebrewPracticeIdx, setHebrewPracticeIdx,
    hebrewPracticeAnswer, setHebrewPracticeAnswer,
    hebrewPracticeScore, setHebrewPracticeScore,
    readingStep, setReadingStep,
    showLetters, setShowLetters,
    readingVerse, setReadingVerse,
    vocabGroup, setVocabGroup,
    grammarLesson, setGrammarLesson, grammarLessonIds,
    nav, goBack,
    markHebrewComplete, loadHebrewLesson,
  } = useApp();

${hebrewFunctions}

  if (view === "hebrew-home") return <HebrewHome />;
  if (view === "hebrew-lesson") return <HebrewLesson />;
  if (view === "hebrew-practice") return <HebrewPractice />;
  if (view === "hebrew-grammar-home") return <HebrewGrammarHome />;
  if (view === "hebrew-grammar-lesson") return <HebrewGrammarLesson />;
  if (view === "hebrew-reading-home") return <HebrewReadingHome />;
  if (view === "hebrew-reading") return <HebrewReading />;
  return null;
}
`;

fs.writeFileSync(hebrewViewFile, hebrewViewContent);
console.log(`✅ HebrewView.js written (${hebrewViewContent.split('\n').length} lines)`);

// ─────────────────────────────────────────────
// Write GreekView.js
// ─────────────────────────────────────────────
const greekFunctions = greekSections
  .map(([s, e]) => extractLines(s, e))
  .join('\n\n');

const greekViewContent = `"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";

export default function GreekView() {
  const {
    view, darkMode, user,
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, setGreekAlphabet, greekVocab, setGreekVocab,
    greekCategory, setGreekCategory, greekProgress,
    greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer,
    greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup,
    greekGrammarLesson, setGreekGrammarLesson, greekGrammarLessonIds,
    greekReadingVerse, setGreekReadingVerse,
    greekReadingStep, setGreekReadingStep,
    nav, goBack,
    markGreekComplete, loadGreekLesson,
  } = useApp();

${greekFunctions}

  if (view === "greek-home") return <GreekHome />;
  if (view === "greek-lesson") return <GreekLesson />;
  if (view === "greek-practice") return <GreekPractice />;
  if (view === "greek-grammar-home") return <GreekGrammarHome />;
  if (view === "greek-grammar-lesson") return <GreekGrammarLesson />;
  if (view === "greek-reading-home") return <GreekReadingHome />;
  if (view === "greek-reading") return <GreekReading />;
  return null;
}
`;

fs.writeFileSync(greekViewFile, greekViewContent);
console.log(`✅ GreekView.js written (${greekViewContent.split('\n').length} lines)`);

// ─────────────────────────────────────────────
// Patch page.js
// ─────────────────────────────────────────────
// 1. Remove the extracted function blocks
const newLines = [];
for (let i = 1; i <= pageLines.length; i++) {
  if (!removeSet.has(i)) newLines.push(pageLines[i - 1]);
}
let newPageContent = newLines.join('\n');

// 2. Add imports after AccountView import
newPageContent = newPageContent.replace(
  'import AccountView from "./views/AccountView";',
  'import AccountView from "./views/AccountView";\nimport HebrewView from "./views/HebrewView";\nimport GreekView from "./views/GreekView";'
);

// 3. Update the view router — replace 14 individual checks with 2 component renders
//    The exact strings come from page.js lines 3321-3334 (original numbering)
const oldRouter = `      {view === "hebrew-grammar-home" && HebrewGrammarHome()}
      {view === "hebrew-grammar-lesson" && HebrewGrammarLesson()}
      {view === "hebrew-home" && HebrewHome()}
      {view === "hebrew-lesson" && HebrewLesson()}
      {view === "hebrew-practice" && HebrewPractice()}
      {view === "hebrew-reading-home" && HebrewReadingHome()}
      {view === "hebrew-reading" && HebrewReading()}
      {view === "greek-home" && GreekHome()}
      {view === "greek-lesson" && GreekLesson()}
      {view === "greek-practice" && GreekPractice()}
      {view === "greek-grammar-home" && GreekGrammarHome()}
      {view === "greek-grammar-lesson" && GreekGrammarLesson()}
      {view === "greek-reading-home" && GreekReadingHome()}
      {view === "greek-reading" && GreekReading()}`;

const newRouter = `      {view.startsWith("hebrew-") && <HebrewView />}
      {view.startsWith("greek-") && <GreekView />}`;

if (newPageContent.includes(oldRouter)) {
  newPageContent = newPageContent.replace(oldRouter, newRouter);
  console.log('✅ View router updated');
} else {
  console.error('❌ Could not find router block to replace — check line numbers!');
  // Try to find it partially for debugging
  const firstLine = '      {view === "hebrew-grammar-home" && HebrewGrammarHome()}';
  if (newPageContent.includes(firstLine)) {
    console.log('   (first router line found — whitespace/newline mismatch?)');
  } else {
    console.log('   (first router line also missing)');
  }
}

fs.writeFileSync(pageFile, newPageContent);
const finalLineCount = newPageContent.split('\n').length;
console.log(`✅ page.js patched (${pageLines.length} → ${finalLineCount} lines, removed ${pageLines.length - finalLineCount})`);
