"use client";
import { useState, useEffect, useRef } from "react";
import { supabase } from "../../lib/supabase";

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

// ─── Category colour palette (matches skills.md) ──────────────────────────────
const CATEGORY_COLORS = {
  "Manuscript":  "#C06C3E",
  "Inscription": "#8B5CF6",
  "Structure":   "#2E7D32",
  "Artifact":    "#D4A853",
  "Seal/Bulla":  "#1B7A6E",
};

// ─── Verified status config ───────────────────────────────────────────────────
const STATUS_CONFIG = {
  "Confirmed": { emoji: "✅", color: "#2E7D32", bg: "rgba(46,125,50,0.10)" },
  "Probable":  { emoji: "🔶", color: "#D4A853", bg: "rgba(212,168,83,0.12)" },
  "Debated":   { emoji: "🔍", color: "#8B5CF6", bg: "rgba(139,92,246,0.10)" },
};

const ALL_CATEGORIES   = ["All", "Manuscript", "Inscription", "Structure", "Artifact", "Seal/Bulla"];
const ALL_STATUSES     = ["All", "Confirmed", "Probable"];

// ─── Animation keyframes injected once ───────────────────────────────────────
const STYLES = `
  @keyframes fadeUp {
    from { opacity:0; transform:translateY(18px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes panelIn {
    from { opacity:0; transform:translateY(24px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes shimmer {
    0%   { background-position: -400px 0; }
    100% { background-position:  400px 0; }
  }
`;

