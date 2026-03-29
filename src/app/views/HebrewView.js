"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";
import PronunciationButton from "../components/PronunciationButton";
import { GRAMMAR_LESSONS, VERSE_DATA, WORDS_GEN1V1, WORDS_PSALM23V1, WORDS_GEN1V2, WORDS_DEUT6V4 } from "../components/HebrewReadingData";
import HebrewDailyCard from "../components/HebrewDailyCard";
import HebrewProgressPath from "../components/HebrewProgressPath";
import HebrewFlashcards from "../components/HebrewFlashcards";
import { HEBREW_XP_LEVELS, DAILY_HEBREW_LETTERS, getDayOfYear } from "../components/HebrewDailyData";

export default function HebrewView() {
  const {
    view, darkMode, user,
    hebrewLessons, hebrewLesson, setHebrewLesson, hebrewAlphabet, setHebrewAlphabet, hebrewVocab, setHebrewVocab,
    hebrewCategory, setHebrewCategory, hebrewProgress,
    hebrewPracticeIdx, setHebrewPracticeIdx,
    hebrewPracticeAnswer, setHebrewPracticeAnswer,
    hebrewPracticeScore, setHebrewPracticeScore,
    readingStep, setReadingStep,
    showLetters, setShowLetters,
    readingVerse, setReadingVerse,
    vocabGroup, setVocabGroup,
    grammarLesson, setGrammarLesson, grammarLessonIds,
    nav, goBack,
    markHebrewComplete, loadHebrewLesson, bp,
    hebrewXP, hebrewStreak, awardHebrewXP, updateHebrewStreak,
    hebrewDailyDone,
  } = useApp();

  const HebrewHome = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    const categories = [
      { id:"alphabet", label:"Alphabet", icon:"א", desc:"All 22 Hebrew letters" },
      { id:"vocabulary", label:"Vocabulary", icon:"📚", desc:"Key biblical words" },
      { id:"grammar", label:"Grammar", icon:"📝", desc:"Sentence structure", action:() => nav("hebrew-grammar-home") },
      { id:"reading", label:"Reading", icon:"📖", desc:"Read biblical texts", action:() => nav("hebrew-reading-home") },
    ];
    const currentLessonIds = hebrewLessons.map(l => l.id);
    const completedCount = Object.values(hebrewProgress).filter(p => p.completed && currentLessonIds.includes(p.lesson_id)).length;
    const totalLessons = hebrewLessons.length;
    return (
      <div style={{ minHeight:"100vh",background:ht2.bg,paddingBottom:80 }}>
        <Header title="Learn Hebrew" subtitle="Biblical Hebrew · עִבְרִית" onBack={goBack} theme={ht2} />
        <div style={{ padding:`20px ${bp.pad}px 40px`,maxWidth:bp.content,margin:"0 auto" }}>
          {/* Stone Tablet Hero */}
          {(() => {
            const todayLetter = DAILY_HEBREW_LETTERS[getDayOfYear() % DAILY_HEBREW_LETTERS.length];
            const currentLevel = [...HEBREW_XP_LEVELS].reverse().find(l => hebrewXP >= l.min) || HEBREW_XP_LEVELS[0];
            const nextLevel = HEBREW_XP_LEVELS[HEBREW_XP_LEVELS.indexOf(currentLevel) + 1];
            const xpPct = nextLevel ? ((hebrewXP - currentLevel.min) / (nextLevel.min - currentLevel.min)) * 100 : 100;
            return (
              <div style={{ background:ht2.stone, borderRadius:20, border:`1px solid ${ht2.stoneEdge}`, padding:"28px 20px 22px", marginBottom:18, position:"relative", overflow:"hidden", animation:"breathe 4s ease-in-out infinite" }}>
                <div style={{ position:"absolute", top:0, right:0, width:160, height:160, background:`radial-gradient(circle at 100% 0%, ${ht2.accent}12, transparent 60%)`, pointerEvents:"none" }}/>
                <div style={{ position:"relative", zIndex:1 }}>
                  <div style={{ display:"flex", alignItems:"center", gap:20, marginBottom:16 }}>
                    <div style={{ textAlign:"center", flexShrink:0 }}>
                      <div style={{ fontFamily:"'Times New Roman',serif", fontSize:16, color:ht2.muted, marginBottom:2 }} lang="he">{todayLetter.ancientForm}</div>
                      <div style={{ fontFamily:"'Times New Roman',serif", fontSize:72, color:ht2.stoneText, lineHeight:1, animation:"sacredPulse 3s ease-in-out infinite", textShadow:`0 2px 12px ${ht2.accent}33` }} lang="he">{todayLetter.letter}</div>
                      <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.accent, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.1em", marginTop:4 }}>{todayLetter.name}</div>
                    </div>
                    <div style={{ flex:1, minWidth:0 }}>
                      <div style={{ fontFamily:ht2.heading, fontSize:18, fontWeight:700, color:ht2.stoneText, marginBottom:2 }}>Learn Hebrew</div>
                      <div style={{ fontFamily:ht2.body, fontSize:12, color:ht2.muted, fontStyle:"italic", marginBottom:12 }}>The language of God's Word</div>
                      {/* XP Level */}
                      <div style={{ display:"flex", alignItems:"center", gap:6, marginBottom:6 }}>
                        <span style={{ fontSize:14 }}>{currentLevel.icon}</span>
                        <span style={{ fontFamily:ht2.ui, fontSize:12, fontWeight:700, color:ht2.accent }}>{currentLevel.name}</span>
                        <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light }}>· {hebrewXP} XP</span>
                      </div>
                      <div style={{ background:ht2.divider, borderRadius:3, height:4, overflow:"hidden" }}>
                        <div style={{ width:`${xpPct}%`, height:"100%", background:`linear-gradient(90deg, ${ht2.accent}, #D4A853)`, borderRadius:3, transition:"width 0.5s ease" }}/>
                      </div>
                      {hebrewStreak.count > 0 && (
                        <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.accent, fontWeight:700, marginTop:6 }}>🔥 {hebrewStreak.count}-day streak</div>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            );
          })()}

          {/* Daily Hebrew Card */}
          <HebrewDailyCard />

          {/* Quick Actions */}
          <div style={{ display:"flex", gap:8, marginBottom:18 }}>
            <button onClick={() => nav("hebrew-flashcards")} style={{ flex:1, background:ht2.card, border:`1px solid ${ht2.divider}`, borderRadius:12, padding:"12px 10px", textAlign:"center", cursor:"pointer" }}>
              <div style={{ fontSize:18, marginBottom:4 }}>🔄</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.dark }}>Review</div>
              <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>Flashcards</div>
            </button>
            <button onClick={() => nav("hebrew-reading-home")} style={{ flex:1, background:ht2.card, border:`1px solid ${ht2.divider}`, borderRadius:12, padding:"12px 10px", textAlign:"center", cursor:"pointer" }}>
              <div style={{ fontSize:18, marginBottom:4 }}>📖</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.dark }}>Reading</div>
              <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>Word by word</div>
            </button>
            <button onClick={() => nav("hebrew-grammar-home")} style={{ flex:1, background:ht2.card, border:`1px solid ${ht2.divider}`, borderRadius:12, padding:"12px 10px", textAlign:"center", cursor:"pointer" }}>
              <div style={{ fontSize:18, marginBottom:4 }}>📝</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.dark }}>Grammar</div>
              <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.muted }}>{GRAMMAR_LESSONS.length} lessons</div>
            </button>
          </div>

          {/* Progress Path */}
          <HebrewProgressPath />
          
          {/* Category Tabs */}
          <div role="tablist" aria-label="Hebrew learning categories" style={{ display:"flex",gap:8,marginBottom:18,flexWrap:"wrap" }}>
            {categories.map(cat => (
              <button key={cat.id} onClick={() => { if (cat.action) { setReadingStep(0); setShowLetters(false); setGrammarLesson(null); cat.action(); } else if (!cat.soon) setHebrewCategory(cat.id); }}
                role="tab" aria-selected={hebrewCategory===cat.id} style={{ flexShrink:0,padding:"8px 16px",borderRadius:20,border:hebrewCategory===cat.id?"none":`1px solid ${ht2.divider}`,background:hebrewCategory===cat.id?ht2.tabActive:ht2.card,color:hebrewCategory===cat.id?ht2.headerText:cat.soon?ht2.light:ht2.text,fontFamily:ht2.ui,fontSize:12,fontWeight:700,cursor:cat.soon?"default":"pointer",opacity:cat.soon?0.55:1,whiteSpace:"nowrap" }}>
                {cat.label}{cat.soon?" 🔒":""}
              </button>
            ))}
          </div>
          {/* Lessons List */}
          <Label icon={hebrewCategory === "vocabulary" ? "📚" : "א"} t={ht2} color={ht2.muted}>{hebrewCategory === "vocabulary" ? `Vocabulary — ${hebrewLessons.length} Lessons` : "The Hebrew Alphabet — 22 Letters"}</Label>
          {hebrewLessons.length === 0 ? <Spinner t={ht2}/> : hebrewCategory === "vocabulary" ? (() => {
            const VOCAB_GROUPS = [
              { id:"names-of-god", label:"Names of God", icon:"✡️", range:[101,106], color:"#D4A853", desc:"The divine names of the Creator" },
              { id:"creation-covenant", label:"Creation & Covenant", icon:"🌿", range:[107,112], color:"#2E4A33", desc:"Words from the beginning" },
              { id:"family-words", label:"Family Words", icon:"👨‍👩‍👧‍👦", range:[113,116], color:"#C06C3E", desc:"Av, Em, Ben, Bat" },
              { id:"worship-words", label:"Worship Words", icon:"🙌", range:[117,120], color:"#8B5CF6", desc:"Hallelujah, Amen, Torah, Mitzvah" },
              { id:"prophecy-words", label:"Prophecy Words", icon:"🔥", range:[121,123], color:"#E8625C", desc:"Mashiach, Navi, Davar" },
            ];
            return (
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {VOCAB_GROUPS.map(group => {
                  const groupLessons = hebrewLessons.filter(l => l.lesson_number >= group.range[0] && l.lesson_number <= group.range[1]);
                  if (groupLessons.length === 0) return null;
                  const isOpen = vocabGroup === group.id;
                  const completedInGroup = groupLessons.filter(l => hebrewProgress[l.id]?.completed).length;
                  return (
                    <div key={group.id}>
                      <button aria-expanded={isOpen} onClick={() => setVocabGroup(isOpen ? null : group.id)}
                        style={{ width:"100%", background:isOpen?group.color:ht2.card, borderRadius:isOpen?"14px 14px 0 0":14, padding:"16px 18px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, border:`1px solid ${isOpen?group.color:ht2.divider}`, borderBottom:isOpen?"none":"", transition:"all 0.2s", borderLeft:`4px solid ${group.color}` }}>
                        <div style={{ width:44, height:44, borderRadius:12, background:isOpen?"rgba(255,255,255,0.15)":`${group.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{group.icon}</div>
                        <div style={{ flex:1 }}>
                          <div style={{ fontFamily:ht2.heading, fontSize:16, fontWeight:700, color:isOpen?ht2.headerText:ht2.dark }}>{group.label}</div>
                          <div style={{ fontFamily:ht2.ui, fontSize:12, color:isOpen?`${ht2.headerText}88`:ht2.muted, marginTop:2 }}>{group.desc}</div>
                        </div>
                        <div style={{ textAlign:"right", flexShrink:0 }}>
                          <div style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:isOpen?ht2.accent:`${group.color}`, marginBottom:3 }}>{completedInGroup}/{groupLessons.length}</div>
                          <div style={{ fontFamily:ht2.ui, fontSize:18, color:isOpen?ht2.headerText:ht2.muted }}>{isOpen?"▲":"▼"}</div>
                        </div>
                      </button>
                      {isOpen && (
                        <div style={{ border:`1px solid ${group.color}`, borderTop:"none", borderRadius:"0 0 14px 14px", overflow:"hidden" }}>
                          {groupLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = hebrewProgress[lesson.id]?.completed;
                const isVocab = lesson.category === "vocabulary";
                return (
                  <button key={lesson.id} onClick={() => { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}
                    style={{ background:ht2.card,border:"none",borderBottom:`1px solid ${ht2.divider}`,borderRadius:0,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":group.color}`,transition:"all 0.15s",width:"100%" }}>
                    {/* Alphabet: show single letter. Vocabulary: show Hebrew word */}
                    {isVocab ? (
                      <div style={{ minWidth:64,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:18,color:ht2.accent,flexShrink:0,direction:"rtl",padding:"0 8px" }}>
                        {cnt.word || "אֱלֹהִים"}
                      </div>
                    ) : (
                      <div style={{ width:48,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:30,color:ht2.accent,flexShrink:0,direction:"rtl" }}>
                        {cnt.letter || "א"}
                      </div>
                    )}
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                        <span style={{ fontFamily:ht2.heading,fontSize:15,fontWeight:700,color:ht2.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:ht2.body,fontSize:12.5,color:ht2.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                      {isVocab && cnt.transliteration && (
                        <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,marginTop:3,letterSpacing:"0.03em" }}>{cnt.transliteration}</div>
                      )}
                    </div>
                    <div style={{ textAlign:"right",flexShrink:0 }}>
                      {isVocab && <div style={{ fontFamily:ht2.ui,fontSize:9,color:ht2.light,marginBottom:2,textTransform:"uppercase",letterSpacing:"0.05em" }}>Vocab</div>}
                      {!isVocab && <div style={{ fontFamily:ht2.ui,fontSize:10,color:ht2.light }}>Lesson {lesson.lesson_number}</div>}
                      <div style={{ color:ht2.light,marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            );
          })() : (
            <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
              {hebrewLessons.map((lesson, li) => {
                const cnt = lesson.content || {};
                const isDone = hebrewProgress[lesson.id]?.completed;
                return (
                  <button key={lesson.id} onClick={() => { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}
                    style={{ background:ht2.card,border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":ht2.accent}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)",transition:"all 0.15s",animation:`fadeIn 0.4s ease ${li*0.06}s both` }}>
                    <div style={{ width:48,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:30,color:ht2.accent,flexShrink:0,direction:"rtl" }}>
                      {cnt.letter || "א"}
                    </div>
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                        <span style={{ fontFamily:ht2.heading,fontSize:15,fontWeight:700,color:ht2.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:ht2.body,fontSize:12.5,color:ht2.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                    </div>
                    <div style={{ textAlign:"right",flexShrink:0 }}>
                      <div style={{ fontFamily:ht2.ui,fontSize:10,color:ht2.light }}>Lesson {lesson.lesson_number}</div>
                      <div style={{ color:ht2.light,marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
            </div>
          )}
          {/* Full 22-letter alphabet grid */}
          {(() => {
            const ALL_LETTERS = [
              {letter:"א",name:"Aleph",num:1},{letter:"ב",name:"Bet",num:2},{letter:"ג",name:"Gimel",num:3},
              {letter:"ד",name:"Dalet",num:4},{letter:"ה",name:"He",num:5},{letter:"ו",name:"Vav",num:6},
              {letter:"ז",name:"Zayin",num:7},{letter:"ח",name:"Chet",num:8},{letter:"ט",name:"Tet",num:9},
              {letter:"י",name:"Yod",num:10},{letter:"כ",name:"Kaf",num:11},{letter:"ל",name:"Lamed",num:12},
              {letter:"מ",name:"Mem",num:13},{letter:"נ",name:"Nun",num:14},{letter:"ס",name:"Samekh",num:15},
              {letter:"ע",name:"Ayin",num:16},{letter:"פ",name:"Pe",num:17},{letter:"צ",name:"Tsade",num:18},
              {letter:"ק",name:"Qof",num:19},{letter:"ר",name:"Resh",num:20},{letter:"שׁ",name:"Shin",num:21},
              {letter:"ת",name:"Tav",num:22},
            ];
            const ANCIENT = { "א":"𐤀","ב":"𐤁","ג":"𐤂","ד":"𐤃","ה":"𐤄","ו":"𐤅","ז":"𐤆","ח":"𐤇","ט":"𐤈","י":"𐤉","כ":"𐤊","ל":"𐤋","מ":"𐤌","נ":"𐤍","ס":"𐤎","ע":"𐤏","פ":"𐤐","צ":"𐤑","ק":"𐤒","ר":"𐤓","שׁ":"𐤔","ת":"𐤕" };
            const seededNums = hebrewLessons.map(l => l.lesson_number);
            return (
              <div style={{ marginTop:20, display: hebrewCategory === "alphabet" ? "block" : "none" }}>
                <Label icon="🔡" t={ht2} color={ht2.muted}>All 22 Letters — Quick Reference</Label>
                <div style={{ display:"grid",gridTemplateColumns:"repeat(4,1fr)",gap:8 }}>
                  {ALL_LETTERS.map(al => {
                    const hasLesson = seededNums.includes(al.num);
                    const lesson = hebrewLessons.find(l => l.lesson_number === al.num);
                    const isDone = lesson && hebrewProgress[lesson.id]?.completed;
                    const pScore = lesson && hebrewProgress[lesson.id]?.score || 0;
                    const tierBorder = isDone && pScore >= 90 ? "2px solid #FFD700" : isDone && pScore >= 70 ? "2px solid #C0C0C0" : isDone ? "2px solid #CD7F32" : `1px solid ${hasLesson?ht2.accentBorder:ht2.divider}`;
                    const tierGlow = isDone && pScore >= 90 ? "0 0 8px rgba(255,215,0,0.3)" : "none";
                    return (
                      <button key={al.num}
                        onClick={() => { if (hasLesson && lesson) { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}}
                        style={{ background:isDone?"#7ED4AD22":hasLesson?ht2.card:ht2.bg,border:tierBorder,borderRadius:12,padding:"12px 6px",textAlign:"center",cursor:hasLesson?"pointer":"default",opacity:hasLesson?1:0.45,transition:"all 0.15s",position:"relative",boxShadow:tierGlow }}>
                        {isDone && <div style={{ position:"absolute",top:4,right:6,fontSize:8,color:"#2E7D5B",fontWeight:800 }}>✓</div>}
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:11,color:ht2.light,marginBottom:1 }}>{ANCIENT[al.letter]}</div>
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:28,color:hasLesson?ht2.accent:ht2.light,direction:"rtl",lineHeight:1,marginBottom:4 }} lang="he">{al.letter}</div>
                        <div style={{ fontFamily:ht2.ui,fontSize:9,color:hasLesson?ht2.text:ht2.light,fontWeight:600 }}>{al.name}</div>
                        {!hasLesson && <div style={{ fontFamily:ht2.ui,fontSize:8,color:ht2.light,marginTop:2 }}>Soon</div>}
                      </button>
                    );
                  })}
                </div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.muted,textAlign:"center",marginTop:10 }}>
                  {seededNums.length} of 22 letters available · More added regularly
                </div>
              </div>
            );
          })()}
        </div>
      </div>
    );
  };

  // ═══ HEBREW LESSON ═══
  const HebrewLesson = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    if (!hebrewLesson) return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title="Hebrew Lesson" onBack={goBack} theme={ht2}/>
        <Spinner t={ht2}/>
      </div>
    );
    const content = hebrewLesson.content || {};
    const verseConns = Array.isArray(hebrewLesson.verse_connections) ? hebrewLesson.verse_connections : [];
    const isDone = hebrewProgress[hebrewLesson.id]?.completed;
    const currentIdx = hebrewLessons.findIndex(l => l.id === hebrewLesson.id);
    const prevLesson = currentIdx > 0 ? hebrewLessons[currentIdx-1] : null;
    const nextLesson = currentIdx < hebrewLessons.length-1 ? hebrewLessons[currentIdx+1] : null;
    return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title={hebrewLesson.title} subtitle={hebrewLesson.subtitle} onBack={goBack} theme={ht2}
          right={isDone && <span style={{ fontFamily:ht2.ui,fontSize:11,color:"#7ED4AD",fontWeight:700,background:"#7ED4AD22",padding:"4px 10px",borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Big letter / word hero — adapts to alphabet vs vocabulary */}
          {hebrewLesson?.category === "vocabulary" ? (
            <div style={{ background:ht2.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative",zIndex:1 }}>
                <div style={{ display:"flex",alignItems:"center",justifyContent:"center",gap:10,marginBottom:14 }}>
                  <div style={{ fontFamily:"'Times New Roman',serif",fontSize:52,color:ht2.headerText,direction:"rtl",lineHeight:1.2,textShadow:"0 4px 24px rgba(0,0,0,0.35)",letterSpacing:2 }} lang="he">{content.word}</div>
                  <PronunciationButton lang="hebrew" wordId={`lesson-${(content.strongs || "").toLowerCase()}`} size={24} color={ht2.headerText} style={{ background:"rgba(255,255,255,0.15)",borderRadius:10,padding:6 }} />
                </div>
                <div style={{ fontFamily:ht2.heading,fontSize:24,color:ht2.accent,marginBottom:4 }}>{content.transliteration}</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.part_of_speech}</div>
                <div style={{ display:"inline-block",background:"rgba(192,108,62,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.05em" }}>
                  {content.strongs} · Appears {content.numeric_occurrences?.toLocaleString()} times in OT
                </div>
              </div>
            </div>
          ) : (() => {
            const ANCIENT = { "א":"𐤀","ב":"𐤁","ג":"𐤂","ד":"𐤃","ה":"𐤄","ו":"𐤅","ז":"𐤆","ח":"𐤇","ט":"𐤈","י":"𐤉","כ":"𐤊","ל":"𐤋","מ":"𐤌","נ":"𐤍","ס":"𐤎","ע":"𐤏","פ":"𐤐","צ":"𐤑","ק":"𐤒","ר":"𐤓","שׁ":"𐤔","ת":"𐤕" };
            const modernLetter = content.letter || hebrewAlphabet?.hebrew_letter || "א";
            const ancientSymbol = ANCIENT[modernLetter] || "";
            return (
              <div style={{ background:ht2.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
                <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
                <div style={{ position:"relative",zIndex:1 }}>
                  <div style={{ display:"flex",justifyContent:"center",alignItems:"center",gap:24,marginBottom:14 }}>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:80,color:`${ht2.headerText}55`,lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.2)" }}>{ancientSymbol}</div>
                      <div style={{ fontFamily:ht2.ui,fontSize:9,color:`${ht2.headerText}55`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Ancient</div>
                    </div>
                    <div style={{ width:1,height:80,background:`${ht2.headerText}22` }}/>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:108,color:ht2.headerText,direction:"rtl",lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.35)",animation:"sacredPulse 3s ease-in-out infinite" }} lang="he">{modernLetter}</div>
                      <div style={{ fontFamily:ht2.ui,fontSize:9,color:`${ht2.headerText}77`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Modern</div>
                    </div>
                  </div>
                  <div style={{ display:"flex",alignItems:"center",justifyContent:"center",gap:8,marginBottom:4 }}>
                    <div style={{ fontFamily:ht2.heading,fontSize:26,color:ht2.accent }}>{content.name || hebrewAlphabet?.letter_name}</div>
                    <PronunciationButton lang="hebrew" wordId={`letter-${(content.name || hebrewAlphabet?.letter_name || "aleph").toLowerCase()}`} size={22} color={ht2.headerText} style={{ background:"rgba(255,255,255,0.15)",borderRadius:10,padding:6 }} />
                  </div>
                  <div style={{ fontFamily:ht2.body,fontSize:15,color:`${ht2.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.transliteration || hebrewAlphabet?.transliteration}</div>
                  <div style={{ display:"inline-block",background:"rgba(192,108,62,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.05em" }}>
                    Numeric value: {content.numeric_value || hebrewAlphabet?.numeric_value}
                  </div>
                </div>
              </div>
            );
          })()}
          {/* Pronunciation */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <Label icon="🔊" t={ht2}>Pronunciation</Label>
            <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.75 }}>{content.pronunciation || hebrewAlphabet?.pronunciation_guide}</div>
          </Card>
          {/* Pictograph */}
          <Card accent t={ht2} style={{ marginBottom:14 }}>
            <Label icon="🖼️" t={ht2}>Ancient Pictograph</Label>
            <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.75 }}>{content.pictograph || hebrewAlphabet?.pictographic}</div>
          </Card>
          {/* Fun fact */}
          {content.fun_fact && (
            <Card t={ht2} style={{ marginBottom:14,borderLeft:`3px solid ${ht2.accent}` }}>
              <Label icon="✨" t={ht2}>Did You Know?</Label>
              <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.8,fontStyle:"italic" }}>{content.fun_fact}</div>
            </Card>
          )}
          {/* Vocabulary */}
          {hebrewVocab.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="📚" t={ht2} color={ht2.muted}>Key Words This Lesson</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {hebrewVocab.map((word,i) => (
                  <div key={i} style={{ background:ht2.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${ht2.divider}` }}>
                    <div style={{ display:"flex",alignItems:"center",gap:10,marginBottom:6,flexWrap:"wrap" }}>
                      <span style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:ht2.accent,direction:"rtl",fontWeight:700 }} lang="he">{word.hebrew_word}</span>
                      <span style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,fontStyle:"italic" }}>({word.transliteration})</span>
                      <span style={{ marginLeft:"auto",background:ht2.accentLight,border:`1px solid ${ht2.accentBorder}`,padding:"2px 8px",borderRadius:4,fontFamily:"monospace",fontSize:10,color:ht2.muted }}>{word.strongs_number}</span>
                    </div>
                    <div style={{ fontFamily:ht2.ui,fontSize:13.5,color:ht2.text,lineHeight:1.6,marginBottom:6 }}>{word.meaning}</div>
                    {word.example_verse_ref && (
                      <div style={{ fontFamily:ht2.body,fontSize:12,color:ht2.muted,fontStyle:"italic",padding:"8px 10px",background:ht2.hebrewBg,borderRadius:8 }}>
                        📖 <strong>{word.example_verse_ref}:</strong> "{word.example_verse_text}"
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}
          {/* Verse Connections */}
          {verseConns.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={ht2} color={ht2.muted}>In the Bible</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {verseConns.map((vc,i) => (
                  <div key={i} style={{ padding:"12px 14px",background:ht2.accentLight,borderRadius:10,border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:ht2.heading,fontSize:13,fontWeight:700,color:ht2.accent,marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:ht2.body,fontSize:13.5,color:ht2.text,lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Practice Button */}
          <button onClick={() => { setHebrewPracticeIdx(0); setHebrewPracticeAnswer(null); setHebrewPracticeScore(0); nav("hebrew-practice"); }}
            style={{ width:"100%",padding:"16px",borderRadius:14,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:12,boxShadow:"0 4px 15px rgba(46,74,51,0.25)" }}>
            ✍️ Practice This Lesson
          </button>
          {/* Mark Complete / Done status */}
          {user && !isDone && (
            <button onClick={() => { markHebrewComplete(hebrewLesson.id, 0); awardHebrewXP(30); updateHebrewStreak(); }}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:"1.5px solid #7ED4AD",background:"#7ED4AD11",color:"#2E7D5B",fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center",padding:"13px",borderRadius:12,background:"#7ED4AD22",border:"1px solid #7ED4AD44",marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui,fontSize:13,color:"#2E7D5B",fontWeight:700 }}>
                ✓ Lesson Complete{hebrewProgress[hebrewLesson.id]?.score ? ` · Best Score: ${hebrewProgress[hebrewLesson.id].score}%` : ""}
              </span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center",padding:"12px",borderRadius:10,background:ht2.accentLight,border:`1px solid ${ht2.accentBorder}`,marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui,fontSize:12,color:ht2.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}
          {/* Prev / Next */}
          <div style={{ display:"flex",gap:10 }}>
            <button onClick={() => { if(prevLesson){ setHebrewLesson(prevLesson); setHebrewAlphabet(null); setHebrewVocab([]); loadHebrewLesson(prevLesson.id); }}} disabled={!prevLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${ht2.divider}`,background:prevLesson?ht2.card:ht2.bg,fontFamily:ht2.ui,fontSize:13,color:ht2.dark,cursor:prevLesson?"pointer":"default",opacity:prevLesson?1:0.4 }}>← Prev</button>
            <button onClick={() => { if(nextLesson){ setHebrewLesson(nextLesson); setHebrewAlphabet(null); setHebrewVocab([]); loadHebrewLesson(nextLesson.id); }}} disabled={!nextLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${ht2.divider}`,background:nextLesson?ht2.card:ht2.bg,fontFamily:ht2.ui,fontSize:13,color:ht2.dark,cursor:nextLesson?"pointer":"default",opacity:nextLesson?1:0.4 }}>Next →</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══ HEBREW PRACTICE ═══
  const HebrewPractice = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    if (!hebrewLesson) return null;
    const content = hebrewLesson.content || {};
    const questions = content.practice || [];
    if (questions.length === 0) return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title="Practice" onBack={goBack} theme={ht2}/>
        <div style={{ textAlign:"center",padding:40 }}>
          <div style={{ fontSize:48,marginBottom:16 }}>✍️</div>
          <div style={{ fontFamily:ht2.heading,fontSize:18,color:ht2.dark }}>No practice questions yet</div>
        </div>
      </div>
    );
    const isDone = hebrewPracticeIdx >= questions.length;
    const currentQ = isDone ? null : questions[hebrewPracticeIdx];
    const isLast = hebrewPracticeIdx === questions.length - 1;
    const pct = isDone ? 100 : Math.round((hebrewPracticeIdx/questions.length)*100);

    const handleAnswer = (idx) => {
      if (hebrewPracticeAnswer !== null) return;
      setHebrewPracticeAnswer(idx);
      if (currentQ.type === "choice" && idx === currentQ.answer) setHebrewPracticeScore(s => s+1);
    };
    const handleIdentifyGrade = (knewIt) => {
      if (knewIt) setHebrewPracticeScore(s => s+1);
      handleNext();
    };
    const handleNext = () => {
      if (isLast) {
        const finalScore = Math.round((hebrewPracticeScore/questions.length)*100);
        markHebrewComplete(hebrewLesson.id, finalScore);
        awardHebrewXP(finalScore >= 70 ? 50 : 20);
        updateHebrewStreak();
        setHebrewPracticeIdx(questions.length);
      } else {
        setHebrewPracticeIdx(i => i+1);
        setHebrewPracticeAnswer(null);
      }
    };

    // Done screen
    if (isDone) {
      const finalScore = Math.round((hebrewPracticeScore/questions.length)*100);
      return (
        <div style={{ minHeight:"100vh",background:ht2.bg }}>
          <Header title="Practice Complete!" theme={ht2} onBack={goBack}/>
          <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`40px ${bp.pad}px`,textAlign:"center" }}>
            <div style={{ fontSize:64,marginBottom:16 }}>🎉</div>
            <div style={{ fontFamily:ht2.heading,fontSize:30,color:ht2.dark,marginBottom:8 }}>Well Done!</div>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:64,color:ht2.accent,direction:"rtl",marginBottom:20,lineHeight:1 }}>{content.letter}</div>
            <Card t={ht2} style={{ marginBottom:22,textAlign:"center" }}>
              <div style={{ fontFamily:ht2.ui,fontSize:13,color:ht2.muted,marginBottom:6 }}>Your Score</div>
              <div style={{ fontFamily:ht2.heading,fontSize:52,fontWeight:800,color:finalScore>=70?"#2E7D5B":ht2.accent,animation:"countUp 0.5s ease" }}>{finalScore}%</div>
              <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,marginTop:4 }}>+{finalScore >= 70 ? 50 : 20} XP earned</div>
              <div style={{ fontFamily:ht2.ui,fontSize:13,color:ht2.muted }}>{hebrewPracticeScore} of {questions.length} correct</div>
              {finalScore>=70 ? <div style={{ fontFamily:ht2.body,fontSize:13,color:"#2E7D5B",marginTop:8,fontStyle:"italic" }}>Excellent! This lesson is now marked complete.</div>
                : <div style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,marginTop:8,fontStyle:"italic" }}>Try again to strengthen your memory.</div>}
            </Card>
            <button onClick={() => nav("hebrew-home")} style={{ width:"100%",padding:"14px",borderRadius:12,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:10 }}>
              Back to Lessons
            </button>
            <button onClick={() => { setHebrewPracticeIdx(0); setHebrewPracticeAnswer(null); setHebrewPracticeScore(0); }}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:`1.5px solid ${ht2.accentBorder}`,background:"transparent",color:ht2.accent,fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>
              Try Again
            </button>
          </div>
        </div>
      );
    }

    return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title={`Practice · ${hebrewLesson.title}`} subtitle={`Question ${hebrewPracticeIdx+1} of ${questions.length}`} onBack={goBack} theme={ht2}/>
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Progress bar */}
          <div style={{ background:ht2.divider,borderRadius:6,height:6,marginBottom:22,overflow:"hidden" }}>
            <div style={{ width:`${pct}%`,height:"100%",background:ht2.accent,borderRadius:6,transition:"width 0.4s ease" }}/>
          </div>
          {/* Letter reminder */}
          <div style={{ textAlign:"center",marginBottom:20 }}>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:72,color:ht2.accent,direction:"rtl",lineHeight:1 }} lang="he">{content.letter}</div>
            <div style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,fontStyle:"italic",marginTop:4 }}>{content.name} · {content.transliteration}</div>
          </div>
          {/* Question card */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <div style={{ fontFamily:ht2.heading,fontSize:17,color:ht2.dark,lineHeight:1.65,marginBottom:18 }}>{currentQ.question}</div>
            {currentQ.type === "identify" ? (
              <div>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:36,color:ht2.dark,direction:"rtl",textAlign:"center",padding:"18px",background:ht2.hebrewBg,borderRadius:10,marginBottom:14,letterSpacing:4 }}>
                  {currentQ.question.includes(":") ? currentQ.question.split(":").pop().trim() : ""}
                </div>
                {hebrewPracticeAnswer === null
                  ? <button onClick={() => handleAnswer(0)} style={{ width:"100%",padding:"13px",borderRadius:10,border:`1.5px solid ${ht2.accentBorder}`,background:ht2.accentLight,color:ht2.accent,fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>Reveal Answer</button>
                  : <div>
                      <div style={{ padding:"14px",background:"#7ED4AD22",borderRadius:10,border:"1px solid #7ED4AD55",marginBottom:10 }}>
                        <div style={{ fontFamily:ht2.body,fontSize:14,color:"#2E7D5B",lineHeight:1.7 }}>{currentQ.answer}</div>
                      </div>
                      <div style={{ display:"flex",gap:8 }}>
                        <button onClick={() => handleIdentifyGrade(true)} style={{ flex:1,padding:"12px",borderRadius:10,border:"1.5px solid #7ED4AD",background:"#7ED4AD11",color:"#2E7D5B",fontFamily:ht2.ui,fontSize:13,fontWeight:700,cursor:"pointer" }}>I Knew It</button>
                        <button onClick={() => handleIdentifyGrade(false)} style={{ flex:1,padding:"12px",borderRadius:10,border:`1.5px solid ${ht2.divider}`,background:ht2.bg,color:ht2.muted,fontFamily:ht2.ui,fontSize:13,fontWeight:700,cursor:"pointer" }}>I'll Review</button>
                      </div>
                    </div>
                }
              </div>
            ) : (
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {currentQ.options?.map((opt,i) => {
                  const isCorrect = i === currentQ.answer;
                  const isSelected = hebrewPracticeAnswer === i;
                  const showResult = hebrewPracticeAnswer !== null;
                  let bg = ht2.bg, border = ht2.divider, color = ht2.text;
                  if (showResult && isCorrect) { bg="#7ED4AD22"; border="#7ED4AD"; color="#2E7D5B"; }
                  else if (showResult && isSelected && !isCorrect) { bg="#E8625C11"; border="#E8625C"; color="#E8625C"; }
                  return (
                    <button key={i} onClick={() => handleAnswer(i)}
                      style={{ width:"100%",padding:"13px 16px",borderRadius:10,border:`1.5px solid ${border}`,background:bg,color,fontFamily:ht2.ui,fontSize:14,fontWeight:showResult&&isCorrect?700:500,cursor:hebrewPracticeAnswer===null?"pointer":"default",textAlign:"left",transition:"all 0.2s",display:"flex",justifyContent:"space-between",alignItems:"center",animation:showResult&&isCorrect?"correctPulse 0.6s ease":showResult&&isSelected&&!isCorrect?"shakeWrong 0.5s ease":"none" }}>
                      <span><span style={{ fontWeight:700,marginRight:10 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                      {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
                      {showResult && isSelected && !isCorrect && <span>✗</span>}
                    </button>
                  );
                })}
              </div>
            )}
          </Card>
          {/* Next button (not for identify — self-grade buttons handle it) */}
          {hebrewPracticeAnswer !== null && currentQ.type !== "identify" && (
            <button onClick={handleNext} style={{ width:"100%",padding:"15px",borderRadius:12,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",boxShadow:"0 4px 15px rgba(46,74,51,0.2)" }}>
              {isLast ? "Finish & See Score →" : "Next Question →"}
            </button>
          )}
        </div>
      </div>
    );
  };

  const HebrewGrammarHome = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    const [grammarLoading, setGrammarLoading] = useState(null);
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg, paddingBottom:80 }}>
        <Header title="Hebrew Grammar" subtitle="How the language works" onBack={goBack} theme={ht2} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`20px ${bp.pad}px 40px` }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:20, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:42, color:ht2.headerText, direction:"rtl", marginBottom:10 }}>בְּרֵאשִׁית</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>Understanding how Hebrew is built</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>{GRAMMAR_LESSONS.length} Lessons</div>
            </div>
          </div>
          {/* Beginner warning */}
          <div style={{ background:"#D4A85318", border:`1px solid #D4A85355`, borderRadius:12, padding:"14px 16px", marginBottom:18, display:"flex", gap:12, alignItems:"flex-start" }}>
            <div style={{ fontSize:22, flexShrink:0 }}>📖</div>
            <div>
              <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:ht2.accent, marginBottom:4 }}>Recommended Background</div>
              <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.7 }}>These lessons are most rewarding after completing the first 5 alphabet lessons (Aleph through He). You'll recognise the letters and sounds as we work through grammar patterns.</div>
            </div>
          </div>
          {/* Lesson list */}
          <Label icon="📝" t={ht2} color={ht2.muted}>Grammar Lessons — {GRAMMAR_LESSONS.length} Lessons</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {GRAMMAR_LESSONS.map((lesson, idx) => {
              const isDone = hebrewProgress[grammarLessonIds[lesson.number]]?.completed;
              return (
                <button key={lesson.id} disabled={grammarLoading===lesson.id} onClick={async () => {
                  setGrammarLoading(lesson.id);
                  try {
                    const { data } = await supabase.from("hebrew_lessons").select("*").eq("lesson_number", lesson.number).single();
                    if (data) { setGrammarLesson(data); nav("hebrew-grammar-lesson"); }
                  } catch (err) { console.error("Grammar fetch:", err); }
                  setGrammarLoading(null);
                }}
                  style={{ background:ht2.card, border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`4px solid ${lesson.color}`, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", transition:"all 0.15s", opacity:grammarLoading===lesson.id?0.6:1 }}>
                  <div style={{ width:52, height:52, borderRadius:12, background:`${lesson.color}18`, border:`1px solid ${lesson.color}44`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:22, color:lesson.color, flexShrink:0, direction:"rtl" }}>{lesson.icon}</div>
                  <div style={{ flex:1 }}>
                    <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:2 }}>
                      <span style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.dark }}>{lesson.title}</span>
                      {isDone && <span style={{ fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓</span>}
                    </div>
                    <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.muted, fontStyle:"italic" }}>{lesson.subtitle}</div>
                    <div style={{ marginTop:5, display:"inline-block", background:`${lesson.color}18`, borderRadius:4, padding:"2px 8px", fontFamily:ht2.ui, fontSize:9, fontWeight:700, color:lesson.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>{lesson.difficulty}</div>
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, marginBottom:4 }}>Lesson {idx+1}</div>
                    <div style={{ color:ht2.light }}><ChevIcon /></div>
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  const HebrewGrammarLesson = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    if (!grammarLesson) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="Grammar" onBack={goBack} theme={ht2}/>
        <Spinner t={ht2}/>
      </div>
    );
    const content = grammarLesson.content || {};
    const verseConns = Array.isArray(grammarLesson.verse_connections) ? grammarLesson.verse_connections : [];
    const isDone = hebrewProgress[grammarLesson.id]?.completed;
    const tables = content.tables || [];
    const patterns = content.patterns || [];
    const examples = content.examples || [];

    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={grammarLesson.title} subtitle={grammarLesson.subtitle} onBack={goBack} theme={ht2}
          right={isDone && <span style={{ fontFamily:ht2.ui, fontSize:11, color:"#7ED4AD", fontWeight:700, background:"#7ED4AD22", padding:"4px 10px", borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:72, color:ht2.headerText, direction:"rtl", lineHeight:1.1, marginBottom:12, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }} lang="he">{content.symbol}</div>
              <div style={{ fontFamily:ht2.heading, fontSize:24, color:ht2.accent, marginBottom:4 }}>{grammarLesson.title}</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic" }}>{grammarLesson.subtitle}</div>
            </div>
          </div>

          {/* Overview */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <Label icon="📋" t={ht2}>Overview</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14.5, color:ht2.text, lineHeight:1.8 }}>{content.overview}</div>
          </Card>

          {/* Grammar Tables */}
          {tables.map((table, ti) => (
            <div key={ti} style={{ marginBottom:16 }}>
              <Label icon="📊" t={ht2} color={ht2.muted}>{table.title}</Label>
              <div style={{ background:ht2.card, borderRadius:14, border:`1px solid ${ht2.divider}`, overflow:"hidden" }}>
                <div style={{ display:"flex", background:ht2.headerGradient, padding:"10px 14px" }}>
                  {table.headers.map((h, hi) => (
                    <div key={hi} style={{ flex:1, fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.accent, textTransform:"uppercase", letterSpacing:"0.08em", textAlign:"center" }}>{h}</div>
                  ))}
                </div>
                {table.rows.map((row, ri) => (
                  <div key={ri} style={{ display:"flex", padding:"12px 14px", borderTop:`1px solid ${ht2.divider}`, background:ri%2===0?ht2.card:ht2.accentLight }}>
                    {row.map((cell, ci) => (
                      <div key={ci} style={{ flex:1, textAlign:"center" }}>
                        {ci === 0 ? (
                          <span style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl" }} lang="he">{cell}</span>
                        ) : (
                          <span style={{ fontFamily:ci===1?ht2.body:ht2.ui, fontSize:13, color:ht2.text, fontStyle:ci===1?"italic":"normal" }}>{cell}</span>
                        )}
                      </div>
                    ))}
                  </div>
                ))}
              </div>
            </div>
          ))}

          {/* Patterns */}
          {patterns.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="🔁" t={ht2} color={ht2.muted}>Patterns to Remember</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {patterns.map((p, pi) => (
                  <div key={pi} style={{ background:ht2.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${ht2.divider}`, borderLeft:`3px solid ${ht2.accent}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:24, color:ht2.accent, direction:"rtl", marginBottom:6 }} lang="he">{p.hebrew}</div>
                    <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:ht2.dark, marginBottom:4 }}>{p.rule}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", lineHeight:1.65 }}>{p.explanation}</div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Real verse examples */}
          {examples.length > 0 && (
            <Card accent t={ht2} style={{ marginBottom:16 }}>
              <Label icon="📖" t={ht2}>Spot It in Scripture</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:12 }}>
                {examples.map((ex, ei) => (
                  <div key={ei} style={{ padding:"12px 14px", background:darkMode?"rgba(255,255,255,0.06)":"rgba(255,255,255,0.6)", borderRadius:10, border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl", marginBottom:4 }} lang="he">{ex.hebrew}</div>
                    <div style={{ fontFamily:ht2.heading, fontSize:12, fontWeight:700, color:ht2.accent, marginBottom:4 }}>{ex.ref}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.65 }}>{ex.explanation}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Devotional */}
          {content.devotional && (
            <Card t={ht2} style={{ marginBottom:16, borderLeft:`3px solid ${ht2.accent}` }}>
              <Label icon="✨" t={ht2}>Insight</Label>
              <div style={{ fontFamily:ht2.body, fontSize:14.5, color:ht2.text, lineHeight:1.8, fontStyle:"italic" }}>{content.devotional}</div>
            </Card>
          )}

          {/* Verse connections */}
          {verseConns.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={ht2} color={ht2.muted}>In the Bible</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {verseConns.map((vc, i) => (
                  <div key={i} style={{ padding:"12px 14px", background:ht2.accentLight, borderRadius:10, border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:ht2.heading, fontSize:13, fontWeight:700, color:ht2.accent, marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13.5, color:ht2.text, lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Practice questions */}
          {content.practice?.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="✍️" t={ht2} color={ht2.muted}>Quick Check</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {content.practice.map((q, qi) => (
                  <div key={qi} style={{ padding:"12px 14px", background:ht2.bg, borderRadius:10, border:`1px solid ${ht2.divider}` }}>
                    <div style={{ fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.dark, marginBottom:6 }}>{q.question}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", padding:"8px 10px", background:ht2.accentLight, borderRadius:8 }}>→ {q.answer}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Complete button */}
          {user && !isDone && (
            <button onClick={() => { markHebrewComplete(grammarLesson.id, 0); awardHebrewXP(30); updateHebrewStreak(); }}
              style={{ width:"100%", padding:"14px", borderRadius:12, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer", marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center", padding:"13px", borderRadius:12, background:"#7ED4AD22", border:"1px solid #7ED4AD44", marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui, fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓ Lesson Complete</span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center", padding:"12px", borderRadius:10, background:ht2.accentLight, border:`1px solid ${ht2.accentBorder}`, marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui, fontSize:12, color:ht2.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}

          <button onClick={() => nav("hebrew-grammar-home")}
            style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${ht2.accentBorder}`, background:"transparent", color:ht2.accent, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
            ← Back to Grammar Lessons
          </button>
        </div>
      </div>
    );
  };

  const HebrewReadingHome = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;
    const VERSES = [
      {
        id: "gen1v1",
        ref: "Genesis 1:1",
        hebrew: "בְּרֵאשִׁית בָּרָא אֱלֹהִים אֵת הַשָּׁמַיִם וְאֵת הָאָרֶץ",
        kjv: "In the beginning God created the heaven and the earth.",
        words: 7,
        difficulty: "Beginner",
        tag: "Creation",
        color: "#2E4A33",
        available: true,
      },
      {
        id: "gen1v2",
        ref: "Genesis 1:2",
        hebrew: "וְהָאָרֶץ הָיְתָה תֹהוּ וָבֹהוּ",
        kjv: "And the earth was without form, and void...",
        words: 9,
        difficulty: "Beginner",
        tag: "Creation",
        color: "#1B7A6E",
        available: true,
      },
      {
        id: "psalm23v1",
        ref: "Psalm 23:1",
        hebrew: "יְהוָה רֹעִי לֹא אֶחְסָר",
        kjv: "The LORD is my shepherd; I shall not want.",
        words: 4,
        difficulty: "Intermediate",
        tag: "Psalms",
        color: "#8B5CF6",
        available: true,
      },
      {
        id: "deut6v4",
        ref: "Deuteronomy 6:4",
        hebrew: "שְׁמַע יִשְׂרָאֵל יְהוָה אֱלֹהֵינוּ יְהוָה אֶחָד",
        kjv: "Hear, O Israel: The LORD our God is one LORD.",
        words: 6,
        difficulty: "Intermediate",
        tag: "The Shema",
        color: "#D4A853",
        available: true,
      },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg, paddingBottom:80 }}>
        <Header title="Reading" subtitle="Read Scripture in Hebrew" onBack={goBack} theme={ht2} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`20px ${bp.pad}px 40px` }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"24px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:32, color:ht2.headerText, direction:"rtl", marginBottom:10, textShadow:"0 2px 12px rgba(0,0,0,0.3)" }}>בְּרֵאשִׁית</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>Read God's Word word by word</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>Interactive Hebrew Reading</div>
            </div>
          </div>
          {/* Intro */}
          <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.muted, lineHeight:1.7, marginBottom:18, fontStyle:"italic" }}>
            Each lesson walks you through a verse word by word — with every letter explained, grammar notes, and devotional insights.
          </div>
          {/* Verse list */}
          <Label icon="📖" t={ht2} color={ht2.muted}>Choose a Verse</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
            {VERSES.map(v => (
              <button key={v.id}
                onClick={() => { if (v.available) { setReadingVerse(v.id); setReadingStep(0); setShowLetters(false); nav("hebrew-reading"); } }}
                style={{ background:ht2.card, border:`1px solid ${v.available ? ht2.accentBorder : ht2.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:v.available?"pointer":"default", opacity:v.available?1:0.6, borderLeft:`4px solid ${v.color}`, transition:"all 0.15s" }}>
                <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start", marginBottom:6 }}>
                  <div>
                    <span style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.dark }}>{v.ref}</span>
                    <span style={{ fontFamily:ht2.ui, fontSize:10, color:v.color, background:`${v.color}18`, borderRadius:4, padding:"2px 7px", marginLeft:8, textTransform:"uppercase", letterSpacing:"0.05em" }}>{v.tag}</span>
                  </div>
                  {!v.available && <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light }}>🔒 Soon</span>}
                </div>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:v.color, direction:"rtl", marginBottom:6, lineHeight:1.6 }}>{v.hebrew}</div>
                <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.muted, fontStyle:"italic", marginBottom:8 }}>{v.kjv}</div>
                <div style={{ display:"flex", gap:8 }}>
                  <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{v.words} words</span>
                  <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{v.difficulty}</span>
                </div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  const HebrewReading = () => {
    const ht2 = darkMode ? DARK_THEMES.garden : THEMES.garden;


    const rv = readingVerse || "gen1v1";
    const WORDS = rv === "gen1v2" ? WORDS_GEN1V2 : rv === "psalm23v1" ? WORDS_PSALM23V1 : rv === "deut6v4" ? WORDS_DEUT6V4 : WORDS_GEN1V1;
    const totalWords = WORDS.length;
    const currentWord = readingStep >= 1 && readingStep <= totalWords ? WORDS[readingStep - 1] : null;

    // Intro screen
    if (readingStep === 0) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={`Read ${VERSE.ref}`} subtitle="Word by Word · Letter by Letter" onBack={goBack} theme={ht2} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`20px ${bp.pad}px 40px` }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:28, color:ht2.headerText, direction:"rtl", lineHeight:1.8, marginBottom:16, textShadow:"0 2px 12px rgba(0,0,0,0.3)", letterSpacing:1 }}>
                {VERSE.hebrew}
              </div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>{VERSE.kjv}</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>{VERSE.ref}</div>
            </div>
          </div>
          {/* What you will learn */}
          <Card t={ht2} style={{ marginBottom:16 }}>
            <Label icon="🎓" t={ht2}>What You Will Learn</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8 }}>
              <strong>{VERSE.ref}</strong> contains <strong>{totalWords} Hebrew words</strong>. In this lesson you will read each word one by one — seeing every letter, its name, and its meaning. You will discover the profound depth God packed into every word of Scripture.
            </div>
          </Card>
          {/* Word overview */}
          <Label icon="📖" t={ht2} color={ht2.muted}>The {totalWords} Words</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:6, marginBottom:22 }}>
            {WORDS.map((w,i) => (
              <div key={i} style={{ background:ht2.card, borderRadius:10, padding:"12px 14px", border:`1px solid ${ht2.divider}`, display:"flex", alignItems:"center", gap:12, borderLeft:`3px solid ${w.color}` }}>
                <span style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.light, minWidth:16 }}>{i+1}</span>
                <span style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:w.color, direction:"rtl", minWidth:80 }}>{w.hebrew}</span>
                <span style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", flex:1 }}>{w.meaning}</span>
              </div>
            ))}
          </div>
          <button onClick={() => { setReadingStep(1); setShowLetters(false); }}
            style={{ width:"100%", padding:"16px", borderRadius:14, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:16, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(46,74,51,0.25)" }}>
            Begin Reading →
          </button>
        </div>
      </div>
    );

    // Full verse celebration screen
    if (readingStep === totalWords + 1) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="You Read It!" subtitle={`${VERSE.ref} Complete`} onBack={() => setReadingStep(0)} theme={ht2} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`24px ${bp.pad}px 40px`, textAlign:"center" }}>
          <div style={{ fontSize:64, marginBottom:16 }}>🎉</div>
          <div style={{ fontFamily:ht2.heading, fontSize:28, color:ht2.dark, marginBottom:8 }}>Shalom!</div>
          <div style={{ fontFamily:ht2.body, fontSize:15, color:ht2.muted, fontStyle:"italic", marginBottom:24, lineHeight:1.7 }}>
            You have just read the first verse of God's Word in its original Hebrew.
          </div>
          {/* Full verse display */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:22, position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:ht2.headerText, direction:"rtl", lineHeight:2, marginBottom:16, textShadow:"0 2px 12px rgba(0,0,0,0.3)", letterSpacing:1 }}>
                {VERSE.hebrew}
              </div>
              {/* Word by word */}
              <div style={{ display:"flex", flexWrap:"wrap", justifyContent:"center", gap:8, direction:"rtl", marginBottom:16 }}>
                {WORDS.map((w,i) => (
                  <div key={i} style={{ textAlign:"center", background:"rgba(255,255,255,0.1)", borderRadius:8, padding:"6px 10px" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:ht2.headerText }}>{w.hebrew}</div>
                    <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.accent, marginTop:2 }}>{w.meaning}</div>
                  </div>
                ))}
              </div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic" }}>{VERSE.kjv}</div>
            </div>
          </div>
          <Card t={ht2} style={{ marginBottom:16, textAlign:"left" }}>
            <Label icon="✨" t={ht2}>Reflection</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8 }}>
              {readingVerse === "gen1v1" && <>Genesis 1:1 contains exactly <strong>7 words</strong> and <strong>28 letters</strong> (7×4). The middle word is <strong>אֵת</strong> — Aleph and Tav, the first and last letters of the alphabet. Jesus declared: "I am the Alpha and Omega" — the Aleph and Tav. He was hidden in the first verse of Genesis, waiting to be found.</>}
              {readingVerse === "gen1v2" && <>Genesis 1:2 introduces the <strong>Ruach Elohim</strong> — the Spirit of God — hovering over the waters. The word <strong>מְרַחֶפֶת</strong> (merachefet) appears only twice in all of Scripture: here, and in Deuteronomy 32:11 of an eagle hovering over its nest. The Spirit of God is not passive — He hovers with intention, preparing to bring forth life from chaos.</>}
              {readingVerse === "psalm23v1" && <>Psalm 23:1 is only <strong>4 words</strong> in Hebrew yet contains the entire gospel of God's provision. David, a shepherd himself, chose the most intimate image he knew to describe God. The possessive <strong>רֹעִי</strong> (my shepherd) — not a shepherd, not the shepherd — makes this the most personal declaration in all the Psalms.</>}
              {readingVerse === "deut6v4" && <>The Shema contains <strong>6 words</strong> and has been recited by Jewish people twice daily for over 3,000 years. The final letter of <strong>שְׁמַע</strong> (Ayin — ע) and the final letter of <strong>אֶחָד</strong> (Dalet — ד) are written larger in Torah scrolls. Together they spell <strong>עֵד</strong> (ed) — witness. Every time the Shema is recited, Israel bears witness to the oneness of God.</>}
            </div>
          </Card>
          <button onClick={() => setReadingStep(0)}
            style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:10 }}>
            Read Again
          </button>
          <button onClick={() => nav("hebrew-home")}
            style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${ht2.accentBorder}`, background:"transparent", color:ht2.accent, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
            Back to Lessons
          </button>
        </div>
      </div>
    );

    // Word study screen
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={`Word ${readingStep} of ${totalWords}`} subtitle={`${currentWord.transliteration} — ${currentWord.meaning}`} onBack={() => readingStep === 1 ? setReadingStep(0) : setReadingStep(s => s-1)} theme={ht2} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Progress */}
          <div style={{ background:ht2.divider, borderRadius:6, height:6, marginBottom:20, overflow:"hidden" }}>
            <div style={{ width:`${((readingStep-1)/totalWords)*100}%`, height:"100%", background:ht2.accent, borderRadius:6, transition:"width 0.4s ease" }}/>
          </div>
          {/* Full verse context */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"16px 18px", marginBottom:16, position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.15),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1, display:"flex", flexWrap:"wrap", justifyContent:"center", gap:6, direction:"rtl" }}>
              {WORDS.map((w,i) => (
                <span key={i} style={{ fontFamily:"'Times New Roman',serif", fontSize:i===readingStep-1?22:15, color:i===readingStep-1?ht2.accent:`${ht2.headerText}66`, fontWeight:i===readingStep-1?700:400, transition:"all 0.3s", padding:"2px 4px", borderRadius:4, background:i===readingStep-1?"rgba(192,108,62,0.2)":"transparent" }}>
                  {w.hebrew}
                </span>
              ))}
            </div>
          </div>
          {/* Big word */}
          <Card t={ht2} style={{ marginBottom:14, textAlign:"center" }}>
            <div style={{ display:"flex", alignItems:"center", justifyContent:"center", gap:10 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:ht2.accent, direction:"rtl", lineHeight:1.2, marginBottom:10, textShadow:`0 2px 12px ${ht2.accentLight}` }}>
                {currentWord.hebrew}
              </div>
              <PronunciationButton lang="hebrew" wordId={`word-${(currentWord.hebrew || "").replace(/[\u0591-\u05C7]/g, "").toLowerCase()}`} size={26} color={ht2.accent} style={{ marginBottom:10, background:`${ht2.accent}18`, borderRadius:10, padding:6 }} />
            </div>
            <div style={{ fontFamily:ht2.heading, fontSize:22, color:ht2.dark, marginBottom:4 }}>{currentWord.transliteration}</div>
            <div style={{ fontFamily:ht2.body, fontSize:16, color:ht2.muted, fontStyle:"italic", marginBottom:10 }}>{currentWord.meaning}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:13, color:ht2.text, lineHeight:1.65, textAlign:"left", padding:"10px 12px", background:ht2.accentLight, borderRadius:8 }}>{currentWord.grammar}</div>
          </Card>
          {/* Letter breakdown */}
          <div style={{ marginBottom:14 }}>
            <button aria-expanded={showLetters} onClick={() => setShowLetters(s => !s)}
              style={{ width:"100%", padding:"12px 16px", borderRadius:10, border:`1px solid ${ht2.accentBorder}`, background:showLetters?ht2.accentLight:ht2.card, fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.accent, cursor:"pointer", display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom: showLetters?8:0 }}>
              <span>🔠 Letter by Letter Breakdown ({currentWord.letters.length} letters)</span>
              <span>{showLetters?"▲":"▼"}</span>
            </button>
            {showLetters && (
              <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
                {currentWord.letters.map((lt,i) => (
                  <div key={i} style={{ background:ht2.card, borderRadius:10, padding:"12px 14px", border:`1px solid ${ht2.divider}`, display:"flex", alignItems:"center", gap:12 }}>
                    <div style={{ width:44, height:44, borderRadius:10, background:ht2.accentLight, border:`1px solid ${ht2.accentBorder}`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:26, color:ht2.accent, flexShrink:0, direction:"rtl" }} lang="he">{lt.l}</div>
                    <div style={{ flex:1 }}>
                      <div style={{ fontFamily:ht2.heading, fontSize:13, fontWeight:700, color:ht2.dark }}>{lt.name}</div>
                      <div style={{ fontFamily:ht2.body, fontSize:12, color:ht2.muted, fontStyle:"italic", marginTop:2 }}>{lt.note}</div>
                    </div>
                    <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.accent, textAlign:"right", flexShrink:0, background:ht2.accentLight, padding:"3px 8px", borderRadius:4 }}>Lesson {lt.lesson}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
          {/* Devotional */}
          <Card accent t={ht2} style={{ marginBottom:20 }}>
            <Label icon="✨" t={ht2}>Insight</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8, fontStyle:"italic" }}>{currentWord.devotional}</div>
          </Card>
          {/* Navigation */}
          <button onClick={() => { setReadingStep(s => s+1); setShowLetters(false); }}
            style={{ width:"100%", padding:"16px", borderRadius:14, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:15, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(46,74,51,0.2)" }}>
            {readingStep === totalWords ? "Complete — See Full Verse 🎉" : `Next Word: ${WORDS[readingStep].transliteration} →`}
          </button>
        </div>
      </div>
    );
  };

  if (view === "hebrew-home") return <HebrewHome />;
  if (view === "hebrew-lesson") return <HebrewLesson />;
  if (view === "hebrew-practice") return <HebrewPractice />;
  if (view === "hebrew-grammar-home") return <HebrewGrammarHome />;
  if (view === "hebrew-grammar-lesson") return <HebrewGrammarLesson />;
  if (view === "hebrew-reading-home") return <HebrewReadingHome />;
  if (view === "hebrew-reading") return <HebrewReading />;
  if (view === "hebrew-flashcards") return <HebrewFlashcards />;
  return null;
}
