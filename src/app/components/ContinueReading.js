"use client";
import { useState, useEffect, useRef } from "react";

// ═══════════════════════════════════════════════════
// CONTINUE READING — Multi-Section Horizontal Strip
// ═══════════════════════════════════════════════════
// Tracks user's reading position across ALL app sections.
// localStorage for instant display; Supabase sync planned.
//
// localStorage keys:
//   cr_ot          — { book, chapter, verse }
//   cr_nt          — { book, chapter, verse }
//   cr_hebrew      — { lessonName, view }
//   cr_greek       — (disabled / coming soon)
//   cr_timeline    — { eraName, view }
//   cr_prophecy    — { topicName }
//   cr_apologetics — { topicName }
//   cr_readingplans — { planName, progress }
//
// Legacy migration: reads "lastRead" key on first load
// if cr_ot / cr_nt don't exist yet.

const SECTIONS = [
  {
    id: "ot",
    label: "Old Testament",
    icon: "📜",
    key: "cr_ot",
    bg: "linear-gradient(135deg,#1C2B1F 0%,#2E4A33 100%)",
    seal: "#8B2020",
    sealLight: "#C44040",
    subtitle: d => `${d.book} ${d.chapter}:${d.verse}`,
    go: (d, nav) => nav("verse", { testament:"OT", book:d.book, chapter:d.chapter, verse:d.verse }),
  },
  {
    id: "nt",
    label: "New Testament",
    icon: "✝️",
    key: "cr_nt",
    bg: "linear-gradient(135deg,#1A2F4B 0%,#1B5E5A 100%)",
    seal: "#1B5E4A",
    sealLight: "#2D8E6E",
    subtitle: d => `${d.book} ${d.chapter}:${d.verse}`,
    go: (d, nav) => nav("verse", { testament:"NT", book:d.book, chapter:d.chapter, verse:d.verse }),
  },
  {
    id: "hebrew",
    label: "Learn Hebrew",
    icon: "🪨",
    key: "cr_hebrew",
    bg: "linear-gradient(135deg,#4A3420 0%,#6B4A28 100%)",
    seal: "#8B6B3D",
    sealLight: "#C4961E",
    subtitle: d => d.lessonName || "Continue lesson",
    go: (d, nav) => nav(d.view || "hebrew-home"),
  },
  {
    id: "greek",
    label: "Learn Greek",
    icon: "🏛️",
    key: "cr_greek",
    bg: "linear-gradient(135deg,#2A2A3E 0%,#3E3E56 100%)",
    seal: "#6A6A8A",
    sealLight: "#9898B8",
    subtitle: () => "Coming soon",
    go: () => {},
    disabled: true,
  },
  {
    id: "timeline",
    label: "Biblical Timeline",
    icon: "⌛",
    key: "cr_timeline",
    bg: "linear-gradient(135deg,#2D1B4E 0%,#1C2B1F 100%)",
    seal: "#8B2020",
    sealLight: "#C44040",
    subtitle: d => d.eraName || "Continue exploring",
    go: (d, nav) => nav(d.view || "timeline-home"),
  },
  {
    id: "prophecy",
    label: "Prophecy & Fulfilment",
    icon: "✦",
    key: "cr_prophecy",
    bg: "linear-gradient(135deg,#2D1B4E 0%,#4A2D6B 100%)",
    seal: "#4A2D8E",
    sealLight: "#7B52D4",
    subtitle: d => d.topicName || "Continue reading",
    go: (d, nav) => nav("prophecy-home"),
  },
  {
    id: "apologetics",
    label: "Apologetics",
    icon: "🛡️",
    key: "cr_apologetics",
    bg: "linear-gradient(135deg,#1A2F4B 0%,#1B5E5A 100%)",
    seal: "#1B5E4A",
    sealLight: "#2D8E6E",
    subtitle: d => d.topicName || "Continue reading",
    go: (d, nav) => nav("apologetics-home"),
  },
  {
    id: "readingplans",
    label: "Reading Plans",
    icon: "☩",
    key: "cr_readingplans",
    bg: "linear-gradient(135deg,#3E2A1A 0%,#2E1E12 100%)",
    seal: "#8B6914",
    sealLight: "#C4961E",
    subtitle: d => d.planName || "Continue plan",
    go: (d, nav) => nav("reading-plans-home"),
  },
];

// ─── Chevron icon (self-contained, no import needed) ───
const Chev = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
    stroke="currentColor" strokeWidth="2.5" strokeLinecap="round">
    <polyline points="9 18 15 12 9 6"/>
  </svg>
);

