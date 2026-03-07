"use client";
import { useState, useRef, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_BOOKS, CAT_ICONS } from "../constants";

export default function GoToBar() {
  const { book, chapter, verse, view, t, ht, darkMode, nav, testament } = useApp();

  const [goBook, setGoBook] = useState(book || null);
  const [goChapter, setGoChapter] = useState(chapter || null);
  const [goVerse, setGoVerse] = useState(verse ? String(verse) : "");
  const [openDrop, setOpenDrop] = useState(null);
  const [bookSearch, setBookSearch] = useState("");
  const [bookTab, setBookTab] = useState("all");
  const containerRef = useRef(null);
  const searchRef = useRef(null);
  const verseInputRef = useRef(null);

  const isBibleView = ["books", "chapter", "verses", "verse"].includes(view);
  const th = isBibleView ? t : ht;

  // Sync with nav state when navigating externally
  useEffect(() => {
    setGoBook(book || null);
    setGoChapter(chapter || null);
    setGoVerse(verse ? String(verse) : "");
  }, [book, chapter, verse]);

  // Close on click outside
  useEffect(() => {
    if (!openDrop) return;
    const handler = (e) => {
      if (containerRef.current && !containerRef.current.contains(e.target)) {
        setOpenDrop(null);
        setBookSearch("");
      }
    };
    document.addEventListener("mousedown", handler);
    document.addEventListener("touchstart", handler);
    return () => {
      document.removeEventListener("mousedown", handler);
      document.removeEventListener("touchstart", handler);
    };
  }, [openDrop]);

  // Auto-focus search when book dropdown opens
  useEffect(() => {
    if (openDrop === "book" && searchRef.current) setTimeout(() => searchRef.current?.focus(), 50);
  }, [openDrop]);

  const bookInfo = useMemo(() => goBook ? BIBLE_BOOKS.find(b => b.name === goBook) : null, [goBook]);
  const totalChapters = bookInfo?.chapters || 0;

  const groupedBooks = useMemo(() => {
    const filtered = BIBLE_BOOKS
      .filter(b => bookTab === "all" || b.testament === bookTab)
      .filter(b => !bookSearch || b.name.toLowerCase().includes(bookSearch.toLowerCase()));
    const cats = {};
    filtered.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return cats;
  }, [bookTab, bookSearch]);

  const toggle = (key) => {
    setOpenDrop(prev => prev === key ? null : key);
    setBookSearch("");
  };

  const handleBookSelect = (name) => {
    setGoBook(name);
    setGoChapter(null);
    setGoVerse("");
    setOpenDrop("chapter");
    setBookSearch("");
  };

  const handleChapterSelect = (ch) => {
    setGoChapter(ch);
    setGoVerse("");
    setOpenDrop(null);
    setTimeout(() => verseInputRef.current?.focus(), 100);
  };

  const handleGo = () => {
    if (!goBook) return;
    const bi = BIBLE_BOOKS.find(b => b.name === goBook);
    const tst = bi?.testament || testament || "OT";
    if (goChapter && goVerse && parseInt(goVerse) > 0) {
      nav("verse", { testament: tst, book: goBook, chapter: goChapter, verse: parseInt(goVerse), tab: "study" });
    } else if (goChapter) {
      nav("verses", { testament: tst, book: goBook, chapter: goChapter, verse: null });
    } else {
      nav("chapter", { testament: tst, book: goBook });
    }
    setOpenDrop(null);
  };

  const handleVerseKeyDown = (e) => { if (e.key === "Enter") handleGo(); };

  // ─── Styles ───
  const labelStyle = {
    fontFamily: "system-ui, sans-serif",
    fontSize: 9, fontWeight: 700,
    color: "rgba(255,255,255,0.45)",
    textTransform: "uppercase",
    letterSpacing: "0.08em",
    marginBottom: 2,
  };

  const triggerBtn = (isOpen, disabled) => ({
    display: "flex", alignItems: "center", gap: 4,
    padding: "5px 10px",
    background: isOpen ? "rgba(255,255,255,0.15)" : "rgba(255,255,255,0.06)",
    border: `1px solid ${isOpen ? "rgba(255,255,255,0.25)" : "rgba(255,255,255,0.1)"}`,
    borderRadius: 8,
    fontFamily: th.heading || "Georgia, serif",
    fontSize: 13, fontWeight: 600,
    color: disabled ? "rgba(255,255,255,0.3)" : "rgba(255,255,255,0.9)",
    cursor: disabled ? "default" : "pointer",
    opacity: disabled ? 0.4 : 1,
    transition: "all 0.15s",
    whiteSpace: "nowrap",
    maxWidth: 140, overflow: "hidden", textOverflow: "ellipsis",
    lineHeight: 1.2,
  });

  const overlayBase = {
    position: "absolute",
    top: "calc(100% + 4px)", left: 0, right: 0,
    background: darkMode ? "#1E1C18" : "#fff",
    border: `1px solid ${darkMode ? "rgba(255,255,255,0.1)" : "rgba(0,0,0,0.1)"}`,
    borderRadius: 14,
    boxShadow: `0 12px 40px rgba(0,0,0,${darkMode ? 0.5 : 0.18})`,
    zIndex: 100,
    animation: "dropIn 0.2s ease",
    overflow: "hidden",
  };

  const gridCell = (isCurrent) => ({
    width: 40, height: 40, borderRadius: 8,
    background: isCurrent ? (th.tabActive || th.accent) : (darkMode ? "rgba(255,255,255,0.06)" : th.accentLight || "#f5f0e8"),
    border: isCurrent ? `2px solid ${th.accent}` : `1px solid ${th.accentBorder || th.divider}`,
    color: isCurrent ? (th.headerText || "#fff") : (darkMode ? "#D4C8B0" : th.text || "#333"),
    fontFamily: th.heading || "Georgia, serif",
    fontSize: 13, fontWeight: 600,
    cursor: "pointer",
    display: "flex", alignItems: "center", justifyContent: "center",
    transition: "all 0.15s",
  });

  const chevron = (isOpen) => (
    <span style={{ fontSize: 8, color: "rgba(255,255,255,0.5)", transition: "transform 0.2s", display: "inline-block", transform: isOpen ? "rotate(180deg)" : "rotate(0deg)" }}>▾</span>
  );

  return (
    <div ref={containerRef} style={{
      display: "flex", alignItems: "flex-end", gap: 8,
      padding: "8px 0 4px", marginTop: 6,
      borderTop: "1px solid rgba(255,255,255,0.08)",
      position: "relative",
    }}>
      {/* Go To label */}
      <div style={{
        fontFamily: "system-ui, sans-serif",
        fontSize: 10, fontWeight: 700,
        color: "rgba(255,255,255,0.5)",
        textTransform: "uppercase",
        letterSpacing: "0.1em",
        paddingBottom: 7, flexShrink: 0,
      }}>
        Go&nbsp;To
      </div>

      {/* Book */}
      <div style={{ display: "flex", flexDirection: "column", flex: "1 1 auto", minWidth: 0 }}>
        <div style={labelStyle}>Book</div>
        <button onClick={() => toggle("book")} style={triggerBtn(openDrop === "book", false)}>
          <span style={{ overflow: "hidden", textOverflow: "ellipsis" }}>{goBook || "Select"}</span>
          {chevron(openDrop === "book")}
        </button>
      </div>

      {/* Chapter */}
      <div style={{ display: "flex", flexDirection: "column", flexShrink: 0 }}>
        <div style={labelStyle}>Ch</div>
        <button
          onClick={() => goBook && toggle("chapter")}
          style={triggerBtn(openDrop === "chapter", !goBook)}
        >
          <span>{goChapter || "–"}</span>
          {chevron(openDrop === "chapter")}
        </button>
      </div>

      {/* Verse */}
      <div style={{ display: "flex", flexDirection: "column", flexShrink: 0 }}>
        <div style={labelStyle}>Verse</div>
        <input
          ref={verseInputRef}
          type="number"
          min="1"
          placeholder="–"
          value={goVerse}
          onChange={e => setGoVerse(e.target.value)}
          onKeyDown={handleVerseKeyDown}
          disabled={!goChapter}
          className="goto-verse-input"
          style={{
            width: 42, padding: "5px 4px",
            background: goChapter ? "rgba(255,255,255,0.06)" : "rgba(255,255,255,0.02)",
            border: `1px solid rgba(255,255,255,${goChapter ? 0.1 : 0.05})`,
            borderRadius: 8,
            fontFamily: th.heading || "Georgia, serif",
            fontSize: 13, fontWeight: 600,
            color: goChapter ? "rgba(255,255,255,0.9)" : "rgba(255,255,255,0.3)",
            textAlign: "center", outline: "none",
            lineHeight: 1.2, boxSizing: "border-box",
            opacity: goChapter ? 1 : 0.4,
          }}
        />
      </div>

      {/* Go button */}
      <button
        onClick={handleGo}
        disabled={!goBook}
        style={{
          padding: "5px 12px", borderRadius: 8, border: "none",
          background: goBook ? (th.accent || "#D4A853") : "rgba(255,255,255,0.08)",
          color: goBook ? "#fff" : "rgba(255,255,255,0.3)",
          fontFamily: "system-ui, sans-serif",
          fontSize: 11, fontWeight: 700,
          cursor: goBook ? "pointer" : "default",
          transition: "all 0.2s",
          flexShrink: 0, letterSpacing: "0.05em",
          textTransform: "uppercase", lineHeight: 1.2,
          alignSelf: "flex-end",
          boxShadow: goBook ? `0 2px 8px rgba(0,0,0,0.2)` : "none",
        }}
      >
        Go →
      </button>

      {/* ── Book Dropdown ── */}
      {openDrop === "book" && (
        <div style={{ ...overlayBase, maxHeight: 380, display: "flex", flexDirection: "column" }}>
          {/* Search */}
          <div style={{ padding: "10px 12px 0", flexShrink: 0 }}>
            <input
              ref={searchRef}
              type="text"
              placeholder="Search books..."
              value={bookSearch}
              onChange={e => setBookSearch(e.target.value)}
              style={{
                width: "100%", padding: "9px 12px",
                border: `1px solid ${th.divider}`, borderRadius: 8,
                background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.02)",
                fontFamily: "system-ui, sans-serif", fontSize: 13,
                color: darkMode ? "#D4C8B0" : th.dark,
                outline: "none", boxSizing: "border-box",
              }}
              onFocus={e => e.target.style.borderColor = th.accent}
              onBlur={e => e.target.style.borderColor = th.divider}
            />
          </div>

          {/* OT / NT tabs */}
          <div style={{ display: "flex", gap: 4, padding: "8px 12px 4px", flexShrink: 0 }}>
            {[["all", "All"], ["OT", "OT"], ["NT", "NT"]].map(([key, label]) => (
              <button key={key} onClick={() => setBookTab(key)}
                style={{
                  padding: "4px 12px", borderRadius: 16,
                  border: bookTab === key ? `1.5px solid ${th.accent}` : `1px solid ${th.divider}`,
                  background: bookTab === key ? (th.accentLight || "rgba(212,168,83,0.1)") : "transparent",
                  fontFamily: "system-ui, sans-serif", fontSize: 10, fontWeight: 700,
                  color: bookTab === key ? th.accent : th.muted,
                  cursor: "pointer", textTransform: "uppercase", letterSpacing: "0.05em",
                }}>
                {label}
              </button>
            ))}
          </div>

          {/* Grouped book list */}
          <div style={{ overflowY: "auto", flex: 1, padding: "2px 0 8px" }}>
            {Object.entries(groupedBooks).length === 0 && (
              <div style={{ padding: "20px 12px", textAlign: "center", fontFamily: "system-ui", fontSize: 13, color: th.muted }}>No books found</div>
            )}
            {Object.entries(groupedBooks).map(([cat, books]) => (
              <div key={cat}>
                <div style={{ padding: "8px 12px 3px", fontFamily: "system-ui, sans-serif", fontSize: 9, fontWeight: 700, color: th.light, textTransform: "uppercase", letterSpacing: "0.1em", display: "flex", alignItems: "center", gap: 5 }}>
                  <span style={{ fontSize: 11 }}>{CAT_ICONS[cat] || "📖"}</span>
                  {cat}
                </div>
                {books.map(b => {
                  const isCurrent = b.name === goBook;
                  return (
                    <button key={b.name} onClick={() => handleBookSelect(b.name)}
                      style={{
                        width: "100%", display: "flex", alignItems: "center", justifyContent: "space-between",
                        padding: "9px 12px 9px 26px",
                        background: isCurrent ? (th.accentLight || "rgba(212,168,83,0.08)") : "transparent",
                        border: "none",
                        borderLeft: isCurrent ? `3px solid ${th.accent}` : "3px solid transparent",
                        cursor: "pointer", textAlign: "left", transition: "background 0.15s",
                      }}>
                      <span style={{ fontFamily: th.heading, fontSize: 13, fontWeight: isCurrent ? 700 : 500, color: isCurrent ? th.accent : (darkMode ? "#D4C8B0" : th.dark) }}>{b.name}</span>
                      <span style={{ fontFamily: "system-ui, sans-serif", fontSize: 10, color: th.light, fontWeight: 600 }}>{b.chapters} ch</span>
                    </button>
                  );
                })}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ── Chapter Grid ── */}
      {openDrop === "chapter" && goBook && (
        <div style={{ ...overlayBase, maxHeight: 320, overflowY: "auto", padding: 14 }}>
          <div style={{ fontFamily: th.heading, fontSize: 13, fontWeight: 700, color: darkMode ? "#D4C8B0" : th.dark, marginBottom: 2 }}>{goBook}</div>
          <div style={{ fontFamily: "system-ui, sans-serif", fontSize: 10, fontWeight: 600, color: th.light, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 10 }}>{totalChapters} Chapters</div>
          <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
            {Array.from({ length: totalChapters }, (_, i) => i + 1).map(ch => (
              <button key={ch} onClick={() => handleChapterSelect(ch)} style={gridCell(ch === goChapter)}>
                {ch}
              </button>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
