"use client";
import { useState, useCallback, useEffect, useRef, useMemo } from "react";
import { useApp } from "../context/AppContext";
import {
  READING_PLANS, SHELVES, DIFF,
  getPlanReadings, countCompletedDays, completionKey, migratePlanData,
  getReadingStreak, getNextReading, MILESTONES, MILESTONE_PCTS,
} from "./ReadingPlansData";

// ─── Theme ────────────────────────────────────────────────────────────────────
const T_LIGHT = {
  bg:       "#F5EDD6",
  wall:     "#EDE0C4",
  wood:     "linear-gradient(180deg, #C8974E 0%, #A0733A 50%, #8B5E2A 100%)",
  woodEdge: "#6B4423",
  text:     "#2C1A0E",
  muted:    "#8B6239",
  cream:    "#FEF6E4",
  font:     "'Georgia', serif",
};
const T_DARK = {
  ...T_LIGHT,
  bg:       "#161210",
  wall:     "#1A1714",
  text:     "#D0B898",
  muted:    "#9A7A5A",
  cream:    "#201A16",
};

function lightenHex(hex, amount = 30) {
  const num = parseInt(hex.replace("#",""), 16);
  const r = Math.min(255, (num >> 16) + amount);
  const g = Math.min(255, ((num >> 8) & 0xff) + amount);
  const b = Math.min(255, (num & 0xff) + amount);
  return "#" + ((r << 16) | (g << 8) | b).toString(16).padStart(6, "0");
}

function bookSlug(name) {
  return name.toLowerCase().replace(/\s+/g, "-");
}

