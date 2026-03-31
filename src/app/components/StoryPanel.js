"use client";

/* ═══════════════════════════════════════════════════════════════
   StoryPanel — Manga-style page type renderers
   Each page type is a self-contained visual component:
   SplashPage, PanelsPage, ScripturePage, ReflectPage, RevealPage
   ═══════════════════════════════════════════════════════════════ */

// ── Paint splash decoration ──
const PaintSplash = ({ color, top, left, right, bottom, size = 180, blur = 40, rotate = 0 }) => (
  <div style={{
    position: "absolute", borderRadius: "50%", filter: `blur(${blur}px)`,
    background: color, width: size, height: size * 0.85,
    top, left, right, bottom, transform: `rotate(${rotate}deg)`, pointerEvents: "none",
  }} />
);

// ── Manga speed/burst lines ──
const BurstLines = ({ color = "rgba(212,168,83,0.06)", size = 600 }) => (
  <div style={{
    position: "absolute", top: "30%", left: "50%", transform: "translate(-50%,-50%)",
    width: size, height: size, borderRadius: "50%", opacity: 0.8, pointerEvents: "none",
    background: `repeating-conic-gradient(${color} 0deg 2deg, transparent 2deg 10deg)`,
  }} />
);

// ── Speech bubble ──
const SpeechBubble = ({ speaker, text, style: speechStyle, cu }) => {
  const isShout = speechStyle === "shout" || speechStyle === "fury" || speechStyle === "anger";
  const isWhisper = speechStyle === "whisper";
  return (
    <div style={{ position: "relative", marginTop: 12 }}>
      <div style={{
        background: "#fff", border: `3px solid ${isShout ? cu.primary : "#2a1a10"}`,
        borderRadius: isShout ? 8 : 20, padding: "14px 18px",
        boxShadow: `3px 3px 0 ${isShout ? cu.primary + "22" : "rgba(42,26,16,0.08)"}`,
      }}>
        {speaker && (
          <div style={{
            position: "absolute", top: -10, left: 16,
            fontSize: 9, fontWeight: 800, color: "#fff",
            background: cu.primary, padding: "2px 10px", borderRadius: 10,
            letterSpacing: "0.1em", textTransform: "uppercase", fontFamily: "'Outfit',sans-serif",
          }}>{speaker}</div>
        )}
        <div style={{
          fontFamily: isWhisper ? "'Lora',serif" : "'Outfit',sans-serif",
          fontSize: isShout ? 16 : 14, fontWeight: isShout ? 800 : 500,
          fontStyle: isWhisper ? "italic" : "normal",
          color: "#2a1a10", lineHeight: 1.5,
          textTransform: isShout ? "uppercase" : "none",
          letterSpacing: isShout ? "0.03em" : 0,
        }}>
          {isShout ? `"${text}"` : `\u201C${text}\u201D`}
        </div>
      </div>
      {/* Bubble tail */}
      <div style={{
        position: "absolute", bottom: -12, left: 30, width: 0, height: 0,
        borderLeft: "10px solid transparent", borderRight: "10px solid transparent",
        borderTop: `12px solid ${isShout ? cu.primary : "#2a1a10"}`,
      }} />
      <div style={{
        position: "absolute", bottom: -8, left: 31, width: 0, height: 0,
        borderLeft: "9px solid transparent", borderRight: "9px solid transparent",
        borderTop: "10px solid #fff",
      }} />
    </div>
  );
};

// ── Narration box ──
const NarrationBox = ({ text, cu }) => (
  <div style={{
    background: cu.darkBg + "F0", borderLeft: `3px solid ${cu.secondary}`,
    borderRadius: "0 8px 8px 0", padding: "12px 16px",
  }}>
    <div style={{
      fontFamily: "'Lora',serif", fontSize: 13.5, fontStyle: "italic",
      color: "#F5E6CC", lineHeight: 1.65,
    }}>{text}</div>
  </div>
);

