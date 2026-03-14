"use client";
import { useState, useEffect, useRef, useMemo, useCallback } from "react";
import { useApp } from "../context/AppContext";

const formatTime = (s) => {
  if (!s || isNaN(s)) return "0:00";
  const m = Math.floor(s / 60);
  const sec = Math.floor(s % 60);
  return `${m}:${sec < 10 ? "0" : ""}${sec}`;
};

const SPEEDS = [0.75, 1, 1.25, 1.5, 2];
const SLEEP_OPTIONS = [0, 15, 30, 45, 60];

export default function PodcastPlayer({ mode = "mini" }) {
  const {
    podcastPlaying, setPodcastPlaying,
    podcastVisible, setPodcastVisible,
    currentEpisode, setCurrentEpisode,
    podcastSpeed, setPodcastSpeed,
    podcastSleepTimer, setPodcastSleepTimer,
    podcastListenedEpisodes,
    podcastAudioRef,
    markEpisodeListened, savePodcastPosition,
    savePodcastNote, loadPodcastNotes, deletePodcastNote,
    loadPodcastSeries,
    ht, darkMode, view, user, nav, bp,
  } = useApp();

  const [currentTime, setCurrentTime] = useState(0);
  const [duration, setDuration] = useState(0);
  const [progress, setProgress] = useState(0);
  const [seeking, setSeeking] = useState(false);
  const [notes, setNotes] = useState([]);
  const [noteText, setNoteText] = useState("");
  const [showNotes, setShowNotes] = useState(false);
  const [loadError, setLoadError] = useState(false);

  const audioElRef = useRef(null);
  const playingRef = useRef(false);
  const speedRef = useRef(podcastSpeed);
  const transcriptRef = useRef(null);
  const activeSegmentRef = useRef(null);
  const sleepTimerRef = useRef(null);
  const episodeRef = useRef(null);

  // Keep refs in sync
  useEffect(() => { playingRef.current = podcastPlaying; }, [podcastPlaying]);
  useEffect(() => { speedRef.current = podcastSpeed; }, [podcastSpeed]);
  useEffect(() => { episodeRef.current = currentEpisode; }, [currentEpisode]);

  // Initialize audio element
  useEffect(() => {
    if (!podcastAudioRef.current) {
      podcastAudioRef.current = new Audio();
      podcastAudioRef.current.preload = "auto";
    }
    audioElRef.current = podcastAudioRef.current;
    return () => {
      if (episodeRef.current && audioElRef.current) {
        savePodcastPosition(episodeRef.current.seriesSlug, episodeRef.current.episodeNum, audioElRef.current.currentTime);
      }
    };
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  // Set up audio source when episode changes
  useEffect(() => {
    if (!currentEpisode?.audioUrl || !audioElRef.current) return;
    const audio = audioElRef.current;
    setLoadError(false);

    if (audio.src !== currentEpisode.audioUrl) {
      audio.src = currentEpisode.audioUrl;
      audio.load();
      // Resume from saved position
      try {
        const saved = JSON.parse(localStorage.getItem(`cr_podcast_${currentEpisode.seriesSlug}`) || "null");
        if (saved && saved.episode === currentEpisode.episodeNum && saved.timestamp > 0) {
          audio.currentTime = saved.timestamp;
        }
      } catch {} // eslint-disable-line no-empty
    }
    audio.playbackRate = speedRef.current;

    audio.ontimeupdate = () => {
      if (!seeking) {
        setCurrentTime(audio.currentTime);
        setDuration(audio.duration || 0);
        setProgress(audio.duration ? audio.currentTime / audio.duration : 0);
      }
    };

    audio.onloadedmetadata = () => {
      setDuration(audio.duration || 0);
    };

    audio.onended = () => {
      playingRef.current = false;
      setPodcastPlaying(false);
      if (episodeRef.current) {
        markEpisodeListened(episodeRef.current.seriesSlug, episodeRef.current.episodeNum);
      }
    };

    audio.onerror = () => {
      setLoadError(true);
      setPodcastPlaying(false);
    };
  }, [currentEpisode?.audioUrl]); // eslint-disable-line react-hooks/exhaustive-deps

  // Play/pause sync
  useEffect(() => {
    if (!audioElRef.current) return;
    if (podcastPlaying) {
      audioElRef.current.play().catch(() => {});
    } else {
      audioElRef.current.pause();
      if (episodeRef.current && audioElRef.current.currentTime > 0) {
        savePodcastPosition(episodeRef.current.seriesSlug, episodeRef.current.episodeNum, audioElRef.current.currentTime);
      }
    }
  }, [podcastPlaying]); // eslint-disable-line react-hooks/exhaustive-deps

  // Speed sync
  useEffect(() => {
    if (audioElRef.current) audioElRef.current.playbackRate = podcastSpeed;
  }, [podcastSpeed]);

  // Sleep timer countdown
  useEffect(() => {
    if (sleepTimerRef.current) clearInterval(sleepTimerRef.current);
    if (podcastSleepTimer > 0 && podcastPlaying) {
      const endTime = Date.now() + podcastSleepTimer * 60000;
      sleepTimerRef.current = setInterval(() => {
        const remaining = Math.max(0, Math.ceil((endTime - Date.now()) / 60000));
        if (remaining <= 0) {
          clearInterval(sleepTimerRef.current);
          setPodcastPlaying(false);
          setPodcastSleepTimer(0);
        }
      }, 10000);
    }
    return () => { if (sleepTimerRef.current) clearInterval(sleepTimerRef.current); };
  }, [podcastSleepTimer, podcastPlaying, setPodcastPlaying, setPodcastSleepTimer]);

  // Media Session API
  useEffect(() => {
    if (typeof navigator === "undefined" || !("mediaSession" in navigator)) return;
    if (!podcastVisible || !currentEpisode) return;
    try {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: currentEpisode.title,
        artist: currentEpisode.seriesTitle || "The Bible Scrollers",
        album: "The Bible Scrollers Podcast",
        artwork: currentEpisode.artwork ? [{ src: currentEpisode.artwork, sizes: "400x400", type: "image/jpeg" }] : [],
      });
      navigator.mediaSession.setActionHandler("play", () => setPodcastPlaying(true));
      navigator.mediaSession.setActionHandler("pause", () => setPodcastPlaying(false));
      navigator.mediaSession.setActionHandler("seekforward", () => skipForward());
      navigator.mediaSession.setActionHandler("seekbackward", () => skipBackward());
    } catch {} // eslint-disable-line no-empty
    return () => {
      try {
        navigator.mediaSession.setActionHandler("play", null);
        navigator.mediaSession.setActionHandler("pause", null);
        navigator.mediaSession.setActionHandler("seekforward", null);
        navigator.mediaSession.setActionHandler("seekbackward", null);
      } catch {} // eslint-disable-line no-empty
    };
  }, [podcastVisible, currentEpisode, setPodcastPlaying]); // eslint-disable-line react-hooks/exhaustive-deps

  // Load notes for current episode
  useEffect(() => {
    if (user && currentEpisode && mode === "full") {
      loadPodcastNotes(currentEpisode.seriesSlug, currentEpisode.episodeNum).then(setNotes);
    }
  }, [user, currentEpisode, mode, loadPodcastNotes]);

  // ─── Controls ───
  const togglePlay = useCallback(() => {
    setPodcastPlaying(p => !p);
  }, [setPodcastPlaying]);

  const cycleSpeed = useCallback(() => {
    const idx = SPEEDS.indexOf(podcastSpeed);
    setPodcastSpeed(SPEEDS[(idx + 1) % SPEEDS.length]);
  }, [podcastSpeed, setPodcastSpeed]);

  const cycleSleepTimer = useCallback(() => {
    const idx = SLEEP_OPTIONS.indexOf(podcastSleepTimer);
    setPodcastSleepTimer(SLEEP_OPTIONS[(idx + 1) % SLEEP_OPTIONS.length]);
  }, [podcastSleepTimer, setPodcastSleepTimer]);

  const skipForward = useCallback(() => {
    if (audioElRef.current) audioElRef.current.currentTime = Math.min(audioElRef.current.duration || 0, audioElRef.current.currentTime + 15);
  }, []);

  const skipBackward = useCallback(() => {
    if (audioElRef.current) audioElRef.current.currentTime = Math.max(0, audioElRef.current.currentTime - 15);
  }, []);

  const close = useCallback(() => {
    if (audioElRef.current) {
      audioElRef.current.pause();
      if (episodeRef.current) {
        savePodcastPosition(episodeRef.current.seriesSlug, episodeRef.current.episodeNum, audioElRef.current.currentTime);
      }
    }
    setPodcastPlaying(false);
    setPodcastVisible(false);
  }, [setPodcastPlaying, setPodcastVisible, savePodcastPosition]);

  // Seek bar
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

  // Transcript segment click — seek to segment
  const handleSegmentClick = useCallback((seg) => {
    if (audioElRef.current) audioElRef.current.currentTime = seg.start;
  }, []);

  // Add note
  const handleAddNote = useCallback(async () => {
    if (!noteText.trim() || !currentEpisode) return;
    const ts = audioElRef.current ? audioElRef.current.currentTime : null;
    const result = await savePodcastNote(currentEpisode.seriesSlug, currentEpisode.episodeNum, noteText.trim(), ts);
    if (result) {
      setNotes(prev => [...prev, result]);
      setNoteText("");
    }
  }, [noteText, currentEpisode, savePodcastNote]);

  // Delete note
  const handleDeleteNote = useCallback(async (noteId) => {
    await deletePodcastNote(noteId);
    setNotes(prev => prev.filter(n => n.id !== noteId));
  }, [deletePodcastNote]);

  // Navigate to next/prev episode
  const navigateEpisode = useCallback(async (direction) => {
    if (!currentEpisode) return;
    const seriesData = await loadPodcastSeries(currentEpisode.seriesSlug);
    if (!seriesData?.episodes) return;
    const nextNum = currentEpisode.episodeNum + direction;
    const nextEp = seriesData.episodes[String(nextNum)];
    if (!nextEp) return;
    // Save current position
    if (audioElRef.current && episodeRef.current) {
      savePodcastPosition(episodeRef.current.seriesSlug, episodeRef.current.episodeNum, audioElRef.current.currentTime);
    }
    // Reset audio
    if (audioElRef.current) { audioElRef.current.pause(); audioElRef.current.src = ""; }
    setCurrentTime(0);
    setProgress(0);
    setLoadError(false);
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    setCurrentEpisode({
      ...currentEpisode, episodeNum: nextNum, title: nextEp.title,
      audioUrl: `${supabaseUrl}/storage/v1/object/public/podcasts/${nextEp.audioFile}`,
      transcript: nextEp.transcript || [], bibleRef: nextEp.bibleRef, duration: nextEp.duration,
      description: nextEp.description || "", keyPoints: nextEp.keyPoints || [],
    });
    setPodcastPlaying(true);
  }, [currentEpisode, loadPodcastSeries, savePodcastPosition, setCurrentEpisode, setPodcastPlaying]);

  // ─── Transcript ───
  const activeSegmentIndex = useMemo(() => {
    if (!currentEpisode?.transcript?.length) return -1;
    return currentEpisode.transcript.findIndex(seg => currentTime >= seg.start && currentTime < seg.end);
  }, [currentTime, currentEpisode]);

  // Auto-scroll to active segment
  useEffect(() => {
    if (activeSegmentRef.current && transcriptRef.current && mode === "full") {
      activeSegmentRef.current.scrollIntoView({ behavior: "smooth", block: "center" });
    }
  }, [activeSegmentIndex, mode]);

  // ─── Don't render conditions ───
  if (!podcastVisible || !currentEpisode) return null;
  if (mode === "mini" && view === "podcast-episode") return null;

  // ─── MINI PLAYER ───
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
              <svg width="14" height="14" viewBox="0 0 24 24" fill={podcastPlaying ? "#fff" : ht.accent}><rect x="6" y="4" width="4" height="16"/><rect x="14" y="4" width="4" height="16"/></svg>
            ) : (
              <svg width="14" height="14" viewBox="0 0 24 24" fill={ht.accent}><path d="M8 5v14l11-7z"/></svg>
            )}
          </button>
          {/* Info */}
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 13, fontWeight: 700, color: ht.dark, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>
              {currentEpisode.title}
            </div>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
              {currentEpisode.seriesTitle} · {formatTime(currentTime)} / {formatTime(duration)}
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

  // ─── FULL PLAYER ───
  const remaining = duration - currentTime;

  return (
    <div style={{ marginTop: 16 }}>
      {/* Audio load error */}
      {loadError && (
        <div style={{
          display: "flex", alignItems: "center", gap: 8, padding: "10px 14px",
          background: "#FEF2F2", border: "1px solid #FECACA",
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
          {/* Skip back 15s */}
          <button onClick={skipBackward} style={{ width: 40, height: 40, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2"><path d="M1 4v6h6"/><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"/></svg>
            <span style={{ position: "absolute", fontSize: 8, fontWeight: 700, color: ht.muted, fontFamily: ht.ui }}>15</span>
          </button>
          {/* Prev episode */}
          <button onClick={() => navigateEpisode(-1)} style={{ width: 36, height: 36, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill={ht.muted}><path d="M19 20L9 12l10-8v16zM7 4h2v16H7z"/></svg>
          </button>
          {/* Play/Pause */}
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
          {/* Next episode */}
          <button onClick={() => navigateEpisode(1)} style={{ width: 36, height: 36, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill={ht.muted}><path d="M5 4l10 8-10 8V4zM15 4h2v16h-2z"/></svg>
          </button>
          {/* Skip forward 15s */}
          <button onClick={skipForward} style={{ width: 40, height: 40, borderRadius: "50%", border: "none", background: "transparent", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2"><path d="M23 4v6h-6"/><path d="M20.49 15a9 9 0 1 1-2.12-9.36L23 10"/></svg>
            <span style={{ position: "absolute", fontSize: 8, fontWeight: 700, color: ht.muted, fontFamily: ht.ui }}>15</span>
          </button>
        </div>
        {/* Secondary controls */}
        <div style={{ display: "flex", justifyContent: "center", gap: 12 }}>
          {/* Speed */}
          <button onClick={cycleSpeed} style={{
            padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
            background: "transparent", cursor: "pointer",
            fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: podcastSpeed !== 1 ? ht.accent : ht.muted,
          }}>
            {podcastSpeed}x
          </button>
          {/* Sleep timer */}
          <button onClick={cycleSleepTimer} style={{
            padding: "4px 10px", borderRadius: 12, border: `1px solid ${ht.divider}`,
            background: "transparent", cursor: "pointer",
            fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: podcastSleepTimer > 0 ? ht.accent : ht.muted,
            display: "flex", alignItems: "center", gap: 4,
          }}>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/></svg>
            {podcastSleepTimer > 0 ? `${podcastSleepTimer}m` : "Sleep"}
          </button>
          {/* Notes toggle */}
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
      {currentEpisode.transcript?.length > 0 && (
        <div style={{ marginBottom: 16 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10 }}>
            Transcript
          </div>
          <div ref={transcriptRef} style={{
            maxHeight: 300, overflowY: "auto", borderRadius: 12,
            background: `${ht.card}`, border: `1px solid ${ht.divider}`,
            padding: "8px 0",
          }}>
            {currentEpisode.transcript.map((seg, i) => (
              <div
                key={i}
                ref={i === activeSegmentIndex ? activeSegmentRef : null}
                onClick={() => handleSegmentClick(seg, i)}
                style={{
                  padding: "8px 16px",
                  fontFamily: ht.body, fontSize: 14, lineHeight: 1.8,
                  color: i === activeSegmentIndex ? ht.dark : ht.muted,
                  background: i === activeSegmentIndex ? `${ht.accent}12` : "transparent",
                  borderLeft: i === activeSegmentIndex ? `3px solid ${ht.accent}` : "3px solid transparent",
                  borderRadius: 2,
                  cursor: "pointer",
                  transition: "all 0.3s ease",
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
                fontFamily: ht.body, fontSize: 14, color: ht.dark,
                outline: "none",
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
