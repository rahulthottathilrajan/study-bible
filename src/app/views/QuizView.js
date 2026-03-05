"use client";
import { useState, useEffect, useCallback } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import { Spinner, Card, Label } from "../components/ui";

// ═══════════════════════════════════════════════════
// QUIZ VIEW — quiz-intro, quiz-active, quiz-results
// ═══════════════════════════════════════════════════

const DIFFICULTIES = [
  { id: "kids",   label: "Kids",   icon: "🧒", desc: "Simple questions for young readers", range: "3–5 questions" },
  { id: "teens",  label: "Teens",  icon: "🎓", desc: "Intermediate study questions", range: "5–8 questions" },
  { id: "adults", label: "Adults", icon: "📖", desc: "In-depth chapter knowledge", range: "8–12 questions" },
];

export default function QuizView() {
  const { view, book, chapter, t, goBack, nav, user,
    quizScores, quizQuestions, quizLoading,
    loadQuizQuestions, submitQuizScore } = useApp();

  const [difficulty, setDifficulty] = useState(null);
  const [currentQ, setCurrentQ] = useState(0);
  const [selected, setSelected] = useState(null);
  const [revealed, setRevealed] = useState(false);
  const [answers, setAnswers] = useState([]);
  const [saved, setSaved] = useState(false);
  const [shuffledOptions, setShuffledOptions] = useState([]);
  const [availableDifficulties, setAvailableDifficulties] = useState({});
  const [checkingAvailability, setCheckingAvailability] = useState(true);

  const chapterKey = `${book}-${chapter}`;
  const scores = quizScores[chapterKey] || [];

  // Check which difficulties have questions for this chapter
  useEffect(() => {
    if (view !== "quiz-intro") return;
    setCheckingAvailability(true);
    import("../../lib/supabase").then(({ supabase }) => {
      supabase.from("chapter_quizzes")
        .select("difficulty")
        .eq("book_name", book)
        .eq("chapter_number", chapter)
        .then(({ data }) => {
          const map = {};
          if (data) data.forEach(q => { map[q.difficulty] = (map[q.difficulty] || 0) + 1; });
          setAvailableDifficulties(map);
          setCheckingAvailability(false);
        });
    });
  }, [view, book, chapter]);

  // Reset state when entering intro
  useEffect(() => {
    if (view === "quiz-intro") {
      setDifficulty(null);
      setCurrentQ(0);
      setSelected(null);
      setRevealed(false);
      setAnswers([]);
      setSaved(false);
      setShuffledOptions([]);
    }
  }, [view]);

  // Shuffle options when question changes (so correct answer isn't always in the same position)
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

  const startQuiz = (diff) => {
    setDifficulty(diff);
    setCurrentQ(0);
    setSelected(null);
    setRevealed(false);
    setAnswers([]);
    setSaved(false);
    loadQuizQuestions(book, chapter, diff);
    nav("quiz-active");
  };

  const handleSelect = (option) => {
    if (revealed) return;
    setSelected(option);
    setRevealed(true);
    setAnswers(prev => [...prev, {
      questionNumber: quizQuestions[currentQ].question_number,
      selected: option,
      correct: quizQuestions[currentQ].correct_answer,
      isCorrect: option === quizQuestions[currentQ].correct_answer,
    }]);
  };

  const nextQuestion = () => {
    if (currentQ + 1 < quizQuestions.length) {
      setCurrentQ(prev => prev + 1);
      setSelected(null);
      setRevealed(false);
    } else {
      nav("quiz-results");
    }
  };

  const score = answers.filter(a => a.isCorrect).length;
  const total = quizQuestions.length;
  const percentage = total > 0 ? Math.round((score / total) * 100) : 0;
  const passed = percentage >= 70;

  // Auto-save score on results view
  useEffect(() => {
    if (view === "quiz-results" && user && total > 0 && !saved) {
      setSaved(true);
      submitQuizScore(book, chapter, difficulty, score, total);
    }
  }, [view, user, total, saved, submitQuizScore, book, chapter, difficulty, score]);

  // ═══ QUIZ INTRO ═══
  if (view === "quiz-intro") {
    const hasAnyQuiz = Object.keys(availableDifficulties).length > 0;
    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter} Quiz`} onBack={goBack} />
        <div style={{ maxWidth: 620, margin: "0 auto", padding: "16px 16px 40px" }}>
          <Card t={t} accent>
            <div style={{ textAlign: "center", marginBottom: 6 }}>
              <span style={{ fontSize: 40 }}>📝</span>
            </div>
            <div style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 700, color: t.dark, textAlign: "center", marginBottom: 4 }}>
              Chapter {chapter} Quiz
            </div>
            <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, textAlign: "center", marginBottom: 16 }}>
              Test your knowledge of {book} {chapter}
            </div>
          </Card>

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
            <div style={{ marginTop: 14 }}>
              <Label icon="🎯" t={t}>Select Difficulty</Label>
              <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                {DIFFICULTIES.map(d => {
                  const count = availableDifficulties[d.id] || 0;
                  const best = bestScore(d.id);
                  const available = count > 0;
                  return (
                    <button key={d.id} onClick={() => available && startQuiz(d.id)} disabled={!available}
                      style={{
                        background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14,
                        padding: "16px 18px", textAlign: "left", cursor: available ? "pointer" : "default",
                        opacity: available ? 1 : 0.45, transition: "all 0.15s",
                        display: "flex", alignItems: "center", gap: 14,
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

    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`Question ${currentQ + 1}/${quizQuestions.length}`}
          subtitle={`${book} ${chapter} — ${difficulty}`} onBack={goBack} />
        <div style={{ maxWidth: 620, margin: "0 auto", padding: "0 16px 40px" }}>

          {/* Progress bar */}
          <div style={{ height: 4, background: t.divider, borderRadius: 2, margin: "14px 0 18px", overflow: "hidden" }}>
            <div style={{ height: "100%", width: `${progress}%`, background: t.accent, borderRadius: 2, transition: "width 0.3s ease" }} />
          </div>

          {/* Question */}
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
                if (revealed) {
                  if (isCorrect) { bg = "rgba(34,197,94,0.1)"; border = "#22c55e"; textColor = "#15803d"; }
                  else if (isSelected && !isCorrect) { bg = "rgba(239,68,68,0.1)"; border = "#ef4444"; textColor = "#dc2626"; }
                }
                return (
                  <button key={o.key} onClick={() => handleSelect(o.key)}
                    style={{
                      background: bg, border: `2px solid ${border}`, borderRadius: 12,
                      padding: "14px 16px", textAlign: "left", cursor: revealed ? "default" : "pointer",
                      display: "flex", alignItems: "flex-start", gap: 12, transition: "all 0.2s",
                    }}>
                    <span style={{
                      fontFamily: t.heading, fontSize: 14, fontWeight: 800, color: revealed && isCorrect ? "#22c55e" : t.accent,
                      minWidth: 24, height: 24, display: "flex", alignItems: "center", justifyContent: "center",
                      borderRadius: 6, background: revealed && isCorrect ? "rgba(34,197,94,0.15)" : t.accentLight,
                    }}>
                      {revealed && isCorrect ? "✓" : revealed && isSelected ? "✗" : displayLabels[i]}
                    </span>
                    <span style={{ fontFamily: t.body, fontSize: 15, color: textColor, lineHeight: 1.5, flex: 1 }}>
                      {o.text}
                    </span>
                  </button>
                );
              })}
            </div>

            {/* Explanation */}
            {revealed && q.explanation && (
              <div style={{
                marginTop: 14, padding: "12px 14px", background: t.accentLight,
                borderRadius: 10, border: `1px solid ${t.accentBorder}`,
              }}>
                <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 4 }}>
                  Explanation
                </div>
                <div style={{ fontFamily: t.body, fontSize: 14, color: t.text, lineHeight: 1.6 }}>
                  {q.explanation}
                </div>
              </div>
            )}
          </Card>

          {/* Next button */}
          {revealed && (
            <button onClick={nextQuestion} style={{
              width: "100%", marginTop: 14, padding: "14px", borderRadius: 12,
              background: t.accent, color: "#fff", border: "none", cursor: "pointer",
              fontFamily: t.heading, fontSize: 16, fontWeight: 700, transition: "all 0.2s",
            }}>
              {currentQ + 1 < quizQuestions.length ? "Next Question →" : "See Results →"}
            </button>
          )}
        </div>
      </div>
    );
  }

  // ═══ QUIZ RESULTS ═══
  if (view === "quiz-results") {
    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title="Quiz Results" subtitle={`${book} ${chapter}`} onBack={goBack} />
        <div style={{ maxWidth: 620, margin: "0 auto", padding: "16px 16px 40px" }}>

          {/* Score card */}
          <Card t={t} accent>
            <div style={{ textAlign: "center" }}>
              <span style={{ fontSize: 48 }}>{passed ? "🎉" : "📖"}</span>
              <div style={{
                fontFamily: t.heading, fontSize: 42, fontWeight: 800, marginTop: 8,
                color: passed ? "#22c55e" : "#ef4444",
              }}>
                {percentage}%
              </div>
              <div style={{ fontFamily: t.ui, fontSize: 15, color: t.dark, marginTop: 4, fontWeight: 600 }}>
                {score} of {total} correct
              </div>
              <div style={{
                display: "inline-block", marginTop: 10, padding: "4px 14px", borderRadius: 20,
                fontFamily: t.ui, fontSize: 12, fontWeight: 700,
                background: passed ? "rgba(34,197,94,0.1)" : "rgba(239,68,68,0.1)",
                color: passed ? "#22c55e" : "#ef4444",
              }}>
                {passed ? "PASSED" : "KEEP STUDYING"}
              </div>
            </div>
          </Card>

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

          {/* Answer review */}
          <div style={{ marginTop: 20 }}>
            <Label icon="📋" t={t}>Answer Review</Label>
            <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
              {answers.map((a, i) => {
                const q = quizQuestions[i];
                if (!q) return null;
                const correctText = { a: q.option_a, b: q.option_b, c: q.option_c, d: q.option_d }[q.correct_answer];
                return (
                  <Card key={i} t={t}>
                    <div style={{ display: "flex", alignItems: "flex-start", gap: 10 }}>
                      <span style={{
                        fontSize: 16, minWidth: 24, textAlign: "center", marginTop: 1,
                      }}>
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
                  </Card>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    );
  }

  return null;
}
