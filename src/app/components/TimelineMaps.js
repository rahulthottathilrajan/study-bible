"use client";
import { useState } from "react";

const st = {
  heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Nunito',sans-serif",
  bg:"#FFF8F0", card:"#fff", headerGradient:"linear-gradient(165deg,#2D1B4E 0%,#4A2D6B 100%)",
  headerText:"#F8E8D0", accent:"#E8625C", accentLight:"rgba(232,98,92,0.06)",
  accentBorder:"rgba(232,98,92,0.18)", dark:"#2D1B4E", text:"#4A3B2D",
  muted:"#8B6B4F", light:"#C0A888", divider:"rgba(232,98,92,0.12)",
};

const MAPS = [
  { id:"exodus", icon:"🔥", title:"The Exodus Route", subtitle:"Moses leads Israel out of Egypt", era:"c. 1446 BC", color:"#C06C3E" },
  { id:"tribes", icon:"🗺️", title:"The 12 Tribes of Israel", subtitle:"Division of the Promised Land", era:"c. 1400 BC", color:"#2E4A33" },
  { id:"paul", icon:"⛵", title:"Paul's Missionary Journeys", subtitle:"Three journeys across the Roman world", era:"c. AD 46–57", color:"#1B7A6E" },
  { id:"roman", icon:"🏛️", title:"The Roman Empire", subtitle:"The world at the time of Jesus", era:"c. AD 30", color:"#8B5CF6" },
];

// ─── EXODUS MAP ───
const ExodusMap = ({ onSelectLocation, selectedLocation }) => {
  const locations = [
    { id:"rameses", x:62, y:38, label:"Rameses", type:"start", scripture:"Exodus 12:37" },
    { id:"succoth", x:72, y:42, label:"Succoth", type:"route", scripture:"Exodus 12:37" },
    { id:"etham", x:80, y:46, label:"Etham", type:"route", scripture:"Exodus 13:20" },
    { id:"pihahiroth", x:78, y:54, label:"Pi-hahiroth", type:"route", scripture:"Exodus 14:2" },
    { id:"redsea", x:74, y:62, label:"Red Sea Crossing", type:"miracle", scripture:"Exodus 14:21-22" },
    { id:"marah", x:68, y:70, label:"Marah", type:"route", scripture:"Exodus 15:23" },
    { id:"elim", x:64, y:76, label:"Elim", type:"camp", scripture:"Exodus 15:27" },
    { id:"sinai", x:58, y:88, label:"Mount Sinai", type:"milestone", scripture:"Exodus 19:2" },
    { id:"kadesh", x:44, y:72, label:"Kadesh Barnea", type:"milestone", scripture:"Numbers 13:26" },
    { id:"canaan", x:36, y:38, label:"Canaan", type:"destination", scripture:"Joshua 1:2" },
  ];

  const routePoints = "62,38 72,42 80,46 78,54 74,62 68,70 64,76 58,88 44,72 36,38";

  const typeColors = {
    start:"#E8625C", route:"#C06C3E", miracle:"#D4A853",
    camp:"#2E4A33", milestone:"#8B5CF6", destination:"#1B7A6E"
  };

  return (
    <div style={{ position:"relative", width:"100%", borderRadius:16, overflow:"hidden", background:"#E8F4F0", border:`1px solid #C06C3E33` }}>
      <svg viewBox="0 0 120 110" style={{ width:"100%", display:"block" }}>
        {/* Background regions */}
        {/* Mediterranean Sea */}
        <rect x="0" y="0" width="120" height="30" fill="#A8D4E8" opacity="0.6"/>
        <text x="20" y="15" fill="#1A4A6B" fontSize="4" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.7">MEDITERRANEAN SEA</text>

        {/* Red Sea */}
        <polygon points="70,55 85,55 90,110 75,110" fill="#A8D4E8" opacity="0.5"/>
        <text x="76" y="90" fill="#1A4A6B" fontSize="3" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.7" transform="rotate(15,76,90)">RED SEA</text>

        {/* Egypt land */}
        <rect x="40" y="30" width="55" height="45" fill="#E8D5A8" opacity="0.7" rx="2"/>
        <text x="62" y="37" fill="#8B6914" fontSize="4" fontFamily="'DM Serif Display',serif" fontWeight="700" opacity="0.8">EGYPT</text>

        {/* Sinai Peninsula */}
        <polygon points="55,58 85,58 75,110 45,110" fill="#D4C4A0" opacity="0.7"/>
        <text x="56" y="78" fill="#8B6914" fontSize="3.5" fontFamily="'DM Serif Display',serif" opacity="0.8">SINAI</text>

        {/* Canaan */}
        <rect x="25" y="28" width="22" height="40" fill="#B8D4A8" opacity="0.7" rx="2"/>
        <text x="28" y="36" fill="#2E4A33" fontSize="3.5" fontFamily="'DM Serif Display',serif" fontWeight="700" opacity="0.8">CANAAN</text>

        {/* Nile delta hint */}
        <ellipse cx="55" cy="32" rx="12" ry="4" fill="#7EC8A8" opacity="0.4"/>
        <text x="46" y="28" fill="#1B7A6E" fontSize="2.5" fontFamily="'Nunito',sans-serif" opacity="0.8">Nile Delta</text>

        {/* Route line */}
        <polyline
          points={routePoints}
          fill="none"
          stroke="#C06C3E"
          strokeWidth="1.2"
          strokeDasharray="3,2"
          opacity="0.8"
        />

        {/* Arrow heads along route */}
        {/* Location dots */}
        {locations.map(loc => (
          <g key={loc.id} onClick={() => onSelectLocation(loc)} style={{ cursor:"pointer" }}>
            <circle
              cx={loc.x} cy={loc.y} r={selectedLocation?.id === loc.id ? 4 : 3}
              fill={typeColors[loc.type]}
              stroke="#fff"
              strokeWidth="1"
              opacity="0.95"
            />
            {selectedLocation?.id === loc.id && (
              <circle cx={loc.x} cy={loc.y} r="6" fill="none" stroke={typeColors[loc.type]} strokeWidth="0.8" opacity="0.5"/>
            )}
            <text
              x={loc.x + (loc.x > 60 ? -5 : 5)}
              y={loc.y - 4}
              fill="#2D1B4E"
              fontSize="2.8"
              fontFamily="'Nunito',sans-serif"
              fontWeight="700"
              textAnchor={loc.x > 60 ? "end" : "start"}
              opacity="0.9"
            >{loc.label}</text>
          </g>
        ))}

        {/* Compass */}
        <text x="108" y="8" fill="#4A3B2D" fontSize="5" opacity="0.6">N</text>
        <line x1="110" y1="9" x2="110" y2="16" stroke="#4A3B2D" strokeWidth="0.8" opacity="0.5"/>
      </svg>

      {/* Legend */}
      <div style={{ padding:"10px 14px", background:"rgba(255,255,255,0.85)", borderTop:`1px solid #C06C3E22`, display:"flex", flexWrap:"wrap", gap:8 }}>
        {Object.entries({ "Start/End":"#E8625C", "Miracle":"#D4A853", "Milestone":"#8B5CF6", "Camp":"#2E4A33" }).map(([label, color]) => (
          <div key={label} style={{ display:"flex", alignItems:"center", gap:4 }}>
            <div style={{ width:8, height:8, borderRadius:"50%", background:color }}/>
            <span style={{ fontFamily:st.ui, fontSize:9, color:st.muted, fontWeight:600 }}>{label}</span>
          </div>
        ))}
      </div>
    </div>
  );
};

