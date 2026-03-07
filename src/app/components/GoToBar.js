"use client";
import { useState, useRef, useEffect, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS } from "../constants";

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
        {/* Top fade — subtle, lets items show through */}
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

// ─── GoToBar (tap-to-expand inline wheels) ───
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

  // Display values
  const displayBook = book || goBook || "Select";
  const displayCh = chapter || goChapter || "–";
  const displayV = verse || goVerse || "–";

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

  return (
    <>
    <style>{`@keyframes gotoGlow { 0%,100% { border-color: rgba(212,168,83,0.5); box-shadow: 0 0 6px rgba(212,168,83,0.15); } 50% { border-color: rgba(255,255,255,0.6); box-shadow: 0 0 10px rgba(212,168,83,0.25); } }`}</style>
    <div style={{
      marginTop: 6,
      background: "rgba(0,0,0,0.18)",
      borderRadius: 10,
      border: "1px solid rgba(212,168,83,0.4)",
      overflow: "hidden",
      transition: "all 0.2s ease",
      animation: "gotoGlow 3s ease-in-out infinite",
    }}>
      {/* ── Compact Bar (collapsed) ── */}
      <button onClick={() => setOpen(o => !o)} style={{
        display: "flex", alignItems: "center", gap: 10,
        width: "100%", padding: "7px 12px",
        background: "transparent",
        border: "none",
        cursor: "pointer",
      }}>
        <span style={{
          fontFamily: "system-ui, sans-serif",
          fontSize: 9, fontWeight: 700,
          color: "rgba(255,255,255,0.5)",
          textTransform: "uppercase",
          letterSpacing: "0.1em",
          flexShrink: 0,
        }}>Go To</span>

        <div style={{ display: "flex", alignItems: "center", gap: 4, flex: 1, minWidth: 0 }}>
          <span style={{ fontFamily: "system-ui", fontSize: 8, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>Book:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 11, fontWeight: 600, color: "rgba(255,255,255,0.85)", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{displayBook}</span>

          <span style={{ color: "rgba(255,255,255,0.15)", fontSize: 10, margin: "0 1px" }}>|</span>

          <span style={{ fontFamily: "system-ui", fontSize: 8, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>Ch:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 11, fontWeight: 600, color: "rgba(255,255,255,0.85)" }}>{displayCh}</span>

          <span style={{ color: "rgba(255,255,255,0.15)", fontSize: 10, margin: "0 1px" }}>|</span>

          <span style={{ fontFamily: "system-ui", fontSize: 8, color: "rgba(255,255,255,0.3)", fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.05em" }}>V:</span>
          <span style={{ fontFamily: "'Playfair Display', serif", fontSize: 11, fontWeight: 600, color: "rgba(255,255,255,0.85)" }}>{displayV}</span>
        </div>

        <span style={{
          fontSize: 10, color: "rgba(255,255,255,0.4)",
          transform: open ? "rotate(180deg)" : "rotate(0deg)",
          transition: "transform 0.25s ease",
          display: "inline-block",
        }}>▾</span>
      </button>

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
              {goBook} {goChapter}:{goVerse}
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
