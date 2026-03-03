"use client";
// ============================================================
//  ProphecyFulfilment.js — Phase 6: Prophecy & Fulfilment
//  Level 2: Scroll-style cards — parchment + wooden rollers
//  + Category Hub landing screen
// ============================================================

import { useState, useEffect, useRef } from "react";
import ProphecyDetail from "./ProphecyDetail";
import {
  PROPHECIES,
  PROPHECY_CATEGORIES,
  STATUS_CONFIG,
  STATS,
  getPropheciesByCategory,
} from "./ProphecyData";

// ─── Sunrise theme ────────────────────────────────────────────────────────────
const stLight = {
  heading: "'DM Serif Display',serif",
  body:    "'Lora',serif",
  ui:      "'Nunito',sans-serif",
  bg:      "#FFF8F0",
  card:    "#fff",
  headerGradient: "linear-gradient(165deg,#2D1B4E 0%,#4A2D6B 100%)",
  headerText: "#F8E8D0",
  accent:  "#E8625C",
  dark:    "#2D1B4E",
  text:    "#4A3B2D",
  muted:   "#8B6B4F",
  light:   "#C0A888",
  divider: "rgba(232,98,92,0.12)",
};
const stDark = {
  ...stLight,
  bg:      "#161210",
  card:    "#201A16",
  dark:    "#F8E8D0",
  text:    "#D0B898",
  muted:   "#9A7A5A",
  light:   "#6A5840",
  divider: "rgba(232,98,92,0.15)",
};
// Alias for helper components that reference fonts only
const st = stLight;

// ─── Parchment palette ────────────────────────────────────────────────────────
const P = {
  bg:       "#F8F0DC",
  bgMid:    "#F0E4C0",
  bgDark:   "#E8D4A0",
  bgDeep:   "#DFC98A",
  edge:     "#C8A86A",
  roller:   "linear-gradient(180deg,#1A0A00 0%,#6B3A16 25%,#9B5C28 50%,#6B3A16 75%,#1A0A00 100%)",
  ink:      "#2A1A08",
  inkMid:   "#6B4A28",
  inkFaint: "#9B7A50",
  grain:    "rgba(255,255,255,0.055)",
};

// ─── Category config ──────────────────────────────────────────────────────────
const CATEGORY_COLORS = {
  "Messianic":   "#8B5CF6",
  "Daniel":      "#D4A853",
  "Revelation":  "#E8625C",
  "Israel":      "#1B7A6E",
  "Restoration": "#2E7D32",
};

const CATEGORY_ICONS = {
  "Messianic":   "🌟",
  "Daniel":      "🌙",
  "Revelation":  "📖",
  "Israel":      "🏺",
  "Restoration": "🌱",
};

const CATEGORY_LABELS = {
  "Israel":      "Nation of Israel",
  "Restoration": "Restoration",
  "Daniel":      "Daniel's Visions",
  "Messianic":   "Messianic",
  "Revelation":  "Revelation",
};

const CATEGORY_DESCRIPTIONS = {
  "Messianic":   "Prophecies written centuries before Christ that describe his birth, life, death, and resurrection with extraordinary precision.",
  "Daniel":      "Visions given to Daniel in Babylon — confirmed by secular historians — that trace world empires from 600 BC to the end of the age.",
  "Revelation":  "End-times prophecies from John's vision on Patmos. Presented here with all major scholarly interpretations — no single school is endorsed.",
  "Israel":      "Prophecies about the Jewish people — their scattering, survival, and return — many now visible in modern history.",
  "Restoration": "The thread of cosmic restoration running through both Testaments — new covenant, outpoured Spirit, gospel to all nations, renewed creation.",
};

// ─── Keyframes ────────────────────────────────────────────────────────────────
const STYLES = `
  @keyframes fadeUp {
    from { opacity:0; transform:translateY(18px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes panelIn {
    from { opacity:0; transform:translateY(20px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes shimmerPulse {
    0%,100% { opacity:0.65; }
    50%     { opacity:1; }
  }
  @keyframes unrollDown {
    from { clip-path: inset(0 0 100% 0); opacity: 0.6; }
    to   { clip-path: inset(0 0 0% 0);   opacity: 1; }
  }
  @keyframes unrollFade {
    from { opacity:0; transform:translateY(-6px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes hubCardIn {
    from { opacity:0; transform:translateY(22px) scale(0.97); }
    to   { opacity:1; transform:translateY(0)    scale(1); }
  }
`;

