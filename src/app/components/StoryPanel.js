"use client";

/* ═══════════════════════════════════════════════════════════════
   StoryPanel — Manga-style page type renderers (Phase 2: Visual Elevation)
   Each page type is a self-contained visual component:
   SplashPage, PanelsPage, ScripturePage, ReflectPage, RevealPage
   ═══════════════════════════════════════════════════════════════ */

// ── Mood presets for SPLASH/REVEAL differentiation ──
const MOOD_PRESETS = {
  royal:      { glow: "#D4A853", splash1: 0.25, splash2: 0.20, burst: 0.06, vignette: 0.4 },
  dark:       { glow: "#8B0000", splash1: 0.15, splash2: 0.12, burst: 0.04, vignette: 0.6 },
  dramatic:   { glow: "#9B59B6", splash1: 0.30, splash2: 0.22, burst: 0.08, vignette: 0.5 },
  joyful:     { glow: "#F1C40F", splash1: 0.20, splash2: 0.18, burst: 0.07, vignette: 0.3 },
  mysterious: { glow: "#3498DB", splash1: 0.18, splash2: 0.15, burst: 0.05, vignette: 0.55 },
  epic:       { glow: "#E74C3C", splash1: 0.28, splash2: 0.20, burst: 0.09, vignette: 0.45 },
  peaceful:   { glow: "#27AE60", splash1: 0.15, splash2: 0.12, burst: 0.04, vignette: 0.3 },
};

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

// ── Speech bubble with pop animation ──
const SpeechBubble = ({ speaker, text, style: speechStyle, cu, darkMode, delay = 0 }) => {
  const isShout = speechStyle === "shout" || speechStyle === "fury" || speechStyle === "anger";
  const isWhisper = speechStyle === "whisper";
  const bubbleBg = darkMode ? "#1E1C18" : "#fff";
  const bubbleText = darkMode ? "#F5E6CC" : "#2a1a10";
  const borderColor = isShout ? cu.primary : (darkMode ? "#5A4A3A" : "#2a1a10");
  return (
    <div style={{
      position: "relative", marginTop: 12,
      animation: `bubblePop 0.45s ease ${delay}s both`,
    }}>
      <div style={{
        background: bubbleBg, border: `3px solid ${borderColor}`,
        borderRadius: isShout ? 8 : 20, padding: "14px 18px",
        boxShadow: `3px 3px 0 ${isShout ? cu.primary + "22" : (darkMode ? "rgba(0,0,0,0.2)" : "rgba(42,26,16,0.08)")}`,
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
          color: bubbleText, lineHeight: 1.5,
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
        borderTop: `12px solid ${borderColor}`,
      }} />
      <div style={{
        position: "absolute", bottom: -8, left: 31, width: 0, height: 0,
        borderLeft: "9px solid transparent", borderRight: "9px solid transparent",
        borderTop: `10px solid ${bubbleBg}`,
      }} />
    </div>
  );
};