export default function ArchaeologyCards({ nav }) {
  const [discoveries, setDiscoveries] = useState([]);
  const [loading,     setLoading]     = useState(true);
  const [catFilter,   setCatFilter]   = useState("All");
  const [statFilter,  setStatFilter]  = useState("All");
  const [selected,    setSelected]    = useState(null);
  const panelRef = useRef(null);

  // ── Fetch ────────────────────────────────────────────────────────────────
  useEffect(() => {
    async function fetchData() {
      setLoading(true);
      const { data, error } = await supabase
        .from("archaeology_discoveries")
        .select("*")
        .order("sort_order", { ascending: true });
      if (!error && data) setDiscoveries(data);
      setLoading(false);
    }
    fetchData();
  }, []);

  // ── Scroll panel into view on open ───────────────────────────────────────
  useEffect(() => {
    if (selected && panelRef.current) {
      setTimeout(() => panelRef.current?.scrollIntoView({ behavior: "smooth", block: "start" }), 80);
    }
  }, [selected]);

  // ── Filtered list ─────────────────────────────────────────────────────────
  const filtered = discoveries.filter(d => {
    const okCat  = catFilter  === "All" || d.category        === catFilter;
    const okStat = statFilter === "All" || d.verified_status === statFilter;
    return okCat && okStat;
  });

  // ── Pill helper ───────────────────────────────────────────────────────────
  const Pill = ({ label, active, color, onClick }) => (
    <button
      onClick={onClick}
      style={{
        fontFamily: st.ui,
        fontSize: 12,
        fontWeight: active ? 700 : 500,
        color:  active ? "#fff" : (color || st.muted),
        background: active ? (color || st.dark) : "rgba(0,0,0,0.04)",
        border: `1.5px solid ${active ? (color || st.dark) : "rgba(0,0,0,0.08)"}`,
        borderRadius: 20,
        padding: "5px 13px",
        cursor: "pointer",
        whiteSpace: "nowrap",
        transition: "all 0.15s",
      }}
    >
      {label}
    </button>
  );

  // ── Skeleton loader ───────────────────────────────────────────────────────
  const Skeleton = () => (
    <div style={{ padding: "0 16px" }}>
      {[1,2,3,4].map(i => (
        <div key={i} style={{
          height: 110, borderRadius: 14, marginBottom: 12,
          background: "linear-gradient(90deg,#f0e8df 25%,#f8f0e8 50%,#f0e8df 75%)",
          backgroundSize: "800px 100%",
          animation: "shimmer 1.4s infinite",
        }} />
      ))}
    </div>
  );

  // ── Detail panel ──────────────────────────────────────────────────────────
  const DetailPanel = ({ d }) => {
    const color  = CATEGORY_COLORS[d.category] || st.accent;
    const status = STATUS_CONFIG[d.verified_status] || STATUS_CONFIG["Confirmed"];

    // Attempt to extract book name from scripture_ref for "Read in Bible"
    const bookName = d.scripture_ref
      ? d.scripture_ref.replace(/\s\d+[\d:–\-]*$/, "").trim()
      : null;

    return (
      <div
        ref={panelRef}
        style={{
          margin: "0 16px 24px",
          borderRadius: 18,
          border: `1px solid ${color}44`,
          borderLeft: `4px solid ${color}`,
          boxShadow: "0 4px 28px rgba(0,0,0,0.10)",
          background: st.card,
          animation: "panelIn 0.28s ease",
          overflow: "hidden",
        }}
      >
        {/* Panel header */}
        <div style={{
          background: `linear-gradient(135deg, ${color}18 0%, ${color}06 100%)`,
          padding: "18px 18px 14px",
          borderBottom: `1px solid ${color}22`,
        }}>
          <div style={{ display:"flex", alignItems:"flex-start", justifyContent:"space-between", gap:10 }}>
            <div style={{ display:"flex", alignItems:"center", gap:12 }}>
              <div style={{
                width: 52, height: 52, borderRadius: 14,
                background: `${color}22`,
                display: "flex", alignItems:"center", justifyContent:"center",
                fontSize: 26, flexShrink: 0,
              }}>
                {d.icon}
              </div>
              <div>
                <h3 style={{
                  fontFamily: st.heading, fontSize: 19, color: st.dark,
                  margin: 0, lineHeight: 1.2,
                }}>
                  {d.name}
                </h3>
                <div style={{
                  fontFamily: st.ui, fontSize: 11, color, fontWeight: 700,
                  textTransform: "uppercase", letterSpacing: "0.06em", marginTop: 3,
                }}>
                  {d.category}
                </div>
              </div>
            </div>
            <button
              onClick={() => setSelected(null)}
              style={{
                background: "rgba(0,0,0,0.06)", border: "none",
                borderRadius: "50%", width: 30, height: 30,
                cursor: "pointer", fontSize: 16, color: st.muted,
                display:"flex", alignItems:"center", justifyContent:"center",
                flexShrink: 0,
              }}
            >
              ✕
            </button>
          </div>

          {/* Meta row */}
          <div style={{
            display: "flex", flexWrap: "wrap", gap: 8, marginTop: 12,
          }}>
            <span style={{
              fontFamily: st.ui, fontSize: 11, fontWeight: 700,
              color: status.color, background: status.bg,
              borderRadius: 6, padding: "3px 8px",
            }}>
              {status.emoji} {d.verified_status}
            </span>
            {d.discovered_year && (
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 8px",
              }}>
                🗓 Discovered {d.discovered_year}
              </span>
            )}
            {d.location && (
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 8px",
              }}>
                📍 {d.location}
              </span>
            )}
          </div>
        </div>

        {/* Panel body */}
        <div style={{ padding: "16px 18px" }}>

          {/* Description */}
          <p style={{
            fontFamily: st.body, fontSize: 14, color: st.text,
            lineHeight: 1.75, margin: "0 0 16px",
          }}>
            {d.description}
          </p>

          {/* Biblical Connection */}
          <div style={{
            background: `${color}0D`,
            border: `1px solid ${color}22`,
            borderRadius: 10, padding: "12px 14px", marginBottom: 16,
          }}>
            <div style={{
              fontFamily: st.ui, fontSize: 10, fontWeight: 700,
              color, textTransform:"uppercase", letterSpacing:"0.07em", marginBottom: 6,
            }}>
              📖 Biblical Connection
            </div>
            <p style={{
              fontFamily: st.body, fontSize: 13.5, color: st.text,
              lineHeight: 1.7, margin: 0,
            }}>
              {d.biblical_connection}
            </p>
          </div>

          {/* KJV Scripture */}
          {d.scripture_text && (
            <div style={{
              background: "linear-gradient(135deg,#FFF8F0,#FFF3E8)",
              border: `1px solid ${st.divider}`,
              borderLeft: `3px solid ${st.accent}`,
              borderRadius: 10, padding: "12px 14px", marginBottom: 16,
            }}>
              <div style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color: st.accent, textTransform:"uppercase",
                letterSpacing:"0.07em", marginBottom: 6,
              }}>
                KJV Scripture
              </div>
              <p style={{
                fontFamily: st.body, fontSize: 14, color: st.dark,
                lineHeight: 1.8, margin: "0 0 6px", fontStyle: "italic",
              }}>
                "{d.scripture_text}"
              </p>
              <div style={{
                fontFamily: st.ui, fontSize: 12, color: st.muted,
                fontWeight: 600, textAlign:"right",
              }}>
                — {d.scripture_ref}
              </div>
            </div>
          )}

          {/* Discovered by / Current location */}
          {(d.discovered_by || d.current_location) && (
            <div style={{
              display:"grid", gridTemplateColumns:"1fr 1fr", gap:10, marginBottom:16,
            }}>
              {d.discovered_by && (
                <div style={{
                  background:"rgba(0,0,0,0.03)", borderRadius:8, padding:"10px 12px",
                }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:3 }}>
                    Discovered By
                  </div>
                  <div style={{ fontFamily:st.ui, fontSize:12, color:st.text }}>
                    {d.discovered_by}
                  </div>
                </div>
              )}
              {d.current_location && (
                <div style={{
                  background:"rgba(0,0,0,0.03)", borderRadius:8, padding:"10px 12px",
                }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.light, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:3 }}>
                    Now Held At
                  </div>
                  <div style={{ fontFamily:st.ui, fontSize:12, color:st.text }}>
                    {d.current_location}
                  </div>
                </div>
              )}
            </div>
          )}

          {/* Read in Bible button */}
          {bookName && (
            <button
              onClick={() => nav("chapter", { book: bookName })}
              style={{
                width: "100%",
                background: `linear-gradient(135deg, ${color}, ${color}CC)`,
                color: "#fff",
                border: "none",
                borderRadius: 12,
                padding: "14px",
                fontFamily: st.ui,
                fontSize: 15,
                fontWeight: 700,
                cursor: "pointer",
                letterSpacing: "0.02em",
              }}
            >
              Read {d.scripture_ref} in Bible →
            </button>
          )}
        </div>
      </div>
    );
  };

  // ── Discovery card ────────────────────────────────────────────────────────
  const DiscoveryCard = ({ d, index }) => {
    const color  = CATEGORY_COLORS[d.category] || st.accent;
    const status = STATUS_CONFIG[d.verified_status] || STATUS_CONFIG["Confirmed"];
    const isOpen = selected?.id === d.id;

    return (
      <div style={{ animation: `fadeUp 0.32s ease both`, animationDelay: `${index * 0.06}s` }}>
        <button
          onClick={() => setSelected(isOpen ? null : d)}
          style={{
            width: "100%",
            background: isOpen ? `${color}0A` : st.card,
            border: `1px solid ${isOpen ? color + "55" : st.divider}`,
            borderLeft: `4px solid ${color}`,
            borderRadius: 14,
            padding: "16px 16px",
            cursor: "pointer",
            textAlign: "left",
            display: "flex",
            alignItems: "center",
            gap: 14,
            boxShadow: isOpen ? `0 4px 16px ${color}22` : "0 2px 8px rgba(0,0,0,0.05)",
            transition: "all 0.2s",
            marginBottom: isOpen ? 0 : 0,
          }}
        >
          {/* Icon */}
          <div style={{
            width: 50, height: 50, borderRadius: 13,
            background: `${color}22`,
            display:"flex", alignItems:"center", justifyContent:"center",
            fontSize: 24, flexShrink: 0,
          }}>
            {d.icon}
          </div>

          {/* Text */}
          <div style={{ flex: 1, minWidth: 0 }}>
            <div style={{
              fontFamily: st.heading, fontSize: 16, color: st.dark,
              marginBottom: 2, lineHeight: 1.25,
            }}>
              {d.name}
            </div>
            <div style={{
              fontFamily: st.ui, fontSize: 11, color,
              fontWeight: 700, textTransform:"uppercase",
              letterSpacing:"0.05em", marginBottom: 5,
            }}>
              {d.category}
            </div>
            <div style={{ display:"flex", alignItems:"center", gap: 8, flexWrap:"wrap" }}>
              <span style={{
                fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                color: status.color, background: status.bg,
                borderRadius: 5, padding: "2px 7px",
              }}>
                {status.emoji} {d.verified_status}
              </span>
              {d.discovered_year && (
                <span style={{ fontFamily:st.ui, fontSize:11, color:st.light }}>
                  {d.discovered_year}
                </span>
              )}
              {d.location && (
                <span style={{
                  fontFamily:st.ui, fontSize:11, color:st.light,
                  overflow:"hidden", textOverflow:"ellipsis", whiteSpace:"nowrap",
                }}>
                  📍 {d.location}
                </span>
              )}
            </div>
          </div>

          {/* Chevron */}
          <div style={{
            color: st.light, flexShrink:0,
            transform: isOpen ? "rotate(90deg)" : "rotate(0deg)",
            transition: "transform 0.2s",
            fontSize: 18,
          }}>
            ›
          </div>
        </button>

        {/* Inline detail panel */}
        {isOpen && <DetailPanel d={d} />}
      </div>
    );
  };

  // ── Stats bar (top of list) ───────────────────────────────────────────────
  const confirmedCount = discoveries.filter(d => d.verified_status === "Confirmed").length;

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom: 40 }}>
      <style>{STYLES}</style>

      {/* ── Sticky header ── */}
      <div style={{
        background: st.headerGradient,
        padding: "14px 20px 18px",
        position: "sticky", top: 0, zIndex: 30,
      }}>
        <div style={{ display:"flex", alignItems:"center", gap:12, marginBottom:6 }}>
          <button
            onClick={() => nav("timeline-home")}
            style={{
              background:"rgba(255,255,255,0.12)", border:"none",
              borderRadius:8, padding:"6px 12px",
              fontFamily:st.ui, fontSize:13, color:st.headerText,
              cursor:"pointer", fontWeight:600,
            }}
          >
            ← Back
          </button>
          <div>
            <h2 style={{
              fontFamily:st.heading, fontSize:22, color:st.headerText,
              margin:0, lineHeight:1.1,
            }}>
              Archaeological Evidence
            </h2>
            <div style={{
              fontFamily:st.ui, fontSize:12, color:"rgba(248,232,208,0.70)",
              marginTop:2,
            }}>
              Faith confirmed in the ground
            </div>
          </div>
        </div>

        {/* Stats row */}
        <div style={{
          display:"flex", gap:10, marginTop:8,
        }}>
          <div style={{
            background:"rgba(255,255,255,0.10)", borderRadius:8,
            padding:"6px 12px", display:"flex", alignItems:"center", gap:6,
          }}>
            <span style={{ fontFamily:st.ui, fontSize:20 }}>⛏️</span>
            <div>
              <div style={{ fontFamily:st.ui, fontSize:16, fontWeight:800, color:st.headerText, lineHeight:1 }}>
                {discoveries.length}
              </div>
              <div style={{ fontFamily:st.ui, fontSize:9, color:"rgba(248,232,208,0.65)", textTransform:"uppercase" }}>
                Discoveries
              </div>
            </div>
          </div>
          <div style={{
            background:"rgba(255,255,255,0.10)", borderRadius:8,
            padding:"6px 12px", display:"flex", alignItems:"center", gap:6,
          }}>
            <span style={{ fontFamily:st.ui, fontSize:20 }}>✅</span>
            <div>
              <div style={{ fontFamily:st.ui, fontSize:16, fontWeight:800, color:st.headerText, lineHeight:1 }}>
                {confirmedCount}
              </div>
              <div style={{ fontFamily:st.ui, fontSize:9, color:"rgba(248,232,208,0.65)", textTransform:"uppercase" }}>
                Confirmed
              </div>
            </div>
          </div>
          <div style={{
            background:"rgba(255,255,255,0.10)", borderRadius:8,
            padding:"6px 12px", display:"flex", alignItems:"center", gap:6,
          }}>
            <span style={{ fontFamily:st.ui, fontSize:20 }}>📍</span>
            <div>
              <div style={{ fontFamily:st.ui, fontSize:16, fontWeight:800, color:st.headerText, lineHeight:1 }}>
                5
              </div>
              <div style={{ fontFamily:st.ui, fontSize:9, color:"rgba(248,232,208,0.65)", textTransform:"uppercase" }}>
                Countries
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* ── Intro banner ── */}
      <div style={{
        margin:"16px 16px 0",
        background:"linear-gradient(135deg,#2D1B4E12,#8B5CF608)",
        border:`1px solid rgba(139,92,246,0.15)`,
        borderRadius:14, padding:"14px 16px",
      }}>
        <p style={{
          fontFamily:st.body, fontSize:13.5, color:st.muted,
          lineHeight:1.7, margin:0, fontStyle:"italic",
        }}>
          "The earth is the LORD's, and the fulness thereof." — Psalm 24:1.
          Every spade that enters the ground tells the same story Scripture has always told.
          These discoveries were made by archaeologists of many beliefs — yet each one
          confirms the historical reliability of the King James Bible.
        </p>
      </div>

      {/* ── Category filter pills ── */}
      <div style={{ padding:"16px 16px 0" }}>
        <div style={{
          fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.light,
          textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:8,
        }}>
          Category
        </div>
        <div style={{
          display:"flex", gap:7, overflowX:"auto",
          paddingBottom:4, scrollbarWidth:"none",
        }}>
          {ALL_CATEGORIES.map(cat => (
            <Pill
              key={cat}
              label={cat}
              active={catFilter === cat}
              color={cat === "All" ? st.dark : CATEGORY_COLORS[cat]}
              onClick={() => { setCatFilter(cat); setSelected(null); }}
            />
          ))}
        </div>
      </div>

      {/* ── Status filter pills ── */}
      <div style={{ padding:"12px 16px 0" }}>
        <div style={{
          fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.light,
          textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:8,
        }}>
          Verified Status
        </div>
        <div style={{ display:"flex", gap:7, flexWrap:"wrap" }}>
          {ALL_STATUSES.map(s => {
            const cfg = STATUS_CONFIG[s];
            return (
              <Pill
                key={s}
                label={s === "All" ? "All Statuses" : `${cfg?.emoji} ${s}`}
                active={statFilter === s}
                color={s === "All" ? st.dark : cfg?.color}
                onClick={() => { setStatFilter(s); setSelected(null); }}
              />
            );
          })}
        </div>
      </div>

      {/* ── Result count ── */}
      {!loading && (
        <div style={{
          padding:"12px 16px 4px",
          fontFamily:st.ui, fontSize:12, color:st.light,
        }}>
          {filtered.length === discoveries.length
            ? `All ${discoveries.length} discoveries`
            : `${filtered.length} of ${discoveries.length} discoveries`}
        </div>
      )}

      {/* ── Cards / skeleton ── */}
      <div style={{ padding:"10px 16px 0" }}>
        {loading ? (
          <Skeleton />
        ) : filtered.length === 0 ? (
          <div style={{
            textAlign:"center", padding:"48px 24px",
            fontFamily:st.body, fontSize:15, color:st.light, fontStyle:"italic",
          }}>
            No discoveries match your current filters.
          </div>
        ) : (
          <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
            {filtered.map((d, i) => (
              <DiscoveryCard key={d.id} d={d} index={i} />
            ))}
          </div>
        )}
      </div>

      {/* ── Footer note ── */}
      {!loading && filtered.length > 0 && (
        <div style={{
          margin:"24px 16px 0",
          background:"rgba(0,0,0,0.03)", borderRadius:12, padding:"14px 16px",
        }}>
          <p style={{
            fontFamily:st.ui, fontSize:11, color:st.light,
            lineHeight:1.65, margin:0, textAlign:"center",
          }}>
            ✅ Confirmed — scholarly consensus &nbsp;·&nbsp;
            🔶 Probable — strong evidence &nbsp;·&nbsp;
            🔍 Debated — ongoing discussion
          </p>
        </div>
      )}
    </div>
  );
}