"use client";
import { useState, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner } from "./ui";

const DURATION_OPTIONS = [
  { value: 15, label: "15 min" },
  { value: 30, label: "30 min" },
  { value: 60, label: "1 hour" },
];

const FREQUENCY_OPTIONS = [
  { value: "daily", label: "Daily" },
  { value: "weekdays", label: "Weekdays" },
  { value: "custom", label: "Custom" },
];

const DAY_NAMES = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

function formatHour(h) {
  if (h === 0) return "12 AM";
  if (h < 12) return `${h} AM`;
  if (h === 12) return "12 PM";
  return `${h - 12} PM`;
}

function formatSlotTime(h, m, dur) {
  const pad = n => String(n).padStart(2, "0");
  const startStr = `${pad(h)}:${pad(m)}`;
  const endM = m + dur;
  const endH = (h + Math.floor(endM / 60)) % 24;
  const endMin = endM % 60;
  const endStr = `${pad(endH)}:${pad(endMin)}`;
  return `${startStr} - ${endStr}`;
}

export default function PrayerClock() {
  const {
    ht, user, nav,
    slotCoverage, mySlots, slotsLoading,
    loadSlotCoverage, loadMySlots, addPrayerSlot, deletePrayerSlot,
  } = useApp();

  const [showSignup, setShowSignup] = useState(false);
  const [duration, setDuration] = useState(30);
  const [slotHour, setSlotHour] = useState(new Date().getHours());
  const [slotMinute, setSlotMinute] = useState(0);
  const [frequency, setFrequency] = useState("daily");
  const [customDays, setCustomDays] = useState([]);
  const [submitting, setSubmitting] = useState(false);
  const [currentTime, setCurrentTime] = useState(new Date());

  // Update current time every minute
  useEffect(() => {
    const t = setInterval(() => setCurrentTime(new Date()), 60000);
    return () => clearInterval(t);
  }, []);

  // Build coverage map: { hour: count }
  const coverageMap = useMemo(() => {
    const map = {};
    for (let h = 0; h < 24; h++) map[h] = 0;
    if (slotCoverage) {
      slotCoverage.forEach(s => {
        // A slot at hour h with duration d covers h through h+(d/60) hours
        const startH = s.slot_hour;
        map[startH] = Math.max(map[startH], Number(s.user_count) || 0);
      });
    }
    return map;
  }, [slotCoverage]);

  const totalPraying = useMemo(() => {
    const now = currentTime;
    const h = now.getHours();
    return coverageMap[h] || 0;
  }, [coverageMap, currentTime]);

  const totalSlotsCovered = useMemo(() => {
    return Object.values(coverageMap).filter(v => v > 0).length;
  }, [coverageMap]);

  // Check if user has an active slot right now
  const activeSlot = useMemo(() => {
    if (!mySlots || mySlots.length === 0) return null;
    const now = currentTime;
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
  }, [mySlots, currentTime]);

  const handleSubmit = async () => {
    if (!user) return;
    setSubmitting(true);
    await addPrayerSlot({ hour: slotHour, minute: slotMinute, duration, frequency, customDays });
    setShowSignup(false);
    setSubmitting(false);
  };

  const toggleDay = (day) => {
    setCustomDays(prev => prev.includes(day) ? prev.filter(d => d !== day) : [...prev, day]);
  };

  // SVG Clock
  const clockSize = 260;
  const cx = clockSize / 2;
  const cy = clockSize / 2;
  const outerR = 115;
  const innerR = 80;

  return (
    <div>
      {/* Active slot banner */}
      {activeSlot && (
        <div style={{ background: "linear-gradient(135deg, #7ED4AD22, #2E7D5B15)", border: "1.5px solid #7ED4AD", borderRadius: 12, padding: "14px 16px", marginBottom: 16, display: "flex", alignItems: "center", gap: 12 }}>
          <div style={{ width: 40, height: 40, borderRadius: "50%", background: "#7ED4AD", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 20, flexShrink: 0 }}>🙏</div>
          <div style={{ flex: 1 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: "#2E7D5B" }}>Your prayer time is now!</div>
            <div style={{ fontFamily: ht.ui, fontSize: 11, color: "#2E7D5B", opacity: 0.8 }}>
              {formatSlotTime(activeSlot.slot_hour, activeSlot.slot_minute, activeSlot.duration_minutes)}
            </div>
          </div>
          <button onClick={() => nav("prayer-slot-active")} style={{ padding: "8px 14px", borderRadius: 8, border: "none", background: "#2E7D5B", color: "#fff", fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
            Enter
          </button>
        </div>
      )}

      {/* Stats bar */}
      <div style={{ display: "flex", gap: 10, marginBottom: 16 }}>
        {[
          { n: totalPraying, l: "Praying Now", icon: "🔥" },
          { n: totalSlotsCovered, l: "Hours Covered", icon: "🕐" },
          { n: mySlots?.length || 0, l: "My Slots", icon: "📋" },
        ].map((s, i) => (
          <div key={i} style={{ flex: 1, background: ht.card, borderRadius: 10, padding: "12px 8px", textAlign: "center", border: `1px solid ${ht.divider}` }}>
            <div style={{ fontSize: 14, marginBottom: 2 }}>{s.icon}</div>
            <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark }}>{s.n}</div>
            <div style={{ fontFamily: ht.ui, fontSize: 9, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.06em" }}>{s.l}</div>
          </div>
        ))}
      </div>

      {/* 24-Hour Clock SVG */}
      <Card t={ht} style={{ display: "flex", flexDirection: "column", alignItems: "center", padding: "20px 16px" }}>
        <Label icon="🕐" t={ht} color={ht.muted}>24-Hour Prayer Coverage</Label>
        <svg width={clockSize} height={clockSize} viewBox={`0 0 ${clockSize} ${clockSize}`} style={{ marginBottom: 12 }}>
          {/* Background circle */}
          <circle cx={cx} cy={cy} r={outerR} fill="none" stroke={ht.divider} strokeWidth="1" />
          <circle cx={cx} cy={cy} r={innerR} fill="none" stroke={ht.divider} strokeWidth="1" />

          {/* Hour segments */}
          {Array.from({ length: 24 }, (_, h) => {
            const angle1 = ((h - 6) / 24) * Math.PI * 2;
            const angle2 = ((h - 5) / 24) * Math.PI * 2;
            const midAngle = (angle1 + angle2) / 2;
            const count = coverageMap[h];
            const isNow = h === currentTime.getHours();

            // Arc path for the segment
            const x1o = cx + outerR * Math.cos(angle1);
            const y1o = cy + outerR * Math.sin(angle1);
            const x2o = cx + outerR * Math.cos(angle2);
            const y2o = cy + outerR * Math.sin(angle2);
            const x1i = cx + innerR * Math.cos(angle2);
            const y1i = cy + innerR * Math.sin(angle2);
            const x2i = cx + innerR * Math.cos(angle1);
            const y2i = cy + innerR * Math.sin(angle1);

            let fill = "transparent";
            if (count >= 3) fill = `${ht.accent}60`;
            else if (count >= 1) fill = `${ht.accent}30`;

            const labelR = (outerR + innerR) / 2;
            const lx = cx + labelR * Math.cos(midAngle);
            const ly = cy + labelR * Math.sin(midAngle);

            return (
              <g key={h}>
                <path
                  d={`M ${x1o} ${y1o} A ${outerR} ${outerR} 0 0 1 ${x2o} ${y2o} L ${x1i} ${y1i} A ${innerR} ${innerR} 0 0 0 ${x2i} ${y2i} Z`}
                  fill={fill}
                  stroke={isNow ? ht.accent : ht.divider}
                  strokeWidth={isNow ? 2 : 0.5}
                />
                {h % 3 === 0 && (
                  <text x={lx} y={ly} textAnchor="middle" dominantBaseline="central" fill={ht.muted} style={{ fontFamily: ht.ui, fontSize: 8, fontWeight: 600 }}>
                    {formatHour(h).replace(" ", "\n")}
                  </text>
                )}
              </g>
            );
          })}

          {/* Current time indicator */}
          {(() => {
            const nowAngle = ((currentTime.getHours() + currentTime.getMinutes() / 60 - 6) / 24) * Math.PI * 2;
            const tipX = cx + (outerR + 6) * Math.cos(nowAngle);
            const tipY = cy + (outerR + 6) * Math.sin(nowAngle);
            return <circle cx={tipX} cy={tipY} r={4} fill={ht.accent} />;
          })()}

          {/* Center text */}
          <text x={cx} y={cy - 8} textAnchor="middle" fill={ht.dark} style={{ fontFamily: ht.heading, fontSize: 22, fontWeight: 700 }}>
            {totalPraying}
          </text>
          <text x={cx} y={cy + 10} textAnchor="middle" fill={ht.muted} style={{ fontFamily: ht.ui, fontSize: 9, textTransform: "uppercase", letterSpacing: "0.08em" }}>
            praying now
          </text>
        </svg>

        <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.light, textAlign: "center" }}>
          Light = 1-2 intercessors &middot; Solid = 3+ intercessors
        </div>
      </Card>

      {/* Sign up for a slot */}
      <div style={{ marginTop: 16 }}>
        {!showSignup ? (
          <button onClick={() => { if (!user) { nav("account"); return; } setShowSignup(true); }}
            style={{ width: "100%", padding: "14px 16px", borderRadius: 12, border: `1.5px dashed ${ht.accent}`, background: `${ht.accent}08`, color: ht.accent, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
            + Sign Up for a Prayer Slot
          </button>
        ) : (
          <Card t={ht}>
            <Label icon="⏰" t={ht}>Choose Your Prayer Time</Label>

            {/* Duration */}
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Duration</div>
              <div style={{ display: "flex", gap: 6 }}>
                {DURATION_OPTIONS.map(d => (
                  <button key={d.value} onClick={() => setDuration(d.value)}
                    style={{ flex: 1, padding: "8px 0", borderRadius: 8, border: `1.5px solid ${duration === d.value ? ht.accent : ht.divider}`, background: duration === d.value ? `${ht.accent}18` : "transparent", color: duration === d.value ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                    {d.label}
                  </button>
                ))}
              </div>
            </div>

            {/* Time picker */}
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Start Time</div>
              <div style={{ display: "flex", gap: 8, alignItems: "center" }}>
                <select value={slotHour} onChange={e => setSlotHour(Number(e.target.value))}
                  style={{ flex: 1, padding: "10px 8px", borderRadius: 8, border: `1.5px solid ${ht.divider}`, background: ht.bg, color: ht.dark, fontFamily: ht.ui, fontSize: 14, outline: "none" }}>
                  {Array.from({ length: 24 }, (_, h) => (
                    <option key={h} value={h}>{formatHour(h)}</option>
                  ))}
                </select>
                <span style={{ fontFamily: ht.ui, fontSize: 16, color: ht.muted }}>:</span>
                <select value={slotMinute} onChange={e => setSlotMinute(Number(e.target.value))}
                  style={{ flex: 1, padding: "10px 8px", borderRadius: 8, border: `1.5px solid ${ht.divider}`, background: ht.bg, color: ht.dark, fontFamily: ht.ui, fontSize: 14, outline: "none" }}>
                  {[0, 15, 30, 45].map(m => (
                    <option key={m} value={m}>{String(m).padStart(2, "0")}</option>
                  ))}
                </select>
              </div>
            </div>

            {/* Frequency */}
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Frequency</div>
              <div style={{ display: "flex", gap: 6 }}>
                {FREQUENCY_OPTIONS.map(f => (
                  <button key={f.value} onClick={() => setFrequency(f.value)}
                    style={{ flex: 1, padding: "8px 0", borderRadius: 8, border: `1.5px solid ${frequency === f.value ? ht.accent : ht.divider}`, background: frequency === f.value ? `${ht.accent}18` : "transparent", color: frequency === f.value ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                    {f.label}
                  </button>
                ))}
              </div>
            </div>

            {/* Custom days */}
            {frequency === "custom" && (
              <div style={{ marginBottom: 14 }}>
                <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Days</div>
                <div style={{ display: "flex", gap: 4 }}>
                  {DAY_NAMES.map((name, i) => (
                    <button key={i} onClick={() => toggleDay(i)}
                      style={{ flex: 1, padding: "8px 0", borderRadius: 6, border: `1.5px solid ${customDays.includes(i) ? ht.accent : ht.divider}`, background: customDays.includes(i) ? `${ht.accent}18` : "transparent", color: customDays.includes(i) ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 10, fontWeight: 700, cursor: "pointer" }}>
                      {name}
                    </button>
                  ))}
                </div>
              </div>
            )}

            <div style={{ display: "flex", gap: 8 }}>
              <button onClick={handleSubmit} disabled={submitting || (frequency === "custom" && customDays.length === 0)}
                style={{ padding: "10px 20px", borderRadius: 8, border: "none", background: ht.accent, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", opacity: submitting ? 0.7 : 1 }}>
                {submitting ? "Saving..." : "Commit to Prayer"}
              </button>
              <button onClick={() => setShowSignup(false)}
                style={{ padding: "10px 16px", borderRadius: 8, border: `1px solid ${ht.divider}`, background: "transparent", color: ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer" }}>
                Cancel
              </button>
            </div>
          </Card>
        )}
      </div>

      {/* My Slots */}
      {user && mySlots && mySlots.length > 0 && (
        <div style={{ marginTop: 16 }}>
          <Card t={ht}>
            <Label icon="📋" t={ht} color={ht.muted}>My Prayer Slots</Label>
            {mySlots.map(s => (
              <div key={s.id} style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "10px 12px", border: `1px solid ${ht.divider}`, borderRadius: 8, marginBottom: 6 }}>
                <div>
                  <div style={{ fontFamily: ht.ui, fontSize: 13, fontWeight: 600, color: ht.dark }}>
                    {formatSlotTime(s.slot_hour, s.slot_minute, s.duration_minutes)}
                  </div>
                  <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
                    {s.frequency === "custom" ? s.custom_days.map(d => DAY_NAMES[d]).join(", ") : s.frequency === "weekdays" ? "Mon-Fri" : "Every day"}
                  </div>
                </div>
                <button onClick={() => deletePrayerSlot(s.id)}
                  style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: "#E8625C", cursor: "pointer" }}>
                  Remove
                </button>
              </div>
            ))}
          </Card>
        </div>
      )}

      {slotsLoading && <div style={{ marginTop: 16 }}><Spinner t={ht} /></div>}
    </div>
  );
}
