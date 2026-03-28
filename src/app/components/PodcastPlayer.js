"use client";
import { useState, useEffect, useRef, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { supabase } from "../../lib/supabase";

const formatTime = (s) => {
  if (!s || isNaN(s)) return "0:00";
  const m = Math.floor(s / 60);
  const sec = Math.floor(s % 60);
  return `${m}:${sec < 10 ? "0" : ""}${sec}`;
};

const SPEEDS = [0.75, 1, 1.25, 1.5, 2];
const SLEEP_OPTIONS = [0, 15, 30, 45, 60];
const WAVE_BARS = 40;

// Per-episode waveform: seed with episode number for unique shapes
const makeWaveHeights = (epNum) => Array.from({ length: WAVE_BARS }, (_, i) => {
  const seed = (epNum || 1) * 0.3;
  return Math.round(8 + Math.abs(Math.sin(i * 0.7 + seed) * 18) + Math.abs(Math.cos(i * 1.3 + seed) * 10));
});

// Confetti dots for celebration
const CONFETTI_COLORS = ["#F59E0B", "#22C55E", "#3B82F6", "#EC4899", "#8B5CF6", "#EF4444", "#14B8A6", "#F97316"];

/**
 * PodcastPlayer — self-contained audio player.
 *
 * Props (full mode only):
 *   episode     — { title, audioUrl, transcript, seriesSlug, episodeNum, seriesTitle, duration, ... }
 *   seriesData  — full series JSON (for prev/next navigation)
 *   onNavigateEpisode(epNum) — callback to navigate to a different episode
 *
 * Mini mode reads podcastEpisodeInfo + shared time state from AppContext.
 */
export default function PodcastPlayer({ mode = "mini", episode, seriesData, onNavigateEpisode }) {
  const {
    podcastPlaying, setPodcastPlaying,
    podcastVisible, setPodcastVisible,
    podcastEpisodeInfo, setPodcastEpisodeInfo,
    podcastAudioRef,
    podcastCurrentTime, setPodcastCurrentTime,
    podcastDuration, setPodcastDuration,
    markEpisodeListened,
    stopPodcast,
    audioPlaying, stopBibleAudio,
    podcastStreak, updatePodcastStreak,
    ht, darkMode, view, user, bp, nav,
  } = useApp();

  // ─── Local state (NOT in AppContext) ───
  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [progress, setProgress] = useState(0);
  const [seeking, setSeeking] = useState(false);
  const [speed, setSpeed] = useState(1);
  const [sleepTimer, setSleepTimer] = useState(0);
  const [notes, setNotes] = useState([]);
  const [noteText, setNoteText] = useState("");
  const [showNotes, setShowNotes] = useState(false);
  const [loadError, setLoadError] = useState(false);
  const [loadTimeout, setLoadTimeout] = useState(false);
  const [readerMode, setReaderMode] = useState(false);
  const [showCompletion, setShowCompletion] = useState(false);
  const [showReflection, setShowReflection] = useState(false);
  const [reflectionText, setReflectionText] = useState("");

  const audioElRef = useRef(null);
  const playingRef = useRef(false);
  const speedRef = useRef(1);
  const transcriptRef = useRef(null);
  const activeSegmentRef = useRef(null);
  const sleepTimerRef = useRef(null);
  const episodeRef = useRef(null);
  const loadTimeoutRef = useRef(null);

  // Keep refs in sync
  useEffect(() => { playingRef.current = podcastPlaying; }, [podcastPlaying]);
  useEffect(() => { speedRef.current = speed; }, [speed]);
  useEffect(() => { episodeRef.current = episode || null; }, [episode]);

  // Restore speed from localStorage
  useEffect(() => {
    try {
      const saved = parseFloat(localStorage.getItem("podcastSpeed"));
      if (SPEEDS.includes(saved)) { setSpeed(saved); speedRef.current = saved; }
    } catch {} // eslint-disable-line no-empty
  }, []);

  // Persist speed
  useEffect(() => {
    try { localStorage.setItem("podcastSpeed", String(speed)); } catch {} // eslint-disable-line no-empty
  }, [speed]);

  // ─── Initialize audio element ───
  useEffect(() => {
    if (!podcastAudioRef.current) {
      podcastAudioRef.current = new Audio();
      podcastAudioRef.current.preload = "auto";
    }
    audioElRef.current = podcastAudioRef.current;
  }, [podcastAudioRef]);

  // Save position on unmount
  useEffect(() => {
    return () => {
      const ep = episodeRef.current;
      const audio = audioElRef.current;
      if (ep && audio && audio.currentTime > 0) {
        savePosition(ep.seriesSlug, ep.episodeNum, audio.currentTime);
      }
    };
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  // ─── Set up audio source when episode prop changes (full mode) ───
  useEffect(() => {
    if (mode !== "full" || !episode?.audioUrl || !audioElRef.current) return;
    const audio = audioElRef.current;
    setLoadError(false);
    setLoadTimeout(false);
    if (loadTimeoutRef.current) clearTimeout(loadTimeoutRef.current);

    if (audio.src !== episode.audioUrl) {
      audio.src = episode.audioUrl;
      audio.load();

      // Bug 4: per-episode localStorage key (was per-series, causing collisions)
      let restored = false;
      try {
        const saved = JSON.parse(localStorage.getItem(`cr_podcast_${episode.seriesSlug}_${episode.episodeNum}`) || "null");
        if (saved && saved.timestamp > 0) {
          audio.currentTime = saved.timestamp;
          restored = true;
        }
      } catch {} // eslint-disable-line no-empty

      // Bug 3: cross-device restore from Supabase as fallback
      if (!restored && user) {
        supabase.from("podcast_listening_position")
          .select("timestamp_seconds")
          .eq("user_id", user.id)
          .eq("series_slug", episode.seriesSlug)
          .eq("episode_number", episode.episodeNum)
          .single()
          .then(({ data }) => {
            if (data && data.timestamp_seconds > 0 && audioElRef.current && !audioElRef.current.currentTime) {
              audioElRef.current.currentTime = data.timestamp_seconds;
            }
          });
      }
    }
    audio.playbackRate = speedRef.current;

    // Set AppContext info for mini player
    setPodcastEpisodeInfo({
      seriesSlug: episode.seriesSlug,
      episodeNum: episode.episodeNum,
      title: episode.title,
      seriesTitle: episode.seriesTitle,
    });

    audio.ontimeupdate = () => {
      if (!seeking) {
        const ct = audio.currentTime;
        const dur = audio.duration || 0;
        setCurrentTime(ct);
        setDuration(dur);
        setProgress(dur ? ct / dur : 0);
        // Bug 2: update shared context state for mini player
        setPodcastCurrentTime(ct);
        setPodcastDuration(dur);
      }
    };
    audio.onloadedmetadata = () => {
      const dur = audio.duration || 0;
      setDuration(dur);
      setPodcastDuration(dur);
      setLoadTimeout(false);
      if (loadTimeoutRef.current) clearTimeout(loadTimeoutRef.current);
    };
    audio.onended = () => {
      playingRef.current = false;
      setPodcastPlaying(false);
      const ep = episodeRef.current;
      if (ep) markEpisodeListened(ep.seriesSlug, ep.episodeNum);
      setShowCompletion(true);
    };
    audio.onerror = () => {
      setLoadError(true);
      setLoadTimeout(false);
      if (loadTimeoutRef.current) clearTimeout(loadTimeoutRef.current);
      setPodcastPlaying(false);
    };

    // Loading timeout: show message after 15s if metadata hasn't loaded
    loadTimeoutRef.current = setTimeout(() => setLoadTimeout(true), 15000);

    return () => { if (loadTimeoutRef.current) clearTimeout(loadTimeoutRef.current); };
  }, [episode?.audioUrl, mode]); // eslint-disable-line react-hooks/exhaustive-deps

  // ─── Play/pause sync ───
  useEffect(() => {
    if (!audioElRef.current) return;
    if (podcastPlaying) {
      // Bug 1: mutual exclusion — stop Bible audio when podcast starts
      if (audioPlaying) stopBibleAudio();
      setPodcastVisible(true);
      audioElRef.current.play().catch(() => {});
    } else {
      audioElRef.current.pause();
      const ep = episodeRef.current;
      if (ep && audioElRef.current.currentTime > 0) {
        savePosition(ep.seriesSlug, ep.episodeNum, audioElRef.current.currentTime);
      }
    }
  }, [podcastPlaying]); // eslint-disable-line react-hooks/exhaustive-deps

  // ─── Speed sync ───
  useEffect(() => {
    if (audioElRef.current) audioElRef.current.playbackRate = speed;
  }, [speed]);

  // ─── Sleep timer countdown (Bug 7: use setTimeout instead of setInterval for precision) ───
  useEffect(() => {
    if (sleepTimerRef.current) clearTimeout(sleepTimerRef.current);
    if (sleepTimer > 0 && podcastPlaying) {
      sleepTimerRef.current = setTimeout(() => {
        setPodcastPlaying(false);
        setSleepTimer(0);
      }, sleepTimer * 60000);
    }
    return () => { if (sleepTimerRef.current) clearTimeout(sleepTimerRef.current); };
  }, [sleepTimer, podcastPlaying, setPodcastPlaying]);

  // ─── Media Session API (Bug 6: added prev/next track handlers, cleanup) ───
  useEffect(() => {
    if (typeof navigator === "undefined" || !("mediaSession" in navigator)) return;
    if (!podcastVisible || !podcastEpisodeInfo) return;
    try {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: podcastEpisodeInfo.title,
        artist: podcastEpisodeInfo.seriesTitle || "The Bible Scrollers",
        album: "The Bible Scrollers Podcast",
      });
      navigator.mediaSession.setActionHandler("play", () => setPodcastPlaying(true));
      navigator.mediaSession.setActionHandler("pause", () => setPodcastPlaying(false));
      navigator.mediaSession.setActionHandler("seekforward", () => skipForward());
      navigator.mediaSession.setActionHandler("seekbackward", () => skipBackward());
      // prev/next track (full mode only — navigateEpisode needs seriesData)
      if (mode === "full" && onNavigateEpisode) {
        navigator.mediaSession.setActionHandler("previoustrack", () => navigateEpisode(-1));
        navigator.mediaSession.setActionHandler("nexttrack", () => navigateEpisode(1));
      }
    } catch {} // eslint-disable-line no-empty
    return () => {
      try {
        ["play", "pause", "seekforward", "seekbackward", "previoustrack", "nexttrack"]
          .forEach(a => navigator.mediaSession.setActionHandler(a, null));
      } catch {} // eslint-disable-line no-empty
    };
  }, [podcastVisible, podcastEpisodeInfo, mode]); // eslint-disable-line react-hooks/exhaustive-deps

  // ─── Load notes for current episode (full mode) ───
  useEffect(() => {
    if (!user || !episode || mode !== "full") return;
    supabase.from("podcast_notes")
      .select("*")
      .eq("user_id", user.id)
      .eq("series_slug", episode.seriesSlug)
      .eq("episode_number", episode.episodeNum)
      .order("created_at", { ascending: true })
      .then(({ data }) => { if (data) setNotes(data); });
  }, [user, episode, mode]);

  // ─── Controls ───
  const togglePlay = useCallback(() => setPodcastPlaying(p => !p), [setPodcastPlaying]);

  const cycleSpeed = useCallback(() => {
    setSpeed(prev => {
      const idx = SPEEDS.indexOf(prev);
      return SPEEDS[(idx + 1) % SPEEDS.length];
    });
  }, []);

  const cycleSleepTimer = useCallback(() => {
    setSleepTimer(prev => {
      const idx = SLEEP_OPTIONS.indexOf(prev);
      return SLEEP_OPTIONS[(idx + 1) % SLEEP_OPTIONS.length];
    });
  }, []);

  const skipForward = useCallback(() => {
    if (audioElRef.current) audioElRef.current.currentTime = Math.min(audioElRef.current.duration || 0, audioElRef.current.currentTime + 15);
  }, []);

  const skipBackward = useCallback(() => {
    if (audioElRef.current) audioElRef.current.currentTime = Math.max(0, audioElRef.current.currentTime - 15);
  }, []);

  const close = useCallback(() => {
    stopPodcast();
  }, [stopPodcast]);

  // ─── Seek bar ───
  const handleSeek = useCallback((e) => {
    if (!audioElRef.current) return;
    const rect = e.currentTarget.getBoundingClientRect();
    const clientX = e.touches ? e.touches[0].clientX : e.clientX;
    const fraction = Math.max(0, Math.min(1, (clientX - rect.left) / rect.width));
    const newTime = fraction * (audioElRef.current.duration || 0);
    audioElRef.current.currentTime = newTime;
    setCurrentTime(newTime);
    setProgress(fraction);
  }, []);

  // ─── Transcript segment click ───
  const handleSegmentClick = useCallback((seg) => {
    if (audioElRef.current) audioElRef.current.currentTime = seg.start;
  }, []);

  // ─── Prev/Next episode ───
  const navigateEpisode = useCallback((direction) => {
    if (!episode || !seriesData?.episodes || !onNavigateEpisode) return;
    const nextNum = episode.episodeNum + direction;
    const nextEp = seriesData.episodes[String(nextNum)];
    if (!nextEp) return;
    // Save current position
    if (audioElRef.current && episodeRef.current) {
      savePosition(episodeRef.current.seriesSlug, episodeRef.current.episodeNum, audioElRef.current.currentTime);
    }
    // Reset audio
    if (audioElRef.current) { audioElRef.current.pause(); audioElRef.current.src = ""; }
    setCurrentTime(0);
    setProgress(0);
    setLoadError(false);
    setLoadTimeout(false);
    setPodcastPlaying(false);
    onNavigateEpisode(nextNum);
  }, [episode, seriesData, onNavigateEpisode, setPodcastPlaying]);

  // ─── Notes CRUD (Bug 5: validate note length client-side) ───
  const handleAddNote = useCallback(async () => {
    if (!noteText.trim() || noteText.trim().length > 2000 || !episode || !user) return;
    const ts = audioElRef.current ? audioElRef.current.currentTime : null;
    const { data, error } = await supabase.from("podcast_notes").insert({
      user_id: user.id,
      series_slug: episode.seriesSlug,
      episode_number: episode.episodeNum,
      note_text: noteText.trim(),
      timestamp_seconds: ts ? Math.floor(ts) : null,
    }).select().single();
    if (!error && data) {
      setNotes(prev => [...prev, data]);
      setNoteText("");
    }
  }, [noteText, episode, user]);

  const handleDeleteNote = useCallback(async (noteId) => {
    await supabase.from("podcast_notes").delete().eq("id", noteId);
    setNotes(prev => prev.filter(n => n.id !== noteId));
  }, []);

  // ─── Retry loading audio ───
  const retryLoad = useCallback(() => {
    if (!audioElRef.current || !episode?.audioUrl) return;
    setLoadError(false);
    setLoadTimeout(false);
    audioElRef.current.src = episode.audioUrl;
    audioElRef.current.load();
    if (loadTimeoutRef.current) clearTimeout(loadTimeoutRef.current);
    loadTimeoutRef.current = setTimeout(() => setLoadTimeout(true), 15000);
  }, [episode?.audioUrl]);

  // ─── Save position helper (Bug 4: per-episode localStorage key) ───
  function savePosition(seriesSlug, episodeNum, timestamp) {
    try {
      localStorage.setItem(`cr_podcast_${seriesSlug}_${episodeNum}`, JSON.stringify({ timestamp }));
    } catch {} // eslint-disable-line no-empty
    if (user) {
      supabase.from("podcast_listening_position").upsert(
        { user_id: user.id, series_slug: seriesSlug, episode_number: episodeNum, timestamp_seconds: Math.floor(timestamp), completed: false, updated_at: new Date().toISOString() },
        { onConflict: "user_id,series_slug,episode_number" }
      ).then(() => {});
    }
  }

  // ─── Per-episode waveform ───
  const waveHeights = useMemo(() => makeWaveHeights(episode?.episodeNum), [episode?.episodeNum]);

  // ─── Active transcript segment ───
  const activeSegmentIndex = useMemo(() => {
    if (!episode?.transcript?.length) return -1;
    return episode.transcript.findIndex(seg => currentTime >= seg.start && currentTime < seg.end);
  }, [currentTime, episode]);

  // Auto-scroll to active segment
  useEffect(() => {
    if (activeSegmentRef.current && transcriptRef.current && mode === "full") {
      activeSegmentRef.current.scrollIntoView({ behavior: "smooth", block: "center" });
    }
  }, [activeSegmentIndex, mode]);

  // ─── Don't render conditions ───
  if (!ht) return null;
  if (mode === "mini") {
    if (!podcastVisible || !podcastEpisodeInfo) return null;
    if (view === "podcast-episode") return null; // full player is showing
  }

  // ═══ MINI PLAYER (Bug 2: uses shared context time, Polish: skip buttons + tap-to-expand) ═══
  if (mode === "mini") {
    const miniProgress = podcastDuration ? podcastCurrentTime / podcastDuration : 0;
    return (
      <div style={{
        position: "fixed", bottom: 56, left: 0, right: 0, zIndex: 45,
        background: ht.card, borderTop: `1px solid ${ht.divider}`,
        boxShadow: "0 -2px 12px rgba(0,0,0,0.1)",
        animation: "playerSlideUp 0.3s ease-out",
      }}>
        {/* Progress bar */}
        <div style={{ height: 3, background: ht.divider, position: "relative" }}>
          <div style={{ height: "100%", width: `${miniProgress * 100}%`, background: ht.accent, transition: "width 0.3s linear", borderRadius: "0 2px 2px 0" }} />
        </div>
        <div style={{
          display: "flex", alignItems: "center", gap: 6, padding: "8px 12px",
          maxWidth: bp.shell, margin: "0 auto",
        }}>
          {/* Play/Pause */}
          <button onClick={togglePlay} style={{
            width: 34, height: 34, borderRadius: "50%", border: `2px solid ${ht.accent}`,
            background: podcastPlaying ? ht.accent : "transparent", cursor: "pointer",
            display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0,
          }}>
            {podcastPlaying ? (
              <svg width="13" height="13" viewBox="0 0 24 24" fill="#fff"><rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/></svg>
            ) : (
              <svg width="13" height="13" viewBox="0 0 24 24" fill={ht.accent}><path d="M8 5v14l11-7z"/></svg>
            )}
          </button>
          {/* Skip backward */}
          <button onClick={skipBackward} style={{
            width: 24, height: 24, border: "none", background: "transparent",
            cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0,
          }}>
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2.5"><path d="M1 4v6h6"/><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"/></svg>
          </button>
          {/* Info (tap to expand) */}
          <button
            onClick={() => nav("podcast-episode", { podcastSeries: podcastEpisodeInfo.seriesSlug, podcastEpisode: podcastEpisodeInfo.episodeNum })}
            style={{ flex: 1, minWidth: 0, border: "none", background: "transparent", cursor: "pointer", textAlign: "left", padding: 0 }}
          >
            <div style={{ fontFamily: ht.heading, fontSize: 13, fontWeight: 700, color: ht.dark, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>
              {podcastEpisodeInfo.title}
            </div>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
              {podcastEpisodeInfo.seriesTitle} · {formatTime(podcastCurrentTime)} / {formatTime(podcastDuration)}
            </div>
          </button>
          {/* Skip forward */}
          <button onClick={skipForward} style={{
            width: 24, height: 24, border: "none", background: "transparent",
            cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0,
          }}>
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2.5"><path d="M23 4v6h-6"/><path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"/></svg>
          </button>
          {/* Close */}
          <button onClick={close} style={{
            width: 26, height: 26, borderRadius: "50%", border: "none",
            background: `${ht.muted}20`, cursor: "pointer",
            display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0,
          }}>
            <svg width="11" height="11" viewBox="0 0 24 24" stroke={ht.muted} strokeWidth="2.5" fill="none"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
          </button>
        </div>
      </div>
    );
  }

  // ═══ FULL PLAYER ═══
  if (!episode) return null;
  const remaining = duration - currentTime;

  return (
    <div style={{ marginTop: 16 }}>
      {/* Audio load error */}
      {(loadError || loadTimeout) && (
        <div style={{
          display: "flex", alignItems: "center", gap: 8, padding: "10px 14px",
          background: darkMode ? "#3B1C1C" : "#FEF2F2",
          border: `1px solid ${darkMode ? "#7F1D1D" : "#FECACA"}`,
          borderRadius: 10, marginBottom: 10, justifyContent: "center", flexWrap: "wrap",
        }}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#DC2626" strokeWidth="2"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
          <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: "#DC2626" }}>
            {loadError ? "Audio not available for this episode yet" : "Taking longer than expected..."}
          </span>
          <button onClick={retryLoad} style={{
            padding: "4px 12px", borderRadius: 8, border: `1px solid ${darkMode ? "#7F1D1D" : "#FECACA"}`,
            background: "transparent", cursor: "pointer", fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: "#DC2626",
          }}>
            Retry
          </button>
        </div>
      )}

      {/* ── Controls Card ── */}
      <div style={{
        background: `${ht.accent}0A`, border: `1px solid ${ht.accentBorder}`,
        borderRadius: 14, padding: "16px 18px", marginBottom: 16,
      }}>
        {/* Waveform seek bar */}
        <div
          onClick={handleSeek}
          onTouchMove={handleSeek}
          style={{
            display: "flex", alignItems: "center", gap: 1, cursor: "pointer",
            height: 36, marginBottom: 8, padding: "0 2px",
          }}
        >
          {waveHeights.map((h, i) => {
            const filled = i / WAVE_BARS < progress;
            return (
              <div key={i} style={{
                flex: 1, display: "flex", alignItems: "center", justifyContent: "center",
                height: "100%",
              }}>
                <div style={{
                  width: "100%", maxWidth: 3, height: h,
                  borderRadius: 2,
                  background: filled ? ht.accent : `${ht.muted}30`,
                  transition: "background 0.15s ease",
                }} />
              </div>
            );
          })}
        </div>
        {/* Time display */}
        <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 14 }}>
          <span style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontVariantNumeric: "tabular-nums" }}>{formatTime(currentTime)}</span>
          <span style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontVariantNumeric: "tabular-nums" }}>-{formatTime(remaining)}</span>
        </div>
        {/* Main controls */}
        <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: 16, marginBottom: 12 }}>
          <button onClick={skipBackward} style={{ width: 40, height: 40, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2"><path d="M1 4v6h6"/><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"/></svg>
            <span style={{ position: "absolute", fontSize: 8, fontWeight: 700, color: ht.muted, fontFamily: ht.ui }}>15</span>
          </button>
          <button onClick={() => navigateEpisode(-1)} style={{ width: 36, height: 36, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill={ht.muted}><path d="M19 20L9 12l10-8v16zM7 4h2v16H7z"/></svg>
          </button>
          <button onClick={loadError ? undefined : togglePlay} style={{
            width: 56, height: 56, borderRadius: "50%", border: `2.5px solid ${ht.accent}`,
            background: podcastPlaying ? ht.accent : "transparent", cursor: loadError ? "not-allowed" : "pointer",
            display: "flex", alignItems: "center", justifyContent: "center",
            boxShadow: podcastPlaying ? `0 2px 12px ${ht.accent}40` : "none",
            opacity: loadError ? 0.4 : 1,
          }}>
            {podcastPlaying ? (
              <svg width="22" height="22" viewBox="0 0 24 24" fill="#fff"><rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/></svg>
            ) : (
              <svg width="22" height="22" viewBox="0 0 24 24" fill={ht.accent}><path d="M8 5v14l11-7z"/></svg>
            )}
          </button>
          <button onClick={() => navigateEpisode(1)} style={{ width: 36, height: 36, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill={ht.muted}><path d="M5 4l10 8-10 8V4zM15 4h2v16h-2z"/></svg>
          </button>
          <button onClick={skipForward} style={{ width: 40, height: 40, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2"><path d="M23 4v6h-6"/><path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"/></svg>
            <span style={{ position: "absolute", fontSize: 8, fontWeight: 700, color: ht.muted, fontFamily: ht.ui }}>15</span>
          </button>
        </div>
        {/* Secondary controls */}
        <div style={{ display: "flex", justifyContent: "center", gap: 12 }}>
          <button onClick={cycleSpeed} style={{
            padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
            background: "transparent", cursor: "pointer",
            fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: speed !== 1 ? ht.accent : ht.muted,
          }}>
            {speed}x
          </button>
          <button onClick={cycleSleepTimer} style={{
            padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
            background: "transparent", cursor: "pointer",
            fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: sleepTimer > 0 ? ht.accent : ht.muted,
            display: "flex", alignItems: "center", gap: 4,
          }}>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
            {sleepTimer > 0 ? `${sleepTimer}m` : "Sleep"}
          </button>
          {episode?.transcript?.length > 0 && (
            <button onClick={() => setReaderMode(r => !r)} style={{
              padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
              background: readerMode ? `${ht.accent}15` : "transparent", cursor: "pointer",
              fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: readerMode ? ht.accent : ht.muted,
              display: "flex", alignItems: "center", gap: 4,
            }}>
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
              Reader
            </button>
          )}
          {user && (
            <button onClick={() => setShowNotes(s => !s)} style={{
              padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
              background: "transparent", cursor: "pointer",
              fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: showNotes ? ht.accent : ht.muted,
              display: "flex", alignItems: "center", gap: 4,
            }}>
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"/></svg>
              Notes{notes.length > 0 ? ` (${notes.length})` : ""}
            </button>
          )}
        </div>
      </div>

      {/* ── Transcript (supports Reader Mode) ── */}
      {episode.transcript?.length > 0 && (
        <div style={{ marginBottom: 16 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
            Transcript
          </div>
          <div ref={transcriptRef} style={{
            maxHeight: readerMode ? "none" : 300,
            overflowY: readerMode ? "visible" : "auto",
            borderRadius: 12,
            background: ht.card, border: `1px solid ${ht.divider}`,
            padding: readerMode ? "16px 0" : "8px 0",
          }}>
            {episode.transcript.map((seg, i) => {
              const isActive = i === activeSegmentIndex;
              const isAdjacent = Math.abs(i - activeSegmentIndex) === 1 && activeSegmentIndex >= 0;
              return (
                <div
                  key={i}
                  ref={isActive ? activeSegmentRef : null}
                  onClick={() => handleSegmentClick(seg)}
                  style={{
                    padding: readerMode ? "10px 20px" : "8px 16px",
                    fontFamily: ht.body,
                    fontSize: readerMode ? (isActive ? 19 : 17) : 14,
                    fontWeight: readerMode && isActive ? 600 : 400,
                    lineHeight: readerMode ? 2.0 : 1.8,
                    color: isActive ? ht.dark : ht.muted,
                    opacity: readerMode ? (isActive ? 1 : isAdjacent ? 0.6 : 0.35) : 1,
                    background: isActive ? `${ht.accent}12` : "transparent",
                    borderLeft: isActive ? `3px solid ${ht.accent}` : "3px solid transparent",
                    borderRadius: 2, cursor: "pointer",
                    transition: "all 0.4s ease",
                  }}
                >
                  {!readerMode && (
                    <span style={{
                      fontFamily: ht.ui, fontSize: 9, color: ht.light, marginRight: 8,
                      fontVariantNumeric: "tabular-nums",
                    }}>
                      {formatTime(seg.start)}
                    </span>
                  )}
                  {seg.text}
                  {readerMode && isActive && (
                    <span style={{
                      fontFamily: ht.ui, fontSize: 9, color: ht.accent, marginLeft: 8,
                      fontVariantNumeric: "tabular-nums", fontWeight: 600,
                    }}>
                      {formatTime(seg.start)}
                    </span>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* ── Notes Section (Bug 5: maxLength + char counter) ── */}
      {showNotes && user && (
        <div style={{ marginBottom: 16 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
            Episode Notes
          </div>
          <div style={{ display: "flex", gap: 8, marginBottom: 4 }}>
            <input
              value={noteText}
              onChange={e => setNoteText(e.target.value)}
              onKeyDown={e => { if (e.key === "Enter") handleAddNote(); }}
              placeholder="Add a note..."
              maxLength={2000}
              style={{
                flex: 1, padding: "10px 14px", borderRadius: 10,
                border: `1px solid ${ht.divider}`, background: ht.card,
                fontFamily: ht.body, fontSize: 14, color: ht.dark, outline: "none",
              }}
            />
            <button onClick={handleAddNote} style={{
              padding: "10px 16px", borderRadius: 10, border: "none",
              background: ht.accent, color: "#fff", fontFamily: ht.ui,
              fontSize: 12, fontWeight: 700, cursor: "pointer",
              opacity: noteText.trim() ? 1 : 0.5,
            }}>
              Save
            </button>
          </div>
          {noteText.length > 1800 && (
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: noteText.length > 1950 ? "#DC2626" : ht.muted, textAlign: "right", marginBottom: 8 }}>
              {2000 - noteText.length} characters remaining
            </div>
          )}
          {notes.map(note => (
            <div key={note.id} style={{
              padding: "10px 14px", borderRadius: 10, marginBottom: 8,
              background: `${ht.accent}08`, border: `1px solid ${ht.accentBorder}`,
            }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                <div style={{ flex: 1 }}>
                  {note.timestamp_seconds != null && (
                    <button
                      onClick={() => handleSegmentClick({ start: note.timestamp_seconds })}
                      style={{
                        fontFamily: ht.ui, fontSize: 9, color: ht.accent, fontWeight: 700,
                        background: `${ht.accent}15`, border: "none", borderRadius: 4,
                        padding: "2px 6px", cursor: "pointer", marginBottom: 4,
                      }}
                    >
                      {formatTime(note.timestamp_seconds)}
                    </button>
                  )}
                  <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.dark, lineHeight: 1.6 }}>
                    {note.note_text}
                  </div>
                </div>
                <button onClick={() => handleDeleteNote(note.id)} style={{
                  border: "none", background: "transparent", cursor: "pointer", padding: 4,
                }}>
                  <svg width="14" height="14" viewBox="0 0 24 24" stroke={ht.light} strokeWidth="2" fill="none"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* ── Episode Completion Celebration ── */}
      {showCompletion && (
        <div
          onClick={() => { setShowCompletion(false); setShowReflection(true); }}
          style={{
            position: "relative", marginTop: 16, padding: "32px 20px", borderRadius: 16,
            background: `${ht.accent}0A`, border: `1px solid ${ht.accentBorder}`,
            textAlign: "center", overflow: "hidden", cursor: "pointer",
            animation: "scaleIn 0.4s ease-out both",
          }}
        >
          {/* Confetti dots */}
          {CONFETTI_COLORS.map((color, i) => (
            <div key={i} style={{
              position: "absolute",
              left: `${15 + Math.sin(i * 0.8) * 35 + 35}%`,
              top: "50%",
              width: 8, height: 8, borderRadius: "50%",
              background: color,
              animation: `confettiFloat 1.5s ease-out ${i * 0.1}s both`,
            }} />
          ))}
          <div style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700, color: ht.dark, marginBottom: 8 }}>
            Episode Complete!
          </div>
          {podcastStreak?.current > 0 && (
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: "#F59E0B", fontWeight: 700, marginBottom: 12, display: "flex", alignItems: "center", justifyContent: "center", gap: 6 }}>
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none">
                <path d="M12 2C6.5 8.5 4 12 4 15a8 8 0 0 0 16 0c0-3-2.5-6.5-8-13z" fill="#F59E0B" stroke="#D97706" strokeWidth="1"/>
              </svg>
              {podcastStreak.current} day streak!
            </div>
          )}
          {/* Next episode button */}
          {(() => {
            if (!episode || !seriesData?.episodes) return null;
            const nextEp = seriesData.episodes[String(episode.episodeNum + 1)];
            if (!nextEp) return null;
            return (
              <button
                onClick={(e) => { e.stopPropagation(); setShowCompletion(false); onNavigateEpisode?.(episode.episodeNum + 1); }}
                style={{
                  padding: "10px 24px", borderRadius: 24, border: "none",
                  background: ht.accent, color: "#fff", fontFamily: ht.ui,
                  fontSize: 13, fontWeight: 700, cursor: "pointer", marginTop: 4,
                }}
              >
                Next Episode →
              </button>
            );
          })()}
          <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 12 }}>
            Tap to continue
          </div>
        </div>
      )}

      {/* ── Reflection Prompt (post-completion) ── */}
      {showReflection && !showCompletion && user && (
        <div style={{
          marginTop: 16, padding: "20px 18px", borderRadius: 14,
          background: `${ht.accent}08`, border: `1px solid ${ht.accentBorder}`,
          animation: "fadeIn 0.4s ease-out both",
        }}>
          <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: ht.dark, marginBottom: 4 }}>
            What spoke to you today?
          </div>
          {episode?.bibleRef && (
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.accent, fontWeight: 600, marginBottom: 10 }}>
              {episode.bibleRef}
            </div>
          )}
          <textarea
            value={reflectionText}
            onChange={e => setReflectionText(e.target.value)}
            placeholder="Take a moment to reflect..."
            rows={3}
            maxLength={2000}
            style={{
              width: "100%", padding: "10px 14px", borderRadius: 10,
              border: `1px solid ${ht.divider}`, background: ht.card,
              fontFamily: ht.body, fontSize: 14, color: ht.dark, outline: "none",
              resize: "vertical", boxSizing: "border-box",
            }}
          />
          <div style={{ display: "flex", gap: 8, marginTop: 10, justifyContent: "flex-end" }}>
            <button onClick={() => setShowReflection(false)} style={{
              padding: "8px 16px", borderRadius: 10, border: "none",
              background: "transparent", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.muted, cursor: "pointer",
            }}>
              Skip
            </button>
            <button onClick={async () => {
              if (!reflectionText.trim() || !episode) return;
              const ts = audioElRef.current ? audioElRef.current.currentTime : null;
              await supabase.from("podcast_notes").insert({
                user_id: user.id, series_slug: episode.seriesSlug,
                episode_number: episode.episodeNum,
                note_text: `[Reflection] ${reflectionText.trim()}`,
                timestamp_seconds: ts ? Math.floor(ts) : null,
              });
              setReflectionText("");
              setShowReflection(false);
            }} style={{
              padding: "8px 20px", borderRadius: 10, border: "none",
              background: ht.accent, color: "#fff", fontFamily: ht.ui,
              fontSize: 12, fontWeight: 700, cursor: "pointer",
              opacity: reflectionText.trim() ? 1 : 0.5,
            }}>
              Save Reflection
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
