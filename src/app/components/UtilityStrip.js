"use client";
import { useApp } from "../context/AppContext";
import { DBBadge } from "./ui";

export default function UtilityStrip({ theme, showFontSize = false }) {
  const { ht, darkMode, dbLive, fontSize, setFontSize } = useApp();
  const th = theme || ht;

  return (
    <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "6px 0 8px", borderTop: "1px solid rgba(255,255,255,0.08)", marginTop: 2 }}>
      <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
        <DBBadge live={dbLive} t={th} />
      </div>
      <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
        {showFontSize && (
          <div style={{ display: "flex", alignItems: "center", background: "rgba(255,255,255,0.07)", border: "1px solid rgba(255,255,255,0.1)", borderRadius: 16, padding: "2px 4px", gap: 1 }}>
            {["small", "medium", "large", "xlarge"].map((s, i) => (
              <button key={s} onClick={() => setFontSize(s)} style={{ fontFamily: "Georgia,serif", fontWeight: 800, border: "none", cursor: "pointer", borderRadius: 12, padding: "2px 5px", lineHeight: 1, fontSize: [9, 11, 13, 15][i], background: fontSize === s ? "rgba(255,255,255,0.18)" : "transparent", color: fontSize === s ? "#fff" : "rgba(255,255,255,0.35)", transition: "all 0.18s" }}>A</button>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