// ─── Wooden roller ────────────────────────────────────────────────────────────
const Roller = ({ shadow }) => (
  <div style={{
    height: 18,
    background: P.roller,
    position: "relative",
    borderRadius: shadow ? "8px 8px 0 0" : "0 0 8px 8px",
    boxShadow: shadow
      ? "0 4px 10px rgba(0,0,0,0.45)"
      : "0 -2px 8px rgba(0,0,0,0.35)",
    zIndex: shadow ? 2 : 1,
  }}>
    {[12, 28, 48, 65, 80, 91].map(pct => (
      <div key={pct} style={{
        position: "absolute", top: 2, bottom: 2,
        left: `${pct}%`, width: 1,
        background: P.grain,
      }} />
    ))}
    <div style={{
      position: "absolute", left: 0, top: 0, bottom: 0, width: 10,
      background: "linear-gradient(90deg,#080200,#3A1A08)",
      borderRadius: "3px 0 0 3px",
    }} />
    <div style={{
      position: "absolute", right: 0, top: 0, bottom: 0, width: 10,
      background: "linear-gradient(270deg,#080200,#3A1A08)",
      borderRadius: "0 3px 3px 0",
    }} />
    <div style={{
      position: "absolute", top: 2, left: 12, right: 12, height: 3,
      background: "rgba(255,255,255,0.08)",
      borderRadius: 2,
    }} />
  </div>
);

// ─── Stat tile (header) ───────────────────────────────────────────────────────
const StatTile = ({ icon, value, label }) => (
  <div style={{
    background: "rgba(255,255,255,0.11)",
    borderRadius: 10, padding: "8px 12px",
    display: "flex", alignItems: "center", gap: 8, flex: 1,
  }}>
    <span style={{ fontSize: 22 }}>{icon}</span>
    <div>
      <div style={{ fontFamily: st.ui, fontSize: 18, fontWeight: 800, color: st.headerText, lineHeight: 1 }}>
        {value}
      </div>
      <div style={{ fontFamily: st.ui, fontSize: 9, color: "rgba(248,232,208,0.65)", textTransform: "uppercase", letterSpacing: "0.05em" }}>
        {label}
      </div>
    </div>
  </div>
);

// ─── Status badge ─────────────────────────────────────────────────────────────
const StatusBadge = ({ status, parchment }) => {
  const cfg = STATUS_CONFIG[status];
  if (!cfg) return null;
  return (
    <span style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: cfg.color,
      background: parchment ? `${cfg.color}22` : cfg.bg,
      borderRadius: 5, padding: "2px 7px",
      whiteSpace: "nowrap",
      border: parchment ? `1px solid ${cfg.color}33` : "none",
    }}>
      {cfg.icon} {status}
    </span>
  );
};

