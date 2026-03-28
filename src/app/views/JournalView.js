"use client";
import { useState, useMemo, useRef, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { BIBLE_BOOKS, HIGHLIGHT_COLORS, BADGES } from "../constants";

const OT_BOOKS = new Set(BIBLE_BOOKS.filter(b => b.testament === "OT").map(b => b.name));
const BOOK_CATEGORY = {};
BIBLE_BOOKS.forEach(b => { BOOK_CATEGORY[b.name] = b.category; });

const TABS = [
  { id: "highlights", label: "Highlights", icon: "\uD83D\uDD8D\uFE0F" },
  { id: "notes", label: "Notes", icon: "\u270F\uFE0F" },
  { id: "bookmarks", label: "Bookmarks", icon: "\u2605" },
];

const SORT_OPTIONS = [
  { id: "newest", label: "Newest" },
  { id: "oldest", label: "Oldest" },
  { id: "book", label: "Book Order" },
];

const COLOR_NAMES = { "#FFD700": "Gold", "#FF9B71": "Coral", "#7ED4AD": "Green", "#82B1FF": "Blue", "#CE93D8": "Purple", "#F48FB1": "Pink" };
const DARK_HL = { "#FFD700": "#FFE066", "#FF9B71": "#FFB08A", "#7ED4AD": "#95E0C0", "#82B1FF": "#9DC3FF", "#CE93D8": "#DEB0E2", "#F48FB1": "#F9AAC4" };

const BOOK_ORDER = {};
BIBLE_BOOKS.forEach((b, i) => { BOOK_ORDER[b.name] = i; });

// ── 5 gradient palettes (mirrored from VerseOfTheDay) ──
const JOURNAL_GRADIENTS = [
  { bg: "linear-gradient(135deg, #2D1B4E 0%, #4A2D8E 40%, #1A1A3E 100%)", text: "#E8DFF5", ref: "#C9A0FF", accent: "#9B6FD4", hint: "rgba(201,160,255,0.4)" },
  { bg: "linear-gradient(135deg, #3A2410 0%, #6B4A28 40%, #2A1808 100%)", text: "#F5ECD8", ref: "#D4A853", accent: "#D4A853", hint: "rgba(212,168,83,0.4)" },
  { bg: "linear-gradient(135deg, #0A2A2A 0%, #1A5C5C 40%, #0A3A3A 100%)", text: "#D8F5F0", ref: "#5EC4B0", accent: "#5EC4B0", hint: "rgba(94,196,176,0.4)" },
  { bg: "linear-gradient(135deg, #1A2F1A 0%, #2D5A2D 40%, #102010 100%)", text: "#D8F0D8", ref: "#7DD47D", accent: "#7DD47D", hint: "rgba(125,212,125,0.4)" },
  { bg: "linear-gradient(135deg, #3A1A1A 0%, #8B2020 40%, #2A0A0A 100%)", text: "#F5DCD8", ref: "#E88A7A", accent: "#E88A7A", hint: "rgba(232,138,122,0.4)" },
];

function getDayOfYear() {
  const now = new Date();
  return Math.floor((now - new Date(now.getFullYear(), 0, 0)) / (1000 * 60 * 60 * 24));
}

function timeAgo(dateStr) {
  if (!dateStr) return "";
  const diff = Date.now() - new Date(dateStr).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 1) return "just now";
  if (mins < 60) return `${mins}m ago`;
  const hrs = Math.floor(mins / 60);
  if (hrs < 24) return `${hrs}h ago`;
  const days = Math.floor(hrs / 24);
  if (days < 30) return `${days}d ago`;
  const months = Math.floor(days / 30);
  if (months < 12) return `${months}mo ago`;
  return `${Math.floor(months / 12)}y ago`;
}

