"use client";

import { QUIZ_BOOKS } from "../../constants";
import { Spinner } from "../../components/ui";

function ChapterHeader({ chapterNumber, chapterTheme, setChapterHeaderRef, t }) {
  return (
    <div
      ref={(element) => setChapterHeaderRef(chapterNumber, element)}
      data-chapter={chapterNumber}
      style={{
        textAlign: "center",
        padding: "28px 20px 20px",
        background: t.accentLight,
        border: `1px solid ${t.accentBorder}`,
        borderRadius: 16,
        marginBottom: 14,
        boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
      }}
    >
      <div
        style={{
          fontFamily: t.ui,
          fontSize: 11,
          fontWeight: 700,
          color: t.accent,
          textTransform: "uppercase",
          letterSpacing: "0.28em",
          marginBottom: 6,
        }}
      >
        {"CHAPTER " + String(chapterNumber).split("").join(" ")}
      </div>
      {chapterTheme && (
        <div
          style={{
            fontFamily: t.heading,
            fontSize: 16,
            fontWeight: 600,
            color: t.dark,
            lineHeight: 1.4,
            marginBottom: 10,
          }}
        >
          {chapterTheme}
        </div>
      )}
      <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: 8 }}>
        <div style={{ width: 28, height: 1, background: t.accentBorder }} />
        <div
          style={{
            width: 7,
            height: 7,
            borderRadius: "50%",
            background: t.accent,
            flexShrink: 0,
          }}
        />
        <div style={{ width: 28, height: 1, background: t.accentBorder }} />
      </div>
    </div>
  );
}

function VerseRow({
  chapterNumber,
  verseData,
  isLast,
  highlight,
  note,
  communityNotes,
  isPlayingVerse,
  t,
  FS,
  fontSize,
  rtlStyle,
  setVerseRef,
  nav,
  renderVerseText,
}) {
  const highlightColor = highlight?.highlight_color;
  const isBookmarked = highlight?.is_bookmarked;
  const hasNote = !!note;
  const communityCount = communityNotes?.length || 0;
  const refKey = `${chapterNumber}-${verseData.verse_number}`;

  return (
    <button
      key={refKey}
      ref={(element) => setVerseRef(refKey, element)}
      onClick={() => nav("verse", { verse: verseData.verse_number, chapter: chapterNumber, tab: "study" })}
      style={{
        width: "100%",
        background: isPlayingVerse ? `${t.accent}10` : highlightColor ? `${highlightColor}08` : "transparent",
        borderLeft: isPlayingVerse ? `3px solid ${t.accent}` : highlightColor ? `3px solid ${highlightColor}` : "3px solid transparent",
        borderRight: "none",
        borderTop: "none",
        borderBottom: isLast ? "none" : `1px solid ${t.divider}`,
        padding: "14px 16px",
        textAlign: "left",
        cursor: "pointer",
        display: "flex",
        gap: 12,
        alignItems: "flex-start",
        transition: "all 0.25s",
        position: "relative",
        animation: isPlayingVerse ? "verseGlow 2s ease-in-out infinite" : "none",
      }}
    >
      <span
        style={{
          fontFamily: t.heading,
          fontSize: 22,
          fontWeight: 800,
          color: highlightColor || t.verseNum,
          minWidth: 28,
          textAlign: "center",
          lineHeight: 1.2,
          flexShrink: 0,
        }}
      >
        {verseData.verse_number}
      </span>
      <div style={{ flex: 1, minWidth: 0 }}>
        {renderVerseText(verseData.kjv_text, verseData.verse_number, {
          fontFamily: t.body,
          fontSize: FS[fontSize].list,
          color: t.text,
          lineHeight: 1.65,
          ...rtlStyle,
        })}
      </div>
      {(isBookmarked || hasNote || communityCount > 0) && (
        <div style={{ display: "flex", alignItems: "center", gap: 4, flexShrink: 0, alignSelf: "flex-start", marginTop: 2 }}>
          {isBookmarked && <span style={{ fontSize: 12, color: "#FFD700" }}>*</span>}
          {hasNote && <span style={{ fontSize: 11, color: t.muted }}>Note</span>}
          {communityCount > 0 && (
            <span
              style={{
                fontFamily: t.ui,
                fontSize: 9,
                color: t.accent,
                fontWeight: 700,
                background: `${t.accent}12`,
                borderRadius: 4,
                padding: "1px 4px",
              }}
            >
              {communityCount}
            </span>
          )}
        </div>
      )}
    </button>
  );
}

