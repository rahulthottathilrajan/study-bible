"use client";
// ============================================================
//  ProphecyFulfilment.js — Phase 6: Prophecy & Fulfilment
//  Level 2: Scroll-style cards — parchment + wooden rollers
//  + unroll animation when tapped
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
const st = {
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
    from {
      clip-path: inset(0 0 100% 0);
      opacity: 0.6;
    }
    to {
      clip-path: inset(0 0 0% 0);
      opacity: 1;
    }
  }
  @keyframes unrollFade {
    from { opacity:0; transform:translateY(-6px); }
    to   { opacity:1; transform:translateY(0); }
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
    {/* Wood grain lines */}
    {[12, 28, 48, 65, 80, 91].map(pct => (
      <div key={pct} style={{
        position: "absolute", top: 2, bottom: 2,
        left: `${pct}%`, width: 1,
        background: P.grain,
      }} />
    ))}
    {/* End caps — dark knobs */}
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
    {/* Highlight sheen */}
    <div style={{
      position: "absolute", top: 2, left: 12, right: 12, height: 3,
      background: "rgba(255,255,255,0.08)",
      borderRadius: 2,
    }} />
  </div>
);

// ─── Stat tile ────────────────────────────────────────────────────────────────
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

// ─── Category filter pill ─────────────────────────────────────────────────────
const CategoryPill = ({ cat, active, onClick }) => {
  const color = cat.id === "All" ? st.dark : CATEGORY_COLORS[cat.id];
  return (
    <button
      onClick={onClick}
      style={{
        fontFamily: st.ui, fontSize: 12, fontWeight: active ? 700 : 500,
        color:  active ? "#fff" : (color || st.muted),
        background: active ? (color || st.dark) : "rgba(0,0,0,0.04)",
        border: `1.5px solid ${active ? (color || st.dark) : "rgba(0,0,0,0.08)"}`,
        borderRadius: 20, padding: "5px 14px",
        cursor: "pointer", whiteSpace: "nowrap",
        transition: "all 0.15s",
        display: "flex", alignItems: "center", gap: 5,
      }}
    >
      {cat.id !== "All" && <span style={{ fontSize: 13 }}>{CATEGORY_ICONS[cat.id]}</span>}
      {cat.id === "All" ? "All Prophecies" : cat.label}
    </button>
  );
};

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

// ─── Scroll card (unified — handles both featured + standard) ─────────────────
const ScrollCard = ({ prophecy, isOpen, onSelect, onClose, nav, index, isFeatured }) => {
  const color = CATEGORY_COLORS[prophecy.category] || st.accent;

  return (
    <div style={{
      animation: `fadeUp 0.32s ease both`,
      animationDelay: `${index * 0.06}s`,
    }}>
      <div style={{
        borderRadius: 10,
        overflow: "hidden",
        boxShadow: isOpen
          ? `0 10px 36px rgba(0,0,0,0.22), 0 2px 8px rgba(0,0,0,0.14)`
          : `0 4px 14px rgba(0,0,0,0.14), 0 1px 4px rgba(0,0,0,0.08)`,
        border: `1px solid ${isOpen ? P.edge : "rgba(200,168,106,0.35)"}`,
        transition: "box-shadow 0.3s ease, border-color 0.3s ease",
      }}>

        {/* ── Top roller ── */}
        <Roller shadow={true} />

        {/* ── Parchment card face (tappable) ── */}
        <button
          onClick={() => onSelect(prophecy)}
          style={{
            width: "100%", textAlign: "left", cursor: "pointer", border: "none",
            background: isOpen
              ? `linear-gradient(180deg, ${P.bgMid} 0%, ${P.bgDark} 100%)`
              : `linear-gradient(180deg, ${P.bg} 0%, ${P.bgMid} 100%)`,
            padding: isFeatured ? "15px 16px 14px" : "13px 15px",
            transition: "background 0.3s ease",
            position: "relative",
          }}
        >
          {/* Category colour ribbon — left edge */}
          <div style={{
            position: "absolute", left: 0, top: 0, bottom: 0, width: 4,
            background: `linear-gradient(180deg, ${color}, ${color}99)`,
          }} />

          {/* Featured label */}
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

          {/* Card body row */}
          <div style={{ display: "flex", alignItems: "flex-start", gap: 12, paddingLeft: 8 }}>
            {/* Icon seal */}
            <div style={{
              width: isFeatured ? 46 : 42,
              height: isFeatured ? 46 : 42,
              borderRadius: 11,
              background: `${color}22`,
              border: `1.5px solid ${color}44`,
              display: "flex", alignItems: "center", justifyContent: "center",
              fontSize: isFeatured ? 22 : 19,
              flexShrink: 0,
            }}>
              {CATEGORY_ICONS[prophecy.category]}
            </div>

            {/* Text */}
            <div style={{ flex: 1, minWidth: 0 }}>
              <div style={{
                fontFamily: st.heading,
                fontSize: isFeatured ? 17 : 15,
                color: P.ink,
                lineHeight: 1.2, marginBottom: 3,
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
              transition: "transform 0.25s ease",
              marginTop: 2,
            }}>
              ›
            </div>
          </div>
        </button>

        {/* ── Unrolled content ── */}
        {isOpen && (
          <div style={{
            background: `linear-gradient(180deg, ${P.bgDark} 0%, ${P.bgDeep} 100%)`,
            borderTop: `1px solid ${P.edge}`,
            animation: "unrollDown 0.38s cubic-bezier(0.4,0,0.2,1) forwards",
          }}>
            {/* Decorative divider with category icon */}
            <div style={{
              display: "flex", alignItems: "center", gap: 8,
              padding: "12px 20px 4px",
              animation: "unrollFade 0.4s ease 0.1s both",
            }}>
              <div style={{ flex: 1, height: 1, background: `${color}44` }} />
              <div style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color, textTransform: "uppercase", letterSpacing: "0.1em",
                display: "flex", alignItems: "center", gap: 5,
              }}>
                <span>{CATEGORY_ICONS[prophecy.category]}</span>
                {CATEGORY_LABELS[prophecy.category] || prophecy.category}
              </div>
              <div style={{ flex: 1, height: 1, background: `${color}44` }} />
            </div>

            {/* ProphecyDetail in scroll mode */}
            <div style={{
              padding: "4px 16px 16px",
              animation: "unrollFade 0.4s ease 0.15s both",
            }}>
              <ProphecyDetail
                prophecy={prophecy}
                onClose={onClose}
                nav={nav}
                scrollMode={true}
              />
            </div>
          </div>
        )}

        {/* ── Bottom roller ── */}
        <Roller shadow={false} />
      </div>
    </div>
  );
};

