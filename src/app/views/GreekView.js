"use client";
import { useState, useEffect, useCallback, useRef } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";
import {
  ALL_GREEK_LETTERS, GREEK_VOCAB_GROUPS, GRAMMAR_LESSONS, READING_VERSES,
  VERSE_DATA, WORDS_JOHN1V1, WORDS_JOHN3V16, WORDS_ROM8V28, WORDS_PHIL4V13,
  READING_REFLECTIONS, DAILY_CHALLENGES, GWOTD_POOL,
} from "../components/GreekData";

const getDayOfYear = () => { const now = new Date(); const start = new Date(now.getFullYear(),0,0); return Math.floor((now - start) / 86400000); };

const WORDS_MAP = { john1v1: WORDS_JOHN1V1, john3v16: WORDS_JOHN3V16, rom8v28: WORDS_ROM8V28, phil4v13: WORDS_PHIL4V13 };

export default function GreekView() {
  const {
    view, darkMode, user,
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, setGreekAlphabet, greekVocab, setGreekVocab,
    greekCategory, setGreekCategory, greekProgress,
    greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer,
    greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup,
    greekGrammarLesson, setGreekGrammarLesson, greekGrammarLessonIds,
    greekReadingVerse, setGreekReadingVerse,
    greekReadingStep, setGreekReadingStep,
    greekShowLetters, setGreekShowLetters,
    greekStreak, updateGreekStreak,
    greekError, loadGreekLessons,
    nav, goBack,
    markGreekComplete, loadGreekLesson, bp,
  } = useApp();

  // Local state for daily challenge, lexicon, flashcards, journal
  const [challengeAnswer, setChallengeAnswer] = useState(null);
  const [lexicon, setLexicon] = useState(() => { try { return JSON.parse(localStorage.getItem("greekLexicon") || "[]"); } catch { return []; } });
  const [flashcardData, setFlashcardData] = useState(() => { try { return JSON.parse(localStorage.getItem("greekFlashcardData") || "{}"); } catch { return {}; } });
  const [flashcardIdx, setFlashcardIdx] = useState(0);
  const [flashcardFlipped, setFlashcardFlipped] = useState(false);
  const [flashcardSession, setFlashcardSession] = useState([]);
  const [flashcardResults, setFlashcardResults] = useState(null);
  const [journalEntries, setJournalEntries] = useState(() => { try { return JSON.parse(localStorage.getItem("greekJournalEntries") || "[]"); } catch { return []; } });
  const [journalText, setJournalText] = useState("");
  const [grammarLoading, setGrammarLoading] = useState(null);
  const greekCache = useRef({});

  // Daily challenge state (date-based)
  const challengeDate = typeof localStorage !== "undefined" ? localStorage.getItem("greekChallengeDate") : null;
  const today = new Date().toISOString().slice(0, 10);
  const challengeAlreadyDone = challengeDate === today;
  const dayOfYear = getDayOfYear();
  const challengeType = dayOfYear % 3; // 0=alphabet, 1=vocab, 2=grammar
  const challengePool = challengeType === 0 ? DAILY_CHALLENGES.alphabet : challengeType === 1 ? DAILY_CHALLENGES.vocab : DAILY_CHALLENGES.grammar;
  const dailyChallenge = challengePool[dayOfYear % challengePool.length];

  // Persist lexicon and flashcard data
  const saveLexicon = useCallback((items) => { setLexicon(items); localStorage.setItem("greekLexicon", JSON.stringify(items)); }, []);
  const addToLexicon = useCallback((wordId) => { setLexicon(prev => { if (prev.includes(wordId)) return prev; const next = [...prev, wordId]; localStorage.setItem("greekLexicon", JSON.stringify(next)); return next; }); }, []);
  const saveFlashcardData = useCallback((data) => { setFlashcardData(data); localStorage.setItem("greekFlashcardData", JSON.stringify(data)); }, []);

  // Collect words from GWOTD study
  const studyDailyWord = useCallback(() => {
    const word = GWOTD_POOL[dayOfYear % GWOTD_POOL.length];
    addToLexicon(word.strongs);
    localStorage.setItem("greekWotdLastSeen", today);
    if (updateGreekStreak) updateGreekStreak();
  }, [dayOfYear, today, addToLexicon, updateGreekStreak]);

  // ═══ MASTERY DASHBOARD ═══
  const MasteryDashboard = ({ gt }) => {
    const cats = [
      { label:"Alphabet", icon:"Α", total:24, color:"#1B7A6E" },
      { label:"Vocabulary", icon:"📚", total:30, color:"#1A2F4B" },
      { label:"Grammar", icon:"📝", total:27, color:"#2A5E58" },
      { label:"Reading", icon:"📖", total:4, color:"#1B7A6E" },
    ];
    const allCompleted = Object.values(greekProgress).filter(p => p.completed).length;
    const totalAll = 85;
    const overallPct = Math.round((allCompleted / totalAll) * 100);
    const circumference = 2 * Math.PI * 36;
    return (
      <Card t={gt} style={{ marginBottom:18 }}>
        <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between", marginBottom:12 }}>
          <Label icon="📊" t={gt}>My Mastery</Label>
          {greekStreak > 0 && <span style={{ fontFamily:gt.ui, fontSize:12, fontWeight:700, color:"#D97706", background:"#FEF3C7", padding:"3px 10px", borderRadius:8 }}>🔥 {greekStreak} day{greekStreak > 1 ? "s" : ""}</span>}
        </div>
        <div style={{ display:"grid", gridTemplateColumns:"repeat(2,1fr)", gap:12 }}>
          {cats.map(cat => {
            const completed = cat.label === "Alphabet" ? Object.values(greekProgress).filter(p => p.completed).length : 0; // simplified — real count from lessons
            const pct = cat.total > 0 ? completed / cat.total : 0;
            return (
              <div key={cat.label} style={{ textAlign:"center", padding:"10px 4px" }}>
                <svg width="80" height="80" viewBox="0 0 80 80">
                  <circle cx="40" cy="40" r="36" fill="none" stroke={gt.divider} strokeWidth="5"/>
                  <circle cx="40" cy="40" r="36" fill="none" stroke={pct >= 0.8 ? "#D4A853" : cat.color} strokeWidth="5" strokeDasharray={circumference} strokeDashoffset={circumference * (1 - pct)} strokeLinecap="round" style={{ transition:"stroke-dashoffset 1s ease", transform:"rotate(-90deg)", transformOrigin:"center" }}/>
                  <text x="40" y="36" textAnchor="middle" style={{ fontSize:18, fontFamily:"'Times New Roman',serif", fill:gt.accent }}>{cat.icon}</text>
                  <text x="40" y="52" textAnchor="middle" style={{ fontSize:10, fontFamily:gt.ui, fill:gt.muted, fontWeight:700 }}>{completed}/{cat.total}</text>
                </svg>
                <div style={{ fontFamily:gt.ui, fontSize:10, fontWeight:700, color:gt.text, marginTop:2 }}>{cat.label}</div>
              </div>
            );
          })}
        </div>
        <div style={{ textAlign:"center", marginTop:8, padding:"8px", background:gt.accentLight, borderRadius:10 }}>
          <span style={{ fontFamily:gt.ui, fontSize:13, fontWeight:700, color:overallPct >= 80 ? "#D4A853" : gt.accent }}>{overallPct}% Overall</span>
          <span style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted, marginLeft:8 }}>{allCompleted} of {totalAll} lessons</span>
        </div>
      </Card>
    );
  };

  // ═══ DAILY CHALLENGE CARD ═══
  const DailyChallengeCard = ({ gt }) => {
    const handleChallengeAnswer = (idx) => {
      if (challengeAlreadyDone || challengeAnswer !== null) return;
      setChallengeAnswer(idx);
      const correct = idx === dailyChallenge.ans;
      localStorage.setItem("greekChallengeDate", today);
      localStorage.setItem("greekChallengeResult", correct ? "true" : "false");
      const count = parseInt(localStorage.getItem("greekChallengeCount") || "0");
      localStorage.setItem("greekChallengeCount", String(count + 1));
      if (correct && updateGreekStreak) updateGreekStreak();
    };
    const savedResult = challengeAlreadyDone ? localStorage.getItem("greekChallengeResult") === "true" : null;
    const showResult = challengeAnswer !== null || challengeAlreadyDone;
    const isCorrect = challengeAnswer !== null ? challengeAnswer === dailyChallenge.ans : savedResult;
    return (
      <Card t={gt} style={{ marginBottom:18, borderLeft:`3px solid ${gt.accent}`, position:"relative", overflow:"hidden" }}>
        <div style={{ display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom:10 }}>
          <Label icon="⚡" t={gt}>Daily Challenge</Label>
          {showResult && <span style={{ fontFamily:gt.ui, fontSize:10, fontWeight:700, color:isCorrect ? "#2E7D5B" : "#E8625C", background:isCorrect ? "#7ED4AD22" : "#E8625C11", padding:"3px 8px", borderRadius:6 }}>{isCorrect ? "✓ Correct!" : "✗ Review"}</span>}
        </div>
        <div style={{ fontFamily:gt.heading, fontSize:15, color:gt.dark, lineHeight:1.6, marginBottom:14 }}>{dailyChallenge.q}</div>
        <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
          {dailyChallenge.opts.map((opt, i) => {
            const isAns = i === dailyChallenge.ans;
            const isSelected = challengeAnswer === i;
            let bg = gt.bg, border = gt.divider, color = gt.text;
            if (showResult && isAns) { bg = "#7ED4AD22"; border = "#7ED4AD"; color = "#2E7D5B"; }
            else if (showResult && isSelected && !isAns) { bg = "#E8625C11"; border = "#E8625C"; color = "#E8625C"; }
            return (
              <button key={i} onClick={() => handleChallengeAnswer(i)} disabled={showResult}
                style={{ width:"100%", padding:"10px 14px", borderRadius:8, border:`1.5px solid ${border}`, background:bg, color, fontFamily:gt.ui, fontSize:13, fontWeight:showResult && isAns ? 700 : 500, cursor:showResult ? "default" : "pointer", textAlign:"left", transition:"all 0.2s", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
                <span><span style={{ fontWeight:700, marginRight:8 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                {showResult && isAns && <span style={{ fontWeight:800 }}>✓</span>}
                {showResult && isSelected && !isAns && <span>✗</span>}
              </button>
            );
          })}
        </div>
        {showResult && (
          <div style={{ marginTop:10, padding:"10px 12px", background:gt.accentLight, borderRadius:8, fontFamily:gt.body, fontSize:12, color:gt.text, lineHeight:1.65, fontStyle:"italic" }}>
            {dailyChallenge.explain}
          </div>
        )}
      </Card>
    );
  };

  // ═══ GREEK WORD OF THE DAY (inline hero) ═══
  const GWOTDHero = ({ gt }) => {
    const word = GWOTD_POOL[dayOfYear % GWOTD_POOL.length];
    const studied = localStorage.getItem("greekWotdLastSeen") === today;
    return (
      <div style={{ background:gt.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:20, textAlign:"center", position:"relative", overflow:"hidden" }}>
        <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
        <div style={{ position:"relative", zIndex:1 }}>
          <div style={{ fontFamily:gt.ui, fontSize:10, color:gt.accent, letterSpacing:"0.12em", textTransform:"uppercase", marginBottom:6 }}>Word of the Day</div>
          <div style={{ fontFamily:"'Times New Roman',serif", fontSize:48, color:gt.headerText, lineHeight:1.2, marginBottom:8, textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>{word.greek}</div>
          <div style={{ fontFamily:gt.heading, fontSize:18, color:gt.accent, marginBottom:4 }}>{word.transliteration}</div>
          <div style={{ fontFamily:gt.body, fontSize:14, color:`${gt.headerText}99`, fontStyle:"italic", marginBottom:6 }}>{word.meaning}</div>
          <div style={{ fontFamily:gt.body, fontSize:12, color:`${gt.headerText}66`, lineHeight:1.6, maxWidth:340, margin:"0 auto 10px", fontStyle:"italic" }}>"{word.text.length > 80 ? word.text.slice(0, 80) + "..." : word.text}"</div>
          <div style={{ fontFamily:gt.ui, fontSize:10, color:`${gt.headerText}77` }}>— {word.ref} · {word.strongs} · {word.nt.toLocaleString()}× in NT</div>
          {!studied ? (
            <button onClick={studyDailyWord} style={{ marginTop:12, padding:"8px 24px", borderRadius:20, border:"none", background:"rgba(255,255,255,0.15)", color:gt.headerText, fontFamily:gt.ui, fontSize:12, fontWeight:700, cursor:"pointer" }}>
              ✓ I Studied This
            </button>
          ) : (
            <div style={{ marginTop:12, fontFamily:gt.ui, fontSize:11, color:gt.accent, fontWeight:700 }}>✓ Studied today</div>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK HOME ═══
  const GreekHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const categories = [
      { id:"alphabet", label:"Alphabet", icon:"Α", desc:"All 24 Greek letters" },
      { id:"vocabulary", label:"Vocabulary", icon:"📚", desc:"Key NT Greek words" },
      { id:"grammar", label:"Grammar", icon:"📝", desc:"How Greek works", action:() => nav("greek-grammar-home") },
      { id:"reading", label:"Reading", icon:"📖", desc:"Read NT Greek texts", action:() => nav("greek-reading-home") },
      { id:"lexicon", label:"Lexicon", icon:"📖", desc:`${lexicon.length} words collected`, action:() => nav("greek-lexicon") },
      { id:"flashcards", label:"Review", icon:"🔄", desc:"Spaced repetition", action:() => nav("greek-flashcards") },
      { id:"journal", label:"Journal", icon:"✍️", desc:"Reflections", action:() => nav("greek-journal") },
    ];
    const currentLessonIds = greekLessons.map(l => l.id);
    const completedCount = Object.values(greekProgress).filter(p => p.completed && currentLessonIds.includes(p.lesson_id)).length;
    const totalLessons = greekLessons.length;
    return (
      <div style={{ minHeight:"100vh", background:gt.bg, paddingBottom:80 }}>
        <Header title="Learn Greek" subtitle="Biblical Greek · Ἑλληνική" onBack={goBack} theme={gt}
          right={greekStreak > 0 && <span style={{ fontFamily:gt.ui, fontSize:12, fontWeight:700, color:"#D97706" }}>🔥 {greekStreak}</span>}
        />
        <div style={{ padding:`20px ${bp.pad}px 40px`, maxWidth:bp.content, margin:"0 auto" }}>
          {/* GWOTD Hero */}
          <GWOTDHero gt={gt}/>

          {/* Error state */}
          {greekError && (
            <Card t={gt} style={{ marginBottom:18, borderLeft:"3px solid #E8625C" }}>
              <div style={{ fontFamily:gt.ui, fontSize:13, color:"#E8625C", marginBottom:8 }}>{greekError}</div>
              <button onClick={() => loadGreekLessons(greekCategory)} style={{ padding:"8px 16px", borderRadius:8, border:"1px solid #E8625C", background:"transparent", color:"#E8625C", fontFamily:gt.ui, fontSize:12, fontWeight:700, cursor:"pointer" }}>Retry</button>
            </Card>
          )}

          {/* Mastery Dashboard */}
          {user && <MasteryDashboard gt={gt}/>}

          {/* Daily Challenge */}
          <DailyChallengeCard gt={gt}/>

          {/* Category Tabs */}
          <div style={{ display:"flex", gap:6, marginBottom:18, flexWrap:"wrap" }}>
            {categories.map(cat => (
              <button key={cat.id} onClick={() => { if (cat.action) { setGreekGrammarLesson(null); cat.action(); } else setGreekCategory(cat.id); }}
                style={{ flexShrink:0, padding:"7px 14px", borderRadius:20, border:greekCategory===cat.id && !cat.action ? "none" : `1px solid ${gt.divider}`, background:greekCategory===cat.id && !cat.action ? gt.tabActive : gt.card, color:greekCategory===cat.id && !cat.action ? gt.headerText : gt.text, fontFamily:gt.ui, fontSize:11, fontWeight:700, cursor:"pointer", whiteSpace:"nowrap" }}>
                {cat.label}
              </button>
            ))}
          </div>

          {/* Lessons List */}
          <Label icon={greekCategory === "vocabulary" ? "📚" : "Α"} t={gt} color={gt.muted}>{greekCategory === "vocabulary" ? `Vocabulary — ${greekLessons.length} Lessons` : "The Greek Alphabet — 24 Letters"}</Label>
          {greekLessons.length === 0 && !greekError ? <Spinner t={gt}/> : greekCategory === "vocabulary" ? (() => {
            return (
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {GREEK_VOCAB_GROUPS.map(group => {
                  const groupLessons = greekLessons.filter(l => l.lesson_number >= group.range[0] && l.lesson_number <= group.range[1]);
                  if (groupLessons.length === 0) return null;
                  const isOpen = greekVocabGroup === group.id;
                  const completedInGroup = groupLessons.filter(l => greekProgress[l.id]?.completed).length;
                  return (
                    <div key={group.id}>
                      <button onClick={() => setGreekVocabGroup(isOpen ? null : group.id)}
                        style={{ width:"100%", background:isOpen ? group.color : gt.card, borderRadius:isOpen ? "14px 14px 0 0" : 14, padding:"16px 18px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, border:`1px solid ${isOpen ? group.color : gt.divider}`, borderBottom:isOpen ? "none" : "", transition:"all 0.2s", borderLeft:`4px solid ${group.color}` }}>
                        <div style={{ width:44, height:44, borderRadius:12, background:isOpen ? "rgba(255,255,255,0.15)" : `${group.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{group.icon}</div>
                        <div style={{ flex:1 }}>
                          <div style={{ fontFamily:gt.heading, fontSize:16, fontWeight:700, color:isOpen ? gt.headerText : gt.dark }}>{group.label}</div>
                          <div style={{ fontFamily:gt.ui, fontSize:12, color:isOpen ? `${gt.headerText}88` : gt.muted, marginTop:2 }}>{group.desc}</div>
                        </div>
                        <div style={{ textAlign:"right", flexShrink:0 }}>
                          <div style={{ fontFamily:gt.ui, fontSize:11, fontWeight:700, color:isOpen ? gt.accent : group.color, marginBottom:3 }}>{completedInGroup}/{groupLessons.length}</div>
                          <div style={{ fontFamily:gt.ui, fontSize:18, color:isOpen ? gt.headerText : gt.muted }}>{isOpen ? "▲" : "▼"}</div>
                        </div>
                      </button>
                      {isOpen && (
                        <div style={{ border:`1px solid ${group.color}`, borderTop:"none", borderRadius:"0 0 14px 14px", overflow:"hidden" }}>
                          {groupLessons.map(lesson => {
                            const cnt = lesson.content || {};
                            const isDone = greekProgress[lesson.id]?.completed;
                            return (
                              <button key={lesson.id} onClick={() => { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}
                                style={{ background:gt.card, border:"none", borderBottom:`1px solid ${gt.divider}`, borderRadius:0, padding:"14px 16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`3px solid ${isDone ? "#7ED4AD" : group.color}`, transition:"all 0.15s", width:"100%" }}>
                                <div style={{ minWidth:64, height:48, borderRadius:12, background:isDone ? "#7ED4AD22" : gt.accentLight, border:`1px solid ${isDone ? "#7ED4AD44" : gt.accentBorder}`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:18, color:gt.accent, flexShrink:0, padding:"0 8px" }}>
                                  {cnt.word || "λόγος"}
                                </div>
                                <div style={{ flex:1 }}>
                                  <div style={{ display:"flex", alignItems:"center", gap:8 }}>
                                    <span style={{ fontFamily:gt.heading, fontSize:15, fontWeight:700, color:gt.dark }}>{lesson.title}</span>
                                    {isDone && <span style={{ fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓</span>}
                                  </div>
                                  <div style={{ fontFamily:gt.body, fontSize:12.5, color:gt.muted, fontStyle:"italic", marginTop:2 }}>{lesson.subtitle}</div>
                                  {cnt.transliteration && <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.accent, marginTop:3 }}>{cnt.transliteration}</div>}
                                </div>
                                <div style={{ color:gt.light, flexShrink:0 }}><ChevIcon/></div>
                              </button>
                            );
                          })}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            );
          })() : (
            <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
              {greekLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = greekProgress[lesson.id]?.completed;
                return (
                  <button key={lesson.id} onClick={() => { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}
                    style={{ background:gt.card, border:`1px solid ${isDone ? "#7ED4AD44" : gt.divider}`, borderRadius:12, padding:"14px 16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`3px solid ${isDone ? "#7ED4AD" : gt.accent}`, boxShadow:"0 1px 3px rgba(0,0,0,0.04)", transition:"all 0.15s" }}>
                    <div style={{ width:52, height:52, borderRadius:12, background:isDone ? "#7ED4AD22" : gt.accentLight, border:`1px solid ${isDone ? "#7ED4AD44" : gt.accentBorder}`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:30, color:gt.accent, flexShrink:0 }}>
                      {cnt.letter || "Α"}
                    </div>
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex", alignItems:"center", gap:8 }}>
                        <span style={{ fontFamily:gt.heading, fontSize:15, fontWeight:700, color:gt.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:gt.body, fontSize:12.5, color:gt.muted, fontStyle:"italic", marginTop:2 }}>{lesson.subtitle}</div>
                    </div>
                    <div style={{ textAlign:"right", flexShrink:0 }}>
                      <div style={{ fontFamily:gt.ui, fontSize:10, color:gt.light }}>Lesson {lesson.lesson_number}</div>
                      <div style={{ color:gt.light, marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
            </div>
          )}
          {/* 24-letter alphabet grid */}
          {greekCategory === "alphabet" && (
            <div style={{ marginTop:20 }}>
              <Label icon="🔡" t={gt} color={gt.muted}>All 24 Letters — Quick Reference</Label>
              <div style={{ display:"grid", gridTemplateColumns:"repeat(4,1fr)", gap:8 }}>
                {ALL_GREEK_LETTERS.map(al => {
                  const lesson = greekLessons.find(l => l.lesson_number === al.num);
                  const isDone = lesson && greekProgress[lesson.id]?.completed;
                  return (
                    <button key={al.num}
                      onClick={() => { if (lesson) { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}}
                      style={{ background:isDone ? "#7ED4AD22" : lesson ? gt.card : gt.bg, border:`1px solid ${isDone ? "#7ED4AD55" : lesson ? gt.accentBorder : gt.divider}`, borderRadius:12, padding:"12px 6px", textAlign:"center", cursor:lesson ? "pointer" : "default", opacity:lesson ? 1 : 0.45, transition:"all 0.15s", position:"relative" }}>
                      {isDone && <div style={{ position:"absolute", top:4, right:6, fontSize:8, color:"#2E7D5B", fontWeight:800 }}>✓</div>}
                      <div style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:lesson ? gt.accent : gt.light, lineHeight:1, marginBottom:4 }}>{al.upper}<span style={{ fontSize:14 }}>{al.lower}</span></div>
                      <div style={{ fontFamily:gt.ui, fontSize:9, color:lesson ? gt.text : gt.light, fontWeight:600 }}>{al.name}</div>
                      {!lesson && <div style={{ fontFamily:gt.ui, fontSize:8, color:gt.light, marginTop:2 }}>Soon</div>}
                    </button>
                  );
                })}
              </div>
              <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted, textAlign:"center", marginTop:10 }}>
                {greekLessons.length} of 24 letters available · More added regularly
              </div>
            </div>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK LESSON ═══
  const GreekLesson = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekLesson) return (<div style={{ minHeight:"100vh", background:gt.bg }}><Header title="Greek Lesson" onBack={goBack} theme={gt}/><Spinner t={gt}/></div>);
    const content = greekLesson.content || {};
    const verseConns = Array.isArray(greekLesson.verse_connections) ? greekLesson.verse_connections : [];
    const isDone = greekProgress[greekLesson.id]?.completed;
    const currentIdx = greekLessons.findIndex(l => l.id === greekLesson.id);
    const prevLesson = currentIdx > 0 ? greekLessons[currentIdx-1] : null;
    const nextLesson = currentIdx < greekLessons.length-1 ? greekLessons[currentIdx+1] : null;
    const isVocab = greekLesson.category === "vocabulary";
    return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title={greekLesson.title} subtitle={greekLesson.subtitle} onBack={goBack} theme={gt}
          right={isDone && <span style={{ fontFamily:gt.ui, fontSize:11, color:"#7ED4AD", fontWeight:700, background:"#7ED4AD22", padding:"4px 10px", borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 40px` }}>
          {/* Hero */}
          {isVocab ? (
            <div style={{ background:gt.headerGradient, borderRadius:20, padding:"36px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
              <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative", zIndex:1 }}>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:52, color:gt.headerText, lineHeight:1.2, marginBottom:14, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.word}</div>
                <div style={{ fontFamily:gt.heading, fontSize:24, color:gt.accent, marginBottom:4 }}>{content.transliteration}</div>
                <div style={{ fontFamily:gt.body, fontSize:14, color:`${gt.headerText}88`, fontStyle:"italic", marginBottom:10 }}>{content.part_of_speech}</div>
                <div style={{ display:"inline-block", background:"rgba(27,122,110,0.25)", borderRadius:20, padding:"5px 16px", fontFamily:gt.ui, fontSize:11, color:gt.accent, letterSpacing:"0.05em" }}>
                  {content.strongs} · Appears {content.numeric_occurrences?.toLocaleString()} times in NT
                </div>
              </div>
            </div>
          ) : (
            <div style={{ background:gt.headerGradient, borderRadius:20, padding:"36px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
              <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative", zIndex:1 }}>
                <div style={{ display:"flex", justifyContent:"center", alignItems:"center", gap:24, marginBottom:14 }}>
                  <div style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:80, color:`${gt.headerText}55`, lineHeight:1 }}>{content.letterLower || greekAlphabet?.letter_lower || "α"}</div>
                    <div style={{ fontFamily:gt.ui, fontSize:9, color:`${gt.headerText}55`, textTransform:"uppercase", letterSpacing:"0.1em", marginTop:4 }}>Lowercase</div>
                  </div>
                  <div style={{ width:1, height:80, background:`${gt.headerText}22` }}/>
                  <div style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:108, color:gt.headerText, lineHeight:1, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.letter || greekAlphabet?.greek_letter || "Α"}</div>
                    <div style={{ fontFamily:gt.ui, fontSize:9, color:`${gt.headerText}77`, textTransform:"uppercase", letterSpacing:"0.1em", marginTop:4 }}>Uppercase</div>
                  </div>
                </div>
                <div style={{ fontFamily:gt.heading, fontSize:26, color:gt.accent, marginBottom:4 }}>{content.name || greekAlphabet?.letter_name}</div>
                <div style={{ fontFamily:gt.body, fontSize:15, color:`${gt.headerText}88`, fontStyle:"italic", marginBottom:10 }}>{content.transliteration || greekAlphabet?.transliteration}</div>
                <div style={{ display:"inline-block", background:"rgba(27,122,110,0.25)", borderRadius:20, padding:"5px 16px", fontFamily:gt.ui, fontSize:11, color:gt.accent }}>
                  Numeric value: {content.numeric_value || greekAlphabet?.numeric_value}
                </div>
              </div>
            </div>
          )}
          <Card t={gt} style={{ marginBottom:14 }}><Label icon="🔊" t={gt}>Pronunciation</Label><div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.75 }}>{content.pronunciation || greekAlphabet?.pronunciation_guide}</div></Card>
          {!isVocab && <Card accent t={gt} style={{ marginBottom:14 }}><Label icon="🏺" t={gt}>Phoenician Origin</Label><div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.75 }}>{content.pictograph || greekAlphabet?.pictographic}</div></Card>}
          {isVocab && content.etymology && <Card accent t={gt} style={{ marginBottom:14 }}><Label icon="📖" t={gt}>Etymology</Label><div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.75 }}>{content.etymology}</div></Card>}
          {(content.fun_fact || content.theological_significance) && (
            <Card t={gt} style={{ marginBottom:14, borderLeft:`3px solid ${gt.accent}` }}>
              <Label icon="✨" t={gt}>{isVocab ? "Theological Significance" : "Did You Know?"}</Label>
              <div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.8, fontStyle:"italic" }}>{content.fun_fact || content.theological_significance}</div>
            </Card>
          )}
          {isVocab && content.related_words?.length > 0 && (
            <Card t={gt} style={{ marginBottom:14 }}><Label icon="🔗" t={gt}>Related Words</Label>
              <div style={{ display:"flex", flexWrap:"wrap", gap:8 }}>{content.related_words.map((w,i) => (<div key={i} style={{ background:gt.accentLight, border:`1px solid ${gt.accentBorder}`, borderRadius:8, padding:"6px 12px", fontFamily:"'Times New Roman',serif", fontSize:14, color:gt.accent }}>{w}</div>))}</div>
            </Card>
          )}
          {!isVocab && greekVocab.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="📚" t={gt} color={gt.muted}>Key NT Words This Lesson</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {greekVocab.map((word,i) => (
                  <div key={i} style={{ background:gt.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${gt.divider}` }}>
                    <div style={{ display:"flex", alignItems:"center", gap:10, marginBottom:6, flexWrap:"wrap" }}>
                      <span style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:gt.accent, fontWeight:700 }}>{word.greek_word}</span>
                      <span style={{ fontFamily:gt.body, fontSize:13, color:gt.muted, fontStyle:"italic" }}>({word.transliteration})</span>
                      <span style={{ marginLeft:"auto", background:gt.accentLight, border:`1px solid ${gt.accentBorder}`, padding:"2px 8px", borderRadius:4, fontFamily:"monospace", fontSize:10, color:gt.muted }}>{word.strongs_number}</span>
                    </div>
                    <div style={{ fontFamily:gt.ui, fontSize:13.5, color:gt.text, lineHeight:1.6, marginBottom:6 }}>{word.meaning}</div>
                    {word.example_verse_ref && <div style={{ fontFamily:gt.body, fontSize:12, color:gt.muted, fontStyle:"italic", padding:"8px 10px", background:gt.accentLight, borderRadius:8 }}>📖 <strong>{word.example_verse_ref}:</strong> "{word.example_verse_text}"</div>}
                  </div>
                ))}
              </div>
            </div>
          )}
          {verseConns.length > 0 && (
            <Card t={gt} style={{ marginBottom:16 }}><Label icon="🔗" t={gt} color={gt.muted}>In the New Testament</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>{verseConns.map((vc,i) => (
                <div key={i} style={{ padding:"12px 14px", background:gt.accentLight, borderRadius:10, border:`1px solid ${gt.accentBorder}` }}>
                  <div style={{ fontFamily:gt.heading, fontSize:13, fontWeight:700, color:gt.accent, marginBottom:5 }}>{vc.ref}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13.5, color:gt.text, lineHeight:1.7 }}>{vc.connection}</div>
                </div>
              ))}</div>
            </Card>
          )}
          <button onClick={() => { setGreekPracticeIdx(0); setGreekPracticeAnswer(null); setGreekPracticeScore(0); nav("greek-practice"); }}
            style={{ width:"100%", padding:"16px", borderRadius:14, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:12, boxShadow:"0 4px 15px rgba(27,122,110,0.25)" }}>
            ✍️ Practice This Lesson
          </button>
          {user && !isDone && (
            <button onClick={() => markGreekComplete(greekLesson.id, 0)}
              style={{ width:"100%", padding:"13px", borderRadius:12, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer", marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && <div style={{ textAlign:"center", padding:"13px", borderRadius:12, background:"#7ED4AD22", border:"1px solid #7ED4AD44", marginBottom:12 }}><span style={{ fontFamily:gt.ui, fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓ Lesson Complete{greekProgress[greekLesson.id]?.score ? ` · Best Score: ${greekProgress[greekLesson.id].score}%` : ""}</span></div>}
          {!user && <div style={{ textAlign:"center", padding:"12px", borderRadius:10, background:gt.accentLight, border:`1px solid ${gt.accentBorder}`, marginBottom:12 }}><span style={{ fontFamily:gt.ui, fontSize:12, color:gt.muted }}>🔐 Sign in to save your progress</span></div>}
          <div style={{ display:"flex", gap:10 }}>
            <button onClick={() => { if(prevLesson){ setGreekLesson(prevLesson); setGreekAlphabet(null); setGreekVocab([]); loadGreekLesson(prevLesson.id); }}} disabled={!prevLesson}
              style={{ flex:1, padding:"12px", borderRadius:10, border:`1px solid ${gt.divider}`, background:prevLesson ? gt.card : gt.bg, fontFamily:gt.ui, fontSize:13, color:gt.dark, cursor:prevLesson ? "pointer" : "default", opacity:prevLesson ? 1 : 0.4 }}>← Prev</button>
            <button onClick={() => { if(nextLesson){ setGreekLesson(nextLesson); setGreekAlphabet(null); setGreekVocab([]); loadGreekLesson(nextLesson.id); }}} disabled={!nextLesson}
              style={{ flex:1, padding:"12px", borderRadius:10, border:`1px solid ${gt.divider}`, background:nextLesson ? gt.card : gt.bg, fontFamily:gt.ui, fontSize:13, color:gt.dark, cursor:nextLesson ? "pointer" : "default", opacity:nextLesson ? 1 : 0.4 }}>Next →</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK PRACTICE (Bug A3 + A4 fixed) ═══
  const GreekPractice = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekLesson) return null;
    const content = greekLesson.content || {};
    const questions = content.practice || [];
    if (questions.length === 0) return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title="Practice" onBack={goBack} theme={gt}/>
        <div style={{ textAlign:"center", padding:40 }}><div style={{ fontSize:48, marginBottom:16 }}>✍️</div><div style={{ fontFamily:gt.heading, fontSize:18, color:gt.dark }}>No practice questions yet</div></div>
      </div>
    );
    const isDone = greekPracticeIdx >= questions.length;
    const currentQ = isDone ? null : questions[greekPracticeIdx];
    const isLast = greekPracticeIdx === questions.length - 1;
    const pct = isDone ? 100 : Math.round((greekPracticeIdx / questions.length) * 100);

    // Bug A3: identify questions now use self-assessment
    const handleAnswer = (idx) => {
      if (greekPracticeAnswer !== null) return;
      if (currentQ.type === "identify") {
        setGreekPracticeAnswer("revealed"); // don't score yet
      } else {
        setGreekPracticeAnswer(idx);
        if (currentQ.type === "choice" && idx === currentQ.answer) setGreekPracticeScore(s => s + 1);
      }
    };
    const handleIdentifyRate = (correct) => {
      if (correct) setGreekPracticeScore(s => s + 1);
      setGreekPracticeAnswer("rated");
    };
    const handleNext = () => {
      if (isLast) {
        const finalScore = Math.round(((greekPracticeScore + (currentQ.type !== "identify" && greekPracticeAnswer === currentQ?.answer ? 0 : 0)) / questions.length) * 100);
        // Bug A4: only mark complete if >= 70%
        if (finalScore >= 70) markGreekComplete(greekLesson.id, finalScore);
        if (updateGreekStreak) updateGreekStreak();
        setGreekPracticeIdx(questions.length);
      } else {
        setGreekPracticeIdx(i => i + 1);
        setGreekPracticeAnswer(null);
      }
    };
    const canProceed = greekPracticeAnswer !== null && greekPracticeAnswer !== "revealed";

    if (isDone) {
      const finalScore = Math.round((greekPracticeScore / questions.length) * 100);
      return (
        <div style={{ minHeight:"100vh", background:gt.bg }}>
          <Header title="Practice Complete!" theme={gt} onBack={goBack}/>
          <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`40px ${bp.pad}px`, textAlign:"center" }}>
            <div style={{ fontSize:64, marginBottom:16 }}>{finalScore >= 70 ? "🎉" : "📖"}</div>
            <div style={{ fontFamily:gt.heading, fontSize:30, color:gt.dark, marginBottom:8 }}>{finalScore >= 70 ? "Well Done!" : "Keep Studying!"}</div>
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:gt.accent, marginBottom:20, lineHeight:1 }}>{content.letter || content.word}</div>
            <Card t={gt} style={{ marginBottom:22, textAlign:"center" }}>
              <div style={{ fontFamily:gt.ui, fontSize:13, color:gt.muted, marginBottom:6 }}>Your Score</div>
              <div style={{ fontFamily:gt.heading, fontSize:52, fontWeight:800, color:finalScore >= 70 ? "#2E7D5B" : gt.accent }}>{finalScore}%</div>
              <div style={{ fontFamily:gt.ui, fontSize:13, color:gt.muted }}>{greekPracticeScore} of {questions.length} correct</div>
              {finalScore >= 70
                ? <div style={{ fontFamily:gt.body, fontSize:13, color:"#2E7D5B", marginTop:8, fontStyle:"italic" }}>Excellent! This lesson is now marked complete.</div>
                : <div style={{ fontFamily:gt.body, fontSize:13, color:gt.muted, marginTop:8, fontStyle:"italic" }}>Score 70% or above to complete this lesson. Try again!</div>}
            </Card>
            <button onClick={() => nav("greek-home")} style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:10 }}>Back to Lessons</button>
            <button onClick={() => { setGreekPracticeIdx(0); setGreekPracticeAnswer(null); setGreekPracticeScore(0); }}
              style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${gt.accentBorder}`, background:"transparent", color:gt.accent, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Try Again</button>
          </div>
        </div>
      );
    }
    return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title={`Practice · ${greekLesson.title}`} subtitle={`Question ${greekPracticeIdx + 1} of ${questions.length}`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.divider, borderRadius:6, height:6, marginBottom:22, overflow:"hidden" }}><div style={{ width:`${pct}%`, height:"100%", background:gt.accent, borderRadius:6, transition:"width 0.4s ease" }}/></div>
          <div style={{ textAlign:"center", marginBottom:20 }}>
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:72, color:gt.accent, lineHeight:1 }}>{content.letter || content.word || "Α"}</div>
            <div style={{ fontFamily:gt.body, fontSize:13, color:gt.muted, fontStyle:"italic", marginTop:4 }}>{content.name || content.transliteration} · {content.transliteration || content.meaning}</div>
          </div>
          <Card t={gt} style={{ marginBottom:14 }}>
            <div style={{ fontFamily:gt.heading, fontSize:17, color:gt.dark, lineHeight:1.65, marginBottom:18 }}>{currentQ.question}</div>
            {currentQ.type === "identify" ? (
              <div>
                {greekPracticeAnswer === null ? (
                  <button onClick={() => handleAnswer(0)} style={{ width:"100%", padding:"13px", borderRadius:10, border:`1.5px solid ${gt.accentBorder}`, background:gt.accentLight, color:gt.accent, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Reveal Answer</button>
                ) : (
                  <>
                    <div style={{ padding:"14px", background:"#7ED4AD22", borderRadius:10, border:"1px solid #7ED4AD55", marginBottom:10 }}>
                      <div style={{ fontFamily:gt.body, fontSize:14, color:"#2E7D5B", lineHeight:1.7 }}>{currentQ.answer}</div>
                    </div>
                    {greekPracticeAnswer === "revealed" && (
                      <div style={{ display:"flex", gap:8 }}>
                        <button onClick={() => handleIdentifyRate(true)} style={{ flex:1, padding:"11px", borderRadius:10, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:gt.ui, fontSize:13, fontWeight:700, cursor:"pointer" }}>I Knew It ✓</button>
                        <button onClick={() => handleIdentifyRate(false)} style={{ flex:1, padding:"11px", borderRadius:10, border:`1.5px solid ${gt.divider}`, background:gt.bg, color:gt.muted, fontFamily:gt.ui, fontSize:13, fontWeight:600, cursor:"pointer" }}>Need More Practice</button>
                      </div>
                    )}
                  </>
                )}
              </div>
            ) : (
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {currentQ.options?.map((opt, i) => {
                  const isCorrect = i === currentQ.answer;
                  const isSelected = greekPracticeAnswer === i;
                  const showResult = greekPracticeAnswer !== null;
                  let bg = gt.bg, border = gt.divider, color = gt.text;
                  if (showResult && isCorrect) { bg = "#7ED4AD22"; border = "#7ED4AD"; color = "#2E7D5B"; }
                  else if (showResult && isSelected && !isCorrect) { bg = "#E8625C11"; border = "#E8625C"; color = "#E8625C"; }
                  return (
                    <button key={i} onClick={() => handleAnswer(i)}
                      style={{ width:"100%", padding:"13px 16px", borderRadius:10, border:`1.5px solid ${border}`, background:bg, color, fontFamily:gt.ui, fontSize:14, fontWeight:showResult && isCorrect ? 700 : 500, cursor:greekPracticeAnswer === null ? "pointer" : "default", textAlign:"left", transition:"all 0.2s", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
                      <span><span style={{ fontWeight:700, marginRight:10 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                      {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
                      {showResult && isSelected && !isCorrect && <span>✗</span>}
                    </button>
                  );
                })}
              </div>
            )}
          </Card>
          {canProceed && (
            <button onClick={handleNext} style={{ width:"100%", padding:"15px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(27,122,110,0.2)" }}>
              {isLast ? "Finish & See Score →" : "Next Question →"}
            </button>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK GRAMMAR HOME (Bug A6 fixed) ═══
  const GreekGrammarHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const alphabetDone = Object.values(greekProgress).filter(p => p.completed).length;
    return (
      <div style={{ minHeight:"100vh", background:gt.bg, paddingBottom:80 }}>
        <Header title="Greek Grammar" subtitle="How the language works" onBack={goBack} theme={gt} />
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:20, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:42, color:gt.headerText, marginBottom:10 }}>Ἐν ἀρχῇ</div>
              <div style={{ fontFamily:gt.body, fontSize:14, color:`${gt.headerText}88`, fontStyle:"italic", marginBottom:4 }}>In the beginning — understanding how Greek is built</div>
              <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>{GRAMMAR_LESSONS.length} Lessons</div>
            </div>
          </div>
          {/* Soft gate recommendation */}
          {alphabetDone < 5 && (
            <div style={{ background:"rgba(27,122,110,0.08)", border:"1px solid rgba(27,122,110,0.2)", borderRadius:12, padding:"14px 16px", marginBottom:18, display:"flex", gap:12, alignItems:"flex-start" }}>
              <div style={{ fontSize:22, flexShrink:0 }}>📖</div>
              <div>
                <div style={{ fontFamily:gt.heading, fontSize:14, fontWeight:700, color:gt.dark, marginBottom:4 }}>Recommended Background</div>
                <div style={{ fontFamily:gt.body, fontSize:13, color:gt.text, lineHeight:1.7 }}>Complete at least 5 alphabet lessons first to recognise letters. You have {alphabetDone} so far.</div>
              </div>
            </div>
          )}
          <Label icon="📝" t={gt} color={gt.muted}>Grammar Lessons — {GRAMMAR_LESSONS.length} Lessons</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {GRAMMAR_LESSONS.map((lesson, idx) => {
              const isDone = greekProgress[greekGrammarLessonIds[lesson.num]]?.completed;
              const isLoading = grammarLoading === lesson.num;
              return (
                <button key={lesson.num} onClick={async () => {
                  if (isLoading) return;
                  setGrammarLoading(lesson.num);
                  try {
                    const lessonId = greekGrammarLessonIds[lesson.num];
                    const cacheKey = `greek-grammar-${lesson.num}`;
                    if (greekCache.current[cacheKey]) {
                      setGreekGrammarLesson(greekCache.current[cacheKey]);
                    } else if (lessonId) {
                      const { data } = await supabase.from("greek_lessons").select("*").eq("id", lessonId).single();
                      if (data) { greekCache.current[cacheKey] = data; setGreekGrammarLesson(data); }
                    } else {
                      const { data } = await supabase.from("greek_lessons").select("*").eq("lesson_number", lesson.num).single();
                      if (data) { greekCache.current[cacheKey] = data; setGreekGrammarLesson(data); }
                    }
                    nav("greek-grammar-lesson");
                  } catch (e) { console.error("Grammar load error:", e); }
                  finally { setGrammarLoading(null); }
                }}
                  style={{ background:gt.card, border:`1px solid ${isDone ? "#7ED4AD44" : gt.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`4px solid ${lesson.color}`, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", transition:"all 0.15s", opacity:isLoading ? 0.6 : 1 }}>
                  <div style={{ width:52, height:52, borderRadius:12, background:`${lesson.color}18`, border:`1px solid ${lesson.color}44`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:18, color:lesson.color, flexShrink:0 }}>{lesson.icon}</div>
                  <div style={{ flex:1 }}>
                    <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:2 }}>
                      <span style={{ fontFamily:gt.heading, fontSize:15, fontWeight:700, color:gt.dark }}>{lesson.title}</span>
                      {isDone && <span style={{ fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓</span>}
                    </div>
                    <div style={{ fontFamily:gt.body, fontSize:12.5, color:gt.muted, fontStyle:"italic" }}>{lesson.subtitle}</div>
                    <div style={{ marginTop:5, display:"inline-block", background:`${lesson.color}18`, borderRadius:4, padding:"2px 8px", fontFamily:gt.ui, fontSize:9, fontWeight:700, color:lesson.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>{lesson.difficulty}</div>
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    <div style={{ fontFamily:gt.ui, fontSize:10, color:gt.light, marginBottom:4 }}>Lesson {idx + 1}</div>
                    <div style={{ color:gt.light }}>{isLoading ? <Spinner t={gt}/> : <ChevIcon />}</div>
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK GRAMMAR LESSON ═══
  const GreekGrammarLesson = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekGrammarLesson) return (<div style={{ minHeight:"100vh", background:gt.bg }}><Header title="Grammar" onBack={goBack} theme={gt}/><Spinner t={gt}/></div>);
    const content = greekGrammarLesson.content || {};
    const verseConns = Array.isArray(greekGrammarLesson.verse_connections) ? greekGrammarLesson.verse_connections : [];
    const isDone = greekProgress[greekGrammarLesson.id]?.completed;
    const tables = content.tables || [];
    const examples = content.examples || [];
    const keyPoints = content.key_points || [];
    return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title={greekGrammarLesson.title} subtitle={greekGrammarLesson.subtitle} onBack={goBack} theme={gt}
          right={isDone && <span style={{ fontFamily:gt.ui, fontSize:11, color:"#7ED4AD", fontWeight:700, background:"#7ED4AD22", padding:"4px 10px", borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:gt.headerText, lineHeight:1.1, marginBottom:12, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.symbol}</div>
              <div style={{ fontFamily:gt.heading, fontSize:24, color:gt.accent, marginBottom:4 }}>{greekGrammarLesson.title}</div>
              <div style={{ fontFamily:gt.body, fontSize:14, color:`${gt.headerText}88`, fontStyle:"italic" }}>{greekGrammarLesson.subtitle}</div>
            </div>
          </div>
          <Card t={gt} style={{ marginBottom:14 }}><Label icon="📋" t={gt}>Overview</Label><div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.8 }}>{content.overview}</div></Card>
          {keyPoints.length > 0 && (
            <Card t={gt} style={{ marginBottom:14 }}><Label icon="💡" t={gt}>Key Points</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>{keyPoints.map((kp,i) => (
                <div key={i} style={{ display:"flex", gap:10, alignItems:"flex-start" }}>
                  <div style={{ width:22, height:22, borderRadius:"50%", background:gt.accent, color:"#fff", display:"flex", alignItems:"center", justifyContent:"center", fontFamily:gt.ui, fontSize:11, fontWeight:700, flexShrink:0, marginTop:1 }}>{i+1}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13.5, color:gt.text, lineHeight:1.65 }}>{kp}</div>
                </div>
              ))}</div>
            </Card>
          )}
          {tables.map((table, ti) => (
            <div key={ti} style={{ marginBottom:16 }}>
              <Label icon="📊" t={gt} color={gt.muted}>{table.title}</Label>
              <div style={{ background:gt.card, borderRadius:14, border:`1px solid ${gt.divider}`, overflow:"auto" }}>
                <div style={{ display:"flex", background:gt.headerGradient, padding:"10px 14px", minWidth:300 }}>
                  {table.headers.map((h, hi) => (<div key={hi} style={{ flex:1, fontFamily:gt.ui, fontSize:11, fontWeight:700, color:gt.accent, textTransform:"uppercase", letterSpacing:"0.08em", textAlign:"center" }}>{h}</div>))}
                </div>
                {table.rows.map((row, ri) => (
                  <div key={ri} style={{ display:"flex", padding:"12px 14px", borderTop:`1px solid ${gt.divider}`, background:ri % 2 === 0 ? gt.card : gt.accentLight, minWidth:300 }}>
                    {row.map((cell, ci) => (<div key={ci} style={{ flex:1, textAlign:"center" }}>{ci === 0 ? <span style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:gt.accent }}>{cell}</span> : <span style={{ fontFamily:ci === 1 ? gt.body : gt.ui, fontSize:13, color:gt.text, fontStyle:ci === 1 ? "italic" : "normal" }}>{cell}</span>}</div>))}
                  </div>
                ))}
              </div>
            </div>
          ))}
          {examples.length > 0 && (
            <Card accent t={gt} style={{ marginBottom:16 }}><Label icon="📖" t={gt}>Spot It in Scripture</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:12 }}>{examples.map((ex, ei) => (
                <div key={ei} style={{ padding:"12px 14px", background:"rgba(255,255,255,0.06)", borderRadius:10, border:`1px solid ${gt.accentBorder}` }}>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:gt.accent, marginBottom:4 }}>{ex.greek}</div>
                  <div style={{ fontFamily:gt.heading, fontSize:12, fontWeight:700, color:gt.accent, marginBottom:4 }}>{ex.ref}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13, color:gt.text, lineHeight:1.65 }}>{ex.explanation}</div>
                </div>
              ))}</div>
            </Card>
          )}
          {verseConns.length > 0 && (
            <Card t={gt} style={{ marginBottom:16 }}><Label icon="🔗" t={gt} color={gt.muted}>In the Bible</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>{verseConns.map((vc, i) => (
                <div key={i} style={{ padding:"12px 14px", background:gt.accentLight, borderRadius:10, border:`1px solid ${gt.accentBorder}` }}>
                  <div style={{ fontFamily:gt.heading, fontSize:13, fontWeight:700, color:gt.accent, marginBottom:5 }}>{vc.ref}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13.5, color:gt.text, lineHeight:1.7 }}>{vc.connection}</div>
                </div>
              ))}</div>
            </Card>
          )}
          {content.practice?.length > 0 && (
            <Card t={gt} style={{ marginBottom:16 }}><Label icon="✍️" t={gt} color={gt.muted}>Quick Check</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>{content.practice.map((q, qi) => (
                <div key={qi} style={{ padding:"12px 14px", background:gt.bg, borderRadius:10, border:`1px solid ${gt.divider}` }}>
                  <div style={{ fontFamily:gt.ui, fontSize:13, fontWeight:700, color:gt.dark, marginBottom:6 }}>{q.question}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13, color:gt.muted, fontStyle:"italic", padding:"8px 10px", background:gt.accentLight, borderRadius:8 }}>→ {q.answer}</div>
                </div>
              ))}</div>
            </Card>
          )}
          {user && !isDone && <button onClick={() => markGreekComplete(greekGrammarLesson.id, 100)} style={{ width:"100%", padding:"14px", borderRadius:12, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer", marginBottom:12 }}>✓ Mark as Complete</button>}
          {isDone && <div style={{ textAlign:"center", padding:"13px", borderRadius:12, background:"#7ED4AD22", border:"1px solid #7ED4AD44", marginBottom:12 }}><span style={{ fontFamily:gt.ui, fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓ Lesson Complete</span></div>}
          {!user && <div style={{ textAlign:"center", padding:"12px", borderRadius:10, background:gt.accentLight, border:`1px solid ${gt.accentBorder}`, marginBottom:12 }}><span style={{ fontFamily:gt.ui, fontSize:12, color:gt.muted }}>🔐 Sign in to save your progress</span></div>}
          <button onClick={() => nav("greek-grammar-home")} style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${gt.accentBorder}`, background:"transparent", color:gt.accent, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>← Back to Grammar Lessons</button>
        </div>
      </div>
    );
  };

  // ═══ GREEK READING HOME ═══
  const GreekReadingHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    return (
      <div style={{ minHeight:"100vh", background:gt.bg, paddingBottom:80 }}>
        <Header title="Reading" subtitle="Read Scripture in Greek" onBack={goBack} theme={gt} />
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.headerGradient, borderRadius:16, padding:"24px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:32, color:gt.headerText, marginBottom:10, textShadow:"0 2px 12px rgba(0,0,0,0.3)" }}>Ἐν ἀρχῇ</div>
              <div style={{ fontFamily:gt.body, fontSize:14, color:`${gt.headerText}88`, fontStyle:"italic", marginBottom:4 }}>Read God's Word word by word</div>
              <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>Interactive Greek Reading</div>
            </div>
          </div>
          <div style={{ fontFamily:gt.body, fontSize:14, color:gt.muted, lineHeight:1.7, marginBottom:18, fontStyle:"italic" }}>Each session walks you through a NT verse word by word — with grammar notes, letter breakdowns, and theological insights.</div>
          <Label icon="📖" t={gt} color={gt.muted}>Choose a Verse</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
            {READING_VERSES.map(v => (
              <button key={v.id} onClick={() => { if (v.available) { setGreekReadingVerse(v.id); setGreekReadingStep(0); nav("greek-reading"); } }}
                style={{ background:gt.card, border:`1px solid ${v.available ? gt.accentBorder : gt.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:v.available ? "pointer" : "default", opacity:v.available ? 1 : 0.6, borderLeft:`4px solid ${v.color}`, transition:"all 0.15s" }}>
                <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start", marginBottom:6 }}>
                  <div>
                    <span style={{ fontFamily:gt.heading, fontSize:15, fontWeight:700, color:gt.dark }}>{v.ref}</span>
                    <span style={{ fontFamily:gt.ui, fontSize:10, color:v.color, background:`${v.color}18`, borderRadius:4, padding:"2px 7px", marginLeft:8, textTransform:"uppercase", letterSpacing:"0.05em" }}>{v.tag}</span>
                  </div>
                  {!v.available && <span style={{ fontFamily:gt.ui, fontSize:10, color:gt.light }}>🔒 Soon</span>}
                </div>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:v.color, marginBottom:6, lineHeight:1.6 }}>{v.greek}</div>
                <div style={{ fontFamily:gt.body, fontSize:12.5, color:gt.muted, fontStyle:"italic", marginBottom:8 }}>{v.kjv}</div>
                <div style={{ display:"flex", gap:8 }}>
                  <span style={{ fontFamily:gt.ui, fontSize:10, color:gt.light, background:gt.divider, borderRadius:4, padding:"2px 8px" }}>{v.words} words</span>
                  <span style={{ fontFamily:gt.ui, fontSize:10, color:gt.light, background:gt.divider, borderRadius:4, padding:"2px 8px" }}>{v.difficulty}</span>
                </div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK READING (Phase B: intro + completion + collapsible letters) ═══
  const GreekReading = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const VERSE = VERSE_DATA[greekReadingVerse] || VERSE_DATA.john1v1;
    const WORDS = WORDS_MAP[greekReadingVerse] || WORDS_JOHN1V1;
    const totalWords = WORDS.length;

    // Step 0 = intro, 1..N = words, N+1 = celebration
    if (greekReadingStep === 0) {
      return (
        <div style={{ minHeight:"100vh", background:gt.bg }}>
          <Header title={`Read ${VERSE.ref}`} subtitle="Word by Word" onBack={goBack} theme={gt}/>
          <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 40px` }}>
            <div style={{ background:gt.headerGradient, borderRadius:16, padding:"24px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
              <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 0%,rgba(27,122,110,0.2),transparent 70%)" }}/>
              <div style={{ position:"relative", zIndex:1 }}>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:gt.headerText, lineHeight:1.7, marginBottom:8 }}>{VERSE.greek}</div>
                <div style={{ fontFamily:gt.body, fontSize:12.5, color:`${gt.headerText}77`, fontStyle:"italic" }}>{VERSE.kjv}</div>
              </div>
            </div>
            <Card t={gt} style={{ marginBottom:16 }}>
              <Label icon="📖" t={gt}>What You Will Learn</Label>
              <div style={{ fontFamily:gt.body, fontSize:14, color:gt.text, lineHeight:1.7, marginBottom:10 }}>Walk through {VERSE.ref} word by word. Each word includes grammar analysis, letter-by-letter breakdowns, and devotional insights.</div>
              <div style={{ fontFamily:gt.ui, fontSize:12, color:gt.muted }}>{totalWords} Greek words · ~{totalWords * 2} min reading time</div>
            </Card>
            <Label icon="🔡" t={gt} color={gt.muted}>The {totalWords} Words</Label>
            <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
              {WORDS.map((w, i) => (
                <div key={i} style={{ display:"flex", alignItems:"center", gap:12, padding:"10px 14px", background:gt.card, borderRadius:10, border:`1px solid ${gt.divider}`, borderLeft:`3px solid ${w.color}` }}>
                  <div style={{ width:28, height:28, borderRadius:"50%", background:gt.accentLight, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:gt.ui, fontSize:12, fontWeight:700, color:gt.accent, flexShrink:0 }}>{i + 1}</div>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:gt.accent, flexShrink:0 }}>{w.greek}</div>
                  <div style={{ fontFamily:gt.body, fontSize:13, color:gt.muted, fontStyle:"italic" }}>{w.meaning}</div>
                </div>
              ))}
            </div>
            <button onClick={() => setGreekReadingStep(1)}
              style={{ width:"100%", marginTop:18, padding:"16px", borderRadius:14, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(27,122,110,0.25)" }}>
              Begin Reading →
            </button>
          </div>
        </div>
      );
    }

    // Celebration screen
    if (greekReadingStep > totalWords) {
      const reflection = READING_REFLECTIONS[greekReadingVerse];
      return (
        <div style={{ minHeight:"100vh", background:gt.bg }}>
          <Header title="Εὖγε!" subtitle={`${VERSE.ref} Complete`} onBack={goBack} theme={gt}/>
          <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`30px ${bp.pad}px 40px`, textAlign:"center" }}>
            <div style={{ fontSize:64, marginBottom:16 }}>🎉</div>
            <div style={{ fontFamily:gt.heading, fontSize:28, color:gt.dark, marginBottom:16 }}>Εὖγε! Well Done!</div>
            <div style={{ background:gt.headerGradient, borderRadius:16, padding:"20px", marginBottom:18, position:"relative", overflow:"hidden" }}>
              <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 0%,rgba(27,122,110,0.2),transparent 70%)" }}/>
              <div style={{ position:"relative", zIndex:1 }}>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:17, color:gt.headerText, lineHeight:1.7, marginBottom:8 }}>{VERSE.greek}</div>
                <div style={{ fontFamily:gt.body, fontSize:12.5, color:`${gt.headerText}77`, fontStyle:"italic" }}>{VERSE.kjv}</div>
              </div>
            </div>
            <div style={{ display:"flex", flexWrap:"wrap", justifyContent:"center", gap:10, marginBottom:18 }}>
              {WORDS.map((w, i) => (
                <div key={i} style={{ textAlign:"center" }}>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:gt.accent }}>{w.greek}</div>
                  <div style={{ fontFamily:gt.ui, fontSize:9, color:gt.muted }}>{w.meaning}</div>
                </div>
              ))}
            </div>
            {reflection && (
              <Card t={gt} style={{ marginBottom:18, borderLeft:`3px solid ${gt.accent}`, textAlign:"left" }}>
                <Label icon="✨" t={gt}>Theological Reflection</Label>
                <div style={{ fontFamily:gt.body, fontSize:14, color:gt.text, lineHeight:1.85, fontStyle:"italic" }}>{reflection}</div>
              </Card>
            )}
            <button onClick={() => setGreekReadingStep(0)} style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:10 }}>Read Again</button>
            <button onClick={() => nav("greek-reading-home")} style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${gt.accentBorder}`, background:"transparent", color:gt.accent, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Back to Readings</button>
          </div>
        </div>
      );
    }

    // Word study (step 1..N)
    const wordIdx = greekReadingStep - 1;
    const currentWord = WORDS[wordIdx];
    const isLast = greekReadingStep >= totalWords;
    return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title={VERSE.ref} subtitle={`Word ${greekReadingStep} of ${totalWords}`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 60px` }}>
          {/* Full verse */}
          <div style={{ background:gt.headerGradient, borderRadius:16, padding:"20px", marginBottom:18, position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 0%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:17, color:gt.headerText, lineHeight:1.7, marginBottom:8 }}>{VERSE.greek}</div>
              <div style={{ fontFamily:gt.body, fontSize:12.5, color:`${gt.headerText}77`, fontStyle:"italic" }}>{VERSE.kjv}</div>
            </div>
          </div>
          {/* Progress */}
          <div style={{ display:"flex", gap:6, marginBottom:16 }}>
            {WORDS.map((_, i) => (
              <div key={i} onClick={() => setGreekReadingStep(i + 1)} style={{ flex:1, height:4, borderRadius:2, background:i < greekReadingStep ? gt.accent : gt.divider, cursor:"pointer", transition:"background 0.2s" }}/>
            ))}
          </div>
          {/* Current word */}
          <div key={wordIdx} style={{ background:gt.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:16, textAlign:"center", position:"relative", overflow:"hidden", animation:"wordReveal 0.4s ease" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.3),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:gt.headerText, lineHeight:1.1, marginBottom:10, textShadow:"0 4px 24px rgba(0,0,0,0.3)" }}>{currentWord.greek}</div>
              <div style={{ fontFamily:gt.heading, fontSize:22, color:gt.accent, marginBottom:4 }}>{currentWord.transliteration}</div>
              <div style={{ fontFamily:gt.body, fontSize:15, color:`${gt.headerText}88`, fontStyle:"italic" }}>{currentWord.meaning}</div>
            </div>
          </div>
          {/* Grammar */}
          <Card t={gt} style={{ marginBottom:14 }}><Label icon="📚" t={gt}>Grammar Note</Label><div style={{ fontFamily:gt.body, fontSize:14, color:gt.text, lineHeight:1.8 }}>{currentWord.grammar}</div></Card>
          {/* Collapsible Letters (Phase B3) */}
          {currentWord.letters?.length > 0 && (
            <div style={{ marginBottom:14 }}>
              <button onClick={() => setGreekShowLetters(!greekShowLetters)}
                style={{ width:"100%", padding:"12px 16px", borderRadius:greekShowLetters ? "12px 12px 0 0" : 12, border:`1px solid ${gt.accentBorder}`, borderBottom:greekShowLetters ? "none" : `1px solid ${gt.accentBorder}`, background:gt.card, display:"flex", justifyContent:"space-between", alignItems:"center", cursor:"pointer" }}>
                <span style={{ fontFamily:gt.ui, fontSize:13, fontWeight:700, color:gt.dark }}>🔡 Letter by Letter ({currentWord.letters.length} letters)</span>
                <span style={{ fontFamily:gt.ui, fontSize:16, color:gt.muted }}>{greekShowLetters ? "▲" : "▼"}</span>
              </button>
              {greekShowLetters && (
                <div style={{ border:`1px solid ${gt.accentBorder}`, borderTop:"none", borderRadius:"0 0 12px 12px", padding:12, background:gt.card }}>
                  <div style={{ display:"flex", flexWrap:"wrap", gap:8 }}>
                    {currentWord.letters.map((ltr, li) => (
                      <div key={li} style={{ background:gt.accentLight, border:`1px solid ${gt.accentBorder}`, borderRadius:10, padding:"10px 12px", textAlign:"center", minWidth:56 }}>
                        <div style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:gt.accent, marginBottom:4 }}>{ltr.l}</div>
                        <div style={{ fontFamily:gt.ui, fontSize:9, fontWeight:700, color:gt.muted, marginBottom:3 }}>{ltr.name}</div>
                        <div style={{ fontFamily:gt.body, fontSize:10, color:gt.muted, fontStyle:"italic", lineHeight:1.4 }}>{ltr.note}</div>
                        {ltr.lesson && <div style={{ fontFamily:gt.ui, fontSize:8, color:gt.accent, marginTop:3, fontWeight:700 }}>Lesson {ltr.lesson}</div>}
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}
          {/* Devotional */}
          <Card t={gt} style={{ marginBottom:20, borderLeft:`3px solid ${gt.accent}` }}><Label icon="✨" t={gt}>Devotional Insight</Label><div style={{ fontFamily:gt.body, fontSize:14.5, color:gt.text, lineHeight:1.85, fontStyle:"italic" }}>{currentWord.devotional}</div></Card>
          {/* Navigation */}
          <div style={{ display:"flex", gap:10 }}>
            <button onClick={() => setGreekReadingStep(s => Math.max(1, s - 1))} disabled={greekReadingStep <= 1}
              style={{ flex:1, padding:"13px", borderRadius:12, border:`1px solid ${gt.divider}`, background:greekReadingStep > 1 ? gt.card : gt.bg, fontFamily:gt.ui, fontSize:13, color:gt.dark, cursor:greekReadingStep > 1 ? "pointer" : "default", opacity:greekReadingStep > 1 ? 1 : 0.4 }}>← Previous</button>
            {!isLast
              ? <button onClick={() => { setGreekReadingStep(s => s + 1); if (updateGreekStreak) updateGreekStreak(); }} style={{ flex:2, padding:"13px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Next Word →</button>
              : <button onClick={() => { setGreekReadingStep(totalWords + 1); if (updateGreekStreak) updateGreekStreak(); }} style={{ flex:2, padding:"13px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>🎉 See Reflection</button>
            }
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK LEXICON ═══
  const GreekLexicon = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const [selectedWord, setSelectedWord] = useState(null);
    const allWords = GWOTD_POOL;
    return (
      <div style={{ minHeight:"100vh", background:gt.bg, paddingBottom:80 }}>
        <Header title="My Lexicon" subtitle={`${lexicon.length} of ${allWords.length} words collected`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.accentLight, borderRadius:12, padding:"12px 16px", marginBottom:18, textAlign:"center" }}>
            <div style={{ fontFamily:gt.ui, fontSize:13, fontWeight:700, color:gt.accent }}>{lexicon.length}/{allWords.length} Words Collected</div>
            <div style={{ background:gt.divider, borderRadius:6, height:6, marginTop:8, overflow:"hidden" }}>
              <div style={{ width:`${(lexicon.length / allWords.length) * 100}%`, height:"100%", background:gt.accent, borderRadius:6, transition:"width 0.5s ease" }}/>
            </div>
          </div>
          {selectedWord && (
            <Card t={gt} style={{ marginBottom:16, borderLeft:`3px solid ${gt.accent}` }}>
              <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                <div>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:36, color:gt.accent }}>{selectedWord.greek}</div>
                  <div style={{ fontFamily:gt.heading, fontSize:16, color:gt.dark, marginTop:4 }}>{selectedWord.transliteration} — {selectedWord.meaning}</div>
                  <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted, marginTop:4 }}>{selectedWord.pos} · {selectedWord.strongs} · {selectedWord.nt}× in NT</div>
                </div>
                <button onClick={() => setSelectedWord(null)} style={{ background:"none", border:"none", fontSize:18, color:gt.muted, cursor:"pointer" }}>✕</button>
              </div>
              <div style={{ fontFamily:gt.body, fontSize:13, color:gt.text, lineHeight:1.7, marginTop:10, fontStyle:"italic" }}>"{selectedWord.text}"</div>
              <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted, marginTop:4 }}>— {selectedWord.ref}</div>
              <div style={{ fontFamily:gt.body, fontSize:13, color:gt.text, lineHeight:1.7, marginTop:10 }}>{selectedWord.devotional}</div>
            </Card>
          )}
          <div style={{ display:"grid", gridTemplateColumns:"repeat(4,1fr)", gap:6 }}>
            {allWords.map((w, i) => {
              const collected = lexicon.includes(w.strongs);
              return (
                <button key={i} onClick={() => { if (collected) setSelectedWord(w); }}
                  style={{ padding:"10px 4px", borderRadius:10, border:`1px solid ${collected ? gt.accentBorder : gt.divider}`, background:collected ? gt.card : gt.bg, textAlign:"center", cursor:collected ? "pointer" : "default", opacity:collected ? 1 : 0.35, transition:"all 0.15s" }}>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:16, color:collected ? gt.accent : gt.light, lineHeight:1.2 }}>{collected ? w.greek : "?"}</div>
                  <div style={{ fontFamily:gt.ui, fontSize:7, color:collected ? gt.muted : gt.light, marginTop:2, overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap" }}>{collected ? w.transliteration : "..."}</div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK FLASHCARDS ═══
  const GreekFlashcards = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const allWords = GWOTD_POOL.filter(w => lexicon.includes(w.strongs));

    // Initialize session if needed
    useEffect(() => {
      if (flashcardSession.length === 0 && allWords.length >= 5) {
        const now = Date.now();
        const intervals = [0, 2 * 86400000, 5 * 86400000, 14 * 86400000];
        const due = allWords.filter(w => {
          const fd = flashcardData[w.strongs];
          if (!fd) return true;
          const interval = intervals[Math.min(fd.confidence, 3)];
          return (now - fd.lastReviewed) >= interval;
        }).slice(0, 10);
        if (due.length > 0) { setFlashcardSession(due); setFlashcardIdx(0); setFlashcardFlipped(false); setFlashcardResults(null); }
      }
    }, [allWords.length]); // eslint-disable-line

    if (allWords.length < 5) return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title="Flashcard Review" onBack={goBack} theme={gt}/>
        <div style={{ textAlign:"center", padding:40 }}>
          <div style={{ fontSize:48, marginBottom:16 }}>🔄</div>
          <div style={{ fontFamily:gt.heading, fontSize:18, color:gt.dark, marginBottom:8 }}>Collect More Words</div>
          <div style={{ fontFamily:gt.body, fontSize:14, color:gt.muted }}>You need at least 5 words in your lexicon to start flashcard review. You have {allWords.length}.</div>
        </div>
      </div>
    );

    if (flashcardResults !== null) {
      return (
        <div style={{ minHeight:"100vh", background:gt.bg }}>
          <Header title="Review Complete" onBack={goBack} theme={gt}/>
          <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`40px ${bp.pad}px`, textAlign:"center" }}>
            <div style={{ fontSize:64, marginBottom:16 }}>🧠</div>
            <div style={{ fontFamily:gt.heading, fontSize:28, color:gt.dark, marginBottom:8 }}>Session Complete!</div>
            <Card t={gt} style={{ marginBottom:22 }}>
              <div style={{ fontFamily:gt.ui, fontSize:13, color:gt.muted, marginBottom:6 }}>Cards Reviewed</div>
              <div style={{ fontFamily:gt.heading, fontSize:42, fontWeight:800, color:gt.accent }}>{flashcardResults.total}</div>
              <div style={{ fontFamily:gt.ui, fontSize:13, color:gt.muted }}>{flashcardResults.known} remembered · {flashcardResults.total - flashcardResults.known} need review</div>
            </Card>
            <button onClick={() => { setFlashcardSession([]); setFlashcardResults(null); nav("greek-home"); }} style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:15, fontWeight:700, cursor:"pointer" }}>Done</button>
          </div>
        </div>
      );
    }

    if (flashcardSession.length === 0) return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title="Flashcard Review" onBack={goBack} theme={gt}/>
        <div style={{ textAlign:"center", padding:40 }}>
          <div style={{ fontSize:48, marginBottom:16 }}>✨</div>
          <div style={{ fontFamily:gt.heading, fontSize:18, color:gt.dark, marginBottom:8 }}>All Caught Up!</div>
          <div style={{ fontFamily:gt.body, fontSize:14, color:gt.muted }}>No words due for review right now. Come back later!</div>
        </div>
      </div>
    );

    const card = flashcardSession[flashcardIdx];
    const handleFlashcardRate = (knew) => {
      const newData = { ...flashcardData };
      const prev = newData[card.strongs] || { confidence: 0, lastReviewed: 0 };
      newData[card.strongs] = { confidence: knew ? Math.min(prev.confidence + 1, 3) : 0, lastReviewed: Date.now() };
      saveFlashcardData(newData);
      if (flashcardIdx >= flashcardSession.length - 1) {
        const known = flashcardSession.filter((_, i) => i < flashcardIdx ? true : knew).length; // approximate
        setFlashcardResults({ total: flashcardSession.length, known });
      } else {
        setFlashcardIdx(i => i + 1);
        setFlashcardFlipped(false);
      }
    };

    return (
      <div style={{ minHeight:"100vh", background:gt.bg }}>
        <Header title="Flashcard Review" subtitle={`Card ${flashcardIdx + 1} of ${flashcardSession.length}`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.divider, borderRadius:6, height:4, marginBottom:20, overflow:"hidden" }}>
            <div style={{ width:`${((flashcardIdx + 1) / flashcardSession.length) * 100}%`, height:"100%", background:gt.accent, borderRadius:6, transition:"width 0.3s ease" }}/>
          </div>
          <button onClick={() => setFlashcardFlipped(!flashcardFlipped)}
            style={{ width:"100%", minHeight:280, background:flashcardFlipped ? gt.card : gt.headerGradient, borderRadius:20, padding:"40px 24px", textAlign:"center", cursor:"pointer", border:flashcardFlipped ? `1px solid ${gt.divider}` : "none", transition:"all 0.3s", position:"relative", overflow:"hidden" }}>
            {!flashcardFlipped ? (
              <>
                <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
                <div style={{ position:"relative", zIndex:1 }}>
                  <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:gt.headerText, lineHeight:1.1, marginBottom:12, textShadow:"0 4px 24px rgba(0,0,0,0.3)" }}>{card.greek}</div>
                  <div style={{ fontFamily:gt.heading, fontSize:20, color:gt.accent }}>{card.transliteration}</div>
                  <div style={{ fontFamily:gt.ui, fontSize:12, color:`${gt.headerText}66`, marginTop:16 }}>Tap to reveal</div>
                </div>
              </>
            ) : (
              <div>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:36, color:gt.accent, marginBottom:10 }}>{card.greek}</div>
                <div style={{ fontFamily:gt.heading, fontSize:22, color:gt.dark, marginBottom:6 }}>{card.meaning}</div>
                <div style={{ fontFamily:gt.ui, fontSize:12, color:gt.muted, marginBottom:10 }}>{card.pos} · {card.strongs}</div>
                <div style={{ fontFamily:gt.body, fontSize:13, color:gt.text, lineHeight:1.6, fontStyle:"italic" }}>"{card.text.length > 100 ? card.text.slice(0, 100) + "..." : card.text}"</div>
                <div style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted, marginTop:4 }}>— {card.ref}</div>
              </div>
            )}
          </button>
          {flashcardFlipped && (
            <div style={{ display:"flex", gap:10, marginTop:16 }}>
              <button onClick={() => handleFlashcardRate(false)} style={{ flex:1, padding:"14px", borderRadius:12, border:`1.5px solid ${gt.divider}`, background:gt.bg, color:gt.muted, fontFamily:gt.ui, fontSize:14, fontWeight:600, cursor:"pointer" }}>Review Again</button>
              <button onClick={() => handleFlashcardRate(true)} style={{ flex:1, padding:"14px", borderRadius:12, border:"none", background:gt.headerGradient, color:gt.headerText, fontFamily:gt.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Knew It ✓</button>
            </div>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK JOURNAL ═══
  const GreekJournal = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const word = GWOTD_POOL[dayOfYear % GWOTD_POOL.length];
    const prompts = [
      `What did you learn about ${word.greek} (${word.meaning}) today?`,
      `How does ${word.ref} speak to you right now?`,
      `Write one sentence using the word "${word.transliteration}".`,
    ];
    const todayPrompt = prompts[dayOfYear % prompts.length];
    const saveJournalEntry = () => {
      if (!journalText.trim()) return;
      const entry = { id: Date.now(), date: today, wordRef: `${word.greek} — ${word.meaning}`, text: journalText.trim() };
      const updated = [entry, ...journalEntries];
      setJournalEntries(updated);
      localStorage.setItem("greekJournalEntries", JSON.stringify(updated));
      setJournalText("");
      if (updateGreekStreak) updateGreekStreak();
    };
    const deleteEntry = (id) => {
      const updated = journalEntries.filter(e => e.id !== id);
      setJournalEntries(updated);
      localStorage.setItem("greekJournalEntries", JSON.stringify(updated));
    };
    return (
      <div style={{ minHeight:"100vh", background:gt.bg, paddingBottom:80 }}>
        <Header title="Greek Journal" subtitle={`${journalEntries.length} reflections`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`20px ${bp.pad}px 40px` }}>
          <Card t={gt} style={{ marginBottom:18, borderLeft:`3px solid ${gt.accent}` }}>
            <Label icon="✍️" t={gt}>Today's Prompt</Label>
            <div style={{ fontFamily:gt.body, fontSize:14, color:gt.text, lineHeight:1.7, fontStyle:"italic", marginBottom:12 }}>{todayPrompt}</div>
            <textarea value={journalText} onChange={e => setJournalText(e.target.value)} placeholder="Write your reflection..."
              style={{ width:"100%", minHeight:100, padding:12, borderRadius:10, border:`1px solid ${gt.divider}`, background:gt.bg, fontFamily:gt.body, fontSize:14, color:gt.text, lineHeight:1.7, resize:"vertical", boxSizing:"border-box" }}/>
            <div style={{ display:"flex", justifyContent:"space-between", alignItems:"center", marginTop:8 }}>
              <span style={{ fontFamily:gt.ui, fontSize:11, color:gt.muted }}>{journalText.length}/500</span>
              <button onClick={saveJournalEntry} disabled={!journalText.trim()}
                style={{ padding:"8px 20px", borderRadius:8, border:"none", background:journalText.trim() ? gt.headerGradient : gt.divider, color:journalText.trim() ? gt.headerText : gt.muted, fontFamily:gt.ui, fontSize:13, fontWeight:700, cursor:journalText.trim() ? "pointer" : "default" }}>
                Save
              </button>
            </div>
          </Card>
          <Label icon="📜" t={gt} color={gt.muted}>Your Reflections ({journalEntries.length})</Label>
          {journalEntries.length === 0 ? (
            <div style={{ textAlign:"center", padding:30 }}>
              <div style={{ fontSize:36, marginBottom:10 }}>📜</div>
              <div style={{ fontFamily:gt.body, fontSize:14, color:gt.muted }}>Your reflections will appear here. Write your first one above!</div>
            </div>
          ) : (
            <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
              {journalEntries.slice(0, 20).map(entry => (
                <div key={entry.id} style={{ background:gt.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${gt.divider}`, borderLeft:`3px solid ${gt.accent}` }}>
                  <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start", marginBottom:6 }}>
                    <div>
                      <div style={{ fontFamily:gt.ui, fontSize:11, fontWeight:700, color:gt.accent }}>{entry.wordRef}</div>
                      <div style={{ fontFamily:gt.ui, fontSize:10, color:gt.light }}>{entry.date}</div>
                    </div>
                    <button onClick={() => deleteEntry(entry.id)} style={{ background:"none", border:"none", fontSize:14, color:gt.light, cursor:"pointer" }}>✕</button>
                  </div>
                  <div style={{ fontFamily:gt.body, fontSize:13.5, color:gt.text, lineHeight:1.7 }}>{entry.text}</div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  // ═══ VIEW ROUTER ═══
  if (view === "greek-home") return <GreekHome />;
  if (view === "greek-lesson") return <GreekLesson />;
  if (view === "greek-practice") return <GreekPractice />;
  if (view === "greek-grammar-home") return <GreekGrammarHome />;
  if (view === "greek-grammar-lesson") return <GreekGrammarLesson />;
  if (view === "greek-reading-home") return <GreekReadingHome />;
  if (view === "greek-reading") return <GreekReading />;
  if (view === "greek-lexicon") return <GreekLexicon />;
  if (view === "greek-flashcards") return <GreekFlashcards />;
  if (view === "greek-journal") return <GreekJournal />;
  return null;
}
