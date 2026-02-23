"use client";
import { useState } from "react";

// ─── CSS ANIMATIONS ───────────────────────────────
const ANIM_STYLE = `
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

// ─── PARCHMENT PALETTE ───────────────────────────
const P = {
  bg:          "#F5EDD4",
  bgDark:      "#EAD9B2",
  edge:        "#C8A86A",
  sea:         "#8FBFD8",
  seaDark:     "#6AA0BC",
  land:        "#D8C898",
  fertile:     "#C4D09C",
  desert:      "#DEC878",
  mountain:    "#C4B080",
  ink:         "#3A2A14",
  inkFaint:    "#7A6040",
  shadow:      "rgba(60,40,10,0.22)",
};

// ─── MAP CONFIGS ─────────────────────────────────
const MAPS = [
  { id:"exodus", icon:"🔥", title:"The Exodus Route",          subtitle:"Moses leads Israel out of Egypt",       era:"c. 1446 BC", color:"#C06C3E" },
  { id:"tribes", icon:"🗺️",  title:"The 12 Tribes of Israel",  subtitle:"Division of the Promised Land",         era:"c. 1400 BC", color:"#2E4A33" },
  { id:"paul",   icon:"⛵", title:"Paul's Missionary Journeys", subtitle:"Three journeys across the Roman world", era:"c. AD 46–57", color:"#1B7A6E" },
  { id:"roman",  icon:"🏛️", title:"The Roman Empire",           subtitle:"The world at the time of Christ",       era:"c. AD 30",   color:"#8B5CF6" },
];

// ─── HELPERS ─────────────────────────────────────

const HaloText = ({ x, y, text, fontSize = 3, anchor = "middle", dy = 0, bold = false, color = P.ink, opacity = 1 }) => (
  <text
    x={x} y={y} dy={dy}
    fill={color}
    fontSize={fontSize}
    fontFamily="'Nunito',sans-serif"
    fontWeight={bold ? 800 : 600}
    textAnchor={anchor}
    dominantBaseline="auto"
    opacity={opacity}
    style={{ filter: `drop-shadow(0 0 2.5px ${P.bg}) drop-shadow(0 0 2px ${P.bg}) drop-shadow(0 0 1.5px ${P.bg})` }}
  >{text}</text>
);

const Dot = ({ cx, cy, r = 4, color, selected, onClick, label, side = "right" }) => {
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
          color={color}
          opacity={1}
        />
      )}
    </g>
  );
};

const ParchBg = ({ w, h, vigId }) => (
  <>
    <defs>
      <radialGradient id={vigId} cx="50%" cy="50%" r="65%">
        <stop offset="0%"   stopColor="transparent" />
        <stop offset="100%" stopColor="rgba(100,75,30,0.20)" />
      </radialGradient>
    </defs>
    <rect x="0" y="0" width={w} height={h} fill={P.bg} />
    <rect x="0" y="0" width={w} height={h} fill={`url(#${vigId})`} />
  </>
);

const SeaDef = ({ id }) => (
  <defs>
    <linearGradient id={id} x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%"   stopColor="#A8D4E8" />
      <stop offset="100%" stopColor="#5E9AB8" />
    </linearGradient>
  </defs>
);

const Compass = ({ x, y }) => (
  <g>
    <text x={x} y={y} fill={P.ink} fontSize="5.5" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.5" textAnchor="middle">N</text>
    <line x1={x} y1={y + 1} x2={x} y2={y + 9} stroke={P.ink} strokeWidth="0.9" opacity="0.4" />
  </g>
);

const MapCard = ({ children, legend }) => (
  <div style={{
    borderRadius: 18,
    overflow: "hidden",
    boxShadow: `0 6px 28px ${P.shadow}, 0 1px 4px rgba(0,0,0,0.08)`,
    border: `1.5px solid ${P.edge}`,
  }}>
    {children}
    {legend && (
      <div style={{
        padding: "10px 14px",
        background: P.bgDark,
        borderTop: `1px solid ${P.edge}`,
        display: "flex", flexWrap: "wrap", gap: 10, justifyContent: "center",
      }}>
        {legend}
      </div>
    )}
  </div>
);

const LegendDot = ({ color, label }) => (
  <div style={{ display: "flex", alignItems: "center", gap: 5 }}>
    <div style={{ width: 9, height: 9, borderRadius: "50%", background: color, border: "1.5px solid rgba(255,255,255,0.75)", boxShadow: `0 0 0 1px ${color}44` }} />
    <span style={{ fontFamily: st.ui, fontSize: 9.5, color: P.inkFaint, fontWeight: 700 }}>{label}</span>
  </div>
);


