"use client";
import { useState, useEffect, useRef, useCallback, useMemo } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import PodcastPlayer from "../components/PodcastPlayer";
import { Spinner } from "../components/ui";
import { BIBLE_BOOKS, PODCAST_PALETTES } from "../constants";

const OT_BOOKS = BIBLE_BOOKS.filter(b => b.testament === "OT").map(b => b.name);
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;

const formatDate = (dateStr) => {
  try {
    const d = new Date(dateStr + "T00:00:00");
    return d.toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });
  } catch { return dateStr; }
};

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / (1000 * 60 * 60 * 24));
}

function getGreeting() {
  const h = new Date().getHours();
  return h < 12 ? "Good morning" : h < 17 ? "Good afternoon" : "Good evening";
}

const getPalette = (epNum) => PODCAST_PALETTES[(epNum - 1) % PODCAST_PALETTES.length];

// Read partial-listen progress from localStorage
const getEpisodeProgress = (slug, epNum, epDuration) => {
  try {
    const saved = JSON.parse(localStorage.getItem(`cr_podcast_${slug}_${epNum}`) || "null");
    if (saved && saved.timestamp > 0 && epDuration > 0) return Math.min(1, saved.timestamp / epDuration);
  } catch {} // eslint-disable-line no-empty
  return 0;
};

// Find the most recent partially-listened episode from localStorage
const findContinueListening = (slug, episodes) => {
  let best = null;
  for (const [num, ep] of Object.entries(episodes)) {
    try {
      const saved = JSON.parse(localStorage.getItem(`cr_podcast_${slug}_${num}`) || "null");
      if (saved && saved.timestamp > 0 && ep.duration > 0) {
        const prog = saved.timestamp / ep.duration;
        if (prog < 0.95 && (!best || saved.timestamp > (best.savedTime || 0))) {
          best = { epNum: parseInt(num), title: ep.title, duration: ep.duration, progress: prog, savedTime: saved.timestamp };
        }
      }
    } catch {} // eslint-disable-line no-empty
  }
  return best;
};

// ─── Flame Icon SVG (3 tiers by streak) ───
function FlameIcon({ streak, ht }) {
  const s = streak?.current || 0;
  if (s === 0) return null;
  const size = s >= 30 ? 22 : s >= 7 ? 18 : 15;
  const anim = s >= 30 ? "goldFlow 3s ease infinite" : s >= 7 ? "pulseGlow 2s ease-in-out infinite" : "none";
  return (
    <div style={{ display: "flex", alignItems: "center", gap: 4, animation: anim }}>
      <svg width={size} height={size} viewBox="0 0 24 24" fill="none">
        <path d="M12 2C6.5 8.5 4 12 4 15a8 8 0 0 0 16 0c0-3-2.5-6.5-8-13z" fill="#F59E0B" stroke="#D97706" strokeWidth="1"/>
        <path d="M12 9c-2 3-3 5-3 6.5a3 3 0 0 0 6 0c0-1.5-1-3.5-3-6.5z" fill="#FCD34D"/>
      </svg>
      <span style={{ fontFamily: ht.ui, fontSize: 13, fontWeight: 800, color: "#F59E0B" }}>{s}</span>
    </div>
  );
}