export default function ContinueReading({ nav, ht }) {
  const [positions, setPositions] = useState({});
  const scrollRef = useRef(null);

  // ─── Load all section positions from localStorage ───
  useEffect(() => {
    const loaded = {};

    // Read section-specific keys
    SECTIONS.forEach(s => {
      if (s.disabled) return;
      try {
        const raw = localStorage.getItem(s.key);
        if (raw) {
          const data = JSON.parse(raw);
          if (data && typeof data === "object" && Object.keys(data).length > 0) {
            loaded[s.id] = data;
          }
        }
      } catch {}
    });

    // ─── Legacy migration: "lastRead" → cr_ot / cr_nt ───
    if (!loaded.ot && !loaded.nt) {
      try {
        const lr = JSON.parse(localStorage.getItem("lastRead"));
        if (lr?.book && lr?.chapter && lr?.verse) {
          const id = lr.testament === "NT" ? "nt" : "ot";
          const key = lr.testament === "NT" ? "cr_nt" : "cr_ot";
          const entry = { book: lr.book, chapter: lr.chapter, verse: lr.verse };
          localStorage.setItem(key, JSON.stringify(entry));
          loaded[id] = entry;
        }
      } catch {}
    }

    setPositions(loaded);
  }, []);

  // ─── Filter to only visited sections ───
  const active = SECTIONS.filter(s => !s.disabled && positions[s.id]);

  // Nothing to show yet
  if (active.length === 0) return null;

  return (
    <div style={{ marginBottom: 18 }}>
      {/* Hide scrollbar for webkit */}
      <style>{`
        .cr-scroll::-webkit-scrollbar { display: none; }
      `}</style>

      {/* Section label — matches home screen pattern */}
      <div style={{
        fontFamily: ht.ui, fontSize: 10, fontWeight: 700,
        color: ht.muted, textTransform: "uppercase",
        letterSpacing: "0.12em", marginBottom: 14,
        display: "flex", alignItems: "center", gap: 8,
      }}>
        <span>📖</span> Continue Reading
      </div>

      {/* ── Horizontal scroll strip ── */}
      <div
        ref={scrollRef}
        className="cr-scroll"
        style={{
          display: "flex",
          gap: 12,
          overflowX: "auto",
          paddingBottom: 8,
          scrollSnapType: "x mandatory",
          WebkitOverflowScrolling: "touch",
          scrollbarWidth: "none",
          msOverflowStyle: "none",
        }}
      >
        {active.map(section => {
          const data = positions[section.id];
          return (
            <button
              key={section.id}
              onClick={() => section.go(data, nav)}
              className="pressable"
              style={{
                // Single card = full width; 2+ = peek next card
                flex: active.length === 1 ? "1 1 100%" : "0 0 78%",
                scrollSnapAlign: "start",
                background: section.bg,
                border: "none",
                borderRadius: 16,
                padding: "18px 18px 16px",
                cursor: "pointer",
                display: "flex",
                alignItems: "center",
                gap: 14,
                boxShadow: "0 4px 16px rgba(0,0,0,0.22)",
                transition: "transform 0.15s, box-shadow 0.15s",
                position: "relative",
                overflow: "hidden",
                textAlign: "left",
              }}
            >
              {/* Ambient light overlay */}
              <div style={{
                position: "absolute", inset: 0,
                background: "radial-gradient(ellipse at 20% 20%,rgba(255,255,255,0.08),transparent 60%)",
                pointerEvents: "none",
              }}/>

              {/* Stone texture overlay */}
              <div style={{
                position: "absolute", inset: 0, opacity: 0.35, pointerEvents: "none",
                backgroundImage: `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.15'/%3E%3C/svg%3E")`,
              }}/>

              {/* Wax seal icon */}
              <div style={{
                width: 46, height: 46, borderRadius: "50%",
                background: `radial-gradient(circle at 35% 35%,${section.sealLight},${section.seal} 60%)`,
                display: "flex", alignItems: "center", justifyContent: "center",
                boxShadow: `0 0 0 3px rgba(255,255,255,0.85), 0 4px 12px rgba(0,0,0,0.35)`,
                position: "relative", zIndex: 2, flexShrink: 0,
              }}>
                <span style={{
                  fontSize: 20, color: "rgba(255,255,255,0.9)",
                  textShadow: "0 1px 2px rgba(0,0,0,0.3)",
                }}>{section.icon}</span>
              </div>

              {/* Label + subtitle */}
              <div style={{ position: "relative", zIndex: 2, flex: 1, minWidth: 0 }}>
                <div style={{
                  fontFamily: ht.heading, fontSize: 15, fontWeight: 700,
                  color: "#FFFFFFEE",
                  textShadow: "0 1px 3px rgba(0,0,0,0.4)",
                  letterSpacing: "0.02em",
                }}>{section.label}</div>
                <div style={{
                  fontFamily: ht.ui, fontSize: 11.5,
                  color: "rgba(255,255,255,0.6)",
                  marginTop: 3,
                  whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis",
                }}>{section.subtitle(data)}</div>
              </div>

              {/* Chevron */}
              <div style={{
                color: "rgba(255,255,255,0.4)", flexShrink: 0,
                position: "relative", zIndex: 2,
              }}><Chev /></div>
            </button>
          );
        })}
      </div>
    </div>
  );
}