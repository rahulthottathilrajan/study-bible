// ─── SHARED HELPERS FOR ALL BIBLICAL MAPS ────────
// Import this in every map file:
// import { P, st, HaloText, Dot, ParchBg, SeaDef, Compass, MapCard, LegendDot, ANIM_STYLE } from "./shared";

// ─── CSS ANIMATIONS ──────────────────────────────
export const ANIM_STYLE = `
  @keyframes pulseRing {
    0%   { transform: scale(1);   opacity: 0.55; }
    100% { transform: scale(2.8); opacity: 0;    }
  }
  .map-pulse {
    transform-box: fill-box;
    transform-origin: center;
    animation: pulseRing 1.8s ease-out infinite;
    pointer-events: none;
  }
  @keyframes panelIn {
    from { opacity: 0; transform: translateY(10px); }
    to   { opacity: 1; transform: translateY(0);    }
  }
  .detail-panel { animation: panelIn 0.28s ease; }
`;

// ─── THEME ───────────────────────────────────────
export const st = {
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

// ─── PARCHMENT PALETTE ───────────────────────────
export const P = {
  bg:       "#F5EDD4",
  bgDark:   "#EAD9B2",
  edge:     "#C8A86A",
  land:     "#D8C898",
  fertile:  "#C4D09C",
  desert:   "#DEC878",
  mountain: "#C4B080",
  ink:      "#3A2A14",
  inkFaint: "#7A6040",
  shadow:   "rgba(60,40,10,0.22)",
};

// ─── HALO TEXT ───────────────────────────────────
export const HaloText = ({
  x, y, text,
  fontSize = 3,
  anchor = "middle",
  dy = 0,
  bold = false,
  color = "#3A2A14",
  opacity = 1,
}) => (
  <text
    x={x} y={y} dy={dy}
    fill={color}
    fontSize={fontSize}
    fontFamily="'Nunito',sans-serif"
    fontWeight={bold ? 800 : 600}
    textAnchor={anchor}
    dominantBaseline="auto"
    opacity={opacity}
    style={{
      filter: `drop-shadow(0 0 2.5px #F5EDD4) drop-shadow(0 0 2px #F5EDD4) drop-shadow(0 0 1.5px #F5EDD4)`,
    }}
  >{text}</text>
);

// ─── INTERACTIVE DOT ─────────────────────────────
// Small by default, expands + shows label on selection
export const Dot = ({ cx, cy, r = 3, color, selected, onClick, label, side = "right" }) => {
  const dr = selected ? r : r * 0.55;
  const lx = side === "right" ? cx + dr + 3 : cx - dr - 3;
  const anchor = side === "right" ? "start" : "end";
  return (
    <g onClick={onClick} style={{ cursor: "pointer" }}>
      <circle cx={cx} cy={cy} r={dr + 5} fill={color} opacity="0.08" />
      {selected && <circle cx={cx} cy={cy} r={dr + 3} fill={color} opacity="0.25" className="map-pulse" />}
      <circle cx={cx} cy={cy} r={dr} fill={color} stroke="#fff" strokeWidth={selected ? 1.5 : 1} opacity="0.95" />
      {selected && <circle cx={cx} cy={cy} r={dr + 2} fill="none" stroke={color} strokeWidth="1" opacity="0.7" />}
      {selected && label && (
        <HaloText
          x={lx} y={cy} text={label}
          anchor={anchor} dy="0.35em"
          fontSize={3.2} bold
          color={color} opacity={1}
        />
      )}
    </g>
  );
};

// ─── PARCHMENT BACKGROUND + VIGNETTE ─────────────
export const ParchBg = ({ w, h, vigId }) => (
  <>
    <defs>
      <radialGradient id={vigId} cx="50%" cy="50%" r="65%">
        <stop offset="0%"   stopColor="transparent" />
        <stop offset="100%" stopColor="rgba(100,75,30,0.20)" />
      </radialGradient>
    </defs>
    <rect x="0" y="0" width={w} height={h} fill="#F5EDD4" />
    <rect x="0" y="0" width={w} height={h} fill={`url(#${vigId})`} />
  </>
);

// ─── SEA GRADIENT DEF ─────────────────────────────
export const SeaDef = ({ id }) => (
  <defs>
    <linearGradient id={id} x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%"   stopColor="#A8D4E8" />
      <stop offset="100%" stopColor="#5E9AB8" />
    </linearGradient>
  </defs>
);

// ─── COMPASS ─────────────────────────────────────
export const Compass = ({ x, y }) => (
  <g>
    <text x={x} y={y} fill="#3A2A14" fontSize="5.5" fontFamily="'Nunito',sans-serif"
      fontWeight="700" opacity="0.5" textAnchor="middle">N</text>
    <line x1={x} y1={y + 1} x2={x} y2={y + 9} stroke="#3A2A14" strokeWidth="0.9" opacity="0.4" />
  </g>
);

// ─── MAP CARD WRAPPER ─────────────────────────────
export const MapCard = ({ children, legend }) => (
  <div style={{
    borderRadius: 18,
    overflow: "hidden",
    boxShadow: `0 6px 28px rgba(60,40,10,0.22), 0 1px 4px rgba(0,0,0,0.08)`,
    border: `1.5px solid #C8A86A`,
  }}>
    {children}
    {legend && (
      <div style={{
        padding: "10px 14px",
        background: "#EAD9B2",
        borderTop: `1px solid #C8A86A`,
        display: "flex", flexWrap: "wrap", gap: 10, justifyContent: "center",
      }}>
        {legend}
      </div>
    )}
  </div>
);

// ─── LEGEND DOT ──────────────────────────────────
export const LegendDot = ({ color, label }) => (
  <div style={{ display: "flex", alignItems: "center", gap: 5 }}>
    <div style={{
      width: 9, height: 9, borderRadius: "50%",
      background: color,
      border: "1.5px solid rgba(255,255,255,0.75)",
      boxShadow: `0 0 0 1px ${color}44`,
    }} />
    <span style={{ fontFamily: "'Nunito',sans-serif", fontSize: 9.5, color: "#7A6040", fontWeight: 700 }}>
      {label}
    </span>
  </div>
);