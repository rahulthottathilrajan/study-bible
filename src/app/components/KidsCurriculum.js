"use client";
import { useState, useEffect, useRef, useMemo, useCallback } from "react";
import { LESSONS } from "./KidsCurriculumData";
import { useApp } from "../context/AppContext";
import ConfettiParticles from "./ConfettiParticles";
import MasteryRing from "./MasteryRing";

// ═══════════════════════════════════════════════════
// THEME
// ═══════════════════════════════════════════════════
const KC_LIGHT = {
  bg:"#F0FDF4", card:"#FFFFFF",
  hero:"linear-gradient(135deg, #059669 0%, #10B981 50%, #047857 100%)",
  accent:"#059669", accentLight:"#D1FAE5", text:"#1F2937", muted:"#6B7280", divider:"#E5E7EB",
  heading:"'Georgia','DM Serif Display',serif", body:"'Georgia',serif", ui:"'Outfit','Segoe UI',sans-serif",
  sectionAlt:"#F9FAFB", suppliesBg:"#FFF7ED", suppliesBorder:"#FDBA74", suppliesTitle:"#9A3412", suppliesText:"#78350F",
  memoryGrad:"linear-gradient(135deg,#ECFDF5 0%,#D1FAE5 100%)", memoryBorder:"#A7F3D0", memoryText:"#065F46", memoryRef:"#059669",
  reflectionBg:"#F0FDF4", reflectionBorder:"#86EFAC",
  prayerBg:"#EFF6FF", prayerBorder:"#BFDBFE", prayerText:"#1E3A5F",
  teacherBg:"#F3F4F6", teacherBorder:"#D1D5DB", teacherText:"#374151",
  qRevealed:"#ECFDF5", qDefault:"#F9FAFB", qRevealedBorder:"#A7F3D0", qCircle:"#D1D5DB",
  createAlt:"#FEFCE8", progressTrack:"#E5E7EB",
  celebrationGrad:"linear-gradient(135deg,#ECFDF5,#D1FAE5)", celebrationBorder:"#A7F3D0", celebrationText:"#065F46", celebrationSub:"#047857",
  // New theme colors
  heroGlow:"rgba(5,150,105,0.15)", streakGold:"#D4A853", streakBg:"rgba(212,168,83,0.12)",
  starGold:"#F59E0B", starOutline:"#D1D5DB", celebrationBg:"rgba(255,255,255,0.97)",
  gameCorrect:"#059669", gameWrong:"#EF4444", gameChip:"#F0FDF4", gameChipBorder:"#D1FAE5",
};
const KC_DARK = {
  ...KC_LIGHT,
  bg:"#0E1610", card:"#162016", accentLight:"rgba(5,150,105,0.15)", text:"#C8E0D0", muted:"#7AA088", divider:"rgba(5,150,105,0.2)",
  sectionAlt:"#1A251A", suppliesBg:"rgba(217,119,6,0.1)", suppliesBorder:"rgba(253,186,116,0.3)", suppliesTitle:"#FDBA74", suppliesText:"#FDE68A",
  memoryGrad:"linear-gradient(135deg,rgba(5,150,105,0.15) 0%,rgba(5,150,105,0.08) 100%)", memoryBorder:"rgba(5,150,105,0.3)", memoryText:"#6EE7B7", memoryRef:"#34D399",
  reflectionBg:"rgba(5,150,105,0.08)", reflectionBorder:"rgba(5,150,105,0.25)",
  prayerBg:"rgba(59,130,246,0.08)", prayerBorder:"rgba(59,130,246,0.25)", prayerText:"#93C5FD",
  teacherBg:"rgba(255,255,255,0.04)", teacherBorder:"rgba(255,255,255,0.1)", teacherText:"#9CA3AF",
  qRevealed:"rgba(5,150,105,0.12)", qDefault:"rgba(255,255,255,0.04)", qRevealedBorder:"rgba(5,150,105,0.3)", qCircle:"rgba(255,255,255,0.15)",
  createAlt:"rgba(217,119,6,0.06)", progressTrack:"rgba(255,255,255,0.1)",
  celebrationGrad:"linear-gradient(135deg,rgba(5,150,105,0.15),rgba(5,150,105,0.08))", celebrationBorder:"rgba(5,150,105,0.3)", celebrationText:"#6EE7B7", celebrationSub:"#34D399",
  heroGlow:"rgba(5,150,105,0.25)", streakBg:"rgba(212,168,83,0.2)",
  starOutline:"rgba(255,255,255,0.15)", celebrationBg:"rgba(22,32,22,0.97)",
  gameChip:"rgba(5,150,105,0.1)", gameChipBorder:"rgba(5,150,105,0.25)",
};

const AGE_BADGES = { "3-5":{bg:"#FEF3C7",color:"#92400E",label:"Ages 3\u20135"}, "6-8":{bg:"#DBEAFE",color:"#1E40AF",label:"Ages 6\u20138"}, "9-12":{bg:"#EDE9FE",color:"#5B21B6",label:"Ages 9\u201312"} };
const TERM_BADGES = { "Term 1":{bg:"#FEE2E2",color:"#991B1B",label:"Term 1 \u00B7 Jan\u2013Mar"}, "Term 2":{bg:"#FEF3C7",color:"#92400E",label:"Term 2 \u00B7 Apr\u2013Jun"}, "Term 3":{bg:"#DBEAFE",color:"#1E40AF",label:"Term 3 \u00B7 Jul\u2013Sep"}, "Term 4":{bg:"#EDE9FE",color:"#5B21B6",label:"Term 4 \u00B7 Oct\u2013Dec"} };
const TERM_WEEKS = { "Term 1":[1,2,3,4,5,6,7,8,9,10,11,12,13], "Term 2":[14,15,16,17,18,19,20,21,22,23,24,25,26], "Term 3":[27,28,29,30,31,32,33,34,35,36,37,38,39], "Term 4":[40,41,42,43,44,45,46,47,48,49,50,51,52] };
const MONTHS = [
  {label:"All",weeks:null},{label:"Jan",weeks:[1,2,3,4]},{label:"Feb",weeks:[5,6,7,8]},{label:"Mar",weeks:[9,10,11,12,13]},
  {label:"Apr",weeks:[14,15,16,17]},{label:"May",weeks:[18,19,20,21,22]},{label:"Jun",weeks:[23,24,25,26]},
  {label:"Jul",weeks:[27,28,29,30]},{label:"Aug",weeks:[31,32,33,34,35]},{label:"Sep",weeks:[36,37,38,39]},
  {label:"Oct",weeks:[40,41,42,43]},{label:"Nov",weeks:[44,45,46,47,48]},{label:"Dec",weeks:[49,50,51,52]},
];
const CELEBRATION_MSGS = ["Wonderful!","Great Job!","Well Done!","Amazing!","God Bless You!"];
const MILESTONES = [{ at:13,label:"Term 1 Complete",icon:"\u2B50" },{ at:26,label:"Halfway Hero",icon:"\u{1F31F}" },{ at:39,label:"Term 3 Complete",icon:"\u{1F3AF}" },{ at:52,label:"Kids Graduate",icon:"\u{1F393}" }];

const getCurrentWeek = () => {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 1);
  return Math.min(Math.ceil(((now - start) / 86400000 + start.getDay() + 1) / 7), 52);
};

const getISOWeek = () => {
  const d = new Date();
  return `${d.getFullYear()}-W${String(getCurrentWeek()).padStart(2,"0")}`;
};

const prevISOWeek = (isoWeek) => {
  if (!isoWeek) return null;
  const [y, w] = isoWeek.split("-W").map(Number);
  if (w > 1) return `${y}-W${String(w-1).padStart(2,"0")}`;
  return `${y-1}-W52`;
};

// Reduced motion check
const prefersReducedMotion = typeof window !== "undefined" && window.matchMedia?.("(prefers-reduced-motion: reduce)")?.matches;
const anim = (val) => prefersReducedMotion ? "none" : val;

