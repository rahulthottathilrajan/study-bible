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
const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL;

/**
 * PodcastPlayer — self-contained audio player.
 *
 * Props (full mode only):
 *   episode     — { title, audioUrl, transcript, seriesSlug, episodeNum, seriesTitle, duration, ... }
 *   seriesData  — full series JSON (for prev/next navigation)
 *   onNavigateEpisode(epNum) — callback to navigate to a different episode
 *
 * Mini mode reads podcastEpisodeInfo from AppContext.
 */
export default function PodcastPlayer({ mode = "mini", episode, seriesData, onNavigateEpisode }) {
  const {
    podcastPlaying, setPodcastPlaying,
    podcastVisible, setPodcastVisible,
    podcastEpisodeInfo, setPodcastEpisodeInfo,
    podcastAudioRef,
    markEpisodeListened,
    stopPodcast,
    ht, darkMode, view, user, bp,
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

  const audioElRef = useRef(null);
  const playingRef = useRef(false);
  const speedRef = useRef(1);
  const transcriptRef = useRef(null);
  const activeSegmentRef = useRef(null);
  const sleepTimerRef = useRef(null);
  const episodeRef = useRef(null);

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

    if (audio.src !== episode.audioUrl) {
      audio.src = episode.audioUrl;
      audio.load();
      // Resume from saved position
      try {
        const saved = JSON.parse(localStorage.getItem(`cr_podcast_${episode.seriesSlug}`) || "null");
        if (saved && saved.episode === episode.episodeNum && saved.timestamp > 0) {
          audio.currentTime = saved.timestamp;
        }
      } catch {} // eslint-disable-line no-empty
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
        setCurrentTime(audio.currentTime);
        setDuration(audio.duration || 0);
        setProgress(audio.duration ? audio.currentTime / audio.duration : 0);
      }
    };
    audio.onloadedmetadata = () => setDuration(audio.duration || 0);
    audio.onended = () => {
      playingRef.current = false;
      setPodcastPlaying(false);
      const ep = episodeRef.current;
      if (ep) markEpisodeListened(ep.seriesSlug, ep.episodeNum);
    };
    audio.onerror = () => {
      setLoadError(true);
      setPodcastPlaying(false);
    };
  }, [episode?.audioUrl, mode]); // eslint-disable-line react-hooks/exhaustive-deps

  // ─── Play/pause sync ───
  useEffect(() => {
    if (!audioElRef.current) return;
    if (podcastPlaying) {
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

  // ─── Sleep timer countdown ───
  useEffect(() => {
    if (sleepTimerRef.current) clearInterval(sleepTimerRef.current);
    if (sleepTimer > 0 && podcastPlaying) {
      const endTime = Date.now() + sleepTimer * 60000;
      sleepTimerRef.current = setInterval(() => {
        if (Date.now() >= endTime) {
          clearInterval(sleepTimerRef.current);
          setPodcastPlaying(false);
          setSleepTimer(0);
        }
      }, 10000);
    }
    return () => { if (sleepTimerRef.current) clearInterval(sleepTimerRef.current); };
  }, [sleepTimer, podcastPlaying, setPodcastPlaying]);

  // ─── Media Session API ───
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
    } catch {} // eslint-disable-line no-empty
    return () => {
      try {
        ["play", "pause", "seekforward", "seekbackward"].forEach(a => navigator.mediaSession.setActionHandler(a, null));
      } catch {} // eslint-disable-line no-empty
    };
  }, [podcastVisible, podcastEpisodeInfo]); // eslint-disable-line react-hooks/exhaustive-deps

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
    setPodcastPlaying(false);
    onNavigateEpisode(nextNum);
  }, [episode, seriesData, onNavigateEpisode, setPodcastPlaying]);

  // ─── Notes CRUD (local Supabase calls) ───
  const handleAddNote = useCallback(async () => {
    if (!noteText.trim() || !episode || !user) return;
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

  // ─── Save position helper ───
  function savePosition(seriesSlug, episodeNum, timestamp) {
    try {
      localStorage.setItem(`cr_podcast_${seriesSlug}`, JSON.stringify({ episode: episodeNum, timestamp }));
    } catch {} // eslint-disable-line no-empty
    if (user) {
      supabase.from("podcast_listening_position").upsert(
        { user_id: user.id, series_slug: seriesSlug, episode_number: episodeNum, timestamp_seconds: Math.floor(timestamp), completed: false, updated_at: new Date().toISOString() },
        { onConflict: "user_id,series_slug,episode_number" }
      ).then(() => {});
    }
  }

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

  // ═══ MINI PLAYER ═══
  if (mode === "mini") {
    return (
      <div style={{
        position: "fixed", bottom: 56, left: 0, right: 0, zIndex: 45,
        background: ht.card, borderTop: `1px solid ${ht.divider}`,
        boxShadow: "0 -2px 12px rgba(0,0,0,0.1)",
        animation: "playerSlideUp 0.3s ease-out",
      }}>
        {/* Progress bar */}
        <div style={{ height: 3, background: ht.divider, position: "relative" }}>
          <div style={{ height: "100%", width: `${progress * 100}%`, background: ht.accent, transition: "width 0.3s linear", borderRadius: "0 2px 2px 0" }} />
        </div>
        <div style={{
          display: "flex", alignItems: "center", gap: 10, padding: "8px 14px",
          maxWidth: bp.shell, margin: "0 auto",
        }}>
          {/* Play/Pause */}
          <button onClick={togglePlay} style={{
            width: 36, height: 36, borderRadius: "50%", border: `2px solid ${ht.accent}`,
            background: podcastPlaying ? ht.accent : "transparent", cursor: "pointer",
            display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0,
          }}>
            {podcastPlaying ? (
              <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff"><rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/></svg>
            ) : (
              <svg width="14" height="14" viewBox="0 0 24 24" fill={ht.accent}><path d="M8 5v14l11-7z"/></svg>
            )}
          </button>
          {/* Info */}
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 13, fontWeight: 700, color: ht.dark, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>
              {podcastEpisodeInfo.title}
            </div>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
              {podcastEpisodeInfo.seriesTitle} · {formatTime(currentTime)} / {formatTime(duration)}
            </div>
          </div>
          {/* Close */}
          <button onClick={close} style={{
            width: 28, height: 28, borderRadius: "50%", border: "none",
            background: `${ht.muted}20`, cursor: "pointer",
            display: "flex", alignItems: "center", justifyContent: "center",
          }}>
            <svg width="12" height="12" viewBox="0 0 24 24" stroke={ht.muted} strokeWidth="2.5" fill="none"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
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
      {loadError && (
        <div style={{
          display: "flex", alignItems: "center", gap: 8, padding: "10px 14px",
          background: darkMode ? "#3B1C1C" : "#FEF2F2",
          border: `1px solid ${darkMode ? "#7F1D1D" : "#FECACA"}`,
          borderRadius: 10, marginBottom: 10, justifyContent: "center",
        }}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#DC2626" strokeWidth="2"><circle cx="12" cy="12" r="10"/><line x1="15" y1="9" x2="9" y2="15"/><line x1="9" y1="9" x2="15" y2="15"/></svg>
          <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: "#DC2626" }}>
            Audio not available for this episode yet
          </span>
        </div>
      )}

      {/* ── Controls Card ── */}
      <div style={{
        background: `${ht.accent}0A`, border: `1px solid ${ht.accentBorder}`,
        borderRadius: 14, padding: "16px 18px", marginBottom: 16,
      }}>
        {/* Seek bar */}
        <div
          onClick={handleSeek}
          onTouchMove={handleSeek}
          style={{
            height: 6, background: ht.divider, borderRadius: 3, cursor: "pointer",
            position: "relative", marginBottom: 8,
          }}
        >
          <div style={{
            height: "100%", width: `${progress * 100}%`, background: ht.accent,
            borderRadius: 3, transition: seeking ? "none" : "width 0.3s linear",
            position: "relative",
          }}>
            <div style={{
              position: "absolute", right: -6, top: -5, width: 16, height: 16,
              borderRadius: "50%", background: ht.accent, border: `2px solid ${ht.card}`,
              boxShadow: "0 1px 4px rgba(0,0,0,0.2)",
            }} />
          </div>
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

      {/* ── Transcript ── */}
      {episode.transcript?.length > 0 && (
        <div style={{ marginBottom: 16 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
            Transcript
          </div>
          <div ref={transcriptRef} style={{
            maxHeight: 300, overflowY: "auto", borderRadius: 12,
            background: ht.card, border: `1px solid ${ht.divider}`,
            padding: "8px 0",
          }}>
            {episode.transcript.map((seg, i) => (
              <div
                key={i}
                ref={i === activeSegmentIndex ? activeSegmentRef : null}
                onClick={() => handleSegmentClick(seg)}
                style={{
                  padding: "8px 16px",
                  fontFamily: ht.body, fontSize: 14, lineHeight: 1.8,
                  color: i === activeSegmentIndex ? ht.dark : ht.muted,
                  background: i === activeSegmentIndex ? `${ht.accent}12` : "transparent",
                  borderLeft: i === activeSegmentIndex ? `3px solid ${ht.accent}` : "3px solid transparent",
                  borderRadius: 2, cursor: "pointer", transition: "all 0.3s ease",
                }}
              >
                <span style={{
                  fontFamily: ht.ui, fontSize: 9, color: ht.light, marginRight: 8,
                  fontVariantNumeric: "tabular-nums",
                }}>
                  {formatTime(seg.start)}
                </span>
                {seg.text}
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ── Notes Section ── */}
      {showNotes && user && (
        <div style={{ marginBottom: 16 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
            Episode Notes
          </div>
          <div style={{ display: "flex", gap: 8, marginBottom: 12 }}>
            <input
              value={noteText}
              onChange={e => setNoteText(e.target.value)}
              onKeyDown={e => { if (e.key === "Enter") handleAddNote(); }}
              placeholder="Add a note..."
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
            }}>
              Save
            </button>
          </div>
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
    </div>
  );
}
