"use client";
// ============================================================
//  ProphecyDetail.js — Phase 6: Prophecy & Fulfilment
//  Detail panel renderer — handles 3 card types:
//    1. Standard     — OT prophecy → NT fulfilment
//    2. Daniel       — empire blocks + historical notes + 70 Weeks calc
//    3. Revelation   — multi-school interpretation columns
// ============================================================

import { STATUS_CONFIG } from "./ProphecyData";

// ─── Sunrise theme (matches all timeline components) ─────────────────────────
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

// ── Shared sub-components ─────────────────────────────────────────────────────

// KJV scripture quote block
const ScriptureBlock = ({ reference, text, book, nav, accentColor }) => (
  <div style={{
    background: "linear-gradient(135deg,#FFF8F0,#FFF3E8)",
    border: `1px solid rgba(232,98,92,0.15)`,
    borderLeft: `3px solid ${accentColor || st.accent}`,
    borderRadius: 10,
    padding: "13px 14px",
    marginBottom: 12,
  }}>
    <div style={{
      display: "flex", justifyContent: "space-between",
      alignItems: "center", marginBottom: 7,
    }}>
      <div style={{
        fontFamily: st.ui, fontSize: 10, fontWeight: 700,
        color: accentColor || st.accent,
        textTransform: "uppercase", letterSpacing: "0.07em",
      }}>
        KJV — {reference}
      </div>
      {nav && book && (
        <button
          onClick={() => nav("chapter", { book })}
          style={{
            fontFamily: st.ui, fontSize: 10, fontWeight: 700,
            color: accentColor || st.accent,
            background: `${accentColor || st.accent}15`,
            border: `1px solid ${accentColor || st.accent}33`,
            borderRadius: 5, padding: "2px 8px", cursor: "pointer",
          }}
        >
          Read →
        </button>
      )}
    </div>
    <p style={{
      fontFamily: st.body, fontSize: 13.5, color: st.dark,
      lineHeight: 1.85, margin: 0, fontStyle: "italic",
    }}>
      "{text}"
    </p>
  </div>
);

// Section label
const SectionLabel = ({ children, color }) => (
  <div style={{
    fontFamily: st.ui, fontSize: 10, fontWeight: 700,
    color: color || st.light,
    textTransform: "uppercase", letterSpacing: "0.07em",
    marginBottom: 7, marginTop: 16,
  }}>
    {children}
  </div>
);

// Commentary block
const CommentaryBlock = ({ text }) => (
  <div style={{
    background: "rgba(45,27,78,0.04)",
    border: "1px solid rgba(45,27,78,0.08)",
    borderRadius: 10, padding: "13px 14px", marginBottom: 12,
  }}>
    <div style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: st.light, textTransform: "uppercase",
      letterSpacing: "0.07em", marginBottom: 7,
    }}>
      📚 Scholarly Commentary
    </div>
    <p style={{
      fontFamily: st.body, fontSize: 13, color: st.muted,
      lineHeight: 1.8, margin: 0, fontStyle: "italic",
    }}>
      {text}
    </p>
  </div>
);

