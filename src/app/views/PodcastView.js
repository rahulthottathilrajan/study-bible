"use client";
import { useState, useEffect, useRef, useCallback } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import PodcastPlayer from "../components/PodcastPlayer";
import { Spinner } from "../components/ui";
import { BIBLE_BOOKS } from "../constants";

const OT_BOOKS = BIBLE_BOOKS.filter(b => b.testament === "OT").map(b => b.name);

const formatDate = (dateStr) => {
  try {
    const d = new Date(dateStr + "T00:00:00");
    return d.toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });
  } catch { return dateStr; }
};

export default function PodcastView() {
  const {
    view, ht, bp, nav, goBack, darkMode, user,
    loadPodcastIndex, loadPodcastSeries, playPodcastEpisode,
    podcastListenedEpisodes, podcastVisible, currentEpisode,
    podcastSeries: selectedSeriesSlug, podcastEpisode: selectedEpNum,
  } = useApp();

  const [seriesIndex, setSeriesIndex] = useState(null);
  const [seriesData, setSeriesData] = useState(null);
  const [indexLoading, setIndexLoading] = useState(true);
  const [seriesLoading, setSeriesLoading] = useState(false);
  const indexLoaded = useRef(false);

  // Load index on podcast-home mount
  useEffect(() => {
    if (view === "podcast-home" && !indexLoaded.current) {
      indexLoaded.current = true;
      setIndexLoading(true);
      loadPodcastIndex().then(data => {
        setSeriesIndex(data);
        setIndexLoading(false);
      });
    }
  }, [view, loadPodcastIndex]);

  // Load series data when entering podcast-detail
  useEffect(() => {
    if (view === "podcast-detail" && selectedSeriesSlug) {
      setSeriesLoading(true);
      loadPodcastSeries(selectedSeriesSlug).then(data => {
        setSeriesData(data);
        setSeriesLoading(false);
      });
    }
  }, [view, selectedSeriesSlug, loadPodcastSeries]);

  // Also load series for podcast-episode if navigated directly
  useEffect(() => {
    if (view === "podcast-episode" && selectedSeriesSlug && !seriesData) {
      loadPodcastSeries(selectedSeriesSlug).then(setSeriesData);
    }
  }, [view, selectedSeriesSlug, seriesData, loadPodcastSeries]);

  // On refresh, redirect to safe podcast views if params are missing
  useEffect(() => {
    if ((view === "podcast-detail" || view === "podcast-episode") && !selectedSeriesSlug) {
      nav("podcast-home");
    } else if (view === "podcast-episode" && !currentEpisode && selectedSeriesSlug) {
      nav("podcast-detail", { podcastSeries: selectedSeriesSlug });
    }
  }, [view, currentEpisode, selectedSeriesSlug, nav]);

  const isListened = (slug, epNum) => podcastListenedEpisodes.includes(`${slug}:${epNum}`);

  // Bible reference navigation
  const handleBibleRef = useCallback((ref) => {
    if (!ref) return;
    const m = ref.match(/^(.+?)\s+(\d+):(.+)$/);
    if (!m) return;
    const bookName = m[1];
    const chapter = parseInt(m[2]);
    const verseNum = parseInt(m[3]);
    const testament = OT_BOOKS.includes(bookName) ? "OT" : "NT";
    nav("verses", { testament, book: bookName, chapter });
  }, [nav]);

  // Guard: wait for theme to be available
  if (!ht) return null;

  // ═══ PODCAST HOME ═══
  if (view === "podcast-home") {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Podcasts" subtitle="Listen & Learn" onBack={goBack} theme={ht} />
        <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {indexLoading ? (
            <div style={{ textAlign: "center", padding: 60 }}><Spinner color={ht.accent} /></div>
          ) : !seriesIndex?.series?.length ? (
            <div style={{ textAlign: "center", padding: 60, fontFamily: ht.body, color: ht.muted }}>
              No podcasts available yet. Check back soon!
            </div>
          ) : (
            <>
              {/* Section label */}
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14, display: "flex", alignItems: "center", gap: 8 }}>
                <span style={{ fontSize: 14 }}>&#x1F399;&#xFE0F;</span> Available Series
              </div>

              {seriesIndex.series.map(series => {
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
                      position: "relative", overflow: "hidden",
                    }}
                  >
                    {/* Artwork placeholder */}
                    <div style={{
                      width: 64, height: 64, borderRadius: 12, flexShrink: 0,
                      background: `linear-gradient(135deg, ${ht.accent}25, ${ht.accent}08)`,
                      display: "flex", alignItems: "center", justifyContent: "center",
                      fontSize: 28, border: `1px solid ${ht.accentBorder}`,
                    }}>
                      &#x1F399;&#xFE0F;
                    </div>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 2 }}>
                        <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: ht.dark }}>
                          {series.title}
                        </div>
                        {isNew && (
                          <span style={{
                            fontFamily: ht.ui, fontSize: 8, fontWeight: 800, color: "#fff",
                            background: ht.accent, borderRadius: 4, padding: "2px 5px",
                            textTransform: "uppercase", letterSpacing: "0.05em",
                          }}>NEW</span>
                        )}
                      </div>
                      <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.muted, lineHeight: 1.5, marginBottom: 4 }}>
                        {series.description.length > 80 ? series.description.slice(0, 80) + "..." : series.description}
                      </div>
                      <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light }}>
                        {series.host} · {series.episodeCount} episode{series.episodeCount !== 1 ? "s" : ""}
                      </div>
                    </div>
                    {/* Chevron */}
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
          <div style={{ textAlign: "center", padding: 60 }}><Spinner color={ht.accent} /></div>
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
                background: `linear-gradient(135deg, ${ht.accent}30, ${ht.accent}10)`,
                display: "flex", alignItems: "center", justifyContent: "center", fontSize: 28,
              }}>
                &#x1F399;&#xFE0F;
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
            return (
              <div key={ep.num}>
                <button
                  className="pressable"
                  onClick={() => {
                    playPodcastEpisode(seriesData.slug, ep.num, ep, seriesData.title, seriesData.artwork);
                    nav("podcast-episode", { podcastSeries: seriesData.slug, podcastEpisode: ep.num });
                  }}
                  style={{
                    width: "100%", textAlign: "left", cursor: "pointer",
                    border: "none", background: "transparent", padding: "14px 0",
                    display: "flex", alignItems: "center", gap: 12,
                  }}
                >
                  {/* Listened indicator */}
                  <div style={{
                    width: 28, height: 28, borderRadius: "50%", flexShrink: 0,
                    border: `2px solid ${listened ? "#22C55E" : ht.divider}`,
                    background: listened ? "#22C55E" : "transparent",
                    display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                    {listened ? (
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="3"><polyline points="20 6 9 17 4 12"/></svg>
                    ) : (
                      <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted }}>{ep.num}</span>
                    )}
                  </div>
                  {/* Episode info */}
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: ht.dark, marginBottom: 2 }}>
                      {ep.title}
                    </div>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light }}>
                      {formatDate(ep.date)} · {Math.ceil(ep.duration / 60)} min
                    </div>
                  </div>
                  {/* Play button */}
                  <div style={{
                    width: 34, height: 34, borderRadius: "50%", flexShrink: 0,
                    background: ht.accent, display: "flex", alignItems: "center", justifyContent: "center",
                  }}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff"><path d="M8 5v14l11-7z"/></svg>
                  </div>
                </button>
                {idx < episodes.length - 1 && (
                  <div style={{ height: 1, background: ht.divider, marginLeft: 40 }} />
                )}
              </div>
            );
          })}
        </div>
      </div>
    );
  }

  // ═══ PODCAST EPISODE (Player + Transcript) ═══
  if (view === "podcast-episode") {
    const ep = currentEpisode;
    if (!ep) {
      return (
        <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
          <Header title="Episode" onBack={goBack} theme={ht} />
          <div style={{ textAlign: "center", padding: 60 }}>
            <Spinner color={ht.accent} />
          </div>
        </div>
      );
    }

    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: podcastVisible ? 80 : 80 }}>
        <Header title={ep.seriesTitle || "Podcast"} subtitle={ep.title} onBack={goBack} theme={ht} />
        <div style={{ padding: `0 ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {/* Artwork hero */}
          <div style={{
            display: "flex", justifyContent: "center", marginTop: 20, marginBottom: 20,
          }}>
            <div style={{
              width: 180, height: 180, borderRadius: 20,
              background: `linear-gradient(135deg, ${ht.accent}20, ${ht.accent}08)`,
              display: "flex", alignItems: "center", justifyContent: "center",
              fontSize: 72, border: `2px solid ${ht.accentBorder}`,
              boxShadow: `0 8px 32px ${ht.accent}15`,
            }}>
              &#x1F399;&#xFE0F;
            </div>
          </div>

          {/* Episode title & info */}
          <div style={{ textAlign: "center", marginBottom: 20 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark, marginBottom: 4 }}>
              {ep.title}
            </div>
            <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.accent, fontWeight: 600, marginBottom: 8 }}>
              {ep.seriesTitle} · {Math.ceil(ep.duration / 60)} min
            </div>
            <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, lineHeight: 1.7, marginBottom: 8, maxWidth: 400, margin: "0 auto 8px" }}>
              {ep.description || ""}
            </div>
            {/* Bible reference */}
            {ep.bibleRef && (
              <button
                onClick={() => handleBibleRef(ep.bibleRef)}
                style={{
                  display: "inline-flex", alignItems: "center", gap: 6,
                  padding: "6px 14px", borderRadius: 20, cursor: "pointer",
                  border: `1px solid ${ht.accentBorder}`, background: `${ht.accent}08`,
                  fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.accent,
                }}
              >
                <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
                {ep.bibleRef}
              </button>
            )}
          </div>

          {/* Player */}
          <PodcastPlayer mode="full" />

          {/* Key Points */}
          {ep.keyPoints?.length > 0 && (
            <div style={{ marginTop: 8 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
                Key Points
              </div>
              {ep.keyPoints.map((point, i) => (
                <div key={i} style={{
                  display: "flex", gap: 10, alignItems: "flex-start", marginBottom: 8,
                }}>
                  <div style={{
                    width: 6, height: 6, borderRadius: "50%", background: ht.accent,
                    flexShrink: 0, marginTop: 6,
                  }} />
                  <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.dark, lineHeight: 1.6 }}>
                    {point}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  }

  return null;
}
