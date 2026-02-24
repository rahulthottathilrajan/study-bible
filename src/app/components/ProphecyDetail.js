"use client";
// ============================================================
//  ProphecyDetail.js — Phase 6: Prophecy & Fulfilment
//  Detail panel renderer — 3 card types:
//    1. Standard     — OT prophecy → NT fulfilment
//    2. Daniel       — empire blocks + 70 Weeks calc + historical notes
//    3. Revelation   — multi-school interpretation columns
//
//  Props:
//    prophecy   — prophecy object from ProphecyData
//    onClose    — fn to close the panel
//    nav        — navigation fn
//    scrollMode — bool: true = render inside a parchment scroll card
//                        (no outer wrapper, parchment-toned colours)
// ============================================================

import { STATUS_CONFIG } from "./ProphecyData";

// ─── Sunrise theme ────────────────────────────────────────────────────────────
const st = {
  heading: "'DM Serif Display',serif",
  body:    "'Lora',serif",
  ui:      "'Nunito',sans-serif",
  bg:      "#FFF8F0",
  card:    "#fff",
  accent:  "#E8625C",
  dark:    "#2D1B4E",
  text:    "#4A3B2D",
  muted:   "#8B6B4F",
  light:   "#C0A888",
  divider: "rgba(232,98,92,0.12)",
};

// ─── Parchment palette (used in scrollMode) ───────────────────────────────────
const P = {
  bg:       "#F8F0DC",
  bgMid:    "#F0E4C0",
  bgDark:   "#E8D4A0",
  edge:     "#C8A86A",
  ink:      "#2A1A08",
  inkMid:   "#6B4A28",
  inkFaint: "#9B7A50",
  scripture:"#EAD9AA",
  comment:  "rgba(60,35,10,0.06)",
};

const CATEGORY_COLORS = {
  "Messianic":   "#8B5CF6",
  "Daniel":      "#D4A853",
  "Revelation":  "#E8625C",
  "Israel":      "#1B7A6E",
  "Restoration": "#2E7D32",
};

// ── Shared sub-components — aware of scrollMode ───────────────────────────────

const ScriptureBlock = ({ reference, text, book, nav, accentColor, scrollMode }) => (
  <div style={{
    background: scrollMode
      ? `linear-gradient(135deg, ${P.scripture}, ${P.bgMid})`
      : "linear-gradient(135deg,#FFF8F0,#FFF3E8)",
    border: scrollMode
      ? `1px solid rgba(160,100,30,0.3)`
      : `1px solid rgba(232,98,92,0.15)`,
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
            background: `${accentColor || st.accent}18`,
            border: `1px solid ${accentColor || st.accent}33`,
            borderRadius: 5, padding: "2px 8px", cursor: "pointer",
          }}
        >
          Read →
        </button>
      )}
    </div>
    <p style={{
      fontFamily: st.body, fontSize: 13.5,
      color: scrollMode ? P.ink : st.dark,
      lineHeight: 1.85, margin: 0, fontStyle: "italic",
    }}>
      "{text}"
    </p>
  </div>
);

const SectionLabel = ({ children, color, scrollMode }) => (
  <div style={{
    fontFamily: st.ui, fontSize: 10, fontWeight: 700,
    color: color || (scrollMode ? P.inkFaint : st.light),
    textTransform: "uppercase", letterSpacing: "0.07em",
    marginBottom: 7, marginTop: 16,
  }}>
    {children}
  </div>
);

const CommentaryBlock = ({ text, scrollMode }) => (
  <div style={{
    background: scrollMode ? P.comment : "rgba(45,27,78,0.04)",
    border: scrollMode
      ? `1px solid rgba(120,80,30,0.18)`
      : "1px solid rgba(45,27,78,0.08)",
    borderRadius: 10, padding: "13px 14px", marginBottom: 12,
  }}>
    <div style={{
      fontFamily: st.ui, fontSize: 10, fontWeight: 700,
      color: scrollMode ? P.inkFaint : st.light,
      textTransform: "uppercase", letterSpacing: "0.07em", marginBottom: 7,
    }}>
      📚 Scholarly Commentary
    </div>
    <p style={{
      fontFamily: st.body, fontSize: 13,
      color: scrollMode ? P.inkMid : st.muted,
      lineHeight: 1.8, margin: 0, fontStyle: "italic",
    }}>
      {text}
    </p>
  </div>
);