// ════════════════════════════════════════════════════
// EXODUS MAP
// ════════════════════════════════════════════════════
const ExodusMap = ({ onSelectLocation, selectedLocation }) => {
  const typeColors = {
    start: "#E8625C", route: "#C06C3E", miracle: "#D4A853",
    camp: "#2E4A33", milestone: "#8B5CF6", destination: "#1B7A6E",
  };

  const locs = [
    { id:"rameses",    x:73, y:32, label:"Rameses",          type:"start",       side:"right" },
    { id:"succoth",    x:80, y:38, label:"Succoth",          type:"route",       side:"right" },
    { id:"etham",      x:84, y:45, label:"Etham",            type:"route",       side:"right" },
    { id:"pihahiroth", x:81, y:54, label:"Pi-hahiroth",      type:"route",       side:"left"  },
    { id:"redsea",     x:76, y:62, label:"Red Sea Crossing", type:"miracle",     side:"left"  },
    { id:"marah",      x:70, y:69, label:"Marah",            type:"route",       side:"left"  },
    { id:"elim",       x:65, y:75, label:"Elim",             type:"camp",        side:"left"  },
    { id:"sinai",      x:59, y:88, label:"Mount Sinai",      type:"milestone",   side:"right" },
    { id:"kadesh",     x:43, y:70, label:"Kadesh Barnea",    type:"milestone",   side:"left"  },
    { id:"canaan",     x:33, y:35, label:"Canaan",           type:"destination", side:"left"  },
  ];

  const route = "M73,32 L80,38 L84,45 L81,54 L76,62 L70,69 L65,75 L59,88 L43,70 L33,35";

  return (
    <MapCard
      legend={<>
        <LegendDot color="#E8625C" label="Start / End" />
        <LegendDot color="#D4A853" label="Miracle" />
        <LegendDot color="#8B5CF6" label="Milestone" />
        <LegendDot color="#2E4A33" label="Camp" />
      </>}
    >
      <svg viewBox="0 0 120 110" style={{ width: "100%", display: "block" }}>
        <SeaDef id="sea-ex" />
        <ParchBg w={120} h={110} vigId="vig-ex" />

        {/* Mediterranean */}
        <rect x="0" y="0" width="120" height="27" fill="url(#sea-ex)" opacity="0.88" />
        <HaloText x={26} y={17} text="MEDITERRANEAN  SEA" fontSize={3.5} bold opacity={0.7} color={P.inkFaint} />

        {/* Red Sea */}
        <polygon points="72,53 90,53 96,110 78,110" fill="url(#sea-ex)" opacity="0.75" />
        {/* Gulf of Aqaba */}
        <polygon points="56,72 67,72 68,110 54,110" fill="url(#sea-ex)" opacity="0.55" />
        <HaloText x={86} y={86} text="RED SEA" fontSize={3} bold opacity={0.6} color={P.inkFaint} />

        {/* Nile Delta */}
        <ellipse cx="58" cy="28" rx="16" ry="6" fill={P.fertile} opacity="0.65" />
        <path d="M58,6 C59,14 57,20 58,28" fill="none" stroke="#8ABFD0" strokeWidth="1.6" opacity="0.7" />
        <HaloText x={46} y={24} text="Nile Delta" fontSize={2.5} opacity={0.7} color={P.inkFaint} />

        {/* Egypt */}
        <polygon points="44,27 96,27 97,54 90,53 84,50 80,56 76,64 70,72 62,90 52,110 44,110" fill={P.desert} opacity="0.72" />
        <HaloText x={74} y={40} text="EGYPT" fontSize={6} opacity={0.22} color={P.inkFaint} bold />

        {/* Sinai Peninsula */}
        <polygon points="50,52 82,52 80,60 76,66 68,76 60,92 50,110 44,110 44,62" fill={P.land} opacity="0.78" />
        <HaloText x={59} y={77} text="SINAI" fontSize={4} opacity={0.38} color={P.inkFaint} bold />

        {/* Canaan */}
        <polygon points="22,27 46,27 46,68 42,78 36,82 22,72 20,50 22,36" fill={P.fertile} opacity="0.68" />
        <HaloText x={28} y={46} text="CANAAN" fontSize={4} opacity={0.5} color={P.inkFaint} bold />

        {/* Mountain hints */}
        <polygon points="57,84 62,72 67,84" fill={P.mountain} opacity="0.35" />
        <polygon points="61,86 66,76 71,86" fill={P.mountain} opacity="0.30" />

        {/* Vignette */}
        <rect x="0" y="0" width="120" height="110" fill="url(#vig-ex)" pointerEvents="none" />

        {/* Exodus route */}
        <path d={route} fill="none" stroke="#C06C3E" strokeWidth="1.5" strokeDasharray="4,2.5" opacity="0.9" />

        {locs.map(loc => (
          <Dot
            key={loc.id}
            cx={loc.x} cy={loc.y} r={3}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label}
            side={loc.side}
          />
        ))}

        <Compass x={110} y={9} />
      </svg>
    </MapCard>
  );
};


