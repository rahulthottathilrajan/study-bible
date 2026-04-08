"use client";

import { HIGHLIGHT_COLORS, getBookName } from "../../constants";
import { Badge, Card, Label } from "../../components/ui";

const OT_BOOKS_LIST = [
  "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", "Joshua", "Judges", "Ruth",
  "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", "Ezra",
  "Nehemiah", "Esther", "Job", "Psalms", "Proverbs", "Ecclesiastes", "Song of Solomon",
  "Isaiah", "Jeremiah", "Lamentations", "Ezekiel", "Daniel", "Hosea", "Joel", "Amos",
  "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah",
  "Malachi",
];

const HIGHLIGHT_COLOR_NAMES = {
  "#FFD700": "Gold",
  "#FF9B71": "Coral",
  "#7ED4AD": "Green",
  "#82B1FF": "Blue",
  "#CE93D8": "Purple",
  "#F48FB1": "Pink",
};

function parseVerseRef(ref) {
  const match = ref.match(/^(.+?)\s+(\d+):(\d+)$/);
  return match ? { book: match[1], chapter: +match[2], verse: +match[3] } : null;
}

function renderVerseAudioText({ text, audioPlaying, audioCurrentWord, verse, isRtl, t }) {
  if (!(audioPlaying && audioCurrentWord && audioCurrentWord.verseNum === verse && !isRtl)) {
    return text;
  }

  const words = text.split(/(\s+)/);
  let wordIndex = 0;

  return words.map((word, index) => {
    if (/^\s+$/.test(word)) return <span key={index}>{word}</span>;

    const isActive = audioCurrentWord.verseWordIdx === wordIndex;
    wordIndex += 1;

    return (
      <span
        key={index}
        style={isActive ? {
          background: `${t.accent}30`,
          borderRadius: 3,
          padding: "1px 2px",
          margin: "-1px -2px",
          animation: "wordGlow 0.3s ease",
        } : undefined}
      >
        {word}
      </span>
    );
  });
}