const HistoricalBlock = ({ text, scrollMode }) => (
  <div style={{
    background: scrollMode ? "rgba(180,130,40,0.08)" : "rgba(212,168,83,0.06)",
    border: scrollMode
      ? "1px solid rgba(180,130,40,0.25)"
      : "1px solid rgba(212,168,83,0.18)",
    borderRadius: 10, padding: "12px 14px", marginBottom: 12,
  }}>
    <p style={{
      fontFamily: st.ui, fontSize: 12.5,
      color: scrollMode ? P.inkMid : st.text,
      lineHeight: 1.75, margin: 0,
    }}>
      {text}
    </p>
  </div>
);

const WatchForBlock = ({ text, scrollMode }) => (
  <div style={{
    background: scrollMode ? "rgba(180,80,50,0.07)" : "rgba(232,98,92,0.06)",
    border: scrollMode
      ? "1px solid rgba(180,80,50,0.2)"
      : "1px solid rgba(232,98,92,0.18)",
    borderRadius: 10, padding: "12px 14px", marginBottom: 12,
  }}>
    <p style={{
      fontFamily: st.ui, fontSize: 12.5,
      color: scrollMode ? P.inkMid : st.text,
      lineHeight: 1.75, margin: 0,
    }}>
      {text}
    </p>
  </div>
);

