"use client";
import { useState, useRef, useCallback, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { SplashPage, PanelsPage, ScripturePage, ReflectPage, RevealPage } from "./StoryPanel";

/* ═══════════════════════════════════════════════════════════════
   StoryReader — The manga reader engine
   Handles page navigation, swipe gestures, progress tracking,
   episode transitions, and age-tier switching.
   ═══════════════════════════════════════════════════════════════ */

export default function StoryReader({ story, episodeIndex, onBack, onNextEpisode, onComplete }) {
  const { darkMode, nav, awardBadge } = useApp();
  const [pageIndex, setPageIndex] = useState(0);
  const [ageTier, setAgeTier] = useState(() => {
    if (typeof window !== "undefined") return localStorage.getItem("storyAgeTier") || "adults";
    return "adults";
  });
  const [showAgePicker, setShowAgePicker] = useState(false);
  const [transitioning, setTransitioning] = useState(false);
  const [transitionDir, setTransitionDir] = useState("none");
  const touchStartX = useRef(0);
  const touchStartY = useRef(0);
  const containerRef = useRef(null);

  const episode = story.episodes[episodeIndex];
  const cu = story.colorUniverse;
  const pages = episode?.pages || [];
  const totalPages = pages.length;
  const currentPage = pages[pageIndex];

  // Persist age tier
  useEffect(() => {
    if (typeof window !== "undefined") localStorage.setItem("storyAgeTier", ageTier);
  }, [ageTier]);

  // Save reading progress
  useEffect(() => {
    if (typeof window !== "undefined") {
      const key = `story_progress_${story.id}`;
      const progress = JSON.parse(localStorage.getItem(key) || "{}");
      progress[episode.id] = { page: pageIndex, total: totalPages, ts: Date.now() };
      localStorage.setItem(key, JSON.stringify(progress));
    }
  }, [pageIndex, story.id, episode.id, totalPages]);

  // Track completed episodes
  const markEpisodeComplete = useCallback(() => {
    if (typeof window === "undefined") return;
    const key = `story_completed_${story.id}`;
    const completed = JSON.parse(localStorage.getItem(key) || "[]");
    if (!completed.includes(episode.id)) {
      completed.push(episode.id);
      localStorage.setItem(key, JSON.stringify(completed));

      // Badge: first story episode
      if (completed.length === 1) awardBadge("first_story");

      // Badge: all episodes of this story
      if (completed.length === story.episodes.length) {
        awardBadge("esther_complete");
        // Check total stories completed across all stories
        const allStories = JSON.parse(localStorage.getItem("stories_completed") || "[]");
        if (!allStories.includes(story.id)) {
          allStories.push(story.id);
          localStorage.setItem("stories_completed", JSON.stringify(allStories));
          if (allStories.length >= 3) awardBadge("story_explorer");
          if (allStories.length >= 5) awardBadge("story_marathon");
        }
      }
    }
  }, [story, episode, awardBadge]);

  // Navigate with transition
  const goToPage = useCallback((newIndex, dir) => {
    if (transitioning || newIndex < 0 || newIndex >= totalPages) return;
    setTransitioning(true);
    setTransitionDir(dir);
    setTimeout(() => {
      setPageIndex(newIndex);
      setTransitioning(false);
      setTransitionDir("none");
      if (containerRef.current) containerRef.current.scrollTop = 0;
    }, 250);
  }, [transitioning, totalPages]);

  const goNext = useCallback(() => {
    if (pageIndex < totalPages - 1) {
      goToPage(pageIndex + 1, "left");
    }
  }, [pageIndex, totalPages, goToPage]);

  const goPrev = useCallback(() => {
    if (pageIndex > 0) {
      goToPage(pageIndex - 1, "right");
    }
  }, [pageIndex, goToPage]);

  // Touch/swipe handling
  const onTouchStart = useCallback((e) => {
    touchStartX.current = e.touches[0].clientX;
    touchStartY.current = e.touches[0].clientY;
  }, []);

  const onTouchEnd = useCallback((e) => {
    const dx = e.changedTouches[0].clientX - touchStartX.current;
    const dy = e.changedTouches[0].clientY - touchStartY.current;
    if (Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.5) {
      if (dx < 0) goNext();
      else goPrev();
    }
  }, [goNext, goPrev]);

  // Keyboard navigation
  useEffect(() => {
    const handler = (e) => {
      if (e.key === "ArrowRight" || e.key === " ") { e.preventDefault(); goNext(); }
      if (e.key === "ArrowLeft") { e.preventDefault(); goPrev(); }
      if (e.key === "Escape") onBack();
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [goNext, goPrev, onBack]);

  // Navigate to Bible verse from scripture tap
  const handleNavigateVerse = useCallback((reference) => {
    // Parse "Esther 4:14" → book, chapter, verse
    const match = reference.match(/^(.+?)\s+(\d+):?(\d+)?/);
    if (match) {
      nav("verses", { book: match[1], chapter: parseInt(match[2]) });
    }
  }, [nav]);

  if (!episode || !currentPage) return null;

  const isLastPage = pageIndex === totalPages - 1;
  const isFirstPage = pageIndex === 0;
  const isLastEpisode = episodeIndex === story.episodes.length - 1;
  const nextEpisode = !isLastEpisode ? story.episodes[episodeIndex + 1] : null;

  // Transition style
  const pageStyle = {
    transition: transitioning ? "transform 0.25s ease, opacity 0.25s ease" : "none",
    transform: transitionDir === "left" ? "translateX(-30px)" : transitionDir === "right" ? "translateX(30px)" : "none",
    opacity: transitioning ? 0 : 1,
  };

  // ── AGE TIER PICKER ──
  const AgePicker = () => (
    <div style={{
      position: "fixed", inset: 0, zIndex: 100, background: "rgba(0,0,0,0.7)",
      display: "flex", alignItems: "center", justifyContent: "center",
      animation: "fadeIn 0.2s ease",
    }} onClick={() => setShowAgePicker(false)}>
      <div onClick={e => e.stopPropagation()} style={{
        background: darkMode ? "#1a1a2e" : "#fff", borderRadius: 20,
        padding: "28px 24px", maxWidth: 320, width: "90%",
        boxShadow: "0 20px 60px rgba(0,0,0,0.4)",
      }}>
        <div style={{
          fontFamily: "'Outfit',sans-serif", fontSize: 16, fontWeight: 800,
          color: darkMode ? "#F5E6CC" : "#2a1a10", textAlign: "center", marginBottom: 4,
        }}>Choose Your Level</div>
        <div style={{
          fontFamily: "'Lora',serif", fontSize: 12, color: darkMode ? "#A89070" : "#8B7355",
          textAlign: "center", marginBottom: 20, fontStyle: "italic",
        }}>Story visuals stay the same — reflections adapt</div>
        {[
          { id: "kids", icon: "\ud83c\udf1f", label: "Kids", sub: "Ages 3–12", color: "#059669" },
          { id: "teens", icon: "\ud83d\udd25", label: "Teens", sub: "Ages 13–18", color: "#4F46E5" },
          { id: "adults", icon: "\ud83d\udcda", label: "Adults", sub: "Deep study", color: "#8B4513" },
        ].map(tier => (
          <button key={tier.id} onClick={() => { setAgeTier(tier.id); setShowAgePicker(false); }} style={{
            display: "flex", alignItems: "center", gap: 14, width: "100%",
            padding: "14px 16px", marginBottom: 8, borderRadius: 12, cursor: "pointer",
            border: ageTier === tier.id ? `2px solid ${tier.color}` : `1px solid ${darkMode ? "#333" : "#e5e5e5"}`,
            background: ageTier === tier.id ? tier.color + "12" : "transparent",
          }}>
            <span style={{ fontSize: 24 }}>{tier.icon}</span>
            <div style={{ textAlign: "left" }}>
              <div style={{
                fontFamily: "'Outfit',sans-serif", fontSize: 14, fontWeight: 700,
                color: darkMode ? "#F5E6CC" : "#2a1a10",
              }}>{tier.label}</div>
              <div style={{
                fontFamily: "'Outfit',sans-serif", fontSize: 11, color: darkMode ? "#888" : "#999",
              }}>{tier.sub}</div>
            </div>
            {ageTier === tier.id && <span style={{ marginLeft: "auto", color: tier.color, fontSize: 18 }}>\u2713</span>}
          </button>
        ))}
      </div>
    </div>
  );

  // ── END-OF-EPISODE CARD ──
  const EpisodeEndCard = () => (
    <div style={{
      minHeight: "100vh",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}40 50%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "40px 24px", textAlign: "center",
    }}>
      <div style={{
        fontSize: 48, marginBottom: 20,
      }}>{isLastEpisode ? "\ud83c\udf1f" : "\ud83d\udcda"}</div>

      <div style={{
        fontFamily: "'Playfair Display',serif", fontSize: 28, fontWeight: 900,
        color: "#F5E6CC", marginBottom: 8,
        textShadow: `0 0 30px ${cu.secondary}40`,
      }}>{isLastEpisode ? "Story Complete!" : "End of Episode"}</div>

      <div style={{
        fontFamily: "'Lora',serif", fontSize: 14, color: cu.secondary + "CC",
        fontStyle: "italic", marginBottom: 32,
      }}>
        {isLastEpisode
          ? `You\u2019ve completed "${story.title}"`
          : `Episode ${episode.number}: ${episode.title}`
        }
      </div>

      {/* Progress bar */}
      <div style={{
        width: "80%", maxWidth: 300, height: 6, borderRadius: 3,
        background: "rgba(255,255,255,0.1)", marginBottom: 32,
      }}>
        <div style={{
          height: "100%", borderRadius: 3, background: cu.secondary,
          width: `${((episodeIndex + 1) / story.episodes.length) * 100}%`,
          transition: "width 0.5s ease",
        }} />
      </div>

      {/* Next episode teaser */}
      {nextEpisode && (
        <button onClick={() => { markEpisodeComplete(); onNextEpisode(); }} style={{
          background: cu.accent, border: "none", borderRadius: 14,
          padding: "16px 28px", cursor: "pointer", marginBottom: 16,
          boxShadow: `0 4px 20px ${cu.accent}40`,
        }}>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
            color: "rgba(255,255,255,0.7)", letterSpacing: "0.12em", textTransform: "uppercase",
            marginBottom: 4,
          }}>Next Episode</div>
          <div style={{
            fontFamily: "'Playfair Display',serif", fontSize: 18, fontWeight: 700,
            color: "#fff",
          }}>{nextEpisode.title}</div>
          <div style={{
            fontFamily: "'Lora',serif", fontSize: 12, color: "rgba(255,255,255,0.8)",
            fontStyle: "italic", marginTop: 4,
          }}>{nextEpisode.subtitle}</div>
        </button>
      )}

      {isLastEpisode && (
        <button onClick={() => { markEpisodeComplete(); onComplete(); }} style={{
          background: cu.secondary, border: "none", borderRadius: 14,
          padding: "16px 32px", cursor: "pointer", marginBottom: 16,
          boxShadow: `0 4px 20px ${cu.secondary}40`,
        }}>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 14, fontWeight: 700,
            color: "#2a1a10",
          }}>\ud83c\udf1f Story Complete!</div>
        </button>
      )}

      <button onClick={onBack} style={{
        background: "transparent", border: `1px solid rgba(255,255,255,0.2)`,
        borderRadius: 10, padding: "10px 24px", cursor: "pointer",
        fontFamily: "'Outfit',sans-serif", fontSize: 12, color: "rgba(255,255,255,0.6)",
      }}>Back to Stories</button>
    </div>
  );

  // ── RENDER PAGE BY TYPE ──
  const renderPage = () => {
    switch (currentPage.type) {
      case "splash": return <SplashPage page={currentPage} cu={cu} />;
      case "panels": return <PanelsPage page={currentPage} cu={cu} />;
      case "scripture": return <ScripturePage page={currentPage} cu={cu} onNavigateVerse={handleNavigateVerse} />;
      case "reflect": return <ReflectPage page={currentPage} cu={cu} ageTier={ageTier} darkMode={darkMode} />;
      case "reveal": return <RevealPage page={currentPage} cu={cu} />;
      default: return null;
    }
  };

  return (
    <div
      ref={containerRef}
      onTouchStart={onTouchStart}
      onTouchEnd={onTouchEnd}
      style={{ position: "relative", minHeight: "100vh", overflow: "hidden" }}
    >
      {showAgePicker && <AgePicker />}

      {/* ── TOP HEADER BAR ── */}
      <div style={{
        position: "fixed", top: 0, left: 0, right: 0, zIndex: 50,
        background: `${cu.darkBg}E0`, backdropFilter: "blur(12px)",
        borderBottom: `1px solid ${cu.secondary}15`,
        display: "flex", alignItems: "center", padding: "10px 16px", gap: 12,
      }}>
        {/* Back button */}
        <button onClick={onBack} style={{
          background: "none", border: "none", cursor: "pointer", padding: 4,
          color: cu.secondary, display: "flex", alignItems: "center",
        }}>
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
            <polyline points="15 18 9 12 15 6"/>
          </svg>
        </button>

        {/* Title */}
        <div style={{ flex: 1, minWidth: 0 }}>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 13, fontWeight: 700,
            color: "#F5E6CC", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap",
          }}>Ep. {episode.number}: {episode.title}</div>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 10, color: cu.secondary + "80",
          }}>{story.title}</div>
        </div>

        {/* Age tier button */}
        <button onClick={() => setShowAgePicker(true)} style={{
          background: cu.accent + "25", border: `1px solid ${cu.accent}40`,
          borderRadius: 8, padding: "4px 10px", cursor: "pointer",
          fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
          color: cu.secondary, letterSpacing: "0.05em",
        }}>
          {ageTier === "kids" ? "\ud83c\udf1f" : ageTier === "teens" ? "\ud83d\udd25" : "\ud83d\udcda"} {ageTier}
        </button>
      </div>

      {/* ── PAGE CONTENT ── */}
      <div style={{ paddingTop: 50, ...pageStyle }}>
        {isLastPage && pageIndex === totalPages - 1 && false /* placeholder */ ? null : renderPage()}
      </div>

      {/* ── BOTTOM NAVIGATION BAR ── */}
      <div style={{
        position: "fixed", bottom: 0, left: 0, right: 0, zIndex: 50,
        background: `${cu.darkBg}E0`, backdropFilter: "blur(12px)",
        borderTop: `1px solid ${cu.secondary}15`,
        display: "flex", alignItems: "center", justifyContent: "space-between",
        padding: "10px 20px 14px",
      }}>
        {/* Prev button */}
        <button onClick={goPrev} disabled={isFirstPage} style={{
          background: "none", border: `1px solid ${isFirstPage ? "transparent" : cu.secondary + "40"}`,
          borderRadius: 8, padding: "6px 14px", cursor: isFirstPage ? "default" : "pointer",
          fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 600,
          color: isFirstPage ? "transparent" : cu.secondary + "AA",
        }}>{"\u2039"} Prev</button>

        {/* Progress dots */}
        <div style={{ display: "flex", gap: 6, alignItems: "center" }}>
          {pages.map((_, i) => (
            <button key={i} onClick={() => goToPage(i, i > pageIndex ? "left" : "right")} style={{
              width: i === pageIndex ? 18 : 6, height: 6, borderRadius: 3,
              background: i === pageIndex ? cu.secondary : cu.secondary + "30",
              border: "none", cursor: "pointer", padding: 0,
              transition: "all 0.3s ease",
            }} />
          ))}
        </div>

        {/* Next / End button */}
        {isLastPage ? (
          <button onClick={() => { markEpisodeComplete(); if (nextEpisode) onNextEpisode(); else onComplete(); }} style={{
            background: cu.accent, border: "none", borderRadius: 8,
            padding: "6px 14px", cursor: "pointer",
            fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 700,
            color: "#fff",
          }}>{isLastEpisode ? "Finish \u2713" : "Next Ep \u203a"}</button>
        ) : (
          <button onClick={goNext} style={{
            background: "none", border: `1px solid ${cu.secondary}40`,
            borderRadius: 8, padding: "6px 14px", cursor: "pointer",
            fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 600,
            color: cu.secondary + "AA",
          }}>Next {"\u203a"}</button>
        )}
      </div>
    </div>
  );
}
