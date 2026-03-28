"use client";
import { useState, useRef, useEffect, useMemo, useCallback } from "react";
import { TEEN_LESSONS } from "./TeensCurriculumData";
import { useApp } from "../context/AppContext";
import TeensTodayTab from "./TeensTodayTab";
import TeensJourneyPath from "./TeensJourneyPath";

// ═══════════════════════════════════════════════════
// THEME — Deep Indigo (all colors theme-driven)
// ═══════════════════════════════════════════════════
const TC_LIGHT = {
  bg:            "#F0F1F8",
  card:          "#FFFFFF",
  accent:        "#4F46E5",
  accentLight:   "#EEF2FF",
  accentBorder:  "rgba(79,70,229,0.25)",
  text:          "#1E293B",
  muted:         "#64748B",
  divider:       "#E2E8F0",
  heading:       "'Playfair Display','DM Serif Display','Georgia',serif",
  body:          "'Lora','Georgia',serif",
  ui:            "'Outfit','Segoe UI',sans-serif",
  hebrewBg:      "rgba(79,70,229,0.06)",
  strongsBg:     "rgba(79,70,229,0.10)",
  prophecyOT:    "#B45309",
  prophecyNT:    "#059669",
  scriptureBg:   "#FFFBEB",
  scriptureColor:"#D97706",
  challengeBg:   "#FEF2F2",
  challengeColor:"#DC2626",
  completionGreen:"#059669",
  prophecyOTBg:  "#FFF7ED",
  prophecyNTBg:  "#F0FDF4",
  congratsGradient:"linear-gradient(135deg,#4F46E5,#7C3AED)",
  streakActive:  "#F59E0B",
  streakInactive:"#E2E8F0",
  xpGold:        "#D4A853",
  pathLine:      "#CBD5E1",
  pathActive:    "#4F46E5",
  nodeComplete:  "#059669",
  nodeUpcoming:  "#94A3B8",
  flashcardFront:"linear-gradient(135deg, #312E81, #4F46E5)",
  flashcardBack: "linear-gradient(135deg, #059669, #10B981)",
  moodGrateful:  "#059669",
  moodChallenged:"#DC2626",
  moodInspired:  "#D97706",
  moodConvicted: "#7C3AED",
  moodPeaceful:  "#0EA5E9",
  // Dynamic hero gradients
  heroMorning:   "linear-gradient(135deg, #312E81 0%, #92400E 50%, #4F46E5 100%)",
  heroAfternoon: "linear-gradient(135deg, #1E293B 0%, #312E81 50%, #1E1B4B 100%)",
  heroEvening:   "linear-gradient(135deg, #0F172A 0%, #1E1B4B 50%, #312E81 100%)",
};
const TC_DARK = {
  bg:            "#0F1020",
  card:          "#1A1B2E",
  accent:        "#818CF8",
  accentLight:   "rgba(79,70,229,0.15)",
  accentBorder:  "rgba(129,140,248,0.25)",
  text:          "#CBD5E1",
  muted:         "#94A3B8",
  divider:       "rgba(79,70,229,0.2)",
  heading:       "'Playfair Display','DM Serif Display','Georgia',serif",
  body:          "'Lora','Georgia',serif",
  ui:            "'Outfit','Segoe UI',sans-serif",
  hebrewBg:      "rgba(79,70,229,0.10)",
  strongsBg:     "rgba(79,70,229,0.14)",
  prophecyOT:    "#FBBF24",
  prophecyNT:    "#34D399",
  scriptureBg:   "rgba(217,119,6,0.08)",
  scriptureColor:"#FBBF24",
  challengeBg:   "rgba(220,38,38,0.08)",
  challengeColor:"#F87171",
  completionGreen:"#34D399",
  prophecyOTBg:  "rgba(180,83,9,0.1)",
  prophecyNTBg:  "rgba(5,150,105,0.08)",
  congratsGradient:"linear-gradient(135deg,#818CF8,#A78BFA)",
  streakActive:  "#FBBF24",
  streakInactive:"#334155",
  xpGold:        "#FBBF24",
  pathLine:      "#334155",
  pathActive:    "#818CF8",
  nodeComplete:  "#34D399",
  nodeUpcoming:  "#475569",
  flashcardFront:"linear-gradient(135deg, #1E1B4B, #312E81)",
  flashcardBack: "linear-gradient(135deg, #065F46, #059669)",
  moodGrateful:  "#34D399",
  moodChallenged:"#F87171",
  moodInspired:  "#FBBF24",
  moodConvicted: "#A78BFA",
  moodPeaceful:  "#38BDF8",
  heroMorning:   "linear-gradient(135deg, #0F172A 0%, #44403C 50%, #1E1B4B 100%)",
  heroAfternoon: "linear-gradient(135deg, #0F172A 0%, #1E1B4B 50%, #0C0A1F 100%)",
  heroEvening:   "linear-gradient(135deg, #030712 0%, #0F172A 50%, #1E1B4B 100%)",
};

// ═══════════════════════════════════════════════════
// HELPERS
// ═══════════════════════════════════════════════════
const dayOfYear = () => { const n = new Date(), s = new Date(n.getFullYear(), 0, 0); return Math.floor((n - s) / 86400000); };
const todayStr = () => new Date().toISOString().slice(0, 10);
const getGreeting = () => { const h = new Date().getHours(); return h < 12 ? "Good morning" : h < 18 ? "Good afternoon" : "Good evening"; };
const getHeroGradient = (TC) => { const h = new Date().getHours(); return h < 12 ? TC.heroMorning : h < 18 ? TC.heroAfternoon : TC.heroEvening; };

const XP_LEVELS = [
  { name: "Seeker", min: 0 },
  { name: "Disciple", min: 250 },
  { name: "Scholar", min: 1000 },
  { name: "Teacher", min: 2500 },
  { name: "Elder", min: 5000 },
  { name: "Graduate", min: 10000 },
];
const getLevel = (xp) => { for (let i = XP_LEVELS.length - 1; i >= 0; i--) { if (xp >= XP_LEVELS[i].min) return XP_LEVELS[i].name; } return "Seeker"; };

const STATUS_COLORS = {
  "Literal Fulfilment": { color: "#059669", bg: "rgba(5,150,105,0.10)", icon: "\u2705" },
  "Typological":        { color: "#7C3AED", bg: "rgba(124,58,237,0.10)", icon: "\uD83D\uDD37" },
  "Partial":            { color: "#D4A853", bg: "rgba(212,168,83,0.12)", icon: "\uD83D\uDD36" },
  "Awaiting":           { color: "#E8625C", bg: "rgba(232,98,92,0.10)", icon: "\u23F3" },
};

const TERM_BADGES = {
  "Term 1": { bg: "#EEF2FF", color: "#4338CA" },
  "Term 2": { bg: "#FEF3C7", color: "#92400E" },
  "Term 3": { bg: "#FEE2E2", color: "#991B1B" },
  "Term 4": { bg: "#F3E8FF", color: "#6B21A8" },
};

const MONTHS = [
  { label: "All", weeks: null },
  { label: "Jan", weeks: [1,2,3,4] }, { label: "Feb", weeks: [5,6,7,8] },
  { label: "Mar", weeks: [9,10,11,12,13] }, { label: "Apr", weeks: [14,15,16,17] },
  { label: "May", weeks: [18,19,20,21] }, { label: "Jun", weeks: [22,23,24,25,26] },
  { label: "Jul", weeks: [27,28,29,30] }, { label: "Aug", weeks: [31,32,33,34] },
  { label: "Sep", weeks: [35,36,37,38,39] }, { label: "Oct", weeks: [40,41,42,43] },
  { label: "Nov", weeks: [44,45,46,47] }, { label: "Dec", weeks: [48,49,50,51,52] },
];

const MOODS = [
  { id: "grateful",   icon: "\uD83D\uDE0A", label: "Grateful",   key: "moodGrateful" },
  { id: "challenged", icon: "\uD83D\uDCAA", label: "Challenged", key: "moodChallenged" },
  { id: "inspired",   icon: "\u2728",       label: "Inspired",   key: "moodInspired" },
  { id: "convicted",  icon: "\uD83D\uDE4F", label: "Convicted",  key: "moodConvicted" },
  { id: "peaceful",   icon: "\uD83D\uDD4A\uFE0F",  label: "Peaceful",   key: "moodPeaceful" },
];