function ChapterActions({
  book,
  chapterNumber,
  user,
  isRead,
  bestPct,
  darkMode,
  t,
  nav,
  markChapterRead,
}) {
  return (
    <div style={{ marginTop: 16, display: "flex", flexDirection: "column", gap: 10 }}>
      <button
        onClick={() => (user ? (!isRead && markChapterRead(book, chapterNumber)) : nav("account"))}
        style={{
          width: "100%",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          gap: 8,
          padding: "12px 16px",
          borderRadius: 12,
          background: isRead
            ? (darkMode ? "rgba(74,222,128,0.12)" : "rgba(74,222,128,0.08)")
            : (darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)"),
          border: `1px solid ${isRead ? "rgba(74,222,128,0.3)" : t.divider}`,
          cursor: isRead ? "default" : "pointer",
          transition: "all 0.2s",
        }}
      >
        {isRead ? (
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#4ade80" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
            <polyline points="20 6 9 17 4 12" />
          </svg>
        ) : (
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={t.muted} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
            <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
          </svg>
        )}
        <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: isRead ? "#4ade80" : t.muted }}>
          {isRead ? "Chapter Read" : "Mark as Read"}
        </span>
      </button>

      {QUIZ_BOOKS.includes(book) && (
        <button
          onClick={() => nav("quiz-intro", { book, chapter: chapterNumber })}
          style={{
            width: "100%",
            padding: "18px 20px",
            borderRadius: 14,
            background: darkMode
              ? "linear-gradient(135deg, #312e81 0%, #4c1d95 50%, #581c87 100%)"
              : "linear-gradient(135deg, #7c3aed 0%, #6d28d9 50%, #5b21b6 100%)",
            border: "none",
            cursor: "pointer",
            boxShadow: "0 4px 20px rgba(124,58,237,0.3)",
            textAlign: "left",
            position: "relative",
            overflow: "hidden",
          }}
        >
          <div
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              background: "linear-gradient(90deg,transparent 0%,rgba(255,255,255,0.08) 50%,transparent 100%)",
              backgroundSize: "200% 100%",
              animation: "scanLine 3s linear infinite",
              pointerEvents: "none",
            }}
          />
          <div style={{ position: "relative", display: "flex", alignItems: "center", gap: 12 }}>
            <div style={{ fontSize: 28, flexShrink: 0 }}>Q</div>
            <div style={{ flex: 1 }}>
              <div
                style={{
                  fontFamily: t.ui,
                  fontSize: 10,
                  fontWeight: 700,
                  color: "rgba(255,255,255,0.7)",
                  textTransform: "uppercase",
                  letterSpacing: "0.14em",
                  marginBottom: 3,
                }}
              >
                TEST YOUR KNOWLEDGE
              </div>
              <div style={{ fontFamily: t.heading, fontSize: 15, fontWeight: 700, color: "#fff" }}>
                Take the Chapter {chapterNumber} Quiz
              </div>
            </div>
            {bestPct !== null && (
              <div
                style={{
                  padding: "4px 10px",
                  borderRadius: 8,
                  background: bestPct >= 70 ? "rgba(74,222,128,0.25)" : "rgba(248,113,113,0.25)",
                  flexShrink: 0,
                }}
              >
                <span
                  style={{
                    fontFamily: t.ui,
                    fontSize: 12,
                    fontWeight: 700,
                    color: bestPct >= 70 ? "#4ade80" : "#f87171",
                  }}
                >
                  {bestPct}%
                </span>
              </div>
            )}
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.6)" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ flexShrink: 0 }}>
              <polyline points="9 18 15 12 9 6" />
            </svg>
          </div>
        </button>
      )}
    </div>
  );
}

