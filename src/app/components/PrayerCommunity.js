"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner, CloseIcon } from "./ui";
import { SEMANTIC_COLORS, PRAYER_CATEGORY_STYLE } from "../constants";

const CATEGORIES = [
  { id: "all", label: "All", icon: "\ud83d\ude4f" },
  { id: "health", label: "Health", icon: "\ud83d\udc9a" },
  { id: "family", label: "Family", icon: "\ud83d\udc68\u200d\ud83d\udc69\u200d\ud83d\udc67\u200d\ud83d\udc66" },
  { id: "world", label: "World", icon: "\ud83c\udf0d" },
  { id: "praise", label: "Praise", icon: "\ud83c\udf89" },
  { id: "general", label: "General", icon: "\u271d\ufe0f" },
];

const REPORT_REASONS = [
  { id: "inappropriate", label: "Inappropriate content" },
  { id: "spam", label: "Spam or advertising" },
  { id: "harassment", label: "Harassment or bullying" },
  { id: "other", label: "Other" },
];

const TITLE_LIMIT = 200;
const BODY_LIMIT = 2000;
const CONFETTI_CHARS = ["\u2720", "\u2665", "\ud83d\ude4f", "\u2726", "\u2727"];

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

function sem(darkMode, type) { return SEMANTIC_COLORS[darkMode ? type + "Dark" : type]; }

// Deterministic hash for generative avatars
function hashCode(str) {
  let h = 0;
  for (let i = 0; i < (str || "").length; i++) { h = ((h << 5) - h) + str.charCodeAt(i); h |= 0; }
  return Math.abs(h);
}

// Generative SVG avatar for anonymous prayers
function AnonAvatar({ id, size = 28 }) {
  const h = hashCode(id);
  const hue1 = h % 360;
  const hue2 = (h * 7) % 360;
  const shape = (h >> 8) % 4;
  const gid = `ag-${(h % 9999)}`;
  return (
    <svg width={size} height={size} viewBox="0 0 28 28" style={{ borderRadius: "50%", flexShrink: 0 }}>
      <defs><linearGradient id={gid} x1="0" y1="0" x2="1" y2="1">
        <stop offset="0%" stopColor={`hsl(${hue1}, 35%, 62%)`} />
        <stop offset="100%" stopColor={`hsl(${hue2}, 35%, 52%)`} />
      </linearGradient></defs>
      <circle cx="14" cy="14" r="14" fill={`url(#${gid})`} />
      {shape === 0 && <circle cx="14" cy="14" r="6" fill="rgba(255,255,255,0.18)" />}
      {shape === 1 && <rect x="8" y="8" width="12" height="12" rx="3" fill="rgba(255,255,255,0.14)" transform="rotate(45,14,14)" />}
      {shape === 2 && <polygon points="14,6 20,20 8,20" fill="rgba(255,255,255,0.14)" />}
      {shape === 3 && <><circle cx="10" cy="12" r="3" fill="rgba(255,255,255,0.12)" /><circle cx="18" cy="16" r="3" fill="rgba(255,255,255,0.12)" /></>}
    </svg>
  );
}

// User avatar with hash-based gradient + initial
function UserAvatar({ name, userId, size = 28, ht }) {
  const h = hashCode(userId);
  const hue = h % 360;
  return (
    <div style={{ width: size, height: size, borderRadius: "50%", background: `linear-gradient(135deg, hsl(${hue},40%,55%), hsl(${(hue+60)%360},40%,45%))`, display: "flex", alignItems: "center", justifyContent: "center", color: "#fff", fontFamily: ht.ui, fontSize: size * 0.4, fontWeight: 700, flexShrink: 0 }}>
      {(name || "?")[0].toUpperCase()}
    </div>
  );
}

