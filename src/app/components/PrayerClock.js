"use client";
import { useState, useEffect, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner } from "./ui";
import { SEMANTIC_COLORS } from "../constants";

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
  return `${startStr} - ${pad(endH)}:${pad(endMin)}`;
}

function toViewerHour(slotHour, slotMinute, slotTz) {
  try {
    const now = new Date();
    const dateStr = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
    const slotDate = new Date(`${dateStr}T${String(slotHour).padStart(2, "0")}:${String(slotMinute).padStart(2, "0")}:00`);
    const viewerHour = Number(new Intl.DateTimeFormat("en-US", { hour: "numeric", hour12: false, timeZone: Intl.DateTimeFormat().resolvedOptions().timeZone }).format(slotDate));
    const slotTzHour = Number(new Intl.DateTimeFormat("en-US", { hour: "numeric", hour12: false, timeZone: slotTz || "UTC" }).format(slotDate));
    const diff = viewerHour - slotTzHour;
    return ((slotHour + diff) % 24 + 24) % 24;
  } catch { return slotHour; }
}

function sem(darkMode, type) { return SEMANTIC_COLORS[darkMode ? type + "Dark" : type]; }

export default function PrayerClock() {
  const {
    ht, darkMode, user, nav,
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
  const [confirmDeleteId, setConfirmDeleteId] = useState(null);

  const sc = sem(darkMode, "success");

  useEffect(() => {
    const t = setInterval(() => setCurrentTime(new Date()), 60000);
    return () => clearInterval(t);
  }, []);

  // Coverage map with timezone + duration spreading
  const coverageMap = useMemo(() => {
    const map = {};
    for (let h = 0; h < 24; h++) map[h] = 0;
    if (slotCoverage) {
      slotCoverage.forEach(s => {
        const startH = toViewerHour(s.slot_hour, s.slot_minute, s.timezone);
        const totalMin = (s.slot_minute || 0) + (s.duration_minutes || 30);
        const hoursSpanned = Math.ceil(totalMin / 60);
        for (let offset = 0; offset < hoursSpanned; offset++) {
          const h = (startH + offset) % 24;
          map[h] = Math.max(map[h], Number(s.user_count) || 0);
        }
      });
    }
    return map;
  }, [slotCoverage]);

  // Personal slot coverage for inner ring
  const mySlotHours = useMemo(() => {
    const set = new Set();
    if (mySlots) {
      mySlots.forEach(s => {
        const totalMin = (s.slot_minute || 0) + (s.duration_minutes || 30);
        const hoursSpanned = Math.ceil(totalMin / 60);
        for (let i = 0; i < hoursSpanned; i++) set.add((s.slot_hour + i) % 24);
      });
    }
    return set;
  }, [mySlots]);

  const totalPraying = useMemo(() => coverageMap[currentTime.getHours()] || 0, [coverageMap, currentTime]);
  const totalSlotsCovered = useMemo(() => Object.values(coverageMap).filter(v => v > 0).length, [coverageMap]);

  const activeSlot = useMemo(() => {
    if (!mySlots || mySlots.length === 0) return null;
    const h = currentTime.getHours(), m = currentTime.getMinutes(), day = currentTime.getDay();
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
  }, [mySlots, currentTime]);

  const handleSubmit = async () => {
    if (!user) return;
    setSubmitting(true);
    await addPrayerSlot({ hour: slotHour, minute: slotMinute, duration, frequency, customDays });
    setShowSignup(false); setSubmitting(false);
  };

  const toggleDay = (day) => setCustomDays(prev => prev.includes(day) ? prev.filter(d => d !== day) : [...prev, day]);

  const viewerTz = Intl.DateTimeFormat().resolvedOptions().timeZone;
  const clockSize = 280;
  const cx = clockSize / 2, cy = clockSize / 2;
  const outerR = 125, innerR = 90, personalR = 78;

  return (
    <div style={{ animation: "fadeIn 0.5s ease" }}>
      {/* Active slot banner */}
      {activeSlot && (
        <div style={{ background: `linear-gradient(135deg, ${sc.bg}, ${sc.border}15)`, border: `1.5px solid ${sc.border}`, borderRadius: 12, padding: "14px 16px", marginBottom: 16, display: "flex", alignItems: "center", gap: 12, animation: "fadeIn 0.4s ease" }}>
          <div style={{ width: 40, height: 40, borderRadius: "50%", background: sc.border, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 20, flexShrink: 0, animation: "sacredPulse 2s ease infinite" }}>{"\ud83d\ude4f"}</div>
          <div style={{ flex: 1 }}>
            <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: sc.text }}>Your prayer time is now!</div>
            <div style={{ fontFamily: ht.ui, fontSize: 11, color: sc.text, opacity: 0.8 }}>{formatSlotTime(activeSlot.slot_hour, activeSlot.slot_minute, activeSlot.duration_minutes)}</div>
          </div>
          <button aria-label="Enter prayer session" onClick={() => nav("prayer-slot-active")} style={{ padding: "8px 14px", borderRadius: 8, border: "none", background: sc.text, color: "#fff", fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>Enter</button>
        </div>
      )}

      {/* Stats bar with accents */}
      <div style={{ display: "flex", gap: 10, marginBottom: 16 }}>
        {[
          { n: totalPraying, l: "Praying Now", icon: "\ud83d\udd25", glow: totalPraying > 0 },
          { n: `${totalSlotsCovered}/24`, l: "Hours Covered", icon: "\ud83d\udd50" },
          { n: mySlots?.length || 0, l: "My Slots", icon: "\ud83d\udccb", gold: true },
        ].map((s, i) => (
          <div key={i} style={{ flex: 1, background: ht.card, borderRadius: 10, padding: "12px 8px", textAlign: "center", border: `1px solid ${ht.divider}`, borderLeft: `3px solid ${s.gold ? "#D4A853" : (s.glow ? ht.accent : ht.divider)}`, animation: s.glow ? "pulseGlow 2s ease infinite" : "none" }}>
            <div style={{ fontSize: 14, marginBottom: 2 }}>{s.icon}</div>
            <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark }}>{s.n}</div>
            <div style={{ fontFamily: ht.ui, fontSize: 9, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.06em" }}>{s.l}</div>
          </div>
        ))}
      </div>

      {/* Luminous 24-Hour Clock */}
      <Card t={ht} style={{ display: "flex", flexDirection: "column", alignItems: "center", padding: "24px 16px" }}>
        <Label icon={"\ud83d\udd50"} t={ht} color={ht.muted}>24-Hour Prayer Coverage</Label>
        <svg width={clockSize} height={clockSize} viewBox={`0 0 ${clockSize} ${clockSize}`} style={{ marginBottom: 12 }} role="img" aria-label={`Prayer clock: ${totalPraying} people praying now, ${totalSlotsCovered} hours covered`}>
          <defs>
            <radialGradient id="centerGlow">
              <stop offset="0%" stopColor={`${ht.accent}`} stopOpacity="0.08" />
              <stop offset="100%" stopColor={`${ht.accent}`} stopOpacity="0" />
            </radialGradient>
            <filter id="arcGlow">
              <feGaussianBlur stdDeviation="2" result="blur" />
              <feMerge><feMergeNode in="blur" /><feMergeNode in="SourceGraphic" /></feMerge>
            </filter>
          </defs>

          {/* Background circles */}
          <circle cx={cx} cy={cy} r={outerR} fill="none" stroke={ht.divider} strokeWidth="0.5" />
          <circle cx={cx} cy={cy} r={innerR} fill="none" stroke={ht.divider} strokeWidth="0.5" />

          {/* Center glow */}
          <circle cx={cx} cy={cy} r={innerR - 5} fill="url(#centerGlow)" />

          {/* Hour arc segments */}
          {Array.from({ length: 24 }, (_, h) => {
            const gap = 0.008; // small gap between segments
            const angle1 = ((h - 6) / 24) * Math.PI * 2 + gap;
            const angle2 = ((h - 5) / 24) * Math.PI * 2 - gap;
            const midAngle = (angle1 + angle2) / 2;
            const count = coverageMap[h];
            const isNow = h === currentTime.getHours();
            const isPersonal = mySlotHours.has(h);

            const x1o = cx + outerR * Math.cos(angle1);
            const y1o = cy + outerR * Math.sin(angle1);
            const x2o = cx + outerR * Math.cos(angle2);
            const y2o = cy + outerR * Math.sin(angle2);
            const x1i = cx + innerR * Math.cos(angle2);
            const y1i = cy + innerR * Math.sin(angle2);
            const x2i = cx + innerR * Math.cos(angle1);
            const y2i = cy + innerR * Math.sin(angle1);

            let fill = "transparent";
            let opacity = 1;
            if (count >= 3) { fill = ht.accent; opacity = 0.55; }
            else if (count >= 1) { fill = ht.accent; opacity = 0.25; }

            const labelR = (outerR + innerR) / 2;
            const lx = cx + labelR * Math.cos(midAngle);
            const ly = cy + labelR * Math.sin(midAngle);

            return (
              <g key={h}>
                {/* Outer coverage arc */}
                <path
                  d={`M ${x1o} ${y1o} A ${outerR} ${outerR} 0 0 1 ${x2o} ${y2o} L ${x1i} ${y1i} A ${innerR} ${innerR} 0 0 0 ${x2i} ${y2i} Z`}
                  fill={fill} fillOpacity={opacity}
                  stroke={isNow ? ht.accent : "transparent"}
                  strokeWidth={isNow ? 2 : 0}
                  filter={count >= 3 ? "url(#arcGlow)" : "none"}
                >
                  {isNow && <animate attributeName="fill-opacity" values={`${opacity};${Math.min(opacity + 0.2, 0.8)};${opacity}`} dur="2s" repeatCount="indefinite" />}
                </path>

                {/* Personal slot inner ring (gold) */}
                {isPersonal && (() => {
                  const pAngle1 = ((h - 6) / 24) * Math.PI * 2 + gap;
                  const pAngle2 = ((h - 5) / 24) * Math.PI * 2 - gap;
                  const px1 = cx + personalR * Math.cos(pAngle1);
                  const py1 = cy + personalR * Math.sin(pAngle1);
                  const px2 = cx + personalR * Math.cos(pAngle2);
                  const py2 = cy + personalR * Math.sin(pAngle2);
                  return (
                    <path d={`M ${px1} ${py1} A ${personalR} ${personalR} 0 0 1 ${px2} ${py2}`}
                      fill="none" stroke="#D4A853" strokeWidth="4" strokeLinecap="round" opacity="0.7" />
                  );
                })()}

                {/* Hour labels every 3 hours */}
                {h % 3 === 0 && (
                  <text x={lx} y={ly} textAnchor="middle" dominantBaseline="central" fill={isNow ? ht.accent : ht.muted} style={{ fontFamily: ht.ui, fontSize: 8, fontWeight: isNow ? 700 : 600 }}>
                    {formatHour(h).replace(" ", "\n")}
                  </text>
                )}
              </g>
            );
          })}

          {/* Current time indicator — glowing triangle */}
          {(() => {
            const nowAngle = ((currentTime.getHours() + currentTime.getMinutes() / 60 - 6) / 24) * Math.PI * 2;
            const tipR = outerR + 8;
            const tipX = cx + tipR * Math.cos(nowAngle);
            const tipY = cy + tipR * Math.sin(nowAngle);
            const baseR = outerR + 2;
            const spread = 0.015;
            const bx1 = cx + baseR * Math.cos(nowAngle - spread);
            const by1 = cy + baseR * Math.sin(nowAngle - spread);
            const bx2 = cx + baseR * Math.cos(nowAngle + spread);
            const by2 = cy + baseR * Math.sin(nowAngle + spread);
            return <polygon points={`${tipX},${tipY} ${bx1},${by1} ${bx2},${by2}`} fill={ht.accent} style={{ filter: `drop-shadow(0 0 3px ${ht.accent})` }}>
              <animate attributeName="opacity" values="0.7;1;0.7" dur="2s" repeatCount="indefinite" />
            </polygon>;
          })()}

          {/* Center content */}
          <text x={cx} y={cy - 10} textAnchor="middle" fill={ht.dark} style={{ fontFamily: ht.heading, fontSize: 26, fontWeight: 700 }}>
            {totalPraying}
          </text>
          <text x={cx} y={cy + 8} textAnchor="middle" fill={ht.muted} style={{ fontFamily: ht.ui, fontSize: 8, textTransform: "uppercase", letterSpacing: "0.1em" }}>
            interceding now
          </text>
        </svg>

        <div style={{ display: "flex", alignItems: "center", gap: 16, fontFamily: ht.ui, fontSize: 10, color: ht.light }}>
          <span><span style={{ display: "inline-block", width: 8, height: 8, borderRadius: 2, background: `${ht.accent}40`, marginRight: 4, verticalAlign: "middle" }}></span>1-2</span>
          <span><span style={{ display: "inline-block", width: 8, height: 8, borderRadius: 2, background: `${ht.accent}90`, marginRight: 4, verticalAlign: "middle" }}></span>3+</span>
          <span><span style={{ display: "inline-block", width: 8, height: 3, borderRadius: 2, background: "#D4A853", marginRight: 4, verticalAlign: "middle" }}></span>Your slots</span>
        </div>
      </Card>

      {/* Sign up for a slot */}
      <div style={{ marginTop: 16 }}>
        {!showSignup ? (
          <button aria-label="Sign up for a prayer slot" onClick={() => { if (!user) { nav("account"); return; } setShowSignup(true); }}
            style={{ width: "100%", padding: "14px 16px", borderRadius: 12, border: `1.5px dashed ${ht.accent}`, background: `${ht.accent}08`, color: ht.accent, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
            + Sign Up for a Prayer Slot
          </button>
        ) : (
          <Card t={ht} style={{ animation: "fadeIn 0.3s ease" }}>
            <Label icon={"\u23f0"} t={ht}>Choose Your Prayer Time</Label>
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Duration</div>
              <div style={{ display: "flex", gap: 6 }} role="radiogroup" aria-label="Prayer duration">
                {DURATION_OPTIONS.map(d => (
                  <button key={d.value} onClick={() => setDuration(d.value)} role="radio" aria-checked={duration === d.value}
                    style={{ flex: 1, padding: "8px 0", borderRadius: 8, border: `1.5px solid ${duration === d.value ? ht.accent : ht.divider}`, background: duration === d.value ? `${ht.accent}18` : "transparent", color: duration === d.value ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                    {d.label}
                  </button>
                ))}
              </div>
            </div>
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Start Time</div>
              <div style={{ display: "flex", gap: 8, alignItems: "center" }}>
                <select value={slotHour} onChange={e => setSlotHour(Number(e.target.value))} aria-label="Hour"
                  style={{ flex: 1, padding: "10px 8px", borderRadius: 8, border: `1.5px solid ${ht.divider}`, background: ht.bg, color: ht.dark, fontFamily: ht.ui, fontSize: 14, outline: "none" }}>
                  {Array.from({ length: 24 }, (_, h) => <option key={h} value={h}>{formatHour(h)}</option>)}
                </select>
                <span style={{ fontFamily: ht.ui, fontSize: 16, color: ht.muted }}>:</span>
                <select value={slotMinute} onChange={e => setSlotMinute(Number(e.target.value))} aria-label="Minute"
                  style={{ flex: 1, padding: "10px 8px", borderRadius: 8, border: `1.5px solid ${ht.divider}`, background: ht.bg, color: ht.dark, fontFamily: ht.ui, fontSize: 14, outline: "none" }}>
                  {[0, 15, 30, 45].map(m => <option key={m} value={m}>{String(m).padStart(2, "0")}</option>)}
                </select>
              </div>
              <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 4 }}>{viewerTz}</div>
            </div>
            <div style={{ marginBottom: 14 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Frequency</div>
              <div style={{ display: "flex", gap: 6 }} role="radiogroup" aria-label="Prayer frequency">
                {FREQUENCY_OPTIONS.map(f => (
                  <button key={f.value} onClick={() => setFrequency(f.value)} role="radio" aria-checked={frequency === f.value}
                    style={{ flex: 1, padding: "8px 0", borderRadius: 8, border: `1.5px solid ${frequency === f.value ? ht.accent : ht.divider}`, background: frequency === f.value ? `${ht.accent}18` : "transparent", color: frequency === f.value ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer" }}>
                    {f.label}
                  </button>
                ))}
              </div>
            </div>
            {frequency === "custom" && (
              <div style={{ marginBottom: 14 }}>
                <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, marginBottom: 6, textTransform: "uppercase", letterSpacing: "0.06em" }}>Days</div>
                <div style={{ display: "flex", gap: 4 }}>
                  {DAY_NAMES.map((name, i) => (
                    <button key={i} onClick={() => toggleDay(i)} aria-label={name} aria-pressed={customDays.includes(i)}
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
            <Label icon={"\ud83d\udccb"} t={ht} color={ht.muted}>My Prayer Slots</Label>
            {mySlots.map(s => (
              <div key={s.id} style={{ display: "flex", alignItems: "center", justifyContent: "space-between", padding: "10px 12px", border: `1px solid ${ht.divider}`, borderRadius: 8, marginBottom: 6, borderLeft: "3px solid #D4A853" }}>
                <div>
                  <div style={{ fontFamily: ht.ui, fontSize: 13, fontWeight: 600, color: ht.dark }}>{formatSlotTime(s.slot_hour, s.slot_minute, s.duration_minutes)}</div>
                  <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted }}>
                    {s.frequency === "custom" ? (s.custom_days || []).map(d => DAY_NAMES[d]).join(", ") : s.frequency === "weekdays" ? "Mon-Fri" : "Every day"}
                  </div>
                </div>
                {confirmDeleteId === s.id ? (
                  <div style={{ display: "flex", gap: 4 }}>
                    <button aria-label="Confirm remove" onClick={() => { deletePrayerSlot(s.id); setConfirmDeleteId(null); }}
                      style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${sem(darkMode, "error").border}`, background: sem(darkMode, "error").bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: sem(darkMode, "error").text, cursor: "pointer" }}>Remove</button>
                    <button aria-label="Cancel" onClick={() => setConfirmDeleteId(null)}
                      style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ht.muted, cursor: "pointer" }}>Cancel</button>
                  </div>
                ) : (
                  <button aria-label="Remove prayer slot" onClick={() => setConfirmDeleteId(s.id)}
                    style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: sem(darkMode, "error").text, cursor: "pointer" }}>Remove</button>
                )}
              </div>
            ))}
          </Card>
        </div>
      )}

      {slotsLoading && <div style={{ marginTop: 16 }}><Spinner t={ht} /></div>}
    </div>
  );
}
