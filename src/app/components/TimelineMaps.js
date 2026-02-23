"use client";
import { useState } from "react";
import { st, ANIM_STYLE } from "./maps/shared";

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
  { id:"churches",  icon:"📜", title:"The 7 Churches of Revelation",         subtitle:"Letters to Asia Minor",                era:"c. AD 95",      color:"#7A6B8A", soon:true  },
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
};

// ─── MAP RENDERER ─────────────────────────────────
function MapRenderer({ mapId, onSelectLocation, selectedLocation }) {
  const props = { onSelectLocation, selectedLocation };
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
    default:          return null;
  }
}

// ─── GALLERY CARD ─────────────────────────────────
function GalleryCard({ map, onSelect }) {
  return (
    <button
      onClick={() => !map.soon && onSelect()}
      style={{
        width:"100%", background: map.soon ? "#fafafa" : st.card,
        border:`1px solid ${map.color}33`, borderRadius:16,
        padding:"16px 14px", cursor: map.soon ? "default" : "pointer",
        textAlign:"left", display:"flex", alignItems:"center", gap:12,
        boxShadow: map.soon ? "none" : "0 2px 8px rgba(0,0,0,0.05)",
        borderLeft:`4px solid ${map.soon ? map.color+"55" : map.color}`,
        opacity: map.soon ? 0.6 : 1,
        transition:"all 0.15s",
      }}>
      <div style={{ width:46, height:46, borderRadius:12, background:`${map.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:24, flexShrink:0 }}>
        {map.icon}
      </div>
      <div style={{ flex:1, minWidth:0 }}>
        <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:2 }}>
          <div style={{ fontFamily:st.heading, fontSize:15, fontWeight:700, color:st.dark, lineHeight:1.2 }}>{map.title}</div>
          {map.soon && <span style={{ fontFamily:st.ui, fontSize:8, color:st.light, background:st.divider, borderRadius:4, padding:"2px 5px", fontWeight:700, textTransform:"uppercase", flexShrink:0 }}>Soon</span>}
        </div>
        <div style={{ fontFamily:st.ui, fontSize:10, color:map.color, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.04em", marginBottom:2 }}>{map.era}</div>
        <div style={{ fontFamily:st.body, fontSize:12, color:st.muted, fontStyle:"italic" }}>{map.subtitle}</div>
      </div>
      {!map.soon && <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={st.light} strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>}
    </button>
  );
}

// ─── MAIN EXPORT ─────────────────────────────────
export default function TimelineMaps({ nav }) {
  const [selectedMap,      setSelectedMap]      = useState(null);
  const [selectedLocation, setSelectedLocation] = useState(null);

  const handleSelectLocation = (loc) => {
    setSelectedLocation(prev => prev?.id === loc.id ? null : loc);
  };

  const locationDetail = selectedLocation ? ALL_DETAILS[selectedLocation.id] : null;
  const otMaps   = MAPS.slice(0, 10);
  const ntMaps   = MAPS.slice(10);
  const liveMaps = MAPS.filter(m => !m.soon).length;
  const soonMaps = MAPS.filter(m =>  m.soon).length;

  // ════════════════════════════════════════════
  // GALLERY VIEW
  // ════════════════════════════════════════════
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
              <div style={{ fontFamily:st.ui, fontSize:12, color:`${st.headerText}99`, marginTop:1 }}>Biblical Atlas — 15 maps</div>
            </div>
          </div>
        </div>

        <div style={{ padding:"20px 16px 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Hero */}
          <div style={{ background:st.headerGradient, borderRadius:20, padding:"28px 20px", marginBottom:24, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 20%,rgba(232,98,92,0.25),transparent 65%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:48, marginBottom:10 }}>🗺️</div>
              <div style={{ fontFamily:st.heading, fontSize:24, fontWeight:700, color:st.headerText, marginBottom:6 }}>Biblical Atlas</div>
              <div style={{ fontFamily:st.body, fontSize:13, color:`${st.headerText}88`, fontStyle:"italic", lineHeight:1.6 }}>
                15 maps spanning 6,000 years of biblical history — from Eden to the seven churches of Revelation
              </div>
              <div style={{ display:"flex", justifyContent:"center", gap:20, marginTop:14 }}>
                {[["15","Maps"],[String(liveMaps),"Live"],[String(soonMaps),"Coming"]].map(([n,l]) => (
                  <div key={l} style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:st.heading, fontSize:20, fontWeight:800, color:st.accent }}>{n}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:`${st.headerText}70`, textTransform:"uppercase", letterSpacing:"0.08em" }}>{l}</div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* OT Maps */}
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:10 }}>
            📜 Old Testament
          </div>
          <div style={{ display:"flex", flexDirection:"column", gap:10, marginBottom:22 }}>
            {otMaps.map(map => (
              <GalleryCard key={map.id} map={map} onSelect={() => { setSelectedMap(map); setSelectedLocation(null); }} />
            ))}
          </div>

          {/* NT Maps */}
          <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:800, color:st.muted, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:10 }}>
            ✝️ New Testament
          </div>
          <div style={{ display:"flex", flexDirection:"column", gap:10, marginBottom:24 }}>
            {ntMaps.map(map => (
              <GalleryCard key={map.id} map={map} onSelect={() => { setSelectedMap(map); setSelectedLocation(null); }} />
            ))}
          </div>

          {/* Footer */}
          <div style={{ background:st.headerGradient, borderRadius:16, padding:"20px", position:"relative", overflow:"hidden" }}>
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

        <MapRenderer mapId={selectedMap.id} onSelectLocation={handleSelectLocation} selectedLocation={selectedLocation} />

        {/* Detail panel */}
        {selectedLocation && locationDetail && (
          <div className="detail-panel" style={{
            marginTop:16, background:st.card, borderRadius:18,
            border:`1px solid ${selectedMap.color}44`,
            borderLeft:`4px solid ${selectedMap.color}`,
            overflow:"hidden", boxShadow:"0 4px 20px rgba(0,0,0,0.08)",
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