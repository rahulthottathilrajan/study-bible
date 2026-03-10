"use client";
import { useState, useRef, useEffect, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS, BIBLE_TRANSLATIONS, getBookName } from "../constants";

// ─── Compact Scroll Wheel Constants ───
const ITEM_H = 28;
const VISIBLE = 5;
const PAD = ITEM_H * Math.floor(VISIBLE / 2);
const WHEEL_H = ITEM_H * VISIBLE;

// ─── ScrollColumn (inline, transparent) ───
function ScrollColumn({ items, selectedIdx, onSelect, label }) {
  const scrollRef = useRef(null);
  const scrollTimer = useRef(null);
  const mounted = useRef(false);

  // Scroll to selected on mount
  useEffect(() => {
    if (!scrollRef.current) return;
    const target = Math.max(0, selectedIdx) * ITEM_H;
    requestAnimationFrame(() => {
      scrollRef.current?.scrollTo({ top: target, behavior: "instant" });
      mounted.current = true;
    });
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const handleScroll = useCallback(() => {
    if (!mounted.current) return;
    clearTimeout(scrollTimer.current);
    scrollTimer.current = setTimeout(() => {
      if (!scrollRef.current) return;
      const idx = Math.round(scrollRef.current.scrollTop / ITEM_H);
      const clamped = Math.max(0, Math.min(idx, items.length - 1));
      if (clamped !== selectedIdx) onSelect(clamped);
    }, 80);
  }, [items.length, selectedIdx, onSelect]);

  const handleTap = useCallback((i) => {
    onSelect(i);
    scrollRef.current?.scrollTo({ top: i * ITEM_H, behavior: "smooth" });
  }, [onSelect]);

  return (
    <div style={{ flex: 1, display: "flex", flexDirection: "column", alignItems: "center", gap: 4 }}>
      <div style={{ position: "relative", width: "100%", height: WHEEL_H, overflow: "hidden", borderRadius: 8 }}>
        {/* Center highlight bar */}
        <div style={{
          position: "absolute", top: PAD, left: 3, right: 3, height: ITEM_H,
          background: "rgba(255,255,255,0.08)",
          border: "1px solid rgba(255,255,255,0.12)",
          borderRadius: 6, zIndex: 1, pointerEvents: "none",
        }} />
        {/* Top fade */}
        <div style={{
          position: "absolute", top: 0, left: 0, right: 0, height: PAD + 4,
          background: "linear-gradient(to bottom, rgba(0,0,0,0.25) 10%, transparent)",
          zIndex: 2, pointerEvents: "none",
        }} />
        {/* Bottom fade */}
        <div style={{
          position: "absolute", bottom: 0, left: 0, right: 0, height: PAD + 4,
          background: "linear-gradient(to top, rgba(0,0,0,0.25) 10%, transparent)",
          zIndex: 2, pointerEvents: "none",
        }} />
        {/* Scrollable wheel */}
        <div ref={scrollRef} onScroll={handleScroll} className="goto-wheel" style={{
          height: "100%", overflowY: "auto",
          scrollSnapType: "y mandatory",
          WebkitOverflowScrolling: "touch",
        }}>
          <div style={{ height: PAD }} />
          {items.map((item, i) => (
            <div key={item.value} onClick={() => handleTap(i)} style={{
              height: ITEM_H, scrollSnapAlign: "center",
              display: "flex", alignItems: "center", justifyContent: "center",
              fontFamily: "'Playfair Display', Georgia, serif",
              fontSize: i === selectedIdx ? 15 : 12,
              fontWeight: i === selectedIdx ? 700 : 400,
              color: i === selectedIdx ? "rgba(255,255,255,0.95)" : "rgba(255,255,255,0.35)",
              cursor: "pointer",
              transition: "font-size 0.12s, color 0.12s",
              userSelect: "none",
              whiteSpace: "nowrap",
              overflow: "hidden",
              textOverflow: "ellipsis",
              padding: "0 4px",
            }}>
              {item.label}
            </div>
          ))}
          <div style={{ height: PAD }} />
        </div>
      </div>
      <div style={{
        fontFamily: "system-ui, sans-serif", fontSize: 8, fontWeight: 700,
        color: "rgba(255,255,255,0.3)",
        textTransform: "uppercase", letterSpacing: "0.1em",
      }}>{label}</div>
    </div>
  );
}

// ─── Shared pill button style ───
const pillBtn = {
  background: "rgba(255,255,255,0.08)",
  border: "1px solid rgba(255,255,255,0.12)",
  borderRadius: 6, padding: "3px 8px",
  cursor: "pointer", display: "flex",
  alignItems: "center", gap: 4,
  transition: "background 0.2s",
};

// ─── Language Dropdown ───
function LangDropdown({ darkMode, th, bibleTranslation, setBibleTranslation, onClose }) {
  const ref = useRef(null);
  const groups = ["English", "Indian", "International"];
  const groupLabels = { English: "English", Indian: "\u092D\u093E\u0930\u0924\u0940\u092F", International: "International" };

  useEffect(() => {
    const handler = (e) => { if (ref.current && !ref.current.contains(e.target)) onClose(); };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, [onClose]);

  return (
    <div ref={ref} style={{
      position: "absolute", top: "100%", right: 0, marginTop: 6,
      background: darkMode ? "#1E1C18" : "#fff",
      border: `1px solid ${th.divider}`,
      borderRadius: 12, padding: "8px 0", minWidth: 200,
      boxShadow: "0 8px 24px rgba(0,0,0,0.2)",
      zIndex: 100, animation: "fadeIn 0.15s ease",
    }}>
      {groups.map(g => {
        const items = BIBLE_TRANSLATIONS.filter(t => t.group === g);
        return (
          <div key={g}>
            <div style={{ padding: "6px 14px 4px", fontFamily: th.ui, fontSize: 9, fontWeight: 700, color: th.muted, textTransform: "uppercase", letterSpacing: "0.12em" }}>{groupLabels[g]}</div>
            {items.map(t => (
              <button key={t.id} onClick={() => { setBibleTranslation(t.id); onClose(); }} style={{
                width: "100%", display: "flex", alignItems: "center", justifyContent: "space-between",
                padding: "8px 14px",
                background: bibleTranslation === t.id ? (darkMode ? "rgba(212,168,83,0.12)" : "rgba(212,168,83,0.08)") : "transparent",
                border: "none", cursor: "pointer", textAlign: "left", transition: "background 0.15s",
              }}>
                <div>
                  <span style={{ fontFamily: th.ui, fontSize: 13, fontWeight: bibleTranslation === t.id ? 700 : 500, color: bibleTranslation === t.id ? th.accent : (darkMode ? "#D4C8B0" : "#3A3028") }}>{t.label}</span>
                  <span style={{ fontFamily: th.ui, fontSize: 10, color: th.muted, marginLeft: 8 }}>{t.name}</span>
                </div>
                {bibleTranslation === t.id && <span style={{ color: th.accent, fontSize: 12 }}>&#10003;</span>}
              </button>
            ))}
          </div>
        );
      })}
    </div>
  );
}

// ─── GoToBar (tap-to-expand inline wheels + optional utility items) ───
export default function GoToBar({ showUtilities = false }) {
  const {
    book, chapter, verse, view, t, ht, darkMode, setDarkMode,
    nav, testament, bibleTranslation, setBibleTranslation,
    user, profile, streak,
  } = useApp();
  const th = showUtilities ? ht : t;

  const [open, setOpen] = useState(false);
  const [showLang, setShowLang] = useState(false);
  const [goBook, setGoBook] = useState(book || "Genesis");
  const [goChapter, setGoChapter] = useState(chapter || 1);
  const [goVerse, setGoVerse] = useState(verse || 1);
  const [verseCounts, setVerseCounts] = useState({});

  // Load verse counts once
  useEffect(() => {
    fetch('/data/verse-counts.json')
      .then(r => r.json())
      .then(setVerseCounts)
      .catch(() => {});
  }, []);

  // Sync with nav state when navigating externally
  useEffect(() => {
    if (book) setGoBook(book);
    if (chapter) setGoChapter(chapter);
    if (verse) setGoVerse(verse);
  }, [book, chapter, verse]);

  // Close lang dropdown when wheels open
  useEffect(() => { if (open) setShowLang(false); }, [open]);

  // ── Derived data ──
  const bookItems = useMemo(() =>
    BIBLE_BOOKS.map(b => ({ value: b.name, label: getBookName(b.name, bibleTranslation) })),
  [bibleTranslation]);

  const bookInfo = useMemo(() => BIBLE_BOOKS.find(b => b.name === goBook), [goBook]);

  const chapterItems = useMemo(() =>
    Array.from({ length: bookInfo?.chapters || 1 }, (_, i) => ({ value: i + 1, label: String(i + 1) })),
  [bookInfo]);

  const maxVerse = verseCounts[goBook]?.[String(goChapter)] || 31;
  const verseItems = useMemo(() =>
    Array.from({ length: maxVerse }, (_, i) => ({ value: i + 1, label: String(i + 1) })),
  [maxVerse]);

  const bookIdx = useMemo(() => {
    const idx = BIBLE_BOOKS.findIndex(b => b.name === goBook);
    return idx >= 0 ? idx : 0;
  }, [goBook]);
  const chapterIdx = Math.max(0, (goChapter || 1) - 1);
  const verseIdx = Math.max(0, Math.min((goVerse || 1) - 1, maxVerse - 1));

  // ── Handlers ──
  const handleBookChange = useCallback((idx) => {
    const name = BIBLE_BOOKS[idx]?.name;
    if (name && name !== goBook) {
      setGoBook(name);
      setGoChapter(1);
      setGoVerse(1);
    }
  }, [goBook]);

  const handleChapterChange = useCallback((idx) => {
    const ch = idx + 1;
    if (ch !== goChapter) {
      setGoChapter(ch);
      setGoVerse(1);
    }
  }, [goChapter]);

  const handleVerseChange = useCallback((idx) => {
    setGoVerse(idx + 1);
  }, []);

  const handleGo = () => {
    if (!goBook) return;
    const bi = BIBLE_BOOKS.find(b => b.name === goBook);
    const tst = bi?.testament || testament || "OT";
    nav("verse", { testament: tst, book: goBook, chapter: goChapter, verse: goVerse, tab: "study" });
    setOpen(false);
  };

  const currentTrans = BIBLE_TRANSLATIONS.find(t => t.id === bibleTranslation) || BIBLE_TRANSLATIONS[0];
  const firstName = (profile?.nickname || profile?.full_name?.split(' ')[0] || profile?.display_name || user?.user_metadata?.display_name || "Reader")?.split(' ')[0];

  // ── Divider between items ──
  const divider = <span style={{ color: "rgba(255,255,255,0.12)", fontSize: 12, flexShrink: 0 }}>|</span>;

  return (
    <>
    <style>{`@keyframes gotoGlow { 0%,100% { border-color: rgba(212,168,83,0.5); box-shadow: 0 0 6px rgba(212,168,83,0.15); } 50% { border-color: rgba(255,255,255,0.6); box-shadow: 0 0 10px rgba(212,168,83,0.25); } } @keyframes gotoBlink { 0%,100% { opacity: 1; } 50% { opacity: 0.3; } }`}</style>
    <div style={{
      marginTop: 6,
      background: "rgba(0,0,0,0.18)",
      borderRadius: 10,
      border: "1px solid rgba(212,168,83,0.4)",
      overflow: showLang ? "visible" : "hidden",
      position: showLang ? "relative" : undefined,
      transition: "all 0.2s ease",
      animation: "gotoGlow 3s ease-in-out infinite",
    }}>
      {/* ── Collapsed Bar ── */}
      <div style={{
        display: "flex", alignItems: "center", gap: 0,
        padding: "7px 10px",
      }}>
        {/* GO TO button */}
        <button onClick={() => { setOpen(o => !o); setShowLang(false); }} style={{
          display: "flex", alignItems: "center", gap: 5,
          background: "transparent", border: "none", cursor: "pointer",
          padding: "0 4px 0 2px", flexShrink: 0,
        }}>
          <span style={{
            fontFamily: "system-ui, sans-serif",
            fontSize: 9, fontWeight: 700,
            color: "rgba(255,255,255,0.5)",
            textTransform: "uppercase",
            letterSpacing: "0.1em",
            animation: "gotoBlink 2s ease-in-out infinite",
          }}>Go To</span>
          <span style={{
            fontSize: 10, color: "rgba(255,255,255,0.4)",
            transform: open ? "rotate(180deg)" : "rotate(0deg)",
            transition: "transform 0.25s ease",
            display: "inline-block",
          }}>&#9662;</span>
        </button>

        {/* ── Utility items (Home only) ── */}
        {showUtilities && (
          <>
            {divider}

            {/* Streak */}
            {user && streak?.current_streak >= 1 && (
              <>
                <div title={`Best: ${streak.longest_streak} days`} style={{ display: "flex", alignItems: "center", gap: 3, padding: "0 6px", cursor: "default" }}>
                  <span style={{ fontSize: 11 }}>&#128293;</span>
                  <span style={{ fontFamily: th.ui, fontSize: 10, fontWeight: 700, color: "#d97706" }}>{streak.current_streak}</span>
                </div>
                {divider}
              </>
            )}

            {/* Dark mode toggle */}
            <button onClick={() => setDarkMode(!darkMode)} title={darkMode ? "Switch to Light Mode" : "Switch to Dark Mode"} style={{ ...pillBtn, margin: "0 2px" }}>
              <span style={{ fontSize: 11 }}>{darkMode ? "\u2600\uFE0F" : "\uD83C\uDF19"}</span>
              <span style={{ fontFamily: th.ui, fontSize: 9, fontWeight: 600, color: "rgba(255,255,255,0.6)" }}>{darkMode ? "Light" : "Dark"}</span>
            </button>

            {divider}

            {/* Language globe */}
            <div style={{ position: "relative" }}>
              <button onClick={(e) => { e.stopPropagation(); setShowLang(v => !v); setOpen(false); }} style={{ ...pillBtn, margin: "0 2px" }}>
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.6)" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                  <circle cx="12" cy="12" r="10" />
                  <path d="M2 12h20M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10A15.3 15.3 0 0 1 12 2z" />
                </svg>
                <span style={{ fontFamily: th.ui, fontSize: 9, fontWeight: 700, color: th.accent, letterSpacing: "0.05em" }}>{currentTrans.label}</span>
                <span style={{ fontSize: 8, color: "rgba(255,255,255,0.4)", transform: showLang ? "rotate(180deg)" : "rotate(0deg)", transition: "transform 0.2s" }}>&#9662;</span>
              </button>
              {showLang && (
                <LangDropdown
                  darkMode={darkMode} th={th}
                  bibleTranslation={bibleTranslation}
                  setBibleTranslation={setBibleTranslation}
                  onClose={() => setShowLang(false)}
                />
              )}
            </div>

            {divider}

            {/* User / Sign In */}
            {user ? (
              <span onClick={() => nav("account")} style={{ fontFamily: th.ui, fontSize: 10, color: "rgba(125,212,173,0.9)", fontWeight: 700, cursor: "pointer", padding: "0 4px", whiteSpace: "nowrap" }}>&#10003; {firstName}</span>
            ) : (
              <button onClick={() => nav("account")} style={{ background: "rgba(212,168,83,0.25)", border: "1px solid rgba(212,168,83,0.45)", borderRadius: 6, padding: "3px 10px", fontFamily: th.ui, fontSize: 9, fontWeight: 700, color: "#fff", cursor: "pointer", letterSpacing: "0.03em", whiteSpace: "nowrap" }}>Sign In</button>
            )}
          </>
        )}
      </div>

      {/* ── Expanded Inline Wheels ── */}
      {open && (
        <div style={{ padding: "0 12px 10px", animation: "fadeIn 0.2s ease" }}>
          {/* Divider */}
          <div style={{
            height: 1, margin: "0 16px 8px",
            background: "linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent)",
          }} />

          {/* Reference preview + GO button */}
          <div style={{
            display: "flex", alignItems: "center", justifyContent: "space-between",
            marginBottom: 8,
          }}>
            <span style={{
              fontFamily: "'Playfair Display', Georgia, serif",
              fontSize: 14, fontWeight: 600,
              color: "rgba(255,255,255,0.9)",
              letterSpacing: "0.02em",
            }}>
              {getBookName(goBook, bibleTranslation)} {goChapter}:{goVerse}
            </span>

            <button onClick={handleGo} style={{
              padding: "6px 16px",
              borderRadius: 8, border: "none",
              background: "rgba(255,255,255,0.15)",
              color: "rgba(255,255,255,0.9)",
              fontFamily: "system-ui, sans-serif",
              fontSize: 11, fontWeight: 700,
              cursor: "pointer",
              transition: "all 0.2s",
              letterSpacing: "0.05em",
              textTransform: "uppercase",
              backdropFilter: "blur(4px)",
            }}>
              Go &rarr;
            </button>
          </div>

          {/* Three scroll wheels */}
          <div style={{ display: "flex", gap: 4 }}>
            <ScrollColumn
              items={bookItems}
              selectedIdx={bookIdx}
              onSelect={handleBookChange}
              label="Book"
            />
            <ScrollColumn
              key={`ch-${goBook}`}
              items={chapterItems}
              selectedIdx={chapterIdx}
              onSelect={handleChapterChange}
              label="Chapter"
            />
            <ScrollColumn
              key={`v-${goBook}-${goChapter}`}
              items={verseItems}
              selectedIdx={verseIdx}
              onSelect={handleVerseChange}
              label="Verse"
            />
          </div>
        </div>
      )}
    </div>
    </>
  );
}