// ── Narration box ──
const NarrationBox = ({ text, cu, darkMode }) => (
  <div style={{
    background: darkMode ? cu.darkBg + "F0" : cu.primary + "0A",
    borderLeft: `3px solid ${darkMode ? cu.secondary : cu.primary}`,
    borderRadius: "0 8px 8px 0", padding: "12px 16px",
  }}>
    <div style={{
      fontFamily: "'Lora',serif", fontSize: 13.5, fontStyle: "italic",
      color: darkMode ? "#F5E6CC" : "#2a1a10", lineHeight: 1.65,
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
    <div style={{ fontSize: 32, opacity: 0.4 }}>{"\uD83C\uDFA8"}</div>
    <div style={{
      fontFamily: "'Outfit',sans-serif", fontSize: 9, color: cu.secondary + "60",
      letterSpacing: "0.1em", textTransform: "uppercase",
    }}>{label || "Artwork coming"}</div>
  </div>
);

// ── Panel slide direction based on grid position ──
const getPanelAnimation = (areaIndex, totalPanels) => {
  const animations = [
    "panelSlideDown",  // first panel: slides from top
    "panelSlideRight", // second: slides from left
    "panelSlideLeft",  // third: slides from right
    "panelSlideUp",    // fourth: slides from bottom
  ];
  return animations[areaIndex % animations.length];
};

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 1: SPLASH — Cinematic full-bleed opener
   Now with backgroundMood differentiation + goldFlow divider + crossesRise
   ═══════════════════════════════════════════════════════════════ */
export function SplashPage({ page, cu }) {
  const mood = MOOD_PRESETS[page.backgroundMood] || MOOD_PRESETS.dramatic;

  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(135deg, ${cu.darkBg} 0%, ${cu.primary}40 25%, ${cu.darkBg} 50%, ${cu.primary}20 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Mood-aware vignette */}
      <div style={{
        position: "absolute", inset: 0, pointerEvents: "none",
        background: `radial-gradient(ellipse at center, transparent 40%, ${cu.darkBg} ${Math.round(100 - mood.vignette * 100)}%)`,
      }} />

      {/* Paint splashes — opacity varies by mood */}
      <PaintSplash color={cu.primary + Math.round(mood.splash1 * 255).toString(16).padStart(2, "0")} top="15%" left="10%" size={200} rotate={-15} />
      <PaintSplash color={cu.accent + Math.round(mood.splash2 * 255).toString(16).padStart(2, "0")} top="60%" right="5%" size={250} rotate={20} />
      <PaintSplash color={cu.secondary + "20"} bottom="20%" left="15%" size={180} rotate={-30} />

      {/* Mood-tinted center glow */}
      <div style={{
        position: "absolute", top: "40%", left: "50%", transform: "translate(-50%,-50%)",
        width: 400, height: 400, borderRadius: "50%", pointerEvents: "none",
        background: `radial-gradient(circle, ${mood.glow}15 0%, transparent 60%)`,
      }} />

      {/* Burst lines — intensity varies by mood */}
      <BurstLines color={cu.secondary + Math.round(mood.burst * 255).toString(16).padStart(2, "0")} />

      {/* Three crosses silhouette — animated rise */}
      <div style={{
        position: "absolute", bottom: 80, left: "50%",
        display: "flex", gap: 32, alignItems: "flex-end",
        animation: "crossesRise 1.2s ease 0.6s both",
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

      {/* Title content — staggered entrance */}
      <div style={{ position: "relative", zIndex: 2, textAlign: "center", maxWidth: 380 }}>
        {/* Episode badge */}
        <div style={{
          display: "inline-block", fontFamily: "'Outfit',sans-serif", fontSize: 11, fontWeight: 700,
          color: cu.secondary + "CC", background: cu.secondary + "18", border: `1px solid ${cu.secondary}30`,
          padding: "4px 16px", borderRadius: 20, letterSpacing: "0.15em", textTransform: "uppercase",
          animation: "fadeIn 0.5s ease 0.2s both",
        }}>Episode</div>

        {/* Main title — 3D text with staggered entrance */}
        <h1 style={{
          fontFamily: "'Playfair Display','DM Serif Display',serif", fontSize: 42, fontWeight: 800,
          color: "#F5E6CC", lineHeight: 1.1, margin: "24px 0 16px",
          textShadow: `1px 1px 0 rgba(42,26,16,0.15), 2px 2px 0 rgba(42,26,16,0.1), 3px 3px 0 rgba(42,26,16,0.05), 0 0 40px ${cu.secondary}50, 0 4px 12px rgba(0,0,0,0.3)`,
          animation: "fadeIn 0.6s ease 0.4s both",
        }}>{page.title}</h1>

        {/* Subtitle */}
        <p style={{
          fontFamily: "'Lora',serif", fontSize: 16, fontStyle: "italic",
          color: cu.secondary + "CC", margin: "0 0 28px", lineHeight: 1.6,
          textShadow: "0 1px 8px rgba(0,0,0,0.5)",
          animation: "fadeIn 0.6s ease 0.6s both",
        }}>{page.subtitle}</p>

        {/* Scripture reference */}
        <div style={{ animation: "fadeIn 0.5s ease 0.8s both" }}>
          {page.scripture && <ScriptureRef reference={page.scripture} cu={cu} />}
        </div>
      </div>

      {/* goldFlow animated divider (brand signature) */}
      <div style={{
        position: "absolute", bottom: 120, left: "50%", transform: "translateX(-50%)",
        width: 80, height: 2, borderRadius: 2,
        background: `linear-gradient(90deg, ${cu.secondary}60 60%, ${cu.secondary}20 90%, ${cu.secondary}60 80%, ${cu.secondary}20 95%, ${cu.secondary}60 60%)`,
        backgroundSize: "200% 100%",
        animation: "goldFlow 3s linear infinite",
      }} />
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 2: PANELS — Multi-panel manga page
   Now with directional panel slide animations
   ═══════════════════════════════════════════════════════════════ */

const LAYOUTS = {
  LAYOUT_FULL: { grid: "1fr", rows: "1fr", areas: [["a"]] },
  LAYOUT_SPLIT_H: { grid: "2fr 3fr", rows: "1fr", areas: [["a", "b"]] },
  LAYOUT_SPLIT_V: { grid: "1fr", rows: "1fr 1fr", areas: [["a"], ["b"]] },
  LAYOUT_L: { grid: "1fr 1fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "c"]] },
  LAYOUT_GRID: { grid: "1fr 1fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "d"]] },
  LAYOUT_MANGA: { grid: "3fr 2fr", rows: "1fr 1fr", areas: [["a", "b"], ["c", "c"]] },
};

export function PanelsPage({ page, cu, darkMode }) {
  const layout = LAYOUTS[page.layout] || LAYOUTS.LAYOUT_SPLIT_V;
  const areaNames = layout.areas.flat();
  const gridTemplateAreas = layout.areas.map(row => `"${row.join(" ")}"`).join(" ");

  const pageBg = darkMode
    ? `linear-gradient(170deg, ${cu.darkBg} 0%, ${cu.primary}20 30%, ${cu.darkBg} 60%, ${cu.primary}15 100%)`
    : `linear-gradient(170deg, ${cu.lightBg} 0%, #FFF3E0 30%, ${cu.lightBg} 60%, #F5EDE0 100%)`;
  const panelBg = darkMode ? "#1A1028" : "#fff";
  const panelBorder = darkMode ? "#5A4A3A" : "#2a1a10";
  const panelShadow = darkMode
    ? "4px 4px 0 rgba(0,0,0,0.25), 0 8px 32px rgba(0,0,0,0.2)"
    : "4px 4px 0 rgba(42,26,16,0.1), 0 8px 32px rgba(0,0,0,0.08)";

  return (
    <div style={{
      minHeight: "100vh", padding: "20px 16px", boxSizing: "border-box",
      background: pageBg, position: "relative",
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
          const animName = getPanelAnimation(i, page.panels.length);
          const bubbleDelay = 0.3 + i * 0.15 + 0.2; // bubble pops after panel slides in
          return (
            <div key={i} style={{
              gridArea: area,
              border: `3px solid ${panelBorder}`,
              borderRadius: 8,
              background: panelBg,
              boxShadow: panelShadow,
              position: "relative", overflow: "hidden",
              display: "flex", flexDirection: "column",
              animation: `${animName} 0.45s ease ${i * 0.15}s both`,
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
                {panel.narration && <NarrationBox text={panel.narration} cu={cu} darkMode={darkMode} />}

                {/* Speech bubble — pops in after panel */}
                {panel.speech && (
                  <SpeechBubble
                    speaker={panel.speech.speaker}
                    text={panel.speech.text}
                    style={panel.speech.style}
                    cu={cu}
                    darkMode={darkMode}
                    delay={bubbleDelay}
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
   Now with scroll unfurl animation + twinkling stars + moonlight pulse
   ═══════════════════════════════════════════════════════════════ */
export function ScripturePage({ page, cu, onNavigateVerse }) {
  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}30 30%, ${cu.primary}20 50%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Moonlight glow — now pulsing */}
      <div style={{
        position: "absolute", top: 40, right: 50, width: 80, height: 80,
        background: "radial-gradient(circle, rgba(240,240,220,0.6) 0%, rgba(240,240,220,0.2) 40%, transparent 70%)",
        borderRadius: "50%", pointerEvents: "none",
        animation: "moonGlow 4s ease-in-out infinite",
      }} />

      {/* Stars — now twinkling with staggered timing */}
      {[
        { top: "10%", left: "20%", size: 2, delay: 0 },
        { top: "15%", left: "70%", size: 1.5, delay: 1.2 },
        { top: "25%", left: "85%", size: 2, delay: 0.7 },
        { top: "8%", left: "45%", size: 1.5, delay: 2.1 },
        { top: "20%", left: "30%", size: 1, delay: 1.5 },
        { top: "12%", left: "60%", size: 2, delay: 0.3 },
        { top: "5%", left: "15%", size: 1.5, delay: 2.8 },
        { top: "18%", left: "90%", size: 1, delay: 1.8 },
      ].map((s, i) => (
        <div key={i} style={{
          position: "absolute", top: s.top, left: s.left,
          width: s.size, height: s.size, borderRadius: "50%",
          background: "rgba(255,255,255,0.7)", pointerEvents: "none",
          animation: `starTwinkle ${2.5 + (i % 3) * 0.8}s ease-in-out ${s.delay}s infinite`,
        }} />
      ))}

      {/* Scroll panel — unfurl animation */}
      <div style={{
        maxWidth: 400, width: "100%", position: "relative", zIndex: 2,
        background: `linear-gradient(135deg, #FDF6EE 0%, #F5EBDD 50%, #FDF6EE 100%)`,
        border: `2.5px solid ${cu.accent}`,
        borderRadius: 16, padding: "36px 28px",
        boxShadow: `0 4px 20px ${cu.accent}25, inset 0 0 30px ${cu.secondary}08`,
        animation: "scrollUnfurl 0.7s ease 0.15s both",
        transformOrigin: "top center",
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
          animation: "fadeIn 0.5s ease 0.6s both",
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
            animation: "fadeIn 0.4s ease 0.8s both",
          }}
        >{"\u2014"} {page.reference}</button>

        {/* Divider — goldFlow animated */}
        <div style={{
          width: 40, height: 2, margin: "0 auto 20px",
          background: `linear-gradient(90deg, transparent, ${cu.secondary}, transparent, ${cu.secondary}, transparent)`,
          backgroundSize: "200% 100%",
          borderRadius: 2,
          animation: "goldFlow 3s linear infinite",
        }} />

        {/* Original word callout (Hebrew OT or Greek NT) */}
        {page.originalWord && (
          <div style={{
            background: cu.primary + "08", border: `1px solid ${cu.primary}15`,
            borderRadius: 12, padding: "14px 18px", textAlign: "center", marginBottom: 16,
            animation: "fadeIn 0.5s ease 1s both",
          }}>
            <div style={{
              fontFamily: page.originalWord.greek ? "'Noto Serif',serif" : "'Frank Ruhl Libre',serif",
              fontSize: 32, color: cu.primary,
              marginBottom: 4, lineHeight: 1.2,
              direction: page.originalWord.greek ? "ltr" : "rtl",
            }}>{page.originalWord.hebrew || page.originalWord.greek}</div>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 12, color: "#8B7355",
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
            animation: "fadeIn 0.5s ease 1.2s both",
          }}>{page.note}</p>
        )}
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 4: REFLECT — Interactive engagement page
   Now with staggered slide-up animations
   ═══════════════════════════════════════════════════════════════ */
export function ReflectPage({ page, cu, ageTier, darkMode }) {
  // littleKids falls back to kids content but rendered simpler
  const isLittleKids = ageTier === "littleKids";
  const contentTier = isLittleKids ? "kids" : ageTier;
  const content = page[contentTier] || page.adults || page.teens || page.kids;
  if (!content) return null;

  const bg = darkMode ? cu.darkBg : cu.lightBg;
  const textColor = darkMode ? "#F5E6CC" : "#2a1a10";
  const mutedColor = darkMode ? "#A89070" : "#8B7355";

  // Little Kids: larger text, simpler layout, no journal/application
  const questionSize = isLittleKids ? 20 : 17;
  const tierIcon = isLittleKids ? "\ud83c\udf08" : ageTier === "kids" ? "\ud83e\udde9" : ageTier === "teens" ? "\ud83d\udca1" : "\ud83d\udcda";
  const tierLabel = isLittleKids ? "Little Ones" : ageTier === "kids" ? "Think About It" : ageTier === "teens" ? "Go Deeper" : "Reflect & Apply";
  const tierRange = isLittleKids ? "\ud83c\udf08 Ages 3\u20135" : ageTier === "kids" ? "\ud83c\udf1f Ages 6\u201312" : ageTier === "teens" ? "\ud83d\udd25 Ages 13\u201318" : "\ud83d\udcda Adults";

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
          animation: "reflectSlideUp 0.4s ease 0.1s both",
        }}>
          <div style={{
            width: isLittleKids ? 36 : 28, height: isLittleKids ? 36 : 28, borderRadius: "50%",
            background: cu.accent + "20", display: "flex", alignItems: "center", justifyContent: "center",
            fontSize: isLittleKids ? 20 : 14,
          }}>
            {tierIcon}
          </div>
          <div style={{
            fontFamily: "'Outfit',sans-serif", fontSize: isLittleKids ? 13 : 11, fontWeight: 800,
            color: cu.accent, textTransform: "uppercase", letterSpacing: "0.15em",
          }}>
            {tierLabel}
          </div>
        </div>

        {/* Main question card */}
        <div style={{
          background: darkMode ? "#ffffff0A" : "#fff",
          border: `2px solid ${cu.accent}30`,
          borderRadius: isLittleKids ? 20 : 16, padding: isLittleKids ? "28px 24px" : "24px 22px", marginBottom: 20,
          boxShadow: darkMode ? "none" : `0 4px 20px ${cu.primary}10`,
          animation: "reflectSlideUp 0.45s ease 0.2s both",
        }}>
          <p style={{
            fontFamily: "'Lora',serif", fontSize: questionSize, color: textColor,
            lineHeight: 1.65, margin: 0, textAlign: "center",
          }}>{content.question}</p>
        </div>

        {/* Activity / Journal prompt */}
        {content.activity && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
            animation: "reflectSlideUp 0.45s ease 0.35s both",
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>{"\u270F\uFE0F"} Activity</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.activity}</p>
          </div>
        )}

        {content.journal && !isLittleKids && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
            animation: "reflectSlideUp 0.45s ease 0.35s both",
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>{"\uD83D\uDCD3"} Journal Prompt</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.journal}</p>
          </div>
        )}

        {content.application && !isLittleKids && (
          <div style={{
            background: cu.accent + "12", borderLeft: `3px solid ${cu.accent}`,
            borderRadius: "0 12px 12px 0", padding: "16px 20px", marginBottom: 16,
            animation: "reflectSlideUp 0.45s ease 0.45s both",
          }}>
            <div style={{
              fontFamily: "'Outfit',sans-serif", fontSize: 10, fontWeight: 800,
              color: cu.accent, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 6,
            }}>{"\uD83C\uDFAF"} Application</div>
            <p style={{
              fontFamily: "'Lora',serif", fontSize: 14, color: textColor,
              lineHeight: 1.6, margin: 0,
            }}>{content.application}</p>
          </div>
        )}

        {/* Cross references */}
        {content.crossRefs && content.crossRefs.length > 0 && !isLittleKids && (
          <div style={{
            display: "flex", flexWrap: "wrap", gap: 8, justifyContent: "center",
            animation: "reflectSlideUp 0.45s ease 0.55s both",
          }}>
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
          animation: "reflectSlideUp 0.4s ease 0.6s both",
        }}>
          {tierRange}
        </div>
      </div>
    </div>
  );
}

/* ═══════════════════════════════════════════════════════════════
   PAGE TYPE 5: REVEAL — Dramatic moment / climax
   Now visually distinct from SPLASH: full-bleed dark with dramatic
   border accent, larger type, starburst intensity, flash-in entrance
   ═══════════════════════════════════════════════════════════════ */
export function RevealPage({ page, cu }) {
  const mood = MOOD_PRESETS[page.backgroundMood] || MOOD_PRESETS.dramatic;

  return (
    <div style={{
      minHeight: "100vh", position: "relative", overflow: "hidden",
      background: `linear-gradient(180deg, ${cu.darkBg} 0%, ${cu.primary}50 40%, ${cu.primary}30 70%, ${cu.darkBg} 100%)`,
      display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center",
      padding: "60px 24px",
    }}>
      {/* Full-page dramatic vignette — heavier than splash */}
      <div style={{
        position: "absolute", inset: 0, pointerEvents: "none",
        background: `radial-gradient(ellipse at center, transparent 30%, ${cu.darkBg} 80%)`,
      }} />

      {/* Impact burst — larger and brighter than splash */}
      <div style={{
        position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)",
        width: 600, height: 600, borderRadius: "50%", pointerEvents: "none",
        background: `radial-gradient(circle, ${mood.glow}20 0%, ${cu.secondary}08 40%, transparent 60%)`,
      }} />

      {/* Starburst lines — stronger opacity for dramatic reveal */}
      <div style={{
        position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)",
        width: 700, height: 700, borderRadius: "50%", pointerEvents: "none",
        background: `repeating-conic-gradient(${cu.secondary}0C 0deg 2deg, transparent 2deg 12deg)`,
      }} />

      {/* Paint splashes */}
      <PaintSplash color={cu.primary + "35"} top="20%" left="5%" size={220} rotate={-20} blur={50} />
      <PaintSplash color={cu.accent + "25"} bottom="15%" right="10%" size={200} rotate={15} blur={45} />

      {/* Content — full-bleed card with dramatic side accents (not glassmorphism like splash) */}
      <div style={{
        position: "relative", zIndex: 2, textAlign: "center", maxWidth: 400, width: "100%",
        animation: "revealFlash 0.6s ease both",
      }}>
        {/* Dramatic side accent lines */}
        <div style={{
          position: "absolute", top: -20, left: "50%", transform: "translateX(-50%)",
          width: 2, height: 40, borderRadius: 2,
          background: `linear-gradient(180deg, transparent, ${cu.secondary}60, transparent)`,
        }} />

        {/* Title — larger and bolder than splash, no card container */}
        <h2 style={{
          fontFamily: "'Playfair Display','DM Serif Display',serif",
          fontSize: 38, fontWeight: 800, color: "#F5E6CC",
          lineHeight: 1.1, margin: "0 0 24px",
          textShadow: `1px 1px 0 rgba(42,26,16,0.2), 2px 2px 0 rgba(42,26,16,0.15), 3px 3px 0 rgba(42,26,16,0.08), 0 0 50px ${mood.glow}50, 0 4px 16px rgba(0,0,0,0.4)`,
          letterSpacing: "0.02em",
        }}>{page.title}</h2>

        {/* Ornamental divider — double line */}
        <div style={{
          display: "flex", alignItems: "center", justifyContent: "center",
          gap: 8, marginBottom: 24,
        }}>
          <div style={{ width: 30, height: 1, background: `${cu.secondary}40` }} />
          <div style={{ width: 6, height: 6, borderRadius: "50%", border: `1.5px solid ${cu.secondary}60` }} />
          <div style={{ width: 30, height: 1, background: `${cu.secondary}40` }} />
        </div>

        {/* Text — in a subtle glass panel */}
        <div style={{
          background: "rgba(255,255,255,0.04)", backdropFilter: "blur(16px)",
          border: `1px solid rgba(255,255,255,0.08)`,
          borderRadius: 16, padding: "28px 24px", marginBottom: 24,
          animation: "fadeIn 0.5s ease 0.3s both",
        }}>
          <p style={{
            fontFamily: "'Lora',serif", fontSize: 16, color: "rgba(245,230,200,0.92)",
            lineHeight: 1.7, margin: 0, fontStyle: "italic",
          }}>{page.text}</p>
        </div>

        {/* Scripture */}
        <div style={{ animation: "fadeIn 0.4s ease 0.6s both" }}>
          {page.scripture && <ScriptureRef reference={page.scripture} cu={cu} />}
        </div>
      </div>

      {/* Bottom accent line */}
      <div style={{
        position: "absolute", bottom: 60, left: "50%", transform: "translateX(-50%)",
        width: 2, height: 40, borderRadius: 2,
        background: `linear-gradient(180deg, ${cu.secondary}40, transparent)`,
      }} />
    </div>
  );
}