// ─── Main Component ─────────────────────────────────────────────────────────
export default function ReadingPlans({ nav, onPositionSave, darkMode }) {
  const { bp, awardBadge } = useApp();
  const T = darkMode ? T_DARK : T_LIGHT;
  const PLAN_READINGS = useMemo(() => getPlanReadings(), []);

  // ── Sub-view navigation ─────────────────────────────────────────────────
  const [subView,      setSubView]      = useState("library");
  const [activePlanId, setActivePlanId] = useState(null);
  const [readerCtx,    setReaderCtx]    = useState(null);

  // ── Detail modal ────────────────────────────────────────────────────────
  const [selectedPlan, setSelectedPlan] = useState(null);
  const [detailOpen,   setDetailOpen]   = useState(false);
  const [animIn,       setAnimIn]       = useState(false);
  const [hoveredId,    setHoveredId]    = useState(null);

  // ── Confirmation dialog ─────────────────────────────────────────────────
  const [confirmAction, setConfirmAction] = useState(null);

  // ── Celebration overlay (plan completion) ──────────────────────────────
  const [celebration, setCelebration] = useState(null);

  // ── Milestone banner ──────────────────────────────────────────────────
  const [milestoneBanner, setMilestoneBanner] = useState(null);

  // ── Page-turn animation tracking ──────────────────────────────────────
  const [justCompleted, setJustCompleted] = useState(null);

  // ── Persistent plan progress ────────────────────────────────────────────
  const [planData, setPlanData] = useState({});
  useEffect(() => {
    try {
      const raw = localStorage.getItem("readingPlanProgress");
      if (raw) setPlanData(migratePlanData(JSON.parse(raw)));
    } catch { /* ignore */ }
  }, []);
  useEffect(() => {
    try { localStorage.setItem("readingPlanProgress", JSON.stringify(planData)); } catch { /* ignore */ }
  }, [planData]);

  const getCompletedSet = useCallback((planId) => {
    return new Set(planData[planId]?.completedChapters || []);
  }, [planData]);

  // ── Schedule: collapsible weeks ─────────────────────────────────────────
  const [expandedWeeks, setExpandedWeeks] = useState({});
  const weekRefs = useRef({});

  useEffect(() => {
    if (subView !== "schedule" || !activePlanId) return;
    const completedSet = getCompletedSet(activePlanId);
    const readings = PLAN_READINGS[activePlanId] || [];
    const firstIncompleteIdx = readings.findIndex(r =>
      !r.passages.every(p => completedSet.has(completionKey(r.day, p.book, p.chapter)))
    );
    const weekIdx = firstIncompleteIdx >= 0 ? Math.floor(firstIncompleteIdx / 7) : 0;
    setExpandedWeeks({ [weekIdx]: true });
    setTimeout(() => {
      weekRefs.current[weekIdx]?.scrollIntoView({ behavior: "smooth", block: "start" });
    }, 100);
  }, [subView, activePlanId]); // eslint-disable-line react-hooks/exhaustive-deps

  // ── Inline reader ──────────────────────────────────────────────────────
  const rpBookCache = useRef({});
  const [readerVerses, setReaderVerses] = useState([]);
  const [readerMeta,   setReaderMeta]   = useState(null);
  const [readerLoading, setReaderLoading] = useState(false);

  const loadPlanChapter = useCallback(async (bookName, chNum) => {
    const slug = bookSlug(bookName);
    if (!rpBookCache.current[slug]) {
      try {
        const res = await fetch(`/data/${slug}.json`);
        if (res.ok) rpBookCache.current[slug] = await res.json();
      } catch { /* ignore */ }
    }
    const bookData = rpBookCache.current[slug];
    if (!bookData) return null;
    const ch = bookData.chapters?.[String(chNum)];
    if (!ch) return null;
    return { verses: ch.verses || [], meta: ch.meta || null };
  }, []);

  useEffect(() => {
    if (subView !== "reader" || !readerCtx) return;
    let cancelled = false;
    setReaderLoading(true);
    setReaderVerses([]);
    setReaderMeta(null);
    loadPlanChapter(readerCtx.book, readerCtx.chapter).then(data => {
      if (cancelled) return;
      if (data) { setReaderVerses(data.verses); setReaderMeta(data.meta); }
      setReaderLoading(false);
    });
    return () => { cancelled = true; };
  }, [subView, readerCtx, loadPlanChapter]);

  // ── Plan operations ─────────────────────────────────────────────────────
  const openDetail = (plan) => {
    setSelectedPlan(plan);
    setDetailOpen(true);
    setTimeout(() => setAnimIn(true), 10);
    if (onPositionSave) onPositionSave("readingplans", { planName: plan.title });
  };

  const closeDetail = () => {
    setAnimIn(false);
    setTimeout(() => { setDetailOpen(false); setSelectedPlan(null); }, 350);
  };

  const startPlan = (plan) => {
    setPlanData(prev => ({
      ...prev,
      [plan.id]: { startedAt: new Date().toISOString(), completedChapters: [] },
    }));
    setActivePlanId(plan.id);
    closeDetail();
    setTimeout(() => setSubView("schedule"), 360);
    // Badge: plan_starter
    if (awardBadge) awardBadge("plan_starter");
    // Badge: plan_collector (3+ plans)
    const newCount = Object.keys(planData).filter(k => !k.startsWith("_")).length + 1;
    if (newCount >= 3 && awardBadge) awardBadge("plan_collector");
  };

  const toggleChapterComplete = useCallback((planId, day, book, chapter) => {
    const key = completionKey(day, book, chapter);
    setPlanData(prev => {
      const plan = prev[planId] || { startedAt: new Date().toISOString(), completedChapters: [] };
      const chapters = new Set(plan.completedChapters);
      const wasIncomplete = !chapters.has(key);
      if (wasIncomplete) chapters.add(key);
      else chapters.delete(key);
      const updated = { ...prev, [planId]: { ...plan, completedChapters: [...chapters] } };

      // Check for celebration + milestone (only on completion, not un-completion)
      if (wasIncomplete) {
        const readings = PLAN_READINGS[planId];
        if (readings) {
          const newSet = new Set(updated[planId].completedChapters);
          const done = countCompletedDays(planId, newSet);
          const total = readings.length;
          // Plan complete?
          if (done >= total && total > 0) {
            const meta = READING_PLANS.find(p => p.id === planId);
            setTimeout(() => setCelebration({ planId, title: meta?.title || "", icon: meta?.icon || "", color: meta?.color || "#D4A853" }), 300);
          } else {
            // Milestone check
            const prevDone = done - 1;
            const pct = Math.round((done / total) * 100);
            const prevPct = Math.round((prevDone / total) * 100);
            for (const m of MILESTONES) {
              if (done >= m && prevDone < m) {
                const meta = READING_PLANS.find(p => p.id === planId);
                setMilestoneBanner({ text: `Day ${m} reached!`, plan: meta?.title || "", day: done, total });
                setTimeout(() => setMilestoneBanner(null), 5000);
                break;
              }
            }
            if (!milestoneBanner) {
              for (const mp of MILESTONE_PCTS) {
                if (pct >= mp && prevPct < mp && mp < 100) {
                  const meta = READING_PLANS.find(p => p.id === planId);
                  setMilestoneBanner({ text: `${mp}% complete!`, plan: meta?.title || "", day: done, total });
                  setTimeout(() => setMilestoneBanner(null), 5000);
                  break;
                }
              }
            }
          }
        }
        // Page-turn animation
        setJustCompleted(key);
        setTimeout(() => setJustCompleted(null), 450);
      }

      return updated;
    });
  }, [PLAN_READINGS, milestoneBanner]);

  // Badge checks after planData changes
  useEffect(() => {
    if (!awardBadge) return;
    const planIds = Object.keys(planData).filter(k => !k.startsWith("_"));
    for (const planId of planIds) {
      const completedSet = new Set(planData[planId]?.completedChapters || []);
      const done = countCompletedDays(planId, completedSet);
      const readings = PLAN_READINGS[planId];
      const total = readings?.length || 0;
      if (done >= 7) awardBadge("faithful_reader");
      if (total > 0 && done >= total) awardBadge("plan_finisher");
      // Halfpoint badge
      if (total > 0 && done >= Math.ceil(total / 2)) awardBadge("plan_halfpoint");
      // Streak badges
      const streak = getReadingStreak(planId, planData);
      if (streak >= 7) awardBadge("streak_7");
      if (streak >= 30) awardBadge("streak_30");
    }
  }, [planData, awardBadge, PLAN_READINGS]);

  const resetPlan = (planId) => {
    setPlanData(prev => ({
      ...prev,
      [planId]: { startedAt: new Date().toISOString(), completedChapters: [] },
    }));
    setConfirmAction(null);
  };

  const removePlan = (planId) => {
    setPlanData(prev => {
      const next = { ...prev };
      delete next[planId];
      return next;
    });
    if (activePlanId === planId) {
      setActivePlanId(null);
      setSubView("myPlans");
    }
    setConfirmAction(null);
  };

  // ── Derived state ───────────────────────────────────────────────────────
  const myActivePlans = READING_PLANS.filter(p => planData[p.id]);
  const activeCount = myActivePlans.length;

  // ── Helper: difficulty badge (dark-mode aware) ─────────────────────────
  const DiffBadge = ({ difficulty }) => {
    const d = DIFF[difficulty];
    if (!d) return null;
    return (
      <span style={{
        background: darkMode ? d.bgDark : d.bg,
        color: darkMode ? d.colorDark : d.color,
        fontSize:11, fontWeight:600, padding:"3px 10px", borderRadius:10,
      }}>{difficulty}</span>
    );
  };

  // ── Helper: progress bar (accessible) ──────────────────────────────────
  const ProgressBar = ({ value, max, color, height = 6 }) => {
    const pct = max > 0 ? Math.round((value / max) * 100) : 0;
    return (
      <div
        role="progressbar"
        aria-valuenow={value}
        aria-valuemin={0}
        aria-valuemax={max}
        aria-label={`${value} of ${max} days complete`}
        style={{ height, background: darkMode ? "#3A3028" : "#E5E7EB", borderRadius: height, overflow: "hidden" }}
      >
        <div style={{
          height: "100%", width: `${pct}%`,
          background: `linear-gradient(90deg, ${color}, ${lightenHex(color, 30)})`,
          borderRadius: height, transition: "width 0.5s ease",
        }} />
      </div>
    );
  };

  // ── Helper: estimated completion ───────────────────────────────────────
  const EstCompletion = ({ planId, done, total }) => {
    const startedAt = planData[planId]?.startedAt;
    if (!startedAt || done === 0) {
      return <span style={{ fontSize: 12, color: T.muted, fontStyle: "italic" }}>Start reading to see estimate</span>;
    }
    const daysSinceStart = Math.max(1, Math.floor((Date.now() - new Date(startedAt).getTime()) / 86400000));
    const pace = done / daysSinceStart;
    const remaining = pace > 0 ? Math.ceil((total - done) / pace) : Infinity;
    if (remaining > 3650) return null;
    const est = new Date(Date.now() + remaining * 86400000);
    const formatted = est.toLocaleDateString("en-US", { month: "short", day: "numeric", year: "numeric" });
    return <span style={{ fontSize: 12, color: T.muted }}>Est. completion: {formatted}</span>;
  };

  // ── Helper: streak fire icon ───────────────────────────────────────────
  const StreakFire = ({ planId }) => {
    const streak = getReadingStreak(planId, planData);
    if (streak === 0) return null;
    const tier = streak >= 30 ? 5 : streak >= 14 ? 4 : streak >= 7 ? 3 : streak >= 3 ? 2 : 1;
    const flames = tier >= 5 ? "\uD83D\uDD25\uD83D\uDD25\uD83D\uDD25" : tier >= 4 ? "\uD83D\uDD25\uD83D\uDD25" : "\uD83D\uDD25";
    return (
      <span style={{
        fontSize: tier >= 3 ? 18 : 14,
        opacity: tier <= 1 ? 0.5 : 1,
        ...(tier >= 4 ? { animation: "pulseGlow 2s ease-in-out infinite" } : {}),
        ...(tier >= 5 ? { animation: "goldFlow 3s linear infinite", backgroundSize: "200% 100%", background: "linear-gradient(90deg, #f59e0b, #fbbf24, #f59e0b)", WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent" } : {}),
        display: "inline-flex", alignItems: "center", gap: 2,
      }} title={`${streak}-day streak`}>
        {flames}
        {tier >= 3 && <span style={{ fontSize: 11, fontWeight: 700, color: "#D97706", fontFamily: T.font }}>{streak}</span>}
      </span>
    );
  };

  // ── Seasonal accent map ────────────────────────────────────────────────
  const SEASONAL = { "advent": "rgba(109,40,217,0.08)", "holy-week": "rgba(153,27,27,0.06)" };

  // ────────────────────────────────────────────────────────────────────────
  // RENDER
  // ────────────────────────────────────────────────────────────────────────

  // ═══════ CELEBRATION OVERLAY ═══════════════════════════════════════════
  const CelebrationOverlay = () => {
    if (!celebration) return null;
    const confettiEmojis = ["\uD83C\uDF89", "\u2B50", "\uD83C\uDFC6", "\uD83D\uDCDA", "\u2728", "\uD83D\uDE4F", "\uD83C\uDF1F", "\u271D\uFE0F"];
    return (
      <div
        onClick={() => setCelebration(null)}
        style={{
          position: "fixed", inset: 0, zIndex: 5000,
          background: "rgba(0,0,0,0.75)",
          display: "flex", alignItems: "center", justifyContent: "center",
          animation: "fadeIn 0.4s ease",
        }}
      >
        {/* Confetti particles */}
        {confettiEmojis.map((emoji, i) => (
          <span key={i} style={{
            position: "absolute",
            top: `${20 + Math.random() * 40}%`,
            left: `${10 + (i / confettiEmojis.length) * 80}%`,
            fontSize: 24,
            animation: `confettiFloat 1.2s ease-out ${i * 0.15}s both`,
            pointerEvents: "none",
          }}>{emoji}</span>
        ))}
        <div style={{
          position: "relative",
          background: darkMode ? "#201A16" : "#FEF6E4",
          borderRadius: 20, padding: "36px 28px", maxWidth: 340, width: "90%",
          textAlign: "center", fontFamily: T.font,
          animation: "scaleIn 0.5s cubic-bezier(0.34,1.56,0.64,1) 0.2s both",
          border: "2px solid #D4A853",
          boxShadow: "0 0 40px rgba(212,168,83,0.3)",
        }} style2="celebrateGlow">
          <div style={{ animation: "celebrateGlow 2s ease-in-out infinite" }}>
            <div style={{ fontSize: 64, marginBottom: 12, animation: "scaleIn 0.4s ease 0.4s both" }}>
              {celebration.icon}
            </div>
          </div>
          <h2 style={{ color: T.text, fontSize: 22, fontWeight: 700, margin: "0 0 8px", lineHeight: 1.3 }}>
            You finished {celebration.title}!
          </h2>
          <p style={{ color: T.muted, fontSize: 14, margin: "0 0 20px", lineHeight: 1.6, fontStyle: "italic" }}>
            Well done, faithful servant.
          </p>
          <div style={{ display: "flex", gap: 8, justifyContent: "center" }}>
            <button
              onClick={(e) => {
                e.stopPropagation();
                if (navigator.share) {
                  navigator.share({ text: `I just completed "${celebration.title}" on The Bible Scrollers! \uD83D\uDCDA\u271D\uFE0F` });
                } else {
                  navigator.clipboard?.writeText(`I just completed "${celebration.title}" on The Bible Scrollers!`);
                }
              }}
              style={{
                padding: "12px 20px", borderRadius: 12, border: "none",
                background: `linear-gradient(135deg, ${celebration.color}, ${lightenHex(celebration.color, 20)})`,
                color: "#fff", fontWeight: 700, fontSize: 14,
                cursor: "pointer", fontFamily: T.font,
              }}
            >Share Achievement</button>
            <button
              onClick={(e) => { e.stopPropagation(); setCelebration(null); }}
              style={{
                padding: "12px 16px", borderRadius: 12,
                border: `1px solid ${darkMode ? "#3A3028" : "#E0D8C8"}`,
                background: "transparent", color: T.muted,
                fontWeight: 600, fontSize: 14, cursor: "pointer", fontFamily: T.font,
              }}
            >Close</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══════ MILESTONE BANNER ═════════════════════════════════════════════
  const MilestoneBanner = () => {
    if (!milestoneBanner) return null;
    return (
      <div style={{
        position: "fixed", top: 16, left: "50%", transform: "translateX(-50%)",
        zIndex: 4500, maxWidth: 340, width: "90%",
        background: darkMode ? "#2A1F14" : "#FFFBEB",
        border: "1.5px solid #D4A853", borderRadius: 14,
        padding: "12px 16px", boxShadow: "0 4px 20px rgba(212,168,83,0.25)",
        display: "flex", alignItems: "center", gap: 10,
        animation: "fadeIn 0.4s ease", fontFamily: T.font,
      }}>
        <span style={{ fontSize: 24 }}>{"\uD83C\uDF89"}</span>
        <div style={{ flex: 1 }}>
          <div style={{ fontSize: 14, fontWeight: 700, color: T.text }}>{milestoneBanner.text}</div>
          <div style={{ fontSize: 12, color: T.muted }}>{milestoneBanner.plan} \u2014 Day {milestoneBanner.day}/{milestoneBanner.total}</div>
        </div>
        {navigator.share && (
          <button
            onClick={() => navigator.share({ text: `${milestoneBanner.text} ${milestoneBanner.plan} on The Bible Scrollers!` })}
            style={{
              background: "#D4A853", color: "#fff", border: "none", borderRadius: 8,
              padding: "6px 12px", fontSize: 11, fontWeight: 700, cursor: "pointer", fontFamily: T.font,
            }}
          >Share</button>
        )}
      </div>
    );
  };

  // ═══════ CONFIRMATION DIALOG ═════════════════════════════════════════════
  const ConfirmDialog = () => {
    if (!confirmAction) return null;
    const isRemove = confirmAction.type === "remove";
    return (
      <div style={{ position: "fixed", inset: 0, zIndex: 4000, display: "flex", alignItems: "center", justifyContent: "center" }}
        role="alertdialog" aria-modal="true" aria-label={`${isRemove ? "Remove" : "Reset"} reading plan`}
      >
        <div onClick={() => setConfirmAction(null)} style={{ position: "absolute", inset: 0, background: "rgba(0,0,0,0.5)" }} />
        <div style={{
          position: "relative", background: T.cream, borderRadius: 16,
          padding: 24, maxWidth: 320, width: "90%",
          boxShadow: "0 8px 32px rgba(0,0,0,0.3)", fontFamily: T.font,
        }}>
          <h3 id="confirm-title" style={{ margin: "0 0 8px", fontSize: 17, fontWeight: 700, color: T.text }}>
            {isRemove ? "Remove Plan?" : "Reset Progress?"}
          </h3>
          <p id="confirm-desc" style={{ margin: "0 0 20px", fontSize: 14, color: T.muted, lineHeight: 1.6 }}>
            {isRemove
              ? `All progress for "${confirmAction.title}" will be permanently deleted.`
              : `This will clear all progress for "${confirmAction.title}" and start fresh.`}
          </p>
          <div style={{ display: "flex", gap: 8 }}>
            <button onClick={() => setConfirmAction(null)} style={{
              flex: 1, padding: "12px", borderRadius: 10,
              border: `1px solid ${darkMode ? "#3A3028" : "#E0D8C8"}`,
              background: "transparent", color: T.text, fontWeight: 600,
              fontSize: 14, cursor: "pointer", fontFamily: T.font,
            }}>Cancel</button>
            <button onClick={() => isRemove ? removePlan(confirmAction.planId) : resetPlan(confirmAction.planId)} style={{
              flex: 1, padding: "12px", borderRadius: 10, border: "none",
              background: isRemove ? "#DC2626" : "#D97706",
              color: "#fff", fontWeight: 700, fontSize: 14,
              cursor: "pointer", fontFamily: T.font,
            }}>{isRemove ? "Remove" : "Reset"}</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══════ READER VIEW ═══════════════════════════════════════════════════
  if (subView === "reader" && readerCtx) {
    const plan = READING_PLANS.find(p => p.id === readerCtx.planId);
    const planColor = plan?.color || "#B8860B";
    const completedSet = getCompletedSet(readerCtx.planId);
    const chKey = completionKey(readerCtx.day, readerCtx.book, readerCtx.chapter);
    const isRead = completedSet.has(chKey);
    const seasonalBg = SEASONAL[readerCtx.planId] || null;

    return (
      <div style={{ minHeight: "100vh", background: seasonalBg ? `linear-gradient(180deg, ${T.bg}, ${seasonalBg})` : `linear-gradient(180deg, ${T.bg}, ${darkMode ? "#1A1510" : "#F0E8D0"})`, fontFamily: T.font }}>
        <div style={{
          position: "sticky", top: 0, zIndex: 10,
          background: `linear-gradient(135deg, ${planColor}, ${lightenHex(planColor, 20)})`,
          padding: "12px 16px", display: "flex", alignItems: "center", gap: 12,
          boxShadow: "0 2px 12px rgba(0,0,0,0.2)",
        }}>
          <button onClick={() => setSubView("schedule")} aria-label="Back to schedule" style={{
            background: "rgba(0,0,0,0.2)", border: "none", borderRadius: 20,
            color: "#fff", padding: "6px 14px", fontSize: 13,
            cursor: "pointer", fontFamily: T.font,
          }}>{"\u2190"} Schedule</button>
          <div style={{ flex: 1, textAlign: "center" }}>
            <span style={{ color: "#fff", fontSize: 16, fontWeight: 700,
              textShadow: "0 1px 4px rgba(0,0,0,0.3)" }}>
              {readerCtx.book} {readerCtx.chapter}
            </span>
            {readerCtx.verseRange && (
              <span style={{ color: "rgba(255,255,255,0.7)", fontSize: 13, marginLeft: 4 }}>
                :{readerCtx.verseRange}
              </span>
            )}
          </div>
          <div style={{ width: 80 }} />
        </div>

        {readerMeta?.theme && (
          <div style={{
            margin: "16px 16px 0", padding: "14px 16px",
            background: darkMode ? "#201A16" : "#fff",
            borderRadius: 12, borderLeft: `4px solid ${planColor}`,
            boxShadow: "0 1px 6px rgba(0,0,0,0.06)",
          }}>
            <p style={{ margin: 0, fontSize: 13, fontWeight: 700, color: planColor }}>
              {readerMeta.theme}
            </p>
            {readerMeta.overview && (
              <p style={{ margin: "6px 0 0", fontSize: 13, color: T.muted, lineHeight: 1.6 }}>
                {readerMeta.overview}
              </p>
            )}
          </div>
        )}

        <div style={{ padding: "12px 16px 100px" }}>
          {readerLoading ? (
            <div style={{ textAlign: "center", padding: "60px 0" }}>
              <div style={{ fontSize: 32, marginBottom: 12 }}>{"\uD83D\uDCD6"}</div>
              <p style={{ color: T.muted, fontSize: 14 }}>Loading chapter...</p>
            </div>
          ) : readerVerses.length === 0 ? (
            <div style={{ textAlign: "center", padding: "60px 0" }}>
              <div style={{ fontSize: 32, marginBottom: 12 }}>{"\uD83D\uDCC4"}</div>
              <p style={{ color: T.muted, fontSize: 14 }}>Chapter not available yet</p>
            </div>
          ) : (
            <div style={{
              background: darkMode ? "#201A16" : "#fff",
              borderRadius: 14, overflow: "hidden",
              boxShadow: "0 2px 10px rgba(0,0,0,0.06)",
              animation: "verseGlow 6s ease-in-out infinite",
            }}>
              {readerVerses.map((v, i) => (
                <div key={v.verse_number} style={{
                  padding: "12px 16px",
                  borderTop: i > 0 ? `1px solid ${darkMode ? "#2A2420" : "#F0EBE0"}` : "none",
                }}>
                  <span style={{
                    float: "left", fontSize: 22, fontWeight: 700,
                    color: planColor, lineHeight: 1, marginRight: 6, marginTop: 2,
                    fontFamily: T.font, textShadow: "0 1px 3px rgba(0,0,0,0.12)",
                  }}>{v.verse_number}</span>
                  <span style={{
                    fontSize: 15, color: T.text, lineHeight: 1.75,
                    fontFamily: T.font,
                  }}>{v.kjv_text}</span>
                </div>
              ))}
            </div>
          )}
        </div>

        {readerVerses.length > 0 && (
          <div style={{
            position: "fixed", bottom: 0, left: 0, right: 0,
            padding: "12px 16px", background: T.bg,
            borderTop: `1px solid ${darkMode ? "#2A2420" : "#E0D8C8"}`,
            boxShadow: "0 -2px 12px rgba(0,0,0,0.08)",
          }}>
            <button
              onClick={() => {
                if (!isRead) toggleChapterComplete(readerCtx.planId, readerCtx.day, readerCtx.book, readerCtx.chapter);
                setSubView("schedule");
              }}
              style={{
                width: "100%", padding: "14px", borderRadius: 12, border: "none",
                background: isRead
                  ? (darkMode ? "rgba(5,150,105,0.15)" : "#D1FAE5")
                  : `linear-gradient(135deg, ${planColor}, ${lightenHex(planColor, 20)})`,
                color: isRead ? (darkMode ? "#4ADE80" : "#065F46") : "#fff",
                fontWeight: 700, fontSize: 15, cursor: "pointer", fontFamily: T.font,
              }}
            >
              {isRead ? "\u2713 Chapter Complete \u2014 Back to Schedule" : "\u2713 Mark as Read & Continue"}
            </button>
          </div>
        )}
      </div>
    );
  }

  // ═══════ SCHEDULE VIEW ═════════════════════════════════════════════════
  if (subView === "schedule" && activePlanId) {
    const plan = READING_PLANS.find(p => p.id === activePlanId);
    const readings = PLAN_READINGS[activePlanId] || [];
    const completedSet = getCompletedSet(activePlanId);
    const totalDays = readings.length;
    const doneDays = countCompletedDays(activePlanId, completedSet);
    const pct = totalDays > 0 ? Math.round((doneDays / totalDays) * 100) : 0;
    const useWeeks = totalDays > 14;
    const streak = getReadingStreak(activePlanId, planData);

    // Compute "today's day number" for smart highlight
    const startDate = planData[activePlanId]?.startedAt ? new Date(planData[activePlanId].startedAt) : null;
    const todayDayNum = startDate
      ? Math.min(Math.floor((Date.now() - new Date(startDate).setHours(0,0,0,0)) / 86400000) + 1, totalDays)
      : 1;

    const weeks = useWeeks
      ? Array.from({ length: Math.ceil(totalDays / 7) }, (_, wi) =>
          readings.slice(wi * 7, (wi + 1) * 7)
        )
      : [readings];

    // Group passages by track (for M'Cheyne)
    const groupByTrack = (passages) => {
      if (!passages[0]?.track) return null;
      const groups = {};
      for (const p of passages) {
        const t = p.track || "Reading";
        if (!groups[t]) groups[t] = [];
        groups[t].push(p);
      }
      return groups;
    };

    return (
      <div style={{ minHeight: "100vh", background: T.bg, fontFamily: T.font }}>
        <div style={{
          position: "sticky", top: 0, zIndex: 10, background: T.bg,
          borderBottom: `1px solid ${darkMode ? "#2A2420" : "#E0D8C8"}`,
          padding: "12px 16px",
        }}>
          <div style={{ display: "flex", alignItems: "center", gap: 12, marginBottom: 10 }}>
            <button onClick={() => { setSubView("myPlans"); setActivePlanId(null); }} aria-label="Back to My Plans" style={{
              background: "rgba(0,0,0,0.06)", border: "none", borderRadius: 20,
              color: T.text, padding: "6px 14px", fontSize: 13,
              cursor: "pointer", fontFamily: T.font,
            }}>{"\u2190"} My Plans</button>
            <div style={{ flex: 1, textAlign: "center" }}>
              <span style={{ fontSize: 14, fontWeight: 700, color: T.text }}>
                {plan?.icon} {plan?.title} <StreakFire planId={activePlanId} />
              </span>
            </div>
            <div style={{ width: 80 }} />
          </div>
          <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
            <div style={{ flex: 1 }}>
              <ProgressBar value={doneDays} max={totalDays} color={plan?.color || "#888"} />
            </div>
            <span style={{ fontSize: 12, fontWeight: 700, color: plan?.color, minWidth: 65, textAlign: "right" }}>
              {doneDays}/{totalDays} days
            </span>
          </div>
        </div>

        <div style={{ padding: "12px 16px 60px", maxWidth: bp.content, margin: "0 auto" }}>
          {weeks.map((weekDays, wi) => {
            const isExpanded = !!expandedWeeks[wi];
            const weekStart = wi * 7 + 1;
            const weekEnd = Math.min(weekStart + 6, totalDays);
            const weekDone = weekDays.filter(r =>
              r.passages.every(p => completedSet.has(completionKey(r.day, p.book, p.chapter)))
            ).length;
            const allWeekDone = weekDone === weekDays.length;

            return (
              <div key={wi} ref={el => weekRefs.current[wi] = el} style={{ marginBottom: useWeeks ? 8 : 0 }}>
                {useWeeks && (
                  <button
                    onClick={() => setExpandedWeeks(prev => ({ ...prev, [wi]: !prev[wi] }))}
                    aria-expanded={isExpanded}
                    aria-label={`Week ${wi + 1}, days ${weekStart} to ${weekEnd}, ${weekDone} of ${weekDays.length} complete`}
                    style={{
                      width: "100%", display: "flex", alignItems: "center", gap: 10,
                      padding: "12px 14px", background: allWeekDone
                        ? (darkMode ? "rgba(5,150,105,0.08)" : "#ECFDF5")
                        : (darkMode ? "#201A16" : "#fff"),
                      border: `1px solid ${allWeekDone ? (darkMode ? "#065F4644" : "#A7F3D0") : (darkMode ? "#2A2420" : "#E0D8C8")}`,
                      borderRadius: 10, cursor: "pointer", fontFamily: T.font,
                      marginBottom: isExpanded ? 6 : 0,
                    }}
                  >
                    <span style={{
                      width: 22, height: 22, borderRadius: "50%",
                      background: allWeekDone ? "#10B981" : (darkMode ? "#3A3028" : "#E5E7EB"),
                      color: allWeekDone ? "#fff" : T.muted,
                      display: "flex", alignItems: "center", justifyContent: "center",
                      fontSize: 11, fontWeight: 700, flexShrink: 0,
                    }}>
                      {allWeekDone ? "\u2713" : wi + 1}
                    </span>
                    <div style={{ flex: 1, textAlign: "left" }}>
                      <span style={{ fontSize: 14, fontWeight: 700, color: T.text }}>
                        Week {wi + 1}
                      </span>
                      <span style={{ fontSize: 12, color: T.muted, marginLeft: 8 }}>
                        Days {weekStart}\u2013{weekEnd}
                      </span>
                    </div>
                    <span style={{ fontSize: 12, fontWeight: 600, color: allWeekDone ? "#10B981" : T.muted }}>
                      {weekDone}/{weekDays.length}
                    </span>
                    <span style={{
                      fontSize: 14, color: T.muted,
                      transform: isExpanded ? "rotate(180deg)" : "rotate(0)",
                      transition: "transform 0.2s",
                    }}>{"\u25BE"}</span>
                  </button>
                )}

                {(isExpanded || !useWeeks) && (
                  <div style={{ display: "flex", flexDirection: "column", gap: 6,
                    padding: useWeeks ? "6px 0 0" : 0 }}>
                    {weekDays.map(entry => {
                      const dayComplete = entry.passages.every(p =>
                        completedSet.has(completionKey(entry.day, p.book, p.chapter))
                      );
                      const isToday = entry.day === todayDayNum && !dayComplete;
                      const trackGroups = groupByTrack(entry.passages);

                      return (
                        <div key={entry.day} style={{
                          background: dayComplete
                            ? (darkMode ? "rgba(5,150,105,0.06)" : "#F0FDF4")
                            : isToday
                              ? (darkMode ? "rgba(212,168,83,0.06)" : "#FFFBEB")
                              : (darkMode ? "#201A16" : "#fff"),
                          border: isToday
                            ? "1.5px solid #D4A853"
                            : `1px solid ${dayComplete ? (darkMode ? "#065F4633" : "#BBF7D0") : (darkMode ? "#2A242066" : "#E0D8C8")}`,
                          borderLeft: isToday ? "4px solid #D4A853" : undefined,
                          borderRadius: 12, overflow: "hidden",
                          opacity: (!dayComplete && !isToday) ? 0.7 : 1,
                          ...(isToday ? { animation: "pulseGlow 3s ease-in-out infinite", "--accent-rgb": "212,168,83" } : {}),
                        }}>
                          <div style={{
                            padding: "10px 14px",
                            display: "flex", alignItems: "center", gap: 10,
                            borderBottom: `1px solid ${darkMode ? "#2A242044" : "#F0EBE0"}`,
                          }}>
                            <span style={{
                              width: 26, height: 26, borderRadius: "50%",
                              background: dayComplete ? "#10B981" : `${plan?.color || "#888"}22`,
                              color: dayComplete ? "#fff" : (plan?.color || T.text),
                              display: "flex", alignItems: "center", justifyContent: "center",
                              fontSize: dayComplete ? 13 : 11, fontWeight: 700, flexShrink: 0,
                            }}>
                              {dayComplete ? "\u2713" : entry.day}
                            </span>
                            <div style={{ flex: 1 }}>
                              <span style={{ fontSize: 14, fontWeight: 700, color: T.text }}>
                                {entry.label}
                              </span>
                              {entry.label !== `Day ${entry.day}` && (
                                <span style={{ fontSize: 12, color: T.muted, marginLeft: 6 }}>
                                  \u2014 Day {entry.day}
                                </span>
                              )}
                            </div>
                            {isToday && (
                              <span style={{
                                background: "#D4A853", color: "#fff", fontSize: 9, fontWeight: 800,
                                padding: "2px 8px", borderRadius: 6, letterSpacing: "1px",
                                textTransform: "uppercase",
                              }}>TODAY</span>
                            )}
                            {dayComplete && (
                              <span style={{ fontSize: 11, fontWeight: 600, color: "#10B981" }}>
                                Complete
                              </span>
                            )}
                          </div>

                          <div style={{ padding: "6px 10px 10px" }}>
                            {trackGroups ? (
                              // M'Cheyne: group by track
                              Object.entries(trackGroups).map(([trackName, passages]) => (
                                <div key={trackName}>
                                  <div style={{
                                    fontSize: 10, fontWeight: 700, color: T.muted,
                                    textTransform: "uppercase", letterSpacing: "1.5px",
                                    padding: "6px 6px 2px", opacity: 0.7,
                                  }}>{trackName}</div>
                                  {passages.map(({ book, chapter }) => {
                                    const chKey = completionKey(entry.day, book, chapter);
                                    const isChDone = completedSet.has(chKey);
                                    return renderChapterRow(plan, entry, book, chapter, chKey, isChDone);
                                  })}
                                </div>
                              ))
                            ) : (
                              entry.passages.map(({ book, chapter, verseRange }) => {
                                const chKey = completionKey(entry.day, book, chapter);
                                const isChDone = completedSet.has(chKey);
                                return renderChapterRow(plan, entry, book, chapter, chKey, isChDone, verseRange);
                              })
                            )}
                          </div>
                        </div>
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })}
        </div>
        <ConfirmDialog />
        <CelebrationOverlay />
        <MilestoneBanner />
      </div>
    );
  }

  // ── Helper: chapter row in schedule ─────────────────────────────────────
  function renderChapterRow(plan, entry, book, chapter, chKey, isChDone, verseRange) {
    const isJustDone = justCompleted === chKey;
    return (
      <div key={chKey} style={{
        display: "flex", alignItems: "center", gap: 10,
        padding: "8px 6px", borderRadius: 8, marginBottom: 4,
        background: isChDone ? (darkMode ? "rgba(5,150,105,0.06)" : "#F0FDF4") : "transparent",
        ...(isJustDone ? { animation: "pageTurn 0.4s ease" } : {}),
      }}>
        <button
          onClick={() => toggleChapterComplete(activePlanId, entry.day, book, chapter)}
          role="checkbox"
          aria-checked={isChDone}
          aria-label={`Mark ${book} ${chapter} as ${isChDone ? "unread" : "read"}`}
          style={{
            width: 22, height: 22, borderRadius: 5, flexShrink: 0,
            border: isChDone ? "none" : `2px solid ${darkMode ? "#5A4A3A" : "#C8B89A"}`,
            background: isChDone ? "#10B981" : "transparent",
            color: "#fff", cursor: "pointer",
            display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: 12, fontWeight: 700, padding: 0,
          }}
        >
          {isChDone ? "\u2713" : ""}
        </button>

        <span style={{
          flex: 1, fontSize: 14, fontWeight: 600,
          color: isChDone ? T.muted : T.text,
          textDecoration: isChDone ? "line-through" : "none",
          opacity: isChDone ? 0.7 : 1,
        }}>
          {book} {chapter}{verseRange ? `:${verseRange}` : ""}
        </span>

        <button
          onClick={() => {
            setReaderCtx({ planId: activePlanId, day: entry.day, book, chapter, verseRange });
            setSubView("reader");
          }}
          aria-label={`Read ${book} ${chapter}`}
          style={{
            background: isChDone
              ? (darkMode ? "rgba(255,255,255,0.06)" : "#F3F4F6")
              : `linear-gradient(135deg, ${plan?.color}, ${lightenHex(plan?.color || "#888", 20)})`,
            color: isChDone ? T.muted : "#fff",
            border: "none", borderRadius: 8,
            padding: "6px 12px", fontSize: 12, fontWeight: 700,
            cursor: "pointer", fontFamily: T.font, flexShrink: 0,
          }}
        >
          {isChDone ? "Re-read" : "Read"}
        </button>
      </div>
    );
  }

  // ═══════ LIBRARY + MY PLANS ════════════════════════════════════════════
  return (
    <div style={{ minHeight: "100vh", background: T.wall, fontFamily: T.font }}>

      {/* ── HERO ── */}
      <div style={{
        background: "linear-gradient(160deg, #1A0E06 0%, #4A2410 60%, #2A1208 100%)",
        padding: "0 0 28px", position: "relative", overflow: "hidden",
        animation: "fadeIn 0.6s ease",
      }}>
        {[8, 22, 38, 55, 70, 85].map(top => (
          <div key={top} style={{
            position: "absolute", left: 0, right: 0, top: `${top}%`,
            height: 1, background: "rgba(255,255,255,0.025)",
          }} />
        ))}

        <div style={{ padding: "16px 20px 0", position: "relative" }}>
          <button onClick={() => nav("learn-home")} aria-label="Back to Learn" style={{
            background: "rgba(255,255,255,0.1)", border: "1px solid rgba(245,222,179,0.3)",
            borderRadius: 20, color: "#F5DEB3", padding: "6px 14px",
            fontSize: 13, cursor: "pointer", fontFamily: T.font,
          }}>{"\u2190"} Back</button>
        </div>

        <div style={{ textAlign: "center", padding: "16px 24px 0", position: "relative" }}>
          <div style={{ fontSize: 52, marginBottom: 8 }}>{"\uD83D\uDCDA"}</div>
          <h1 style={{
            color: "#F5DEB3", fontSize: 28, fontWeight: 700, margin: "0 0 6px",
            textShadow: "0 2px 12px rgba(0,0,0,0.6)", letterSpacing: "0.5px",
          }}>The Reading Room</h1>
          <p style={{ color: "rgba(245,222,179,0.7)", fontSize: 14, margin: "0 0 20px" }}>
            16 guided journeys through the Word of God
          </p>

          <div style={{ display: "flex", justifyContent: "center", gap: 28 }}>
            {[
              { label: "Plans",   value: "16" },
              { label: "Active",  value: activeCount },
              { label: "Shelves", value: "5" },
            ].map(s => (
              <div key={s.label} style={{ textAlign: "center" }}>
                <div style={{ color: "#F5DEB3", fontSize: 22, fontWeight: 700 }}>{s.value}</div>
                <div style={{ color: "rgba(245,222,179,0.55)", fontSize: 11 }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>

        <div style={{ display: "flex", justifyContent: "center", gap: 8, padding: "18px 20px 0" }}>
          {[
            { key: "library",  label: "\uD83D\uDCDA Library" },
            { key: "myPlans",  label: `\uD83D\uDD16 My Plans${activeCount ? ` (${activeCount})` : ""}` },
          ].map(t => (
            <button key={t.key} onClick={() => setSubView(t.key)} style={{
              padding: "8px 20px", borderRadius: 20,
              border: `1.5px solid ${subView === t.key ? "#F5DEB3" : "rgba(245,222,179,0.3)"}`,
              background: subView === t.key ? "#F5DEB3" : "transparent",
              color: subView === t.key ? "#2C1A0E" : "#F5DEB3",
              fontWeight: 600, fontSize: 14, cursor: "pointer", fontFamily: T.font,
              transition: "all 0.2s",
            }}>{t.label}</button>
          ))}
        </div>
      </div>

      {/* ── LIBRARY ── */}
      {subView === "library" && (
        <div style={{ padding: "28px 0 60px" }}>

          {SHELVES.map((shelf, shelfIdx) => {
            const plans = READING_PLANS.filter(p => p.shelf === shelf.id);
            return (
              <div key={shelf.id} style={{
                marginBottom: 44,
                animation: "shelfSlideUp 0.5s ease both",
                animationDelay: `${shelfIdx * 0.12}s`,
              }}>

                <div style={{ padding: "0 22px 12px", display: "flex", alignItems: "center", gap: 8 }}>
                  <span style={{ fontSize: 16 }}>{shelf.emoji}</span>
                  <span style={{
                    fontSize: 11, fontWeight: 700, color: T.muted,
                    textTransform: "uppercase", letterSpacing: "2px",
                  }}>{shelf.label}</span>
                  <div style={{ flex: 1, height: 1, background: "#C9A96E", opacity: 0.35, marginLeft: 6 }} />
                </div>

                <div style={{ padding: "8px 22px 0", display: "flex", gap: 8, flexWrap: "wrap" }}>
                  {plans.map((plan, spineIdx) => {
                    const isHovered = hoveredId === plan.id;
                    const isActive  = !!planData[plan.id];
                    const completedSet = getCompletedSet(plan.id);
                    const done      = countCompletedDays(plan.id, completedSet);
                    const total     = parseInt(plan.duration);
                    const pctVal    = isActive ? (done / total) : 0;
                    const light     = lightenHex(plan.color, 45);

                    return (
                      <button
                        key={plan.id}
                        onClick={() => openDetail(plan)}
                        onMouseEnter={() => setHoveredId(plan.id)}
                        onMouseLeave={() => setHoveredId(null)}
                        onFocus={() => setHoveredId(plan.id)}
                        onBlur={() => setHoveredId(null)}
                        aria-label={`${plan.title} \u2014 ${plan.duration}, ${plan.difficulty}`}
                        style={{
                          width: 62, display: "flex", flexDirection: "column",
                          cursor: "pointer", background: "none", border: "none", padding: 0,
                          transform: isHovered ? "translateY(-16px)" : "translateY(0)",
                          transition: "transform 0.28s cubic-bezier(0.34,1.56,0.64,1)",
                          filter: isHovered
                            ? "drop-shadow(0 16px 20px rgba(0,0,0,0.5))"
                            : isActive
                              ? "drop-shadow(0 3px 12px rgba(212,168,83,0.4))"
                              : "drop-shadow(0 3px 5px rgba(0,0,0,0.28))",
                          animation: `shelfSlideUp 0.35s ease both`,
                          animationDelay: `${0.15 + spineIdx * 0.06}s`,
                        }}
                      >
                        <div style={{
                          height: 5, borderRadius: "3px 3px 0 0",
                          background: darkMode ? "linear-gradient(90deg, #3A3028, #2E2620, #3A3028)" : "linear-gradient(90deg, #f0e8d8, #e8dcc8, #f0e8d8)",
                          borderTop: darkMode ? "1px solid #4A3C2E" : "1px solid #d4c4a0",
                        }} />

                        <div style={{
                          minHeight: 175,
                          background: `linear-gradient(90deg, ${plan.color}cc 0%, ${plan.color} 25%, ${light} 48%, ${plan.color} 72%, ${plan.color}aa 100%)`,
                          display: "flex", flexDirection: "column",
                          alignItems: "center", justifyContent: "space-between",
                          padding: "10px 0", position: "relative", overflow: "hidden",
                        }}>
                          <div style={{
                            position: "absolute", left: 7, top: 0, bottom: 0, width: 2,
                            background: "rgba(255,255,255,0.22)", borderRadius: 1,
                          }} />
                          <div style={{
                            position: "absolute", right: 5, top: 0, bottom: 0, width: 1,
                            background: "rgba(0,0,0,0.15)",
                          }} />

                          {isActive && (
                            <div style={{
                              position: "absolute", bottom: 0, left: 0, right: 0,
                              height: `${pctVal * 100}%`,
                              background: "rgba(255,255,255,0.18)",
                              transition: "height 0.5s ease",
                            }} />
                          )}

                          <span style={{ fontSize: 18, position: "relative",
                            filter: "drop-shadow(0 1px 3px rgba(0,0,0,0.5))" }}>
                            {plan.icon}
                          </span>

                          <div style={{
                            writingMode: "vertical-rl",
                            transform: "rotate(180deg)",
                            color: "#fff",
                            fontSize: 10.5,
                            fontWeight: 700,
                            fontFamily: T.font,
                            textShadow: "0 1px 4px rgba(0,0,0,0.6)",
                            lineHeight: 1.25,
                            maxHeight: 115,
                            overflow: "hidden",
                            textAlign: "center",
                            letterSpacing: "0.4px",
                            position: "relative",
                          }}>
                            {plan.title}
                          </div>

                          <div style={{
                            writingMode: "vertical-rl",
                            transform: "rotate(180deg)",
                            background: "rgba(0,0,0,0.28)",
                            borderRadius: 3, padding: "3px 3px",
                            fontSize: 8, color: "rgba(255,255,255,0.9)",
                            fontWeight: 600, letterSpacing: "0.5px",
                            position: "relative",
                          }}>
                            {plan.duration}
                          </div>
                        </div>

                        <div style={{
                          height: 7, borderRadius: "0 0 2px 2px",
                          background: `linear-gradient(180deg, ${plan.color}bb, ${plan.color}66)`,
                          borderBottom: "1px solid rgba(0,0,0,0.2)",
                        }} />

                        {isActive && (
                          <div style={{
                            width: 8, height: 8, borderRadius: "50%",
                            background: "#4ADE80", margin: "5px auto 0",
                            boxShadow: "0 0 8px #4ADE80, 0 0 2px #fff",
                          }} />
                        )}
                      </button>
                    );
                  })}
                </div>

                <div style={{ margin: "16px 14px 0" }}>
                  <div style={{
                    height: 16, borderRadius: "2px 2px 4px 4px",
                    background: T.wood,
                    boxShadow: "0 5px 12px rgba(0,0,0,0.35), inset 0 1px 0 rgba(255,255,255,0.12), inset 0 -1px 0 rgba(0,0,0,0.1)",
                  }} />
                  <div style={{
                    height: 6, marginTop: -1,
                    background: "linear-gradient(180deg, rgba(80,40,10,0.6), transparent)",
                    borderRadius: "0 0 4px 4px",
                  }} />
                </div>

              </div>
            );
          })}

          <p style={{
            textAlign: "center", color: T.muted, fontSize: 13,
            fontStyle: "italic", padding: "8px 32px 0",
          }}>
            {"\u201C"}Thy word is a lamp unto my feet, and a light unto my path.{"\u201D"} {"\u2014"} Psalm 119:105
          </p>
        </div>
      )}

      {/* ── MY PLANS ── */}
      {subView === "myPlans" && (
        <div style={{ padding: `24px ${bp.pad}px 60px`, maxWidth: bp.content, margin: "0 auto" }}>
          {myActivePlans.length === 0 ? (
            <div style={{ textAlign: "center", padding: "60px 24px" }}>
              <div style={{ fontSize: 56, marginBottom: 16 }}>{"\uD83D\uDCD6"}</div>
              <h3 style={{ color: T.text, fontSize: 20, margin: "0 0 10px" }}>Your shelf is empty</h3>
              <p style={{ color: T.muted, fontSize: 15, marginBottom: 24, lineHeight: 1.6 }}>
                Pull a book from the library to begin your journey.
              </p>
              <button onClick={() => setSubView("library")} style={{
                background: "linear-gradient(135deg, #4A2410, #1A0E06)",
                color: "#F5DEB3", border: "none", borderRadius: 12,
                padding: "13px 28px", fontSize: 15, fontWeight: 600,
                cursor: "pointer", fontFamily: T.font,
              }}>Browse the Library</button>
            </div>
          ) : (
            <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
              {myActivePlans.map(plan => {
                const completedSet = getCompletedSet(plan.id);
                const done    = countCompletedDays(plan.id, completedSet);
                const total   = parseInt(plan.duration);
                const pctVal  = Math.round((done / total) * 100);
                const isComplete = done >= total;

                return (
                  <div key={plan.id} style={{
                    background: T.cream, borderRadius: 16, overflow: "hidden",
                    boxShadow: "0 2px 12px rgba(0,0,0,0.1)",
                    borderLeft: `5px solid ${plan.color}`,
                  }}>
                    <div style={{ padding: "18px 18px 16px" }}>

                      <div style={{ display: "flex", gap: 12, alignItems: "center", marginBottom: 14 }}>
                        <span style={{ fontSize: 32 }}>{plan.icon}</span>
                        <div style={{ flex: 1 }}>
                          <h3 style={{ margin: 0, fontSize: 16, fontWeight: 700, color: T.text, display: "flex", alignItems: "center", gap: 6 }}>{plan.title} <StreakFire planId={plan.id} /></h3>
                          <p style={{ margin: 0, fontSize: 12, color: T.muted }}>{plan.subtitle}</p>
                        </div>
                        <DiffBadge difficulty={plan.difficulty} />
                      </div>

                      <div style={{ marginBottom: 12 }}>
                        <div style={{ display: "flex", justifyContent: "space-between",
                          fontSize: 13, fontWeight: 600, color: T.text, marginBottom: 6 }}>
                          <span>{done} of {total} days complete</span>
                          <span style={{ color: plan.color }}>{pctVal}%</span>
                        </div>
                        <ProgressBar value={done} max={total} color={plan.color} height={8} />
                      </div>

                      <div style={{ marginBottom: 14 }}>
                        <EstCompletion planId={plan.id} done={done} total={total} />
                      </div>

                      {isComplete && (
                        <div style={{
                          background: darkMode ? "rgba(5,150,105,0.12)" : "#D1FAE5",
                          borderRadius: 12, padding: "14px", marginBottom: 10, textAlign: "center",
                        }}>
                          <p style={{ margin: 0, fontSize: 15, color: darkMode ? "#4ADE80" : "#065F46", fontWeight: 700 }}>
                            Plan Complete {"\u2014"} Well done!
                          </p>
                        </div>
                      )}

                      <div style={{ display: "flex", gap: 8 }}>
                        <button
                          onClick={() => { setActivePlanId(plan.id); setSubView("schedule"); }}
                          style={{
                            flex: 1, padding: "12px", borderRadius: 10, border: "none",
                            background: `linear-gradient(135deg, ${plan.color}, ${lightenHex(plan.color, 20)})`,
                            color: "#fff", fontWeight: 700, fontSize: 14,
                            cursor: "pointer", fontFamily: T.font,
                          }}
                        >
                          {isComplete ? "View Schedule" : "Continue \u2192"}
                        </button>
                        <button
                          onClick={() => setConfirmAction({ type: "remove", planId: plan.id, title: plan.title })}
                          aria-label={`Remove ${plan.title}`}
                          style={{
                            padding: "12px 14px", borderRadius: 10,
                            border: `1px solid ${darkMode ? "#3A3028" : "#E0D8C8"}`,
                            background: "transparent", color: T.muted,
                            fontSize: 13, cursor: "pointer", fontFamily: T.font,
                          }}
                        >Remove</button>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          )}
        </div>
      )}

      {/* ── FULL-SCREEN DETAIL ── */}
      {detailOpen && selectedPlan && (
        <div
          role="dialog"
          aria-modal="true"
          aria-label={selectedPlan.title}
          style={{
            position: "fixed", inset: 0, zIndex: 3000,
            opacity: animIn ? 1 : 0,
            transition: "opacity 0.3s ease",
            pointerEvents: animIn ? "auto" : "none",
          }}
        >
          <div onClick={closeDetail} style={{
            position: "absolute", inset: 0,
            background: "rgba(10,5,2,0.6)",
          }} />

          <div style={{
            position: "absolute", inset: 0,
            background: T.bg,
            transform: animIn ? "translateX(0)" : "translateX(100%)",
            transition: "transform 0.35s cubic-bezier(0.32,0.72,0,1)",
            display: "flex", flexDirection: "column",
            overflowY: "auto",
          }}>

            <div style={{
              background: `linear-gradient(150deg, ${selectedPlan.color} 0%, ${lightenHex(selectedPlan.color, 25)} 55%, ${selectedPlan.color}cc 100%)`,
              padding: "0 0 32px", flexShrink: 0, position: "relative", overflow: "hidden",
            }}>
              <div style={{
                position: "absolute", left: 18, top: 0, bottom: 0, width: 3,
                background: "rgba(255,255,255,0.22)", borderRadius: 2,
              }} />

              <div style={{ padding: "16px 20px", display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                <button onClick={closeDetail} aria-label="Back to library" style={{
                  background: "rgba(0,0,0,0.2)", border: "none", borderRadius: 20,
                  color: "#fff", padding: "6px 14px", fontSize: 13,
                  cursor: "pointer", fontFamily: T.font,
                }}>{"\u2190"} Library</button>
                <button onClick={closeDetail} aria-label="Close" style={{
                  background: "rgba(0,0,0,0.2)", border: "none", borderRadius: "50%",
                  width: 34, height: 34, color: "#fff", fontSize: 20, cursor: "pointer",
                  display: "flex", alignItems: "center", justifyContent: "center",
                }}>{"\u00D7"}</button>
              </div>

              <div style={{ textAlign: "center", padding: "4px 28px 0" }}>
                <div style={{ fontSize: 56, marginBottom: 10,
                  filter: "drop-shadow(0 4px 10px rgba(0,0,0,0.3))" }}>
                  {selectedPlan.icon}
                </div>
                <h1 style={{
                  color: "#fff", fontSize: 24, fontWeight: 700, margin: "0 0 8px",
                  textShadow: "0 2px 10px rgba(0,0,0,0.3)", lineHeight: 1.25,
                }}>{selectedPlan.title}</h1>
                <p style={{ color: "rgba(255,255,255,0.82)", fontSize: 14, margin: "0 0 18px" }}>
                  {selectedPlan.subtitle}
                </p>

                <div style={{ display: "flex", gap: 6, justifyContent: "center", flexWrap: "wrap" }}>
                  {[selectedPlan.duration, selectedPlan.dailyTime,
                    `${selectedPlan.chapters.toLocaleString()} chapters`].map(s => (
                    <span key={s} style={{
                      background: "rgba(0,0,0,0.22)", borderRadius: 20,
                      padding: "5px 12px", color: "#fff", fontSize: 12, fontWeight: 600,
                    }}>{s}</span>
                  ))}
                  <DiffBadge difficulty={selectedPlan.difficulty} />
                </div>
              </div>
            </div>

            <div style={{ flex: 1, padding: `26px ${bp.pad}px 48px`, maxWidth: bp.contentWide, margin: "0 auto", width: "100%" }}>

              {planData[selectedPlan.id] && (() => {
                const completedSet = getCompletedSet(selectedPlan.id);
                const done  = countCompletedDays(selectedPlan.id, completedSet);
                const total = parseInt(selectedPlan.duration);
                const pctVal = Math.round((done / total) * 100);
                return (
                  <div style={{
                    background: darkMode ? "#201A16" : "#fff", borderRadius: 14, padding: "14px 16px",
                    marginBottom: 18, boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
                    border: `1px solid ${selectedPlan.color}33`,
                  }}>
                    <div style={{ display: "flex", justifyContent: "space-between",
                      fontSize: 13, fontWeight: 700, color: T.text, marginBottom: 7 }}>
                      <span>Your Progress</span>
                      <span style={{ color: selectedPlan.color }}>Day {done} / {total} {"\u2014"} {pctVal}%</span>
                    </div>
                    <ProgressBar value={done} max={total} color={selectedPlan.color} height={7} />
                    <div style={{ marginTop: 8 }}>
                      <EstCompletion planId={selectedPlan.id} done={done} total={total} />
                    </div>
                  </div>
                );
              })()}

              <div style={{
                background: darkMode ? "#201A16" : "#fff", borderRadius: 14, padding: "18px",
                marginBottom: 18, boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
              }}>
                <p style={{ margin: 0, fontSize: 15, color: T.text, lineHeight: 1.8, fontStyle: "italic" }}>
                  {selectedPlan.description}
                </p>
              </div>

              <div style={{
                background: darkMode ? "#201A16" : "#fff", borderRadius: 14, padding: "18px",
                marginBottom: 18, boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
              }}>
                <h3 style={{ margin: "0 0 12px", fontSize: 14, fontWeight: 700, color: T.text,
                  textTransform: "uppercase", letterSpacing: "1px",
                  display: "flex", alignItems: "center", gap: 8 }}>
                  <span style={{ color: selectedPlan.color, fontSize: 16 }}>{"\u25C6"}</span>
                  What You{"\u2019"}ll Read
                </h3>
                {selectedPlan.whatYoullRead.map((item, i) => (
                  <div key={i} style={{
                    display: "flex", gap: 10, alignItems: "flex-start",
                    padding: "8px 0", borderTop: i > 0 ? `1px solid ${T.wall}` : "none",
                  }}>
                    <span style={{ color: selectedPlan.color, fontWeight: 700, fontSize: 13,
                      flexShrink: 0, marginTop: 2 }}>{"\u2192"}</span>
                    <span style={{ fontSize: 14, color: T.text, lineHeight: 1.6 }}>{item}</span>
                  </div>
                ))}
              </div>

              <div style={{
                background: `${selectedPlan.color}0F`,
                border: `1px solid ${selectedPlan.color}30`,
                borderRadius: 12, padding: "13px 16px", marginBottom: 26,
              }}>
                <p style={{ margin: 0, fontSize: 13, color: T.muted, fontStyle: "italic" }}>
                  {"\uD83D\uDCCB"} <strong style={{ color: T.text }}>Structure:</strong> {selectedPlan.structure}
                </p>
              </div>

              {planData[selectedPlan.id] ? (
                <>
                  {(() => {
                    const completedSet = getCompletedSet(selectedPlan.id);
                    const done = countCompletedDays(selectedPlan.id, completedSet);
                    const total = parseInt(selectedPlan.duration);
                    const isComplete = done >= total;
                    return isComplete ? (
                      <>
                        <div style={{
                          background: darkMode ? "rgba(5,150,105,0.12)" : "#D1FAE5", borderRadius: 12, padding: "13px",
                          textAlign: "center", marginBottom: 12,
                          color: darkMode ? "#4ADE80" : "#065F46", fontWeight: 600, fontSize: 14,
                        }}>
                          Plan Complete {"\u2014"} Well done!
                        </div>
                        <div style={{ display: "flex", gap: 8 }}>
                          <button onClick={() => {
                            setActivePlanId(selectedPlan.id);
                            closeDetail();
                            setTimeout(() => setSubView("schedule"), 360);
                          }} style={{
                            flex: 1, padding: "16px", borderRadius: 14, border: "none",
                            background: `linear-gradient(135deg, ${selectedPlan.color}, ${lightenHex(selectedPlan.color, 20)})`,
                            color: "#fff", fontWeight: 700, fontSize: 17, cursor: "pointer",
                            fontFamily: T.font, boxShadow: `0 4px 16px ${selectedPlan.color}55`,
                          }}>View Schedule</button>
                          <button onClick={() => setConfirmAction({ type: "reset", planId: selectedPlan.id, title: selectedPlan.title })} style={{
                            padding: "16px 20px", borderRadius: 14,
                            border: `1px solid ${darkMode ? "#3A3028" : "#E0D8C8"}`,
                            background: "transparent", color: T.muted,
                            fontWeight: 600, fontSize: 14, cursor: "pointer", fontFamily: T.font,
                          }}>Reset</button>
                        </div>
                      </>
                    ) : (
                      <button onClick={() => {
                        setActivePlanId(selectedPlan.id);
                        closeDetail();
                        setTimeout(() => setSubView("schedule"), 360);
                      }} style={{
                        width: "100%", padding: "16px", borderRadius: 14, border: "none",
                        background: `linear-gradient(135deg, ${selectedPlan.color}, ${lightenHex(selectedPlan.color, 20)})`,
                        color: "#fff", fontWeight: 700, fontSize: 17, cursor: "pointer",
                        fontFamily: T.font, boxShadow: `0 4px 16px ${selectedPlan.color}55`,
                      }}>Continue Reading {"\u2192"}</button>
                    );
                  })()}
                </>
              ) : (
                <button onClick={() => startPlan(selectedPlan)} style={{
                  width: "100%", padding: "17px", borderRadius: 14, border: "none",
                  background: "linear-gradient(135deg, #1A0E06 0%, #4A2410 50%, #2A1208 100%)",
                  color: "#F5DEB3", fontWeight: 700, fontSize: 18, cursor: "pointer",
                  fontFamily: T.font, letterSpacing: "0.5px",
                  boxShadow: "0 6px 24px rgba(26,14,6,0.5)",
                }}>
                  Begin Reading {"\u2192"}
                </button>
              )}
            </div>
          </div>
        </div>
      )}

      <ConfirmDialog />
      <CelebrationOverlay />
      <MilestoneBanner />
    </div>
  );
}