// ── Close button (shown inside scroll mode — no outer panel header) ───────────
const ScrollCloseRow = ({ onClose, prophecy, color }) => {
  const status = STATUS_CONFIG[prophecy.status];
  return (
    <div style={{
      display: "flex", justifyContent: "space-between",
      alignItems: "flex-start", marginBottom: 4, marginTop: 4,
    }}>
      <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
        {status && (
          <span style={{
            fontFamily: st.ui, fontSize: 10, fontWeight: 700,
            color: status.color,
            background: `${status.color}22`,
            border: `1px solid ${status.color}33`,
            borderRadius: 5, padding: "2px 7px",
          }}>
            {status.icon} {prophecy.status}
          </span>
        )}
        {prophecy.otRef && (
          <span style={{
            fontFamily: st.ui, fontSize: 10, color: P.inkFaint,
            background: "rgba(100,60,20,0.1)",
            border: "1px solid rgba(100,60,20,0.15)",
            borderRadius: 4, padding: "2px 6px",
          }}>
            {prophecy.otRef}
          </span>
        )}
        {prophecy.ntRef && (
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
      <button
        onClick={onClose}
        style={{
          background: "rgba(60,30,10,0.1)", border: "none",
          borderRadius: "50%", width: 28, height: 28,
          cursor: "pointer", fontSize: 14,
          color: P.inkMid,
          display: "flex", alignItems: "center", justifyContent: "center",
          flexShrink: 0,
        }}
      >
        ✕
      </button>
    </div>
  );
};

// ── 1. STANDARD DETAIL ────────────────────────────────────────────────────────
const StandardDetail = ({ prophecy, color, nav, scrollMode }) => {
  const status = STATUS_CONFIG[prophecy.status];
  return (
    <>
      <SectionLabel color={color} scrollMode={scrollMode}>🕍 Old Testament Prophecy</SectionLabel>
      <ScriptureBlock
        reference={prophecy.otRef} text={prophecy.otText}
        book={prophecy.otBook} nav={nav}
        accentColor={color} scrollMode={scrollMode}
      />

      <div style={{
        textAlign: "center", fontSize: 20,
        color: scrollMode ? P.inkFaint : color,
        margin: "4px 0", opacity: 0.6,
      }}>↓</div>

      {prophecy.ntRef && prophecy.ntText ? (
        <>
          <SectionLabel color={scrollMode ? P.inkFaint : st.accent} scrollMode={scrollMode}>
            ✝️ New Testament Fulfilment
          </SectionLabel>
          <ScriptureBlock
            reference={prophecy.ntRef} text={prophecy.ntText}
            book={prophecy.ntBook} nav={nav}
            accentColor={st.accent} scrollMode={scrollMode}
          />
        </>
      ) : (
        <div style={{
          textAlign: "center",
          background: scrollMode ? "rgba(180,80,50,0.07)" : `${status?.bg || "rgba(232,98,92,0.08)"}`,
          border: `1px dashed ${scrollMode ? "rgba(180,80,50,0.3)" : (status?.color || st.accent) + "55"}`,
          borderRadius: 10, padding: "16px", marginBottom: 12,
        }}>
          <div style={{ fontSize: 24, marginBottom: 6 }}>{status?.icon}</div>
          <div style={{ fontFamily: st.ui, fontSize: 13, fontWeight: 700, color: status?.color || st.accent }}>
            {prophecy.status}
          </div>
          <div style={{
            fontFamily: st.body, fontSize: 12,
            color: scrollMode ? P.inkFaint : st.muted,
            marginTop: 4, fontStyle: "italic",
          }}>
            Fulfilment yet to come
          </div>
        </div>
      )}

      {prophecy.historicalNote && (
        <>
          <SectionLabel color={scrollMode ? P.inkFaint : st.muted} scrollMode={scrollMode}>
            📜 Historical Record
          </SectionLabel>
          <HistoricalBlock text={prophecy.historicalNote} scrollMode={scrollMode} />
        </>
      )}

      {prophecy.watchFor && (
        <>
          <SectionLabel color={scrollMode ? "rgba(180,80,50,0.8)" : "#E8625C"} scrollMode={scrollMode}>
            👁 What to Watch For
          </SectionLabel>
          <WatchForBlock text={prophecy.watchFor} scrollMode={scrollMode} />
        </>
      )}

      <CommentaryBlock text={prophecy.commentary} scrollMode={scrollMode} />
    </>
  );
};

// ── 2. DANIEL DETAIL ─────────────────────────────────────────────────────────
const DanielDetail = ({ prophecy, color, nav, scrollMode }) => {
  const is70Weeks = prophecy.id === "d02";
  return (
    <>
      <SectionLabel color={color} scrollMode={scrollMode}>📖 The Prophecy</SectionLabel>
      <ScriptureBlock
        reference={prophecy.otRef} text={prophecy.otText}
        book={prophecy.otBook} nav={nav}
        accentColor={color} scrollMode={scrollMode}
      />

      {prophecy.ntRef && prophecy.ntText && (
        <>
          <SectionLabel color={scrollMode ? P.inkFaint : st.accent} scrollMode={scrollMode}>
            ✝️ New Testament Echo
          </SectionLabel>
          <ScriptureBlock
            reference={prophecy.ntRef} text={prophecy.ntText}
            book={prophecy.ntBook} nav={nav}
            accentColor={st.accent} scrollMode={scrollMode}
          />
        </>
      )}

      {/* Empire blocks */}
      {prophecy.empires && (
        <>
          <SectionLabel color={color} scrollMode={scrollMode}>🏛️ The Four Kingdoms — History's Verdict</SectionLabel>
          <div style={{ display: "flex", flexDirection: "column", gap: 8, marginBottom: 12 }}>
            {prophecy.empires.map((emp, i) => (
              <div key={i} style={{
                background: scrollMode
                  ? `rgba(180,130,40,${0.05 + i * 0.025})`
                  : `rgba(212,168,83,${0.06 + i * 0.03})`,
                border: `1px solid ${scrollMode ? `rgba(160,110,30,${0.15 + i * 0.04})` : `rgba(212,168,83,${0.15 + i * 0.05})`}`,
                borderLeft: `4px solid ${color}`,
                borderRadius: 10, padding: "11px 14px",
                display: "flex", alignItems: "center", gap: 12,
                opacity: 1 - (i * 0.08),
              }}>
                <div style={{ fontSize: 24, flexShrink: 0 }}>{emp.symbol}</div>
                <div style={{ flex: 1 }}>
                  <div style={{ display: "flex", alignItems: "center", gap: 8, flexWrap: "wrap" }}>
                    <span style={{
                      fontFamily: st.heading, fontSize: 15,
                      color: scrollMode ? P.ink : st.dark,
                      fontWeight: 700,
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
                    fontFamily: st.ui, fontSize: 11,
                    color: scrollMode ? P.inkMid : st.muted,
                    marginTop: 2,
                  }}>
                    {emp.dates} · {emp.king}
                  </div>
                  {emp.note && (
                    <div style={{
                      fontFamily: st.body, fontSize: 11.5,
                      color: scrollMode ? P.inkFaint : st.light,
                      fontStyle: "italic", marginTop: 2,
                    }}>
                      {emp.note}
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        </>
      )}

      {/* 70 Weeks calculation */}
      {is70Weeks && (
        <>
          <SectionLabel color={color} scrollMode={scrollMode}>🧮 The Anderson Calculation</SectionLabel>
          <div style={{
            background: scrollMode ? "rgba(180,130,40,0.07)" : "rgba(212,168,83,0.06)",
            border: scrollMode ? "1px solid rgba(160,110,30,0.22)" : "1px solid rgba(212,168,83,0.2)",
            borderRadius: 12, padding: "14px", marginBottom: 12,
          }}>
            {[
              { label: "Starting point",   value: "1 Nisan, 445 BC",    note: "Artaxerxes' decree — Nehemiah 2:1" },
              { label: "Duration",         value: "69 × 7 × 360 days",  note: "Prophetic years (360-day calendar)" },
              { label: "Total days",       value: "173,880 days",        note: "Sir Robert Anderson, The Coming Prince" },
              { label: "End point",        value: "6 Nisan, AD 32",      note: "Verified by Harold Hoehner (astronomy)" },
              { label: "Historical event", value: "Palm Sunday",         note: "Jesus' Triumphal Entry into Jerusalem" },
              { label: "Then (v.26)",      value: "Messiah cut off",     note: "Crucifixion — days later" },
            ].map((row, i) => (
              <div key={i} style={{
                display: "flex", justifyContent: "space-between",
                alignItems: "flex-start", gap: 8,
                borderBottom: i < 5
                  ? `1px solid ${scrollMode ? "rgba(160,110,30,0.18)" : "rgba(212,168,83,0.15)"}`
                  : "none",
                padding: "8px 0",
              }}>
                <div style={{
                  fontFamily: st.ui, fontSize: 11,
                  color: scrollMode ? P.inkFaint : st.muted,
                  flex: 1,
                }}>
                  {row.label}
                </div>
                <div style={{ textAlign: "right" }}>
                  <div style={{
                    fontFamily: st.ui, fontSize: 12, fontWeight: 700,
                    color: scrollMode ? P.ink : st.dark,
                  }}>
                    {row.value}
                  </div>
                  <div style={{
                    fontFamily: st.body, fontSize: 10.5,
                    color: scrollMode ? P.inkFaint : st.light,
                    fontStyle: "italic",
                  }}>
                    {row.note}
                  </div>
                </div>
              </div>
            ))}
          </div>

          <div style={{
            background: scrollMode ? `rgba(${color},0.07)` : `${color}12`,
            border: scrollMode ? `1px solid rgba(160,110,30,0.25)` : `1px solid ${color}33`,
            borderRadius: 10, padding: "12px 14px", marginBottom: 12,
            textAlign: "center",
          }}>
            <div style={{ fontSize: 28, marginBottom: 4 }}>🎯</div>
            <div style={{
              fontFamily: st.heading, fontSize: 16,
              color: scrollMode ? P.ink : st.dark,
              marginBottom: 4,
            }}>
              173,880 days — exact to the day
            </div>
            <div style={{
              fontFamily: st.body, fontSize: 12.5,
              color: scrollMode ? P.inkMid : st.muted,
              fontStyle: "italic", lineHeight: 1.6,
            }}>
              Written c. 539 BC. Fulfilled AD 32.
              No human could have predicted this across five centuries.
            </div>
          </div>
        </>
      )}

      {prophecy.historicalNote && (
        <>
          <SectionLabel color={scrollMode ? P.inkFaint : st.muted} scrollMode={scrollMode}>
            📜 Historical Confirmation
          </SectionLabel>
          <HistoricalBlock text={prophecy.historicalNote} scrollMode={scrollMode} />
        </>
      )}

      {prophecy.interpretations && (
        <>
          <SectionLabel color={color} scrollMode={scrollMode}>🔭 Scholarly Interpretations</SectionLabel>
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
                  fontFamily: st.body, fontSize: 12.5,
                  color: scrollMode ? P.inkMid : st.text,
                  lineHeight: 1.7, margin: 0,
                }}>
                  {interp.description}
                </p>
              </div>
            ))}
          </div>
        </>
      )}

      {prophecy.watchFor && (
        <>
          <SectionLabel color={scrollMode ? "rgba(180,80,50,0.8)" : "#E8625C"} scrollMode={scrollMode}>
            👁 What to Watch For
          </SectionLabel>
          <WatchForBlock text={prophecy.watchFor} scrollMode={scrollMode} />
        </>
      )}

      <CommentaryBlock text={prophecy.commentary} scrollMode={scrollMode} />
    </>
  );
};

// ── 3. REVELATION DETAIL ──────────────────────────────────────────────────────
const RevelationDetail = ({ prophecy, color, nav, scrollMode }) => (
  <>
    {prophecy.otText && (
      <>
        <SectionLabel color="#1B7A6E" scrollMode={scrollMode}>🕍 Old Testament Background</SectionLabel>
        <ScriptureBlock
          reference={prophecy.otRef} text={prophecy.otText}
          book={prophecy.otBook} nav={nav}
          accentColor="#1B7A6E" scrollMode={scrollMode}
        />
      </>
    )}

    <SectionLabel color={color} scrollMode={scrollMode}>📖 The Prophecy — Revelation</SectionLabel>
    <ScriptureBlock
      reference={prophecy.ntRef} text={prophecy.ntText}
      book={prophecy.ntBook} nav={nav}
      accentColor={color} scrollMode={scrollMode}
    />

    <div style={{
      display: "flex", alignItems: "center", gap: 10,
      background: scrollMode ? "rgba(180,80,50,0.07)" : "rgba(232,98,92,0.07)",
      border: scrollMode ? "1px solid rgba(180,80,50,0.2)" : "1px solid rgba(232,98,92,0.18)",
      borderRadius: 10, padding: "10px 14px", marginBottom: 12,
    }}>
      <div style={{ fontSize: 22 }}>⏳</div>
      <div>
        <div style={{
          fontFamily: st.ui, fontSize: 12, fontWeight: 700,
          color: scrollMode ? "rgba(160,60,30,0.9)" : st.accent,
        }}>
          {prophecy.status} — Interpretations vary
        </div>
        <div style={{
          fontFamily: st.body, fontSize: 11.5,
          color: scrollMode ? P.inkFaint : st.muted,
          fontStyle: "italic", marginTop: 2,
        }}>
          The app presents all major scholarly views without endorsing one.
        </div>
      </div>
    </div>

    {prophecy.interpretations && (
      <>
        <SectionLabel color={color} scrollMode={scrollMode}>🔭 How Scholars Interpret This</SectionLabel>
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
              }}>
                {interp.label}
              </div>
              <p style={{
                fontFamily: st.body, fontSize: 13,
                color: scrollMode ? P.inkMid : st.text,
                lineHeight: 1.75, margin: 0,
              }}>
                {interp.description}
              </p>
            </div>
          ))}
        </div>
      </>
    )}

    {prophecy.watchFor && (
      <>
        <SectionLabel color={scrollMode ? "rgba(180,80,50,0.8)" : "#E8625C"} scrollMode={scrollMode}>
          👁 Signs to Watch For
        </SectionLabel>
        <WatchForBlock text={prophecy.watchFor} scrollMode={scrollMode} />
      </>
    )}

    <CommentaryBlock text={prophecy.commentary} scrollMode={scrollMode} />
  </>
);