export function VerseOverviewCard({
  t,
  chapter,
  chapterMeta,
  overviewOpen,
  outline,
  toggleOverview,
}) {
  if (!chapterMeta?.overview) return null;

  return (
    <div style={{ margin: "14px 0" }}>
      <button
        onClick={toggleOverview}
        style={{
          width: "100%",
          display: "flex",
          alignItems: "center",
          gap: 10,
          padding: "11px 16px",
          background: overviewOpen ? t.accentLight : t.card,
          border: `1px solid ${overviewOpen ? t.accentBorder : t.divider}`,
          borderRadius: overviewOpen ? "12px 12px 0 0" : 12,
          cursor: "pointer",
          textAlign: "left",
          transition: "all 0.2s",
        }}
      >
        <span style={{ fontSize: 16, flexShrink: 0 }}>📋</span>
        <div style={{ flex: 1 }}>
          <span style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: t.dark }}>
            Chapter {chapter} Overview
          </span>
          {!overviewOpen && chapterMeta.key_word_original && (
            <span style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginLeft: 8 }}>
              · {chapterMeta.key_word_original}
            </span>
          )}
        </div>
        <span
          style={{
            fontFamily: t.ui,
            fontSize: 12,
            color: t.muted,
            transform: overviewOpen ? "rotate(180deg)" : "rotate(0deg)",
            transition: "transform 0.2s",
          }}
        >
          ▾
        </span>
      </button>
      {overviewOpen && (
        <div
          style={{
            background: t.accentLight,
            border: `1px solid ${t.accentBorder}`,
            borderTop: "none",
            borderRadius: "0 0 12px 12px",
            padding: "14px 16px",
          }}
        >
          <div
            style={{
              fontFamily: t.body,
              fontSize: 14.5,
              color: t.text,
              lineHeight: 1.65,
              marginBottom: chapterMeta.key_word_original || outline.length ? 12 : 0,
            }}
          >
            {chapterMeta.overview}
          </div>
          {chapterMeta.key_word_original && (
            <div
              style={{
                padding: "8px 12px",
                background: "rgba(255,255,255,0.6)",
                borderRadius: 8,
                display: "flex",
                alignItems: "center",
                gap: 8,
                flexWrap: "wrap",
                marginBottom: outline.length ? 10 : 0,
              }}
            >
              <Badge t={t}>Key Word</Badge>
              <span style={{ fontFamily: t.body, fontSize: 14, color: t.dark, fontStyle: "italic" }}>
                {chapterMeta.key_word_original}
              </span>
              <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>
                — {chapterMeta.key_word_meaning}
              </span>
            </div>
          )}
          {outline.length > 0 && (
            <div>
              <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 6 }}>
                Outline
              </div>
              {outline.map((item, index) => (
                <div key={index} style={{ fontFamily: t.ui, fontSize: 13, color: t.text, lineHeight: 1.7, paddingLeft: 12, borderLeft: `2px solid ${t.accentBorder}`, marginBottom: 4 }}>
                  {item}
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export function VerseStudyTabs({ t, tabOptions, tab, setTab }) {
  return (
    <div style={{ display: "flex", background: t.card, borderRadius: 10, padding: 3, marginBottom: 14, border: `1px solid ${t.divider}`, overflowX: "auto", WebkitOverflowScrolling: "touch", scrollbarWidth: "none" }}>
      {tabOptions.map((tabOption) => (
        <button
          key={tabOption.id}
          onClick={() => setTab(tabOption.id)}
          style={{ flex: "0 0 auto", minWidth: 80, padding: "10px 8px", border: "none", borderRadius: 8, background: tab === tabOption.id ? t.tabActive : "transparent", color: tab === tabOption.id ? t.headerText : t.muted, fontFamily: t.ui, fontSize: 12, fontWeight: 700, cursor: "pointer", transition: "all 0.15s", whiteSpace: "nowrap" }}
        >
          {tabOption.label}
        </button>
      ))}
    </div>
  );
}

export function VerseTextCard({
  t,
  darkMode,
  highlight,
  audioPlaying,
  audioAvailable,
  setAudioPlaying,
  setAudioSource,
  setAudioVisible,
  verseTextLabel,
  FS,
  fontSize,
  rtlStyle,
  isRtl,
  verse,
  audioCurrentWord,
  currentVerse,
  canPrev,
  canNext,
  verseCount,
  goPrevVerse,
  goNextVerse,
  user,
  hasVerseId,
  showColors,
  toggleHighlightPicker,
  toggleBookmarkHL,
  tab,
  setTab,
  openVersePrayer,
  shareCopied,
  copyVerseText,
  shareVerseImage,
  toggleHighlight,
}) {
  const actionButtons = [
    {
      label: "Highlight",
      active: showColors && hasVerseId,
      onClick: toggleHighlightPicker,
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="m9 11-6 6v3h9l3-3" /><path d="m22 12-4.6 4.6a2 2 0 0 1-2.8 0l-5.2-5.2a2 2 0 0 1 0-2.8L14 4" /></svg>,
      svgActive: <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="m9 11-6 6v3h9l3-3" /><path d="m22 12-4.6 4.6a2 2 0 0 1-2.8 0l-5.2-5.2a2 2 0 0 1 0-2.8L14 4" /></svg>,
    },
    {
      label: "Bookmark",
      active: highlight?.is_bookmarked,
      activeColor: "#ffd700",
      onClick: toggleBookmarkHL,
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" /></svg>,
      svgActive: <svg width="18" height="18" viewBox="0 0 24 24" fill="#ffd700" stroke="#ffd700" strokeWidth="1.8"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" /></svg>,
    },
    {
      label: "Note",
      active: tab === "my",
      onClick: () => setTab("my"),
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M12 20h9" /><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z" /></svg>,
    },
    {
      label: "Pray",
      onClick: () => openVersePrayer(),
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M12 21C12 21 8 16.5 5 12.5C3 9.5 4 6 7 5C9 4.2 11 5 12 7C13 5 15 4.2 17 5C20 6 21 9.5 19 12.5C16 16.5 12 21 12 21Z" /></svg>,
    },
    {
      label: shareCopied ? "Copied" : "Copy",
      active: shareCopied,
      activeColor: "#22c55e",
      onClick: copyVerseText,
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2" /><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1" /></svg>,
      svgActive: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#22c55e" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12" /></svg>,
    },
    {
      label: "Share",
      onClick: shareVerseImage,
      svg: <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><circle cx="18" cy="5" r="3" /><circle cx="6" cy="12" r="3" /><circle cx="18" cy="19" r="3" /><line x1="8.59" y1="13.51" x2="15.42" y2="17.49" /><line x1="15.41" y1="6.51" x2="8.59" y2="10.49" /></svg>,
    },
  ];

  return (
    <div style={{ margin: "12px 0 14px", position: "relative", borderRadius: 16, padding: "22px 22px 18px", background: highlight?.highlight_color ? `${highlight.highlight_color}15` : `linear-gradient(170deg, ${t.bg}, ${t.card} 40%, ${t.bg} 100%)`, border: `1.5px solid ${audioPlaying ? t.accent : highlight?.highlight_color ? `${highlight.highlight_color}40` : t.divider}`, borderTop: `3px solid ${highlight?.highlight_color || t.accent}`, boxShadow: `inset 0 1px 2px rgba(255,255,255,${darkMode ? 0.02 : 0.3}), 0 2px 8px rgba(0,0,0,${darkMode ? 0.25 : 0.06})`, transition: "background 0.3s,border-color 0.3s", overflow: "hidden" }}>
      <div style={{ position: "absolute", top: 2, right: 14, fontSize: 90, color: `${t.accent}07`, fontFamily: t.heading, lineHeight: 1, pointerEvents: "none", userSelect: "none", zIndex: 0 }}>&quot;</div>
      <div style={{ position: "relative", zIndex: 1, display: "flex", alignItems: "center", justifyContent: "space-between" }}>
        <Label icon="📖" t={t}>{verseTextLabel}</Label>
        {audioAvailable && (
          <button onClick={() => { if (audioPlaying) { setAudioPlaying(false); } else { setAudioSource("verseStudy"); setAudioVisible(true); setAudioPlaying(true); } }} title={audioPlaying ? "Pause" : "Listen to this verse"} style={{ display: "flex", alignItems: "center", gap: 5, padding: "4px 10px", borderRadius: 16, border: `1px solid ${audioPlaying ? t.accent : t.accentBorder}`, background: audioPlaying ? `${t.accent}15` : "transparent", color: audioPlaying ? t.accent : t.muted, cursor: "pointer", transition: "all 0.15s", fontFamily: t.ui, fontSize: 11, fontWeight: 600 }}>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5" /><path d="M15.54 8.46a5 5 0 0 1 0 7.07" />{audioPlaying && <path d="M19.07 4.93a10 10 0 0 1 0 14.14" />}</svg>
            {audioPlaying ? "Playing" : "Listen"}
          </button>
        )}
      </div>

      <div style={{ fontFamily: t.body, fontSize: FS[fontSize].detail, color: t.dark, lineHeight: 2, padding: "12px 0 16px", ...rtlStyle }}>
        <span style={{ fontSize: "clamp(28px,8vw,36px)", fontWeight: 800, color: t.accent, float: isRtl ? "right" : "left", lineHeight: 0.85, marginRight: isRtl ? 0 : 10, marginLeft: isRtl ? 10 : 0, marginTop: 2, fontFamily: t.heading, textShadow: `0 0 20px ${t.accent}45` }}>{verse}</span>
        {renderVerseAudioText({ text: currentVerse.kjv_text, audioPlaying, audioCurrentWord, verse, isRtl, t })}
      </div>

      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginTop: 6 }}>
        <button onClick={goPrevVerse} disabled={!canPrev} style={{ padding: "5px 10px", borderRadius: 16, border: `1px solid ${canPrev ? t.accentBorder : "transparent"}`, background: "transparent", fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: canPrev ? t.accent : t.light, cursor: canPrev ? "pointer" : "default", opacity: canPrev ? 1 : 0.35, transition: "all 0.2s" }}>‹ Prev</button>
        <span style={{ fontFamily: t.ui, fontSize: 11, color: t.muted }}>{verse} of {verseCount}</span>
        <button onClick={goNextVerse} disabled={!canNext} style={{ padding: "5px 10px", borderRadius: 16, border: `1px solid ${canNext ? t.accentBorder : "transparent"}`, background: "transparent", fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: canNext ? t.accent : t.light, cursor: canNext ? "pointer" : "default", opacity: canNext ? 1 : 0.35, transition: "all 0.2s" }}>Next ›</button>
      </div>

      {user && (
        <div style={{ borderRadius: 10, padding: "8px 4px", marginTop: 8, background: `${t.accent}0A`, border: `1px solid ${t.accentBorder}` }}>
          {!hasVerseId && <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, textAlign: "center", padding: "4px 0 2px" }}>Highlight, bookmark &amp; notes available for seeded chapters</div>}
          <div style={{ display: "flex", alignItems: "center", justifyContent: "space-evenly" }}>
            {actionButtons.map((action, index) => {
              const needsVerse = index < 3;
              const dimmed = needsVerse && !hasVerseId;

              return (
                <button key={action.label} onClick={dimmed ? undefined : action.onClick} aria-label={action.label} disabled={dimmed} style={{ display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", gap: 3, minWidth: 44, padding: "5px 4px", borderRadius: 8, border: "none", background: action.active && !dimmed ? `${action.activeColor || t.accent}15` : "transparent", color: action.active && !dimmed ? (action.activeColor || t.accent) : t.muted, cursor: dimmed ? "default" : "pointer", transition: "all 0.15s", opacity: dimmed ? 0.35 : 1 }}>
                  {action.active && action.svgActive ? action.svgActive : action.svg}
                  <span style={{ fontFamily: t.ui, fontSize: 8, fontWeight: 600, lineHeight: 1, letterSpacing: "0.02em" }}>{action.label}</span>
                </button>
              );
            })}
          </div>

          {showColors && (
            <div style={{ display: "flex", gap: 7, paddingTop: 8, animation: "fadeIn 0.15s ease", alignItems: "center", justifyContent: "center" }}>
              {HIGHLIGHT_COLORS.map((color) => (
                <button key={color} onClick={() => toggleHighlight(color)} aria-label={`${HIGHLIGHT_COLOR_NAMES[color]} highlight`} style={{ width: 26, height: 26, borderRadius: "50%", background: color, border: highlight?.highlight_color === color ? `3px solid ${t.dark}` : `2px solid ${color}88`, cursor: "pointer", transition: "all 0.15s", transform: highlight?.highlight_color === color ? "scale(1.15)" : "scale(1)" }} />
              ))}
              {highlight?.highlight_color && <button onClick={() => toggleHighlight(highlight.highlight_color)} style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, background: "none", border: "none", cursor: "pointer", textDecoration: "underline", marginLeft: 4 }}>Clear</button>}
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export function VerseStudyPanels({
  t,
  tab,
  isEnglishTrans,
  currentVerse,
  isOT,
  vWords,
  vRefs,
  user,
  noteRef,
  userNote,
  noteLoading,
  saveNote,
  savedNote,
  toggleNotePublic,
  deleteNote,
  book,
  chapter,
  verse,
  openVersePrayer,
  communityNotes,
  nav,
}) {
  return (
    <>
      {isEnglishTrans && tab === "study" && (
        <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
          {currentVerse.study_note && <Card t={t}><Label icon="📝" t={t}>Study Note</Label><div style={{ fontFamily: t.body, fontSize: 15, color: t.text, lineHeight: 1.75 }}>{currentVerse.study_note}</div></Card>}
          {currentVerse.doctrinal_note && <Card accent t={t}><Label icon="✪" t={t} color={t.dark}>Doctrinal Note</Label><div style={{ fontFamily: t.body, fontSize: 14.5, color: t.text, lineHeight: 1.7, fontStyle: "italic" }}>{currentVerse.doctrinal_note}</div></Card>}
          {!currentVerse.study_note && !currentVerse.doctrinal_note && <Card t={t}><div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, textAlign: "center", padding: 16 }}>Study notes coming soon.</div></Card>}
        </div>
      )}

      {tab === "original" && (
        <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
          {currentVerse.original_text && (
            <Card t={t}>
              <Label icon="🔠" t={t}>{isOT ? "Hebrew Text" : "Greek Text"}</Label>
              <div style={{ fontFamily: "'Times New Roman',serif", fontSize: isOT ? 24 : 19, color: t.dark, lineHeight: 2, direction: isOT ? "rtl" : "ltr", textAlign: isOT ? "right" : "left", padding: "14px 18px", background: t.hebrewBg, borderRadius: 10, marginBottom: 10 }}>{currentVerse.original_text}</div>
              {currentVerse.transliteration && <div style={{ fontFamily: t.body, fontSize: 14, color: t.muted, fontStyle: "italic", lineHeight: 1.6 }}><span style={{ fontWeight: 700, fontStyle: "normal", fontSize: 10, textTransform: "uppercase", letterSpacing: "0.05em", fontFamily: t.ui }}>Transliteration:</span> {currentVerse.transliteration}</div>}
            </Card>
          )}

          {vWords.length > 0 && (
            <Card t={t}>
              <Label icon="🔍" t={t}>Word Study</Label>
              <div style={{ display: "flex", flexDirection: "column", gap: 9 }}>
                {vWords.map((word, index) => (
                  <div key={`${word.strongs_number}-${index}`} style={{ padding: "12px 14px", borderRadius: 10, background: t.accentLight, border: `1px solid ${t.accentBorder}` }}>
                    <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 5, flexWrap: "wrap" }}>
                      <span style={{ fontFamily: "'Times New Roman',serif", fontSize: isOT ? 20 : 16, color: t.accent, fontWeight: 700, direction: isOT ? "rtl" : "ltr" }}>{word.original_word}</span>
                      <span style={{ fontFamily: t.body, fontSize: 13, color: t.muted, fontStyle: "italic" }}>({word.transliteration})</span>
                      <span style={{ background: t.accentLight, border: `1px solid ${t.accentBorder}`, padding: "2px 7px", borderRadius: 4, fontFamily: "monospace", fontSize: 10.5, color: t.muted }}>{word.strongs_number}</span>
                    </div>
                    <div style={{ fontFamily: t.ui, fontSize: 13.5, color: t.text, lineHeight: 1.6 }}>{word.meaning}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
        </div>
      )}

      {tab === "cross" && (
        <Card t={t}>
          <Label icon="🔗" t={t}>Cross References</Label>
          {vRefs.length > 0 ? <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>{vRefs.map((reference, index) => <span key={`${reference.reference}-${index}`} style={{ background: t.accentLight, border: `1px solid ${t.accentBorder}`, borderRadius: 8, padding: "8px 13px", fontFamily: t.ui, fontSize: 13.5, color: t.dark, fontWeight: 600 }}>{reference.reference}</span>)}</div> : <div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, textAlign: "center", padding: 16 }}>Cross references coming soon.</div>}
        </Card>
      )}

      {tab === "my" && user && (
        <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
          <Card t={t}>
            <Label icon="✏️" t={t}>My Note on {book} {chapter}:{verse}</Label>
            <textarea ref={noteRef} defaultValue={userNote} placeholder="Write your personal thoughts, reflections, or insights on this verse..." rows={4} style={{ width: "100%", padding: "12px 14px", borderRadius: 10, border: `1px solid ${t.divider}`, fontFamily: t.body, fontSize: 14, color: t.text, outline: "none", background: t.bg, resize: "vertical", lineHeight: 1.7, boxSizing: "border-box" }} />
            <div style={{ display: "flex", gap: 8, marginTop: 10, alignItems: "center", flexWrap: "wrap" }}>
              <button onClick={saveNote} disabled={noteLoading} style={{ padding: "10px 20px", borderRadius: 8, border: "none", background: t.accent, color: "#fff", fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: "pointer" }}>{noteLoading ? "Saving..." : savedNote ? "Update Note" : "Save Note"}</button>
              {savedNote && (
                <>
                  <button onClick={toggleNotePublic} style={{ padding: "8px 14px", borderRadius: 8, border: `1px solid ${savedNote.is_public ? "#7ED4AD" : t.divider}`, background: savedNote.is_public ? "#7ED4AD22" : "transparent", fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: savedNote.is_public ? "#2E7D5B" : t.muted, cursor: "pointer" }}>
                    {savedNote.is_public ? "🌍 Shared" : "🔒 Private"} — tap to {savedNote.is_public ? "make private" : "share"}
                  </button>
                  <button aria-label="Delete note" onClick={async () => { if (confirm("Delete this note? This cannot be undone.")) await deleteNote(); }} disabled={noteLoading} style={{ padding: "8px 14px", borderRadius: 8, border: "1px solid rgba(239,68,68,0.3)", background: "transparent", fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: "#ef4444", cursor: "pointer" }}>
                    Delete
                  </button>
                </>
              )}
            </div>
            {savedNote && <>
              <div style={{ fontFamily: t.ui, fontSize: 10, color: t.light, marginTop: 8 }}>Last saved: {new Date(savedNote.updated_at).toLocaleString()}</div>
              {savedNote.is_public && <div style={{ fontFamily: t.ui, fontSize: 10, color: t.light, marginTop: 4 }}>By sharing, you confirm this is your original content and does not contain copyrighted material.</div>}
            </>}
          </Card>

          <button onClick={() => openVersePrayer("Prayer for")} style={{ padding: "14px", borderRadius: 12, border: `1px dashed ${t.accentBorder}`, background: t.accentLight, fontFamily: t.ui, fontSize: 14, fontWeight: 600, color: t.accent, cursor: "pointer", textAlign: "center" }}>
            🙏 Add Prayer for This Verse
          </button>

          {communityNotes.length > 0 && <Card t={t}>
            <Label icon="🌍" t={t} color={t.muted}>Community Notes</Label>
            {communityNotes.map((communityNote, index) => (
              <div key={`${communityNote.id || communityNote.updated_at || index}`} style={{ padding: "10px 12px", borderRadius: 8, background: t.bg, marginBottom: 6, border: `1px solid ${t.divider}` }}>
                <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.accent, marginBottom: 4 }}>{communityNote.user_profiles?.display_name || "Reader"}</div>
                <div style={{ fontFamily: t.body, fontSize: 13.5, color: t.text, lineHeight: 1.65 }}>{communityNote.note_text}</div>
              </div>
            ))}
          </Card>}
        </div>
      )}

      {tab === "my" && !user && (
        <Card t={t}>
          <div style={{ textAlign: "center", padding: 20 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>🔐</div>
            <div style={{ fontFamily: t.heading, fontSize: 17, color: t.dark, marginBottom: 6 }}>Sign In to Add Notes</div>
            <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 14 }}>Save personal notes, highlight verses, and keep a prayer journal.</div>
            <button onClick={() => nav("account")} style={{ padding: "12px 28px", borderRadius: 10, border: "none", background: t.tabActive, color: t.headerText, fontFamily: t.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Sign In / Sign Up</button>
          </div>
        </Card>
      )}
    </>
  );
}

export function SimilarVersesPanel({
  t,
  similarOpen,
  toggleSimilarOpen,
  similarVerses,
  similarLoading,
  nav,
  bibleTranslation,
}) {
  return (
    <div style={{ marginTop: 14 }}>
      <button onClick={toggleSimilarOpen} style={{ width: "100%", display: "flex", alignItems: "center", gap: 10, padding: "11px 16px", background: similarOpen ? t.accentLight : t.card, border: `1px solid ${similarOpen ? t.accentBorder : t.divider}`, borderRadius: similarOpen ? "12px 12px 0 0" : 12, cursor: "pointer", textAlign: "left", transition: "all 0.2s" }}>
        <span style={{ fontSize: 16, flexShrink: 0 }}>&#x2728;</span>
        <div style={{ flex: 1 }}>
          <span style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: t.dark }}>Similar Verses</span>
          {!similarOpen && similarVerses.length > 0 && <span style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginLeft: 8 }}>&middot; {similarVerses.length} found</span>}
        </div>
        <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, transform: similarOpen ? "rotate(180deg)" : "rotate(0deg)", transition: "transform 0.2s" }}>{"\u25BE"}</span>
      </button>

      {similarOpen && (
        <div style={{ background: t.accentLight, border: `1px solid ${t.accentBorder}`, borderTop: "none", borderRadius: "0 0 12px 12px", padding: "10px 16px 14px" }}>
          {similarLoading && (
            <div style={{ display: "flex", justifyContent: "center", padding: 20 }}>
              <div style={{ width: 20, height: 20, border: `2px solid ${t.divider}`, borderTop: `2px solid ${t.accent}`, borderRadius: "50%", animation: "spin 0.8s linear infinite" }} />
            </div>
          )}

          {!similarLoading && similarVerses.length === 0 && <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, textAlign: "center", padding: 12 }}>No similar verses found for this passage.</div>}

          {!similarLoading && similarVerses.map((similarVerse, index) => {
            const parsed = parseVerseRef(similarVerse.verse_ref);
            const similarityPercent = Math.round(similarVerse.similarity * 100);
            const displayRef = parsed ? `${getBookName(parsed.book, bibleTranslation)} ${parsed.chapter}:${parsed.verse}` : similarVerse.verse_ref;
            const text = similarVerse.kjv_text || "";
            const snippet = text.length > 120 ? `${text.slice(0, 120)}...` : text;

            return (
              <button
                key={`${similarVerse.verse_ref}-${index}`}
                onClick={() => {
                  if (parsed) {
                    const testament = OT_BOOKS_LIST.includes(parsed.book) ? "OT" : "NT";
                    nav("verse", { testament, book: parsed.book, chapter: parsed.chapter, verse: parsed.verse });
                  }
                }}
                className="pressable"
                style={{ width: "100%", textAlign: "left", cursor: "pointer", background: t.card, border: `1px solid ${t.divider}`, borderRadius: 10, padding: "10px 14px", marginBottom: 6, display: "block", animation: `fadeIn 0.2s ease ${index * 0.05}s both` }}
              >
                <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 4 }}>
                  <span style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.accent }}>{displayRef}</span>
                  <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: similarityPercent > 80 ? "#22c55e" : similarityPercent > 65 ? t.accent : t.muted, background: `${similarityPercent > 80 ? "#22c55e" : similarityPercent > 65 ? t.accent : t.muted}15`, padding: "2px 8px", borderRadius: 10 }}>{similarityPercent}% match</span>
                </div>
                <div style={{ fontFamily: t.body, fontSize: 13, color: t.text, lineHeight: 1.6, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{snippet}</div>
              </button>
            );
          })}

          {!similarLoading && similarVerses.length > 0 && <div style={{ fontFamily: t.ui, fontSize: 9, color: t.light, textAlign: "center", marginTop: 6 }}>AI-powered similarity &middot; Based on meaning, not keywords</div>}
        </div>
      )}
    </div>
  );
}
