"use client";
import { useState, useEffect, useCallback, useRef } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import { Spinner, Card, Label } from "../components/ui";
import ConfettiParticles from "../components/ConfettiParticles";

// ═══════════════════════════════════════════════════
// QUIZ VIEW — quiz-intro, quiz-active, quiz-results
// "Duolingo meets Ancient Scrolls" — subtle & reverent
// ═══════════════════════════════════════════════════

const DIFFICULTIES = [
  { id: "kids",   label: "Kids",   icon: "🧒", desc: "Simple questions for young readers", range: "3–5 questions" },
  { id: "teens",  label: "Teens",  icon: "🎓", desc: "Intermediate study questions", range: "5–8 questions" },
  { id: "adults", label: "Adults", icon: "📖", desc: "In-depth chapter knowledge", range: "8–12 questions" },
];

// SVG Mastery Ring — animated on mount
function MasteryRing({ percentage = 0, size = 72, theme }) {
  const [animated, setAnimated] = useState(0);
  const r = (size - 8) / 2;
  const circ = 2 * Math.PI * r;
  const offset = circ - (animated / 100) * circ;

  useEffect(() => {
    const timer = setTimeout(() => setAnimated(percentage), 100);
    return () => clearTimeout(timer);
  }, [percentage]);

  const color = percentage >= 80 ? "#D4A853" : percentage >= 50 ? theme.accent : theme.muted;

  return (
    <svg width={size} height={size} style={{ transform: "rotate(-90deg)" }}>
      <circle cx={size / 2} cy={size / 2} r={r}
        fill="none" stroke={theme.divider} strokeWidth={4} />
      <circle cx={size / 2} cy={size / 2} r={r}
        fill="none" stroke={color} strokeWidth={4}
        strokeDasharray={circ} strokeDashoffset={offset}
        strokeLinecap="round"
        style={{ transition: "stroke-dashoffset 1s ease-out" }} />
    </svg>
  );
}

