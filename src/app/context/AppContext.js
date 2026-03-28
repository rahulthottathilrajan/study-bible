"use client";
import { createContext, useContext, useState, useEffect, useCallback, useMemo, useRef } from "react";
import { supabase } from "../../lib/supabase";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, BADGES, BIRTHDAY_VERSES, BIBLE_TRANSLATIONS, BOOK_CODE_MAP, CDN_NARRATORS, HD_AUDIO_TRANSLATIONS, HD_AUDIO_BUCKET, HIGHLIGHT_COLORS, QUIZ_BOOKS } from "../constants";
import { detectCurrency } from "../utils/currency";

// ─── Derive dbChapters from BIBLE_BOOKS (synchronous, no Supabase needed) ───
const initDbChapters = {};
BIBLE_BOOKS.forEach(b => {
  initDbChapters[b.name] = Array.from({ length: b.chapters }, (_, i) => ({
    num: i + 1, theme: null
  }));
});

const AppContext = createContext(null);

export function AppProvider({ children }) {
  // ─── Core state ───
  const [view, setView] = useState("home");
  const [testament, setTestament] = useState(null);
  const [book, setBook] = useState(null);
  const [chapter, setChapter] = useState(null);
  const [verse, setVerse] = useState(null);
  const [tab, setTab] = useState("study");
  const [shopCategory, setShopCategory] = useState(null);
  const [shopProduct, setShopProduct] = useState(null);
  const [cart, setCart] = useState(() => {
    try { const s = localStorage.getItem("cart"); return s ? JSON.parse(s) : []; } catch { return []; }
  });
  const [shopOrderSession, setShopOrderSession] = useState(null);
  const [chatMessages, setChatMessages] = useState([]);
  const [loading, setLoading] = useState(false);
  const [dbLive, setDbLive] = useState(false);
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
  }, []);
  useEffect(() => {
    try { localStorage.setItem("cart", JSON.stringify(cart)); } catch {}
  }, [cart]);
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
  }, []);

  // ─── Font size lookup ───
  const FS = { small:{list:13,detail:15}, medium:{list:14.5,detail:17}, large:{list:17,detail:20}, xlarge:{list:20.5,detail:24} };

  // ─── Bible data ───
  const [dbChapters, setDbChapters] = useState(initDbChapters);
  const [collapsed, setCollapsed] = useState({});
  const [booksCollapsed, setBooksCollapsed] = useState({});
  const [overviewOpen, setOverviewOpen] = useState(false);
  const [chapterMeta, setChapterMeta] = useState(null);
  const [verses, setVerses] = useState([]);
  const [wordStudies, setWordStudies] = useState({});
  const [crossRefs, setCrossRefs] = useState({});

  // ─── PWA install prompt ───
  const [installPrompt, setInstallPrompt] = useState(null);
  const [showInstall, setShowInstall] = useState(false);

  // ─── Auth state ───
  const [user, setUser] = useState(null);
  const [authMode, setAuthMode] = useState("login");
  const [authEmail, setAuthEmail] = useState("");
  const [authPass, setAuthPass] = useState("");
  const [authName, setAuthName] = useState("");
  const [authError, setAuthError] = useState("");
  const [authLoading, setAuthLoading] = useState(false);
  const [authShowPass, setAuthShowPass] = useState(false);
  const [authForgot, setAuthForgot] = useState(false);
  const [authForgotSent, setAuthForgotSent] = useState(false);
  const [profile, setProfile] = useState(null);
  const [streak, setStreak] = useState(null);

  // ─── Birthday detection ───
  const isBirthdayToday = useMemo(() => {
    if (!profile?.date_of_birth) return false;
    try {
      const dob = new Date(profile.date_of_birth + "T00:00:00");
      const today = new Date();
      return dob.getMonth() === today.getMonth() && dob.getDate() === today.getDate();
    } catch { return false; }
  }, [profile]);

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
  const [prayerModal, setPrayerModal] = useState(false);
  const [prayers, setPrayers] = useState([]);
  const [prayerTitle, setPrayerTitle] = useState("");
  const [prayerText, setPrayerText] = useState("");
  const [prayerLoading, setPrayerLoading] = useState(false);
  const [allHighlights, setAllHighlights] = useState([]);
  const [hlLoading, setHlLoading] = useState(false);
  const [allNotes, setAllNotes] = useState([]);
  const [notesLoading, setNotesLoading] = useState(false);
  const journalDirty = useRef(false);
  const [donateModal, setDonateModal] = useState(false);
  const [donateSuccess, setDonateSuccess] = useState(false);
  const [welcomeModal, setWelcomeModal] = useState(false);
  const [prayerTab, setPrayerTab] = useState("community");

  // ─── Community Prayer state ───
  const [communityPrayers, setCommunityPrayers] = useState([]);
  const [communityPrayersLoading, setCommunityPrayersLoading] = useState(false);
  const [communityPrayerCategory, setCommunityPrayerCategory] = useState("all");
  const [userReactions, setUserReactions] = useState({});

  const [expiringPrayers, setExpiringPrayers] = useState([]);
  const [reportTarget, setReportTarget] = useState(null);
  const [cooldownActive, setCooldownActive] = useState(false);
  const [justAnsweredId, setJustAnsweredId] = useState(null);
  const [prayerStreak, setPrayerStreak] = useState(0);
  const lastPrayerSubmitRef = useRef(0);

  // ─── Prayer Clock state ───
  const [slotCoverage, setSlotCoverage] = useState([]);
  const [mySlots, setMySlots] = useState([]);
  const [slotsLoading, setSlotsLoading] = useState(false);

  const noteRef = useRef(null);
  const bookCache = useRef({}); // { "genesis": fullBookJSON, ... } — cached static JSON
  const verseIdMap = useRef({}); // { verseNumber: supabaseUUID } — for user data writes
  const translationCache = useRef({}); // { "HINIRV": { "GEN:1": {1:"text",2:"text"} } }
  const audioLinksCache = useRef({}); // { "BSB:GEN:1": { gilbert:"url", ... } }
  const podcastAudioRef = useRef(null); // HTML5 Audio element (separate from Bible audio)

  // ─── Wrapped verse setter — clears stale per-verse user data in same render batch ───
  const changeVerse = useCallback((v) => {
    setVerse(v);
    setSavedNote(null);
    setUserNote("");
    if (noteRef.current) noteRef.current.value = "";
    setHighlight(null);
    setCommunityNotes([]);
  }, []);

  // ─── Hebrew Learning state ───
  const [hebrewLessons, setHebrewLessons] = useState([]);
  const [hebrewLesson, setHebrewLesson] = useState(null);
  const [hebrewAlphabet, setHebrewAlphabet] = useState(null);
  const [hebrewVocab, setHebrewVocab] = useState([]);
  const [hebrewCategory, setHebrewCategory] = useState('alphabet');
  const [hebrewProgress, setHebrewProgress] = useState({});
  const [hebrewPracticeMode, setHebrewPracticeMode] = useState(false);
  const [hebrewPracticeIdx, setHebrewPracticeIdx] = useState(0);
  const [hebrewPracticeAnswer, setHebrewPracticeAnswer] = useState(null);
  const [hebrewPracticeScore, setHebrewPracticeScore] = useState(0);
  const hebrewCache = useRef({});
  const navStack = useRef([{ view: "home" }]);
  const [readingStep, setReadingStep] = useState(0);
  const [showLetters, setShowLetters] = useState(false);
  const [readingVerse, setReadingVerse] = useState('gen1v1');
  const [vocabGroup, setVocabGroup] = useState(null);
  const [grammarLesson, setGrammarLesson] = useState(null);
  const [grammarLessonIds, setGrammarLessonIds] = useState({});

  // ─── Greek Learning state ───
  const [greekLessons, setGreekLessons] = useState([]);
  const [greekLesson, setGreekLesson] = useState(null);
  const [greekAlphabet, setGreekAlphabet] = useState(null);
  const [greekVocab, setGreekVocab] = useState([]);
  const [greekCategory, setGreekCategory] = useState('alphabet');
  const [greekProgress, setGreekProgress] = useState({});
  const [greekPracticeIdx, setGreekPracticeIdx] = useState(0);
  const [greekPracticeAnswer, setGreekPracticeAnswer] = useState(null);
  const [greekPracticeScore, setGreekPracticeScore] = useState(0);
  const greekCache = useRef({});
  const [greekVocabGroup, setGreekVocabGroup] = useState(null);
  const [greekGrammarLesson, setGreekGrammarLesson] = useState(null);
  const [greekGrammarLessonIds, setGreekGrammarLessonIds] = useState({});
  const [greekReadingVerse, setGreekReadingVerse] = useState('john1v1');
  const [greekReadingStep, setGreekReadingStep] = useState(0);

  // ─── Timeline state ───
  const [timelineEras, setTimelineEras] = useState([]);
  const [timelineEvents, setTimelineEvents] = useState([]);
  const [timelineSelectedEra, setTimelineSelectedEra] = useState(null);
  const [timelineSelectedEvent, setTimelineSelectedEvent] = useState(null);
  const [timelineLoading, setTimelineLoading] = useState(false);
  const [timelineEventsLoading, setTimelineEventsLoading] = useState(false);
  const [timelineExpandedEvent, setTimelineExpandedEvent] = useState(null);
  const [timelineSearchQuery, setTimelineSearchQuery] = useState("");
  const [timelineAllEvents, setTimelineAllEvents] = useState([]);
  const [timelineSearchActive, setTimelineSearchActive] = useState(false);

  // ─── Gamification state ───
  const [earnedBadges, setEarnedBadges] = useState({});
  const [chapterReads, setChapterReads] = useState([]);
  const [badgeToast, setBadgeToast] = useState(null);
  const [learnExploration, setLearnExploration] = useState({ erasExplored: [], propheciesRead: [], archaeologyViewed: [], mapsExplored: {} });
  const [notesCount, setNotesCount] = useState(0);
  // ─── Quiz state ───
  const [quizScores, setQuizScores] = useState({});
  const [quizQuestions, setQuizQuestions] = useState([]);
  const [quizLoading, setQuizLoading] = useState(false);
  const [quizDifficulty, setQuizDifficulty] = useState("");
  const [quizStreak, setQuizStreak] = useState(null);

  // ─── Audio state ───
  const [audioPlaying, setAudioPlaying] = useState(false);
  const [audioVisible, setAudioVisible] = useState(false);
  const [audioMode, setAudioMode] = useState("tts"); // "tts" | "cdn" | "hd"
  const [audioNarrator, setAudioNarrator] = useState(() => {
    try { return localStorage.getItem("audioNarrator") || "gilbert"; } catch { return "gilbert"; }
  });
  const [audioChapterLinks, setAudioChapterLinks] = useState(null);
  const [sleepTimer, setSleepTimer] = useState(0); // 0=off, 15, 30, 45, 60 minutes
  const [audioSource, setAudioSource] = useState("verseStudy"); // "verseStudy" | "verseList"
  const [audioCurrentVerse, setAudioCurrentVerse] = useState(null);
  const [listenedChapters, setListenedChapters] = useState(() => {
    try { return JSON.parse(localStorage.getItem("listenedChapters") || "[]"); } catch { return []; }
  });
  const [audioCurrentWord, setAudioCurrentWord] = useState(null); // { verseNum, wordIdx, verseWordIdx, text }
  const audioTimestampsCache = useRef({}); // cache: "mal_irv:GEN:1" → timestamp JSON
  const [hdAudioUrl, setHdAudioUrl] = useState(null); // current chapter pre-generated MP3 URL

  // ─── Podcast state (minimal — player is self-contained) ───
  const [podcastPlaying, setPodcastPlaying] = useState(false);
  const [podcastVisible, setPodcastVisible] = useState(false);
  const [podcastEpisodeInfo, setPodcastEpisodeInfo] = useState(null); // { seriesSlug, episodeNum, title, seriesTitle }
  const [podcastCurrentTime, setPodcastCurrentTime] = useState(0);
  const [podcastDuration, setPodcastDuration] = useState(0);
  const [podcastListenedEpisodes, setPodcastListenedEpisodes] = useState(() => {
    try { return JSON.parse(localStorage.getItem("podcastListenedEpisodes") || "[]"); } catch { return []; }
  });
  const [podcastSeries, setPodcastSeries] = useState(() => {
    try { const s = JSON.parse(localStorage.getItem("podcastNavState") || "null"); return s?.podcastSeries || null; } catch { return null; }
  });
  const [podcastEpisode, setPodcastEpisode] = useState(() => {
    try { const s = JSON.parse(localStorage.getItem("podcastNavState") || "null"); return s?.podcastEpisode || null; } catch { return null; }
  });

  // Persist podcast nav params
  useEffect(() => {
    try { localStorage.setItem("podcastNavState", JSON.stringify({ podcastSeries, podcastEpisode })); } catch {} // eslint-disable-line no-empty
  }, [podcastSeries, podcastEpisode]);

  const markChapterListened = useCallback((bookName, chapterNum) => {
    const key = `${bookName}:${chapterNum}`;
    setListenedChapters(prev => {
      if (prev.includes(key)) return prev;
      const next = [...prev, key];
      try { localStorage.setItem("listenedChapters", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  // Persist narrator preference
  useEffect(() => {
    try { localStorage.setItem("audioNarrator", audioNarrator); } catch {}
  }, [audioNarrator]);

  useEffect(() => {
    try { localStorage.setItem("podcastListenedEpisodes", JSON.stringify(podcastListenedEpisodes)); } catch {}
  }, [podcastListenedEpisodes]);

  // Fetch CDN audio links (BSB has narrated audio via helloao)
  const fetchAudioLinks = useCallback(async (bookName, chNum) => {
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const cacheKey = `BSB:${bookCode}:${chNum}`;
    if (audioLinksCache.current[cacheKey]) return audioLinksCache.current[cacheKey];
    try {
      const res = await fetch(`https://bible.helloao.org/api/BSB/${bookCode}/${chNum}.json`);
      if (!res.ok) return null;
      const data = await res.json();
      const links = data.thisChapterAudioLinks;
      if (links && Object.keys(links).length > 0) {
        audioLinksCache.current[cacheKey] = links;
        return links;
      }
      return null;
    } catch { return null; }
  }, []);

  // Construct Supabase Storage URL for pre-generated HD audio
  const getHdAudioUrl = useCallback((bookName, chNum, translation) => {
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    return `${supabaseUrl}/storage/v1/object/public/${HD_AUDIO_BUCKET}/${translation}/${bookCode}/${chNum}.mp3`;
  }, []);

  // Fetch timestamp data for HD audio verse tracking
  const fetchAudioTimestamps = useCallback(async (bookName, chNum, translation) => {
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const cacheKey = `${translation}:${bookCode}:${chNum}`;
    if (audioTimestampsCache.current[cacheKey]) return audioTimestampsCache.current[cacheKey];
    try {
      const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
      const url = `${supabaseUrl}/storage/v1/object/public/${HD_AUDIO_BUCKET}/${translation}/${bookCode}/${chNum}-ts.json`;
      const res = await fetch(url);
      if (!res.ok) return null;
      const data = await res.json();
      audioTimestampsCache.current[cacheKey] = data;
      return data;
    } catch { return null; }
  }, []);

  // 3-tier audio mode: BSB CDN → HD pre-generated → TTS fallback
  useEffect(() => {
    if (bibleTranslation === "bsb" && book && chapter) {
      // Tier 1: BSB CDN narrated audio
      fetchAudioLinks(book, chapter).then(links => {
        setAudioChapterLinks(links);
        setHdAudioUrl(null);
        setAudioMode(links && Object.keys(links).length > 0 ? "cdn" : "tts");
      });
    } else if (HD_AUDIO_TRANSLATIONS.includes(bibleTranslation) && book && chapter) {
      // Tier 2: Pre-generated HD audio from Supabase Storage (Google Cloud TTS)
      const url = getHdAudioUrl(book, chapter, bibleTranslation);
      setAudioChapterLinks(null);
      setHdAudioUrl(url);
      setAudioMode("hd");
      // Pre-fetch timestamps for verse tracking
      fetchAudioTimestamps(book, chapter, bibleTranslation);
    } else {
      // Tier 3: Browser TTS fallback
      setAudioChapterLinks(null);
      setHdAudioUrl(null);
      setAudioMode("tts");
    }
    // Clear karaoke word highlight on chapter/translation change
    setAudioCurrentWord(null);
  }, [bibleTranslation, book, chapter, fetchAudioLinks, getHdAudioUrl, fetchAudioTimestamps]);

  // ═══ PODCAST ═══

  // ─── Podcast callbacks (minimal — rest lives in PodcastPlayer) ───
  const stopPodcast = useCallback(() => {
    if (podcastAudioRef.current) podcastAudioRef.current.pause();
    setPodcastPlaying(false);
    setPodcastVisible(false);
    setPodcastEpisodeInfo(null);
  }, []);

  const stopBibleAudio = useCallback(() => {
    setAudioPlaying(false);
    setAudioVisible(false);
    setAudioCurrentVerse(null);
    setAudioCurrentWord(null);
    if (typeof window !== "undefined" && window.speechSynthesis) window.speechSynthesis.cancel();
  }, []);

  // ─── Podcast listening streak ───
  const [podcastStreak, setPodcastStreak] = useState(() => {
    try { return JSON.parse(localStorage.getItem("podcastListeningStreak") || "null"); }
    catch { return null; } // eslint-disable-line no-empty
  }); // { current: N, longest: N, lastDate: "YYYY-MM-DD" }

  const updatePodcastStreak = useCallback(() => {
    const today = new Date().toISOString().slice(0, 10);
    setPodcastStreak(prev => {
      const s = prev || { current: 0, longest: 0, lastDate: "" };
      if (s.lastDate === today) return prev; // already counted today
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      const newCurrent = s.lastDate === yesterday ? s.current + 1 : 1;
      const newLongest = Math.max(s.longest, newCurrent);
      const updated = { current: newCurrent, longest: newLongest, lastDate: today };
      try { localStorage.setItem("podcastListeningStreak", JSON.stringify(updated)); } catch {} // eslint-disable-line no-empty
      return updated;
    });
  }, []);

  const markEpisodeListened = useCallback((seriesSlug, episodeNum) => {
    const key = `${seriesSlug}:${episodeNum}`;
    setPodcastListenedEpisodes(prev => {
      if (prev.includes(key)) return prev;
      return [...prev, key];
    });
    updatePodcastStreak();
    if (user) {
      supabase.from("podcast_listening_position").upsert(
        { user_id: user.id, series_slug: seriesSlug, episode_number: episodeNum, completed: true, timestamp_seconds: 0, updated_at: new Date().toISOString() },
        { onConflict: "user_id,series_slug,episode_number" }
      ).then(() => {});
    }
  }, [user, updatePodcastStreak]);

  useEffect(() => {
    try {
      const saved = JSON.parse(localStorage.getItem("learnExploration") || "{}");
      setLearnExploration({
        erasExplored: saved.erasExplored || [],
        propheciesRead: saved.propheciesRead || [],
        archaeologyViewed: saved.archaeologyViewed || [],
        mapsExplored: saved.mapsExplored || {},
      });
    } catch {}
  }, []);

  useEffect(() => {
    supabase.from("hebrew_lessons").select("id, lesson_number").eq("category","grammar").then(({data}) => {
      if (data) {
        const map = {};
        data.forEach(l => { map[l.lesson_number] = l.id; });
        setGrammarLessonIds(map);
      }
    });
  }, []);
  useEffect(() => {
    supabase.from("greek_lessons").select("id, lesson_number").eq("category","grammar").then(({data}) => {
      if (data) {
        const map = {};
        data.forEach(l => { map[l.lesson_number] = l.id; });
        setGreekGrammarLessonIds(map);
      }
    });
  }, []);

  const bookInfo = useMemo(() => book ? BIBLE_BOOKS.find(b => b.name === book) : null, [book]);
  const isOT = bookInfo?.testament === "OT";
  const currentVerse = verses.find(v => v.verse_number === verse);
  const verseNums = verses.map(v => v.verse_number).sort((a,b) => a - b);
  const curIdx = verseNums.indexOf(verse);
  const t = useMemo(() => {
    const key = bookInfo ? (CATEGORY_THEME[bookInfo.category] || "home") : "home";
    return darkMode ? DARK_THEMES[key] : THEMES[key];
  }, [bookInfo, darkMode]);
  const ht = darkMode ? DARK_THEMES.home : THEMES.home;

  // ═══ AUTH ═══
  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null);
      if (session?.user) { loadProfile(session.user.id); loadStreak(session.user.id); loadQuizStreak(session.user.id); loadEarnedBadges(); loadChapterReads(); loadNotesCount(); loadQuizScores(); }
    });
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
      if (session?.user) { loadProfile(session.user.id); loadStreak(session.user.id); loadQuizStreak(session.user.id); loadEarnedBadges(); loadChapterReads(); loadNotesCount(); loadQuizScores(); }
      else { setProfile(null); setStreak(null); setQuizStreak(null); setEarnedBadges({}); badgesLoadedRef.current = false; setChapterReads([]); setNotesCount(0); setQuizScores({}); }
    });
    return () => subscription.unsubscribe();
  }, []);

  // ─── Welcome modal for first-time visitors ───
  useEffect(() => {
    const timer = setTimeout(() => {
      try {
        const hasVisited = localStorage.getItem("lastVisit");
        const dismissed = localStorage.getItem("welcomeDismissed");
        if (!hasVisited && !dismissed && !user) setWelcomeModal(true);
      } catch {}
    }, 600);
    return () => clearTimeout(timer);
  }, [user]);

  // Close welcome modal on successful auth
  useEffect(() => {
    if (user && welcomeModal) setWelcomeModal(false);
  }, [user, welcomeModal]);

  const requireAuth = useCallback(() => {
    if (user) return true;
    setWelcomeModal(true);
    return false;
  }, [user]);

  const loadProfile = async (uid) => {
    const { data } = await supabase.from("user_profiles").select("*").eq("id", uid).single();
    setProfile(data || null);
  };

  const saveProfile = useCallback(async (fields) => {
    if (!user) return { data: null, error: "Not signed in" };
    const { data, error } = await supabase
      .from("user_profiles")
      .upsert({ id: user.id, ...fields }, { onConflict: "id" })
      .select()
      .single();
    if (data) setProfile(data);
    return { data, error };
  }, [user]);

  const loadStreak = async (uid) => {
    const { data } = await supabase
      .from("user_reading_streaks")
      .select("current_streak, longest_streak, last_read_date")
      .eq("user_id", uid)
      .maybeSingle();
    setStreak(data || null);
  };

  const updateStreak = useCallback(async () => {
    if (!user) return;
    const todayDate = new Date().toISOString().split("T")[0];
    if (streak?.last_read_date === todayDate) return;
    if (!streak) {
      const { data } = await supabase
        .from("user_reading_streaks")
        .upsert({ user_id: user.id, current_streak: 1, longest_streak: 1,
                  last_read_date: todayDate, updated_at: new Date().toISOString() },
                 { onConflict: "user_id" })
        .select().single();
      if (data) setStreak(data);
      return;
    }
    const last = new Date(streak.last_read_date + "T00:00:00");
    const today = new Date(todayDate + "T00:00:00");
    const diffDays = Math.round((today - last) / 86400000);
    const newCurrent = diffDays === 1 ? streak.current_streak + 1 : 1;
    const newLongest = Math.max(newCurrent, streak.longest_streak);
    const { data } = await supabase
      .from("user_reading_streaks")
      .upsert({ user_id: user.id, current_streak: newCurrent, longest_streak: newLongest,
                last_read_date: todayDate, updated_at: new Date().toISOString() },
               { onConflict: "user_id" })
      .select().single();
    if (data) setStreak(data);
  }, [user, streak]);

  const handleAuth = async () => {
    setAuthError(""); setAuthLoading(true);
    try {
      if (authMode === "login") {
        const { error } = await supabase.auth.signInWithPassword({ email: authEmail, password: authPass });
        if (error) throw error;
      } else {
        const { error } = await supabase.auth.signUp({
          email: authEmail, password: authPass,
          options: { data: { display_name: authName || "Reader" } }
        });
        if (error) throw error;
      }
      setAuthEmail(""); setAuthPass(""); setAuthName("");
    } catch (e) { setAuthError(e.message); }
    setAuthLoading(false);
  };

  const handleLogout = async () => {
    await supabase.auth.signOut();
    // Clear all user-specific state
    setProfile(null); setCart([]); setEarnedBadges({}); setChapterReads([]);
    setNotesCount(0); setQuizScores({}); setStreak(null);
    setChapterHighlights({}); setChapterNotes({}); setChapterCommunityNotes({});
    setAllHighlights([]); setPrayers([]); setCommunityPrayers([]);
    badgesLoadedRef.current = false;
    // Clear user-specific localStorage keys
    ['cart', 'navState', 'currency'].forEach(k => { try { localStorage.removeItem(k); } catch {} });
  };

  const handleForgotPassword = async () => {
    setAuthLoading(true); setAuthError("");
    const { error } = await supabase.auth.resetPasswordForEmail(authEmail, { redirectTo: window.location.origin });
    if (error) setAuthError(error.message);
    else setAuthForgotSent(true);
    setAuthLoading(false);
  };

  const handleGoogleSignIn = async () => {
    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin }
    });
  };

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

  // ─── Helpers for continuous reading (multi-chapter) ───
  // Sync read from bookCache — returns { verses, meta, wordStudies, crossRefs } or null
  const getChapterFromCache = useCallback((bookName, chNum) => {
    const slug = bookName.toLowerCase().replace(/\s+/g, '-');
    const bookData = bookCache.current[slug];
    if (!bookData) return null;
    const ch = bookData.chapters[String(chNum)];
    if (!ch) return null;
    return {
      verses: ch.verses || [],
      meta: ch.meta ? {
        overview: ch.meta.overview || null,
        theme: ch.meta.theme || null,
        key_word_original: ch.meta.keyWordOriginal || null,
        key_word_meaning: ch.meta.keyWordMeaning || null,
        outline: ch.meta.outline ? JSON.stringify(ch.meta.outline) : null,
      } : null,
      wordStudies: ch.wordStudies || {},
      crossRefs: ch.crossRefs || {},
    };
  }, []);

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

  // ═══ PRAYER JOURNAL ═══
  const loadPrayers = useCallback(async () => {
    if (!user) return;
    setPrayerLoading(true);
    const { data } = await supabase.from("prayer_journal").select("*").eq("user_id", user.id).order("created_at", { ascending: false });
    setPrayers(data || []);
    setPrayerLoading(false);
  }, [user]);

  useEffect(() => { if (prayerModal && user) loadPrayers(); }, [prayerModal, user, loadPrayers]);

  const addPrayer = async () => {
    if (!user || !prayerText.trim()) return;
    const title = (prayerTitle || "Prayer").slice(0, 200);
    const text = prayerText.slice(0, 2000);
    // Cooldown: 30s between submissions
    const now = Date.now();
    if (now - lastPrayerSubmitRef.current < 30000) { setCooldownActive(true); return; }
    lastPrayerSubmitRef.current = now;
    const entry = {
      user_id: user.id, title, prayer_text: text,
      verse_id: verseIdMap.current[verse] || null,
      book_name: book || null, chapter_number: chapter || null, verse_number: verse || null,
    };
    await supabase.from("prayer_journal").insert(entry);
    setPrayerTitle(""); setPrayerText("");
    loadPrayers();
  };

  const togglePrayerAnswered = async (id, current) => {
    await supabase.from("prayer_journal").update({ is_answered: !current }).eq("id", id);
    loadPrayers();
  };

  const deletePrayer = async (id) => {
    await supabase.from("prayer_journal").delete().eq("id", id);
    loadPrayers();
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

  useEffect(() => { if ((view === "account" || view === "prayer-home") && user) loadPrayers(); }, [view, user, loadPrayers]);
  useEffect(() => {
    if ((view === "account" || view === "highlights") && user) {
      loadAllHighlights(); loadAllNotes();
      journalDirty.current = false;
    }
  }, [view, user, loadAllHighlights, loadAllNotes]);

  // ═══ COMMUNITY PRAYER ═══
  const loadCommunityPrayers = useCallback(async () => {
    setCommunityPrayersLoading(true);
    let query = supabase.from("community_prayers_public").select("*").order("created_at", { ascending: false }).limit(50);
    if (communityPrayerCategory !== "all") query = query.eq("category", communityPrayerCategory);
    const { data } = await query;
    if (!data) { setCommunityPrayers([]); setCommunityPrayersLoading(false); return; }

    // Fetch display names for non-anonymous prayers
    const userIds = [...new Set(data.filter(p => !p.is_anonymous).map(p => p.user_id))];
    let nameMap = {};
    if (userIds.length > 0) {
      const { data: profiles } = await supabase.from("user_profiles").select("id, display_name").in("id", userIds);
      if (profiles) profiles.forEach(p => { nameMap[p.id] = p.display_name; });
    }

    // Fetch reaction counts
    const prayerIds = data.map(p => p.id);
    let reactionMap = {};
    if (prayerIds.length > 0) {
      const { data: reactions } = await supabase.from("prayer_reactions").select("prayer_id, reaction_type").in("prayer_id", prayerIds);
      if (reactions) {
        reactions.forEach(r => {
          if (!reactionMap[r.prayer_id]) reactionMap[r.prayer_id] = { praying: 0, heart: 0, amen: 0 };
          reactionMap[r.prayer_id][r.reaction_type]++;
        });
      }
    }

    // Fetch user's own reactions
    let myReactMap = {};
    if (user && prayerIds.length > 0) {
      const { data: myReacts } = await supabase.from("prayer_reactions").select("prayer_id, reaction_type").eq("user_id", user.id).in("prayer_id", prayerIds);
      if (myReacts) {
        myReacts.forEach(r => {
          if (!myReactMap[r.prayer_id]) myReactMap[r.prayer_id] = {};
          myReactMap[r.prayer_id][r.reaction_type] = true;
        });
      }
    }
    setUserReactions(myReactMap);

    const enriched = data.map(p => ({
      ...p,
      user_display_name: nameMap[p.user_id] || null,
      reaction_counts: reactionMap[p.id] || { praying: 0, heart: 0, amen: 0 },
    }));
    setCommunityPrayers(enriched);
    setCommunityPrayersLoading(false);
  }, [communityPrayerCategory, user]);

  useEffect(() => { if (view === "prayer-home") loadCommunityPrayers(); }, [view, loadCommunityPrayers]);

  const addCommunityPrayer = async ({ title, body, category, isAnonymous }) => {
    if (!user || !body.trim()) return;
    const safeTitle = (title || "Prayer Request").slice(0, 200);
    const safeBody = body.slice(0, 2000);
    // Cooldown: 30s between submissions
    const now = Date.now();
    if (now - lastPrayerSubmitRef.current < 30000) { setCooldownActive(true); return; }
    lastPrayerSubmitRef.current = now;
    await supabase.from("community_prayers").insert({
      user_id: user.id, title: safeTitle, body: safeBody, category, is_anonymous: isAnonymous,
    });
    setCooldownActive(false);
    loadCommunityPrayers();
  };

  const reportCommunityPrayer = async (prayerId, reason, details) => {
    if (!user) return;
    await supabase.from("prayer_reports").insert({
      prayer_id: prayerId, reporter_id: user.id, reason, details: details ? details.slice(0, 500) : null,
    });
  };

  const deleteCommunityPrayer = async (id) => {
    await supabase.from("community_prayers").delete().eq("id", id);
    loadCommunityPrayers();
  };

  const markCommunityPrayerAnswered = async (id) => {
    await supabase.from("community_prayers").update({
      is_answered: true, answered_at: new Date().toISOString(), updated_at: new Date().toISOString(),
    }).eq("id", id);
    setJustAnsweredId(id);
    setTimeout(() => setJustAnsweredId(null), 3000);
    loadCommunityPrayers();
  };

  const checkPrayerExpiry = useCallback(async () => {
    if (!user) return;
    const now = new Date().toISOString();
    // Find user's prayers that are expired but not yet prompted
    const { data: expired } = await supabase.from("community_prayers")
      .select("*").eq("user_id", user.id).eq("is_answered", false)
      .lt("expires_at", now).eq("expiry_prompted", false);
    if (expired && expired.length > 0) {
      setExpiringPrayers(expired);
      // Mark them as prompted
      const ids = expired.map(p => p.id);
      await supabase.from("community_prayers").update({
        expiry_prompted: true, expiry_prompted_at: now, updated_at: now,
      }).in("id", ids);
    }
    // Auto-delete prayers where prompt was sent 48h ago with no response
    const cutoff = new Date(Date.now() - 48 * 60 * 60 * 1000).toISOString();
    await supabase.from("community_prayers").delete()
      .eq("user_id", user.id).eq("is_answered", false)
      .eq("expiry_prompted", true).lt("expiry_prompted_at", cutoff);
  }, [user]);

  useEffect(() => { if (view === "prayer-home" && user) checkPrayerExpiry(); }, [view, user, checkPrayerExpiry]);

  const keepCommunityPrayer = async (id) => {
    // Reset expiry for another 60 days
    const newExpiry = new Date(Date.now() + 60 * 24 * 60 * 60 * 1000).toISOString();
    await supabase.from("community_prayers").update({
      expires_at: newExpiry, expiry_prompted: false, expiry_prompted_at: null,
      updated_at: new Date().toISOString(),
    }).eq("id", id);
    setExpiringPrayers(prev => prev.filter(p => p.id !== id));
    loadCommunityPrayers();
  };

  // ─── Birthday community users ───
  const [birthdayUsers, setBirthdayUsers] = useState([]);

  const loadBirthdayUsers = useCallback(async () => {
    try {
      const today = new Date();
      const mmdd = `-${String(today.getMonth() + 1).padStart(2, "0")}-${String(today.getDate()).padStart(2, "0")}`;
      const { data } = await supabase
        .from("user_profiles")
        .select("id, display_name, nickname, full_name")
        .eq("share_birthday", true)
        .filter("date_of_birth::text", "like", `%${mmdd}`);
      setBirthdayUsers(data || []);
    } catch { setBirthdayUsers([]); }
  }, []);

  useEffect(() => { if (view === "prayer-home" && user) loadBirthdayUsers(); }, [view, user, loadBirthdayUsers]);

  const toggleReaction = async (prayerId, reactionType) => {
    if (!user) return;
    const existing = userReactions[prayerId]?.[reactionType];
    if (existing) {
      await supabase.from("prayer_reactions").delete().eq("prayer_id", prayerId).eq("user_id", user.id).eq("reaction_type", reactionType);
    } else {
      await supabase.from("prayer_reactions").insert({ prayer_id: prayerId, user_id: user.id, reaction_type: reactionType });
    }
    // Optimistic update
    setUserReactions(prev => {
      const updated = { ...prev };
      if (!updated[prayerId]) updated[prayerId] = {};
      if (existing) { delete updated[prayerId][reactionType]; }
      else { updated[prayerId][reactionType] = true; }
      return updated;
    });
    setCommunityPrayers(prev => prev.map(p => {
      if (p.id !== prayerId) return p;
      const counts = { ...p.reaction_counts };
      counts[reactionType] = (counts[reactionType] || 0) + (existing ? -1 : 1);
      return { ...p, reaction_counts: counts };
    }));
    // Record prayer activity for streak (only on adding, not removing)
    if (!existing) recordPrayerActivity();
  };

  // ═══ PRAYER STREAK ═══
  const recordPrayerActivity = useCallback(() => {
    try {
      const today = new Date().toISOString().slice(0, 10);
      const lastDate = localStorage.getItem("prayerStreakLastDate");
      let streak = parseInt(localStorage.getItem("prayerStreakCount") || "0", 10);
      if (lastDate === today) return; // already counted today
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      streak = lastDate === yesterday ? streak + 1 : 1;
      localStorage.setItem("prayerStreakCount", String(streak));
      localStorage.setItem("prayerStreakLastDate", today);
      setPrayerStreak(streak);
    } catch {}
  }, []);

  // Load prayer streak on mount
  useEffect(() => {
    try {
      const streak = parseInt(localStorage.getItem("prayerStreakCount") || "0", 10);
      const lastDate = localStorage.getItem("prayerStreakLastDate");
      const today = new Date().toISOString().slice(0, 10);
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      // If last activity was before yesterday, streak is broken
      if (lastDate && lastDate !== today && lastDate !== yesterday) {
        setPrayerStreak(0);
      } else {
        setPrayerStreak(streak);
      }
    } catch {}
  }, []);

  // ═══ PRAYER OF THE DAY ═══
  const prayerOfTheDay = useMemo(() => {
    if (!communityPrayers || communityPrayers.length === 0) return null;
    const active = communityPrayers.filter(p => !p.is_answered);
    if (active.length === 0) return null;
    const now = Date.now();
    const scored = active.map(p => {
      const rc = p.reaction_counts || { praying: 0, heart: 0, amen: 0 };
      const daysOld = Math.floor((now - new Date(p.created_at).getTime()) / 86400000);
      const score = (rc.praying * 3) + (rc.heart * 2) + (rc.amen) + Math.max(0, 7 - daysOld);
      return { ...p, score };
    }).sort((a, b) => b.score - a.score).slice(0, 5);
    const dayOfYear = Math.floor((now - new Date(new Date().getFullYear(), 0, 0)) / 86400000);
    return scored[dayOfYear % scored.length] || scored[0];
  }, [communityPrayers]);

  // ═══ PRAYER CLOCK ═══
  const loadSlotCoverage = useCallback(async () => {
    const dayOfWeek = new Date().getDay();
    const { data } = await supabase.rpc("get_prayer_coverage", { target_day: dayOfWeek });
    setSlotCoverage(data || []);
  }, []);

  const loadMySlots = useCallback(async () => {
    if (!user) return;
    setSlotsLoading(true);
    const { data } = await supabase.from("prayer_slots").select("*").eq("user_id", user.id).eq("is_active", true).order("slot_hour");
    setMySlots(data || []);
    setSlotsLoading(false);
  }, [user]);

  useEffect(() => {
    if (view === "prayer-home" && prayerTab === "clock") {
      loadSlotCoverage();
      if (user) loadMySlots();
    }
  }, [view, prayerTab, user, loadSlotCoverage, loadMySlots]);

  const addPrayerSlot = async ({ hour, minute, duration, frequency, customDays }) => {
    if (!user) return;
    const tz = Intl.DateTimeFormat().resolvedOptions().timeZone;
    await supabase.from("prayer_slots").insert({
      user_id: user.id, slot_hour: hour, slot_minute: minute,
      duration_minutes: duration, frequency, custom_days: customDays || [],
      timezone: tz,
    });
    loadMySlots();
    loadSlotCoverage();
  };

  const deletePrayerSlot = async (id) => {
    await supabase.from("prayer_slots").delete().eq("id", id);
    loadMySlots();
    loadSlotCoverage();
  };

  // ═══ GAMIFICATION ═══
  const loadEarnedBadges = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_badges").select("badge_id, earned_at").eq("user_id", user.id);
    const map = {};
    if (data) data.forEach(b => { map[b.badge_id] = { earned_at: b.earned_at }; });
    badgeAwardRef.current = map;
    setEarnedBadges(map);
    badgesLoadedRef.current = true;
  }, [user]);

  const loadChapterReads = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_chapter_reads").select("book_name, chapter_number").eq("user_id", user.id);
    setChapterReads(data || []);
  }, [user]);

  const loadNotesCount = useCallback(async () => {
    if (!user) return;
    const { count } = await supabase.from("user_notes").select("id", { count: "exact", head: true }).eq("user_id", user.id);
    setNotesCount(count || 0);
  }, [user]);

  const markChapterRead = useCallback(async (bookName, chapterNum) => {
    if (!user) return;
    const exists = chapterReads.some(r => r.book_name === bookName && r.chapter_number === chapterNum);
    if (exists) return;
    await supabase.from("user_chapter_reads").upsert(
      { user_id: user.id, book_name: bookName, chapter_number: chapterNum },
      { onConflict: "user_id,book_name,chapter_number" }
    );
    setChapterReads(prev => [...prev, { book_name: bookName, chapter_number: chapterNum }]);
  }, [user, chapterReads]);

  // ─── Quiz functions ───
  const loadQuizScores = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_quiz_scores")
      .select("book_name, chapter_number, difficulty, score, total_questions, percentage, attempted_at")
      .eq("user_id", user.id).order("attempted_at", { ascending: false });
    if (data) {
      const map = {};
      data.forEach(q => {
        const key = `${q.book_name}-${q.chapter_number}`;
        if (!map[key]) map[key] = [];
        map[key].push(q);
      });
      setQuizScores(map);
    }
  }, [user]);

  const quizCache = useRef({});
  const loadQuizQuestions = useCallback(async (bookName, chNum, difficulty) => {
    setQuizLoading(true);
    try {
      const slug = bookName.toLowerCase().replace(/\s+/g, '-');
      let quizData = quizCache.current[slug];
      if (!quizData) {
        const res = await fetch(`/data/quizzes/${slug}.json`);
        if (res.ok) { quizData = await res.json(); quizCache.current[slug] = quizData; }
      }
      if (quizData) {
        setQuizQuestions(quizData[String(chNum)]?.[difficulty] || []);
        setQuizLoading(false);
        return;
      }
    } catch {}
    // Fallback to Supabase
    const { data } = await supabase.from("chapter_quizzes")
      .select("*").eq("book_name", bookName).eq("chapter_number", chNum)
      .eq("difficulty", difficulty).order("question_number");
    setQuizQuestions(data || []);
    setQuizLoading(false);
  }, []);

  const submitQuizScore = useCallback(async (bookName, chNum, difficulty, score, total) => {
    if (!user) return;
    const percentage = Math.round((score / total) * 100);
    await supabase.from("user_quiz_scores").insert({
      user_id: user.id, book_name: bookName, chapter_number: chNum,
      difficulty, score, total_questions: total, percentage,
    });
    setQuizScores(prev => {
      const key = `${bookName}-${chNum}`;
      const entry = { book_name: bookName, chapter_number: chNum, difficulty, score, total_questions: total, percentage, attempted_at: new Date().toISOString() };
      return { ...prev, [key]: [entry, ...(prev[key] || [])] };
    });
  }, [user]);

  // ─── Daily Quiz ───
  // Build flat array of all quiz-able {book, chapter} pairs for deterministic daily rotation
  const dailyQuizPool = useMemo(() => {
    const pool = [];
    QUIZ_BOOKS.forEach(bookName => {
      const bookInfo = BIBLE_BOOKS.find(b => b.name === bookName);
      if (bookInfo) {
        for (let ch = 1; ch <= bookInfo.chapters; ch++) pool.push({ book: bookName, chapter: ch });
      }
    });
    return pool;
  }, []);

  const getDailyQuiz = useCallback(() => {
    if (!dailyQuizPool.length) return null;
    const now = new Date();
    const start = new Date(now.getFullYear(), 0, 0);
    const dayOfYear = Math.floor((now - start) / 86400000);
    return dailyQuizPool[dayOfYear % dailyQuizPool.length];
  }, [dailyQuizPool]);

  // ─── Quiz Mastery ───
  // Per-book mastery: % of chapters with ≥80% score at ANY difficulty
  const quizMastery = useMemo(() => {
    const mastery = {};
    QUIZ_BOOKS.forEach(bookName => {
      const bookInfo = BIBLE_BOOKS.find(b => b.name === bookName);
      if (!bookInfo) return;
      const totalChs = bookInfo.chapters;
      let masteredCount = 0;
      for (let ch = 1; ch <= totalChs; ch++) {
        const key = `${bookName}-${ch}`;
        const chScores = quizScores[key] || [];
        if (chScores.some(s => s.percentage >= 80)) masteredCount++;
      }
      const pct = totalChs > 0 ? Math.round((masteredCount / totalChs) * 100) : 0;
      mastery[bookName] = { mastered: masteredCount, total: totalChs, percentage: pct };
    });
    return mastery;
  }, [quizScores]);

  const dailyQuizCompleted = useMemo(() => {
    if (!quizStreak?.last_quiz_date) return false;
    return quizStreak.last_quiz_date === new Date().toISOString().split("T")[0];
  }, [quizStreak]);

  const loadQuizStreak = async (uid) => {
    const { data } = await supabase
      .from("user_quiz_streaks")
      .select("current_streak, longest_streak, last_quiz_date, total_quizzes_completed")
      .eq("user_id", uid)
      .maybeSingle();
    setQuizStreak(data || null);
  };

  const updateQuizStreak = useCallback(async () => {
    if (!user) return;
    const todayDate = new Date().toISOString().split("T")[0];
    if (quizStreak?.last_quiz_date === todayDate) return; // already counted today
    if (!quizStreak) {
      const { data } = await supabase
        .from("user_quiz_streaks")
        .upsert({ user_id: user.id, current_streak: 1, longest_streak: 1,
                  last_quiz_date: todayDate, total_quizzes_completed: 1,
                  updated_at: new Date().toISOString() },
                 { onConflict: "user_id" })
        .select().single();
      if (data) setQuizStreak(data);
      return;
    }
    const last = new Date(quizStreak.last_quiz_date + "T00:00:00");
    const today = new Date(todayDate + "T00:00:00");
    const diffDays = Math.round((today - last) / 86400000);
    const newCurrent = diffDays === 1 ? quizStreak.current_streak + 1 : 1;
    const newLongest = Math.max(newCurrent, quizStreak.longest_streak);
    const newTotal = (quizStreak.total_quizzes_completed || 0) + 1;
    const { data } = await supabase
      .from("user_quiz_streaks")
      .upsert({ user_id: user.id, current_streak: newCurrent, longest_streak: newLongest,
                last_quiz_date: todayDate, total_quizzes_completed: newTotal,
                updated_at: new Date().toISOString() },
               { onConflict: "user_id" })
      .select().single();
    if (data) setQuizStreak(data);
  }, [user, quizStreak]);

  const trackLearnExploration = useCallback((type, id) => {
    setLearnExploration(prev => {
      const arr = prev[type] || [];
      if (arr.includes(id)) return prev;
      const updated = { ...prev, [type]: [...arr, id] };
      try { localStorage.setItem("learnExploration", JSON.stringify(updated)); } catch {}
      return updated;
    });
  }, []);

  const badgeAwardRef = useRef(earnedBadges);
  const badgesLoadedRef = useRef(false);
  useEffect(() => { badgeAwardRef.current = earnedBadges; }, [earnedBadges]);

  const awardBadge = useCallback(async (badgeId) => {
    if (!user || badgeAwardRef.current[badgeId]) return;
    // Optimistic: mark as earned immediately to prevent duplicate calls
    setEarnedBadges(prev => {
      if (prev[badgeId]) return prev;
      return { ...prev, [badgeId]: { earned_at: new Date().toISOString() } };
    });
    badgeAwardRef.current = { ...badgeAwardRef.current, [badgeId]: { earned_at: new Date().toISOString() } };
    await supabase.from("user_badges").upsert(
      { user_id: user.id, badge_id: badgeId },
      { onConflict: "user_id,badge_id" }
    );
    const badge = BADGES.find(b => b.id === badgeId);
    if (badge) setBadgeToast(badge);
  }, [user]);

  const checkBadges = useCallback(() => {
    if (!user || !badgesLoadedRef.current) return;
    const earned = badgeAwardRef.current;

    // Bible badges
    const readCount = chapterReads.length;
    if (readCount >= 1 && !earned.first_light) awardBadge("first_light");
    if (readCount >= 10 && !earned.bookworm) awardBadge("bookworm");
    if (readCount >= 50 && !earned.scholar) awardBadge("scholar");

    const hlCount = allHighlights.length;
    if (hlCount >= 10 && !earned.highlighter) awardBadge("highlighter");

    const uniqueColors = new Set(allHighlights.map(h => h.highlight_color).filter(Boolean));
    if (uniqueColors.size >= HIGHLIGHT_COLORS.length && !earned.color_palette) awardBadge("color_palette");

    if (notesCount >= 10 && !earned.scribe) awardBadge("scribe");

    const bookmarkCount = allHighlights.filter(h => h.is_bookmarked).length;
    if (bookmarkCount >= 25 && !earned.bookmarker) awardBadge("bookmarker");

    const journalTotal = hlCount + notesCount;
    if (journalTotal >= 25 && !earned.journal_keeper) awardBadge("journal_keeper");
    if (journalTotal >= 100 && !earned.journal_master) awardBadge("journal_master");

    if ((streak?.current_streak >= 30 || streak?.longest_streak >= 30) && !earned.devoted) awardBadge("devoted");

    // Hebrew badges
    const hebCompleted = Object.values(hebrewProgress).filter(p => p.completed);
    if (hebCompleted.length >= 1 && !earned.aleph) awardBadge("aleph");
    const hebAlphabetTotal = Object.keys(hebrewProgress).length > 0 ? hebrewLessons.filter(l => l.category === "alphabet").length : 0;
    const hebAlphabetDone = hebCompleted.filter(p => {
      const lesson = hebrewLessons.find(l => l.id === Number(Object.keys(hebrewProgress).find(k => hebrewProgress[k] === p)));
      return lesson?.category === "alphabet";
    }).length;
    if (hebAlphabetTotal > 0 && hebAlphabetDone >= hebAlphabetTotal && !earned.aleph_bet) awardBadge("aleph_bet");
    if (hebCompleted.length >= 22 && !earned.hebrew_scholar) awardBadge("hebrew_scholar");
    if (hebCompleted.some(p => p.score >= 100) && !earned.perfect_hebrew) awardBadge("perfect_hebrew");

    // Greek badges
    const greekCompleted = Object.values(greekProgress).filter(p => p.completed);
    if (greekCompleted.length >= 1 && !earned.alpha) awardBadge("alpha");
    if (greekCompleted.length >= 24 && !earned.alpha_omega) awardBadge("alpha_omega");
    if (greekCompleted.length >= 50 && !earned.greek_scholar) awardBadge("greek_scholar");
    if (greekCompleted.some(p => p.score >= 100) && !earned.perfect_greek) awardBadge("perfect_greek");

    // Learn badges
    const erasCount = learnExploration.erasExplored?.length || 0;
    if (erasCount >= 1 && !earned.time_traveler) awardBadge("time_traveler");
    if (erasCount >= 14 && !earned.historian) awardBadge("historian");
    const prophecyCount = learnExploration.propheciesRead?.length || 0;
    if (prophecyCount >= 10 && !earned.prophet) awardBadge("prophet");
    const archCount = learnExploration.archaeologyViewed?.length || 0;
    if (archCount >= 5 && !earned.archaeologist) awardBadge("archaeologist");
    // Maps badges (read from dedicated localStorage)
    let mapsExp = {};
    try { mapsExp = JSON.parse(localStorage.getItem("mapsExplored") || "{}"); } catch {}
    const totalMapLocs = Object.values(mapsExp).reduce((sum, arr) => sum + (arr?.length || 0), 0);
    if (totalMapLocs >= 1 && !earned.map_explorer) awardBadge("map_explorer");
    if (totalMapLocs >= 50 && !earned.cartographer) awardBadge("cartographer");
    if (totalMapLocs >= 150 && !earned.atlas_master) awardBadge("atlas_master");
    // Timeline Book badges (read from dedicated localStorage)
    let tlViewedBooks = [];
    let tlViewedGenres = [];
    let tlStreak = 0;
    try { tlViewedBooks = JSON.parse(localStorage.getItem("timeline_viewed_books") || "[]"); } catch {}
    try { tlViewedGenres = JSON.parse(localStorage.getItem("timeline_viewed_genres") || "[]"); } catch {}
    try { tlStreak = parseInt(localStorage.getItem("timeline_visit_streak") || "0", 10); } catch {}
    if (tlViewedBooks.length >= 10 && !earned.timeline_explorer) awardBadge("timeline_explorer");
    if (tlViewedBooks.length >= 66 && !earned.timeline_complete) awardBadge("timeline_complete");
    if (tlStreak >= 7 && !earned.timeline_streak) awardBadge("timeline_streak");
    if (tlViewedGenres.length >= 7 && !earned.timeline_scholar) awardBadge("timeline_scholar");
    // Apologetics badges
    const apolCount = learnExploration.apologeticsStudied?.length || 0;
    if (apolCount >= 1 && !earned.first_defense) awardBadge("first_defense");
    if (apolCount >= 20 && !earned.master_apologist) awardBadge("master_apologist");

    // Prayer badges
    const totalReactions = Object.values(userReactions).reduce((sum, r) => sum + Object.keys(r).length, 0);
    if (totalReactions >= 10 && !earned.intercessor) awardBadge("intercessor");
    try {
      const slotsCompleted = parseInt(localStorage.getItem("prayerSlotsCompleted") || "0", 10);
      if (slotsCompleted >= 5 && !earned.prayer_warrior) awardBadge("prayer_warrior");
    } catch {}
    const myPrayers = communityPrayers.filter(p => p.user_id === user.id);
    if (myPrayers.some(p => p.is_answered && p.testimony_text) && !earned.testimony) awardBadge("testimony");
    if (myPrayers.length >= 5 && !earned.community_builder) awardBadge("community_builder");

    // Community badges — birthday
    if (isBirthdayToday && profile?.date_of_birth && !earned.birthday_blessed) awardBadge("birthday_blessed");

    // Quiz badges
    const allScores = Object.values(quizScores).flat();
    if (allScores.length >= 1 && !earned.quiz_starter) awardBadge("quiz_starter");
    if (allScores.length >= 10 && !earned.quiz_whiz) awardBadge("quiz_whiz");
    if (allScores.length >= 50 && !earned.quiz_master) awardBadge("quiz_master");
    if (allScores.some(s => s.percentage >= 100) && !earned.perfect_score) awardBadge("perfect_score");
    // Quiz streak badges
    const qs = quizStreak?.longest_streak || quizStreak?.current_streak || 0;
    if (qs >= 7 && !earned.daily_scholar) awardBadge("daily_scholar");
    if (qs >= 30 && !earned.devoted_student) awardBadge("devoted_student");
    if (qs >= 100 && !earned.bible_warrior) awardBadge("bible_warrior");
    // Mastery badges
    const m = quizMastery;
    const pent = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy"];
    const gosp = ["Matthew","Mark","Luke","John"];
    const epist = ["Romans","1 Corinthians","2 Corinthians","Galatians","Ephesians","Philippians","Colossians","1 Thessalonians","2 Thessalonians","1 Timothy","2 Timothy","Titus","Philemon","Hebrews","James","1 Peter","2 Peter","1 John","2 John","3 John","Jude"];
    if (pent.every(b => (m[b]?.percentage || 0) >= 80) && !earned.pentateuch_scholar) awardBadge("pentateuch_scholar");
    if (gosp.every(b => (m[b]?.percentage || 0) >= 80) && !earned.gospel_expert) awardBadge("gospel_expert");
    if (epist.every(b => (m[b]?.percentage || 0) >= 80) && !earned.epistle_master) awardBadge("epistle_master");
    if (QUIZ_BOOKS.every(b => (m[b]?.percentage || 0) >= 80) && !earned.bible_scholar) awardBadge("bible_scholar");

    // Audio badges
    const listenCount = listenedChapters.length;
    if (listenCount >= 1 && !earned.first_listen) awardBadge("first_listen");
    if (listenCount >= 10 && !earned.audio_scholar) awardBadge("audio_scholar");
    if (listenCount >= 50 && !earned.audio_marathon) awardBadge("audio_marathon");

    // Podcast badges
    const podcastCount = podcastListenedEpisodes.length;
    if (podcastCount >= 1 && !earned.first_listen_podcast) awardBadge("first_listen_podcast");
    if (podcastCount >= 7 && !earned.podcast_regular) awardBadge("podcast_regular");
    if (podcastCount >= 30 && !earned.podcast_devotee) awardBadge("podcast_devotee");
    if (podcastStreak?.current >= 7 && !earned.podcast_streak_7) awardBadge("podcast_streak_7");
    if (podcastStreak?.current >= 30 && !earned.podcast_streak_30) awardBadge("podcast_streak_30");
  }, [user, chapterReads, allHighlights, notesCount, streak, hebrewProgress, hebrewLessons,
      greekProgress, learnExploration, userReactions, communityPrayers, quizScores, isBirthdayToday, profile, listenedChapters, podcastListenedEpisodes, podcastStreak, awardBadge]);

  useEffect(() => { checkBadges(); }, [checkBadges]);

  // ═══ HEBREW LEARNING ═══
  const loadHebrewLessons = useCallback(async (cat = 'alphabet') => {
    const cacheKey = `lessons-${cat}`;
    if (hebrewCache.current[cacheKey]) { setHebrewLessons(hebrewCache.current[cacheKey]); return; }
    const { data } = await supabase.from("hebrew_lessons").select("*").eq("category", cat).order("lesson_number");
    if (data) { hebrewCache.current[cacheKey] = data; setHebrewLessons(data); }
  }, []);

  const loadHebrewLesson = useCallback(async (lessonId) => {
    const cacheKey = `lesson-${lessonId}`;
    if (hebrewCache.current[cacheKey]) {
      const cached = hebrewCache.current[cacheKey];
      setHebrewLesson(cached.lesson); setHebrewAlphabet(cached.alphabet); setHebrewVocab(cached.vocab);
      return;
    }
    const { data: lesson } = await supabase.from("hebrew_lessons").select("*").eq("id", lessonId).single();
    const { data: alphabet } = await supabase.from("hebrew_alphabet").select("*").eq("lesson_id", lessonId).single();
    const { data: vocab } = await supabase.from("hebrew_vocabulary").select("*").eq("lesson_id", lessonId).order("id");
    if (lesson) setHebrewLesson(lesson);
    if (alphabet) setHebrewAlphabet(alphabet);
    setHebrewVocab(vocab || []);
    hebrewCache.current[cacheKey] = { lesson, alphabet, vocab: vocab || [] };
  }, []);

  const loadHebrewProgress = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_hebrew_progress").select("*").eq("user_id", user.id);
    if (data) {
      const map = {}; data.forEach(p => { map[p.lesson_id] = p; });
      setHebrewProgress(map);
    }
  }, [user]);

  const markHebrewComplete = async (lessonId, score) => {
    if (!user) return;
    const existing = hebrewProgress[lessonId];
    if (existing) {
      await supabase.from("user_hebrew_progress").update({ completed: true, score: score || existing.score, completed_at: new Date().toISOString() }).eq("id", existing.id);
    } else {
      await supabase.from("user_hebrew_progress").insert({ user_id: user.id, lesson_id: lessonId, completed: true, score, completed_at: new Date().toISOString() });
    }
    loadHebrewProgress();
  };

  useEffect(() => { if (view === "hebrew-home") { loadHebrewLessons(hebrewCategory); loadHebrewProgress(); } }, [view, hebrewCategory, loadHebrewLessons, loadHebrewProgress]);
  useEffect(() => { if (view === "hebrew-lesson" && hebrewLesson?.id) loadHebrewLesson(hebrewLesson.id); }, [view]);

  // ═══ GREEK LEARNING ═══
  const loadGreekLessons = useCallback(async (cat = 'alphabet') => {
    const cacheKey = `greek-lessons-${cat}`;
    if (greekCache.current[cacheKey]) { setGreekLessons(greekCache.current[cacheKey]); return; }
    const { data } = await supabase.from("greek_lessons").select("*").eq("category", cat).order("lesson_number");
    if (data) { greekCache.current[cacheKey] = data; setGreekLessons(data); }
  }, []);

  const loadGreekLesson = useCallback(async (lessonId) => {
    const cacheKey = `greek-lesson-${lessonId}`;
    if (greekCache.current[cacheKey]) {
      const cached = greekCache.current[cacheKey];
      setGreekLesson(cached.lesson); setGreekAlphabet(cached.alphabet); setGreekVocab(cached.vocab);
      return;
    }
    const { data: lesson } = await supabase.from("greek_lessons").select("*").eq("id", lessonId).single();
    const { data: alphabet } = await supabase.from("greek_alphabet").select("*").eq("lesson_id", lessonId).single();
    const { data: vocab } = await supabase.from("greek_vocabulary").select("*").eq("lesson_id", lessonId).order("id");
    if (lesson) setGreekLesson(lesson);
    if (alphabet) setGreekAlphabet(alphabet);
    setGreekVocab(vocab || []);
    greekCache.current[cacheKey] = { lesson, alphabet, vocab: vocab || [] };
  }, []);

  const loadGreekProgress = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_greek_progress").select("*").eq("user_id", user.id);
    if (data) {
      const map = {}; data.forEach(p => { map[p.lesson_id] = p; });
      setGreekProgress(map);
    }
  }, [user]);

  const markGreekComplete = async (lessonId, score) => {
    if (!user) return;
    const existing = greekProgress[lessonId];
    if (existing) {
      await supabase.from("user_greek_progress").update({ completed: true, score: score || existing.score, completed_at: new Date().toISOString() }).eq("id", existing.id);
    } else {
      await supabase.from("user_greek_progress").insert({ user_id: user.id, lesson_id: lessonId, completed: true, score, completed_at: new Date().toISOString() });
    }
    loadGreekProgress();
  };

  useEffect(() => { if (view === "greek-home") { loadGreekLessons(greekCategory); loadGreekProgress(); } }, [view, greekCategory, loadGreekLessons, loadGreekProgress]);

  // ═══ TIMELINE LOADERS ═══
  const loadTimelineEras = useCallback(async () => {
    setTimelineLoading(true);
    const { data } = await supabase.from("bible_timeline_eras").select("*").order("sort_order");
    if (data) setTimelineEras(data);
    setTimelineLoading(false);
  }, []);

  const loadAllTimelineEvents = useCallback(async () => {
    if (timelineAllEvents.length > 0) return;
    const { data } = await supabase.from("bible_timeline_events").select("*").order("sort_order");
    if (data) setTimelineAllEvents(data);
  }, [timelineAllEvents.length]);

  const loadTimelineEvents = useCallback(async (eraKey) => {
    setTimelineEventsLoading(true);
    const { data } = await supabase.from("bible_timeline_events").select("*").eq("era_key", eraKey).order("sort_order");
    if (data) setTimelineEvents(data);
    setTimelineEventsLoading(false);
  }, []);

  useEffect(() => { if (view === "timeline-home" || view === "timeline-era") loadTimelineEras(); }, [view, loadTimelineEras]);
  useEffect(() => { if (view === "timeline-era" && timelineSelectedEra) loadTimelineEvents(timelineSelectedEra.era_key); }, [view, timelineSelectedEra, loadTimelineEvents]);

  // ═══ DB CONNECTIVITY CHECK (user data only — content served from static JSON) ═══
  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data?.length > 0 && !error) setDbLive(true);
      } catch { setDbLive(false); }
    })();
  }, []);

  // ─── Fetch translated verse text from CDN and overlay onto verses ───
  const fetchTranslatedVerses = useCallback(async (bookName, chNum, translationId) => {
    if (translationId === "kjv") return null;
    const tDef = BIBLE_TRANSLATIONS.find(t => t.id === translationId);
    if (!tDef?.cdnId) return null;
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const cacheKey = `${bookCode}:${chNum}`;

    // Check translation cache
    let translated = translationCache.current[translationId]?.[cacheKey];
    if (translated) return translated;

    try {
      const res = await fetch(`https://bible.helloao.org/api/${tDef.cdnId}/${bookCode}/${chNum}.json`);
      if (!res.ok) return null;
      const data = await res.json();
      translated = {};
      (data.chapter?.content || [])
        .filter(item => item.type === "verse")
        .forEach(item => {
          translated[item.number] = (item.content || [])
            .filter(c => typeof c === 'string' || c.text)
            .map(c => typeof c === 'string' ? c : c.text)
            .join('');
        });
      if (!translationCache.current[translationId]) translationCache.current[translationId] = {};
      translationCache.current[translationId][cacheKey] = translated;
      return translated;
    } catch { return null; }
  }, []);

  const loadChapter = useCallback(async (bookName, chNum) => {
    setLoading(true);
    try {
      const slug = bookName.toLowerCase().replace(/\s+/g, '-');

      // Check in-memory cache first (entire book cached on first load)
      let bookData = bookCache.current[slug];
      if (!bookData) {
        const res = await fetch(`/data/${slug}.json`);
        if (res.ok) {
          bookData = await res.json();
          bookCache.current[slug] = bookData;

          // Enrich dbChapters with chapter themes from static JSON
          setDbChapters(prev => {
            const existing = prev[bookName];
            if (!existing) return prev;
            const updated = existing.map(ch => {
              const chData = bookData.chapters[String(ch.num)];
              return chData?.meta?.theme ? { ...ch, theme: chData.meta.theme } : ch;
            });
            return { ...prev, [bookName]: updated };
          });
        }
      }

      if (bookData) {
        const ch = bookData.chapters[String(chNum)];
        if (ch) {
          setChapterMeta(ch.meta ? {
            overview: ch.meta.overview || null,
            theme: ch.meta.theme || null,
            key_word_original: ch.meta.keyWordOriginal || null,
            key_word_meaning: ch.meta.keyWordMeaning || null,
            outline: ch.meta.outline ? JSON.stringify(ch.meta.outline) : null,
          } : null);
          let chVerses = ch.verses || [];
          setWordStudies(ch.wordStudies || {});
          setCrossRefs(ch.crossRefs || {});

          // Overlay translated text if non-KJV translation selected
          if (bibleTranslation !== "kjv") {
            const translated = await fetchTranslatedVerses(bookName, chNum, bibleTranslation);
            if (translated) {
              chVerses = chVerses.map(v => ({ ...v, kjv_text: translated[v.verse_number] || v.kjv_text }));
            }
          }
          setVerses(chVerses);
          setLoading(false);
          return;
        }
      }

      // Fallback to Supabase if static JSON unavailable
      const { data: bkData } = await supabase.from("books").select("id").eq("name", bookName).single();
      if (!bkData) { setLoading(false); return; }
      const { data: chData } = await supabase.from("chapters").select("*").eq("book_id", bkData.id).eq("chapter_number", chNum).single();
      if (!chData) { setLoading(false); return; }
      setChapterMeta(chData);
      const { data: vData } = await supabase.from("verses").select("*").eq("chapter_id", chData.id).order("verse_number");
      if (!vData?.length) { setLoading(false); return; }
      setVerses(vData);
      const vIds = vData.map(v => v.id);
      const { data: ws } = await supabase.from("word_studies").select("*").in("verse_id", vIds).order("word_order");
      const wsMap = {}; if (ws) ws.forEach(w => { if (!wsMap[w.verse_id]) wsMap[w.verse_id] = []; wsMap[w.verse_id].push(w); });
      setWordStudies(wsMap);
      const { data: cr } = await supabase.from("cross_references").select("*").in("verse_id", vIds).order("ref_order");
      const crMap = {}; if (cr) cr.forEach(r => { if (!crMap[r.verse_id]) crMap[r.verse_id] = []; crMap[r.verse_id].push(r); });
      setCrossRefs(crMap);
    } catch (e) { console.error('loadChapter error:', e); }
    setLoading(false);
  }, [bibleTranslation, fetchTranslatedVerses]);

  const goingBack = useRef(false);
  const BACK_MAP = { "verse":"verses", "verses":"books", "chapter":"books", "books":"home", "search":"home", "quiz-browser":"home", "quiz-intro":"verses", "quiz-active":"quiz-intro", "quiz-results":"verses", "hebrew-lesson":"hebrew-home", "hebrew-practice":"hebrew-home", "hebrew-reading":"hebrew-reading-home", "hebrew-grammar-lesson":"hebrew-grammar-home", "hebrew-home":"learn-home", "hebrew-reading-home":"learn-home", "hebrew-grammar-home":"learn-home", "greek-lesson":"greek-home", "greek-practice":"greek-home", "greek-reading":"greek-reading-home", "greek-grammar-lesson":"greek-grammar-home", "greek-home":"learn-home", "greek-reading-home":"learn-home", "greek-grammar-home":"learn-home", "timeline-era-detail":"timeline-era", "timeline-era":"timeline-home", "timeline-home":"learn-home", "timeline-maps":"learn-home", "timeline-books":"learn-home", "prophecy-home":"learn-home", "timeline-archaeology":"learn-home", "apologetics-home":"learn-home", "reading-plans-home":"learn-home", "kids-curriculum-home":"learn-home", "teens-curriculum-home":"learn-home", "learn-home":"home", "prayer-home":"home", "prayer-community":"prayer-home", "prayer-clock":"prayer-home", "prayer-journal":"prayer-home", "prayer-testimony":"prayer-home", "prayer-slot-active":"prayer-clock", "account":"home", "highlights":"account", "terms":"home", "shop-home":"home", "shop-category":"shop-home", "shop-product":"shop-category", "shop-cart":"shop-home", "shop-order-success":"shop-home", "shop-premium":"shop-home", "podcast-home":"learn-home", "podcast-detail":"podcast-home", "podcast-episode":"podcast-detail", "smart-chat":"home", };

  const addToCart = (product, qty = 1, size = null) => {
    setCart(prev => {
      const key = product.id + (size || "");
      const existing = prev.find(i => i.product.id + (i.size || "") === key);
      if (existing) return prev.map(i => i.product.id + (i.size || "") === key ? {...i, qty: i.qty + qty} : i);
      return [...prev, { product, qty, size }];
    });
  };
  const removeFromCart = (productId, size = null) => {
    setCart(prev => prev.filter(i => !(i.product.id === productId && (i.size || null) === (size || null))));
  };
  const updateQty = (productId, size, qty) => {
    if (qty < 1) { removeFromCart(productId, size); return; }
    setCart(prev => prev.map(i => i.product.id === productId && (i.size || null) === (size || null) ? {...i, qty} : i));
  };
  const clearCart = () => setCart([]);
  const cartCount = cart.reduce((s, i) => s + i.qty, 0);
  const goBack = () => {
    const target = BACK_MAP[view] || "home";
    if (navStack.current.length > 1) navStack.current.pop();
    goingBack.current = true;
    setView(target);
    window.scrollTo({ top: 0, behavior: "instant" });
  };

  const nav = useCallback((v, opts = {}) => {
    const snapshot = { view: v, testament, book, chapter, verse, tab, ...opts };
    navStack.current.push(snapshot);
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
    window.scrollTo({ top: 0, behavior: "instant" });
  }, [testament, book, chapter, verse, tab, changeVerse]);

  // Preload book JSON when entering chapter list (enriches chapter themes)
  useEffect(() => {
    if (view === "chapter" && book) {
      const slug = book.toLowerCase().replace(/\s+/g, '-');
      if (!bookCache.current[slug]) {
        fetch(`/data/${slug}.json`).then(r => r.ok ? r.json() : null).then(data => {
          if (!data) return;
          bookCache.current[slug] = data;
          setDbChapters(prev => {
            const existing = prev[book];
            if (!existing) return prev;
            const updated = existing.map(ch => {
              const chData = data.chapters[String(ch.num)];
              return chData?.meta?.theme ? { ...ch, theme: chData.meta.theme } : ch;
            });
            return { ...prev, [book]: updated };
          });
        }).catch(() => {});
      }
    }
  }, [view, book]);

  useEffect(() => { if ((view === "verse" || view === "verses") && book && chapter) loadChapter(book, chapter); }, [view, book, chapter, loadChapter]);
  useEffect(() => { if (view === "verse" && !verse && verseNums.length > 0) changeVerse(verseNums[0]); }, [view, verse, verseNums, changeVerse]);

  // ─── Re-overlay translation when user switches language mid-chapter ───
  const prevTranslation = useRef(bibleTranslation);
  useEffect(() => {
    if (prevTranslation.current === bibleTranslation) return;
    prevTranslation.current = bibleTranslation;
    if (!(view === "verse" || view === "verses") || !book || !chapter) return;

    const slug = book.toLowerCase().replace(/\s+/g, '-');
    const cached = bookCache.current[slug];
    if (!cached) return;
    const ch = cached.chapters[String(chapter)];
    if (!ch) return;
    const kjvVerses = ch.verses || [];

    if (bibleTranslation === "kjv") {
      setVerses(kjvVerses);
    } else {
      (async () => {
        const translated = await fetchTranslatedVerses(book, chapter, bibleTranslation);
        if (translated) {
          setVerses(kjvVerses.map(v => ({ ...v, kjv_text: translated[v.verse_number] || v.kjv_text })));
        } else {
          setVerses(kjvVerses);
        }
      })();
    }
  }, [bibleTranslation, view, book, chapter, fetchTranslatedVerses]);

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
      if (view === "greek-home" || view === "greek-lesson" || view === "greek-practice") {
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
  }, [view, hebrewLesson, hebrewCategory, timelineSelectedEra, savePositionToSupabase]);

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
    // Greek
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, setGreekAlphabet, greekVocab, setGreekVocab,
    greekCategory, setGreekCategory, greekProgress, greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer, greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup, greekGrammarLesson, setGreekGrammarLesson,
    greekGrammarLessonIds, greekReadingVerse, setGreekReadingVerse, greekReadingStep, setGreekReadingStep,
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
    audioMode, setAudioMode, audioNarrator, setAudioNarrator,
    audioChapterLinks, sleepTimer, setSleepTimer,
    audioSource, setAudioSource, audioCurrentVerse, setAudioCurrentVerse,
    listenedChapters, markChapterListened, fetchAudioLinks,
    hdAudioUrl, fetchAudioTimestamps,
    audioCurrentWord, setAudioCurrentWord,
    // Podcast (minimal — player is self-contained)
    podcastPlaying, setPodcastPlaying, podcastVisible, setPodcastVisible,
    podcastEpisodeInfo, setPodcastEpisodeInfo, podcastAudioRef,
    podcastCurrentTime, setPodcastCurrentTime, podcastDuration, setPodcastDuration,
    podcastListenedEpisodes, podcastSeries, podcastEpisode,
    podcastStreak, updatePodcastStreak,
    stopPodcast, stopBibleAudio, markEpisodeListened,
    // Smart Chat
    chatMessages, setChatMessages,
    // Birthday
    isBirthdayToday, birthdayUsers,
  };

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>;
}

export function useApp() {
  const ctx = useContext(AppContext);
  if (!ctx) throw new Error("useApp must be used within AppProvider");
  return ctx;
}
