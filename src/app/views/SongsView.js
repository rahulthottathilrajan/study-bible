"use client";
import { useState, useEffect, useRef, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { HYMN_CATEGORIES, HYMN_LANGUAGES } from "../constants";
import Header from "../components/Header";
import { Card, Spinner } from "../components/ui";

// ═══════════════════════════════════════════════════
// SONGS VIEW — songs-home, songs-category, songs-detail
// ═══════════════════════════════════════════════════
export default function SongsView() {
  const {
    view, nav, goBack, ht, darkMode, bp, user,
    songsCategory, setSongsCategory, songsHymn, setSongsHymn,
  } = useApp();

  // ─── Data state ───
  const [hymnIndex, setHymnIndex] = useState(null);
  const [indexLoading, setIndexLoading] = useState(true);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedHymn, setSelectedHymn] = useState(null);
  const [hymnLoading, setHymnLoading] = useState(false);
  const [favorites, setFavorites] = useState([]);
  const [recentHymns, setRecentHymns] = useState([]);
  const [storyExpanded, setStoryExpanded] = useState(false);
  const [langFilter, setLangFilter] = useState("all");
  const [showRomanized, setShowRomanized] = useState(false);
  const hymnCache = useRef({});
  const searchTimer = useRef(null);

  // ─── Load index on mount ───
  useEffect(() => {
    if (hymnIndex) return;
    setIndexLoading(true);
    fetch("/data/hymns/index.json")
      .then(r => r.ok ? r.json() : null)
      .then(data => { if (data) setHymnIndex(data); })
      .catch(() => {})
      .finally(() => setIndexLoading(false));
  }, [hymnIndex]);

  // ─── Load favorites + lang pref from localStorage ───
  useEffect(() => {
    try {
      const saved = localStorage.getItem("hymnFavorites");
      if (saved) setFavorites(JSON.parse(saved));
    } catch {}
    try {
      const saved = localStorage.getItem("recentHymns");
      if (saved) setRecentHymns(JSON.parse(saved));
    } catch {}
    try {
      const saved = localStorage.getItem("hymnLangFilter");
      if (saved) setLangFilter(saved);
    } catch {}
  }, []);

  // ─── Save favorites ───
  const toggleFavorite = useCallback((hymnId) => {
    setFavorites(prev => {
      const next = prev.includes(hymnId) ? prev.filter(id => id !== hymnId) : [...prev, hymnId];
      try { localStorage.setItem("hymnFavorites", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  // ─── Track recent hymns ───
  const trackRecent = useCallback((hymnId) => {
    setRecentHymns(prev => {
      const next = [hymnId, ...prev.filter(id => id !== hymnId)].slice(0, 10);
      try { localStorage.setItem("recentHymns", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  // ─── Load individual hymn (multi-lang) ───
  const loadHymn = useCallback(async (hymnId, lang = "en") => {
    const cacheKey = `${lang}/${hymnId}`;
    if (hymnCache.current[cacheKey]) {
      setSelectedHymn(hymnCache.current[cacheKey]);
      trackRecent(hymnId);
      return;
    }
    setHymnLoading(true);
    try {
      const r = await fetch(`/data/hymns/${lang}/${hymnId}.json`);
      if (r.ok) {
        const data = await r.json();
        hymnCache.current[cacheKey] = data;
        setSelectedHymn(data);
        trackRecent(hymnId);
      }
    } catch {}
    setHymnLoading(false);
  }, [trackRecent]);

  // ─── Load hymn when navigating to detail ───
  useEffect(() => {
    if (view === "songs-detail" && songsHymn && (!selectedHymn || selectedHymn.id !== songsHymn)) {
      setShowRomanized(false);
      setStoryExpanded(false);
      const entry = hymnIndex?.hymns?.find(h => h.id === songsHymn);
      loadHymn(songsHymn, entry?.lang || "en");
    }
  }, [view, songsHymn, selectedHymn, loadHymn, hymnIndex]);

  // ─── Persist lang filter ───
  const setLang = useCallback((l) => {
    setLangFilter(l);
    try { localStorage.setItem("hymnLangFilter", l); } catch {}
  }, []);

  // ─── Filter by language, then search ───
  const visibleHymns = hymnIndex?.hymns?.filter(h => langFilter === "all" || (h.lang || "en") === langFilter) || [];
  const filteredHymns = visibleHymns.filter(h => {
    if (!searchQuery.trim()) return true;
    const q = searchQuery.toLowerCase();
    return h.title.toLowerCase().includes(q)
      || (h.titleRomanized || "").toLowerCase().includes(q)
      || h.firstLine.toLowerCase().includes(q)
      || (h.firstLineRomanized || "").toLowerCase().includes(q)
      || h.author.toLowerCase().includes(q);
  });

  // ─── Palette ───
  const catColors = darkMode ? {
    classic: { bg: "rgba(212,168,83,0.15)", border: "rgba(212,168,83,0.3)", text: "#D4A853" },
    pentecostal: { bg: "rgba(239,68,68,0.15)", border: "rgba(239,68,68,0.3)", text: "#EF4444" },
    christmas: { bg: "rgba(16,185,129,0.15)", border: "rgba(16,185,129,0.3)", text: "#10B981" },
    easter: { bg: "rgba(168,85,247,0.15)", border: "rgba(168,85,247,0.3)", text: "#A855F7" },
    children: { bg: "rgba(251,191,36,0.15)", border: "rgba(251,191,36,0.3)", text: "#FBBF24" },
    worship: { bg: "rgba(59,130,246,0.15)", border: "rgba(59,130,246,0.3)", text: "#3B82F6" },
    grace: { bg: "rgba(99,102,241,0.15)", border: "rgba(99,102,241,0.3)", text: "#6366F1" },
    praise: { bg: "rgba(245,158,11,0.15)", border: "rgba(245,158,11,0.3)", text: "#F59E0B" },
    comfort: { bg: "rgba(107,114,128,0.15)", border: "rgba(107,114,128,0.3)", text: "#9CA3AF" },
    communion: { bg: "rgba(180,83,9,0.15)", border: "rgba(180,83,9,0.3)", text: "#B45309" },
    mission: { bg: "rgba(34,197,94,0.15)", border: "rgba(34,197,94,0.3)", text: "#22C55E" },
  } : {
    classic: { bg: "rgba(212,168,83,0.1)", border: "rgba(212,168,83,0.25)", text: "#92700C" },
    pentecostal: { bg: "rgba(239,68,68,0.08)", border: "rgba(239,68,68,0.2)", text: "#DC2626" },
    christmas: { bg: "rgba(16,185,129,0.08)", border: "rgba(16,185,129,0.2)", text: "#059669" },
    easter: { bg: "rgba(168,85,247,0.08)", border: "rgba(168,85,247,0.2)", text: "#7C3AED" },
    children: { bg: "rgba(251,191,36,0.08)", border: "rgba(251,191,36,0.2)", text: "#B45309" },
    worship: { bg: "rgba(59,130,246,0.08)", border: "rgba(59,130,246,0.2)", text: "#2563EB" },
    grace: { bg: "rgba(99,102,241,0.08)", border: "rgba(99,102,241,0.2)", text: "#4F46E5" },
    praise: { bg: "rgba(245,158,11,0.08)", border: "rgba(245,158,11,0.2)", text: "#D97706" },
    comfort: { bg: "rgba(107,114,128,0.08)", border: "rgba(107,114,128,0.2)", text: "#4B5563" },
    communion: { bg: "rgba(180,83,9,0.08)", border: "rgba(180,83,9,0.2)", text: "#92400E" },
    mission: { bg: "rgba(34,197,94,0.08)", border: "rgba(34,197,94,0.2)", text: "#15803D" },
  };
  const getCatColor = (catId) => catColors[catId] || catColors.classic;

  // ═══════════════════════════════════════════════
  // SONGS HOME
  // ═══════════════════════════════════════════════
  if (view === "songs-home") {
    const catCounts = {};
    visibleHymns.forEach(h => h.categories?.forEach(c => { catCounts[c] = (catCounts[c] || 0) + 1; }));
    const activeLangs = hymnIndex?.languages || [];

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Hymns & Songs" subtitle={langFilter === "all" ? `${hymnIndex?.count || 0} public domain hymns` : `${visibleHymns.length} ${HYMN_LANGUAGES.find(l => l.id === langFilter)?.label || ""} hymns`} theme={ht} />
        <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {indexLoading ? <Spinner t={ht} /> : !hymnIndex ? (
            <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
              <div style={{ fontSize: 36, marginBottom: 12 }}>🎵</div>
              <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark }}>Hymns Coming Soon</div>
              <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginTop: 6 }}>The hymn library is being prepared.</div>
            </Card>
          ) : (
            <>
              {/* ── SEARCH ── */}
              <div style={{ position: "relative", marginBottom: 18 }}>
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2" strokeLinecap="round" style={{ position: "absolute", left: 14, top: "50%", transform: "translateY(-50%)" }}>
                  <circle cx="11" cy="11" r="8" /><line x1="21" y1="21" x2="16.65" y2="16.65" />
                </svg>
                <input
                  value={searchQuery}
                  onChange={e => {
                    setSearchQuery(e.target.value);
                    if (searchTimer.current) clearTimeout(searchTimer.current);
                    searchTimer.current = setTimeout(() => {}, 300);
                  }}
                  placeholder="Search hymns by title, author, or lyric..."
                  style={{ width: "100%", padding: "13px 14px 13px 42px", borderRadius: 12, border: `1px solid ${ht.divider}`, background: ht.card, fontFamily: ht.ui, fontSize: 14, color: ht.text, outline: "none", boxSizing: "border-box" }}
                />
                {searchQuery && (
                  <button onClick={() => setSearchQuery("")} style={{ position: "absolute", right: 12, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", color: ht.muted, cursor: "pointer", fontSize: 16, padding: 4 }}>✕</button>
                )}
              </div>

              {/* ── LANGUAGE FILTER ── */}
              {activeLangs.length > 1 && (
                <div style={{ display: "flex", gap: 8, overflowX: "auto", paddingBottom: 4, marginBottom: 16, WebkitOverflowScrolling: "touch", msOverflowStyle: "none", scrollbarWidth: "none" }}>
                  {[{ id: "all", nativeLabel: "All" }, ...activeLangs].map(lang => {
                    const active = langFilter === lang.id;
                    return (
                      <button key={lang.id} onClick={() => setLang(lang.id)}
                        style={{ padding: "7px 16px", borderRadius: 20, whiteSpace: "nowrap", border: `1px solid ${active ? ht.accent : ht.divider}`, background: active ? ht.accent : ht.card, color: active ? "#fff" : ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer", flexShrink: 0 }}>
                        {lang.nativeLabel}
                      </button>
                    );
                  })}
                </div>
              )}

              {/* ── SEARCH RESULTS ── */}
              {searchQuery.trim() ? (
                <div>
                  <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, marginBottom: 12, fontWeight: 600 }}>{filteredHymns.length} result{filteredHymns.length !== 1 ? "s" : ""}</div>
                  {filteredHymns.map(h => (
                    <HymnCard key={h.id} hymn={h} ht={ht} nav={nav} favorites={favorites} toggleFavorite={toggleFavorite} getCatColor={getCatColor} setSongsHymn={setSongsHymn} />
                  ))}
                  {filteredHymns.length === 0 && (
                    <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>No hymns match your search</div>
                  )}
                </div>
              ) : (
                <>
                  {/* ── HYMN OF THE DAY (inline mini) ── */}
                  {visibleHymns.length > 0 && (() => {
                    const dayOfYear = Math.floor((Date.now() - new Date(new Date().getFullYear(), 0, 0)) / 86400000);
                    const dailyHymn = visibleHymns[dayOfYear % visibleHymns.length];
                    return (
                      <div
                        onClick={() => { setSongsHymn(dailyHymn.id); nav("songs-detail", { songsHymn: dailyHymn.id }); }}
                        className="pressable"
                        style={{ background: ht.headerGradient, borderRadius: 16, padding: "20px 20px 18px", marginBottom: 20, cursor: "pointer", position: "relative", overflow: "hidden" }}
                      >
                        <div style={{ position: "absolute", top: 0, right: 0, width: 120, height: 120, background: "radial-gradient(circle at top right, rgba(255,255,255,0.08), transparent)", borderRadius: "0 16px 0 120px" }} />
                        <div style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: "rgba(255,255,255,0.5)", textTransform: "uppercase", letterSpacing: "0.15em", marginBottom: 8 }}>Hymn of the Day</div>
                        <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.headerText, lineHeight: 1.3, marginBottom: dailyHymn.titleRomanized ? 2 : 6 }}>{dailyHymn.title}</div>
                        {dailyHymn.titleRomanized && <div style={{ fontFamily: ht.ui, fontSize: 13, color: "rgba(255,255,255,0.55)", marginBottom: 6 }}>{dailyHymn.titleRomanized}</div>}
                        <div style={{ fontFamily: ht.body, fontSize: 13, color: "rgba(255,255,255,0.7)", fontStyle: "italic", lineHeight: 1.6, marginBottom: 8 }}>{dailyHymn.firstLineRomanized || dailyHymn.firstLine}</div>
                        <div style={{ fontFamily: ht.ui, fontSize: 11, color: "rgba(255,255,255,0.5)" }}>{dailyHymn.author}{dailyHymn.year ? `, ${dailyHymn.year}` : ""}</div>
                      </div>
                    );
                  })()}

                  {/* ── CATEGORIES ── */}
                  <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12, display: "flex", alignItems: "center", gap: 8 }}>
                    <span>🎶</span> Browse by Category
                  </div>
                  <div style={{ display: "grid", gridTemplateColumns: bp.isMobile ? "1fr 1fr" : "1fr 1fr 1fr", gap: 10, marginBottom: 24 }}>
                    {HYMN_CATEGORIES.map(cat => {
                      const count = catCounts[cat.id] || 0;
                      if (count === 0) return null;
                      const cc = getCatColor(cat.id);
                      return (
                        <div
                          key={cat.id}
                          onClick={() => { setSongsCategory(cat.id); nav("songs-category", { songsCategory: cat.id }); }}
                          className="pressable"
                          style={{ background: cc.bg, border: `1px solid ${cc.border}`, borderRadius: 12, padding: "14px 12px", cursor: "pointer", textAlign: "center" }}
                        >
                          <div style={{ fontSize: 24, marginBottom: 6 }}>{cat.icon}</div>
                          <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: cc.text, lineHeight: 1.3 }}>{cat.label}</div>
                          <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted, marginTop: 3 }}>{count} hymn{count !== 1 ? "s" : ""}</div>
                        </div>
                      );
                    })}
                  </div>

                  {/* ── FAVORITES ── */}
                  {favorites.length > 0 && (() => {
                    const favHymns = visibleHymns.filter(h => favorites.includes(h.id));
                    if (!favHymns.length) return null;
                    return (
                      <>
                        <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12, display: "flex", alignItems: "center", gap: 8 }}>
                          <span>&#10084;&#65039;</span> Your Favorites
                        </div>
                        {favHymns.map(h => (
                          <HymnCard key={h.id} hymn={h} ht={ht} nav={nav} favorites={favorites} toggleFavorite={toggleFavorite} getCatColor={getCatColor} setSongsHymn={setSongsHymn} />
                        ))}
                        <div style={{ marginBottom: 24 }} />
                      </>
                    );
                  })()}

                  {/* ── RECENT ── */}
                  {recentHymns.length > 0 && (
                    <>
                      <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12, display: "flex", alignItems: "center", gap: 8 }}>
                        <span>🕐</span> Recently Viewed
                      </div>
                      {recentHymns.slice(0, 5).map(id => {
                        const h = hymnIndex.hymns.find(hh => hh.id === id);
                        if (!h) return null;
                        return <HymnCard key={h.id} hymn={h} ht={ht} nav={nav} favorites={favorites} toggleFavorite={toggleFavorite} getCatColor={getCatColor} setSongsHymn={setSongsHymn} />;
                      })}
                      <div style={{ marginBottom: 24 }} />
                    </>
                  )}

                  {/* ── ALL HYMNS ── */}
                  <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12, display: "flex", alignItems: "center", gap: 8 }}>
                    <span>&#128220;</span> {langFilter === "all" ? "All Hymns" : `${HYMN_LANGUAGES.find(l => l.id === langFilter)?.label || ""} Hymns`} ({visibleHymns.length})
                  </div>
                  {visibleHymns.map(h => (
                    <HymnCard key={h.id} hymn={h} ht={ht} nav={nav} favorites={favorites} toggleFavorite={toggleFavorite} getCatColor={getCatColor} setSongsHymn={setSongsHymn} />
                  ))}
                </>
              )}
            </>
          )}
        </div>
      </div>
    );
  }

  // ═══════════════════════════════════════════════
  // SONGS CATEGORY
  // ═══════════════════════════════════════════════
  if (view === "songs-category") {
    const cat = HYMN_CATEGORIES.find(c => c.id === songsCategory);
    const allCatHymns = hymnIndex?.hymns?.filter(h => h.categories?.includes(songsCategory)) || [];
    const categoryHymns = allCatHymns.filter(h => langFilter === "all" || (h.lang || "en") === langFilter);
    const catLangs = [...new Set(allCatHymns.map(h => h.lang || "en"))];
    const activeCatLangs = (hymnIndex?.languages || []).filter(l => catLangs.includes(l.id));

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title={cat?.label || "Category"} subtitle={`${categoryHymns.length} hymn${categoryHymns.length !== 1 ? "s" : ""}`} theme={ht} />
        <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {indexLoading ? <Spinner t={ht} /> : allCatHymns.length === 0 ? (
            <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>No hymns in this category yet</div>
          ) : (
            <>
              {/* Category header card */}
              <div style={{ background: getCatColor(songsCategory).bg, border: `1px solid ${getCatColor(songsCategory).border}`, borderRadius: 14, padding: "16px 18px", marginBottom: 18, textAlign: "center" }}>
                <div style={{ fontSize: 36, marginBottom: 6 }}>{cat?.icon}</div>
                <div style={{ fontFamily: ht.heading, fontSize: 18, fontWeight: 700, color: getCatColor(songsCategory).text }}>{cat?.label}</div>
              </div>
              {/* Language filter within category */}
              {activeCatLangs.length > 1 && (
                <div style={{ display: "flex", gap: 8, overflowX: "auto", paddingBottom: 4, marginBottom: 16, WebkitOverflowScrolling: "touch", msOverflowStyle: "none", scrollbarWidth: "none" }}>
                  {[{ id: "all", nativeLabel: "All" }, ...activeCatLangs].map(lang => {
                    const active = langFilter === lang.id;
                    return (
                      <button key={lang.id} onClick={() => setLang(lang.id)}
                        style={{ padding: "7px 16px", borderRadius: 20, whiteSpace: "nowrap", border: `1px solid ${active ? ht.accent : ht.divider}`, background: active ? ht.accent : ht.card, color: active ? "#fff" : ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer", flexShrink: 0 }}>
                        {lang.nativeLabel}
                      </button>
                    );
                  })}
                </div>
              )}
              {categoryHymns.length === 0 ? (
                <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>No hymns in this language for this category</div>
              ) : null}
              {categoryHymns.map(h => (
                <HymnCard key={h.id} hymn={h} ht={ht} nav={nav} favorites={favorites} toggleFavorite={toggleFavorite} getCatColor={getCatColor} setSongsHymn={setSongsHymn} />
              ))}
            </>
          )}
        </div>
      </div>
    );
  }

  // ═══════════════════════════════════════════════
  // SONG DETAIL
  // ═══════════════════════════════════════════════
  if (view === "songs-detail") {
    const hymn = selectedHymn;
    const isFav = hymn ? favorites.includes(hymn.id) : false;

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title={hymn?.title || "Hymn"} theme={ht} />
        <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {hymnLoading || !hymn ? <Spinner t={ht} /> : (
            <>
              {/* ── HYMN HEADER ── */}
              <div style={{ background: ht.headerGradient, borderRadius: 16, padding: "22px 20px 18px", marginBottom: 16, position: "relative", overflow: "hidden" }}>
                <div style={{ position: "absolute", top: 0, right: 0, width: 150, height: 150, background: "radial-gradient(circle at top right, rgba(255,255,255,0.06), transparent)", borderRadius: "0 16px 0 150px" }} />
                <div style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700, color: ht.headerText, lineHeight: 1.3, marginBottom: hymn.titleRomanized ? 2 : 6 }}>{hymn.title}</div>
                {hymn.titleRomanized && <div style={{ fontFamily: ht.ui, fontSize: 14, color: "rgba(255,255,255,0.6)", marginBottom: 6 }}>{hymn.titleRomanized}</div>}
                <div style={{ fontFamily: ht.ui, fontSize: 12, color: "rgba(255,255,255,0.6)" }}>
                  {hymn.author}{hymn.year ? ` (${hymn.year})` : ""}
                  {hymn.composer ? ` \u00B7 Music: ${hymn.composer}` : ""}
                </div>
                {/* Category pills */}
                <div style={{ display: "flex", flexWrap: "wrap", gap: 6, marginTop: 10 }}>
                  {hymn.categories?.map(catId => {
                    const cat = HYMN_CATEGORIES.find(c => c.id === catId);
                    return cat ? (
                      <span key={catId} style={{ background: "rgba(255,255,255,0.12)", borderRadius: 20, padding: "3px 10px", fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: "rgba(255,255,255,0.8)" }}>{cat.icon} {cat.label}</span>
                    ) : null;
                  })}
                </div>
              </div>

              {/* ── ACTION BAR ── */}
              {(() => {
                const getLines = (s) => showRomanized && s.linesRomanized ? s.linesRomanized : s.lines;
                const titleText = showRomanized && hymn.titleRomanized ? hymn.titleRomanized : hymn.title;
                return (
                  <div style={{ display: "flex", gap: 8, marginBottom: 18 }}>
                    <button onClick={() => toggleFavorite(hymn.id)} style={{ flex: 1, display: "flex", alignItems: "center", justifyContent: "center", gap: 6, padding: "10px 12px", borderRadius: 10, border: `1px solid ${isFav ? ht.accent : ht.divider}`, background: isFav ? `${ht.accent}15` : ht.card, cursor: "pointer", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: isFav ? ht.accent : ht.muted }}>
                      {isFav ? "\u2764\uFE0F" : "\uD83E\uDD0D"} {isFav ? "Saved" : "Save"}
                    </button>
                    <button onClick={() => {
                      const text = `${titleText}\n${hymn.author}${hymn.year ? ` (${hymn.year})` : ""}\n\n${hymn.lyrics?.structure?.map(s => getLines(s).join("\n")).join("\n\n") || ""}`;
                      if (navigator.share) navigator.share({ title: titleText, text }).catch(() => {});
                      else { navigator.clipboard?.writeText(text); }
                    }} style={{ flex: 1, display: "flex", alignItems: "center", justifyContent: "center", gap: 6, padding: "10px 12px", borderRadius: 10, border: `1px solid ${ht.divider}`, background: ht.card, cursor: "pointer", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.muted }}>
                      {"\uD83D\uDCE4"} Share
                    </button>
                    <button onClick={() => {
                      const text = `${titleText}\n${hymn.author}\n\n${hymn.lyrics?.structure?.map(s => getLines(s).join("\n")).join("\n\n") || ""}`;
                      navigator.clipboard?.writeText(text);
                    }} style={{ flex: 1, display: "flex", alignItems: "center", justifyContent: "center", gap: 6, padding: "10px 12px", borderRadius: 10, border: `1px solid ${ht.divider}`, background: ht.card, cursor: "pointer", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.muted }}>
                      {"\uD83D\uDCCB"} Copy
                    </button>
                  </div>
                );
              })()}

              {/* ── LYRICS ── */}
              <Card t={ht} style={{ padding: "22px 20px", marginBottom: 16 }}>
                {/* Script toggle for native-language hymns */}
                {hymn.lyrics?.structure?.some(s => s.linesRomanized) && (
                  <div style={{ display: "flex", borderRadius: 10, border: `1px solid ${ht.divider}`, overflow: "hidden", marginBottom: 18 }}>
                    <button onClick={() => setShowRomanized(false)}
                      style={{ flex: 1, padding: "9px 0", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, border: "none", cursor: "pointer", background: !showRomanized ? ht.accent : ht.card, color: !showRomanized ? "#fff" : ht.muted }}>
                      Native Script
                    </button>
                    <button onClick={() => setShowRomanized(true)}
                      style={{ flex: 1, padding: "9px 0", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, border: "none", cursor: "pointer", background: showRomanized ? ht.accent : ht.card, color: showRomanized ? "#fff" : ht.muted }}>
                      Romanized
                    </button>
                  </div>
                )}
                {hymn.lyrics?.structure?.map((section, idx) => (
                  <div key={idx} style={{ marginBottom: idx < hymn.lyrics.structure.length - 1 ? 22 : 0 }}>
                    {/* Section label */}
                    <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: section.type === "chorus" ? ht.accent : ht.light, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 8 }}>
                      {section.type === "chorus" ? "Chorus" : `Verse ${section.number || idx + 1}`}
                    </div>
                    {/* Lines */}
                    <div style={{ fontFamily: ht.body, fontSize: 16, lineHeight: 1.85, color: ht.text, paddingLeft: section.type === "chorus" ? 16 : 0, borderLeft: section.type === "chorus" ? `3px solid ${ht.accent}40` : "none", fontStyle: section.type === "chorus" ? "italic" : "normal" }}>
                      {(showRomanized && section.linesRomanized ? section.linesRomanized : section.lines).map((line, li) => (
                        <div key={li}>{line}</div>
                      ))}
                    </div>
                  </div>
                ))}
              </Card>

              {/* ── STORY / BACKGROUND ── */}
              {hymn.story && (
                <Card t={ht} style={{ padding: "16px 18px", marginBottom: 16 }}>
                  <button onClick={() => setStoryExpanded(!storyExpanded)} style={{ width: "100%", display: "flex", alignItems: "center", justifyContent: "space-between", background: "none", border: "none", cursor: "pointer", padding: 0 }}>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.1em" }}>📖 The Story Behind This Hymn</div>
                    <span style={{ color: ht.muted, fontSize: 14, transform: storyExpanded ? "rotate(180deg)" : "rotate(0deg)", transition: "transform 0.2s" }}>▾</span>
                  </button>
                  {storyExpanded && (
                    <div style={{ fontFamily: ht.body, fontSize: 14, lineHeight: 1.8, color: ht.text, marginTop: 12 }}>{hymn.story}</div>
                  )}
                </Card>
              )}

              {/* ── SCRIPTURE REFERENCES ── */}
              {hymn.scriptureRefs?.length > 0 && (
                <Card t={ht} style={{ padding: "16px 18px", marginBottom: 16 }}>
                  <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.1em", marginBottom: 10 }}>✝️ Scripture References</div>
                  {hymn.scriptureRefs.map((ref, i) => (
                    <div key={i} style={{ display: "flex", gap: 10, padding: "8px 0", borderTop: i > 0 ? `1px dashed ${ht.divider}` : "none" }}>
                      <span style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.accent, whiteSpace: "nowrap" }}>{ref.ref}</span>
                      {ref.note && <span style={{ fontFamily: ht.body, fontSize: 12, color: ht.muted, fontStyle: "italic" }}>{ref.note}</span>}
                    </div>
                  ))}
                </Card>
              )}

              {/* ── SOURCE ── */}
              <div style={{ textAlign: "center", fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 8, padding: "8px 0" }}>
                Public Domain {hymn.source ? `\u00B7 ${hymn.source}` : ""}
              </div>
            </>
          )}
        </div>
      </div>
    );
  }

  // Fallback
  return null;
}

