"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card } from "./ui";
import { DAILY_HEBREW_LETTERS, DAILY_HEBREW_WORDS, DAILY_CHALLENGES, HEBREW_XP_AWARDS, getDayOfYear } from "./HebrewDailyData";

const PANEL_NAMES = ["Letter of the Day", "Word of the Day", "Daily Challenge"];
const TOMORROW = ["Word of the Day", "Daily Challenge", "Letter of the Day"];

export default function HebrewDailyCard() {
  const { darkMode, hebrewDailyDone, setHebrewDailyDone, awardHebrewXP, updateHebrewStreak } = useApp();
  const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
  const day = getDayOfYear();
  const panelType = day % 3;
  const today = new Date().toISOString().split("T")[0];
  const doneToday = hebrewDailyDone === today;

  // Daily Challenge state
  const [challengeAnswer, setChallengeAnswer] = useState(null);

  // ─── LETTER OF THE DAY ───
  if (panelType === 0) {
    const letter = DAILY_HEBREW_LETTERS[day % DAILY_HEBREW_LETTERS.length];
    return (
      <div style={{ background:ht2.stone, borderRadius:16, border:`1px solid ${ht2.stoneEdge}`, padding:"22px 18px", marginBottom:18, position:"relative", overflow:"hidden" }}>
        <div style={{ position:"absolute", top:0, right:0, width:120, height:120, background:`radial-gradient(circle at 100% 0%, ${ht2.accent}15, transparent 70%)`, pointerEvents:"none" }}/>
        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:14 }}>
          <div style={{ fontFamily:ht2.ui, fontSize:9, fontWeight:700, color:ht2.accent, textTransform:"uppercase", letterSpacing:"0.12em" }}>Today's Hebrew</div>
          <div style={{ flex:1, height:1, background:ht2.stoneEdge }}/>
          <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>Letter of the Day</div>
        </div>
        <div style={{ display:"flex", alignItems:"center", gap:18, marginBottom:14 }}>
          <div style={{ textAlign:"center", flexShrink:0 }}>
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:ht2.muted, marginBottom:2 }} lang="he">{letter.ancientForm}</div>
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:56, color:ht2.stoneText, lineHeight:1, animation:"sacredPulse 3s ease-in-out infinite" }} lang="he">{letter.letter}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.accent, fontWeight:700, marginTop:4 }}>{letter.name}</div>
          </div>
          <div style={{ flex:1, minWidth:0 }}>
            <div style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.stoneText, marginBottom:2 }}>{letter.name} — {letter.transliteration}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.muted, marginBottom:6 }}>Value: {letter.numericValue} · {letter.pictograph.split(" — ")[0]}</div>
            <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.text, lineHeight:1.7, fontStyle:"italic" }}>{letter.devotionalInsight.substring(0, 150)}...</div>
          </div>
        </div>
        <div style={{ fontFamily:ht2.body, fontSize:11, color:ht2.muted, padding:"8px 10px", background:darkMode?"rgba(192,108,62,0.08)":"rgba(192,108,62,0.05)", borderRadius:8 }}>
          <span lang="he" style={{ fontFamily:"'Times New Roman',serif", fontSize:16, color:ht2.accent }}>{letter.exampleWord}</span>
          <span style={{ marginLeft:8 }}>{letter.exampleMeaning} — {letter.verseRef}</span>
        </div>
        <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.light, textAlign:"right", marginTop:8 }}>Tomorrow: {TOMORROW[panelType]}</div>
      </div>
    );
  }

  // ─── WORD OF THE DAY ───
  if (panelType === 1) {
    const word = DAILY_HEBREW_WORDS[day % DAILY_HEBREW_WORDS.length];
    return (
      <div style={{ background:ht2.stone, borderRadius:16, border:`1px solid ${ht2.stoneEdge}`, padding:"22px 18px", marginBottom:18, position:"relative", overflow:"hidden" }}>
        <div style={{ position:"absolute", top:0, right:0, width:120, height:120, background:`radial-gradient(circle at 100% 0%, ${ht2.accent}15, transparent 70%)`, pointerEvents:"none" }}/>
        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:14 }}>
          <div style={{ fontFamily:ht2.ui, fontSize:9, fontWeight:700, color:ht2.accent, textTransform:"uppercase", letterSpacing:"0.12em" }}>Today's Hebrew</div>
          <div style={{ flex:1, height:1, background:ht2.stoneEdge }}/>
          <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>Word of the Day</div>
        </div>
        <div style={{ textAlign:"center", marginBottom:14 }}>
          <div style={{ fontFamily:"'Times New Roman',serif", fontSize:44, color:ht2.stoneText, direction:"rtl", lineHeight:1.2, animation:"sacredPulse 3s ease-in-out infinite", marginBottom:6 }} lang="he">{word.hebrew}</div>
          <div style={{ fontFamily:ht2.heading, fontSize:18, color:ht2.accent }}>{word.transliteration}</div>
          <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", marginTop:2 }}>{word.meaning}</div>
        </div>
        <div style={{ display:"flex", gap:8, justifyContent:"center", marginBottom:12 }}>
          <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{word.strongs}</span>
          <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{word.occurrences}× in OT</span>
          <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{word.partOfSpeech}</span>
        </div>
        <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.text, lineHeight:1.7, fontStyle:"italic", padding:"10px 12px", background:darkMode?"rgba(192,108,62,0.08)":"rgba(192,108,62,0.05)", borderRadius:8 }}>
          {word.devotionalInsight.substring(0, 180)}...
        </div>
        <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.light, textAlign:"right", marginTop:8 }}>Tomorrow: {TOMORROW[panelType]}</div>
      </div>
    );
  }

  // ─── DAILY CHALLENGE ───
  const challenge = DAILY_CHALLENGES[day % DAILY_CHALLENGES.length];
  const handleChallengeAnswer = (idx) => {
    if (challengeAnswer !== null || doneToday) return;
    setChallengeAnswer(idx);
    updateHebrewStreak();
    awardHebrewXP(idx === challenge.answer ? HEBREW_XP_AWARDS.dailyChallenge : HEBREW_XP_AWARDS.dailyAttempt);
    setHebrewDailyDone(today);
  };

  return (
    <div style={{ background:ht2.stone, borderRadius:16, border:`1px solid ${doneToday?ht2.stoneEdge:ht2.accent}`, padding:"22px 18px", marginBottom:18, position:"relative", overflow:"hidden", animation:!doneToday&&challengeAnswer===null?"pulseGlow 2.5s ease-in-out infinite":"none" }}>
      <div style={{ position:"absolute", top:0, right:0, width:120, height:120, background:`radial-gradient(circle at 100% 0%, ${ht2.accent}15, transparent 70%)`, pointerEvents:"none" }}/>
      <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:14 }}>
        <div style={{ fontFamily:ht2.ui, fontSize:9, fontWeight:700, color:ht2.accent, textTransform:"uppercase", letterSpacing:"0.12em" }}>Today's Hebrew</div>
        <div style={{ flex:1, height:1, background:ht2.stoneEdge }}/>
        <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>{doneToday ? "✓ Done" : "Daily Challenge"}</div>
      </div>
      <div style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.stoneText, lineHeight:1.6, marginBottom:14 }}>{challenge.question}</div>
      <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
        {challenge.options.map((opt, i) => {
          const isCorrect = i === challenge.answer;
          const isSelected = challengeAnswer === i;
          const showResult = challengeAnswer !== null || doneToday;
          let bg = ht2.card, border = ht2.divider, color = ht2.text;
          if (showResult && isCorrect) { bg = "#7ED4AD22"; border = "#7ED4AD"; color = "#2E7D5B"; }
          else if (showResult && isSelected && !isCorrect) { bg = "#E8625C11"; border = "#E8625C"; color = "#E8625C"; }
          return (
            <button key={i} onClick={() => handleChallengeAnswer(i)}
              style={{ width:"100%", padding:"10px 14px", borderRadius:8, border:`1.5px solid ${border}`, background:bg, color, fontFamily:ht2.ui, fontSize:13, fontWeight:showResult&&isCorrect?700:500, cursor:showResult?"default":"pointer", textAlign:"left", transition:"all 0.2s", display:"flex", justifyContent:"space-between", alignItems:"center" }}>
              <span>{opt}</span>
              {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
              {showResult && isSelected && !isCorrect && <span>✗</span>}
            </button>
          );
        })}
      </div>
      {(challengeAnswer !== null || doneToday) && (
        <div style={{ fontFamily:ht2.body, fontSize:12, color:ht2.muted, fontStyle:"italic", padding:"10px 12px", background:darkMode?"rgba(192,108,62,0.08)":"rgba(192,108,62,0.05)", borderRadius:8, marginTop:10, lineHeight:1.6 }}>
          {challenge.explanation}
        </div>
      )}
      <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.light, textAlign:"right", marginTop:8 }}>Tomorrow: {TOMORROW[panelType]}</div>
    </div>
  );
}
