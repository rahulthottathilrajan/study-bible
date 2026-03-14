const fs = require('fs');
const path = require('path');
const dir = path.join(__dirname, '..', 'public', 'data');
let totalChars = 0, totalVerses = 0, totalChapters = 0;
const files = fs.readdirSync(dir).filter(f => f.endsWith('.json') && f !== 'verse-counts.json');
for (const f of files) {
  try {
    const data = JSON.parse(fs.readFileSync(path.join(dir, f), 'utf-8'));
    if (!data.chapters) continue;
    for (const [ch, cData] of Object.entries(data.chapters)) {
      totalChapters++;
      if (cData.verses) {
        for (const v of cData.verses) {
          totalVerses++;
          totalChars += (v.kjv_text || '').length;
        }
      }
    }
  } catch {}
}
console.log('Total verses:', totalVerses);
console.log('Total chapters:', totalChapters);
console.log('Total characters (KJV text):', totalChars.toLocaleString());
console.log('');
console.log('=== ElevenLabs Cost Estimates (one-time, pre-generate all) ===');
const k = totalChars / 1000;
console.log('Creator plan ($0.30/1K chars): $' + (k * 0.30).toFixed(0));
console.log('Scale plan ($0.18/1K chars):   $' + (k * 0.18).toFixed(0));
console.log('Business plan ($0.12/1K):      $' + (k * 0.12).toFixed(0));
console.log('');
console.log('Avg chars/chapter:', Math.round(totalChars / totalChapters));
console.log('Avg cost/chapter (Creator): $' + (totalChars / totalChapters / 1000 * 0.30).toFixed(2));
