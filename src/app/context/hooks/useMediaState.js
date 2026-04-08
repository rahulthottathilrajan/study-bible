"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { supabase } from "../../../lib/supabase";
import { BOOK_CODE_MAP, HD_AUDIO_BUCKET, HD_AUDIO_TRANSLATIONS } from "../../constants";

export function useMediaState({ book, chapter, bibleTranslation, user }) {
  const [audioPlaying, setAudioPlaying] = useState(false);
  const [audioVisible, setAudioVisible] = useState(false);
  const [sleepTimer, setSleepTimer] = useState(0);
  const [audioSource, setAudioSource] = useState("verseStudy");
  const [audioCurrentVerse, setAudioCurrentVerse] = useState(null);
  const [listenedChapters, setListenedChapters] = useState(() => {
    try {
      return JSON.parse(localStorage.getItem("listenedChapters") || "[]");
    } catch {
      return [];
    }
  });
  const [audioCurrentWord, setAudioCurrentWord] = useState(null);
  const [podcastPlaying, setPodcastPlaying] = useState(false);
  const [podcastVisible, setPodcastVisible] = useState(false);
  const [podcastEpisodeInfo, setPodcastEpisodeInfo] = useState(null);
  const [podcastCurrentTime, setPodcastCurrentTime] = useState(0);
  const [podcastDuration, setPodcastDuration] = useState(0);
  const [podcastListenedEpisodes, setPodcastListenedEpisodes] = useState(() => {
    try {
      return JSON.parse(localStorage.getItem("podcastListenedEpisodes") || "[]");
    } catch {
      return [];
    }
  });
  const [podcastSeries, setPodcastSeries] = useState(() => {
    try {
      const saved = JSON.parse(localStorage.getItem("podcastNavState") || "null");
      return saved?.podcastSeries || null;
    } catch {
      return null;
    }
  });
  const [podcastEpisode, setPodcastEpisode] = useState(() => {
    try {
      const saved = JSON.parse(localStorage.getItem("podcastNavState") || "null");
      return saved?.podcastEpisode || null;
    } catch {
      return null;
    }
  });
  const [podcastStreak, setPodcastStreak] = useState(() => {
    try {
      return JSON.parse(localStorage.getItem("podcastListeningStreak") || "null");
    } catch {
      return null;
    }
  });

  const audioTimestampsCache = useRef({});
  const podcastAudioRef = useRef(null);

  const markChapterListened = useCallback((bookName, chapterNumber) => {
    const key = `${bookName}:${chapterNumber}`;
    setListenedChapters((prev) => {
      if (prev.includes(key)) return prev;
      const next = [...prev, key];
      try { localStorage.setItem("listenedChapters", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  useEffect(() => {
    try {
      localStorage.setItem("podcastListenedEpisodes", JSON.stringify(podcastListenedEpisodes));
    } catch {}
  }, [podcastListenedEpisodes]);

  useEffect(() => {
    try {
      localStorage.setItem("podcastNavState", JSON.stringify({ podcastSeries, podcastEpisode }));
    } catch {}
  }, [podcastSeries, podcastEpisode]);

  const getHdAudioUrl = useCallback((bookName, chapterNumber, translation) => {
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    return `${supabaseUrl}/storage/v1/object/public/${HD_AUDIO_BUCKET}/${translation}/${bookCode}/${chapterNumber}.mp3`;
  }, []);

  const fetchAudioTimestamps = useCallback(async (bookName, chapterNumber, translation) => {
    const bookCode = BOOK_CODE_MAP[bookName];
    if (!bookCode) return null;
    const cacheKey = `${translation}:${bookCode}:${chapterNumber}`;
    if (audioTimestampsCache.current[cacheKey]) return audioTimestampsCache.current[cacheKey];
    try {
      const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
      const url = `${supabaseUrl}/storage/v1/object/public/${HD_AUDIO_BUCKET}/${translation}/${bookCode}/${chapterNumber}-ts.json`;
      const response = await fetch(url);
      if (!response.ok) return null;
      const data = await response.json();
      audioTimestampsCache.current[cacheKey] = data;
      return data;
    } catch {
      return null;
    }
  }, []);

  const audioAvailable = HD_AUDIO_TRANSLATIONS.includes(bibleTranslation);
  const hdAudioUrl = useMemo(() => (
    audioAvailable && book && chapter ? getHdAudioUrl(book, chapter, bibleTranslation) : null
  ), [audioAvailable, bibleTranslation, book, chapter, getHdAudioUrl]);

  useEffect(() => {
    if (audioAvailable && book && chapter) {
      Promise.resolve().then(() => {
        fetchAudioTimestamps(book, chapter, bibleTranslation);
      });
    }
    Promise.resolve().then(() => {
      setAudioCurrentWord(null);
    });
  }, [audioAvailable, bibleTranslation, book, chapter, fetchAudioTimestamps]);

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
  }, []);

  const updatePodcastStreak = useCallback(() => {
    const today = new Date().toISOString().slice(0, 10);
    setPodcastStreak((prev) => {
      const current = prev || { current: 0, longest: 0, lastDate: "" };
      if (current.lastDate === today) return prev;
      const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
      const nextCurrent = current.lastDate === yesterday ? current.current + 1 : 1;
      const nextLongest = Math.max(current.longest, nextCurrent);
      const updated = { current: nextCurrent, longest: nextLongest, lastDate: today };
      try { localStorage.setItem("podcastListeningStreak", JSON.stringify(updated)); } catch {}
      return updated;
    });
  }, []);

  const markEpisodeListened = useCallback((seriesSlug, episodeNumber) => {
    const key = `${seriesSlug}:${episodeNumber}`;
    setPodcastListenedEpisodes((prev) => {
      if (prev.includes(key)) return prev;
      return [...prev, key];
    });
    updatePodcastStreak();
    if (user) {
      supabase.from("podcast_listening_position").upsert(
        {
          user_id: user.id,
          series_slug: seriesSlug,
          episode_number: episodeNumber,
          completed: true,
          timestamp_seconds: 0,
          updated_at: new Date().toISOString(),
        },
        { onConflict: "user_id,series_slug,episode_number" },
      ).then(() => {});
    }
  }, [updatePodcastStreak, user]);

  return {
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
  };
}
