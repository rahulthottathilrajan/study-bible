"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { HEBREW_XP_LEVELS } from "./HebrewDailyData";

export default function HebrewProgressPath() {
  const { darkMode, hebrewProgress, hebrewLessons, hebrewXP, hebrewStreak } = useApp();
  const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;

  const completedCount = Object.values(hebrewProgress).filter(p => p.completed).length;
  const currentLevel = [...HEBREW_XP_LEVELS].reverse().find(l => hebrewXP >= l.min) || HEBREW_XP_LEVELS[0];
  const nextLevel = HEBREW_XP_LEVELS[HEBREW_XP_LEVELS.indexOf(currentLevel) + 1];
  const xpProgress = nextLevel ? ((hebrewXP - currentLevel.min) / (nextLevel.min - currentLevel.min)) * 100 : 100;

  // Build milestone nodes from lessons
  const MILESTONES = [1, 5, 10, 15, 22, 30, 50];
  const nodes = MILESTONES.filter(m => m <= Math.max(completedCount + 5, 10));

  return (
    <div style={{ marginBottom:18 }}>
      {/* XP Level Bar */}
      <div style={{ background:ht2.card, borderRadius:14, border:`1px solid ${ht2.divider}`, padding:"14px 16px", marginBottom:10 }}>
        <div style={{ display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom:8 }}>
          <div style={{ display:"flex", alignItems:"center", gap:8 }}>
            <span style={{ fontSize:18 }}>{currentLevel.icon}</span>
            <div>
              <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:ht2.dark }}>{currentLevel.name}</div>
              <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.muted }}>{currentLevel.title}</div>
            </div>
          </div>
          <div style={{ textAlign:"right" }}>
            <div style={{ fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.accent }}>{hebrewXP} XP</div>
            {nextLevel && <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.light }}>{nextLevel.min - hebrewXP} to {nextLevel.name}</div>}
          </div>
        </div>
        <div style={{ background:ht2.divider, borderRadius:4, height:6, overflow:"hidden" }}>
          <div style={{ width:`${xpProgress}%`, height:"100%", background:`linear-gradient(90deg, ${ht2.accent}, #D4A853)`, borderRadius:4, transition:"width 0.5s ease" }}/>
        </div>
        {/* Streak */}
        {hebrewStreak.count > 0 && (
          <div style={{ display:"flex", alignItems:"center", gap:6, marginTop:8 }}>
            <span style={{ fontSize:14 }}>🔥</span>
            <span style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.accent }}>{hebrewStreak.count}-day streak</span>
            {hebrewStreak.longest > hebrewStreak.count && (
              <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light }}>· Best: {hebrewStreak.longest}</span>
            )}
          </div>
        )}
      </div>

      {/* Milestone Path */}
      <div style={{ display:"flex", alignItems:"center", overflowX:"auto", gap:0, padding:"4px 0", scrollbarWidth:"none", WebkitOverflowScrolling:"touch" }}>
        {nodes.map((milestone, i) => {
          const reached = completedCount >= milestone;
          const isCurrent = completedCount >= milestone && (i === nodes.length - 1 || completedCount < nodes[i + 1]);
          const score = reached ? 90 : 0; // simplified
          const tierColor = score >= 90 ? "#FFD700" : score >= 70 ? "#C0C0C0" : score > 0 ? "#CD7F32" : ht2.divider;
          return (
            <div key={milestone} style={{ display:"flex", alignItems:"center", flexShrink:0 }}>
              {i > 0 && (
                <div style={{ width:24, height:2, background:reached?ht2.accent:ht2.divider, transition:"background 0.3s" }}/>
              )}
              <div style={{
                width:32, height:32, borderRadius:"50%",
                background:reached?`${ht2.accent}22`:ht2.bg,
                border:`2px solid ${reached?ht2.accent:ht2.divider}`,
                display:"flex", alignItems:"center", justifyContent:"center",
                fontFamily:ht2.ui, fontSize:10, fontWeight:700,
                color:reached?ht2.accent:ht2.light,
                animation:isCurrent?"pulseGlow 2s ease-in-out infinite":"none",
                boxShadow:reached&&score>=90?`0 0 8px rgba(255,215,0,0.3)`:"none",
                transition:"all 0.3s",
                position:"relative",
              }}>
                {reached ? "✓" : milestone}
              </div>
            </div>
          );
        })}
      </div>
      <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.muted, textAlign:"center", marginTop:4 }}>
        {completedCount} lesson{completedCount !== 1 ? "s" : ""} completed
      </div>
    </div>
  );
}
