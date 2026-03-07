"use client";
import { useState, useEffect, useRef } from "react";
import { supabase } from "../../lib/supabase";

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

export default function ContinueReading({ nav, ht, user }) {
  const [positions, setPositions] = useState({});
  const scrollRef = useRef(null);

  // ─── Load positions: localStorage first, then Supabase merge ───
  useEffect(() => {
    const loaded = {};

    // Read section-specific keys from localStorage (instant)
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

    // ─── Supabase merge: fetch cloud positions, update if newer ───
    if (!user) return;
    (async () => {
      try {
        const { data } = await supabase
          .from("user_reading_position")
          .select("section_key, position_data, updated_at")
          .eq("user_id", user.id);
        if (!data || data.length === 0) return;

        setPositions(prev => {
          const merged = { ...prev };
          data.forEach(row => {
            const section = SECTIONS.find(s => s.id === row.section_key);
            if (!section || section.disabled) return;
            // If localStorage had nothing for this section, use Supabase data
            // Also backfill localStorage so next load is instant
            if (!merged[row.section_key]) {
              merged[row.section_key] = row.position_data;
              try { localStorage.setItem(section.key, JSON.stringify(row.position_data)); } catch {}
            } else {
              // Both exist — Supabase wins (it has the cross-device data)
              merged[row.section_key] = row.position_data;
              try { localStorage.setItem(section.key, JSON.stringify(row.position_data)); } catch {}
            }
          });
          return merged;
        });
      } catch (e) { console.error("Position fetch error:", e); }
    })();
  }, [user]);

  // ─── Filter to only visited sections ───
  const active = SECTIONS.filter(s => !s.disabled && positions[s.id]);

  // Nothing to show yet
  if (active.length === 0) return null;

  return (
    <div style={{ marginBottom: 16 }}>
      <style>{`.cr-scroll::-webkit-scrollbar { display: none; }`}</style>

      {/* ── WhatsApp-style status circles ── */}
      <div
        ref={scrollRef}
        className="cr-scroll"
        style={{
          display: "flex",
          gap: 14,
          overflowX: "auto",
          paddingBottom: 4,
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
              style={{
                background: "none",
                border: "none",
                cursor: "pointer",
                display: "flex",
                flexDirection: "column",
                alignItems: "center",
                gap: 4,
                padding: "2px 0",
                flexShrink: 0,
                width: 62,
              }}
            >
              {/* Circle with colored ring */}
              <div style={{
                width: 50, height: 50, borderRadius: "50%",
                padding: 2.5,
                background: `linear-gradient(135deg, ${section.sealLight}, ${section.seal})`,
                flexShrink: 0,
              }}>
                <div style={{
                  width: "100%", height: "100%", borderRadius: "50%",
                  background: section.bg,
                  display: "flex", alignItems: "center", justifyContent: "center",
                  boxShadow: "inset 0 1px 3px rgba(0,0,0,0.3)",
                }}>
                  <span style={{
                    fontSize: 22,
                    filter: "drop-shadow(0 1px 2px rgba(0,0,0,0.3))",
                  }}>{section.icon}</span>
                </div>
              </div>

              {/* Label */}
              <div style={{
                fontFamily: ht.ui, fontSize: 8, fontWeight: 700,
                color: ht.muted, textTransform: "uppercase",
                letterSpacing: "0.05em",
                whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis",
                maxWidth: 62, textAlign: "center",
              }}>{section.id === "ot" ? "OT" : section.id === "nt" ? "NT" : section.label.split(" ")[0]}</div>

              {/* Position subtitle */}
              <div style={{
                fontFamily: ht.ui, fontSize: 9, fontWeight: 600,
                color: ht.accent,
                whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis",
                maxWidth: 62, textAlign: "center", lineHeight: 1.2,
              }}>{section.subtitle(data)}</div>
            </button>
          );
        })}
      </div>
    </div>
  );
}