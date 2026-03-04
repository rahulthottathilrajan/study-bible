// Phase 4 extraction: BibleView.js + JournalView.js + LearnView.js from page.js
const fs = require('fs');
const path = require('path');

const ROOT = path.join(__dirname, '..');
const pageFile = path.join(ROOT, 'src/app/page.js');
const bibleViewFile = path.join(ROOT, 'src/app/views/BibleView.js');
const journalViewFile = path.join(ROOT, 'src/app/views/JournalView.js');
const learnViewFile = path.join(ROOT, 'src/app/views/LearnView.js');

const pageContent = fs.readFileSync(pageFile, 'utf8');
const pageLines = pageContent.split('\n');
console.log(`page.js has ${pageLines.length} lines`);

// Helper: extract lines (1-indexed, inclusive) from page
function extractLines(start, end) {
  return pageLines.slice(start - 1, end).join('\n');
}

// ─────────────────────────────────────────────
// BibleView section line ranges
// Books (70-116), Chapters (118-250), VerseList (252-320), VerseStudy (321-485)
// ─────────────────────────────────────────────
const bibleSections = [
  [70, 485],   // Books + Chapters + VerseList + VerseStudy
];

// ─────────────────────────────────────────────
// JournalView section line ranges
// Highlights (486-531), JournalHome (592-692)
// ─────────────────────────────────────────────
const journalSections = [
  [486, 531],  // Highlights
  [592, 692],  // JournalHome
];

// ─────────────────────────────────────────────
// LearnView section line ranges
// LearnHome (536-591), Timeline (698-1097)
// Note: const st at line 696 is included in the template, not extracted
// ─────────────────────────────────────────────
const learnSections = [
  [536, 591],  // LearnHome
  [698, 1097], // TimelineHome + TimelineBar + TimelineEras + TimelineEraDetail
];

// Ranges to REMOVE from page.js (lines 70-1097 = all inner functions)
const removeRange = [70, 1097];

// Build set of 1-indexed line numbers to remove
const removeSet = new Set();
for (let i = removeRange[0]; i <= removeRange[1]; i++) removeSet.add(i);

// ─────────────────────────────────────────────
// Write BibleView.js
// ─────────────────────────────────────────────
const bibleFunctions = bibleSections
  .map(([s, e]) => extractLines(s, e))
  .join('\n\n');

const bibleViewContent = `"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, HIGHLIGHT_COLORS } from "../constants";
import { ChevIcon, Badge, Label, Card, Btn, Spinner, DBBadge } from "../components/ui";
import Header from "../components/Header";

export default function BibleView() {
  const {
    view, book, chapter, verse, setVerse, tab, setTab, loading, dbLive,
    testament, fontSize, setFontSize, FS, dbChapters, collapsed, setCollapsed,
    booksCollapsed, setBooksCollapsed, overviewOpen, setOverviewOpen,
    chapterMeta, verses, wordStudies, crossRefs,
    user, userNote, savedNote, noteLoading, highlight, shareCopied, communityNotes,
    setPrayerModal, setPrayerTitle, setPrayerText, noteRef,
    isOT, currentVerse, verseNums, curIdx, t, ht, bookInfo,
    saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage, nav, goBack,
  } = useApp();

${bibleFunctions}

  if (view === "books") return <Books />;
  if (view === "chapter") return <Chapters />;
  if (view === "verses") return <VerseList />;
  if (view === "verse") return <VerseStudy />;
  return null;
}
`;

fs.writeFileSync(bibleViewFile, bibleViewContent);
console.log(`✅ BibleView.js written (${bibleViewContent.split('\n').length} lines)`);

// ─────────────────────────────────────────────
// Write JournalView.js
// ─────────────────────────────────────────────
const journalFunctions = journalSections
  .map(([s, e]) => extractLines(s, e))
  .join('\n\n');

const journalViewContent = `"use client";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";

export default function JournalView() {
  const {
    view, ht, user, allHighlights, hlLoading,
    tab, setTab, prayers, prayerLoading,
    prayerTitle, setPrayerTitle, prayerText, setPrayerText,
    addPrayer, togglePrayerAnswered, deletePrayer, nav,
  } = useApp();

${journalFunctions}

  if (view === "highlights") return <Highlights />;
  if (view === "journal-home") return <JournalHome />;
  return null;
}
`;

fs.writeFileSync(journalViewFile, journalViewContent);
console.log(`✅ JournalView.js written (${journalViewContent.split('\n').length} lines)`);

// ─────────────────────────────────────────────
// Write LearnView.js
// ─────────────────────────────────────────────
const learnFunctions = learnSections
  .map(([s, e]) => extractLines(s, e))
  .join('\n\n');

