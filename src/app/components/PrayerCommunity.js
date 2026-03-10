"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner } from "./ui";

const CATEGORIES = [
  { id: "all", label: "All", icon: "🙏" },
  { id: "health", label: "Health", icon: "💚" },
  { id: "family", label: "Family", icon: "👨‍👩‍👧‍👦" },
  { id: "world", label: "World", icon: "🌍" },
  { id: "praise", label: "Praise", icon: "🎉" },
  { id: "general", label: "General", icon: "✝️" },
];

function timeAgo(dateStr) {
  const now = Date.now();
  const d = new Date(dateStr).getTime();
  const diff = Math.floor((now - d) / 1000);
  if (diff < 60) return "just now";
  if (diff < 3600) return `${Math.floor(diff / 60)}m ago`;
  if (diff < 86400) return `${Math.floor(diff / 3600)}h ago`;
  if (diff < 604800) return `${Math.floor(diff / 86400)}d ago`;
  return new Date(dateStr).toLocaleDateString();
}

export default function PrayerCommunity() {
  const {
    ht, user, nav,
    communityPrayers, communityPrayersLoading, communityPrayerCategory,
    setCommunityPrayerCategory, addCommunityPrayer, deleteCommunityPrayer,
    markCommunityPrayerAnswered,
    // Reactions
    userReactions, toggleReaction,
    // Expiry
    expiringPrayers, keepCommunityPrayer,
    // Birthday
    birthdayUsers,
  } = useApp();

  const [showForm, setShowForm] = useState(false);
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [category, setCategory] = useState("general");
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [feedView, setFeedView] = useState("active"); // "active" or "testimonies"

  const handleSubmit = async () => {
    if (!body.trim()) return;
    setSubmitting(true);
    await addCommunityPrayer({ title: title.trim() || "Prayer Request", body: body.trim(), category, isAnonymous });
    setTitle("");
    setBody("");
    setCategory("general");
    setIsAnonymous(false);
    setShowForm(false);
    setSubmitting(false);
  };

  const activePrayers = (communityPrayers || []).filter(p => !p.is_answered);
  const testimonies = (communityPrayers || []).filter(p => p.is_answered);
  const feed = feedView === "active" ? activePrayers : testimonies;

  return (
    <div>
      {/* Active / Testimonies toggle */}
      <div style={{ display: "flex", gap: 8, marginBottom: 14 }}>
        {[
          { id: "active", label: "Prayer Requests", count: activePrayers.length },
          { id: "testimonies", label: "Testimonies", count: testimonies.length },
        ].map(v => (
          <button key={v.id} onClick={() => setFeedView(v.id)}
            style={{ flex: 1, padding: "9px 8px", border: `1.5px solid ${feedView === v.id ? ht.accent : ht.divider}`, borderRadius: 8, background: feedView === v.id ? `${ht.accent}15` : "transparent", color: feedView === v.id ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
            {v.label}{v.count > 0 ? ` (${v.count})` : ""}
          </button>
        ))}
      </div>

      {/* Birthday Blessings */}
      {feedView === "active" && birthdayUsers && birthdayUsers.length > 0 && (
        <div style={{ marginBottom: 14 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: "#D4A853", textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10, display: "flex", alignItems: "center", gap: 6 }}>
            🎂 Birthday Blessings Today
          </div>
          {birthdayUsers.filter(bu => !user || bu.id !== user.id).map(bu => {
            const displayName = bu.nickname || (bu.full_name || "").split(" ")[0] || bu.display_name || "A Believer";
            return (
              <div key={bu.id} style={{ background: "linear-gradient(135deg, rgba(212,168,83,0.08), rgba(139,92,246,0.06))", border: "1.5px solid rgba(212,168,83,0.3)", borderRadius: 12, padding: "16px", marginBottom: 8 }}>
                <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 8 }}>
                  <div style={{ width: 36, height: 36, borderRadius: "50%", background: "linear-gradient(135deg, #D4A853, #FFD700)", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 18 }}>🎂</div>
                  <div>
                    <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 700, color: ht.dark }}>Happy Birthday, {displayName}!</div>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted }}>Celebrating a child of God today</div>
                  </div>
                </div>
                <div style={{ fontFamily: ht.body || ht.ui, fontSize: 13, fontStyle: "italic", color: ht.text, lineHeight: 1.6, padding: "8px 12px", background: "rgba(212,168,83,0.06)", borderRadius: 8, borderLeft: "3px solid rgba(212,168,83,0.4)" }}>
                  &ldquo;The LORD bless thee, and keep thee: The LORD make his face shine upon thee, and be gracious unto thee.&rdquo;
                  <span style={{ display: "block", fontFamily: ht.ui, fontSize: 10, color: ht.muted, fontStyle: "normal", marginTop: 4 }}>&mdash; Numbers 6:24-25</span>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* Expiry prompt banner */}
      {expiringPrayers && expiringPrayers.length > 0 && (
        <div style={{ marginBottom: 14 }}>
          {expiringPrayers.map(ep => (
            <div key={ep.id} style={{ background: "#FEF3C722", border: "1.5px solid #D97706", borderRadius: 10, padding: "12px 14px", marginBottom: 6 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: "#92400E", marginBottom: 4 }}>Prayer request expired</div>
              <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.text, lineHeight: 1.5, marginBottom: 8 }}>"{ep.title}" — would you like to keep it or mark it as answered?</div>
              <div style={{ display: "flex", gap: 6 }}>
                <button onClick={() => keepCommunityPrayer(ep.id)} style={{ padding: "6px 12px", borderRadius: 6, border: "1px solid #D97706", background: "#FEF3C744", fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: "#92400E", cursor: "pointer" }}>Keep 60 More Days</button>
                <button onClick={() => markCommunityPrayerAnswered(ep.id)} style={{ padding: "6px 12px", borderRadius: 6, border: "1px solid #7ED4AD", background: "#7ED4AD22", fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: "#2E7D5B", cursor: "pointer" }}>Mark Answered</button>
                <button onClick={() => deleteCommunityPrayer(ep.id)} style={{ padding: "6px 10px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 11, color: "#E8625C", cursor: "pointer" }}>{"\u2715"}</button>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Category filter pills */}
      <div style={{ display: "flex", gap: 6, overflowX: "auto", paddingBottom: 12, marginBottom: 4, WebkitOverflowScrolling: "touch" }}>
        {CATEGORIES.map(cat => {
          const isActive = communityPrayerCategory === cat.id;
          return (
            <button key={cat.id} onClick={() => setCommunityPrayerCategory(cat.id)}
              style={{ flexShrink: 0, padding: "6px 12px", borderRadius: 20, border: `1.5px solid ${isActive ? ht.accent : ht.divider}`, background: isActive ? `${ht.accent}18` : "transparent", color: isActive ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 11, fontWeight: 600, cursor: "pointer", display: "flex", alignItems: "center", gap: 4, transition: "all 0.15s" }}>
              <span style={{ fontSize: 12 }}>{cat.icon}</span> {cat.label}
            </button>
          );
        })}
      </div>

      {/* New request button / form */}
      {feedView === "active" && (
        !showForm ? (
          <button onClick={() => { if (!user) { nav("account"); return; } setShowForm(true); }}
            style={{ width: "100%", padding: "14px 16px", borderRadius: 12, border: `1.5px dashed ${ht.accent}`, background: `${ht.accent}08`, color: ht.accent, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", marginBottom: 16, transition: "all 0.15s" }}>
            + Share a Prayer Request
          </button>
        ) : (
          <Card t={ht} style={{ marginBottom: 16 }}>
            <Label icon="✏️" t={ht}>New Prayer Request</Label>
            <input value={title} onChange={e => setTitle(e.target.value)} placeholder="Title (optional)" style={{ width: "100%", padding: "10px 0", border: "none", borderBottom: `1px solid ${ht.divider}`, fontFamily: ht.heading, fontSize: 15, color: ht.dark, outline: "none", background: "transparent", marginBottom: 10, boxSizing: "border-box" }} />
            <textarea value={body} onChange={e => setBody(e.target.value)} placeholder="Share what's on your heart..." rows={3} style={{ width: "100%", padding: "8px 0", border: "none", fontFamily: ht.body, fontSize: 14, color: ht.text, outline: "none", background: "transparent", resize: "vertical", lineHeight: 1.7, boxSizing: "border-box" }} />

            {/* Category selector */}
            <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginTop: 10, marginBottom: 10 }}>
              {CATEGORIES.filter(c => c.id !== "all").map(cat => (
                <button key={cat.id} onClick={() => setCategory(cat.id)}
                  style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${category === cat.id ? ht.accent : ht.divider}`, background: category === cat.id ? `${ht.accent}18` : "transparent", color: category === cat.id ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 11, fontWeight: 600, cursor: "pointer" }}>
                  {cat.icon} {cat.label}
                </button>
              ))}
            </div>

            {/* Anonymous toggle */}
            <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 12 }}>
              <button onClick={() => setIsAnonymous(!isAnonymous)}
                style={{ width: 38, height: 22, borderRadius: 11, border: "none", cursor: "pointer", position: "relative", background: isAnonymous ? ht.accent : ht.divider, transition: "background 0.25s", padding: 0 }}>
                <div style={{ width: 18, height: 18, borderRadius: 9, background: "#fff", position: "absolute", top: 2, left: isAnonymous ? 18 : 2, transition: "left 0.25s", boxShadow: "0 1px 3px rgba(0,0,0,0.2)" }} />
              </button>
              <span style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>Post anonymously</span>
            </div>

            <div style={{ display: "flex", gap: 8 }}>
              <button onClick={handleSubmit} disabled={!body.trim() || submitting}
                style={{ padding: "10px 20px", borderRadius: 8, border: "none", background: body.trim() ? ht.accent : ht.divider, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: body.trim() ? "pointer" : "default", opacity: submitting ? 0.7 : 1 }}>
                {submitting ? "Posting..." : "Submit Request"}
              </button>
              <button onClick={() => { setShowForm(false); setTitle(""); setBody(""); }}
                style={{ padding: "10px 16px", borderRadius: 8, border: `1px solid ${ht.divider}`, background: "transparent", color: ht.muted, fontFamily: ht.ui, fontSize: 13, fontWeight: 600, cursor: "pointer" }}>
                Cancel
              </button>
            </div>
          </Card>
        )
      )}

      {/* Feed */}
      {communityPrayersLoading ? <Spinner t={ht} /> :
        feed.length === 0 ? (
          <div style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>{feedView === "active" ? "🙏" : "🎉"}</div>
            <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>
              {feedView === "active" ? "No prayer requests yet. Be the first to share!" : "No testimonies yet. When prayers are answered, they'll appear here."}
            </div>
          </div>
        ) : feed.map(p => (
          <PrayerCard key={p.id} prayer={p} ht={ht} user={user} feedView={feedView}
            userReactions={userReactions} toggleReaction={toggleReaction}
            deleteCommunityPrayer={deleteCommunityPrayer}
            markCommunityPrayerAnswered={markCommunityPrayerAnswered} />
        ))
      }
    </div>
  );
}

function PrayerCard({ prayer: p, ht, user, feedView, userReactions, toggleReaction, deleteCommunityPrayer, markCommunityPrayerAnswered }) {
  const isOwner = user && p.user_id === user.id;
  const displayName = p.is_anonymous ? "Anonymous" : (p.user_display_name || "A Believer");
  const catInfo = CATEGORIES.find(c => c.id === p.category) || CATEGORIES[5];

  // Reactions for this prayer
  const pReactions = p.reaction_counts || { praying: 0, heart: 0, amen: 0 };
  const myReactions = userReactions?.[p.id] || {};

  const REACTION_TYPES = [
    { type: "praying", emoji: "🙏", label: "Praying" },
    { type: "heart", emoji: "❤️", label: "Support" },
    { type: "amen", emoji: "🙌", label: "Amen" },
  ];

  return (
    <div style={{ background: ht.card, borderRadius: 12, padding: "16px", border: `1px solid ${feedView === "testimonies" ? "#7ED4AD44" : ht.divider}`, marginBottom: 10, borderLeft: `3px solid ${feedView === "testimonies" ? "#7ED4AD" : ht.accent}` }}>
      {/* Header: name + category + time */}
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 8 }}>
        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
          <div style={{ width: 28, height: 28, borderRadius: "50%", background: p.is_anonymous ? ht.divider : ht.headerGradient, display: "flex", alignItems: "center", justifyContent: "center", color: p.is_anonymous ? ht.muted : ht.headerText, fontFamily: ht.ui, fontSize: 11, fontWeight: 700 }}>
            {p.is_anonymous ? "?" : displayName[0].toUpperCase()}
          </div>
          <div>
            <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.dark }}>{displayName}</div>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light }}>{timeAgo(p.created_at)}</div>
          </div>
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
          <span style={{ padding: "3px 8px", borderRadius: 10, background: `${ht.accent}12`, fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: ht.accent }}>
            {catInfo.icon} {catInfo.label}
          </span>
        </div>
      </div>

      {/* Title + body */}
      <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 600, color: ht.dark, marginBottom: 4 }}>{p.title}</div>
      <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.65, marginBottom: 10 }}>{p.body}</div>

      {/* Testimony badge */}
      {feedView === "testimonies" && p.answered_at && (
        <div style={{ display: "inline-block", padding: "4px 10px", borderRadius: 6, background: "#7ED4AD22", border: "1px solid #7ED4AD44", marginBottom: 10 }}>
          <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: "#2E7D5B" }}>God answered! {p.testimony_text ? `— ${p.testimony_text}` : ""}</span>
        </div>
      )}

      {/* Reactions */}
      <div style={{ display: "flex", alignItems: "center", gap: 6 }}>
        {REACTION_TYPES.map(r => {
          const count = pReactions[r.type] || 0;
          const isActive = !!myReactions[r.type];
          return (
            <button key={r.type}
              onClick={() => { if (!user) return; toggleReaction(p.id, r.type); }}
              style={{ display: "flex", alignItems: "center", gap: 4, padding: "5px 10px", borderRadius: 20, border: `1px solid ${isActive ? ht.accent : ht.divider}`, background: isActive ? `${ht.accent}15` : "transparent", cursor: user ? "pointer" : "default", transition: "all 0.15s" }}>
              <span style={{ fontSize: 13 }}>{r.emoji}</span>
              <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: isActive ? ht.accent : ht.muted }}>{count > 0 ? count : ""}</span>
            </button>
          );
        })}

        {/* Owner actions */}
        {isOwner && feedView === "active" && (
          <div style={{ marginLeft: "auto", display: "flex", gap: 6 }}>
            <button onClick={() => markCommunityPrayerAnswered(p.id)}
              style={{ padding: "5px 10px", borderRadius: 6, border: "1px solid #7ED4AD", background: "#7ED4AD22", fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: "#2E7D5B", cursor: "pointer" }}>
              Mark Answered
            </button>
            <button onClick={() => deleteCommunityPrayer(p.id)}
              style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: "#E8625C", cursor: "pointer" }}>
              {"\u2715"}
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