// ══════════════════════════════════════════════════════════════════════════════
//  MAIN EXPORT
// ══════════════════════════════════════════════════════════════════════════════
export default function ProphecyDetail({ prophecy, onClose, nav, scrollMode = false }) {
  if (!prophecy) return null;

  const color      = CATEGORY_COLORS[prophecy.category] || st.accent;
  const status     = STATUS_CONFIG[prophecy.status];
  const isRevelation = prophecy.category === "Revelation";
  const isDaniel     = prophecy.category === "Daniel";

  // ── scrollMode: no outer wrapper — renders inline inside the parchment scroll ──
  if (scrollMode) {
    return (
      <div>
        {/* Compact status/ref row + close button */}
        <ScrollCloseRow onClose={onClose} prophecy={prophecy} color={color} />

        {/* Route to renderer */}
        {isRevelation ? (
          <RevelationDetail prophecy={prophecy} color={color} nav={nav} scrollMode={true} />
        ) : isDaniel ? (
          <DanielDetail prophecy={prophecy} color={color} nav={nav} scrollMode={true} />
        ) : (
          <StandardDetail prophecy={prophecy} color={color} nav={nav} scrollMode={true} />
        )}
      </div>
    );
  }

  // ── Standard mode: full panel with header, border, shadow ────────────────────
  return (
    <div style={{
      borderRadius: 18,
      border: `1px solid ${color}33`,
      borderTop: `4px solid ${color}`,
      boxShadow: "0 6px 32px rgba(0,0,0,0.11)",
      background: st.card,
      animation: "panelIn 0.28s ease",
      overflow: "hidden",
    }}>
      {/* Panel header */}
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
            <div style={{
              fontFamily: st.ui, fontSize: 10, fontWeight: 700,
              color, textTransform: "uppercase", letterSpacing: "0.07em", marginBottom: 4,
            }}>
              {prophecy.category === "Israel"      ? "Nation of Israel" :
               prophecy.category === "Restoration" ? "Restoration"      :
               prophecy.category === "Daniel"      ? "Daniel's Visions" :
               prophecy.category}
            </div>
            <h3 style={{
              fontFamily: st.heading, fontSize: 20, color: st.dark,
              margin: "0 0 4px", lineHeight: 1.2,
            }}>
              {prophecy.title}
            </h3>
            <p style={{
              fontFamily: st.body, fontSize: 13, color: st.muted,
              margin: "0 0 10px", fontStyle: "italic", lineHeight: 1.5,
            }}>
              {prophecy.summary}
            </p>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>
              {status && (
                <span style={{
                  fontFamily: st.ui, fontSize: 11, fontWeight: 700,
                  color: status.color, background: status.bg,
                  borderRadius: 6, padding: "3px 9px",
                }}>
                  {status.icon} {prophecy.status}
                </span>
              )}
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 9px",
              }}>
                {prophecy.otRef}
              </span>
              {prophecy.ntRef && (
                <span style={{
                  fontFamily: st.ui, fontSize: 11, color: st.muted,
                  background: "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 9px",
                }}>
                  {prophecy.ntRef}
                </span>
              )}
            </div>
          </div>
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

      {/* Panel body */}
      <div style={{ padding: "14px 16px 16px" }}>
        {isRevelation ? (
          <RevelationDetail prophecy={prophecy} color={color} nav={nav} scrollMode={false} />
        ) : isDaniel ? (
          <DanielDetail prophecy={prophecy} color={color} nav={nav} scrollMode={false} />
        ) : (
          <StandardDetail prophecy={prophecy} color={color} nav={nav} scrollMode={false} />
        )}
      </div>
    </div>
  );
}

