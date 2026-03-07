"use client";
import { useState, useRef, useEffect, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS } from "../constants";

// ─── Scroll Wheel Constants ───
const ITEM_H = 44;
const VISIBLE = 5;
const PAD = ITEM_H * Math.floor(VISIBLE / 2);
const WHEEL_H = ITEM_H * VISIBLE;

// ─── ScrollColumn ───
function ScrollColumn({ items, selectedIdx, onSelect, label, darkMode }) {
  const scrollRef = useRef(null);
  const scrollTimer = useRef(null);
  const mounted = useRef(false);
  const bg = darkMode ? "#1A1714" : "#FBF7F0";
  const accent = darkMode ? "#D4A853" : "#5C3D1A";

  // Scroll to selected on mount
  useEffect(() => {
    if (!scrollRef.current) return;
    const target = Math.max(0, selectedIdx) * ITEM_H;
    // Use rAF to ensure DOM is painted
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
    <div style={{ flex: 1, display: "flex", flexDirection: "column", alignItems: "center", gap: 6 }}>
      <div style={{ position: "relative", width: "100%", height: WHEEL_H, overflow: "hidden", borderRadius: 12 }}>
        {/* Center highlight bar */}
        <div style={{
          position: "absolute", top: PAD, left: 4, right: 4, height: ITEM_H,
          background: darkMode ? "rgba(212,168,83,0.10)" : "rgba(212,168,83,0.08)",
          border: `1.5px solid rgba(212,168,83,${darkMode ? 0.22 : 0.18})`,
          borderRadius: 10, zIndex: 1, pointerEvents: "none",
        }} />
        {/* Top fade */}
        <div style={{
          position: "absolute", top: 0, left: 0, right: 0, height: PAD + 10,
          background: `linear-gradient(to bottom, ${bg} 25%, transparent)`,
          zIndex: 2, pointerEvents: "none",
        }} />
        {/* Bottom fade */}
        <div style={{
          position: "absolute", bottom: 0, left: 0, right: 0, height: PAD + 10,
          background: `linear-gradient(to top, ${bg} 25%, transparent)`,
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
              fontSize: i === selectedIdx ? 18 : 14,
              fontWeight: i === selectedIdx ? 700 : 400,
              color: i === selectedIdx ? accent : (darkMode ? "rgba(255,255,255,0.25)" : "rgba(0,0,0,0.25)"),
              cursor: "pointer",
              transition: "font-size 0.12s, color 0.12s",
              userSelect: "none",
              whiteSpace: "nowrap",
            }}>
              {item.label}
            </div>
          ))}
          <div style={{ height: PAD }} />
        </div>
      </div>
      <div style={{
        fontFamily: "system-ui, sans-serif", fontSize: 10, fontWeight: 700,
        color: darkMode ? "rgba(255,255,255,0.35)" : "rgba(0,0,0,0.3)",
        textTransform: "uppercase", letterSpacing: "0.1em",
      }}>{label}</div>
    </div>
  );
}