// ── Scripture ref badge ──
const ScriptureRef = ({ reference, cu }) => (
  <div style={{
    display: "inline-block", padding: "3px 12px", borderRadius: 20,
    background: cu.primary + "25", border: `1px solid ${cu.secondary}40`,
    fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 700,
    color: cu.secondary, letterSpacing: "0.08em", textTransform: "uppercase",
  }}>{reference}</div>
);

// ── Image placeholder (until real art is provided) ──
const ImagePlaceholder = ({ cu, label }) => (
  <div style={{
    width: "100%", height: "100%", minHeight: 120,
    background: `linear-gradient(135deg, ${cu.darkBg} 0%, ${cu.primary}40 50%, ${cu.darkBg} 100%)`,
    display: "flex", alignItems: "center", justifyContent: "center", flexDirection: "column",
    gap: 8, borderRadius: 4,
  }}>
    <div style={{ fontSize: 32, opacity: 0.4 }}>🎨</div>
    <div style={{
      fontFamily: "'Outfit',sans-serif", fontSize: 9, color: cu.secondary + "60",
      letterSpacing: "0.1em", textTransform: "uppercase",
    }}>{label || "Artwork coming"}</div>
  </div>
);

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 1: SPLASH — Cinematic full-bleed opener
   ═══════════════════════════════════════════════════════════════ */