// ─── 12 TRIBES MAP ───
const TribesMap = ({ onSelectLocation, selectedLocation }) => {
  const tribes = [
    { id:"dan_north", x:42, y:18, label:"Dan", color:"#E8625C", scripture:"Joshua 19:40-48" },
    { id:"naphtali", x:52, y:22, label:"Naphtali", color:"#1B7A6E", scripture:"Joshua 19:32-39" },
    { id:"asher", x:38, y:26, label:"Asher", color:"#D4A853", scripture:"Joshua 19:24-31" },
    { id:"zebulun", x:50, y:32, label:"Zebulun", color:"#8B5CF6", scripture:"Joshua 19:10-16" },
    { id:"issachar", x:54, y:40, label:"Issachar", color:"#C06C3E", scripture:"Joshua 19:17-23" },
    { id:"manasseh_w", x:40, y:42, label:"Manasseh", color:"#2E4A33", scripture:"Joshua 17:1-13" },
    { id:"ephraim", x:42, y:54, label:"Ephraim", color:"#6BAE75", scripture:"Joshua 16:5-10" },
    { id:"dan_south", x:34, y:62, label:"Dan", color:"#E8625C", scripture:"Joshua 19:40-48" },
    { id:"benjamin", x:46, y:62, label:"Benjamin", color:"#B8860B", scripture:"Joshua 18:11-28" },
    { id:"judah", x:42, y:72, label:"Judah", color:"#7A6B8A", scripture:"Joshua 15:1-63" },
    { id:"simeon", x:42, y:84, label:"Simeon", color:"#E8A87C", scripture:"Joshua 19:1-9" },
    { id:"reuben", x:58, y:68, label:"Reuben", color:"#5A8A82", scripture:"Joshua 13:15-23" },
    { id:"gad", x:60, y:52, label:"Gad", color:"#9B8BA8", scripture:"Joshua 13:24-28" },
    { id:"manasseh_e", x:62, y:36, label:"Manasseh (E)", color:"#2E4A33", scripture:"Joshua 13:29-31" },
  ];

  return (
    <div style={{ position:"relative", width:"100%", borderRadius:16, overflow:"hidden", background:"#EDF5E8", border:`1px solid #2E4A3333` }}>
      <svg viewBox="0 0 100 110" style={{ width:"100%", display:"block" }}>
        {/* Mediterranean */}
        <rect x="0" y="0" width="30" height="110" fill="#A8D4E8" opacity="0.6"/>
        <text x="2" y="55" fill="#1A4A6B" fontSize="3.5" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.7" transform="rotate(-90,2,55)">MEDITERRANEAN SEA</text>

        {/* Jordan River */}
        <path d="M55,15 C57,30 54,45 56,60 C58,75 55,90 54,105" fill="none" stroke="#A8D4E8" strokeWidth="2" opacity="0.8"/>
        <text x="57" y="50" fill="#1A4A6B" fontSize="2.5" fontFamily="'Nunito',sans-serif" opacity="0.8" transform="rotate(5,57,50)">Jordan</text>

        {/* Dead Sea */}
        <ellipse cx="53" cy="70" rx="4" ry="7" fill="#7EB8D4" opacity="0.6"/>
        <text x="55" y="70" fill="#1A4A6B" fontSize="2" fontFamily="'Nunito',sans-serif" opacity="0.8">Dead Sea</text>

        {/* Sea of Galilee */}
        <ellipse cx="54" cy="28" rx="3" ry="4" fill="#7EB8D4" opacity="0.6"/>

        {/* Tribe territories as colored regions */}
        {tribes.map(tribe => (
          <g key={tribe.id} onClick={() => onSelectLocation(tribe)} style={{ cursor:"pointer" }}>
            <circle
              cx={tribe.x} cy={tribe.y} r={selectedLocation?.id === tribe.id ? 6 : 5}
              fill={tribe.color}
              stroke="#fff"
              strokeWidth="1"
              opacity="0.85"
            />
            {selectedLocation?.id === tribe.id && (
              <circle cx={tribe.x} cy={tribe.y} r="8" fill="none" stroke={tribe.color} strokeWidth="0.8" opacity="0.5"/>
            )}
            <text
              x={tribe.x}
              y={tribe.y + 0.8}
              fill="#fff"
              fontSize="2.8"
              fontFamily="'Nunito',sans-serif"
              fontWeight="800"
              textAnchor="middle"
              dominantBaseline="middle"
            >{tribe.label}</text>
          </g>
        ))}

        {/* Compass */}
        <text x="88" y="8" fill="#4A3B2D" fontSize="5" opacity="0.6">N</text>
        <line x1="90" y1="9" x2="90" y2="16" stroke="#4A3B2D" strokeWidth="0.8" opacity="0.5"/>
      </svg>

      <div style={{ padding:"10px 14px", background:"rgba(255,255,255,0.85)", borderTop:`1px solid #2E4A3322` }}>
        <div style={{ fontFamily:st.ui, fontSize:10, color:st.muted, fontWeight:700, textAlign:"center" }}>
          Tap any tribe to see its territory and scripture reference
        </div>
      </div>
    </div>
  );
};

