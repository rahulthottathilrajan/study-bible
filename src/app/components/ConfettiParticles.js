"use client";
import { useRef } from "react";

// ═══════════════════════════════════════════════════
// CONFETTI PARTICLES — Shared celebration component
// Uses confettiBurst keyframe from globals.css
// ═══════════════════════════════════════════════════
export default function ConfettiParticles({ count = 8, colors = ["#D4A853", "#C8A24D", "#E8D5A0", "#B89440"] }) {
  const particles = useRef(
    Array.from({ length: count }, (_, i) => ({
      cx: `${(Math.random() - 0.5) * 80}px`,
      cy: `${-60 - Math.random() * 40}px`,
      cr: `${360 + Math.random() * 360}deg`,
      delay: `${i * 0.06}s`,
      color: colors[i % colors.length],
      size: 5 + Math.random() * 3,
      left: `${20 + Math.random() * 60}%`,
    }))
  ).current;

  return (
    <div style={{ position: "absolute", top: 0, left: 0, right: 0, bottom: 0, pointerEvents: "none", overflow: "hidden" }}>
      {particles.map((p, i) => (
        <div key={i} style={{
          position: "absolute", top: "50%", left: p.left,
          width: p.size, height: p.size, borderRadius: i % 2 === 0 ? "50%" : "1px",
          background: p.color, opacity: 0,
          animation: `confettiBurst 1.5s ease-out ${p.delay} forwards`,
          "--cx": p.cx, "--cy": p.cy, "--cr": p.cr,
        }} />
      ))}
    </div>
  );
}
