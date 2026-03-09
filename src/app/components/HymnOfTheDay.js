"use client";
import { useState, useEffect } from "react";

// ═══════════════════════════════════════════════════
// HYMN OF THE DAY — deterministic daily rotation
// ═══════════════════════════════════════════════════
export default function HymnOfTheDay({ nav, ht }) {
  const [dailyHymn, setDailyHymn] = useState(null);

  useEffect(() => {
    fetch("/data/hymns/index.json")
      .then(r => r.ok ? r.json() : null)
      .then(data => {
        if (!data?.hymns?.length) return;
        const dayOfYear = Math.floor((Date.now() - new Date(new Date().getFullYear(), 0, 0)) / 86400000);
        setDailyHymn(data.hymns[dayOfYear % data.hymns.length]);
      })
      .catch(() => {});
  }, []);

  if (!dailyHymn) return null;

  return (
    <div style={{ marginBottom: 22 }}>
      <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14, display: "flex", alignItems: "center", gap: 8 }}>
        <span>🎵</span> Hymn of the Day
      </div>
      <div
        onClick={() => nav("songs-detail", { songsHymn: dailyHymn.id })}
        className="pressable"
        style={{ background: `linear-gradient(135deg, ${ht.accent}18, ${ht.card})`, border: `1px solid ${ht.accentBorder}`, borderRadius: 14, padding: "18px 18px", display: "flex", alignItems: "center", gap: 14, cursor: "pointer", position: "relative", overflow: "hidden" }}
      >
        <div style={{ position: "absolute", bottom: 0, left: 0, right: 0, height: 3, background: `linear-gradient(90deg, ${ht.accent}, ${ht.accent}88, ${ht.accent})`, opacity: 0.5, borderRadius: "0 0 14px 14px" }} />
        <div style={{ width: 52, height: 52, borderRadius: 14, background: `${ht.accent}20`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 28, flexShrink: 0 }}>🎵</div>
        <div style={{ flex: 1, minWidth: 0 }}>
          <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: ht.dark, lineHeight: 1.3 }}>{dailyHymn.title}</div>
          <div style={{ fontFamily: ht.body, fontSize: 12, color: ht.muted, fontStyle: "italic", marginTop: 3, overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{dailyHymn.firstLine}</div>
          <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light, marginTop: 3 }}>{dailyHymn.author}{dailyHymn.year ? ` \u00B7 ${dailyHymn.year}` : ""}</div>
        </div>
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" style={{ flexShrink: 0 }}>
          <polyline points="9 18 15 12 9 6" />
        </svg>
      </div>
    </div>
  );
}
