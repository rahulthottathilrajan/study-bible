"use client";
import { createContext, useContext, useState, useEffect, useCallback, useMemo, useRef } from "react";
import { supabase } from "../../lib/supabase";
import { BIBLE_BOOKS, BADGES, BIRTHDAY_VERSES, HIGHLIGHT_COLORS, QUIZ_BOOKS } from "../constants";
import { detectCurrency } from "../utils/currency";
import { AuthProvider, useAuthContext } from "./AuthContext";
import { ShopProvider, useShopContext } from "./ShopContext";
import { useBibleDataState } from "./hooks/useBibleDataState";
import { usePrayerState } from "./hooks/usePrayerState";
import { useMediaState } from "./hooks/useMediaState";
import { useQuizGamificationState } from "./hooks/useQuizGamificationState";
import { useLearningState } from "./hooks/useLearningState";

const AppContext = createContext(null);

function CoreAppProvider({ children }) {
  const {
    user,
    authMode,
    setAuthMode,
    authEmail,
    setAuthEmail,
    authPass,
    setAuthPass,
    authName,
    setAuthName,
    authError,
    setAuthError,
    authLoading,
    authShowPass,
    setAuthShowPass,
    authForgot,
    setAuthForgot,
    authForgotSent,
    setAuthForgotSent,
    profile,
    saveProfile,
    streak,
    welcomeModal,
    setWelcomeModal,
    requireAuth,
    handleAuth,
    handleLogout,
    handleForgotPassword,
    handleGoogleSignIn,
    updateStreak,
    isBirthdayToday,
  } = useAuthContext();
  const {
    shopCategory,
    setShopCategory,
    shopProduct,
    setShopProduct,
    cart,
    setCart,
    addToCart,
    removeFromCart,
    updateQty,
    clearCart,
    cartCount,
    shopOrderSession,
    setShopOrderSession,
  } = useShopContext();
  // ─── Core state ───
  const [view, setView] = useState("home");
  const [testament, setTestament] = useState(null);
  const [book, setBook] = useState(null);
  const [chapter, setChapter] = useState(null);
  const [verse, setVerse] = useState(null);
  const [tab, setTab] = useState("study");
  const [chatMessages, setChatMessages] = useState([]);
  const [loading, setLoading] = useState(false);
  const [darkMode, setDarkMode] = useState(false);
  const [fontSize, setFontSize] = useState("medium");
  const [bibleTranslation, setBibleTranslation] = useState("kjv");
  const [currency, setCurrency] = useState(() => {
    try { return localStorage.getItem("currency") || detectCurrency(); } catch { return detectCurrency(); }
  });

  // ─── Responsive breakpoint ───
  const [windowWidth, setWindowWidth] = useState(typeof window !== "undefined" ? window.innerWidth : 375);
  useEffect(() => {
    const onResize = () => setWindowWidth(window.innerWidth);
    window.addEventListener("resize", onResize);
    return () => window.removeEventListener("resize", onResize);
  }, []);
  const bp = useMemo(() => {
    const w = windowWidth;
    const b = w >= 1024 ? "desktop" : w >= 600 ? "tablet" : "mobile";
    return { bp: b, isMobile: b === "mobile", isTablet: b === "tablet", isDesktop: b === "desktop", w, shell: b === "desktop" ? 1200 : b === "tablet" ? 960 : 640, content: b === "desktop" ? 780 : b === "tablet" ? 680 : 520, contentWide: b === "desktop" ? 860 : b === "tablet" ? 780 : 620, cols: b === "desktop" ? 3 : b === "tablet" ? 2 : 1, pad: b === "desktop" ? 36 : b === "tablet" ? 28 : 20 };
  }, [windowWidth]);

  // ─── Load preferences + restore nav state on refresh ───
  useEffect(() => {
    try { const dm = localStorage.getItem("darkMode"); if (dm === "true") setDarkMode(true); } catch {}
    try { const fs = localStorage.getItem("fontSize"); if (fs) setFontSize(fs); } catch {}
    try { const bt = localStorage.getItem("bibleTranslation"); if (bt) setBibleTranslation(bt); } catch {}
    try {
      const saved = localStorage.getItem("navState");
      if (saved) {
        const s = JSON.parse(saved);
        if (s.view && s.view !== "home") {
          // Podcast views need their params — fall back to parent if missing
          const podNav = JSON.parse(localStorage.getItem("podcastNavState") || "null");
          if ((s.view === "podcast-episode" || s.view === "podcast-detail") && !podNav?.podcastSeries) { setView("podcast-home"); }
          else { setView(s.view); }
          if (s.testament) setTestament(s.testament);
          if (s.book) setBook(s.book);
          if (s.chapter) setChapter(s.chapter);
          if (s.verse) setVerse(s.verse);
          if (s.tab) setTab(s.tab);
        }
      }
    } catch {}
    // Handle Stripe return URLs
    try {
      const params = new URLSearchParams(window.location.search);
      if (params.get("shop_order") === "success") {
        setShopOrderSession(params.get("session_id") || null);
        setView("shop-order-success");
        window.history.replaceState({}, "", "/");
      } else if (params.get("shop_order") === "cancelled") {
        setView("shop-cart");
        window.history.replaceState({}, "", "/");
      } else if (params.get("donate") === "success") {
        setDonateSuccess(true);
        setDonateModal(true);
        window.history.replaceState({}, "", "/");
      } else if (params.get("donate") === "cancelled") {
        setDonateModal(true);
        window.history.replaceState({}, "", "/");
      }
    } catch {}
  }, [setShopOrderSession]);
  useEffect(() => {
    try { localStorage.setItem("darkMode", darkMode ? "true" : "false"); } catch {}
    document.body.style.background = darkMode ? "#141210" : "#f7f2e8";
  }, [darkMode]);
  useEffect(() => {
    try { localStorage.setItem("fontSize", fontSize); } catch {}
  }, [fontSize]);
  useEffect(() => {
    try { localStorage.setItem("bibleTranslation", bibleTranslation); } catch {}
  }, [bibleTranslation]);
  useEffect(() => {
    try { localStorage.setItem("currency", currency); } catch {}
  }, [currency]);
  // ─── Persist nav state for refresh ───
  useEffect(() => {
    try { localStorage.setItem("navState", JSON.stringify({ view, testament, book, chapter, verse, tab })); } catch {}
  }, [view, testament, book, chapter, verse, tab]);

  // ─── Service worker registration + install prompt ───
  useEffect(() => {
    if ("serviceWorker" in navigator) {
      navigator.serviceWorker.register("/sw.js").catch(() => {});
    }
    const onPrompt = (e) => {
      e.preventDefault();
      setInstallPrompt(e);
      try { if (!localStorage.getItem("pwa-dismissed")) setShowInstall(true); } catch {}
    };
    const onInstalled = () => setShowInstall(false);
    window.addEventListener("beforeinstallprompt", onPrompt);
    window.addEventListener("appinstalled", onInstalled);
    return () => {
      window.removeEventListener("beforeinstallprompt", onPrompt);
      window.removeEventListener("appinstalled", onInstalled);
    };
  }, [setShopOrderSession]);

  // ─── Font size lookup ───
  const FS = { small:{list:13,detail:15}, medium:{list:14.5,detail:17}, large:{list:17,detail:20}, xlarge:{list:20.5,detail:24} };

  // ─── PWA install prompt ───
  const [installPrompt, setInstallPrompt] = useState(null);
  const [showInstall, setShowInstall] = useState(false);

  // ─── User features state ───
  const [userNote, setUserNote] = useState("");
  const [savedNote, setSavedNote] = useState(null);
  const [noteLoading, setNoteLoading] = useState(false);
  const [highlight, setHighlight] = useState(null);
  const [hasVerseId, setHasVerseId] = useState(false);
  const [shareCopied, setShareCopied] = useState(false);
  const [communityNotes, setCommunityNotes] = useState([]);
  const [chapterHighlights, setChapterHighlights] = useState({});       // { verseNum: hlObj }
  const [chapterNotes, setChapterNotes] = useState({});                 // { verseNum: noteObj }
  const [chapterCommunityNotes, setChapterCommunityNotes] = useState({}); // { verseNum: [noteObj] }
  const [allHighlights, setAllHighlights] = useState([]);
  const [hlLoading, setHlLoading] = useState(false);
  const [allNotes, setAllNotes] = useState([]);
  const [notesLoading, setNotesLoading] = useState(false);
  const journalDirty = useRef(false);
  const [donateModal, setDonateModal] = useState(false);
  const [donateSuccess, setDonateSuccess] = useState(false);
  const [prayerTab, setPrayerTab] = useState("community");

  const noteRef = useRef(null);
  const verseIdMap = useRef({}); // { verseNumber: supabaseUUID } — for user data writes

  // ─── Wrapped verse setter — clears stale per-verse user data in same render batch ───
  const changeVerse = useCallback((v) => {
    setVerse(v);
    setSavedNote(null);
    setUserNote("");
    if (noteRef.current) noteRef.current.value = "";
    setHighlight(null);
    setCommunityNotes([]);
  }, []);

  const {
    dbChapters,
    setDbChapters,
    collapsed,
    setCollapsed,
    booksCollapsed,
    setBooksCollapsed,
    overviewOpen,
    setOverviewOpen,
    chapterMeta,
    setChapterMeta,
    verses,
    setVerses,
    wordStudies,
    setWordStudies,
    crossRefs,
    setCrossRefs,
    dbLive,
    setDbLive,
    bookInfo,
    isOT,
    currentVerse,
    verseNums,
    curIdx,
    t,
    ht,
    loadChapter,
    getChapterFromCache,
    fetchTranslatedVerses,
  } = useBibleDataState({
    darkMode,
    bibleTranslation,
    view,
    book,
    chapter,
    verse,
    setLoading,
    onVerseMissing: changeVerse,
  });

  const {
    prayerModal,
    setPrayerModal,
    prayers,
    setPrayers,
    prayerTitle,
    setPrayerTitle,
    prayerText,
    setPrayerText,
    prayerLoading,
    loadPrayers,
    addPrayer,
    togglePrayerAnswered,
    deletePrayer,
    communityPrayers,
    setCommunityPrayers,
    communityPrayersLoading,
    communityPrayerCategory,
    setCommunityPrayerCategory,
    loadCommunityPrayers,
    addCommunityPrayer,
    deleteCommunityPrayer,
    markCommunityPrayerAnswered,
    userReactions,
    toggleReaction,
    expiringPrayers,
    keepCommunityPrayer,
    reportCommunityPrayer,
    reportTarget,
    setReportTarget,
    cooldownActive,
    justAnsweredId,
    prayerStreak,
    prayerOfTheDay,
    recordPrayerActivity,
    slotCoverage,
    mySlots,
    slotsLoading,
    loadSlotCoverage,
    loadMySlots,
    addPrayerSlot,
    deletePrayerSlot,
    birthdayUsers,
  } = usePrayerState({
    user,
    view,
    prayerTab,
    verseIdMap,
    book,
    chapter,
    verse,
  });

  // ─── Hebrew Learning state ───
  const navStack = useRef([{ view: "home" }]);
  const navSource = useRef({}); // tracks {targetView: sourceView} for context-aware back

  // ─── Greek Learning state ───

  // ─── Timeline state ───

  // Bible Stories nav state
  const [storyId, setStoryId] = useState(null);
  const [storyEpisode, setStoryEpisode] = useState(0);

  const {
    hebrewLessons,
    hebrewLesson,
    setHebrewLesson,
    hebrewAlphabet,
    setHebrewAlphabet,
    hebrewVocab,
    setHebrewVocab,
    hebrewCategory,
    setHebrewCategory,
    hebrewProgress,
    hebrewPracticeMode,
    setHebrewPracticeMode,
    hebrewPracticeIdx,
    setHebrewPracticeIdx,
    hebrewPracticeAnswer,
    setHebrewPracticeAnswer,
    hebrewPracticeScore,
    setHebrewPracticeScore,
    readingStep,
    setReadingStep,
    showLetters,
    setShowLetters,
    readingVerse,
    setReadingVerse,
    vocabGroup,
    setVocabGroup,
    grammarLesson,
    setGrammarLesson,
    grammarLessonIds,
    hebrewXP,
    awardHebrewXP,
    hebrewStreak,
    updateHebrewStreak,
    hebrewDailyDone,
    setHebrewDailyDone,
    hebrewFlashcardHistory,
    setHebrewFlashcardHistory,
    greekLessons,
    greekLesson,
    setGreekLesson,
    greekAlphabet,
    setGreekAlphabet,
    greekVocab,
    setGreekVocab,
    greekCategory,
    setGreekCategory,
    greekProgress,
    greekPracticeIdx,
    setGreekPracticeIdx,
    greekPracticeAnswer,
    setGreekPracticeAnswer,
    greekPracticeScore,
    setGreekPracticeScore,
    greekVocabGroup,
    setGreekVocabGroup,
    greekGrammarLesson,
    setGreekGrammarLesson,
    greekGrammarLessonIds,
    greekReadingVerse,
    setGreekReadingVerse,
    greekReadingStep,
    setGreekReadingStep,
    greekShowLetters,
    setGreekShowLetters,
    greekStreak,
    updateGreekStreak,
    greekError,
    timelineEras,
    timelineEvents,
    timelineSelectedEra,
    setTimelineSelectedEra,
    timelineSelectedEvent,
    setTimelineSelectedEvent,
    timelineLoading,
    timelineEventsLoading,
    timelineExpandedEvent,
    setTimelineExpandedEvent,
    timelineSearchQuery,
    setTimelineSearchQuery,
    timelineAllEvents,
    timelineSearchActive,
    setTimelineSearchActive,
    loadHebrewLessons,
    loadHebrewLesson,
    loadHebrewProgress,
    markHebrewComplete,
    loadGreekLessons,
    loadGreekLesson,
    loadGreekProgress,
    markGreekComplete,
    loadTimelineEras,
    loadAllTimelineEvents,
    loadTimelineEvents,
  } = useLearningState({
    user,
    view,
  });

  const {
    audioPlaying,
    setAudioPlaying,
    audioVisible,
    setAudioVisible,
    sleepTimer,
    setSleepTimer,
    audioSource,
    setAudioSource,
    audioCurrentVerse,
    setAudioCurrentVerse,
    listenedChapters,
    markChapterListened,
    audioCurrentWord,
    setAudioCurrentWord,
    hdAudioUrl,
    fetchAudioTimestamps,
    audioAvailable,
    podcastPlaying,
    setPodcastPlaying,
    podcastVisible,
    setPodcastVisible,
    podcastEpisodeInfo,
    setPodcastEpisodeInfo,
    podcastCurrentTime,
    setPodcastCurrentTime,
    podcastDuration,
    setPodcastDuration,
    podcastListenedEpisodes,
    podcastSeries,
    setPodcastSeries,
    podcastEpisode,
    setPodcastEpisode,
    podcastAudioRef,
    stopPodcast,
    stopBibleAudio,
    podcastStreak,
    updatePodcastStreak,
    markEpisodeListened,
  } = useMediaState({
    book,
    chapter,
    bibleTranslation,
    user,
  });

  const {
    earnedBadges,
    setEarnedBadges,
    chapterReads,
    badgeToast,
    setBadgeToast,
    learnExploration,
    trackLearnExploration,
    notesCount,
    loadEarnedBadges,
    loadChapterReads,
    loadNotesCount,
    markChapterRead,
    quizScores,
    quizQuestions,
    quizLoading,
    quizDifficulty,
    setQuizDifficulty,
    loadQuizScores,
    loadQuizQuestions,
    submitQuizScore,
    quizStreak,
    getDailyQuiz,
    dailyQuizCompleted,
    updateQuizStreak,
    quizMastery,
  } = useQuizGamificationState({
    user,
    setCart,
    setChapterHighlights,
    setChapterNotes,
    setChapterCommunityNotes,
    setAllHighlights,
    setPrayers,
    setCommunityPrayers,
    allHighlights,
    streak,
    hebrewProgress,
    hebrewLessons,
    hebrewStreak,
    hebrewXP,
    greekProgress,
    greekStreak,
    userReactions,
    communityPrayers,
    isBirthdayToday,
    profile,
    listenedChapters,
    podcastListenedEpisodes,
    podcastStreak,
  });

  // ═══ USER FEATURES ═══
  // Batch-load user data for the entire chapter (1 serial + 3 parallel queries)
  const loadUserChapterData = useCallback(async (bookName, chNum) => {
    if (!user || !dbLive) return;
    try {
      // 1. Get verse IDs for this chapter (1 query with join)
      const { data: rows } = await supabase.from("verses")
        .select("id, verse_number, chapters!inner(chapter_number, books!inner(name))")
        .eq("chapters.chapter_number", chNum)
        .eq("chapters.books.name", bookName);
      const idMap = {};
      rows?.forEach(v => { idMap[v.verse_number] = v.id; });
      verseIdMap.current = idMap;

      if (!Object.keys(idMap).length) {
        // Non-seeded book — no verse records in Supabase
        setChapterHighlights({}); setChapterNotes({}); setChapterCommunityNotes({});
        return;
      }

      // 2. Batch user data (3 parallel queries)
      const vIds = Object.values(idMap);
      const [hlRes, ntRes, cnRes] = await Promise.all([
        supabase.from("user_highlights").select("*").eq("user_id", user.id).in("verse_id", vIds),
        supabase.from("user_notes").select("*").eq("user_id", user.id).in("verse_id", vIds),
        supabase.from("user_notes").select("*").eq("is_public", true).neq("user_id", user.id).in("verse_id", vIds),
      ]);

      // 3. Build maps keyed by verse_number
      const rev = {};
      Object.entries(idMap).forEach(([vn, id]) => { rev[id] = Number(vn); });

      const hlMap = {};
      (hlRes.data || []).forEach(h => { const vn = rev[h.verse_id]; if (vn) hlMap[vn] = h; });
      setChapterHighlights(hlMap);

      const ntMap = {};
      (ntRes.data || []).forEach(n => { const vn = rev[n.verse_id]; if (vn) ntMap[vn] = n; });
      setChapterNotes(ntMap);

      const cnMap = {};
      (cnRes.data || []).forEach(n => { const vn = rev[n.verse_id]; if (vn) { if (!cnMap[vn]) cnMap[vn] = []; cnMap[vn].push(n); } });
      setChapterCommunityNotes(cnMap);
    } catch (e) {
      console.error('loadUserChapterData error:', e);
    }
  }, [user, dbLive]);

  // Trigger chapter-level user data load when chapter changes
  useEffect(() => {
    if (!user || !dbLive) return;
    if ((view === "verse" || view === "verses") && book && chapter) {
      loadUserChapterData(book, chapter);
    }
  }, [user, dbLive, view, book, chapter, loadUserChapterData]);

  // Async load user data for a specific chapter — returns { highlights, notes, communityNotes } without setting global state
  const loadUserDataForChapter = useCallback(async (bookName, chNum) => {
    if (!user || !dbLive) return { highlights: {}, notes: {}, communityNotes: {} };
    try {
      const { data: rows } = await supabase.from("verses")
        .select("id, verse_number, chapters!inner(chapter_number, books!inner(name))")
        .eq("chapters.chapter_number", chNum)
        .eq("chapters.books.name", bookName);
      const idMap = {};
      rows?.forEach(v => { idMap[v.verse_number] = v.id; });
      if (!Object.keys(idMap).length) return { highlights: {}, notes: {}, communityNotes: {} };

      const vIds = Object.values(idMap);
      const [hlRes, ntRes, cnRes] = await Promise.all([
        supabase.from("user_highlights").select("*").eq("user_id", user.id).in("verse_id", vIds),
        supabase.from("user_notes").select("*").eq("user_id", user.id).in("verse_id", vIds),
        supabase.from("user_notes").select("*").eq("is_public", true).neq("user_id", user.id).in("verse_id", vIds),
      ]);
      const rev = {};
      Object.entries(idMap).forEach(([vn, id]) => { rev[id] = Number(vn); });
      const highlights = {};
      (hlRes.data || []).forEach(h => { const vn = rev[h.verse_id]; if (vn) highlights[vn] = h; });
      const notes = {};
      (ntRes.data || []).forEach(n => { const vn = rev[n.verse_id]; if (vn) notes[vn] = n; });
      const communityNotes = {};
      (cnRes.data || []).forEach(n => { const vn = rev[n.verse_id]; if (vn) { if (!communityNotes[vn]) communityNotes[vn] = []; communityNotes[vn].push(n); } });
      return { highlights, notes, communityNotes };
    } catch (e) {
      console.error('loadUserDataForChapter error:', e);
      return { highlights: {}, notes: {}, communityNotes: {} };
    }
  }, [user, dbLive]);

  // Synchronous per-verse lookup from chapter maps (zero network calls)
  useEffect(() => {
    if (!verse) return;
    setHighlight(chapterHighlights[verse] || null);
    setHasVerseId(!!verseIdMap.current[verse]);
    const note = chapterNotes[verse];
    if (note) { setSavedNote(note); setUserNote(note.note_text); if (noteRef.current) noteRef.current.value = note.note_text; }
    else { setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = ""; }
    setCommunityNotes(chapterCommunityNotes[verse] || []);
  }, [verse, chapterHighlights, chapterNotes, chapterCommunityNotes]);

  useEffect(() => {
    if (!user) {
      setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = "";
      setHighlight(null); setHasVerseId(false); setCommunityNotes([]);
      setChapterHighlights({}); setChapterNotes({}); setChapterCommunityNotes({});
      verseIdMap.current = {};
    }
  }, [user]);

  const saveNote = async () => {
    const noteText = noteRef.current?.value || "";
    const vId = verseIdMap.current[verse];
    if (!user || !verse || !vId || !noteText.trim()) return { success: false };
    setNoteLoading(true);
    try {
      if (savedNote) {
        const { data, error } = await supabase.from("user_notes").update({ note_text: noteText, updated_at: new Date().toISOString() }).eq("id", savedNote.id).select().single();
        if (error) throw error;
        if (data) { setSavedNote(data); setChapterNotes(prev => ({ ...prev, [verse]: data })); }
      } else {
        const { data, error } = await supabase.from("user_notes").insert({ user_id: user.id, verse_id: vId, note_text: noteText }).select().single();
        if (error) throw error;
        if (data) { setSavedNote(data); setChapterNotes(prev => ({ ...prev, [verse]: data })); setNotesCount(prev => prev + 1); }
      }
      journalDirty.current = true;
      setNoteLoading(false);
      return { success: true };
    } catch (e) { console.error("saveNote:", e); setNoteLoading(false); return { success: false, error: e.message }; }
  };

  const toggleNotePublic = async () => {
    if (!savedNote) return;
    try {
      const { data, error } = await supabase.from("user_notes").update({ is_public: !savedNote.is_public }).eq("id", savedNote.id).select().single();
      if (error) throw error;
      if (data) { setSavedNote(data); setChapterNotes(prev => ({ ...prev, [verse]: data })); }
      journalDirty.current = true;
      return { success: true };
    } catch (e) { console.error("toggleNotePublic:", e); return { success: false, error: e.message }; }
  };

  const deleteNote = async () => {
    if (!savedNote || !user) return { success: false };
    setNoteLoading(true);
    try {
      const { error } = await supabase.from("user_notes").delete().eq("id", savedNote.id);
      if (error) throw error;
      setSavedNote(null);
      setUserNote("");
      if (noteRef.current) noteRef.current.value = "";
      setChapterNotes(prev => { const next = { ...prev }; delete next[verse]; return next; });
      setNotesCount(prev => Math.max(0, prev - 1));
      journalDirty.current = true;
      setNoteLoading(false);
      return { success: true };
    } catch (e) { console.error("deleteNote:", e); setNoteLoading(false); return { success: false, error: e.message }; }
  };

  const toggleHighlight = async (color) => {
    const vId = verseIdMap.current[verse];
    if (!user || !verse || !vId) return { success: false };
    try {
      if (highlight?.highlight_color === color) {
        const { error } = await supabase.from("user_highlights").delete().eq("id", highlight.id);
        if (error) throw error;
        setHighlight(null);
        setChapterHighlights(prev => { const next = { ...prev }; delete next[verse]; return next; });
      } else if (highlight) {
        const { data, error } = await supabase.from("user_highlights").update({ highlight_color: color }).eq("id", highlight.id).select().single();
        if (error) throw error;
        if (data) { setHighlight(data); setChapterHighlights(prev => ({ ...prev, [verse]: data })); }
      } else {
        const { data, error } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: vId, highlight_color: color }).select().single();
        if (error) throw error;
        if (data) { setHighlight(data); setChapterHighlights(prev => ({ ...prev, [verse]: data })); }
      }
      journalDirty.current = true;
      return { success: true };
    } catch (e) { console.error("toggleHighlight:", e); return { success: false, error: e.message }; }
  };

  const toggleBookmarkHL = async () => {
    const vId = verseIdMap.current[verse];
    if (!user || !verse || !vId) return { success: false };
    try {
      if (highlight) {
        const { data, error } = await supabase.from("user_highlights").update({ is_bookmarked: !highlight.is_bookmarked }).eq("id", highlight.id).select().single();
        if (error) throw error;
        if (data) { setHighlight(data); setChapterHighlights(prev => ({ ...prev, [verse]: data })); }
      } else {
        const { data, error } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: vId, is_bookmarked: true, highlight_color: "#FFD700" }).select().single();
        if (error) throw error;
        if (data) { setHighlight(data); setChapterHighlights(prev => ({ ...prev, [verse]: data })); }
      }
      journalDirty.current = true;
      return { success: true };
    } catch (e) { console.error("toggleBookmarkHL:", e); return { success: false, error: e.message }; }
  };

  const copyVerseText = async () => {
    if (!currentVerse) return;
    const text = `${currentVerse.kjv_text} — ${book} ${chapter}:${verse} (KJV)`;
    try {
      await navigator.clipboard.writeText(text);
      setShareCopied(true);
      setTimeout(() => setShareCopied(false), 2000);
    } catch (e) { console.error(e); }
  };

  const shareVerseImage = () => {
    if (!currentVerse) return;
    const W = 1080, H = 1080;
    const canvas = document.createElement("canvas");
    canvas.width = W; canvas.height = H;
    const ctx = canvas.getContext("2d");
    const ref = `${book} ${chapter}:${verse}`;
    const verseText = currentVerse.kjv_text;

    ctx.fillStyle = "#0f1728";
    ctx.fillRect(0, 0, W, H);

    const barGrad = ctx.createLinearGradient(0, 0, W, 0);
    barGrad.addColorStop(0, "transparent");
    barGrad.addColorStop(0.3, t.accent);
    barGrad.addColorStop(0.7, t.accent);
    barGrad.addColorStop(1, "transparent");
    ctx.fillStyle = barGrad;
    ctx.fillRect(0, 0, W, 6);

    ctx.fillStyle = t.accent;
    ctx.font = "700 32px Georgia,serif";
    ctx.fillText("The Bible Scrollers", 80, 88);

    ctx.globalAlpha = 0.12;
    ctx.fillStyle = t.accent;
    ctx.font = "italic 260px Georgia,serif";
    ctx.fillText("\u201C", 36, 400);
    ctx.globalAlpha = 1;

    const maxWidth = W - 160;
    const tryWrap = (fontSize) => {
      ctx.font = `italic ${fontSize}px Georgia,serif`;
      const words = verseText.split(" ");
      let line = "", lines = [];
      for (const w of words) {
        const test = line + w + " ";
        if (ctx.measureText(test).width > maxWidth && line) { lines.push(line.trim()); line = w + " "; }
        else line = test;
      }
      if (line) lines.push(line.trim());
      return lines;
    };
    let fSize = 54;
    let lines = tryWrap(fSize);
    if (lines.length > 9) { fSize = 44; lines = tryWrap(fSize); }
    if (lines.length > 12) { fSize = 36; lines = tryWrap(fSize); }
    const lineH = Math.round(fSize * 1.45);
    const startY = 290;
    ctx.fillStyle = "#f0ece4";
    ctx.font = `italic ${fSize}px Georgia,serif`;
    lines.forEach((l, i) => ctx.fillText(l, 80, startY + i * lineH));

    const refY = startY + lines.length * lineH + 44;
    ctx.fillStyle = t.accent;
    ctx.font = "700 40px Georgia,serif";
    ctx.fillText(`\u2014 ${ref} (KJV)`, 80, refY);

    ctx.globalAlpha = 0.35;
    ctx.fillStyle = t.accent;
    ctx.fillRect(80, H - 90, W - 160, 1);
    ctx.globalAlpha = 1;

    ctx.fillStyle = "#555e6e";
    ctx.font = "400 26px Georgia,serif";
    ctx.fillText("study-bible-two.vercel.app", 80, H - 52);

    canvas.toBlob(async (blob) => {
      const fileName = `${ref.replace(/[:\s]/g, "_")}.png`;
      const file = new File([blob], fileName, { type: "image/png" });
      if (navigator.share && navigator.canShare && navigator.canShare({ files: [file] })) {
        try { await navigator.share({ files: [file], title: ref, text: `${verseText} — ${ref} (KJV)` }); }
        catch (e) { if (e.name !== "AbortError") console.error(e); }
      } else {
        const url = URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.href = url; a.download = fileName; a.click();
        URL.revokeObjectURL(url);
      }
    }, "image/png");
  };

  // ═══ LOAD ALL HIGHLIGHTS ═══
  const loadAllHighlights = useCallback(async () => {
    if (!user) return;
    setHlLoading(true);
    const { data } = await supabase
      .from("user_highlights")
      .select("*, verses(verse_number, kjv_text, chapter_id, chapters(chapter_number, book_id, books(name)))")
      .eq("user_id", user.id)
      .order("created_at", { ascending: false })
      .limit(200);
    setAllHighlights(data || []);
    setHlLoading(false);
  }, [user]);

  // ═══ LOAD ALL NOTES ═══
  const loadAllNotes = useCallback(async () => {
    if (!user) return;
    setNotesLoading(true);
    const { data, error } = await supabase
      .from("user_notes")
      .select("*, verses(verse_number, kjv_text, chapter_id, chapters(chapter_number, book_id, books(name)))")
      .eq("user_id", user.id)
      .order("updated_at", { ascending: false })
      .limit(200);
    if (error) console.error("loadAllNotes:", error);
    setAllNotes(data || []);
    setNotesLoading(false);
  }, [user]);

  useEffect(() => {
    if ((view === "account" || view === "highlights") && user) {
      loadAllHighlights(); loadAllNotes();
      journalDirty.current = false;
    }
  }, [view, user, loadAllHighlights, loadAllNotes]);

  // ═══ HEBREW LEARNING (static JSON — zero Supabase calls for lesson content) ═══




  // Hebrew engagement — localStorage persistence


  // ═══ GREEK LEARNING (static JSON — zero Supabase calls for lesson content) ═══


  // ═══ TIMELINE LOADERS ═══

  const BACK_MAP = { "verse":"verses", "verses":"books", "chapter":"books", "books":"home", "search":"home", "quiz-browser":"home", "quiz-intro":"verses", "quiz-active":"quiz-intro", "quiz-results":"verses", "hebrew-lesson":"hebrew-home", "hebrew-practice":"hebrew-home", "hebrew-flashcards":"hebrew-home", "hebrew-reading":"hebrew-reading-home", "hebrew-grammar-lesson":"hebrew-grammar-home", "hebrew-home":"learn-home", "hebrew-reading-home":"learn-home", "hebrew-grammar-home":"learn-home", "greek-lesson":"greek-home", "greek-practice":"greek-home", "greek-reading":"greek-reading-home", "greek-grammar-lesson":"greek-grammar-home", "greek-home":"learn-home", "greek-reading-home":"learn-home", "greek-grammar-home":"learn-home", "greek-lexicon":"greek-home", "greek-flashcards":"greek-home", "greek-journal":"greek-home", "timeline-era-detail":"timeline-era", "timeline-era":"timeline-home", "timeline-home":"learn-home", "timeline-maps":"learn-home", "timeline-books":"learn-home", "prophecy-home":"learn-home", "timeline-archaeology":"learn-home", "apologetics-home":"learn-home", "reading-plans-home":"learn-home", "kids-curriculum-home":"learn-home", "teens-curriculum-home":"learn-home", "learn-home":"home", "prayer-home":"home", "prayer-community":"prayer-home", "prayer-clock":"prayer-home", "prayer-journal":"prayer-home", "prayer-testimony":"prayer-home", "prayer-slot-active":"prayer-clock", "account":"home", "highlights":"account", "terms":"home", "shop-home":"home", "shop-category":"shop-home", "shop-product":"shop-category", "shop-cart":"shop-home", "shop-order-success":"shop-home", "shop-premium":"shop-home", "podcast-home":"learn-home", "podcast-detail":"podcast-home", "podcast-episode":"podcast-detail", "stories-home":"learn-home", "stories-detail":"stories-home", "stories-reader":"stories-detail", "smart-chat":"home", };

  const goBack = () => {
    // Context-aware: if we know the source view, go there instead of static BACK_MAP
    const source = navSource.current[view];
    const target = source || BACK_MAP[view] || "home";
    if (source) delete navSource.current[view]; // one-time use
    if (navStack.current.length > 1) navStack.current.pop();
    setView(target);
    window.scrollTo({ top: 0, behavior: "instant" });
  };

  const nav = useCallback((v, opts = {}) => {
    const snapshot = { view: v, testament, book, chapter, verse, tab, ...opts };
    navStack.current.push(snapshot);
    // Track source for context-aware back (Home-launched vs Learn-launched)
    navSource.current[v] = view;
    setView(v);
    if (opts.testament !== undefined) setTestament(opts.testament);
    if (opts.book !== undefined) setBook(opts.book);
    if (opts.chapter !== undefined) setChapter(opts.chapter);
    if (opts.verse !== undefined) changeVerse(opts.verse);
    if (opts.tab !== undefined) setTab(opts.tab);
    if (opts.shopCategory !== undefined) setShopCategory(opts.shopCategory);
    if (opts.shopProduct !== undefined) setShopProduct(opts.shopProduct);
    if (opts.podcastSeries !== undefined) setPodcastSeries(opts.podcastSeries);
    if (opts.podcastEpisode !== undefined) setPodcastEpisode(opts.podcastEpisode);
    if (opts.storyId !== undefined) setStoryId(opts.storyId);
    if (opts.storyEpisode !== undefined) setStoryEpisode(opts.storyEpisode);
    window.scrollTo({ top: 0, behavior: "instant" });
  }, [testament, book, chapter, verse, tab, changeVerse, setPodcastEpisode, setPodcastSeries, setShopCategory, setShopProduct, view]);

  // ═══ SUPABASE READING POSITION SYNC ═══
  const savePositionToSupabase = useCallback(async (sectionKey, positionData) => {
    if (!user) return;
    try {
      await supabase.from("user_reading_position").upsert({
        user_id: user.id,
        section_key: sectionKey,
        position_data: positionData,
        updated_at: new Date().toISOString(),
      }, { onConflict: "user_id,section_key" });
    } catch (e) { console.error("Position sync error:", e); }
  }, [user]);

  const updateSectionPosition = useCallback((sectionKey, positionData) => {
    const lsKey = `cr_${sectionKey}`;
    try { localStorage.setItem(lsKey, JSON.stringify(positionData)); } catch {}
    savePositionToSupabase(sectionKey, positionData);
  }, [savePositionToSupabase]);

  useEffect(() => {
    if (view === "verse" && book && chapter && verse) {
      const sectionKey = testament === "NT" ? "nt" : "ot";
      const entry = { book, chapter, verse };
      try {
        localStorage.setItem(`cr_${sectionKey}`, JSON.stringify(entry));
        localStorage.setItem("lastRead", JSON.stringify({ book, chapter, verse, testament }));
      } catch {}
      savePositionToSupabase(sectionKey, entry);
      updateStreak();
    }
  }, [view, book, chapter, verse, testament, savePositionToSupabase, updateStreak]);

  useEffect(() => {
    try {
      if (view === "hebrew-home" || view === "hebrew-lesson" || view === "hebrew-practice") {
        const name = hebrewLesson?.title || hebrewCategory || "Hebrew";
        const data = { lessonName: name, view };
        localStorage.setItem("cr_hebrew", JSON.stringify(data));
        savePositionToSupabase("hebrew", data);
      }
      if (view === "greek-home" || view === "greek-lesson" || view === "greek-practice" || view === "greek-reading" || view === "greek-flashcards" || view === "greek-lexicon" || view === "greek-journal") {
        const name = greekLesson?.title || greekCategory || "Greek";
        const data = { lessonName: name, view };
        localStorage.setItem("cr_greek", JSON.stringify(data));
        savePositionToSupabase("greek", data);
      }
      if (view === "timeline-home" || view === "timeline-era") {
        const name = timelineSelectedEra?.era_name || "Timeline";
        const data = { eraName: name, view };
        localStorage.setItem("cr_timeline", JSON.stringify(data));
        savePositionToSupabase("timeline", data);
      }
      if (view === "prophecy-home") {
        const data = { topicName: "Prophecy & Fulfilment" };
        localStorage.setItem("cr_prophecy", JSON.stringify(data));
        savePositionToSupabase("prophecy", data);
      }
      if (view === "apologetics-home") {
        const data = { topicName: "Apologetics" };
        localStorage.setItem("cr_apologetics", JSON.stringify(data));
        savePositionToSupabase("apologetics", data);
      }
      if (view === "reading-plans-home") {
        const data = { planName: "Reading Plans" };
        localStorage.setItem("cr_readingplans", JSON.stringify(data));
        savePositionToSupabase("readingplans", data);
      }
    } catch {}
  }, [view, hebrewLesson, hebrewCategory, greekLesson, greekCategory, timelineSelectedEra, savePositionToSupabase]);

  const value = {
    // Core
    bp,
    view, setView, testament, setTestament, book, setBook, chapter, setChapter,
    verse, setVerse: changeVerse, tab, setTab, loading, setLoading,
    shopCategory, setShopCategory, shopProduct, setShopProduct,
    cart, addToCart, removeFromCart, updateQty, clearCart, cartCount,
    shopOrderSession,
    dbLive, setDbLive, darkMode, setDarkMode, fontSize, setFontSize, FS, bibleTranslation, setBibleTranslation, currency, setCurrency,
    // Bible data
    dbChapters, collapsed, setCollapsed, booksCollapsed, setBooksCollapsed,
    overviewOpen, setOverviewOpen, chapterMeta, verses, wordStudies, crossRefs,
    // PWA
    installPrompt, showInstall, setShowInstall,
    // Auth
    user, authMode, setAuthMode, authEmail, setAuthEmail, authPass, setAuthPass,
    authName, setAuthName, authError, setAuthError, authLoading, authShowPass, setAuthShowPass,
    authForgot, setAuthForgot, authForgotSent, setAuthForgotSent, profile, saveProfile, streak,
    // User features
    userNote, setUserNote, savedNote, setSavedNote, noteLoading, highlight,
    shareCopied, communityNotes, chapterHighlights, chapterNotes, chapterCommunityNotes,
    prayerModal, setPrayerModal, prayers, prayerTitle,
    setPrayerTitle, prayerText, setPrayerText, prayerLoading, allHighlights, hlLoading, allNotes, notesLoading,
    donateModal, setDonateModal, donateSuccess, setDonateSuccess, welcomeModal, setWelcomeModal, requireAuth, prayerTab, setPrayerTab, noteRef,
    // Hebrew
    hebrewLessons, hebrewLesson, setHebrewLesson, hebrewAlphabet, setHebrewAlphabet, hebrewVocab, setHebrewVocab,
    hebrewCategory, setHebrewCategory, hebrewProgress, hebrewPracticeMode, setHebrewPracticeMode,
    hebrewPracticeIdx, setHebrewPracticeIdx, hebrewPracticeAnswer, setHebrewPracticeAnswer,
    hebrewPracticeScore, setHebrewPracticeScore, readingStep, setReadingStep,
    showLetters, setShowLetters, readingVerse, setReadingVerse,
    vocabGroup, setVocabGroup, grammarLesson, setGrammarLesson, grammarLessonIds,
    hebrewXP, awardHebrewXP, hebrewStreak, updateHebrewStreak,
    hebrewDailyDone, setHebrewDailyDone, hebrewFlashcardHistory, setHebrewFlashcardHistory,
    // Greek
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, setGreekAlphabet, greekVocab, setGreekVocab,
    greekCategory, setGreekCategory, greekProgress, greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer, greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup, greekGrammarLesson, setGreekGrammarLesson,
    greekGrammarLessonIds, greekReadingVerse, setGreekReadingVerse, greekReadingStep, setGreekReadingStep,
    greekShowLetters, setGreekShowLetters, greekStreak, updateGreekStreak, greekError,
    // Timeline
    timelineEras, timelineEvents, timelineSelectedEra, setTimelineSelectedEra,
    timelineSelectedEvent, setTimelineSelectedEvent, timelineLoading, timelineEventsLoading,
    timelineExpandedEvent, setTimelineExpandedEvent, timelineSearchQuery, setTimelineSearchQuery,
    timelineAllEvents, timelineSearchActive, setTimelineSearchActive,
    // Derived
    bookInfo, isOT, currentVerse, verseNums, curIdx, t, ht,
    // Auth handlers
    handleAuth, handleLogout, handleForgotPassword, handleGoogleSignIn,
    // User feature handlers
    hasVerseId, saveNote, deleteNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage,
    // Prayer handlers
    loadPrayers, addPrayer, togglePrayerAnswered, deletePrayer,
    // Community prayer
    communityPrayers, communityPrayersLoading, communityPrayerCategory,
    setCommunityPrayerCategory, addCommunityPrayer, deleteCommunityPrayer,
    markCommunityPrayerAnswered, userReactions, toggleReaction,
    loadCommunityPrayers, expiringPrayers, keepCommunityPrayer,
    reportCommunityPrayer, reportTarget, setReportTarget, cooldownActive,
    justAnsweredId, prayerStreak, prayerOfTheDay, recordPrayerActivity,
    // Prayer clock
    slotCoverage, mySlots, slotsLoading,
    loadSlotCoverage, loadMySlots, addPrayerSlot, deletePrayerSlot,
    // Highlights & Notes
    loadAllHighlights, loadAllNotes,
    // Hebrew handlers
    loadHebrewLessons, loadHebrewLesson, loadHebrewProgress, markHebrewComplete,
    // Greek handlers
    loadGreekLessons, loadGreekLesson, loadGreekProgress, markGreekComplete,
    // Timeline handlers
    loadTimelineEras, loadAllTimelineEvents, loadTimelineEvents,
    // Navigation
    loadChapter, getChapterFromCache, loadUserDataForChapter, fetchTranslatedVerses, goBack, nav, savePositionToSupabase, updateSectionPosition,
    updateStreak,
    // Gamification
    earnedBadges, chapterReads, badgeToast, setBadgeToast,
    markChapterRead, trackLearnExploration, notesCount,
    // Quiz
    quizScores, quizQuestions, quizLoading, quizDifficulty, setQuizDifficulty,
    loadQuizQuestions, submitQuizScore,
    quizStreak, getDailyQuiz, dailyQuizCompleted, updateQuizStreak, quizMastery,
    // Audio
    audioPlaying, setAudioPlaying, audioVisible, setAudioVisible,
    audioAvailable, sleepTimer, setSleepTimer,
    audioSource, setAudioSource, audioCurrentVerse, setAudioCurrentVerse,
    listenedChapters, markChapterListened,
    hdAudioUrl, fetchAudioTimestamps,
    audioCurrentWord, setAudioCurrentWord,
    // Podcast (minimal — player is self-contained)
    podcastPlaying, setPodcastPlaying, podcastVisible, setPodcastVisible,
    podcastEpisodeInfo, setPodcastEpisodeInfo, podcastAudioRef,
    podcastCurrentTime, setPodcastCurrentTime, podcastDuration, setPodcastDuration,
    podcastListenedEpisodes, podcastSeries, podcastEpisode,
    // Bible Stories
    storyId, storyEpisode,
    podcastStreak, updatePodcastStreak,
    stopPodcast, stopBibleAudio, markEpisodeListened,
    // Smart Chat
    chatMessages, setChatMessages,
    // Birthday
    isBirthdayToday, birthdayUsers,
  };

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>;
}

export function AppProvider({ children }) {
  return (
    <AuthProvider>
      <ShopProvider>
        <CoreAppProvider>{children}</CoreAppProvider>
      </ShopProvider>
    </AuthProvider>
  );
}

export function useApp() {
  const ctx = useContext(AppContext);
  const auth = useAuthContext();
  const shop = useShopContext();

  if (!ctx) throw new Error("useApp must be used within AppProvider");

  return useMemo(() => ({
    ...ctx,
    ...auth,
    ...shop,
  }), [auth, ctx, shop]);
}
