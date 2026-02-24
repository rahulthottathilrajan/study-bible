"use client";
// ============================================================
//  ProphecyFulfilment.js — Phase 6: Prophecy & Fulfilment
//  Main hub component — imports ProphecyData + ProphecyDetail
//  Receives single `nav` prop from page.js
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

// ─── Animation keyframes ──────────────────────────────────────────────────────
const STYLES = `
  @keyframes fadeUp {
    from { opacity:0; transform:translateY(16px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes panelIn {
    from { opacity:0; transform:translateY(20px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes shimmerPulse {
    0%,100% { opacity:0.7; }
    50%     { opacity:1; }
  }
`;

// ─── Stat tile ────────────────────────────────────────────────────────────────
const StatTile = ({ icon, value, label }) => (
  <div style={{
    background: "rgba(255,255,255,0.11)",
    borderRadius: 10, padding: "8px 12px",
    display: "flex", alignItems: "center", gap: 8, flex: 1,
  }}>
    <span style={{ fontSize: 22 }}>{icon}</span>
    <div>
      <div style={{
        fontFamily: st.ui, fontSize: 18, fontWeight: 800,
        color: st.headerText, lineHeight: 1,
      }}>
        {value}
      </div>
      <div style={{
        fontFamily: st.ui, fontSize: 9,
        color: "rgba(248,232,208,0.65)",
        textTransform: "uppercase", letterSpacing: "0.05em",
      }}>
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
      {cat.id !== "All" && (
        <span style={{ fontSize: 13 }}>{CATEGORY_ICONS[cat.id]}</span>
      )}
      {cat.id === "All" ? "All Prophecies" : cat.label}
    </button>
  );
};

// ─── Status badge ─────────────────────────────────────────────────────────────
const StatusBadge = ({ status }) => {
  const cfg = STATUS_CONFIG[status];
  if (!cfg) return null;
  return (
    <span style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: cfg.color, background: cfg.bg,
      borderRadius: 5, padding: "2px 7px",
      whiteSpace: "nowrap",
    }}>
      {cfg.icon} {status}
    </span>
  );
};

// ─── Featured card ────────────────────────────────────────────────────────────
const FeaturedCard = ({ prophecy, onSelect, isOpen, index }) => {
  const color = CATEGORY_COLORS[prophecy.category] || st.accent;
  return (
    <div style={{ animation: `fadeUp 0.3s ease both`, animationDelay: `${index * 0.07}s` }}>
      <button
        onClick={() => onSelect(prophecy)}
        style={{
          width: "100%", textAlign: "left", cursor: "pointer",
          background: isOpen
            ? `linear-gradient(135deg, ${color}18, ${color}08)`
            : `linear-gradient(135deg, ${color}12, ${color}05)`,
          border: `1.5px solid ${isOpen ? color + "55" : color + "28"}`,
          borderLeft: `5px solid ${color}`,
          borderRadius: 16, padding: "16px 16px",
          boxShadow: isOpen
            ? `0 6px 24px ${color}22`
            : "0 2px 10px rgba(0,0,0,0.06)",
          transition: "all 0.2s",
        }}
      >
        {/* Featured label */}
        <div style={{
          fontFamily: st.ui, fontSize: 9, fontWeight: 800,
          color, textTransform: "uppercase", letterSpacing: "0.1em",
          marginBottom: 8, display: "flex", alignItems: "center", gap: 5,
        }}>
          <span style={{ animation: "shimmerPulse 2s infinite" }}>✦</span> Featured
        </div>

        {/* Title row */}
        <div style={{ display: "flex", alignItems: "flex-start", gap: 12 }}>
          <div style={{
            width: 46, height: 46, borderRadius: 12,
            background: `${color}22`,
            display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: 22, flexShrink: 0,
          }}>
            {CATEGORY_ICONS[prophecy.category]}
          </div>
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{
              fontFamily: st.heading, fontSize: 17, color: st.dark,
              lineHeight: 1.2, marginBottom: 3,
            }}>
              {prophecy.title}
            </div>
            <div style={{
              fontFamily: st.body, fontSize: 12.5, color: st.muted,
              fontStyle: "italic", lineHeight: 1.5, marginBottom: 8,
            }}>
              {prophecy.summary}
            </div>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
              <StatusBadge status={prophecy.status} />
              <span style={{
                fontFamily: st.ui, fontSize: 10, color: st.light,
                background: "rgba(0,0,0,0.05)", borderRadius: 5, padding: "2px 7px",
              }}>
                {prophecy.otRef}
              </span>
              {prophecy.ntRef && (
                <span style={{
                  fontFamily: st.ui, fontSize: 10, color: st.light,
                  background: "rgba(0,0,0,0.05)", borderRadius: 5, padding: "2px 7px",
                }}>
                  {prophecy.ntRef}
                </span>
              )}
            </div>
          </div>
          <div style={{
            color: st.light, flexShrink: 0, fontSize: 20,
            transform: isOpen ? "rotate(90deg)" : "rotate(0deg)",
            transition: "transform 0.2s",
          }}>
            ›
          </div>
        </div>
      </button>
    </div>
  );
};

