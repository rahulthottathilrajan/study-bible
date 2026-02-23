"use client";
import { useState, useEffect } from "react";
import { supabase } from "../../lib/supabase";

// ─── THEME — mirrors THEMES.sunrise in page.js ───────────────────────────────
const st = {
  heading: "'DM Serif Display',serif",
  body:    "'Lora',serif",
  ui:      "'Nunito',sans-serif",
  bg:      "#FFF8F0",
  card:    "#fff",
  headerGradient: "linear-gradient(165deg,#2D1B4E 0%,#4A2D6B 100%)",
  headerText: "#F8E8D0",
  accent:  "#E8625C",
  dark:    "#2D1B4E",
  text:    "#4A3B2D",
  muted:   "#8B6B4F",
  light:   "#C0A888",
  divider: "rgba(232,98,92,0.12)",
};

// ─── GENRE CONFIG ─────────────────────────────────────────────────────────────
const GENRE_COLORS = {
  Law:         "#C06C3E",
  History:     "#2E7D32",
  Wisdom:      "#D4A853",
  Prophecy:    "#8B5CF6",
  Gospel:      "#1B7A6E",
  Epistle:     "#E8625C",
  Apocalyptic: "#2A4A6B",
};
const GENRE_ICONS = {
  Law: "⚖️", History: "📜", Wisdom: "💡",
  Prophecy: "🔮", Gospel: "✝️", Epistle: "✉️", Apocalyptic: "👁️",
};
const GENRES = ["All", ...Object.keys(GENRE_COLORS)];

// ─── TIMELINE GEOMETRY ───────────────────────────────────────────────────────
//  Range : 2000 BC (−2000) → AD 100 (+100)  =  2100 years total
//  Scale : 1100px ÷ 2100 yr ≈ 0.524 px per year
const YEAR_MIN  = -2000;
const YEAR_MAX  =   100;
const YEAR_SPAN = YEAR_MAX - YEAR_MIN;     // 2100
const NAME_W    = 88;                      // px — sticky book-name column
const TL_W      = 1100;                    // px — scrollable timeline area
const ROW_H     = 30;                      // px — row height per book
const AXIS_H    = 56;                      // px — top axis row height
const SEP_H     = 22;                      // px — OT/NT separator bar height
const MIN_BAR   = 20;                      // px — minimum tap-able bar width
const SCALE     = TL_W / YEAR_SPAN;        // ≈ 0.524

// Year → x-coordinate within the timeline drawing area (0 = leftmost = 2000 BC)
const toX = year => (year - YEAR_MIN) * SCALE;
// Bar width — always at least MIN_BAR so narrow books are still tappable
const toW = (from, to) => Math.max(MIN_BAR, (to - from) * SCALE);

// ─── AXIS TICKS ───────────────────────────────────────────────────────────────
const AXIS_TICKS = [-2000, -1500, -1000, -500, 0, 100];

// ─── ERA BACKGROUND BANDS ─────────────────────────────────────────────────────
const ERA_BANDS = [
  { from: -2000, to: -1446, label: "Patriarchal",       bg: "rgba(212,168,83,0.09)"  },
  { from: -1446, to: -1000, label: "Exodus / Wilderness", bg: "rgba(192,108,62,0.08)" },
  { from: -1000, to:  -586, label: "Monarchy",           bg: "rgba(46,125,50,0.08)"   },
  { from:  -586, to:  -430, label: "Exile & Return",     bg: "rgba(42,74,107,0.09)"   },
  { from:  -430, to:     0, label: "400 Silent Years",   bg: "rgba(139,92,246,0.06)"  },
  { from:     0, to:   100, label: "NT Era",             bg: "rgba(27,122,110,0.13)"  },
];

// ─── CSS ANIMATIONS ───────────────────────────────────────────────────────────
const CSS = `
  @keyframes panelIn {
    from { opacity: 0; transform: translateY(14px); }
    to   { opacity: 1; transform: translateY(0);    }
  }
  .book-panel   { animation: panelIn 0.26s ease; }
  .timeline-bar { transition: opacity 0.14s, box-shadow 0.14s, transform 0.1s; }
  .timeline-bar:active { transform: scaleY(1.25) !important; }
`;