// ═══════════════════════════════════════════════════
// HYMN CARD (shared between home, category, search)
// ═══════════════════════════════════════════════════
function HymnCard({ hymn, ht, nav, favorites, toggleFavorite, getCatColor, setSongsHymn }) {
  const isFav = favorites.includes(hymn.id);
  const primaryCat = hymn.categories?.[0];
  const cc = getCatColor(primaryCat);

  return (
    <div
      onClick={() => { setSongsHymn(hymn.id); nav("songs-detail", { songsHymn: hymn.id }); }}
      className="pressable"
      style={{ background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12, padding: "14px 16px", marginBottom: 8, cursor: "pointer", display: "flex", alignItems: "center", gap: 12, borderLeft: `3px solid ${cc.border}` }}
    >
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 600, color: ht.dark, lineHeight: 1.3, overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{hymn.title}</div>
        {hymn.titleRomanized && <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light, marginTop: 1 }}>{hymn.titleRomanized}</div>}
        <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, marginTop: 2 }}>{hymn.author}{hymn.year ? ` \u00B7 ${hymn.year}` : ""}</div>
        <div style={{ fontFamily: ht.body, fontSize: 12, color: ht.light, marginTop: 4, fontStyle: "italic", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{hymn.firstLineRomanized || hymn.firstLine}</div>
      </div>
      <button
        onClick={e => { e.stopPropagation(); toggleFavorite(hymn.id); }}
        style={{ background: "none", border: "none", cursor: "pointer", fontSize: 16, padding: 4, flexShrink: 0, opacity: isFav ? 1 : 0.4 }}
      >
        {isFav ? "❤️" : "🤍"}
      </button>
    </div>
  );
}