// ─── Standard prophecy card ───────────────────────────────────────────────────
const ProphecyCard = ({ prophecy, onSelect, isOpen, index }) => {
  const color = CATEGORY_COLORS[prophecy.category] || st.accent;
  return (
    <div style={{ animation: `fadeUp 0.3s ease both`, animationDelay: `${index * 0.05}s` }}>
      <button
        onClick={() => onSelect(prophecy)}
        style={{
          width: "100%", textAlign: "left", cursor: "pointer",
          background: isOpen ? `${color}08` : st.card,
          border: `1px solid ${isOpen ? color + "44" : st.divider}`,
          borderLeft: `4px solid ${color}`,
          borderRadius: 14, padding: "14px 14px",
          boxShadow: isOpen
            ? `0 4px 16px ${color}18`
            : "0 1px 6px rgba(0,0,0,0.05)",
          transition: "all 0.2s",
        }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <div style={{
            width: 44, height: 44, borderRadius: 11,
            background: `${color}20`,
            display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: 20, flexShrink: 0,
          }}>
            {CATEGORY_ICONS[prophecy.category]}
          </div>
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{
              fontFamily: st.heading, fontSize: 15, color: st.dark,
              lineHeight: 1.25, marginBottom: 2,
            }}>
              {prophecy.title}
            </div>
            <div style={{
              fontFamily: st.body, fontSize: 12, color: st.muted,
              fontStyle: "italic", lineHeight: 1.4, marginBottom: 6,
              overflow: "hidden", textOverflow: "ellipsis",
              display: "-webkit-box", WebkitLineClamp: 2,
              WebkitBoxOrient: "vertical",
            }}>
              {prophecy.summary}
            </div>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 5 }}>
              <StatusBadge status={prophecy.status} />
              <span style={{
                fontFamily: st.ui, fontSize: 10, color: st.light,
                background: "rgba(0,0,0,0.05)", borderRadius: 5, padding: "2px 7px",
              }}>
                {prophecy.otRef}
              </span>
            </div>
          </div>
          <div style={{
            color: st.light, flexShrink: 0, fontSize: 20,
            transform: isOpen ? "rotate(90deg)" : "rotate(0deg)",
            transition: "transform 0.2s",
          }}>
            ›
          </div>
        </div>
      </button>
    </div>
  );
};

// ─── Section divider ──────────────────────────────────────────────────────────
const SectionDivider = ({ label }) => (
  <div style={{
    display: "flex", alignItems: "center", gap: 10,
    margin: "20px 0 12px",
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
  const detailRef = useRef(null);

  // Scroll detail panel into view when opened
  useEffect(() => {
    if (selected && detailRef.current) {
      setTimeout(() => {
        detailRef.current?.scrollIntoView({ behavior: "smooth", block: "start" });
      }, 80);
    }
  }, [selected?.id]);

  // Filtered list for current category
  const filtered      = getPropheciesByCategory(activeCategory);
  const featuredInView = filtered.filter(p => p.featured);
  const standardInView = filtered.filter(p => !p.featured);

  // Toggle selection — same card closes
  const handleSelect = (prophecy) => {
    setSelected(prev => (prev?.id === prophecy?.id ? null : prophecy));
  };

  // Change category — clear selection
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
              One unbroken thread from Eden to eternity
            </div>
          </div>
        </div>

        {/* Stat tiles */}
        <div style={{ display: "flex", gap: 8 }}>
          <StatTile icon="📜" value={STATS.total}    label="Prophecies" />
          <StatTile icon="✅" value={STATS.fulfilled} label="Fulfilled"  />
          <StatTile icon="⏳" value={STATS.awaiting}  label="Awaiting"   />
        </div>
      </div>

      {/* ── Intro banner (All view only) ── */}
      {activeCategory === "All" && <IntroBanner />}

      {/* ── Category filter pills ── */}
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

      {/* ══ Cards ══ */}
      <div style={{ padding: "8px 16px 0" }}>

        {/* Featured cards + inline detail */}
        {featuredInView.map((p, i) => (
          <div key={p.id} style={{ marginBottom: 10 }}>
            <FeaturedCard
              prophecy={p}
              onSelect={handleSelect}
              isOpen={selected?.id === p.id}
              index={i}
            />
            {selected?.id === p.id && (
              <div ref={detailRef} style={{ marginTop: 8 }}>
                <ProphecyDetail
                  prophecy={selected}
                  onClose={() => setSelected(null)}
                  nav={nav}
                />
              </div>
            )}
          </div>
        ))}

        {/* Divider */}
        {featuredInView.length > 0 && standardInView.length > 0 && (
          <SectionDivider label="All Prophecies" />
        )}

        {/* Standard cards + inline detail */}
        <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
          {standardInView.map((p, i) => (
            <div key={p.id}>
              <ProphecyCard
                prophecy={p}
                onSelect={handleSelect}
                isOpen={selected?.id === p.id}
                index={i}
              />
              {selected?.id === p.id && (
                <div ref={detailRef} style={{ marginTop: 8, marginBottom: 4 }}>
                  <ProphecyDetail
                    prophecy={selected}
                    onClose={() => setSelected(null)}
                    nav={nav}
                  />
                </div>
              )}
            </div>
          ))}
        </div>

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