// ─── Section divider ──────────────────────────────────────────────────────────
const SectionDivider = ({ label }) => (
  <div style={{
    display: "flex", alignItems: "center", gap: 10,
    margin: "20px 0 14px",
  }}>
    <div style={{ flex: 1, height: 1, background: st.divider }} />
    <div style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: st.light, textTransform: "uppercase", letterSpacing: "0.08em",
    }}>
      {label}
    </div>
    <div style={{ flex: 1, height: 1, background: st.divider }} />
  </div>
);

// ─── Intro banner ─────────────────────────────────────────────────────────────
const IntroBanner = () => (
  <div style={{
    margin: "16px 16px 0",
    background: "linear-gradient(135deg,#2D1B4E0E,#8B5CF608)",
    border: "1px solid rgba(139,92,246,0.15)",
    borderRadius: 14, padding: "14px 16px",
  }}>
    <p style={{
      fontFamily: st.body, fontSize: 13.5, color: st.muted,
      lineHeight: 1.75, margin: 0, fontStyle: "italic",
    }}>
      "Known unto God are all his works from the beginning of the world." — Acts 15:18.
      Over 300 prophecies in the Old Testament point to Jesus of Nazareth alone.
      Mathematicians estimate the probability of one man fulfilling even eight
      at one in 10¹⁷. Here are 25 — read, examine, and decide for yourself.
    </p>
  </div>
);

// ─── Category description banner ──────────────────────────────────────────────
const CategoryBanner = ({ categoryId }) => {
  const descriptions = {
    "Messianic":   "Prophecies written centuries before Christ that describe his birth, life, death, and resurrection with extraordinary precision.",
    "Daniel":      "Visions given to Daniel in Babylon — confirmed by secular historians — that trace world empires from 600 BC to the end of the age.",
    "Revelation":  "End-times prophecies from John's vision on Patmos. Presented here with all major scholarly interpretations — no single school is endorsed.",
    "Israel":      "Prophecies about the Jewish people — their scattering, survival, and return — many now visible in modern history.",
    "Restoration": "The thread of cosmic restoration running through both Testaments — new covenant, outpoured Spirit, gospel to all nations, renewed creation.",
  };
  const color = CATEGORY_COLORS[categoryId];
  const desc  = descriptions[categoryId];
  if (!desc) return null;
  return (
    <div style={{
      margin: "12px 16px 0",
      background: `${color}0A`,
      border: `1px solid ${color}22`,
      borderLeft: `4px solid ${color}`,
      borderRadius: 12, padding: "11px 14px",
    }}>
      <p style={{
        fontFamily: st.body, fontSize: 13, color: st.text,
        lineHeight: 1.7, margin: 0, fontStyle: "italic",
      }}>
        {desc}
      </p>
    </div>
  );
};

