const fs = require('fs');
const path = require('path');

const dataDir = path.join(__dirname, '..', 'public', 'data');
const files = fs.readdirSync(dataDir).filter(f => f.endsWith('.json') && !f.includes('verse-counts'));

const counts = {};
let totalBooks = 0;
let totalChapters = 0;

for (const file of files) {
  const data = JSON.parse(fs.readFileSync(path.join(dataDir, file), 'utf8'));
  if (!data.chapters || !data.book) continue;
  counts[data.book] = {};
  totalBooks++;
  for (const [ch, chData] of Object.entries(data.chapters)) {
    counts[data.book][ch] = chData.verses ? chData.verses.length : 0;
    totalChapters++;
  }
}

fs.writeFileSync(
  path.join(dataDir, 'verse-counts.json'),
  JSON.stringify(counts)
);

console.log(`Generated verse counts: ${totalBooks} books, ${totalChapters} chapters`);