const learnViewContent = `"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";

export default function LearnView() {
  const {
    view, darkMode, ht, nav, goBack,
    timelineEras, timelineEvents, timelineSelectedEra, setTimelineSelectedEra,
    timelineLoading, timelineEventsLoading, timelineExpandedEvent, setTimelineExpandedEvent,
    timelineSearchQuery, setTimelineSearchQuery, timelineAllEvents,
    timelineSearchActive, setTimelineSearchActive,
    loadAllTimelineEvents, loadTimelineEvents,
  } = useApp();

  const st = darkMode ? DARK_THEMES.sunrise : THEMES.sunrise;

${learnFunctions}

  if (view === "learn-home") return <LearnHome />;
  if (view === "timeline-home") return <TimelineHome />;
  if (view === "timeline-era") return <TimelineEras />;
  if (view === "timeline-era-detail") return <TimelineEraDetail />;
  return null;
}
`;

fs.writeFileSync(learnViewFile, learnViewContent);
console.log(`✅ LearnView.js written (${learnViewContent.split('\n').length} lines)`);

// ─────────────────────────────────────────────
// Patch page.js
// ─────────────────────────────────────────────
// 1. Remove the extracted function blocks (lines 70-1097)
const newLines = [];
for (let i = 1; i <= pageLines.length; i++) {
  if (!removeSet.has(i)) newLines.push(pageLines[i - 1]);
}
let newPageContent = newLines.join('\n');

// 2. Add imports after GreekView import
newPageContent = newPageContent.replace(
  'import GreekView from "./views/GreekView";',
  'import GreekView from "./views/GreekView";\nimport BibleView from "./views/BibleView";\nimport JournalView from "./views/JournalView";\nimport LearnView from "./views/LearnView";'
);

if (!newPageContent.includes('import BibleView from "./views/BibleView"')) {
  console.error('❌ Import injection failed — could not find GreekView import line');
  process.exit(1);
}
console.log('✅ Imports added');

// 3. Update the view router — replace individual function calls with component renders
const oldRouter = `      {view === "books" && Books()}
      {view === "chapter" && Chapters()}
      {view === "verses" && VerseList()}
      {view === "verse" && VerseStudy()}
      {view === "highlights" && Highlights()}
      {view === "account" && <AccountView />}
      {view === "learn-home" && LearnHome()}
      {view === "journal-home" && JournalHome()}
      {view.startsWith("hebrew-") && <HebrewView />}
      {view.startsWith("greek-") && <GreekView />}
      {view === "timeline-home" && TimelineHome()}
      {view === "timeline-maps" && <TimelineMaps nav={nav} darkMode={darkMode} />}
      {view === "timeline-books" && <BibleBookTimeline nav={nav} darkMode={darkMode} />}
      {view === "prophecy-home" && <ProphecyFulfilment nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "timeline-archaeology" && <ArchaeologyCards nav={nav} darkMode={darkMode} />}
      {view === "apologetics-home" && <Apologetics nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "reading-plans-home" && <ReadingPlans nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "kids-curriculum-home" && <KidsCurriculum nav={nav} darkMode={darkMode} />}
      {view === "timeline-era" && TimelineEras()}
      {view === "timeline-era-detail" && TimelineEraDetail()}`;

const newRouter = `      {(view === "books" || view === "chapter" || view === "verses" || view === "verse") && <BibleView />}
      {(view === "highlights" || view === "journal-home") && <JournalView />}
      {view === "account" && <AccountView />}
      {(view === "learn-home" || view === "timeline-home" || view === "timeline-era" || view === "timeline-era-detail") && <LearnView />}
      {view.startsWith("hebrew-") && <HebrewView />}
      {view.startsWith("greek-") && <GreekView />}
      {view === "timeline-maps" && <TimelineMaps nav={nav} darkMode={darkMode} />}
      {view === "timeline-books" && <BibleBookTimeline nav={nav} darkMode={darkMode} />}
      {view === "prophecy-home" && <ProphecyFulfilment nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "timeline-archaeology" && <ArchaeologyCards nav={nav} darkMode={darkMode} />}
      {view === "apologetics-home" && <Apologetics nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "reading-plans-home" && <ReadingPlans nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "kids-curriculum-home" && <KidsCurriculum nav={nav} darkMode={darkMode} />}`;

if (newPageContent.includes(oldRouter)) {
  newPageContent = newPageContent.replace(oldRouter, newRouter);
  console.log('✅ View router updated');
} else {
  console.error('❌ Could not find router block to replace — check line numbers!');
  // Debug: check if first line of old router is present
  const firstLine = '      {view === "books" && Books()}';
  if (newPageContent.includes(firstLine)) {
    console.log('   (first router line found — whitespace/newline mismatch in multi-line block?)');
  } else {
    console.log('   (first router line also missing — functions may have already been removed or line numbers shifted)');
  }
}

fs.writeFileSync(pageFile, newPageContent);
const finalLineCount = newPageContent.split('\n').length;
console.log(`✅ page.js patched (${pageLines.length} → ${finalLineCount} lines, removed ${pageLines.length - finalLineCount})`);
