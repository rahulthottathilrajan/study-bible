"use client";
import { useState } from "react";

const RP_THEME = {
  bg:      "#FFFBF0",
  card:    "#FFFFFF",
  hero:    "linear-gradient(135deg, #B8860B 0%, #D4A853 40%, #92400E 100%)",
  accent:  "#B8860B",
  text:    "#1F2937",
  muted:   "#6B7280",
  divider: "#E5E7EB",
  font:    "'Georgia', serif",
};

const DIFFICULTY_STYLE = {
  "Beginner":   { bg: "#D1FAE5", color: "#065F46" },
  "Accessible": { bg: "#CCFBF1", color: "#0F766E" },
  "Moderate":   { bg: "#FEF3C7", color: "#92400E" },
  "Advanced":   { bg: "#FFE4E6", color: "#9F1239" },
};

const READING_PLANS = [
  {
    id: "bible-in-a-year",
    title: "Bible in a Year",
    subtitle: "From Genesis to Revelation in 365 days",
    duration: "365 days",
    dailyTime: "~15 min/day",
    difficulty: "Moderate",
    description: "Read through the entire KJV Bible in one year. Each day combines Old Testament narrative, Psalms/Proverbs, and New Testament — so you always have variety and never get stuck in one section for weeks.",
    structure: "3 readings per day: OT passage + Psalm/Proverb + NT passage",
    color: "#B8860B",
    icon: "📅",
    category: "Full Bible",
    chapters: 1189,
    chapsPerDay: "~3.25",
    whatYoullRead: [
      "Old Testament: Genesis → Malachi",
      "New Testament: Matthew → Revelation",
      "A Psalm or Proverb woven in each day",
      "You finish the entire Word of God in 12 months",
    ],
  },
  {
    id: "nt-90",
    title: "New Testament in 90 Days",
    subtitle: "The Gospels, letters, and Revelation — one season",
    duration: "90 days",
    dailyTime: "~10 min/day",
    difficulty: "Accessible",
    description: "A focused, achievable journey through the 27 books of the New Testament. Perfect for new believers, or anyone wanting to ground themselves in the life of Christ and the early church before tackling the full Bible.",
    structure: "~3 chapters/day through Matthew → Revelation",
    color: "#1B7A6E",
    icon: "📖",
    category: "New Testament",
    chapters: 260,
    chapsPerDay: "~2.9",
    whatYoullRead: [
      "The four Gospels: Matthew, Mark, Luke, John",
      "Acts — the birth of the church",
      "Paul's letters: Romans → Philemon",
      "General Epistles: Hebrews → Jude",
      "Revelation",
    ],
  },
  {
    id: "life-of-jesus",
    title: "The Life of Jesus",
    subtitle: "30 days through all four Gospels",
    duration: "30 days",
    dailyTime: "~8 min/day",
    difficulty: "Beginner",
    description: "Walk through the life of Christ in a single month — from the eternal Word of John 1, through the Sermon on the Mount, the miracles, the upper room, the cross, and the resurrection. Each day is a focused passage, not a marathon.",
    structure: "Harmonised daily passages from Matthew, Mark, Luke, John",
    color: "#7C3AED",
    icon: "🕊️",
    category: "Gospels",
    chapters: 89,
    chapsPerDay: "~3",
    whatYoullRead: [
      "Day 1–5: The birth and early ministry of Christ",
      "Day 6–12: The Sermon on the Mount and miracles",
      "Day 13–20: Parables and confrontations in Jerusalem",
      "Day 21–26: The upper room and the cross",
      "Day 27–30: Resurrection appearances and the Great Commission",
    ],
  },
  {
    id: "psalms-proverbs",
    title: "Psalms & Proverbs",
    subtitle: "Worship and wisdom for every season of life",
    duration: "60 days",
    dailyTime: "~7 min/day",
    difficulty: "Beginner",
    description: "The two great wisdom books of the Old Testament. Psalms teaches us how to pray — in joy, grief, fear, and praise. Proverbs teaches us how to live — with integrity, diligence, and the fear of the LORD. Read together, they cover every human emotion and every practical situation.",
    structure: "2–3 Psalms per day + 1 Proverbs chapter",
    color: "#D97706",
    icon: "📜",
    category: "Wisdom",
    chapters: 181,
    chapsPerDay: "~3",
    whatYoullRead: [
      "All 150 Psalms — lament, praise, trust, and triumph",
      "All 31 chapters of Proverbs",
      "Morning Psalms for worship, evening Proverbs for reflection",
      "A complete picture of the devotional life of Israel",
    ],
  },
  {
    id: "epistles",
    title: "Paul's Letters & the General Epistles",
    subtitle: "Doctrine and discipleship for everyday life",
    duration: "45 days",
    dailyTime: "~10 min/day",
    difficulty: "Moderate",
    description: "Romans through Jude — the letters that built the church. Paul, Peter, James, John, and Jude wrote to real communities facing real struggles. Their words are as urgent today. This plan moves thematically: justification (Romans), freedom (Galatians), unity (Ephesians), suffering (1 Peter), love (1 John).",
    structure: "1–2 letters per week, chapter-by-chapter",
    color: "#0369A1",
    icon: "✝️",
    category: "Epistles",
    chapters: 87,
    chapsPerDay: "~2",
    whatYoullRead: [
      "Week 1–2: Romans & Galatians — justification by faith",
      "Week 3: Ephesians, Philippians, Colossians — the body of Christ",
      "Week 4: Thessalonians, Timothy, Titus — the church and the end",
      "Week 5–6: Hebrews, James, Peter, John, Jude — faith in trial",
    ],
  },
  {
    id: "prophets",
    title: "The Prophets",
    subtitle: "Isaiah to Malachi — the voice of God to his people",
    duration: "90 days",
    dailyTime: "~12 min/day",
    difficulty: "Advanced",
    description: "The 17 prophetic books are the most underread section of the Bible — and the most quoted by Jesus and the New Testament. This plan pairs major prophets (Isaiah, Jeremiah, Ezekiel, Daniel) with minor prophets (Hosea, Amos, Micah, Malachi), providing context for each book before you begin.",
    structure: "Major prophet + paired minor prophet per week",
    color: "#9F1239",
    icon: "🔥",
    category: "Prophets",
    chapters: 250,
    chapsPerDay: "~2.8",
    whatYoullRead: [
      "Isaiah — the gospel before the gospel",
      "Jeremiah & Lamentations — weeping with the prophet",
      "Ezekiel — visions, judgment, and the dry bones",
      "Daniel — the sovereignty of God over empires",
      "The Twelve: Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, Malachi",
    ],
  },
  {
    id: "storyline",
    title: "The Bible Storyline",
    subtitle: "The one story of Scripture in 21 days",
    duration: "21 days",
    dailyTime: "~12 min/day",
    difficulty: "Accessible",
    description: "Not every chapter — the spine of the whole story. From creation to fall, Abraham to Moses, David to exile, exile to Christ, cross to resurrection, church to new creation. This plan gives you the narrative skeleton so every other reading makes sense.",
    structure: "3 passages per day — one OT narrative, one Psalm, one NT echo",
    color: "#065F46",
    icon: "🌿",
    category: "Overview",
    chapters: 63,
    chapsPerDay: "~3",
    whatYoullRead: [
      "Day 1–3: Creation, Fall, Flood, and the call of Abraham",
      "Day 4–7: The Exodus, the Law, and the Promised Land",
      "Day 8–11: David, Solomon, and the divided kingdom",
      "Day 12–14: Exile and the cry for return",
      "Day 15–18: The Gospels — the long-awaited King arrives",
      "Day 19–21: The church, the letters, and the new creation",
    ],
  },
];

