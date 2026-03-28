"use client";
import { useMemo, useRef, useEffect } from "react";
import { TEEN_LESSONS } from "./TeensCurriculumData";

// ═══════════════════════════════════════════════════
// CONSTANTS
// ═══════════════════════════════════════════════════
const TERM_INFO = [
  { term: "Term 1", title: "Foundations", subtitle: "Who God Is & Why Obedience Matters", weeks: [1,2,3,4,5,6,7,8,9,10,11,12,13], color: "#4338CA", bg: "#EEF2FF" },
  { term: "Term 2", title: "Heroes of Faith", subtitle: "Abraham through Esther", weeks: [14,15,16,17,18,19,20,21,22,23,24,25,26], color: "#92400E", bg: "#FEF3C7" },
  { term: "Term 3", title: "The Gospel & the Cross", subtitle: "Promised Messiah through Resurrection", weeks: [27,28,29,30,31,32,33,34,35,36,37,38,39], color: "#991B1B", bg: "#FEE2E2" },
  { term: "Term 4", title: "Living for God", subtitle: "Holy Spirit through Return of Christ", weeks: [40,41,42,43,44,45,46,47,48,49,50,51,52], color: "#6B21A8", bg: "#F3E8FF" },
];
const CHECKPOINTS = [13, 26, 39, 52];

// ═══════════════════════════════════════════════════
// CONFETTI (reuse pattern from QuizView)
// ═══════════════════════════════════════════════════
const ConfettiParticles = ({ active, TC }) => {
  if (!active) return null;
  const particles = Array.from({ length: 8 }, (_, i) => {
    const angle = (i / 8) * 360;
    const cx = Math.cos(angle * Math.PI / 180) * 40;
    const cy = -Math.abs(Math.sin(angle * Math.PI / 180) * 50) - 20;
    const colors = [TC.accent, TC.completionGreen, TC.xpGold, TC.prophecyOT, "#7C3AED", "#EC4899"];
    return (
      <span key={i} style={{
        position: "absolute", width: 6, height: 6, borderRadius: 2,
        background: colors[i % colors.length],
        animation: `confettiBurst 0.8s ease-out ${i * 0.04}s forwards`,
        "--cx": `${cx}px`, "--cy": `${cy}px`, "--cr": `${angle + 180}deg`,
      }} />
    );
  });
  return <div style={{ position: "absolute", top: "50%", left: "50%", pointerEvents: "none" }}>{particles}</div>;
};

