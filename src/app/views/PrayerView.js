"use client";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner } from "../components/ui";
import Header from "../components/Header";
import PrayerCommunity from "../components/PrayerCommunity";
import PrayerClock from "../components/PrayerClock";
import PrayerSlotActive from "../components/PrayerSlotActive";

const PRAYER_TABS = [
  { id: "community", label: "Community", icon: "🙏" },
  { id: "clock", label: "Clock", icon: "🕐" },
  { id: "journal", label: "Journal", icon: "📖" },
];

export default function PrayerView() {
  const {
    view, ht, user, prayerTab, setPrayerTab, nav, bp,
    // Private journal (reused from existing)
    prayers, prayerLoading, prayerTitle, setPrayerTitle,
    prayerText, setPrayerText, addPrayer, togglePrayerAnswered, deletePrayer,
  } = useApp();

  // Active slot view — full-screen, no tabs
  if (view === "prayer-slot-active") return <PrayerSlotActive />;

  const currentTab = PRAYER_TABS.find(t => t.id === prayerTab) ? prayerTab : "community";

  return (
    <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
      <Header title="Prayer" subtitle="Lift up one another" theme={ht} />
      <div style={{ padding: `16px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
        {/* Tab switcher */}
        <div style={{ display: "flex", background: ht.card, borderRadius: 10, padding: 3, marginBottom: 18, border: `1px solid ${ht.divider}` }}>
          {PRAYER_TABS.map(tb => (
            <button key={tb.id} onClick={() => setPrayerTab(tb.id)}
              style={{ flex: 1, padding: "11px 8px", border: "none", borderRadius: 8, background: currentTab === tb.id ? ht.tabActive : "transparent", color: currentTab === tb.id ? ht.headerText : ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
              {tb.icon} {tb.label}
            </button>
          ))}
        </div>

        {/* COMMUNITY TAB */}
        {currentTab === "community" && <PrayerCommunity />}

        {/* CLOCK TAB */}
        {currentTab === "clock" && <PrayerClock />}

        {/* JOURNAL TAB — Private prayer journal (reused from JournalView prayers) */}
        {currentTab === "journal" && (
          <div>
            {!user ? (
              <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
                <div style={{ fontSize: 36, marginBottom: 12 }}>🔐</div>
                <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Sign In to See Your Journal</div>
                <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginBottom: 14, lineHeight: 1.6 }}>Save your personal prayers as you study God's Word.</div>
                <button onClick={() => nav("account")} style={{ padding: "12px 28px", borderRadius: 10, border: "none", background: ht.headerGradient, color: ht.headerText, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Sign In / Sign Up</button>
              </Card>
            ) : (
              <>
                <Card t={ht} style={{ marginBottom: 14 }}>
                  <Label icon="✏️" t={ht}>New Prayer</Label>
                  <input value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder="Prayer title..." style={{ width: "100%", padding: "10px 0", border: "none", borderBottom: `1px solid ${ht.divider}`, fontFamily: ht.heading, fontSize: 15, color: ht.dark, outline: "none", background: "transparent", marginBottom: 10, boxSizing: "border-box" }} />
                  <textarea value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width: "100%", padding: "8px 0", border: "none", fontFamily: ht.body, fontSize: 14, color: ht.text, outline: "none", background: "transparent", resize: "vertical", lineHeight: 1.7, boxSizing: "border-box" }} />
                  <button onClick={async () => { await addPrayer(); }} disabled={!prayerText.trim()} style={{ marginTop: 10, padding: "10px 20px", borderRadius: 8, border: "none", background: prayerText.trim() ? ht.accent : ht.divider, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: prayerText.trim() ? "pointer" : "default" }}>Add Prayer</button>
                </Card>
                {prayerLoading ? <Spinner t={ht} /> :
                  prayers.length === 0 ? (
                    <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>Your prayers will appear here</div>
                  ) : prayers.map(p => (
                    <div key={p.id} style={{ background: ht.card, borderRadius: 12, padding: "14px 16px", border: `1px solid ${p.is_answered ? "#7ED4AD44" : ht.divider}`, marginBottom: 8, borderLeft: `3px solid ${p.is_answered ? "#7ED4AD" : ht.accent}` }}>
                      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                        <div style={{ flex: 1 }}>
                          <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 600, color: ht.dark }}>{p.title}</div>
                          {p.book_name && <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.accent, marginTop: 2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                          <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.65, marginTop: 6 }}>{p.prayer_text}</div>
                          <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                        </div>
                        <div style={{ display: "flex", gap: 6, flexShrink: 0, marginLeft: 10 }}>
                          <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${p.is_answered ? "#7ED4AD" : ht.divider}`, background: p.is_answered ? "#7ED4AD22" : "transparent", fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: p.is_answered ? "#2E7D5B" : ht.muted, cursor: "pointer" }}>
                            {p.is_answered ? "\u2713 Answered" : "Mark Answered"}
                          </button>
                          <button onClick={() => deletePrayer(p.id)} style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: "#E8625C", cursor: "pointer" }}>{"\u2715"}</button>
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
  );
}
