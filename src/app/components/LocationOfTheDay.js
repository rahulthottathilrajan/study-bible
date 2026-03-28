"use client";
import { useState, useEffect } from "react";

// ─── ALL LOCATIONS ACROSS 15 MAPS ─────────────────
// Built from the DETAILS exports — each location gets map context
import { EDEN_DETAILS } from "./maps/EdenMap";
import { ABRAHAM_DETAILS } from "./maps/AbrahamMap";
import { EXODUS_DETAILS } from "./maps/ExodusMap";
import { CONQUEST_DETAILS } from "./maps/ConquestMap";
import { TRIBES_DETAILS } from "./maps/TribesMap";
import { DAVID_DETAILS } from "./maps/DavidKingdomMap";
import { DIVIDED_DETAILS } from "./maps/DividedKingdomMap";
import { ASSYRIAN_DETAILS } from "./maps/AssyrianExileMap";
import { BABYLONIAN_DETAILS } from "./maps/BabylonianExileMap";
import { RETURN_DETAILS } from "./maps/ReturnExileMap";
import { JESUS_DETAILS } from "./maps/JesusLifeMap";
import { JERUSALEM_DETAILS } from "./maps/JerusalemMap";
import { PAUL_DETAILS } from "./maps/PaulMap";
import { ROMAN_DETAILS } from "./maps/RomanMap";
import { SEVEN_CHURCHES_DETAILS } from "./maps/SevenChurchesMap";

const MAP_META = [
  { id:"eden",     details:EDEN_DETAILS,            title:"Garden of Eden",       era:"c. 4000 BC",    color:"#5A7A3E", icon:"🌿" },
  { id:"abraham",  details:ABRAHAM_DETAILS,          title:"Abraham's Journey",    era:"c. 2091 BC",    color:"#D4A853", icon:"⭐" },
  { id:"exodus",   details:EXODUS_DETAILS,           title:"The Exodus Route",     era:"c. 1446 BC",    color:"#C06C3E", icon:"🔥" },
  { id:"conquest", details:CONQUEST_DETAILS,          title:"Joshua's Conquest",    era:"c. 1406 BC",    color:"#8B5CF6", icon:"⚔️" },
  { id:"tribes",   details:TRIBES_DETAILS,            title:"12 Tribes of Israel",  era:"c. 1400 BC",    color:"#2E4A33", icon:"🗺️" },
  { id:"david",    details:DAVID_DETAILS,             title:"David & Solomon",      era:"c. 1010 BC",    color:"#B8860B", icon:"👑" },
  { id:"divided",  details:DIVIDED_DETAILS,           title:"Divided Kingdom",      era:"c. 930 BC",     color:"#E8625C", icon:"⚡" },
  { id:"assyrian", details:ASSYRIAN_DETAILS,          title:"Assyrian Exile",       era:"c. 722 BC",     color:"#6B8A5A", icon:"🦁" },
  { id:"babylon",  details:BABYLONIAN_DETAILS,        title:"Babylonian Exile",     era:"c. 586 BC",     color:"#2A4A6B", icon:"🏛️" },
  { id:"return",   details:RETURN_DETAILS,            title:"Return from Exile",    era:"c. 538 BC",     color:"#6BAE75", icon:"🕊️" },
  { id:"jesus",    details:JESUS_DETAILS,             title:"Life of Jesus",        era:"c. 4 BC–AD 33", color:"#D4A853", icon:"✝️" },
  { id:"jerusalem",details:JERUSALEM_DETAILS,         title:"Jerusalem",            era:"c. AD 30",      color:"#C06C3E", icon:"🕍" },
  { id:"paul",     details:PAUL_DETAILS,              title:"Paul's Journeys",      era:"c. AD 46–57",   color:"#1B7A6E", icon:"⛵" },
  { id:"roman",    details:ROMAN_DETAILS,             title:"Roman Empire",         era:"c. AD 30",      color:"#8B5CF6", icon:"🏟️" },
  { id:"churches", details:SEVEN_CHURCHES_DETAILS,    title:"7 Churches",           era:"c. AD 95",      color:"#7A6B8A", icon:"📜" },
];

// Flatten all locations into a single array with map context
const ALL_LOCATIONS = [];
for (const map of MAP_META) {
  for (const [locId, detail] of Object.entries(map.details)) {
    ALL_LOCATIONS.push({
      id: locId,
      mapId: map.id,
      mapTitle: map.title,
      mapIcon: map.icon,
      era: map.era,
      color: map.color,
      title: detail.title,
      body: detail.body,
      scripture: detail.scripture,
    });
  }
}

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / (1000 * 60 * 60 * 24));
}

export function getTodayLocation() {
  return ALL_LOCATIONS[getDayOfYear() % ALL_LOCATIONS.length];
}

export function getLOTDStreak() {
  try {
    const last = localStorage.getItem("lotdLastSeen");
    const streak = parseInt(localStorage.getItem("lotdStreak") || "0");
    const today = new Date().toISOString().split("T")[0];
    const yesterday = new Date(Date.now() - 86400000).toISOString().split("T")[0];
    if (last === today) return streak;
    if (last === yesterday) return streak; // not yet incremented
    return 0; // streak broken
  } catch { return 0; }
}

