"use client";
import { useState, useRef, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { st as stLight, ANIM_STYLE } from "./maps/shared";
import { LOTDHeroCard, markLOTDSeen } from "./LocationOfTheDay";

const stDark = {
  ...stLight,
  bg:      "#161210",
  card:    "#201A16",
  dark:    "#F8E8D0",
  text:    "#D0B898",
  muted:   "#9A7A5A",
  light:   "#6A5840",
  divider: "rgba(232,98,92,0.15)",
};

import ExodusMap,          { EXODUS_DETAILS          } from "./maps/ExodusMap";
import TribesMap,          { TRIBES_DETAILS          } from "./maps/TribesMap";
import PaulMap,            { PAUL_DETAILS            } from "./maps/PaulMap";
import RomanMap,           { ROMAN_DETAILS           } from "./maps/RomanMap";
import EdenMap,            { EDEN_DETAILS            } from "./maps/EdenMap";
import AbrahamMap,         { ABRAHAM_DETAILS         } from "./maps/AbrahamMap";
import ConquestMap,        { CONQUEST_DETAILS        } from "./maps/ConquestMap";
import DavidKingdomMap,    { DAVID_DETAILS           } from "./maps/DavidKingdomMap";
import DividedKingdomMap,  { DIVIDED_DETAILS         } from "./maps/DividedKingdomMap";
import AssyrianExileMap,   { ASSYRIAN_DETAILS        } from "./maps/AssyrianExileMap";
import BabylonianExileMap, { BABYLONIAN_DETAILS      } from "./maps/BabylonianExileMap";
import ReturnExileMap,     { RETURN_DETAILS          } from "./maps/ReturnExileMap";
import JesusLifeMap,       { JESUS_DETAILS           } from "./maps/JesusLifeMap";
import JerusalemMap,       { JERUSALEM_DETAILS       } from "./maps/JerusalemMap";
import SevenChurchesMap,   { SEVEN_CHURCHES_DETAILS  } from "./maps/SevenChurchesMap";

// ─── ALL 15 MAPS CONFIG ───────────────────────────
const MAPS = [
  // ── Old Testament ──────────────────────────────
  { id:"eden",      icon:"🌿", title:"Garden of Eden & Early Civilisations", subtitle:"The cradle of humanity",               era:"c. 4000 BC",    color:"#5A7A3E", soon:false },
  { id:"abraham",   icon:"⭐", title:"Abraham's Journey",                    subtitle:"From Ur to the Promised Land",         era:"c. 2091 BC",    color:"#D4A853", soon:false },
  { id:"exodus",    icon:"🔥", title:"The Exodus Route",                     subtitle:"Moses leads Israel out of Egypt",      era:"c. 1446 BC",    color:"#C06C3E", soon:false },
  { id:"conquest",  icon:"⚔️", title:"Joshua's Conquest of Canaan",          subtitle:"Israel takes the Promised Land",       era:"c. 1406 BC",    color:"#8B5CF6", soon:false },
  { id:"tribes",    icon:"🗺️", title:"The 12 Tribes of Israel",              subtitle:"Division of the Promised Land",        era:"c. 1400 BC",    color:"#2E4A33", soon:false },
  { id:"david",     icon:"👑", title:"The Kingdom of David & Solomon",       subtitle:"Israel at its greatest extent",        era:"c. 1010 BC",    color:"#B8860B", soon:false },
  { id:"divided",   icon:"⚡", title:"The Divided Kingdom",                  subtitle:"Israel (North) vs Judah (South)",      era:"c. 930 BC",     color:"#E8625C", soon:false },
  { id:"assyrian",  icon:"🦁", title:"The Assyrian Exile",                   subtitle:"The northern tribes carried away",     era:"c. 722 BC",     color:"#6B8A5A", soon:false },
  { id:"babylon",   icon:"🏛️", title:"The Babylonian Exile",                 subtitle:"Fall of Jerusalem, exile routes",      era:"c. 586 BC",     color:"#2A4A6B", soon:false },
  { id:"return",    icon:"🕊️", title:"The Return from Exile",                subtitle:"Ezra & Nehemiah rebuild",              era:"c. 538 BC",     color:"#6BAE75", soon:false },
  // ── New Testament ──────────────────────────────
  { id:"jesus",     icon:"✝️", title:"The Life of Jesus",                    subtitle:"Bethlehem to Jerusalem",               era:"c. 4 BC–AD 33", color:"#D4A853", soon:false },
  { id:"jerusalem", icon:"🕍", title:"Jerusalem in Jesus' Day",              subtitle:"Temple, Golgotha, Gethsemane",         era:"c. AD 30",      color:"#C06C3E", soon:false },
  { id:"paul",      icon:"⛵", title:"Paul's Missionary Journeys",           subtitle:"Three journeys across the Roman world",era:"c. AD 46–57",   color:"#1B7A6E", soon:false },
  { id:"roman",     icon:"🏟️", title:"The Roman Empire",                     subtitle:"The world at the time of Christ",      era:"c. AD 30",      color:"#8B5CF6", soon:false },
  { id:"churches",  icon:"📜", title:"The 7 Churches of Revelation",         subtitle:"Letters to Asia Minor",                era:"c. AD 95",      color:"#7A6B8A", soon:false },
];

// ─── DETAILS LOOKUP ───────────────────────────────
const ALL_DETAILS = {
  ...EDEN_DETAILS,
  ...ABRAHAM_DETAILS,
  ...EXODUS_DETAILS,
  ...CONQUEST_DETAILS,
  ...TRIBES_DETAILS,
  ...DAVID_DETAILS,
  ...DIVIDED_DETAILS,
  ...ASSYRIAN_DETAILS,
  ...BABYLONIAN_DETAILS,
  ...RETURN_DETAILS,
  ...JESUS_DETAILS,
  ...JERUSALEM_DETAILS,
  ...PAUL_DETAILS,
  ...ROMAN_DETAILS,
  ...SEVEN_CHURCHES_DETAILS,
};

// ─── LOCATION LISTS PER MAP ─────────────────────────
const MAP_LOCATIONS = {
  eden:      Object.keys(EDEN_DETAILS),
  abraham:   Object.keys(ABRAHAM_DETAILS),
  exodus:    Object.keys(EXODUS_DETAILS),
  conquest:  Object.keys(CONQUEST_DETAILS),
  tribes:    Object.keys(TRIBES_DETAILS),
  david:     Object.keys(DAVID_DETAILS),
  divided:   Object.keys(DIVIDED_DETAILS),
  assyrian:  Object.keys(ASSYRIAN_DETAILS),
  babylon:   Object.keys(BABYLONIAN_DETAILS),
  return:    Object.keys(RETURN_DETAILS),
  jesus:     Object.keys(JESUS_DETAILS),
  jerusalem: Object.keys(JERUSALEM_DETAILS),
  paul:      Object.keys(PAUL_DETAILS),
  roman:     Object.keys(ROMAN_DETAILS),
  churches:  Object.keys(SEVEN_CHURCHES_DETAILS),
};

// ─── SCRIPTURE PARSER ────────────────────────────
const parseScriptureRef = (text) => {
  if (!text) return null;
  const ref = text.split(" — ")[0];
  const m = ref.match(/^(\d?\s*[A-Za-z]+(?:\s+[A-Za-z]+)*)\s+(\d+):(\d+)/);
  if (!m) return null;
  return { book: m[1].trim(), chapter: parseInt(m[2]), verse: parseInt(m[3]) };
};

// ─── ROUTE CONFIGS (for animated journeys) ──────
const ROUTE_CONFIGS = {
  abraham: {
    path: "M82,62 C75,50 70,38 68,24 C64,22 58,24 54,28 C50,32 48,36 46,40 C44,42 44,48 44,56 C36,58 28,60 22,62",
    locationOrder: ["ur","haran","shechem","bethel","hebron","moriah","beersheba","egypt","canaan"],
    color: "#D4A853",
  },
  exodus: {
    path: "M73,32 L80,38 L84,45 L81,54 L76,62 L70,69 L65,75 L59,88 L43,70 L33,35",
    locationOrder: ["rameses","succoth","etham","pihahiroth","redsea","marah","elim","sinai","kadesh","canaan"],
    color: "#C06C3E",
  },
  babylon: {
    path: "M38,46 C42,38 48,30 52,26 C58,22 62,20 68,18 C72,16 76,16 80,18 C84,22 80,36 78,44",
    locationOrder: ["jerusalem","mizpah","riblah","haran","carchemish","tel_abib","chebar","babylon","nippur","egypt"],
    color: "#8B5CF6",
  },
  return: {
    path: "M76,46 C70,40 64,32 58,28 C50,24 44,20 38,22 C36,28 36,36 36,46",
    locationOrder: ["babylon","cyrus","ezra","euphrates","tadmor","samaria","bethel","temple","jerusalem","walls"],
    color: "#D4A853",
  },
};

// ─── JOURNEY PLAYER ──────────────────────────────
function JourneyPlayer({ routeConfig, mapLocs, onSelectLocation, st, mapColor }) {
  const [playing, setPlaying] = useState(false);
  const [currentStop, setCurrentStop] = useState(-1);
  const timerRef = useRef(null);
  const stops = routeConfig.locationOrder;

  const play = () => {
    setPlaying(true);
    setCurrentStop(0);
    onSelectLocation({ id: stops[0] });
  };

  const pause = () => {
    setPlaying(false);
    if (timerRef.current) clearTimeout(timerRef.current);
  };

  const reset = () => {
    setPlaying(false);
    setCurrentStop(-1);
    if (timerRef.current) clearTimeout(timerRef.current);
    onSelectLocation(null);
  };

  useEffect(() => {
    if (!playing || currentStop < 0) return;
    if (currentStop >= stops.length) { setPlaying(false); return; }
    timerRef.current = setTimeout(() => {
      const nextIdx = currentStop + 1;
      if (nextIdx < stops.length) {
        setCurrentStop(nextIdx);
        onSelectLocation({ id: stops[nextIdx] });
      } else {
        setPlaying(false);
      }
    }, 2500);
    return () => { if (timerRef.current) clearTimeout(timerRef.current); };
  }, [playing, currentStop, stops, onSelectLocation]);

  const c = mapColor || routeConfig.color;

  return (
    <div style={{
      display: "flex", alignItems: "center", justifyContent: "center", gap: 10,
      padding: "10px 14px", marginTop: 12, marginBottom: 4,
      background: `${c}0A`, borderRadius: 12, border: `1px solid ${c}25`,
    }}>
      {!playing ? (
        <button onClick={play} style={{
          background: c, color: "#fff", border: "none", borderRadius: 8,
          padding: "6px 16px", cursor: "pointer", fontFamily: st.ui,
          fontSize: 12, fontWeight: 700, display: "flex", alignItems: "center", gap: 6,
        }}>
          <span style={{ fontSize: 14 }}>▶</span> Play Journey
        </button>
      ) : (
        <>
          <button onClick={pause} style={{
            background: `${c}20`, color: c, border: `1px solid ${c}40`,
            borderRadius: 8, padding: "6px 12px", cursor: "pointer",
            fontFamily: st.ui, fontSize: 11, fontWeight: 700,
          }}>⏸ Pause</button>
          <button onClick={reset} style={{
            background: "none", color: st.muted, border: `1px solid ${st.divider}`,
            borderRadius: 8, padding: "6px 12px", cursor: "pointer",
            fontFamily: st.ui, fontSize: 11, fontWeight: 700,
          }}>↺ Reset</button>
        </>
      )}
      {currentStop >= 0 && (
        <span style={{ fontFamily: st.ui, fontSize: 11, color: st.muted, fontWeight: 600, marginLeft: 4 }}>
          {currentStop + 1} of {stops.length}
        </span>
      )}
    </div>
  );
}

// ─── MAP RENDERER ─────────────────────────────────
function MapRenderer({ mapId, onSelectLocation, selectedLocation, dark }) {
  const props = { onSelectLocation, selectedLocation, dark };
  switch (mapId) {
    case "eden":      return <EdenMap            {...props} />;
    case "abraham":   return <AbrahamMap         {...props} />;
    case "exodus":    return <ExodusMap          {...props} />;
    case "conquest":  return <ConquestMap        {...props} />;
    case "tribes":    return <TribesMap          {...props} />;
    case "david":     return <DavidKingdomMap    {...props} />;
    case "divided":   return <DividedKingdomMap  {...props} />;
    case "assyrian":  return <AssyrianExileMap   {...props} />;
    case "babylon":   return <BabylonianExileMap {...props} />;
    case "return":    return <ReturnExileMap     {...props} />;
    case "jesus":     return <JesusLifeMap       {...props} />;
    case "jerusalem": return <JerusalemMap       {...props} />;
    case "paul":      return <PaulMap            {...props} />;
    case "roman":     return <RomanMap           {...props} />;
    case "churches":  return <SevenChurchesMap   {...props} />;
    default:          return null;
  }
}

// ─── GALLERY CARD ─────────────────────────────────
function GalleryCard({ map, onSelect, st, index, explored }) {
  const sites = MAP_LOCATIONS[map.id]?.length || 0;
  const expCount = explored?.length || 0;
  const pct = sites > 0 ? (expCount / sites) * 100 : 0;
  const complete = pct >= 100;
  return (
    <button
      onClick={() => !map.soon && onSelect()}
      style={{
        width:"100%", background: st.card,
        border:`1px solid ${map.color}33`, borderRadius:16,
        padding:"16px 14px", cursor: map.soon ? "default" : "pointer",
        textAlign:"left", display:"flex", alignItems:"center", gap:12,
        boxShadow: map.soon ? "none" : "0 2px 8px rgba(0,0,0,0.05)",
        borderLeft:`4px solid ${map.soon ? map.color+"55" : map.color}`,
        opacity: map.soon ? 0.6 : 1,
        transition:"transform 0.15s, box-shadow 0.15s",
        animation: `fadeIn 0.4s ease ${index * 0.04}s both`,
        position:"relative", overflow:"hidden",
      }}>
      <div style={{ width:46, height:46, borderRadius:12, background:`${map.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:24, flexShrink:0, position:"relative" }}>
        {map.icon}
        {complete && <div style={{ position:"absolute", bottom:-2, right:-2, width:16, height:16, borderRadius:"50%", background:"#22C55E", display:"flex", alignItems:"center", justifyContent:"center", fontSize:10, color:"#fff", border:"2px solid "+st.card }}>✓</div>}
      </div>
      <div style={{ flex:1, minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:2 }}>
          <div style={{ fontFamily:st.heading, fontSize:15, fontWeight:700, color:st.dark, lineHeight:1.2 }}>{map.title}</div>
          {map.soon && <span style={{ fontFamily:st.ui, fontSize:8, color:st.light, background:st.divider, borderRadius:4, padding:"2px 5px", fontWeight:700, textTransform:"uppercase", flexShrink:0 }}>Soon</span>}
        </div>
        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:2 }}>
          <div style={{ fontFamily:st.ui, fontSize:10, color:map.color, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.04em" }}>{map.era}</div>
          {sites > 0 && !map.soon && (
            <div style={{ fontFamily:st.ui, fontSize:9, color:st.muted, fontWeight:600, background:`${map.color}10`, borderRadius:6, padding:"1px 6px" }}>
              {expCount > 0 ? `${expCount}/${sites}` : `${sites} sites`}
            </div>
          )}
        </div>
        <div style={{ fontFamily:st.body, fontSize:12, color:st.muted, fontStyle:"italic" }}>{map.subtitle}</div>
      </div>
      {!map.soon && <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={st.light} strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>}
      {pct > 0 && <div style={{ position:"absolute", bottom:0, left:0, height:3, width:`${pct}%`, background:complete ? "#22C55E" : map.color, borderRadius:"0 3px 0 0", transition:"width 0.4s ease" }} />}
    </button>
  );
}

// ─── CONFETTI ────────────────────────────────────
function MapConfetti() {
  const colors = ["#D4A853","#E8625C","#1B7A6E","#8B5CF6","#C06C3E","#6BAE75","#B8860B","#7A6B8A"];
  return (
    <div style={{ position:"fixed", top:0, left:0, right:0, bottom:0, pointerEvents:"none", zIndex:999 }}>
      {colors.map((c,i) => (
        <div key={i} style={{
          position:"absolute",
          left:`${12 + (i * 11)}%`,
          top:"30%",
          width:8, height:8, borderRadius:"50%",
          background:c,
          animation:`confettiFloat 1.5s ease-out ${i*0.08}s forwards`,
          opacity:0.9,
        }} />
      ))}
    </div>
  );
}

// ─── MAIN EXPORT ─────────────────────────────────
export default function TimelineMaps({ nav, darkMode }) {
  const { bp, checkBadges } = useApp();
  const st = darkMode ? stDark : stLight;
  const [selectedMap,      setSelectedMap]      = useState(null);
  const [selectedLocation, setSelectedLocation] = useState(null);
  const [showConfetti, setShowConfetti] = useState(false);
  const [mapsExplored, setMapsExplored] = useState(() => {
    try { return JSON.parse(localStorage.getItem("mapsExplored") || "{}"); } catch { return {}; }
  });
  const detailRef = useRef(null);

  useEffect(() => {
    if (selectedLocation && detailRef.current) {
      detailRef.current.focus();
      detailRef.current.scrollIntoView({ behavior: "smooth", block: "nearest" });
    }
  }, [selectedLocation]);

  const handleSelectLocation = (loc) => {
    const isDeselect = loc.id === selectedLocation?.id;
    setSelectedLocation(isDeselect ? null : loc);
    if (!isDeselect && selectedMap) {
      const mapId = selectedMap.id;
      const prev = mapsExplored[mapId] || [];
      if (!prev.includes(loc.id)) {
        const updated = { ...mapsExplored, [mapId]: [...prev, loc.id] };
        setMapsExplored(updated);
        try { localStorage.setItem("mapsExplored", JSON.stringify(updated)); } catch {}
        const total = MAP_LOCATIONS[mapId]?.length || 0;
        if (updated[mapId].length >= total) {
          setShowConfetti(true);
          setTimeout(() => setShowConfetti(false), 2000);
        }
        setTimeout(() => checkBadges(), 100);
      }
    }
  };

  const locationDetail = selectedLocation ? ALL_DETAILS[selectedLocation.id] : null;
  const scriptureRef = locationDetail ? parseScriptureRef(locationDetail.scripture) : null;
  const mapLocs = selectedMap ? (MAP_LOCATIONS[selectedMap.id] || []) : [];
  const locIdx = selectedLocation ? mapLocs.indexOf(selectedLocation.id) : -1;
  const otMaps = MAPS.slice(0, 10);
  const ntMaps = MAPS.slice(10);

  // ════════════════════════════════════════════
  // GALLERY VIEW
  // ════════════════════════════════════════════
  if (!selectedMap) {
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <style>{ANIM_STYLE}</style>

        <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
          <div style={{ display:"flex", alignItems:"center", gap:10 }}>
            <button onClick={() => nav("timeline-home")} aria-label="Back to timeline"
              style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
            </button>
            <div>
              <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>Historical Maps</h2>
              <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>Biblical Atlas — 15 maps</div>
            </div>
          </div>
        </div>

        <div style={{ padding:`20px ${bp.pad}px 40px`, maxWidth:bp.content, margin:"0 auto" }}>

          {/* Location of the Day Hero */}
          <LOTDHeroCard st={st} onExplore={(loc) => {
            markLOTDSeen();
            const map = MAPS.find(m => m.id === loc.mapId);
            if (map) { setSelectedMap(map); setSelectedLocation({ id: loc.id }); }
          }} />

          {/* OT Maps */}
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:10 }}>
            📜 Old Testament
          </div>
          <div style={{ display:"flex", flexDirection:"column", gap:10, marginBottom:22 }}>
            {otMaps.map((map, i) => (
              <GalleryCard key={map.id} map={map} st={st} index={i} explored={mapsExplored[map.id]} onSelect={() => { setSelectedMap(map); setSelectedLocation(null); }} />
            ))}
          </div>

          {/* NT Maps */}
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:10 }}>
            ✝️ New Testament
          </div>
          <div style={{ display:"flex", flexDirection:"column", gap:10, marginBottom:24 }}>
            {ntMaps.map((map, i) => (
              <GalleryCard key={map.id} map={map} st={st} index={i + 10} explored={mapsExplored[map.id]} onSelect={() => { setSelectedMap(map); setSelectedLocation(null); }} />
            ))}
          </div>

          {/* Footer */}
          <div style={{ background:st.headerGradient, borderRadius:16, padding:"20px", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.headerText, fontStyle:"italic", lineHeight:1.8, marginBottom:6 }}>
                "Who laid the foundations of the earth, that it should not be removed for ever."
              </div>
              <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700 }}>Psalm 104:5</div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // ════════════════════════════════════════════
  // INDIVIDUAL MAP VIEW
  // ════════════════════════════════════════════
  const activeMaps = MAPS.filter(m => !m.soon);
  const activeIdx  = activeMaps.findIndex(m => m.id === selectedMap.id);
  const prev = activeIdx > 0                   ? activeMaps[activeIdx - 1] : null;
  const next = activeIdx < activeMaps.length-1 ? activeMaps[activeIdx + 1] : null;

  return (
    <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
      <style>{ANIM_STYLE}</style>
      {showConfetti && <MapConfetti />}

      <div style={{ background:st.headerGradient, padding:"14px 20px 18px", position:"sticky", top:0, zIndex:10 }}>
        <div style={{ display:"flex", alignItems:"center", gap:10 }}>
          <button onClick={() => { setSelectedMap(null); setSelectedLocation(null); }} aria-label="Back to map gallery"
            style={{ background:"rgba(255,255,255,0.15)", border:"none", borderRadius:8, padding:8, cursor:"pointer", color:st.headerText, display:"flex", alignItems:"center" }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <div>
            <h2 style={{ fontFamily:st.heading, fontSize:19, fontWeight:700, color:st.headerText, margin:0 }}>{selectedMap.title}</h2>
            <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>{selectedMap.era}</div>
          </div>
        </div>
      </div>

      <div style={{ padding:`16px ${bp.pad}px 40px`, maxWidth:bp.content, margin:"0 auto" }}>

        <div style={{ fontFamily:st.body, fontSize:13.5, color:st.muted, fontStyle:"italic", lineHeight:1.6, marginBottom:14, textAlign:"center" }}>
          {selectedMap.subtitle} — tap any location to learn more
        </div>

        <MapRenderer mapId={selectedMap.id} onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} dark={darkMode} />

        {/* Journey Player (for route-based maps) */}
        {ROUTE_CONFIGS[selectedMap.id] && (
          <JourneyPlayer
            routeConfig={ROUTE_CONFIGS[selectedMap.id]}
            mapLocs={mapLocs}
            onSelectLocation={(loc) => loc ? handleSelectLocation(loc) : setSelectedLocation(null)}
            st={st}
            mapColor={selectedMap.color}
          />
        )}

        {/* Detail panel */}
        {selectedLocation && locationDetail && (
          <div className="detail-panel" ref={detailRef} tabIndex={-1} style={{
            marginTop:16, background:st.card, borderRadius:18,
            border:`1px solid ${selectedMap.color}44`,
            borderLeft:`4px solid ${selectedMap.color}`,
            overflow:"hidden", boxShadow:"0 4px 20px rgba(0,0,0,0.08)",
          }}>
            <div style={{ padding:"14px 16px 12px", background:`${selectedMap.color}0D`, display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
              <div style={{ fontFamily:st.heading, fontSize:18, fontWeight:700, color:st.dark, flex:1, lineHeight:1.25 }}>{locationDetail.title}</div>
              <button onClick={() => setSelectedLocation(null)} aria-label="Close detail panel"
                style={{ background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:20, padding:"0 0 0 12px", flexShrink:0, lineHeight:1 }}>✕</button>
            </div>
            <div style={{ padding:"12px 16px 16px" }}>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.85, marginBottom:14 }}>{locationDetail.body}</div>
              <div style={{ background:`${selectedMap.color}0D`, borderRadius:12, padding:"11px 14px", borderLeft:`3px solid ${selectedMap.color}` }}>
                <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:selectedMap.color, textTransform:"uppercase", letterSpacing:"0.07em", marginBottom:5 }}>📖 Scripture</div>
                <div style={{ fontFamily:st.body, fontSize:13.5, color:st.text, lineHeight:1.75, fontStyle:"italic" }}>{locationDetail.scripture}</div>
              </div>
              {scriptureRef && (
                <button onClick={() => nav("verses", scriptureRef)}
                  style={{ width:"100%", padding:"10px", marginTop:12, background:`${selectedMap.color}12`,
                    border:`1px solid ${selectedMap.color}30`, borderRadius:10,
                    cursor:"pointer", fontFamily:st.ui, fontSize:12, fontWeight:700,
                    color:selectedMap.color, textAlign:"center", transition:"background 0.15s",
                  }}>
                  Read {scriptureRef.book} {scriptureRef.chapter} in Bible →
                </button>
              )}
              {mapLocs.length > 1 && (
                <div style={{ display:"flex", justifyContent:"space-between", alignItems:"center",
                  marginTop:12, paddingTop:10, borderTop:`1px solid ${st.divider}` }}>
                  <button
                    onClick={() => locIdx > 0 && setSelectedLocation({ id: mapLocs[locIdx - 1] })}
                    aria-label="Previous location"
                    style={{ background:"none", border:"none", cursor: locIdx > 0 ? "pointer" : "default",
                      fontFamily:st.ui, fontSize:11, fontWeight:700, color: locIdx > 0 ? selectedMap.color : st.light,
                      padding:"4px 8px", opacity: locIdx > 0 ? 1 : 0.4 }}>
                    ‹ Prev
                  </button>
                  <span style={{ fontFamily:st.ui, fontSize:11, color:st.muted, fontWeight:600 }}>
                    {locIdx + 1} of {mapLocs.length}
                  </span>
                  <button
                    onClick={() => locIdx < mapLocs.length - 1 && setSelectedLocation({ id: mapLocs[locIdx + 1] })}
                    aria-label="Next location"
                    style={{ background:"none", border:"none", cursor: locIdx < mapLocs.length - 1 ? "pointer" : "default",
                      fontFamily:st.ui, fontSize:11, fontWeight:700, color: locIdx < mapLocs.length - 1 ? selectedMap.color : st.light,
                      padding:"4px 8px", opacity: locIdx < mapLocs.length - 1 ? 1 : 0.4 }}>
                    Next ›
                  </button>
                </div>
              )}
            </div>
          </div>
        )}

        {/* Tap prompt */}
        {!selectedLocation && (
          <div style={{ marginTop:14, textAlign:"center", padding:"16px", background:st.card, borderRadius:14, border:`1px solid ${st.divider}` }}>
            <div style={{ fontFamily:st.ui, fontSize:12.5, color:st.muted }}>👆 Tap any location on the map to explore it</div>
          </div>
        )}

        {/* Prev / Next */}
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
      </div>
    </div>
  );
}