// ─── Internal — used only in scrollMode ──────────────────────────────────────
function ScrollCloseRow({ onClose, prophecy, color }) {
  const status = STATUS_CONFIG[prophecy.status];
  return (
    <div style={{
      display: "flex", justifyContent: "space-between",
      alignItems: "flex-start", marginBottom: 8, marginTop: 4,
    }}>
      <div style={{ display: "flex", flexWrap: "wrap", gap: 5 }}>
        {status && (
          <span style={{
            fontFamily: "Nunito,sans-serif", fontSize: 10, fontWeight: 700,
            color: status.color,
            background: `${status.color}22`,
            border: `1px solid ${status.color}33`,
            borderRadius: 5, padding: "2px 7px",
          }}>
            {status.icon} {prophecy.status}
          </span>
        )}
        {prophecy.otRef && (
          <span style={{
            fontFamily: "Nunito,sans-serif", fontSize: 10,
            color: P.inkFaint,
            background: "rgba(100,60,20,0.1)",
            border: "1px solid rgba(100,60,20,0.15)",
            borderRadius: 4, padding: "2px 6px",
          }}>
            {prophecy.otRef}
          </span>
        )}
        {prophecy.ntRef && (
          <span style={{
            fontFamily: "Nunito,sans-serif", fontSize: 10,
            color: P.inkFaint,
            background: "rgba(100,60,20,0.1)",
            border: "1px solid rgba(100,60,20,0.15)",
            borderRadius: 4, padding: "2px 6px",
          }}>
            {prophecy.ntRef}
          </span>
        )}
      </div>
      <button
        onClick={onClose}
        style={{
          background: "rgba(60,30,10,0.12)", border: "none",
          borderRadius: "50%", width: 28, height: 28,
          cursor: "pointer", fontSize: 14,
          color: P.inkMid,
          display: "flex", alignItems: "center", justifyContent: "center",
          flexShrink: 0,
        }}
      >
        ✕
      </button>
    </div>
  );
}