"use client";
import { useState, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { CloseIcon, Spinner } from "./ui";
import { SEMANTIC_COLORS } from "../constants";

const TITLE_LIMIT = 200;
const BODY_LIMIT = 2000;

function sem(darkMode, type) { return SEMANTIC_COLORS[darkMode ? type + "Dark" : type]; }

export default function PrayerModal() {
  const {
    prayerModal, setPrayerModal, prayerTitle, setPrayerTitle,
    prayerText, setPrayerText, prayerLoading, prayers, darkMode,
    addPrayer, togglePrayerAnswered, deletePrayer, cooldownActive,
    currentVerse, book, chapter, verse, ht,
  } = useApp();

  const [confirmDeleteId, setConfirmDeleteId] = useState(null);

  // Escape key closes modal
  useEffect(() => {
    if (!prayerModal) return;
    const handleKey = (e) => { if (e.key === "Escape") setPrayerModal(false); };
    window.addEventListener("keydown", handleKey);
    return () => window.removeEventListener("keydown", handleKey);
  }, [prayerModal, setPrayerModal]);

  if (!prayerModal) return null;

  const sc = sem(darkMode, "success");
  const ec = sem(darkMode, "error");

  return (
    <div style={{ position: "fixed", inset: 0, background: "rgba(0,0,0,0.5)", zIndex: 100, display: "flex", alignItems: "flex-end", justifyContent: "center" }}
      onClick={() => setPrayerModal(false)} role="dialog" aria-label="Prayer journal" aria-modal="true">
      <div onClick={e => e.stopPropagation()} style={{ background: ht.bg, borderRadius: "20px 20px 0 0", padding: "24px 20px 32px", width: "100%", maxWidth: 640, maxHeight: "85vh", overflow: "auto", animation: "fadeIn 0.25s ease" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 18 }}>
          <h3 style={{ fontFamily: ht.heading, fontSize: 22, color: ht.dark, margin: 0 }}>{"\ud83d\ude4f"} Prayer Journal</h3>
          <button onClick={() => setPrayerModal(false)} aria-label="Close prayer journal" style={{ background: "none", border: "none", cursor: "pointer", color: ht.muted }}><CloseIcon /></button>
        </div>
        <div style={{ background: ht.card, borderRadius: 14, padding: "16px 18px", border: `1px solid ${ht.divider}`, marginBottom: 18 }}>
          <input key="prayer-title" value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} maxLength={TITLE_LIMIT} aria-label="Prayer title"
            placeholder={currentVerse ? `Prayer for ${book} ${chapter}:${verse}` : "Prayer title"}
            style={{ width: "100%", padding: "10px 0", border: "none", fontFamily: ht.heading, fontSize: 16, color: ht.dark, outline: "none", background: "transparent" }} />
          <textarea key="prayer-text" value={prayerText} onChange={e => setPrayerText(e.target.value)} maxLength={BODY_LIMIT} aria-label="Prayer text"
            placeholder="Write your prayer..." rows={3}
            style={{ width: "100%", padding: "8px 0", border: "none", fontFamily: ht.body, fontSize: 14, color: ht.text, outline: "none", background: "transparent", resize: "vertical", lineHeight: 1.7 }} />
          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginTop: 4 }}>
            {currentVerse && <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted }}>Linked to: {book} {chapter}:{verse}</div>}
            <div style={{ fontFamily: ht.ui, fontSize: 10, color: prayerText.length > BODY_LIMIT - 200 ? ec.text : ht.light, marginLeft: "auto" }}>
              {prayerText.length}/{BODY_LIMIT}
            </div>
          </div>
          <button onClick={addPrayer} disabled={!prayerText.trim() || cooldownActive}
            style={{ marginTop: 10, padding: "10px 20px", borderRadius: 8, border: "none", background: prayerText.trim() && !cooldownActive ? ht.accent : ht.divider, color: "#fff", fontFamily: ht.ui, fontSize: 13, fontWeight: 700, cursor: prayerText.trim() && !cooldownActive ? "pointer" : "default" }}>
            {cooldownActive ? "Please wait..." : "Add Prayer"}
          </button>
        </div>
        {prayerLoading ? <Spinner t={ht} /> : prayers.length === 0 ? (
          <div style={{ textAlign: "center", padding: 30, fontFamily: ht.body, fontSize: 15, color: ht.muted, fontStyle: "italic" }}>Your prayers will appear here</div>
        ) : prayers.map(p => (
          <div key={p.id} style={{ background: ht.card, borderRadius: 12, padding: "14px 16px", border: `1px solid ${p.is_answered ? sc.border + "44" : ht.divider}`, marginBottom: 8, borderLeft: `3px solid ${p.is_answered ? sc.border : ht.accent}` }}>
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
      </div>
    </div>
  );
}