export function markLOTDSeen() {
  try {
    const today = new Date().toISOString().split("T")[0];
    const last = localStorage.getItem("lotdLastSeen");
    const yesterday = new Date(Date.now() - 86400000).toISOString().split("T")[0];
    let streak = parseInt(localStorage.getItem("lotdStreak") || "0");
    if (last === today) return streak; // already seen today
    if (last === yesterday) streak += 1;
    else streak = 1;
    localStorage.setItem("lotdLastSeen", today);
    localStorage.setItem("lotdStreak", String(streak));
    return streak;
  } catch { return 1; }
}

// ─── LOTD HERO CARD (for Maps gallery) ──────────
export function LOTDHeroCard({ st, onExplore }) {
  const loc = getTodayLocation();
  const [liked, setLiked] = useState(false);

  useEffect(() => {
    try { setLiked(localStorage.getItem(`lotd_liked_${getDayOfYear()}`) === "1"); } catch {}
  }, []);

  const toggleLike = (e) => {
    e.stopPropagation();
    const next = !liked;
    setLiked(next);
    try { localStorage.setItem(`lotd_liked_${getDayOfYear()}`, next ? "1" : "0"); } catch {}
  };

  if (!loc) return null;
  const snippet = loc.scripture.split(" — ")[1]?.slice(0, 80) || loc.scripture.slice(0, 80);

  return (
    <div onClick={() => onExplore(loc)} style={{
      background: st.headerGradient, borderRadius: 20, padding: "24px 20px",
      marginBottom: 24, position: "relative", overflow: "hidden", cursor: "pointer",
      animation: "dropIn 0.5s ease",
    }}>
      <div style={{ position: "absolute", inset: 0, background: `radial-gradient(ellipse at 30% 20%,${loc.color}40,transparent 65%)` }} />
      <div style={{ position: "relative", zIndex: 1 }}>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 10 }}>
          <div style={{ fontFamily: st.ui, fontSize: 9, fontWeight: 700, color: `${st.headerText}88`, textTransform: "uppercase", letterSpacing: "0.1em" }}>
            Location of the Day
          </div>
          <button onClick={toggleLike} aria-label={liked ? "Unlike" : "Like"}
            style={{ background: "none", border: "none", cursor: "pointer", fontSize: 20, padding: 4, animation: liked ? "heartPop 0.35s ease" : "none" }}>
            {liked ? "❤️" : "🤍"}
          </button>
        </div>
        <div style={{ fontSize: 28, marginBottom: 6 }}>{loc.mapIcon}</div>
        <div style={{ fontFamily: st.heading, fontSize: 20, fontWeight: 700, color: st.headerText, lineHeight: 1.25, marginBottom: 4 }}>
          {loc.title}
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 8 }}>
          <span style={{ fontFamily: st.ui, fontSize: 10, color: loc.color, fontWeight: 700, textTransform: "uppercase" }}>{loc.era}</span>
          <span style={{ fontFamily: st.ui, fontSize: 10, color: `${st.headerText}66` }}>{loc.mapTitle}</span>
        </div>
        <div style={{ fontFamily: st.body, fontSize: 12.5, color: `${st.headerText}99`, fontStyle: "italic", lineHeight: 1.6, marginBottom: 12 }}>
          {snippet}...
        </div>
        <div style={{ display: "inline-flex", alignItems: "center", gap: 6, background: `${loc.color}30`, borderRadius: 10, padding: "8px 14px" }}>
          <span style={{ fontFamily: st.ui, fontSize: 12, fontWeight: 700, color: st.headerText }}>Explore This Location</span>
          <span style={{ fontSize: 14 }}>→</span>
        </div>
      </div>
    </div>
  );
}

// ─── COMPACT LOTD CARD (for HomeView) ────────────
export function LOTDHomeCard({ ht, nav }) {
  const loc = getTodayLocation();
  if (!loc) return null;

  return (
    <button onClick={() => nav("timeline-maps")} className="pressable" style={{
      width: "100%", display: "flex", alignItems: "center", gap: 12,
      padding: "14px 16px", borderRadius: 14, cursor: "pointer",
      border: `1px solid ${loc.color}30`, textAlign: "left",
      background: `linear-gradient(135deg,${loc.color}12,${loc.color}05)`,
      marginBottom: 16, animation: "fadeIn 0.4s ease 0.2s both",
    }}>
      <div style={{ width: 44, height: 44, borderRadius: 12, background: `${loc.color}20`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 22, flexShrink: 0 }}>
        {loc.mapIcon}
      </div>
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: loc.color, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 2 }}>
          Location of the Day
        </div>
        <div style={{ fontFamily: ht.heading, fontSize: 13, fontWeight: 700, color: ht.dark, lineHeight: 1.2 }}>
          {loc.title}
        </div>
        <div style={{ fontFamily: ht.ui, fontSize: 9, color: ht.muted, marginTop: 2 }}>
          {loc.mapTitle} · {loc.era}
        </div>
      </div>
      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={`${ht.muted}88`} strokeWidth="2"><polyline points="9 18 15 12 9 6"/></svg>
    </button>
  );
}
