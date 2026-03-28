"use client";
import { useState, useEffect, useRef, useCallback } from "react";

// ─── THEME ────────────────────────────────────────────────────────────────────
const LIGHT = {
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
  rowAlt:  "rgba(0,0,0,0.022)",
  nameAlt: "#FFF3E8",
};
const DARK = {
  ...LIGHT,
  bg:      "#161210",
  card:    "#201A16",
  dark:    "#F8E8D0",
  text:    "#D0B898",
  muted:   "#9A7A5A",
  light:   "#6A5840",
  divider: "rgba(232,98,92,0.15)",
  rowAlt:  "rgba(255,255,255,0.03)",
  nameAlt: "#1C1814",
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
  Law: "\u2696\uFE0F", History: "\uD83D\uDCDC", Wisdom: "\uD83D\uDCA1",
  Prophecy: "\uD83D\uDD2E", Gospel: "\u271D\uFE0F", Epistle: "\u2709\uFE0F", Apocalyptic: "\uD83D\uDC41\uFE0F",
};
const GENRES = ["All", ...Object.keys(GENRE_COLORS)];

// ─── TIMELINE GEOMETRY ───────────────────────────────────────────────────────
const YEAR_MIN  = -2000;
const YEAR_MAX  =   100;
const YEAR_SPAN = YEAR_MAX - YEAR_MIN;  // 2100
const NAME_W    = 88;                   // sticky name column width
const TL_W      = 1200;                 // scrollable timeline width
const PAD_L     = 32;                   // left breathing room so 2000 BC label is never clipped
const ROW_H     = 36;                   // px per book row
const AXIS_H    = 56;                   // axis row height
const SEP_H     = 26;                   // OT/NT separator height
const MIN_BAR   = 22;                   // minimum tap-able bar width
const SCALE     = TL_W / YEAR_SPAN;

// Clamped positioning helpers
const toX = year => PAD_L + (Math.max(YEAR_MIN, Math.min(YEAR_MAX, year)) - YEAR_MIN) * SCALE;
const toW = (from, to) => Math.max(MIN_BAR, (Math.min(to, YEAR_MAX) - Math.max(from, YEAR_MIN)) * SCALE);

// ─── AXIS TICKS ──────────────────────────────────────────────────────────────
const AXIS_TICKS = [-2000, -1500, -1000, -500, 0, 100];

// ─── ERA BANDS ───────────────────────────────────────────────────────────────
const ERA_BANDS_LIGHT = [
  { from: -2000, to: -1446, label: "Patriarchal",         bg: "rgba(212,168,83,0.09)"  },
  { from: -1446, to: -1000, label: "Exodus / Wilderness", bg: "rgba(192,108,62,0.08)"  },
  { from: -1000, to:  -586, label: "Monarchy",            bg: "rgba(46,125,50,0.08)"   },
  { from:  -586, to:  -430, label: "Exile & Return",      bg: "rgba(42,74,107,0.09)"   },
  { from:  -430, to:     0, label: "400 Silent Years",    bg: "rgba(139,92,246,0.06)"  },
  { from:     0, to:   100, label: "NT Era",              bg: "rgba(27,122,110,0.13)"  },
];
const ERA_BANDS_DARK = [
  { from: -2000, to: -1446, label: "Patriarchal",         bg: "rgba(212,168,83,0.18)"  },
  { from: -1446, to: -1000, label: "Exodus / Wilderness", bg: "rgba(192,108,62,0.16)"  },
  { from: -1000, to:  -586, label: "Monarchy",            bg: "rgba(46,125,50,0.16)"   },
  { from:  -586, to:  -430, label: "Exile & Return",      bg: "rgba(42,74,107,0.18)"   },
  { from:  -430, to:     0, label: "400 Silent Years",    bg: "rgba(139,92,246,0.12)"  },
  { from:     0, to:   100, label: "NT Era",              bg: "rgba(27,122,110,0.26)"  },
];

// NT jump button color
const ntColor = "#1B7A6E";

// ─── WORLD HISTORY EVENTS ───────────────────────────────────────────────────
const WORLD_EVENTS = [
  { year: -1754, label: "Hammurabi\u2019s Code" },
  { year: -1500, label: "Egyptian New Kingdom" },
  { year: -1180, label: "Fall of Troy" },
  { year: -776,  label: "First Olympics" },
  { year: -612,  label: "Fall of Nineveh" },
  { year: -550,  label: "Persian Empire" },
  { year: -480,  label: "Thermopylae" },
  { year: -330,  label: "Alexander" },
  { year: -250,  label: "Septuagint" },
  { year: -146,  label: "Rome Conquers Greece" },
  { year: -49,   label: "Julius Caesar" },
  { year: -4,    label: "Birth of Christ" },
  { year: 70,    label: "Jerusalem Falls" },
  { year: 79,    label: "Pompeii" },
];

// ─── DAILY ROTATION HELPER ──────────────────────────────────────────────────
const getDayOfYear = () => {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / 86400000);
};

// ─── CSS ─────────────────────────────────────────────────────────────────────
const CSS = `
  @keyframes panelIn {
    from { opacity:0; transform:translateY(14px); }
    to   { opacity:1; transform:translateY(0);    }
  }
  .book-panel { animation: panelIn 0.26s ease; }

  @keyframes barGrow {
    from { clip-path:inset(0 100% 0 0); opacity:0.2; }
    to   { clip-path:inset(0 0%   0 0); opacity:1;   }
  }
  .bar-animated {
    animation: barGrow 0.55s cubic-bezier(0.22,1,0.36,1) both;
  }

  .timeline-bar {
    transition: opacity 0.14s, box-shadow 0.14s, filter 0.14s;
    cursor: pointer;
  }
  .timeline-bar:hover  { opacity:1 !important; filter:brightness(1.12); }
  .timeline-bar:active { filter:brightness(0.85); }

  /* Hide scrollbar on axis mirror — it must scroll in sync but show no bar */
  .axis-mirror {
    overflow-x: hidden;
    overflow-y: hidden;
  }

  .read-btn { transition: transform 0.12s, box-shadow 0.12s; }
  .read-btn:active { transform:scale(0.97); }

  @keyframes heroFadeIn {
    from { opacity:0; transform:translateY(-10px); }
    to   { opacity:1; transform:translateY(0);     }
  }
  .today-hero { animation: heroFadeIn 0.5s ease; }

  @keyframes heroGlow {
    0%, 100% { box-shadow: 0 0 0 0 rgba(232,98,92,0); }
    50%      { box-shadow: 0 0 20px 2px rgba(232,98,92,0.15); }
  }
  .hero-glow { animation: heroGlow 3s ease-in-out infinite; }

  @keyframes contempPulse {
    0%, 100% { box-shadow: 0 0 0 0 currentColor; }
    50%      { box-shadow: 0 0 8px 2px currentColor; }
  }
  .contemp-glow { animation: contempPulse 1.5s ease-in-out infinite; color: inherit; }

  @keyframes selectPulse {
    0%, 100% { opacity: 1; }
    50%      { opacity: 0.85; filter: brightness(1.15); }
  }
  .bar-selected { animation: selectPulse 2s ease-in-out infinite; }

  @keyframes fadeIn {
    from { opacity:0; }
    to   { opacity:1; }
  }
  @keyframes slideUp {
    from { opacity:0; transform:translateY(20px); }
    to   { opacity:1; transform:translateY(0);    }
  }
`;

