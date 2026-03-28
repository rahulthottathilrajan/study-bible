"use client";
import { useState, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { Card, Spinner } from "./ui";
import Header from "./Header";
import { SEMANTIC_COLORS, PRAYER_CATEGORY_STYLE } from "../constants";

function sem(darkMode, type) { return SEMANTIC_COLORS[darkMode ? type + "Dark" : type]; }

const INTERCESSION_VERSES = [
  { ref: "James 5:16", text: "The effectual fervent prayer of a righteous man availeth much." },
  { ref: "1 Timothy 2:1", text: "I exhort therefore, that...supplications, prayers, intercessions...be made for all men." },
  { ref: "Philippians 4:6", text: "In every thing by prayer and supplication...let your requests be made known unto God." },
];

const CONFETTI_CHARS = ["\u2720", "\u2665", "\ud83d\ude4f", "\u2726", "\u2727", "\u271d", "\u2605", "\u2724", "\u2661", "\u2742", "\u2741", "\u2740"];

export default function PrayerSlotActive() {
  const {
    ht, darkMode, user, communityPrayers, communityPrayersLoading,
    loadCommunityPrayers, toggleReaction, userReactions,
    mySlots, goBack, bp, recordPrayerActivity,
  } = useApp();

  const [currentIdx, setCurrentIdx] = useState(0);
  const [prayedFor, setPrayedFor] = useState(new Set());
  const [timeLeft, setTimeLeft] = useState("");
  const [remainingSeconds, setRemainingSeconds] = useState(0);
  const [complete, setComplete] = useState(false);
  const [transitioning, setTransitioning] = useState(false);

  const sc = sem(darkMode, "success");

  useEffect(() => {
    if (complete) {
      try {
        const count = parseInt(localStorage.getItem("prayerSlotsCompleted") || "0", 10);
        localStorage.setItem("prayerSlotsCompleted", String(count + 1));
      } catch {}
      recordPrayerActivity();
    }
  }, [complete, recordPrayerActivity]);

  const activeSlot = useMemo(() => {
    if (!mySlots || mySlots.length === 0) return null;
    const now = new Date();
    const h = now.getHours(), m = now.getMinutes(), day = now.getDay();
    return mySlots.find(s => {
      const startMin = s.slot_hour * 60 + s.slot_minute;
      const endMin = startMin + s.duration_minutes;
      const nowMin = h * 60 + m;
      if (nowMin < startMin || nowMin >= endMin) return false;
      if (s.frequency === "daily") return true;
      if (s.frequency === "weekdays") return day >= 1 && day <= 5;
      if (s.frequency === "custom") return s.custom_days?.includes(day);
      return false;
    });
  }, [mySlots]);

  useEffect(() => { loadCommunityPrayers(); }, [loadCommunityPrayers]);

  const totalSeconds = activeSlot ? activeSlot.duration_minutes * 60 : 0;

  useEffect(() => {
    if (!activeSlot) return;
    const tick = () => {
      const now = new Date();
      const endMin = activeSlot.slot_hour * 60 + activeSlot.slot_minute + activeSlot.duration_minutes;
      const endH = Math.floor(endMin / 60) % 24;
      const endM = endMin % 60;
      const end = new Date();
      end.setHours(endH, endM, 0, 0);
      const diff = Math.max(0, Math.floor((end - now) / 1000));
      setRemainingSeconds(diff);
      const mm = Math.floor(diff / 60);
      const ss = diff % 60;
      setTimeLeft(`${mm}:${String(ss).padStart(2, "0")}`);
    };
    tick();
    const t = setInterval(tick, 1000);
    return () => clearInterval(t);
  }, [activeSlot]);

  const activePrayers = (communityPrayers || []).filter(p => !p.is_answered);
  const current = activePrayers[currentIdx];
  const verseIdx = currentIdx % INTERCESSION_VERSES.length;

  const advanceCard = (prayed) => {
    if (prayed && current) {
      if (user && !userReactions?.[current.id]?.praying) toggleReaction(current.id, "praying");
      setPrayedFor(prev => new Set([...prev, current.id]));
    }
    if (currentIdx < activePrayers.length - 1) {
      setTransitioning(true);
      setTimeout(() => { setCurrentIdx(currentIdx + 1); setTransitioning(false); }, 300);
    } else {
      setComplete(true);
    }
  };

  // Breathing timer SVG
  const timerSize = 120;
  const timerCx = timerSize / 2, timerCy = timerSize / 2, timerR = 50;
  const circumference = 2 * Math.PI * timerR;
  const progress = totalSeconds > 0 ? (totalSeconds - remainingSeconds) / totalSeconds : 0;
  const dashOffset = circumference * (1 - progress);

  if (!activeSlot) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Prayer Time" theme={ht} />
        <div style={{ padding: `40px ${bp.pad}px`, maxWidth: bp.content, margin: "0 auto", textAlign: "center" }}>
          <div style={{ fontSize: 42, marginBottom: 14 }}>{"\ud83d\udd50"}</div>
          <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 8 }}>No Active Slot</div>
          <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>Your prayer time hasn't started yet, or it has ended.</div>
          <button aria-label="Back to prayer clock" onClick={goBack} style={{ marginTop: 16, padding: "10px 20px", borderRadius: 8, border: "none", background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer" }}>Back to Clock</button>
        </div>
      </div>
    );
  }

  if (complete) {
    return (
      <div style={{ minHeight: "100vh", background: `radial-gradient(ellipse at 50% 30%, ${ht.accent}08 0%, transparent 60%), ${ht.bg}`, paddingBottom: 80 }}>
        <Header title="Prayer Time" theme={ht} />
        <div style={{ padding: `40px ${bp.pad}px`, maxWidth: bp.content, margin: "0 auto", textAlign: "center", position: "relative" }}>
          {/* Confetti burst */}
          <div style={{ position: "absolute", top: 0, left: "50%", transform: "translateX(-50%)", pointerEvents: "none", width: 200, height: 100 }}>
            {CONFETTI_CHARS.map((ch, i) => (
              <span key={i} style={{ position: "absolute", left: `${20 + (i * 14) % 160}px`, fontSize: 12 + (i % 3) * 4, animation: `confettiFloat ${0.8 + i * 0.1}s ease ${i * 0.05}s forwards`, opacity: 0, color: i % 2 === 0 ? "#D4A853" : sc.border }}>{ch}</span>
            ))}
          </div>

          <div style={{ fontSize: 52, marginBottom: 16, animation: "scaleIn 0.5s ease" }}>{"\ud83d\ude4f"}</div>
          <div style={{ fontFamily: ht.heading, fontSize: 26, color: ht.dark, marginBottom: 10, animation: "dropIn 0.4s ease 0.3s both" }}>Amen!</div>
          <div style={{ fontFamily: ht.body, fontSize: 16, color: ht.text, lineHeight: 1.6, marginBottom: 6, animation: "fadeIn 0.5s ease 0.6s both" }}>
            You prayed for <strong>{prayedFor.size}</strong> request{prayedFor.size !== 1 ? "s" : ""} during this session.
          </div>
          <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, fontStyle: "italic", lineHeight: 1.6, marginBottom: 24, padding: "12px 16px", background: `${ht.accent}08`, borderRadius: 10, borderLeft: `3px solid ${ht.accent}30`, animation: "fadeIn 0.5s ease 1.2s both" }}>
            &ldquo;The effectual fervent prayer of a righteous man availeth much.&rdquo;
            <span style={{ display: "block", fontFamily: ht.ui, fontSize: 10, color: ht.light, fontStyle: "normal", marginTop: 4 }}>&mdash; James 5:16 (KJV)</span>
          </div>
          <button aria-label="Return to prayer clock" onClick={goBack} style={{ padding: "14px 28px", borderRadius: 10, border: "none", background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", animation: "fadeIn 0.5s ease 1.8s both" }}>Return to Prayer Clock</button>
        </div>
      </div>
    );
  }

  const catStyle = current ? (PRAYER_CATEGORY_STYLE[current.category] || PRAYER_CATEGORY_STYLE.general) : null;

  return (
    <div style={{ minHeight: "100vh", background: `radial-gradient(ellipse at 50% 20%, ${ht.accent}06 0%, transparent 50%), ${ht.bg}`, paddingBottom: 80 }}>
      {/* Ambient overlay */}
      <div style={{ position: "fixed", inset: 0, background: `linear-gradient(170deg, transparent 60%, ${ht.accent}04 100%)`, pointerEvents: "none", zIndex: 0, animation: "sacredPulse 6s ease infinite" }} />

      <Header title="Prayer Time" theme={ht} />
      <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto", position: "relative", zIndex: 1 }}>

        {/* Breathing timer circle */}
        <div style={{ display: "flex", justifyContent: "center", marginBottom: 20 }}>
          <div style={{ animation: "breathe 4s ease infinite" }}>
            <svg width={timerSize} height={timerSize} viewBox={`0 0 ${timerSize} ${timerSize}`}>
              {/* Background track */}
              <circle cx={timerCx} cy={timerCy} r={timerR} fill="none" stroke={ht.divider} strokeWidth="4" />
              {/* Progress ring */}
              <circle cx={timerCx} cy={timerCy} r={timerR} fill="none" stroke={ht.accent} strokeWidth="4" strokeLinecap="round"
                strokeDasharray={circumference} strokeDashoffset={dashOffset}
                transform={`rotate(-90 ${timerCx} ${timerCy})`}
                style={{ transition: "stroke-dashoffset 1s linear" }} />
              {/* Time text */}
              <text x={timerCx} y={timerCy - 4} textAnchor="middle" fill={ht.dark} style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700 }}>{timeLeft}</text>
              <text x={timerCx} y={timerCy + 14} textAnchor="middle" fill={ht.muted} style={{ fontFamily: ht.ui, fontSize: 8, textTransform: "uppercase", letterSpacing: "0.08em" }}>remaining</text>
            </svg>
          </div>
        </div>

        {/* Progress */}
        <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, textAlign: "center", marginBottom: 16 }}>
          Request {currentIdx + 1} of {activePrayers.length} &middot; Prayed for {prayedFor.size}
        </div>

        {communityPrayersLoading ? <Spinner t={ht} /> : !current ? (
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>{"\ud83d\ude4f"}</div>
            <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.muted }}>No prayer requests to pray over right now.</div>
          </Card>
        ) : (
          <div style={{ opacity: transitioning ? 0 : 1, transform: transitioning ? "translateX(-20px)" : "translateX(0)", transition: "all 0.3s ease" }}>
            <Card t={ht} style={{ padding: "28px 22px", borderLeft: `3px solid ${catStyle ? catStyle.color : ht.accent}` }}>
              {/* Author */}
              <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 14 }}>
                <div style={{ width: 32, height: 32, borderRadius: "50%", background: current.is_anonymous ? ht.divider : ht.headerGradient, display: "flex", alignItems: "center", justifyContent: "center", color: current.is_anonymous ? ht.muted : ht.headerText, fontFamily: ht.ui, fontSize: 12, fontWeight: 700 }}>
                  {current.is_anonymous ? "?" : (current.user_display_name || "A")[0].toUpperCase()}
                </div>
                <div style={{ flex: 1 }}>
                  <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>{current.is_anonymous ? "Anonymous" : (current.user_display_name || "A Believer")}</div>
                </div>
                {catStyle && (
                  <span style={{ padding: "3px 8px", borderRadius: 10, background: catStyle.bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: catStyle.color }}>
                    {(PRAYER_CATEGORY_STYLE[current.category] || {}).icon || "\u271d\ufe0f"} {current.category}
                  </span>
                )}
              </div>

              {/* Prayer content */}
              <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark, marginBottom: 8, lineHeight: 1.3 }}>{current.title}</div>
              <div style={{ fontFamily: ht.body, fontSize: 16, color: ht.text, lineHeight: 1.7, marginBottom: 20 }}>{current.body}</div>

              {/* Intercession verse */}
              <div style={{ fontFamily: ht.body, fontSize: 12, fontStyle: "italic", color: ht.light, lineHeight: 1.5, padding: "8px 12px", background: `${ht.accent}06`, borderRadius: 8, borderLeft: `2px solid ${ht.accent}20`, marginBottom: 20 }}>
                &ldquo;{INTERCESSION_VERSES[verseIdx].text}&rdquo;
                <span style={{ fontStyle: "normal", display: "block", fontSize: 10, color: ht.light, marginTop: 2 }}>&mdash; {INTERCESSION_VERSES[verseIdx].ref} (KJV)</span>
              </div>

              {/* Actions */}
              <div style={{ display: "flex", gap: 10 }}>
                <button aria-label="I prayed for this request" onClick={() => advanceCard(true)}
                  style={{ flex: 1, padding: "14px", borderRadius: 10, border: "none", background: sc.border, color: "#fff", fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", gap: 6, transition: "transform 0.15s", }}>
                  {"\ud83d\ude4f"} I Prayed for This
                </button>
                <button aria-label="Skip this prayer request" onClick={() => advanceCard(false)}
                  style={{ padding: "14px 16px", borderRadius: 10, border: `1px solid ${ht.divider}`, background: "transparent", color: ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer" }}>
                  Skip
                </button>
              </div>
            </Card>
          </div>
        )}
      </div>
    </div>
  );
}