export function VerseListChapterSection({
  chapterEntry,
  book,
  user,
  chapterReads,
  quizScores,
  setChapterHeaderRef,
  setVerseRef,
  audioCurrentVerse,
  visibleChNum,
  isListeningHere,
  nav,
  renderVerseText,
  t,
  FS,
  fontSize,
  rtlStyle,
  markChapterRead,
  darkMode,
}) {
  const { chNum, verses: chapterVerses, meta: chapterMeta, highlights: chapterHighlights, notes: chapterNotes, communityNotes: chapterCommunityNotes } = chapterEntry;
  const isRead = user && chapterReads.some((readEntry) => readEntry.book_name === book && readEntry.chapter_number === chNum);
  const chapterKey = `${book}-${chNum}`;
  const scoreList = user ? (quizScores[chapterKey] || []) : [];
  const bestPct = scoreList.length > 0 ? Math.max(...scoreList.map((score) => score.percentage)) : null;

  return (
    <div style={{ marginBottom: 24 }}>
      <ChapterHeader chapterNumber={chNum} chapterTheme={chapterMeta?.theme} setChapterHeaderRef={setChapterHeaderRef} t={t} />

      {chapterVerses.length > 0 && (
        <div style={{ background: t.card, borderRadius: 14, border: `1px solid ${t.divider}`, overflow: "hidden", boxShadow: "0 1px 4px rgba(0,0,0,0.04)" }}>
          {chapterVerses.map((verseData, verseIndex) => (
            <VerseRow
              key={`${chNum}-${verseData.verse_number}`}
              chapterNumber={chNum}
              verseData={verseData}
              isLast={verseIndex === chapterVerses.length - 1}
              highlight={(chapterHighlights || {})[verseData.verse_number]}
              note={(chapterNotes || {})[verseData.verse_number]}
              communityNotes={(chapterCommunityNotes || {})[verseData.verse_number]}
              isPlayingVerse={isListeningHere && audioCurrentVerse === verseData.verse_number && visibleChNum === chNum}
              t={t}
              FS={FS}
              fontSize={fontSize}
              rtlStyle={rtlStyle}
              setVerseRef={setVerseRef}
              nav={nav}
              renderVerseText={renderVerseText}
            />
          ))}
        </div>
      )}

      <ChapterActions
        book={book}
        chapterNumber={chNum}
        user={user}
        isRead={isRead}
        bestPct={bestPct}
        darkMode={darkMode}
        t={t}
        nav={nav}
        markChapterRead={markChapterRead}
      />
    </div>
  );
}

export function VerseListFooter({
  t,
  bottomSentinelRef,
  hasMoreChapters,
  chaptersData,
  totalChapters,
  bookDisplayName,
  isListeningHere,
  autoScrollEnabled,
  setAutoScrollEnabled,
  audioCurrentVerse,
  verseRefs,
  audioVisible,
}) {
  const isAtBookEnd = chaptersData.length > 0 && chaptersData[chaptersData.length - 1].chNum >= totalChapters;

  return (
    <>
      <div ref={bottomSentinelRef} style={{ height: 1 }} />

      {hasMoreChapters && (
        <div style={{ textAlign: "center", padding: "20px 0" }}>
          <Spinner t={t} />
          <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginTop: 6 }}>Loading next chapter...</div>
        </div>
      )}

      {isAtBookEnd && (
        <div style={{ textAlign: "center", padding: "32px 20px", margin: "8px 0" }}>
          <div style={{ marginBottom: 8 }}>
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke={t.accent} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
              <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20" />
              <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z" />
            </svg>
          </div>
          <div style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark, marginBottom: 4 }}>
            End of {bookDisplayName}
          </div>
          <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>
            {totalChapters} chapters · You made it!
          </div>
        </div>
      )}

      {isListeningHere && !autoScrollEnabled && (
        <button
          onClick={() => {
            setAutoScrollEnabled(true);
            if (audioCurrentVerse && verseRefs.current[audioCurrentVerse]) {
              verseRefs.current[audioCurrentVerse].scrollIntoView({ behavior: "smooth", block: "center" });
            }
          }}
          style={{
            position: "fixed",
            bottom: audioVisible ? 130 : 80,
            right: 16,
            zIndex: 100,
            display: "flex",
            alignItems: "center",
            gap: 6,
            padding: "8px 14px",
            borderRadius: 20,
            background: t.accent,
            color: "#fff",
            fontFamily: t.ui,
            fontSize: 11,
            fontWeight: 700,
            border: "none",
            cursor: "pointer",
            boxShadow: "0 4px 16px rgba(0,0,0,0.25)",
            animation: "fadeIn 0.2s ease-out",
          }}
        >
          <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
            <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5" />
          </svg>
          Back to V.{audioCurrentVerse}
        </button>
      )}
    </>
  );
}