const ALL_CATEGORIES = ["All", "Full Bible", "New Testament", "Gospels", "Wisdom", "Epistles", "Prophets", "Overview"];

export default function ReadingPlans({ nav }) {
  const [activeTab, setActiveTab] = useState("plans");
  const [selectedPlan, setSelectedPlan] = useState(null);
  const [modalOpen, setModalOpen] = useState(false);
  const [animIn, setAnimIn] = useState(false);
  const [categoryFilter, setCategoryFilter] = useState("All");
  const [activePlans, setActivePlans] = useState({}); // { planId: { startedAt, daysCounted } }
  const [completedDays, setCompletedDays] = useState({}); // { planId: number }

  const openModal = (plan) => {
    setSelectedPlan(plan);
    setModalOpen(true);
    setTimeout(() => setAnimIn(true), 10);
  };

  const closeModal = () => {
    setAnimIn(false);
    setTimeout(() => { setModalOpen(false); setSelectedPlan(null); }, 300);
  };

  const startPlan = (plan) => {
    setActivePlans(prev => ({
      ...prev,
      [plan.id]: { startedAt: new Date().toISOString() }
    }));
    setCompletedDays(prev => ({ ...prev, [plan.id]: prev[plan.id] || 0 }));
    closeModal();
    setActiveTab("active");
  };

  const markDayDone = (planId) => {
    const plan = READING_PLANS.find(p => p.id === planId);
    const totalDays = parseInt(plan.duration);
    setCompletedDays(prev => {
      const current = prev[planId] || 0;
      return { ...prev, [planId]: Math.min(current + 1, totalDays) };
    });
  };

  const filteredPlans = categoryFilter === "All"
    ? READING_PLANS
    : READING_PLANS.filter(p => p.category === categoryFilter);

  const myActivePlans = READING_PLANS.filter(p => activePlans[p.id]);

  return (
    <div style={{ minHeight: "100vh", background: RP_THEME.bg, fontFamily: RP_THEME.font }}>

      {/* ── HERO ── */}
      <div style={{ background: RP_THEME.hero, padding: "0 0 24px" }}>
        {/* Back button */}
        <div style={{ padding: "16px 20px 0" }}>
          <button
            onClick={() => nav("learn-home")}
            style={{ background: "rgba(255,255,255,0.2)", border: "none", borderRadius: 20,
              color: "#fff", padding: "6px 14px", fontSize: 14, cursor: "pointer",
              display: "flex", alignItems: "center", gap: 6 }}
          >
            ← Back
          </button>
        </div>

        {/* Hero content */}
        <div style={{ textAlign: "center", padding: "20px 24px 0" }}>
          <div style={{ fontSize: 48, marginBottom: 8 }}>🗓️</div>
          <h1 style={{ color: "#fff", fontSize: 28, fontWeight: 700, margin: "0 0 6px",
            textShadow: "0 1px 4px rgba(0,0,0,0.3)" }}>
            Reading Plans
          </h1>
          <p style={{ color: "rgba(255,255,255,0.88)", fontSize: 15, margin: "0 0 20px" }}>
            Guided journeys through the Word
          </p>

          {/* Stats row */}
          <div style={{ display: "flex", justifyContent: "center", gap: 24 }}>
            {[
              { label: "Plans", value: READING_PLANS.length },
              { label: "Active", value: myActivePlans.length },
              { label: "Shortest", value: "21 days" },
            ].map(s => (
              <div key={s.label} style={{ textAlign: "center" }}>
                <div style={{ color: "#fff", fontSize: 22, fontWeight: 700 }}>{s.value}</div>
                <div style={{ color: "rgba(255,255,255,0.75)", fontSize: 12 }}>{s.label}</div>
              </div>
            ))}
          </div>
        </div>

        {/* Tab switcher */}
        <div style={{ display: "flex", gap: 8, padding: "20px 20px 0", justifyContent: "center" }}>
          {[{ key: "plans", label: "All Plans" }, { key: "active", label: `My Plans${myActivePlans.length ? ` (${myActivePlans.length})` : ""}` }].map(t => (
            <button key={t.key}
              onClick={() => setActiveTab(t.key)}
              style={{
                padding: "8px 22px", borderRadius: 20, border: "2px solid rgba(255,255,255,0.6)",
                background: activeTab === t.key ? "#fff" : "transparent",
                color: activeTab === t.key ? RP_THEME.accent : "#fff",
                fontWeight: 600, fontSize: 14, cursor: "pointer", transition: "all 0.2s"
              }}
            >{t.label}</button>
          ))}
        </div>
      </div>

      {/* ── MAIN CONTENT ── */}
      <div style={{ padding: "20px 16px 40px", maxWidth: 900, margin: "0 auto" }}>

        {/* ── ALL PLANS TAB ── */}
        {activeTab === "plans" && (
          <>
            {/* Category filter */}
            <div style={{ display: "flex", gap: 8, overflowX: "auto", paddingBottom: 12,
              marginBottom: 20, scrollbarWidth: "none" }}>
              {ALL_CATEGORIES.map(cat => (
                <button key={cat}
                  onClick={() => setCategoryFilter(cat)}
                  style={{
                    flexShrink: 0, padding: "6px 14px", borderRadius: 16,
                    border: `1.5px solid ${categoryFilter === cat ? RP_THEME.accent : RP_THEME.divider}`,
                    background: categoryFilter === cat ? RP_THEME.accent : "#fff",
                    color: categoryFilter === cat ? "#fff" : RP_THEME.muted,
                    fontSize: 13, fontWeight: 500, cursor: "pointer", whiteSpace: "nowrap"
                  }}
                >{cat}</button>
              ))}
            </div>

            {/* Encouragement */}
            <p style={{ textAlign: "center", color: RP_THEME.muted, fontSize: 14,
              fontStyle: "italic", marginBottom: 20 }}>
              Even 5 minutes in the Word today is faithfulness.
            </p>

            {/* Card grid */}
            <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(260px, 1fr))", gap: 16 }}>
              {filteredPlans.map(plan => {
                const isActive = !!activePlans[plan.id];
                const done = completedDays[plan.id] || 0;
                const totalDays = parseInt(plan.duration);
                const pct = isActive ? Math.round((done / totalDays) * 100) : 0;
                const diff = DIFFICULTY_STYLE[plan.difficulty];

                return (
                  <div key={plan.id}
                    onClick={() => openModal(plan)}
                    style={{
                      background: RP_THEME.card, borderRadius: 16, overflow: "hidden",
                      boxShadow: "0 2px 12px rgba(0,0,0,0.07)",
                      borderLeft: `4px solid ${plan.color}`,
                      cursor: "pointer", transition: "transform 0.15s, box-shadow 0.15s",
                    }}
                    onMouseEnter={e => { e.currentTarget.style.transform = "translateY(-2px)"; e.currentTarget.style.boxShadow = "0 6px 20px rgba(0,0,0,0.12)"; }}
                    onMouseLeave={e => { e.currentTarget.style.transform = ""; e.currentTarget.style.boxShadow = "0 2px 12px rgba(0,0,0,0.07)"; }}
                  >
                    <div style={{ padding: "18px 16px 14px" }}>
                      {/* Icon + badges row */}
                      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 10 }}>
                        <span style={{ fontSize: 32 }}>{plan.icon}</span>
                        <div style={{ display: "flex", flexDirection: "column", alignItems: "flex-end", gap: 4 }}>
                          <span style={{ background: diff.bg, color: diff.color, fontSize: 11,
                            fontWeight: 600, padding: "2px 8px", borderRadius: 10 }}>
                            {plan.difficulty}
                          </span>
                          {isActive && (
                            <span style={{ background: "#D1FAE5", color: "#065F46", fontSize: 11,
                              fontWeight: 600, padding: "2px 8px", borderRadius: 10 }}>
                              ✓ Active
                            </span>
                          )}
                        </div>
                      </div>

                      {/* Title */}
                      <h3 style={{ margin: "0 0 4px", fontSize: 16, fontWeight: 700, color: RP_THEME.text }}>
                        {plan.title}
                      </h3>
                      <p style={{ margin: "0 0 12px", fontSize: 13, color: RP_THEME.muted, lineHeight: 1.4 }}>
                        {plan.subtitle}
                      </p>

                      {/* Info pills */}
                      <div style={{ display: "flex", flexWrap: "wrap", gap: 6, marginBottom: 14 }}>
                        {[
                          { label: "⏱ " + plan.dailyTime },
                          { label: "📆 " + plan.duration },
                          { label: plan.category },
                        ].map(p => (
                          <span key={p.label} style={{ background: "#F3F4F6", color: RP_THEME.muted,
                            fontSize: 11, padding: "3px 8px", borderRadius: 8, fontWeight: 500 }}>
                            {p.label}
                          </span>
                        ))}
                      </div>

                      {/* Progress bar (if active) */}
                      {isActive && (
                        <div style={{ marginBottom: 12 }}>
                          <div style={{ display: "flex", justifyContent: "space-between",
                            fontSize: 12, color: RP_THEME.muted, marginBottom: 4 }}>
                            <span>Day {done} of {totalDays}</span>
                            <span>{pct}% complete</span>
                          </div>
                          <div style={{ height: 6, background: "#E5E7EB", borderRadius: 4, overflow: "hidden" }}>
                            <div style={{ height: "100%", width: `${pct}%`,
                              background: `linear-gradient(90deg, ${plan.color}, ${plan.color}cc)`,
                              borderRadius: 4, transition: "width 0.4s ease" }} />
                          </div>
                        </div>
                      )}

                      {/* CTA */}
                      <button
                        onClick={e => { e.stopPropagation(); openModal(plan); }}
                        style={{
                          width: "100%", padding: "10px", borderRadius: 10, border: "none",
                          background: `linear-gradient(135deg, ${plan.color}, ${plan.color}bb)`,
                          color: "#fff", fontWeight: 600, fontSize: 14, cursor: "pointer",
                          fontFamily: RP_THEME.font,
                        }}
                      >
                        {isActive ? "Continue Plan →" : "View Plan →"}
                      </button>
                    </div>
                  </div>
                );
              })}
            </div>
          </>
        )}

        {/* ── MY PLANS TAB ── */}
        {activeTab === "active" && (
          <>
            {myActivePlans.length === 0 ? (
              <div style={{ textAlign: "center", padding: "60px 24px" }}>
                <div style={{ fontSize: 52, marginBottom: 16 }}>📖</div>
                <h3 style={{ color: RP_THEME.text, fontSize: 20, marginBottom: 8 }}>No active plans yet</h3>
                <p style={{ color: RP_THEME.muted, fontSize: 15, marginBottom: 24 }}>
                  Start a plan and your progress will appear here.
                </p>
                <button onClick={() => setActiveTab("plans")}
                  style={{ background: RP_THEME.hero, color: "#fff", border: "none",
                    borderRadius: 12, padding: "12px 28px", fontSize: 15, fontWeight: 600,
                    cursor: "pointer", fontFamily: RP_THEME.font }}>
                  Browse Plans
                </button>
              </div>
            ) : (
              <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
                {myActivePlans.map(plan => {
                  const done = completedDays[plan.id] || 0;
                  const totalDays = parseInt(plan.duration);
                  const pct = Math.round((done / totalDays) * 100);
                  const diff = DIFFICULTY_STYLE[plan.difficulty];

                  return (
                    <div key={plan.id}
                      style={{ background: RP_THEME.card, borderRadius: 16, overflow: "hidden",
                        boxShadow: "0 2px 12px rgba(0,0,0,0.07)", borderLeft: `5px solid ${plan.color}` }}>
                      <div style={{ padding: "20px 20px 16px" }}>
                        {/* Header */}
                        <div style={{ display: "flex", alignItems: "center", gap: 14, marginBottom: 16 }}>
                          <span style={{ fontSize: 36 }}>{plan.icon}</span>
                          <div style={{ flex: 1 }}>
                            <h3 style={{ margin: 0, fontSize: 17, fontWeight: 700, color: RP_THEME.text }}>
                              {plan.title}
                            </h3>
                            <p style={{ margin: 0, fontSize: 13, color: RP_THEME.muted }}>{plan.subtitle}</p>
                          </div>
                          <span style={{ background: diff.bg, color: diff.color, fontSize: 11,
                            fontWeight: 600, padding: "3px 10px", borderRadius: 10 }}>
                            {plan.difficulty}
                          </span>
                        </div>

                        {/* Progress */}
                        <div style={{ marginBottom: 16 }}>
                          <div style={{ display: "flex", justifyContent: "space-between",
                            fontSize: 13, fontWeight: 600, color: RP_THEME.text, marginBottom: 6 }}>
                            <span>Day {done} of {totalDays}</span>
                            <span style={{ color: plan.color }}>{pct}% complete</span>
                          </div>
                          <div style={{ height: 8, background: "#E5E7EB", borderRadius: 6, overflow: "hidden" }}>
                            <div style={{ height: "100%", width: `${pct}%`,
                              background: `linear-gradient(90deg, ${plan.color}, ${plan.color}99)`,
                              borderRadius: 6, transition: "width 0.5s ease" }} />
                          </div>
                        </div>

                        {/* Today's reading hint */}
                        {done < totalDays && (
                          <div style={{ background: "#FFFBF0", border: `1px solid ${plan.color}44`,
                            borderRadius: 10, padding: "12px 14px", marginBottom: 14 }}>
                            <p style={{ margin: 0, fontSize: 13, color: RP_THEME.text, fontWeight: 600 }}>
                              📅 Today — Day {done + 1}
                            </p>
                            <p style={{ margin: "4px 0 0", fontSize: 13, color: RP_THEME.muted }}>
                              {plan.structure}
                            </p>
                          </div>
                        )}

                        {done >= totalDays && (
                          <div style={{ background: "#D1FAE5", borderRadius: 10, padding: "12px 14px",
                            marginBottom: 14, textAlign: "center" }}>
                            <p style={{ margin: 0, fontSize: 14, color: "#065F46", fontWeight: 700 }}>
                              🎉 Plan Complete! Well done.
                            </p>
                          </div>
                        )}

                        {/* Mark day done button */}
                        <button
                          onClick={() => markDayDone(plan.id)}
                          disabled={done >= totalDays}
                          style={{
                            width: "100%", padding: "11px", borderRadius: 10, border: "none",
                            background: done >= totalDays
                              ? "#E5E7EB"
                              : `linear-gradient(135deg, ${plan.color}, ${plan.color}cc)`,
                            color: done >= totalDays ? RP_THEME.muted : "#fff",
                            fontWeight: 600, fontSize: 14, cursor: done >= totalDays ? "default" : "pointer",
                            fontFamily: RP_THEME.font,
                          }}
                        >
                          {done >= totalDays ? "✓ Complete" : "✓ Mark Today as Read"}
                        </button>
                      </div>
                    </div>
                  );
                })}
              </div>
            )}
          </>
        )}
      </div>

      {/* ── MODAL ── */}
      {modalOpen && selectedPlan && (
        <div
          onClick={closeModal}
          style={{
            position: "fixed", inset: 0, background: "rgba(0,0,0,0.55)",
            zIndex: 1000, display: "flex", alignItems: "flex-end",
            transition: "opacity 0.3s", opacity: animIn ? 1 : 0,
          }}
        >
          <div
            onClick={e => e.stopPropagation()}
            style={{
              width: "100%", maxWidth: 640, margin: "0 auto",
              background: RP_THEME.bg, borderRadius: "24px 24px 0 0",
              maxHeight: "90vh", display: "flex", flexDirection: "column",
              transform: animIn ? "translateY(0)" : "translateY(100%)",
              transition: "transform 0.3s cubic-bezier(0.32,0.72,0,1)",
              overflow: "hidden",
            }}
          >
            {/* Sticky header */}
            <div style={{
              background: `linear-gradient(135deg, ${selectedPlan.color}, ${selectedPlan.color}bb)`,
              padding: "20px 20px 24px", flexShrink: 0,
              position: "sticky", top: 0, zIndex: 10,
            }}>
              <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start" }}>
                <div style={{ display: "flex", gap: 14, alignItems: "center" }}>
                  <span style={{ fontSize: 40 }}>{selectedPlan.icon}</span>
                  <div>
                    <h2 style={{ margin: 0, color: "#fff", fontSize: 20, fontWeight: 700 }}>
                      {selectedPlan.title}
                    </h2>
                    <p style={{ margin: 0, color: "rgba(255,255,255,0.85)", fontSize: 13 }}>
                      {selectedPlan.subtitle}
                    </p>
                  </div>
                </div>
                <button onClick={closeModal}
                  style={{ background: "rgba(255,255,255,0.2)", border: "none", borderRadius: "50%",
                    width: 32, height: 32, color: "#fff", fontSize: 18, cursor: "pointer",
                    display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                  ×
                </button>
              </div>
            </div>

            {/* Scrollable body */}
            <div style={{ overflowY: "auto", padding: "20px 20px 32px", flex: 1 }}>
              {/* Stats row */}
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr 1fr 1fr", gap: 8, marginBottom: 20 }}>
                {[
                  { label: "Duration", value: selectedPlan.duration },
                  { label: "Daily", value: selectedPlan.dailyTime },
                  { label: "Chapters", value: selectedPlan.chapters.toLocaleString() },
                  { label: "Difficulty", value: selectedPlan.difficulty },
                ].map(s => (
                  <div key={s.label} style={{ background: "#fff", borderRadius: 10,
                    padding: "10px 8px", textAlign: "center",
                    boxShadow: "0 1px 4px rgba(0,0,0,0.06)" }}>
                    <div style={{ fontSize: 15, fontWeight: 700, color: selectedPlan.color }}>
                      {s.value}
                    </div>
                    <div style={{ fontSize: 11, color: RP_THEME.muted, marginTop: 2 }}>{s.label}</div>
                  </div>
                ))}
              </div>

              {/* Description */}
              <p style={{ fontSize: 15, color: RP_THEME.text, lineHeight: 1.65,
                marginBottom: 20, background: "#fff", borderRadius: 12,
                padding: "14px 16px", boxShadow: "0 1px 4px rgba(0,0,0,0.05)" }}>
                {selectedPlan.description}
              </p>

              {/* What you'll read */}
              <div style={{ background: "#fff", borderRadius: 12, padding: "16px",
                marginBottom: 20, boxShadow: "0 1px 4px rgba(0,0,0,0.05)" }}>
                <h4 style={{ margin: "0 0 12px", color: RP_THEME.text, fontSize: 15, fontWeight: 700 }}>
                  📚 What you'll read
                </h4>
                {selectedPlan.whatYoullRead.map((item, i) => (
                  <div key={i} style={{ display: "flex", gap: 10, alignItems: "flex-start",
                    padding: "8px 0", borderTop: i > 0 ? `1px solid ${RP_THEME.divider}` : "none" }}>
                    <span style={{ color: selectedPlan.color, fontWeight: 700, fontSize: 13,
                      flexShrink: 0, marginTop: 1 }}>→</span>
                    <span style={{ fontSize: 14, color: RP_THEME.text, lineHeight: 1.5 }}>{item}</span>
                  </div>
                ))}
              </div>

              {/* Structure note */}
              <div style={{ background: "#FFFBF0", border: `1px solid ${selectedPlan.color}33`,
                borderRadius: 10, padding: "12px 14px", marginBottom: 24 }}>
                <p style={{ margin: 0, fontSize: 13, color: RP_THEME.muted, fontStyle: "italic" }}>
                  📋 Structure: {selectedPlan.structure}
                </p>
              </div>

              {/* Start button */}
              {activePlans[selectedPlan.id] ? (
                <div style={{ textAlign: "center" }}>
                  <div style={{ background: "#D1FAE5", borderRadius: 10, padding: "12px",
                    marginBottom: 14, color: "#065F46", fontWeight: 600, fontSize: 14 }}>
                    ✓ You've already started this plan — Day {completedDays[selectedPlan.id] || 0} of {parseInt(selectedPlan.duration)}
                  </div>
                  <button onClick={closeModal}
                    style={{ width: "100%", padding: "14px", borderRadius: 12, border: "none",
                      background: `linear-gradient(135deg, ${selectedPlan.color}, ${selectedPlan.color}cc)`,
                      color: "#fff", fontWeight: 700, fontSize: 16, cursor: "pointer",
                      fontFamily: RP_THEME.font }}>
                    Continue Reading →
                  </button>
                </div>
              ) : (
                <button onClick={() => startPlan(selectedPlan)}
                  style={{
                    width: "100%", padding: "16px", borderRadius: 12, border: "none",
                    background: "linear-gradient(135deg, #B8860B 0%, #D4A853 50%, #92400E 100%)",
                    color: "#fff", fontWeight: 700, fontSize: 17, cursor: "pointer",
                    fontFamily: RP_THEME.font, boxShadow: "0 4px 16px rgba(184,134,11,0.4)",
                    letterSpacing: "0.3px",
                  }}>
                  Start this Plan →
                </button>
              )}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}