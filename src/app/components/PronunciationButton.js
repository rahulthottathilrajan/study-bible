"use client";
import { useState, useRef, useCallback } from "react";

/**
 * PronunciationButton — plays a pre-generated MP3 from Supabase Storage.
 *
 * Props:
 *   lang: "greek" | "hebrew"
 *   wordId: filename without extension, e.g. "word-g26", "letter-alpha", "vocab-g2316"
 *   size: icon size in px (default 18)
 *   color: icon color (default theme muted)
 *   style: additional style overrides
 */

const SUPABASE_URL = process.env.NEXT_PUBLIC_SUPABASE_URL || "https://qpcafbwmvrkpztvvjnzx.supabase.co";
const BUCKET = "language-audio";
const BASE_URL = `${SUPABASE_URL}/storage/v1/object/public/${BUCKET}`;

export default function PronunciationButton({ lang, wordId, size = 18, color = "#888", style = {} }) {
  const [playing, setPlaying] = useState(false);
  const audioRef = useRef(null);

  const play = useCallback((e) => {
    e.stopPropagation();
    if (playing) return;

    const url = `${BASE_URL}/${lang}/${wordId}.mp3`;

    if (!audioRef.current) {
      audioRef.current = new Audio();
    }
    const audio = audioRef.current;
    audio.src = url;
    audio.onplay = () => setPlaying(true);
    audio.onended = () => setPlaying(false);
    audio.onerror = () => {
      setPlaying(false);
      // Fallback: try Web Speech API if MP3 not found
      if ("speechSynthesis" in window) {
        const u = new SpeechSynthesisUtterance(wordId.replace(/^(word|letter|vocab|lesson)-/, ""));
        u.lang = lang === "greek" ? "el-GR" : "he-IL";
        u.rate = 0.8;
        speechSynthesis.speak(u);
      }
    };
    audio.play().catch(() => setPlaying(false));
  }, [lang, wordId, playing]);

  return (
    <button
      onClick={play}
      aria-label={`Listen to pronunciation`}
      style={{
        background: "none",
        border: "none",
        cursor: "pointer",
        padding: 4,
        borderRadius: 6,
        display: "inline-flex",
        alignItems: "center",
        justifyContent: "center",
        opacity: playing ? 0.6 : 1,
        transition: "opacity 0.2s",
        ...style,
      }}
    >
      <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={playing ? color : color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5" fill={playing ? `${color}33` : "none"} />
        <path d="M15.54 8.46a5 5 0 0 1 0 7.07" />
        {!playing && <path d="M19.07 4.93a10 10 0 0 1 0 14.14" />}
      </svg>
    </button>
  );
}
