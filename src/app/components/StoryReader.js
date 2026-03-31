"use client";
import { useState, useRef, useCallback, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { SplashPage, PanelsPage, ScripturePage, ReflectPage, RevealPage } from "./StoryPanel";

/* ═══════════════════════════════════════════════════════════════
   StoryReader — The manga reader engine (Phase 4: Delight Features)
   Features: navigation, swipe, progress, age-tier, auto-play,
   haptic feedback, family lock, share, verse navigation
   ═══════════════════════════════════════════════════════════════ */

// Haptic feedback helper
const haptic = (style = "light") => {
  if (typeof navigator !== "undefined" && navigator.vibrate) {
    if (style === "heavy") navigator.vibrate([30, 20, 50]);
    else if (style === "medium") navigator.vibrate(20);
    else navigator.vibrate(10);
  }
};

export default function StoryReader({ story, episodeIndex, onBack, onNextEpisode, onComplete }) {
  const { darkMode, nav, awardBadge } = useApp();
  const [pageIndex, setPageIndex] = useState(() => {
    if (typeof window === "undefined") return 0;
    try {
      const key = `story_progress_${story.id}`;
      const progress = JSON.parse(localStorage.getItem(key) || "{}");
      const ep = story.episodes[episodeIndex];
      const saved = ep ? progress[ep.id] : null;
      if (saved && saved.page > 0 && saved.page < (ep?.pages?.length || 0)) return saved.page;
    } catch {}
    return 0;
  });
  const [ageTier, setAgeTier] = useState(() => {
    if (typeof window !== "undefined") return localStorage.getItem("storyAgeTier") || "adults";
    return "adults";
  });
  const [showAgePicker, setShowAgePicker] = useState(false);
  const [transitioning, setTransitioning] = useState(false);
  const [transitionDir, setTransitionDir] = useState("none");
  const [enterDir, setEnterDir] = useState("none");
  // Auto-play state
  const [autoPlay, setAutoPlay] = useState(false);
  const [autoPlayProgress, setAutoPlayProgress] = useState(0);
  const autoPlayTimer = useRef(null);
  const autoPlayInterval = useRef(null);
  // Family lock state
  const [showFamilyLock, setShowFamilyLock] = useState(false);
  const [lockCode, setLockCode] = useState("");
  const [isLocked, setIsLocked] = useState(() => {
    if (typeof window !== "undefined") return localStorage.getItem("storyFamilyLock") === "true";
    return false;
  });
  // Share toast
  const [showShareToast, setShowShareToast] = useState(false);

  const touchStartX = useRef(0);
  const touchStartY = useRef(0);
  const containerRef = useRef(null);

  const episode = story.episodes[episodeIndex];
  const cu = story.colorUniverse;
  const pages = episode?.pages || [];
  const totalPages = pages.length + 1;
  const showEndCard = pageIndex >= pages.length;
  const currentPage = pages[pageIndex];

  const AUTO_PLAY_DURATION = 12000; // 12 seconds per page

  // Reset page on episode change
  useEffect(() => {
    setPageIndex(0);
  }, [episodeIndex]);

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
      if (completed.length === 1) awardBadge("first_story");
      if (completed.length === story.episodes.length) {
        awardBadge("esther_complete");
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

  // Navigate with two-phase transition + haptic feedback
  const goToPage = useCallback((newIndex, dir) => {
    if (transitioning || newIndex < 0 || newIndex >= totalPages) return;
    haptic("light");
    setTransitioning(true);
    setTransitionDir(dir);
    setTimeout(() => {
      setPageIndex(newIndex);
      setTransitionDir("none");
      setEnterDir(dir === "left" ? "mangaSlideLeft" : "mangaSlideRight");
      if (containerRef.current) containerRef.current.scrollTop = 0;
      // Extra haptic on REVEAL pages
      const nextPage = pages[newIndex];
      if (nextPage?.type === "reveal") haptic("heavy");
      setTimeout(() => {
        setTransitioning(false);
        setEnterDir("none");
      }, 350);
    }, 200);
  }, [transitioning, totalPages, pages]);

  const goNext = useCallback(() => {
    if (pageIndex < totalPages - 1) goToPage(pageIndex + 1, "left");
  }, [pageIndex, totalPages, goToPage]);

  const goPrev = useCallback(() => {
    if (pageIndex > 0) goToPage(pageIndex - 1, "right");
  }, [pageIndex, goToPage]);

  // ── AUTO-PLAY ENGINE ──
  useEffect(() => {
    if (!autoPlay || showEndCard) {
      clearTimeout(autoPlayTimer.current);
      clearInterval(autoPlayInterval.current);
      setAutoPlayProgress(0);
      return;
    }
    // Progress bar animation (updates every 100ms)
    let elapsed = 0;
    autoPlayInterval.current = setInterval(() => {
      elapsed += 100;
      setAutoPlayProgress(Math.min(elapsed / AUTO_PLAY_DURATION, 1));
    }, 100);
    // Auto-advance after duration
    autoPlayTimer.current = setTimeout(() => {
      if (pageIndex < pages.length - 1) {
        goNext();
      } else {
        setAutoPlay(false); // stop at end card
      }
    }, AUTO_PLAY_DURATION);
    return () => {
      clearTimeout(autoPlayTimer.current);
      clearInterval(autoPlayInterval.current);
    };
  }, [autoPlay, pageIndex, showEndCard, pages.length, goNext]);

  // Touch/swipe handling — pauses auto-play on interaction
  const onTouchStart = useCallback((e) => {
    touchStartX.current = e.touches[0].clientX;
    touchStartY.current = e.touches[0].clientY;
  }, []);

  const onTouchEnd = useCallback((e) => {
    const dx = e.changedTouches[0].clientX - touchStartX.current;
    const dy = e.changedTouches[0].clientY - touchStartY.current;
    if (Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.5) {
      if (autoPlay) setAutoPlay(false); // manual swipe pauses auto-play
      if (dx < 0) goNext();
      else goPrev();
    }
  }, [goNext, goPrev, autoPlay]);

  // Keyboard navigation
  useEffect(() => {
    const handler = (e) => {
      if (e.key === "ArrowRight" || e.key === " ") { e.preventDefault(); if (autoPlay) setAutoPlay(false); goNext(); }
      if (e.key === "ArrowLeft") { e.preventDefault(); if (autoPlay) setAutoPlay(false); goPrev(); }
      if (e.key === "Escape") onBack();
      if (e.key === "p" || e.key === "P") setAutoPlay(v => !v); // P toggles auto-play
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [goNext, goPrev, onBack, autoPlay]);

  // Navigate to Bible verse from scripture tap (works on all page types)
  const handleNavigateVerse = useCallback((reference) => {
    const match = reference.match(/^(.+?)\s+(\d+):?(\d+)?/);
    if (match) {
      nav("verses", { book: match[1], chapter: parseInt(match[2]) });
    }
  }, [nav]);

  // Share current page content
  const handleShare = useCallback(() => {
    if (!currentPage) return;
    let text = "";
    if (currentPage.type === "scripture") {
      text = `"${currentPage.verse}"\n\u2014 ${currentPage.reference} (KJV)\n\nvia The Bible Scrollers`;
    } else if (currentPage.type === "reveal") {
      text = `${currentPage.title}\n\n"${currentPage.text}"\n\u2014 ${currentPage.scripture || ""}\n\nvia The Bible Scrollers`;
    } else if (currentPage.type === "splash") {
      text = `${story.title} \u2014 ${currentPage.title}\n\n${currentPage.subtitle}\n\nvia The Bible Scrollers`;
    } else {
      text = `${story.title} \u2014 Episode ${episode.number}: ${episode.title}\n\nvia The Bible Scrollers`;
    }
    if (typeof navigator !== "undefined" && navigator.share) {
      navigator.share({ title: story.title, text }).catch(() => {});
    } else if (typeof navigator !== "undefined" && navigator.clipboard) {
      navigator.clipboard.writeText(text).then(() => {
        setShowShareToast(true);
        setTimeout(() => setShowShareToast(false), 2000);
      });
    }
    haptic("medium");
  }, [currentPage, story, episode]);

  if (!episode || (!currentPage && !showEndCard)) return null;

  const isLastPage = pageIndex === totalPages - 1;
  const isFirstPage = pageIndex === 0;
  const isLastEpisode = episodeIndex === story.episodes.length - 1;
  const nextEpisode = !isLastEpisode ? story.episodes[episodeIndex + 1] : null;

  // Transition style
  const isExiting = transitioning && transitionDir !== "none";
  const pageStyle = {
    transition: isExiting ? "transform 0.2s ease, opacity 0.2s ease" : "none",
    transform: isExiting ? (transitionDir === "left" ? "translateX(-40px)" : "translateX(40px)") : "none",
    opacity: isExiting ? 0 : 1,
    ...(enterDir !== "none" ? { animation: `${enterDir} 0.35s ease both` } : {}),
  };

  // ── FAMILY LOCK MODAL ──
  const FamilyLockModal = () => (
    <div style={{
      position: "fixed", inset: 0, zIndex: 100, background: "rgba(0,0,0,0.7)",
      display: "flex", alignItems: "center", justifyContent: "center",
      animation: "fadeIn 0.2s ease",
    }} onClick={() => setShowFamilyLock(false)}>
      <div onClick={e => e.stopPropagation()} style={{
        background: darkMode ? "#1a1a2e" : "#fff", borderRadius: 20,
        padding: "28px 24px", maxWidth: 320, width: "90%",
        boxShadow: "0 20px 60px rgba(0,0,0,0.4)",
      }}>
        <div style={{
          fontFamily: "'Outfit',sans-serif", fontSize: 16, fontWeight: 800,
          color: darkMode ? "#F5E6CC" : "#2a1a10", textAlign: "center", marginBottom: 4,
        }}>{isLocked ? "\uD83D\uDD12 Unlock Age Setting" : "\uD83D\uDD10 Lock Age Setting"}</div>
        <div style={{
          fontFamily: "'Lora',serif", fontSize: 12, color: darkMode ? "#A89070" : "#8B7355",
          textAlign: "center", marginBottom: 20, fontStyle: "italic",
        }}>{isLocked ? "Enter code to change age tier" : "Set a code to prevent children from changing the age tier"}</div>

        <div style={{
          display: "flex", justifyContent: "center", gap: 8, marginBottom: 20,
        }}>
          {[1, 2, 3, 4].map(i => (
            <div key={i} style={{
              width: 40, height: 48, borderRadius: 10,
              border: `2px solid ${lockCode.length >= i ? cu.accent || "#D4A853" : (darkMode ? "#333" : "#ddd")}`,
              background: lockCode.length >= i ? (cu.accent || "#D4A853") + "15" : "transparent",
              display: "flex", alignItems: "center", justifyContent: "center",
              fontFamily: "'Outfit',sans-serif", fontSize: 20, fontWeight: 700,
              color: darkMode ? "#F5E6CC" : "#2a1a10",
            }}>{lockCode[i - 1] || ""}</div>
          ))}
        </div>

        {/* Number pad */}
        <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr", gap: 8, maxWidth: 220, margin: "0 auto" }}>
          {[1, 2, 3, 4, 5, 6, 7, 8, 9, null, 0, "del"].map((n, i) => (
            n === null ? <div key={i} /> :
            <button key={i} onClick={() => {
              haptic("light");
              if (n === "del") { setLockCode(c => c.slice(0, -1)); return; }
              const next = lockCode + n;
              if (next.length > 4) return;
              setLockCode(next);
              if (next.length === 4) {
                if (isLocked) {
                  const saved = localStorage.getItem("storyFamilyCode") || "";
                  if (next === saved) {
                    setIsLocked(false);
                    localStorage.setItem("storyFamilyLock", "false");
                    setShowFamilyLock(false);
                    haptic("medium");
                  } else {
                    haptic("heavy");
                    setLockCode("");
                  }
                } else {
                  localStorage.setItem("storyFamilyCode", next);
                  localStorage.setItem("storyFamilyLock", "true");
                  setIsLocked(true);
                  setShowFamilyLock(false);
                  haptic("medium");
                }
                setLockCode("");
              }
            }} style={{
              width: "100%", height: 44, borderRadius: 10,
              border: `1px solid ${darkMode ? "#333" : "#e5e5e5"}`,
              background: darkMode ? "#ffffff08" : "#fafafa",
              fontFamily: "'Outfit',sans-serif", fontSize: n === "del" ? 13 : 18,
              fontWeight: 600, color: darkMode ? "#F5E6CC" : "#2a1a10",
              cursor: "pointer",
            }}>{n === "del" ? "\u232B" : n}</button>
          ))}
        </div>

        {isLocked && (
          <button onClick={() => setShowFamilyLock(false)} style={{
            display: "block", margin: "16px auto 0", background: "none", border: "none",
            fontFamily: "'Outfit',sans-serif", fontSize: 12, color: darkMode ? "#888" : "#999",
            cursor: "pointer",
          }}>Cancel</button>
        )}
      </div>
    </div>
  );

  // ── AGE TIER PICKER ──
  const AgePicker = () => {
    // If locked, show lock modal instead
    if (isLocked) return <FamilyLockModal />;
    return (
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
            { id: "littleKids", icon: "\uD83C\uDF08", label: "Little Kids", sub: "Ages 3\u20135", color: "#F59E0B" },
            { id: "kids", icon: "\uD83C\uDF1F", label: "Kids", sub: "Ages 6\u201312", color: "#059669" },
            { id: "teens", icon: "\uD83D\uDD25", label: "Teens", sub: "Ages 13\u201318", color: "#4F46E5" },
            { id: "adults", icon: "\uD83D\uDCDA", label: "Adults", sub: "Deep study", color: "#8B4513" },
          ].map(tier => (
            <button key={tier.id} onClick={() => { setAgeTier(tier.id); setShowAgePicker(false); haptic("light"); }} style={{
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
              {ageTier === tier.id && <span style={{ marginLeft: "auto", color: tier.color, fontSize: 18 }}>{"\u2713"}</span>}
            </button>
          ))}

          {/* Family lock button */}
          <button onClick={(e) => { e.stopPropagation(); setShowAgePicker(false); setShowFamilyLock(true); setLockCode(""); }} style={{
            display: "flex", alignItems: "center", justifyContent: "center", gap: 6,
            width: "100%", padding: "10px", marginTop: 8, borderRadius: 10,
            background: "transparent", border: `1px dashed ${darkMode ? "#444" : "#ddd"}`,
            cursor: "pointer", fontFamily: "'Outfit',sans-serif", fontSize: 11,
            fontWeight: 600, color: darkMode ? "#888" : "#999",
          }}>
            {"\uD83D\uDD10"} {isLocked ? "Locked \u2014 tap to unlock" : "Lock this setting (parental)"}
          </button>
        </div>
      </div>
    );
  };

  // ── END-OF-EPISODE CARD ──
  const EpisodeEndCard = () => (
    <div style={{
      minHeight: "100vh",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}40 50%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "40px 24px", textAlign: "center",
    }}>
      <div style={{ fontSize: 48, marginBottom: 20, animation: "scaleIn 0.5s ease 0.2s both" }}>
        {isLastEpisode ? "\uD83C\uDF1F" : "\uD83D\uDCDA"}
      </div>
      <div style={{
        fontFamily: "'Playfair Display',serif", fontSize: 28, fontWeight: 900,
        color: "#F5E6CC", marginBottom: 8,
        textShadow: `0 0 30px ${cu.secondary}40`,
        animation: "fadeIn 0.5s ease 0.3s both",
      }}>{isLastEpisode ? "Story Complete!" : "End of Episode"}</div>
      <div style={{
        fontFamily: "'Lora',serif", fontSize: 14, color: cu.secondary + "CC",
        fontStyle: "italic", marginBottom: 32,
        animation: "fadeIn 0.4s ease 0.5s both",
      }}>
        {isLastEpisode ? `You\u2019ve completed "${story.title}"` : `Episode ${episode.number}: ${episode.title}`}
      </div>

      {/* Progress bar */}
      <div style={{
        width: "80%", maxWidth: 300, height: 6, borderRadius: 3,
        background: "rgba(255,255,255,0.1)", marginBottom: 32,
        animation: "fadeIn 0.4s ease 0.6s both",
      }}>
        <div style={{
          height: "100%", borderRadius: 3, background: cu.secondary,
          width: `${((episodeIndex + 1) / story.episodes.length) * 100}%`,
          transition: "width 0.5s ease",
        }} />
      </div>

      {nextEpisode && (
        <button onClick={() => { markEpisodeComplete(); onNextEpisode(); haptic("medium"); }} style={{
          background: cu.accent, border: "none", borderRadius: 14,
          padding: "16px 28px", cursor: "pointer", marginBottom: 16,
          boxShadow: `0 4px 20px ${cu.accent}40`,
          animation: "fadeIn 0.5s ease 0.7s both",
        }}>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
            color: "rgba(255,255,255,0.7)", letterSpacing: "0.12em", textTransform: "uppercase",
            marginBottom: 4,
          }}>Next Episode</div>
          <div style={{
            fontFamily: "'Playfair Display',serif", fontSize: 18, fontWeight: 700, color: "#fff",
          }}>{nextEpisode.title}</div>
          <div style={{
            fontFamily: "'Lora',serif", fontSize: 12, color: "rgba(255,255,255,0.8)",
            fontStyle: "italic", marginTop: 4,
          }}>{nextEpisode.subtitle}</div>
        </button>
      )}

      {isLastEpisode && (
        <button onClick={() => { markEpisodeComplete(); onComplete(); haptic("heavy"); }} style={{
          background: cu.secondary, border: "none", borderRadius: 14,
          padding: "16px 32px", cursor: "pointer", marginBottom: 16,
          boxShadow: `0 4px 20px ${cu.secondary}40`,
          animation: "fadeIn 0.5s ease 0.7s both",
        }}>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 14, fontWeight: 700, color: "#2a1a10",
          }}>{"\uD83C\uDF1F"} Story Complete!</div>
        </button>
      )}

      <button onClick={onBack} style={{
        background: "transparent", border: "1px solid rgba(255,255,255,0.2)",
        borderRadius: 10, padding: "10px 24px", cursor: "pointer",
        fontFamily: "'Outfit',sans-serif", fontSize: 12, color: "rgba(255,255,255,0.6)",
        animation: "fadeIn 0.4s ease 0.9s both",
      }}>Back to Stories</button>
    </div>
  );

  // ── RENDER PAGE BY TYPE ──
  const renderPage = () => {
    switch (currentPage.type) {
      case "splash": return <SplashPage page={currentPage} cu={cu} />;
      case "panels": return <PanelsPage page={currentPage} cu={cu} darkMode={darkMode} />;
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
      {showFamilyLock && <FamilyLockModal />}

      {/* ── SHARE TOAST ── */}
      {showShareToast && (
        <div style={{
          position: "fixed", top: 70, left: "50%", transform: "translateX(-50%)", zIndex: 200,
          background: cu.accent || "#D4A853", color: "#fff", borderRadius: 10,
          padding: "8px 20px", fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 700,
          boxShadow: "0 4px 20px rgba(0,0,0,0.3)", animation: "fadeIn 0.2s ease",
        }}>Copied to clipboard!</div>
      )}

      {/* ── AUTO-PLAY PROGRESS BAR ── */}
      {autoPlay && !showEndCard && (
        <div style={{
          position: "fixed", top: 48, left: 0, right: 0, zIndex: 55, height: 2,
          background: "rgba(255,255,255,0.1)",
        }}>
          <div style={{
            height: "100%", background: cu.secondary || "#D4A853",
            width: `${autoPlayProgress * 100}%`,
            transition: "width 0.1s linear",
          }} />
        </div>
      )}

      {/* ── TOP HEADER BAR ── */}
      <div style={{
        position: "fixed", top: 0, left: 0, right: 0, zIndex: 50,
        background: `${cu.darkBg}E0`, backdropFilter: "blur(12px)",
        borderBottom: `1px solid ${cu.secondary}15`,
        display: "flex", alignItems: "center", padding: "10px 16px", gap: 8,
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

        {/* Auto-play toggle */}
        <button onClick={() => { setAutoPlay(v => !v); haptic("light"); }} style={{
          background: autoPlay ? (cu.accent || "#D4A853") + "30" : "transparent",
          border: `1px solid ${autoPlay ? (cu.accent || "#D4A853") + "60" : cu.secondary + "30"}`,
          borderRadius: 8, padding: "4px 8px", cursor: "pointer",
          fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
          color: autoPlay ? (cu.accent || "#D4A853") : cu.secondary + "80",
          display: "flex", alignItems: "center", gap: 3,
        }}>
          {autoPlay ? "\u23F8" : "\u25B6"}{" "}
          <span style={{ display: "inline-block", maxWidth: 40, overflow: "hidden" }}>
            {autoPlay ? "Stop" : "Auto"}
          </span>
        </button>

        {/* Share button */}
        <button onClick={handleShare} style={{
          background: "none", border: `1px solid ${cu.secondary}30`,
          borderRadius: 8, padding: "4px 8px", cursor: "pointer",
          color: cu.secondary + "80", display: "flex", alignItems: "center",
        }}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"/><polyline points="16 6 12 2 8 6"/><line x1="12" y1="2" x2="12" y2="15"/>
          </svg>
        </button>

        {/* Age tier button */}
        <button onClick={() => setShowAgePicker(true)} style={{
          background: cu.accent + "25", border: `1px solid ${cu.accent}40`,
          borderRadius: 8, padding: "4px 8px", cursor: "pointer",
          fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
          color: cu.secondary, letterSpacing: "0.05em",
          display: "flex", alignItems: "center", gap: 2,
        }}>
          {ageTier === "littleKids" ? "\uD83C\uDF08" : ageTier === "kids" ? "\uD83C\uDF1F" : ageTier === "teens" ? "\uD83D\uDD25" : "\uD83D\uDCDA"}
          {isLocked && "\uD83D\uDD12"}
        </button>
      </div>

      {/* ── PAGE CONTENT ── */}
      <div style={{ paddingTop: showEndCard ? 0 : 50, ...pageStyle }}>
        {showEndCard ? <EpisodeEndCard /> : renderPage()}
      </div>

      {/* ── BOTTOM NAVIGATION BAR ── */}
      {!showEndCard && (
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
              <button key={i} onClick={() => { if (autoPlay) setAutoPlay(false); goToPage(i, i > pageIndex ? "left" : "right"); }} style={{
                width: i === pageIndex ? 18 : 6, height: 6, borderRadius: 3,
                background: i === pageIndex ? cu.secondary : cu.secondary + "30",
                border: "none", cursor: "pointer",
                padding: "20px 0", margin: "-20px 0",
                backgroundClip: "content-box",
                transition: "all 0.3s ease",
              }} />
            ))}
          </div>

          {/* Next button */}
          <button onClick={goNext} style={{
            background: "none", border: `1px solid ${cu.secondary}40`,
            borderRadius: 8, padding: "6px 14px", cursor: "pointer",
            fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 600,
            color: cu.secondary + "AA",
          }}>Next {"\u203A"}</button>
        </div>
      )}
    </div>
  );
}
