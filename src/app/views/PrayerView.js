"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner } from "../components/ui";
import Header from "../components/Header";
import PrayerCommunity from "../components/PrayerCommunity";
import PrayerClock from "../components/PrayerClock";
import PrayerSlotActive from "../components/PrayerSlotActive";
import { SEMANTIC_COLORS } from "../constants";

const PRAYER_TABS = [
  { id: "community", label: "Community", icon: "\ud83d\ude4f" },
  { id: "clock", label: "Clock", icon: "\ud83d\udd50" },
  { id: "journal", label: "Journal", icon: "\ud83d\udcd6" },
];

const TITLE_LIMIT = 200;
const BODY_LIMIT = 2000;

function sem(darkMode, type) { return SEMANTIC_COLORS[darkMode ? type + "Dark" : type]; }

// Streak icon progression
function streakIcon(count) {
  if (count >= 30) return "\u26a1";
  if (count >= 14) return "\ud83d\udd25\ud83d\udd25";
  if (count >= 7) return "\ud83d\udd25";
  if (count >= 1) return "\ud83d\udd6f\ufe0f";
  return "";
}

export default function PrayerView() {
  const {
    view, ht, darkMode, user, prayerTab, setPrayerTab, nav, bp,
    prayers, prayerLoading, prayerTitle, setPrayerTitle,
    prayerText, setPrayerText, addPrayer, togglePrayerAnswered, deletePrayer,
    cooldownActive, prayerStreak,
  } = useApp();

  const [confirmDeleteId, setConfirmDeleteId] = useState(null);

  if (view === "prayer-slot-active") return <PrayerSlotActive />;

  const currentTab = PRAYER_TABS.find(t => t.id === prayerTab) ? prayerTab : "community";
  const sc = sem(darkMode, "success");
  const ec = sem(darkMode, "error");

  // Sacred entry: subtle radial glow overlay
  const sacredBg = `radial-gradient(ellipse at 50% 0%, ${ht.accent}08 0%, transparent 60%), ${ht.bg}`;

  return (
    <div style={{ minHeight: "100vh", background: sacredBg, paddingBottom: 80 }}>
      <Header title="Community" subtitle="Prayer & Fellowship" theme={ht}
        right={prayerStreak > 0 ? (
          <div style={{ display: "flex", alignItems: "center", gap: 4, padding: "4px 10px", borderRadius: 20, background: `${ht.accent}15`, border: `1px solid ${ht.accentBorder}` }}>
            <span style={{ fontSize: 14, animation: prayerStreak >= 7 ? "sacredPulse 2s ease infinite" : "none" }}>{streakIcon(prayerStreak)}</span>
            <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.accent }}>{prayerStreak}</span>
          </div>
        ) : null}
      />
      <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
        {/* Tab switcher */}
        <div style={{ display: "flex", background: ht.card, borderRadius: 10, padding: 3, marginBottom: 18, border: `1px solid ${ht.divider}` }} role="tablist" aria-label="Prayer sections">
          {PRAYER_TABS.map(tb => (
            <button key={tb.id} onClick={() => setPrayerTab(tb.id)} role="tab" aria-selected={currentTab === tb.id}
              style={{ flex: 1, padding: "11px 8px", border: "none", borderRadius: 8, background: currentTab === tb.id ? ht.tabActive : "transparent", color: currentTab === tb.id ? ht.headerText : ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
              {tb.icon} {tb.label}
            </button>
          ))}
        </div>

        {/* Tab content with fade animation */}
        <div key={currentTab} style={{ animation: "fadeIn 0.4s ease" }}>
          {currentTab === "community" && <PrayerCommunity />}
          {currentTab === "clock" && <PrayerClock />}
          {currentTab === "journal" && (
            <div>
              {!user ? (
                <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
                  <div style={{ fontSize: 36, marginBottom: 12 }}>{"\ud83d\udd10"}</div>
                  <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Sign In to See Your Journal</div>
                  <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginBottom: 14, lineHeight: 1.6 }}>Save your personal prayers as you study God's Word.</div>
                  <button onClick={() => nav("account")} style={{ padding: "12px 28px", borderRadius: 10, border: "none", background: ht.headerGradient, color: ht.headerText, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Sign In / Sign Up</button>
                </Card>
              ) : (
                <>
                  <Card t={ht} style={{ marginBottom: 14 }}>
                    <Label icon={"\u270f\ufe0f"} t={ht}>New Prayer</Label>
                    <input value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} maxLength={TITLE_LIMIT} placeholder="Prayer title..." aria-label="Prayer title"
                      style={{ width: "100%", padding: "10px 0", border: "none", borderBottom: `1px solid ${ht.divider}`, fontFamily: ht.heading, fontSize: 15, color: ht.dark, outline: "none", background: "transparent", marginBottom: 10, boxSizing: "border-box" }} />
                    <textarea value={prayerText} onChange={e => setPrayerText(e.target.value)} maxLength={BODY_LIMIT} placeholder="Write your prayer..." rows={3} aria-label="Prayer text"
                      style={{ width: "100%", padding: "8px 0", border: "none", fontFamily: ht.body, fontSize: 14, color: ht.text, outline: "none", background: "transparent", resize: "vertical", lineHeight: 1.7, boxSizing: "border-box" }} />
                    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginTop: 4 }}>
                      <button onClick={async () => { await addPrayer(); }} disabled={!prayerText.trim() || cooldownActive}
                        style={{ padding: "10px 20px", borderRadius: 8, border: "none", background: prayerText.trim() && !cooldownActive ? ht.accent : ht.divider, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: prayerText.trim() && !cooldownActive ? "pointer" : "default" }}>
                        {cooldownActive ? "Please wait..." : "Add Prayer"}
                      </button>
                      <div style={{ fontFamily: ht.ui, fontSize: 10, color: prayerText.length > BODY_LIMIT - 200 ? ec.text : ht.light }}>
                        {prayerText.length}/{BODY_LIMIT}
                      </div>
                    </div>
                  </Card>
                  {prayerLoading ? <Spinner t={ht} /> :
                    prayers.length === 0 ? (
                      <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>Your prayers will appear here</div>
                    ) : prayers.map(p => (
                      <div key={p.id} role="article" aria-label={`Prayer: ${p.title}`}
                        style={{ background: ht.card, borderRadius: 12, padding: "14px 16px", border: `1px solid ${p.is_answered ? sc.border + "44" : ht.divider}`, marginBottom: 8, borderLeft: `3px solid ${p.is_answered ? sc.border : ht.accent}` }}>
                        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                          <div style={{ flex: 1 }}>
                            <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 600, color: ht.dark }}>{p.title}</div>
                            {p.book_name && <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.accent, marginTop: 2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                            <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.65, marginTop: 6 }}>{p.prayer_text}</div>
                            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                          </div>
                          <div style={{ display: "flex", gap: 6, flexShrink: 0, marginLeft: 10 }}>
                            <button aria-label={p.is_answered ? "Answered" : "Mark as answered"} onClick={() => togglePrayerAnswered(p.id, p.is_answered)}
                              style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${p.is_answered ? sc.border : ht.divider}`, background: p.is_answered ? sc.bg : "transparent", fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: p.is_answered ? sc.text : ht.muted, cursor: "pointer" }}>
                              {p.is_answered ? "\u2713 Answered" : "Mark Answered"}
                            </button>
                            {confirmDeleteId === p.id ? (
                              <div style={{ display: "flex", gap: 4 }}>
                                <button aria-label="Confirm delete" onClick={() => { deletePrayer(p.id); setConfirmDeleteId(null); }}
                                  style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${ec.border}`, background: ec.bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ec.text, cursor: "pointer" }}>
                                  Delete
                                </button>
                                <button aria-label="Cancel delete" onClick={() => setConfirmDeleteId(null)}
                                  style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ht.muted, cursor: "pointer" }}>
                                  No
                                </button>
                              </div>
                            ) : (
                              <button aria-label="Delete prayer" onClick={() => setConfirmDeleteId(p.id)}
                                style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ec.text, cursor: "pointer" }}>{"\u2715"}</button>
                            )}
                          </div>
                        </div>
                      </div>
                    ))}
                </>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
