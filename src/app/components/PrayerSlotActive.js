"use client";
import { useState, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { Card, Spinner } from "./ui";
import Header from "./Header";

export default function PrayerSlotActive() {
  const {
    ht, user, communityPrayers, communityPrayersLoading,
    loadCommunityPrayers, toggleReaction, userReactions,
    mySlots, goBack,
  } = useApp();

  const [currentIdx, setCurrentIdx] = useState(0);
  const [prayedFor, setPrayedFor] = useState(new Set());
  const [timeLeft, setTimeLeft] = useState("");
  const [complete, setComplete] = useState(false);

  // Track slot completion for badges
  useEffect(() => {
    if (complete) {
      try {
        const count = parseInt(localStorage.getItem("prayerSlotsCompleted") || "0", 10);
        localStorage.setItem("prayerSlotsCompleted", String(count + 1));
      } catch {}
    }
  }, [complete]);

  // Find the active slot
  const activeSlot = useMemo(() => {
    if (!mySlots || mySlots.length === 0) return null;
    const now = new Date();
    const h = now.getHours();
    const m = now.getMinutes();
    const dayOfWeek = now.getDay();
    return mySlots.find(s => {
      const startMin = s.slot_hour * 60 + s.slot_minute;
      const endMin = startMin + s.duration_minutes;
      const nowMin = h * 60 + m;
      if (nowMin < startMin || nowMin >= endMin) return false;
      if (s.frequency === "daily") return true;
      if (s.frequency === "weekdays") return dayOfWeek >= 1 && dayOfWeek <= 5;
      if (s.frequency === "custom") return s.custom_days?.includes(dayOfWeek);
      return false;
    });
  }, [mySlots]);

  // Load community prayers for this slot
  useEffect(() => { loadCommunityPrayers(); }, [loadCommunityPrayers]);

  // Countdown timer
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

  const handlePrayed = () => {
    if (!current) return;
    // Add "praying" reaction
    if (user && !userReactions?.[current.id]?.praying) {
      toggleReaction(current.id, "praying");
    }
    setPrayedFor(prev => new Set([...prev, current.id]));
    if (currentIdx < activePrayers.length - 1) {
      setCurrentIdx(currentIdx + 1);
    } else {
      setComplete(true);
    }
  };

  if (!activeSlot) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Prayer Time" theme={ht} />
        <div style={{ padding: "40px 20px", maxWidth: 520, margin: "0 auto", textAlign: "center" }}>
          <div style={{ fontSize: 42, marginBottom: 14 }}>🕐</div>
          <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 8 }}>No Active Slot</div>
          <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>Your prayer time hasn't started yet, or it has ended. Check your prayer clock for your scheduled times.</div>
          <button onClick={goBack} style={{ marginTop: 16, padding: "10px 20px", borderRadius: 8, border: "none", background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer" }}>Back to Clock</button>
        </div>
      </div>
    );
  }

  if (complete) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
        <Header title="Prayer Time" theme={ht} />
        <div style={{ padding: "40px 20px", maxWidth: 520, margin: "0 auto", textAlign: "center" }}>
          <div style={{ fontSize: 52, marginBottom: 16 }}>🙏</div>
          <div style={{ fontFamily: ht.heading, fontSize: 22, color: ht.dark, marginBottom: 8 }}>Amen!</div>
          <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.text, lineHeight: 1.6, marginBottom: 6 }}>
            You prayed for {prayedFor.size} request{prayedFor.size !== 1 ? "s" : ""} during this session.
          </div>
          <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.muted, fontStyle: "italic", lineHeight: 1.6, marginBottom: 20 }}>
            "The effectual fervent prayer of a righteous man availeth much." — James 5:16
          </div>
          <button onClick={goBack} style={{ padding: "12px 24px", borderRadius: 10, border: "none", background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Return to Prayer Clock</button>
        </div>
      </div>
    );
  }

  return (
    <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
      <Header title="Prayer Time" theme={ht} />
      <div style={{ padding: "16px 20px 40px", maxWidth: 520, margin: "0 auto" }}>
        {/* Timer bar */}
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 16, padding: "10px 14px", background: `${ht.accent}12`, borderRadius: 10, border: `1px solid ${ht.accentBorder}` }}>
          <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.accent }}>
            Time remaining
          </div>
          <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.accent }}>
            {timeLeft}
          </div>
        </div>

        {/* Progress */}
        <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, textAlign: "center", marginBottom: 14 }}>
          Request {currentIdx + 1} of {activePrayers.length} &middot; Prayed for {prayedFor.size}
        </div>

        {communityPrayersLoading ? <Spinner t={ht} /> : !current ? (
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>🙏</div>
            <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.muted }}>No prayer requests to pray over right now.</div>
          </Card>
        ) : (
          <Card t={ht} style={{ padding: "24px 20px" }}>
            {/* Author */}
            <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 12 }}>
              <div style={{ width: 32, height: 32, borderRadius: "50%", background: current.is_anonymous ? ht.divider : ht.headerGradient, display: "flex", alignItems: "center", justifyContent: "center", color: current.is_anonymous ? ht.muted : ht.headerText, fontFamily: ht.ui, fontSize: 12, fontWeight: 700 }}>
                {current.is_anonymous ? "?" : (current.user_display_name || "A")[0].toUpperCase()}
              </div>
              <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>
                {current.is_anonymous ? "Anonymous" : (current.user_display_name || "A Believer")}
              </div>
            </div>

            {/* Prayer content */}
            <div style={{ fontFamily: ht.heading, fontSize: 18, fontWeight: 700, color: ht.dark, marginBottom: 8 }}>{current.title}</div>
            <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.text, lineHeight: 1.7, marginBottom: 20 }}>{current.body}</div>

            {/* Actions */}
            <div style={{ display: "flex", gap: 10 }}>
              <button onClick={handlePrayed}
                style={{ flex: 1, padding: "14px", borderRadius: 10, border: "none", background: "#7ED4AD", color: "#fff", fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", gap: 6 }}>
                🙏 I Prayed for This
              </button>
              <button onClick={() => {
                if (currentIdx < activePrayers.length - 1) setCurrentIdx(currentIdx + 1);
                else setComplete(true);
              }}
                style={{ padding: "14px 16px", borderRadius: 10, border: `1px solid ${ht.divider}`, background: "transparent", color: ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer" }}>
                Skip
              </button>
            </div>
          </Card>
        )}
      </div>
    </div>
  );
}