// ─── COMPONENT ────────────────────────────────────────────────────────────────
export default function BibleBookTimeline({ nav }) {
  const [books,       setBooks]       = useState([]);
  const [loading,     setLoading]     = useState(true);
  const [activeGenre, setActiveGenre] = useState("All");
  const [activeTesta, setActiveTesta] = useState("All");   // "All" | "OT" | "NT"
  const [selected,    setSelected]    = useState(null);

  // ── FETCH ──────────────────────────────────────────────────────────────────
  useEffect(() => {
    supabase
      .from("bible_book_timeline")
      .select("*")
      .order("sort_order")
      .then(({ data, error }) => {
        if (!error && data) setBooks(data);
        setLoading(false);
      });
  }, []);

  // ── FILTER ─────────────────────────────────────────────────────────────────
  const filtered = books.filter(b =>
    (activeGenre === "All" || b.genre === activeGenre) &&
    (activeTesta === "All" || b.testament === activeTesta)
  );

  // Index of first NT book in filtered list (for OT/NT separator)
  const showSep    = activeTesta === "All";
  const firstNTIdx = showSep ? filtered.findIndex(b => b.testament === "NT") : -1;

  // Toggle selected book
  const handleBar = book =>
    setSelected(prev => prev?.id === book.id ? null : book);

  // Reset filters + selection
  const resetFilters = () => {
    setActiveGenre("All");
    setActiveTesta("All");
    setSelected(null);
  };

  // ── LOADING STATE ──────────────────────────────────────────────────────────
  if (loading) return (
    <div style={{ minHeight:"100vh", background:st.bg, display:"flex", alignItems:"center", justifyContent:"center" }}>
      <div style={{ textAlign:"center" }}>
        <div style={{ fontSize:42, marginBottom:14 }}>📜</div>
        <div style={{ fontFamily:st.ui, fontSize:14, color:st.muted, letterSpacing:"0.02em" }}>Loading Bible Timeline…</div>
      </div>
    </div>
  );

  // ── LAYOUT CALCULATIONS ────────────────────────────────────────────────────
  // Total height of scrollable area = axis + rows + optional separator
  const sepCount   = firstNTIdx > 0 ? 1 : 0;
  const totalRowH  = filtered.length * ROW_H + sepCount * SEP_H;
  const totalH     = AXIS_H + totalRowH;
  const totalW     = NAME_W + TL_W + 16;   // 16 = right padding

  // Build rows array with separator inserted
  const rows = [];
  filtered.forEach((book, idx) => {
    if (showSep && idx === firstNTIdx) {
      rows.push({ type: "sep", key: "sep-nt" });
    }
    rows.push({ type: "book", book, idx });
  });

  // ── RENDER ─────────────────────────────────────────────────────────────────
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
      <style>{CSS}</style>

      {/* ══ HEADER ══════════════════════════════════════════════════════════ */}
      <div style={{
        background: st.headerGradient,
        padding: "14px 20px 18px",
        position: "sticky", top: 0, zIndex: 30,
      }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <button
            onClick={() => nav("timeline-home")}
            style={{
              background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8,
              padding:8, cursor:"pointer", color:st.headerText,
              display:"flex", alignItems:"center",
            }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                 stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
              <polyline points="15 18 9 12 15 6"/>
            </svg>
          </button>
          <div>
            <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>
              Bible Book Timeline
            </h2>
            <div style={{ fontFamily:st.ui, fontSize:11.5, color:`${st.headerText}99`, marginTop:1 }}>
              When each book was written · 2000 BC → AD 100
            </div>
          </div>
        </div>
      </div>

      <div style={{ padding:"16px 0 0" }}>

        {/* ══ TESTAMENT TOGGLE ════════════════════════════════════════════ */}
        <div style={{ display:"flex", gap:6, padding:"0 16px", marginBottom:14 }}>
          {[
            { key:"All", label:"All 66 Books" },
            { key:"OT",  label:"Old Testament" },
            { key:"NT",  label:"New Testament" },
          ].map(({ key, label }) => (
            <button key={key}
              onClick={() => { setActiveTesta(key); setSelected(null); }}
              style={{
                fontFamily:st.ui, fontSize:11.5, fontWeight:700,
                padding:"7px 16px", borderRadius:20, border:"none", cursor:"pointer",
                background: activeTesta === key ? st.dark : st.card,
                color:      activeTesta === key ? st.headerText : st.muted,
                boxShadow:  activeTesta === key
                  ? "0 2px 10px rgba(45,27,78,0.35)"
                  : "0 1px 3px rgba(0,0,0,0.08)",
                transition: "all 0.15s",
              }}>
              {label}
            </button>
          ))}
        </div>

        {/* ══ GENRE PILLS ═════════════════════════════════════════════════ */}
        <div style={{
          display:"flex", gap:6, padding:"0 16px 4px",
          marginBottom:12, overflowX:"auto", WebkitOverflowScrolling:"touch",
        }}>
          {GENRES.map(g => {
            const color    = GENRE_COLORS[g] || st.dark;
            const isActive = activeGenre === g;
            return (
              <button key={g}
                onClick={() => { setActiveGenre(g); setSelected(null); }}
                style={{
                  fontFamily: st.ui, fontSize:11, fontWeight:700,
                  padding:"5px 13px", borderRadius:16, border:"none",
                  cursor:"pointer", flexShrink:0,
                  background: isActive ? color : `${color}18`,
                  color:      isActive ? "#fff" : color,
                  boxShadow:  isActive ? `0 2px 8px ${color}55` : "none",
                  transition: "all 0.14s",
                }}>
                {g !== "All" && GENRE_ICONS[g] ? `${GENRE_ICONS[g]} ` : ""}{g}
              </button>
            );
          })}
        </div>

        {/* ══ SCROLL HINT + COUNT ══════════════════════════════════════════ */}
        <div style={{
          display:"flex", alignItems:"center",
          padding:"0 16px", marginBottom:6,
          fontFamily:st.ui, fontSize:10.5,
        }}>
          <span style={{ color:st.light }}>← Scroll right to explore →</span>
          <span style={{ marginLeft:"auto", color:st.muted, fontWeight:700 }}>
            {filtered.length} book{filtered.length !== 1 ? "s" : ""}
          </span>
        </div>

        {/* ══ MAIN TIMELINE ════════════════════════════════════════════════
            Layout strategy:
            • One horizontally-scrollable container (overflow-x: auto)
            • Each row is `position:relative` with width = totalW
            • Book-name div uses `position:sticky; left:0` so it stays pinned
              to the left edge of the scrollport as the user scrolls right
            • Bars use `position:absolute` with left = NAME_W + toX(year)
        ══════════════════════════════════════════════════════════════════ */}
        <div style={{
          overflowX:"auto", overflowY:"visible",
          WebkitOverflowScrolling:"touch",
          borderTop:`1px solid ${st.divider}`,
        }}>
          <div style={{ width:totalW, position:"relative" }}>

            {/* ── ERA BANDS (absolute, behind everything) ── */}
            {ERA_BANDS.map((era, i) => (
              <div key={i} style={{
                position: "absolute",
                left:   NAME_W + toX(Math.max(era.from, YEAR_MIN)),
                top:    AXIS_H,
                width:  toX(Math.min(era.to, YEAR_MAX)) - toX(Math.max(era.from, YEAR_MIN)),
                bottom: 0,
                background: era.bg,
                pointerEvents: "none",
                zIndex: 0,
              }} />
            ))}

            {/* ── BC/AD DIVIDING LINE ── */}
            <div style={{
              position: "absolute",
              left:   NAME_W + toX(0),
              top:    0,
              bottom: 0,
              width:  1.5,
              background: "rgba(232,98,92,0.45)",
              pointerEvents: "none",
              zIndex: 2,
            }} />

            {/* ── AXIS ROW ── */}
            <div style={{
              position: "relative",
              height:   AXIS_H,
              borderBottom: `1px solid ${st.divider}`,
              zIndex: 3,
            }}>
              {/* Sticky "BOOK" header cell */}
              <div style={{
                position: "sticky", left: 0,
                width:  NAME_W,
                height: AXIS_H,
                background: st.dark,
                display: "flex", alignItems:"flex-end",
                padding: "0 8px 10px",
                zIndex: 10,
                boxShadow: "2px 0 6px rgba(0,0,0,0.12)",
              }}>
                <span style={{ fontFamily:st.ui, fontSize:8.5, fontWeight:800, color:`${st.headerText}99`, textTransform:"uppercase", letterSpacing:"0.08em" }}>
                  Book
                </span>
              </div>

              {/* Era band labels in axis */}
              {ERA_BANDS.map((era, i) => {
                const x1 = NAME_W + toX(Math.max(era.from, YEAR_MIN));
                const x2 = NAME_W + toX(Math.min(era.to,  YEAR_MAX));
                const cx = (x1 + x2) / 2;
                return (
                  <div key={i} style={{
                    position: "absolute", left: cx, top: 6,
                    transform: "translateX(-50%)",
                    fontFamily: st.ui, fontSize: 8, fontWeight: 700,
                    color: st.light, whiteSpace: "nowrap",
                    letterSpacing: "0.03em", opacity: 0.9,
                    pointerEvents: "none",
                  }}>
                    {era.label}
                  </div>
                );
              })}

              {/* Year tick marks */}
              {AXIS_TICKS.map(year => {
                const x     = NAME_W + toX(year);
                const label = year < 0
                  ? `${Math.abs(year)} BC`
                  : year === 0 ? "AD 1" : `AD ${year}`;
                return (
                  <div key={year} style={{ position:"absolute", left:x }}>
                    {/* Tick line */}
                    <div style={{
                      position: "absolute", bottom: 0,
                      width: 1, height: 8,
                      background: st.muted,
                      transform: "translateX(-50%)",
                    }} />
                    {/* Tick label */}
                    <div style={{
                      position: "absolute", bottom: 12,
                      fontFamily: st.ui, fontSize: 9, fontWeight: 700,
                      color: st.muted, whiteSpace: "nowrap",
                      transform: "translateX(-50%)",
                    }}>
                      {label}
                    </div>
                  </div>
                );
              })}
            </div>

            {/* ── BOOK ROWS ── */}
            {filtered.length === 0 ? (
              <div style={{ padding:"32px 16px", textAlign:"center" }}>
                <div style={{ fontSize:28, marginBottom:10 }}>🔍</div>
                <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted }}>
                  No books match this filter.
                </div>
                <button onClick={resetFilters}
                  style={{ marginTop:12, fontFamily:st.ui, fontSize:12, fontWeight:700, color:st.accent, background:"none", border:"none", cursor:"pointer", textDecoration:"underline" }}>
                  Reset filters
                </button>
              </div>
            ) : rows.map(row => {

              /* ─ OT / NT SEPARATOR ROW ─ */
              if (row.type === "sep") return (
                <div key="sep-nt" style={{
                  height: SEP_H,
                  position: "relative",
                  background: st.dark,
                  zIndex: 4,
                  display: "flex", alignItems: "center",
                }}>
                  {/* Sticky label */}
                  <div style={{
                    position: "sticky", left: 0,
                    width: NAME_W,
                    height: SEP_H,
                    background: "#1A0F30",
                    display: "flex", alignItems: "center",
                    paddingLeft: 10,
                    zIndex: 10,
                    flexShrink: 0,
                  }}>
                    <span style={{ fontFamily:st.ui, fontSize:8, fontWeight:800, color:`${st.headerText}99`, textTransform:"uppercase", letterSpacing:"0.1em" }}>
                      New Testament
                    </span>
                  </div>
                  {/* Thin rule in the timeline area */}
                  <div style={{ flex:1, height:1, background:`${st.headerText}18`, marginLeft:8 }} />
                </div>
              );

              /* ─ BOOK ROW ─ */
              const { book, idx } = row;
              const isSelected = selected?.id === book.id;
              const isEven     = idx % 2 === 0;
              const rowBg      = isSelected
                ? `${book.color}14`
                : isEven ? st.bg : "rgba(0,0,0,0.022)";

              return (
                <div key={book.id} style={{
                  position: "relative",
                  height: ROW_H,
                  background: rowBg,
                  borderBottom: `1px solid rgba(0,0,0,0.04)`,
                  transition: "background 0.15s",
                  zIndex: 3,
                }}>
                  {/* ── STICKY BOOK NAME ── */}
                  <div
                    onClick={() => handleBar(book)}
                    style={{
                      position: "sticky", left: 0,
                      width: NAME_W,
                      height: ROW_H,
                      background: isSelected
                        ? `${book.color}22`
                        : isEven ? st.bg : "#FFF3E8",
                      display: "flex", alignItems: "center",
                      paddingLeft: 8, paddingRight: 5,
                      zIndex: 8,
                      cursor: "pointer",
                      boxShadow: "2px 0 5px rgba(0,0,0,0.06)",
                      boxSizing: "border-box",
                      borderRight: `1px solid ${isSelected ? book.color+"55" : st.divider}`,
                    }}>
                    <span style={{
                      fontFamily: st.ui,
                      fontSize: 9,
                      fontWeight: isSelected ? 800 : 600,
                      color: isSelected ? book.color : st.text,
                      overflow: "hidden",
                      whiteSpace: "nowrap",
                      textOverflow: "ellipsis",
                      display: "block",
                      width: "100%",
                    }}>
                      {book.book_name}
                    </span>
                  </div>

                  {/* ── TIMELINE BAR ── */}
                  <div
                    className="timeline-bar"
                    onClick={() => handleBar(book)}
                    style={{
                      position: "absolute",
                      left:   NAME_W + toX(book.year_from),
                      top:    6,
                      width:  toW(book.year_from, book.year_to),
                      height: ROW_H - 12,
                      background: book.color,
                      borderRadius: 5,
                      cursor: "pointer",
                      opacity: isSelected ? 1 : 0.70,
                      boxShadow: isSelected
                        ? `0 2px 10px ${book.color}70, 0 0 0 2px ${book.color}55`
                        : "none",
                      zIndex: isSelected ? 5 : 2,
                    }}
                  />
                </div>
              );
            })}

            {/* Bottom padding */}
            <div style={{ height: 12 }} />

          </div>
        </div>

        {/* ══ SELECTED BOOK DETAIL PANEL ══════════════════════════════════ */}
        {selected && (
          <div className="book-panel" style={{
            margin:  "16px 16px 0",
            background: st.card,
            borderRadius: 20,
            border: `1px solid ${selected.color}44`,
            borderLeft: `4px solid ${selected.color}`,
            boxShadow: `0 4px 28px rgba(0,0,0,0.10)`,
            overflow: "hidden",
          }}>
            {/* Panel header */}
            <div style={{
              padding: "14px 16px 12px",
              background: `${selected.color}0E`,
              display: "flex", justifyContent: "space-between", alignItems: "flex-start",
            }}>
              <div style={{ flex: 1 }}>
                <div style={{ fontFamily:st.heading, fontSize:21, fontWeight:700, color:st.dark, lineHeight:1.2, marginBottom:5 }}>
                  {selected.book_name}
                </div>
                <div style={{ display:"flex", gap:8, flexWrap:"wrap", alignItems:"center" }}>
                  {/* Genre badge */}
                  <span style={{
                    fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                    padding: "2px 9px", borderRadius: 10,
                    background: selected.color, color: "#fff",
                    textTransform: "uppercase", letterSpacing: "0.06em",
                  }}>
                    {GENRE_ICONS[selected.genre]} {selected.genre}
                  </span>
                  {/* Testament badge */}
                  <span style={{
                    fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                    color: st.muted, textTransform: "uppercase", letterSpacing: "0.05em",
                  }}>
                    {selected.testament === "OT" ? "Old Testament" : "New Testament"}
                  </span>
                </div>
              </div>
              <button
                onClick={() => setSelected(null)}
                style={{ background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:20, padding:"0 0 0 14px", flexShrink:0, lineHeight:1 }}>
                ✕
              </button>
            </div>

            <div style={{ padding:"14px 16px 18px" }}>

              {/* Date + Author row */}
              <div style={{ display:"flex", gap:16, marginBottom:14, flexWrap:"wrap" }}>
                <div style={{ display:"flex", alignItems:"flex-start", gap:7 }}>
                  <span style={{ fontSize:15, marginTop:1 }}>📅</span>
                  <div>
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:2 }}>Written</div>
                    <div style={{ fontFamily:st.ui, fontSize:12.5, fontWeight:700, color:selected.color }}>
                      {selected.year_display}
                    </div>
                  </div>
                </div>
                <div style={{ display:"flex", alignItems:"flex-start", gap:7 }}>
                  <span style={{ fontSize:15, marginTop:1 }}>✍️</span>
                  <div>
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:2 }}>Author</div>
                    <div style={{ fontFamily:st.ui, fontSize:12.5, fontWeight:700, color:st.text }}>
                      {selected.author}
                    </div>
                  </div>
                </div>
              </div>

              {/* Divider */}
              <div style={{ height:1, background:st.divider, marginBottom:14 }} />

              {/* Description */}
              <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.90, marginBottom:16 }}>
                {selected.description}
              </div>

              {/* Key Verse block */}
              {selected.key_verse && (
                <div style={{
                  background: `${selected.color}0D`,
                  borderRadius: 14,
                  padding: "13px 15px",
                  borderLeft: `3px solid ${selected.color}`,
                }}>
                  <div style={{
                    fontFamily:st.ui, fontSize:10, fontWeight:700,
                    color:selected.color, textTransform:"uppercase",
                    letterSpacing:"0.07em", marginBottom:7,
                    display:"flex", alignItems:"center", gap:5,
                  }}>
                    📖 Key Verse
                    <span style={{ fontWeight:400, color:st.muted, textTransform:"none", letterSpacing:0, fontSize:10 }}>
                      — {selected.key_verse_ref}
                    </span>
                  </div>
                  <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.85, fontStyle:"italic" }}>
                    "{selected.key_verse}"
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {/* ══ GENRE LEGEND ════════════════════════════════════════════════ */}
        <div style={{
          margin: "18px 16px 0",
          background: st.card,
          borderRadius: 16,
          padding: "14px 16px",
          border: `1px solid ${st.divider}`,
        }}>
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:11 }}>
            Genre Key
          </div>
          <div style={{ display:"flex", flexWrap:"wrap", gap:"9px 20px" }}>
            {Object.entries(GENRE_COLORS).map(([genre, color]) => (
              <button key={genre}
                onClick={() => { setActiveGenre(g => g === genre ? "All" : genre); setSelected(null); }}
                style={{
                  display:"flex", alignItems:"center", gap:7,
                  background:"none", border:"none", cursor:"pointer", padding:0,
                }}>
                <div style={{ width:13, height:13, borderRadius:3, background:color, flexShrink:0 }} />
                <span style={{ fontFamily:st.ui, fontSize:11.5, fontWeight:600, color:st.text }}>
                  {GENRE_ICONS[genre]} {genre}
                </span>
              </button>
            ))}
          </div>
        </div>

        {/* ══ FOOTER VERSE ════════════════════════════════════════════════ */}
        <div style={{
          margin: "16px 16px 0",
          background: st.headerGradient,
          borderRadius: 16,
          padding: "20px",
          position: "relative", overflow: "hidden",
        }}>
          <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)", pointerEvents:"none" }} />
          <div style={{ position:"relative", zIndex:1 }}>
            <div style={{ fontFamily:st.body, fontSize:14, color:st.headerText, fontStyle:"italic", lineHeight:1.85, marginBottom:7 }}>
              "All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness."
            </div>
            <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700 }}>
              2 Timothy 3:16
            </div>
          </div>
        </div>

      </div>
    </div>
  );
}