// ══════════════════════════════════════════════════════════════════════════════
//  MAIN COMPONENT
// ══════════════════════════════════════════════════════════════════════════════
export default function ProphecyFulfilment({ nav }) {
  const [activeCategory, setActiveCategory] = useState("All");
  const [selected,       setSelected]       = useState(null);
  const openCardRef = useRef(null);

  // Scroll opened card into view
  useEffect(() => {
    if (selected && openCardRef.current) {
      setTimeout(() => {
        openCardRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
      }, 80);
    }
  }, [selected?.id]);

  const filtered       = getPropheciesByCategory(activeCategory);
  const featuredInView = filtered.filter(p => p.featured);
  const standardInView = filtered.filter(p => !p.featured);

  const handleSelect = (prophecy) => {
    setSelected(prev => prev?.id === prophecy?.id ? null : prophecy);
  };

  const handleCategory = (catId) => {
    setActiveCategory(catId);
    setSelected(null);
  };

  return (
    <div style={{ minHeight: "100vh", background: st.bg, paddingBottom: 48 }}>
      <style>{STYLES}</style>

      {/* ── Sticky Header ── */}
      <div style={{
        background: st.headerGradient,
        padding: "14px 20px 18px",
        position: "sticky", top: 0, zIndex: 30,
      }}>
        <div style={{ display: "flex", alignItems: "center", gap: 12, marginBottom: 10 }}>
          <button
            onClick={() => nav("home")}
            style={{
              background: "rgba(255,255,255,0.12)", border: "none",
              borderRadius: 8, padding: "6px 12px",
              fontFamily: st.ui, fontSize: 13, color: st.headerText,
              cursor: "pointer", fontWeight: 600,
            }}
          >
            ← Back
          </button>
          <div>
            <h2 style={{
              fontFamily: st.heading, fontSize: 22, color: st.headerText,
              margin: 0, lineHeight: 1.1,
            }}>
              Prophecy & Fulfilment
            </h2>
            <div style={{
              fontFamily: st.ui, fontSize: 12,
              color: "rgba(248,232,208,0.70)", marginTop: 2,
            }}>
              25 prophecies — from Eden to eternity
            </div>
          </div>
        </div>
        <div style={{ display: "flex", gap: 8 }}>
          <StatTile icon="📜" value={STATS.total}    label="Prophecies" />
          <StatTile icon="✅" value={STATS.fulfilled} label="Fulfilled"  />
          <StatTile icon="⏳" value={STATS.awaiting}  label="Awaiting"   />
        </div>
      </div>

      {/* ── Intro banner ── */}
      {activeCategory === "All" && <IntroBanner />}

      {/* ── Category pills ── */}
      <div style={{ padding: "16px 16px 0" }}>
        <div style={{
          fontFamily: st.ui, fontSize: 10, fontWeight: 700,
          color: st.light, textTransform: "uppercase",
          letterSpacing: "0.07em", marginBottom: 8,
        }}>
          Category
        </div>
        <div style={{
          display: "flex", gap: 7, overflowX: "auto",
          paddingBottom: 4, scrollbarWidth: "none",
        }}>
          {PROPHECY_CATEGORIES.map(cat => (
            <CategoryPill
              key={cat.id}
              cat={cat}
              active={activeCategory === cat.id}
              onClick={() => handleCategory(cat.id)}
            />
          ))}
        </div>
      </div>

      {/* ── Category description ── */}
      {activeCategory !== "All" && <CategoryBanner categoryId={activeCategory} />}

      {/* ── Result count ── */}
      <div style={{
        padding: "10px 16px 2px",
        fontFamily: st.ui, fontSize: 12, color: st.light,
      }}>
        {filtered.length === PROPHECIES.length
          ? `All ${PROPHECIES.length} prophecies`
          : `${filtered.length} prophecies — ${CATEGORY_LABELS[activeCategory] || activeCategory}`}
      </div>

      {/* ══ Scroll cards ══ */}
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
            />
          </div>
        ))}

        {/* Divider */}
        {featuredInView.length > 0 && standardInView.length > 0 && (
          <SectionDivider label="All Prophecies" />
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
            />
          </div>
        ))}

        {/* Empty state */}
        {filtered.length === 0 && (
          <div style={{
            textAlign: "center", padding: "48px 24px",
            fontFamily: st.body, fontSize: 15,
            color: st.light, fontStyle: "italic",
          }}>
            No prophecies in this category yet.
          </div>
        )}
      </div>

      {/* ── Footer legend ── */}
      {filtered.length > 0 && (
        <div style={{
          margin: "24px 16px 0",
          background: "rgba(0,0,0,0.03)",
          borderRadius: 12, padding: "14px 16px",
        }}>
          <p style={{
            fontFamily: st.ui, fontSize: 11, color: st.light,
            lineHeight: 1.65, margin: 0, textAlign: "center",
          }}>
            ✅ Literal Fulfilment &nbsp;·&nbsp;
            📜 History Confirmed &nbsp;·&nbsp;
            🔷 Typological &nbsp;·&nbsp;
            🔶 Partial &nbsp;·&nbsp;
            ⏳ Awaiting
          </p>
          <p style={{
            fontFamily: st.ui, fontSize: 10, color: st.light,
            margin: "8px 0 0", textAlign: "center", opacity: 0.7,
          }}>
            Commentary: Edersheim · Kaiser · Motyer · Alford · Anderson
          </p>
        </div>
      )}
    </div>
  );
}