export default function PodcastView() {
  const {
    view, ht, bp, nav, goBack, darkMode, user, profile,
    podcastListenedEpisodes, podcastStreak,
    podcastVisible,
    podcastSeries: selectedSeriesSlug,
    podcastEpisode: selectedEpNum,
  } = useApp();

  // ─── Local data caches ───
  const indexCache = useRef(null);
  const seriesCache = useRef({});

  const [seriesIndex, setSeriesIndex] = useState(null);
  const [seriesData, setSeriesData] = useState(null);
  const [episodeData, setEpisodeData] = useState(null);
  const [indexLoading, setIndexLoading] = useState(true);
  const [seriesLoading, setSeriesLoading] = useState(false);
  const [fetchError, setFetchError] = useState(false);
  // For magazine home: featured series data
  const [featuredSeriesData, setFeaturedSeriesData] = useState(null);

  // ─── Local fetch: podcast index (with error/retry) ───
  const loadIndex = useCallback(async () => {
    if (indexCache.current) return indexCache.current;
    setFetchError(false);
    try {
      const res = await fetch("/data/podcasts/index.json");
      if (!res.ok) throw new Error("fetch failed");
      const data = await res.json();
      indexCache.current = data;
      return data;
    } catch {
      setFetchError(true);
      return null;
    }
  }, []);

  // ─── Local fetch: series data ───
  const loadSeries = useCallback(async (slug) => {
    if (seriesCache.current[slug]) return seriesCache.current[slug];
    try {
      const res = await fetch(`/data/podcasts/${slug}.json`);
      if (!res.ok) throw new Error("fetch failed");
      const data = await res.json();
      seriesCache.current[slug] = data;
      return data;
    } catch { return null; }
  }, []);

  // Load index + featured series on podcast-home
  useEffect(() => {
    if (view !== "podcast-home") return;
    setIndexLoading(true);
    loadIndex().then(async (data) => {
      setSeriesIndex(data);
      // Also load the first series for the featured episode hero
      if (data?.series?.length) {
        const sd = await loadSeries(data.series[0].slug);
        setFeaturedSeriesData(sd);
      }
      setIndexLoading(false);
    });
  }, [view, loadIndex, loadSeries]);

  // Load series on podcast-detail
  useEffect(() => {
    if (view !== "podcast-detail" || !selectedSeriesSlug) return;
    setSeriesLoading(true);
    loadSeries(selectedSeriesSlug).then(data => {
      setSeriesData(data);
      setSeriesLoading(false);
    });
  }, [view, selectedSeriesSlug, loadSeries]);

  // Load series + episode on podcast-episode
  useEffect(() => {
    if (view !== "podcast-episode" || !selectedSeriesSlug || !selectedEpNum) return;
    loadSeries(selectedSeriesSlug).then(data => {
      if (!data) return;
      setSeriesData(data);
      const ep = data.episodes[String(selectedEpNum)];
      if (ep) {
        setEpisodeData({
          ...ep,
          episodeNum: selectedEpNum,
          seriesSlug: selectedSeriesSlug,
          seriesTitle: data.title,
          audioUrl: `${SUPABASE_URL}/storage/v1/object/public/podcasts/${ep.audioFile}`,
        });
      }
    });
  }, [view, selectedSeriesSlug, selectedEpNum, loadSeries]);

  // Redirect safety
  useEffect(() => {
    if ((view === "podcast-detail" || view === "podcast-episode") && !selectedSeriesSlug) {
      nav("podcast-home");
    } else if (view === "podcast-episode" && !selectedEpNum && selectedSeriesSlug) {
      nav("podcast-detail", { podcastSeries: selectedSeriesSlug });
    }
  }, [view, selectedSeriesSlug, selectedEpNum, nav]);

  const isListened = (slug, epNum) => podcastListenedEpisodes.includes(`${slug}:${epNum}`);

  const handleBibleRef = useCallback((ref) => {
    if (!ref) return;
    const m = ref.match(/^(.+?)\s+(\d+):(.+)$/);
    if (!m) return;
    nav("verses", { testament: OT_BOOKS.includes(m[1]) ? "OT" : "NT", book: m[1], chapter: parseInt(m[2]) });
  }, [nav]);

  const retryIndex = useCallback(() => {
    indexCache.current = null;
    setIndexLoading(true);
    setFetchError(false);
    loadIndex().then(async (data) => {
      setSeriesIndex(data);
      if (data?.series?.length) {
        const sd = await loadSeries(data.series[0].slug);
        setFeaturedSeriesData(sd);
      }
      setIndexLoading(false);
    });
  }, [loadIndex, loadSeries]);

  // Guard
  if (!ht) return null;

  // ═══ PODCAST HOME — "Devotional Magazine" ═══
  if (view === "podcast-home") {
    // Compute featured episode (daily rotation)
    const featured = useMemo(() => {
      if (!featuredSeriesData?.episodes || !seriesIndex?.series?.length) return null;
      const slug = seriesIndex.series[0].slug;
      const eps = Object.entries(featuredSeriesData.episodes);
      if (!eps.length) return null;
      const dayIdx = getDayOfYear() % eps.length;
      const [num, ep] = eps.sort(([a], [b]) => parseInt(a) - parseInt(b))[dayIdx];
      const epNum = parseInt(num);
      return { ...ep, epNum, slug, seriesTitle: featuredSeriesData.title, palette: getPalette(epNum) };
    }, [featuredSeriesData, seriesIndex]);

    // Continue listening
    const continueEp = useMemo(() => {
      if (!featuredSeriesData?.episodes || !seriesIndex?.series?.length) return null;
      return findContinueListening(seriesIndex.series[0].slug, featuredSeriesData.episodes);
    }, [featuredSeriesData, seriesIndex]);

    const greeting = getGreeting();
    const firstName = profile?.nickname || profile?.full_name?.split(" ")[0] || "";

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Podcasts" subtitle="Daily Devotionals" onBack={goBack} theme={ht} />
        <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {indexLoading ? (
            <div style={{ textAlign: "center", padding: 60 }}><Spinner t={ht} /></div>
          ) : fetchError ? (
            <div style={{ textAlign: "center", padding: 60 }}>
              <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, marginBottom: 16 }}>
                Couldn't load podcasts. Check your connection and try again.
              </div>
              <button onClick={retryIndex} style={{
                padding: "8px 20px", borderRadius: 10, border: "none",
                background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer",
              }}>
                Retry
              </button>
            </div>
          ) : !seriesIndex?.series?.length ? (
            <div style={{ textAlign: "center", padding: 60, fontFamily: ht.body, color: ht.muted }}>
              No podcasts available yet. Check back soon!
            </div>
          ) : (
            <>
              {/* ── Greeting + Streak ── */}
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 20, animation: "fadeIn 0.3s ease-out both" }}>
                <div>
                  <div style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700, color: ht.dark, lineHeight: 1.2 }}>
                    {greeting}{firstName ? `, ${firstName}` : ""}
                  </div>
                  <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted, marginTop: 4 }}>
                    Your daily word is waiting
                  </div>
                </div>
                <FlameIcon streak={podcastStreak} ht={ht} />
              </div>

              {/* ── Featured Episode Hero ── */}
              {featured && (
                <button
                  className="pressable"
                  onClick={() => nav("podcast-episode", { podcastSeries: featured.slug, podcastEpisode: featured.epNum })}
                  style={{
                    width: "100%", border: "none", cursor: "pointer", textAlign: "left",
                    borderRadius: 20, padding: 0, marginBottom: 20, overflow: "hidden",
                    boxShadow: `0 8px 32px ${featured.palette.accent}30`,
                    animation: "fadeIn 0.4s ease-out 0.1s both",
                  }}
                >
                  <div style={{
                    background: featured.palette.bg, padding: "28px 22px", position: "relative",
                  }}>
                    {/* Decorative orbs */}
                    <div style={{ position: "absolute", top: -30, right: -30, width: 100, height: 100, borderRadius: "50%", background: "rgba(255,255,255,0.05)" }} />
                    <div style={{ position: "absolute", bottom: -15, left: -15, width: 60, height: 60, borderRadius: "50%", background: "rgba(255,255,255,0.03)" }} />

                    <div style={{ fontFamily: "system-ui", fontSize: 9, fontWeight: 800, color: featured.palette.hint, textTransform: "uppercase", letterSpacing: "0.2em", marginBottom: 8 }}>
                      Episode {featured.epNum} · Today&apos;s Word
                    </div>
                    <div style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700, color: featured.palette.text, lineHeight: 1.3, marginBottom: 10 }}>
                      {featured.title}
                    </div>
                    <div style={{ fontFamily: ht.body, fontSize: 13, color: `${featured.palette.text}99`, lineHeight: 1.6, marginBottom: 16, maxHeight: 40, overflow: "hidden" }}>
                      {featured.description || ""}
                    </div>
                    <div style={{ display: "flex", alignItems: "center", gap: 10, flexWrap: "wrap" }}>
                      {/* Listen Now button */}
                      <div style={{
                        display: "inline-flex", alignItems: "center", gap: 8,
                        padding: "10px 20px", borderRadius: 24,
                        background: featured.palette.accent, color: "#fff",
                        fontFamily: ht.ui, fontSize: 13, fontWeight: 700,
                        animation: "pulseGlow 2.5s ease-in-out infinite",
                      }}>
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff"><path d="M8 5v14l11-7z"/></svg>
                        {isListened(featured.slug, featured.epNum) ? "Listen Again" : "Listen Now"}
                      </div>
                      {/* Duration pill */}
                      <span style={{
                        fontFamily: ht.ui, fontSize: 11, fontWeight: 600,
                        color: featured.palette.hint, background: `${featured.palette.accent}20`,
                        padding: "4px 10px", borderRadius: 12,
                      }}>
                        {Math.ceil(featured.duration / 60)} min
                      </span>
                      {/* Bible ref */}
                      {featured.bibleRef && (
                        <span style={{
                          fontFamily: ht.ui, fontSize: 11, fontWeight: 600,
                          color: featured.palette.ref,
                        }}>
                          {featured.bibleRef}
                        </span>
                      )}
                    </div>
                    {/* Listened badge */}
                    {isListened(featured.slug, featured.epNum) && (
                      <div style={{
                        position: "absolute", top: 16, right: 16, display: "flex", alignItems: "center", gap: 4,
                        padding: "3px 8px", borderRadius: 8, background: "rgba(34,197,94,0.2)",
                        fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: "#22C55E",
                      }}>
                        <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="#22C55E" strokeWidth="3"><polyline points="20 6 9 17 4 12"/></svg>
                        Listened
                      </div>
                    )}
                  </div>
                </button>
              )}

              {/* ── Continue Listening ── */}
              {continueEp && seriesIndex?.series?.[0] && (
                <div style={{ marginBottom: 20, animation: "fadeIn 0.3s ease-out 0.2s both" }}>
                  <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
                    Pick Up Where You Left Off
                  </div>
                  <button
                    className="pressable"
                    onClick={() => nav("podcast-episode", { podcastSeries: seriesIndex.series[0].slug, podcastEpisode: continueEp.epNum })}
                    style={{
                      width: "100%", textAlign: "left", cursor: "pointer", border: "none",
                      background: ht.card, borderRadius: 14, padding: 14, display: "flex", alignItems: "center", gap: 12,
                      boxShadow: `0 1px 4px ${darkMode ? "rgba(0,0,0,0.3)" : "rgba(0,0,0,0.06)"}`,
                    }}
                  >
                    <div style={{
                      width: 44, height: 44, borderRadius: 10, flexShrink: 0,
                      background: getPalette(continueEp.epNum).bg,
                      display: "flex", alignItems: "center", justifyContent: "center",
                      fontFamily: "system-ui", fontSize: 18, fontWeight: 800, color: "#fff",
                    }}>
                      {continueEp.epNum}
                    </div>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: ht.dark, marginBottom: 4 }}>
                        {continueEp.title}
                      </div>
                      {/* Progress bar */}
                      <div style={{ height: 3, background: ht.divider, borderRadius: 2 }}>
                        <div style={{ height: "100%", width: `${continueEp.progress * 100}%`, background: ht.accent, borderRadius: 2 }} />
                      </div>
                    </div>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill={ht.accent}><path d="M8 5v14l11-7z"/></svg>
                  </button>
                </div>
              )}

              {/* ── Browse Series ── */}
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14, animation: "fadeIn 0.3s ease-out 0.3s both" }}>
                Browse Series
              </div>
              {seriesIndex.series.map((series, idx) => {
                const isNew = series.latestDate && (Date.now() - new Date(series.latestDate).getTime()) < 7 * 86400000;
                return (
                  <button
                    key={series.slug}
                    className="pressable"
                    onClick={() => nav("podcast-detail", { podcastSeries: series.slug })}
                    style={{
                      width: "100%", textAlign: "left", cursor: "pointer", border: "none",
                      background: ht.card, borderRadius: 14, padding: 16, marginBottom: 12,
                      display: "flex", alignItems: "center", gap: 14,
                      boxShadow: `0 1px 4px ${darkMode ? "rgba(0,0,0,0.3)" : "rgba(0,0,0,0.06)"}`,
                      animation: `fadeIn 0.3s ease-out ${0.35 + idx * 0.05}s both`,
                    }}
                  >
                    <div style={{
                      width: 56, height: 56, borderRadius: 12, flexShrink: 0,
                      background: PODCAST_PALETTES[0].bg,
                      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
                    }}>
                      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.9)" strokeWidth="1.5">
                        <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                        <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                        <line x1="12" y1="19" x2="12" y2="23"/><line x1="8" y1="23" x2="16" y2="23"/>
                      </svg>
                      <div style={{ fontFamily: "system-ui", fontSize: 7, fontWeight: 800, color: "rgba(255,255,255,0.7)", textTransform: "uppercase", letterSpacing: "0.1em", marginTop: 1 }}>
                        {series.episodeCount} EP
                      </div>
                    </div>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 2 }}>
                        <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: ht.dark }}>{series.title}</div>
                        {isNew && (
                          <span style={{ fontFamily: ht.ui, fontSize: 8, fontWeight: 800, color: "#fff", background: ht.accent, borderRadius: 4, padding: "2px 5px", textTransform: "uppercase", letterSpacing: "0.05em" }}>NEW</span>
                        )}
                      </div>
                      <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.muted, lineHeight: 1.5 }}>
                        {series.description.length > 80 ? series.description.slice(0, 80) + "..." : series.description}
                      </div>
                    </div>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={ht.light} strokeWidth="2"><polyline points="9 18 15 12 9 6"/></svg>
                  </button>
                );
              })}
            </>
          )}
        </div>
      </div>
    );
  }

  // ═══ PODCAST DETAIL (Series Page) ═══
  if (view === "podcast-detail") {
    if (seriesLoading || !seriesData) {
      return (
        <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
          <Header title="Series" onBack={goBack} theme={ht} />
          <div style={{ textAlign: "center", padding: 60 }}><Spinner t={ht} /></div>
        </div>
      );
    }

    const episodes = Object.entries(seriesData.episodes)
      .map(([num, ep]) => ({ num: parseInt(num), ...ep }))
      .sort((a, b) => b.num - a.num);

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title={seriesData.title} onBack={goBack} theme={ht} />
        <div style={{ padding: `0 ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {/* Series header */}
          <div style={{
            background: `linear-gradient(135deg, ${ht.accent}18, ${ht.accent}06)`,
            borderRadius: 16, padding: 20, marginBottom: 20, marginTop: 16,
            border: `1px solid ${ht.accentBorder}`,
          }}>
            <div style={{ display: "flex", alignItems: "center", gap: 14, marginBottom: 12 }}>
              <div style={{
                width: 56, height: 56, borderRadius: 14, flexShrink: 0,
                background: PODCAST_PALETTES[0].bg,
                display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
              }}>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.9)" strokeWidth="1.5">
                  <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"/>
                  <path d="M19 10v2a7 7 0 0 1-14 0v-2"/>
                  <line x1="12" y1="19" x2="12" y2="23"/><line x1="8" y1="23" x2="16" y2="23"/>
                </svg>
              </div>
              <div>
                <div style={{ fontFamily: ht.heading, fontSize: 18, fontWeight: 700, color: ht.dark }}>{seriesData.title}</div>
                <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.accent, fontWeight: 600 }}>{seriesData.host}</div>
              </div>
            </div>
            <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, lineHeight: 1.7 }}>
              {seriesData.description}
            </div>
          </div>

          {/* Episode list */}
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12 }}>
            Episodes ({episodes.length})
          </div>

          {episodes.map((ep, idx) => {
            const listened = isListened(seriesData.slug, ep.num);
            const prog = !listened ? getEpisodeProgress(seriesData.slug, ep.num, ep.duration) : 0;
            const pal = getPalette(ep.num);
            return (
              <div key={ep.num} style={{ animation: `fadeIn 0.3s ease-out ${idx * 0.05}s both` }}>
                <button
                  className="pressable"
                  onClick={() => nav("podcast-episode", { podcastSeries: seriesData.slug, podcastEpisode: ep.num })}
                  style={{
                    width: "100%", textAlign: "left", cursor: "pointer",
                    border: "none", background: "transparent", padding: "14px 0",
                    display: "flex", alignItems: "center", gap: 12,
                  }}
                >
                  {/* Episode palette circle */}
                  <div style={{
                    width: 32, height: 32, borderRadius: "50%", flexShrink: 0,
                    background: listened ? "#22C55E" : pal.bg,
                    border: listened ? "none" : `1px solid ${pal.accent}40`,
                    display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                    {listened ? (
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="3"><polyline points="20 6 9 17 4 12"/></svg>
                    ) : (
                      <span style={{ fontFamily: "system-ui", fontSize: 11, fontWeight: 800, color: pal.text }}>{ep.num}</span>
                    )}
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: ht.dark, marginBottom: 2 }}>
                      {ep.title}
                    </div>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light }}>
                      {formatDate(ep.date)} · {Math.ceil(ep.duration / 60)} min
                    </div>
                  </div>
                  <div style={{
                    width: 34, height: 34, borderRadius: "50%", flexShrink: 0,
                    background: pal.accent, display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff"><path d="M8 5v14l11-7z"/></svg>
                  </div>
                </button>
                {prog > 0 && (
                  <div style={{ height: 2, background: ht.divider, marginLeft: 44, marginTop: -4, marginBottom: 4, borderRadius: 1 }}>
                    <div style={{ height: "100%", width: `${prog * 100}%`, background: pal.accent, borderRadius: 1 }} />
                  </div>
                )}
                {idx < episodes.length - 1 && (
                  <div style={{ height: 1, background: ht.divider, marginLeft: 44 }} />
                )}
              </div>
            );
          })}
        </div>
      </div>
    );
  }

  // ═══ PODCAST EPISODE (Player + Transcript + Up Next) ═══
  if (view === "podcast-episode") {
    if (!episodeData) {
      return (
        <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
          <Header title="Episode" onBack={goBack} theme={ht} />
          <div style={{ textAlign: "center", padding: 60 }}><Spinner t={ht} /></div>
        </div>
      );
    }

    const pal = getPalette(episodeData.episodeNum);

    // Up Next episodes
    const upNext = seriesData?.episodes ? Object.entries(seriesData.episodes)
      .map(([num, ep]) => ({ num: parseInt(num), ...ep }))
      .filter(ep => ep.num > episodeData.episodeNum)
      .sort((a, b) => a.num - b.num)
      .slice(0, 3) : [];

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title={episodeData.seriesTitle || "Podcast"} subtitle={episodeData.title} onBack={goBack} theme={ht} />
        <div style={{ padding: `0 ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {/* Episode palette artwork hero */}
          <div style={{ display: "flex", justifyContent: "center", marginTop: 20, marginBottom: 20 }}>
            <div style={{
              width: 180, height: 180, borderRadius: 20,
              background: pal.bg,
              display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
              boxShadow: `0 8px 32px ${pal.accent}30`,
              position: "relative", overflow: "hidden",
              animation: "scaleIn 0.4s ease-out both",
            }}>
              <div style={{ position: "absolute", top: -20, right: -20, width: 80, height: 80, borderRadius: "50%", background: "rgba(255,255,255,0.06)" }} />
              <div style={{ position: "absolute", bottom: -10, left: -10, width: 50, height: 50, borderRadius: "50%", background: "rgba(255,255,255,0.04)" }} />
              <div style={{ fontFamily: "system-ui", fontSize: 11, fontWeight: 700, color: pal.hint, textTransform: "uppercase", letterSpacing: "0.15em" }}>
                Episode
              </div>
              <div style={{ fontFamily: "system-ui", fontSize: 56, fontWeight: 800, color: pal.text, lineHeight: 1 }}>
                {episodeData.episodeNum}
              </div>
              <div style={{ fontFamily: "system-ui", fontSize: 10, color: `${pal.text}80`, marginTop: 4 }}>
                {Math.ceil(episodeData.duration / 60)} min
              </div>
            </div>
          </div>

          {/* Episode title & info */}
          <div style={{ textAlign: "center", marginBottom: 20 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark, marginBottom: 4 }}>
              {episodeData.title}
            </div>
            <div style={{ fontFamily: ht.ui, fontSize: 12, color: pal.accent, fontWeight: 600, marginBottom: 8 }}>
              {episodeData.seriesTitle} · {Math.ceil(episodeData.duration / 60)} min
            </div>
            <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, lineHeight: 1.7, maxWidth: 400, margin: "0 auto 8px" }}>
              {episodeData.description || ""}
            </div>
            {episodeData.bibleRef && (
              <button
                onClick={() => handleBibleRef(episodeData.bibleRef)}
                style={{
                  display: "inline-flex", alignItems: "center", gap: 6,
                  padding: "6px 14px", borderRadius: 20, cursor: "pointer",
                  border: `1px solid ${pal.accent}40`, background: `${pal.accent}10`,
                  fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: pal.accent,
                }}
              >
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
                {episodeData.bibleRef}
              </button>
            )}
          </div>

          {/* Player */}
          <PodcastPlayer
            mode="full"
            episode={episodeData}
            seriesData={seriesData}
            onNavigateEpisode={(epNum) => nav("podcast-episode", { podcastSeries: selectedSeriesSlug, podcastEpisode: epNum })}
          />

          {/* Key Points */}
          {episodeData.keyPoints?.length > 0 && (
            <div style={{ marginTop: 8 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
                Key Points
              </div>
              {episodeData.keyPoints.map((point, i) => (
                <div key={i} style={{ display: "flex", gap: 10, alignItems: "flex-start", marginBottom: 8 }}>
                  <div style={{ width: 6, height: 6, borderRadius: "50%", background: pal.accent, flexShrink: 0, marginTop: 6 }} />
                  <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.dark, lineHeight: 1.6 }}>{point}</div>
                </div>
              ))}
            </div>
          )}

          {/* Up Next */}
          {upNext.length > 0 && (
            <div style={{ marginTop: 24 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12 }}>
                Up Next
              </div>
              <div style={{ display: "flex", gap: 12, overflowX: "auto", paddingBottom: 8 }} className="goto-wheel">
                {upNext.map(ep => {
                  const epPal = getPalette(ep.num);
                  return (
                    <button
                      key={ep.num}
                      className="pressable"
                      onClick={() => nav("podcast-episode", { podcastSeries: selectedSeriesSlug, podcastEpisode: ep.num })}
                      style={{
                        minWidth: 140, maxWidth: 160, flexShrink: 0, border: "none", cursor: "pointer",
                        borderRadius: 14, overflow: "hidden", textAlign: "left",
                        boxShadow: `0 2px 8px ${darkMode ? "rgba(0,0,0,0.3)" : "rgba(0,0,0,0.08)"}`,
                      }}
                    >
                      <div style={{
                        background: epPal.bg, padding: "16px 14px 12px",
                        display: "flex", flexDirection: "column", alignItems: "center",
                      }}>
                        <div style={{ fontFamily: "system-ui", fontSize: 28, fontWeight: 800, color: epPal.text }}>{ep.num}</div>
                        <div style={{ fontFamily: "system-ui", fontSize: 8, fontWeight: 700, color: epPal.hint, textTransform: "uppercase", letterSpacing: "0.1em" }}>
                          Episode
                        </div>
                      </div>
                      <div style={{ padding: "10px 12px", background: ht.card }}>
                        <div style={{ fontFamily: ht.heading, fontSize: 12, fontWeight: 700, color: ht.dark, lineHeight: 1.3, marginBottom: 4, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
                          {ep.title}
                        </div>
                        <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
                          {Math.ceil(ep.duration / 60)} min
                        </div>
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {/* KJV Attribution */}
          <div style={{
            marginTop: 24, paddingTop: 16, borderTop: `1px dashed ${ht.divider}`,
            fontFamily: ht.ui, fontSize: 10, color: ht.light, textAlign: "center", lineHeight: 1.6,
          }}>
            Scripture quotations from the King James Version (Public Domain)
          </div>
        </div>
      </div>
    );
  }

  return null;
}