export default function PrayerCommunity() {
  const {
    ht, darkMode, user, nav,
    communityPrayers, communityPrayersLoading, communityPrayerCategory,
    setCommunityPrayerCategory, addCommunityPrayer, deleteCommunityPrayer,
    markCommunityPrayerAnswered, cooldownActive, justAnsweredId,
    userReactions, toggleReaction,
    expiringPrayers, keepCommunityPrayer,
    birthdayUsers,
    reportCommunityPrayer, reportTarget, setReportTarget,
  } = useApp();

  const [showForm, setShowForm] = useState(false);
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [category, setCategory] = useState("general");
  const [isAnonymous, setIsAnonymous] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [feedView, setFeedView] = useState("active");

  const sc = sem(darkMode, "success");
  const wc = sem(darkMode, "warning");
  const ec = sem(darkMode, "error");
  const bc = sem(darkMode, "birthday");

  const handleSubmit = async () => {
    if (!body.trim()) return;
    setSubmitting(true);
    await addCommunityPrayer({ title: title.trim() || "Prayer Request", body: body.trim(), category, isAnonymous });
    setTitle(""); setBody(""); setCategory("general"); setIsAnonymous(false);
    setShowForm(false); setSubmitting(false);
  };

  const activePrayers = (communityPrayers || []).filter(p => !p.is_answered);
  const testimonies = (communityPrayers || []).filter(p => p.is_answered);
  const feed = feedView === "active" ? activePrayers : testimonies;

  // Monthly testimony highlight
  const monthlyTestimonies = testimonies.filter(p => {
    if (!p.answered_at) return false;
    const d = new Date(p.answered_at);
    const now = new Date();
    return d.getMonth() === now.getMonth() && d.getFullYear() === now.getFullYear();
  });

  return (
    <div role="feed" aria-label="Community prayer feed" style={{ animation: "fadeIn 0.5s ease" }}>
      {/* Active / Testimonies toggle */}
      <div style={{ display: "flex", gap: 8, marginBottom: 14 }} role="tablist" aria-label="Prayer feed view">
        {[
          { id: "active", label: "Prayer Requests", count: activePrayers.length },
          { id: "testimonies", label: "Testimonies", count: testimonies.length },
        ].map(v => (
          <button key={v.id} onClick={() => setFeedView(v.id)} role="tab" aria-selected={feedView === v.id}
            style={{ flex: 1, padding: "9px 8px", border: `1.5px solid ${feedView === v.id ? ht.accent : ht.divider}`, borderRadius: 8, background: feedView === v.id ? `${ht.accent}15` : "transparent", color: feedView === v.id ? ht.accent : ht.muted, fontFamily: ht.ui, fontSize: 12, fontWeight: 700, cursor: "pointer", transition: "all 0.15s" }}>
            {v.label}{v.count > 0 ? ` (${v.count})` : ""}
          </button>
        ))}
      </div>

      {/* Monthly testimony highlight */}
      {feedView === "testimonies" && monthlyTestimonies.length >= 1 && (
        <div style={{ background: `linear-gradient(135deg, ${sc.bg}, rgba(212,168,83,0.06))`, border: `1.5px solid ${sc.border}44`, borderRadius: 12, padding: "14px 16px", marginBottom: 14, animation: "fadeIn 0.5s ease" }}>
          <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: sc.text, marginBottom: 4 }}>
            {monthlyTestimonies.length} prayer{monthlyTestimonies.length !== 1 ? "s" : ""} answered this month!
          </div>
          <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.text, fontStyle: "italic", lineHeight: 1.5 }}>
            God is faithful. Every answered prayer is a testimony of His love.
          </div>
        </div>
      )}

      {/* Birthday Blessings */}
      {feedView === "active" && birthdayUsers && birthdayUsers.length > 0 && (
        <div style={{ marginBottom: 14 }}>
          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: bc.text, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10, display: "flex", alignItems: "center", gap: 6 }}>
            {"\ud83c\udf82"} Birthday Blessings Today
          </div>
          {birthdayUsers.filter(bu => !user || bu.id !== user.id).map(bu => {
            const displayName = bu.nickname || (bu.full_name || "").split(" ")[0] || bu.display_name || "A Believer";
            return (
              <div key={bu.id} style={{ background: bc.gradient, border: `1.5px solid ${bc.border}`, borderRadius: 12, padding: "16px", marginBottom: 8 }}>
                <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 8 }}>
                  <div style={{ width: 36, height: 36, borderRadius: "50%", background: "linear-gradient(135deg, #D4A853, #FFD700)", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 18 }}>{"\ud83c\udf82"}</div>
                  <div>
                    <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 700, color: ht.dark }}>Happy Birthday, {displayName}!</div>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted }}>Celebrating a child of God today</div>
                  </div>
                </div>
                <div style={{ fontFamily: ht.body || ht.ui, fontSize: 13, fontStyle: "italic", color: ht.text, lineHeight: 1.6, padding: "8px 12px", background: bc.bg, borderRadius: 8, borderLeft: `3px solid ${bc.border}` }}>
                  &ldquo;The LORD bless thee, and keep thee: The LORD make his face shine upon thee, and be gracious unto thee.&rdquo;
                  <span style={{ display: "block", fontFamily: ht.ui, fontSize: 10, color: ht.muted, fontStyle: "normal", marginTop: 4 }}>&mdash; Numbers 6:24-25 (KJV)</span>
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
            <div key={ep.id} style={{ background: wc.bg, border: `1.5px solid ${wc.border}`, borderRadius: 10, padding: "12px 14px", marginBottom: 6 }}>
              <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: wc.text, marginBottom: 4 }}>Prayer request expired</div>
              <div style={{ fontFamily: ht.body, fontSize: 13, color: ht.text, lineHeight: 1.5, marginBottom: 8 }}>&ldquo;{ep.title}&rdquo; &mdash; would you like to keep it or mark it as answered?</div>
              <div style={{ display: "flex", gap: 6 }}>
                <button aria-label="Keep prayer for 60 more days" onClick={() => keepCommunityPrayer(ep.id)} style={{ padding: "6px 12px", borderRadius: 6, border: `1px solid ${wc.border}`, background: wc.bg, fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: wc.text, cursor: "pointer" }}>Keep 60 More Days</button>
                <button aria-label="Mark prayer as answered" onClick={() => markCommunityPrayerAnswered(ep.id)} style={{ padding: "6px 12px", borderRadius: 6, border: `1px solid ${sc.border}`, background: sc.bg, fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: sc.text, cursor: "pointer" }}>Mark Answered</button>
                <button aria-label="Delete expired prayer" onClick={() => deleteCommunityPrayer(ep.id)} style={{ padding: "6px 10px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 11, color: ec.text, cursor: "pointer" }}>{"\u2715"}</button>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Category filter pills */}
      <div style={{ display: "flex", gap: 6, overflowX: "auto", paddingBottom: 12, marginBottom: 4, WebkitOverflowScrolling: "touch" }} role="radiogroup" aria-label="Filter by category">
        {CATEGORIES.map(cat => {
          const isActive = communityPrayerCategory === cat.id;
          const catColor = PRAYER_CATEGORY_STYLE[cat.id];
          const activeColor = catColor ? catColor.color : ht.accent;
          return (
            <button key={cat.id} onClick={() => setCommunityPrayerCategory(cat.id)} role="radio" aria-checked={isActive} aria-label={`Filter: ${cat.label}`}
              style={{ flexShrink: 0, padding: "6px 12px", borderRadius: 20, border: `1.5px solid ${isActive ? activeColor : ht.divider}`, background: isActive ? (catColor ? catColor.bg : `${ht.accent}18`) : "transparent", color: isActive ? activeColor : ht.muted, fontFamily: ht.ui, fontSize: 11, fontWeight: 600, cursor: "pointer", display: "flex", alignItems: "center", gap: 4, transition: "all 0.15s" }}>
              <span style={{ fontSize: 12 }}>{cat.icon}</span> {cat.label}
            </button>
          );
        })}
      </div>

      {/* New request button / form */}
      {feedView === "active" && (
        !showForm ? (
          <button aria-label="Share a new prayer request" onClick={() => { if (!user) { nav("account"); return; } setShowForm(true); }}
            style={{ width: "100%", padding: "14px 16px", borderRadius: 12, border: `1.5px dashed ${ht.accent}`, background: `${ht.accent}08`, color: ht.accent, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer", marginBottom: 16, transition: "all 0.15s" }}>
            + Share a Prayer Request
          </button>
        ) : (
          <Card t={ht} style={{ marginBottom: 16, animation: "fadeIn 0.3s ease" }}>
            <Label icon={"\u270f\ufe0f"} t={ht}>New Prayer Request</Label>
            <input value={title} onChange={e => setTitle(e.target.value)} maxLength={TITLE_LIMIT} placeholder="Title (optional)" aria-label="Prayer title"
              style={{ width: "100%", padding: "10px 0", border: "none", borderBottom: `1px solid ${ht.divider}`, fontFamily: ht.heading, fontSize: 15, color: ht.dark, outline: "none", background: "transparent", marginBottom: 10, boxSizing: "border-box" }} />
            <textarea value={body} onChange={e => setBody(e.target.value)} maxLength={BODY_LIMIT} placeholder="Share what's on your heart..." rows={3} aria-label="Prayer request body"
              style={{ width: "100%", padding: "8px 0", border: "none", fontFamily: ht.body, fontSize: 14, color: ht.text, outline: "none", background: "transparent", resize: "vertical", lineHeight: 1.7, boxSizing: "border-box" }} />
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: body.length > BODY_LIMIT - 200 ? ec.text : ht.light, textAlign: "right", marginTop: 2, marginBottom: 6 }}>
              {body.length}/{BODY_LIMIT}
            </div>
            <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginTop: 4, marginBottom: 10 }}>
              {CATEGORIES.filter(c => c.id !== "all").map(cat => {
                const cs = PRAYER_CATEGORY_STYLE[cat.id];
                return (
                  <button key={cat.id} onClick={() => setCategory(cat.id)} aria-label={`Category: ${cat.label}`} aria-pressed={category === cat.id}
                    style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${category === cat.id ? (cs ? cs.color : ht.accent) : ht.divider}`, background: category === cat.id ? (cs ? cs.bg : `${ht.accent}18`) : "transparent", color: category === cat.id ? (cs ? cs.color : ht.accent) : ht.muted, fontFamily: ht.ui, fontSize: 11, fontWeight: 600, cursor: "pointer" }}>
                    {cat.icon} {cat.label}
                  </button>
                );
              })}
            </div>
            <div style={{ display: "flex", alignItems: "center", gap: 10, marginBottom: 12 }}>
              <button onClick={() => setIsAnonymous(!isAnonymous)} role="switch" aria-checked={isAnonymous} aria-label="Post anonymously"
                style={{ width: 38, height: 22, borderRadius: 11, border: "none", cursor: "pointer", position: "relative", background: isAnonymous ? ht.accent : ht.divider, transition: "background 0.25s", padding: 0 }}>
                <div style={{ width: 18, height: 18, borderRadius: 9, background: "#fff", position: "absolute", top: 2, left: isAnonymous ? 18 : 2, transition: "left 0.25s", boxShadow: "0 1px 3px rgba(0,0,0,0.2)" }} />
              </button>
              <span style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>Post anonymously</span>
            </div>
            <div style={{ display: "flex", gap: 8 }}>
              <button onClick={handleSubmit} disabled={!body.trim() || submitting || cooldownActive}
                style={{ padding: "10px 20px", borderRadius: 8, border: "none", background: body.trim() && !cooldownActive ? ht.accent : ht.divider, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: body.trim() && !cooldownActive ? "pointer" : "default", opacity: submitting ? 0.7 : 1 }}>
                {submitting ? "Posting..." : cooldownActive ? "Please wait..." : "Submit Request"}
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
            <div style={{ fontSize: 36, marginBottom: 12 }}>{feedView === "active" ? "\ud83d\ude4f" : "\ud83c\udf89"}</div>
            <div style={{ fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>
              {feedView === "active" ? "No prayer requests yet. Be the first to share!" : "No testimonies yet. When prayers are answered, they'll appear here."}
            </div>
          </div>
        ) : feed.map((p, i) => (
          <PrayerCard key={p.id} prayer={p} ht={ht} darkMode={darkMode} user={user} feedView={feedView}
            userReactions={userReactions} toggleReaction={toggleReaction}
            deleteCommunityPrayer={deleteCommunityPrayer}
            markCommunityPrayerAnswered={markCommunityPrayerAnswered}
            setReportTarget={setReportTarget} justAnsweredId={justAnsweredId}
            animDelay={Math.min(i * 0.06, 0.3)} />
        ))
      }

      {/* Report Modal */}
      {reportTarget && (
        <ReportModal ht={ht} darkMode={darkMode} reportTarget={reportTarget}
          setReportTarget={setReportTarget} reportCommunityPrayer={reportCommunityPrayer} />
      )}
    </div>
  );
}

function ReportModal({ ht, darkMode, reportTarget, setReportTarget, reportCommunityPrayer }) {
  const [reason, setReason] = useState("inappropriate");
  const [details, setDetails] = useState("");
  const [submitted, setSubmitted] = useState(false);
  const [sending, setSending] = useState(false);
  const ec = sem(darkMode, "error");

  const handleSubmit = async () => {
    setSending(true);
    await reportCommunityPrayer(reportTarget, reason, details.trim() || null);
    setSending(false); setSubmitted(true);
    setTimeout(() => { setReportTarget(null); setSubmitted(false); }, 1500);
  };

  return (
    <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,0.5)", zIndex: 100, display: "flex", alignItems: "center", justifyContent: "center", padding: 16 }}
      onClick={() => setReportTarget(null)} role="dialog" aria-label="Report prayer request" aria-modal="true">
      <div onClick={e => e.stopPropagation()} style={{ background: ht.bg, borderRadius: 20, padding: "24px 20px", width: "100%", maxWidth: 380, animation: "fadeIn 0.25s ease" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 16 }}>
          <h3 style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, margin: 0 }}>Report Prayer</h3>
          <button onClick={() => setReportTarget(null)} aria-label="Close report dialog" style={{ background: "none", border: "none", cursor: "pointer", color: ht.muted }}><CloseIcon /></button>
        </div>
        {submitted ? (
          <div style={{ textAlign: "center", padding: 20 }}>
            <div style={{ fontSize: 28, marginBottom: 8 }}>{"\u2705"}</div>
            <div style={{ fontFamily: ht.ui, fontSize: 14, color: ht.text }}>Report submitted. Thank you.</div>
          </div>
        ) : (
          <>
            <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted, fontWeight: 600, textTransform: "uppercase", letterSpacing: "0.06em", marginBottom: 8 }}>Reason</div>
            {REPORT_REASONS.map(r => (
              <button key={r.id} onClick={() => setReason(r.id)}
                style={{ display: "block", width: "100%", textAlign: "left", padding: "10px 12px", marginBottom: 4, borderRadius: 8, border: `1.5px solid ${reason === r.id ? ec.border : ht.divider}`, background: reason === r.id ? ec.bg : "transparent", color: reason === r.id ? ec.text : ht.text, fontFamily: ht.ui, fontSize: 13, cursor: "pointer" }}>
                {r.label}
              </button>
            ))}
            <textarea value={details} onChange={e => setDetails(e.target.value)} maxLength={500} placeholder="Additional details (optional)" aria-label="Report details" rows={2}
              style={{ width: "100%", padding: "10px 12px", border: `1px solid ${ht.divider}`, borderRadius: 8, fontFamily: ht.body, fontSize: 13, color: ht.text, outline: "none", background: "transparent", resize: "none", lineHeight: 1.6, marginTop: 10, boxSizing: "border-box" }} />
            <button onClick={handleSubmit} disabled={sending}
              style={{ marginTop: 12, width: "100%", padding: "12px", borderRadius: 8, border: "none", background: ec.border, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", opacity: sending ? 0.7 : 1 }}>
              {sending ? "Submitting..." : "Submit Report"}
            </button>
          </>
        )}
      </div>
    </div>
  );
}

function PrayerCard({ prayer: p, ht, darkMode, user, feedView, userReactions, toggleReaction, deleteCommunityPrayer, markCommunityPrayerAnswered, setReportTarget, justAnsweredId, animDelay = 0 }) {
  const [confirmDelete, setConfirmDelete] = useState(false);
  const [popReaction, setPopReaction] = useState(null);
  const [showConfetti, setShowConfetti] = useState(false);
  const isOwner = user && p.user_id === user.id;
  const displayName = p.is_anonymous ? "Anonymous" : (p.user_display_name || "A Believer");
  const catInfo = CATEGORIES.find(c => c.id === p.category) || CATEGORIES[5];
  const catStyle = PRAYER_CATEGORY_STYLE[p.category] || PRAYER_CATEGORY_STYLE.general;

  const sc = sem(darkMode, "success");
  const ec = sem(darkMode, "error");

  const pReactions = p.reaction_counts || { praying: 0, heart: 0, amen: 0 };
  const myReactions = userReactions?.[p.id] || {};
  const isJustAnswered = justAnsweredId === p.id;

  const REACTION_TYPES = [
    { type: "praying", emoji: "\ud83d\ude4f", label: "Praying" },
    { type: "heart", emoji: "\u2764\ufe0f", label: "Support" },
    { type: "amen", emoji: "\ud83d\ude4c", label: "Amen" },
  ];

  const isTestimony = feedView === "testimonies";

  const handleReaction = (type) => {
    if (!user) return;
    const wasActive = !!myReactions[type];
    toggleReaction(p.id, type);
    if (!wasActive) {
      setPopReaction(type);
      setTimeout(() => setPopReaction(null), 450);
      // Confetti on first-ever reaction to this prayer
      const totalMyReactions = Object.keys(myReactions).length;
      if (totalMyReactions === 0) {
        setShowConfetti(true);
        setTimeout(() => setShowConfetti(false), 900);
      }
    }
  };

  // Testimony card or just-answered card gets golden treatment
  const isGolden = isTestimony || isJustAnswered;

  return (
    <div role="article" aria-label={`Prayer by ${displayName}: ${p.title}`}
      style={{
        background: isGolden
          ? `linear-gradient(135deg, ${ht.card} 80%, ${sc.bg})`
          : `linear-gradient(135deg, ${ht.card} 92%, ${catStyle.bg})`,
        borderRadius: 12, padding: "16px", position: "relative", overflow: "hidden",
        border: `1px solid ${isGolden ? sc.border + "44" : ht.divider}`,
        borderLeft: `3px solid ${isGolden ? sc.border : catStyle.color}`,
        marginBottom: 10,
        animation: isJustAnswered ? "celebrateGlow 2s ease infinite" : `fadeIn 0.4s ease ${animDelay}s both`,
      }}>

      {/* Confetti burst */}
      {(showConfetti || isJustAnswered) && (
        <div style={{ position: "absolute", top: 8, left: "50%", pointerEvents: "none", zIndex: 2 }}>
          {CONFETTI_CHARS.map((ch, i) => (
            <span key={i} style={{ position: "absolute", left: (i - 2) * 10, animation: `confettiFloat 0.8s ease ${i * 0.06}s forwards`, fontSize: 11, opacity: 0 }}>{ch}</span>
          ))}
        </div>
      )}

      {/* Testimony goldFlow badge */}
      {isTestimony && (
        <div style={{ position: "absolute", top: 12, right: 12, padding: "2px 8px", borderRadius: 8, background: "linear-gradient(90deg, #D4A853, #FFD700, #D4A853)", backgroundSize: "200% 100%", animation: "goldFlow 3s linear infinite", zIndex: 1 }}>
          <span style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: "#2C2418", textTransform: "uppercase", letterSpacing: "0.08em" }}>Testimony</span>
        </div>
      )}

      {/* Header */}
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 8 }}>
        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
          {p.is_anonymous
            ? <AnonAvatar id={p.id} size={28} />
            : <UserAvatar name={displayName} userId={p.user_id || p.id} size={28} ht={ht} />
          }
          <div>
            <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.dark }}>{displayName}</div>
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light }}>{timeAgo(p.created_at)}</div>
          </div>
        </div>
        <span style={{ padding: "3px 8px", borderRadius: 10, background: catStyle.bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: catStyle.color }}>
          {catInfo.icon} {catInfo.label}
        </span>
      </div>

      {/* Title + body */}
      <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 600, color: ht.dark, marginBottom: 4 }}>{p.title}</div>
      <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.65, marginBottom: 10 }}>{p.body}</div>

      {/* Testimony answered info */}
      {isTestimony && p.answered_at && (
        <div style={{ marginBottom: 10 }}>
          {isJustAnswered && (
            <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: sc.text, marginBottom: 6, animation: "dropIn 0.4s ease" }}>
              God answered!
            </div>
          )}
          {p.testimony_text && (
            <div style={{ fontFamily: ht.body, fontSize: 13, fontStyle: "italic", color: ht.text, lineHeight: 1.6, padding: "8px 12px", background: sc.bg, borderRadius: 8, borderLeft: `3px solid ${sc.border}` }}>
              &ldquo;{p.testimony_text}&rdquo;
            </div>
          )}
          <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.light, marginTop: 6 }}>
            Answered {new Date(p.answered_at).toLocaleDateString("en-US", { month: "long", day: "numeric", year: "numeric" })}
          </div>
        </div>
      )}

      {/* Reactions + Actions */}
      <div style={{ display: "flex", alignItems: "center", gap: 6, flexWrap: "wrap" }}>
        {REACTION_TYPES.map(r => {
          const count = pReactions[r.type] || 0;
          const isActive = !!myReactions[r.type];
          const isPop = popReaction === r.type;
          const hasGlow = r.type === "praying" && count >= 5;
          return (
            <button key={r.type} aria-label={`${r.label}${count > 0 ? ` (${count})` : ""}`} aria-pressed={isActive}
              onClick={() => handleReaction(r.type)}
              style={{
                display: "flex", alignItems: "center", gap: 4, padding: "5px 10px", borderRadius: 20,
                border: `1px solid ${isActive ? ht.accent : ht.divider}`,
                background: isActive ? `${ht.accent}15` : "transparent",
                cursor: user ? "pointer" : "default", transition: "all 0.15s",
                boxShadow: hasGlow ? `0 0 8px ${ht.accent}30` : "none",
                animation: hasGlow ? "pulseGlow 2s ease infinite" : "none",
              }}>
              <span style={{ fontSize: 13, display: "inline-block", animation: isPop ? "heartPop 0.4s ease" : "none" }}>{r.emoji}</span>
              <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 600, color: isActive ? ht.accent : ht.muted, animation: isPop ? "scaleIn 0.3s ease" : "none" }}>{count > 0 ? count : ""}</span>
            </button>
          );
        })}

        {user && !isOwner && (
          <button aria-label="Report this prayer" onClick={() => setReportTarget(p.id)}
            style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ht.muted, cursor: "pointer", marginLeft: 2 }}>
            Report
          </button>
        )}

        {isOwner && feedView === "active" && (
          <div style={{ marginLeft: "auto", display: "flex", gap: 6 }}>
            <button aria-label="Mark prayer as answered" onClick={() => markCommunityPrayerAnswered(p.id)}
              style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${sc.border}`, background: sc.bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: sc.text, cursor: "pointer" }}>
              Mark Answered
            </button>
            {confirmDelete ? (
              <div style={{ display: "flex", gap: 4 }}>
                <button aria-label="Confirm delete prayer" onClick={() => { deleteCommunityPrayer(p.id); setConfirmDelete(false); }}
                  style={{ padding: "5px 10px", borderRadius: 6, border: `1px solid ${ec.border}`, background: ec.bg, fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ec.text, cursor: "pointer" }}>
                  Delete
                </button>
                <button aria-label="Cancel delete" onClick={() => setConfirmDelete(false)}
                  style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ht.muted, cursor: "pointer" }}>
                  Cancel
                </button>
              </div>
            ) : (
              <button aria-label="Delete prayer" onClick={() => setConfirmDelete(true)}
                style={{ padding: "5px 8px", borderRadius: 6, border: `1px solid ${ht.divider}`, background: "transparent", fontFamily: ht.ui, fontSize: 10, color: ec.text, cursor: "pointer" }}>
                {"\u2715"}
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