export default function JournalView() {
  const { ht, user, allHighlights, hlLoading, allNotes, notesLoading, nav, bp, darkMode, earnedBadges } = useApp();

  const [activeTab, setActiveTab] = useState("highlights");
  const [colorFilter, setColorFilter] = useState(null);
  const [testamentFilter, setTestamentFilter] = useState("all");
  const [noteVisFilter, setNoteVisFilter] = useState("all");
  const [sortBy, setSortBy] = useState("newest");
  const [search, setSearch] = useState("");
  const [showCount, setShowCount] = useState(20);
  const searchTimer = useRef(null);
  const [debouncedSearch, setDebouncedSearch] = useState("");

  const onSearch = (val) => {
    setSearch(val);
    clearTimeout(searchTimer.current);
    searchTimer.current = setTimeout(() => setDebouncedSearch(val.toLowerCase().trim()), 300);
  };

  const resetPagination = () => setShowCount(20);
  const hlColor = (color) => darkMode ? (DARK_HL[color] || color) : color;

  // Derive bookmarks
  const bookmarks = useMemo(() => allHighlights.filter(h => h.is_bookmarked), [allHighlights]);

  const hlCount = allHighlights.length;
  const noteCount = allNotes.length;
  const bmCount = bookmarks.length;
  const totalItems = hlCount + noteCount;

  // ════════════════════════════════════════════
  // TODAY'S REFLECTION — daily rotation
  // ════════════════════════════════════════════
  const reflectionItem = useMemo(() => {
    const pool = [...allHighlights, ...allNotes].filter(i => i.verses?.kjv_text && i.verses?.chapters?.books?.name);
    if (!pool.length) return null;
    return pool[getDayOfYear() % pool.length];
  }, [allHighlights, allNotes]);

  const reflectionGradient = JOURNAL_GRADIENTS[getDayOfYear() % JOURNAL_GRADIENTS.length];

  // ════════════════════════════════════════════
  // HEATMAP — 12-week activity grid
  // ════════════════════════════════════════════
  const heatmapData = useMemo(() => {
    if (!totalItems) return null;
    const days = {};
    const addDay = (dateStr) => {
      if (!dateStr) return;
      const d = new Date(dateStr).toISOString().slice(0, 10);
      days[d] = (days[d] || 0) + 1;
    };
    allHighlights.forEach(h => addDay(h.created_at));
    allNotes.forEach(n => addDay(n.updated_at));
    const grid = [];
    const today = new Date();
    const todayKey = today.toISOString().slice(0, 10);
    let activeDays = 0;
    for (let i = 83; i >= 0; i--) {
      const d = new Date(today); d.setDate(d.getDate() - i);
      const key = d.toISOString().slice(0, 10);
      const count = days[key] || 0;
      if (count > 0) activeDays++;
      grid.push({ date: key, count, dow: d.getDay() });
    }
    return { grid, activeDays, activeToday: !!days[todayKey] };
  }, [allHighlights, allNotes, totalItems]);

  // ════════════════════════════════════════════
  // INSIGHTS — top 3 books
  // ════════════════════════════════════════════
  const bookInsights = useMemo(() => {
    if (totalItems < 5) return null;
    const counts = {};
    [...allHighlights, ...allNotes].forEach(item => {
      const bk = item.verses?.chapters?.books?.name;
      if (bk) counts[bk] = (counts[bk] || 0) + 1;
    });
    const sorted = Object.entries(counts).sort((a, b) => b[1] - a[1]);
    const total = sorted.reduce((s, [, c]) => s + c, 0);
    return sorted.slice(0, 3).map(([name, count]) => ({
      name, pct: Math.round((count / total) * 100)
    }));
  }, [allHighlights, allNotes, totalItems]);

  // ════════════════════════════════════════════
  // BADGE NUDGE — proximity to next badge
  // ════════════════════════════════════════════
  const badgeNudge = useMemo(() => {
    if (!earnedBadges) return null;
    const earned = earnedBadges;
    if (hlCount < 10 && !earned.highlighter) { const left = 10 - hlCount; return left <= 5 ? `${left} more highlight${left > 1 ? "s" : ""} to earn Highlighter \uD83D\uDD8D\uFE0F` : null; }
    if (totalItems < 25 && !earned.journal_keeper) { const left = 25 - totalItems; return left <= 8 ? `${left} more to earn Journal Keeper \uD83D\uDCD3` : null; }
    if (totalItems < 100 && totalItems >= 25 && !earned.journal_master) { const left = 100 - totalItems; return left <= 15 ? `${left} more to earn Journal Master \uD83D\uDCD5` : null; }
    const uniqueColors = new Set(allHighlights.map(h => h.highlight_color).filter(Boolean));
    if (uniqueColors.size < HIGHLIGHT_COLORS.length && !earned.color_palette) { const left = HIGHLIGHT_COLORS.length - uniqueColors.size; return left <= 3 ? `${left} more color${left > 1 ? "s" : ""} to earn Color Palette \uD83C\uDFA8` : null; }
    return null;
  }, [hlCount, totalItems, allHighlights, earnedBadges]);

  // ════════════════════════════════════════════
  // FILTER + SORT
  // ════════════════════════════════════════════
  const sourceData = activeTab === "highlights" ? allHighlights : activeTab === "notes" ? allNotes : bookmarks;

  const filtered = useMemo(() => {
    let items = [...sourceData];
    items = items.filter(item => {
      const v = item.verses;
      return v?.chapters?.books?.name && v?.chapters?.chapter_number && v?.verse_number;
    });
    if (activeTab === "highlights" && colorFilter) items = items.filter(h => h.highlight_color === colorFilter);
    if (activeTab === "notes" && noteVisFilter !== "all") items = items.filter(n => noteVisFilter === "public" ? n.is_public : !n.is_public);
    if (testamentFilter !== "all") items = items.filter(item => { const bk = item.verses?.chapters?.books?.name; return testamentFilter === "OT" ? OT_BOOKS.has(bk) : !OT_BOOKS.has(bk); });
    if (debouncedSearch) items = items.filter(item => { const bk = item.verses?.chapters?.books?.name?.toLowerCase() || ""; const text = (item.verses?.kjv_text || item.note_text || "").toLowerCase(); return bk.includes(debouncedSearch) || text.includes(debouncedSearch); });
    if (sortBy === "oldest") items.reverse();
    else if (sortBy === "book") items.sort((a, b) => { const ba = BOOK_ORDER[a.verses?.chapters?.books?.name] ?? 999; const bb = BOOK_ORDER[b.verses?.chapters?.books?.name] ?? 999; if (ba !== bb) return ba - bb; const ca = a.verses?.chapters?.chapter_number ?? 0; const cb = b.verses?.chapters?.chapter_number ?? 0; if (ca !== cb) return ca - cb; return (a.verses?.verse_number ?? 0) - (b.verses?.verse_number ?? 0); });
    return items;
  }, [sourceData, activeTab, colorFilter, noteVisFilter, testamentFilter, debouncedSearch, sortBy]);

  const visible = filtered.slice(0, showCount);
  const hasMore = filtered.length > showCount;

  // Export journal to text
  const exportJournal = () => {
    let text = "My Bible Journal\n" + "=".repeat(40) + "\n\n";
    if (allHighlights.length) {
      text += "HIGHLIGHTS\n" + "-".repeat(20) + "\n";
      allHighlights.forEach(h => { const bk = h.verses?.chapters?.books?.name || "?"; const ch = h.verses?.chapters?.chapter_number || "?"; const vn = h.verses?.verse_number || "?"; text += `\n${bk} ${ch}:${vn}${h.is_bookmarked ? " \u2605" : ""}\n${h.verses?.kjv_text || ""}\n`; });
    }
    if (allNotes.length) {
      text += "\n\nNOTES\n" + "-".repeat(20) + "\n";
      allNotes.forEach(n => { const bk = n.verses?.chapters?.books?.name || "?"; const ch = n.verses?.chapters?.chapter_number || "?"; const vn = n.verses?.verse_number || "?"; text += `\n${bk} ${ch}:${vn}\n${n.note_text || ""}\n`; });
    }
    const blob = new Blob([text], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    if (typeof navigator !== "undefined" && navigator.share) {
      navigator.share({ files: [new File([blob], "bible-journal.txt", { type: "text/plain" })] }).catch(() => { window.open(url); });
    } else {
      const a = document.createElement("a"); a.href = url; a.download = "bible-journal.txt"; a.click();
    }
    setTimeout(() => URL.revokeObjectURL(url), 5000);
  };

  const isLoading = hlLoading || notesLoading;

  // ─── Unauth state ───
  if (!user) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="My Journal" theme={ht} />
        <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>📓</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Sign In to See Your Journal</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginBottom: 14, lineHeight: 1.6 }}>Highlight verses, write notes, and bookmark favourites — find them all here.</div>
            <button onClick={() => nav("account")} style={{ padding: "12px 28px", borderRadius: 10, border: "none", background: ht.headerGradient, color: ht.headerText, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Sign In / Sign Up</button>
          </Card>
        </div>
      </div>
    );
  }

  const ExportBtn = (
    <button onClick={exportJournal} aria-label="Export journal" style={{ background: "none", border: "none", cursor: "pointer", padding: 6, color: ht.headerText, fontSize: 16, opacity: totalItems > 0 ? 1 : 0.4 }} disabled={totalItems === 0}>
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>
    </button>
  );

  const g = reflectionGradient;

  return (
    <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
      <Header title="My Journal" subtitle={isLoading ? "Loading..." : `${totalItems} items`} theme={ht} right={ExportBtn} />
      <div style={{ padding: `12px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>

        {/* ════════ TODAY'S REFLECTION HERO ════════ */}
        {!isLoading && (
          <div style={{ marginBottom: 16, animation: "fadeIn 0.5s ease" }}>
            {reflectionItem ? (() => {
              const ri = reflectionItem;
              const bk = ri.verses?.chapters?.books?.name;
              const ch = ri.verses?.chapters?.chapter_number;
              const vn = ri.verses?.verse_number;
              const ref = `${bk} ${ch}:${vn}`;
              const isNote = !!ri.note_text;
              const dateStr = isNote ? ri.updated_at : ri.created_at;
              return (
                <button onClick={() => nav("verse", { book: bk, chapter: ch, verse: vn, tab: isNote ? "my" : "study" })}
                  style={{ width: "100%", textAlign: "left", cursor: "pointer", background: g.bg, borderRadius: 16, padding: "24px 22px 20px", border: "none", position: "relative", overflow: "hidden", boxShadow: "0 4px 20px rgba(0,0,0,0.25)" }}>
                  {/* Top accent line */}
                  <div style={{ position: "absolute", top: 0, left: "15%", right: "15%", height: 3, borderRadius: "0 0 3px 3px", background: `linear-gradient(90deg, transparent, ${g.accent}, transparent)` }} />
                  {/* Decorative quote watermark */}
                  <div style={{ position: "absolute", top: -8, right: 14, fontSize: 80, color: `${g.accent}12`, fontFamily: ht.heading, lineHeight: 1, pointerEvents: "none", userSelect: "none" }}>{"\u275D"}</div>

                  <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.12em", color: g.hint, marginBottom: 12 }}>Today's Reflection</div>

                  <div style={{ fontFamily: ht.body, fontSize: 16, fontStyle: "italic", color: g.text, lineHeight: 1.7, marginBottom: 12, animation: "fadeIn 0.6s ease", display: "-webkit-box", WebkitLineClamp: 4, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
                    {ri.verses?.kjv_text}
                  </div>

                  <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: g.ref, marginBottom: 8, animation: "fadeIn 0.8s ease" }}>
                    — {ref}
                  </div>

                  {isNote && (
                    <div style={{ background: `${g.accent}15`, borderRadius: 8, padding: "8px 12px", marginBottom: 8, borderLeft: `3px solid ${g.accent}` }}>
                      <div style={{ fontFamily: ht.ui, fontSize: 11, color: g.text, lineHeight: 1.5, opacity: 0.85, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
                        {ri.note_text}
                      </div>
                    </div>
                  )}

                  <div style={{ fontFamily: ht.ui, fontSize: 11, color: g.hint, lineHeight: 1.5 }}>
                    You {isNote ? "wrote this" : "highlighted this"} {timeAgo(dateStr)}. What has God shown you since?
                  </div>

                  {badgeNudge && (
                    <div style={{ marginTop: 10, padding: "5px 10px", borderRadius: 8, background: `${g.accent}18`, display: "inline-block" }}>
                      <span style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: g.ref }}>{badgeNudge}</span>
                    </div>
                  )}
                </button>
              );
            })() : (
              /* Empty state — parchment invitation */
              <div style={{ background: ht.stone, borderRadius: 16, padding: "28px 22px", border: `1px solid ${ht.stoneEdge}`, textAlign: "center", boxShadow: `inset 0 1px 3px rgba(255,255,255,${darkMode ? 0.02 : 0.3}), 0 2px 8px rgba(0,0,0,${darkMode ? 0.2 : 0.06})` }}>
                <div style={{ fontSize: 36, marginBottom: 10 }}>📖</div>
                <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.stoneText, marginBottom: 6 }}>Your Journey Begins Here</div>
                <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.stoneText, opacity: 0.7, lineHeight: 1.6, marginBottom: 16 }}>
                  Start highlighting verses and writing notes as you read. Your study journal will grow with every insight.
                </div>
                <button onClick={() => nav("books")} style={{ padding: "10px 22px", borderRadius: 8, border: `1px solid ${ht.stoneEdge}`, background: "transparent", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, color: ht.stoneText, cursor: "pointer" }}>Open Bible</button>
              </div>
            )}
          </div>
        )}

        {/* ════════ 12-WEEK HEATMAP ════════ */}
        {!isLoading && heatmapData && (
          <Card t={ht} style={{ padding: "14px 16px", marginBottom: 14, animation: "fadeIn 0.6s ease" }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 10 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.1em", color: ht.muted }}>12-Week Activity</div>
              <div style={{ display: "flex", gap: 3, alignItems: "center" }}>
                <span style={{ fontFamily: ht.ui, fontSize: 9, color: ht.light, marginRight: 4 }}>Less</span>
                {[0, 1, 2, 4].map(level => (
                  <div key={level} style={{ width: 8, height: 8, borderRadius: 2, background: level === 0 ? ht.divider : level === 1 ? `${ht.accent}40` : level === 2 ? `${ht.accent}70` : ht.accent }} />
                ))}
                <span style={{ fontFamily: ht.ui, fontSize: 9, color: ht.light, marginLeft: 4 }}>More</span>
              </div>
            </div>
            <div style={{ display: "grid", gridTemplateRows: "repeat(7, 1fr)", gridAutoFlow: "column", gap: 3, marginBottom: 8 }}>
              {heatmapData.grid.map((cell, i) => {
                const intensity = cell.count === 0 ? 0 : cell.count === 1 ? 1 : cell.count <= 3 ? 2 : 3;
                const bg = intensity === 0 ? ht.divider : intensity === 1 ? `${ht.accent}40` : intensity === 2 ? `${ht.accent}70` : ht.accent;
                return <div key={i} title={`${cell.date}: ${cell.count} items`} style={{ width: "100%", aspectRatio: "1", borderRadius: 2, background: bg, minWidth: 0 }} />;
              })}
            </div>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
              <span style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted }}>
                Active <span style={{ fontWeight: 700, color: ht.accent }}>{heatmapData.activeDays}</span> of 84 days
              </span>
              {heatmapData.activeToday && (
                <span style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: "#22c55e", display: "flex", alignItems: "center", gap: 3 }}>
                  <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#22c55e" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                  Active today
                </span>
              )}
            </div>
          </Card>
        )}

        {/* ════════ INSIGHTS STRIP ════════ */}
        {!isLoading && bookInsights && (
          <div style={{ marginBottom: 14, animation: "fadeIn 0.7s ease" }}>
            <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.1em", color: ht.muted, marginBottom: 8 }}>Most Studied</div>
            <div style={{ display: "flex", gap: 8 }}>
              {bookInsights.map((b, i) => (
                <div key={i} style={{ flex: 1, padding: "8px 10px", borderRadius: 10, background: ht.card, border: `1px solid ${ht.divider}`, textAlign: "center" }}>
                  <div style={{ fontFamily: ht.heading, fontSize: 12, fontWeight: 700, color: ht.dark, lineHeight: 1.2, marginBottom: 2, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>{b.name}</div>
                  <div style={{ fontFamily: ht.ui, fontSize: 16, fontWeight: 700, color: ht.accent }}>{b.pct}%</div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* ════════ STATS STRIP ════════ */}
        <div style={{ display: "flex", justifyContent: "center", gap: 20, padding: "10px 0 14px", fontFamily: ht.ui, fontSize: 13 }}>
          <span><span style={{ fontWeight: 700, color: ht.accent }}>{hlCount}</span> <span style={{ color: ht.muted }}>highlights</span></span>
          <span style={{ color: ht.divider }}>{"\u00B7"}</span>
          <span><span style={{ fontWeight: 700, color: ht.accent }}>{noteCount}</span> <span style={{ color: ht.muted }}>notes</span></span>
          <span style={{ color: ht.divider }}>{"\u00B7"}</span>
          <span><span style={{ fontWeight: 700, color: ht.accent }}>{bmCount}</span> <span style={{ color: ht.muted }}>bookmarks</span></span>
        </div>

        {/* ════════ TABS ════════ */}
        <div role="tablist" style={{ display: "flex", background: ht.card, borderRadius: 10, padding: 3, marginBottom: 12, border: `1px solid ${ht.divider}` }}>
          {TABS.map(tb => (
            <button key={tb.id} role="tab" aria-selected={activeTab === tb.id}
              onClick={() => { setActiveTab(tb.id); setColorFilter(null); setNoteVisFilter("all"); resetPagination(); }}
              style={{ flex: 1, padding: "10px 0", borderRadius: 8, border: "none", cursor: "pointer", fontFamily: ht.ui, fontSize: 13, fontWeight: activeTab === tb.id ? 700 : 500, background: activeTab === tb.id ? ht.accent : "transparent", color: activeTab === tb.id ? "#fff" : ht.muted, transition: "all 0.15s" }}>
              {tb.icon} {tb.label}
            </button>
          ))}
        </div>

        {/* Search bar */}
        <div style={{ position: "relative", marginBottom: 10 }}>
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={ht.light} strokeWidth="2" style={{ position: "absolute", left: 12, top: "50%", transform: "translateY(-50%)" }}><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          <input type="text" value={search} onChange={e => onSearch(e.target.value)} placeholder={`Search ${activeTab}...`} aria-label={`Search ${activeTab}`}
            style={{ width: "100%", padding: "10px 12px 10px 36px", borderRadius: 10, border: `1px solid ${ht.divider}`, background: ht.card, fontFamily: ht.ui, fontSize: 13, color: ht.text, outline: "none", boxSizing: "border-box" }} />
          {search && <button onClick={() => { setSearch(""); setDebouncedSearch(""); }} aria-label="Clear search" style={{ position: "absolute", right: 10, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", cursor: "pointer", color: ht.muted, fontSize: 16 }}>{"\u2715"}</button>}
        </div>

        {/* Filter bar */}
        <div style={{ display: "flex", flexWrap: "wrap", gap: 6, marginBottom: 14, alignItems: "center" }}>
          {activeTab === "highlights" && <>
            <button onClick={() => { setColorFilter(null); resetPagination(); }} aria-label="All colors" style={{ padding: "5px 10px", borderRadius: 14, border: `1px solid ${!colorFilter ? ht.accent : ht.divider}`, background: !colorFilter ? `${ht.accent}15` : "transparent", fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: !colorFilter ? ht.accent : ht.muted, cursor: "pointer" }}>All</button>
            {HIGHLIGHT_COLORS.map(c => <button key={c} onClick={() => { setColorFilter(colorFilter === c ? null : c); resetPagination(); }} aria-label={`${COLOR_NAMES[c] || c} highlights`} style={{ width: 22, height: 22, borderRadius: "50%", background: hlColor(c), border: colorFilter === c ? `2.5px solid ${ht.dark}` : `2px solid ${hlColor(c)}88`, cursor: "pointer", transition: "all 0.15s", transform: colorFilter === c ? "scale(1.15)" : "scale(1)" }} />)}
          </>}
          {activeTab === "notes" && <>
            {["all", "private", "public"].map(f => <button key={f} onClick={() => { setNoteVisFilter(f); resetPagination(); }} style={{ padding: "5px 10px", borderRadius: 14, border: `1px solid ${noteVisFilter === f ? ht.accent : ht.divider}`, background: noteVisFilter === f ? `${ht.accent}15` : "transparent", fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: noteVisFilter === f ? ht.accent : ht.muted, cursor: "pointer", textTransform: "capitalize" }}>{f === "all" ? "All" : f === "private" ? "🔒 Private" : "🌍 Public"}</button>)}
          </>}
          {(activeTab === "highlights" || activeTab === "notes") && <span style={{ width: 1, height: 18, background: ht.divider, margin: "0 2px" }} />}
          {["all", "OT", "NT"].map(f => <button key={f} onClick={() => { setTestamentFilter(f); resetPagination(); }} style={{ padding: "5px 10px", borderRadius: 14, border: `1px solid ${testamentFilter === f ? ht.accent : ht.divider}`, background: testamentFilter === f ? `${ht.accent}15` : "transparent", fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: testamentFilter === f ? ht.accent : ht.muted, cursor: "pointer" }}>{f === "all" ? "All" : f}</button>)}
          <span style={{ width: 1, height: 18, background: ht.divider, margin: "0 2px" }} />
          {SORT_OPTIONS.map(s => <button key={s.id} onClick={() => { setSortBy(s.id); resetPagination(); }} style={{ padding: "5px 10px", borderRadius: 14, border: `1px solid ${sortBy === s.id ? ht.accent : ht.divider}`, background: sortBy === s.id ? `${ht.accent}15` : "transparent", fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: sortBy === s.id ? ht.accent : ht.muted, cursor: "pointer" }}>{s.label}</button>)}
        </div>

        {/* Loading */}
        {isLoading && <Spinner t={ht} />}

        {/* Empty states */}
        {!isLoading && filtered.length === 0 && (
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            {activeTab === "highlights" && <>
              <div style={{ fontSize: 42, marginBottom: 14 }}>🎨</div>
              <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 6 }}>No Highlights Yet</div>
              <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6, marginBottom: 16 }}>{debouncedSearch || colorFilter || testamentFilter !== "all" ? "No highlights match your filters. Try adjusting them." : "Open any verse and tap the highlight icon to colour-code your favourite passages."}</div>
            </>}
            {activeTab === "notes" && <>
              <div style={{ fontSize: 42, marginBottom: 14 }}>📝</div>
              <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 6 }}>No Notes Yet</div>
              <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6, marginBottom: 16 }}>{debouncedSearch || noteVisFilter !== "all" || testamentFilter !== "all" ? "No notes match your filters. Try adjusting them." : "Tap any verse and write your personal reflections, insights, and study notes."}</div>
            </>}
            {activeTab === "bookmarks" && <>
              <div style={{ fontSize: 42, marginBottom: 14 }}>{"\u2B50"}</div>
              <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 6 }}>No Bookmarks Yet</div>
              <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6, marginBottom: 16 }}>{debouncedSearch || testamentFilter !== "all" ? "No bookmarks match your filters. Try adjusting them." : "Star the verses you want to return to and find them all here."}</div>
            </>}
            {!(debouncedSearch || colorFilter || testamentFilter !== "all" || noteVisFilter !== "all") && (
              <button onClick={() => nav("books")} style={{ padding: "12px 24px", borderRadius: 10, border: "none", background: ht.headerGradient, color: ht.headerText, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Open Bible</button>
            )}
          </Card>
        )}

        {/* Results count */}
        {!isLoading && filtered.length > 0 && (debouncedSearch || colorFilter || testamentFilter !== "all" || noteVisFilter !== "all") && (
          <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted, marginBottom: 8 }}>{filtered.length} result{filtered.length !== 1 ? "s" : ""}</div>
        )}

        {/* Card list — with stagger animation */}
        {!isLoading && visible.length > 0 && (
          <div role="list" style={{ display: "flex", flexDirection: "column", gap: 8 }}>
            {visible.map((item, idx) => {
              const bName = item.verses?.chapters?.books?.name;
              const chNum = item.verses?.chapters?.chapter_number;
              const vNum = item.verses?.verse_number;
              const ref = `${bName} ${chNum}:${vNum}`;
              const category = BOOK_CATEGORY[bName] || "";
              const isNote = activeTab === "notes";
              const color = isNote ? ht.accent : (item.highlight_color || "#FFD700");
              const displayColor = hlColor(color);
              const dateStr = isNote ? item.updated_at : item.created_at;

              return (
                <button key={item.id} role="listitem"
                  aria-label={`${ref}${item.is_bookmarked ? ", bookmarked" : ""}${isNote ? ", note" : ""}`}
                  onClick={() => nav("verse", { book: bName, chapter: chNum, verse: vNum, tab: isNote ? "my" : "study" })}
                  style={{
                    background: isNote ? ht.card : `${displayColor}${darkMode ? "12" : "06"}`,
                    border: `1px solid ${ht.divider}`, borderRadius: 12, padding: "14px 16px",
                    textAlign: "left", cursor: "pointer", display: "flex", gap: 12, alignItems: "flex-start",
                    borderLeft: `4px solid ${displayColor}`, boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
                    animation: "fadeIn 0.3s ease both", animationDelay: `${idx * 0.03}s`,
                  }}>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 4, flexWrap: "wrap" }}>
                      <span style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: ht.dark }}>{ref}</span>
                      {item.is_bookmarked && <span style={{ fontSize: 13, color: "#FFD700" }}>{"\u2605"}</span>}
                      {isNote && <span style={{ fontSize: 10, padding: "1px 6px", borderRadius: 8, background: item.is_public ? "#7ED4AD22" : `${ht.divider}`, color: item.is_public ? "#2E7D5B" : ht.light, fontFamily: ht.ui, fontWeight: 600 }}>{item.is_public ? "Public" : "Private"}</span>}
                    </div>
                    {isNote ? <>
                      <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.6, display: "-webkit-box", WebkitLineClamp: 3, WebkitBoxOrient: "vertical", overflow: "hidden", marginBottom: 6 }}>{item.note_text}</div>
                      <div style={{ fontFamily: ht.body, fontSize: 12, color: ht.light, fontStyle: "italic", display: "-webkit-box", WebkitLineClamp: 1, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{item.verses?.kjv_text}</div>
                    </> : (
                      <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.6, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{item.verses?.kjv_text}</div>
                    )}
                    <div style={{ display: "flex", alignItems: "center", gap: 8, marginTop: 6, fontFamily: ht.ui, fontSize: 11, color: ht.light }}>
                      {category && <span>{category}</span>}
                      {category && <span>{"\u00B7"}</span>}
                      <span>{timeAgo(dateStr)}</span>
                    </div>
                  </div>
                  <div style={{ color: ht.light, flexShrink: 0, alignSelf: "center" }}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
        )}

        {/* Show More */}
        {hasMore && !isLoading && (
          <button onClick={() => setShowCount(prev => prev + 20)}
            style={{ display: "block", width: "100%", padding: "14px", marginTop: 12, borderRadius: 10, border: `1px solid ${ht.divider}`, background: ht.card, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, color: ht.accent, cursor: "pointer", textAlign: "center" }}>
            Show More ({filtered.length - showCount} remaining)
          </button>
        )}
      </div>
    </div>
  );
}