export default function QuizView() {
  const { view, book, chapter, t, goBack, nav, user,
    quizScores, quizQuestions, quizLoading, quizDifficulty,
    loadQuizQuestions, submitQuizScore, bp, badgeToast } = useApp();

  const [difficulty, setDifficulty] = useState(quizDifficulty || null);
  const [currentQ, setCurrentQ] = useState(0);
  const [selected, setSelected] = useState(null);
  const [revealed, setRevealed] = useState(false);
  const [answers, setAnswers] = useState([]);
  const [saved, setSaved] = useState(false);
  const [shuffledOptions, setShuffledOptions] = useState([]);
  const [availableDifficulties, setAvailableDifficulties] = useState({});
  const [checkingAvailability, setCheckingAvailability] = useState(true);
  const [transitioning, setTransitioning] = useState(false);
  const [displayScore, setDisplayScore] = useState(0);
  const [showReview, setShowReview] = useState(false);
  const [showConfetti, setShowConfetti] = useState(false);
  const [correctFlash, setCorrectFlash] = useState(false);
  const [wrongFlash, setWrongFlash] = useState(false);
  const [newBest, setNewBest] = useState(null);
  const [copied, setCopied] = useState(false);
  const [earnedBadge, setEarnedBadge] = useState(null);

  const chapterKey = `${book}-${chapter}`;
  const scores = quizScores[chapterKey] || [];
  const prevBadgeRef = useRef(null);

  // Track badge toast to detect newly earned badges during quiz
  useEffect(() => {
    if (view === "quiz-results" && badgeToast && prevBadgeRef.current !== badgeToast) {
      setEarnedBadge(badgeToast);
    }
    prevBadgeRef.current = badgeToast;
  }, [badgeToast, view]);

  // Check which difficulties have questions for this chapter
  useEffect(() => {
    if (view !== "quiz-intro") return;
    setCheckingAvailability(true);
    const slug = book.toLowerCase().replace(/\s+/g, "-");
    fetch(`/data/quizzes/${slug}.json`)
      .then(res => res.ok ? res.json() : null)
      .then(data => {
        const map = {};
        if (data?.[String(chapter)]) {
          Object.entries(data[String(chapter)]).forEach(([diff, questions]) => {
            if (questions.length > 0) map[diff] = questions.length;
          });
        }
        setAvailableDifficulties(map);
        setCheckingAvailability(false);
      })
      .catch(() => { setAvailableDifficulties({}); setCheckingAvailability(false); });
  }, [view, book, chapter]);

  // Reset state when entering intro
  useEffect(() => {
    if (view === "quiz-intro") {
      setDifficulty(null); setCurrentQ(0); setSelected(null);
      setRevealed(false); setAnswers([]); setSaved(false);
      setShuffledOptions([]); setShowReview(false); setShowConfetti(false);
      setNewBest(null); setEarnedBadge(null); setDisplayScore(0);
    }
  }, [view]);

  // Shuffle options when question changes
  useEffect(() => {
    if (view !== "quiz-active" || !quizQuestions.length || !quizQuestions[currentQ]) return;
    const q = quizQuestions[currentQ];
    const opts = [
      { key: "a", text: q.option_a },
      { key: "b", text: q.option_b },
      { key: "c", text: q.option_c },
      { key: "d", text: q.option_d },
    ];
    for (let i = opts.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [opts[i], opts[j]] = [opts[j], opts[i]];
    }
    setShuffledOptions(opts);
  }, [view, currentQ, quizQuestions]);

  const bestScore = useCallback((diff) => {
    const diffScores = scores.filter(s => s.difficulty === diff);
    if (!diffScores.length) return null;
    return Math.max(...diffScores.map(s => s.percentage));
  }, [scores]);

  // Overall chapter best across all difficulties
  const chapterBest = scores.length > 0 ? Math.max(...scores.map(s => s.percentage)) : 0;

  // Total questions answered for this chapter
  const totalAnswered = scores.reduce((sum, s) => sum + s.total_questions, 0);

  // Average score for this chapter
  const avgScore = scores.length > 0 ? Math.round(scores.reduce((sum, s) => sum + s.percentage, 0) / scores.length) : 0;

  const startQuiz = (diff) => {
    setDifficulty(diff);
    setCurrentQ(0); setSelected(null); setRevealed(false);
    setAnswers([]); setSaved(false); setCorrectFlash(false); setWrongFlash(false);
    loadQuizQuestions(book, chapter, diff);
    nav("quiz-active");
  };

  const handleSelect = (option) => {
    if (revealed) return;
    setSelected(option);
    setRevealed(true);
    const isCorrect = option === quizQuestions[currentQ].correct_answer;
    setAnswers(prev => [...prev, {
      questionNumber: quizQuestions[currentQ].question_number,
      selected: option,
      correct: quizQuestions[currentQ].correct_answer,
      isCorrect,
    }]);
    // Trigger micro-celebration or shake
    if (isCorrect) {
      setCorrectFlash(true);
      setTimeout(() => setCorrectFlash(false), 800);
    } else {
      setWrongFlash(true);
      setTimeout(() => setWrongFlash(false), 500);
    }
  };

  const nextQuestion = () => {
    if (currentQ + 1 < quizQuestions.length) {
      setTransitioning(true);
      setTimeout(() => {
        setCurrentQ(prev => prev + 1);
        setSelected(null);
        setRevealed(false);
        setCorrectFlash(false);
        setWrongFlash(false);
        setTransitioning(false);
      }, 50);
    } else {
      nav("quiz-results");
    }
  };

  const score = answers.filter(a => a.isCorrect).length;
  const total = quizQuestions.length;
  const percentage = total > 0 ? Math.round((score / total) * 100) : 0;
  const passed = percentage >= 70;

  // Animated score count-up on results
  useEffect(() => {
    if (view !== "quiz-results" || total === 0) return;
    setDisplayScore(0);
    const duration = 1500;
    const start = performance.now();
    const animate = (now) => {
      const elapsed = now - start;
      const progress = Math.min(elapsed / duration, 1);
      // Ease-out curve
      const eased = 1 - Math.pow(1 - progress, 3);
      setDisplayScore(Math.round(eased * percentage));
      if (progress < 1) requestAnimationFrame(animate);
    };
    requestAnimationFrame(animate);
  }, [view, total, percentage]);

  // Confetti on perfect score
  useEffect(() => {
    if (view === "quiz-results" && percentage === 100 && total > 0) {
      setShowConfetti(true);
      setTimeout(() => setShowConfetti(false), 2500);
    }
  }, [view, percentage, total]);

  // New best detection
  useEffect(() => {
    if (view !== "quiz-results" || total === 0 || !difficulty) return;
    const prev = bestScore(difficulty);
    if (prev !== null && percentage > prev) {
      setNewBest({ prev, current: percentage, delta: percentage - prev });
    }
  }, [view, total, difficulty, percentage, bestScore]);

  // Auto-save score on results
  useEffect(() => {
    if (view === "quiz-results" && user && total > 0 && !saved) {
      setSaved(true);
      submitQuizScore(book, chapter, difficulty, score, total);
    }
  }, [view, user, total, saved, submitQuizScore, book, chapter, difficulty, score]);

  const handleShare = () => {
    const text = `I scored ${percentage}% on ${book} ${chapter} Quiz (${difficulty}) — The Bible Scrollers`;
    navigator.clipboard?.writeText(text).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };

  // ═══ QUIZ INTRO ═══
  if (view === "quiz-intro") {
    const hasAnyQuiz = Object.keys(availableDifficulties).length > 0;
    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter} Quiz`} onBack={goBack} />
        <div style={{ maxWidth: bp.contentWide, margin: "0 auto", padding: `0 ${bp.pad}px 40px` }}>

          {/* Hero header card */}
          <div style={{
            background: t.headerGradient, borderRadius: 16, padding: "28px 24px 24px",
            position: "relative", overflow: "hidden", marginBottom: 16,
          }}>
            {/* Chapter watermark */}
            <div style={{
              position: "absolute", right: 16, top: -8, fontSize: 80, fontWeight: 800,
              fontFamily: t.heading, color: "rgba(255,255,255,0.06)", lineHeight: 1,
            }}>
              {chapter}
            </div>

            <div style={{ display: "flex", alignItems: "center", gap: 20, position: "relative" }}>
              {/* Mastery Ring */}
              <div style={{ flexShrink: 0, position: "relative" }}>
                <MasteryRing percentage={chapterBest} size={72} theme={{ ...t, divider: "rgba(255,255,255,0.15)" }} />
                <div style={{
                  position: "absolute", top: 0, left: 0, right: 0, bottom: 0,
                  display: "flex", alignItems: "center", justifyContent: "center",
                  fontFamily: t.ui, fontSize: 16, fontWeight: 800, color: "#fff",
                }}>
                  {chapterBest > 0 ? `${chapterBest}%` : "—"}
                </div>
              </div>

              <div style={{ flex: 1 }}>
                <div style={{ fontFamily: t.heading, fontSize: 24, fontWeight: 700, color: t.headerText, lineHeight: 1.2 }}>
                  {book}
                </div>
                <div style={{ fontFamily: t.ui, fontSize: 13, color: "rgba(255,255,255,0.65)", marginTop: 4 }}>
                  Chapter {chapter} · Test Your Knowledge
                </div>
              </div>
            </div>

            {/* Gold accent line */}
            <div style={{
              height: 2, marginTop: 20, borderRadius: 1,
              background: `linear-gradient(90deg, transparent, ${t.accent}, transparent)`,
              backgroundSize: "200% 100%",
              animation: "goldFlow 3s linear infinite",
            }} />

            {/* Stats bar */}
            {scores.length > 0 && (
              <div style={{
                display: "flex", gap: 16, marginTop: 14,
                fontFamily: t.ui, fontSize: 11, color: "rgba(255,255,255,0.5)",
              }}>
                <span>{totalAnswered} answered</span>
                <span>·</span>
                <span>{avgScore}% avg</span>
                <span>·</span>
                <span>Best: {chapterBest}%</span>
              </div>
            )}
          </div>

          {checkingAvailability ? (
            <Spinner t={t} />
          ) : !hasAnyQuiz ? (
            <Card t={t} style={{ marginTop: 14, textAlign: "center" }}>
              <span style={{ fontSize: 32 }}>📭</span>
              <div style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark, marginTop: 8 }}>
                No quizzes yet
              </div>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginTop: 4 }}>
                Quizzes for {book} {chapter} are coming soon!
              </div>
            </Card>
          ) : (
            <div>
              <Label icon="🎯" t={t}>Select Difficulty</Label>
              <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                {DIFFICULTIES.map((d, i) => {
                  const count = availableDifficulties[d.id] || 0;
                  const best = bestScore(d.id);
                  const available = count > 0;
                  const isFirstUntried = available && best === null &&
                    DIFFICULTIES.slice(0, i).every(prev => bestScore(prev.id) !== null || !(availableDifficulties[prev.id] > 0));
                  return (
                    <button key={d.id} onClick={() => available && startQuiz(d.id)} disabled={!available}
                      style={{
                        background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14,
                        padding: "16px 18px", textAlign: "left", cursor: available ? "pointer" : "default",
                        opacity: available ? 1 : 0.45, transition: "all 0.2s",
                        display: "flex", alignItems: "center", gap: 14,
                        animation: `fadeIn 0.4s ease ${i * 0.12}s both${isFirstUntried ? ", pulseGlow 2s ease-in-out infinite" : ""}`,
                      }}>
                      <span style={{ fontSize: 28 }}>{d.icon}</span>
                      <div style={{ flex: 1 }}>
                        <div style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark }}>
                          {d.label}
                        </div>
                        <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, marginTop: 2 }}>
                          {available ? `${count} questions — ${d.desc}` : "Not available yet"}
                        </div>
                      </div>
                      <div style={{ textAlign: "right", flexShrink: 0 }}>
                        {best !== null && (
                          <div style={{
                            fontFamily: t.ui, fontSize: 12, fontWeight: 700, padding: "3px 8px", borderRadius: 6,
                            background: best >= 70 ? "rgba(34,197,94,0.1)" : "rgba(239,68,68,0.1)",
                            color: best >= 70 ? "#22c55e" : "#ef4444",
                          }}>
                            Best: {best}%
                          </div>
                        )}
                        {available && best === null && (
                          <div style={{ fontFamily: t.ui, fontSize: 11, color: t.accent, fontWeight: 700 }}>
                            START →
                          </div>
                        )}
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {!user && hasAnyQuiz && (
            <Card t={t} style={{ marginTop: 14, textAlign: "center" }}>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>
                Sign in to save your quiz scores and earn badges
              </div>
              <button onClick={() => nav("account")} style={{
                marginTop: 10, fontFamily: t.ui, fontSize: 13, fontWeight: 700,
                color: "#fff", background: t.accent, border: "none", borderRadius: 8,
                padding: "8px 20px", cursor: "pointer",
              }}>
                Sign In
              </button>
            </Card>
          )}
        </div>
      </div>
    );
  }

  // ═══ QUIZ ACTIVE ═══
  if (view === "quiz-active") {
    if (quizLoading) return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter} Quiz`} onBack={goBack} />
        <Spinner t={t} />
      </div>
    );

    if (!quizQuestions.length) return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter} Quiz`} onBack={goBack} />
        <div style={{ textAlign: "center", padding: 40 }}>
          <span style={{ fontSize: 48 }}>📭</span>
          <div style={{ fontFamily: t.heading, fontSize: 18, color: t.dark, marginTop: 12 }}>No questions found</div>
        </div>
      </div>
    );

    const q = quizQuestions[currentQ];
    const displayLabels = ["A", "B", "C", "D"];
    const progress = ((currentQ + 1) / quizQuestions.length) * 100;
    const correctSoFar = answers.filter(a => a.isCorrect).length;

    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`Question ${currentQ + 1}/${quizQuestions.length}`}
          subtitle={`${book} ${chapter} — ${difficulty}`} onBack={goBack} />
        <div style={{ maxWidth: bp.contentWide, margin: "0 auto", padding: `0 ${bp.pad}px 40px` }}>

          {/* Progress bar with goldFlow shimmer */}
          <div style={{ position: "relative", height: 6, background: t.divider, borderRadius: 3, margin: "14px 0 18px", overflow: "hidden" }}>
            <div style={{
              height: "100%", width: `${progress}%`, borderRadius: 3,
              background: t.accent, transition: "width 0.4s ease",
            }} />
            <div style={{
              position: "absolute", top: 0, left: 0, width: `${progress}%`, height: "100%",
              background: `linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent)`,
              backgroundSize: "200% 100%", animation: "goldFlow 2s linear infinite",
              borderRadius: 3, transition: "width 0.4s ease",
            }} />
            {/* Riding indicator dot */}
            <div style={{
              position: "absolute", top: -3, left: `${progress}%`, transform: "translateX(-50%)",
              width: 12, height: 12, borderRadius: "50%", background: t.accent,
              border: `2px solid ${t.card}`, boxShadow: `0 0 6px ${t.accent}40`,
              transition: "left 0.4s ease",
            }} />
          </div>

          {/* Running score pill */}
          <div style={{
            display: "flex", justifyContent: "flex-end", marginBottom: 10,
          }}>
            <span style={{
              fontFamily: t.ui, fontSize: 11, fontWeight: 700, padding: "3px 10px",
              borderRadius: 6, background: t.accentLight, color: correctSoFar > 0 ? "#22c55e" : t.muted,
            }}>
              {correctSoFar}/{answers.length} ✓
            </span>
          </div>

          {/* Question card */}
          {!transitioning && (
            <div style={{ animation: "slideInRight 0.35s ease", position: "relative" }}>
              {/* Confetti particles on correct answer */}
              {correctFlash && <ConfettiParticles count={4} />}

              <Card t={t}>
                <div style={{ fontFamily: t.heading, fontSize: 17, fontWeight: 700, color: t.dark, lineHeight: 1.5, marginBottom: 18 }}>
                  {q.question}
                </div>

                <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                  {shuffledOptions.map((o, i) => {
                    const isCorrect = o.key === q.correct_answer;
                    const isSelected = selected === o.key;
                    let bg = t.bg;
                    let border = t.divider;
                    let textColor = t.text;
                    let anim = "";
                    if (revealed) {
                      if (isCorrect) {
                        bg = "rgba(34,197,94,0.1)"; border = "#22c55e"; textColor = "#15803d";
                        anim = "correctPulse 0.6s ease";
                      } else if (isSelected && !isCorrect) {
                        bg = "rgba(239,68,68,0.1)"; border = "#ef4444"; textColor = "#dc2626";
                        anim = "shakeWrong 0.4s ease";
                      }
                    }
                    return (
                      <button key={o.key} onClick={() => handleSelect(o.key)}
                        style={{
                          background: bg, border: `2px solid ${border}`, borderRadius: 12,
                          padding: "14px 16px", textAlign: "left", cursor: revealed ? "default" : "pointer",
                          display: "flex", alignItems: "flex-start", gap: 12, transition: "all 0.2s",
                          animation: anim || undefined,
                          opacity: revealed && !isCorrect && !isSelected ? 0.5 : 1,
                          transform: "scale(1)",
                        }}
                        onMouseDown={(e) => { if (!revealed) e.currentTarget.style.transform = "scale(0.98)"; }}
                        onMouseUp={(e) => { e.currentTarget.style.transform = "scale(1)"; }}
                        onMouseLeave={(e) => { e.currentTarget.style.transform = "scale(1)"; }}
                      >
                        <span style={{
                          fontFamily: t.heading, fontSize: 14, fontWeight: 800,
                          color: revealed && isCorrect ? "#22c55e" : revealed && isSelected ? "#ef4444" : t.accent,
                          minWidth: 24, height: 24, display: "flex", alignItems: "center", justifyContent: "center",
                          borderRadius: 6, background: revealed && isCorrect ? "rgba(34,197,94,0.15)" : revealed && isSelected ? "rgba(239,68,68,0.15)" : t.accentLight,
                        }}>
                          {revealed && isCorrect ? (
                            <span style={{ animation: "scaleIn 0.3s ease" }}>✓</span>
                          ) : revealed && isSelected ? "✗" : displayLabels[i]}
                        </span>
                        <span style={{ fontFamily: t.body, fontSize: 15, color: textColor, lineHeight: 1.5, flex: 1 }}>
                          {o.text}
                        </span>
                      </button>
                    );
                  })}
                </div>

                {/* Explanation — slides in */}
                {revealed && q.explanation && (
                  <div style={{
                    marginTop: 14, padding: "12px 14px", background: t.accentLight,
                    borderRadius: 10, border: `1px solid ${t.accentBorder}`,
                    animation: "fadeIn 0.4s ease",
                  }}>
                    <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 4, display: "flex", alignItems: "center", gap: 4 }}>
                      <span style={{ fontSize: 12 }}>📜</span> Explanation
                    </div>
                    <div style={{ fontFamily: t.body, fontSize: 14, color: t.text, lineHeight: 1.6 }}>
                      {q.explanation}
                    </div>
                  </div>
                )}
              </Card>
            </div>
          )}

          {/* Next button */}
          {revealed && !transitioning && (
            <button onClick={nextQuestion} style={{
              width: "100%", marginTop: 14, padding: "14px", borderRadius: 12,
              background: `linear-gradient(135deg, ${t.accent}, ${t.accent}dd)`,
              color: "#fff", border: "none", cursor: "pointer",
              fontFamily: t.heading, fontSize: 16, fontWeight: 700,
              animation: "fadeIn 0.3s ease", transition: "all 0.2s",
              display: "flex", alignItems: "center", justifyContent: "center", gap: 8,
            }}>
              {currentQ + 1 < quizQuestions.length ? (
                <>Next Question <span style={{ fontSize: 18 }}>→</span></>
              ) : (
                <>See Your Results <span style={{ fontSize: 16 }}>★</span></>
              )}
            </button>
          )}
        </div>
      </div>
    );
  }

  // ═══ QUIZ RESULTS ═══
  if (view === "quiz-results") {
    const isPerfect = percentage === 100;
    const scoreColor = isPerfect ? "#D4A853" : passed ? "#22c55e" : "#ef4444";
    const resultMessage = isPerfect ? "Perfect Knowledge" : passed ? "Well Done" : "Keep Growing";
    const resultEmoji = isPerfect ? "🏆" : passed ? "✨" : "📖";
    const resultSubtext = isPerfect
      ? "Flawless — your knowledge of this chapter is complete"
      : passed
        ? "Great work — you've demonstrated solid understanding"
        : "Every question teaches — review the chapter and try again";

    // Find next harder difficulty
    const diffOrder = ["kids", "teens", "adults"];
    const currentIdx = diffOrder.indexOf(difficulty);
    const harderDiff = currentIdx < 2 ? diffOrder[currentIdx + 1] : null;
    const harderAvailable = harderDiff && (availableDifficulties[harderDiff] > 0);

    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title="Quiz Results" subtitle={`${book} ${chapter}`} onBack={goBack} />
        <div style={{ maxWidth: bp.contentWide, margin: "0 auto", padding: `16px ${bp.pad}px 40px` }}>

          {/* Score card */}
          <div style={{
            background: isPerfect ? t.stone : t.card,
            borderRadius: 16, padding: "32px 24px 28px",
            border: `2px solid ${isPerfect ? "#D4A853" : passed ? "rgba(34,197,94,0.3)" : t.divider}`,
            boxShadow: isPerfect ? "0 4px 24px rgba(212,168,83,0.2)" : "0 2px 12px rgba(0,0,0,0.06)",
            textAlign: "center", position: "relative", overflow: "hidden",
            animation: isPerfect ? "celebrateGlow 2s ease-in-out infinite" : "fadeIn 0.4s ease",
          }}>
            {showConfetti && <ConfettiParticles count={8} />}

            <span style={{
              fontSize: 48, display: "block",
              animation: isPerfect ? "heartPop 0.6s ease" : "scaleIn 0.4s ease",
            }}>
              {resultEmoji}
            </span>

            <div style={{
              fontFamily: t.heading, fontSize: 48, fontWeight: 800, marginTop: 12,
              color: isPerfect ? (t.stoneText || scoreColor) : scoreColor,
              animation: "countUp 0.6s ease",
            }}>
              {displayScore}%
            </div>

            <div style={{ fontFamily: t.ui, fontSize: 15, color: isPerfect ? (t.stoneText || t.dark) : t.dark, marginTop: 4, fontWeight: 600 }}>
              {score} of {total} correct
            </div>

            <div style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 700, color: isPerfect ? (t.stoneText || scoreColor) : scoreColor, marginTop: 12 }}>
              {resultMessage}
            </div>

            <div style={{ fontFamily: t.ui, fontSize: 13, color: isPerfect ? (t.stoneText || t.muted) : t.muted, marginTop: 6, lineHeight: 1.5 }}>
              {resultSubtext}
            </div>

            {/* Gold accent line for perfect */}
            {isPerfect && (
              <div style={{
                height: 2, marginTop: 20, borderRadius: 1,
                background: "linear-gradient(90deg, transparent, #D4A853, transparent)",
                backgroundSize: "200% 100%", animation: "goldFlow 3s linear infinite",
              }} />
            )}

            {/* PASSED/KEEP STUDYING badge */}
            <div style={{
              display: "inline-block", marginTop: isPerfect ? 16 : 14, padding: "5px 16px", borderRadius: 20,
              fontFamily: t.ui, fontSize: 12, fontWeight: 700,
              background: passed ? "rgba(34,197,94,0.1)" : "rgba(239,68,68,0.1)",
              color: passed ? "#22c55e" : "#ef4444",
            }}>
              {passed ? "PASSED" : "KEEP STUDYING"}
            </div>
          </div>

          {/* New Best banner */}
          {newBest && (
            <div style={{
              marginTop: 12, padding: "10px 16px", borderRadius: 10,
              background: "rgba(212,168,83,0.1)", border: "1px solid rgba(212,168,83,0.25)",
              display: "flex", alignItems: "center", justifyContent: "center", gap: 8,
              animation: "fadeIn 0.5s ease",
            }}>
              <span style={{ fontSize: 14 }}>🎯</span>
              <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: "#D4A853" }}>
                NEW BEST! +{newBest.delta}% improvement
              </span>
            </div>
          )}

          {/* Inline badge earned */}
          {earnedBadge && (
            <div style={{
              marginTop: 12, padding: "14px 18px", borderRadius: 12,
              background: "rgba(212,168,83,0.08)", border: "1px solid rgba(212,168,83,0.25)",
              display: "flex", alignItems: "center", gap: 12,
              animation: "fadeIn 0.6s ease",
            }}>
              <span style={{ fontSize: 28 }}>{earnedBadge.icon}</span>
              <div>
                <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: "#D4A853", textTransform: "uppercase", letterSpacing: "0.1em" }}>
                  Badge Earned!
                </div>
                <div style={{ fontFamily: t.heading, fontSize: 15, fontWeight: 700, color: t.dark, marginTop: 2 }}>
                  {earnedBadge.name}
                </div>
              </div>
            </div>
          )}

          {/* Action buttons */}
          <div style={{ display: "flex", gap: 10, marginTop: 14 }}>
            <button onClick={() => startQuiz(difficulty)} style={{
              flex: 1, padding: "12px", borderRadius: 10, border: `1px solid ${t.accentBorder}`,
              background: t.accentLight, cursor: "pointer",
              fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.accent,
            }}>
              Retake Quiz
            </button>
            <button onClick={() => nav("verses")} style={{
              flex: 1, padding: "12px", borderRadius: 10, border: "none",
              background: t.accent, cursor: "pointer",
              fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: "#fff",
            }}>
              Back to Chapter
            </button>
          </div>

          {/* Try harder difficulty */}
          {harderAvailable && passed && (
            <button onClick={() => startQuiz(harderDiff)} style={{
              width: "100%", marginTop: 10, padding: "12px", borderRadius: 10,
              border: `1px dashed ${t.accentBorder}`, background: "transparent", cursor: "pointer",
              fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.accent,
              animation: "fadeIn 0.5s ease",
            }}>
              Try {DIFFICULTIES.find(d => d.id === harderDiff)?.label} Difficulty →
            </button>
          )}

          {/* Share button */}
          <button onClick={handleShare} style={{
            width: "100%", marginTop: 10, padding: "10px", borderRadius: 10,
            border: `1px solid ${t.divider}`, background: t.card, cursor: "pointer",
            fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: t.muted,
            display: "flex", alignItems: "center", justifyContent: "center", gap: 6,
          }}>
            {copied ? "✓ Copied!" : "📤 Share Score"}
          </button>

          {/* Collapsible answer review */}
          <div style={{ marginTop: 20 }}>
            <button onClick={() => setShowReview(!showReview)} style={{
              background: "none", border: "none", cursor: "pointer", padding: 0,
              fontFamily: t.ui, fontSize: 11.5, fontWeight: 700, color: t.accent,
              textTransform: "uppercase", letterSpacing: "0.1em",
              display: "flex", alignItems: "center", gap: 6, marginBottom: showReview ? 10 : 0,
            }}>
              <span>📋</span> Review {answers.length} Answers {showReview ? "▴" : "▾"}
            </button>

            {showReview && (
              <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
                {answers.map((a, i) => {
                  const q = quizQuestions[i];
                  if (!q) return null;
                  const correctText = { a: q.option_a, b: q.option_b, c: q.option_c, d: q.option_d }[q.correct_answer];
                  return (
                    <div key={i} style={{
                      background: t.card, borderRadius: 12, padding: "14px 16px",
                      border: `1px solid ${t.divider}`,
                      borderLeft: `3px solid ${a.isCorrect ? "#22c55e" : "#ef4444"}`,
                      animation: `fadeIn 0.3s ease ${i * 0.05}s both`,
                    }}>
                      <div style={{ display: "flex", alignItems: "flex-start", gap: 10 }}>
                        <span style={{ fontSize: 14, minWidth: 20, textAlign: "center", marginTop: 1 }}>
                          {a.isCorrect ? "✅" : "❌"}
                        </span>
                        <div style={{ flex: 1 }}>
                          <div style={{ fontFamily: t.body, fontSize: 14, color: t.dark, lineHeight: 1.5, fontWeight: 600 }}>
                            {q.question}
                          </div>
                          {!a.isCorrect && (
                            <div style={{ fontFamily: t.ui, fontSize: 12, color: "#22c55e", marginTop: 4 }}>
                              Correct: {correctText}
                            </div>
                          )}
                          {q.explanation && (
                            <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, marginTop: 4, fontStyle: "italic" }}>
                              {q.explanation}
                            </div>
                          )}
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        </div>
      </div>
    );
  }

  return null;
}
