"use client";
import { useEffect, useRef, useState, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_TRANSLATIONS, CDN_NARRATORS } from "../constants";

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
    audioMode, audioNarrator, setAudioNarrator,
    audioChapterLinks,
    sleepTimer, setSleepTimer,
    audioSource, audioCurrentVerse, setAudioCurrentVerse,
    verses, verse, verseNums,
    setVerse: changeVerse,
    book, chapter, bibleTranslation,
    t, darkMode, view,
    markChapterListened,
    podcastPlaying, setPodcastPlaying, setPodcastVisible,
  } = useApp();

  const [speed, setSpeed] = useState(() => {
    try { return parseFloat(localStorage.getItem("audioSpeed") || "1"); } catch { return 1; }
  });
  const [currentIdx, setCurrentIdx] = useState(0);

  // TTS voice state
  const [availableVoices, setAvailableVoices] = useState([]);
  const [voiceIdx, setVoiceIdx] = useState(0);
  const [voiceWarning, setVoiceWarning] = useState(false);

  // Resume nudge
  const [resumeNudge, setResumeNudge] = useState(null);

  // CDN audio state
  const [cdnProgress, setCdnProgress] = useState(0);
  const [cdnDuration, setCdnDuration] = useState(0);
  const [cdnCurrentTime, setCdnCurrentTime] = useState(0);

  // Refs to avoid stale closures
  const idxRef         = useRef(0);
  const playingRef     = useRef(false);
  const speedRef       = useRef(speed);
  const versesRef      = useRef(verses);
  const verseNumsRef   = useRef(verseNums);
  const voiceIdxRef    = useRef(0);
  const langRef        = useRef("en-US");
  const langPrefixRef  = useRef("en");
  const audioElRef      = useRef(null); // HTML5 Audio element for CDN
  const sleepTimerRef   = useRef(null);
  const modeRef         = useRef(audioMode);
  const audioSourceRef  = useRef(audioSource);
  const lastCdnVerseRef = useRef(null);

  // Derive lang from active translation
  const transDef   = BIBLE_TRANSLATIONS.find(tr => tr.id === bibleTranslation);
  const lang       = transDef?.lang || "en-US";
  const langPrefix = lang.split("-")[0];

  // Keep refs in sync
  useEffect(() => { versesRef.current    = verses;    }, [verses]);
  useEffect(() => { verseNumsRef.current = verseNums; }, [verseNums]);
  useEffect(() => { speedRef.current     = speed;     }, [speed]);
  useEffect(() => { voiceIdxRef.current  = voiceIdx;  }, [voiceIdx]);
  useEffect(() => { langRef.current = lang; langPrefixRef.current = langPrefix; }, [lang, langPrefix]);
  useEffect(() => { modeRef.current = audioMode; }, [audioMode]);
  useEffect(() => { audioSourceRef.current = audioSource; }, [audioSource]);

  // Sync idx when verse changes externally
  useEffect(() => {
    const idx = verseNums.indexOf(verse);
    if (idx !== -1) { idxRef.current = idx; setCurrentIdx(idx); }
  }, [verse, verseNums]);

  // ─── TTS Voice Loading ───
  const loadVoices = useCallback(() => {
    if (typeof window === "undefined" || !window.speechSynthesis) return;
    const all = window.speechSynthesis.getVoices();
    const matching = all.filter(v => v.lang.startsWith(langPrefixRef.current));
    setAvailableVoices(matching);
    setVoiceWarning(matching.length === 0 && modeRef.current === "tts");
    setVoiceIdx(prev => (prev >= matching.length ? 0 : prev));
  }, []);

  useEffect(() => {
    if (typeof window === "undefined" || !window.speechSynthesis) return;
    loadVoices();
    window.speechSynthesis.onvoiceschanged = loadVoices;
    return () => { if (window.speechSynthesis) window.speechSynthesis.onvoiceschanged = null; };
  }, [loadVoices, langPrefix]);

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
      if (typeof window !== "undefined" && window.speechSynthesis) {
        window.speechSynthesis.cancel();
      }
    }
  }, [view, setAudioPlaying, setAudioVisible]);

  // ─── Save position helper ───
  const savePosition = useCallback((verseNum) => {
    try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}
  }, [book, chapter]);

  // ─── Cleanup on unmount ───
  useEffect(() => {
    return () => {
      if (audioElRef.current) { audioElRef.current.pause(); audioElRef.current.src = ""; }
      if (typeof window !== "undefined" && window.speechSynthesis) {
        window.speechSynthesis.cancel();
      }
      const verseNum = verseNumsRef.current[idxRef.current];
      if (verseNum) {
        try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}
      }
    };
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [book, chapter]);

  // ═══ CDN AUDIO ENGINE ═══
  const playCDN = useCallback(() => {
    if (!audioChapterLinks) return;
    const url = audioChapterLinks[audioNarrator] || audioChapterLinks[Object.keys(audioChapterLinks)[0]];
    if (!url) return;

    if (!audioElRef.current) {
      audioElRef.current = new Audio();
      audioElRef.current.preload = "auto";
    }
    const audio = audioElRef.current;

    // Only change src if different
    if (!audio.src || !audio.src.includes(url.split("/").pop())) {
      audio.src = url;
      audio.load();
    }
    audio.playbackRate = speedRef.current;

    audio.ontimeupdate = () => {
      setCdnCurrentTime(audio.currentTime);
      setCdnProgress(audio.duration ? audio.currentTime / audio.duration : 0);
      // Estimate current verse from time position
      const vNums = verseNumsRef.current;
      if (vNums.length > 0 && audio.duration > 0) {
        const fraction = audio.currentTime / audio.duration;
        const verseIdx = Math.min(Math.floor(fraction * vNums.length), vNums.length - 1);
        const vNum = vNums[verseIdx];
        // Only update state when verse actually changes (throttle)
        if (vNum !== lastCdnVerseRef.current) {
          lastCdnVerseRef.current = vNum;
          setAudioCurrentVerse(vNum);
          idxRef.current = verseIdx;
          setCurrentIdx(verseIdx);
          // Only navigate verse in VerseStudy mode (avoid re-render loop in VerseList)
          if (audioSourceRef.current === "verseStudy") {
            changeVerse(vNum);
          }
          try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum: vNum })); } catch {}
        }
      }
    };
    audio.ondurationchange = () => setCdnDuration(audio.duration || 0);
    audio.onended = () => {
      playingRef.current = false;
      setAudioPlaying(false);
      if (markChapterListened) markChapterListened(book, chapter);
    };
    audio.onerror = () => {
      // Fallback: if CDN fails, the user can still close or we just stop
      playingRef.current = false;
      setAudioPlaying(false);
    };

    audio.play().catch(() => {
      // Silently handle — don't auto-pause; user can tap play again if needed
    });
  }, [audioChapterLinks, audioNarrator, book, chapter, markChapterListened, setAudioPlaying, setAudioCurrentVerse, changeVerse]);

  // ═══ TTS ENGINE ═══
  const speakVerse = useCallback((idx) => {
    if (!playingRef.current) return;
    const vNums = verseNumsRef.current;
    const vList = versesRef.current;

    if (idx >= vNums.length) {
      playingRef.current = false;
      setAudioPlaying(false);
      if (markChapterListened) markChapterListened(book, chapter);
      return;
    }

    const verseNum = vNums[idx];
    const verseObj = vList.find(v => v.verse_number === verseNum);
    if (!verseObj) { speakVerse(idx + 1); return; }

    // Only navigate verse in VerseStudy mode (avoid re-render loop in VerseList)
    if (audioSourceRef.current === "verseStudy") {
      changeVerse(verseNum);
    }
    setAudioCurrentVerse(verseNum);
    idxRef.current = idx;
    setCurrentIdx(idx);
    try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}

    if (typeof window === "undefined" || !window.speechSynthesis) return;

    const u = new SpeechSynthesisUtterance(verseObj.kjv_text);
    u.rate = speedRef.current;
    u.lang = langRef.current;

    const voices = window.speechSynthesis.getVoices();
    const matching = voices.filter(v => v.lang.startsWith(langPrefixRef.current));
    if (matching.length > 0) {
      const vi = Math.min(voiceIdxRef.current, matching.length - 1);
      u.voice = matching[vi];
    }

    u.onend   = () => { if (playingRef.current) speakVerse(idx + 1); };
    u.onerror = (e) => { if (e.error !== "interrupted" && playingRef.current) speakVerse(idx + 1); };

    window.speechSynthesis.speak(u);
  }, [changeVerse, setAudioPlaying, setAudioCurrentVerse, book, chapter, markChapterListened]);

  // ═══ UNIFIED PLAY / STOP ═══
  const play = useCallback(() => {
    if (playingRef.current) return; // Already playing, don't restart
    // Mutual exclusion: stop podcast if playing
    if (podcastPlaying) { setPodcastPlaying(false); setPodcastVisible(false); }
    playingRef.current = true;
    setAudioPlaying(true);
    setResumeNudge(null);

    if (modeRef.current === "cdn") {
      playCDN();
    } else {
      if (typeof window === "undefined" || !window.speechSynthesis) return;
      window.speechSynthesis.cancel();
      // Small delay after cancel to ensure clean state
      setTimeout(() => speakVerse(idxRef.current), 100);
    }
  }, [playCDN, speakVerse, setAudioPlaying, podcastPlaying, setPodcastPlaying, setPodcastVisible]);

  const stop = useCallback(() => {
    playingRef.current = false;
    setAudioPlaying(false);
    lastCdnVerseRef.current = null;
    const verseNum = verseNumsRef.current[idxRef.current];
    if (verseNum) savePosition(verseNum);

    if (audioElRef.current) { audioElRef.current.pause(); }
    if (typeof window !== "undefined" && window.speechSynthesis) {
      window.speechSynthesis.cancel();
    }
  }, [setAudioPlaying, savePosition]);

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

    if (playingRef.current) {
      if (modeRef.current === "cdn" && audioElRef.current) {
        audioElRef.current.playbackRate = next;
      } else {
        if (typeof window !== "undefined" && window.speechSynthesis) {
          window.speechSynthesis.cancel();
          setTimeout(() => speakVerse(idxRef.current), 80);
        }
      }
    }
  };

  // ─── TTS Voice cycle ───
  const cycleVoice = () => {
    if (availableVoices.length <= 1) return;
    const next = (voiceIdx + 1) % availableVoices.length;
    setVoiceIdx(next);
    voiceIdxRef.current = next;
    if (playingRef.current && modeRef.current === "tts") {
      if (typeof window !== "undefined" && window.speechSynthesis) {
        window.speechSynthesis.cancel();
        setTimeout(() => speakVerse(idxRef.current), 80);
      }
    }
  };

  // ─── Sleep timer cycle ───
  const cycleSleepTimer = () => {
    const steps = [0, 15, 30, 45, 60];
    const next = steps[(steps.indexOf(sleepTimer) + 1) % steps.length];
    setSleepTimer(next);
  };

  // ─── Prev / Next verse ───
  const prevVerse = () => {
    const newIdx = Math.max(0, idxRef.current - 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    const vNum = verseNumsRef.current[newIdx];

    if (modeRef.current === "cdn" && audioElRef.current && audioElRef.current.duration) {
      // Seek CDN audio proportionally
      const fraction = newIdx / verseNumsRef.current.length;
      audioElRef.current.currentTime = fraction * audioElRef.current.duration;
    } else if (playingRef.current) {
      if (typeof window !== "undefined" && window.speechSynthesis) window.speechSynthesis.cancel();
      speakVerse(newIdx);
    }
    if (vNum) { changeVerse(vNum); setCurrentIdx(newIdx); setAudioCurrentVerse(vNum); }
  };

  const nextVerse = () => {
    const newIdx = Math.min(verseNumsRef.current.length - 1, idxRef.current + 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    const vNum = verseNumsRef.current[newIdx];

    if (modeRef.current === "cdn" && audioElRef.current && audioElRef.current.duration) {
      const fraction = newIdx / verseNumsRef.current.length;
      audioElRef.current.currentTime = fraction * audioElRef.current.duration;
    } else if (playingRef.current) {
      if (typeof window !== "undefined" && window.speechSynthesis) window.speechSynthesis.cancel();
      speakVerse(newIdx);
    }
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

  // ─── CDN narrator switch ───
  const switchNarrator = (narratorId) => {
    setAudioNarrator(narratorId);
    if (playingRef.current && modeRef.current === "cdn" && audioElRef.current && audioChapterLinks) {
      const newUrl = audioChapterLinks[narratorId];
      if (newUrl) {
        const savedTime = audioElRef.current.currentTime;
        audioElRef.current.src = newUrl;
        audioElRef.current.load();
        audioElRef.current.onloadeddata = () => {
          audioElRef.current.currentTime = savedTime;
          audioElRef.current.playbackRate = speedRef.current;
          audioElRef.current.play().catch(() => {});
          audioElRef.current.onloadeddata = null;
        };
      }
    }
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
  const isCDN      = audioMode === "cdn";

  // Progress calculation
  const progressPct = isCDN
    ? cdnProgress * 100
    : total > 0 ? ((currentIdx + 1) / total) * 100 : 0;

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
          transition: isCDN ? "width 0.3s linear" : "width 0.4s ease",
          borderRadius:"0 2px 2px 0",
        }} />
      </div>

      {/* ── CDN time display ── */}
      {isCDN && cdnDuration > 0 && (
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

      {/* ── TTS No-voice warning ── */}
      {!isCDN && voiceWarning && (
        <div style={{ padding:"5px 16px",background:"#92400e20",
          borderBottom:"1px solid #92400e30" }}>
          <span style={{ fontFamily:uiFont,fontSize:10,color:"#92400e",fontWeight:600 }}>
            No {transDef?.name || "matching"} voice installed. Go to device Settings to download it.
          </span>
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
              {audioPlaying ? (isCDN ? "Streaming" : "Playing") : "Paused"}
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

        {/* CDN Narrator picker OR TTS Voice cycle */}
        {isCDN ? (
          <div style={{ display:"flex",gap:3,flexShrink:0 }}>
            {CDN_NARRATORS.map(n => (
              <button key={n.id} onClick={() => switchNarrator(n.id)}
                title={n.description}
                style={{ padding:"3px 7px",borderRadius:5,
                  border:`1px solid ${audioNarrator === n.id ? accent : `${accent}35`}`,
                  background:audioNarrator === n.id ? `${accent}18` : "transparent",
                  fontFamily:uiFont,fontSize:9,fontWeight:600,
                  color:audioNarrator === n.id ? accent : muted,
                  cursor:"pointer",transition:"all 0.15s" }}>
                {n.label}
              </button>
            ))}
          </div>
        ) : availableVoices.length > 1 ? (
          <button onClick={cycleVoice}
            title={`Voice: ${availableVoices[voiceIdx]?.name || "default"} (tap to cycle)`}
            style={{ width:28,height:28,borderRadius:6,
              border:`1px solid ${accent}35`,background:`${accent}10`,
              cursor:"pointer",color:accent,
              display:"flex",alignItems:"center",justifyContent:"center",
              flexShrink:0,padding:0 }}>
            <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor">
              <path d="M12 14c1.66 0 3-1.34 3-3V5c0-1.66-1.34-3-3-3S9 3.34 9 5v6c0 1.66 1.34 3 3 3zm-1 1.93c-3.94-.49-7-3.85-7-7.93h2c0 3.31 2.69 6 6 6s6-2.69 6-6h2c0 4.08-3.06 7.44-7 7.93V22h-2v-6.07z"/>
            </svg>
          </button>
        ) : null}

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