// ═══════════════════════════════════════════════════
// JOURNEY PATH COMPONENT
// ═══════════════════════════════════════════════════
export default function TeensJourneyPath({
  TC, completedLessons, lessonProgress, xp, level,
  completedCount, studyStreak, onOpenLesson, onShare,
}) {
  const pathRef = useRef(null);

  // Determine current lesson (first uncompleted)
  const currentWeek = useMemo(() => {
    for (let w = 1; w <= 52; w++) {
      if (!completedLessons.includes(w)) return w;
    }
    return 52;
  }, [completedLessons]);

  // Auto-scroll to current week on mount
  useEffect(() => {
    if (!pathRef.current) return;
    const currentNode = pathRef.current.querySelector(`[data-week="${currentWeek}"]`);
    if (currentNode) {
      setTimeout(() => currentNode.scrollIntoView({ behavior: "smooth", block: "center" }), 300);
    }
  }, [currentWeek]);

  const termCompletions = useMemo(() =>
    TERM_INFO.map(t => ({
      ...t,
      done: t.weeks.filter(w => completedLessons.includes(w)).length,
      complete: t.weeks.every(w => completedLessons.includes(w)),
    })),
    [completedLessons]
  );

  return (
    <div style={{ animation: "fadeIn 0.4s ease" }}>

      {/* ── Stats Card ── */}
      <div style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 14, padding: "18px 20px", marginBottom: 20 }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 14 }}>
          <div style={{ fontFamily: TC.ui, fontSize: 13, fontWeight: 700, color: TC.text }}>My Journey</div>
          {completedCount > 0 && onShare && (
            <button onClick={onShare} style={{ padding: "6px 14px", borderRadius: 8, border: `1px solid ${TC.accentBorder}`, background: TC.accentLight, color: TC.accent, fontFamily: TC.ui, fontSize: 11, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", gap: 4 }}>
              {"\uD83D\uDCE4"} Share My Journey
            </button>
          )}
        </div>
        <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr", gap: 8, textAlign: "center" }}>
          {[
            { n: completedCount, l: "Lessons", c: TC.accent },
            { n: xp.toLocaleString(), l: "XP", c: TC.xpGold },
            { n: level, l: "Level", c: TC.accent },
            { n: `${studyStreak.count}d`, l: "Streak", c: TC.streakActive },
          ].map((s, i) => (
            <div key={i} style={{ background: `${s.c}10`, borderRadius: 8, padding: "10px 4px" }}>
              <div style={{ fontFamily: TC.heading, fontSize: 18, fontWeight: 700, color: s.c }}>{s.n}</div>
              <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted, textTransform: "uppercase", letterSpacing: "0.06em" }}>{s.l}</div>
            </div>
          ))}
        </div>
      </div>

      {/* ── Term Progress Bars ── */}
      <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 8, marginBottom: 24 }}>
        {termCompletions.map(t => {
          const pct = Math.round((t.done / t.weeks.length) * 100);
          return (
            <div key={t.term} style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 10, padding: 12 }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 6 }}>
                <span style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: t.color, background: t.bg, borderRadius: 4, padding: "2px 6px" }}>{t.term}</span>
                <span style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: t.complete ? TC.completionGreen : TC.muted }}>
                  {t.complete ? "\u2705" : `${t.done}/${t.weeks.length}`}
                </span>
              </div>
              <div style={{ height: 3, background: TC.divider, borderRadius: 3 }}>
                <div style={{ height: 3, background: t.complete ? TC.completionGreen : TC.accent, borderRadius: 3, width: `${pct}%`, transition: "width 0.3s" }} />
              </div>
            </div>
          );
        })}
      </div>

      {/* ── Visual Journey Path ── */}
      <div ref={pathRef} style={{ position: "relative", paddingBottom: 40 }}>
        {TERM_INFO.map((term, termIdx) => (
          <div key={term.term}>
            {/* Term Banner */}
            <div style={{
              display: "flex", alignItems: "center", gap: 12, padding: "12px 0", marginBottom: 8,
              animation: `fadeIn 0.4s ease ${termIdx * 0.1}s both`,
            }}>
              <div style={{ flex: 1, height: 1, background: TC.divider }} />
              <div style={{ background: term.bg, borderRadius: 20, padding: "6px 16px", textAlign: "center" }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 800, color: term.color }}>{term.title}</div>
                <div style={{ fontFamily: TC.ui, fontSize: 9, color: term.color + "99" }}>{term.subtitle}</div>
              </div>
              <div style={{ flex: 1, height: 1, background: TC.divider }} />
            </div>

            {/* Nodes */}
            {term.weeks.map((week, nodeIdx) => {
              const lesson = TEEN_LESSONS[week - 1];
              const isCompleted = completedLessons.includes(week);
              const isCurrent = week === currentWeek;
              const isCheckpoint = CHECKPOINTS.includes(week);
              const isLeft = nodeIdx % 2 === 0;
              const sectionsRead = (lessonProgress[week] || []).length;

              return (
                <div
                  key={week}
                  data-week={week}
                  style={{
                    display: "flex",
                    flexDirection: isLeft ? "row" : "row-reverse",
                    alignItems: "center",
                    gap: 12,
                    padding: "6px 0",
                    animation: `fadeIn 0.35s ease ${(termIdx * 13 + nodeIdx) * 0.03}s both`,
                  }}
                >
                  {/* Connector line */}
                  <div style={{ width: 40, display: "flex", justifyContent: "center", position: "relative" }}>
                    {/* Vertical line above */}
                    {nodeIdx > 0 && (
                      <div style={{
                        position: "absolute", top: -6, width: 2, height: 12,
                        background: completedLessons.includes(term.weeks[nodeIdx - 1]) ? TC.pathActive : TC.pathLine,
                        transition: "background 0.3s",
                      }} />
                    )}
                    {/* Node circle */}
                    <button
                      onClick={() => onOpenLesson(lesson)}
                      aria-label={`Week ${week}: ${lesson.title}${isCompleted ? " (completed)" : isCurrent ? " (current)" : ""}`}
                      style={{
                        width: isCurrent ? 44 : isCheckpoint ? 40 : 34,
                        height: isCurrent ? 44 : isCheckpoint ? 40 : 34,
                        borderRadius: "50%",
                        border: `3px solid ${isCompleted ? TC.nodeComplete : isCurrent ? TC.accent : TC.nodeUpcoming}`,
                        background: isCompleted ? TC.nodeComplete : isCurrent ? TC.accent + "15" : "transparent",
                        display: "flex", alignItems: "center", justifyContent: "center",
                        cursor: "pointer",
                        animation: isCurrent ? "glowPulse 2s infinite" : isCompleted && isCheckpoint ? "celebrateGlow 3s infinite" : "none",
                        transition: "all 0.3s",
                        position: "relative",
                        zIndex: 2,
                      }}
                    >
                      {isCompleted ? (
                        <span style={{ fontSize: isCheckpoint ? 18 : 14 }} aria-hidden="true">
                          {isCheckpoint ? "\uD83C\uDFC6" : lesson.icon}
                        </span>
                      ) : isCurrent ? (
                        <span style={{ fontSize: 16, animation: "orbFloat 3s ease-in-out infinite" }} aria-hidden="true">{lesson.icon}</span>
                      ) : (
                        <span style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: TC.nodeUpcoming }}>{week}</span>
                      )}
                      {/* Confetti on completed checkpoints */}
                      {isCheckpoint && isCompleted && <ConfettiParticles active={true} TC={TC} />}
                    </button>
                  </div>

                  {/* Label */}
                  <div
                    role="button"
                    tabIndex={0}
                    onClick={() => onOpenLesson(lesson)}
                    onKeyDown={(e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); onOpenLesson(lesson); } }}
                    style={{
                      flex: 1, cursor: "pointer",
                      background: isCurrent ? TC.card : "transparent",
                      border: isCurrent ? `1px solid ${TC.accentBorder}` : "none",
                      borderRadius: 10,
                      padding: isCurrent ? "10px 14px" : "4px 0",
                      transition: "all 0.2s",
                    }}
                  >
                    <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                      <span style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: isCompleted ? TC.nodeComplete : isCurrent ? TC.accent : TC.muted }}>
                        W{week}
                      </span>
                      {isCompleted && <span style={{ fontSize: 10 }} aria-hidden="true">{"\u2705"}</span>}
                      {isCurrent && <span style={{ fontFamily: TC.ui, fontSize: 8, fontWeight: 700, color: TC.accent, background: TC.accentLight, borderRadius: 4, padding: "1px 5px" }}>YOU ARE HERE</span>}
                      {sectionsRead > 0 && !isCompleted && (
                        <span style={{ fontFamily: TC.ui, fontSize: 8, color: TC.muted }}>{sectionsRead}/9</span>
                      )}
                    </div>
                    <div style={{
                      fontFamily: TC.ui, fontSize: isCurrent ? 13 : 11,
                      fontWeight: isCurrent ? 700 : 500,
                      color: isCompleted ? TC.text : isCurrent ? TC.text : TC.muted,
                      lineHeight: 1.3, marginTop: 2,
                    }}>
                      {lesson.title}
                    </div>
                    {isCurrent && (
                      <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.accent, marginTop: 4, fontWeight: 600 }}>
                        {lesson.bibleRef}
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        ))}

        {/* Graduation */}
        {completedCount >= 52 && (
          <div style={{ textAlign: "center", padding: "24px 0", animation: "stampIn 0.5s ease" }}>
            <div style={{ fontSize: 48, marginBottom: 8 }}>{"\uD83C\uDF93"}</div>
            <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: TC.accent }}>Graduate!</div>
            <div style={{ fontFamily: TC.ui, fontSize: 12, color: TC.muted }}>You completed the entire 52-week journey</div>
          </div>
        )}
      </div>
    </div>
  );
}
