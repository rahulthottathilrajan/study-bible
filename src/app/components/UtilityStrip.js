"use client";
import { useApp } from "../context/AppContext";

const TICKER_VERSE = "\u201CAnd it shall come to pass in the last days, saith God, I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams\u201D \u2014 Acts 2:17";

export default function UtilityStrip({ theme, showFontSize = false }) {
  const { ht, fontSize, setFontSize } = useApp();
  const th = theme || ht;

  return (
    <div style={{ display: "flex", alignItems: "center", gap: 8, padding: "5px 0 7px", borderTop: "1px solid rgba(255,255,255,0.08)", marginTop: 2, overflow: "hidden" }}>
      {/* Scrolling verse ticker */}
      <div style={{ flex: 1, overflow: "hidden", minWidth: 0, maskImage: "linear-gradient(90deg, transparent, #000 4%, #000 96%, transparent)", WebkitMaskImage: "linear-gradient(90deg, transparent, #000 4%, #000 96%, transparent)" }}>
        <div style={{
          display: "inline-block", whiteSpace: "nowrap",
          animation: "scrollTicker 28s linear infinite",
          fontFamily: "'Lora', Georgia, serif",
          fontSize: 10, fontStyle: "italic",
          color: "rgba(240,232,216,0.55)",
          letterSpacing: "0.02em",
        }}>
          {TICKER_VERSE}
        </div>
      </div>

      {/* Font size (Bible view only) */}
      {showFontSize && (
        <div style={{ display: "flex", alignItems: "center", background: "rgba(255,255,255,0.07)", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 16, padding: "2px 4px", gap: 1, flexShrink: 0 }}>
          {["small", "medium", "large", "xlarge"].map((s, i) => (
            <button key={s} onClick={() => setFontSize(s)} style={{ fontFamily: "Georgia,serif", fontWeight: 800, border: "none", cursor: "pointer", borderRadius: 12, padding: "2px 5px", lineHeight: 1, fontSize: [9, 11, 13, 15][i], background: fontSize === s ? "rgba(255,255,255,0.18)" : "transparent", color: fontSize === s ? "#fff" : "rgba(255,255,255,0.35)", transition: "all 0.18s" }}>A</button>
          ))}
        </div>
      )}
    </div>
  );
}
