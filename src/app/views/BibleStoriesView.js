"use client";
import { useState, useEffect, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import Header from "../components/Header";
import { ChevIcon, Spinner } from "../components/ui";
import StoryReader from "../components/StoryReader";

/* ═══════════════════════════════════════════════════════════════
   BibleStoriesView — Manga-style Bible story experience
   Sub-views: stories-home, stories-series, stories-detail, stories-reader
   ═══════════════════════════════════════════════════════════════ */

// Story-specific theme (deep purple + gold)
const BS_LIGHT = { bg: "#FAF5FF", card: "#fff", text: "#2a1a10", muted: "#8B7355", accent: "#5B2D8E", accentLight: "#5B2D8E12", accentBorder: "#5B2D8E30", divider: "#E8E0D8", heading: "'Playfair Display','DM Serif Display',serif", body: "'Lora',serif", ui: "'Outfit',sans-serif", headerGradient: "linear-gradient(135deg, #2D1548 0%, #5B2D8E 50%, #3D1F6B 100%)", headerText: "#F5E6CC" };
const BS_DARK = { bg: "#0D0818", card: "#1A1028", text: "#F5E6CC", muted: "#A89070", accent: "#D4A853", accentLight: "#D4A85315", accentBorder: "#D4A85330", divider: "#2A2035", heading: "'Playfair Display','DM Serif Display',serif", body: "'Lora',serif", ui: "'Outfit',sans-serif", headerGradient: "linear-gradient(135deg, #1A0A2E 0%, #2D1548 50%, #0D0818 100%)", headerText: "#F5E6CC" };

export default function BibleStoriesView() {
  const { view, darkMode, nav, goBack, bp, storyId, storyEpisode } = useApp();
  const t = darkMode ? BS_DARK : BS_LIGHT;

  const [storyIndex, setStoryIndex] = useState(null);
  const [storyData, setStoryData] = useState(null);
  const [loading, setLoading] = useState(false);
  const [selectedSeries, setSelectedSeries] = useState(null);
  const [episodeIdx, setEpisodeIdx] = useState(0);

  // Load story index
  useEffect(() => {
    fetch("/data/bible-stories/index.json")
      .then(r => r.json())
      .then(d => setStoryIndex(d))
      .catch(() => {});
  }, []);

  // Load individual story data when entering reader or detail
  const loadStory = useCallback(async (id) => {
    if (storyData?.id === id) return storyData;
    setLoading(true);
    try {
      const r = await fetch(`/data/bible-stories/${id}.json`);
      const d = await r.json();
      setStoryData(d);
      setLoading(false);
      return d;
    } catch {
      setLoading(false);
      return null;
    }
  }, [storyData]);

  // Handle navigation from AppContext
  useEffect(() => {
    if (view === "stories-reader" && storyId) {
      loadStory(storyId).then(() => setEpisodeIdx(storyEpisode || 0));
    } else if (view === "stories-detail" && storyId) {
      loadStory(storyId);
    }
  }, [view, storyId, storyEpisode, loadStory]);

  // Get completed episodes for a story
  const getCompleted = (id) => {
    if (typeof window === "undefined") return [];
    return JSON.parse(localStorage.getItem(`story_completed_${id}`) || "[]");
  };

  // ── STORIES HOME ──
  if (view === "stories-home") {
    if (!storyIndex) return <div style={{ minHeight: "100vh", background: t.bg }}><Spinner t={t} /></div>;
    return (
      <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 80 }}>
        <Header title="Bible Stories" subtitle="Manga-style visual storytelling" onBack={goBack} theme={t} />
        <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>

          {/* Hero banner */}
          <div style={{
            background: t.headerGradient, borderRadius: 16, padding: "28px 22px",
            marginBottom: 24, position: "relative", overflow: "hidden",
          }}>
            {/* Paint splashes */}
            <div style={{ position: "absolute", top: "10%", right: "5%", width: 120, height: 100, borderRadius: "50%", background: "rgba(212,168,83,0.12)", filter: "blur(30px)", pointerEvents: "none" }} />
            <div style={{ position: "absolute", bottom: "10%", left: "10%", width: 100, height: 80, borderRadius: "50%", background: "rgba(155,89,182,0.15)", filter: "blur(25px)", pointerEvents: "none" }} />

            <div style={{
              fontFamily: t.heading, fontSize: 24, fontWeight: 900, color: "#F5E6CC",
              marginBottom: 8, position: "relative",
              textShadow: "0 0 30px rgba(212,168,83,0.3), 0 2px 4px rgba(0,0,0,0.3)",
            }}>Bible Stories</div>
            <div style={{
              fontFamily: t.body, fontSize: 13, color: "rgba(245,230,200,0.8)",
              fontStyle: "italic", lineHeight: 1.6, position: "relative",
            }}>
              Immersive manga-style visual stories for kids, teens, and adults.
              Experience Scripture like never before.
            </div>

            {/* Three crosses */}
            <div style={{
              position: "absolute", bottom: 12, right: 20, display: "flex",
              gap: 10, alignItems: "flex-end", opacity: 0.12,
            }}>
              {[18, 28, 18].map((h, i) => (
                <div key={i} style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
                  <div style={{ width: i === 1 ? 12 : 8, height: 2, background: "#D4A853" }} />
                  <div style={{ width: 2, height: h, background: "#D4A853" }} />
                </div>
              ))}
            </div>
          </div>

          {/* Series list */}
          {storyIndex.series.map(series => (
            <div key={series.id} style={{ marginBottom: 24 }}>
              {/* Series header */}
              <button onClick={() => setSelectedSeries(selectedSeries === series.id ? null : series.id)} style={{
                display: "flex", alignItems: "center", gap: 10, width: "100%",
                background: "transparent", border: "none", cursor: "pointer",
                padding: "0 0 10px", textAlign: "left",
              }}>
                <span style={{ fontSize: 22 }}>{series.icon}</span>
                <div style={{ flex: 1 }}>
                  <div style={{
                    fontFamily: t.heading, fontSize: 17, fontWeight: 700, color: t.text,
                  }}>{series.title}</div>
                  <div style={{
                    fontFamily: t.ui, fontSize: 11, color: t.muted,
                  }}>{series.description} · {series.stories.length} stories</div>
                </div>
                <div style={{
                  transform: selectedSeries === series.id ? "rotate(90deg)" : "none",
                  transition: "transform 0.2s", color: t.muted,
                }}><ChevIcon /></div>
              </button>

              {/* Story cards (always show first, expandable for rest) */}
              <div style={{
                display: "grid", gridTemplateColumns: "1fr", gap: 10,
                maxHeight: selectedSeries === series.id ? 2000 : 0,
                overflow: "hidden", transition: "max-height 0.4s ease",
              }}>
                {series.stories.map(story => {
                  const completed = getCompleted(story.id);
                  const isComplete = completed.length > 0 && completed.length >= story.episodes;
                  const hasProgress = completed.length > 0;
                  return (
                    <button
                      key={story.id}
                      onClick={() => {
                        if (!story.comingSoon) {
                          nav("stories-detail", { storyId: story.id });
                        }
                      }}
                      style={{
                        display: "flex", alignItems: "center", gap: 14,
                        padding: "14px 16px", borderRadius: 14,
                        background: t.card, border: `1px solid ${t.divider}`,
                        cursor: story.comingSoon ? "default" : "pointer",
                        opacity: story.comingSoon ? 0.55 : 1,
                        textAlign: "left", width: "100%",
                        boxShadow: "0 1px 4px rgba(0,0,0,0.04)",
                      }}
                    >
                      {/* Color swatch */}
                      <div style={{
                        width: 44, height: 44, borderRadius: 12, flexShrink: 0,
                        background: `linear-gradient(135deg, ${story.colorUniverse.primary} 0%, ${story.colorUniverse.accent} 100%)`,
                        display: "flex", alignItems: "center", justifyContent: "center",
                        boxShadow: `0 2px 8px ${story.colorUniverse.primary}40`,
                      }}>
                        {isComplete
                          ? <span style={{ fontSize: 18 }}>{"\u2713"}</span>
                          : <span style={{ fontSize: 16, color: "rgba(255,255,255,0.8)" }}>{series.icon}</span>
                        }
                      </div>

                      <div style={{ flex: 1, minWidth: 0 }}>
                        <div style={{
                          fontFamily: t.heading, fontSize: 14, fontWeight: 700,
                          color: t.text, marginBottom: 2,
                          overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap",
                        }}>{story.title}</div>
                        <div style={{
                          fontFamily: t.ui, fontSize: 11, color: t.muted,
                        }}>
                          {story.comingSoon ? "Coming soon" : `${story.episodes} episodes`}
                          {hasProgress && !story.comingSoon && ` · ${completed.length}/${story.episodes} done`}
                        </div>
                      </div>

                      {!story.comingSoon && (
                        <div style={{ color: t.muted, flexShrink: 0 }}><ChevIcon /></div>
                      )}
                    </button>
                  );
                })}
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  }

  // ── STORY DETAIL ──
  if (view === "stories-detail") {
    if (loading || !storyData) return <div style={{ minHeight: "100vh", background: t.bg }}><Spinner t={t} /></div>;
    const cu = storyData.colorUniverse;
    const completed = getCompleted(storyData.id);

    return (
      <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 80 }}>
        {/* Hero header with story color */}
        <div style={{
          background: `linear-gradient(135deg, ${cu.darkBg} 0%, ${cu.primary}60 50%, ${cu.darkBg} 100%)`,
          padding: "20px 16px 28px", position: "relative", overflow: "hidden",
        }}>
          {/* Paint splashes */}
          <div style={{ position: "absolute", top: "20%", right: "10%", width: 150, height: 120, borderRadius: "50%", background: cu.secondary + "15", filter: "blur(30px)", pointerEvents: "none" }} />
          <div style={{ position: "absolute", bottom: "10%", left: "5%", width: 120, height: 100, borderRadius: "50%", background: cu.accent + "20", filter: "blur(25px)", pointerEvents: "none" }} />

          {/* Back button */}
          <button onClick={goBack} style={{
            background: "none", border: "none", cursor: "pointer",
            color: cu.secondary, display: "flex", alignItems: "center", gap: 6,
            fontFamily: t.ui, fontSize: 12, padding: "0 0 16px", position: "relative", zIndex: 2,
          }}>
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
            Back
          </button>

          {/* Title */}
          <div style={{ position: "relative", zIndex: 2 }}>
            <h1 style={{
              fontFamily: t.heading, fontSize: 28, fontWeight: 900, color: "#F5E6CC",
              margin: "0 0 6px",
              textShadow: `0 0 30px ${cu.secondary}40, 0 2px 4px rgba(0,0,0,0.3)`,
            }}>{storyData.title}</h1>
            <p style={{
              fontFamily: t.body, fontSize: 14, color: cu.secondary + "CC",
              fontStyle: "italic", margin: 0,
            }}>{storyData.subtitle}</p>
          </div>

          {/* Progress */}
          <div style={{
            marginTop: 16, display: "flex", alignItems: "center", gap: 10,
            position: "relative", zIndex: 2,
          }}>
            <div style={{
              flex: 1, height: 4, borderRadius: 2, background: "rgba(255,255,255,0.1)",
            }}>
              <div style={{
                height: "100%", borderRadius: 2, background: cu.secondary,
                width: `${(completed.length / storyData.episodes.length) * 100}%`,
                transition: "width 0.5s ease",
              }} />
            </div>
            <span style={{
              fontFamily: t.ui, fontSize: 10, color: cu.secondary + "AA", fontWeight: 700,
            }}>{completed.length}/{storyData.episodes.length}</span>
          </div>
        </div>

        {/* Episode list */}
        <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          <div style={{
            fontFamily: t.ui, fontSize: 10, fontWeight: 800, color: t.muted,
            textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14,
          }}>Episodes</div>

          {storyData.episodes.map((ep, idx) => {
            const isDone = completed.includes(ep.id);
            return (
              <button
                key={ep.id}
                onClick={() => {
                  setEpisodeIdx(idx);
                  nav("stories-reader", { storyId: storyData.id, storyEpisode: idx });
                }}
                style={{
                  display: "flex", alignItems: "center", gap: 14, width: "100%",
                  padding: "16px", marginBottom: 10, borderRadius: 14,
                  background: t.card, border: `1px solid ${t.divider}`,
                  cursor: "pointer", textAlign: "left",
                  boxShadow: "0 1px 4px rgba(0,0,0,0.04)",
                }}
              >
                {/* Episode number circle */}
                <div style={{
                  width: 38, height: 38, borderRadius: "50%", flexShrink: 0,
                  background: isDone
                    ? `linear-gradient(135deg, ${cu.accent} 0%, ${cu.primary} 100%)`
                    : t.accentLight,
                  border: isDone ? "none" : `2px solid ${t.divider}`,
                  display: "flex", alignItems: "center", justifyContent: "center",
                  fontFamily: t.ui, fontSize: isDone ? 16 : 14, fontWeight: 700,
                  color: isDone ? "#fff" : t.muted,
                }}>
                  {isDone ? "\u2713" : ep.number}
                </div>

                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{
                    fontFamily: t.heading, fontSize: 15, fontWeight: 700,
                    color: t.text, marginBottom: 2,
                  }}>{ep.title}</div>
                  <div style={{
                    fontFamily: t.ui, fontSize: 11, color: t.muted,
                  }}>{ep.subtitle}</div>
                  <div style={{
                    fontFamily: t.ui, fontSize: 10, color: cu.accent,
                    marginTop: 4,
                  }}>{ep.scripture} · {ep.pages.length} pages</div>
                </div>

                <div style={{ color: t.muted }}><ChevIcon /></div>
              </button>
            );
          })}

          {/* Tags */}
          <div style={{ display: "flex", flexWrap: "wrap", gap: 8, marginTop: 20 }}>
            {(storyIndex?.series.flatMap(s => s.stories).find(s => s.id === storyData.id)?.tags || []).map(tag => (
              <span key={tag} style={{
                padding: "3px 10px", borderRadius: 12,
                background: t.accentLight, border: `1px solid ${t.accentBorder}`,
                fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: t.accent,
              }}>{tag}</span>
            ))}
          </div>
        </div>
      </div>
    );
  }

  // ── STORY READER ──
  if (view === "stories-reader") {
    if (loading || !storyData) return <div style={{ minHeight: "100vh", background: "#0D0818" }}><Spinner t={BS_DARK} /></div>;
    return (
      <StoryReader
        story={storyData}
        episodeIndex={episodeIdx}
        onBack={() => nav("stories-detail", { storyId: storyData.id })}
        onNextEpisode={() => {
          const next = episodeIdx + 1;
          if (next < storyData.episodes.length) {
            setEpisodeIdx(next);
          }
        }}
        onComplete={() => nav("stories-detail", { storyId: storyData.id })}
      />
    );
  }

  return null;
}
