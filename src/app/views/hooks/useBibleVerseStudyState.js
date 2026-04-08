"use client";

import { useEffect, useMemo, useState } from "react";
import { useSimilarVerses } from "./useSimilarVerses";

function parseOutline(outlineJson) {
  if (!outlineJson) return [];

  try {
    const parsed = JSON.parse(outlineJson);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}

export function useBibleVerseStudyState({
  view,
  book,
  chapter,
  verse,
  chapterMeta,
  wordStudies,
  crossRefs,
  verseNums,
  user,
  isEnglishTrans,
  isOT,
  setVerse,
  setTab,
  setOverviewOpen,
  setPrayerTitle,
  setPrayerText,
  setPrayerModal,
}) {
  const [showColors, setShowColors] = useState(false);
  const [similarOpen, setSimilarOpen] = useState(false);
  const { similarVerses, similarLoading } = useSimilarVerses({ view, book, chapter, verse });

  useEffect(() => {
    const resetUiState = setTimeout(() => {
      setShowColors(false);
      setSimilarOpen(false);
    }, 0);

    return () => clearTimeout(resetUiState);
  }, [book, chapter, verse]);

  const vWords = wordStudies[String(verse)] || [];
  const vRefs = crossRefs[String(verse)] || [];
  const outline = useMemo(() => parseOutline(chapterMeta?.outline), [chapterMeta?.outline]);

  const verseIndex = verseNums.indexOf(verse);
  const canPrev = verseIndex > 0;
  const canNext = verseIndex < verseNums.length - 1;

  const tabOptions = [
    ...(isEnglishTrans ? [{ id: "study", label: "Study Notes" }] : []),
    { id: "original", label: isOT ? "Hebrew" : "Greek" },
    { id: "cross", label: `Cross-Refs${vRefs.length ? ` (${vRefs.length})` : ""}` },
    ...(user ? [{ id: "my", label: "My Notes" }] : []),
  ];

  function goToAdjacentVerse(direction) {
    const nextIndex = direction === "prev" ? verseIndex - 1 : verseIndex + 1;
    const nextVerse = verseNums[nextIndex];

    if (!nextVerse) return;

    setVerse(nextVerse);
    setTab("study");
  }

  function toggleOverview() {
    setOverviewOpen((open) => !open);
  }

  function toggleHighlightPicker() {
    setShowColors((open) => !open);
  }

  function openVersePrayer(titlePrefix = "") {
    const title = titlePrefix
      ? `${titlePrefix} ${book} ${chapter}:${verse}`
      : `${book} ${chapter}:${verse}`;

    setPrayerTitle(title);
    setPrayerText("");
    setPrayerModal(true);
  }

  function toggleSimilarOpen() {
    setSimilarOpen((open) => !open);
  }

  return {
    showColors,
    similarOpen,
    similarVerses,
    similarLoading,
    vWords,
    vRefs,
    outline,
    canPrev,
    canNext,
    tabOptions,
    toggleOverview,
    toggleHighlightPicker,
    goPrevVerse: () => goToAdjacentVerse("prev"),
    goNextVerse: () => goToAdjacentVerse("next"),
    openVersePrayer,
    toggleSimilarOpen,
  };
}