// ── 1. STANDARD DETAIL PANEL ──────────────────────────────────────────────────
const StandardDetail = ({ prophecy, color, nav }) => {
  const status = STATUS_CONFIG[prophecy.status];
  return (
    <>
      {/* OT Prophecy */}
      <SectionLabel color={color}>🕍 Old Testament Prophecy</SectionLabel>
      <ScriptureBlock
        reference={prophecy.otRef}
        text={prophecy.otText}
        book={prophecy.otBook}
        nav={nav}
        accentColor={color}
      />

      {/* Arrow connector */}
      <div style={{
        textAlign: "center", fontSize: 20, color: color,
        margin: "4px 0 4px", opacity: 0.6,
      }}>
        ↓
      </div>

      {/* NT Fulfilment */}
      {prophecy.ntRef && prophecy.ntText ? (
        <>
          <SectionLabel color={color}>✝️ New Testament Fulfilment</SectionLabel>
          <ScriptureBlock
            reference={prophecy.ntRef}
            text={prophecy.ntText}
            book={prophecy.ntBook}
            nav={nav}
            accentColor={st.accent}
          />
        </>
      ) : (
        <div style={{
          textAlign: "center",
          background: `${status?.bg || "rgba(232,98,92,0.08)"}`,
          border: `1px dashed ${status?.color || st.accent}55`,
          borderRadius: 10, padding: "16px",
          marginBottom: 12,
        }}>
          <div style={{ fontSize: 24, marginBottom: 6 }}>{status?.icon} </div>
          <div style={{
            fontFamily: st.ui, fontSize: 13, fontWeight: 700,
            color: status?.color || st.accent,
          }}>
            {prophecy.status}
          </div>
          <div style={{
            fontFamily: st.body, fontSize: 12, color: st.muted,
            marginTop: 4, fontStyle: "italic",
          }}>
            Fulfilment yet to come
          </div>
        </div>
      )}

      {/* Historical Note (Israel category) */}
      {prophecy.historicalNote && (
        <>
          <SectionLabel color={st.muted}>📜 Historical Record</SectionLabel>
          <div style={{
            background: "rgba(212,168,83,0.08)",
            border: "1px solid rgba(212,168,83,0.2)",
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
          }}>
            <p style={{
              fontFamily: st.ui, fontSize: 12.5, color: st.text,
              lineHeight: 1.75, margin: 0,
            }}>
              {prophecy.historicalNote}
            </p>
          </div>
        </>
      )}

      {/* Watch For (Awaiting/Partial) */}
      {prophecy.watchFor && (
        <>
          <SectionLabel color="#E8625C">👁 What to Watch For</SectionLabel>
          <div style={{
            background: "rgba(232,98,92,0.06)",
            border: "1px solid rgba(232,98,92,0.18)",
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
          }}>
            <p style={{
              fontFamily: st.ui, fontSize: 12.5, color: st.text,
              lineHeight: 1.75, margin: 0,
            }}>
              {prophecy.watchFor}
            </p>
          </div>
        </>
      )}

      {/* Commentary */}
      <CommentaryBlock text={prophecy.commentary} />
    </>
  );
};

