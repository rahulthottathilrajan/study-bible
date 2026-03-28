/**
 * fix-quiz-answers.cjs
 *
 * Detects and fixes quiz questions where correct_answer="a" but option_a
 * does NOT contain the correct content (the explanation references a different option).
 *
 * Strategy: For each question with correct_answer="a", score each option against
 * the explanation text using keyword overlap. If a non-A option scores significantly
 * higher, swap that option's text into option_a (keeping correct_answer as "a").
 *
 * Run: node scripts/fix-quiz-answers.cjs
 */

const fs = require("fs");
const path = require("path");

const QUIZ_DIR = path.join(__dirname, "..", "public", "data", "quizzes");

// Extract significant words (4+ chars) from a string
function sigWords(text) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, " ")
    .split(/\s+/)
    .filter(w => w.length >= 4);
}

// Score how well an option matches the explanation
function matchScore(optionText, explanationText) {
  const optWords = new Set(sigWords(optionText));
  const expWords = sigWords(explanationText);
  if (optWords.size === 0 || expWords.length === 0) return 0;
  let hits = 0;
  for (const w of optWords) {
    if (expWords.includes(w)) hits++;
  }
  return hits / optWords.size; // percentage of option words found in explanation
}

// Also check if the explanation contains a long substring from the option
function substringScore(optionText, explanationText) {
  const opt = optionText.toLowerCase().replace(/[^a-z0-9\s]/g, " ").trim();
  const exp = explanationText.toLowerCase().replace(/[^a-z0-9\s]/g, " ").trim();
  // Check for 3-word consecutive sequences from option in explanation
  const optWords = opt.split(/\s+/).filter(w => w.length >= 3);
  if (optWords.length < 3) return 0;
  let seqHits = 0;
  for (let i = 0; i <= optWords.length - 3; i++) {
    const seq = optWords.slice(i, i + 3).join(" ");
    if (exp.includes(seq)) seqHits++;
  }
  return seqHits / Math.max(1, optWords.length - 2);
}

function combinedScore(optionText, explanationText) {
  return matchScore(optionText, explanationText) * 0.5 + substringScore(optionText, explanationText) * 0.5;
}

let totalFixed = 0;
let totalChecked = 0;
const fileReports = [];

const files = fs.readdirSync(QUIZ_DIR).filter(f => f.endsWith(".json")).sort();

for (const file of files) {
  const filePath = path.join(QUIZ_DIR, file);
  const data = JSON.parse(fs.readFileSync(filePath, "utf-8"));
  let fileFixed = 0;
  const fixes = [];

  for (const [ch, diffs] of Object.entries(data)) {
    for (const [diff, qs] of Object.entries(diffs)) {
      for (const q of qs) {
        totalChecked++;
        if (q.correct_answer !== "a") continue; // only fix answer-A questions

        const exp = q.explanation;
        const scores = {};
        for (const key of ["a", "b", "c", "d"]) {
          scores[key] = combinedScore(q["option_" + key], exp);
        }

        // Find best matching option
        const bestKey = Object.entries(scores).sort((a, b) => b[1] - a[1])[0][0];

        // Only swap if:
        // 1. Best match is NOT option_a
        // 2. Best match score is meaningfully higher than option_a score
        // 3. Best match has a reasonable score (not both near-zero)
        if (bestKey !== "a" && scores[bestKey] > scores["a"] + 0.15 && scores[bestKey] >= 0.25) {
          // Swap content: move correct answer text to option_a, move option_a text to where correct was
          const correctText = q["option_" + bestKey];
          const wrongText = q.option_a;
          q.option_a = correctText;
          q["option_" + bestKey] = wrongText;
          // correct_answer stays "a"

          fileFixed++;
          totalFixed++;
          fixes.push({
            ch, diff, qn: q.question_number,
            from: bestKey,
            oldA: wrongText.substring(0, 50),
            newA: correctText.substring(0, 50),
            scoreA: scores["a"].toFixed(2),
            scoreBest: scores[bestKey].toFixed(2),
          });
        }
      }
    }
  }

  if (fileFixed > 0) {
    // Write fixed data back
    fs.writeFileSync(filePath, JSON.stringify(data, null, 2) + "\n");
    fileReports.push({ file, fixed: fileFixed, fixes });
  }
}

// Report
console.log("═══════════════════════════════════════════════");
console.log("QUIZ ANSWER FIX REPORT");
console.log("═══════════════════════════════════════════════");
console.log(`Total questions checked: ${totalChecked}`);
console.log(`Total fixes applied: ${totalFixed}`);
console.log(`Files modified: ${fileReports.length}`);
console.log("");

for (const r of fileReports) {
  console.log(`📄 ${r.file} — ${r.fixed} fixes`);
  for (const f of r.fixes.slice(0, 5)) {
    console.log(`   Ch${f.ch} ${f.diff} Q${f.qn}: swapped opt_${f.from} → opt_a (score ${f.scoreA} → ${f.scoreBest})`);
    console.log(`     was: "${f.oldA}..."`);
    console.log(`     now: "${f.newA}..."`);
  }
  if (r.fixes.length > 5) {
    console.log(`   ... and ${r.fixes.length - 5} more fixes`);
  }
  console.log("");
}

console.log("Done! Verify with: node scripts/fix-quiz-answers.cjs (should show 0 fixes on re-run)");