// ─── COMPONENT ────────────────────────────────────────────────────────────────
export default function BibleBookTimeline({ nav, darkMode }) {
  const st = darkMode ? DARK : LIGHT;
  const eraBands = darkMode ? ERA_BANDS_DARK : ERA_BANDS_LIGHT;

  const [books,       setBooks]       = useState([]);
  const [loading,     setLoading]     = useState(true);
  const [error,       setError]       = useState(false);
  const [activeGenre, setActiveGenre] = useState("All");
  const [activeTesta, setActiveTesta] = useState("All");
  const [selected,    setSelected]    = useState(null);
  const [barsReady,   setBarsReady]   = useState(false);
  const [animKey,     setAnimKey]     = useState(0);

  // Stats counter
  const [statsVisible, setStatsVisible] = useState(false);

  // World history toggle
  const [showWorldHistory, setShowWorldHistory] = useState(false);

  // Mini-map viewport
  const [viewportPos, setViewportPos] = useState({ left: 0, width: 100 });

  // Tutorial overlay
  const [showTutorial, setShowTutorial] = useState(false);

  // Two scroll containers that stay in sync horizontally
  const axisRef    = useRef(null);
  const bodyRef    = useRef(null);
  const panelRef   = useRef(null);
  const miniMapRef = useRef(null);

  // ── AnimatedNumber (internal) ─────────────────────────────────────────────
  function AnimatedNumber({ target, duration = 1200, suffix = "" }) {
    const [val, setVal] = useState(0);
    const raf = useRef(null);
    useEffect(() => {
      if (!statsVisible) return;
      let start = null;
      const step = (ts) => {
        if (!start) start = ts;
        const progress = Math.min((ts - start) / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
        setVal(Math.round(eased * target));
        if (progress < 1) raf.current = requestAnimationFrame(step);
      };
      raf.current = requestAnimationFrame(step);
      return () => cancelAnimationFrame(raf.current);
    }, [statsVisible, target, duration]);
    return <>{val}{suffix}</>;
  }

  // ── SYNCED SCROLL + MINIMAP ──────────────────────────────────────────────
  const onBodyScrollWithMinimap = useCallback(() => {
    if (axisRef.current && bodyRef.current) {
      axisRef.current.scrollLeft = bodyRef.current.scrollLeft;
    }
    if (bodyRef.current && miniMapRef.current) {
      const { scrollLeft, scrollWidth, clientWidth } = bodyRef.current;
      const mapWidth = miniMapRef.current.clientWidth;
      const ratio = mapWidth / scrollWidth;
      setViewportPos({
        left: scrollLeft * ratio,
        width: Math.max(20, clientWidth * ratio),
      });
    }
  }, []);

  // ── FETCH ─────────────────────────────────────────────────────────────────
  useEffect(() => {
    fetch("/data/timeline.json")
      .then(r => {
        if (!r.ok) throw new Error("fetch failed");
        return r.json();
      })
      .then(data => {
        if (!data || !data.length) {
          setError(true);
        } else {
          setBooks(data);
          setBarsReady(true);
        }
        setLoading(false);
      })
      .catch(() => {
        setError(true);
        setLoading(false);
      });
  }, []);

  // Trigger stats animation after books load
  useEffect(() => {
    if (books.length > 0) {
      const t = setTimeout(() => setStatsVisible(true), 200);
      return () => clearTimeout(t);
    }
  }, [books.length]);

  // First-visit tutorial
  useEffect(() => {
    if (books.length > 0 && !localStorage.getItem("timeline_tutorial_seen")) {
      const t = setTimeout(() => setShowTutorial(true), 800);
      return () => clearTimeout(t);
    }
  }, [books.length]);

  // Timeline visit tracking
  useEffect(() => {
    const today = new Date().toISOString().slice(0, 10);
    const lastVisit = localStorage.getItem("timeline_last_visit");
    let streak = parseInt(localStorage.getItem("timeline_visit_streak") || "0", 10);
    if (lastVisit !== today) {
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      streak = lastVisit === yesterday ? streak + 1 : 1;
      localStorage.setItem("timeline_visit_streak", String(streak));
      localStorage.setItem("timeline_last_visit", today);
    }
  }, []);

  // Track viewed books and genres on selection
  useEffect(() => {
    if (!selected) return;
    try {
      const viewed = JSON.parse(localStorage.getItem("timeline_viewed_books") || "[]");
      if (!viewed.includes(selected.book_name)) {
        viewed.push(selected.book_name);
        localStorage.setItem("timeline_viewed_books", JSON.stringify(viewed));
      }
      const genres = JSON.parse(localStorage.getItem("timeline_viewed_genres") || "[]");
      if (!genres.includes(selected.genre)) {
        genres.push(selected.genre);
        localStorage.setItem("timeline_viewed_genres", JSON.stringify(genres));
      }
    } catch (_) { /* ignore localStorage errors */ }
  }, [selected]);

  // Re-trigger bar animation on filter change via animKey
  useEffect(() => {
    setAnimKey(k => k + 1);
  }, [activeGenre, activeTesta]);

  // ── FILTER ────────────────────────────────────────────────────────────────
  const filtered = books.filter(b =>
    (activeGenre === "All" || b.genre === activeGenre) &&
    (activeTesta === "All" || b.testament === activeTesta)
  );

  const showSep    = activeTesta === "All";
  const firstNTIdx = showSep ? filtered.findIndex(b => b.testament === "NT") : -1;

  // ── TODAY'S FEATURED BOOK ────────────────────────────────────────────────
  const todayBook = books.length > 0 ? books[getDayOfYear() % books.length] : null;
  const showHero  = todayBook && activeGenre === "All" && activeTesta === "All";

  // ── CONTEMPORANEOUS BOOKS ────────────────────────────────────────────────
  const contemporaneous = selected ? books.filter(b =>
    b.id !== selected.id &&
    b.year_from <= selected.year_to &&
    b.year_to >= selected.year_from
  ) : [];
  const contemporaneousIds = new Set(contemporaneous.map(b => b.id));

  // ── TAP — select + auto-scroll ────────────────────────────────────────────
  const handleBar = (book) => {
    const isDeselect = selected?.id === book.id;
    setSelected(isDeselect ? null : book);

    if (!isDeselect && bodyRef.current) {
      const barMidX  = NAME_W + toX(book.year_from) + toW(book.year_from, book.year_to) / 2;
      const viewW    = bodyRef.current.clientWidth;
      bodyRef.current.scrollTo({ left: Math.max(0, barMidX - viewW / 2), behavior: "smooth" });
      setTimeout(() => {
        panelRef.current?.scrollIntoView({ behavior: "smooth", block: "nearest" });
      }, 300);
    }
  };

  const spotlightTodayBook = () => {
    if (!todayBook) return;
    setSelected(todayBook);
    if (bodyRef.current) {
      const barMidX = NAME_W + toX(todayBook.year_from) + toW(todayBook.year_from, todayBook.year_to) / 2;
      const viewW = bodyRef.current.clientWidth;
      bodyRef.current.scrollTo({ left: Math.max(0, barMidX - viewW / 2), behavior: "smooth" });
      setTimeout(() => {
        panelRef.current?.scrollIntoView({ behavior: "smooth", block: "nearest" });
      }, 300);
    }
  };

  const resetFilters = () => { setActiveGenre("All"); setActiveTesta("All"); setSelected(null); };

  const dismissTutorial = () => {
    setShowTutorial(false);
    localStorage.setItem("timeline_tutorial_seen", "1");
  };

  // ── LOADING ───────────────────────────────────────────────────────────────
  if (loading) return (
    <div style={{ minHeight:"100vh", background:st.bg, display:"flex", alignItems:"center", justifyContent:"center" }}>
      <div style={{ textAlign:"center" }}>
        <div style={{ fontSize:42, marginBottom:14 }}>{"\uD83D\uDCDC"}</div>
        <div style={{ fontFamily:st.ui, fontSize:14, color:st.muted }}>Loading Bible Timeline\u2026</div>
      </div>
    </div>
  );

  // ── ERROR ─────────────────────────────────────────────────────────────────
  if (error) return (
    <div style={{ minHeight:"100vh", background:st.bg, display:"flex", alignItems:"center", justifyContent:"center" }}>
      <div style={{ textAlign:"center", background:st.card, borderRadius:20, padding:"32px 28px", boxShadow:"0 4px 28px rgba(0,0,0,0.10)", maxWidth:320 }}>
        <div style={{ fontSize:42, marginBottom:14 }}>{"\u26A0\uFE0F"}</div>
        <div style={{ fontFamily:st.heading, fontSize:18, fontWeight:700, color:st.dark, marginBottom:8 }}>Timeline Unavailable</div>
        <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted, lineHeight:1.6, marginBottom:18 }}>
          Could not load the timeline data. Please check your connection and try again.
        </div>
        <button
          onClick={() => { setError(false); setLoading(true); window.location.reload(); }}
          style={{
            fontFamily:st.ui, fontSize:13, fontWeight:700,
            padding:"10px 24px", borderRadius:14, border:"none",
            background:st.accent, color:"#fff", cursor:"pointer",
            boxShadow:`0 3px 12px ${st.accent}55`,
          }}>
          Retry
        </button>
      </div>
    </div>
  );

  // ── LAYOUT ────────────────────────────────────────────────────────────────
  const totalW = NAME_W + PAD_L + TL_W + 16;

  const rows = [];
  filtered.forEach((book, idx) => {
    if (showSep && idx === firstNTIdx) rows.push({ type:"sep" });
    rows.push({ type:"book", book, idx });
  });

  // ── RENDER ────────────────────────────────────────────────────────────────
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
      <style>{CSS}</style>

      {/* == PAGE HEADER ================================================== */}
      <div style={{
        background:st.headerGradient, padding:"14px 20px 18px",
        position:"sticky", top:0, zIndex:40,
      }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <button
            onClick={() => nav("timeline-home")}
            aria-label="Back to timeline home"
            style={{
              background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8,
              padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center",
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
              When each book was written &middot; 2000 BC &rarr; AD 100
            </div>
          </div>
        </div>
      </div>

      <div style={{ padding:"16px 0 0" }}>

        {/* == TODAY'S FEATURED BOOK HERO CARD ============================= */}
        {showHero && (
          <div className="today-hero hero-glow" style={{
            margin:"0 16px 14px",
            background: darkMode
              ? `linear-gradient(135deg, ${todayBook.color}33 0%, ${todayBook.color}11 100%)`
              : `linear-gradient(135deg, ${todayBook.color}22 0%, ${todayBook.color}08 100%)`,
            borderRadius:18,
            borderLeft:`4px solid ${todayBook.color}`,
            border:`1px solid ${todayBook.color}33`,
            borderLeftWidth:4,
            borderLeftStyle:"solid",
            borderLeftColor:todayBook.color,
            padding:"16px 16px 14px",
            position:"relative",
            overflow:"hidden",
          }}>
            {/* Label */}
            <div style={{
              fontFamily:st.ui, fontSize:10, fontWeight:700,
              color:todayBook.color, textTransform:"uppercase",
              letterSpacing:"0.06em", marginBottom:6,
              fontVariant:"small-caps",
            }}>
              {"\uD83D\uDCC5"} Today{"'"}s Featured Book
            </div>

            {/* Book name */}
            <div style={{
              fontFamily:st.heading, fontSize:20, fontWeight:700,
              color:st.dark, marginBottom:8, lineHeight:1.2,
            }}>
              {todayBook.book_name}
            </div>

            {/* Genre pill + author + date row */}
            <div style={{ display:"flex", gap:8, flexWrap:"wrap", alignItems:"center", marginBottom:10 }}>
              <span style={{
                fontFamily:st.ui, fontSize:9, fontWeight:700,
                padding:"2px 8px", borderRadius:10,
                background:todayBook.color, color:"#fff",
                textTransform:"uppercase", letterSpacing:"0.05em",
              }}>
                {GENRE_ICONS[todayBook.genre]} {todayBook.genre}
              </span>
              <span style={{ fontFamily:st.ui, fontSize:10.5, fontWeight:600, color:st.muted }}>
                {todayBook.author}
              </span>
              <span style={{ fontFamily:st.ui, fontSize:10.5, fontWeight:600, color:st.light }}>
                {todayBook.year_display}
              </span>
            </div>

            {/* Key verse block quote */}
            {todayBook.key_verse && (
              <div style={{
                borderLeft:`3px solid ${todayBook.color}55`,
                paddingLeft:12, marginBottom:10,
              }}>
                <div style={{
                  fontFamily:st.body, fontSize:12.5, color:st.text,
                  fontStyle:"italic", lineHeight:1.7,
                }}>
                  &ldquo;{todayBook.key_verse}&rdquo;
                </div>
                {todayBook.key_verse_ref && (
                  <div style={{ fontFamily:st.ui, fontSize:9.5, color:todayBook.color, fontWeight:700, marginTop:2 }}>
                    {todayBook.key_verse_ref}
                  </div>
                )}
              </div>
            )}

            {/* Fun fact */}
            {todayBook.fun_fact && (
              <div style={{
                fontFamily:st.ui, fontSize:11, color:st.text,
                lineHeight:1.6, marginBottom:10,
              }}>
                {"\uD83D\uDCA1"} {todayBook.fun_fact}
              </div>
            )}

            {/* Two buttons */}
            <div style={{ display:"flex", gap:8, marginBottom:6 }}>
              <button
                onClick={spotlightTodayBook}
                style={{
                  fontFamily:st.ui, fontSize:11, fontWeight:700,
                  padding:"8px 14px", borderRadius:12,
                  border:`1.5px solid ${todayBook.color}`,
                  background:"transparent", color:todayBook.color,
                  cursor:"pointer", flex:1,
                }}>
                Spotlight in Timeline {"\u231B"}
              </button>
              <button
                onClick={() => nav("chapter", { book: todayBook.book_name })}
                style={{
                  fontFamily:st.ui, fontSize:11, fontWeight:700,
                  padding:"8px 14px", borderRadius:12,
                  border:"none",
                  background:todayBook.color, color:"#fff",
                  cursor:"pointer", flex:1,
                  boxShadow:`0 2px 8px ${todayBook.color}44`,
                }}>
                Read This Book {"\uD83D\uDCD6"}
              </button>
            </div>

            {/* Teaser */}
            <div style={{
              fontFamily:st.ui, fontSize:9, color:st.light,
              textAlign:"center", marginTop:2,
            }}>
              Come back tomorrow for a new book
            </div>
          </div>
        )}

        {/* == ANIMATED STATS COUNTER ===================================== */}
        {books.length > 0 && (
          <div style={{
            display:"flex", gap:8, padding:"0 16px", marginBottom:14,
          }}>
            {[
              { target: 66,   suffix: "", label: "Books" },
              { target: 40,   suffix: "+", label: "Authors" },
              { target: 2100, suffix: "", label: "Years" },
            ].map((stat, i) => (
              <div key={stat.label} style={{
                flex:1, background:st.card, borderRadius:12,
                padding:"10px 8px", textAlign:"center",
                border:`1px solid ${st.divider}`,
                opacity: statsVisible ? 1 : 0,
                transform: statsVisible ? "none" : "translateY(8px)",
                transition:"all 0.6s ease",
                transitionDelay: i === 1 ? "0.15s" : i === 2 ? "0.3s" : "0s",
              }}>
                <div style={{
                  fontFamily:st.heading, fontSize:22, fontWeight:700,
                  color:st.accent, lineHeight:1.2,
                }}>
                  <AnimatedNumber target={stat.target} suffix={stat.suffix} />
                </div>
                <div style={{
                  fontFamily:st.ui, fontSize:10, color:st.muted,
                  marginTop:2, fontWeight:600,
                }}>
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        )}

        {/* == TESTAMENT TOGGLE ============================================ */}
        <div
          role="radiogroup"
          aria-label="Filter by testament"
          style={{ display:"flex", gap:6, padding:"0 16px", marginBottom:14 }}
        >
          {[
            { key:"All", label:"All 66 Books" },
            { key:"OT",  label:"Old Testament" },
            { key:"NT",  label:"New Testament" },
          ].map(({ key, label }) => (
            <button key={key}
              role="radio"
              aria-checked={activeTesta === key}
              onClick={() => { setActiveTesta(key); setSelected(null); }}
              style={{
                fontFamily:st.ui, fontSize:11.5, fontWeight:700,
                padding:"7px 16px", borderRadius:20, border:"none", cursor:"pointer",
                background: activeTesta === key ? st.dark : st.card,
                color:      activeTesta === key ? st.headerText : st.muted,
                boxShadow:  activeTesta === key ? "0 2px 10px rgba(45,27,78,0.35)" : "0 1px 3px rgba(0,0,0,0.08)",
                transition:"all 0.15s",
              }}>
              {label}
            </button>
          ))}
        </div>

        {/* == GENRE PILLS ================================================ */}
        <div
          role="radiogroup"
          aria-label="Filter by genre"
          style={{
            display:"flex", gap:6, padding:"0 16px 4px", marginBottom:12,
            overflowX:"auto", WebkitOverflowScrolling:"touch",
          }}
        >
          {GENRES.map(g => {
            const color    = GENRE_COLORS[g] || st.dark;
            const isActive = activeGenre === g;
            return (
              <button key={g}
                role="radio"
                aria-checked={isActive}
                onClick={() => { setActiveGenre(g); setSelected(null); }}
                style={{
                  fontFamily:st.ui, fontSize:11, fontWeight:700,
                  padding:"5px 13px", borderRadius:16, border:"none",
                  cursor:"pointer", flexShrink:0,
                  background: isActive ? color : `${color}18`,
                  color:      isActive ? "#fff" : color,
                  boxShadow:  isActive ? `0 2px 8px ${color}55` : "none",
                  transition:"all 0.14s",
                  transform:  isActive ? "scale(1.05)" : "none",
                }}>
                {g !== "All" && GENRE_ICONS[g] ? `${GENRE_ICONS[g]} ` : ""}{g}
              </button>
            );
          })}
        </div>

        {/* == COUNT + HINT =============================================== */}
        <div style={{ display:"flex", alignItems:"center", padding:"0 16px", marginBottom:0, fontFamily:st.ui, fontSize:10.5 }}>
          <span style={{ color:st.light }}>&larr; Scroll right to explore &rarr;</span>
          <div aria-live="polite" style={{ marginLeft:"auto" }}>
            <span style={{ color:st.muted, fontWeight:700 }}>
              {filtered.length} book{filtered.length !== 1 ? "s" : ""}
            </span>
          </div>
        </div>

        {/* == STICKY AXIS ROW ============================================ */}
        <div style={{
          position:"sticky",
          top: 52,
          zIndex: 20,
          background: st.bg,
          borderTop:`1px solid ${st.divider}`,
          borderBottom:`2px solid ${st.divider}`,
          boxShadow: darkMode ? "0 2px 8px rgba(0,0,0,0.3)" : "0 2px 8px rgba(0,0,0,0.07)",
        }}>
          <div ref={axisRef} className="axis-mirror" style={{ width:"100%" }}>
            <div style={{ width:totalW, height:AXIS_H, position:"relative" }}>

              {/* Sticky "BOOK" cell inside axis */}
              <div style={{
                position:"sticky", left:0, width:NAME_W, height:AXIS_H,
                background:st.dark,
                display:"flex", alignItems:"flex-end",
                padding:"0 8px 10px",
                zIndex:10,
                boxShadow:"2px 0 6px rgba(0,0,0,0.18)",
              }}>
                <span style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:`${st.headerText}99`, textTransform:"uppercase", letterSpacing:"0.08em" }}>Book</span>
              </div>

              {/* Era band labels */}
              {eraBands.map((era, i) => {
                const x1 = NAME_W + toX(Math.max(era.from, YEAR_MIN));
                const x2 = NAME_W + toX(Math.min(era.to,  YEAR_MAX));
                return (
                  <div key={i} style={{
                    position:"absolute", left:(x1+x2)/2, top:6,
                    transform:"translateX(-50%)",
                    fontFamily:st.ui, fontSize:9, fontWeight:700,
                    color:st.light, whiteSpace:"nowrap", pointerEvents:"none",
                  }}>
                    {era.label}
                  </div>
                );
              })}

              {/* Year tick marks */}
              {AXIS_TICKS.map(year => {
                const x     = NAME_W + toX(year);
                const label = year < 0 ? `${Math.abs(year)} BC` : year === 0 ? "AD 1" : `AD ${year}`;
                return (
                  <div key={year} style={{ position:"absolute", left:x }}>
                    <div style={{ position:"absolute", bottom:0, width:1, height:8, background:st.muted, transform:"translateX(-50%)" }} />
                    <div style={{ position:"absolute", bottom:12, fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, whiteSpace:"nowrap", transform:"translateX(-50%)" }}>
                      {label}
                    </div>
                  </div>
                );
              })}

            </div>
          </div>
        </div>

        {/* == SCROLLABLE BODY ============================================ */}
        <div
          ref={bodyRef}
          onScroll={onBodyScrollWithMinimap}
          style={{ overflowX:"auto", WebkitOverflowScrolling:"touch" }}>
          <div
            key={animKey}
            role="grid"
            aria-label="Bible book timeline"
            style={{ width:totalW, position:"relative" }}
          >

            {/* World History Context Lane */}
            {showWorldHistory && (
              <div style={{ position:"relative", height:28, borderBottom:`1px dashed ${st.divider}` }}>
                {/* Thin connector line */}
                <div style={{ position:"absolute", left:NAME_W+PAD_L, right:16, top:14, height:1, background:st.light+"44" }} />
                {WORLD_EVENTS.filter(e => e.year >= YEAR_MIN && e.year <= YEAR_MAX).map((evt, i) => (
                  <div key={i} style={{
                    position:"absolute", left: NAME_W + toX(evt.year), top: 6,
                    transform: "translateX(-50%)",
                    display:"flex", flexDirection:"column", alignItems:"center",
                  }}>
                    <div style={{
                      width:8, height:8, background:st.accent, borderRadius:"50%",
                      border:`2px solid ${st.card}`, boxShadow:`0 0 4px ${st.accent}44`,
                    }} />
                    <div style={{
                      fontFamily:st.ui, fontSize:7, fontWeight:700,
                      color:st.muted, whiteSpace:"nowrap", marginTop:2,
                    }}>
                      {evt.label}
                    </div>
                  </div>
                ))}
              </div>
            )}

            {/* Era background bands */}
            {eraBands.map((era, i) => (
              <div key={i} style={{
                position:"absolute",
                left:   NAME_W + toX(Math.max(era.from, YEAR_MIN)),
                top:    showWorldHistory ? 28 : 0, bottom:0,
                width:  toX(Math.min(era.to, YEAR_MAX)) - toX(Math.max(era.from, YEAR_MIN)),
                background: era.bg,
                pointerEvents:"none", zIndex:0,
              }} />
            ))}

            {/* BC/AD dividing line */}
            <div style={{
              position:"absolute", left:NAME_W + toX(0),
              top: showWorldHistory ? 28 : 0, bottom:0, width:1.5,
              background:"rgba(232,98,92,0.45)",
              pointerEvents:"none", zIndex:2,
            }} />

            {/* ── ROWS ── */}
            {filtered.length === 0 ? (
              <div style={{ padding:"32px 16px", textAlign:"center" }}>
                <div style={{ fontSize:28, marginBottom:10 }}>{"\uD83D\uDD0D"}</div>
                <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted }}>No books match this filter.</div>
                <button onClick={resetFilters} style={{ marginTop:12, fontFamily:st.ui, fontSize:12, fontWeight:700, color:st.accent, background:"none", border:"none", cursor:"pointer", textDecoration:"underline" }}>
                  Reset filters
                </button>
              </div>
            ) : rows.map((row, rowIdx) => {

              /* ─ OT/NT separator ─ */
              if (row.type === "sep") return (
                <div key="sep-nt" role="row" aria-label="New Testament separator" style={{
                  height: SEP_H, position:"relative",
                  background: st.dark, zIndex:4,
                  display:"flex", alignItems:"center",
                }}>
                  {/* Sticky label */}
                  <div style={{
                    position:"sticky", left:0,
                    width: NAME_W, height: SEP_H,
                    background:st.dark,
                    display:"flex", alignItems:"center",
                    paddingLeft:8, zIndex:10, flexShrink:0,
                    boxShadow:"2px 0 5px rgba(0,0,0,0.15)",
                    overflow:"hidden",
                  }}>
                    <span style={{
                      fontFamily:st.ui, fontSize:9, fontWeight:800,
                      color:`${st.headerText}CC`,
                      textTransform:"uppercase", letterSpacing:"0.08em",
                      whiteSpace:"nowrap",
                    }}>
                      {"\u271D"} New Testament
                    </span>
                  </div>
                  <div style={{ flex:1, height:1, background:`${st.headerText}25`, marginLeft:10 }} />
                </div>
              );

              /* ─ Book row ─ */
              const { book, idx } = row;
              const isSelected = selected?.id === book.id;
              const isContemp  = selected && contemporaneousIds.has(book.id);
              const isEven     = idx % 2 === 0;
              const delay      = `${idx * 20}ms`;

              const barW = toW(book.year_from, book.year_to);
              const showLabel = barW >= 44;
              const barBg = `linear-gradient(90deg, ${book.color} 0%, ${book.color}CC 100%)`;

              return (
                <div key={book.id} role="row" aria-label={book.book_name} style={{
                  position:"relative", height:ROW_H,
                  background: isSelected
                    ? `${book.color}14`
                    : isEven ? st.bg : st.rowAlt,
                  borderBottom:`1px solid ${st.divider}`,
                  transition:"background 0.15s",
                  zIndex:3,
                }}>
                  {/* Sticky name cell */}
                  <div
                    role="gridcell"
                    tabIndex={0}
                    onClick={() => handleBar(book)}
                    onKeyDown={(e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); handleBar(book); } }}
                    style={{
                      position:"sticky", left:0,
                      width:NAME_W, height:ROW_H,
                      background: isSelected
                        ? `${book.color}22`
                        : isEven ? st.bg : st.nameAlt,
                      display:"flex", alignItems:"center",
                      paddingLeft:8, paddingRight:5,
                      zIndex:8, cursor:"pointer",
                      boxShadow:"2px 0 5px rgba(0,0,0,0.06)",
                      boxSizing:"border-box",
                      borderRight:`1px solid ${isSelected ? book.color+"55" : st.divider}`,
                    }}>
                    <span style={{
                      fontFamily:st.ui, fontSize:9,
                      fontWeight: isSelected ? 800 : 600,
                      color: isSelected ? book.color : st.text,
                      overflow:"hidden", whiteSpace:"nowrap",
                      textOverflow:"ellipsis", display:"block", width:"100%",
                    }}>
                      {book.book_name}
                    </span>
                  </div>

                  {/* Animated bar */}
                  {barsReady && (
                    <div
                      className={`timeline-bar bar-animated${isSelected ? " bar-selected" : ""}${isContemp ? " contemp-glow" : ""}`}
                      onClick={() => handleBar(book)}
                      style={{
                        position:"absolute",
                        left:   NAME_W + toX(book.year_from),
                        top:    6,
                        width:  barW,
                        height: ROW_H - 12,
                        background: isSelected ? book.color : barBg,
                        borderRadius: 6,
                        opacity: isSelected ? 1 : isContemp ? 0.95 : 0.78,
                        color: book.color,
                        boxShadow: isSelected
                          ? `0 2px 14px ${book.color}70, 0 0 0 2px ${book.color}55`
                          : `0 1px 4px ${book.color}40`,
                        zIndex: isSelected ? 5 : 2,
                        animationDelay: delay,
                        display:"flex", alignItems:"center",
                        paddingLeft: showLabel ? 7 : 0,
                        overflow:"hidden",
                        boxSizing:"border-box",
                        willChange: "clip-path, opacity",
                      }}
                    >
                      {showLabel && (
                        <span style={{
                          fontFamily:st.ui, fontSize:9, fontWeight:800,
                          color:"rgba(255,255,255,0.92)",
                          whiteSpace:"nowrap", overflow:"hidden",
                          textOverflow:"ellipsis", pointerEvents:"none",
                          letterSpacing:"0.02em", textShadow:"0 1px 2px rgba(0,0,0,0.2)",
                        }}>
                          {book.book_name}
                        </span>
                      )}
                    </div>
                  )}
                </div>
              );
            })}

            <div style={{ height:12 }} />
          </div>
        </div>

        {/* == JUMP BUTTONS =============================================== */}
        <div style={{ display:"flex", gap:8, padding:"10px 16px 0", flexWrap:"wrap" }}>
          <button
            onClick={() => bodyRef.current?.scrollTo({ left: 0, behavior:"smooth" })}
            style={{
              fontFamily:st.ui, fontSize:11, fontWeight:700,
              padding:"6px 14px", borderRadius:16, border:`1px solid ${st.divider}`,
              background:st.card, color:st.muted, cursor:"pointer", flexShrink:0,
            }}>
            &larr; 2000 BC
          </button>
          <button
            onClick={() => {
              const adX = NAME_W + toX(0);
              const viewW = bodyRef.current?.clientWidth || 320;
              bodyRef.current?.scrollTo({ left: Math.max(0, adX - viewW / 2), behavior:"smooth" });
            }}
            style={{
              fontFamily:st.ui, fontSize:11, fontWeight:700,
              padding:"6px 14px", borderRadius:16, border:`1px solid ${ntColor}44`,
              background:`${ntColor}14`, color:ntColor,
              cursor:"pointer", flexShrink:0,
            }}>
            {"\u271D"} Jump to NT &rarr;
          </button>
          <button
            onClick={() => setShowWorldHistory(w => !w)}
            style={{
              fontFamily:st.ui, fontSize:11, fontWeight:700,
              padding:"6px 14px", borderRadius:16,
              border:`1px solid ${showWorldHistory ? st.accent+"55" : st.divider}`,
              background: showWorldHistory ? `${st.accent}18` : st.card,
              color: showWorldHistory ? st.accent : st.muted,
              cursor:"pointer", flexShrink:0,
            }}>
            {"\uD83C\uDF0D"} World History
          </button>
        </div>

        {/* == MINI-MAP NAVIGATION STRIP ================================== */}
        <div ref={miniMapRef}
          onClick={(e) => {
            if (!bodyRef.current || !miniMapRef.current) return;
            const rect = miniMapRef.current.getBoundingClientRect();
            const clickRatio = (e.clientX - rect.left) / rect.width;
            const targetScroll = clickRatio * bodyRef.current.scrollWidth - bodyRef.current.clientWidth / 2;
            bodyRef.current.scrollTo({ left: Math.max(0, targetScroll), behavior: "smooth" });
          }}
          style={{
            margin:"10px 16px 0", height:28, background:st.card,
            borderRadius:10, border:`1px solid ${st.divider}`,
            position:"relative", overflow:"hidden", cursor:"pointer",
          }}>
          {/* Era band colors compressed */}
          {eraBands.map((era, i) => {
            const totalRange = YEAR_MAX - YEAR_MIN;
            const left = ((Math.max(era.from, YEAR_MIN) - YEAR_MIN) / totalRange) * 100;
            const width = ((Math.min(era.to, YEAR_MAX) - Math.max(era.from, YEAR_MIN)) / totalRange) * 100;
            return <div key={i} style={{ position:"absolute", left:`${left}%`, top:0, bottom:0, width:`${width}%`, background:era.bg }} />;
          })}
          {/* Book lines */}
          {books.map(b => {
            const totalRange = YEAR_MAX - YEAR_MIN;
            const left = ((Math.max(b.year_from, YEAR_MIN) - YEAR_MIN) / totalRange) * 100;
            return <div key={b.id} style={{ position:"absolute", left:`${left}%`, top:4, bottom:4, width:2, background:b.color, opacity:0.6, borderRadius:1 }} />;
          })}
          {/* Viewport indicator */}
          <div style={{
            position:"absolute", left:viewportPos.left, top:2, bottom:2,
            width:viewportPos.width, background:`${st.accent}25`,
            border:`1.5px solid ${st.accent}55`, borderRadius:6,
            transition:"left 0.1s, width 0.1s",
          }} />
          {/* Label */}
          <div style={{ position:"absolute", right:6, top:"50%", transform:"translateY(-50%)",
            fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.light, pointerEvents:"none" }}>
            Mini-Map
          </div>
        </div>

        {/* == DETAIL PANEL =============================================== */}
        <div ref={panelRef}>
          {selected && (
            <div className="book-panel" style={{
              margin:"16px 16px 0",
              background:st.card,
              borderRadius:20,
              border:`1px solid ${selected.color}44`,
              borderLeft:`4px solid ${selected.color}`,
              boxShadow:"0 4px 28px rgba(0,0,0,0.10)",
              overflow:"hidden",
            }}>
              {/* Header */}
              <div style={{
                padding:"14px 16px 12px",
                background:`${selected.color}0E`,
                display:"flex", justifyContent:"space-between", alignItems:"flex-start",
              }}>
                <div style={{ flex:1 }}>
                  <div style={{ fontFamily:st.heading, fontSize:21, fontWeight:700, color:st.dark, lineHeight:1.2, marginBottom:5 }}>
                    {selected.book_name}
                  </div>
                  <div style={{ display:"flex", gap:8, flexWrap:"wrap", alignItems:"center" }}>
                    <span style={{
                      fontFamily:st.ui, fontSize:10, fontWeight:700,
                      padding:"2px 9px", borderRadius:10,
                      background:selected.color, color:"#fff",
                      textTransform:"uppercase", letterSpacing:"0.06em",
                    }}>
                      {GENRE_ICONS[selected.genre]} {selected.genre}
                    </span>
                    <span style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:"0.05em" }}>
                      {selected.testament === "OT" ? "Old Testament" : "New Testament"}
                    </span>
                  </div>
                </div>
                <button
                  onClick={() => setSelected(null)}
                  aria-label="Close detail panel"
                  style={{ background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:20, padding:"0 0 0 14px", flexShrink:0, lineHeight:1 }}>
                  {"\u2715"}
                </button>
              </div>

              <div style={{ padding:"14px 16px 18px" }}>

                {/* Date + Author */}
                <div style={{ display:"flex", gap:16, marginBottom:14, flexWrap:"wrap" }}>
                  <div style={{ display:"flex", alignItems:"flex-start", gap:7 }}>
                    <span style={{ fontSize:15, marginTop:1 }}>{"\uD83D\uDCC5"}</span>
                    <div>
                      <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:2 }}>Written</div>
                      <div style={{ fontFamily:st.ui, fontSize:12.5, fontWeight:700, color:selected.color }}>{selected.year_display}</div>
                    </div>
                  </div>
                  <div style={{ display:"flex", alignItems:"flex-start", gap:7 }}>
                    <span style={{ fontSize:15, marginTop:1 }}>{"\u270D\uFE0F"}</span>
                    <div>
                      <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:2 }}>Author</div>
                      <div style={{ fontFamily:st.ui, fontSize:12.5, fontWeight:700, color:st.text }}>{selected.author}</div>
                    </div>
                  </div>
                </div>

                <div style={{ height:1, background:st.divider, marginBottom:14 }} />

                {/* Description */}
                <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.90, marginBottom:16 }}>
                  {selected.description}
                </div>

                {/* Fun Fact */}
                {selected.fun_fact && (
                  <div style={{
                    background: darkMode ? "rgba(212,168,83,0.08)" : "rgba(212,168,83,0.06)",
                    borderRadius:12, padding:"10px 14px", marginBottom:14,
                    display:"flex", gap:8, alignItems:"flex-start",
                    border:`1px solid ${darkMode ? "rgba(212,168,83,0.15)" : "rgba(212,168,83,0.12)"}`,
                  }}>
                    <span style={{ fontSize:14, flexShrink:0 }}>{"\uD83D\uDCA1"}</span>
                    <div style={{ fontFamily:st.ui, fontSize:12, color:st.text, lineHeight:1.6 }}>
                      <span style={{ fontWeight:700, color:"#B8860B" }}>Did you know? </span>
                      {selected.fun_fact}
                    </div>
                  </div>
                )}

                {/* Written Alongside — Contemporaneous Books */}
                {contemporaneous.length > 0 && (
                  <div style={{ marginBottom:16 }}>
                    <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:8, display:"flex", alignItems:"center", gap:5 }}>
                      {"\u23F3"} Written Alongside
                      <span style={{ fontWeight:400, textTransform:"none", letterSpacing:0 }}>
                        {" \u2014 "}{contemporaneous.length} book{contemporaneous.length !== 1 ? "s" : ""} overlap
                      </span>
                    </div>
                    <div style={{ display:"flex", flexWrap:"wrap", gap:6 }}>
                      {contemporaneous.map(cb => (
                        <button key={cb.id} onClick={() => handleBar(cb)}
                          style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, padding:"4px 10px", borderRadius:12, border:`1px solid ${cb.color}44`, background:`${cb.color}14`, color:cb.color, cursor:"pointer" }}>
                          {cb.book_name}
                        </button>
                      ))}
                    </div>
                  </div>
                )}

                {/* Key Verse */}
                {selected.key_verse && (
                  <div style={{
                    background:`${selected.color}0D`,
                    borderRadius:14, padding:"13px 15px",
                    borderLeft:`3px solid ${selected.color}`,
                    marginBottom:16,
                  }}>
                    <div style={{
                      fontFamily:st.ui, fontSize:10, fontWeight:700,
                      color:selected.color, textTransform:"uppercase",
                      letterSpacing:"0.07em", marginBottom:7,
                      display:"flex", alignItems:"center", gap:5,
                    }}>
                      {"\uD83D\uDCD6"} Key Verse
                      <span style={{ fontWeight:400, color:st.muted, textTransform:"none", letterSpacing:0, fontSize:10 }}>
                        {" \u2014 "}{selected.key_verse_ref}
                      </span>
                    </div>
                    <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.85, fontStyle:"italic" }}>
                      &ldquo;{selected.key_verse}&rdquo;
                    </div>
                  </div>
                )}

                {/* Read in Bible button */}
                <button
                  className="read-btn"
                  aria-label={"Read " + selected.book_name + " in Bible"}
                  onClick={() => nav("chapter", { book: selected.book_name })}
                  style={{
                    width:"100%", background:selected.color, color:"#fff",
                    border:"none", borderRadius:14, padding:"14px 20px",
                    cursor:"pointer", display:"flex", alignItems:"center", gap:10,
                    boxShadow:`0 4px 16px ${selected.color}55`,
                  }}>
                  <span style={{ fontSize:18 }}>{"\uD83D\uDCD6"}</span>
                  <div style={{ textAlign:"left" }}>
                    <div style={{ fontFamily:st.ui, fontSize:14, fontWeight:800, letterSpacing:"0.01em" }}>
                      Read {selected.book_name}
                    </div>
                    <div style={{ fontFamily:st.ui, fontSize:10.5, opacity:0.85, marginTop:1 }}>
                      Open in Bible reader
                    </div>
                  </div>
                  <svg style={{ marginLeft:"auto" }} width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
                    <polyline points="9 18 15 12 9 6"/>
                  </svg>
                </button>

              </div>
            </div>
          )}
        </div>

        {/* == GENRE LEGEND =============================================== */}
        <div style={{ margin:"18px 16px 0", background:st.card, borderRadius:16, padding:"14px 16px", border:`1px solid ${st.divider}` }}>
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:11 }}>
            Genre Key
          </div>
          <div style={{ display:"flex", flexWrap:"wrap", gap:"9px 20px" }}>
            {Object.entries(GENRE_COLORS).map(([genre, color]) => (
              <button key={genre}
                aria-label={genre + " genre filter"}
                onClick={() => { setActiveGenre(g => g === genre ? "All" : genre); setSelected(null); }}
                style={{ display:"flex", alignItems:"center", gap:7, background:"none", border:"none", cursor:"pointer", padding:0 }}>
                <div style={{ width:13, height:13, borderRadius:3, background:color, flexShrink:0 }} />
                <span style={{ fontFamily:st.ui, fontSize:11.5, fontWeight:600, color:st.text }}>
                  {GENRE_ICONS[genre]} {genre}
                </span>
              </button>
            ))}
          </div>
        </div>

        {/* == FOOTER VERSE =============================================== */}
        <div style={{ margin:"16px 16px 0", background:st.headerGradient, borderRadius:16, padding:"20px", position:"relative", overflow:"hidden" }}>
          <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)", pointerEvents:"none" }} />
          <div style={{ position:"relative", zIndex:1 }}>
            <div style={{ fontFamily:st.body, fontSize:14, color:st.headerText, fontStyle:"italic", lineHeight:1.85, marginBottom:7 }}>
              &ldquo;All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness.&rdquo;
            </div>
            <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700 }}>2 Timothy 3:16</div>
          </div>
        </div>

      </div>

      {/* == FIRST-VISIT TUTORIAL OVERLAY ================================ */}
      {showTutorial && (
        <div onClick={dismissTutorial} style={{
          position:"fixed", inset:0, background:"rgba(0,0,0,0.6)",
          zIndex:100, display:"flex", alignItems:"center", justifyContent:"center",
          animation:"fadeIn 0.3s ease",
        }}>
          <div onClick={e => e.stopPropagation()} style={{
            background:st.card, borderRadius:24, padding:"28px 24px",
            maxWidth:300, textAlign:"center",
            boxShadow:"0 8px 40px rgba(0,0,0,0.3)",
            animation:"slideUp 0.4s ease",
          }}>
            <div style={{ fontSize:42, marginBottom:12 }}>{"\u231B"}</div>
            <div style={{ fontFamily:st.heading, fontSize:20, fontWeight:700, color:st.dark, marginBottom:8 }}>
              Welcome to the Timeline
            </div>
            <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted, lineHeight:1.6, marginBottom:6 }}>
              {"\uD83D\uDC49"} <b>Scroll right</b> to explore 2,100 years of biblical history
            </div>
            <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted, lineHeight:1.6, marginBottom:6 }}>
              {"\uD83D\uDC46"} <b>Tap any book</b> to see its story, author, and key verse
            </div>
            <div style={{ fontFamily:st.ui, fontSize:13, color:st.muted, lineHeight:1.6, marginBottom:18 }}>
              {"\uD83D\uDCC5"} <b>Come back daily</b> for a new featured book
            </div>
            <button onClick={dismissTutorial} style={{
              fontFamily:st.ui, fontSize:14, fontWeight:700,
              padding:"12px 32px", borderRadius:14, border:"none",
              background:st.accent, color:"#fff", cursor:"pointer",
              boxShadow:`0 3px 12px ${st.accent}55`,
            }}>
              Explore Now
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