// ── 2. DANIEL DETAIL PANEL ────────────────────────────────────────────────────
const DanielDetail = ({ prophecy, color, nav }) => {
  const is70Weeks = prophecy.id === "d02";

  return (
    <>
      {/* OT Prophecy */}
      <SectionLabel color={color}>📖 The Prophecy</SectionLabel>
      <ScriptureBlock
        reference={prophecy.otRef}
        text={prophecy.otText}
        book={prophecy.otBook}
        nav={nav}
        accentColor={color}
      />

      {/* NT connection if present */}
      {prophecy.ntRef && prophecy.ntText && (
        <>
          <SectionLabel color={st.accent}>✝️ New Testament Echo</SectionLabel>
          <ScriptureBlock
            reference={prophecy.ntRef}
            text={prophecy.ntText}
            book={prophecy.ntBook}
            nav={nav}
            accentColor={st.accent}
          />
        </>
      )}

      {/* Empire Blocks (Daniel 2 only) */}
      {prophecy.empires && (
        <>
          <SectionLabel color={color}>🏛️ The Four Kingdoms — History's Verdict</SectionLabel>
          <div style={{ display: "flex", flexDirection: "column", gap: 8, marginBottom: 12 }}>
            {prophecy.empires.map((emp, i) => {
              const isLast = i === prophecy.empires.length - 1;
              const opacity = 1 - (i * 0.08);
              return (
                <div key={i} style={{
                  background: `rgba(212,168,83,${0.06 + i * 0.03})`,
                  border: `1px solid rgba(212,168,83,${0.15 + i * 0.05})`,
                  borderLeft: `4px solid ${color}`,
                  borderRadius: 10,
                  padding: "11px 14px",
                  display: "flex", alignItems: "center", gap: 12,
                  opacity,
                }}>
                  <div style={{ fontSize: 24, flexShrink: 0 }}>{emp.symbol}</div>
                  <div style={{ flex: 1 }}>
                    <div style={{ display: "flex", alignItems: "center", gap: 8, flexWrap: "wrap" }}>
                      <span style={{
                        fontFamily: st.heading, fontSize: 15, color: st.dark, fontWeight: 700,
                      }}>
                        {emp.empire}
                      </span>
                      <span style={{
                        fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                        color, background: `${color}18`,
                        borderRadius: 4, padding: "1px 7px",
                      }}>
                        {emp.metal}
                      </span>
                    </div>
                    <div style={{
                      fontFamily: st.ui, fontSize: 11, color: st.muted, marginTop: 2,
                    }}>
                      {emp.dates} · {emp.king}
                    </div>
                    {emp.note && (
                      <div style={{
                        fontFamily: st.body, fontSize: 11.5, color: st.light,
                        fontStyle: "italic", marginTop: 2,
                      }}>
                        {emp.note}
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </>
      )}

      {/* 70 Weeks Calculation (Daniel 9 only) */}
      {is70Weeks && (
        <>
          <SectionLabel color={color}>🧮 The Anderson Calculation</SectionLabel>
          <div style={{
            background: "rgba(212,168,83,0.06)",
            border: "1px solid rgba(212,168,83,0.2)",
            borderRadius: 12, padding: "14px",
            marginBottom: 12,
          }}>
            {[
              { label: "Starting point",    value: "1 Nisan, 445 BC",       note: "Artaxerxes' decree — Nehemiah 2:1" },
              { label: "Duration",          value: "69 × 7 × 360 days",     note: "Prophetic years (360-day calendar)" },
              { label: "Total days",        value: "173,880 days",           note: "Sir Robert Anderson, The Coming Prince" },
              { label: "End point",         value: "6 Nisan, AD 32",         note: "Verified by Harold Hoehner (astronomy)" },
              { label: "Historical event",  value: "Palm Sunday",            note: "Jesus' Triumphal Entry into Jerusalem" },
              { label: "Then (v.26)",       value: "Messiah cut off",        note: "Crucifixion — days later" },
            ].map((row, i) => (
              <div key={i} style={{
                display: "flex", justifyContent: "space-between",
                alignItems: "flex-start", gap: 8,
                borderBottom: i < 5 ? "1px solid rgba(212,168,83,0.15)" : "none",
                padding: "8px 0",
              }}>
                <div style={{ fontFamily: st.ui, fontSize: 11, color: st.muted, flex: 1 }}>
                  {row.label}
                </div>
                <div style={{ textAlign: "right" }}>
                  <div style={{
                    fontFamily: st.ui, fontSize: 12, fontWeight: 700, color: st.dark,
                  }}>
                    {row.value}
                  </div>
                  <div style={{
                    fontFamily: st.body, fontSize: 10.5, color: st.light,
                    fontStyle: "italic",
                  }}>
                    {row.note}
                  </div>
                </div>
              </div>
            ))}
          </div>

          {/* Conclusion callout */}
          <div style={{
            background: `${color}12`,
            border: `1px solid ${color}33`,
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
            textAlign: "center",
          }}>
            <div style={{ fontSize: 28, marginBottom: 4 }}>🎯</div>
            <div style={{
              fontFamily: st.heading, fontSize: 16, color: st.dark, marginBottom: 4,
            }}>
              173,880 days — exact to the day
            </div>
            <div style={{
              fontFamily: st.body, fontSize: 12.5, color: st.muted,
              fontStyle: "italic", lineHeight: 1.6,
            }}>
              Written c. 539 BC. Fulfilled AD 32.
              No human could have predicted this across five centuries.
            </div>
          </div>
        </>
      )}

      {/* Historical Note */}
      {prophecy.historicalNote && (
        <>
          <SectionLabel color={st.muted}>📜 Historical Confirmation</SectionLabel>
          <div style={{
            background: "rgba(212,168,83,0.06)",
            border: "1px solid rgba(212,168,83,0.18)",
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
          }}>
            <p style={{
              fontFamily: st.ui, fontSize: 12.5, color: st.text,
              lineHeight: 1.75, margin: 0,
            }}>
              {prophecy.historicalNote}
            </p>
          </div>
        </>
      )}

      {/* Interpretation options (Daniel 5 — stone without hands) */}
      {prophecy.interpretations && (
        <>
          <SectionLabel color={color}>🔭 Scholarly Interpretations</SectionLabel>
          <div style={{ display: "flex", flexDirection: "column", gap: 8, marginBottom: 12 }}>
            {prophecy.interpretations.map((interp, i) => (
              <div key={i} style={{
                background: `${interp.color}0C`,
                border: `1px solid ${interp.color}30`,
                borderLeft: `3px solid ${interp.color}`,
                borderRadius: 10, padding: "11px 13px",
              }}>
                <div style={{
                  fontFamily: st.ui, fontSize: 11, fontWeight: 700,
                  color: interp.color, marginBottom: 5,
                }}>
                  {interp.label}
                </div>
                <p style={{
                  fontFamily: st.body, fontSize: 12.5, color: st.text,
                  lineHeight: 1.7, margin: 0,
                }}>
                  {interp.description}
                </p>
              </div>
            ))}
          </div>
        </>
      )}

      {/* Watch For */}
      {prophecy.watchFor && (
        <>
          <SectionLabel color="#E8625C">👁 What to Watch For</SectionLabel>
          <div style={{
            background: "rgba(232,98,92,0.06)",
            border: "1px solid rgba(232,98,92,0.18)",
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
          }}>
            <p style={{
              fontFamily: st.ui, fontSize: 12.5, color: st.text,
              lineHeight: 1.75, margin: 0,
            }}>
              {prophecy.watchFor}
            </p>
          </div>
        </>
      )}

      {/* Commentary */}
      <CommentaryBlock text={prophecy.commentary} />
    </>
  );
};

// ── 3. REVELATION DETAIL PANEL ────────────────────────────────────────────────
const RevelationDetail = ({ prophecy, color, nav }) => (
  <>
    {/* OT Background */}
    {prophecy.otText && (
      <>
        <SectionLabel color="#1B7A6E">🕍 Old Testament Background</SectionLabel>
        <ScriptureBlock
          reference={prophecy.otRef}
          text={prophecy.otText}
          book={prophecy.otBook}
          nav={nav}
          accentColor="#1B7A6E"
        />
      </>
    )}

    {/* Revelation text */}
    <SectionLabel color={color}>📖 The Prophecy — Revelation</SectionLabel>
    <ScriptureBlock
      reference={prophecy.ntRef}
      text={prophecy.ntText}
      book={prophecy.ntBook}
      nav={nav}
      accentColor={color}
    />

    {/* Status banner */}
    <div style={{
      display: "flex", alignItems: "center", gap: 10,
      background: "rgba(232,98,92,0.07)",
      border: "1px solid rgba(232,98,92,0.18)",
      borderRadius: 10, padding: "10px 14px", marginBottom: 12,
    }}>
      <div style={{ fontSize: 22 }}>⏳</div>
      <div>
        <div style={{
          fontFamily: st.ui, fontSize: 12, fontWeight: 700, color: st.accent,
        }}>
          {prophecy.status} — Interpretations vary
        </div>
        <div style={{
          fontFamily: st.body, fontSize: 11.5, color: st.muted,
          fontStyle: "italic", marginTop: 2,
        }}>
          The app presents all major scholarly views without endorsing one.
        </div>
      </div>
    </div>

    {/* Interpretation columns */}
    {prophecy.interpretations && (
      <>
        <SectionLabel color={color}>🔭 How Scholars Interpret This</SectionLabel>
        <div style={{ display: "flex", flexDirection: "column", gap: 10, marginBottom: 12 }}>
          {prophecy.interpretations.map((interp, i) => (
            <div key={i} style={{
              background: `${interp.color}0C`,
              border: `1px solid ${interp.color}30`,
              borderLeft: `4px solid ${interp.color}`,
              borderRadius: 12, padding: "13px 14px",
            }}>
              <div style={{
                fontFamily: st.ui, fontSize: 12, fontWeight: 800,
                color: interp.color, marginBottom: 6,
                letterSpacing: "0.02em",
              }}>
                {interp.label}
              </div>
              <p style={{
                fontFamily: st.body, fontSize: 13, color: st.text,
                lineHeight: 1.75, margin: 0,
              }}>
                {interp.description}
              </p>
            </div>
          ))}
        </div>
      </>
    )}

    {/* What to watch for */}
    {prophecy.watchFor && (
      <>
        <SectionLabel color="#E8625C">👁 Signs to Watch For</SectionLabel>
        <div style={{
          background: "rgba(232,98,92,0.06)",
          border: "1px solid rgba(232,98,92,0.18)",
          borderRadius: 10, padding: "12px 14px", marginBottom: 12,
        }}>
          <p style={{
            fontFamily: st.ui, fontSize: 12.5, color: st.text,
            lineHeight: 1.75, margin: 0,
          }}>
            {prophecy.watchFor}
          </p>
        </div>
      </>
    )}

    {/* Commentary */}
    <CommentaryBlock text={prophecy.commentary} />
  </>
);

// ── MAIN EXPORT — ProphecyDetail ──────────────────────────────────────────────
export default function ProphecyDetail({ prophecy, onClose, nav }) {
  if (!prophecy) return null;

  const color  = CATEGORY_COLORS[prophecy.category] || st.accent;
  const status = STATUS_CONFIG[prophecy.status];

  // Route to the right renderer
  const isRevelation = prophecy.category === "Revelation";
  const isDaniel     = prophecy.category === "Daniel";

  return (
    <div style={{
      margin: "0 0 24px",
      borderRadius: 18,
      border: `1px solid ${color}33`,
      borderTop: `4px solid ${color}`,
      boxShadow: "0 6px 32px rgba(0,0,0,0.11)",
      background: st.card,
      animation: "panelIn 0.28s ease",
      overflow: "hidden",
    }}>

      {/* ── Panel Header ── */}
      <div style={{
        background: `linear-gradient(135deg, ${color}16 0%, ${color}06 100%)`,
        padding: "16px 16px 12px",
        borderBottom: `1px solid ${color}18`,
      }}>
        <div style={{
          display: "flex", alignItems: "flex-start",
          justifyContent: "space-between", gap: 10,
        }}>
          <div style={{ flex: 1 }}>
            {/* Category label */}
            <div style={{
              fontFamily: st.ui, fontSize: 10, fontWeight: 700,
              color, textTransform: "uppercase", letterSpacing: "0.07em",
              marginBottom: 4,
            }}>
              {prophecy.category === "Israel"      ? "Nation of Israel" :
               prophecy.category === "Restoration" ? "Restoration"      :
               prophecy.category === "Daniel"      ? "Daniel's Visions" :
               prophecy.category}
            </div>

            {/* Title */}
            <h3 style={{
              fontFamily: st.heading, fontSize: 20, color: st.dark,
              margin: "0 0 4px", lineHeight: 1.2,
            }}>
              {prophecy.title}
            </h3>

            {/* Summary */}
            <p style={{
              fontFamily: st.body, fontSize: 13, color: st.muted,
              margin: "0 0 10px", fontStyle: "italic", lineHeight: 1.5,
            }}>
              {prophecy.summary}
            </p>

            {/* Status badge + refs */}
            <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>
              <span style={{
                fontFamily: st.ui, fontSize: 11, fontWeight: 700,
                color: status?.color, background: status?.bg,
                borderRadius: 6, padding: "3px 9px",
              }}>
                {status?.icon} {prophecy.status}
              </span>
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: "rgba(0,0,0,0.05)",
                borderRadius: 6, padding: "3px 9px",
              }}>
                {prophecy.otRef}
              </span>
              {prophecy.ntRef && (
                <span style={{
                  fontFamily: st.ui, fontSize: 11, color: st.muted,
                  background: "rgba(0,0,0,0.05)",
                  borderRadius: 6, padding: "3px 9px",
                }}>
                  {prophecy.ntRef}
                </span>
              )}
            </div>
          </div>

          {/* Close button */}
          <button
            onClick={onClose}
            style={{
              background: "rgba(0,0,0,0.07)", border: "none",
              borderRadius: "50%", width: 32, height: 32,
              cursor: "pointer", fontSize: 17, color: st.muted,
              display: "flex", alignItems: "center", justifyContent: "center",
              flexShrink: 0,
            }}
          >
            ✕
          </button>
        </div>
      </div>

      {/* ── Panel Body ── */}
      <div style={{ padding: "14px 16px 16px" }}>
        {isRevelation ? (
          <RevelationDetail prophecy={prophecy} color={color} nav={nav} />
        ) : isDaniel ? (
          <DanielDetail prophecy={prophecy} color={color} nav={nav} />
        ) : (
          <StandardDetail prophecy={prophecy} color={color} nav={nav} />
        )}
      </div>
    </div>
  );
}