"use client";
import { GWOTD_POOL } from "./GreekData";
import { Card } from "./ui";

const getDayOfYear = () => { const now = new Date(); const start = new Date(now.getFullYear(), 0, 0); return Math.floor((now - start) / 86400000); };

export default function GreekWordOfTheDay({ nav, ht }) {
  const word = GWOTD_POOL[getDayOfYear() % GWOTD_POOL.length];
  return (
    <button onClick={() => nav("greek-home")}
      style={{ width:"100%", background:ht.card, borderRadius:14, padding:"16px 18px", border:`1px solid ${ht.divider}`, borderLeft:"4px solid #1B7A6E", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, marginBottom:12, transition:"all 0.15s" }}>
      <div style={{ width:52, height:52, borderRadius:12, background:"linear-gradient(135deg,#1A2F4B,#1B7A6E)", display:"flex", alignItems:"center", justifyContent:"center", flexShrink:0 }}>
        <span style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:"#fff" }}>{word.greek.length > 4 ? word.greek.slice(0, 3) : word.greek}</span>
      </div>
      <div style={{ flex:1, minWidth:0 }}>
        <div style={{ fontFamily:ht.ui, fontSize:9, fontWeight:700, color:"#1B7A6E", textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:2 }}>Greek Word of the Day</div>
        <div style={{ display:"flex", alignItems:"baseline", gap:8, flexWrap:"wrap" }}>
          <span style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:ht.dark }}>{word.greek}</span>
          <span style={{ fontFamily:ht.body, fontSize:12, color:ht.muted, fontStyle:"italic" }}>{word.transliteration}</span>
        </div>
        <div style={{ fontFamily:ht.ui, fontSize:12, color:ht.text, marginTop:2 }}>{word.meaning}</div>
      </div>
      <div style={{ fontFamily:ht.ui, fontSize:10, color:"#1B7A6E", fontWeight:700, flexShrink:0 }}>Study →</div>
    </button>
  );
}