// ─── Category Hub Card ────────────────────────────────────────────────────────
const HubCard = ({ categoryId, onClick, index }) => {
  const color  = CATEGORY_COLORS[categoryId];
  const icon   = CATEGORY_ICONS[categoryId];
  const label  = CATEGORY_LABELS[categoryId];
  const desc   = CATEGORY_DESCRIPTIONS[categoryId];
  const count  = PROPHECIES.filter(p => p.category === categoryId).length;
  const fulfilled = PROPHECIES.filter(p =>
    p.category === categoryId &&
    (p.status === "Literal Fulfilment" || p.status === "History Confirmed")
  ).length;
  const awaiting = PROPHECIES.filter(p =>
    p.category === categoryId && p.status === "Awaiting"
  ).length;

  return (
    <button
      onClick={onClick}
      style={{
        width: "100%", textAlign: "left", border: "none", cursor: "pointer",
        padding: 0, background: "transparent",
        animation: `hubCardIn 0.35s ease both`,
        animationDelay: `${index * 0.07}s`,
      }}
    >
      {/* Scroll wrapper */}
      <div style={{
        borderRadius: 10, overflow: "hidden",
        boxShadow: "0 5px 18px rgba(0,0,0,0.13), 0 1px 4px rgba(0,0,0,0.08)",
        border: `1px solid rgba(200,168,106,0.4)`,
        transition: "box-shadow 0.2s ease, transform 0.2s ease",
      }}>
        <Roller shadow={true} />

        {/* Parchment face */}
        <div style={{
          background: `linear-gradient(135deg, ${P.bg} 0%, ${P.bgMid} 100%)`,
          padding: "16px 18px 18px",
          position: "relative",
          borderLeft: `5px solid ${color}`,
        }}>
          {/* Category colour ribbon top */}
          <div style={{
            position: "absolute", top: 0, left: 0, right: 0, height: 3,
            background: `linear-gradient(90deg, ${color}, ${color}55)`,
          }} />

          {/* Icon + title row */}
          <div style={{ display: "flex", alignItems: "center", gap: 14, marginBottom: 10 }}>
            <div style={{
              width: 54, height: 54, borderRadius: 14,
              background: `${color}1A`,
              border: `2px solid ${color}44`,
              display: "flex", alignItems: "center", justifyContent: "center",
              fontSize: 28, flexShrink: 0,
            }}>
              {icon}
            </div>
            <div style={{ flex: 1 }}>
              <div style={{
                fontFamily: st.heading, fontSize: 19,
                color: P.ink, lineHeight: 1.15, marginBottom: 3,
              }}>
                {label}
              </div>
              <div style={{
                fontFamily: st.ui, fontSize: 11, fontWeight: 700,
                color, letterSpacing: "0.03em",
              }}>
                {count} {count === 1 ? "prophecy" : "prophecies"}
              </div>
            </div>
            {/* Chevron */}
            <div style={{ color: P.inkFaint, fontSize: 24, flexShrink: 0 }}>›</div>
          </div>

          {/* Description */}
          <p style={{
            fontFamily: st.body, fontSize: 12.5, color: P.inkMid,
            lineHeight: 1.65, margin: "0 0 12px", fontStyle: "italic",
          }}>
            {desc}
          </p>

          {/* Mini stat row */}
          <div style={{ display: "flex", gap: 7, flexWrap: "wrap" }}>
            {fulfilled > 0 && (
              <span style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color: "#2E7D32", background: "rgba(46,125,50,0.1)",
                border: "1px solid rgba(46,125,50,0.2)",
                borderRadius: 5, padding: "2px 8px",
              }}>
                ✅ {fulfilled} fulfilled
              </span>
            )}
            {awaiting > 0 && (
              <span style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color: "#E8625C", background: "rgba(232,98,92,0.1)",
                border: "1px solid rgba(232,98,92,0.2)",
                borderRadius: 5, padding: "2px 8px",
              }}>
                ⏳ {awaiting} awaiting
              </span>
            )}
          </div>
        </div>

        <Roller shadow={false} />
      </div>
    </button>
  );
};

// ─── "All Prophecies" hub entry ───────────────────────────────────────────────
const AllPropheciesCard = ({ onClick, t }) => (
  <button
    onClick={onClick}
    style={{
      width: "100%", textAlign: "left", border: "none", cursor: "pointer",
      padding: 0, background: "transparent",
      animation: "hubCardIn 0.35s ease both",
    }}
  >
    <div style={{
      background: `linear-gradient(135deg, ${t.dark}08, ${t.dark}0A)`,
      border: `1.5px dashed ${t.light}55`,
      borderRadius: 12, padding: "14px 18px",
      display: "flex", alignItems: "center", gap: 14,
    }}>
      <div style={{
        width: 44, height: 44, borderRadius: 12,
        background: `${t.dark}14`,
        display: "flex", alignItems: "center", justifyContent: "center",
        fontSize: 22, flexShrink: 0,
      }}>
        📜
      </div>
      <div style={{ flex: 1 }}>
        <div style={{
          fontFamily: st.heading, fontSize: 16, color: t.dark, marginBottom: 2,
        }}>
          All Prophecies
        </div>
        <div style={{
          fontFamily: st.ui, fontSize: 11, color: t.muted,
        }}>
          Browse all {STATS.total} prophecies together
        </div>
      </div>
      <div style={{ color: t.light, fontSize: 22 }}>›</div>
    </div>
  </button>
);

// ─── Hub intro quote ─────────────────────────────────────────────────────────
const HubIntro = ({ t }) => (
  <div style={{
    margin: "20px 16px 0",
    background: `linear-gradient(135deg,${t.dark}0E,${t.accent}08)`,
    border: "1px solid rgba(139,92,246,0.15)",
    borderRadius: 14, padding: "14px 16px",
  }}>
    <p style={{
      fontFamily: st.body, fontSize: 13, color: t.muted,
      lineHeight: 1.75, margin: 0, fontStyle: "italic",
    }}>
      "Known unto God are all his works from the beginning of the world." — Acts 15:18.
      Over 300 prophecies in the Old Testament point to Jesus of Nazareth alone. Choose a
      category to explore, or browse all prophecies together.
    </p>
  </div>
);

