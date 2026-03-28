"use client";
import { useApp } from "../context/AppContext";
import { PRAYER_CATEGORY_STYLE } from "../constants";

const GRADIENTS = [
  ["#2D1B4E", "#4A2D6B", "#8B5CF6"],
  ["#1C2B1F", "#2E4A33", "#C06C3E"],
  ["#1A2F4B", "#1B5E5A", "#1B7A6E"],
  ["#2D1052", "#5B2D8E", "#D4A853"],
  ["#1A1A2E", "#2D1B4E", "#E8625C"],
];

function timeAgo(dateStr) {
  const diff = Math.floor((Date.now() - new Date(dateStr).getTime()) / 1000);
  if (diff < 3600) return `${Math.floor(diff / 60)}m ago`;
  if (diff < 86400) return `${Math.floor(diff / 3600)}h ago`;
  return `${Math.floor(diff / 86400)}d ago`;
}

// Streak icon progression
function streakIcon(count) {
  if (count >= 30) return "\u26a1";
  if (count >= 14) return "\ud83d\udd25\ud83d\udd25";
  if (count >= 7) return "\ud83d\udd25";
  if (count >= 1) return "\ud83d\udd6f\ufe0f";
  return "";
}

export default function PrayerOfTheDay({ nav, ht }) {
  const { prayerOfTheDay, prayerStreak, user, toggleReaction, userReactions } = useApp();

  if (!prayerOfTheDay) return null;

  const p = prayerOfTheDay;
  const dayOfYear = Math.floor((Date.now() - new Date(new Date().getFullYear(), 0, 0)) / 86400000);
  const gradientIdx = (dayOfYear + 2) % GRADIENTS.length; // offset from VOTD
  const g = GRADIENTS[gradientIdx];
  const catStyle = PRAYER_CATEGORY_STYLE[p.category] || PRAYER_CATEGORY_STYLE.general;
  const rc = p.reaction_counts || { praying: 0, heart: 0, amen: 0 };
  const totalPraying = rc.praying || 0;
  const isReacted = userReactions?.[p.id]?.praying;

  const handlePray = (e) => {
    e.stopPropagation();
    if (!user || isReacted) return;
    toggleReaction(p.id, "praying");
  };

  return (
    <div style={{ marginBottom: 16, animation: "fadeIn 0.5s ease 0.2s both" }}>
      <div onClick={() => nav("prayer-home")} style={{ cursor: "pointer", borderRadius: 14, overflow: "hidden", background: `linear-gradient(165deg, ${g[0]} 0%, ${g[1]} 50%, ${g[0]} 100%)`, border: `1px solid rgba(255,255,255,0.08)`, boxShadow: "0 2px 16px rgba(0,0,0,0.15)", position: "relative" }}>
        {/* Top accent line */}
        <div style={{ height: 3, background: `linear-gradient(90deg, ${g[2]}60, ${g[2]}, ${g[2]}60)` }} />

        <div style={{ padding: "16px 18px 18px" }}>
          {/* Header row */}
          <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 10 }}>
            <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
              <span style={{ fontSize: 14, animation: "sacredPulse 2s ease infinite" }}>{"\ud83d\ude4f"}</span>
              <span style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: "rgba(255,255,255,0.5)", textTransform: "uppercase", letterSpacing: "0.12em" }}>Prayer of the Day</span>
            </div>
            {prayerStreak > 0 && (
              <div style={{ display: "flex", alignItems: "center", gap: 3, padding: "2px 8px", borderRadius: 10, background: "rgba(255,255,255,0.1)" }}>
                <span style={{ fontSize: 11 }}>{streakIcon(prayerStreak)}</span>
                <span style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: "rgba(255,255,255,0.7)" }}>{prayerStreak}</span>
              </div>
            )}
          </div>

          {/* Category pill */}
          <div style={{ marginBottom: 8 }}>
            <span style={{ padding: "2px 8px", borderRadius: 8, background: "rgba(255,255,255,0.1)", fontFamily: ht.ui, fontSize: 9, fontWeight: 600, color: "rgba(255,255,255,0.6)" }}>
              {catStyle ? `${p.category[0].toUpperCase()}${p.category.slice(1)}` : "Prayer"}
            </span>
          </div>

          {/* Prayer title */}
          <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: "#fff", lineHeight: 1.3, marginBottom: 6 }}>
            {p.title}
          </div>

          {/* Prayer body (truncated) */}
          <div style={{ fontFamily: ht.body, fontSize: 13, color: "rgba(255,255,255,0.7)", lineHeight: 1.5, marginBottom: 12, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
            {p.body}
          </div>

          {/* Bottom row: stats + CTA */}
          <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between" }}>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: "rgba(255,255,255,0.45)" }}>
              {totalPraying > 0 ? `${totalPraying} praying` : "Be the first to pray"} &middot; {timeAgo(p.created_at)}
            </div>
            <button onClick={handlePray} aria-label={isReacted ? "Already praying" : "Pray for this"}
              style={{ padding: "6px 14px", borderRadius: 8, border: "1px solid rgba(255,255,255,0.2)", background: isReacted ? "rgba(255,255,255,0.15)" : "rgba(255,255,255,0.08)", color: "#fff", fontFamily: ht.ui, fontSize: 11, fontWeight: 700, cursor: isReacted ? "default" : "pointer", display: "flex", alignItems: "center", gap: 4, transition: "all 0.15s" }}>
              <span style={{ fontSize: 12, animation: isReacted ? "none" : "sacredPulse 2s ease infinite" }}>{"\ud83d\ude4f"}</span>
              {isReacted ? "Praying" : "Pray for this"}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
