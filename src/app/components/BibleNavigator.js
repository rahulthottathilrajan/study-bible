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
  const th = view === "books" ? ht : t;

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
    padding: "9px 14px",
    background: `linear-gradient(135deg, ${th.card}, ${th.accentLight}44)`,
    border: `1px solid ${th.divider}`,
    borderRadius: 14,
    marginBottom: 16,
    position: "relative",
    boxShadow: `0 2px 8px rgba(0,0,0,${darkMode ? 0.18 : 0.05}), inset 0 1px 0 rgba(255,255,255,${darkMode ? 0.03 : 0.5})`,
  };

  const triggerStyle = (isOpen, disabled) => ({
    display: "flex", alignItems: "center", gap: 6,
    padding: "8px 14px",
    background: isOpen ? th.accentLight : "transparent",
    border: `1px solid ${isOpen ? th.accentBorder : th.divider}`,
    borderRadius: 10,
    fontFamily: th.ui, fontSize: 13, fontWeight: isOpen ? 700 : 600,
    color: disabled ? th.light : th.dark,
    cursor: disabled ? "default" : "pointer",
    opacity: disabled ? 0.4 : 1,
    transition: "all 0.2s ease",
    whiteSpace: "nowrap",
    lineHeight: 1,
  });

  const overlayStyle = {
    position: "absolute", top: "calc(100% + 6px)", left: 0, right: 0,
    background: th.card,
    border: `1px solid ${th.divider}`,
    borderRadius: 16,
    boxShadow: `0 12px 40px rgba(0,0,0,${darkMode ? 0.4 : 0.14}), 0 2px 8px rgba(0,0,0,${darkMode ? 0.2 : 0.06})`,
    zIndex: 8,
    animation: "dropIn 0.2s ease",
    overflow: "hidden",
  };

  const gridCellStyle = (isCurrent) => ({
    width: 44, height: 44, borderRadius: 10,
    background: isCurrent ? (th.tabActive || th.accent) : th.accentLight,
    border: isCurrent ? `2px solid ${th.accent}` : `1px solid ${th.accentBorder}`,
    color: isCurrent ? (th.headerText || "#fff") : th.text,
    fontFamily: th.heading, fontSize: 14, fontWeight: 600,
    cursor: "pointer", transition: "all 0.18s ease",
    display: "flex", alignItems: "center", justifyContent: "center",
    animation: isCurrent ? "pulseGlow 2s ease infinite" : "none",
  });

  const chevron = (isOpen) => (
    <span style={{ fontSize: 10, color: th.muted, transition: "transform 0.25s ease", display: "inline-block", transform: isOpen ? "rotate(180deg)" : "rotate(0deg)" }}>▾</span>
  );

  // ─── Render ───
  return (
    <div ref={containerRef} style={barStyle}>

      {/* ── Book Trigger ── */}
      <button onClick={() => toggle("book")} style={triggerStyle(openDropdown === "book", false)}>
        <span style={{ fontSize: 14, lineHeight: 1 }}>📖</span>
        <span style={{ fontFamily: book ? th.heading : th.ui, letterSpacing: book ? "0.01em" : "0" }}>{book || "Select Book"}</span>
        {chevron(openDropdown === "book")}
      </button>

      {/* ── Separator ── */}
      {book && <span style={{ color: th.light, fontSize: 16, fontWeight: 300, userSelect: "none" }}>:</span>}

      {/* ── Chapter Trigger ── */}
      <button onClick={() => book && toggle("chapter")} style={triggerStyle(openDropdown === "chapter", !book)}>
        <span style={{ fontFamily: chapter ? th.heading : th.ui }}>{chapter ? chapter : "Ch"}</span>
        {chevron(openDropdown === "chapter")}
      </button>

      {/* ── Separator ── */}
      {showVerse && <span style={{ color: th.light, fontSize: 16, fontWeight: 300, userSelect: "none" }}>:</span>}

      {/* ── Verse Trigger ── */}
      {showVerse && (
        <button onClick={() => verseNums.length > 0 && toggle("verse")} style={triggerStyle(openDropdown === "verse", verseNums.length === 0)}>
          <span style={{ fontFamily: verse ? th.heading : th.ui }}>{verse ? verse : "v."}</span>
          {chevron(openDropdown === "verse")}
        </button>
      )}

      {/* ── Book Dropdown ── */}
      {openDropdown === "book" && (
        <div style={{ ...overlayStyle, maxHeight: 420, display: "flex", flexDirection: "column" }}>
          {/* Search */}
          <div style={{ padding: "12px 14px 0", flexShrink: 0 }}>
            <input
              ref={searchRef}
              type="text"
              placeholder="Search books..."
              value={bookSearch}
              onChange={e => setBookSearch(e.target.value)}
              style={{
                width: "100%", padding: "10px 14px",
                border: `1px solid ${th.divider}`, borderRadius: 10,
                background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.02)",
                fontFamily: th.ui, fontSize: 13, color: th.dark,
                outline: "none", boxSizing: "border-box",
                transition: "border-color 0.2s",
              }}
              onFocus={e => e.target.style.borderColor = th.accent}
              onBlur={e => e.target.style.borderColor = th.divider}
            />
          </div>

          {/* OT / NT tabs */}
          <div style={{ display: "flex", gap: 6, padding: "10px 14px 6px", flexShrink: 0 }}>
            {[["all", "All"], ["OT", "Old Testament"], ["NT", "New Testament"]].map(([key, label]) => (
              <button key={key} onClick={() => setBookTab(key)}
                style={{
                  padding: "6px 14px", borderRadius: 20,
                  border: bookTab === key ? `1.5px solid ${th.accent}` : `1px solid ${th.divider}`,
                  background: bookTab === key ? th.accentLight : "transparent",
                  fontFamily: th.ui, fontSize: 11, fontWeight: 700,
                  color: bookTab === key ? th.accent : th.muted,
                  cursor: "pointer", transition: "all 0.18s ease",
                  textTransform: "uppercase", letterSpacing: "0.06em",
                }}>
                {label}
              </button>
            ))}
          </div>

          {/* Grouped book list */}
          <div style={{ overflowY: "auto", flex: 1, padding: "4px 0 10px" }}>
            {Object.entries(groupedBooks).length === 0 && (
              <div style={{ padding: "24px 14px", textAlign: "center", fontFamily: th.ui, fontSize: 13, color: th.muted }}>No books found</div>
            )}
            {Object.entries(groupedBooks).map(([cat, books]) => (
              <div key={cat}>
                {/* Category header */}
                <div style={{
                  padding: "10px 14px 4px",
                  fontFamily: th.ui, fontSize: 10, fontWeight: 700,
                  color: th.light, textTransform: "uppercase", letterSpacing: "0.12em",
                  display: "flex", alignItems: "center", gap: 6,
                }}>
                  <span style={{ fontSize: 12 }}>{CAT_ICONS[cat] || "📖"}</span>
                  {cat}
                </div>
                {/* Book rows */}
                {books.map(b => {
                  const isCurrent = b.name === book;
                  return (
                    <button key={b.name} onClick={() => handleBookSelect(b.name)}
                      style={{
                        width: "100%", display: "flex", alignItems: "center", justifyContent: "space-between",
                        padding: "10px 14px 10px 30px",
                        background: isCurrent ? th.accentLight : "transparent",
                        border: "none", borderLeft: isCurrent ? `3px solid ${th.accent}` : "3px solid transparent",
                        cursor: "pointer", textAlign: "left", transition: "all 0.15s ease",
                      }}>
                      <span style={{ fontFamily: th.heading, fontSize: 14, fontWeight: isCurrent ? 700 : 500, color: isCurrent ? th.accent : th.dark, letterSpacing: "0.01em" }}>{b.name}</span>
                      <span style={{ fontFamily: th.ui, fontSize: 10.5, color: th.light, fontWeight: 600 }}>{b.chapters} ch</span>
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
        <div style={{ ...overlayStyle, maxHeight: 360, overflowY: "auto", padding: 16 }}>
          <div style={{ fontFamily: th.heading, fontSize: 13, fontWeight: 700, color: th.dark, marginBottom: 4 }}>
            {bookInfo?.name}
          </div>
          <div style={{ fontFamily: th.ui, fontSize: 10.5, fontWeight: 600, color: th.light, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 12 }}>
            {totalChapters} Chapters
          </div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>
            {Array.from({ length: totalChapters }, (_, i) => i + 1).map(ch => (
              <button key={ch} onClick={() => handleChapterSelect(ch)} style={gridCellStyle(ch === chapter)}>
                {ch}
              </button>
            ))}
          </div>
        </div>
      )}

      {/* ── Verse Grid ── */}
      {openDropdown === "verse" && verseNums.length > 0 && (
        <div style={{ ...overlayStyle, maxHeight: 360, overflowY: "auto", padding: 16 }}>
          <div style={{ fontFamily: th.heading, fontSize: 13, fontWeight: 700, color: th.dark, marginBottom: 4 }}>
            {book} {chapter}
          </div>
          <div style={{ fontFamily: th.ui, fontSize: 10.5, fontWeight: 600, color: th.light, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 12 }}>
            {verseNums.length} Verses
          </div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>
            {verseNums.map(v => (
              <button key={v} onClick={() => handleVerseSelect(v)} style={gridCellStyle(v === verse)}>
                {v}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
