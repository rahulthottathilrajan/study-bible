const fs = require('fs');
const path = require('path');

const dir = 'public/data/quizzes';
const files = fs.readdirSync(dir).filter(f => f.endsWith('.json')).sort();

const CHAPTERS = {
  'genesis':50,'matthew':28,'mark':16,'luke':24,'john':21,'acts':28,
  'romans':16,'1-corinthians':16,'2-corinthians':13,'galatians':6,
  'ephesians':6,'philippians':4,'colossians':4,'1-thessalonians':5,
  '2-thessalonians':3,'1-timothy':6,'2-timothy':4,'titus':3,'philemon':1,
  'hebrews':13,'james':5,'1-peter':5,'2-peter':3,
  '1-john':5,'2-john':1,'3-john':1,'jude':1,'revelation':22
};

let totalSeeded = 0, totalNeeded = 0;

files.forEach(f => {
  const slug = f.replace('.json','');
  const data = JSON.parse(fs.readFileSync(path.join(dir, f), 'utf8'));
  const seededChs = Object.keys(data).map(Number).filter(n => {
    const ch = data[String(n)];
    return ch && (ch.kids?.length || ch.teens?.length || ch.adults?.length);
  });
  const total = CHAPTERS[slug] || '?';
  const pct = typeof total === 'number' ? Math.round(seededChs.length / total * 100) : '?';
  totalSeeded += seededChs.length;
  if (typeof total === 'number') totalNeeded += total;

  const bar = typeof total === 'number'
    ? '[' + '█'.repeat(Math.round(pct/5)) + '░'.repeat(20 - Math.round(pct/5)) + ']'
    : '';
  const missing = typeof total === 'number' && seededChs.length < total
    ? '  missing: ch ' + Array.from({length: total}, (_,i) => i+1).filter(n => !seededChs.includes(n)).join(',')
    : '';

  console.log(
    slug.padEnd(22) +
    String(seededChs.length).padStart(3) + '/' + String(total).padEnd(3) +
    ' ' + bar + ' ' + String(pct) + '%' +
    (pct < 100 ? missing : '')
  );
});

console.log('\n' + '─'.repeat(70));
console.log('Seeded chapters : ' + totalSeeded + ' / ' + totalNeeded);
console.log('Remaining       : ' + (totalNeeded - totalSeeded));
console.log('Overall         : ' + Math.round(totalSeeded / totalNeeded * 100) + '%');
