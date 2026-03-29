"use client";
import { useEffect, useRef, useState, useCallback } from "react";
import { useApp } from "../context/AppContext";

const formatTime = (s) => {
  if (!s || !isFinite(s)) return "0:00";
  const m = Math.floor(s / 60);
  const sec = Math.floor(s % 60);
  return `${m}:${sec < 10 ? "0" : ""}${sec}`;
};

export default function AudioPlayer() {
  const {
    audioPlaying, setAudioPlaying,
    audioVisible, setAudioVisible,
    sleepTimer, setSleepTimer,
    audioSource, audioCurrentVerse, setAudioCurrentVerse,
    verses, verse, verseNums,
    setVerse: changeVerse,
    book, chapter, bibleTranslation,
    t, darkMode, view,
    markChapterListened,
    podcastPlaying, stopPodcast,
    hdAudioUrl, fetchAudioTimestamps,
    audioCurrentWord, setAudioCurrentWord,
  } = useApp();

  const [speed, setSpeed] = useState(() => {
    try { return parseFloat(localStorage.getItem("audioSpeed") || "1"); } catch { return 1; }
  });
  const [currentIdx, setCurrentIdx] = useState(0);

  // Resume nudge
  const [resumeNudge, setResumeNudge] = useState(null);

  // Audio progress state
  const [cdnProgress, setCdnProgress] = useState(0);
  const [cdnDuration, setCdnDuration] = useState(0);
  const [cdnCurrentTime, setCdnCurrentTime] = useState(0);

  // Refs to avoid stale closures
  const idxRef         = useRef(0);
  const playingRef     = useRef(false);
  const speedRef       = useRef(speed);
  const versesRef      = useRef(verses);
  const verseNumsRef   = useRef(verseNums);
  const audioElRef      = useRef(null); // HTML5 Audio element for HD audio
  const sleepTimerRef   = useRef(null);
  const audioSourceRef  = useRef(audioSource);
  const lastCdnVerseRef = useRef(null);
  const timestampDataRef = useRef(null); // HD audio timestamp data for current chapter

  // Keep refs in sync
  useEffect(() => { versesRef.current    = verses;    }, [verses]);
  useEffect(() => { verseNumsRef.current = verseNums; }, [verseNums]);
  useEffect(() => { speedRef.current     = speed;     }, [speed]);
  useEffect(() => { audioSourceRef.current = audioSource; }, [audioSource]);

  // Sync idx when verse changes externally
  useEffect(() => {
    const idx = verseNums.indexOf(verse);
    if (idx !== -1) { idxRef.current = idx; setCurrentIdx(idx); }
  }, [verse, verseNums]);

  // ─── Resume nudge on player open ───
  useEffect(() => {
    if (!audioVisible) return;
    try {
      const saved = JSON.parse(localStorage.getItem("audioPosition") || "null");
      if (saved && saved.book === book && saved.chapter === chapter) {
        const idx = verseNums.indexOf(saved.verseNum);
        if (idx > 0) setResumeNudge(saved.verseNum);
      }
    } catch {}
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [audioVisible]);

  // ─── Stop audio when user leaves Bible reading views ───
  useEffect(() => {
    if (view !== "verse" && view !== "verses") {
      playingRef.current = false;
      setAudioPlaying(false);
      setAudioVisible(false);
      if (audioElRef.current) { audioElRef.current.pause(); }
    }
  }, [view, setAudioPlaying, setAudioVisible]);

  // ─── Save position helper ───
  const savePosition = useCallback((verseNum) => {
    try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}
  }, [book, chapter]);

  // ─── Clear timestamp data when chapter/translation changes ───
  useEffect(() => {
    timestampDataRef.current = null;
  }, [book, chapter, bibleTranslation]);

  // ─── Cleanup on unmount ───
  useEffect(() => {
    return () => {
      if (audioElRef.current) { audioElRef.current.pause(); audioElRef.current.src = ""; }
      timestampDataRef.current = null;
      const verseNum = verseNumsRef.current[idxRef.current];
      if (verseNum) {
        try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}
      }
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [book, chapter]);

  // ═══ HD AUDIO ENGINE (Google Cloud TTS) ═══
  const playHDAudio = useCallback(async () => {
    if (!hdAudioUrl) return;

    if (!audioElRef.current) {
      audioElRef.current = new Audio();
      audioElRef.current.preload = "auto";
    }
    const audio = audioElRef.current;

    // Only change src if different
    if (!audio.src || !audio.src.includes(hdAudioUrl.split("/").pop())) {
      audio.src = hdAudioUrl;
      audio.load();
    }
    audio.playbackRate = speedRef.current;

    // Load timestamp data for precise verse tracking + karaoke
    let tsData = timestampDataRef.current;
    if (!tsData) {
      tsData = await fetchAudioTimestamps(book, chapter, bibleTranslation);
      timestampDataRef.current = tsData;
    }

    audio.ontimeupdate = () => {
      setCdnCurrentTime(audio.currentTime);
      setCdnProgress(audio.duration ? audio.currentTime / audio.duration : 0);

      const currentTime = audio.currentTime;

      if (tsData && tsData.verses) {
        // Use timestamp data for precise verse tracking
        let currentVerseNum = null;
        for (let i = tsData.verses.length - 1; i >= 0; i--) {
          if (currentTime >= tsData.verses[i].start) {
            currentVerseNum = tsData.verses[i].num;
            break;
          }
        }
        if (currentVerseNum && currentVerseNum !== lastCdnVerseRef.current) {
          lastCdnVerseRef.current = currentVerseNum;
          setAudioCurrentVerse(currentVerseNum);
          const verseIdx = verseNumsRef.current.indexOf(currentVerseNum);
          if (verseIdx !== -1) {
            idxRef.current = verseIdx;
            setCurrentIdx(verseIdx);
          }
          if (audioSourceRef.current === "verseStudy") {
            changeVerse(currentVerseNum);
          }
          try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum: currentVerseNum })); } catch {}
        }

        // Word-level karaoke: binary search for current word
        if (tsData.words && tsData.words.length > 0) {
          let lo = 0, hi = tsData.words.length - 1, wordIdx = -1;
          while (lo <= hi) {
            const mid = (lo + hi) >> 1;
            if (tsData.words[mid].start <= currentTime) {
              wordIdx = mid;
              lo = mid + 1;
            } else {
              hi = mid - 1;
            }
          }
          if (wordIdx >= 0) {
            const w = tsData.words[wordIdx];
            if (currentTime <= w.end) {
              setAudioCurrentWord({ verseNum: w.verse, wordIdx, verseWordIdx: w.verseWordIdx, text: w.text });
            } else {
              setAudioCurrentWord(null);
            }
          }
        }
      } else {
        // Fallback: linear interpolation (no timestamps)
        const vNums = verseNumsRef.current;
        if (vNums.length > 0 && audio.duration > 0) {
          const fraction = currentTime / audio.duration;
          const verseIdx = Math.min(Math.floor(fraction * vNums.length), vNums.length - 1);
          const vNum = vNums[verseIdx];
          if (vNum !== lastCdnVerseRef.current) {
            lastCdnVerseRef.current = vNum;
            setAudioCurrentVerse(vNum);
            idxRef.current = verseIdx;
            setCurrentIdx(verseIdx);
            if (audioSourceRef.current === "verseStudy") changeVerse(vNum);
            try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum: vNum })); } catch {}
          }
        }
      }
    };
    audio.ondurationchange = () => setCdnDuration(audio.duration || 0);
    audio.onended = () => {
      playingRef.current = false;
      setAudioPlaying(false);
      setAudioCurrentWord(null);
      if (markChapterListened) markChapterListened(book, chapter);
    };
    audio.onerror = () => {
      console.warn("HD audio failed to load");
      timestampDataRef.current = null;
      setAudioCurrentWord(null);
      playingRef.current = false;
      setAudioPlaying(false);
    };

    audio.play().catch(() => {});
  }, [hdAudioUrl, bibleTranslation, book, chapter, fetchAudioTimestamps, markChapterListened, setAudioPlaying, setAudioCurrentVerse, changeVerse, setAudioCurrentWord]);

  // ═══ PLAY / STOP ═══
  const play = useCallback(() => {
    if (playingRef.current) return;
    if (podcastPlaying) stopPodcast();
    playingRef.current = true;
    setAudioPlaying(true);
    setResumeNudge(null);
    playHDAudio();
  }, [playHDAudio, setAudioPlaying, podcastPlaying, stopPodcast]);

  const stop = useCallback(() => {
    playingRef.current = false;
    setAudioPlaying(false);
    setAudioCurrentWord(null);
    lastCdnVerseRef.current = null;
    const verseNum = verseNumsRef.current[idxRef.current];
    if (verseNum) savePosition(verseNum);
    if (audioElRef.current) { audioElRef.current.pause(); }
  }, [setAudioPlaying, setAudioCurrentWord, savePosition]);

  // React to external audioPlaying toggle
  useEffect(() => {
    if (audioPlaying && !playingRef.current) {
      play();
    } else if (!audioPlaying && playingRef.current) {
      stop();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [audioPlaying]);

  // ─── Sleep Timer ───
  useEffect(() => {
    if (sleepTimerRef.current) { clearTimeout(sleepTimerRef.current); sleepTimerRef.current = null; }
    if (sleepTimer > 0 && audioPlaying) {
      sleepTimerRef.current = setTimeout(() => {
        stop();
        setSleepTimer(0);
      }, sleepTimer * 60 * 1000);
    }
    return () => { if (sleepTimerRef.current) clearTimeout(sleepTimerRef.current); };
  }, [sleepTimer, audioPlaying, stop, setSleepTimer]);

  // ─── Media Session API ───
  useEffect(() => {
    if (typeof navigator === "undefined" || !("mediaSession" in navigator)) return;
    if (!audioVisible) return;

    try {
      navigator.mediaSession.metadata = new MediaMetadata({
        title: `${book} ${chapter}:${verse || 1}`,
        artist: "The Bible Scrollers",
        album: book,
      });
      navigator.mediaSession.setActionHandler("play", () => { if (!playingRef.current) play(); });
      navigator.mediaSession.setActionHandler("pause", () => { if (playingRef.current) stop(); });
      navigator.mediaSession.setActionHandler("previoustrack", () => prevVerse());
      navigator.mediaSession.setActionHandler("nexttrack", () => nextVerse());
    } catch {}
    return () => {
      try {
        navigator.mediaSession.setActionHandler("play", null);
        navigator.mediaSession.setActionHandler("pause", null);
        navigator.mediaSession.setActionHandler("previoustrack", null);
        navigator.mediaSession.setActionHandler("nexttrack", null);
      } catch {}
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [audioVisible, book, chapter, verse]);

  // ─── Speed ───
  const cycleSpeed = () => {
    const steps = [0.75, 1, 1.25, 1.5, 2];
    const next = steps[(steps.indexOf(speed) + 1) % steps.length];
    setSpeed(next);
    speedRef.current = next;
    try { localStorage.setItem("audioSpeed", String(next)); } catch {}
    if (playingRef.current && audioElRef.current) {
      audioElRef.current.playbackRate = next;
    }
  };

  // ─── Sleep timer cycle ───
  const cycleSleepTimer = () => {
    const steps = [0, 15, 30, 45, 60];
    const next = steps[(steps.indexOf(sleepTimer) + 1) % steps.length];
    setSleepTimer(next);
  };

  // ─── Seek to verse using timestamps ───
  const seekToVerse = (vNum) => {
    if (timestampDataRef.current && audioElRef.current) {
      const tsVerse = timestampDataRef.current.verses?.find(v => v.num === vNum);
      if (tsVerse) {
        audioElRef.current.currentTime = tsVerse.start;
        return true;
      }
    }
    // Fallback: fraction-based seek
    if (audioElRef.current && audioElRef.current.duration) {
      const verseIdx = verseNumsRef.current.indexOf(vNum);
      if (verseIdx !== -1) {
        const fraction = verseIdx / verseNumsRef.current.length;
        audioElRef.current.currentTime = fraction * audioElRef.current.duration;
        return true;
      }
    }
    return false;
  };

  // ─── Prev / Next verse ───
  const prevVerse = () => {
    const newIdx = Math.max(0, idxRef.current - 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    const vNum = verseNumsRef.current[newIdx];
    seekToVerse(vNum);
    if (vNum) { changeVerse(vNum); setCurrentIdx(newIdx); setAudioCurrentVerse(vNum); }
  };

  const nextVerse = () => {
    const newIdx = Math.min(verseNumsRef.current.length - 1, idxRef.current + 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    const vNum = verseNumsRef.current[newIdx];
    seekToVerse(vNum);
    if (vNum) { changeVerse(vNum); setCurrentIdx(newIdx); setAudioCurrentVerse(vNum); }
  };

  // ─── Resume from saved position ───
  const handleResume = () => {
    if (resumeNudge) {
      const idx = verseNums.indexOf(resumeNudge);
      if (idx !== -1) {
        idxRef.current = idx;
        setCurrentIdx(idx);
        changeVerse(resumeNudge);
      }
    }
    setResumeNudge(null);
    play();
  };

  const close = () => { stop(); setAudioVisible(false); };

  if (!audioVisible) return null;

  // ─── Theme colours ───
  const bg      = darkMode ? "#1c1917" : (t?.card   || "#fffdf6");
  const accent  = t?.accent  || "#8B5E3C";
  const muted   = t?.muted   || "#9a9280";
  const textCol = t?.dark    || "#1a1208";
  const uiFont  = t?.ui      || "system-ui,sans-serif";

  const total      = verseNums.length;
  const displayNum = verseNums[currentIdx] ?? verse;
  const canPrev    = currentIdx > 0;
  const canNext    = currentIdx < total - 1;

  // Progress calculation (always HTML5 Audio)
  const progressPct = cdnProgress * 100;

  // Bottom offset: account for BottomNav when in verses (chapter) view
  const bottomOffset = view === "verses" ? 56 : 0;

  const iconBtn = (onClick, disabled, children) => (
    <button onClick={disabled ? undefined : onClick}
      style={{ width:32,height:32,borderRadius:"50%",border:"none",
        background:"transparent",cursor:disabled?"default":"pointer",
        color:disabled?muted:textCol,display:"flex",alignItems:"center",
        justifyContent:"center",opacity:disabled?0.3:1,padding:0,flexShrink:0 }}>
      {children}
    </button>
  );

  return (
    <div style={{
      position:"fixed", bottom:bottomOffset, left:0, right:0, zIndex:200,
      background:bg, borderTop:`1.5px solid ${accent}50`,
      boxShadow:`0 -4px 24px rgba(0,0,0,${darkMode?0.45:0.13})`,
      display:"flex", flexDirection:"column",
      animation:"playerSlideUp 0.3s ease-out",
    }}>

      {/* ── Progress bar ── */}
      <div style={{ height:3, background:`${accent}20`, position:"relative" }}>
        <div style={{
          height:"100%", background:accent,
          width:`${progressPct}%`,
          transition: "width 0.3s linear",
          borderRadius:"0 2px 2px 0",
        }} />
      </div>

      {/* ── Audio time display ── */}
      {cdnDuration > 0 && (
        <div style={{ display:"flex",justifyContent:"space-between",padding:"2px 16px 0",
          fontFamily:uiFont,fontSize:9,color:muted }}>
          <span>{formatTime(cdnCurrentTime)}</span>
          <span>-{formatTime(cdnDuration - cdnCurrentTime)}</span>
        </div>
      )}

      {/* ── Resume nudge ── */}
      {resumeNudge && (
        <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between",
          padding:"6px 16px", background:`${accent}15`,
          borderBottom:`1px solid ${accent}25` }}>
          <span style={{ fontFamily:uiFont,fontSize:11,color:accent,fontWeight:600 }}>
            Resume from V.{resumeNudge}?
          </span>
          <div style={{ display:"flex",gap:6 }}>
            <button onClick={handleResume}
              style={{ padding:"3px 10px",borderRadius:6,border:"none",
                background:accent,color:"#fff",fontFamily:uiFont,
                fontSize:11,fontWeight:700,cursor:"pointer" }}>
              Resume
            </button>
            <button onClick={() => { setResumeNudge(null); play(); }}
              style={{ padding:"3px 10px",borderRadius:6,
                border:`1px solid ${accent}40`,background:"transparent",
                color:muted,fontFamily:uiFont,fontSize:11,cursor:"pointer" }}>
              Start over
            </button>
          </div>
        </div>
      )}

      {/* ── Main bar ── */}
      <div style={{ display:"flex",alignItems:"center",gap:8,
        padding:"0 16px",height:54 }}>

        {/* Pulsing dot + label */}
        <div style={{ flexShrink:0,display:"flex",flexDirection:"column",gap:1 }}>
          <div style={{ display:"flex",alignItems:"center",gap:5 }}>
            <div style={{
              width:6,height:6,borderRadius:"50%",
              background:audioPlaying ? accent : muted,
              animation:audioPlaying ? "pulseGlow 1.4s ease-in-out infinite" : "none",
            }} />
            <span style={{ fontFamily:uiFont,fontSize:9.5,fontWeight:700,
              color:audioPlaying?accent:muted,letterSpacing:"0.06em",textTransform:"uppercase" }}>
              {audioPlaying ? "HD Audio" : "Paused"}
            </span>
          </div>
          <div style={{ fontFamily:uiFont,fontSize:12,fontWeight:600,
            color:textCol,lineHeight:1.2,whiteSpace:"nowrap",
            maxWidth:140,overflow:"hidden",textOverflow:"ellipsis" }}>
            {book} {chapter} · V.{displayNum}/{total}
          </div>
        </div>

        <div style={{ flex:1 }} />

        {/* ◀ Prev */}
        {iconBtn(prevVerse, !canPrev,
          <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor">
            <path d="M6 6h2v12H6zm3.5 6 8.5 6V6z"/>
          </svg>
        )}

        {/* ▶ / ⏸ Play-Pause */}
        <button onClick={audioPlaying ? stop : (resumeNudge ? handleResume : play)}
          style={{ width:40,height:40,borderRadius:"50%",
            border:`2px solid ${accent}`,
            background:audioPlaying ? accent : "transparent",
            cursor:"pointer",color:audioPlaying?"#fff":accent,
            display:"flex",alignItems:"center",justifyContent:"center",
            transition:"all 0.15s",flexShrink:0,padding:0 }}>
          {audioPlaying
            ? <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
                <rect x="6" y="4" width="4" height="16"/>
                <rect x="14" y="4" width="4" height="16"/>
              </svg>
            : <svg width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
                <path d="M8 5v14l11-7z"/>
              </svg>
          }
        </button>

        {/* ▶ Next */}
        {iconBtn(nextVerse, !canNext,
          <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor">
            <path d="M6 18l8.5-6L6 6v12zm2.5-6 8.5 6V6L8.5 12z"/>
            <rect x="16" y="6" width="2" height="12"/>
          </svg>
        )}

        {/* Speed */}
        <button onClick={cycleSpeed}
          style={{ padding:"4px 8px",borderRadius:6,
            border:`1px solid ${accent}45`,background:`${accent}12`,
            fontFamily:uiFont,fontSize:11,fontWeight:700,
            color:accent,cursor:"pointer",flexShrink:0,whiteSpace:"nowrap" }}>
          {speed === 1 ? "1\u00D7" : `${speed}\u00D7`}
        </button>

        {/* HD audio badge */}
        <span style={{ padding:"3px 7px",borderRadius:5,
          background:"linear-gradient(135deg,#D4A853 0%,#F6E05E 100%)",
          fontFamily:uiFont,fontSize:8,fontWeight:800,
          color:"#1a1208",letterSpacing:"0.08em",flexShrink:0 }}>
          HD
        </span>

        {/* Sleep Timer */}
        <button onClick={cycleSleepTimer}
          title={sleepTimer > 0 ? `Sleep in ${sleepTimer}m` : "Set sleep timer"}
          style={{ padding:"4px 7px",borderRadius:6,
            border:`1px solid ${sleepTimer > 0 ? accent : `${accent}35`}`,
            background:sleepTimer > 0 ? `${accent}12` : "transparent",
            fontFamily:uiFont,fontSize:10,fontWeight:700,
            color:sleepTimer > 0 ? accent : muted,
            cursor:"pointer",flexShrink:0,whiteSpace:"nowrap",
            display:"flex",alignItems:"center",gap:3 }}>
          <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>
          </svg>
          {sleepTimer > 0 ? `${sleepTimer}m` : ""}
        </button>

        {/* ✕ Close */}
        <button onClick={close}
          style={{ width:28,height:28,borderRadius:"50%",border:"none",
            background:`${muted}22`,cursor:"pointer",color:muted,
            display:"flex",alignItems:"center",justifyContent:"center",
            flexShrink:0,padding:0 }}>
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
            <line x1="18" y1="6" x2="6" y2="18"/>
            <line x1="6" y1="6" x2="18" y2="18"/>
          </svg>
        </button>
      </div>
    </div>
  );
}
