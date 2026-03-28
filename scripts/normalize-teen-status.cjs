/**
 * Normalize prophecyConnection.status values in TeensCurriculumData.js
 * Maps ~45 verbose status descriptions → 4 standard categories:
 *   Literal Fulfilment, Typological, Partial, Awaiting
 */
const fs = require("fs");
const path = require("path");

const FILE = path.join(__dirname, "..", "src", "app", "components", "TeensCurriculumData.js");
let content = fs.readFileSync(FILE, "utf8");

const STANDARD = ["literal fulfilment", "typological", "partial", "awaiting"];

let count = 0;
content = content.replace(/status:\s*"([^"]+)"/g, (match, status) => {
  const s = status.toLowerCase();
  if (STANDARD.includes(s)) return match; // already standard

  let category;
  if (s.startsWith("partially fulfilled") || s.includes("to be finally fulfilled")) {
    category = "Partial";
  } else if (
    s.startsWith("typological") ||
    s.includes("prophetic type") ||
    s.includes("christophany") ||
    s.includes("providence")
  ) {
    category = "Typological";
  } else if (s.includes("awaiting")) {
    category = "Awaiting";
  } else {
    // Fulfilled, Direct Prediction, Davidic Covenant, Pattern fulfilled,
    // Continuously fulfilled, Foretold, etc.
    category = "Literal Fulfilment";
  }
  count++;
  return `status: "${category}"`;
});

fs.writeFileSync(FILE, content, "utf8");
console.log(`Done! Normalized ${count} status values to standard categories.`);
