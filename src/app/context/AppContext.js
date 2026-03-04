"use client";
import { createContext, useContext, useState, useEffect, useCallback, useMemo, useRef } from "react";
import { supabase } from "../../lib/supabase";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS } from "../constants";

const AppContext = createContext(null);

export function AppProvider({ children }) {
  // ─── Core state ───
  const [view, setView] = useState("home");
  const [testament, setTestament] = useState(null);
  const [book, setBook] = useState(null);
  const [chapter, setChapter] = useState(null);
  const [verse, setVerse] = useState(null);
  const [tab, setTab] = useState("study");
  const [fade, setFade] = useState(true);
  const [loading, setLoading] = useState(false);
  const [dbLive, setDbLive] = useState(false);
  const [darkMode, setDarkMode] = useState(false);
  const [fontSize, setFontSize] = useState("medium");

  // ─── Load dark mode + font size preferences ───
  useEffect(() => {
    try { const dm = localStorage.getItem("darkMode"); if (dm === "true") setDarkMode(true); } catch {}
    try { const fs = localStorage.getItem("fontSize"); if (fs) setFontSize(fs); } catch {}
  }, []);
  useEffect(() => {
    try { localStorage.setItem("darkMode", darkMode ? "true" : "false"); } catch {}
    document.body.style.background = darkMode ? "#141210" : "#f7f2e8";
  }, [darkMode]);
  useEffect(() => {
    try { localStorage.setItem("fontSize", fontSize); } catch {}
  }, [fontSize]);

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
  const FS = { small:{list:13,detail:17}, medium:{list:14.5,detail:19.5}, large:{list:17,detail:23}, xlarge:{list:20.5,detail:27} };

  // ─── Bible data ───
  const [dbChapters, setDbChapters] = useState({});
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

  // ─── User features state ───
  const [userNote, setUserNote] = useState("");
  const [savedNote, setSavedNote] = useState(null);
  const [noteLoading, setNoteLoading] = useState(false);
  const [highlight, setHighlight] = useState(null);
  const [shareCopied, setShareCopied] = useState(false);
  const [communityNotes, setCommunityNotes] = useState([]);
  const [prayerModal, setPrayerModal] = useState(false);
  const [prayers, setPrayers] = useState([]);
  const [prayerTitle, setPrayerTitle] = useState("");
  const [prayerText, setPrayerText] = useState("");
  const [prayerLoading, setPrayerLoading] = useState(false);
  const [allHighlights, setAllHighlights] = useState([]);
  const [hlLoading, setHlLoading] = useState(false);
  const [donateModal, setDonateModal] = useState(false);
  const [prayerTab, setPrayerTab] = useState("community");

  // ─── Community Prayer state ───
  const [communityPrayers, setCommunityPrayers] = useState([]);
  const [communityPrayersLoading, setCommunityPrayersLoading] = useState(false);
  const [communityPrayerCategory, setCommunityPrayerCategory] = useState("all");
  const [userReactions, setUserReactions] = useState({});

  const [expiringPrayers, setExpiringPrayers] = useState([]);

  // ─── Prayer Clock state ───
  const [slotCoverage, setSlotCoverage] = useState([]);
  const [mySlots, setMySlots] = useState([]);
  const [slotsLoading, setSlotsLoading] = useState(false);

  const noteRef = useRef(null);

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
      if (session?.user) { loadProfile(session.user.id); loadStreak(session.user.id); }
    });
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
      if (session?.user) { loadProfile(session.user.id); loadStreak(session.user.id); }
      else { setProfile(null); setStreak(null); }
    });
    return () => subscription.unsubscribe();
  }, []);

  const loadProfile = async (uid) => {
    const { data } = await supabase.from("user_profiles").select("*").eq("id", uid).single();
    setProfile(data || null);
  };

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

  const handleLogout = async () => { await supabase.auth.signOut(); setProfile(null); };

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
  useEffect(() => {
    if (!user || !currentVerse) return;
    (async () => {
      const { data: note } = await supabase.from("user_notes").select("*").eq("user_id", user.id).eq("verse_id", currentVerse.id).maybeSingle();
      if (note) { setSavedNote(note); setUserNote(note.note_text); if (noteRef.current) noteRef.current.value = note.note_text; } else { setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = ""; }
      const { data: hl } = await supabase.from("user_highlights").select("*").eq("user_id", user.id).eq("verse_id", currentVerse.id).maybeSingle();
      setHighlight(hl);
      const { data: cn } = await supabase.from("user_notes").select("*").eq("verse_id", currentVerse.id).eq("is_public", true).neq("user_id", user.id);
      setCommunityNotes(cn || []);
    })();
  }, [user, currentVerse]);

  useEffect(() => {
    if (!user) { setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = ""; setHighlight(null); setCommunityNotes([]); }
  }, [user, verse]);

  const saveNote = async () => {
    const noteText = noteRef.current?.value || "";
    if (!user || !currentVerse || !noteText.trim()) return;
    setNoteLoading(true);
    if (savedNote) {
      const { data } = await supabase.from("user_notes").update({ note_text: noteText, updated_at: new Date().toISOString() }).eq("id", savedNote.id).select().single();
      if (data) setSavedNote(data);
    } else {
      const { data } = await supabase.from("user_notes").insert({ user_id: user.id, verse_id: currentVerse.id, note_text: noteText }).select().single();
      if (data) setSavedNote(data);
    }
    setNoteLoading(false);
  };

  const toggleNotePublic = async () => {
    if (!savedNote) return;
    const { data } = await supabase.from("user_notes").update({ is_public: !savedNote.is_public }).eq("id", savedNote.id).select().single();
    if (data) setSavedNote(data);
  };

  const toggleHighlight = async (color) => {
    if (!user || !currentVerse) return;
    if (highlight?.highlight_color === color) {
      await supabase.from("user_highlights").delete().eq("id", highlight.id);
      setHighlight(null);
    } else if (highlight) {
      const { data } = await supabase.from("user_highlights").update({ highlight_color: color }).eq("id", highlight.id).select().single();
      if (data) setHighlight(data);
    } else {
      const { data } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: currentVerse.id, highlight_color: color }).select().single();
      if (data) setHighlight(data);
    }
  };

  const toggleBookmarkHL = async () => {
    if (!user || !currentVerse) return;
    if (highlight) {
      const { data } = await supabase.from("user_highlights").update({ is_bookmarked: !highlight.is_bookmarked }).eq("id", highlight.id).select().single();
      if (data) setHighlight(data);
    } else {
      const { data } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: currentVerse.id, is_bookmarked: true, highlight_color: "#FFD700" }).select().single();
      if (data) setHighlight(data);
    }
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
    ctx.fillText("KJV Study Bible", 80, 88);

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
    const entry = {
      user_id: user.id, title: prayerTitle || "Prayer", prayer_text: prayerText,
      verse_id: currentVerse?.id || null,
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
      .order("created_at", { ascending: false });
    setAllHighlights(data || []);
    setHlLoading(false);
  }, [user]);

  useEffect(() => { if ((view === "account" || view === "prayer-home") && user) loadPrayers(); }, [view, user, loadPrayers]);
  useEffect(() => { if ((view === "account" || view === "highlights") && user) loadAllHighlights(); }, [view, user, loadAllHighlights]);

  // ═══ COMMUNITY PRAYER ═══
  const loadCommunityPrayers = useCallback(async () => {
    setCommunityPrayersLoading(true);
    let query = supabase.from("community_prayers").select("*").order("created_at", { ascending: false });
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
    await supabase.from("community_prayers").insert({
      user_id: user.id, title, body, category, is_anonymous: isAnonymous,
    });
    loadCommunityPrayers();
  };

  const deleteCommunityPrayer = async (id) => {
    await supabase.from("community_prayers").delete().eq("id", id);
    loadCommunityPrayers();
  };

  const markCommunityPrayerAnswered = async (id) => {
    await supabase.from("community_prayers").update({
      is_answered: true, answered_at: new Date().toISOString(), updated_at: new Date().toISOString(),
    }).eq("id", id);
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
  };

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
    await supabase.from("prayer_slots").insert({
      user_id: user.id, slot_hour: hour, slot_minute: minute,
      duration_minutes: duration, frequency, custom_days: customDays || [],
    });
    loadMySlots();
    loadSlotCoverage();
  };

  const deletePrayerSlot = async (id) => {
    await supabase.from("prayer_slots").delete().eq("id", id);
    loadMySlots();
    loadSlotCoverage();
  };

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

  // ═══ DB & NAVIGATION ═══
  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data?.length > 0 && !error) {
          setDbLive(true);
          const { data: chapData } = await supabase.from("chapters").select("book_id, chapter_number, theme, books(name)").order("chapter_number");
          if (chapData) {
            const chMap = {};
            chapData.forEach(c => { const n = c.books?.name; if (n) { if (!chMap[n]) chMap[n] = []; chMap[n].push({ num: c.chapter_number, theme: c.theme }); } });
            setDbChapters(chMap);
          }
        }
      } catch { setDbLive(false); }
    })();
  }, []);

  const loadChapter = useCallback(async (bookName, chNum) => {
    setLoading(true);
    try {
      const { data: bookData } = await supabase.from("books").select("id").eq("name", bookName).single();
      if (!bookData) { setLoading(false); return; }
      const { data: chData } = await supabase.from("chapters").select("*").eq("book_id", bookData.id).eq("chapter_number", chNum).single();
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
    } catch (e) { console.error(e); }
    setLoading(false);
  }, []);

  const goingBack = useRef(false);
  const BACK_MAP = { "verse":"verses", "verses":"chapter", "chapter":"books", "books":"home", "search":"home", "hebrew-lesson":"hebrew-home", "hebrew-practice":"hebrew-home", "hebrew-reading":"hebrew-reading-home", "hebrew-grammar-lesson":"hebrew-grammar-home", "hebrew-home":"learn-home", "hebrew-reading-home":"learn-home", "hebrew-grammar-home":"learn-home", "greek-lesson":"greek-home", "greek-practice":"greek-home", "greek-reading":"greek-reading-home", "greek-grammar-lesson":"greek-grammar-home", "greek-home":"learn-home", "greek-reading-home":"learn-home", "greek-grammar-home":"learn-home", "timeline-era-detail":"timeline-era", "timeline-era":"timeline-home", "timeline-home":"learn-home", "timeline-maps":"learn-home", "timeline-books":"learn-home", "prophecy-home":"learn-home", "timeline-archaeology":"learn-home", "apologetics-home":"learn-home", "reading-plans-home":"learn-home", "kids-curriculum-home":"learn-home", "learn-home":"home", "prayer-home":"home", "prayer-community":"prayer-home", "prayer-clock":"prayer-home", "prayer-journal":"prayer-home", "prayer-testimony":"prayer-home", "prayer-slot-active":"prayer-clock", "account":"home", "highlights":"account" };
  const goBack = () => {
    const target = BACK_MAP[view] || "home";
    if (navStack.current.length > 1) navStack.current.pop();
    goingBack.current = true;
    setFade(false);
    setTimeout(() => { setView(target); setFade(true); window.scrollTo({ top: 0, behavior: "instant" }); }, 80);
  };

  const nav = useCallback((v, opts = {}) => {
    const snapshot = { view: v, testament, book, chapter, verse, tab, ...opts };
    navStack.current.push(snapshot);
    setFade(false);
    setTimeout(() => {
      setView(v);
      if (opts.testament !== undefined) setTestament(opts.testament);
      if (opts.book !== undefined) setBook(opts.book);
      if (opts.chapter !== undefined) setChapter(opts.chapter);
      if (opts.verse !== undefined) setVerse(opts.verse);
      if (opts.tab !== undefined) setTab(opts.tab);
      setFade(true);
      window.scrollTo({ top: 0, behavior: "instant" });
    }, 80);
  }, [testament, book, chapter, verse, tab]);

  useEffect(() => { if ((view === "verse" || view === "verses") && book && chapter && dbLive) loadChapter(book, chapter); }, [view, book, chapter, dbLive, loadChapter]);
  useEffect(() => { if (view === "verse" && !verse && verseNums.length > 0) setVerse(verseNums[0]); }, [view, verse, verseNums]);

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
    view, setView, testament, setTestament, book, setBook, chapter, setChapter,
    verse, setVerse, tab, setTab, fade, setFade, loading, setLoading,
    dbLive, setDbLive, darkMode, setDarkMode, fontSize, setFontSize, FS,
    // Bible data
    dbChapters, collapsed, setCollapsed, booksCollapsed, setBooksCollapsed,
    overviewOpen, setOverviewOpen, chapterMeta, verses, wordStudies, crossRefs,
    // PWA
    installPrompt, showInstall, setShowInstall,
    // Auth
    user, authMode, setAuthMode, authEmail, setAuthEmail, authPass, setAuthPass,
    authName, setAuthName, authError, setAuthError, authLoading, authShowPass, setAuthShowPass,
    authForgot, setAuthForgot, authForgotSent, setAuthForgotSent, profile, streak,
    // User features
    userNote, setUserNote, savedNote, setSavedNote, noteLoading, highlight,
    shareCopied, communityNotes, prayerModal, setPrayerModal, prayers, prayerTitle,
    setPrayerTitle, prayerText, setPrayerText, prayerLoading, allHighlights, hlLoading,
    donateModal, setDonateModal, prayerTab, setPrayerTab, noteRef,
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
    saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage,
    // Prayer handlers
    loadPrayers, addPrayer, togglePrayerAnswered, deletePrayer,
    // Community prayer
    communityPrayers, communityPrayersLoading, communityPrayerCategory,
    setCommunityPrayerCategory, addCommunityPrayer, deleteCommunityPrayer,
    markCommunityPrayerAnswered, userReactions, toggleReaction,
    loadCommunityPrayers, expiringPrayers, keepCommunityPrayer,
    // Prayer clock
    slotCoverage, mySlots, slotsLoading,
    loadSlotCoverage, loadMySlots, addPrayerSlot, deletePrayerSlot,
    // Highlights
    loadAllHighlights,
    // Hebrew handlers
    loadHebrewLessons, loadHebrewLesson, loadHebrewProgress, markHebrewComplete,
    // Greek handlers
    loadGreekLessons, loadGreekLesson, loadGreekProgress, markGreekComplete,
    // Timeline handlers
    loadTimelineEras, loadAllTimelineEvents, loadTimelineEvents,
    // Navigation
    loadChapter, goBack, nav, savePositionToSupabase, updateSectionPosition,
    updateStreak,
  };

  return <AppContext.Provider value={value}>{children}</AppContext.Provider>;
}

export function useApp() {
  const ctx = useContext(AppContext);
  if (!ctx) throw new Error("useApp must be used within AppProvider");
  return ctx;
}
