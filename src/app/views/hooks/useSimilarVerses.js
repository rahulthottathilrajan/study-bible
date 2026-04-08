"use client";

import { useEffect, useRef, useState } from "react";

export function useSimilarVerses({ view, book, chapter, verse }) {
  const [similarVerses, setSimilarVerses] = useState([]);
  const [similarLoading, setSimilarLoading] = useState(false);
  const similarCache = useRef({});

  useEffect(() => {
    if (view !== "verse" || !book || !chapter || !verse) return;
    const ref = `${book} ${chapter}:${verse}`;
    if (similarCache.current[ref]) {
      setSimilarVerses(similarCache.current[ref]);
      return;
    }
    setSimilarLoading(true);
    setSimilarVerses([]);
    let cancelled = false;
    fetch("/api/similar-verses", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ verse_ref: ref }),
    })
      .then((response) => response.ok ? response.json() : { results: [] })
      .then(({ results }) => {
        if (cancelled) return;
        setSimilarVerses(results || []);
        similarCache.current[ref] = results || [];
      })
      .catch(() => {
        if (!cancelled) setSimilarVerses([]);
      })
      .finally(() => {
        if (!cancelled) setSimilarLoading(false);
      });
    return () => {
      cancelled = true;
    };
  }, [book, chapter, verse, view]);

  return {
    similarVerses,
    similarLoading,
  };
}