// ════════════════════════════════════════════════════
// 12 TRIBES MAP
// ════════════════════════════════════════════════════
const TribesMap = ({ onSelectLocation, selectedLocation }) => {
  const tribes = [
    { id:"dan_north",  label:"Dan",         cx:43, cy:13, color:"#E8625C", points:"36,8  52,8  52,18 48,22 38,22 34,16",                          scripture:"Joshua 19:40-48" },
    { id:"naphtali",   label:"Naphtali",     cx:57, cy:18, color:"#1B7A6E", points:"52,8  64,8  66,14 62,22 58,28 54,24 50,20 52,16",             scripture:"Joshua 19:32-39" },
    { id:"asher",      label:"Asher",        cx:30, cy:28, color:"#D4A853", points:"26,16 36,12 38,20 36,36 30,42 26,38 24,28",                   scripture:"Joshua 19:24-31" },
    { id:"zebulun",    label:"Zebulun",      cx:43, cy:28, color:"#8B5CF6", points:"36,22 50,20 52,26 50,34 44,36 38,34 36,28",                   scripture:"Joshua 19:10-16" },
    { id:"issachar",   label:"Issachar",     cx:44, cy:40, color:"#C06C3E", points:"36,36 50,34 54,38 52,46 46,48 36,46",                         scripture:"Joshua 19:17-23" },
    { id:"manasseh_w", label:"Manasseh",     cx:38, cy:52, color:"#2E4A33", points:"26,44 36,42 46,48 52,46 54,56 50,62 38,62 26,58 24,50",       scripture:"Joshua 17:1-13"  },
    { id:"ephraim",    label:"Ephraim",      cx:41, cy:67, color:"#6BAE75", points:"30,62 50,62 54,66 50,72 44,74 32,72 28,68",                   scripture:"Joshua 16:5-10"  },
    { id:"dan_south",  label:"Dan",          cx:27, cy:72, color:"#E8625C", points:"24,66 32,64 34,72 28,76 22,74",                               scripture:"Joshua 19:40-48" },
    { id:"benjamin",   label:"Benjamin",     cx:43, cy:75, color:"#B8860B", points:"36,72 50,70 52,76 48,80 38,80 34,76",                         scripture:"Joshua 18:11-28" },
    { id:"judah",      label:"Judah",        cx:37, cy:86, color:"#7A6B8A", points:"22,78 36,76 38,80 50,78 52,82 50,90 40,96 26,92 20,84",       scripture:"Joshua 15:1-63"  },
    { id:"simeon",     label:"Simeon",       cx:37, cy:92, color:"#E8A87C", points:"30,90 44,88 46,96 36,98 28,96",                               scripture:"Joshua 19:1-9"   },
    { id:"manasseh_e", label:"Manasseh E",   cx:62, cy:19, color:"#2E4A33", points:"56,10 72,10 74,20 70,28 60,30 56,26 54,18",                   scripture:"Joshua 13:29-31" },
    { id:"gad",        label:"Gad",          cx:62, cy:46, color:"#9B8BA8", points:"56,36 64,32 70,34 72,56 62,58 56,56 54,44",                   scripture:"Joshua 13:24-28" },
    { id:"reuben",     label:"Reuben",       cx:62, cy:67, color:"#5A8A82", points:"54,58 62,56 72,58 72,76 64,80 56,78 54,68",                   scripture:"Joshua 13:15-23" },
  ];

  return (
    <MapCard
      legend={
        <span style={{ fontFamily: st.ui, fontSize: 10, color: P.inkFaint, fontWeight: 600 }}>
          Tap any tribe territory to explore its history and scripture
        </span>
      }
    >
      <svg viewBox="0 0 90 110" style={{ width: "100%", display: "block" }}>
        <SeaDef id="sea-tribes" />
        <ParchBg w={90} h={110} vigId="vig-tribes" />

        {/* Mediterranean coast */}
        <polygon points="0,0 26,0 28,14 26,44 24,68 22,86 0,86 0,0" fill="url(#sea-tribes)" opacity="0.82" />
        <text x="2" y="60" fill={P.inkFaint} fontSize="2.8" fontFamily="'Nunito',sans-serif" fontWeight="700"
          opacity="0.6" transform="rotate(-90,2,60)">MEDITERRANEAN SEA</text>

        {/* Land background */}
        <polygon points="24,0 90,0 90,110 22,110 24,90 22,68 24,44 26,14" fill={P.fertile} opacity="0.38" />

        {/* Jordan River */}
        <path d="M54,12 C55,24 52,36 54,52 C56,66 54,82 53,104"
          fill="none" stroke="#7AAEC8" strokeWidth="2.8" opacity="0.72" strokeLinecap="round" />
        <HaloText x={57} y={50} text="Jordan" fontSize={2.5} opacity={0.65} color={P.inkFaint} />

        {/* Sea of Galilee */}
        <ellipse cx="53" cy="26" rx="3.2" ry="4.8" fill="#7EB8D4" opacity="0.82" />
        <HaloText x={57} y={26} text="Sea of Galilee" fontSize={2.2} opacity={0.7} anchor="start" color={P.inkFaint} />

        {/* Dead Sea */}
        <ellipse cx="52" cy="72" rx="2.8" ry="6.5" fill="#7EB8D4" opacity="0.78" />
        <HaloText x={56} y={72} text="Dead Sea" fontSize={2.2} opacity={0.7} anchor="start" color={P.inkFaint} />

        {/* Mountain hints */}
        <polygon points="74,14 78,8 82,14" fill={P.mountain} opacity="0.28" />
        <polygon points="78,18 82,12 86,18" fill={P.mountain} opacity="0.22" />

        {/* Tribe territory polygons */}
        {tribes.map(tribe => {
          const isSelected = selectedLocation?.id === tribe.id;
          return (
            <g key={tribe.id} onClick={() => onSelectLocation(tribe)} style={{ cursor: "pointer" }}>
              <polygon
                points={tribe.points}
                fill={tribe.color}
                opacity={isSelected ? 0.58 : 0.26}
                stroke={tribe.color}
                strokeWidth={isSelected ? 1.8 : 0.9}
                strokeOpacity={isSelected ? 0.9 : 0.55}
              />
              {isSelected && <polygon points={tribe.points} fill="none" stroke={tribe.color} strokeWidth="3" strokeOpacity="0.18" />}
              <text
                x={tribe.cx} y={tribe.cy}
                fill={isSelected ? tribe.color : P.ink}
                fontSize={tribe.label.length > 8 ? 2.6 : 3.0}
                fontFamily="'Nunito',sans-serif"
                fontWeight="800"
                textAnchor="middle"
                dominantBaseline="middle"
                opacity={isSelected ? 1 : 0.82}
                style={{ filter: `drop-shadow(0 0 2.5px ${P.bg}) drop-shadow(0 0 2px ${P.bg})` }}
              >{tribe.label}</text>
            </g>
          );
        })}

        {/* Vignette */}
        <rect x="0" y="0" width="90" height="110" fill="url(#vig-tribes)" pointerEvents="none" />
        <Compass x={81} y={9} />
      </svg>
    </MapCard>
  );
};


