"use client";
import { useState, useRef, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS, CAT_ICONS } from "../constants";

export default function BibleNavigator() {
  const { view, book, chapter, verse, testament, verses, t, ht, darkMode, nav } = useApp();

  const [openDropdown, setOpenDropdown] = useState(null);
  const [bookSearch, setBookSearch] = useState("");
  const [bookTab, setBookTab] = useState("all");
  const containerRef = useRef(null);
  const searchRef = useRef(null);

  // Close on click outside
  useEffect(() => {
    if (!openDropdown) return;
    const handler = (e) => {
      if (containerRef.current && !containerRef.current.contains(e.target)) {
        setOpenDropdown(null);
        setBookSearch("");
      }
    };
    document.addEventListener("mousedown", handler);
    document.addEventListener("touchstart", handler);
    return () => {
      document.removeEventListener("mousedown", handler);
      document.removeEventListener("touchstart", handler);
    };
  }, [openDropdown]);

  // Auto-focus search when book dropdown opens
  useEffect(() => {
    if (openDropdown === "book" && searchRef.current) searchRef.current.focus();
  }, [openDropdown]);

  // Derived
  const bookInfo = useMemo(() => book ? BIBLE_BOOKS.find(b => b.name === book) : null, [book]);
  const totalChapters = bookInfo?.chapters || 0;
  const verseNums = useMemo(() => verses.map(v => v.verse_number).sort((a, b) => a - b), [verses]);
  const showVerse = view === "verses" || view === "verse";
  const th = view === "books" ? ht : t; // active theme

  // Filtered & grouped books
  const groupedBooks = useMemo(() => {
    const filtered = BIBLE_BOOKS
      .filter(b => bookTab === "all" || b.testament === bookTab)
      .filter(b => !bookSearch || b.name.toLowerCase().includes(bookSearch.toLowerCase()));
    const cats = {};
    filtered.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return cats;
  }, [bookTab, bookSearch]);

  const toggle = (key) => {
    setOpenDropdown(prev => prev === key ? null : key);
    setBookSearch("");
  };

  const handleBookSelect = (name) => {
    const bi = BIBLE_BOOKS.find(b => b.name === name);
    setOpenDropdown(null);
    setBookSearch("");
    nav("chapter", { book: name, chapter: null, verse: null, testament: bi?.testament || testament });
  };

  const handleChapterSelect = (ch) => {
    setOpenDropdown(null);
    nav("verses", { chapter: ch, verse: null });
  };

  const handleVerseSelect = (v) => {
    setOpenDropdown(null);
    nav("verse", { verse: v, tab: "study" });
  };

  // ─── Styles ───
  const barStyle = {
    display: "flex", alignItems: "center", gap: 8,
    padding: "8px 12px",
    background: th.card,
    border: `1px solid ${th.divider}`,
    borderRadius: 14,
    marginBottom: 16,
    position: "relative",
    boxShadow: `0 1px 4px rgba(0,0,0,${darkMode ? 0.2 : 0.04})`,
  };

  const triggerStyle = (isOpen, disabled) => ({
    display: "flex", alignItems: "center", gap: 6,
    padding: "7px 12px",
    background: isOpen ? th.accentLight : "transparent",
    border: `1px solid ${isOpen ? th.accentBorder : th.divider}`,
    borderRadius: 8,
    fontFamily: th.ui, fontSize: 13, fontWeight: isOpen ? 700 : 600,
    color: disabled ? th.light : th.dark,
    cursor: disabled ? "default" : "pointer",
    opacity: disabled ? 0.45 : 1,
    transition: "all 0.15s",
    whiteSpace: "nowrap",
    lineHeight: 1,
  });

  const overlayStyle = {
    position: "absolute", top: "calc(100% + 4px)", left: 0, right: 0,
    background: th.card,
    border: `1px solid ${th.divider}`,
    borderRadius: 14,
    boxShadow: `0 8px 32px rgba(0,0,0,${darkMode ? 0.35 : 0.12})`,
    zIndex: 8,
    animation: "fadeIn 0.2s ease",
    overflow: "hidden",
  };

  const chevron = (isOpen) => (
    <span style={{ fontSize: 10, color: th.muted, transition: "transform 0.2s", display: "inline-block", transform: isOpen ? "rotate(180deg)" : "rotate(0deg)" }}>▾</span>
  );

  // ─── Render ───
  return (
    <div ref={containerRef} style={barStyle}>

      {/* ── Book Trigger ── */}
      <button onClick={() => toggle("book")} style={triggerStyle(openDropdown === "book", false)}>
        <span style={{ fontSize: 14 }}>📖</span>
        <span>{book || "Select Book"}</span>
        {chevron(openDropdown === "book")}
      </button>

      {/* ── Chapter Trigger ── */}
      <button onClick={() => book && toggle("chapter")} style={triggerStyle(openDropdown === "chapter", !book)}>
        <span>Ch{chapter ? ` ${chapter}` : ""}</span>
        {chevron(openDropdown === "chapter")}
      </button>

      {/* ── Verse Trigger ── */}
      {showVerse && (
        <button onClick={() => verseNums.length > 0 && toggle("verse")} style={triggerStyle(openDropdown === "verse", verseNums.length === 0)}>
          <span>v.{verse || ""}</span>
          {chevron(openDropdown === "verse")}
        </button>
      )}

      {/* ── Book Dropdown ── */}
      {openDropdown === "book" && (
        <div style={{ ...overlayStyle, maxHeight: 400, display: "flex", flexDirection: "column" }}>
          {/* Search */}
          <div style={{ padding: "10px 14px 0", flexShrink: 0 }}>
            <input
              ref={searchRef}
              type="text"
              placeholder="Search books..."
              value={bookSearch}
              onChange={e => setBookSearch(e.target.value)}
              style={{
                width: "100%", padding: "9px 12px",
                border: `1px solid ${th.divider}`, borderRadius: 8,
                background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)",
                fontFamily: th.ui, fontSize: 13, color: th.dark,
                outline: "none", boxSizing: "border-box",
              }}
            />
          </div>

          {/* OT / NT tabs */}
          <div style={{ display: "flex", gap: 6, padding: "10px 14px 6px", flexShrink: 0 }}>
            {[["all", "All"], ["OT", "Old"], ["NT", "New"]].map(([key, label]) => (
              <button key={key} onClick={() => setBookTab(key)}
                style={{
                  padding: "5px 12px", borderRadius: 20,
                  border: bookTab === key ? `1px solid ${th.accent}` : `1px solid ${th.divider}`,
                  background: bookTab === key ? th.accentLight : "transparent",
                  fontFamily: th.ui, fontSize: 11.5, fontWeight: 700,
                  color: bookTab === key ? th.accent : th.muted,
                  cursor: "pointer", transition: "all 0.15s",
                  textTransform: "uppercase", letterSpacing: "0.06em",
                }}>
                {label}
              </button>
            ))}
          </div>

          {/* Grouped book list */}
          <div style={{ overflowY: "auto", flex: 1, padding: "4px 0 8px" }}>
            {Object.entries(groupedBooks).length === 0 && (
              <div style={{ padding: "20px 14px", textAlign: "center", fontFamily: th.ui, fontSize: 13, color: th.muted }}>No books found</div>
            )}
            {Object.entries(groupedBooks).map(([cat, books]) => (
              <div key={cat}>
                {/* Category header */}
                <div style={{
                  padding: "8px 14px 4px",
                  fontFamily: th.ui, fontSize: 10, fontWeight: 700,
                  color: th.muted, textTransform: "uppercase", letterSpacing: "0.1em",
                  display: "flex", alignItems: "center", gap: 6,
                }}>
                  <span style={{ fontSize: 13 }}>{CAT_ICONS[cat] || "📖"}</span>
                  {cat}
                </div>
                {/* Book rows */}
                {books.map(b => {
                  const isCurrent = b.name === book;
                  return (
                    <button key={b.name} onClick={() => handleBookSelect(b.name)}
                      style={{
                        width: "100%", display: "flex", alignItems: "center", justifyContent: "space-between",
                        padding: "9px 14px 9px 28px",
                        background: isCurrent ? th.accentLight : "transparent",
                        border: "none", borderLeft: isCurrent ? `3px solid ${th.accent}` : "3px solid transparent",
                        cursor: "pointer", textAlign: "left", transition: "background 0.12s",
                      }}>
                      <span style={{ fontFamily: th.ui, fontSize: 13.5, fontWeight: isCurrent ? 700 : 500, color: isCurrent ? th.accent : th.dark }}>{b.name}</span>
                      <span style={{ fontFamily: th.ui, fontSize: 11, color: th.light }}>{b.chapters} ch</span>
                    </button>
                  );
                })}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ── Chapter Grid ── */}
      {openDropdown === "chapter" && book && (
        <div style={{ ...overlayStyle, maxHeight: 340, overflowY: "auto", padding: 14 }}>
          <div style={{ fontFamily: th.ui, fontSize: 11, fontWeight: 700, color: th.muted, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 10 }}>
            {bookInfo?.name} — {totalChapters} Chapters
          </div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
            {Array.from({ length: totalChapters }, (_, i) => i + 1).map(ch => {
              const isCurrent = ch === chapter;
              return (
                <button key={ch} onClick={() => handleChapterSelect(ch)}
                  style={{
                    width: 42, height: 42, borderRadius: 8,
                    background: isCurrent ? (th.tabActive || th.accent) : th.accentLight,
                    border: isCurrent ? "none" : `1px solid ${th.accentBorder}`,
                    color: isCurrent ? (th.headerText || "#fff") : th.text,
                    fontFamily: th.heading, fontSize: 14, fontWeight: 600,
                    cursor: "pointer", transition: "all 0.15s",
                    display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                  {ch}
                </button>
              );
            })}
          </div>
        </div>
      )}

      {/* ── Verse Grid ── */}
      {openDropdown === "verse" && verseNums.length > 0 && (
        <div style={{ ...overlayStyle, maxHeight: 340, overflowY: "auto", padding: 14 }}>
          <div style={{ fontFamily: th.ui, fontSize: 11, fontWeight: 700, color: th.muted, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 10 }}>
            {book} {chapter} — {verseNums.length} Verses
          </div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
            {verseNums.map(v => {
              const isCurrent = v === verse;
              return (
                <button key={v} onClick={() => handleVerseSelect(v)}
                  style={{
                    width: 42, height: 42, borderRadius: 8,
                    background: isCurrent ? (th.tabActive || th.accent) : th.accentLight,
                    border: isCurrent ? "none" : `1px solid ${th.accentBorder}`,
                    color: isCurrent ? (th.headerText || "#fff") : th.text,
                    fontFamily: th.heading, fontSize: 14, fontWeight: 600,
                    cursor: "pointer", transition: "all 0.15s",
                    display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                  {v}
                </button>
              );
            })}
          </div>
        </div>
      )}
    </div>
  );
}
