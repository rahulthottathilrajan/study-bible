"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { supabase } from "../../../lib/supabase";
import { BADGES, BIBLE_BOOKS, HIGHLIGHT_COLORS, QUIZ_BOOKS } from "../../constants";

export function useQuizGamificationState({
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
}) {
  const getInitialLearnExploration = () => {
    try {
      const saved = JSON.parse(localStorage.getItem("learnExploration") || "{}");
      return {
        erasExplored: saved.erasExplored || [],
        propheciesRead: saved.propheciesRead || [],
        archaeologyViewed: saved.archaeologyViewed || [],
        mapsExplored: saved.mapsExplored || {},
        apologeticsStudied: saved.apologeticsStudied || [],
      };
    } catch {
      return {
        erasExplored: [],
        propheciesRead: [],
        archaeologyViewed: [],
        mapsExplored: {},
        apologeticsStudied: [],
      };
    }
  };

  const [earnedBadges, setEarnedBadges] = useState({});
  const [chapterReads, setChapterReads] = useState([]);
  const [badgeToast, setBadgeToast] = useState(null);
  const [learnExploration, setLearnExploration] = useState(getInitialLearnExploration);
  const [notesCount, setNotesCount] = useState(0);
  const [quizScores, setQuizScores] = useState({});
  const [quizQuestions, setQuizQuestions] = useState([]);
  const [quizLoading, setQuizLoading] = useState(false);
  const [quizDifficulty, setQuizDifficulty] = useState("");
  const [quizStreak, setQuizStreak] = useState(null);

  const quizCache = useRef({});
  const badgeAwardRef = useRef(earnedBadges);
  const badgesLoadedRef = useRef(false);

  const loadEarnedBadges = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_badges").select("badge_id, earned_at").eq("user_id", user.id);
    const map = {};
    if (data) data.forEach((badge) => { map[badge.badge_id] = { earned_at: badge.earned_at }; });
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
    const exists = chapterReads.some((entry) => entry.book_name === bookName && entry.chapter_number === chapterNum);
    if (exists) return;
    await supabase.from("user_chapter_reads").upsert(
      { user_id: user.id, book_name: bookName, chapter_number: chapterNum },
      { onConflict: "user_id,book_name,chapter_number" },
    );
    setChapterReads((prev) => [...prev, { book_name: bookName, chapter_number: chapterNum }]);
  }, [chapterReads, user]);

  const loadQuizScores = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_quiz_scores")
      .select("book_name, chapter_number, difficulty, score, total_questions, percentage, attempted_at")
      .eq("user_id", user.id)
      .order("attempted_at", { ascending: false });
    if (data) {
      const map = {};
      data.forEach((quiz) => {
        const key = `${quiz.book_name}-${quiz.chapter_number}`;
        if (!map[key]) map[key] = [];
        map[key].push(quiz);
      });
      setQuizScores(map);
    }
  }, [user]);

  const loadQuizQuestions = useCallback(async (bookName, chNum, difficulty) => {
    setQuizLoading(true);
    try {
      const slug = bookName.toLowerCase().replace(/\s+/g, "-");
      let quizData = quizCache.current[slug];
      if (!quizData) {
        const res = await fetch(`/data/quizzes/${slug}.json`);
        if (res.ok) {
          quizData = await res.json();
          quizCache.current[slug] = quizData;
        }
      }
      if (quizData) {
        setQuizQuestions(quizData[String(chNum)]?.[difficulty] || []);
        setQuizLoading(false);
        return;
      }
    } catch {}
    const { data } = await supabase.from("chapter_quizzes")
      .select("*")
      .eq("book_name", bookName)
      .eq("chapter_number", chNum)
      .eq("difficulty", difficulty)
      .order("question_number");
    setQuizQuestions(data || []);
    setQuizLoading(false);
  }, []);

  const submitQuizScore = useCallback(async (bookName, chNum, difficulty, score, total) => {
    if (!user) return;
    const percentage = Math.round((score / total) * 100);
    await supabase.from("user_quiz_scores").insert({
      user_id: user.id,
      book_name: bookName,
      chapter_number: chNum,
      difficulty,
      score,
      total_questions: total,
      percentage,
    });
    setQuizScores((prev) => {
      const key = `${bookName}-${chNum}`;
      const entry = { book_name: bookName, chapter_number: chNum, difficulty, score, total_questions: total, percentage, attempted_at: new Date().toISOString() };
      return { ...prev, [key]: [entry, ...(prev[key] || [])] };
    });
  }, [user]);

  const dailyQuizPool = useMemo(() => {
    const pool = [];
    QUIZ_BOOKS.forEach((bookName) => {
      const bookInfo = BIBLE_BOOKS.find((entry) => entry.name === bookName);
      if (bookInfo) {
        for (let chapterNum = 1; chapterNum <= bookInfo.chapters; chapterNum += 1) {
          pool.push({ book: bookName, chapter: chapterNum });
        }
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

  const quizMastery = useMemo(() => {
    const mastery = {};
    QUIZ_BOOKS.forEach((bookName) => {
      const bookInfo = BIBLE_BOOKS.find((entry) => entry.name === bookName);
      if (!bookInfo) return;
      let masteredCount = 0;
      for (let ch = 1; ch <= bookInfo.chapters; ch += 1) {
        const key = `${bookName}-${ch}`;
        const chapterScores = quizScores[key] || [];
        if (chapterScores.some((score) => score.percentage >= 80)) masteredCount += 1;
      }
      mastery[bookName] = {
        mastered: masteredCount,
        total: bookInfo.chapters,
        percentage: bookInfo.chapters > 0 ? Math.round((masteredCount / bookInfo.chapters) * 100) : 0,
      };
    });
    return mastery;
  }, [quizScores]);

  const dailyQuizCompleted = useMemo(() => (
    quizStreak?.last_quiz_date === new Date().toISOString().split("T")[0]
  ), [quizStreak]);

  const loadQuizStreak = useCallback(async (uid) => {
    const { data } = await supabase
      .from("user_quiz_streaks")
      .select("current_streak, longest_streak, last_quiz_date, total_quizzes_completed")
      .eq("user_id", uid)
      .maybeSingle();
    setQuizStreak(data || null);
  }, []);

  const updateQuizStreak = useCallback(async () => {
    if (!user) return;
    const todayDate = new Date().toISOString().split("T")[0];
    if (quizStreak?.last_quiz_date === todayDate) return;
    if (!quizStreak) {
      const { data } = await supabase.from("user_quiz_streaks").upsert({
        user_id: user.id,
        current_streak: 1,
        longest_streak: 1,
        last_quiz_date: todayDate,
        total_quizzes_completed: 1,
        updated_at: new Date().toISOString(),
      }, { onConflict: "user_id" }).select().single();
      if (data) setQuizStreak(data);
      return;
    }
    const last = new Date(quizStreak.last_quiz_date + "T00:00:00");
    const today = new Date(todayDate + "T00:00:00");
    const diffDays = Math.round((today - last) / 86400000);
    const newCurrent = diffDays === 1 ? quizStreak.current_streak + 1 : 1;
    const newLongest = Math.max(newCurrent, quizStreak.longest_streak);
    const newTotal = (quizStreak.total_quizzes_completed || 0) + 1;
    const { data } = await supabase.from("user_quiz_streaks").upsert({
      user_id: user.id,
      current_streak: newCurrent,
      longest_streak: newLongest,
      last_quiz_date: todayDate,
      total_quizzes_completed: newTotal,
      updated_at: new Date().toISOString(),
    }, { onConflict: "user_id" }).select().single();
    if (data) setQuizStreak(data);
  }, [quizStreak, user]);

  useEffect(() => {
    let cancelled = false;

    if (user) {
      const hydrateQuizState = async () => {
        await Promise.all([
          loadQuizStreak(user.id),
          loadEarnedBadges(),
          loadChapterReads(),
          loadNotesCount(),
          loadQuizScores(),
        ]);
      };

      void hydrateQuizState();
      return () => {
        cancelled = true;
      };
    }

    const resetTimer = setTimeout(() => {
      if (cancelled) return;
      setCart([]);
      setQuizStreak(null);
      setEarnedBadges({});
      badgesLoadedRef.current = false;
      setChapterReads([]);
      setNotesCount(0);
      setQuizScores({});
      setChapterHighlights({});
      setChapterNotes({});
      setChapterCommunityNotes({});
      setAllHighlights([]);
      setPrayers([]);
      setCommunityPrayers([]);
      try {
        ["cart", "navState", "currency"].forEach((key) => localStorage.removeItem(key));
      } catch {}
    }, 0);

    return () => {
      cancelled = true;
      clearTimeout(resetTimer);
    };
  }, [user, loadQuizStreak, loadEarnedBadges, loadChapterReads, loadNotesCount, loadQuizScores, setAllHighlights, setCart, setChapterCommunityNotes, setChapterHighlights, setChapterNotes, setCommunityPrayers, setPrayers]);

  const trackLearnExploration = useCallback((type, id) => {
    setLearnExploration((prev) => {
      const arr = prev[type] || [];
      if (arr.includes(id)) return prev;
      const updated = { ...prev, [type]: [...arr, id] };
      try { localStorage.setItem("learnExploration", JSON.stringify(updated)); } catch {}
      return updated;
    });
  }, []);

  useEffect(() => {
    badgeAwardRef.current = earnedBadges;
  }, [earnedBadges]);

  const awardBadge = useCallback(async (badgeId) => {
    if (!user || badgeAwardRef.current[badgeId]) return;
    const earnedAt = new Date().toISOString();
    setEarnedBadges((prev) => prev[badgeId] ? prev : { ...prev, [badgeId]: { earned_at: earnedAt } });
    badgeAwardRef.current = { ...badgeAwardRef.current, [badgeId]: { earned_at: earnedAt } };
    await supabase.from("user_badges").upsert(
      { user_id: user.id, badge_id: badgeId },
      { onConflict: "user_id,badge_id" },
    );
    const badge = BADGES.find((entry) => entry.id === badgeId);
    if (badge) setBadgeToast(badge);
  }, [user]);

  useEffect(() => {
    const checkBadges = () => {
      if (!user || !badgesLoadedRef.current) return;
      const earned = badgeAwardRef.current;
      const readCount = chapterReads.length;
      if (readCount >= 1 && !earned.first_light) awardBadge("first_light");
      if (readCount >= 10 && !earned.bookworm) awardBadge("bookworm");
      if (readCount >= 50 && !earned.scholar) awardBadge("scholar");

      const hlCount = allHighlights.length;
      if (hlCount >= 10 && !earned.highlighter) awardBadge("highlighter");
      const uniqueColors = new Set(allHighlights.map((highlight) => highlight.highlight_color).filter(Boolean));
      if (uniqueColors.size >= HIGHLIGHT_COLORS.length && !earned.color_palette) awardBadge("color_palette");
      if (notesCount >= 10 && !earned.scribe) awardBadge("scribe");
      const bookmarkCount = allHighlights.filter((highlight) => highlight.is_bookmarked).length;
      if (bookmarkCount >= 25 && !earned.bookmarker) awardBadge("bookmarker");
      const journalTotal = hlCount + notesCount;
      if (journalTotal >= 25 && !earned.journal_keeper) awardBadge("journal_keeper");
      if (journalTotal >= 100 && !earned.journal_master) awardBadge("journal_master");
      if ((streak?.current_streak >= 30 || streak?.longest_streak >= 30) && !earned.devoted) awardBadge("devoted");

      const hebCompleted = Object.values(hebrewProgress).filter((progress) => progress.completed);
      if (hebCompleted.length >= 1 && !earned.aleph) awardBadge("aleph");
      const hebAlphabetTotal = Object.keys(hebrewProgress).length > 0 ? hebrewLessons.filter((lesson) => lesson.category === "alphabet").length : 0;
      const hebAlphabetDone = hebCompleted.filter((progress) => {
        const lesson = hebrewLessons.find((entry) => entry.id === Number(Object.keys(hebrewProgress).find((key) => hebrewProgress[key] === progress)));
        return lesson?.category === "alphabet";
      }).length;
      if (hebAlphabetTotal > 0 && hebAlphabetDone >= hebAlphabetTotal && !earned.aleph_bet) awardBadge("aleph_bet");
      if (hebCompleted.length >= 22 && !earned.hebrew_scholar) awardBadge("hebrew_scholar");
      if (hebCompleted.some((progress) => progress.score >= 100) && !earned.perfect_hebrew) awardBadge("perfect_hebrew");
      if (hebrewStreak.longest >= 7 && !earned.hebrew_streak_7) awardBadge("hebrew_streak_7");
      if (hebrewStreak.longest >= 30 && !earned.hebrew_streak_30) awardBadge("hebrew_streak_30");
      if (hebrewXP >= 3000 && !earned.hebrew_sofer) awardBadge("hebrew_sofer");

      const greekCompleted = Object.values(greekProgress).filter((progress) => progress.completed);
      if (greekCompleted.length >= 1 && !earned.alpha) awardBadge("alpha");
      const gStreak = parseInt(localStorage.getItem("greekStreakCount") || "0", 10);
      if (gStreak >= 7 && !earned.greek_streak_7) awardBadge("greek_streak_7");
      if (gStreak >= 30 && !earned.greek_streak_30) awardBadge("greek_streak_30");

      const erasCount = learnExploration.erasExplored?.length || 0;
      if (erasCount >= 1 && !earned.time_traveler) awardBadge("time_traveler");
      if (erasCount >= 14 && !earned.historian) awardBadge("historian");
      const prophecyCount = learnExploration.propheciesRead?.length || 0;
      if (prophecyCount >= 10 && !earned.prophet) awardBadge("prophet");
      const archCount = learnExploration.archaeologyViewed?.length || 0;
      if (archCount >= 5 && !earned.archaeologist) awardBadge("archaeologist");

      const totalReactions = Object.values(userReactions).reduce((sum, reactions) => sum + Object.keys(reactions).length, 0);
      if (totalReactions >= 10 && !earned.intercessor) awardBadge("intercessor");
      const myPrayers = communityPrayers.filter((prayer) => prayer.user_id === user.id);
      if (myPrayers.length >= 5 && !earned.community_builder) awardBadge("community_builder");
      if (isBirthdayToday && profile?.date_of_birth && !earned.birthday_blessed) awardBadge("birthday_blessed");

      const allScores = Object.values(quizScores).flat();
      if (allScores.length >= 1 && !earned.quiz_starter) awardBadge("quiz_starter");
      if (allScores.length >= 10 && !earned.quiz_whiz) awardBadge("quiz_whiz");
      if (allScores.length >= 50 && !earned.quiz_master) awardBadge("quiz_master");
      if (allScores.some((score) => score.percentage >= 100) && !earned.perfect_score) awardBadge("perfect_score");
      const qs = quizStreak?.longest_streak || quizStreak?.current_streak || 0;
      if (qs >= 7 && !earned.daily_scholar) awardBadge("daily_scholar");
      if (qs >= 30 && !earned.devoted_student) awardBadge("devoted_student");
      if (qs >= 100 && !earned.bible_warrior) awardBadge("bible_warrior");

      const mastery = quizMastery;
      const pent = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy"];
      const gosp = ["Matthew", "Mark", "Luke", "John"];
      const epist = ["Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians", "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", "Hebrews", "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude"];
      if (pent.every((bookName) => (mastery[bookName]?.percentage || 0) >= 80) && !earned.pentateuch_scholar) awardBadge("pentateuch_scholar");
      if (gosp.every((bookName) => (mastery[bookName]?.percentage || 0) >= 80) && !earned.gospel_expert) awardBadge("gospel_expert");
      if (epist.every((bookName) => (mastery[bookName]?.percentage || 0) >= 80) && !earned.epistle_master) awardBadge("epistle_master");
      if (QUIZ_BOOKS.every((bookName) => (mastery[bookName]?.percentage || 0) >= 80) && !earned.bible_scholar) awardBadge("bible_scholar");

      const listenCount = listenedChapters.length;
      if (listenCount >= 1 && !earned.first_listen) awardBadge("first_listen");
      if (listenCount >= 10 && !earned.audio_scholar) awardBadge("audio_scholar");
      if (listenCount >= 50 && !earned.audio_marathon) awardBadge("audio_marathon");

      const podcastCount = podcastListenedEpisodes.length;
      if (podcastCount >= 1 && !earned.first_listen_podcast) awardBadge("first_listen_podcast");
      if (podcastCount >= 7 && !earned.podcast_regular) awardBadge("podcast_regular");
      if (podcastCount >= 30 && !earned.podcast_devotee) awardBadge("podcast_devotee");
      if (podcastStreak?.current >= 7 && !earned.podcast_streak_7) awardBadge("podcast_streak_7");
      if (podcastStreak?.current >= 30 && !earned.podcast_streak_30) awardBadge("podcast_streak_30");
    };

    const timer = setTimeout(() => {
      checkBadges();
    }, 0);

    return () => clearTimeout(timer);
  }, [
    user,
    chapterReads,
    allHighlights,
    notesCount,
    streak,
    hebrewProgress,
    hebrewLessons,
    hebrewStreak,
    hebrewXP,
    greekProgress,
    userReactions,
    communityPrayers,
    isBirthdayToday,
    profile,
    quizScores,
    quizStreak,
    quizMastery,
    listenedChapters,
    podcastListenedEpisodes,
    podcastStreak,
    learnExploration,
    awardBadge,
  ]);

  return {
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
  };
}
