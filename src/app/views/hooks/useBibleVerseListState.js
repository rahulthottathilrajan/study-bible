"use client";

import { useCallback, useEffect, useRef, useState } from "react";

export function useBibleVerseListState({
  view,
  loading,
  book,
  chapter,
  bookInfo,
  bibleTranslation,
  getChapterFromCache,
  fetchTranslatedVerses,
  loadUserDataForChapter,
  audioPlaying,
  audioSource,
  audioCurrentVerse,
  audioCurrentWord,
  isRtl,
  t,
}) {
  const verseRefs = useRef({});
  const [autoScrollEnabled, setAutoScrollEnabled] = useState(true);
  const userScrolledRef = useRef(false);

  useEffect(() => {
    if (!audioPlaying || audioSource !== "verseList" || !autoScrollEnabled) return;
    if (audioCurrentVerse && verseRefs.current[audioCurrentVerse]) {
      verseRefs.current[audioCurrentVerse].scrollIntoView({ behavior: "smooth", block: "center" });
    }
  }, [audioCurrentVerse, audioPlaying, audioSource, autoScrollEnabled]);

  useEffect(() => {
    if (!audioPlaying || audioSource !== "verseList") {
      const resetTimer = setTimeout(() => {
        setAutoScrollEnabled(true);
      }, 0);
      return () => clearTimeout(resetTimer);
    }
    let scrollTimeout;
    const handleScroll = () => {
      userScrolledRef.current = true;
      setAutoScrollEnabled(false);
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => {
        userScrolledRef.current = false;
      }, 4000);
    };
    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => {
      window.removeEventListener("scroll", handleScroll);
      clearTimeout(scrollTimeout);
    };
  }, [audioPlaying, audioSource]);

  useEffect(() => {
    if (!audioPlaying) {
      const resetTimer = setTimeout(() => {
        setAutoScrollEnabled(true);
      }, 0);
      return () => clearTimeout(resetTimer);
    }
  }, [audioPlaying]);

  const [chaptersData, setChaptersData] = useState([]);
  const [visibleChNum, setVisibleChNum] = useState(chapter);
  const loadedSetRef = useRef(new Set());
  const bottomSentinelRef = useRef(null);
  const chapterHeaderRefs = useRef({});
  const initBookRef = useRef(null);

  const appendChapter = useCallback(async (chNum) => {
    if (!bookInfo || chNum < 1 || chNum > bookInfo.chapters) return;
    if (loadedSetRef.current.has(chNum)) return;

    const chData = getChapterFromCache(book, chNum);
    if (!chData) return;
    loadedSetRef.current.add(chNum);

    let chVerses = [...chData.verses];
    if (bibleTranslation !== "kjv") {
      const translated = await fetchTranslatedVerses(book, chNum, bibleTranslation);
      if (translated) {
        chVerses = chVerses.map((verse) => ({
          ...verse,
          kjv_text: translated[verse.verse_number] || verse.kjv_text,
        }));
      }
    }

    const userData = await loadUserDataForChapter(book, chNum);

    setChaptersData((prev) => {
      if (prev.some((entry) => entry.chNum === chNum)) return prev;
      return [...prev, { chNum, verses: chVerses, meta: chData.meta, ...userData }].sort((a, b) => a.chNum - b.chNum);
    });
  }, [bibleTranslation, book, bookInfo, fetchTranslatedVerses, getChapterFromCache, loadUserDataForChapter]);

  useEffect(() => {
    if (view !== "verses" || loading || !book || !chapter || !bookInfo) return;
    if (initBookRef.current !== book) {
      initBookRef.current = book;
      loadedSetRef.current = new Set();
      chapterHeaderRefs.current = {};
      const resetTimer = setTimeout(() => {
        setChaptersData([]);
        setVisibleChNum(chapter);
        void appendChapter(chapter);
      }, 0);
      return () => clearTimeout(resetTimer);
    }
    if (loadedSetRef.current.size > 0 && !loadedSetRef.current.has(chapter)) {
      loadedSetRef.current = new Set();
      chapterHeaderRefs.current = {};
      const resetTimer = setTimeout(() => {
        setChaptersData([]);
        setVisibleChNum(chapter);
        void appendChapter(chapter);
      }, 0);
      return () => clearTimeout(resetTimer);
    }
    if (loadedSetRef.current.size === 0) {
      initBookRef.current = book;
      const resetTimer = setTimeout(() => {
        setVisibleChNum(chapter);
        void appendChapter(chapter);
      }, 0);
      return () => clearTimeout(resetTimer);
    }
  }, [appendChapter, book, bookInfo, chapter, loading, view]);

  const prevTransRef = useRef(bibleTranslation);
  useEffect(() => {
    if (prevTransRef.current === bibleTranslation) return;
    prevTransRef.current = bibleTranslation;
    if (view !== "verses" || !book) return;
    initBookRef.current = null;
    loadedSetRef.current = new Set();
    const resetTimer = setTimeout(() => {
      setChaptersData([]);
      void appendChapter(chapter);
    }, 0);
    return () => clearTimeout(resetTimer);
  }, [appendChapter, bibleTranslation, book, chapter, view]);

  useEffect(() => {
    if (view !== "verses" || chaptersData.length === 0) return;
    const sentinel = bottomSentinelRef.current;
    if (!sentinel) return;
    const observer = new IntersectionObserver(([entry]) => {
      if (entry.isIntersecting) {
        const lastCh = Math.max(...chaptersData.map((entry2) => entry2.chNum));
        if (lastCh < (bookInfo?.chapters || 0)) {
          void appendChapter(lastCh + 1);
        }
      }
    }, { rootMargin: "600px" });
    observer.observe(sentinel);
    return () => observer.disconnect();
  }, [appendChapter, bookInfo, chaptersData, view]);

  useEffect(() => {
    if (view !== "verses" || chaptersData.length === 0) return;
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const ch = parseInt(entry.target.dataset.chapter, 10);
          if (ch && !Number.isNaN(ch)) setVisibleChNum(ch);
        }
      });
    }, { rootMargin: "-20% 0px -75% 0px" });
    Object.values(chapterHeaderRefs.current).forEach((el) => {
      if (el) observer.observe(el);
    });
    return () => observer.disconnect();
  }, [chaptersData, view]);

  const renderVerseText = useCallback((text, verseNum, style) => {
    const isKaraoke = audioPlaying && audioCurrentWord && audioCurrentWord.verseNum === verseNum;
    if (!isKaraoke || isRtl) {
      return <div style={style}>{text}</div>;
    }
    const words = text.split(/(\s+)/);
    let wordIdx = 0;
    return (
      <div style={style}>
        {words.map((word, i) => {
          if (/^\s+$/.test(word)) return <span key={i}>{word}</span>;
          const isActive = audioCurrentWord.verseWordIdx === wordIdx;
          wordIdx += 1;
          return (
            <span
              key={i}
              style={isActive ? {
                background: `${t.accent}30`,
                borderRadius: 3,
                padding: "1px 2px",
                margin: "-1px -2px",
                animation: "wordGlow 0.3s ease",
              } : undefined}
            >
              {word}
            </span>
          );
        })}
      </div>
    );
  }, [audioCurrentWord, audioPlaying, isRtl, t.accent]);

  return {
    verseRefs,
    autoScrollEnabled,
    setAutoScrollEnabled,
    chaptersData,
    visibleChNum,
    bottomSentinelRef,
    chapterHeaderRefs,
    renderVerseText,
  };
}