// ─── Scroll card (unified — featured + standard) ──────────────────────────────
const ScrollCard = ({ prophecy, isOpen, onSelect, onClose, nav, index, isFeatured, isRead, onMarkRead, darkMode }) => {
  const color = CATEGORY_COLORS[prophecy.category] || st.accent;

  return (
    <div style={{
      animation: `fadeUp 0.32s ease both`,
      animationDelay: `${index * 0.06}s`,
    }}>
      <div style={{
        borderRadius: 10, overflow: "hidden",
        boxShadow: isOpen
          ? "0 10px 36px rgba(0,0,0,0.22), 0 2px 8px rgba(0,0,0,0.14)"
          : "0 4px 14px rgba(0,0,0,0.14), 0 1px 4px rgba(0,0,0,0.08)",
        border: `1px solid ${isOpen ? P.edge : "rgba(200,168,106,0.35)"}`,
        transition: "box-shadow 0.3s ease, border-color 0.3s ease",
      }}>
        <Roller shadow={true} />

        {/* Parchment face */}
        <button
          onClick={() => onSelect(prophecy)}
          style={{
            width: "100%", textAlign: "left", cursor: "pointer", border: "none",
            background: isOpen
              ? (isRead ? "linear-gradient(180deg,#E0EFDC 0%,#D0E8CB 100%)" : `linear-gradient(180deg, ${P.bgMid} 0%, ${P.bgDark} 100%)`)
              : (isRead ? "linear-gradient(180deg,#EAF3E6 0%,#DEE9D8 100%)" : `linear-gradient(180deg, ${P.bg} 0%, ${P.bgMid} 100%)`),
            padding: isFeatured ? "15px 16px 14px" : "13px 15px",
            transition: "background 0.3s ease",
            position: "relative",
          }}
        >
          {/* Category colour ribbon */}
          <div style={{
            position: "absolute", left: 0, top: 0, bottom: 0, width: 4,
            background: `linear-gradient(180deg, ${color}, ${color}99)`,
          }} />

          {isFeatured && (
            <div style={{
              fontFamily: st.ui, fontSize: 9, fontWeight: 800,
              color, textTransform: "uppercase", letterSpacing: "0.12em",
              marginBottom: 9, marginLeft: 8,
              display: "flex", alignItems: "center", gap: 5,
            }}>
              <span style={{ animation: "shimmerPulse 2.2s infinite" }}>✦</span> Featured
            </div>
          )}

          <div style={{ display: "flex", alignItems: "flex-start", gap: 12, paddingLeft: 8 }}>
            {/* Icon */}
            <div style={{
              width: isFeatured ? 46 : 42,
              height: isFeatured ? 46 : 42,
              borderRadius: 11,
              background: `${color}22`,
              border: `1.5px solid ${color}44`,
              display: "flex", alignItems: "center", justifyContent: "center",
              fontSize: isFeatured ? 22 : 19, flexShrink: 0,
            }}>
              {CATEGORY_ICONS[prophecy.category]}
            </div>

            {/* Text */}
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{
                fontFamily: st.heading,
                fontSize: isFeatured ? 17 : 15,
                color: P.ink, lineHeight: 1.2, marginBottom: 3,
              }}>
                {prophecy.title}
              </div>
              <div style={{
                fontFamily: st.body, fontSize: 12, color: P.inkMid,
                fontStyle: "italic", lineHeight: 1.5, marginBottom: 7,
                overflow: "hidden", textOverflow: "ellipsis",
                display: "-webkit-box", WebkitLineClamp: 2,
                WebkitBoxOrient: "vertical",
              }}>
                {prophecy.summary}
              </div>
              <div style={{ display: "flex", flexWrap: "wrap", gap: 5 }}>
                <StatusBadge status={prophecy.status} parchment={true} />
                {isRead && (
                  <span style={{
                    fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                    color: "#3A7D44", background: "rgba(58,125,68,0.13)",
                    border: "1px solid rgba(58,125,68,0.28)",
                    borderRadius: 5, padding: "2px 7px",
                  }}>
                    ✓ Read
                  </span>
                )}
                <span style={{
                  fontFamily: st.ui, fontSize: 10, color: P.inkFaint,
                  background: "rgba(100,60,20,0.1)",
                  border: "1px solid rgba(100,60,20,0.15)",
                  borderRadius: 4, padding: "2px 6px",
                }}>
                  {prophecy.otRef}
                </span>
                {isFeatured && prophecy.ntRef && (
                  <span style={{
                    fontFamily: st.ui, fontSize: 10, color: P.inkFaint,
                    background: "rgba(100,60,20,0.1)",
                    border: "1px solid rgba(100,60,20,0.15)",
                    borderRadius: 4, padding: "2px 6px",
                  }}>
                    {prophecy.ntRef}
                  </span>
                )}
              </div>
            </div>

            {/* Chevron */}
            <div style={{
              color: P.inkFaint, flexShrink: 0, fontSize: 22,
              transform: isOpen ? "rotate(90deg)" : "rotate(0deg)",
              transition: "transform 0.25s ease", marginTop: 2,
            }}>
              ›
            </div>
          </div>
        </button>

        {/* Unrolled content */}
        {isOpen && (
          <div style={{
            background: "#FFFFFF",
            borderTop: `2px solid ${P.edge}`,
            borderBottom: `2px solid ${P.edge}`,
            animation: "unrollDown 0.38s cubic-bezier(0.4,0,0.2,1) forwards",
          }}>
            <div style={{
              display: "flex", alignItems: "center", gap: 8,
              padding: "12px 20px 4px",
              animation: "unrollFade 0.4s ease 0.1s both",
            }}>
              <div style={{ flex: 1, height: 1, background: `${color}33` }} />
              <div style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color, textTransform: "uppercase", letterSpacing: "0.1em",
                display: "flex", alignItems: "center", gap: 5,
                background: `${color}12`, borderRadius: 6,
                padding: "3px 10px",
                border: `1px solid ${color}22`,
              }}>
                <span>{CATEGORY_ICONS[prophecy.category]}</span>
                {CATEGORY_LABELS[prophecy.category] || prophecy.category}
              </div>
              <div style={{ flex: 1, height: 1, background: `${color}33` }} />
            </div>

            <div style={{
              padding: "4px 16px 16px",
              animation: "unrollFade 0.4s ease 0.15s both",
            }}>
              <ProphecyDetail
                prophecy={prophecy}
                onClose={onClose}
                nav={nav}
                scrollMode={true}
                isRead={isRead}
                onMarkRead={onMarkRead}
                darkMode={darkMode}
              />
            </div>
          </div>
        )}

        <Roller shadow={false} />
      </div>
    </div>
  );
};