// ── Share Card Generator ──
const generateShareCard = async (stats, TC) => {
  const W = 600, H = 400;
  const canvas = document.createElement("canvas");
  canvas.width = W; canvas.height = H;
  const ctx = canvas.getContext("2d");

  // Background gradient
  const grad = ctx.createLinearGradient(0, 0, W, H);
  grad.addColorStop(0, "#1E1B4B"); grad.addColorStop(0.5, "#312E81"); grad.addColorStop(1, "#4F46E5");
  ctx.fillStyle = grad; ctx.fillRect(0, 0, W, H);

  // Subtle pattern overlay
  ctx.fillStyle = "rgba(255,255,255,0.03)";
  for (let i = 0; i < 20; i++) { ctx.beginPath(); ctx.arc(Math.random()*W, Math.random()*H, Math.random()*40+10, 0, Math.PI*2); ctx.fill(); }

  // Title
  ctx.fillStyle = "#fff"; ctx.font = "bold 28px 'Georgia', serif"; ctx.textAlign = "center";
  ctx.fillText("My Bible Study Journey", W/2, 60);

  // Divider line
  ctx.strokeStyle = "rgba(255,255,255,0.2)"; ctx.lineWidth = 1;
  ctx.beginPath(); ctx.moveTo(100, 80); ctx.lineTo(500, 80); ctx.stroke();

  // Stats grid
  const statsY = 130;
  const statItems = [
    { label: "Lessons", value: `${stats.completed}/52` },
    { label: "Streak", value: `${stats.streak} days` },
    { label: "Level", value: stats.level },
    { label: "XP", value: stats.xp.toLocaleString() },
  ];
  statItems.forEach((s, i) => {
    const x = 75 + i * 150;
    ctx.fillStyle = "rgba(255,255,255,0.1)"; roundRect(ctx, x-50, statsY-20, 120, 60, 8);
    ctx.fillStyle = "#fff"; ctx.font = "bold 22px 'Georgia', serif"; ctx.textAlign = "center";
    ctx.fillText(s.value, x+10, statsY+10);
    ctx.fillStyle = "rgba(255,255,255,0.5)"; ctx.font = "600 10px 'Arial', sans-serif";
    ctx.fillText(s.label.toUpperCase(), x+10, statsY+30);
  });

  // Memory verse
  if (stats.verse) {
    ctx.fillStyle = "rgba(255,255,255,0.08)"; roundRect(ctx, 40, 220, W-80, 100, 10);
    ctx.fillStyle = "rgba(255,255,255,0.4)"; ctx.font = "600 9px 'Arial', sans-serif"; ctx.textAlign = "center";
    ctx.fillText("MEMORY VERSE", W/2, 240);
    ctx.fillStyle = "#fff"; ctx.font = "italic 14px 'Georgia', serif";
    const words = stats.verse.split(" ");
    let line = "", y = 262;
    for (const word of words) {
      const test = line + word + " ";
      if (ctx.measureText(test).width > W - 120) { ctx.fillText(line.trim(), W/2, y); y += 20; line = word + " "; }
      else line = test;
    }
    if (line.trim()) ctx.fillText(line.trim(), W/2, y);
  }

  // Watermark
  ctx.fillStyle = "rgba(255,255,255,0.3)"; ctx.font = "bold 12px 'Arial', sans-serif"; ctx.textAlign = "center";
  ctx.fillText("The Bible Scrollers", W/2, H - 20);

  return new Promise(resolve => canvas.toBlob(resolve, "image/png"));
};

const roundRect = (ctx, x, y, w, h, r) => {
  ctx.beginPath(); ctx.moveTo(x+r, y); ctx.lineTo(x+w-r, y); ctx.quadraticCurveTo(x+w, y, x+w, y+r);
  ctx.lineTo(x+w, y+h-r); ctx.quadraticCurveTo(x+w, y+h, x+w-r, y+h); ctx.lineTo(x+r, y+h);
  ctx.quadraticCurveTo(x, y+h, x, y+h-r); ctx.lineTo(x, y+r); ctx.quadraticCurveTo(x, y, x+r, y);
  ctx.closePath(); ctx.fill();
};

const TERM_WEEKS = {
  "Term 1": [1,2,3,4,5,6,7,8,9,10,11,12,13],
  "Term 2": [14,15,16,17,18,19,20,21,22,23,24,25,26],
  "Term 3": [27,28,29,30,31,32,33,34,35,36,37,38,39],
  "Term 4": [40,41,42,43,44,45,46,47,48,49,50,51,52],
};