// ════════════════════════════════════════════════════
// PAUL'S MISSIONARY JOURNEYS MAP
// ════════════════════════════════════════════════════
const PaulMap = ({ onSelectLocation, selectedLocation }) => {
  const j1 = "#E8625C", j2 = "#1B7A6E", j3 = "#8B5CF6";

  const cities = [
    { id:"antioch",      x:68, y:30, label:"Antioch",      journey:[1,2,3], side:"right" },
    { id:"jerusalem",    x:66, y:44, label:"Jerusalem",    journey:[1,2,3], side:"right" },
    { id:"caesarea",     x:64, y:39, label:"Caesarea",     journey:[2,3],   side:"right" },
    { id:"cyprus",       x:57, y:37, label:"Cyprus",       journey:[1],     side:"left"  },
    { id:"perga",        x:60, y:32, label:"Perga",        journey:[1,2],   side:"left"  },
    { id:"iconium",      x:64, y:26, label:"Iconium",      journey:[1,2],   side:"right" },
    { id:"lystra",       x:61, y:29, label:"Lystra",       journey:[1,2],   side:"left"  },
    { id:"ephesus",      x:51, y:28, label:"Ephesus",      journey:[3],     side:"left"  },
    { id:"philippi",     x:36, y:19, label:"Philippi",     journey:[2,3],   side:"left"  },
    { id:"thessalonica", x:39, y:23, label:"Thessalonica", journey:[2,3],   side:"left"  },
    { id:"athens",       x:38, y:32, label:"Athens",       journey:[2],     side:"left"  },
    { id:"corinth",      x:35, y:35, label:"Corinth",      journey:[2,3],   side:"left"  },
    { id:"rome",         x:18, y:21, label:"Rome",         journey:[3],     side:"right" },
  ];

  const dotColor = c => c.journey.length > 1 ? "#D4A853" : c.journey[0] === 1 ? j1 : c.journey[0] === 2 ? j2 : j3;

  return (
    <MapCard
      legend={<>
        {[[j1,"1st Journey","Acts 13–14"],[j2,"2nd Journey","Acts 15–18"],[j3,"3rd Journey","Acts 18–21"]].map(([color, label, ref]) => (
          <div key={label} style={{ display:"flex", alignItems:"center", gap:5 }}>
            <div style={{ width:22, height:3, background:color, borderRadius:2, opacity:0.9 }} />
            <div>
              <div style={{ fontFamily:st.ui, fontSize:9.5, fontWeight:700, color:P.inkFaint }}>{label}</div>
              <div style={{ fontFamily:st.ui, fontSize:8, color:P.inkFaint, opacity:0.65 }}>{ref}</div>
            </div>
          </div>
        ))}
      </>}
    >
      <svg viewBox="0 0 100 70" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-paul" />
        <ParchBg w={100} h={70} vigId="vig-paul" />

        {/* Sea */}
        <rect x="0" y="0" width="100" height="70" fill="url(#sea-paul)" opacity="0.62" />
        <HaloText x={16} y={56} text="MEDITERRANEAN  SEA" fontSize={3.8} bold opacity={0.45} color={P.inkFaint} />

        {/* Italy */}
        <polygon points="16,6 24,4 27,10 26,22 24,30 20,38 16,38 12,30 11,18" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        {/* Sicily */}
        <polygon points="20,40 28,38 30,44 24,46 18,44" fill={P.land} opacity="0.85" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={17} y={22} text="ITALY" fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />

        {/* Sardinia */}
        <ellipse cx="18" cy="28" rx="2.5" ry="4" fill={P.land} opacity="0.6" stroke={P.edge} strokeWidth="0.3" />

        {/* Greece */}
        <polygon points="30,12 44,10 47,16 46,26 44,36 40,40 36,40 32,34 30,22" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={33} y={24} text="GREECE" fontSize={2.8} bold opacity={0.55} color={P.inkFaint} />

        {/* Macedonia */}
        <polygon points="30,8 46,6 48,12 44,12 30,14" fill={P.fertile} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />

        {/* Asia Minor */}
        <polygon points="44,6 80,5 82,14 80,28 74,38 58,40 50,36 46,28 46,16" fill={P.land} opacity="0.9" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={62} y={20} text="ASIA MINOR" fontSize={3.5} bold opacity={0.55} color={P.inkFaint} />

        {/* Syria / Palestine */}
        <polygon points="60,26 80,24 82,46 70,52 62,50 58,42" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.4" />
        <HaloText x={70} y={36} text="SYRIA" fontSize={2.8} bold opacity={0.5} color={P.inkFaint} />

        {/* Cyprus */}
        <polygon points="52,33 62,31 63,38 56,40 50,38" fill={P.land} opacity="0.82" stroke={P.edge} strokeWidth="0.3" />

        {/* North Africa */}
        <polygon points="0,48 100,48 100,70 0,70" fill={P.desert} opacity="0.72" stroke={P.edge} strokeWidth="0.3" />
        <HaloText x={30} y={60} text="NORTH AFRICA" fontSize={3} bold opacity={0.5} color={P.inkFaint} />

        {/* Journey routes */}
        <polyline points="68,30 57,37 60,32 61,29 64,26 68,30 66,44"
          fill="none" stroke={j1} strokeWidth="1.3" strokeDasharray="3.5,2" opacity="0.88" />
        <polyline points="68,30 64,26 61,29 39,23 35,35 38,30 64,40 68,30"
          fill="none" stroke={j2} strokeWidth="1.3" strokeDasharray="2,2" opacity="0.88" />
        <polyline points="68,30 51,28 38,32 18,21 38,32 66,42 68,30"
          fill="none" stroke={j3} strokeWidth="1.4" strokeDasharray="4.5,2" opacity="0.88" />

        {/* Vignette */}
        <rect x="0" y="0" width="100" height="70" fill="url(#vig-paul)" pointerEvents="none" />

        {cities.map(city => (
          <Dot
            key={city.id}
            cx={city.x} cy={city.y}
            r={city.journey.length > 1 ? 3 : 2.5}
            color={dotColor(city)}
            selected={selectedLocation?.id === city.id}
            onClick={() => onSelectLocation(city)}
            label={city.label}
            side={city.side}
          />
        ))}

        <Compass x={92} y={9} />
      </svg>
    </MapCard>
  );
};


// ════════════════════════════════════════════════════
// ROMAN EMPIRE MAP
// ════════════════════════════════════════════════════
const RomanMap = ({ onSelectLocation, selectedLocation }) => {
  const typeColors = { capital:"#D4A853", holy:"#E8625C", church:"#1B7A6E", city:"#8B5CF6" };

  const locs = [
    { id:"rome_re",      x:27, y:22, label:"Rome",        type:"capital", side:"right" },
    { id:"corinth_re",   x:36, y:30, label:"Corinth",     type:"church",  side:"left"  },
    { id:"athens_re",    x:38, y:27, label:"Athens",      type:"city",    side:"right" },
    { id:"ephesus_re",   x:50, y:26, label:"Ephesus",     type:"church",  side:"left"  },
    { id:"antioch_re",   x:66, y:26, label:"Antioch",     type:"church",  side:"right" },
    { id:"caesarea_re",  x:63, y:32, label:"Caesarea",    type:"city",    side:"right" },
    { id:"nazareth",     x:60, y:37, label:"Nazareth",    type:"holy",    side:"left"  },
    { id:"jerusalem_re", x:65, y:41, label:"Jerusalem",   type:"holy",    side:"right" },
    { id:"bethlehem",    x:60, y:45, label:"Bethlehem",   type:"holy",    side:"left"  },
    { id:"alexandria",   x:52, y:48, label:"Alexandria",  type:"city",    side:"left"  },
  ];

  return (
    <MapCard
      legend={<>
        <LegendDot color="#D4A853" label="Capital" />
        <LegendDot color="#E8625C" label="Holy Site" />
        <LegendDot color="#1B7A6E" label="Church" />
        <LegendDot color="#8B5CF6" label="City" />
      </>}
    >
      <svg viewBox="0 0 100 65" style={{ width:"100%", display:"block" }}>
        <SeaDef id="sea-roman" />
        <ParchBg w={100} h={65} vigId="vig-roman" />

        {/* Sea background */}
        <rect x="0" y="0" width="100" height="65" fill="url(#sea-roman)" opacity="0.55" />

        {/* Roman Empire boundary */}
        <polygon
          points="6,4 40,3 44,7 80,5 88,10 90,46 80,54 66,56 50,54 32,48 18,46 8,36 6,20"
          fill={P.land} opacity="0.78"
          stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1" strokeOpacity="0.5"
        />

        {/* Iberia */}
        <polygon points="6,6 20,4 22,10 20,24 12,28 6,22" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.3" />
        {/* Gaul */}
        <polygon points="20,4 34,3 36,8 34,20 24,24 20,16" fill={P.fertile} opacity="0.65" stroke={P.edge} strokeWidth="0.3" />
        {/* Italy */}
        <polygon points="28,8 36,8 38,14 36,26 32,34 28,36 24,28 24,16" fill={P.land} opacity="0.92" stroke={P.edge} strokeWidth="0.4" />
        {/* Greece */}
        <polygon points="34,12 44,10 46,18 44,28 40,34 36,32 34,24" fill={P.land} opacity="0.90" stroke={P.edge} strokeWidth="0.35" />
        {/* Asia Minor */}
        <polygon points="44,7 74,5 76,16 74,28 60,34 50,32 46,22 44,14" fill={P.land} opacity="0.90" stroke={P.edge} strokeWidth="0.4" />
        {/* Syria / Palestine */}
        <polygon points="60,22 78,20 80,46 68,50 58,48 56,38 58,28" fill={P.land} opacity="0.88" stroke={P.edge} strokeWidth="0.35" />
        {/* Egypt / North Africa */}
        <polygon points="28,48 80,46 84,58 22,58 20,52" fill={P.desert} opacity="0.82" stroke={P.edge} strokeWidth="0.35" />
        {/* Judea hills */}
        <polygon points="60,32 70,30 72,42 66,46 58,44 58,36" fill={P.mountain} opacity="0.35" />

        <HaloText x={11} y={16} text="GAUL"         fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={26} y={22} text="ITALY"        fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={36} y={22} text="GREECE"       fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={54} y={19} text="ASIA MINOR"   fontSize={2.8} bold opacity={0.6} color={P.inkFaint} />
        <HaloText x={64} y={30} text="JUDEA"        fontSize={2.5} bold opacity={0.5} color={P.inkFaint} />
        <HaloText x={32} y={54} text="NORTH AFRICA" fontSize={2.8} bold opacity={0.55} color={P.inkFaint} />
        <HaloText x={14} y={44} text="MEDITERRANEAN SEA" fontSize={3} bold opacity={0.38} color={P.inkFaint} />

        {/* Roman roads */}
        <line x1="27" y1="22" x2="62" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />
        <line x1="27" y1="22" x2="36" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />
        <line x1="36" y1="28" x2="62" y2="28" stroke={P.edge} strokeWidth="0.6" strokeDasharray="1.5,1.5" opacity="0.4" />

        {/* Vignette */}
        <rect x="0" y="0" width="100" height="65" fill="url(#vig-roman)" pointerEvents="none" />

        {locs.map(loc => (
          <Dot
            key={loc.id}
            cx={loc.x} cy={loc.y}
            r={loc.type === "capital" ? 2.5 : 2}
            color={typeColors[loc.type]}
            selected={selectedLocation?.id === loc.id}
            onClick={() => onSelectLocation(loc)}
            label={loc.label}
            side={loc.side}
          />
        ))}

        <Compass x={92} y={9} />
      </svg>
    </MapCard>
  );
};


