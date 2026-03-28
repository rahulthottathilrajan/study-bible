"use client";
import { useState, useEffect } from "react";

// ═══════════════════════════════════════════════════
// MASTERY RING — Animated SVG progress ring
// Tiers: bronze (<50%), silver (50-79%), gold (≥80%)
// ═══════════════════════════════════════════════════

const TIER_COLORS = {
  none: "#999",
  bronze: "#CD7F32",
  silver: "#C0C0C0",
  gold: "#D4A853",
};

export function getTier(percentage) {
  if (percentage >= 80) return "gold";
  if (percentage >= 50) return "silver";
  if (percentage > 0) return "bronze";
  return "none";
}

export function getTierColor(percentage) {
  return TIER_COLORS[getTier(percentage)];
}

export default function MasteryRing({
  percentage = 0,
  size = 48,
  strokeWidth = 3,
  theme,
  animate = true,
  showLabel = false,
}) {
  const [animated, setAnimated] = useState(animate ? 0 : percentage);
  const r = (size - strokeWidth * 2) / 2;
  const circ = 2 * Math.PI * r;
  const offset = circ - (animated / 100) * circ;
  const color = getTierColor(percentage);

  useEffect(() => {
    if (!animate) { setAnimated(percentage); return; }
    const timer = setTimeout(() => setAnimated(percentage), 100);
    return () => clearTimeout(timer);
  }, [percentage, animate]);

  return (
    <div style={{ position: "relative", width: size, height: size, flexShrink: 0 }}>
      <svg width={size} height={size} style={{ transform: "rotate(-90deg)" }}>
        <circle cx={size / 2} cy={size / 2} r={r}
          fill="none" stroke={theme?.divider || "rgba(0,0,0,0.1)"} strokeWidth={strokeWidth} />
        {percentage > 0 && (
          <circle cx={size / 2} cy={size / 2} r={r}
            fill="none" stroke={color} strokeWidth={strokeWidth}
            strokeDasharray={circ} strokeDashoffset={offset}
            strokeLinecap="round"
            style={{ transition: animate ? "stroke-dashoffset 1s ease-out" : "none" }} />
        )}
      </svg>
      {showLabel && (
        <div style={{
          position: "absolute", top: 0, left: 0, right: 0, bottom: 0,
          display: "flex", alignItems: "center", justifyContent: "center",
          fontFamily: theme?.ui || "sans-serif", fontSize: size * 0.24,
          fontWeight: 800, color: percentage > 0 ? color : (theme?.muted || "#999"),
        }}>
          {percentage > 0 ? `${percentage}%` : "—"}
        </div>
      )}
    </div>
  );
}