// ═══════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════
export default function KidsCurriculum({ nav, darkMode }) {
  const KC = darkMode ? KC_DARK : KC_LIGHT;
  const { awardBadge } = useApp();
  const currentWeek = useMemo(getCurrentWeek, []);

  // ── State ────────────────────────────────────
  const [activeTab, setActiveTab] = useState("lessons");
  const [selectedLesson, setSelectedLesson] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [animIn, setAnimIn] = useState(false);
  const [ageFilter, setAgeFilter] = useState("6-8");
  const [termFilter, setTermFilter] = useState("All");
  const [monthFilter, setMonthFilter] = useState("All");
  const [completedLessons, setCompletedLessons] = useState([]);
  const [revealedQs, setRevealedQs] = useState({});
  const [parentNotesOpen, setParentNotesOpen] = useState(false);
  // Celebration
  const [showCelebration, setShowCelebration] = useState(false);
  const [celebratingWeek, setCelebratingWeek] = useState(null);
  // Streak
  const [streak, setStreak] = useState(0);
  const [bestStreak, setBestStreak] = useState(0);
  const [lastStreakWeek, setLastStreakWeek] = useState(null);
  // Verse game
  const [verseGameActive, setVerseGameActive] = useState(false);
  const [verseGameWords, setVerseGameWords] = useState([]);
  const [verseGameSelected, setVerseGameSelected] = useState([]);
  const [verseGameComplete, setVerseGameComplete] = useState(false);
  const [verseGameWrong, setVerseGameWrong] = useState(null);
  // Milestones
  const [milestones, setMilestones] = useState({});
  // Modal section tracking
  const [activeSection, setActiveSection] = useState(0);

  const modalRef = useRef(null);
  const closeBtnRef = useRef(null);
  const prevFocusRef = useRef(null);
  const sectionRefs = useRef([]);

  // ── Load localStorage ──────────────────────
  useEffect(() => {
    try {
      const c = localStorage.getItem("kidsCompletedLessons");
      if (c) setCompletedLessons(JSON.parse(c));
      const s = parseInt(localStorage.getItem("kidsWeeklyStreak") || "0", 10);
      setStreak(s);
      const bs = parseInt(localStorage.getItem("kidsBestStreak") || "0", 10);
      setBestStreak(bs);
      const lw = localStorage.getItem("kidsLastStreakWeek");
      if (lw) setLastStreakWeek(lw);
      const ms = localStorage.getItem("kidsMilestones");
      if (ms) setMilestones(JSON.parse(ms));
    } catch {}
  }, []);

  // ── Persist ────────────────────────────────
  useEffect(() => { try { localStorage.setItem("kidsCompletedLessons", JSON.stringify(completedLessons)); } catch {} }, [completedLessons]);
  useEffect(() => { try { localStorage.setItem("kidsWeeklyStreak", String(streak)); } catch {} }, [streak]);
  useEffect(() => { try { localStorage.setItem("kidsBestStreak", String(bestStreak)); } catch {} }, [bestStreak]);
  useEffect(() => { try { if (lastStreakWeek) localStorage.setItem("kidsLastStreakWeek", lastStreakWeek); } catch {} }, [lastStreakWeek]);
  useEffect(() => { try { localStorage.setItem("kidsMilestones", JSON.stringify(milestones)); } catch {} }, [milestones]);

  // ── Filtered lessons ───────────────────────
  const filteredLessons = useMemo(() =>
    LESSONS.filter(l => {
      if (termFilter !== "All" && l.term !== termFilter) return false;
      if (monthFilter !== "All") { const m = MONTHS.find(mo => mo.label === monthFilter); if (m?.weeks && !m.weeks.includes(l.week)) return false; }
      return true;
    }), [termFilter, monthFilter]);

  const thisWeekLesson = useMemo(() => LESSONS.find(l => l.week === currentWeek), [currentWeek]);
  const completedCount = completedLessons.length;
  const progressPct = Math.round((completedCount / 52) * 100);

  // ── Modal helpers ──────────────────────────
  const openLesson = (lesson) => {
    prevFocusRef.current = document.activeElement;
    setSelectedLesson(lesson); setModalOpen(true); setRevealedQs({}); setParentNotesOpen(false);
    setShowCelebration(false); setVerseGameActive(false); setVerseGameComplete(false); setActiveSection(0);
    setTimeout(() => { setAnimIn(true); closeBtnRef.current?.focus(); }, 20);
  };

  const closeModal = useCallback(() => {
    setAnimIn(false);
    setTimeout(() => { setModalOpen(false); setSelectedLesson(null); setShowCelebration(false); prevFocusRef.current?.focus(); }, 280);
  }, []);

  const toggleComplete = useCallback((week) => {
    setCompletedLessons(prev => {
      const adding = !prev.includes(week);
      const next = adding ? [...prev, week] : prev.filter(w => w !== week);
      if (adding && awardBadge) {
        if (prev.length === 0) awardBadge("first_lesson_kids");
        if (next.length >= 26) awardBadge("halfway_kids");
        if (next.length >= 52) awardBadge("graduate_kids");
        for (const [, weeks] of Object.entries(TERM_WEEKS)) {
          if (weeks.every(w => next.includes(w))) { awardBadge("term_complete_kids"); break; }
        }
        // Celebration
        setCelebratingWeek(week);
        setShowCelebration(true);
        setTimeout(() => setShowCelebration(false), 5000);
        // Streak
        const cw = getISOWeek();
        setLastStreakWeek(prevLW => {
          if (prevLW === cw) return prevLW; // already credited this week
          const newStreak = prevLW === prevISOWeek(cw) ? streak + 1 : 1;
          setStreak(newStreak);
          setBestStreak(bs => Math.max(bs, newStreak));
          return cw;
        });
        // Milestones
        for (const ms of MILESTONES) {
          if (next.length >= ms.at) {
            setMilestones(prev => prev[ms.at] ? prev : { ...prev, [ms.at]: new Date().toISOString().split("T")[0] });
          }
        }
      }
      return next;
    });
  }, [awardBadge, streak]);

  const toggleQ = (i) => setRevealedQs(prev => ({ ...prev, [i]: !prev[i] }));

  // ── Scroll lock + keyboard ─────────────────
  useEffect(() => {
    if (modalOpen) document.body.style.overflow = "hidden";
    else document.body.style.overflow = "";
    return () => { document.body.style.overflow = ""; };
  }, [modalOpen]);

  useEffect(() => {
    if (!modalOpen) return;
    const h = (e) => {
      if (e.key === "Escape") closeModal();
      if (e.key === "Tab" && modalRef.current) {
        const f = modalRef.current.querySelectorAll('button,[href],[tabindex]:not([tabindex="-1"])');
        if (!f.length) return;
        if (e.shiftKey && document.activeElement === f[0]) { e.preventDefault(); f[f.length-1].focus(); }
        else if (!e.shiftKey && document.activeElement === f[f.length-1]) { e.preventDefault(); f[0].focus(); }
      }
    };
    document.addEventListener("keydown", h);
    return () => document.removeEventListener("keydown", h);
  }, [modalOpen, closeModal]);

  // ── Section observer ───────────────────────
  useEffect(() => {
    if (!modalOpen) return;
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(e => { if (e.isIntersecting) setActiveSection(parseInt(e.target.dataset.sectionIndex || "0")); });
    }, { threshold: 0.4 });
    const timer = setTimeout(() => {
      sectionRefs.current.forEach(el => { if (el) observer.observe(el); });
    }, 350);
    return () => { clearTimeout(timer); observer.disconnect(); };
  }, [modalOpen, selectedLesson]);

  // ── Verse game ─────────────────────────────
  const startVerseGame = useCallback((verse) => {
    const text = verse.split("\u2014")[0].trim();
    let words = text.split(/\s+/);
    // Age adaptation
    if (ageFilter === "3-5") words = words.slice(0, Math.min(8, words.length));
    else if (ageFilter === "6-8") words = words.slice(0, Math.min(15, words.length));
    const shuffled = [...words].sort(() => Math.random() - 0.5);
    setVerseGameWords(shuffled);
    setVerseGameSelected([]);
    setVerseGameComplete(false);
    setVerseGameWrong(null);
    setVerseGameActive(true);
  }, [ageFilter]);

  const tapGameWord = useCallback((word, idx) => {
    const text = selectedLesson?.memoryVerse.split("\u2014")[0].trim() || "";
    let correctWords = text.split(/\s+/);
    if (ageFilter === "3-5") correctWords = correctWords.slice(0, Math.min(8, correctWords.length));
    else if (ageFilter === "6-8") correctWords = correctWords.slice(0, Math.min(15, correctWords.length));
    const nextPos = verseGameSelected.length;
    if (word === correctWords[nextPos]) {
      const newSelected = [...verseGameSelected, { word, idx }];
      setVerseGameSelected(newSelected);
      setVerseGameWrong(null);
      if (newSelected.length === correctWords.length) setVerseGameComplete(true);
    } else {
      setVerseGameWrong(idx);
      setTimeout(() => setVerseGameWrong(null), 600);
    }
  }, [selectedLesson, ageFilter, verseGameSelected]);

  // ═══════════════════════════════════════════════
  // RENDER — SECTION WRAPPER
  // ═══════════════════════════════════════════════
  const Section = ({ icon, title, timing, children, collapsed, onToggle, altBg, sectionIndex }) => (
    <div ref={el => { if (sectionIndex !== undefined) sectionRefs.current[sectionIndex] = el; }} data-section-index={sectionIndex} style={{ marginBottom: 0 }}>
      <div onClick={onToggle} role={onToggle ? "button" : undefined} tabIndex={onToggle ? 0 : undefined}
        aria-expanded={onToggle ? !collapsed : undefined}
        onKeyDown={onToggle ? (e => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); onToggle(); } }) : undefined}
        style={{ display:"flex", alignItems:"center", gap:10, padding:"14px 20px", background:altBg || KC.card, cursor:onToggle ? "pointer" : "default", borderBottom:`1px solid ${KC.divider}` }}>
        <span style={{ fontSize:20 }} aria-hidden="true">{icon}</span>
        <div style={{ flex:1 }}>
          <h3 style={{ fontFamily:KC.heading, fontSize:15, fontWeight:700, color:KC.text, margin:0 }}>{title}</h3>
          {timing && <div style={{ fontFamily:KC.ui, fontSize:10, color:KC.muted, marginTop:1 }}>{timing}</div>}
        </div>
        {onToggle && <span aria-hidden="true" style={{ fontSize:13, color:KC.muted, transition:"transform 0.2s", transform:collapsed ? "rotate(0deg)" : "rotate(180deg)" }}>{"\u25BC"}</span>}
      </div>
      {!collapsed && <div style={{ padding:"16px 20px", background:altBg || KC.card, borderBottom:`1px solid ${KC.divider}` }}>{children}</div>}
    </div>
  );

  const ScriptureBlock = ({ text }) => (
    <div style={{
      background:darkMode ? "rgba(217,119,6,0.1)" : "#FFFBEB", border:darkMode ? "1px solid rgba(217,119,6,0.25)" : "1px solid #FDE68A", borderLeft:"3px solid #D97706",
      borderRadius:10, padding:"16px 18px", fontFamily:KC.body, fontSize:14, color:darkMode ? "#FDE68A" : "#78350F", lineHeight:1.75, fontStyle:"italic", whiteSpace:"pre-line",
    }}>{text}</div>
  );

  // ═══════════════════════════════════════════════
  // RENDER — LESSON CARD
  // ═══════════════════════════════════════════════
  const LessonCard = (lesson, index) => {
    const done = completedLessons.includes(lesson.week);
    const isThisWeek = lesson.week === currentWeek;
    const tb = TERM_BADGES[lesson.term] || {};
    return (
      <div key={lesson.week} role="button" tabIndex={0} aria-label={`Week ${lesson.week}: ${lesson.title}${done ? " (completed)" : ""}${isThisWeek ? " (this week)" : ""}`}
        onClick={() => openLesson(lesson)}
        onKeyDown={e => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); openLesson(lesson); } }}
        style={{
          background: done ? KC.accentLight : KC.card, borderRadius:14, padding:0, position:"relative", overflow:"hidden",
          border: isThisWeek ? `2px solid ${KC.accent}` : `1px solid ${KC.divider}`, borderLeft:`4px solid ${lesson.color}`,
          cursor:"pointer", transition:"transform 0.15s,box-shadow 0.15s",
          boxShadow: isThisWeek ? `0 0 12px ${KC.heroGlow}` : darkMode ? "0 1px 4px rgba(0,0,0,0.2)" : "0 1px 4px rgba(0,0,0,0.04)",
          animation: anim(`fadeIn 0.4s ease ${Math.min(index, 11) * 0.06}s both`),
        }}
        onMouseEnter={e => { e.currentTarget.style.transform = "translateY(-2px)"; }}
        onMouseLeave={e => { e.currentTarget.style.transform = ""; }}
      >
        {/* This Week ribbon */}
        {isThisWeek && (
          <div style={{ position:"absolute", top:12, right:-28, background:KC.accent, color:"#fff", fontFamily:KC.ui, fontSize:8, fontWeight:800, padding:"3px 32px", transform:"rotate(45deg)", letterSpacing:1, textTransform:"uppercase", zIndex:2 }}>
            THIS WEEK
          </div>
        )}
        {done && !isThisWeek && <div aria-label="Completed" style={{ position:"absolute", top:8, right:8, width:22, height:22, borderRadius:"50%", background:"#059669", display:"flex", alignItems:"center", justifyContent:"center", fontSize:12, color:"#fff", zIndex:2 }}>{"\u2713"}</div>}
        <div style={{ padding:"14px 14px 12px" }}>
          <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:8 }}>
            <span style={{ background:lesson.color+"18", color:lesson.color, fontFamily:KC.ui, fontSize:10, fontWeight:700, padding:"2px 8px", borderRadius:6, letterSpacing:0.5, textTransform:"uppercase" }}>Week {lesson.week}</span>
            <span style={{ fontSize:20 }} aria-hidden="true">{lesson.icon}</span>
          </div>
          <div style={{ fontFamily:KC.heading, fontSize:15, fontWeight:700, color:KC.text, lineHeight:1.3, marginBottom:4 }}>{lesson.title}</div>
          <div style={{ fontFamily:KC.ui, fontSize:11, color:KC.muted, marginBottom:8 }}>{lesson.bibleRef}</div>
          <div style={{ fontFamily:KC.body, fontSize:12, color:KC.accent, fontStyle:"italic", lineHeight:1.45, marginBottom:10, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>
            &ldquo;{lesson.keyVerse.split("\u2014")[0].trim()}&rdquo;
          </div>
          <div style={{ display:"flex", alignItems:"center", gap:6, flexWrap:"wrap" }}>
            <span style={{ background:tb.bg, color:tb.color, fontFamily:KC.ui, fontSize:9, fontWeight:600, padding:"2px 7px", borderRadius:4 }}>{lesson.term}</span>
            {lesson.character && <span style={{ fontFamily:KC.ui, fontSize:9, fontWeight:600, color:KC.muted, background:darkMode ? "rgba(255,255,255,0.06)" : "#F3F4F6", padding:"2px 7px", borderRadius:4 }}>{lesson.character.icon} {lesson.character.name}</span>}
          </div>
        </div>
        <div style={{ borderTop:`1px solid ${KC.divider}`, padding:"8px 14px", display:"flex", alignItems:"center", justifyContent:"space-between" }}>
          <span style={{ fontFamily:KC.ui, fontSize:11, fontWeight:600, color:KC.accent }}>{done ? "View Again \u2192" : "View Lesson \u2192"}</span>
          <span style={{ fontFamily:KC.body, fontSize:11, color:KC.muted }}>{lesson.theme}</span>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════
  // RENDER — LESSON MODAL
  // ═══════════════════════════════════════════════
  const LessonModal = () => {
    if (!modalOpen || !selectedLesson) return null;
    const L = selectedLesson;
    const done = completedLessons.includes(L.week);
    const getAge = (field) => typeof field === "string" ? field : (field[ageFilter] || field["6-8"] || "");
    const nextLesson = LESSONS.find(l => l.week === (celebratingWeek || 0) + 1);
    const sectionNames = ["Start","Story","Scripture","Think","Create","Verse","Reflect","Pray","Notes"];

    return (
      <div role="dialog" aria-modal="true" aria-label={`Week ${L.week}: ${L.title}`}
        style={{ position:"fixed", inset:0, zIndex:9999, background:"rgba(0,0,0,0.5)", opacity:animIn ? 1 : 0, transition:"opacity 0.28s ease" }}
        onClick={closeModal}>
        <div ref={modalRef} onClick={e => e.stopPropagation()} style={{
          position:"absolute", bottom:0, left:0, right:0, maxHeight:"92vh", background:KC.bg,
          borderRadius:"20px 20px 0 0", overflow:"hidden", display:"flex", flexDirection:"column",
          transform:animIn ? "translateY(0)" : "translateY(100%)", transition:"transform 0.3s cubic-bezier(0.32,0.72,0,1)",
        }}>
          {/* Sticky Header */}
          <div style={{ background:L.color, padding:"16px 20px 14px", display:"flex", alignItems:"flex-start", gap:12, flexShrink:0 }}>
            <button ref={closeBtnRef} onClick={closeModal} aria-label="Close lesson" style={{ background:"rgba(255,255,255,0.2)", border:"none", borderRadius:8, padding:"6px 10px", color:"#fff", fontSize:15, cursor:"pointer", fontFamily:KC.ui }}>{"\u2715"}</button>
            <div style={{ flex:1 }}>
              <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4 }}>
                <span style={{ background:"rgba(255,255,255,0.2)", color:"#fff", fontFamily:KC.ui, fontSize:10, fontWeight:700, padding:"2px 8px", borderRadius:6 }}>WEEK {L.week}</span>
                <span style={{ fontSize:22 }} aria-hidden="true">{L.icon}</span>
              </div>
              <h2 style={{ fontFamily:KC.heading, fontSize:20, fontWeight:700, color:"#fff", lineHeight:1.25, margin:0 }}>{L.title}</h2>
              <div style={{ fontFamily:KC.ui, fontSize:12, color:"rgba(255,255,255,0.8)", marginTop:4 }}>{L.bibleRef}</div>
            </div>
          </div>

          {/* Age Toggle + Section Dots */}
          <div style={{ flexShrink:0 }}>
            <div style={{ display:"flex", gap:6, padding:"10px 20px", background:KC.card, borderBottom:`1px solid ${KC.divider}` }} role="radiogroup" aria-label="Age group">
              {["3-5","6-8","9-12"].map(ag => {
                const ab = AGE_BADGES[ag]; const active = ageFilter === ag;
                return <button key={ag} onClick={() => setAgeFilter(ag)} role="radio" aria-checked={active} style={{
                  flex:1, padding:"7px 0", borderRadius:8, border:"none",
                  background:active ? ab.bg : (darkMode ? "rgba(255,255,255,0.06)" : "#F3F4F6"),
                  color:active ? ab.color : KC.muted, fontFamily:KC.ui, fontSize:12, fontWeight:active ? 700 : 500, cursor:"pointer", transition:"all 0.15s",
                }}>{ab.label}</button>;
              })}
            </div>
            {/* Section progress dots */}
            <div style={{ display:"flex", justifyContent:"center", gap:6, padding:"8px 20px", background:KC.card, borderBottom:`1px solid ${KC.divider}` }} aria-label="Section progress">
              {sectionNames.map((name, i) => (
                <div key={i} title={name} style={{
                  width:8, height:8, borderRadius:"50%", transition:"all 0.2s",
                  background: i === activeSection ? KC.accent : i < activeSection ? `${KC.accent}99` : KC.divider,
                  transform: i === activeSection ? "scale(1.3)" : "scale(1)",
                }} />
              ))}
            </div>
          </div>

          {/* Scrollable Content */}
          <div style={{ flex:1, overflowY:"auto", WebkitOverflowScrolling:"touch", position:"relative" }}>
            <Section icon="\u{1F31F}" title="Before We Start" timing="5 minutes" sectionIndex={0}>
              <p style={{ fontFamily:KC.body, fontSize:14.5, color:KC.text, lineHeight:1.7, margin:0 }}>{L.warmUp}</p>
            </Section>

            <Section icon="\u{1F4D6}" title="The Story" timing="10 minutes" sectionIndex={1}>
              <p style={{ fontFamily:KC.body, fontSize:14.5, color:KC.text, lineHeight:1.75, margin:0 }}>{getAge(L.story)}</p>
            </Section>

            <Section icon="\u{1F4DC}" title="Scripture Reading" timing="5 minutes" sectionIndex={2}>
              <ScriptureBlock text={getAge(L.scripture)} />
            </Section>

            <Section icon="\u{1F4AD}" title="Think About It" timing="10 minutes" sectionIndex={3}>
              <p style={{ fontFamily:KC.ui, fontSize:12, color:KC.muted, margin:"0 0 12px", lineHeight:1.5 }}>Tap each question to reveal it. Talk about it with your family or class!</p>
              {L.discussionQuestions.map((q, i) => (
                <div key={i} role="button" tabIndex={0} aria-label={revealedQs[i] ? `Question ${i+1}: ${q}` : `Reveal question ${i+1}`}
                  onClick={() => toggleQ(i)} onKeyDown={e => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); toggleQ(i); } }}
                  style={{ background:revealedQs[i] ? KC.qRevealed : KC.qDefault, border:`1px solid ${revealedQs[i] ? KC.qRevealedBorder : KC.divider}`, borderRadius:10, padding:"12px 14px", marginBottom:8, cursor:"pointer", transition:"all 0.2s" }}>
                  <div style={{ display:"flex", alignItems:"flex-start", gap:8 }}>
                    <span aria-hidden="true" style={{ width:24, height:24, borderRadius:"50%", background:revealedQs[i] ? KC.accent : KC.qCircle, color:"#fff", display:"flex", alignItems:"center", justifyContent:"center", fontFamily:KC.ui, fontSize:11, fontWeight:700, flexShrink:0, marginTop:1 }}>{i+1}</span>
                    <span style={{ fontFamily:KC.body, fontSize:14, color:revealedQs[i] ? KC.text : KC.muted, lineHeight:1.55, filter:revealedQs[i] ? "none" : "blur(4px)", transition:"filter 0.25s,color 0.25s", userSelect:revealedQs[i] ? "auto" : "none" }} aria-hidden={!revealedQs[i]}>{q}</span>
                  </div>
                  {!revealedQs[i] && <div style={{ fontFamily:KC.ui, fontSize:10, color:KC.accent, marginTop:6, marginLeft:32 }}>Tap to reveal</div>}
                </div>
              ))}
            </Section>

            <Section icon="\u{1F3A8}" title="Create & Explore" timing="15 minutes" altBg={KC.createAlt} sectionIndex={4}>
              {L.supplies && (
                <div style={{ background:KC.suppliesBg, border:`1px solid ${KC.suppliesBorder}`, borderRadius:8, padding:"10px 14px", marginBottom:14 }}>
                  <div style={{ fontFamily:KC.ui, fontSize:11, fontWeight:700, color:KC.suppliesTitle, marginBottom:4 }}>{"\u{1F4E6}"} You will need:</div>
                  <div style={{ fontFamily:KC.body, fontSize:13, color:KC.suppliesText, lineHeight:1.6 }}>{L.supplies}</div>
                </div>
              )}
              <div style={{ fontFamily:KC.body, fontSize:14.5, color:KC.text, lineHeight:1.75, whiteSpace:"pre-line" }}>{getAge(L.activities)}</div>
            </Section>

            {/* Memory Verse + Game */}
            <Section icon="\u2728" title="Memory Verse" sectionIndex={5}>
              <div style={{ background:KC.memoryGrad, border:`1px solid ${KC.memoryBorder}`, borderRadius:12, padding:20, textAlign:"center" }}>
                <div style={{ fontFamily:KC.heading, fontSize:18, color:KC.memoryText, lineHeight:1.6, fontStyle:"italic" }}>&ldquo;{L.memoryVerse.split("\u2014")[0].trim()}&rdquo;</div>
                <div style={{ fontFamily:KC.ui, fontSize:12, color:KC.memoryRef, fontWeight:600, marginTop:8 }}>{"\u2014"} {L.memoryVerse.split("\u2014").slice(1).join("\u2014").trim()}</div>
              </div>
              {/* Verse Game */}
              {!verseGameActive ? (
                <div style={{ textAlign:"center", marginTop:14 }}>
                  <button onClick={() => startVerseGame(L.memoryVerse)} style={{
                    padding:"10px 24px", borderRadius:20, border:`2px solid ${KC.accent}`, background:"transparent",
                    color:KC.accent, fontFamily:KC.ui, fontSize:13, fontWeight:700, cursor:"pointer", transition:"all 0.15s",
                  }} onMouseEnter={e => { e.currentTarget.style.background = KC.accent; e.currentTarget.style.color = "#fff"; }}
                    onMouseLeave={e => { e.currentTarget.style.background = "transparent"; e.currentTarget.style.color = KC.accent; }}>
                    {"\u{1F3AE}"} Challenge Me!
                  </button>
                </div>
              ) : (
                <div style={{ marginTop:16, position:"relative" }}>
                  {verseGameComplete && <ConfettiParticles count={6} colors={["#059669","#D4A853","#34D399","#F59E0B"]} />}
                  {/* Built words */}
                  <div style={{ minHeight:44, padding:"8px 12px", borderRadius:10, border:`2px dashed ${KC.divider}`, marginBottom:12, display:"flex", flexWrap:"wrap", gap:6, alignItems:"center" }}>
                    {verseGameSelected.length === 0 && <span style={{ fontFamily:KC.ui, fontSize:12, color:KC.muted, fontStyle:"italic" }}>Tap words in the correct order...</span>}
                    {verseGameSelected.map((s, i) => (
                      <span key={i} style={{ padding:"5px 10px", borderRadius:16, background:KC.gameCorrect, color:"#fff", fontFamily:KC.body, fontSize:13, fontWeight:600, animation:anim(`slideInRight 0.25s ease ${i * 0.05}s both`) }}>{s.word}</span>
                    ))}
                  </div>
                  {verseGameComplete ? (
                    <div style={{ textAlign:"center", padding:"12px 0" }} aria-live="polite">
                      <div style={{ fontFamily:KC.heading, fontSize:20, color:KC.accent, fontWeight:700, animation:anim("scaleIn 0.3s ease") }}>You did it! {"\u{1F389}"}</div>
                      <button onClick={() => { setVerseGameActive(false); setVerseGameComplete(false); }} style={{ marginTop:10, padding:"8px 20px", borderRadius:16, border:"none", background:KC.accent, color:"#fff", fontFamily:KC.ui, fontSize:12, fontWeight:600, cursor:"pointer" }}>Done</button>
                    </div>
                  ) : (
                    <div style={{ display:"flex", flexWrap:"wrap", gap:6 }}>
                      {verseGameWords.map((word, i) => {
                        const used = verseGameSelected.some(s => s.idx === i);
                        const isWrong = verseGameWrong === i;
                        return (
                          <button key={i} disabled={used} onClick={() => tapGameWord(word, i)} style={{
                            padding:"6px 12px", borderRadius:16, border:`1px solid ${KC.gameChipBorder}`,
                            background: used ? KC.divider : KC.gameChip,
                            color: used ? KC.muted : KC.text, fontFamily:KC.body, fontSize:13,
                            cursor: used ? "default" : "pointer", opacity: used ? 0.3 : 1, transition:"all 0.15s",
                            animation: isWrong ? anim("shakeWrong 0.4s ease") : "none",
                          }}>{word}</button>
                        );
                      })}
                    </div>
                  )}
                  <div style={{ display:"flex", gap:8, justifyContent:"center", marginTop:12 }}>
                    <button onClick={() => startVerseGame(L.memoryVerse)} style={{ padding:"6px 16px", borderRadius:12, border:`1px solid ${KC.divider}`, background:"transparent", color:KC.muted, fontFamily:KC.ui, fontSize:11, cursor:"pointer" }}>Try Again</button>
                    <button onClick={() => { setVerseGameActive(false); setVerseGameComplete(false); }} style={{ padding:"6px 16px", borderRadius:12, border:`1px solid ${KC.divider}`, background:"transparent", color:KC.muted, fontFamily:KC.ui, fontSize:11, cursor:"pointer" }}>Skip</button>
                  </div>
                </div>
              )}
            </Section>

            <Section icon="\u{1F4DD}" title="What I Learned Today" sectionIndex={6}>
              <div style={{ background:KC.reflectionBg, border:`1px dashed ${KC.reflectionBorder}`, borderRadius:10, padding:"16px 18px" }}>
                <p style={{ fontFamily:KC.body, fontSize:14.5, color:KC.text, lineHeight:1.7, margin:0 }}>{L.reflection}</p>
              </div>
            </Section>

            <Section icon="\u{1F64F}" title="Let's Pray" sectionIndex={7}>
              <div style={{ background:KC.prayerBg, border:`1px solid ${KC.prayerBorder}`, borderRadius:10, padding:"16px 18px" }}>
                <p style={{ fontFamily:KC.body, fontSize:14.5, color:KC.prayerText, lineHeight:1.75, margin:0, fontStyle:"italic" }}>{L.prayer}</p>
              </div>
            </Section>

            <Section icon="\u{1F468}\u200D\u{1F3EB}" title="Parent & Teacher Notes" collapsed={!parentNotesOpen} onToggle={() => setParentNotesOpen(!parentNotesOpen)} altBg={KC.sectionAlt} sectionIndex={8}>
              <div style={{ background:KC.teacherBg, border:`1px solid ${KC.teacherBorder}`, borderRadius:10, padding:"16px 18px" }}>
                <p style={{ fontFamily:KC.body, fontSize:13.5, color:KC.teacherText, lineHeight:1.8, margin:0 }}>{L.teacherNote}</p>
              </div>
            </Section>

            {/* Mark as Taught */}
            <div style={{ padding:"20px 20px 40px", textAlign:"center" }}>
              <button onClick={() => toggleComplete(L.week)} aria-label={done ? "Unmark lesson" : "Mark lesson as taught"} style={{
                padding:"14px 32px", borderRadius:12, border:"none",
                background:done ? KC.sectionAlt : KC.accent, color:done ? KC.muted : "#fff",
                fontFamily:KC.ui, fontSize:15, fontWeight:700, cursor:"pointer", transition:"all 0.2s",
                boxShadow:done ? "none" : "0 2px 8px rgba(5,150,105,0.3)",
              }}>{done ? "\u2713 Lesson Complete" : "Mark Lesson as Taught"}</button>
            </div>

            {/* Celebration overlay */}
            {showCelebration && (
              <div aria-live="polite" style={{
                position:"sticky", bottom:0, left:0, right:0, background:KC.celebrationBg,
                borderTop:`2px solid ${KC.celebrationBorder}`, padding:"24px 20px 32px", textAlign:"center",
                animation:anim("slideUp 0.4s ease"),
              }}>
                <div style={{ position:"relative", display:"inline-block" }}>
                  <ConfettiParticles count={12} colors={["#059669","#D4A853","#34D399","#F59E0B"]} />
                  <div style={{ width:56, height:56, borderRadius:"50%", background:KC.accent, display:"flex", alignItems:"center", justifyContent:"center", margin:"0 auto 12px", animation:anim("scaleIn 0.4s ease"), fontSize:28, color:"#fff" }}>{"\u2713"}</div>
                </div>
                <div style={{ fontFamily:KC.heading, fontSize:24, fontWeight:700, color:KC.celebrationText, animation:anim("fadeIn 0.4s ease 0.2s both") }}>
                  {CELEBRATION_MSGS[Math.floor(Math.random() * CELEBRATION_MSGS.length)]}
                </div>
                <div style={{ fontFamily:KC.ui, fontSize:14, color:KC.celebrationSub, marginTop:6, animation:anim("fadeIn 0.4s ease 0.4s both") }}>
                  Week {celebratingWeek} complete {"\u2014"} {completedLessons.length} of 52 lessons taught!
                </div>
                {nextLesson && (
                  <button onClick={() => { setShowCelebration(false); openLesson(nextLesson); }} style={{
                    marginTop:16, padding:"12px 28px", borderRadius:12, border:"none", background:KC.accent, color:"#fff",
                    fontFamily:KC.ui, fontSize:14, fontWeight:700, cursor:"pointer", animation:anim("fadeIn 0.4s ease 0.6s both"),
                  }}>Next Lesson: Week {nextLesson.week} {"\u2192"}</button>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════
  // RENDER — STAR BOARD
  // ═══════════════════════════════════════════════
  const StarBoard = () => (
    <div id="panel-stars" role="tabpanel" aria-label="Star Board" style={{ padding:"20px 16px 40px" }}>
      <div style={{ textAlign:"center", marginBottom:20 }}>
        <div style={{ fontFamily:KC.heading, fontSize:18, color:KC.text, marginBottom:4 }}>Your Star Collection</div>
        <div style={{ fontFamily:KC.ui, fontSize:13, color:KC.muted }}>{completedCount} of 52 stars earned</div>
      </div>
      {Object.entries(TERM_WEEKS).map(([term, weeks]) => {
        const termDone = weeks.filter(w => completedLessons.includes(w)).length;
        const tb = TERM_BADGES[term];
        return (
          <div key={term} style={{ marginBottom:20 }}>
            <div style={{ display:"flex", alignItems:"center", gap:10, marginBottom:10 }}>
              <MasteryRing percentage={Math.round(termDone / 13 * 100)} size={40} strokeWidth={3} theme={KC} animate showLabel={false} />
              <div>
                <div style={{ fontFamily:KC.heading, fontSize:14, fontWeight:700, color:KC.text }}>{term}</div>
                <div style={{ fontFamily:KC.ui, fontSize:11, color:KC.muted }}>{termDone}/13 lessons</div>
              </div>
              <span style={{ marginLeft:"auto", background:tb.bg, color:tb.color, fontFamily:KC.ui, fontSize:9, fontWeight:600, padding:"2px 8px", borderRadius:4 }}>{tb.label}</span>
            </div>
            <div style={{ display:"grid", gridTemplateColumns:"repeat(13, 1fr)", gap:4 }}>
              {weeks.map((w, i) => {
                const done = completedLessons.includes(w);
                const isCurrent = w === currentWeek;
                const lesson = LESSONS.find(l => l.week === w);
                return (
                  <button key={w} onClick={() => { if (lesson) openLesson(lesson); }}
                    aria-label={`Week ${w}: ${lesson?.title || ""}${done ? " (completed)" : ""}`}
                    style={{
                      width:"100%", aspectRatio:"1", borderRadius:"50%", border:"none", cursor:"pointer",
                      display:"flex", alignItems:"center", justifyContent:"center",
                      fontSize:18, lineHeight:1, padding:0,
                      background: done ? KC.starGold : isCurrent ? KC.accentLight : "transparent",
                      color: done ? "#fff" : isCurrent ? KC.accent : KC.starOutline,
                      animation: done ? anim(`scaleIn 0.3s ease ${i * 0.04}s both`) : isCurrent ? anim("breathe 2s ease-in-out infinite") : "none",
                      transition:"transform 0.15s",
                    }}
                    onMouseEnter={e => { e.currentTarget.style.transform = "scale(1.2)"; }}
                    onMouseLeave={e => { e.currentTarget.style.transform = ""; }}
                  >{done ? "\u2605" : "\u2606"}</button>
                );
              })}
            </div>
          </div>
        );
      })}
    </div>
  );

  // ═══════════════════════════════════════════════
  // RENDER — PROGRESS TAB (TROPHY WALL)
  // ═══════════════════════════════════════════════
  const ProgressTab = () => {
    const collectedChars = LESSONS.filter(l => completedLessons.includes(l.week) && l.character);
    return (
      <div id="panel-progress" role="tabpanel" aria-label="Progress" style={{ padding:"20px 16px 40px" }}>
        {/* Overall Ring */}
        <div style={{ background:KC.card, borderRadius:14, padding:24, border:`1px solid ${KC.divider}`, marginBottom:16, textAlign:"center" }}>
          <div style={{ display:"flex", justifyContent:"center", marginBottom:12 }}>
            <MasteryRing percentage={progressPct} size={120} strokeWidth={5} theme={KC} animate showLabel />
          </div>
          <div style={{ fontFamily:KC.ui, fontSize:13, color:KC.muted }}>of 52 lessons taught</div>
          {streak > 0 && (
            <div role="status" style={{ display:"inline-flex", alignItems:"center", gap:6, marginTop:12, background:KC.streakBg, padding:"6px 14px", borderRadius:20 }}>
              <span style={{ fontSize:18 }} aria-hidden="true">{"\u{1F525}"}</span>
              <span style={{ fontFamily:KC.ui, fontSize:13, fontWeight:700, color:KC.streakGold }}>{streak} week streak</span>
              {bestStreak > streak && <span style={{ fontFamily:KC.ui, fontSize:11, color:KC.muted }}>{"\u00B7"} Best: {bestStreak}</span>}
            </div>
          )}
        </div>

        {/* Per-term rings */}
        <div style={{ display:"grid", gridTemplateColumns:"repeat(4, 1fr)", gap:8, marginBottom:16 }}>
          {Object.entries(TERM_WEEKS).map(([term, weeks]) => {
            const termDone = weeks.filter(w => completedLessons.includes(w)).length;
            const pct = Math.round(termDone / 13 * 100);
            return (
              <div key={term} style={{ background:KC.card, borderRadius:10, padding:"12px 8px", border:`1px solid ${KC.divider}`, textAlign:"center" }}>
                <div style={{ display:"flex", justifyContent:"center", marginBottom:6 }}>
                  <MasteryRing percentage={pct} size={48} strokeWidth={3} theme={KC} animate showLabel={false} />
                </div>
                <div style={{ fontFamily:KC.ui, fontSize:10, fontWeight:600, color:KC.text }}>{term.replace("Term ","T")}</div>
                <div style={{ fontFamily:KC.ui, fontSize:9, color:KC.muted }}>{termDone}/13</div>
              </div>
            );
          })}
        </div>

        {/* Character Collection */}
        {collectedChars.length > 0 && (
          <div style={{ background:KC.card, borderRadius:14, padding:16, border:`1px solid ${KC.divider}`, marginBottom:16 }}>
            <div style={{ fontFamily:KC.heading, fontSize:15, color:KC.text, marginBottom:10 }}>{"\u{1F4DA}"} Character Collection</div>
            <div style={{ display:"grid", gridTemplateColumns:"repeat(auto-fill, minmax(60px, 1fr))", gap:8 }}>
              {LESSONS.map(l => {
                const unlocked = completedLessons.includes(l.week);
                const ch = l.character;
                if (!ch) return null;
                return (
                  <button key={l.week} onClick={() => { if (unlocked) openLesson(l); }}
                    aria-label={unlocked ? `${ch.name}: ${ch.fact}` : "Locked character"}
                    style={{ display:"flex", flexDirection:"column", alignItems:"center", gap:4, padding:6, borderRadius:10, border:"none", background:"transparent", cursor:unlocked ? "pointer" : "default" }}>
                    <div style={{
                      width:40, height:40, borderRadius:"50%", display:"flex", alignItems:"center", justifyContent:"center", fontSize:20,
                      background: unlocked ? l.color + "20" : KC.divider,
                      filter: unlocked ? "none" : "grayscale(1) opacity(0.3)",
                      animation: unlocked ? anim(`scaleIn 0.3s ease`) : "none",
                    }}>{unlocked ? ch.icon : "?"}</div>
                    <span style={{ fontFamily:KC.ui, fontSize:8, color: unlocked ? KC.text : KC.muted, textAlign:"center", lineHeight:1.2, maxWidth:56, overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap" }}>
                      {unlocked ? ch.name : "???"}
                    </span>
                  </button>
                );
              })}
            </div>
            <div style={{ fontFamily:KC.ui, fontSize:11, color:KC.muted, textAlign:"center", marginTop:8 }}>{collectedChars.length} of 52 characters collected</div>
          </div>
        )}

        {/* Milestones */}
        {Object.keys(milestones).length > 0 && (
          <div style={{ marginBottom:16 }}>
            <div style={{ fontFamily:KC.heading, fontSize:15, color:KC.text, marginBottom:10 }}>{"\u{1F3C6}"} Milestones</div>
            <div style={{ display:"grid", gridTemplateColumns:"repeat(2, 1fr)", gap:8 }}>
              {MILESTONES.map(ms => {
                const achieved = milestones[ms.at];
                return (
                  <div key={ms.at} style={{
                    background: achieved ? KC.accentLight : KC.card, borderRadius:10, padding:12,
                    border:`1px solid ${achieved ? KC.accent + "40" : KC.divider}`, textAlign:"center", opacity:achieved ? 1 : 0.4,
                  }}>
                    <div style={{ fontSize:24 }} aria-hidden="true">{ms.icon}</div>
                    <div style={{ fontFamily:KC.ui, fontSize:11, fontWeight:600, color:KC.text, marginTop:4 }}>{ms.label}</div>
                    {achieved && <div style={{ fontFamily:KC.ui, fontSize:9, color:KC.muted, marginTop:2 }}>{achieved}</div>}
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {/* Empty state */}
        {completedCount === 0 && (
          <div style={{ textAlign:"center", padding:30 }}>
            <div style={{ fontSize:48, marginBottom:12 }} aria-hidden="true">{"\u{1F331}"}</div>
            <div style={{ fontFamily:KC.heading, fontSize:17, color:KC.text }}>Your journey begins here!</div>
            <div style={{ fontFamily:KC.body, fontSize:14, color:KC.muted, marginTop:8, lineHeight:1.6 }}>Open any lesson and tap &ldquo;Mark Lesson as Taught&rdquo; when you finish. Your progress will appear here.</div>
          </div>
        )}

        {/* Celebration at 52 */}
        {completedCount >= 52 && (
          <div style={{ background:KC.celebrationGrad, borderRadius:14, padding:24, textAlign:"center", marginTop:16, border:`1px solid ${KC.celebrationBorder}` }}>
            <div style={{ fontSize:48, marginBottom:8 }} aria-hidden="true">{"\u{1F389}"}</div>
            <div style={{ fontFamily:KC.heading, fontSize:20, fontWeight:700, color:KC.celebrationText }}>Congratulations!</div>
            <div style={{ fontFamily:KC.body, fontSize:14, color:KC.celebrationSub, lineHeight:1.6, marginTop:8 }}>You have completed all 52 lessons! A full year of God&apos;s Word, from Creation to the New Creation. Well done, good and faithful servant!</div>
          </div>
        )}
      </div>
    );
  };

  // ═══════════════════════════════════════════════
  // RENDER — MAIN
  // ═══════════════════════════════════════════════
  return (
    <div style={{ minHeight:"100vh", background:KC.bg }}>

      {/* ── Hero ──────────────────────────────── */}
      <div style={{ background:KC.hero, padding:"20px 20px 24px", position:"relative", overflow:"hidden" }}>
        {/* Animated sparkles */}
        {[0,1,2].map(i => (
          <span key={i} aria-hidden="true" style={{
            position:"absolute", fontSize:16, opacity:0.5,
            top:`${20 + i * 25}%`, right:`${10 + i * 20}%`,
            animation:anim(`confettiFloat ${3 + i * 0.5}s ease-in-out ${i * 0.8}s infinite`),
            pointerEvents:"none",
          }}>{"\u2728"}</span>
        ))}

        <button onClick={() => nav("learn-home")} aria-label="Back to Learn" style={{
          background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:"6px 12px",
          color:"#fff", fontFamily:KC.ui, fontSize:13, cursor:"pointer", marginBottom:14,
        }}>{"\u2190"} Back</button>

        <div style={{ display:"flex", alignItems:"center", gap:12, marginBottom:4 }}>
          <span style={{ fontSize:36, animation:anim("fadeIn 0.4s ease 0.1s both") }} aria-hidden="true">{"\u{1F9D2}"}</span>
          <div>
            <h1 style={{ fontFamily:KC.heading, fontSize:24, fontWeight:700, color:"#fff", margin:0, lineHeight:1.2, animation:anim("fadeIn 0.4s ease 0.15s both") }}>Kids Church Curriculum</h1>
            <p style={{ fontFamily:KC.ui, fontSize:13, color:"rgba(255,255,255,0.8)", margin:"2px 0 0", fontStyle:"italic", animation:anim("fadeIn 0.4s ease 0.25s both") }}>A 52-Week Bible Adventure</p>
          </div>
        </div>

        {/* Streak */}
        {streak > 0 && (
          <div role="status" style={{ position:"absolute", top:20, right:20, display:"flex", alignItems:"center", gap:4, background:"rgba(255,255,255,0.15)", borderRadius:16, padding:"4px 10px" }}>
            <span style={{ fontSize:14 }}>{"\u{1F525}"}</span>
            <span style={{ fontFamily:KC.ui, fontSize:12, fontWeight:700, color:"#fff" }}>{streak}</span>
          </div>
        )}

        {/* This Week's Lesson Card */}
        {thisWeekLesson && (
          <div onClick={() => openLesson(thisWeekLesson)} role="button" tabIndex={0}
            onKeyDown={e => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); openLesson(thisWeekLesson); } }}
            style={{
              background:"rgba(255,255,255,0.12)", borderRadius:12, padding:"12px 14px", marginTop:14,
              border:"1px solid rgba(255,255,255,0.2)", cursor:"pointer", display:"flex", alignItems:"center", gap:12,
              backdropFilter:"blur(8px)", animation:anim("fadeIn 0.5s ease 0.3s both"),
            }}>
            <div style={{ width:44, height:44, borderRadius:10, background:"rgba(255,255,255,0.15)", display:"flex", alignItems:"center", justifyContent:"center", fontSize:24, flexShrink:0 }}>{thisWeekLesson.icon}</div>
            <div style={{ flex:1, minWidth:0 }}>
              <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:3 }}>
                <span style={{ fontFamily:KC.ui, fontSize:9, fontWeight:800, color:"#fff", background:"rgba(255,255,255,0.25)", padding:"2px 8px", borderRadius:6, letterSpacing:1, textTransform:"uppercase", animation:anim("pulseGlow 3s ease-in-out infinite") }}>THIS WEEK</span>
                {completedLessons.includes(thisWeekLesson.week) && <span style={{ fontSize:12, color:"#6EE7B7" }}>{"\u2713"}</span>}
              </div>
              <div style={{ fontFamily:KC.heading, fontSize:14, fontWeight:700, color:"#fff", lineHeight:1.3 }}>{thisWeekLesson.title}</div>
              <div style={{ fontFamily:KC.ui, fontSize:11, color:"rgba(255,255,255,0.7)" }}>{thisWeekLesson.bibleRef}</div>
            </div>
            <span style={{ fontFamily:KC.ui, fontSize:20, color:"rgba(255,255,255,0.6)" }}>{"\u203A"}</span>
          </div>
        )}

        {/* Stats strip */}
        <div style={{ display:"flex", gap:8, marginTop:12, animation:anim("fadeIn 0.4s ease 0.4s both") }}>
          {[{ n:"52",l:"Lessons" },{ n:"4",l:"Terms" },{ n:"3",l:"Ages" },{ n:String(completedCount),l:"Taught" }].map((s,i) => (
            <div key={i} style={{ flex:1, background:"rgba(255,255,255,0.08)", borderRadius:8, padding:"5px 0", textAlign:"center" }}>
              <div style={{ fontFamily:KC.heading, fontSize:15, fontWeight:700, color:"#fff" }}>{s.n}</div>
              <div style={{ fontFamily:KC.ui, fontSize:9, color:"rgba(255,255,255,0.6)" }}>{s.l}</div>
            </div>
          ))}
        </div>

        {/* Progress bar with milestones */}
        {completedCount > 0 && (
          <div style={{ marginTop:10, animation:anim("fadeIn 0.4s ease 0.5s both") }} role="progressbar" aria-valuenow={progressPct} aria-valuemin={0} aria-valuemax={100}>
            <div style={{ display:"flex", justifyContent:"space-between", marginBottom:3 }}>
              <span style={{ fontFamily:KC.ui, fontSize:9, color:"rgba(255,255,255,0.6)" }}>Year Progress</span>
              <span style={{ fontFamily:KC.ui, fontSize:9, color:"rgba(255,255,255,0.9)", fontWeight:700 }}>{progressPct}%</span>
            </div>
            <div style={{ height:6, borderRadius:3, background:"rgba(255,255,255,0.12)", position:"relative" }}>
              <div style={{ height:6, borderRadius:3, background:"#fff", width:`${progressPct}%`, transition:"width 0.4s ease" }} />
              {[25,50,75].map(p => (
                <div key={p} style={{ position:"absolute", top:-1, left:`${p}%`, width:2, height:8, background:"rgba(255,255,255,0.3)", borderRadius:1, transform:"translateX(-1px)" }} />
              ))}
            </div>
          </div>
        )}
      </div>

      {/* ── Tabs ──────────────────────────────── */}
      <div style={{ display:"flex", background:KC.card, borderBottom:`1px solid ${KC.divider}`, position:"sticky", top:0, zIndex:100 }} role="tablist" aria-label="Curriculum sections">
        {[{id:"lessons",label:"\u{1F4DA} Lessons"},{id:"stars",label:"\u2B50 Stars"},{id:"progress",label:"\u{1F3C6} Progress"}].map(tab => (
          <button key={tab.id} onClick={() => setActiveTab(tab.id)} role="tab" aria-selected={activeTab === tab.id} aria-controls={`panel-${tab.id}`}
            style={{
              flex:1, padding:"12px 0", border:"none", background:"transparent",
              borderBottom:activeTab === tab.id ? `2px solid ${KC.accent}` : "2px solid transparent",
              fontFamily:KC.ui, fontSize:12, fontWeight:activeTab === tab.id ? 700 : 500,
              color:activeTab === tab.id ? KC.accent : KC.muted, cursor:"pointer", transition:"all 0.15s",
            }}>{tab.label}</button>
        ))}
      </div>

      {/* ═══════════════════════════════════════ */}
      {/* LESSONS TAB                            */}
      {/* ═══════════════════════════════════════ */}
      {activeTab === "lessons" && (
        <div id="panel-lessons" role="tabpanel" aria-label="Lessons">
          {/* Term filter */}
          <div style={{ padding:"12px 16px 0", display:"flex", gap:6, flexWrap:"wrap" }} role="radiogroup" aria-label="Filter by term">
            {["All","Term 1","Term 2","Term 3","Term 4"].map(t => {
              const active = termFilter === t; const tb = TERM_BADGES[t] || {};
              return <button key={t} role="radio" aria-checked={active} onClick={() => { setTermFilter(t); setMonthFilter("All"); }} style={{
                padding:"6px 12px", borderRadius:20, border:"none",
                background:active ? (t === "All" ? KC.accent : tb.bg) : (darkMode ? "rgba(255,255,255,0.06)" : "#F3F4F6"),
                color:active ? (t === "All" ? "#fff" : tb.color) : KC.muted,
                fontFamily:KC.ui, fontSize:11, fontWeight:active ? 700 : 500, cursor:"pointer", transition:"all 0.15s",
              }}>{t}</button>;
            })}
          </div>

          {/* Month filter */}
          <div style={{ padding:"8px 16px 12px", display:"flex", gap:4, overflowX:"auto", WebkitOverflowScrolling:"touch" }} role="radiogroup" aria-label="Filter by month">
            {MONTHS.map(m => {
              const active = monthFilter === m.label;
              return <button key={m.label} role="radio" aria-checked={active} onClick={() => { setMonthFilter(m.label); if (m.label !== "All") setTermFilter("All"); }} style={{
                padding:"5px 10px", borderRadius:16, border:`1px solid ${active ? KC.accent : KC.divider}`,
                background:active ? KC.accentLight : KC.card, color:active ? KC.accent : KC.muted,
                fontFamily:KC.ui, fontSize:10, fontWeight:active ? 700 : 500, cursor:"pointer", transition:"all 0.15s", whiteSpace:"nowrap", flexShrink:0,
              }}>{m.label}</button>;
            })}
          </div>

          {/* Age filter */}
          <div style={{ padding:"0 16px 14px", display:"flex", gap:6 }} role="radiogroup" aria-label="Filter by age group">
            <span style={{ fontFamily:KC.ui, fontSize:11, color:KC.muted, alignSelf:"center", marginRight:4 }}>Viewing for:</span>
            {["3-5","6-8","9-12"].map(ag => {
              const ab = AGE_BADGES[ag]; const active = ageFilter === ag;
              return <button key={ag} role="radio" aria-checked={active} onClick={() => setAgeFilter(ag)} style={{
                padding:"5px 12px", borderRadius:16, border:"none",
                background:active ? ab.bg : (darkMode ? "rgba(255,255,255,0.06)" : "#F3F4F6"),
                color:active ? ab.color : KC.muted, fontFamily:KC.ui, fontSize:11, fontWeight:active ? 700 : 500, cursor:"pointer", transition:"all 0.15s",
              }}>{ab.label}</button>;
            })}
          </div>

          {/* Lesson grid */}
          <div style={{ display:"grid", gridTemplateColumns:"repeat(auto-fill, minmax(280px, 1fr))", gap:12, padding:"0 16px 30px" }}>
            {filteredLessons.length > 0 ? filteredLessons.map((l, i) => LessonCard(l, i)) : (
              <div style={{ gridColumn:"1 / -1", textAlign:"center", padding:40 }}>
                <div style={{ fontSize:40, marginBottom:12 }} aria-hidden="true">{"\u{1F4ED}"}</div>
                <div style={{ fontFamily:KC.heading, fontSize:16, color:KC.text }}>No lessons for this period</div>
                <div style={{ fontFamily:KC.ui, fontSize:13, color:KC.muted, marginTop:6 }}>Try adjusting your filters above.</div>
              </div>
            )}
          </div>
        </div>
      )}

      {/* Stars Tab */}
      {activeTab === "stars" && <StarBoard />}

      {/* Progress Tab */}
      {activeTab === "progress" && <ProgressTab />}

      {/* Modal */}
      {LessonModal()}
    </div>
  );
}