// ─── PAUL'S JOURNEYS MAP ───
const PaulMap = ({ onSelectLocation, selectedLocation }) => {
  const journey1Color = "#E8625C";
  const journey2Color = "#1B7A6E";
  const journey3Color = "#8B5CF6";

  const cities = [
    { id:"antioch", x:65, y:30, label:"Antioch", scripture:"Acts 13:1-3", journey:[1,2,3] },
    { id:"cyprus", x:55, y:38, label:"Cyprus", scripture:"Acts 13:4-12", journey:[1] },
    { id:"perga", x:58, y:34, label:"Perga", scripture:"Acts 13:13", journey:[1,2] },
    { id:"iconium", x:62, y:28, label:"Iconium", scripture:"Acts 14:1-7", journey:[1,2] },
    { id:"lystra", x:60, y:30, label:"Lystra", scripture:"Acts 14:8-20", journey:[1,2] },
    { id:"philippi", x:36, y:22, label:"Philippi", scripture:"Acts 16:12-40", journey:[2,3] },
    { id:"thessalonica", x:38, y:24, label:"Thessalonica", scripture:"Acts 17:1-9", journey:[2,3] },
    { id:"athens", x:38, y:32, label:"Athens", scripture:"Acts 17:15-34", journey:[2] },
    { id:"corinth", x:36, y:34, label:"Corinth", scripture:"Acts 18:1-18", journey:[2,3] },
    { id:"ephesus", x:50, y:30, label:"Ephesus", scripture:"Acts 19:1-41", journey:[3] },
    { id:"rome", x:18, y:22, label:"Rome", scripture:"Acts 28:14-31", journey:[3] },
    { id:"jerusalem", x:64, y:42, label:"Jerusalem", scripture:"Acts 21:17", journey:[1,2,3] },
  ];

  return (
    <div style={{ position:"relative", width:"100%", borderRadius:16, overflow:"hidden", background:"#E8F4F8", border:`1px solid #1B7A6E33` }}>
      <svg viewBox="0 0 100 70" style={{ width:"100%", display:"block" }}>
        {/* Mediterranean Sea */}
        <rect x="0" y="0" width="100" height="70" fill="#A8D4E8" opacity="0.4"/>
        <text x="20" y="55" fill="#1A4A6B" fontSize="4" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.5">MEDITERRANEAN SEA</text>

        {/* Land masses */}
        {/* Italy */}
        <polygon points="18,10 25,8 28,20 25,35 20,38 15,30 14,18" fill="#D4C8A8" opacity="0.8"/>
        <text x="17" y="22" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.8">Italy</text>

        {/* Greece */}
        <polygon points="35,15 45,12 48,22 44,35 38,36 33,28 32,20" fill="#D4C8A8" opacity="0.8"/>
        <text x="36" y="22" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.8">Greece</text>

        {/* Asia Minor */}
        <polygon points="48,10 80,8 82,30 75,38 55,40 48,32" fill="#D4C8A8" opacity="0.8"/>
        <text x="60" y="22" fill="#4A3B2D" fontSize="3.5" fontFamily="'DM Serif Display',serif" opacity="0.8">Asia Minor</text>

        {/* Syria/Palestine */}
        <polygon points="62,28 78,28 80,50 65,52 60,42" fill="#D4C8A8" opacity="0.8"/>
        <text x="65" y="38" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.8">Syria</text>

        {/* Cyprus */}
        <ellipse cx="55" cy="38" rx="5" ry="2.5" fill="#C8BC98" opacity="0.8"/>

        {/* Journey 1 route */}
        <polyline points="65,30 55,38 58,34 60,30 62,28 64,42 65,30" fill="none" stroke={journey1Color} strokeWidth="1.2" strokeDasharray="3,2" opacity="0.8"/>

        {/* Journey 2 route */}
        <polyline points="65,30 62,28 60,30 38,24 36,34 38,32 65,30" fill="none" stroke={journey2Color} strokeWidth="1.2" strokeDasharray="2,2" opacity="0.8"/>

        {/* Journey 3 route */}
        <polyline points="65,30 50,30 36,34 18,22 36,34 64,42 65,30" fill="none" stroke={journey3Color} strokeWidth="1.2" strokeDasharray="4,2" opacity="0.8"/>

        {/* Cities */}
        {cities.map(city => (
          <g key={city.id} onClick={() => onSelectLocation(city)} style={{ cursor:"pointer" }}>
            <circle
              cx={city.x} cy={city.y}
              r={selectedLocation?.id === city.id ? 3.5 : 2.5}
              fill={city.journey.length > 1 ? "#D4A853" : city.journey[0] === 1 ? journey1Color : city.journey[0] === 2 ? journey2Color : journey3Color}
              stroke="#fff"
              strokeWidth="0.8"
            />
            {selectedLocation?.id === city.id && (
              <circle cx={city.x} cy={city.y} r="5" fill="none" stroke="#D4A853" strokeWidth="0.8" opacity="0.6"/>
            )}
            <text x={city.x} y={city.y - 4} fill="#2D1B4E" fontSize="2.5" fontFamily="'Nunito',sans-serif" fontWeight="700" textAnchor="middle" opacity="0.9">{city.label}</text>
          </g>
        ))}

        {/* Compass */}
        <text x="92" y="8" fill="#4A3B2D" fontSize="5" opacity="0.6">N</text>
        <line x1="94" y1="9" x2="94" y2="16" stroke="#4A3B2D" strokeWidth="0.8" opacity="0.5"/>
      </svg>

      {/* Journey legend */}
      <div style={{ padding:"10px 14px", background:"rgba(255,255,255,0.85)", borderTop:`1px solid #1B7A6E22`, display:"flex", gap:14, justifyContent:"center", flexWrap:"wrap" }}>
        {[["1st Journey","#E8625C","Acts 13–14"],["2nd Journey","#1B7A6E","Acts 15–18"],["3rd Journey","#8B5CF6","Acts 18–21"]].map(([label,color,ref]) => (
          <div key={label} style={{ display:"flex", alignItems:"center", gap:5 }}>
            <div style={{ width:20, height:2.5, background:color, borderRadius:2 }}/>
            <div>
              <div style={{ fontFamily:st.ui, fontSize:9, color:st.dark, fontWeight:700 }}>{label}</div>
              <div style={{ fontFamily:st.ui, fontSize:8, color:st.muted }}>{ref}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

// ─── ROMAN EMPIRE MAP ───
const RomanMap = ({ onSelectLocation, selectedLocation }) => {
  const locations = [
    { id:"rome", x:28, y:22, label:"Rome", type:"capital", scripture:"Romans 1:7", desc:"Capital of the Empire" },
    { id:"jerusalem", x:64, y:40, label:"Jerusalem", type:"holy", scripture:"Luke 2:22", desc:"Where Jesus ministered and died" },
    { id:"bethlehem", x:64, y:42, label:"Bethlehem", type:"holy", scripture:"Luke 2:4", desc:"Birthplace of Jesus" },
    { id:"nazareth", x:63, y:36, label:"Nazareth", type:"holy", scripture:"Luke 2:39", desc:"Where Jesus grew up" },
    { id:"antioch", x:65, y:28, label:"Antioch", type:"church", scripture:"Acts 11:26", desc:"First called Christians" },
    { id:"alexandria", x:58, y:46, label:"Alexandria", type:"city", scripture:"Acts 18:24", desc:"Major centre of learning" },
    { id:"corinth", x:36, y:30, label:"Corinth", type:"church", scripture:"Acts 18:1", desc:"Paul planted a church here" },
    { id:"ephesus", x:50, y:28, label:"Ephesus", type:"church", scripture:"Acts 19:1", desc:"Major city of Asia Minor" },
    { id:"athens", x:38, y:30, label:"Athens", type:"city", scripture:"Acts 17:15", desc:"Centre of Greek philosophy" },
    { id:"caesarea", x:63, y:38, label:"Caesarea", type:"city", scripture:"Acts 10:1", desc:"Roman administrative capital" },
  ];

  const typeColors = { capital:"#D4A853", holy:"#E8625C", church:"#1B7A6E", city:"#8B5CF6" };

  return (
    <div style={{ position:"relative", width:"100%", borderRadius:16, overflow:"hidden", background:"#EDE8F5", border:`1px solid #8B5CF633` }}>
      <svg viewBox="0 0 100 65" style={{ width:"100%", display:"block" }}>
        {/* Sea */}
        <rect x="0" y="0" width="100" height="65" fill="#A8D4E8" opacity="0.35"/>
        <text x="15" y="50" fill="#1A4A6B" fontSize="4" fontFamily="'Nunito',sans-serif" fontWeight="700" opacity="0.4">MEDITERRANEAN SEA</text>

        {/* Roman Empire outline — simplified */}
        {/* Western Europe */}
        <polygon points="10,5 40,5 42,15 38,25 30,35 20,38 10,30 8,15" fill="#D4C8B8" opacity="0.75"/>
        {/* North Africa */}
        <polygon points="10,42 65,42 68,55 10,55" fill="#D4BA90" opacity="0.75"/>
        {/* Middle East */}
        <polygon points="60,20 85,18 88,45 65,48 58,40 55,28" fill="#D4C8B8" opacity="0.75"/>
        {/* Asia Minor & Greece */}
        <polygon points="32,12 65,10 68,28 55,32 45,35 30,30 28,20" fill="#D4C8B8" opacity="0.75"/>

        {/* Region labels */}
        <text x="14" y="18" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">GAUL</text>
        <text x="22" y="28" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">ITALY</text>
        <text x="38" y="22" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">GREECE</text>
        <text x="55" y="22" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">ASIA MINOR</text>
        <text x="25" y="50" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">NORTH AFRICA</text>
        <text x="65" y="32" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">SYRIA</text>
        <text x="62" y="46" fill="#4A3B2D" fontSize="3" fontFamily="'DM Serif Display',serif" opacity="0.7">JUDEA</text>

        {/* Roman roads hint */}
        <line x1="28" y1="22" x2="65" y2="28" stroke="#B8A888" strokeWidth="0.5" strokeDasharray="2,2" opacity="0.5"/>
        <line x1="28" y1="22" x2="38" y2="30" stroke="#B8A888" strokeWidth="0.5" strokeDasharray="2,2" opacity="0.5"/>

        {/* Locations */}
        {locations.map(loc => (
          <g key={loc.id} onClick={() => onSelectLocation(loc)} style={{ cursor:"pointer" }}>
            <circle
              cx={loc.x} cy={loc.y}
              r={selectedLocation?.id === loc.id ? 3.5 : 2.5}
              fill={typeColors[loc.type]}
              stroke="#fff"
              strokeWidth="0.8"
            />
            {selectedLocation?.id === loc.id && (
              <circle cx={loc.x} cy={loc.y} r="5.5" fill="none" stroke={typeColors[loc.type]} strokeWidth="0.8" opacity="0.5"/>
            )}
            <text x={loc.x} y={loc.y - 3.5} fill="#2D1B4E" fontSize="2.5" fontFamily="'Nunito',sans-serif" fontWeight="700" textAnchor="middle" opacity="0.9">{loc.label}</text>
          </g>
        ))}

        {/* Compass */}
        <text x="92" y="8" fill="#4A3B2D" fontSize="5" opacity="0.6">N</text>
        <line x1="94" y1="9" x2="94" y2="16" stroke="#4A3B2D" strokeWidth="0.8" opacity="0.5"/>
      </svg>

      <div style={{ padding:"10px 14px", background:"rgba(255,255,255,0.85)", borderTop:`1px solid #8B5CF622`, display:"flex", flexWrap:"wrap", gap:8, justifyContent:"center" }}>
        {Object.entries({ "Capital":"#D4A853", "Holy Site":"#E8625C", "Church":"#1B7A6E", "City":"#8B5CF6" }).map(([label, color]) => (
          <div key={label} style={{ display:"flex", alignItems:"center", gap:4 }}>
            <div style={{ width:8, height:8, borderRadius:"50%", background:color }}/>
            <span style={{ fontFamily:st.ui, fontSize:9, color:st.muted, fontWeight:600 }}>{label}</span>
          </div>
        ))}
      </div>
    </div>
  );
};

// ─── LOCATION DETAILS ───
const LOCATION_DETAILS = {
  // Exodus
  rameses: { title:"Rameses (Goshen)", body:"The Israelites lived and laboured in the region of Goshen, in the city of Rameses. This was their starting point after 430 years in Egypt. The pharaoh who refused Moses is believed by many scholars to be Ramesses II.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth, about six hundred thousand on foot that were men, beside children.'" },
  succoth: { title:"Succoth", body:"The first campsite after leaving Egypt, meaning 'booths' or 'shelters.' Around 600,000 men plus women and children — perhaps 2 million people — began their march to freedom here.", scripture:"Exodus 12:37 — 'And the children of Israel journeyed from Rameses to Succoth...'" },
  etham: { title:"Etham", body:"On the edge of the wilderness, the Israelites camped at Etham. It was here that God first appeared as a pillar of cloud by day and a pillar of fire by night — leading every step of the journey.", scripture:"Exodus 13:20-21 — 'And the LORD went before them by day in a pillar of a cloud...'" },
  pihahiroth: { title:"Pi-hahiroth", body:"Trapped between the sea and Pharaoh's pursuing army, Israel cried out in fear. But Moses declared: 'Fear ye not, stand still, and see the salvation of the LORD.' This was the moment before the greatest miracle of the Old Testament.", scripture:"Exodus 14:2 — 'Speak unto the children of Israel, that they turn and encamp before Pi-hahiroth...'" },
  redsea: { title:"The Red Sea Crossing", body:"God commanded Moses to stretch out his rod, and the sea parted — creating walls of water on both sides. Israel crossed on dry ground. When Pharaoh's army pursued, the waters returned and swallowed them whole. This single miracle defined Israel's identity for generations.", scripture:"Exodus 14:21-22 — 'And Moses stretched out his hand over the sea... and the children of Israel went into the midst of the sea upon the dry ground.'" },
  marah: { title:"Marah — The Bitter Waters", body:"After the triumph of the Red Sea, Israel faced bitter, undrinkable water. God showed Moses a tree — when cast into the water, it became sweet. A picture of the cross transforming bitterness into blessing.", scripture:"Exodus 15:23 — 'And when they came to Marah, they could not drink of the waters of Marah; for they were bitter.'" },
  elim: { title:"Elim — The Oasis", body:"After Marah's bitterness came Elim's abundance: twelve wells of water and seventy palm trees. God always has an oasis after the wilderness. The twelve wells matched the twelve tribes; the seventy palms, the seventy elders.", scripture:"Exodus 15:27 — 'And they came to Elim, where were twelve wells of water, and threescore and ten palm trees.'" },
  sinai: { title:"Mount Sinai — The Law Given", body:"The most significant campsite of the entire Exodus. Here God descended in fire and thunder, and gave Moses the Ten Commandments. The covenant between God and Israel was sealed at this mountain. Also called Horeb — the mountain of God.", scripture:"Exodus 19:2-3 — 'There Israel camped before the mount. And Moses went up unto God, and the LORD called unto him out of the mountain.'" },
  kadesh: { title:"Kadesh Barnea — The Turning Point", body:"From Kadesh, twelve spies were sent into Canaan. Ten returned with a fearful report; only Joshua and Caleb trusted God. Because of their unbelief, Israel was sentenced to 40 years of wilderness wandering — one year for each day the spies were in the land.", scripture:"Numbers 13:26 — 'And they... came to Moses, and to Aaron, and to all the congregation... and shewed them the fruit of the land.'" },
  canaan: { title:"Canaan — The Promised Land", body:"The destination of the entire Exodus. God had promised this land to Abraham, Isaac, and Jacob — and now, 40 years after leaving Egypt, Joshua led the people across the Jordan into their inheritance. The land flowing with milk and honey.", scripture:"Joshua 1:2 — 'Moses my servant is dead; now therefore arise, go over this Jordan, thou, and all this people, unto the land which I do give to them.'" },

  // Tribes
  dan_north: { title:"Tribe of Dan (North)", body:"Dan eventually migrated north after struggling to hold their original southern territory. The city of Dan, at the foot of Mount Hermon, became one of Jeroboam's golden calf worship sites.", scripture:"Joshua 19:40-48" },
  naphtali: { title:"Tribe of Naphtali", body:"Naphtali received fertile territory around the Sea of Galilee. Jesus spent much of His ministry in this region — fulfilling Isaiah 9:1 about the land of Naphtali seeing a great light.", scripture:"Joshua 19:32-39; Isaiah 9:1; Matthew 4:13-16" },
  asher: { title:"Tribe of Asher", body:"Asher received the fertile coastal strip of northern Canaan. Moses blessed Asher: 'Let him dip his foot in oil' — a promise of agricultural abundance. The prophetess Anna who saw the infant Jesus was from the tribe of Asher.", scripture:"Joshua 19:24-31; Luke 2:36" },
  zebulun: { title:"Tribe of Zebulun", body:"Zebulun was landlocked between the Sea of Galilee and the Mediterranean. Nazareth, where Jesus grew up, was in the territory of Zebulun — fulfilling Isaiah's prophecy about the land of Zebulun.", scripture:"Joshua 19:10-16; Matthew 4:13" },
  issachar: { title:"Tribe of Issachar", body:"Issachar received the fertile Jezreel Valley — one of the most productive agricultural regions in Canaan. The men of Issachar were known for 'understanding the times' — wisdom about what Israel ought to do.", scripture:"Joshua 19:17-23; 1 Chronicles 12:32" },
  manasseh_w: { title:"Tribe of Manasseh (West)", body:"The half-tribe of Manasseh received a large territory west of the Jordan. Manasseh was the firstborn son of Joseph — yet Jacob crossed his hands and blessed Ephraim first, the younger brother.", scripture:"Joshua 17:1-13" },
  ephraim: { title:"Tribe of Ephraim", body:"Ephraim, the younger son of Joseph, received a prominent central position and became one of the most influential tribes. Joshua himself was from Ephraim. The territory included Shiloh, where the Tabernacle rested for many years.", scripture:"Joshua 16:5-10" },
  dan_south: { title:"Tribe of Dan (Original)", body:"Dan's original allotment was in the southwest, near Philistine territory. Samson, the great judge, was from Dan. But constant Philistine pressure caused much of the tribe to migrate north.", scripture:"Joshua 19:40-48; Judges 13:2" },
  benjamin: { title:"Tribe of Benjamin", body:"Benjamin's small but strategic territory sat between Judah and Ephraim, containing Jerusalem on its border. King Saul was a Benjamite. The apostle Paul was also from the tribe of Benjamin.", scripture:"Joshua 18:11-28; Philippians 3:5" },
  judah: { title:"Tribe of Judah", body:"Judah received the largest territory in the south and became the royal tribe. David was from Judah. The Messiah was to come through Judah — and Jesus, the Lion of the tribe of Judah, fulfilled this. Jerusalem was in Judah's territory.", scripture:"Joshua 15:1-63; Genesis 49:10; Revelation 5:5" },
  simeon: { title:"Tribe of Simeon", body:"Simeon received territory within Judah's allotment — a fulfilment of Jacob's prophecy that Simeon would be scattered in Israel. Over time, Simeon was largely absorbed into Judah.", scripture:"Joshua 19:1-9; Genesis 49:7" },
  reuben: { title:"Tribe of Reuben", body:"Reuben, the firstborn of Jacob, chose land east of the Jordan — the plains of Moab. Despite being firstborn, Reuben lost his preeminence due to sin. His tribe settled east of the Jordan and was among the first carried into exile.", scripture:"Joshua 13:15-23; 1 Chronicles 5:1" },
  gad: { title:"Tribe of Gad", body:"Gad settled in the fertile region of Gilead east of the Jordan. The Gadites were known as mighty warriors — 'men of war fit for battle, that could handle shield and buckler.' Elijah the prophet was from Gilead.", scripture:"Joshua 13:24-28; 1 Chronicles 12:8" },
  manasseh_e: { title:"Tribe of Manasseh (East)", body:"The eastern half of Manasseh settled in Bashan, north of Gad, east of the Jordan. This region included the fertile highlands of Gilead. Like Reuben and Gad, the eastern Manassites were among the first tribes exiled by Assyria.", scripture:"Joshua 13:29-31; 2 Kings 15:29" },

  // Paul's cities
  antioch: { title:"Antioch — The Sending Church", body:"Antioch of Syria was the launching pad of all three of Paul's missionary journeys. It was here that believers were first called 'Christians.' The Holy Spirit said: 'Separate me Barnabas and Saul for the work whereunto I have called them.'", scripture:"Acts 13:1-3 — 'As they ministered to the Lord, and fasted, the Holy Ghost said, Separate me Barnabas and Saul...'" },
  cyprus: { title:"Cyprus — First Stop", body:"Paul's first journey began on the island of Cyprus, homeland of Barnabas. Here the Roman proconsul Sergius Paulus became a believer — the first recorded Roman official to convert — after Paul struck the sorcerer Elymas with blindness.", scripture:"Acts 13:4-12 — 'Then the deputy, when he saw what was done, believed, being astonished at the doctrine of the Lord.'" },
  philippi: { title:"Philippi — First Church in Europe", body:"At Philippi, Paul received the Macedonian call — a vision of a man saying 'Come over into Macedonia and help us.' The first European convert was Lydia, a seller of purple. Paul and Silas were imprisoned and sang hymns at midnight — until an earthquake opened every door.", scripture:"Acts 16:12-40 — 'And at midnight Paul and Silas prayed, and sang praises unto God...'" },
  thessalonica: { title:"Thessalonica", body:"Paul preached here for three Sabbaths and many believed, but a riot drove him out. He later wrote two letters to this church — 1 and 2 Thessalonians — which contain some of the Bible's clearest teaching on the return of Christ.", scripture:"Acts 17:1-9 — 'These that have turned the world upside down are come hither also.'" },
  athens: { title:"Athens — Mars Hill", body:"At Athens, Paul stood on the Areopagus and delivered one of the most remarkable sermons in Scripture — beginning with their altar 'To the Unknown God' and ending with the resurrection of Christ. A philosophical city met the gospel.", scripture:"Acts 17:22-23 — 'Ye men of Athens, I perceive that in all things ye are too superstitious... I found an altar with this inscription, TO THE UNKNOWN GOD.'" },
  corinth: { title:"Corinth", body:"Paul spent 18 months in Corinth — longer than almost any other city. He worked as a tentmaker with Priscilla and Aquila. He wrote Romans from Corinth. The church here received two of Paul's most important letters.", scripture:"Acts 18:1-18 — 'And he continued there a year and six months, teaching the word of God among them.'" },
  ephesus: { title:"Ephesus — Three Years", body:"Paul spent more time in Ephesus than any other city — nearly three years. The church here became a hub for all of Asia Minor. 'All they which dwelt in Asia heard the word of the Lord Jesus.' Home of the great temple of Artemis, one of the seven wonders of the ancient world.", scripture:"Acts 19:10 — 'This continued by the space of two years; so that all they which dwelt in Asia heard the word of the Lord.'" },
  rome: { title:"Rome — The End and the Beginning", body:"Paul arrived in Rome as a prisoner — yet he was allowed his own rented house where he preached freely for two years. The gospel had reached the capital of the empire. Tradition holds Paul was martyred here under Nero.", scripture:"Acts 28:30-31 — 'Paul dwelt two whole years in his own hired house... preaching the kingdom of God... with all confidence, no man forbidding him.'" },
  jerusalem: { title:"Jerusalem — The Heart of it All", body:"Every journey ended with Paul returning to Jerusalem — to report to the apostles and to remain connected to the Jewish roots of the gospel. His final visit led to his arrest and ultimately to Rome.", scripture:"Acts 21:17 — 'And when we were come to Jerusalem, the brethren received us gladly.'" },
  iconium: { title:"Iconium", body:"Paul and Barnabas preached boldly in Iconium, and 'a great multitude both of the Jews and also of the Greeks believed.' But opposition arose and they fled when a plot to stone them was discovered.", scripture:"Acts 14:1-7 — 'Long time therefore abode they speaking boldly in the Lord...'" },
  lystra: { title:"Lystra — Where Paul Was Stoned", body:"At Lystra, Paul healed a man lame from birth — and the crowd tried to worship Paul and Barnabas as gods. Then Jews from Antioch stirred up the crowd and Paul was stoned and dragged out of the city, left for dead. He rose up and went back in.", scripture:"Acts 14:8-20 — 'And there came thither certain Jews from Antioch... who, having stoned Paul, drew him out of the city, supposing he had been dead.'" },
  perga: { title:"Perga", body:"Perga was where John Mark departed from the first missionary journey and returned to Jerusalem — a decision Paul later felt strongly about, leading to a sharp disagreement with Barnabas on the second journey.", scripture:"Acts 13:13 — 'Now when Paul and his company loosed from Paphos, they came to Perga in Pamphylia: and John departing from them returned to Jerusalem.'" },
  caesarea: { title:"Caesarea Maritima", body:"The Roman administrative capital of Judea. Philip the evangelist lived here. It was here that Cornelius, the first Gentile convert, received the Holy Spirit. Paul was imprisoned here for two years before his voyage to Rome.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },

  // Roman Empire
  rome_re: { title:"Rome — Caput Mundi", body:"The capital of the empire — 'head of the world.' In Paul's day, Rome had perhaps one million inhabitants. The church at Rome received Paul's greatest theological letter. Tradition holds that both Peter and Paul were martyred here.", scripture:"Romans 1:7 — 'To all that be in Rome, beloved of God, called to be saints.'" },
  jerusalem_re: { title:"Jerusalem — The Holy City", body:"Under Roman rule since 63 BC, Jerusalem was the spiritual heart of Judaism and the site of Christ's crucifixion and resurrection. In AD 70, Roman general Titus destroyed the city and the Temple — fulfilling Jesus' prophecy in Matthew 24.", scripture:"Luke 21:24 — 'Jerusalem shall be trodden down of the Gentiles, until the times of the Gentiles be fulfilled.'" },
  bethlehem: { title:"Bethlehem — City of David", body:"'But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel' — Micah prophesied 700 years before Jesus was born here. Joseph and Mary came to Bethlehem for the Roman census.", scripture:"Luke 2:4-7 — 'And Joseph also went up from Galilee... unto the city of David, which is called Bethlehem.'" },
  nazareth: { title:"Nazareth — Where Jesus Grew Up", body:"A small, unremarkable town in Galilee — prompting Nathanael's question: 'Can any good thing come out of Nazareth?' Yet this was the town where the Son of God spent 30 of His 33 years on earth, growing in wisdom and stature.", scripture:"Luke 2:51-52 — 'And he went down with them, and came to Nazareth, and was subject unto them... And Jesus increased in wisdom and stature.'" },
  antioch_re: { title:"Antioch — Where Christianity Spread", body:"The third largest city in the Roman Empire after Rome and Alexandria. Here Gentiles first received the gospel in large numbers. The disciples were first called 'Christians' here. Antioch replaced Jerusalem as the centre of the expanding church.", scripture:"Acts 11:26 — 'And the disciples were called Christians first in Antioch.'" },
  alexandria: { title:"Alexandria — City of Learning", body:"Founded by Alexander the Great, Alexandria was the intellectual capital of the ancient world. Its great library housed hundreds of thousands of scrolls. The Septuagint — the Greek Old Testament used by the apostles — was translated here. Apollos, the eloquent teacher, came from Alexandria.", scripture:"Acts 18:24 — 'And a certain Jew named Apollos, born at Alexandria, an eloquent man, and mighty in the scriptures, came to Ephesus.'" },
  corinth_re: { title:"Corinth", body:"A major commercial city at the crossroads between east and west. Destroyed by Rome in 146 BC and rebuilt as a Roman colony in 44 BC. Paul spent 18 months here and wrote Romans from this city.", scripture:"Acts 18:1 — 'After these things Paul departed from Athens, and came to Corinth.'" },
  ephesus_re: { title:"Ephesus", body:"One of the largest cities in the Roman Empire with perhaps 250,000 inhabitants. Home to the Temple of Artemis, one of the Seven Wonders of the Ancient World. Paul spent nearly three years here and the church became a hub for all of Asia Minor.", scripture:"Revelation 2:1 — 'Unto the angel of the church of Ephesus write...'" },
  athens_re: { title:"Athens", body:"The philosophical capital of the ancient world — home to Plato, Aristotle, and the great philosophical schools. By Paul's day it was a university town living on its former glory. Yet here Paul preached the resurrection on Mars Hill.", scripture:"Acts 17:16 — 'Now while Paul waited for them at Athens, his spirit was stirred in him, when he saw the city wholly given to idolatry.'" },
  caesarea_re: { title:"Caesarea Maritima", body:"Built by Herod the Great to honour Caesar Augustus. A magnificent Roman city with a man-made harbour, a theatre, an amphitheatre, and a hippodrome. The Roman governor Pontius Pilate lived here — not in Jerusalem.", scripture:"Acts 10:1 — 'There was a certain man in Caesarea called Cornelius, a centurion of the band called the Italian band.'" },
};

// ─── MAIN COMPONENT ───
export default function TimelineMaps({ nav }) {
  const [selectedMap, setSelectedMap] = useState(null);
  const [selectedLocation, setSelectedLocation] = useState(null);

  const handleSelectLocation = (loc) => {
    setSelectedLocation(prev => prev?.id === loc.id ? null : loc);
  };

  const locationDetail = selectedLocation ? LOCATION_DETAILS[selectedLocation.id] : null;

  // Map gallery view
  if (!selectedMap) {
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        {/* Header */}
        <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
          <div style={{ display:"flex", alignItems:"center", gap:10 }}>
            <button onClick={() => nav("timeline-home")} style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
            </button>
            <div>
              <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>Historical Maps</h2>
              <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>The world of the Bible</div>
            </div>
          </div>
        </div>

        <div style={{ padding:"20px 16px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Hero */}
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

          {/* Map cards */}
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

          {/* Scripture */}
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

  // Individual map view
  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
      {/* Header */}
      <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <button onClick={() => { setSelectedMap(null); setSelectedLocation(null); }} style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <div>
            <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>{selectedMap.title}</h2>
            <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>{selectedMap.era}</div>
          </div>
        </div>
      </div>

      <div style={{ padding:"16px 16px 40px", maxWidth:520, margin:"0 auto" }}>

        {/* Map subtitle */}
        <div style={{ fontFamily:st.body, fontSize:13.5, color:st.muted, fontStyle:"italic", lineHeight:1.6, marginBottom:14, textAlign:"center" }}>
          {selectedMap.subtitle} — tap any location to learn more
        </div>

        {/* The map */}
        {selectedMap.id === "exodus" && <ExodusMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "tribes" && <TribesMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "paul" && <PaulMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}
        {selectedMap.id === "roman" && <RomanMap onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />}

        {/* Location detail panel */}
        {selectedLocation && locationDetail && (
          <div style={{ marginTop:14, background:st.card, borderRadius:16, border:`1px solid ${selectedMap.color}44`, borderLeft:`4px solid ${selectedMap.color}`, overflow:"hidden", animation:"fadeIn 0.25s ease" }}>
            <div style={{ padding:"14px 16px 12px", background:`${selectedMap.color}0D` }}>
              <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                <div style={{ fontFamily:st.heading, fontSize:17, fontWeight:700, color:st.dark, flex:1 }}>{locationDetail.title}</div>
                <button onClick={() => setSelectedLocation(null)} style={{ background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:18, padding:"0 0 0 10px", flexShrink:0 }}>✕</button>
              </div>
            </div>
            <div style={{ padding:"12px 16px 16px" }}>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.8, marginBottom:12 }}>{locationDetail.body}</div>
              <div style={{ background:`${selectedMap.color}0D`, borderRadius:10, padding:"10px 13px", borderLeft:`3px solid ${selectedMap.color}` }}>
                <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:selectedMap.color, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:4 }}>📖 Scripture</div>
                <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7, fontStyle:"italic" }}>{locationDetail.scripture}</div>
              </div>
            </div>
          </div>
        )}

        {/* No location selected prompt */}
        {!selectedLocation && (
          <div style={{ marginTop:14, textAlign:"center", padding:"16px", background:st.card, borderRadius:12, border:`1px solid ${st.divider}` }}>
            <div style={{ fontFamily:st.ui, fontSize:12, color:st.muted }}>
              👆 Tap any dot on the map to read about that location
            </div>
          </div>
        )}

        {/* Prev / Next map navigation */}
        {(() => {
          const idx = MAPS.findIndex(m => m.id === selectedMap.id);
          const prev = idx > 0 ? MAPS[idx - 1] : null;
          const next = idx < MAPS.length - 1 ? MAPS[idx + 1] : null;
          return (
            <div style={{ display:"flex", gap:10, marginTop:20, borderTop:`1px solid ${st.divider}`, paddingTop:16 }}>
              {prev ? (
                <div onClick={() => { setSelectedMap(prev); setSelectedLocation(null); }}
                  style={{ flex:1, background:st.card, border:`1px solid ${prev.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", borderLeft:`4px solid ${prev.color}` }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>← Previous</div>
                  <div style={{ fontSize:18, marginBottom:2 }}>{prev.icon}</div>
                  <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{prev.title}</div>
                </div>
              ) : <div style={{ flex:1 }} />}
              {next ? (
                <div onClick={() => { setSelectedMap(next); setSelectedLocation(null); }}
                  style={{ flex:1, background:st.card, border:`1px solid ${next.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", textAlign:"right", borderRight:`4px solid ${next.color}` }}>
                  <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>Next →</div>
                  <div style={{ fontSize:18, marginBottom:2 }}>{next.icon}</div>
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