// ─── GoToBar ───
export default function GoToBar() {
  const { book, chapter, verse, view, t, ht, darkMode, nav, testament } = useApp();

  const [open, setOpen] = useState(false);
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

  // Lock body scroll when modal is open
  useEffect(() => {
    if (open) {
      document.body.style.overflow = "hidden";
      return () => { document.body.style.overflow = ""; };
    }
  }, [open]);

  // ── Derived data ──
  const bookItems = useMemo(() =>
    BIBLE_BOOKS.map(b => ({ value: b.name, label: b.name })),
  []);

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

  const bg = darkMode ? "#1A1714" : "#FBF7F0";

  // Display values for the compact bar
  const displayBook = book || goBook || "Select";
  const displayCh = chapter || goChapter || "–";
  const displayV = verse || goVerse || "–";

  return (
    <>
      {/* ── Compact Bar (inside header) ── */}
      <button onClick={() => setOpen(true)} style={{
        display: "flex", alignItems: "center", gap: 10,
        width: "100%", padding: "7px 12px",
        marginTop: 6,
        background: "linear-gradient(135deg, rgba(212,168,83,0.14), rgba(139,92,20,0.06))",
        border: "1px solid rgba(255,255,255,0.06)",
        borderRadius: 10,
        cursor: "pointer",
        transition: "background 0.2s",
      }}>
        {/* "Go To" label */}
        <span style={{
          fontFamily: "system-ui, sans-serif",
          fontSize: 9, fontWeight: 700,
          color: "rgba(255,255,255,0.45)",
          textTransform: "uppercase",
          letterSpacing: "0.1em",
          flexShrink: 0,
        }}>Go To</span>

        {/* Reference display */}
        <div style={{ display: "flex", alignItems: "center", gap: 5, flex: 1, minWidth: 0 }}>
          <span style={{ fontFamily: "system-ui", fontSize: 9, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>Book:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 13, fontWeight: 600, color: "rgba(255,255,255,0.85)", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{displayBook}</span>

          <span style={{ color: "rgba(255,255,255,0.15)", fontSize: 12, margin: "0 2px" }}>|</span>

          <span style={{ fontFamily: "system-ui", fontSize: 9, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>Ch:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 13, fontWeight: 600, color: "rgba(255,255,255,0.85)" }}>{displayCh}</span>

          <span style={{ color: "rgba(255,255,255,0.15)", fontSize: 12, margin: "0 2px" }}>|</span>

          <span style={{ fontFamily: "system-ui", fontSize: 9, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>V:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 13, fontWeight: 600, color: "rgba(255,255,255,0.85)" }}>{displayV}</span>
        </div>

        {/* Open indicator */}
        <span style={{ fontSize: 10, color: "rgba(255,255,255,0.35)" }}>▾</span>
      </button>

      {/* ── Bottom Sheet Modal ── */}
      {open && (
        <>
          {/* Backdrop */}
          <div onClick={() => setOpen(false)} style={{
            position: "fixed", inset: 0, zIndex: 999,
            background: "rgba(0,0,0,0.55)",
            animation: "fadeIn 0.2s ease",
          }} />

          {/* Sheet */}
          <div style={{
            position: "fixed", bottom: 0, left: 0, right: 0,
            zIndex: 1000,
            background: bg,
            borderRadius: "24px 24px 0 0",
            padding: "0 16px",
            paddingBottom: "max(20px, env(safe-area-inset-bottom))",
            boxShadow: `0 -8px 40px rgba(0,0,0,${darkMode ? 0.5 : 0.25})`,
            animation: "slideUp 0.3s cubic-bezier(0.32,0.72,0,1)",
            maxWidth: 520, marginLeft: "auto", marginRight: "auto",
          }}>
            {/* Drag handle */}
            <div style={{ display: "flex", justifyContent: "center", paddingTop: 10, paddingBottom: 4 }}>
              <div style={{
                width: 36, height: 4, borderRadius: 2,
                background: darkMode ? "rgba(255,255,255,0.12)" : "rgba(0,0,0,0.1)",
              }} />
            </div>

            {/* Header */}
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "4px 0 2px" }}>
              <div style={{
                fontFamily: "'Playfair Display', Georgia, serif",
                fontSize: 18, fontWeight: 700,
                color: darkMode ? "#D4C8B0" : "#3A2A14",
              }}>Go To Verse</div>
              <button onClick={() => setOpen(false)} style={{
                width: 32, height: 32, borderRadius: "50%",
                background: darkMode ? "rgba(255,255,255,0.06)" : "rgba(0,0,0,0.04)",
                border: "none", cursor: "pointer",
                fontSize: 15, color: darkMode ? "rgba(255,255,255,0.35)" : "rgba(0,0,0,0.25)",
                display: "flex", alignItems: "center", justifyContent: "center",
              }}>✕</button>
            </div>

            {/* Current selection preview */}
            <div style={{
              textAlign: "center", padding: "8px 0 4px",
              fontFamily: "'Playfair Display', serif",
              fontSize: 15, fontWeight: 600,
              color: darkMode ? "#D4A853" : "#8B6914",
              letterSpacing: "0.02em",
            }}>
              {goBook} {goChapter}:{goVerse}
            </div>

            {/* Thin divider */}
            <div style={{
              height: 1, margin: "4px 40px 8px",
              background: `linear-gradient(90deg, transparent, ${darkMode ? "rgba(212,168,83,0.2)" : "rgba(212,168,83,0.15)"}, transparent)`,
            }} />

            {/* Three scroll wheels */}
            <div style={{ display: "flex", gap: 6, padding: "0 0 12px" }}>
              <ScrollColumn
                items={bookItems}
                selectedIdx={bookIdx}
                onSelect={handleBookChange}
                label="Book"
                darkMode={darkMode}
              />
              <ScrollColumn
                key={`ch-${goBook}`}
                items={chapterItems}
                selectedIdx={chapterIdx}
                onSelect={handleChapterChange}
                label="Chapter"
                darkMode={darkMode}
              />
              <ScrollColumn
                key={`v-${goBook}-${goChapter}`}
                items={verseItems}
                selectedIdx={verseIdx}
                onSelect={handleVerseChange}
                label="Verse"
                darkMode={darkMode}
              />
            </div>

            {/* Go button */}
            <button onClick={handleGo} style={{
              width: "100%", padding: "14px",
              borderRadius: 14, border: "none",
              background: "linear-gradient(135deg, #D4A853, #8B6914)",
              color: "#fff",
              fontFamily: "'Playfair Display', serif",
              fontSize: 16, fontWeight: 700,
              cursor: "pointer",
              boxShadow: "0 4px 16px rgba(212,168,83,0.3)",
              transition: "all 0.2s",
              letterSpacing: "0.02em",
              marginBottom: 6,
            }}>
              Go to {goBook} {goChapter}:{goVerse} →
            </button>
          </div>
        </>
      )}
    </>
  );
}
