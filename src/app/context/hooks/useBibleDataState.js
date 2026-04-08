"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import {
  BIBLE_BOOKS,
  BIBLE_TRANSLATIONS,
  BOOK_CODE_MAP,
  CATEGORY_THEME,
  DARK_THEMES,
  THEMES,
} from "../../constants";
import { supabase } from "../../../lib/supabase";

const initDbChapters = {};
BIBLE_BOOKS.forEach((book) => {
  initDbChapters[book.name] = Array.from({ length: book.chapters }, (_, index) => ({
    num: index + 1,
    theme: null,
  }));
});

export function useBibleDataState({
  darkMode,
  bibleTranslation,
  view,
  book,
  chapter,
  verse,
  setLoading,
  setChapterMeta,
  setVerses,
  onVerseMissing,
}) {
  const [dbChapters, setDbChapters] = useState(initDbChapters);
  const [collapsed, setCollapsed] = useState({});
  const [booksCollapsed, setBooksCollapsed] = useState({});
  const [overviewOpen, setOverviewOpen] = useState(false);
  const [chapterMeta, setChapterMetaState] = useState(null);
  const [verses, setVersesState] = useState([]);
  const [wordStudies, setWordStudies] = useState({});
  const [crossRefs, setCrossRefs] = useState({});
  const [dbLive, setDbLive] = useState(false);

  const bookCache = useRef({});
  const translationCache = useRef({});
  const prevTranslation = useRef(bibleTranslation);

  const bookInfo = useMemo(() => book ? BIBLE_BOOKS.find((entry) => entry.name === book) : null, [book]);
  const isOT = bookInfo?.testament === "OT";
  const currentVerse = verses.find((entry) => entry.verse_number === verse);
  const verseNums = verses.map((entry) => entry.verse_number).sort((a, b) => a - b);
  const curIdx = verseNums.indexOf(verse);
  const t = useMemo(() => {
    const key = bookInfo ? (CATEGORY_THEME[bookInfo.category] || "home") : "home";
    return darkMode ? DARK_THEMES[key] : THEMES[key];
  }, [bookInfo, darkMode]);
  const ht = darkMode ? DARK_THEMES.home : THEMES.home;

  const syncChapterMeta = useCallback((next) => {
    setChapterMetaState(next);
    if (setChapterMeta) setChapterMeta(next);
  }, [setChapterMeta]);

  const syncVerses = useCallback((next) => {
    setVersesState(next);
    if (setVerses) setVerses(next);
  }, [setVerses]);

  const getChapterFromCache = useCallback((bookName, chapterNumber) => {
    const slug = bookName.toLowerCase().replace(/\s+/g, "-");
    const bookData = bookCache.current[slug];
    return bookData?.chapters?.[String(chapterNumber)] || null;
  }, []);

  const fetchTranslatedVerses = useCallback(async (bookName, chapterNumber, translationId) => {
    if (translationId === "kjv") return null;
    const translation = BIBLE_TRANSLATIONS.find((entry) => entry.id === translationId);
    if (!translation?.cdnId) return null;
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const cacheKey = `${bookCode}:${chapterNumber}`;

    let translated = translationCache.current[translationId]?.[cacheKey];
    if (translated) return translated;

    try {
      let data = null;
      try {
        const localResponse = await fetch(`/data/translations/${translationId}/${bookCode}/${chapterNumber}.json`);
        if (localResponse.ok) translated = await localResponse.json();
      } catch {}

      if (!translated) {
        const response = await fetch(`https://bible.helloao.org/api/${translation.cdnId}/${bookCode}/${chapterNumber}.json`);
        if (!response.ok) return null;
        data = await response.json();
        translated = {};
        (data.chapter?.content || [])
          .filter((item) => item.type === "verse")
          .forEach((item) => {
            translated[item.number] = (item.content || [])
              .filter((content) => typeof content === "string" || content.text)
              .map((content) => typeof content === "string" ? content : content.text)
              .join("");
          });
      }

      if (!translationCache.current[translationId]) translationCache.current[translationId] = {};
      translationCache.current[translationId][cacheKey] = translated;
      return translated;
    } catch {
      return null;
    }
  }, []);

  const loadChapter = useCallback(async (bookName, chapterNumber) => {
    setLoading(true);
    try {
      const slug = bookName.toLowerCase().replace(/\s+/g, "-");
      let bookData = bookCache.current[slug];
      if (!bookData) {
        const response = await fetch(`/data/${slug}.json`);
        if (response.ok) {
          bookData = await response.json();
          bookCache.current[slug] = bookData;
          setDbChapters((prev) => {
            const existing = prev[bookName];
            if (!existing) return prev;
            const updated = existing.map((chapterEntry) => {
              const chapterData = bookData.chapters[String(chapterEntry.num)];
              return chapterData?.meta?.theme ? { ...chapterEntry, theme: chapterData.meta.theme } : chapterEntry;
            });
            return { ...prev, [bookName]: updated };
          });
        }
      }

      if (bookData) {
        const currentChapter = bookData.chapters[String(chapterNumber)];
        if (currentChapter) {
          syncChapterMeta(currentChapter.meta ? {
            overview: currentChapter.meta.overview || null,
            theme: currentChapter.meta.theme || null,
            key_word_original: currentChapter.meta.keyWordOriginal || null,
            key_word_meaning: currentChapter.meta.keyWordMeaning || null,
            outline: currentChapter.meta.outline ? JSON.stringify(currentChapter.meta.outline) : null,
          } : null);

          let chapterVerses = currentChapter.verses || [];
          setWordStudies(currentChapter.wordStudies || {});
          setCrossRefs(currentChapter.crossRefs || {});

          if (bibleTranslation !== "kjv") {
            const translated = await fetchTranslatedVerses(bookName, chapterNumber, bibleTranslation);
            if (translated) {
              chapterVerses = chapterVerses.map((entry) => ({
                ...entry,
                kjv_text: translated[entry.verse_number] || entry.kjv_text,
              }));
            }
          }
          syncVerses(chapterVerses);
          setLoading(false);
          return;
        }
      }

      const { data: bookDataRow } = await supabase.from("books").select("id").eq("name", bookName).single();
      if (!bookDataRow) {
        setLoading(false);
        return;
      }
      const { data: chapterData } = await supabase
        .from("chapters")
        .select("*")
        .eq("book_id", bookDataRow.id)
        .eq("chapter_number", chapterNumber)
        .single();
      if (!chapterData) {
        setLoading(false);
        return;
      }
      syncChapterMeta(chapterData);
      const { data: verseData } = await supabase.from("verses").select("*").eq("chapter_id", chapterData.id).order("verse_number");
      if (!verseData?.length) {
        setLoading(false);
        return;
      }
      syncVerses(verseData);
      const verseIds = verseData.map((entry) => entry.id);
      const { data: studies } = await supabase.from("word_studies").select("*").in("verse_id", verseIds).order("word_order");
      const studiesMap = {};
      if (studies) studies.forEach((entry) => {
        if (!studiesMap[entry.verse_id]) studiesMap[entry.verse_id] = [];
        studiesMap[entry.verse_id].push(entry);
      });
      setWordStudies(studiesMap);
      const { data: references } = await supabase.from("cross_references").select("*").in("verse_id", verseIds).order("ref_order");
      const referencesMap = {};
      if (references) references.forEach((entry) => {
        if (!referencesMap[entry.verse_id]) referencesMap[entry.verse_id] = [];
        referencesMap[entry.verse_id].push(entry);
      });
      setCrossRefs(referencesMap);
    } catch (error) {
      console.error("loadChapter error:", error);
    }
    setLoading(false);
  }, [bibleTranslation, fetchTranslatedVerses, setLoading, syncChapterMeta, syncVerses]);

  useEffect(() => {
    if (view === "chapter" && book) {
      const slug = book.toLowerCase().replace(/\s+/g, "-");
      if (!bookCache.current[slug]) {
        fetch(`/data/${slug}.json`)
          .then((response) => response.ok ? response.json() : null)
          .then((data) => {
            if (!data) return;
            bookCache.current[slug] = data;
            setDbChapters((prev) => {
              const existing = prev[book];
              if (!existing) return prev;
              const updated = existing.map((chapterEntry) => {
                const chapterData = data.chapters[String(chapterEntry.num)];
                return chapterData?.meta?.theme ? { ...chapterEntry, theme: chapterData.meta.theme } : chapterEntry;
              });
              return { ...prev, [book]: updated };
            });
          })
          .catch(() => {});
      }
    }
  }, [view, book]);

  useEffect(() => {
    if ((view === "verse" || view === "verses") && book && chapter) loadChapter(book, chapter);
  }, [view, book, chapter, loadChapter]);

  useEffect(() => {
    if (view === "verse" && !verse && verseNums.length > 0) onVerseMissing(verseNums[0]);
  }, [view, verse, verseNums, onVerseMissing]);

  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data?.length > 0 && !error) setDbLive(true);
      } catch {
        setDbLive(false);
      }
    })();
  }, []);

  useEffect(() => {
    if (prevTranslation.current === bibleTranslation) return;
    prevTranslation.current = bibleTranslation;
    if (!(view === "verse" || view === "verses") || !book || !chapter) return;

    const slug = book.toLowerCase().replace(/\s+/g, "-");
    const cached = bookCache.current[slug];
    if (!cached) return;
    const currentChapter = cached.chapters[String(chapter)];
    if (!currentChapter) return;
    const kjvVerses = currentChapter.verses || [];
    let cancelled = false;

    if (bibleTranslation === "kjv") {
      Promise.resolve().then(() => {
        if (!cancelled) syncVerses(kjvVerses);
      });
    } else {
      (async () => {
        const translated = await fetchTranslatedVerses(book, chapter, bibleTranslation);
        if (cancelled) return;
        if (translated) {
          syncVerses(kjvVerses.map((entry) => ({
            ...entry,
            kjv_text: translated[entry.verse_number] || entry.kjv_text,
          })));
        } else {
          syncVerses(kjvVerses);
        }
      })();
    }

    return () => {
      cancelled = true;
    };
  }, [bibleTranslation, view, book, chapter, fetchTranslatedVerses, syncVerses]);

  return {
    dbChapters,
    setDbChapters,
    collapsed,
    setCollapsed,
    booksCollapsed,
    setBooksCollapsed,
    overviewOpen,
    setOverviewOpen,
    chapterMeta,
    setChapterMeta: syncChapterMeta,
    verses,
    setVerses: syncVerses,
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
  };
}
