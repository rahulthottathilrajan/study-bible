"use client";
import { useState, useEffect } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import { Spinner } from "../components/ui";
import { QUIZ_BOOKS, BIBLE_BOOKS, CATEGORY_THEME, THEMES, DARK_THEMES } from "../constants";

// ═══════════════════════════════════════════════════
// QUIZ BROWSER — 3-step wizard: Difficulty → Book → Chapter
// ═══════════════════════════════════════════════════

const DIFFICULTIES = [
  { id: "kids",   label: "Kids",   icon: "🧒", desc: "Simple recall · 3 questions per chapter" },
  { id: "teens",  label: "Teens",  icon: "🎓", desc: "Deeper study · 5 questions per chapter" },
  { id: "adults", label: "Adults", icon: "📖", desc: "Scholarly detail · 8 questions per chapter" },
];

const QUIZ_BOOK_INFO = BIBLE_BOOKS.filter(b => QUIZ_BOOKS.includes(b.name));

export default function QuizBrowserView() {
  const { ht, darkMode, goBack, nav, setQuizDifficulty, loadQuizQuestions } = useApp();

  const [step, setStep] = useState(1);
  const [selDiff, setSelDiff] = useState(null);
  const [selBook, setSelBook] = useState(null);
  const [availChapters, setAvailChapters] = useState({});
  const [chapLoading, setChapLoading] = useState(false);
  const [starting, setStarting] = useState(false);

  // Load available chapters when entering step 3
  useEffect(() => {
    if (step !== 3 || !selBook || !selDiff) return;
    setChapLoading(true);
    const slug = selBook.name.toLowerCase().replace(/\s+/g, "-");
    const totalChapters = selBook.chapters || 1;
    fetch(`/data/quizzes/${slug}.json`)
      .then(r => r.ok ? r.json() : null)
      .then(data => {
        const map = {};
        for (let ch = 1; ch <= totalChapters; ch++) {
          map[ch] = !!(data?.[String(ch)]?.[selDiff]?.length);
        }
        setAvailChapters(map);
        setChapLoading(false);
      })
      .catch(() => { setAvailChapters({}); setChapLoading(false); });
  }, [step, selBook, selDiff]);

  const handleDiffSelect = (diff) => { setSelDiff(diff); setStep(2); };
  const handleBookSelect = (bookInfo) => { setSelBook(bookInfo); setAvailChapters({}); setStep(3); };

  const handleChapterSelect = async (ch) => {
    if (!availChapters[ch] || starting) return;
    setStarting(true);
    setQuizDifficulty(selDiff);
    await loadQuizQuestions(selBook.name, ch, selDiff);
    nav("quiz-active", { book: selBook.name, chapter: ch });
    setStarting(false);
  };

  const backHandler = step === 1 ? goBack : () => setStep(step - 1);

  const otBooks = QUIZ_BOOK_INFO.filter(b => b.testament === "OT");
  const ntBooks = QUIZ_BOOK_INFO.filter(b => b.testament === "NT");

  const subtitle = step === 1 ? "Choose difficulty" : step === 2 ? "Choose a book" : `${selBook?.name} · Choose chapter`;

  return (
    <div style={{ minHeight: "100vh", background: ht.bg }}>
      <Header title="Quiz Master" subtitle={subtitle} onBack={backHandler} theme={ht} hidePrayer />

      {/* Step progress dots */}
      <div style={{ display: "flex", justifyContent: "center", alignItems: "center", gap: 6, padding: "14px 0 2px" }}>
        {[1, 2, 3].map(s => (
          <div key={s} style={{
            width: s === step ? 22 : 8, height: 8, borderRadius: 4,
            background: s <= step ? ht.accent : ht.divider,
            transition: "all 0.3s ease",
          }} />
        ))}
      </div>

      <div style={{ padding: "20px 16px 60px", maxWidth: 640, margin: "0 auto" }}>

        {/* ── STEP 1: DIFFICULTY ── */}
        {step === 1 && (
          <div>
            <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 18, textAlign: "center" }}>
              Select your level
            </div>
            {DIFFICULTIES.map(d => (
              <div
                key={d.id}
                onClick={() => handleDiffSelect(d.id)}
                className="pressable"
                style={{
                  display: "flex", alignItems: "center", gap: 16,
                  padding: "20px 20px", borderRadius: 16, marginBottom: 12,
                  border: `1px solid ${ht.accentBorder}`, background: ht.card,
                  cursor: "pointer",
                }}
              >
                <div style={{ fontSize: 40, flexShrink: 0, lineHeight: 1 }}>{d.icon}</div>
                <div style={{ flex: 1 }}>
                  <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark }}>{d.label}</div>
                  <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginTop: 3 }}>{d.desc}</div>
                </div>
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                  <polyline points="9 18 15 12 9 6" />
                </svg>
              </div>
            ))}
          </div>
        )}

        {/* ── STEP 2: BOOK ── */}
        {step === 2 && (
          <div>
            {[{ label: "Old Testament", books: otBooks }, { label: "New Testament", books: ntBooks }].map(({ label, books }) => (
              <div key={label} style={{ marginBottom: 28 }}>
                <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 12 }}>
                  {label}
                </div>
                <div style={{ display: "flex", flexWrap: "wrap", gap: 8 }}>
                  {books.map(b => {
                    const catTheme = CATEGORY_THEME[b.category] || "home";
                    const bt = (darkMode ? DARK_THEMES : THEMES)[catTheme];
                    return (
                      <div
                        key={b.name}
                        onClick={() => handleBookSelect(b)}
                        className="pressable"
                        style={{
                          padding: "9px 16px", borderRadius: 22,
                          border: `1.5px solid ${bt.accentBorder}`,
                          background: bt.accentLight,
                          cursor: "pointer",
                          fontFamily: ht.ui, fontSize: 13, fontWeight: 600,
                          color: bt.accent,
                        }}
                      >
                        {b.name}
                      </div>
                    );
                  })}
                </div>
              </div>
            ))}
          </div>
        )}

        {/* ── STEP 3: CHAPTER ── */}
        {step === 3 && (
          <div>
            <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 16 }}>
              Available chapters for {selDiff}
            </div>
            {chapLoading ? (
              <div style={{ display: "flex", justifyContent: "center", padding: "48px 0" }}>
                <Spinner t={ht} />
              </div>
            ) : (
              <>
                <div style={{ display: "flex", flexWrap: "wrap", gap: 10, marginBottom: 24 }}>
                  {Object.entries(availChapters).map(([ch, available]) => (
                    <div
                      key={ch}
                      onClick={() => handleChapterSelect(Number(ch))}
                      className={available ? "pressable" : ""}
                      style={{
                        width: 48, height: 48, borderRadius: "50%",
                        display: "flex", alignItems: "center", justifyContent: "center",
                        fontFamily: ht.ui, fontSize: 15, fontWeight: 700,
                        cursor: available ? "pointer" : "default",
                        background: available ? ht.accent : "transparent",
                        color: available ? "#fff" : ht.light,
                        border: available ? "none" : `2px solid ${ht.divider}`,
                        opacity: starting ? 0.6 : available ? 1 : 0.35,
                        transition: "opacity 0.2s",
                      }}
                    >
                      {starting && availChapters[ch] === true && availChapters[Number(ch)] ? (
                        <div style={{ width: 16, height: 16, border: "2px solid #fff", borderTopColor: "transparent", borderRadius: "50%", animation: "spin 0.7s linear infinite" }} />
                      ) : ch}
                    </div>
                  ))}
                </div>
                {/* Legend */}
                <div style={{ display: "flex", alignItems: "center", gap: 16, fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>
                  <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                    <div style={{ width: 14, height: 14, borderRadius: "50%", background: ht.accent }} />
                    Quiz available
                  </div>
                  <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                    <div style={{ width: 14, height: 14, borderRadius: "50%", border: `2px solid ${ht.divider}`, opacity: 0.35 }} />
                    Not yet seeded
                  </div>
                </div>
              </>
            )}
          </div>
        )}

      </div>
    </div>
  );
}
