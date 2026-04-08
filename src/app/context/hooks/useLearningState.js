"use client";

import { useCallback, useEffect, useRef, useState } from "react";
import { supabase } from "../../../lib/supabase";

export function useLearningState({ user, view }) {
  const [hebrewLessons, setHebrewLessons] = useState([]);
  const [hebrewLesson, setHebrewLesson] = useState(null);
  const [hebrewAlphabet, setHebrewAlphabet] = useState(null);
  const [hebrewVocab, setHebrewVocab] = useState([]);
  const [hebrewCategory, setHebrewCategory] = useState("alphabet");
  const [hebrewProgress, setHebrewProgress] = useState({});
  const [hebrewPracticeMode, setHebrewPracticeMode] = useState(false);
  const [hebrewPracticeIdx, setHebrewPracticeIdx] = useState(0);
  const [hebrewPracticeAnswer, setHebrewPracticeAnswer] = useState(null);
  const [hebrewPracticeScore, setHebrewPracticeScore] = useState(0);
  const hebrewCache = useRef({});
  const [hebrewXP, setHebrewXP] = useState(0);
  const [hebrewStreak, setHebrewStreak] = useState({ count: 0, lastDate: null, longest: 0 });
  const [hebrewDailyDone, setHebrewDailyDone] = useState(null);
  const [hebrewFlashcardHistory, setHebrewFlashcardHistory] = useState({});
  const [readingStep, setReadingStep] = useState(0);
  const [showLetters, setShowLetters] = useState(false);
  const [readingVerse, setReadingVerse] = useState("gen1v1");
  const [vocabGroup, setVocabGroup] = useState(null);
  const [grammarLesson, setGrammarLesson] = useState(null);
  const [grammarLessonIds, setGrammarLessonIds] = useState({});

  const [greekLessons, setGreekLessons] = useState([]);
  const [greekLesson, setGreekLesson] = useState(null);
  const [greekAlphabet, setGreekAlphabet] = useState(null);
  const [greekVocab, setGreekVocab] = useState([]);
  const [greekCategory, setGreekCategory] = useState("alphabet");
  const [greekProgress, setGreekProgress] = useState({});
  const [greekPracticeIdx, setGreekPracticeIdx] = useState(0);
  const [greekPracticeAnswer, setGreekPracticeAnswer] = useState(null);
  const [greekPracticeScore, setGreekPracticeScore] = useState(0);
  const greekCache = useRef({});
  const [greekVocabGroup, setGreekVocabGroup] = useState(null);
  const [greekGrammarLesson, setGreekGrammarLesson] = useState(null);
  const [greekGrammarLessonIds, setGreekGrammarLessonIds] = useState({});
  const [greekReadingVerse, setGreekReadingVerse] = useState("john1v1");
  const [greekReadingStep, setGreekReadingStep] = useState(0);
  const [greekShowLetters, setGreekShowLetters] = useState(false);
  const [greekError, setGreekError] = useState(null);
  const [greekStreak, setGreekStreak] = useState(() => {
    try {
      return parseInt(localStorage.getItem("greekStreakCount") || "0", 10);
    } catch {
      return 0;
    }
  });
  const greekLessonCategories = useRef({});

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

  const hebrewJsonCache = useRef(null);
  const greekJsonCache = useRef(null);

  useEffect(() => {
    fetch("/data/hebrew-lessons.json").then((r) => r.json()).then((json) => {
      const grammar = json.categories?.grammar || [];
      const map = {};
      grammar.forEach((lesson) => { map[lesson.lesson_number] = lesson.id; });
      setGrammarLessonIds(map);
    }).catch(() => {});
  }, []);

  useEffect(() => {
    fetch("/data/greek-lessons.json").then((r) => r.json()).then((json) => {
      const grammar = json.categories?.grammar || [];
      const map = {};
      grammar.forEach((lesson) => { map[lesson.lesson_number] = lesson.id; });
      setGreekGrammarLessonIds(map);
    }).catch(() => {});
  }, []);

  const ensureHebrewJson = useCallback(async () => {
    if (hebrewJsonCache.current) return hebrewJsonCache.current;
    try {
      const res = await fetch("/data/hebrew-lessons.json");
      if (!res.ok) throw new Error("Failed to fetch hebrew-lessons.json");
      const json = await res.json();
      hebrewJsonCache.current = json;
      return json;
    } catch (err) {
      console.error("ensureHebrewJson:", err);
      return null;
    }
  }, []);

  const loadHebrewLessons = useCallback(async (cat = "alphabet") => {
    const cacheKey = `lessons-${cat}`;
    if (hebrewCache.current[cacheKey]) {
      setHebrewLessons(hebrewCache.current[cacheKey]);
      return;
    }
    try {
      const json = await ensureHebrewJson();
      if (!json) {
        setHebrewLessons([]);
        return;
      }
      const data = json.categories[cat] || [];
      hebrewCache.current[cacheKey] = data;
      setHebrewLessons(data);
    } catch (err) {
      console.error("loadHebrewLessons:", err);
      setHebrewLessons([]);
    }
  }, [ensureHebrewJson]);

  const loadHebrewLesson = useCallback(async (lessonId) => {
    const cacheKey = `lesson-${lessonId}`;
    if (hebrewCache.current[cacheKey]) {
      const cached = hebrewCache.current[cacheKey];
      setHebrewLesson(cached.lesson);
      setHebrewAlphabet(cached.alphabet);
      setHebrewVocab(cached.vocab);
      return;
    }
    try {
      const json = await ensureHebrewJson();
      if (!json) return;
      let lesson = null;
      for (const category of Object.values(json.categories)) {
        lesson = category.find((entry) => entry.id === lessonId);
        if (lesson) break;
      }
      if (!lesson) return;
      const alphabet = lesson._alphabet || null;
      const vocab = lesson._vocabulary || [];
      setHebrewLesson(lesson);
      setHebrewAlphabet(alphabet);
      setHebrewVocab(vocab);
      hebrewCache.current[cacheKey] = { lesson, alphabet, vocab };
    } catch (err) {
      console.error("loadHebrewLesson:", err);
    }
  }, [ensureHebrewJson]);

  const loadHebrewProgress = useCallback(async () => {
    if (!user) return;
    try {
      const { data, error } = await supabase.from("user_hebrew_progress").select("*").eq("user_id", user.id);
      if (error) throw error;
      if (data) {
        const map = {};
        data.forEach((progress) => { map[progress.lesson_id] = progress; });
        setHebrewProgress(map);
      }
    } catch (err) {
      console.error("loadHebrewProgress:", err);
    }
  }, [user]);

  const markHebrewComplete = useCallback(async (lessonId, score) => {
    if (!user) return;
    try {
      const existing = hebrewProgress[lessonId];
      if (existing) {
        await supabase.from("user_hebrew_progress").update({
          completed: true,
          score: score || existing.score,
          completed_at: new Date().toISOString(),
        }).eq("id", existing.id);
      } else {
        await supabase.from("user_hebrew_progress").insert({
          user_id: user.id,
          lesson_id: lessonId,
          completed: true,
          score,
          completed_at: new Date().toISOString(),
        });
      }
      await loadHebrewProgress();
    } catch (err) {
      console.error("markHebrewComplete:", err);
    }
  }, [hebrewProgress, loadHebrewProgress, user]);

  useEffect(() => {
    if (view === "hebrew-home") {
      void loadHebrewLessons(hebrewCategory);
      void loadHebrewProgress();
    }
  }, [view, hebrewCategory, loadHebrewLessons, loadHebrewProgress]);

  useEffect(() => {
    if (view === "hebrew-lesson" && hebrewLesson?.id) {
      void loadHebrewLesson(hebrewLesson.id);
    }
  }, [view, hebrewLesson?.id, loadHebrewLesson]);

  useEffect(() => {
    try {
      const xp = localStorage.getItem("hebrewXP");
      if (xp) setHebrewXP(JSON.parse(xp));
      const streakData = localStorage.getItem("hebrewStreak");
      if (streakData) setHebrewStreak(JSON.parse(streakData));
      const dailyDone = localStorage.getItem("hebrewDailyDone");
      if (dailyDone) setHebrewDailyDone(dailyDone);
      const flashcardHistory = localStorage.getItem("hebrewFlashcardHistory");
      if (flashcardHistory) setHebrewFlashcardHistory(JSON.parse(flashcardHistory));
    } catch {}
  }, []);

  useEffect(() => {
    try {
      localStorage.setItem("hebrewXP", JSON.stringify(hebrewXP));
    } catch {}
  }, [hebrewXP]);

  useEffect(() => {
    try {
      localStorage.setItem("hebrewStreak", JSON.stringify(hebrewStreak));
    } catch {}
  }, [hebrewStreak]);

  useEffect(() => {
    if (!hebrewDailyDone) return;
    try {
      localStorage.setItem("hebrewDailyDone", hebrewDailyDone);
    } catch {}
  }, [hebrewDailyDone]);

  useEffect(() => {
    try {
      localStorage.setItem("hebrewFlashcardHistory", JSON.stringify(hebrewFlashcardHistory));
    } catch {}
  }, [hebrewFlashcardHistory]);

  const awardHebrewXP = useCallback((amount) => {
    setHebrewXP((prev) => prev + amount);
  }, []);

  const updateHebrewStreak = useCallback(() => {
    const today = new Date().toISOString().split("T")[0];
    setHebrewStreak((prev) => {
      if (prev.lastDate === today) return prev;
      const yesterday = new Date(Date.now() - 86400000).toISOString().split("T")[0];
      const newCount = prev.lastDate === yesterday ? prev.count + 1 : 1;
      return { count: newCount, lastDate: today, longest: Math.max(newCount, prev.longest) };
    });
  }, []);

  const ensureGreekJson = useCallback(async () => {
    if (greekJsonCache.current) return greekJsonCache.current;
    try {
      const res = await fetch("/data/greek-lessons.json");
      if (!res.ok) throw new Error("Failed to fetch greek-lessons.json");
      const json = await res.json();
      greekJsonCache.current = json;
      return json;
    } catch (err) {
      console.error("ensureGreekJson:", err);
      return null;
    }
  }, []);

  const loadGreekLessons = useCallback(async (cat = "alphabet") => {
    setGreekError(null);
    try {
      const cacheKey = `greek-lessons-${cat}`;
      if (greekCache.current[cacheKey]) {
        setGreekLessons(greekCache.current[cacheKey]);
        return;
      }
      const json = await ensureGreekJson();
      if (!json) {
        setGreekError("Unable to load lessons.");
        return;
      }
      const data = json.categories[cat] || [];
      greekCache.current[cacheKey] = data;
      setGreekLessons(data);
      data.forEach((lesson) => { greekLessonCategories.current[lesson.id] = lesson.category; });
    } catch (err) {
      console.error("loadGreekLessons error:", err);
      setGreekError("Unable to load lessons. Please check your connection.");
    }
  }, [ensureGreekJson]);

  const loadGreekLesson = useCallback(async (lessonId) => {
    try {
      const cacheKey = `greek-lesson-${lessonId}`;
      if (greekCache.current[cacheKey]) {
        const cached = greekCache.current[cacheKey];
        setGreekLesson(cached.lesson);
        setGreekAlphabet(cached.alphabet);
        setGreekVocab(cached.vocab);
        return;
      }
      const json = await ensureGreekJson();
      if (!json) return;
      let lesson = null;
      for (const category of Object.values(json.categories)) {
        lesson = category.find((entry) => entry.id === lessonId);
        if (lesson) break;
      }
      if (!lesson) return;
      const alphabet = lesson._alphabet || null;
      const vocab = lesson._vocabulary || [];
      setGreekLesson(lesson);
      setGreekAlphabet(alphabet);
      setGreekVocab(vocab);
      greekCache.current[cacheKey] = { lesson, alphabet, vocab };
    } catch (err) {
      console.error("loadGreekLesson error:", err);
    }
  }, [ensureGreekJson]);

  const loadGreekProgress = useCallback(async () => {
    if (!user) return;
    try {
      const { data } = await supabase.from("user_greek_progress").select("*").eq("user_id", user.id);
      if (data) {
        const map = {};
        data.forEach((progress) => { map[progress.lesson_id] = progress; });
        setGreekProgress(map);
      }
    } catch (err) {
      console.error("loadGreekProgress error:", err);
    }
  }, [user]);

  const markGreekComplete = useCallback(async (lessonId, score) => {
    if (!user) return;
    try {
      const existing = greekProgress[lessonId];
      if (existing) {
        await supabase.from("user_greek_progress").update({
          completed: true,
          score: Math.max(score, existing.score || 0),
          completed_at: new Date().toISOString(),
        }).eq("id", existing.id);
      } else {
        await supabase.from("user_greek_progress").insert({
          user_id: user.id,
          lesson_id: lessonId,
          completed: true,
          score,
          completed_at: new Date().toISOString(),
        });
      }
      await loadGreekProgress();
    } catch (err) {
      console.error("markGreekComplete error:", err);
    }
  }, [greekProgress, loadGreekProgress, user]);

  const updateGreekStreak = useCallback(() => {
    const today = new Date().toISOString().slice(0, 10);
    const lastDate = localStorage.getItem("greekStreakLastDate");
    let count = parseInt(localStorage.getItem("greekStreakCount") || "0", 10);
    if (lastDate === today) return;
    const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
    count = lastDate === yesterday ? count + 1 : 1;
    localStorage.setItem("greekStreakCount", String(count));
    localStorage.setItem("greekStreakLastDate", today);
    setGreekStreak(count);
  }, []);

  useEffect(() => {
    if (view === "greek-home") {
      void loadGreekLessons(greekCategory);
      void loadGreekProgress();
    }
  }, [view, greekCategory, loadGreekLessons, loadGreekProgress]);

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

  useEffect(() => {
    if (view === "timeline-home" || view === "timeline-era") {
      void loadTimelineEras();
    }
  }, [view, loadTimelineEras]);

  useEffect(() => {
    if (view === "timeline-era" && timelineSelectedEra) {
      void loadTimelineEvents(timelineSelectedEra.era_key);
    }
  }, [view, timelineSelectedEra, loadTimelineEvents]);

  return {
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
  };
}
