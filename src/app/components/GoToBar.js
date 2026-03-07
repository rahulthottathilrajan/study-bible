"use client";
import { useState, useRef, useEffect, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS } from "../constants";

// ─── Compact Scroll Wheel Constants ───
const ITEM_H = 32;
const VISIBLE = 3;
const PAD = ITEM_H * Math.floor(VISIBLE / 2);
const WHEEL_H = ITEM_H * VISIBLE;

// ─── ScrollColumn (compact inline) ───
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
          background: "rgba(212,168,83,0.12)",
          border: "1.5px solid rgba(212,168,83,0.22)",
          borderRadius: 7, zIndex: 1, pointerEvents: "none",
        }} />
        {/* Top fade */}
        <div style={{
          position: "absolute", top: 0, left: 0, right: 0, height: PAD + 6,
          background: "linear-gradient(to bottom, #1A1714 30%, transparent)",
          zIndex: 2, pointerEvents: "none",
        }} />
        {/* Bottom fade */}
        <div style={{
          position: "absolute", bottom: 0, left: 0, right: 0, height: PAD + 6,
          background: "linear-gradient(to top, #1A1714 30%, transparent)",
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
              fontSize: i === selectedIdx ? 14 : 11,
              fontWeight: i === selectedIdx ? 700 : 400,
              color: i === selectedIdx ? "#D4A853" : "rgba(255,255,255,0.2)",
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

// ─── GoToBar (inline scroll wheels) ───
export default function GoToBar() {
  const { book, chapter, verse, view, t, ht, darkMode, nav, testament } = useApp();

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
  };

  return (
    <div style={{
      marginTop: 6,
      background: "#1A1714",
      borderRadius: 14,
      padding: "10px 12px 8px",
      border: "1px solid rgba(212,168,83,0.12)",
      boxShadow: "0 2px 12px rgba(0,0,0,0.3), inset 0 1px 0 rgba(255,255,255,0.03)",
    }}>
      {/* Top row: GO TO label + reference + GO button */}
      <div style={{
        display: "flex", alignItems: "center", justifyContent: "space-between",
        marginBottom: 6,
      }}>
        <span style={{
          fontFamily: "system-ui, sans-serif",
          fontSize: 9, fontWeight: 700,
          color: "rgba(255,255,255,0.5)",
          textTransform: "uppercase",
          letterSpacing: "0.12em",
        }}>Go To</span>

        {/* Reference preview */}
        <span style={{
          fontFamily: "'Playfair Display', Georgia, serif",
          fontSize: 13, fontWeight: 600,
          color: "#D4A853",
          letterSpacing: "0.02em",
        }}>
          {goBook} {goChapter}:{goVerse}
        </span>

        {/* GO button */}
        <button onClick={handleGo} style={{
          padding: "5px 14px",
          borderRadius: 8, border: "none",
          background: "linear-gradient(135deg, #D4A853, #8B6914)",
          color: "#fff",
          fontFamily: "system-ui, sans-serif",
          fontSize: 11, fontWeight: 700,
          cursor: "pointer",
          boxShadow: "0 2px 8px rgba(212,168,83,0.3)",
          transition: "all 0.2s",
          letterSpacing: "0.05em",
          textTransform: "uppercase",
        }}>
          Go &rarr;
        </button>
      </div>

      {/* Thin divider */}
      <div style={{
        height: 1, margin: "0 20px 6px",
        background: "linear-gradient(90deg, transparent, rgba(212,168,83,0.15), transparent)",
      }} />

      {/* Three inline scroll wheels */}
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
  );
}
