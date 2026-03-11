// run-append-term2.cjs
// Combines both Term 2 batches and appends to TeensCurriculumData.js
const fs = require("fs");
const path = require("path");

const TARGET = path.join(__dirname, "../src/app/components/TeensCurriculumData.js");

const BATCH_A = require("./append-term2-teens.cjs");
const BATCH_B = require("./append-term2-teens-b.cjs");

const ALL_TERM2 = [...BATCH_A, ...BATCH_B];

console.log(`Loaded ${ALL_TERM2.length} Term 2 lessons (weeks ${ALL_TERM2[0].week}–${ALL_TERM2[ALL_TERM2.length-1].week})`);

// Read the existing file
let content = fs.readFileSync(TARGET, "utf8");

// Verify the end marker exists
const END_MARKER = "]; // end TEEN_LESSONS";
if (!content.includes(END_MARKER)) {
  console.error("ERROR: Could not find end marker ']; // end TEEN_LESSONS' in file");
  process.exit(1);
}

// Helper: serialize a lesson object to JS source
function serializeLesson(lesson) {
  const lines = [];
  lines.push(`  // ${"═".repeat(51)}`);
  lines.push(`  // WEEK ${lesson.week} — ${lesson.title.toUpperCase()}`);
  lines.push(`  // ${"═".repeat(51)}`);
  lines.push(`  {`);
  lines.push(`    week: ${lesson.week},`);
  lines.push(`    title: ${JSON.stringify(lesson.title)},`);
  lines.push(`    bibleRef: ${JSON.stringify(lesson.bibleRef)},`);
  lines.push(`    keyVerse: ${JSON.stringify(lesson.keyVerse)},`);
  lines.push(`    theme: ${JSON.stringify(lesson.theme)},`);
  lines.push(`    term: ${JSON.stringify(lesson.term)},`);
  lines.push(`    month: ${JSON.stringify(lesson.month)},`);
  lines.push(`    icon: ${JSON.stringify(lesson.icon)},`);
  lines.push(`    color: ${JSON.stringify(lesson.color)},`);
  lines.push(``);
  lines.push(`    hook: ${JSON.stringify(lesson.hook)},`);
  lines.push(``);

  // deepDive
  const dd = lesson.deepDive;
  lines.push(`    deepDive: {`);
  lines.push(`      passage: ${JSON.stringify(dd.passage)},`);
  lines.push(`      context: ${JSON.stringify(dd.context)},`);
  lines.push(`      keyPoints: [`);
  for (const kp of dd.keyPoints) lines.push(`        ${JSON.stringify(kp)},`);
  lines.push(`      ],`);
  lines.push(`      obedienceLink: ${JSON.stringify(dd.obedienceLink)},`);
  lines.push(`    },`);
  lines.push(``);

  // wordStudy
  const ws = lesson.wordStudy;
  lines.push(`    wordStudy: {`);
  lines.push(`      word: ${JSON.stringify(ws.word)},`);
  lines.push(`      original: ${JSON.stringify(ws.original)},`);
  lines.push(`      transliteration: ${JSON.stringify(ws.transliteration)},`);
  lines.push(`      strongsNumber: ${JSON.stringify(ws.strongsNumber)},`);
  lines.push(`      language: ${JSON.stringify(ws.language)},`);
  lines.push(`      definition: ${JSON.stringify(ws.definition)},`);
  lines.push(`      usage: ${JSON.stringify(ws.usage)},`);
  lines.push(`      connection: ${JSON.stringify(ws.connection)},`);
  lines.push(`      relatedVerses: [`);
  for (const rv of ws.relatedVerses) lines.push(`        ${JSON.stringify(rv)},`);
  lines.push(`      ],`);
  lines.push(`    },`);
  lines.push(``);

  // faithStory
  const fs2 = lesson.faithStory;
  lines.push(`    faithStory: {`);
  lines.push(`      title: ${JSON.stringify(fs2.title)},`);
  lines.push(`      narrative: ${JSON.stringify(fs2.narrative)},`);
  lines.push(`      moralLesson: ${JSON.stringify(fs2.moralLesson)},`);
  lines.push(`    },`);
  lines.push(``);

  // prophecyConnection
  const pc = lesson.prophecyConnection;
  lines.push(`    prophecyConnection: {`);
  lines.push(`      title: ${JSON.stringify(pc.title)},`);
  lines.push(`      otRef: ${JSON.stringify(pc.otRef)},`);
  lines.push(`      otText: ${JSON.stringify(pc.otText)},`);
  lines.push(`      ntRef: ${JSON.stringify(pc.ntRef)},`);
  lines.push(`      ntText: ${JSON.stringify(pc.ntText)},`);
  lines.push(`      explanation: ${JSON.stringify(pc.explanation)},`);
  lines.push(`      status: ${JSON.stringify(pc.status)},`);
  lines.push(`    },`);
  lines.push(``);

  // thinkDeeper
  const td = lesson.thinkDeeper;
  lines.push(`    thinkDeeper: {`);
  lines.push(`      question: ${JSON.stringify(td.question)},`);
  lines.push(`      challenge: ${JSON.stringify(td.challenge)},`);
  lines.push(`      hints: [`);
  for (const h of td.hints) lines.push(`        ${JSON.stringify(h)},`);
  lines.push(`      ],`);
  lines.push(`      conclusion: ${JSON.stringify(td.conclusion)},`);
  lines.push(`    },`);
  lines.push(``);

  // discussionQuestions
  lines.push(`    discussionQuestions: [`);
  for (const dq of lesson.discussionQuestions) lines.push(`      ${JSON.stringify(dq)},`);
  lines.push(`    ],`);
  lines.push(``);

  // journalPrompt
  const jp = lesson.journalPrompt;
  lines.push(`    journalPrompt: {`);
  lines.push(`      prompt: ${JSON.stringify(jp.prompt)},`);
  lines.push(`      reflection: ${JSON.stringify(jp.reflection)},`);
  lines.push(`    },`);
  lines.push(``);

  lines.push(`    memoryVerse: ${JSON.stringify(lesson.memoryVerse)},`);
  lines.push(`    closingPrayer: ${JSON.stringify(lesson.closingPrayer)},`);
  lines.push(``);
  lines.push(`    leaderNote: ${JSON.stringify(lesson.leaderNote)},`);
  lines.push(`  },`);
  lines.push(``);

  return lines.join("\n");
}

// Build the Term 2 block
let term2Block = "\n  // ═══════════════════════════════════════════════════\n";
term2Block += "  // TERM 2: HEROES OF FAITH & OBEDIENCE (Weeks 14-26)\n";
term2Block += "  // ═══════════════════════════════════════════════════\n\n";

for (const lesson of ALL_TERM2) {
  term2Block += serializeLesson(lesson);
}

// Insert before the end marker
const newContent = content.replace(END_MARKER, term2Block + END_MARKER);

// Write back
fs.writeFileSync(TARGET, newContent, "utf8");

const finalLines = newContent.split("\n").length;
console.log(`✅ Done! File updated: ${finalLines} lines total.`);
console.log(`   Added ${ALL_TERM2.length} lessons (W14–W26)`);
