"use client";
import { useState, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Card } from "./ui";
import Header from "./Header";
import { HEBREW_XP_AWARDS } from "./HebrewDailyData";

export default function HebrewFlashcards() {
  const {
    darkMode, hebrewLessons, hebrewProgress, nav, goBack, bp,
    awardHebrewXP, updateHebrewStreak, hebrewFlashcardHistory, setHebrewFlashcardHistory,
  } = useApp();
  const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;

  // Build deck from completed lessons
  const deck = useMemo(() => {
    return hebrewLessons
      .filter(l => hebrewProgress[l.id]?.completed)
      .map(l => {
        const c = l.content || {};
        return {
          id: l.id,
          front: c.letter || c.word || "?",
          back: {
            name: c.name || l.title,
            transliteration: c.transliteration || "",
            meaning: l.subtitle || c.meaning || "",
          },
          isVocab: l.category === "vocabulary",
        };
      });
  }, [hebrewLessons, hebrewProgress]);

  const [cardIdx, setCardIdx] = useState(0);
  const [flipped, setFlipped] = useState(false);
  const [reviewed, setReviewed] = useState(0);
  const [done, setDone] = useState(false);

  if (deck.length === 0) {
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="Quick Review" onBack={goBack} theme={ht2} />
        <div style={{ textAlign:"center", padding:40 }}>
          <div style={{ fontSize:48, marginBottom:16 }}>🔄</div>
          <div style={{ fontFamily:ht2.heading, fontSize:18, color:ht2.dark, marginBottom:8 }}>No Cards Yet</div>
          <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.muted, lineHeight:1.7 }}>Complete some lessons first — each completed lesson adds a flashcard to your review deck.</div>
          <button onClick={() => nav("hebrew-home")} style={{ marginTop:20, padding:"12px 24px", borderRadius:10, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Go to Lessons</button>
        </div>
      </div>
    );
  }

  if (done) {
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="Review Complete!" onBack={goBack} theme={ht2} />
        <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`40px ${bp.pad}px`, textAlign:"center" }}>
          <div style={{ fontSize:64, marginBottom:16, animation:"confettiFloat 2s ease-out" }}>🎉</div>
          <div style={{ fontFamily:ht2.heading, fontSize:26, color:ht2.dark, marginBottom:8 }}>Well Done!</div>
          <Card t={ht2} style={{ marginBottom:22, textAlign:"center" }}>
            <div style={{ fontFamily:ht2.ui, fontSize:13, color:ht2.muted, marginBottom:6 }}>Cards Reviewed</div>
            <div style={{ fontFamily:ht2.heading, fontSize:48, fontWeight:800, color:ht2.accent }}>{reviewed}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:13, color:ht2.muted }}>+{reviewed * HEBREW_XP_AWARDS.flashcardCard} XP earned</div>
          </Card>
          <button onClick={() => nav("hebrew-home")} style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:10 }}>Back to Hebrew</button>
          <button onClick={() => { setCardIdx(0); setFlipped(false); setReviewed(0); setDone(false); }} style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${ht2.accentBorder}`, background:"transparent", color:ht2.accent, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Review Again</button>
        </div>
      </div>
    );
  }

  const card = deck[cardIdx % deck.length];
  const progress = Math.round(((cardIdx) / deck.length) * 100);

  const handleGrade = (grade) => {
    // grade: "easy" | "hard" | "again"
    awardHebrewXP(HEBREW_XP_AWARDS.flashcardCard);
    updateHebrewStreak();
    setReviewed(r => r + 1);
    setHebrewFlashcardHistory(prev => ({
      ...prev,
      [card.id]: { lastReviewed: new Date().toISOString().split("T")[0], grade }
    }));
    setFlipped(false);
    if (cardIdx + 1 >= deck.length) {
      setDone(true);
    } else {
      setCardIdx(i => i + 1);
    }
  };

  return (
    <div style={{ minHeight:"100vh", background:ht2.bg }}>
      <Header title="Quick Review" subtitle={`Card ${cardIdx + 1} of ${deck.length}`} onBack={goBack} theme={ht2} />
      <div style={{ maxWidth:bp.content, margin:"0 auto", padding:`16px ${bp.pad}px 40px` }}>
        {/* Progress bar */}
        <div style={{ background:ht2.divider, borderRadius:6, height:6, marginBottom:22, overflow:"hidden" }}>
          <div style={{ width:`${progress}%`, height:"100%", background:ht2.accent, borderRadius:6, transition:"width 0.4s ease" }}/>
        </div>

        {/* Flashcard */}
        <div style={{ perspective:600, marginBottom:20 }}>
          <div onClick={() => !flipped && setFlipped(true)}
            style={{
              position:"relative", width:"100%", minHeight:260, cursor:flipped?"default":"pointer",
              transformStyle:"preserve-3d", transition:"transform 0.5s ease",
              transform:flipped?"rotateY(180deg)":"rotateY(0deg)",
            }}>
            {/* Front */}
            <div style={{
              position:"absolute", inset:0, backfaceVisibility:"hidden",
              background:ht2.stone, borderRadius:20, border:`1px solid ${ht2.stoneEdge}`,
              display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center",
              padding:24, textAlign:"center",
            }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:80, color:ht2.stoneText, direction:"rtl", lineHeight:1, animation:"sacredPulse 3s ease-in-out infinite", marginBottom:16 }} lang="he">
                {card.front}
              </div>
              <div style={{ fontFamily:ht2.ui, fontSize:12, color:ht2.muted }}>Tap to reveal</div>
            </div>
            {/* Back */}
            <div style={{
              position:"absolute", inset:0, backfaceVisibility:"hidden",
              transform:"rotateY(180deg)",
              background:ht2.card, borderRadius:20, border:`1px solid ${ht2.accentBorder}`,
              display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center",
              padding:24, textAlign:"center",
            }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:44, color:ht2.accent, direction:"rtl", lineHeight:1, marginBottom:12 }} lang="he">
                {card.front}
              </div>
              <div style={{ fontFamily:ht2.heading, fontSize:22, color:ht2.dark, marginBottom:4 }}>{card.back.name}</div>
              {card.back.transliteration && (
                <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.muted, fontStyle:"italic", marginBottom:4 }}>{card.back.transliteration}</div>
              )}
              <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.6 }}>{card.back.meaning}</div>
            </div>
          </div>
        </div>

        {/* Grade buttons (only when flipped) */}
        {flipped && (
          <div style={{ display:"flex", gap:8, animation:"fadeIn 0.3s ease" }}>
            <button onClick={() => handleGrade("again")} style={{ flex:1, padding:"14px", borderRadius:12, border:`1.5px solid #E8625C`, background:"#E8625C11", color:"#E8625C", fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Again</button>
            <button onClick={() => handleGrade("hard")} style={{ flex:1, padding:"14px", borderRadius:12, border:`1.5px solid ${ht2.divider}`, background:ht2.card, color:ht2.text, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Hard</button>
            <button onClick={() => handleGrade("easy")} style={{ flex:1, padding:"14px", borderRadius:12, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Easy</button>
          </div>
        )}
      </div>
    </div>
  );
}