// ═══════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════
export default function TeensCurriculum({ nav, darkMode }) {
  const TC = darkMode ? TC_DARK : TC_LIGHT;
  const { awardBadge } = useApp();

  // ── Core State ──
  const [activeTab, setActiveTab]               = useState("today");
  const [selectedLesson, setSelectedLesson]     = useState(null);
  const [modalOpen, setModalOpen]               = useState(false);
  const [animIn, setAnimIn]                     = useState(false);
  const [termFilter, setTermFilter]             = useState("All");
  const [monthFilter, setMonthFilter]           = useState("All");
  const [completedLessons, setCompletedLessons] = useState([]);
  const [expandedSections, setExpandedSections] = useState({});
  const [revealedHints, setRevealedHints]       = useState({});
  const [journalEntries, setJournalEntries]     = useState({});
  const [journalDraft, setJournalDraft]         = useState("");
  const [draftMood, setDraftMood]               = useState(null);
  const [moodFilter, setMoodFilter]             = useState("All");

  // ── Engagement State ──
  const [studyStreak, setStudyStreak]           = useState({ count: 0, lastDate: null, history: [] });
  const [verseMastery, setVerseMastery]         = useState({});
  const [dailyLog, setDailyLog]                 = useState({});
  const [lessonProgress, setLessonProgress]     = useState({});
  const [xp, setXP]                             = useState(0);
  const [dailyChallenges, setDailyChallenges]   = useState(0);
  const [levelUpMsg, setLevelUpMsg]             = useState(null);

  const modalRef   = useRef(null);
  const closeRef   = useRef(null);
  const prevFocus  = useRef(null);
  const sectionTimers = useRef({});
  const scrollRef  = useRef(null);
  const [scrollPct, setScrollPct] = useState(0);

  // ── Load all localStorage ──
  useEffect(() => {
    try {
      const load = (k, fallback) => { const v = localStorage.getItem(k); return v ? JSON.parse(v) : fallback; };
      setCompletedLessons(load("teensCompletedLessons", []));
      setJournalEntries(load("teensJournalEntries", {}));
      setStudyStreak(load("teensStudyStreak", { count: 0, lastDate: null, history: [] }));
      setVerseMastery(load("teensVerseMastery", {}));
      setDailyLog(load("teensDailyLog", {}));
      setLessonProgress(load("teensLessonProgress", {}));
      setXP(load("teensXP", 0));
      setDailyChallenges(load("teensDailyChallenges", 0));
    } catch {}
  }, []);

  // ── Persist helpers ──
  const persist = useCallback((key, val) => { try { localStorage.setItem(key, JSON.stringify(val)); } catch {} }, []);
  useEffect(() => { persist("teensCompletedLessons", completedLessons); }, [completedLessons, persist]);
  useEffect(() => { persist("teensJournalEntries", journalEntries); }, [journalEntries, persist]);
  useEffect(() => { persist("teensStudyStreak", studyStreak); }, [studyStreak, persist]);
  useEffect(() => { persist("teensVerseMastery", verseMastery); }, [verseMastery, persist]);
  useEffect(() => { persist("teensDailyLog", dailyLog); }, [dailyLog, persist]);
  useEffect(() => { persist("teensLessonProgress", lessonProgress); }, [lessonProgress, persist]);
  useEffect(() => { persist("teensXP", xp); }, [xp, persist]);
  useEffect(() => { persist("teensDailyChallenges", dailyChallenges); }, [dailyChallenges, persist]);

  // ── Derived ──
  const completedCount = completedLessons.length;
  const level = getLevel(xp);
  const journalCount = Object.keys(journalEntries).length;

  const currentWeek = useMemo(() => {
    for (let w = 1; w <= 52; w++) if (!completedLessons.includes(w)) return w;
    return 52;
  }, [completedLessons]);
  const currentLesson = TEEN_LESSONS[currentWeek - 1];

  const filteredLessons = useMemo(() =>
    TEEN_LESSONS.filter(l => {
      if (termFilter !== "All" && l.term !== termFilter) return false;
      const m = MONTHS.find(mo => mo.label === monthFilter);
      if (m && m.weeks && !m.weeks.includes(l.week)) return false;
      return true;
    }),
    [termFilter, monthFilter]
  );

  // ── XP + Level ──
  const addXP = useCallback((amount) => {
    setXP(prev => {
      const next = prev + amount;
      const prevLevel = getLevel(prev);
      const nextLevel = getLevel(next);
      if (nextLevel !== prevLevel) {
        setLevelUpMsg(nextLevel);
        setTimeout(() => setLevelUpMsg(null), 3000);
      }
      return next;
    });
  }, []);

  // ── Streak ──
  const recordActivity = useCallback(() => {
    const t = todayStr();
    setStudyStreak(prev => {
      if (prev.lastDate === t) return prev; // already recorded today
      const yesterday = new Date(); yesterday.setDate(yesterday.getDate() - 1);
      const yesterdayStr = yesterday.toISOString().slice(0, 10);
      const twoDaysAgo = new Date(); twoDaysAgo.setDate(twoDaysAgo.getDate() - 2);
      const twoDaysStr = twoDaysAgo.toISOString().slice(0, 10);
      // 48hr grace: streak continues if last was yesterday OR day before
      const continues = prev.lastDate === yesterdayStr || prev.lastDate === twoDaysStr;
      const newCount = continues ? prev.count + 1 : 1;
      const newHistory = [...(prev.history || []), t].slice(-60);
      // Streak badges
      if (newCount >= 30 && awardBadge) awardBadge("streak_warrior_teen");
      // Streak XP bonus
      if (newCount > 0 && newCount % 7 === 0) addXP(50);
      return { count: newCount, lastDate: t, history: newHistory };
    });
  }, [awardBadge, addXP]);

  // ── Modal ──
  const openLesson = useCallback((lesson) => {
    prevFocus.current = document.activeElement;
    setSelectedLesson(lesson);
    setModalOpen(true);
    setExpandedSections({ 0: true });
    setRevealedHints({});
    setJournalDraft(journalEntries[lesson.week]?.text || "");
    setDraftMood(journalEntries[lesson.week]?.mood || null);
    setScrollPct(0);
    sectionTimers.current = {};
    setTimeout(() => setAnimIn(true), 20);
    recordActivity();
  }, [journalEntries, recordActivity]);

  const closeModal = useCallback(() => {
    setAnimIn(false);
    // Save section progress
    if (selectedLesson) {
      const readSections = Object.keys(sectionTimers.current).map(Number).filter(i => sectionTimers.current[i] >= 5000);
      if (readSections.length > 0) {
        setLessonProgress(prev => {
          const existing = prev[selectedLesson.week] || [];
          const merged = [...new Set([...existing, ...readSections])];
          return { ...prev, [selectedLesson.week]: merged };
        });
      }
    }
    setTimeout(() => { setModalOpen(false); setSelectedLesson(null); if (prevFocus.current) prevFocus.current.focus(); }, 280);
  }, [selectedLesson]);

  // Focus trap
  useEffect(() => {
    if (!modalOpen || !animIn) return;
    if (closeRef.current) closeRef.current.focus();
    const handleKey = (e) => {
      if (e.key === "Escape") { closeModal(); return; }
      if (e.key !== "Tab") return;
      const modal = modalRef.current; if (!modal) return;
      const focusable = modal.querySelectorAll('button, [href], input, textarea, select, [tabindex]:not([tabindex="-1"])');
      if (!focusable.length) return;
      const first = focusable[0], last = focusable[focusable.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    };
    document.addEventListener("keydown", handleKey);
    return () => document.removeEventListener("keydown", handleKey);
  }, [modalOpen, animIn, closeModal]);

  // Scroll progress in modal
  const handleModalScroll = useCallback((e) => {
    const el = e.target;
    const pct = el.scrollHeight > el.clientHeight ? Math.round(el.scrollTop / (el.scrollHeight - el.clientHeight) * 100) : 100;
    setScrollPct(pct);
  }, []);

  // ── Section handlers ──
  const toggleSection = useCallback((i) => {
    setExpandedSections(p => {
      const opening = !p[i];
      if (opening) {
        // Start timer for section read tracking
        sectionTimers.current[i] = sectionTimers.current[i] || 0;
        const start = Date.now();
        const interval = setInterval(() => {
          sectionTimers.current[i] = (sectionTimers.current[i] || 0) + (Date.now() - start);
        }, 1000);
        // Store interval for cleanup
        sectionTimers.current[`_interval_${i}`] = interval;
      } else {
        // Clear interval
        clearInterval(sectionTimers.current[`_interval_${i}`]);
      }
      return { ...p, [i]: !p[i] };
    });
  }, []);
  const toggleHint = useCallback((i) => setRevealedHints(p => ({ ...p, [i]: !p[i] })), []);

  // ── Completion ──
  const toggleComplete = useCallback((week) => {
    setCompletedLessons(p => {
      const adding = !p.includes(week);
      const next = adding ? [...p, week] : p.filter(w => w !== week);
      if (adding) {
        addXP(100);
        recordActivity();
        if (awardBadge) {
          if (p.length === 0) awardBadge("first_lesson_teen");
          if (next.length >= 52) awardBadge("graduate_teen");
          for (const [, weeks] of Object.entries(TERM_WEEKS)) {
            if (weeks.every(w => next.includes(w))) { awardBadge("term_complete_teen"); break; }
          }
        }
      }
      return next;
    });
  }, [awardBadge, addXP, recordActivity]);

  // ── Journal ──
  const saveJournal = useCallback((week) => {
    if (!journalDraft.trim()) return;
    setJournalEntries(p => {
      const next = { ...p, [week]: { text: journalDraft.trim(), date: todayStr(), mood: draftMood } };
      if (Object.keys(next).length >= 10 && awardBadge) awardBadge("journaler");
      return next;
    });
    addXP(25);
    recordActivity();
  }, [journalDraft, draftMood, awardBadge, addXP, recordActivity]);

  const deleteJournal = useCallback((week, e) => {
    if (e) e.stopPropagation();
    setJournalEntries(p => { const n = { ...p }; delete n[week]; return n; });
  }, []);

  // ── Today tab callbacks ──
  const onSaveReflection = useCallback((week, text, mood) => {
    setJournalEntries(p => {
      const next = { ...p, [week]: { text, date: todayStr(), mood: mood || null } };
      if (Object.keys(next).length >= 10 && awardBadge) awardBadge("journaler");
      return next;
    });
    setDailyLog(p => ({ ...p, [todayStr()]: { ...p[todayStr()], reflection: true } }));
    addXP(25);
    recordActivity();
  }, [awardBadge, addXP, recordActivity]);

  const onCompleteChallenge = useCallback(() => {
    setDailyLog(p => ({ ...p, [todayStr()]: { ...p[todayStr()], challenge: true } }));
    setDailyChallenges(p => {
      const next = p + 1;
      if (next >= 20 && awardBadge) awardBadge("deep_thinker_teen");
      return next;
    });
    addXP(15);
    recordActivity();
  }, [awardBadge, addXP, recordActivity]);

  // ── Share ──
  const handleShare = useCallback(async (type = "journey", lessonWeek) => {
    const verse = currentLesson?.memoryVerse || "";
    const stats = { completed: completedCount, streak: studyStreak.count, level, xp, verse };
    try {
      const blob = await generateShareCard(stats, TC);
      if (!blob) return;
      const file = new File([blob], "bible-study-journey.png", { type: "image/png" });
      if (navigator.share && navigator.canShare?.({ files: [file] })) {
        await navigator.share({
          title: type === "journey" ? "My Bible Study Journey" : `Week ${lessonWeek} Complete!`,
          text: type === "journey" ? `I've completed ${completedCount}/52 lessons!` : `I just completed Week ${lessonWeek} of the Teens Bible Study!`,
          files: [file],
        });
      } else {
        // Fallback: download
        const url = URL.createObjectURL(blob);
        const a = document.createElement("a"); a.href = url; a.download = "bible-study-journey.png";
        document.body.appendChild(a); a.click(); document.body.removeChild(a); URL.revokeObjectURL(url);
      }
    } catch {}
  }, [completedCount, studyStreak.count, level, xp, currentLesson, TC]);

  const onVerseMastery = useCallback((week, gotIt) => {
    setVerseMastery(prev => {
      const curr = prev[week] || { level: 0, lastReview: null, nextReview: null };
      const newLevel = gotIt ? Math.min(curr.level + 1, 5) : Math.max(curr.level - 1, 0);
      const next = { ...prev, [week]: { level: newLevel, lastReview: todayStr(), nextReview: todayStr() } };
      // Badge check
      const masteredCount = Object.values(next).filter(v => v.level >= 5).length;
      if (masteredCount >= 10 && awardBadge) awardBadge("verse_master_teen");
      return next;
    });
    setDailyLog(p => ({ ...p, [todayStr()]: { ...p[todayStr()], verse: true } }));
    if (gotIt) addXP(10);
    recordActivity();
  }, [awardBadge, addXP, recordActivity]);

  // ═══════════════════════════════════════════════════
  // SUB-COMPONENTS (inline)
  // ═══════════════════════════════════════════════════

  const Section = ({ icon, title, timing, children, index }) => {
    const open = expandedSections[index];
    const readSections = selectedLesson ? (lessonProgress[selectedLesson.week] || []) : [];
    const isRead = readSections.includes(index);
    const contentId = `tc-section-${index}`;
    return (
      <div style={{ borderBottom: `1px solid ${TC.divider}` }}>
        <button onClick={() => toggleSection(index)} aria-expanded={open} aria-controls={contentId}
          style={{ width: "100%", display: "flex", alignItems: "center", gap: 10, padding: "14px 16px", background: "none", border: "none", cursor: "pointer", textAlign: "left" }}>
          <span style={{ fontSize: 18 }} aria-hidden="true">{icon}</span>
          <div style={{ flex: 1 }}>
            <div style={{ fontFamily: TC.ui, fontSize: 14, fontWeight: 700, color: TC.text, display: "flex", alignItems: "center", gap: 6 }}>
              {title}
              {isRead && <span style={{ fontSize: 12, animation: "scaleIn 0.3s ease" }} aria-hidden="true">{"\u2705"}</span>}
            </div>
            {timing && <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.muted, marginTop: 1 }}>{timing}</div>}
          </div>
          <span style={{ fontSize: 12, color: TC.muted, transition: "transform 0.2s", transform: open ? "rotate(180deg)" : "rotate(0)" }} aria-hidden="true">{"\u25BC"}</span>
        </button>
        <div id={contentId} role="region" aria-label={title} style={{
          maxHeight: open ? 2000 : 0, overflow: "hidden",
          transition: "max-height 0.35s ease",
          padding: open ? "0 16px 16px" : "0 16px",
        }}>
          {children}
        </div>
      </div>
    );
  };

  const WordStudyCard = ({ ws }) => (
    <div style={{ background: TC.hebrewBg, border: `1px solid ${TC.accentBorder}`, borderRadius: 10, padding: 16, margin: "8px 0" }}>
      <div style={{ textAlign: "center", marginBottom: 10 }}>
        <div style={{ fontFamily: "'Times New Roman',serif", fontSize: ws.language === "Hebrew" ? 28 : 22, color: TC.accent, direction: ws.language === "Hebrew" ? "rtl" : "ltr", lineHeight: 1.2 }}>{ws.original}</div>
        <div style={{ fontFamily: TC.ui, fontSize: 13, color: TC.text, marginTop: 4 }}>{ws.transliteration}</div>
        <div style={{ display: "inline-block", background: TC.strongsBg, borderRadius: 4, padding: "2px 8px", fontFamily: "monospace", fontSize: 11, color: TC.accent, marginTop: 4 }}>{ws.strongsNumber}</div>
      </div>
      {["Definition", "Usage", "Connection"].map(f => (
        <div key={f} style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, marginBottom: 8 }}>
          <strong>{f}:</strong> {ws[f.toLowerCase()]}
        </div>
      ))}
      {ws.relatedVerses?.length > 0 && (
        <div style={{ borderTop: `1px dashed ${TC.divider}`, paddingTop: 8, marginTop: 8 }}>
          <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.muted, marginBottom: 6 }}>Related Verses</div>
          {ws.relatedVerses.map((v, i) => (
            <div key={i} style={{ fontFamily: TC.body, fontSize: 12.5, color: TC.muted, lineHeight: 1.6, marginBottom: 4, paddingLeft: 8, borderLeft: `2px solid ${TC.accentBorder}` }}>{v}</div>
          ))}
        </div>
      )}
    </div>
  );

  const ProphecyCard = ({ pc }) => {
    const st = STATUS_COLORS[pc.status] || STATUS_COLORS["Literal Fulfilment"];
    return (
      <div style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderRadius: 10, padding: 16, margin: "8px 0" }}>
        <div style={{ fontFamily: TC.ui, fontSize: 13, fontWeight: 700, color: TC.text, marginBottom: 8 }}>{pc.title}</div>
        <div style={{ background: TC.prophecyOTBg, borderLeft: `3px solid ${TC.prophecyOT}`, borderRadius: 6, padding: "10px 12px", marginBottom: 8 }}>
          <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: TC.prophecyOT, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 4 }}>OT: {pc.otRef}</div>
          <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, fontStyle: "italic", lineHeight: 1.7 }}>{pc.otText}</div>
        </div>
        <div style={{ textAlign: "center", fontSize: 16, color: TC.muted, margin: "4px 0" }} aria-hidden="true">{"\u2193"} Fulfilled In {"\u2193"}</div>
        <div style={{ background: TC.prophecyNTBg, borderLeft: `3px solid ${TC.prophecyNT}`, borderRadius: 6, padding: "10px 12px", marginBottom: 8 }}>
          <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: TC.prophecyNT, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 4 }}>NT: {pc.ntRef}</div>
          <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, fontStyle: "italic", lineHeight: 1.7 }}>{pc.ntText}</div>
        </div>
        <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, marginBottom: 8 }}>{pc.explanation}</div>
        <div style={{ display: "inline-flex", alignItems: "center", gap: 4, background: st.bg, borderRadius: 6, padding: "3px 10px" }}>
          <span aria-hidden="true">{st.icon}</span>
          <span style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: st.color }}>{pc.status}</span>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // LESSON MODAL
  // ═══════════════════════════════════════════════════
  const LessonModal = () => {
    if (!selectedLesson) return null;
    const L = selectedLesson;
    const isComplete = completedLessons.includes(L.week);
    const readSections = lessonProgress[L.week] || [];
    const allRead = readSections.length >= 9;

    return (
      <div ref={modalRef} role="dialog" aria-modal="true" aria-label={`Week ${L.week}: ${L.title}`}
        style={{ position: "fixed", inset: 0, zIndex: 999, display: "flex", flexDirection: "column", justifyContent: "flex-end", background: "rgba(0,0,0,0.5)", opacity: animIn ? 1 : 0, transition: "opacity 0.28s" }}
        onClick={(e) => { if (e.target === modalRef.current) closeModal(); }}>
        <div style={{ background: TC.bg, borderRadius: "18px 18px 0 0", maxHeight: "92vh", display: "flex", flexDirection: "column", transform: animIn ? "translateY(0)" : "translateY(100%)", transition: "transform 0.3s cubic-bezier(.32,.72,.32,1)" }}>
          {/* Scroll progress bar */}
          <div style={{ position: "absolute", top: 0, left: 0, right: 0, height: 2, zIndex: 10, borderRadius: "18px 18px 0 0", overflow: "hidden" }}>
            <div style={{ height: 2, background: TC.accent, width: `${scrollPct}%`, transition: "width 0.1s" }} />
          </div>

          {/* Header */}
          <div style={{ background: L.color, padding: "18px 16px 14px", borderRadius: "18px 18px 0 0", position: "relative", flexShrink: 0 }}>
            <button ref={closeRef} onClick={closeModal} aria-label="Close lesson" style={{ position: "absolute", top: 12, right: 12, background: "rgba(255,255,255,0.2)", border: "none", borderRadius: 20, width: 32, height: 32, display: "flex", alignItems: "center", justifyContent: "center", cursor: "pointer", color: "#fff", fontSize: 16 }}>{"\u2715"}</button>
            <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 6 }}>
              <span style={{ background: "rgba(255,255,255,0.2)", borderRadius: 8, padding: "4px 10px", fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: "#fff" }}>Week {L.week}</span>
              <span style={{ fontSize: 20 }} aria-hidden="true">{L.icon}</span>
              {/* Section progress ring */}
              <span style={{ marginLeft: "auto", fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: "rgba(255,255,255,0.8)" }}>
                {readSections.length}/9 sections
              </span>
            </div>
            <div style={{ fontFamily: TC.heading, fontSize: 20, fontWeight: 700, color: "#fff", lineHeight: 1.3 }}>{L.title}</div>
            <div style={{ fontFamily: TC.ui, fontSize: 12, color: "rgba(255,255,255,0.8)", marginTop: 4 }}>{L.bibleRef}</div>
          </div>

          {/* Content */}
          <div ref={scrollRef} onScroll={handleModalScroll} style={{ flex: 1, overflowY: "auto", WebkitOverflowScrolling: "touch" }}>
            {/* Key Verse */}
            <div style={{ padding: "12px 16px", background: TC.accentLight, borderBottom: `1px solid ${TC.divider}` }}>
              <div style={{ fontFamily: TC.body, fontSize: 13, fontStyle: "italic", color: TC.accent, lineHeight: 1.7 }}>{L.keyVerse}</div>
            </div>

            <Section icon={"\uD83C\uDFAF"} title="The Hook" timing="5 min" index={0}>
              <div style={{ fontFamily: TC.body, fontSize: 14, color: TC.text, lineHeight: 1.8, fontStyle: "italic" }}>{L.hook}</div>
            </Section>

            <Section icon={"\uD83D\uDCD6"} title="Deep Dive into Scripture" timing="25 min" index={1}>
              <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.accent, marginBottom: 6 }}>Passage: {L.deepDive.passage}</div>
              <div style={{ fontFamily: TC.body, fontSize: 13.5, color: TC.text, lineHeight: 1.8, marginBottom: 12 }}>{L.deepDive.context}</div>
              <div style={{ fontFamily: TC.ui, fontSize: 12, fontWeight: 700, color: TC.text, marginBottom: 6 }}>Key Points:</div>
              {L.deepDive.keyPoints.map((p, i) => (
                <div key={i} style={{ display: "flex", gap: 8, marginBottom: 8 }}>
                  <span style={{ color: TC.accent, fontWeight: 700, fontSize: 13, flexShrink: 0 }}>{i + 1}.</span>
                  <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7 }}>{p}</div>
                </div>
              ))}
              <div style={{ background: TC.accentLight, border: `1px solid ${TC.accentBorder}`, borderRadius: 8, padding: "10px 14px", marginTop: 10 }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.accent, marginBottom: 4 }}>{"\u26A1"} Obedience Connection</div>
                <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7 }}>{L.deepDive.obedienceLink}</div>
              </div>
            </Section>

            <Section icon={"\uD83D\uDD0D"} title="Word Study" timing="15 min" index={2}><WordStudyCard ws={L.wordStudy} /></Section>

            <Section icon={"\uD83D\uDCDA"} title="The Story of Faith" timing="15 min" index={3}>
              <div style={{ fontFamily: TC.ui, fontSize: 15, fontWeight: 700, color: TC.text, marginBottom: 8 }}>{L.faithStory.title}</div>
              <div style={{ fontFamily: TC.body, fontSize: 13.5, color: TC.text, lineHeight: 1.8, marginBottom: 12 }}>{L.faithStory.narrative}</div>
              <div style={{ background: TC.accentLight, borderRadius: 8, padding: "10px 14px", borderLeft: `3px solid ${TC.accent}` }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.accent, marginBottom: 4 }}>Moral Lesson</div>
                <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7 }}>{L.faithStory.moralLesson}</div>
              </div>
            </Section>

            <Section icon={"\uD83D\uDD2D"} title="Prophecy Connection" timing="10 min" index={4}><ProphecyCard pc={L.prophecyConnection} /></Section>

            <Section icon={"\uD83E\uDDE0"} title="Think Deeper" timing="15 min" index={5}>
              <div style={{ fontFamily: TC.body, fontSize: 14, fontWeight: 700, color: TC.text, lineHeight: 1.7, marginBottom: 10 }}>{L.thinkDeeper.question}</div>
              <div style={{ background: TC.challengeBg, borderLeft: `3px solid ${TC.challengeColor}`, borderRadius: 6, padding: "10px 14px", marginBottom: 12 }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.challengeColor, marginBottom: 4 }}>{"\uD83D\uDDE1\uFE0F"} Challenge</div>
                <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7 }}>{L.thinkDeeper.challenge}</div>
              </div>
              {L.thinkDeeper.hints.map((h, i) => (
                <button key={i} onClick={() => toggleHint(i)} aria-label={revealedHints[i] ? `Hint ${i + 1}` : `Reveal hint ${i + 1}`} style={{ display: "block", width: "100%", padding: "8px 12px", marginBottom: 6, borderRadius: 6, border: `1px solid ${TC.divider}`, cursor: "pointer", background: "transparent", textAlign: "left" }}>
                  <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, filter: revealedHints[i] ? "none" : "blur(5px)", transition: "filter 0.3s" }}>{h}</div>
                  {!revealedHints[i] && <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.muted, textAlign: "center", marginTop: 2 }}>Tap to reveal</div>}
                </button>
              ))}
              <button onClick={() => toggleHint("conclusion")} aria-label={revealedHints.conclusion ? "Conclusion" : "Reveal conclusion"} style={{ display: "block", width: "100%", background: TC.accentLight, borderRadius: 8, padding: "10px 14px", marginTop: 8, cursor: "pointer", border: "none", textAlign: "left" }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.accent, marginBottom: 4 }}>{"\u2705"} Conclusion {!revealedHints.conclusion && "(tap to reveal)"}</div>
                <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, filter: revealedHints.conclusion ? "none" : "blur(5px)", transition: "filter 0.3s" }}>{L.thinkDeeper.conclusion}</div>
              </button>
            </Section>

            <Section icon={"\uD83D\uDCAC"} title="Discussion & Debate" timing="15 min" index={6}>
              {L.discussionQuestions.map((q, i) => (
                <div key={i} style={{ display: "flex", gap: 8, marginBottom: 10 }}>
                  <span style={{ background: TC.accent, color: "#fff", borderRadius: "50%", width: 22, height: 22, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 11, fontWeight: 700, flexShrink: 0 }} aria-hidden="true">{i + 1}</span>
                  <div style={{ fontFamily: TC.body, fontSize: 13.5, color: TC.text, lineHeight: 1.7 }}>{q}</div>
                </div>
              ))}
            </Section>

            <Section icon={"\uD83D\uDCD3"} title="Journal & Reflection" timing="10 min" index={7}>
              <div style={{ fontFamily: TC.body, fontSize: 13.5, color: TC.text, lineHeight: 1.8, marginBottom: 10 }}>{L.journalPrompt.prompt}</div>
              <textarea value={journalDraft} onChange={(e) => setJournalDraft(e.target.value)} placeholder="Write your reflection here..." aria-label="Journal reflection"
                style={{ width: "100%", minHeight: 100, border: `1px solid ${TC.divider}`, borderRadius: 8, padding: 12, fontFamily: TC.body, fontSize: 13, color: TC.text, background: TC.bg, resize: "vertical", boxSizing: "border-box" }} />
              {/* Mood selector */}
              <div style={{ display: "flex", gap: 6, marginTop: 8, flexWrap: "wrap" }}>
                {MOODS.map(m => (
                  <button key={m.id} onClick={() => setDraftMood(draftMood === m.id ? null : m.id)}
                    aria-pressed={draftMood === m.id} aria-label={m.label}
                    style={{ padding: "4px 10px", borderRadius: 16, border: `1px solid ${draftMood === m.id ? TC[m.key] : TC.divider}`, background: draftMood === m.id ? TC[m.key] + "18" : "transparent", fontFamily: TC.ui, fontSize: 10, fontWeight: 600, color: draftMood === m.id ? TC[m.key] : TC.muted, cursor: "pointer", transition: "all 0.15s" }}>
                    {m.icon} {m.label}
                  </button>
                ))}
              </div>
              <div style={{ display: "flex", gap: 8, alignItems: "center", marginTop: 8 }}>
                <button onClick={() => saveJournal(L.week)} style={{ padding: "8px 20px", background: TC.accent, color: "#fff", border: "none", borderRadius: 8, fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                  {journalEntries[L.week] ? "Update Entry" : "Save Entry (+25 XP)"}
                </button>
                {journalEntries[L.week] && (
                  <button onClick={() => { deleteJournal(L.week); setJournalDraft(""); }} aria-label="Delete entry" style={{ padding: "8px 14px", background: TC.challengeBg, color: TC.challengeColor, border: `1px solid ${TC.challengeColor}30`, borderRadius: 8, fontFamily: TC.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>Delete</button>
                )}
              </div>
              {journalEntries[L.week] && <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.muted, marginTop: 6 }}>Saved on {journalEntries[L.week].date}</div>}
              <div style={{ background: TC.accentLight, borderRadius: 8, padding: "10px 14px", marginTop: 12, borderLeft: `3px solid ${TC.accent}` }}>
                <div style={{ fontFamily: TC.ui, fontSize: 11, fontWeight: 700, color: TC.accent, marginBottom: 4 }}>Reflection</div>
                <div style={{ fontFamily: TC.body, fontSize: 13, fontStyle: "italic", color: TC.text, lineHeight: 1.7 }}>{L.journalPrompt.reflection}</div>
              </div>
            </Section>

            <Section icon={"\uD83D\uDE4F"} title="Memory Verse & Prayer" timing="10 min" index={8}>
              <div style={{ background: "linear-gradient(135deg,rgba(79,70,229,0.08),rgba(124,58,237,0.06))", border: `1px solid ${TC.accentBorder}`, borderRadius: 10, padding: 16, textAlign: "center", marginBottom: 12 }}>
                <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: TC.accent, textTransform: "uppercase", letterSpacing: "0.1em", marginBottom: 6 }}>Memory Verse</div>
                <div style={{ fontFamily: TC.heading, fontSize: 16, color: TC.text, lineHeight: 1.6, fontStyle: "italic" }}>{L.memoryVerse}</div>
              </div>
              <div style={{ fontFamily: TC.body, fontSize: 13.5, color: TC.text, lineHeight: 1.8, fontStyle: "italic" }}>{L.closingPrayer}</div>
            </Section>

            <Section icon={"\uD83D\uDC68\u200D\uD83C\uDFEB"} title="Leader Notes" timing="" index={9}>
              <div style={{ fontFamily: TC.body, fontSize: 13, color: TC.muted, lineHeight: 1.8 }}>{L.leaderNote}</div>
            </Section>

            <div style={{ height: 80 }} />
          </div>

          {/* Footer */}
          <div style={{ padding: "12px 16px", borderTop: `1px solid ${TC.divider}`, background: TC.card, flexShrink: 0 }}>
            <div style={{ display: "flex", gap: 8 }}>
              <button onClick={() => toggleComplete(L.week)} style={{
                flex: 1, padding: "14px", borderRadius: 10, border: "none",
                background: isComplete ? TC.completionGreen : TC.accent, color: "#fff",
                fontFamily: TC.ui, fontSize: 14, fontWeight: 700, cursor: "pointer",
                transition: "all 0.2s",
                animation: allRead && !isComplete ? "correctPulse 1.5s infinite" : "none",
              }}>
                {isComplete ? "\u2705 Lesson Complete" : `Mark Lesson as Complete (+100 XP)`}
              </button>
              {isComplete && (
                <button onClick={() => handleShare("lesson", L.week)} aria-label="Share completion"
                  style={{ width: 48, borderRadius: 10, border: `1px solid ${TC.divider}`, background: TC.card, cursor: "pointer", fontSize: 18, display: "flex", alignItems: "center", justifyContent: "center" }}>
                  {"\uD83D\uDCE4"}
                </button>
              )}
            </div>
          </div>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // LESSON CARD (3-tier hierarchy)
  // ═══════════════════════════════════════════════════
  const LessonCard = ({ lesson, index }) => {
    const isComplete = completedLessons.includes(lesson.week);
    const isCurrent = lesson.week === currentWeek;
    const sectionsRead = (lessonProgress[lesson.week] || []).length;
    const inProgress = sectionsRead > 0 && !isComplete;
    const tb = TERM_BADGES[lesson.term] || TERM_BADGES["Term 1"];

    const cta = isComplete ? "Review" : inProgress ? `Continue \u00B7 ${sectionsRead}/9` : isCurrent ? "Start This Week" : "Preview";

    return (
      <div
        role="button" tabIndex={0}
        aria-label={`Week ${lesson.week}: ${lesson.title}${isComplete ? " (completed)" : isCurrent ? " (current)" : ""}`}
        onClick={() => openLesson(lesson)}
        onKeyDown={(e) => { if (e.key === "Enter" || e.key === " ") { e.preventDefault(); openLesson(lesson); } }}
        style={{
          background: TC.card, borderRadius: 12,
          border: `1px solid ${isCurrent ? TC.accentBorder : TC.divider}`,
          borderLeft: `4px solid ${lesson.color}`,
          padding: "16px 14px", cursor: "pointer", position: "relative",
          transition: "transform 0.15s, box-shadow 0.15s",
          animation: isCurrent ? "glowPulse 2s infinite" : `fadeIn 0.35s ease ${Math.min(index, 12) * 0.04}s both`,
          gridColumn: isCurrent ? "1 / -1" : undefined,
          boxShadow: isCurrent ? "0 4px 20px rgba(79,70,229,0.15)" : "none",
        }}
        onMouseEnter={e => { e.currentTarget.style.transform = "translateY(-3px)"; e.currentTarget.style.boxShadow = "0 6px 16px rgba(0,0,0,0.12)"; }}
        onMouseLeave={e => { e.currentTarget.style.transform = ""; e.currentTarget.style.boxShadow = isCurrent ? "0 4px 20px rgba(79,70,229,0.15)" : "none"; }}
      >
        {isComplete && <div style={{ position: "absolute", top: 8, right: 8, fontSize: 16, animation: "stampIn 0.5s ease" }} aria-hidden="true">{"\u2705"}</div>}
        <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 6 }}>
          <span style={{ background: `${lesson.color}15`, borderRadius: 6, padding: "3px 8px", fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: lesson.color }}>Week {lesson.week}</span>
          <span style={{ fontSize: 16, animation: isCurrent ? "orbFloat 3s ease-in-out infinite" : "none" }} aria-hidden="true">{lesson.icon}</span>
          {isCurrent && <span style={{ fontFamily: TC.ui, fontSize: 8, fontWeight: 800, color: TC.accent, background: TC.accentLight, borderRadius: 4, padding: "2px 6px", marginLeft: "auto" }}>THIS WEEK</span>}
        </div>
        <div style={{ fontFamily: TC.heading, fontSize: isCurrent ? 17 : 15, fontWeight: 700, color: TC.text, lineHeight: 1.3, marginBottom: 4 }}>{lesson.title}</div>
        <div style={{ fontFamily: TC.ui, fontSize: 11, color: TC.accent, marginBottom: 4 }}>{lesson.bibleRef}</div>
        <div style={{ fontFamily: TC.body, fontSize: 12, color: TC.muted, lineHeight: 1.5, marginBottom: 8, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{lesson.keyVerse}</div>
        <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginBottom: 8 }}>
          <span style={{ background: tb.bg, color: tb.color, borderRadius: 4, padding: "2px 8px", fontFamily: TC.ui, fontSize: 10, fontWeight: 600 }}>{lesson.term}</span>
          <span style={{ background: TC.accentLight, color: TC.accent, borderRadius: 4, padding: "2px 8px", fontFamily: TC.ui, fontSize: 10, fontWeight: 600 }}>{lesson.theme}</span>
          {journalEntries[lesson.week] && <span style={{ fontSize: 10 }} aria-hidden="true">{"\u270F\uFE0F"}</span>}
        </div>
        {/* Section progress bar */}
        {sectionsRead > 0 && (
          <div style={{ height: 2, background: TC.divider, borderRadius: 2, marginBottom: 8 }}>
            <div style={{ height: 2, background: isComplete ? TC.completionGreen : TC.accent, borderRadius: 2, width: `${Math.round(sectionsRead / 9 * 100)}%`, transition: "width 0.3s" }} />
          </div>
        )}
        <div style={{
          fontFamily: TC.ui, fontSize: 11, fontWeight: 700,
          color: isComplete ? TC.completionGreen : TC.accent,
        }}>
          {cta} {"\u2192"}
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // MAIN RENDER
  // ═══════════════════════════════════════════════════
  return (
    <div style={{ minHeight: "100vh", background: TC.bg, paddingBottom: 80 }}>

      {/* ── Level Up Toast ── */}
      {levelUpMsg && (
        <div style={{
          position: "fixed", top: 20, left: "50%", transform: "translateX(-50%)", zIndex: 1000,
          background: TC.congratsGradient, color: "#fff", borderRadius: 14, padding: "14px 28px",
          fontFamily: TC.ui, fontSize: 14, fontWeight: 700, textAlign: "center",
          animation: "stampIn 0.5s ease", boxShadow: "0 8px 32px rgba(79,70,229,0.4)",
        }}>
          <div style={{ fontSize: 24, marginBottom: 4 }}>{"\u2B50"}</div>
          Level Up: {levelUpMsg}!
        </div>
      )}

      {/* ── Dynamic Hero ── */}
      <div style={{ background: getHeroGradient(TC), padding: "24px 20px 20px", position: "relative", animation: "fadeIn 0.4s ease" }}>
        <button onClick={() => nav("learn-home")} aria-label="Back to Learn" style={{ background: "rgba(255,255,255,0.15)", border: "none", borderRadius: 8, padding: "6px 12px", color: "#fff", fontFamily: TC.ui, fontSize: 12, fontWeight: 600, cursor: "pointer", marginBottom: 12 }}>{"\u2190"} Back</button>

        {/* Greeting + Level */}
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
          <div>
            <h1 style={{ fontFamily: TC.heading, fontSize: 24, fontWeight: 700, color: "#fff", lineHeight: 1.2, margin: 0 }}>
              {getGreeting()}, Scholar
            </h1>
            <div style={{ fontFamily: TC.ui, fontSize: 11, color: "rgba(255,255,255,0.6)", marginTop: 4, fontStyle: "italic", maxWidth: 240, overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>
              {currentLesson.keyVerse.split(" \u2014 ")[0]?.slice(0, 60) || currentLesson.keyVerse.slice(0, 60)}...
            </div>
          </div>
          {/* Streak Orb */}
          <div style={{
            width: 56, height: 56, borderRadius: "50%",
            background: "rgba(255,255,255,0.1)", border: "2px solid rgba(255,255,255,0.25)",
            display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
            animation: studyStreak.count > 0 ? "sacredPulse 2s infinite" : "none",
          }}>
            <span style={{ fontSize: 14 }} aria-hidden="true">{studyStreak.count >= 7 ? "\uD83D\uDD25" : "\u2B50"}</span>
            <span style={{ fontFamily: TC.ui, fontSize: 12, fontWeight: 800, color: "#fff", lineHeight: 1 }}>{studyStreak.count}</span>
          </div>
        </div>

        {/* This Week's Focus */}
        <div
          onClick={() => openLesson(currentLesson)}
          style={{
            background: "rgba(255,255,255,0.08)", border: "1px solid rgba(255,255,255,0.15)",
            borderRadius: 14, padding: "14px 16px", marginTop: 16, cursor: "pointer",
            animation: "slideUp 0.3s ease 0.15s both",
            backdropFilter: "blur(8px)", WebkitBackdropFilter: "blur(8px)",
          }}
        >
          <div style={{ fontFamily: TC.ui, fontSize: 9, fontWeight: 700, color: "rgba(255,255,255,0.5)", textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6 }}>This Week&apos;s Focus</div>
          <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
            <span style={{ fontSize: 28, animation: "orbFloat 3s ease-in-out infinite" }} aria-hidden="true">{currentLesson.icon}</span>
            <div style={{ flex: 1 }}>
              <div style={{ fontFamily: TC.ui, fontSize: 10, fontWeight: 700, color: "rgba(255,255,255,0.6)" }}>Week {currentWeek}</div>
              <div style={{ fontFamily: TC.heading, fontSize: 17, fontWeight: 700, color: "#fff", lineHeight: 1.3 }}>{currentLesson.title}</div>
              <div style={{ fontFamily: TC.ui, fontSize: 11, color: "rgba(255,255,255,0.6)", marginTop: 2 }}>{currentLesson.theme}</div>
            </div>
            <div style={{ background: "rgba(255,255,255,0.2)", borderRadius: 10, padding: "8px 16px", fontFamily: TC.ui, fontSize: 12, fontWeight: 700, color: "#fff" }}>
              {completedLessons.includes(currentWeek) ? "Review" : (lessonProgress[currentWeek]?.length > 0) ? "Continue" : "Start"}
            </div>
          </div>
        </div>

        {/* Quick Stats */}
        <div style={{ display: "flex", gap: 6, marginTop: 14 }}>
          {[
            { n: `${completedCount}/52`, l: "Lessons" },
            { n: `${studyStreak.count}d`, l: "Streak" },
            { n: journalCount, l: "Reflections" },
            { n: xp, l: "XP" },
          ].map((s, i) => (
            <div key={i} style={{ flex: 1, background: "rgba(255,255,255,0.08)", borderRadius: 8, padding: "8px 4px", textAlign: "center", animation: `fadeIn 0.3s ease ${0.2 + i * 0.05}s both` }}>
              <div style={{ fontFamily: TC.heading, fontSize: 16, fontWeight: 700, color: "#fff" }}>{s.n}</div>
              <div style={{ fontFamily: TC.ui, fontSize: 8, color: "rgba(255,255,255,0.6)", textTransform: "uppercase", letterSpacing: "0.06em" }}>{s.l}</div>
            </div>
          ))}
        </div>
      </div>

      {/* ── 4-Tab Bar ── */}
      <div role="tablist" aria-label="Curriculum sections" style={{ display: "flex", borderBottom: `1px solid ${TC.divider}`, background: TC.card, position: "sticky", top: 0, zIndex: 10 }}>
        {["today", "lessons", "journey", "journal"].map(t => (
          <button key={t} role="tab" aria-selected={activeTab === t} onClick={() => setActiveTab(t)}
            style={{ flex: 1, padding: "12px 0", background: "none", border: "none", borderBottom: activeTab === t ? `2px solid ${TC.accent}` : "2px solid transparent", fontFamily: TC.ui, fontSize: 11, fontWeight: activeTab === t ? 700 : 500, color: activeTab === t ? TC.accent : TC.muted, cursor: "pointer", textTransform: "capitalize", transition: "all 0.15s" }}>
            {t === "today" ? "\u2728 Today" : t === "lessons" ? "\uD83D\uDCDA Lessons" : t === "journey" ? "\uD83D\uDDFA\uFE0F Journey" : "\uD83D\uDCD3 Journal"}
          </button>
        ))}
      </div>

      {/* ── Tab Content ── */}
      <div style={{ padding: "16px 16px 40px", maxWidth: 680, margin: "0 auto" }}>

        {/* TODAY */}
        {activeTab === "today" && (
          <TeensTodayTab
            TC={TC} completedLessons={completedLessons} journalEntries={journalEntries}
            studyStreak={studyStreak} verseMastery={verseMastery} dailyLog={dailyLog}
            dailyChallenges={dailyChallenges}
            onSaveReflection={onSaveReflection} onCompleteChallenge={onCompleteChallenge}
            onVerseMastery={onVerseMastery} onOpenLesson={openLesson}
            xp={xp} level={level}
          />
        )}

        {/* LESSONS */}
        {activeTab === "lessons" && (
          <div>
            <div style={{ display: "flex", gap: 6, marginBottom: 12, flexWrap: "wrap" }}>
              {["All", "Term 1", "Term 2", "Term 3", "Term 4"].map(t => (
                <button key={t} onClick={() => setTermFilter(t)} aria-pressed={termFilter === t} style={{ padding: "6px 14px", borderRadius: 20, border: `1px solid ${termFilter === t ? TC.accent : TC.divider}`, background: termFilter === t ? TC.accent : "transparent", color: termFilter === t ? "#fff" : TC.muted, fontFamily: TC.ui, fontSize: 11, fontWeight: 600, cursor: "pointer", transition: "all 0.15s" }}>{t}</button>
              ))}
            </div>
            <div style={{ display: "flex", gap: 4, overflowX: "auto", paddingBottom: 8, marginBottom: 16, WebkitOverflowScrolling: "touch" }}>
              {MONTHS.map(m => (
                <button key={m.label} onClick={() => setMonthFilter(m.label)} aria-pressed={monthFilter === m.label} style={{ padding: "4px 12px", borderRadius: 14, border: `1px solid ${monthFilter === m.label ? TC.accent : TC.divider}`, background: monthFilter === m.label ? TC.accentLight : "transparent", color: monthFilter === m.label ? TC.accent : TC.muted, fontFamily: TC.ui, fontSize: 10, fontWeight: 600, cursor: "pointer", flexShrink: 0 }}>{m.label}</button>
              ))}
            </div>
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill,minmax(280px,1fr))", gap: 12 }}>
              {filteredLessons.map((l, i) => <LessonCard key={l.week} lesson={l} index={i} />)}
            </div>
            {filteredLessons.length === 0 && (
              <div style={{ textAlign: "center", padding: 40, fontFamily: TC.ui, fontSize: 13, color: TC.muted }}>No lessons match this filter.</div>
            )}
          </div>
        )}

        {/* JOURNEY */}
        {activeTab === "journey" && (
          <TeensJourneyPath
            TC={TC} completedLessons={completedLessons} lessonProgress={lessonProgress}
            xp={xp} level={level} completedCount={completedCount} studyStreak={studyStreak}
            onOpenLesson={openLesson} onShare={() => handleShare("journey")}
          />
        )}

        {/* JOURNAL */}
        {activeTab === "journal" && (() => {
          const entries = Object.entries(journalEntries)
            .filter(([, e]) => moodFilter === "All" || e.mood === moodFilter)
            .sort((a, b) => Number(a[0]) - Number(b[0]));
          return (
            <div>
              <div style={{ fontFamily: TC.heading, fontSize: 18, fontWeight: 700, color: TC.text, marginBottom: 4 }}>My Journal</div>
              <div style={{ fontFamily: TC.ui, fontSize: 12, color: TC.muted, marginBottom: 12 }}>Your personal reflections from each lesson</div>

              {/* Mood filter */}
              {journalCount > 0 && (
                <div style={{ display: "flex", gap: 6, marginBottom: 16, flexWrap: "wrap" }}>
                  <button onClick={() => setMoodFilter("All")} aria-pressed={moodFilter === "All"} style={{ padding: "4px 12px", borderRadius: 16, border: `1px solid ${moodFilter === "All" ? TC.accent : TC.divider}`, background: moodFilter === "All" ? TC.accent : "transparent", color: moodFilter === "All" ? "#fff" : TC.muted, fontFamily: TC.ui, fontSize: 10, fontWeight: 600, cursor: "pointer" }}>All</button>
                  {MOODS.map(m => (
                    <button key={m.id} onClick={() => setMoodFilter(moodFilter === m.id ? "All" : m.id)} aria-pressed={moodFilter === m.id}
                      style={{ padding: "4px 10px", borderRadius: 16, border: `1px solid ${moodFilter === m.id ? TC[m.key] : TC.divider}`, background: moodFilter === m.id ? TC[m.key] + "18" : "transparent", fontFamily: TC.ui, fontSize: 10, fontWeight: 600, color: moodFilter === m.id ? TC[m.key] : TC.muted, cursor: "pointer" }}>
                      {m.icon} {m.label}
                    </button>
                  ))}
                </div>
              )}

              {journalCount === 0 && (
                <div style={{ textAlign: "center", padding: 40, fontFamily: TC.body, fontSize: 13, color: TC.muted }}>
                  No journal entries yet. Open a lesson and write your first reflection!
                </div>
              )}
              {entries.length === 0 && journalCount > 0 && (
                <div style={{ textAlign: "center", padding: 30, fontFamily: TC.ui, fontSize: 12, color: TC.muted }}>No entries match this mood filter.</div>
              )}
              {entries.map(([week, entry]) => {
                const lesson = TEEN_LESSONS.find(l => l.week === Number(week));
                const mood = MOODS.find(m => m.id === entry.mood);
                const moodColor = mood ? TC[mood.key] : TC.divider;
                return (
                  <div key={week} style={{ background: TC.card, border: `1px solid ${TC.divider}`, borderLeft: `4px solid ${moodColor}`, borderRadius: 10, padding: 14, marginBottom: 10 }}>
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 6 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
                        <div role="button" tabIndex={0} onClick={() => lesson && openLesson(lesson)} onKeyDown={(e) => { if ((e.key === "Enter" || e.key === " ") && lesson) { e.preventDefault(); openLesson(lesson); } }} style={{ fontFamily: TC.ui, fontSize: 12, fontWeight: 700, color: TC.accent, cursor: lesson ? "pointer" : "default" }}>
                          Week {week}{lesson ? `: ${lesson.title}` : ""}
                        </div>
                        {mood && <span style={{ fontFamily: TC.ui, fontSize: 9, fontWeight: 600, color: moodColor, background: moodColor + "15", borderRadius: 4, padding: "1px 6px" }}>{mood.icon} {mood.label}</span>}
                      </div>
                      <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                        <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.muted }}>{entry.date}</div>
                        <button onClick={(e) => deleteJournal(week, e)} aria-label={`Delete journal entry for week ${week}`} style={{ background: "none", border: "none", cursor: "pointer", color: TC.challengeColor, fontSize: 14, padding: "2px 4px", borderRadius: 4, lineHeight: 1 }}>{"\u2715"}</button>
                      </div>
                    </div>
                    <div onClick={() => lesson && openLesson(lesson)} style={{ fontFamily: TC.body, fontSize: 13, color: TC.text, lineHeight: 1.7, display: "-webkit-box", WebkitLineClamp: 3, WebkitBoxOrient: "vertical", overflow: "hidden", cursor: lesson ? "pointer" : "default" }}>{entry.text}</div>
                    <div style={{ fontFamily: TC.ui, fontSize: 10, color: TC.muted, marginTop: 6 }}>{entry.text.split(/\s+/).length} words</div>
                  </div>
                );
              })}
            </div>
          );
        })()}
      </div>

      {modalOpen && <LessonModal />}
    </div>
  );
}