// ════════════════════════════════════════════════════
// LOCATION DETAILS
// ════════════════════════════════════════════════════
const LOCATION_DETAILS = {
  rameses:    { title:"Rameses (Goshen)",        body:"The Israelites lived and laboured in the region of Goshen, in the city of Rameses. This was their starting point after 430 years in Egypt. The pharaoh who refused Moses is believed by many scholars to be Ramesses II.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.'" },
  succoth:    { title:"Succoth",                 body:"The first campsite after leaving Egypt, meaning 'booths' or 'shelters.' Around 600,000 men plus women and children — perhaps 2 million people — began their march to freedom here.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth...'" },
  etham:      { title:"Etham",                   body:"On the edge of the wilderness, the Israelites camped at Etham. It was here that God first appeared as a pillar of cloud by day and a pillar of fire by night — leading every step of the journey.", scripture:"Exodus 13:20-21 — 'And the LORD went before them by day in a pillar of a cloud...'" },
  pihahiroth: { title:"Pi-hahiroth",             body:"Trapped between the sea and Pharaoh's pursuing army, Israel cried out in fear. But Moses declared: 'Fear ye not, stand still, and see the salvation of the LORD.' This was the moment before the greatest miracle of the Old Testament.", scripture:"Exodus 14:2 — 'Speak unto the children of Israel, that they turn and encamp before Pi-hahiroth...'" },
  redsea:     { title:"The Red Sea Crossing",    body:"God commanded Moses to stretch out his rod, and the sea parted — creating walls of water on both sides. Israel crossed on dry ground. When Pharaoh's army pursued, the waters returned and swallowed them whole. This single miracle defined Israel's identity for generations.", scripture:"Exodus 14:21-22 — 'And Moses stretched out his hand over the sea... and the children of Israel went into the midst of the sea upon the dry ground.'" },
  marah:      { title:"Marah — The Bitter Waters", body:"After the triumph of the Red Sea, Israel faced bitter, undrinkable water. God showed Moses a tree — when cast into the water, it became sweet. A picture of the cross transforming bitterness into blessing.", scripture:"Exodus 15:23 — 'And when they came to Marah, they could not drink of the waters of Marah; for they were bitter.'" },
  elim:       { title:"Elim — The Oasis",        body:"After Marah's bitterness came Elim's abundance: twelve wells of water and seventy palm trees. God always has an oasis after the wilderness. The twelve wells matched the twelve tribes; the seventy palms, the seventy elders.", scripture:"Exodus 15:27 — 'And they came to Elim, where were twelve wells of water, and threescore and ten palm trees.'" },
  sinai:      { title:"Mount Sinai — The Law Given", body:"The most significant campsite of the entire Exodus. Here God descended in fire and thunder, and gave Moses the Ten Commandments. The covenant between God and Israel was sealed at this mountain. Also called Horeb — the mountain of God.", scripture:"Exodus 19:2-3 — 'There Israel camped before the mount. And Moses went up unto God, and the LORD called unto him out of the mountain.'" },
  kadesh:     { title:"Kadesh Barnea — The Turning Point", body:"From Kadesh, twelve spies were sent into Canaan. Ten returned with a fearful report; only Joshua and Caleb trusted God. Because of their unbelief, Israel was sentenced to 40 years of wilderness wandering — one year for each day the spies were in the land.", scripture:"Numbers 13:26 — 'And they... came to Moses, and to Aaron, and to all the congregation... and shewed them the fruit of the land.'" },
  canaan:     { title:"Canaan — The Promised Land", body:"The destination of the entire Exodus. God had promised this land to Abraham, Isaac, and Jacob — and now, 40 years after leaving Egypt, Joshua led the people across the Jordan into their inheritance. The land flowing with milk and honey.", scripture:"Joshua 1:2 — 'Moses my servant is dead; now therefore arise, go over this Jordan, thou, and all this people, unto the land which I do give to them.'" },
  dan_north:  { title:"Tribe of Dan (North)",       body:"Dan eventually migrated north after struggling to hold their original southern territory. The city of Dan, at the foot of Mount Hermon, became one of Jeroboam's golden calf worship sites.", scripture:"Joshua 19:40-48" },
  naphtali:   { title:"Tribe of Naphtali",           body:"Naphtali received fertile territory around the Sea of Galilee. Jesus spent much of His ministry in this region — fulfilling Isaiah 9:1 about the land of Naphtali seeing a great light.", scripture:"Joshua 19:32-39; Isaiah 9:1; Matthew 4:13-16" },
  asher:      { title:"Tribe of Asher",              body:"Asher received the fertile coastal strip of northern Canaan. Moses blessed Asher: 'Let him dip his foot in oil' — a promise of agricultural abundance. The prophetess Anna who saw the infant Jesus was from the tribe of Asher.", scripture:"Joshua 19:24-31; Luke 2:36" },
  zebulun:    { title:"Tribe of Zebulun",            body:"Zebulun was landlocked between the Sea of Galilee and the Mediterranean. Nazareth, where Jesus grew up, was in the territory of Zebulun — fulfilling Isaiah's prophecy about the land of Zebulun.", scripture:"Joshua 19:10-16; Matthew 4:13" },
  issachar:   { title:"Tribe of Issachar",           body:"Issachar received the fertile Jezreel Valley — one of the most productive agricultural regions in Canaan. The men of Issachar were known for 'understanding the times' — wisdom about what Israel ought to do.", scripture:"Joshua 19:17-23; 1 Chronicles 12:32" },
  manasseh_w: { title:"Tribe of Manasseh (West)",    body:"The half-tribe of Manasseh received a large territory west of the Jordan. Manasseh was the firstborn son of Joseph — yet Jacob crossed his hands and blessed Ephraim first, the younger brother.", scripture:"Joshua 17:1-13" },
  ephraim:    { title:"Tribe of Ephraim",            body:"Ephraim, the younger son of Joseph, received a prominent central position and became one of the most influential tribes. Joshua himself was from Ephraim. The territory included Shiloh, where the Tabernacle rested for many years.", scripture:"Joshua 16:5-10" },
  dan_south:  { title:"Tribe of Dan (Original)",     body:"Dan's original allotment was in the southwest, near Philistine territory. Samson, the great judge, was from Dan. But constant Philistine pressure caused much of the tribe to migrate north.", scripture:"Joshua 19:40-48; Judges 13:2" },
  benjamin:   { title:"Tribe of Benjamin",           body:"Benjamin's small but strategic territory sat between Judah and Ephraim, containing Jerusalem on its border. King Saul was a Benjamite. The apostle Paul was also from the tribe of Benjamin.", scripture:"Joshua 18:11-28; Philippians 3:5" },
  judah:      { title:"Tribe of Judah",              body:"Judah received the largest territory in the south and became the royal tribe. David was from Judah. The Messiah was to come through Judah — and Jesus, the Lion of the tribe of Judah, fulfilled this. Jerusalem was in Judah's territory.", scripture:"Joshua 15:1-63; Genesis 49:10; Revelation 5:5" },
  simeon:     { title:"Tribe of Simeon",             body:"Simeon received territory within Judah's allotment — a fulfilment of Jacob's prophecy that Simeon would be scattered in Israel. Over time, Simeon was largely absorbed into Judah.", scripture:"Joshua 19:1-9; Genesis 49:7" },
  reuben:     { title:"Tribe of Reuben",             body:"Reuben, the firstborn of Jacob, chose land east of the Jordan — the plains of Moab. Despite being firstborn, Reuben lost his preeminence due to sin. His tribe settled east of the Jordan and was among the first carried into exile.", scripture:"Joshua 13:15-23; 1 Chronicles 5:1" },
  gad:        { title:"Tribe of Gad",                body:"Gad settled in the fertile region of Gilead east of the Jordan. The Gadites were known as mighty warriors — 'men of war fit for battle, that could handle shield and buckler.' Elijah the prophet was from Gilead.", scripture:"Joshua 13:24-28; 1 Chronicles 12:8" },
  manasseh_e: { title:"Tribe of Manasseh (East)",    body:"The eastern half of Manasseh settled in Bashan, north of Gad, east of the Jordan. This region included the fertile highlands of Gilead. Like Reuben and Gad, the eastern Manassites were among the first tribes exiled by Assyria.", scripture:"Joshua 13:29-31; 2 Kings 15:29" },
  antioch:      { title:"Antioch — The Sending Church",    body:"Antioch of Syria was the launching pad of all three of Paul's missionary journeys. It was here that believers were first called 'Christians.' The Holy Spirit said: 'Separate me Barnabas and Saul for the work whereunto I have called them.'", scripture:"Acts 13:1-3 — 'As they ministered to the Lord, and fasted, the Holy Ghost said, Separate me Barnabas and Saul...'" },
  cyprus:       { title:"Cyprus — First Stop",             body:"Paul's first journey began on the island of Cyprus, homeland of Barnabas. Here the Roman proconsul Sergius Paulus became a believer — the first recorded Roman official to convert — after Paul struck the sorcerer Elymas with blindness.", scripture:"Acts 13:4-12 — 'Then the deputy, when he saw what was done, believed, being astonished at the doctrine of the Lord.'" },
  philippi:     { title:"Philippi — First Church in Europe", body:"At Philippi, Paul received the Macedonian call — a vision of a man saying 'Come over into Macedonia and help us.' The first European convert was Lydia, a seller of purple. Paul and Silas were imprisoned and sang hymns at midnight — until an earthquake opened every door.", scripture:"Acts 16:12-40 — 'And at midnight Paul and Silas prayed, and sang praises unto God...'" },
  thessalonica: { title:"Thessalonica",                    body:"Paul preached here for three Sabbaths and many believed, but a riot drove him out. He later wrote two letters to this church — 1 and 2 Thessalonians — which contain some of the Bible's clearest teaching on the return of Christ.", scripture:"Acts 17:1-9 — 'These that have turned the world upside down are come hither also.'" },
  athens:       { title:"Athens — Mars Hill",              body:"At Athens, Paul stood on the Areopagus and delivered one of the most remarkable sermons in Scripture — beginning with their altar 'To the Unknown God' and ending with the resurrection of Christ. A philosophical city met the gospel.", scripture:"Acts 17:22-23 — 'Ye men of Athens, I perceive that in all things ye are too superstitious... I found an altar with this inscription, TO THE UNKNOWN GOD.'" },
  corinth:      { title:"Corinth — Eighteen Months",       body:"Paul spent 18 months in Corinth — longer than almost any other city. He worked as a tentmaker with Priscilla and Aquila. He wrote Romans from Corinth. The church here received two of Paul's most important letters.", scripture:"Acts 18:1-18 — 'And he continued there a year and six months, teaching the word of God among them.'" },
  ephesus:      { title:"Ephesus — Three Years",           body:"Paul spent more time in Ephesus than any other city — nearly three years. The church here became a hub for all of Asia Minor. 'All they which dwelt in Asia heard the word of the Lord Jesus.' Home of the great temple of Artemis, one of the seven wonders of the ancient world.", scripture:"Acts 19:10 — 'This continued by the space of two years; so that all they which dwelt in Asia heard the word of the Lord.'" },
  rome:         { title:"Rome — The End and the Beginning", body:"Paul arrived in Rome as a prisoner — yet he was allowed his own rented house where he preached freely for two years. The gospel had reached the capital of the empire. Tradition holds Paul was martyred here under Nero.", scripture:"Acts 28:30-31 — 'Paul dwelt two whole years in his own hired house... preaching the kingdom of God... with all confidence, no man forbidding him.'" },
  jerusalem:    { title:"Jerusalem — The Heart of it All", body:"Every journey ended with Paul returning to Jerusalem — to report to the apostles and to remain connected to the Jewish roots of the gospel. His final visit led to his arrest and ultimately to Rome.", scripture:"Acts 21:17 — 'And when we were come to Jerusalem, the brethren received us gladly.'" },
  iconium:      { title:"Iconium",                         body:"Paul and Barnabas preached boldly in Iconium, and 'a great multitude both of the Jews and also of the Greeks believed.' But opposition arose and they fled when a plot to stone them was discovered.", scripture:"Acts 14:1-7 — 'Long time therefore abode they speaking boldly in the Lord...'" },
  lystra:       { title:"Lystra — Where Paul Was Stoned",  body:"At Lystra, Paul healed a man lame from birth — and the crowd tried to worship Paul and Barnabas as gods. Then Jews from Antioch stirred up the crowd and Paul was stoned and dragged out of the city, left for dead. He rose up and went back in.", scripture:"Acts 14:8-20 — 'Who, having stoned Paul, drew him out of the city, supposing he had been dead.'" },
  perga:        { title:"Perga",                           body:"Perga was where John Mark departed from the first missionary journey and returned to Jerusalem — a decision Paul later felt strongly about, leading to a sharp disagreement with Barnabas on the second journey.", scripture:"Acts 13:13 — 'John departing from them returned to Jerusalem.'" },
  caesarea:     { title:"Caesarea Maritima",               body:"The Roman administrative capital of Judea. Philip the evangelist lived here. It was here that Cornelius, the first Gentile convert, received the Holy Spirit. Paul was imprisoned here for two years before his voyage to Rome.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },
  rome_re:      { title:"Rome — Caput Mundi",              body:"The capital of the empire — 'head of the world.' In Paul's day, Rome had perhaps one million inhabitants. The church at Rome received Paul's greatest theological letter. Tradition holds that both Peter and Paul were martyred here.", scripture:"Romans 1:7 — 'To all that be in Rome, beloved of God, called to be saints.'" },
  jerusalem_re: { title:"Jerusalem — The Holy City",       body:"Under Roman rule since 63 BC, Jerusalem was the spiritual heart of Judaism and the site of Christ's crucifixion and resurrection. In AD 70, Roman general Titus destroyed the city and the Temple — fulfilling Jesus' prophecy in Matthew 24.", scripture:"Luke 21:24 — 'Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled.'" },
  bethlehem:    { title:"Bethlehem — City of David",       body:"'But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel' — Micah prophesied 700 years before Jesus was born here.", scripture:"Luke 2:4-7 — 'And Joseph also went up from Galilee... unto the city of David, which is called Bethlehem.'" },
  nazareth:     { title:"Nazareth — Where Jesus Grew Up",  body:"A small, unremarkable town in Galilee — prompting Nathanael's question: 'Can any good thing come out of Nazareth?' Yet this was the town where the Son of God spent 30 of His 33 years on earth, growing in wisdom and stature.", scripture:"Luke 2:51-52 — 'And he went down with them, and came to Nazareth, and was subject unto them... And Jesus increased in wisdom and stature.'" },
  antioch_re:   { title:"Antioch — Where Christianity Spread", body:"The third largest city in the Roman Empire after Rome and Alexandria. Here Gentiles first received the gospel in large numbers. The disciples were first called 'Christians' here. Antioch replaced Jerusalem as the centre of the expanding church.", scripture:"Acts 11:26 — 'And the disciples were called Christians first in Antioch.'" },
  alexandria:   { title:"Alexandria — City of Learning",   body:"Founded by Alexander the Great, Alexandria was the intellectual capital of the ancient world. Its great library housed hundreds of thousands of scrolls. The Septuagint — the Greek Old Testament used by the apostles — was translated here.", scripture:"Acts 18:24 — 'And a certain Jew named Apollos, born at Alexandria, an eloquent man, and mighty in the scriptures, came to Ephesus.'" },
  corinth_re:   { title:"Corinth",                         body:"A major commercial city at the crossroads between east and west. Destroyed by Rome in 146 BC and rebuilt as a Roman colony in 44 BC. Paul spent 18 months here and wrote Romans from this city.", scripture:"Acts 18:1 — 'After these things Paul departed from Athens, and came to Corinth.'" },
  ephesus_re:   { title:"Ephesus",                         body:"One of the largest cities in the Roman Empire with perhaps 250,000 inhabitants. Home to the Temple of Artemis, one of the Seven Wonders. Paul spent nearly three years here and the church became a hub for all of Asia Minor.", scripture:"Revelation 2:1 — 'Unto the angel of the church of Ephesus write...'" },
  athens_re:    { title:"Athens",                          body:"The philosophical capital of the ancient world — home to Plato, Aristotle, and the great philosophical schools. By Paul's day it was a university town living on its former glory. Yet here Paul preached the resurrection on Mars Hill.", scripture:"Acts 17:16 — 'Now while Paul waited for them at Athens, his spirit was stirred in him, when he saw the city wholly given to idolatry.'" },
  caesarea_re:  { title:"Caesarea Maritima",               body:"Built by Herod the Great to honour Caesar Augustus. A magnificent Roman city with a man-made harbour, a theatre, an amphitheatre, and a hippodrome. The Roman governor Pontius Pilate lived here — not in Jerusalem.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },
};


// ════════════════════════════════════════════════════
// MAIN COMPONENT
// ════════════════════════════════════════════════════
export default function TimelineMaps({ nav }) {
  const [selectedMap, setSelectedMap]           = useState(null);
  const [selectedLocation, setSelectedLocation] = useState(null);

  const handleSelectLocation = (loc) => {
    setSelectedLocation(prev => prev?.id === loc.id ? null : loc);
  };

  const locationDetail = selectedLocation ? LOCATION_DETAILS[selectedLocation.id] : null;

  // ── MAP GALLERY ──────────────────────────────────
  if (!selectedMap) {
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <style>{ANIM_STYLE}</style>

        <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
          <div style={{ display:"flex", alignItems:"center", gap:10 }}>
            <button onClick={() => nav("timeline-home")}
              style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
            </button>
            <div>
              <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>Historical Maps</h2>
              <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>The world of the Bible</div>
            </div>
          </div>
        </div>

        <div style={{ padding:"20px 16px 40px", maxWidth:520, margin:"0 auto" }}>
          <div style={{ background:st.headerGradient, borderRadius:20, padding:"28px 20px", marginBottom:24, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 20%,rgba(232,98,92,0.25),transparent 65%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:48, marginBottom:10 }}>🗺️</div>
              <div style={{ fontFamily:st.heading, fontSize:24, fontWeight:700, color:st.headerText, marginBottom:6 }}>Biblical Maps</div>
              <div style={{ fontFamily:st.body, fontSize:13, color:`${st.headerText}88`, fontStyle:"italic", lineHeight:1.6 }}>
                Explore the geography of Scripture — from the Exodus route to the Roman Empire
              </div>
            </div>
          </div>

          <div style={{ display:"flex", flexDirection:"column", gap:12 }}>
            {MAPS.map(map => (
              <button key={map.id} onClick={() => { setSelectedMap(map); setSelectedLocation(null); }}
                style={{ width:"100%", background:st.card, border:`1px solid ${map.color}33`, borderRadius:16, padding:"18px 16px", cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.05)", borderLeft:`4px solid ${map.color}`, transition:"all 0.15s" }}>
                <div style={{ width:54, height:54, borderRadius:14, background:`${map.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:28, flexShrink:0 }}>{map.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ fontFamily:st.heading, fontSize:16, fontWeight:700, color:st.dark, marginBottom:3 }}>{map.title}</div>
                  <div style={{ fontFamily:st.ui, fontSize:11, color:map.color, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.04em", marginBottom:3 }}>{map.era}</div>
                  <div style={{ fontFamily:st.body, fontSize:12.5, color:st.muted, fontStyle:"italic" }}>{map.subtitle}</div>
                </div>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={st.light} strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>
              </button>
            ))}
          </div>

          <div style={{ marginTop:24, background:st.headerGradient, borderRadius:16, padding:"20px", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.headerText, fontStyle:"italic", lineHeight:1.8, marginBottom:6 }}>
                "He set the earth on its foundations; it can never be moved."
              </div>
              <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700 }}>Psalm 104:5</div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // ── INDIVIDUAL MAP VIEW ──────────────────────────
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
      <style>{ANIM_STYLE}</style>

      <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <button onClick={() => { setSelectedMap(null); setSelectedLocation(null); }}
            style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <div>
            <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>{selectedMap.title}</h2>
            <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>{selectedMap.era}</div>
          </div>
        </div>
      </div>

      <div style={{ padding:"16px 16px 40px", maxWidth:520, margin:"0 auto" }}>

        <div style={{ fontFamily:st.body, fontSize:13.5, color:st.muted, fontStyle:"italic", lineHeight:1.6, marginBottom:14, textAlign:"center" }}>
          {selectedMap.subtitle} — tap any location to learn more
        </div>

        {selectedMap.id === "exodus" && <ExodusMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "tribes" && <TribesMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "paul"   && <PaulMap   onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "roman"  && <RomanMap  onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}

        {selectedLocation && locationDetail && (
          <div className="detail-panel" style={{
            marginTop:16,
            background: st.card,
            borderRadius:18,
            border:`1px solid ${selectedMap.color}44`,
            borderLeft:`4px solid ${selectedMap.color}`,
            overflow:"hidden",
            boxShadow:`0 4px 20px rgba(0,0,0,0.08)`,
          }}>
            <div style={{ padding:"14px 16px 12px", background:`${selectedMap.color}0D`, display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
              <div style={{ fontFamily:st.heading, fontSize:18, fontWeight:700, color:st.dark, flex:1, lineHeight:1.25 }}>{locationDetail.title}</div>
              <button onClick={() => setSelectedLocation(null)}
                style={{ background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:20, padding:"0 0 0 12px", flexShrink:0, lineHeight:1 }}>✕</button>
            </div>
            <div style={{ padding:"12px 16px 16px" }}>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.85, marginBottom:14 }}>{locationDetail.body}</div>
              <div style={{ background:`${selectedMap.color}0D`, borderRadius:12, padding:"11px 14px", borderLeft:`3px solid ${selectedMap.color}` }}>
                <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:selectedMap.color, textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:5 }}>📖 Scripture</div>
                <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.75, fontStyle:"italic" }}>{locationDetail.scripture}</div>
              </div>
            </div>
          </div>
        )}

        {!selectedLocation && (
          <div style={{ marginTop:14, textAlign:"center", padding:"16px", background:st.card, borderRadius:14, border:`1px solid ${st.divider}` }}>
            <div style={{ fontFamily:st.ui, fontSize:12.5, color:st.muted }}>
              👆 Tap any location on the map to explore it
            </div>
          </div>
        )}

        {(() => {
          const idx  = MAPS.findIndex(m => m.id === selectedMap.id);
          const prev = idx > 0             ? MAPS[idx - 1] : null;
          const next = idx < MAPS.length-1 ? MAPS[idx + 1] : null;
          return (
            <div style={{ display:"flex", gap:10, marginTop:22, borderTop:`1px solid ${st.divider}`, paddingTop:16 }}>
              {prev ? (
                <div onClick={() => { setSelectedMap(prev); setSelectedLocation(null); }}
                  style={{ flex:1, background:st.card, border:`1px solid ${prev.color}40`, borderRadius:14, padding:"12px 14px", cursor:"pointer", borderLeft:`4px solid ${prev.color}` }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:5 }}>← Previous</div>
                  <div style={{ fontSize:18, marginBottom:3 }}>{prev.icon}</div>
                  <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{prev.title}</div>
                </div>
              ) : <div style={{ flex:1 }} />}
              {next ? (
                <div onClick={() => { setSelectedMap(next); setSelectedLocation(null); }}
                  style={{ flex:1, background:st.card, border:`1px solid ${next.color}40`, borderRadius:14, padding:"12px 14px", cursor:"pointer", textAlign:"right", borderRight:`4px solid ${next.color}` }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:5 }}>Next →</div>
                  <div style={{ fontSize:18, marginBottom:3 }}>{next.icon}</div>
                  <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{next.title}</div>
                </div>
              ) : <div style={{ flex:1 }} />}
            </div>
          );
        })()}
      </div>
    </div>
  );
}