// ─── Section divider ─────────────────────────────────────────────────────────
const SectionDivider = ({ label, t }) => (
  <div style={{
    display: "flex", alignItems: "center", gap: 10,
    margin: "20px 0 14px",
  }}>
    <div style={{ flex: 1, height: 1, background: t.divider }} />
    <div style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: t.light, textTransform: "uppercase", letterSpacing: "0.08em",
    }}>
      {label}
    </div>
    <div style={{ flex: 1, height: 1, background: t.divider }} />
  </div>
);

// ══════════════════════════════════════════════════════════════════════════════
//  MAIN COMPONENT
// ══════════════════════════════════════════════════════════════════════════════
export default function ProphecyFulfilment({ nav, onPositionSave, darkMode }) {
  const t = darkMode ? stDark : stLight;
  // "hub" = category landing | category id = prophecy list for that category
  const [view,     setView]     = useState("hub");
  const [selected, setSelected] = useState(null);
  const openCardRef = useRef(null);

  const [readIds, setReadIds] = useState(() => {
    if (typeof window === "undefined") return {};
    try { return JSON.parse(localStorage.getItem("prophecy_read") || "{}"); }
    catch { return {}; }
  });
  const markRead = (id) => {
    setReadIds(prev => {
      const updated = { ...prev, [id]: true };
      try { localStorage.setItem("prophecy_read", JSON.stringify(updated)); } catch {}
      return updated;
    });
  };

  // Scroll opened card into view
  useEffect(() => {
    if (selected && openCardRef.current) {
      setTimeout(() => {
        openCardRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
      }, 80);
    }
  }, [selected?.id]);

  const isHub      = view === "hub";
  const filtered   = isHub ? [] : getPropheciesByCategory(view);
  const featuredInView = filtered.filter(p => p.featured);
  const standardInView = filtered.filter(p => !p.featured);

  const handleSelect = (prophecy) => {
    setSelected(prev => prev?.id === prophecy?.id ? null : prophecy);
    if (prophecy && onPositionSave) onPositionSave("prophecy", { topicName: prophecy.title });
  };

  const goToCategory = (catId) => {
    setSelected(null);
    setView(catId);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const goToHub = () => {
    setSelected(null);
    setView("hub");
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const activeLabel = isHub
    ? "Prophecy & Fulfilment"
    : (CATEGORY_LABELS[view] || "All Prophecies");

  const activeSubtitle = isHub
    ? `${STATS.total} prophecies — from Eden to eternity`
    : `${filtered.length} ${filtered.length === 1 ? "prophecy" : "prophecies"}${view !== "All" ? ` · ${CATEGORY_LABELS[view] || view}` : ""}`;

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 48 }}>
      <style>{STYLES}</style>

      {/* ── Sticky Header ── */}
      <div style={{
        background: st.headerGradient,
        padding: "14px 20px 18px",
        position: "sticky", top: 0, zIndex: 30,
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: 12, marginBottom: 10 }}>
          <button
            onClick={isHub ? () => nav("home") : goToHub}
            style={{
              background: "rgba(255,255,255,0.12)", border: "none",
              borderRadius: 8, padding: "6px 12px",
              fontFamily: st.ui, fontSize: 13, color: st.headerText,
              cursor: "pointer", fontWeight: 600,
            }}
          >
            ← {isHub ? "Back" : "Categories"}
          </button>

          {/* Category colour dot when in list view */}
          {!isHub && view !== "All" && (
            <div style={{
              width: 10, height: 10, borderRadius: "50%", flexShrink: 0,
              background: CATEGORY_COLORS[view] || st.accent,
              boxShadow: `0 0 8px ${CATEGORY_COLORS[view] || st.accent}88`,
            }} />
          )}

          <div style={{ flex: 1 }}>
            <h2 style={{
              fontFamily: st.heading, fontSize: 20, color: st.headerText,
              margin: 0, lineHeight: 1.1,
            }}>
              {activeLabel}
            </h2>
            <div style={{
              fontFamily: st.ui, fontSize: 11,
              color: "rgba(248,232,208,0.70)", marginTop: 2,
            }}>
              {activeSubtitle}
            </div>
          </div>
        </div>

        {/* Stats — only on hub */}
        {isHub && (
          <div style={{ display: "flex", gap: 8 }}>
            <StatTile icon="📜" value={STATS.total}     label="Prophecies" />
            <StatTile icon="✅" value={STATS.fulfilled}  label="Fulfilled"  />
            <StatTile icon="⏳" value={STATS.awaiting}   label="Awaiting"   />
          </div>
        )}

        {/* Category colour bar — shown in list view */}
        {!isHub && view !== "All" && (
          <div style={{
            height: 3, borderRadius: 2, marginTop: 4,
            background: `linear-gradient(90deg, ${CATEGORY_COLORS[view] || st.accent}, transparent)`,
          }} />
        )}
      </div>

      {/* ══════════════════════════════════════════════
          HUB VIEW — Category landing screen
      ══════════════════════════════════════════════ */}
      {isHub && (
        <>
          <HubIntro t={t} />

          <div style={{ padding: "20px 16px 0", display: "flex", flexDirection: "column", gap: 14 }}>

            {/* Category cards — in order */}
            {["Messianic", "Daniel", "Revelation", "Israel", "Restoration"].map((catId, i) => (
              <HubCard
                key={catId}
                categoryId={catId}
                onClick={() => goToCategory(catId)}
                index={i}
              />
            ))}

            {/* Divider */}
            <SectionDivider label="or" t={t} />

            {/* All prophecies shortcut */}
            <AllPropheciesCard onClick={() => goToCategory("All")} t={t} />
          </div>

          {/* Hub footer */}
          <div style={{
            margin: "28px 16px 0",
            background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)",
            borderRadius: 12, padding: "14px 16px",
          }}>
            <p style={{
              fontFamily: st.ui, fontSize: 11, color: t.light,
              lineHeight: 1.65, margin: 0, textAlign: "center",
            }}>
              ✅ Literal Fulfilment &nbsp;·&nbsp;
              📜 History Confirmed &nbsp;·&nbsp;
              🔷 Typological &nbsp;·&nbsp;
              🔶 Partial &nbsp;·&nbsp;
              ⏳ Awaiting
            </p>
            <p style={{
              fontFamily: st.ui, fontSize: 10, color: t.light,
              margin: "8px 0 0", textAlign: "center", opacity: 0.7,
            }}>
              Commentary: Edersheim · Kaiser · Motyer · Alford · Anderson
            </p>
          </div>
        </>
      )}

      {/* ══════════════════════════════════════════════
          LIST VIEW — Prophecy scroll cards
      ══════════════════════════════════════════════ */}
      {!isHub && (
        <>
          {/* Category description banner */}
          {view !== "All" && (
            <div style={{
              margin: "14px 16px 0",
              background: `${CATEGORY_COLORS[view]}0A`,
              border: `1px solid ${CATEGORY_COLORS[view]}22`,
              borderLeft: `4px solid ${CATEGORY_COLORS[view]}`,
              borderRadius: 12, padding: "11px 14px",
            }}>
              <p style={{
                fontFamily: st.body, fontSize: 13, color: t.text,
                lineHeight: 1.7, margin: 0, fontStyle: "italic",
              }}>
                {CATEGORY_DESCRIPTIONS[view]}
              </p>
            </div>
          )}

          {/* Result count */}
          <div style={{
            padding: "10px 16px 2px",
            fontFamily: st.ui, fontSize: 12, color: t.light,
          }}>
            {filtered.length === PROPHECIES.length
              ? `All ${PROPHECIES.length} prophecies`
              : `${filtered.length} prophecies`}
          </div>

          {/* Scroll cards */}
          <div style={{ padding: "10px 16px 0", display: "flex", flexDirection: "column", gap: 14 }}>

            {/* Featured */}
            {featuredInView.map((p, i) => (
              <div key={p.id} ref={selected?.id === p.id ? openCardRef : null}>
                <ScrollCard
                  prophecy={p}
                  isOpen={selected?.id === p.id}
                  onSelect={handleSelect}
                  onClose={() => setSelected(null)}
                  nav={nav}
                  index={i}
                  isFeatured={true}
                  isRead={!!readIds[p.id]}
                  onMarkRead={markRead}
                  darkMode={darkMode}
                />
              </div>
            ))}

            {/* Featured → Standard divider */}
            {featuredInView.length > 0 && standardInView.length > 0 && (
              <SectionDivider label="All Prophecies" t={t} />
            )}

            {/* Standard */}
            {standardInView.map((p, i) => (
              <div key={p.id} ref={selected?.id === p.id ? openCardRef : null}>
                <ScrollCard
                  prophecy={p}
                  isOpen={selected?.id === p.id}
                  onSelect={handleSelect}
                  onClose={() => setSelected(null)}
                  nav={nav}
                  index={featuredInView.length + i}
                  isFeatured={false}
                  isRead={!!readIds[p.id]}
                  onMarkRead={markRead}
                  darkMode={darkMode}
                />
              </div>
            ))}

            {/* Empty state */}
            {filtered.length === 0 && (
              <div style={{
                textAlign: "center", padding: "48px 24px",
                fontFamily: st.body, fontSize: 15,
                color: t.light, fontStyle: "italic",
              }}>
                No prophecies in this category yet.
              </div>
            )}
          </div>

          {/* List footer */}
          {filtered.length > 0 && (
            <div style={{
              margin: "24px 16px 0",
              background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)",
              borderRadius: 12, padding: "14px 16px",
            }}>
              <p style={{
                fontFamily: st.ui, fontSize: 11, color: t.light,
                lineHeight: 1.65, margin: 0, textAlign: "center",
              }}>
                ✅ Literal Fulfilment &nbsp;·&nbsp;
                📜 History Confirmed &nbsp;·&nbsp;
                🔷 Typological &nbsp;·&nbsp;
                🔶 Partial &nbsp;·&nbsp;
                ⏳ Awaiting
              </p>
              <p style={{
                fontFamily: st.ui, fontSize: 10, color: t.light,
                margin: "8px 0 0", textAlign: "center", opacity: 0.7,
              }}>
                Commentary: Edersheim · Kaiser · Motyer · Alford · Anderson
              </p>
            </div>
          )}
        </>
      )}
    </div>
  );
}