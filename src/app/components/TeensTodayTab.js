"use client";
import { useState, useMemo, useCallback } from "react";
import { TEEN_LESSONS } from "./TeensCurriculumData";

// ═══════════════════════════════════════════════════
// HELPERS
// ═══════════════════════════════════════════════════
const dayOfYear = () => {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / 86400000);
};
const today = () => new Date().toISOString().slice(0, 10);

const STREAK_MSGS = {
  0:  "Start your journey today!",
  1:  "Great start — keep it going!",
  3:  "3 days strong!",
  7:  "One week — you\u2019re on fire! \uD83D\uDD25",
  14: "Two weeks — unstoppable! \uD83D\uDD25\uD83D\uDD25",
  30: "30 days — legendary! \uD83D\uDD25\uD83D\uDD25\uD83D\uDD25",
  52: "A full year of growth — incredible!",
};
const getStreakMsg = (count) => {
  const keys = Object.keys(STREAK_MSGS).map(Number).sort((a, b) => b - a);
  for (const k of keys) if (count >= k) return STREAK_MSGS[k];
  return STREAK_MSGS[0];
};

// ═══════════════════════════════════════════════════
// TODAY TAB
// ═══════════════════════════════════════════════════
export default function TeensTodayTab({
  TC, completedLessons, journalEntries, studyStreak,
  verseMastery, dailyLog, dailyChallenges,
  onSaveReflection, onCompleteChallenge, onVerseMastery,
  onOpenLesson, xp, level,
}) {
  const [flipped, setFlipped] = useState(false);
  const [reflectionOpen, setReflectionOpen] = useState(false);
  const [reflectionText, setReflectionText] = useState("");
  const [challengeExpanded, setChallengeExpanded] = useState(false);
  const [revealedHints, setRevealedHints] = useState({});

  const todayStr = today();
  const doy = dayOfYear();
  const todayLog = dailyLog[todayStr] || {};

  // ── Daily Memory Verse ──
  // Pick from completed lessons' memory verses, cycling daily
  const verseLesson = useMemo(() => {
    const pool = TEEN_LESSONS.filter(l => completedLessons.includes(l.week));
    if (pool.length === 0) return TEEN_LESSONS[0]; // fallback to week 1
    return pool[doy % pool.length];
  }, [completedLessons, doy]);

  // ── Daily Reflection ──
  const reflectionLesson = useMemo(() => TEEN_LESSONS[doy % 52], [doy]);

  // ── Daily Challenge ──
  const challengeLesson = useMemo(() => TEEN_LESSONS[(doy + 17) % 52], [doy]);

  // ── Streak Calendar (last 7 days) ──
  const streakDays = useMemo(() => {
    const days = [];
    for (let i = 6; i >= 0; i--) {
      const d = new Date();
      d.setDate(d.getDate() - i);
      const dateStr = d.toISOString().slice(0, 10);
      const dayLabel = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"][d.getDay()];
      days.push({ date: dateStr, label: dayLabel, active: (studyStreak.history || []).includes(dateStr), isToday: i === 0 });
    }
    return days;
  }, [studyStreak.history]);

  const masteryLevel = verseMastery[verseLesson.week]?.level || 0;
  const isMastered = masteryLevel >= 5;

  const handleFlip = useCallback(() => setFlipped(p => !p), []);

  const handleVerseResponse = useCallback((gotIt) => {
    onVerseMastery(verseLesson.week, gotIt);
    setFlipped(false);
  }, [verseLesson.week, onVerseMastery]);

  const handleSaveReflection = useCallback(() => {
    if (!reflectionText.trim()) return;
    onSaveReflection(reflectionLesson.week, reflectionText.trim());
    setReflectionText("");
    setReflectionOpen(false);
  }, [reflectionText, reflectionLesson.week, onSaveReflection]);

  return (
    <div style={{ animation: "fadeIn 0.4s ease" }}>

      {/* ── Streak Calendar ── */}
      <div style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 14, padding: "16px 18px", marginBottom: 16 }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 12 }}>
          <div>
            <div style={{ fontFamily: TC.ui, fontSize: 13, fontWeight: 700, color: TC.text }}>Study Streak</div>
            <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.muted, marginTop: 2 }}>{getStreakMsg(studyStreak.count)}</div>
          </div>
          <div style={{ display: "flex", alignItems: "center", gap: 4, background: studyStreak.count > 0 ? TC.streakActive + "20" : TC.streakInactive + "30", borderRadius: 20, padding: "4px 12px" }}>
            <span style={{ fontSize: 16 }} aria-hidden="true">{studyStreak.count >= 30 ? "\uD83D\uDD25\uD83D\uDD25\uD83D\uDD25" : studyStreak.count >= 14 ? "\uD83D\uDD25\uD83D\uDD25" : studyStreak.count >= 7 ? "\uD83D\uDD25" : "\u2B50"}</span>
            <span style={{ fontFamily: TC.ui, fontSize: 14, fontWeight: 800, color: studyStreak.count > 0 ? TC.streakActive : TC.muted }}>{studyStreak.count}</span>
          </div>
        </div>
        <div style={{ display: "flex", justifyContent: "space-between", gap: 6 }}>
          {streakDays.map(d => (
            <div key={d.date} style={{ flex: 1, textAlign: "center" }}>
              <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted, marginBottom: 4, textTransform: "uppercase", letterSpacing: "0.05em" }}>{d.label}</div>
              <div style={{
                width: 32, height: 32, borderRadius: "50%", margin: "0 auto",
                display: "flex", alignItems: "center", justifyContent: "center",
                background: d.active ? TC.accent : "transparent",
                border: `2px solid ${d.active ? TC.accent : d.isToday ? TC.accent : TC.streakInactive}`,
                animation: d.isToday && !d.active ? "sacredPulse 2s infinite" : "none",
                transition: "all 0.3s",
              }}>
                {d.active ? (
                  <span style={{ color: "#fff", fontSize: 12, fontWeight: 700 }}>{"\u2713"}</span>
                ) : d.isToday ? (
                  <span style={{ width: 8, height: 8, borderRadius: "50%", background: TC.accent, animation: "sacredPulse 2s infinite" }} />
                ) : null}
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* ── Memory Verse Flashcard ── */}
      <div style={{ marginBottom: 16 }}>
        <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.muted, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 8, display: "flex", alignItems: "center", gap: 6 }}>
          <span aria-hidden="true">{"\uD83C\uDCCF"}</span> Daily Memory Verse
          {isMastered && <span style={{ background: TC.xpGold + "25", color: TC.xpGold, borderRadius: 4, padding: "1px 6px", fontSize: 9, fontWeight: 700 }}>{"\u2B50"} MASTERED</span>}
        </div>
        <div
          role="button"
          tabIndex={0}
          aria-label={flipped ? "Verse revealed. Tap to flip back" : "Tap to reveal verse"}
          onClick={handleFlip}
          onKeyDown={(e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); handleFlip(); } }}
          style={{ perspective: 600, cursor: "pointer" }}
        >
          <div style={{
            position: "relative", height: 180, borderRadius: 16,
            transformStyle: "preserve-3d",
            transition: "transform 0.6s cubic-bezier(.4,.2,.2,1)",
            transform: flipped ? "rotateY(180deg)" : "rotateY(0)",
          }}>
            {/* Front */}
            <div style={{
              position: "absolute", inset: 0, borderRadius: 16, backfaceVisibility: "hidden",
              background: TC.flashcardFront, display: "flex", flexDirection: "column",
              alignItems: "center", justifyContent: "center", padding: 24,
              boxShadow: "0 8px 32px rgba(79,70,229,0.25)",
            }}>
              <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: "rgba(255,255,255,0.6)", textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12 }}>Can you recall?</div>
              <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: "#fff", textAlign: "center", lineHeight: 1.3 }}>
                {verseLesson.memoryVerse.split(" \u2014 ")[1] || verseLesson.memoryVerse.split(" — ")[1] || `Week ${verseLesson.week}`}
              </div>
              <div style={{ fontFamily: TC.ui, fontSize: 11, color: "rgba(255,255,255,0.5)", marginTop: 16 }}>Tap to reveal</div>
            </div>
            {/* Back */}
            <div style={{
              position: "absolute", inset: 0, borderRadius: 16, backfaceVisibility: "hidden",
              transform: "rotateY(180deg)",
              background: TC.flashcardBack, display: "flex", flexDirection: "column",
              alignItems: "center", justifyContent: "center", padding: 24,
              boxShadow: "0 8px 32px rgba(5,150,105,0.25)",
            }}>
              <div style={{ fontFamily: TC.body, fontSize: 14, fontStyle: "italic", color: "#fff", textAlign: "center", lineHeight: 1.7, maxHeight: 100, overflow: "hidden" }}>
                {verseLesson.memoryVerse.split(" \u2014 ")[0] || verseLesson.memoryVerse.split(" — ")[0] || verseLesson.memoryVerse}
              </div>
            </div>
          </div>
        </div>
        {/* Response buttons */}
        {flipped && !todayLog.verse && (
          <div style={{ display: "flex", gap: 10, marginTop: 10, animation: "fadeIn 0.3s ease" }}>
            <button onClick={() => handleVerseResponse(true)} style={{ flex: 1, padding: "10px 0", borderRadius: 10, border: "none", background: TC.completionGreen, color: "#fff", fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
              {"\u2705"} Got it! (+10 XP)
            </button>
            <button onClick={() => handleVerseResponse(false)} style={{ flex: 1, padding: "10px 0", borderRadius: 10, border: `1px solid ${TC.divider}`, background: TC.card, color: TC.muted, fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
              Still learning
            </button>
          </div>
        )}
        {todayLog.verse && (
          <div style={{ textAlign: "center", fontFamily: TC.ui, fontSize: 11, color: TC.completionGreen, marginTop: 8, animation: "fadeIn 0.3s ease" }}>
            {"\u2705"} Verse reviewed today!
          </div>
        )}
      </div>

      {/* ── Daily Reflection Prompt ── */}
      <div style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 14, padding: 16, marginBottom: 16, animation: "fadeIn 0.4s ease 0.1s both" }}>
        <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 8 }}>
          <span style={{ fontSize: 16 }} aria-hidden="true">{"\u270D\uFE0F"}</span>
          <div style={{ fontFamily: TC.ui, fontSize: 13, fontWeight: 700, color: TC.text }}>Daily Reflection</div>
          {todayLog.reflection && <span style={{ fontSize: 12, marginLeft: "auto" }}>{"\u2705"}</span>}
        </div>
        <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, marginBottom: 10 }}>
          {reflectionLesson.journalPrompt.prompt}
        </div>
        <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.accent, marginBottom: 8 }}>
          From Week {reflectionLesson.week}: {reflectionLesson.title}
        </div>
        {!todayLog.reflection && (
          <>
            {!reflectionOpen ? (
              <button onClick={() => setReflectionOpen(true)} style={{ padding: "8px 20px", borderRadius: 10, border: "none", background: TC.accent, color: "#fff", fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                Reflect (+25 XP)
              </button>
            ) : (
              <div style={{ animation: "fadeIn 0.3s ease" }}>
                <textarea
                  value={reflectionText}
                  onChange={(e) => setReflectionText(e.target.value)}
                  placeholder="Write your reflection..."
                  aria-label="Daily reflection"
                  style={{ width: "100%", minHeight: 80, border: `1px solid ${TC.divider}`, borderRadius: 8, padding: 10, fontFamily: TC.body, fontSize: 13, color: TC.text, background: TC.bg, resize: "vertical", boxSizing: "border-box" }}
                />
                <button onClick={handleSaveReflection} style={{ marginTop: 8, padding: "8px 20px", borderRadius: 10, border: "none", background: TC.accent, color: "#fff", fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                  Save Reflection
                </button>
              </div>
            )}
          </>
        )}
        {todayLog.reflection && (
          <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.completionGreen }}>Reflection saved today!</div>
        )}
      </div>

      {/* ── Daily Challenge ── */}
      <div style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 14, padding: 16, marginBottom: 16, animation: "fadeIn 0.4s ease 0.2s both" }}>
        <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 8 }}>
          <span style={{ fontSize: 16 }} aria-hidden="true">{"\uD83E\uDDE0"}</span>
          <div style={{ fontFamily: TC.ui, fontSize: 13, fontWeight: 700, color: TC.text }}>Daily Challenge</div>
          {todayLog.challenge && <span style={{ fontSize: 12, marginLeft: "auto" }}>{"\u2705"}</span>}
        </div>
        <div style={{ fontFamily: TC.body, fontSize: 13.5, fontWeight: 600, color: TC.text, lineHeight: 1.7, marginBottom: 8 }}>
          {challengeLesson.thinkDeeper.question}
        </div>
        <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.accent, marginBottom: 10 }}>
          From Week {challengeLesson.week}: {challengeLesson.title}
        </div>

        {!todayLog.challenge && (
          <>
            {!challengeExpanded ? (
              <button onClick={() => setChallengeExpanded(true)} style={{ padding: "8px 20px", borderRadius: 10, border: "none", background: TC.challengeBg, color: TC.challengeColor, fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                Think About It
              </button>
            ) : (
              <div style={{ animation: "fadeIn 0.3s ease" }}>
                <div style={{ background: TC.challengeBg, borderLeft: `3px solid ${TC.challengeColor}`, borderRadius: 6, padding: "10px 14px", marginBottom: 10 }}>
                  <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7 }}>{challengeLesson.thinkDeeper.challenge}</div>
                </div>
                {challengeLesson.thinkDeeper.hints.map((h, i) => (
                  <button key={i} onClick={() => setRevealedHints(p => ({ ...p, [i]: true }))} aria-label={revealedHints[i] ? `Hint ${i+1}` : `Reveal hint ${i+1}`} style={{ display: "block", width: "100%", padding: "8px 12px", marginBottom: 6, borderRadius: 6, border: `1px solid ${TC.divider}`, cursor: "pointer", background: "transparent", textAlign: "left" }}>
                    <div style={{ fontFamily: TC.body, fontSize: 12.5, color: TC.text, lineHeight: 1.6, filter: revealedHints[i] ? "none" : "blur(5px)", transition: "filter 0.3s" }}>{h}</div>
                    {!revealedHints[i] && <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted, textAlign: "center" }}>Tap to reveal</div>}
                  </button>
                ))}
                <button onClick={() => onCompleteChallenge()} style={{ marginTop: 8, padding: "10px 20px", borderRadius: 10, border: "none", background: TC.accent, color: "#fff", fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer", width: "100%" }}>
                  I reflected on this (+15 XP)
                </button>
              </div>
            )}
          </>
        )}
        {todayLog.challenge && (
          <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.completionGreen }}>Challenge completed today!</div>
        )}
      </div>

      {/* ── Today's XP Summary ── */}
      <div style={{ background: `${TC.xpGold}12`, border: `1px solid ${TC.xpGold}30`, borderRadius: 14, padding: "14px 18px", textAlign: "center" }}>
        <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: TC.xpGold, textTransform: "uppercase", letterSpacing: "0.1em", marginBottom: 4 }}>Today&apos;s Progress</div>
        <div style={{ display: "flex", justifyContent: "center", gap: 16 }}>
          <div>
            <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: TC.xpGold }}>{xp}</div>
            <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted }}>Total XP</div>
          </div>
          <div style={{ width: 1, background: TC.divider }} />
          <div>
            <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: TC.accent }}>{level}</div>
            <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted }}>Level</div>
          </div>
          <div style={{ width: 1, background: TC.divider }} />
          <div>
            <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: TC.text }}>
              {[todayLog.verse, todayLog.reflection, todayLog.challenge].filter(Boolean).length}/3
            </div>
            <div style={{ fontFamily: TC.ui, fontSize: 9, color: TC.muted }}>Daily Tasks</div>
          </div>
        </div>
      </div>
    </div>
  );
}
