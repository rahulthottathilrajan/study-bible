"use client";
import { useEffect, useRef, useState, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_TRANSLATIONS } from "../constants";

export default function AudioPlayer() {
  const {
    audioPlaying, setAudioPlaying,
    audioVisible, setAudioVisible,
    verses, verse, verseNums,
    setVerse: changeVerse,
    book, chapter, bibleTranslation,
    t, darkMode, view,
    markChapterListened,
  } = useApp();

  const [speed, setSpeed] = useState(() => {
    try { return parseFloat(localStorage.getItem("audioSpeed") || "1"); } catch { return 1; }
  });
  const [currentIdx, setCurrentIdx] = useState(0);

  // Phase 2: voice state
  const [availableVoices, setAvailableVoices] = useState([]);
  const [voiceIdx, setVoiceIdx] = useState(0);
  const [voiceWarning, setVoiceWarning] = useState(false);

  // Phase 3: resume nudge
  const [resumeNudge, setResumeNudge] = useState(null); // verseNum or null

  // Refs to avoid stale closures in TTS callbacks
  const idxRef          = useRef(0);
  const playingRef      = useRef(false);
  const speedRef        = useRef(speed);
  const versesRef       = useRef(verses);
  const verseNumsRef    = useRef(verseNums);
  const voiceIdxRef     = useRef(0);
  const availVoicesRef  = useRef([]);
  const langRef         = useRef("en-US");
  const langPrefixRef   = useRef("en");

  // Derive lang from active translation
  const transDef   = BIBLE_TRANSLATIONS.find(tr => tr.id === bibleTranslation);
  const lang       = transDef?.lang || "en-US";
  const langPrefix = lang.split("-")[0];

  // Keep refs in sync
  useEffect(() => { versesRef.current    = verses;    }, [verses]);
  useEffect(() => { verseNumsRef.current = verseNums; }, [verseNums]);
  useEffect(() => { speedRef.current     = speed;     }, [speed]);
  useEffect(() => { voiceIdxRef.current  = voiceIdx;  }, [voiceIdx]);
  useEffect(() => { availVoicesRef.current = availableVoices; }, [availableVoices]);
  useEffect(() => { langRef.current = lang; langPrefixRef.current = langPrefix; }, [lang, langPrefix]);

  // Sync idx when verse changes externally (user taps Prev/Next)
  useEffect(() => {
    const idx = verseNums.indexOf(verse);
    if (idx !== -1) { idxRef.current = idx; setCurrentIdx(idx); }
  }, [verse, verseNums]);

  // Phase 2: load voices for current translation language
  const loadVoices = useCallback(() => {
    if (typeof window === "undefined" || !window.speechSynthesis) return;
    const all = window.speechSynthesis.getVoices();
    const matching = all.filter(v => v.lang.startsWith(langPrefixRef.current));
    setAvailableVoices(matching);
    setVoiceWarning(matching.length === 0);
    setVoiceIdx(prev => (prev >= matching.length ? 0 : prev));
  }, []); // refs are always current — no deps needed

  useEffect(() => {
    if (typeof window === "undefined" || !window.speechSynthesis) return;
    loadVoices();
    window.speechSynthesis.onvoiceschanged = loadVoices;
    return () => { if (window.speechSynthesis) window.speechSynthesis.onvoiceschanged = null; };
  }, [loadVoices, langPrefix]); // re-run when language changes

  // Phase 3: check for saved position when player opens
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
  }, [audioVisible]); // only check on open, not on every verseNums change

  // Stop audio when user leaves verse view
  useEffect(() => {
    if (view !== "verse") {
      playingRef.current = false;
      setAudioPlaying(false);
      setAudioVisible(false);
      if (typeof window !== "undefined" && window.speechSynthesis) {
        window.speechSynthesis.cancel();
      }
    }
  }, [view, setAudioPlaying, setAudioVisible]);

  // Phase 3: save position helper
  const savePosition = useCallback((verseNum) => {
    try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}
  }, [book, chapter]);

  // Cleanup on unmount — cancel TTS + save position
  useEffect(() => {
    return () => {
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

  const speakVerse = useCallback((idx) => {
    if (!playingRef.current) return;
    const vNums = verseNumsRef.current;
    const vList = versesRef.current;

    if (idx >= vNums.length) {
      // Reached end of chapter — mark as listened
      playingRef.current = false;
      setAudioPlaying(false);
      if (markChapterListened) markChapterListened(book, chapter);
      return;
    }

    const verseNum = vNums[idx];
    const verseObj = vList.find(v => v.verse_number === verseNum);
    if (!verseObj) { speakVerse(idx + 1); return; }

    changeVerse(verseNum);
    idxRef.current = idx;
    setCurrentIdx(idx);

    // Phase 3: persist position as we progress
    try { localStorage.setItem("audioPosition", JSON.stringify({ book, chapter, verseNum })); } catch {}

    const u = new SpeechSynthesisUtterance(verseObj.kjv_text);
    u.rate = speedRef.current;
    u.lang = langRef.current;

    // Phase 2: pick the selected voice from available voices
    const voices = window.speechSynthesis.getVoices();
    const matching = voices.filter(v => v.lang.startsWith(langPrefixRef.current));
    if (matching.length > 0) {
      const vi = Math.min(voiceIdxRef.current, matching.length - 1);
      u.voice = matching[vi];
    }

    u.onend   = () => { if (playingRef.current) speakVerse(idx + 1); };
    u.onerror = (e) => { if (e.error !== "interrupted" && playingRef.current) speakVerse(idx + 1); };

    window.speechSynthesis.speak(u);
  }, [bibleTranslation, changeVerse, setAudioPlaying, book, chapter, markChapterListened]);

  const play = useCallback(() => {
    if (typeof window === "undefined" || !window.speechSynthesis) return;
    window.speechSynthesis.cancel();
    playingRef.current = true;
    setAudioPlaying(true);
    setResumeNudge(null);
    speakVerse(idxRef.current);
  }, [speakVerse, setAudioPlaying]);

  const stop = useCallback(() => {
    playingRef.current = false;
    setAudioPlaying(false);
    // Phase 3: save position on pause
    const verseNum = verseNumsRef.current[idxRef.current];
    if (verseNum) savePosition(verseNum);
    if (typeof window !== "undefined" && window.speechSynthesis) {
      window.speechSynthesis.cancel();
    }
  }, [setAudioPlaying, savePosition]);

  // React to external audioPlaying toggle (from speaker button in BibleView)
  useEffect(() => {
    if (audioPlaying && !playingRef.current) {
      play();
    } else if (!audioPlaying && playingRef.current) {
      stop();
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [audioPlaying]);

  const cycleSpeed = () => {
    const steps = [0.75, 1, 1.25, 1.5, 2];
    const next  = steps[(steps.indexOf(speed) + 1) % steps.length];
    setSpeed(next);
    try { localStorage.setItem("audioSpeed", String(next)); } catch {}
    if (playingRef.current) {
      window.speechSynthesis.cancel();
      setTimeout(() => speakVerse(idxRef.current), 80);
    }
  };

  // Phase 2: cycle through available voices for this language
  const cycleVoice = () => {
    if (availableVoices.length <= 1) return;
    const next = (voiceIdx + 1) % availableVoices.length;
    setVoiceIdx(next);
    voiceIdxRef.current = next;
    if (playingRef.current) {
      window.speechSynthesis.cancel();
      setTimeout(() => speakVerse(idxRef.current), 80);
    }
  };

  const prevVerse = () => {
    const newIdx = Math.max(0, idxRef.current - 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    if (playingRef.current) { window.speechSynthesis.cancel(); speakVerse(newIdx); }
    else { changeVerse(verseNumsRef.current[newIdx]); setCurrentIdx(newIdx); }
  };

  const nextVerse = () => {
    const newIdx = Math.min(verseNumsRef.current.length - 1, idxRef.current + 1);
    idxRef.current = newIdx;
    setResumeNudge(null);
    if (playingRef.current) { window.speechSynthesis.cancel(); speakVerse(newIdx); }
    else { changeVerse(verseNumsRef.current[newIdx]); setCurrentIdx(newIdx); }
  };

  // Phase 3: resume from saved position
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
      position:"fixed", bottom:0, left:0, right:0, zIndex:200,
      background:bg, borderTop:`1.5px solid ${accent}50`,
      boxShadow:`0 -4px 24px rgba(0,0,0,${darkMode?0.45:0.13})`,
      display:"flex", flexDirection:"column",
    }}>

      {/* Phase 3: Resume nudge */}
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

      {/* Phase 2: No-voice warning */}
      {voiceWarning && (
        <div style={{ padding:"5px 16px",background:"#92400e20",
          borderBottom:"1px solid #92400e30" }}>
          <span style={{ fontFamily:uiFont,fontSize:10,color:"#92400e",fontWeight:600 }}>
            No {transDef?.name || "matching"} voice installed — go to Settings → Accessibility → Spoken Content → Voices to download it. Falling back to default.
          </span>
        </div>
      )}

      {/* Main bar */}
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
              {audioPlaying ? "Playing" : "Paused"}
            </span>
          </div>
          <div style={{ fontFamily:uiFont,fontSize:12,fontWeight:600,
            color:textCol,lineHeight:1.2,whiteSpace:"nowrap",
            maxWidth:120,overflow:"hidden",textOverflow:"ellipsis" }}>
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
          {speed === 1 ? "1×" : `${speed}×`}
        </button>

        {/* Phase 2: Voice cycle (only if multiple voices available) */}
        {availableVoices.length > 1 && (
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
        )}

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
