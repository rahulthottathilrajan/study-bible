"use client";
import { useState, useEffect, useRef, useCallback } from "react";
import { THEMES, DARK_THEMES, BIBLE_BOOKS } from "../constants";
import {
  ARCHAEOLOGY_DISCOVERIES,
  CATEGORY_COLORS,
  STATUS_CONFIG,
  ALL_CATEGORIES,
  ALL_STATUSES,
} from "./ArchaeologyData";

// ─── Animation keyframes injected once ───────────────────────
const STYLES = `
  @keyframes fadeUp {
    from { opacity:0; transform:translateY(18px); }
    to   { opacity:1; transform:translateY(0); }
  }
  @keyframes panelIn {
    from { opacity:0; transform:translateY(24px); }
    to   { opacity:1; transform:translateY(0); }
  }
`;

// ─── Book name lookup using BIBLE_BOOKS ──────────────────────
const BOOK_NAMES = BIBLE_BOOKS.map(b => b.name).sort((a, b) => b.length - a.length);
function extractBookName(ref) {
  if (!ref) return null;
  for (const name of BOOK_NAMES) {
    if (ref.startsWith(name)) return name;
  }
  return null;
}

export default function ArchaeologyCards({ nav, darkMode, trackLearnExploration }) {
  const st = darkMode ? DARK_THEMES.sunrise : THEMES.sunrise;
  const discoveries = ARCHAEOLOGY_DISCOVERIES;

  const [catFilter,  setCatFilter]  = useState("All");
  const [statFilter, setStatFilter] = useState("All");
  const [selected,   setSelected]   = useState(null);
  const panelRef  = useRef(null);
  const cardRefs  = useRef({});

  // ── Scroll panel into view on open ─────────────────────────
  useEffect(() => {
    if (selected && panelRef.current) {
      setTimeout(() => panelRef.current?.scrollIntoView({ behavior: "smooth", block: "start" }), 80);
    }
  }, [selected]);

  // ── Escape key closes panel ────────────────────────────────
  useEffect(() => {
    if (!selected) return;
    const handler = (e) => {
      if (e.key === "Escape") {
        setSelected(null);
        // Return focus to the card that opened the panel
        const ref = cardRefs.current[selected.id];
        if (ref) setTimeout(() => ref.focus(), 60);
      }
    };
    window.addEventListener("keydown", handler);
    return () => window.removeEventListener("keydown", handler);
  }, [selected]);

  // ── Filtered list ──────────────────────────────────────────
  const filtered = discoveries.filter(d => {
    const okCat  = catFilter  === "All" || d.category        === catFilter;
    const okStat = statFilter === "All" || d.verified_status === statFilter;
    return okCat && okStat;
  });

  // ── Derived stats ──────────────────────────────────────────
  const confirmedCount = discoveries.filter(d => d.verified_status === "Confirmed").length;
  const countriesCount = new Set(
    discoveries.map(d => d.location?.split(",").pop()?.trim()).filter(Boolean)
  ).size;

  // ── Category counts for filter badges ──────────────────────
  const catCounts = {};
  discoveries.forEach(d => { catCounts[d.category] = (catCounts[d.category] || 0) + 1; });
  const statCounts = {};
  discoveries.forEach(d => { statCounts[d.verified_status] = (statCounts[d.verified_status] || 0) + 1; });

  const hasActiveFilter = catFilter !== "All" || statFilter !== "All";

  const clearFilters = useCallback(() => {
    setCatFilter("All");
    setStatFilter("All");
    setSelected(null);
  }, []);

  // ── Pill helper ────────────────────────────────────────────
  const Pill = ({ label, active, color, onClick, count }) => (
    <button
      onClick={onClick}
      aria-pressed={active}
      style={{
        fontFamily: st.ui,
        fontSize: 12,
        fontWeight: active ? 700 : 500,
        color:  active ? "#fff" : (color || st.muted),
        background: active ? (color || st.dark) : (darkMode ? "rgba(255,255,255,0.06)" : "rgba(0,0,0,0.04)"),
        border: `1.5px solid ${active ? (color || st.dark) : (darkMode ? "rgba(255,255,255,0.1)" : "rgba(0,0,0,0.08)")}`,
        borderRadius: 20,
        padding: "5px 13px",
        cursor: "pointer",
        whiteSpace: "nowrap",
        transition: "all 0.15s",
        display: "inline-flex",
        alignItems: "center",
        gap: 5,
      }}
    >
      {label}
      {count != null && (
        <span style={{
          fontSize: 10,
          fontWeight: 700,
          opacity: active ? 0.85 : 0.6,
          background: active ? "rgba(255,255,255,0.2)" : "transparent",
          borderRadius: 8,
          padding: active ? "1px 5px" : 0,
          minWidth: active ? 16 : "auto",
          textAlign: "center",
        }}>
          {count}
        </span>
      )}
    </button>
  );

  // ── Detail panel ───────────────────────────────────────────
  const DetailPanel = ({ d }) => {
    const color  = CATEGORY_COLORS[d.category] || st.accent;
    const status = STATUS_CONFIG[d.verified_status] || STATUS_CONFIG["Confirmed"];
    const bookName = extractBookName(d.scripture_ref);

    return (
      <div
        ref={panelRef}
        id={`panel-${d.id}`}
        role="region"
        aria-labelledby={`card-${d.id}`}
        style={{
          margin: "0 16px 24px",
          borderRadius: 18,
          border: `1px solid ${color}44`,
          borderLeft: `4px solid ${color}`,
          boxShadow: darkMode ? "0 4px 28px rgba(0,0,0,0.30)" : "0 4px 28px rgba(0,0,0,0.10)",
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
              onClick={() => {
                setSelected(null);
                const ref = cardRefs.current[d.id];
                if (ref) setTimeout(() => ref.focus(), 60);
              }}
              aria-label="Close detail panel"
              style={{
                background: darkMode ? "rgba(255,255,255,0.1)" : "rgba(0,0,0,0.06)", border: "none",
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
            <span
              aria-label={`Verification status: ${d.verified_status}`}
              style={{
                fontFamily: st.ui, fontSize: 11, fontWeight: 700,
                color: status.color, background: status.bg,
                borderRadius: 6, padding: "3px 8px",
              }}
            >
              {status.emoji} {d.verified_status}
            </span>
            {d.discovered_year && (
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: darkMode ? "rgba(255,255,255,0.08)" : "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 8px",
              }}>
                Discovered {d.discovered_year}
              </span>
            )}
            {d.location && (
              <span style={{
                fontFamily: st.ui, fontSize: 11, color: st.muted,
                background: darkMode ? "rgba(255,255,255,0.08)" : "rgba(0,0,0,0.05)", borderRadius: 6, padding: "3px 8px",
              }}>
                {d.location}
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
              Biblical Connection
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
              background: darkMode
                ? `linear-gradient(135deg, ${st.card}, ${st.bg})`
                : `linear-gradient(135deg, ${st.bg}, ${st.card})`,
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
                &ldquo;{d.scripture_text}&rdquo;
              </p>
              <div style={{
                fontFamily: st.ui, fontSize: 12, color: st.muted,
                fontWeight: 600, textAlign:"right",
              }}>
                &mdash; {d.scripture_ref}
              </div>
            </div>
          )}

          {/* Discovered by / Current location */}
          {(d.discovered_by || d.current_location) && (
            <div style={{
              display:"grid", gridTemplateColumns: (d.discovered_by && d.current_location) ? "1fr 1fr" : "1fr", gap:10, marginBottom:16,
            }}>
              {d.discovered_by && (
                <div style={{
                  background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)", borderRadius:8, padding:"10px 12px",
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
                  background: darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)", borderRadius:8, padding:"10px 12px",
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
              onClick={() => nav("chapters", { book: bookName })}
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
              Read {d.scripture_ref} in Bible &rarr;
            </button>
          )}
        </div>
      </div>
    );
  };

  // ── Discovery card ─────────────────────────────────────────
  const DiscoveryCard = ({ d, index }) => {
    const color  = CATEGORY_COLORS[d.category] || st.accent;
    const status = STATUS_CONFIG[d.verified_status] || STATUS_CONFIG["Confirmed"];
    const isOpen = selected?.id === d.id;
    const cappedDelay = Math.min(index, 10) * 0.06;

    return (
      <div style={{ animation: `fadeUp 0.32s ease both`, animationDelay: `${cappedDelay}s` }}>
        <button
          ref={el => { cardRefs.current[d.id] = el; }}
          id={`card-${d.id}`}
          aria-expanded={isOpen}
          aria-controls={`panel-${d.id}`}
          onClick={() => {
            setSelected(isOpen ? null : d);
            if (!isOpen && d && trackLearnExploration) trackLearnExploration("archaeologyViewed", d.id);
          }}
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
            boxShadow: isOpen
              ? `0 4px 16px ${color}22`
              : (darkMode ? "0 2px 8px rgba(0,0,0,0.3)" : "0 2px 8px rgba(0,0,0,0.05)"),
            transition: "all 0.2s",
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
              <span
                aria-label={`Verification status: ${d.verified_status}`}
                style={{
                  fontFamily: st.ui, fontSize: 10, fontWeight: 700,
                  color: status.color, background: status.bg,
                  borderRadius: 5, padding: "2px 7px",
                }}
              >
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
                  {d.location}
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
          }} aria-hidden="true">
            &rsaquo;
          </div>
        </button>

        {/* Inline detail panel */}
        {isOpen && <DetailPanel d={d} />}
      </div>
    );
  };

  // ── Render ─────────────────────────────────────────────────
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom: 40 }} role="main" aria-label="Archaeological Evidence">
      <style>{STYLES}</style>

      {/* ── Sticky header ── */}
      <header style={{
        background: st.headerGradient,
        padding: "14px 20px 18px",
        position: "sticky", top: 0, zIndex: 30,
      }}>
        <div style={{ display:"flex", alignItems:"center", gap:12, marginBottom:6 }}>
          <button
            onClick={() => nav("learn-home")}
            aria-label="Back to Learn"
            style={{
              background:"rgba(255,255,255,0.12)", border:"none",
              borderRadius:8, padding:"6px 12px",
              fontFamily:st.ui, fontSize:13, color:st.headerText,
              cursor:"pointer", fontWeight:600,
            }}
          >
            &larr; Back
          </button>
          <div>
            <h1 style={{
              fontFamily:st.heading, fontSize:22, color:st.headerText,
              margin:0, lineHeight:1.1,
            }}>
              Archaeological Evidence
            </h1>
            <div style={{
              fontFamily:st.ui, fontSize:12, color:`${st.headerText}B3`,
              marginTop:2,
            }}>
              Faith confirmed in the ground
            </div>
          </div>
        </div>

        {/* Stats row */}
        <div style={{ display:"flex", gap:10, marginTop:8 }} role="status" aria-label={`${discoveries.length} discoveries, ${confirmedCount} confirmed, ${countriesCount} countries`}>
          {[
            { icon: "\u26CF\uFE0F", value: discoveries.length, label: "Discoveries" },
            { icon: "\u2705", value: confirmedCount, label: "Confirmed" },
            { icon: "\uD83D\uDCCD", value: countriesCount, label: "Countries" },
          ].map(s => (
            <div key={s.label} style={{
              background:"rgba(255,255,255,0.10)", borderRadius:8,
              padding:"6px 12px", display:"flex", alignItems:"center", gap:6,
            }}>
              <span style={{ fontFamily:st.ui, fontSize:20 }}>{s.icon}</span>
              <div>
                <div style={{ fontFamily:st.ui, fontSize:16, fontWeight:800, color:st.headerText, lineHeight:1 }}>
                  {s.value}
                </div>
                <div style={{ fontFamily:st.ui, fontSize:9, color:`${st.headerText}A6`, textTransform:"uppercase" }}>
                  {s.label}
                </div>
              </div>
            </div>
          ))}
        </div>
      </header>

      {/* ── Intro banner ── */}
      <div style={{
        margin:"16px 16px 0",
        background: darkMode
          ? `linear-gradient(135deg, ${st.dark}12, ${st.accent}08)`
          : `linear-gradient(135deg, ${st.dark}12, ${st.accent}08)`,
        border:`1px solid ${st.accent}25`,
        borderRadius:14, padding:"14px 16px",
      }}>
        <p style={{
          fontFamily:st.body, fontSize:13.5, color:st.muted,
          lineHeight:1.7, margin:0, fontStyle:"italic",
        }}>
          &ldquo;The earth is the LORD&rsquo;s, and the fulness thereof.&rdquo; &mdash; Psalm 24:1.
          Every spade that enters the ground tells the same story Scripture has always told.
          These discoveries were made by archaeologists of many beliefs &mdash; yet each one
          confirms the historical reliability of the King James Bible.
        </p>
      </div>

      {/* ── Category filter pills ── */}
      <nav aria-label="Filter discoveries" style={{ padding:"16px 16px 0" }}>
        <div style={{
          fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.light,
          textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:8,
        }}>
          Category
        </div>
        <div role="group" aria-label="Category filter" style={{
          display:"flex", gap:7, overflowX:"auto",
          paddingBottom:4, scrollbarWidth:"none",
        }}>
          {ALL_CATEGORIES.map(cat => (
            <Pill
              key={cat}
              label={cat}
              active={catFilter === cat}
              color={cat === "All" ? st.dark : CATEGORY_COLORS[cat]}
              count={cat === "All" ? null : catCounts[cat] || 0}
              onClick={() => { setCatFilter(cat); setSelected(null); }}
            />
          ))}
        </div>

        {/* ── Status filter pills ── */}
        <div style={{ marginTop: 12 }}>
          <div style={{
            fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.light,
            textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:8,
          }}>
            Verified Status
          </div>
          <div role="group" aria-label="Status filter" style={{ display:"flex", gap:7, flexWrap:"wrap" }}>
            {ALL_STATUSES.map(s => {
              const cfg = STATUS_CONFIG[s];
              return (
                <Pill
                  key={s}
                  label={s === "All" ? "All Statuses" : `${cfg?.emoji} ${s}`}
                  active={statFilter === s}
                  color={s === "All" ? st.dark : cfg?.color}
                  count={s === "All" ? null : statCounts[s] || 0}
                  onClick={() => { setStatFilter(s); setSelected(null); }}
                />
              );
            })}
          </div>
        </div>
      </nav>

      {/* ── Result count + clear filters ── */}
      <div style={{
        padding:"12px 16px 4px",
        display:"flex", alignItems:"center", justifyContent:"space-between",
      }}>
        <div aria-live="polite" style={{ fontFamily:st.ui, fontSize:12, color:st.light }}>
          {filtered.length === discoveries.length
            ? `All ${discoveries.length} discoveries`
            : `${filtered.length} of ${discoveries.length} discoveries`}
        </div>
        {hasActiveFilter && (
          <button
            onClick={clearFilters}
            style={{
              fontFamily: st.ui, fontSize: 11, fontWeight: 600,
              color: st.accent, background: "none", border: "none",
              cursor: "pointer", padding: "2px 6px",
            }}
          >
            Clear filters
          </button>
        )}
      </div>

      {/* ── Cards ── */}
      <section aria-label="Discoveries" style={{ padding:"10px 16px 0" }}>
        {filtered.length === 0 ? (
          <div style={{
            textAlign:"center", padding:"48px 24px",
          }}>
            <div style={{
              fontFamily:st.body, fontSize:15, color:st.light, fontStyle:"italic",
              marginBottom: 16,
            }}>
              No discoveries match your current filters.
            </div>
            <button
              onClick={clearFilters}
              style={{
                fontFamily: st.ui, fontSize: 13, fontWeight: 600,
                color: "#fff", background: st.accent,
                border: "none", borderRadius: 10, padding: "10px 20px",
                cursor: "pointer",
              }}
            >
              Clear all filters
            </button>
          </div>
        ) : (
          <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
            {filtered.map((d, i) => (
              <DiscoveryCard key={d.id} d={d} index={i} />
            ))}
          </div>
        )}
      </section>

      {/* ── Footer legend ── */}
      {filtered.length > 0 && (
        <footer style={{
          margin:"24px 16px 0",
          background: darkMode ? "rgba(255,255,255,0.04)" : "rgba(0,0,0,0.03)", borderRadius:12, padding:"14px 16px",
        }}>
          <p style={{
            fontFamily:st.ui, fontSize:11, color:st.light,
            lineHeight:1.65, margin:0, textAlign:"center",
          }}>
            {STATUS_CONFIG["Confirmed"].emoji} Confirmed &mdash; scholarly consensus &nbsp;&middot;&nbsp;
            {STATUS_CONFIG["Probable"].emoji} Probable &mdash; strong evidence &nbsp;&middot;&nbsp;
            {STATUS_CONFIG["Debated"].emoji} Debated &mdash; ongoing discussion
          </p>
        </footer>
      )}
    </div>
  );
}