export function SplashPage({ page, cu }) {
  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(135deg, ${cu.darkBg} 0%, ${cu.primary}40 25%, ${cu.darkBg} 50%, ${cu.primary}20 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Paint splashes */}
      <PaintSplash color={cu.primary + "30"} top="15%" left="10%" size={200} rotate={-15} />
      <PaintSplash color={cu.accent + "25"} top="60%" right="5%" size={250} rotate={20} />
      <PaintSplash color={cu.secondary + "20"} bottom="20%" left="15%" size={180} rotate={-30} />

      {/* Burst lines */}
      <BurstLines color={cu.secondary + "08"} />

      {/* Three crosses silhouette */}
      <div style={{
        position: "absolute", bottom: 80, left: "50%", transform: "translateX(-50%)",
        display: "flex", gap: 32, alignItems: "flex-end", opacity: 0.08,
      }}>
        {[40, 60, 40].map((h, i) => (
          <div key={i} style={{ display: "flex", flexDirection: "column", alignItems: "center" }}>
            <div style={{ width: i === 1 ? 24 : 18, height: 4, background: cu.secondary }} />
            <div style={{ width: 4, height: h, background: cu.secondary }} />
          </div>
        ))}
      </div>

      {/* Hill silhouette */}
      <div style={{
        position: "absolute", bottom: 0, left: 0, right: 0, height: 100,
        background: `linear-gradient(180deg, transparent 0%, ${cu.darkBg}CC 40%, ${cu.darkBg}F0 100%)`,
        pointerEvents: "none",
      }} />

      {/* Title content */}
      <div style={{ position: "relative", zIndex: 2, textAlign: "center", maxWidth: 380 }}>
        {/* Episode badge */}
        <div style={{
          display: "inline-block", fontFamily: "'Outfit',sans-serif", fontSize: 11, fontWeight: 700,
          color: cu.secondary + "CC", background: cu.secondary + "18", border: `1px solid ${cu.secondary}30`,
          padding: "4px 16px", borderRadius: 20, letterSpacing: "0.15em", textTransform: "uppercase",
          marginBottom: 24,
        }}>Episode</div>

        {/* Main title — 3D text */}
        <h1 style={{
          fontFamily: "'Playfair Display','DM Serif Display',serif", fontSize: 42, fontWeight: 900,
          color: "#F5E6CC", lineHeight: 1.1, margin: "0 0 16px",
          textShadow: `1px 1px 0 rgba(42,26,16,0.15), 2px 2px 0 rgba(42,26,16,0.1), 3px 3px 0 rgba(42,26,16,0.05), 0 0 40px ${cu.secondary}50, 0 4px 12px rgba(0,0,0,0.3)`,
        }}>{page.title}</h1>

        {/* Subtitle */}
        <p style={{
          fontFamily: "'Lora',serif", fontSize: 16, fontStyle: "italic",
          color: cu.secondary + "CC", margin: "0 0 28px", lineHeight: 1.6,
          textShadow: "0 1px 8px rgba(0,0,0,0.5)",
        }}>{page.subtitle}</p>

        {/* Scripture reference */}
        {page.scripture && <ScriptureRef reference={page.scripture} cu={cu} />}
      </div>

      {/* Decorative bottom line */}
      <div style={{
        position: "absolute", bottom: 120, left: "50%", transform: "translateX(-50%)",
        width: 60, height: 2, borderRadius: 2,
        background: `linear-gradient(90deg, transparent, ${cu.secondary}60, transparent)`,
      }} />
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 2: PANELS — Multi-panel manga page
   ═══════════════════════════════════════════════════════════════ */

const LAYOUTS = {
  LAYOUT_FULL: { grid: "1fr", rows: "1fr", areas: [["a"]] },
  LAYOUT_SPLIT_H: { grid: "2fr 3fr", rows: "1fr", areas: [["a", "b"]] },
  LAYOUT_SPLIT_V: { grid: "1fr", rows: "1fr 1fr", areas: [["a"], ["b"]] },
  LAYOUT_L: { grid: "1fr 1fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "c"]] },
  LAYOUT_GRID: { grid: "1fr 1fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "d"]] },
  LAYOUT_MANGA: { grid: "3fr 2fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "c"]] },
};

export function PanelsPage({ page, cu }) {
  const layout = LAYOUTS[page.layout] || LAYOUTS.LAYOUT_SPLIT_V;
  const areaNames = layout.areas.flat();
  const gridTemplateAreas = layout.areas.map(row => `"${row.join(" ")}"`).join(" ");

  return (
    <div style={{
      minHeight: "100vh", padding: "20px 16px", boxSizing: "border-box",
      background: `linear-gradient(170deg, ${cu.lightBg} 0%, #FFF3E0 30%, ${cu.lightBg} 60%, #F5EDE0 100%)`,
      position: "relative",
    }}>
      {/* Diagonal accent panel */}
      <div style={{
        position: "absolute", top: 0, right: 0, width: "35%", height: "100%",
        background: `linear-gradient(135deg, transparent 0%, ${cu.primary}05 50%, ${cu.primary}0A 100%)`,
        clipPath: "polygon(20% 0, 100% 0, 100% 100%, 0% 100%)", pointerEvents: "none",
      }} />

      <div style={{
        display: "grid",
        gridTemplateColumns: layout.grid,
        gridTemplateRows: layout.rows,
        gridTemplateAreas,
        gap: 12,
        maxWidth: 500,
        margin: "0 auto",
        minHeight: "calc(100vh - 40px)",
        position: "relative", zIndex: 1,
      }}>
        {page.panels.map((panel, i) => {
          const area = areaNames[i];
          if (!area) return null;
          return (
            <div key={i} style={{
              gridArea: area,
              border: "3px solid #2a1a10",
              borderRadius: 8,
              background: "#fff",
              boxShadow: "4px 4px 0 rgba(42,26,16,0.1), 0 8px 32px rgba(0,0,0,0.08)",
              position: "relative", overflow: "hidden",
              display: "flex", flexDirection: "column",
              animation: `fadeIn 0.4s ease ${i * 0.15}s both`,
            }}>
              {/* Top accent gradient */}
              <div style={{
                position: "absolute", top: 0, left: 0, right: 0, height: 3,
                background: `linear-gradient(90deg, ${cu.secondary}, ${cu.primary}, ${cu.accent})`,
              }} />

              {/* Panel content */}
              <div style={{ padding: 14, flex: 1, display: "flex", flexDirection: "column", gap: 10, paddingTop: 18 }}>
                {/* Image area */}
                {panel.image && <ImagePlaceholder cu={cu} label={panel.image.split("/").pop()} />}

                {/* Narration */}
                {panel.narration && <NarrationBox text={panel.narration} cu={cu} />}

                {/* Speech bubble */}
                {panel.speech && (
                  <SpeechBubble
                    speaker={panel.speech.speaker}
                    text={panel.speech.text}
                    style={panel.speech.style}
                    cu={cu}
                  />
                )}

                {/* Scripture ref at bottom */}
                {panel.scripture && (
                  <div style={{ marginTop: "auto", paddingTop: 8 }}>
                    <ScriptureRef reference={panel.scripture} cu={cu} />
                  </div>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 3: SCRIPTURE — Verse highlight page
   ═══════════════════════════════════════════════════════════════ */
export function ScripturePage({ page, cu, onNavigateVerse }) {
  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}30 30%, ${cu.primary}20 50%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Moonlight glow */}
      <div style={{
        position: "absolute", top: 40, right: 50, width: 80, height: 80,
        background: "radial-gradient(circle, rgba(240,240,220,0.6) 0%, rgba(240,240,220,0.2) 40%, transparent 70%)",
        borderRadius: "50%", boxShadow: "0 0 60px rgba(240,240,220,0.2), 0 0 120px rgba(240,240,220,0.1)",
        pointerEvents: "none",
      }} />

      {/* Stars */}
      {[
        { top: "10%", left: "20%", size: 2 }, { top: "15%", left: "70%", size: 1.5 },
        { top: "25%", left: "85%", size: 2 }, { top: "8%", left: "45%", size: 1.5 },
        { top: "20%", left: "30%", size: 1 }, { top: "12%", left: "60%", size: 2 },
      ].map((s, i) => (
        <div key={i} style={{
          position: "absolute", top: s.top, left: s.left,
          width: s.size, height: s.size, borderRadius: "50%",
          background: "rgba(255,255,255,0.6)", pointerEvents: "none",
        }} />
      ))}

      {/* Scroll panel */}
      <div style={{
        maxWidth: 400, width: "100%", position: "relative", zIndex: 2,
        background: `linear-gradient(135deg, #FDF6EE 0%, #F5EBDD 50%, #FDF6EE 100%)`,
        border: `2.5px solid ${cu.accent}`,
        borderRadius: 16, padding: "36px 28px",
        boxShadow: `0 4px 20px ${cu.accent}25, inset 0 0 30px ${cu.secondary}08`,
        animation: "fadeIn 0.6s ease",
      }}>
        {/* Scroll edge shadows */}
        <div style={{
          position: "absolute", left: -8, top: 0, width: 16, height: "100%",
          background: `radial-gradient(circle at 70%, ${cu.accent}18 0%, transparent 70%)`,
          borderRadius: "50%", pointerEvents: "none",
        }} />
        <div style={{
          position: "absolute", right: -8, top: 0, width: 16, height: "100%",
          background: `radial-gradient(circle at 30%, ${cu.accent}18 0%, transparent 70%)`,
          borderRadius: "50%", pointerEvents: "none",
        }} />

        {/* Corner decorations */}
        {["top-left", "top-right", "bottom-left", "bottom-right"].map(pos => {
          const [v, h] = pos.split("-");
          return (
            <div key={pos} style={{
              position: "absolute", [v]: 8, [h]: 8, width: 16, height: 16,
              borderTop: v === "top" ? `2px solid ${cu.secondary}40` : "none",
              borderBottom: v === "bottom" ? `2px solid ${cu.secondary}40` : "none",
              borderLeft: h === "left" ? `2px solid ${cu.secondary}40` : "none",
              borderRight: h === "right" ? `2px solid ${cu.secondary}40` : "none",
              pointerEvents: "none",
            }} />
          );
        })}

        {/* Main verse */}
        <blockquote style={{
          fontFamily: "'Playfair Display','DM Serif Display',serif",
          fontSize: 22, fontWeight: 700, color: "#2a1a10",
          lineHeight: 1.55, textAlign: "center", margin: "0 0 20px",
          textShadow: "0 1px 2px rgba(0,0,0,0.06)",
        }}>
          {"\u201C"}{page.verse}{"\u201D"}
        </blockquote>

        {/* Reference */}
        <button
          onClick={() => onNavigateVerse && onNavigateVerse(page.reference)}
          style={{
            display: "block", margin: "0 auto 20px", cursor: "pointer",
            background: cu.primary + "12", border: `1px solid ${cu.primary}30`,
            borderRadius: 20, padding: "4px 14px",
            fontFamily: "'Outfit',sans-serif", fontSize: 12, fontWeight: 700,
            color: cu.primary, letterSpacing: "0.06em",
          }}
        >\u2014 {page.reference}</button>

        {/* Divider */}
        <div style={{
          width: 40, height: 2, margin: "0 auto 20px",
          background: `linear-gradient(90deg, transparent, ${cu.secondary}, transparent)`,
          borderRadius: 2,
        }} />

        {/* Original word callout */}
        {page.originalWord && (
          <div style={{
            background: cu.primary + "08", border: `1px solid ${cu.primary}15`,
            borderRadius: 12, padding: "14px 18px", textAlign: "center", marginBottom: 16,
          }}>
            <div style={{
              fontFamily: "'Frank Ruhl Libre',serif", fontSize: 32, color: cu.primary,
              marginBottom: 4, lineHeight: 1.2, direction: "rtl",
            }}>{page.originalWord.hebrew}</div>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 12, color: "#666",
              fontStyle: "italic", marginBottom: 2,
            }}>{page.originalWord.transliteration}</div>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 11, color: cu.primary,
              fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.08em",
            }}>{page.originalWord.meaning}</div>
          </div>
        )}

        {/* Study note */}
        {page.note && (
          <p style={{
            fontFamily: "'Lora',serif", fontSize: 13, color: "#5C4420",
            lineHeight: 1.7, fontStyle: "italic", textAlign: "center", margin: 0,
          }}>{page.note}</p>
        )}
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 4: REFLECT — Interactive engagement page
   ═══════════════════════════════════════════════════════════════ */
export function ReflectPage({ page, cu, ageTier, darkMode }) {
  const content = page[ageTier] || page.adults || page.teens || page.kids;
  if (!content) return null;

  const bg = darkMode ? cu.darkBg : cu.lightBg;
  const textColor = darkMode ? "#F5E6CC" : "#2a1a10";
  const mutedColor = darkMode ? "#A89070" : "#8B7355";

  return (
    <div style={{
      minHeight: "100vh", padding: "40px 20px 60px", boxSizing: "border-box",
      background: bg, display: "flex", flexDirection: "column", alignItems: "center",
      justifyContent: "center",
    }}>
      <div style={{ maxWidth: 420, width: "100%" }}>

        {/* Section label */}
        <div style={{
          display: "flex", alignItems: "center", gap: 8, marginBottom: 24,
          justifyContent: "center",
        }}>
          <div style={{
            width: 28, height: 28, borderRadius: "50%",
            background: cu.accent + "20", display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: 14,
          }}>
            {ageTier === "kids" ? "\ud83e\udde9" : ageTier === "teens" ? "\ud83d\udca1" : "\ud83d\udcda"}
          </div>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: 11, fontWeight: 800,
            color: cu.accent, textTransform: "uppercase", letterSpacing: "0.15em",
          }}>
            {ageTier === "kids" ? "Think About It" : ageTier === "teens" ? "Go Deeper" : "Reflect & Apply"}
          </div>
        </div>

        {/* Main question card */}
        <div style={{
          background: darkMode ? "#ffffff0A" : "#fff",
          border: `2px solid ${cu.accent}30`,
          borderRadius: 16, padding: "24px 22px", marginBottom: 20,
          boxShadow: darkMode ? "none" : `0 4px 20px ${cu.primary}10`,
        }}>
          <p style={{
            fontFamily: "'Lora',serif", fontSize: 17, color: textColor,
            lineHeight: 1.65, margin: 0, textAlign: "center",
          }}>{content.question}</p>
        </div>

        {/* Activity / Journal prompt */}
        {content.activity && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>\u270f\ufe0f Activity</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.activity}</p>
          </div>
        )}

        {content.journal && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>\ud83d\udcd3 Journal Prompt</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.journal}</p>
          </div>
        )}

        {content.application && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>\ud83c\udfaf Application</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.application}</p>
          </div>
        )}

        {/* Cross references */}
        {content.crossRefs && content.crossRefs.length > 0 && (
          <div style={{ display: "flex", flexWrap: "wrap", gap: 8, justifyContent: "center" }}>
            {content.crossRefs.map((ref, i) => (
              <span key={i} style={{
                padding: "4px 12px", borderRadius: 20,
                background: cu.primary + "15", border: `1px solid ${cu.primary}25`,
                fontFamily: "'Outfit',sans-serif", fontSize: 11, fontWeight: 600,
                color: darkMode ? cu.secondary : cu.primary, cursor: "pointer",
              }}>{ref}</span>
            ))}
          </div>
        )}

        {/* Age tier indicator */}
        <div style={{
          marginTop: 32, textAlign: "center",
          fontFamily: "'Outfit',sans-serif", fontSize: 10, color: mutedColor,
          letterSpacing: "0.08em", textTransform: "uppercase",
        }}>
          {ageTier === "kids" ? "\ud83c\udf1f Ages 3\u201312" : ageTier === "teens" ? "\ud83d\udd25 Ages 13\u201318" : "\ud83d\udcda Adults"}
        </div>
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 5: REVEAL — Dramatic moment / climax
   ═══════════════════════════════════════════════════════════════ */
export function RevealPage({ page, cu }) {
  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}50 40%, ${cu.primary}30 70%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Impact burst */}
      <div style={{
        position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)",
        width: 500, height: 500, borderRadius: "50%", pointerEvents: "none",
        background: `radial-gradient(circle, ${cu.secondary}15 0%, ${cu.secondary}05 40%, transparent 60%)`,
      }} />

      {/* Starburst lines */}
      <div style={{
        position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)",
        width: 600, height: 600, borderRadius: "50%", pointerEvents: "none",
        background: `repeating-conic-gradient(${cu.secondary}06 0deg 3deg, transparent 3deg 15deg)`,
      }} />

      {/* Paint splashes */}
      <PaintSplash color={cu.primary + "35"} top="20%" left="5%" size={220} rotate={-20} blur={50} />
      <PaintSplash color={cu.accent + "25"} bottom="15%" right="10%" size={200} rotate={15} blur={45} />

      {/* Content - glassmorphism card */}
      <div style={{
        position: "relative", zIndex: 2, textAlign: "center", maxWidth: 380,
        background: "rgba(255,255,255,0.06)", backdropFilter: "blur(20px)",
        border: "1px solid rgba(255,255,255,0.1)",
        borderRadius: 20, padding: "40px 28px",
        animation: "fadeIn 0.8s ease",
      }}>
        {/* Title */}
        <h2 style={{
          fontFamily: "'Playfair Display','DM Serif Display',serif",
          fontSize: 32, fontWeight: 900, color: "#F5E6CC",
          lineHeight: 1.15, margin: "0 0 20px",
          textShadow: `0 0 30px ${cu.secondary}40, 0 2px 4px rgba(0,0,0,0.4)`,
          letterSpacing: "0.02em",
        }}>{page.title}</h2>

        {/* Divider */}
        <div style={{
          width: 40, height: 2, margin: "0 auto 20px",
          background: `linear-gradient(90deg, transparent, ${cu.secondary}, transparent)`,
        }} />

        {/* Text */}
        <p style={{
          fontFamily: "'Lora',serif", fontSize: 15, color: "rgba(245,230,200,0.9)",
          lineHeight: 1.7, margin: "0 0 24px", fontStyle: "italic",
        }}>{page.text}</p>

        {/* Scripture */}
        {page.scripture && <ScriptureRef reference={page.scripture} cu={cu} />}
      </div>
    </div>
  );
}
