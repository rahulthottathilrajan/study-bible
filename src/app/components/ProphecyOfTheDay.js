"use client";
import { PROPHECIES, STATUS_CONFIG, PROPHECY_CATEGORIES } from "./ProphecyData";

const CATEGORY_ICONS = {
  "Messianic": "🌟", "Daniel": "🌙", "Revelation": "📖",
  "Israel": "🏺", "Restoration": "🌱",
};
const CATEGORY_COLORS = {
  "Messianic": "#8B5CF6", "Daniel": "#D4A853", "Revelation": "#E8625C",
  "Israel": "#1B7A6E", "Restoration": "#2E7D32",
};

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / (1000 * 60 * 60 * 24));
}

export default function ProphecyOfTheDay({ nav, ht }) {
  // ht = home theme object with: heading, body, ui, bg, card, dark, text, muted, light, accent, accentBorder, headerGradient, headerText

  const prophecy = PROPHECIES[getDayOfYear() % PROPHECIES.length];
  const color = CATEGORY_COLORS[prophecy.category] || "#8B5CF6";
  const icon = CATEGORY_ICONS[prophecy.category] || "🔭";
  const status = STATUS_CONFIG[prophecy.status];

  // Check if already studied today
  let studied = false;
  try {
    const readIds = JSON.parse(localStorage.getItem("prophecy_read") || "{}");
    studied = !!readIds[prophecy.id];
  } catch {}

  // Read streak
  let streak = 0;
  try {
    streak = parseInt(localStorage.getItem("prophecyStreakCount") || "0", 10);
  } catch {}

  const streakIcon = streak >= 30 ? "🔭🔥🔥" : streak >= 7 ? "🔭🔥" : streak >= 1 ? "🔭" : "";

  return (
    <button
      onClick={() => nav("prophecy-home")}
      className="pressable"
      style={{
        width: "100%", textAlign: "left", cursor: "pointer",
        display: "flex", alignItems: "center", gap: 12,
        padding: "13px 14px", borderRadius: 14,
        border: `1px solid ${color}30`,
        background: `linear-gradient(135deg, ${color}0A, ${ht.card})`,
        marginBottom: 16,
      }}
    >
      {/* Icon */}
      <div style={{
        width: 44, height: 44, borderRadius: 12,
        background: `${color}18`, border: `1px solid ${color}30`,
        display: "flex", alignItems: "center", justifyContent: "center",
        fontSize: 22, flexShrink: 0,
      }}>
        {icon}
      </div>

      {/* Text */}
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
          <span style={{
            fontFamily: ht.ui, fontSize: 9, fontWeight: 700,
            color, textTransform: "uppercase", letterSpacing: "0.08em",
          }}>
            🔭 Prophecy of the Day
          </span>
          {streak > 0 && (
            <span style={{ fontSize: 10 }}>
              {streakIcon}{" "}
              <span style={{ fontFamily: ht.ui, fontSize: 8, color: ht.muted }}>{streak}</span>
            </span>
          )}
        </div>
        <div style={{
          fontFamily: ht.heading, fontSize: 13, fontWeight: 700,
          color: ht.dark, lineHeight: 1.2, marginTop: 2,
        }}>
          {prophecy.title}
        </div>
        <div style={{
          display: "flex", alignItems: "center", gap: 5, marginTop: 4, flexWrap: "wrap",
        }}>
          {status && (
            <span style={{
              fontFamily: ht.ui, fontSize: 9, fontWeight: 700,
              color: status.color, background: status.bg,
              borderRadius: 4, padding: "1px 6px",
            }}>
              {status.icon} {prophecy.status}
            </span>
          )}
          <span style={{
            fontFamily: ht.ui, fontSize: 9, color: ht.muted,
            background: `${ht.dark}08`, borderRadius: 4, padding: "1px 6px",
          }}>
            {prophecy.otRef}
          </span>
          {prophecy.ntRef && (
            <>
              <span style={{ fontFamily: ht.ui, fontSize: 9, color: ht.light }}>→</span>
              <span style={{
                fontFamily: ht.ui, fontSize: 9, color: ht.muted,
                background: `${ht.dark}08`, borderRadius: 4, padding: "1px 6px",
              }}>
                {prophecy.ntRef}
              </span>
            </>
          )}
        </div>
      </div>

      {/* Right: studied check or chevron */}
      {studied
        ? <span style={{ fontSize: 14, color: "#22C55E" }}>✓</span>
        : <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={`${ht.muted}88`} strokeWidth="2"><polyline points="9 18 15 12 9 6"/></svg>
      }
    </button>
  );
}
