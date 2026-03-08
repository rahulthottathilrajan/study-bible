"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";

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
          {/* Hero */}
          <div style={{ background:ht2.headerGradient,borderRadius:16,padding:"28px 20px",marginBottom:20,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              {hebrewCategory === "vocabulary" ? (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:42,color:ht2.headerText,direction:"rtl",lineHeight:1.2,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>אֱלֹהִים</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}99`,fontStyle:"italic",marginBottom:4 }}>Elohim — The Creator God</div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>Names of God</div>
              </>) : (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:56,color:ht2.headerText,direction:"rtl",lineHeight:1,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>אָלֶף</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}99`,fontStyle:"italic",marginBottom:4 }}>Aleph — The first letter</div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>Begin Your Journey</div>
              </>)}
            </div>
          </div>
          {/* Progress */}
          {user && totalLessons > 0 && (
            <Card t={ht2} style={{ marginBottom:18 }}>
              <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:8 }}>
                <Label icon="📊" t={ht2}>My Progress</Label>
                <span style={{ fontFamily:ht2.ui,fontSize:13,fontWeight:700,color:ht2.accent }}>{completedCount}/{totalLessons}</span>
              </div>
              <div style={{ background:ht2.divider,borderRadius:6,height:8,overflow:"hidden" }}>
                <div style={{ width:`${totalLessons>0?(completedCount/totalLessons)*100:0}%`,height:"100%",background:ht2.accent,borderRadius:6,transition:"width 0.5s ease" }}/>
              </div>
              <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.muted,marginTop:6 }}>{completedCount===0?"Start your first lesson below!":`${completedCount} lesson${completedCount>1?"s":""} completed · Keep going!`}</div>
            </Card>
          )}
          
          {/* Category Tabs */}
          <div style={{ display:"flex",gap:8,marginBottom:18,flexWrap:"wrap" }}>
            {categories.map(cat => (
              <button key={cat.id} onClick={() => { if (cat.action) { setReadingStep(0); setShowLetters(false); setGrammarLesson(null); cat.action(); } else if (!cat.soon) setHebrewCategory(cat.id); }}
                style={{ flexShrink:0,padding:"8px 16px",borderRadius:20,border:hebrewCategory===cat.id?"none":`1px solid ${ht2.divider}`,background:hebrewCategory===cat.id?ht2.tabActive:ht2.card,color:hebrewCategory===cat.id?ht2.headerText:cat.soon?ht2.light:ht2.text,fontFamily:ht2.ui,fontSize:12,fontWeight:700,cursor:cat.soon?"default":"pointer",opacity:cat.soon?0.55:1,whiteSpace:"nowrap" }}>
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
                      <button onClick={() => setVocabGroup(isOpen ? null : group.id)}
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
              {hebrewLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = hebrewProgress[lesson.id]?.completed;
                return (
                  <button key={lesson.id} onClick={() => { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}
                    style={{ background:ht2.card,border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":ht2.accent}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)",transition:"all 0.15s" }}>
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
                    return (
                      <button key={al.num}
                        onClick={() => { if (hasLesson && lesson) { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}}
                        style={{ background:isDone?"#7ED4AD22":hasLesson?ht2.card:ht2.bg,border:`1px solid ${isDone?"#7ED4AD55":hasLesson?ht2.accentBorder:ht2.divider}`,borderRadius:12,padding:"12px 6px",textAlign:"center",cursor:hasLesson?"pointer":"default",opacity:hasLesson?1:0.45,transition:"all 0.15s",position:"relative" }}>
                        {isDone && <div style={{ position:"absolute",top:4,right:6,fontSize:8,color:"#2E7D5B",fontWeight:800 }}>✓</div>}
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:11,color:ht2.light,marginBottom:1 }}>{ANCIENT[al.letter]}</div>
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:28,color:hasLesson?ht2.accent:ht2.light,direction:"rtl",lineHeight:1,marginBottom:4 }}>{al.letter}</div>
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
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:52,color:ht2.headerText,direction:"rtl",lineHeight:1.2,marginBottom:14,textShadow:"0 4px 24px rgba(0,0,0,0.35)",letterSpacing:2 }}>{content.word}</div>
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
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:108,color:ht2.headerText,direction:"rtl",lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{modernLetter}</div>
                      <div style={{ fontFamily:ht2.ui,fontSize:9,color:`${ht2.headerText}77`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Modern</div>
                    </div>
                  </div>
                  <div style={{ fontFamily:ht2.heading,fontSize:26,color:ht2.accent,marginBottom:4 }}>{content.name || hebrewAlphabet?.letter_name}</div>
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
                      <span style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:ht2.accent,direction:"rtl",fontWeight:700 }}>{word.hebrew_word}</span>
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
            <button onClick={() => markHebrewComplete(hebrewLesson.id, 0)}
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
      if (currentQ.type === "identify") setHebrewPracticeScore(s => s+1);
    };
    const handleNext = () => {
      if (isLast) {
        const finalScore = Math.round((hebrewPracticeScore/questions.length)*100);
        markHebrewComplete(hebrewLesson.id, finalScore);
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
              <div style={{ fontFamily:ht2.heading,fontSize:52,fontWeight:800,color:finalScore>=70?"#2E7D5B":ht2.accent }}>{finalScore}%</div>
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
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:72,color:ht2.accent,direction:"rtl",lineHeight:1 }}>{content.letter}</div>
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
                  : <div style={{ padding:"14px",background:"#7ED4AD22",borderRadius:10,border:"1px solid #7ED4AD55" }}>
                      <div style={{ fontFamily:ht2.body,fontSize:14,color:"#2E7D5B",lineHeight:1.7 }}>{currentQ.answer}</div>
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
                      style={{ width:"100%",padding:"13px 16px",borderRadius:10,border:`1.5px solid ${border}`,background:bg,color,fontFamily:ht2.ui,fontSize:14,fontWeight:showResult&&isCorrect?700:500,cursor:hebrewPracticeAnswer===null?"pointer":"default",textAlign:"left",transition:"all 0.2s",display:"flex",justifyContent:"space-between",alignItems:"center" }}>
                      <span><span style={{ fontWeight:700,marginRight:10 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                      {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
                      {showResult && isSelected && !isCorrect && <span>✗</span>}
                    </button>
                  );
                })}
              </div>
            )}
          </Card>
          {/* Next button */}
          {hebrewPracticeAnswer !== null && (
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
    const GRAMMAR_LESSONS = [
      { id:1, number:201, icon:"הַ", title:"The Definite Article", subtitle:"How Hebrew says 'the'", difficulty:"Beginner", color:"#C06C3E" },
      { id:2, number:202, icon:"וְ", title:"The Vav Conjunction", subtitle:"And, but, then — the connecting letter", difficulty:"Beginner", color:"#2E4A33" },
      { id:3, number:203, icon:"בְּ", title:"Prepositions", subtitle:"In, like, to, from — built into words", difficulty:"Beginner", color:"#D4A853" },
      { id:4, number:204, icon:"ז׳", title:"Noun Gender", subtitle:"Every noun is masculine or feminine", difficulty:"Beginner", color:"#1B7A6E" },
      { id:5, number:205, icon:"ים", title:"Plural Endings", subtitle:"How Hebrew makes nouns plural", difficulty:"Beginner", color:"#8B5CF6" },
      { id:6, number:206, icon:"שׁ", title:"The Three-Letter Root", subtitle:"The secret structure of all Hebrew words", difficulty:"Intermediate", color:"#1B7A6E" },
      { id:7, number:207, icon:"אֲנִי", title:"Personal Pronouns", subtitle:"I, you, he, she, we — in Hebrew", difficulty:"Intermediate", color:"#C06C3E" },
      { id:8, number:208, icon:"בֵּן", title:"The Construct State", subtitle:"Hebrew possession — without the word 'of'", difficulty:"Intermediate", color:"#8B5CF6" },
      { id:9, number:209, icon:"הוּא", title:"Verbless Clauses", subtitle:"Hebrew sentences without a verb", difficulty:"Intermediate", color:"#D4A853" },
      { id:10, number:210, icon:"קטל", title:"Basic Verb Patterns", subtitle:"The Qal stem — Hebrew's foundational verb form", difficulty:"Intermediate", color:"#E8625C" },
      { id:11, number:211, icon:"טוֹב", title:"Adjectives", subtitle:"Good, holy, great — how Hebrew describes nouns", difficulty:"Intermediate", color:"#2E4A33" },
      { id:12, number:212, icon:"שֶׁלִּי", title:"Pronominal Suffixes", subtitle:"My, your, his, her — built into the word", difficulty:"Intermediate", color:"#1B7A6E" },
      { id:13, number:213, icon:"מִי", title:"Interrogatives", subtitle:"Who? What? Where? Why? How? in Hebrew", difficulty:"Intermediate", color:"#D4A853" },
      { id:14, number:214, icon:"נִפְעַל", title:"The Niphal Stem", subtitle:"Passive and reflexive verbs", difficulty:"Advanced", color:"#8B5CF6" },
      { id:15, number:215, icon:"פִּעֵל", title:"The Piel Stem", subtitle:"Intensive and declarative verbs", difficulty:"Advanced", color:"#C06C3E" },
      { id:16, number:216, icon:"מְר", title:"Participles", subtitle:"The hovering verb — active and passive", difficulty:"Advanced", color:"#E8625C" },
      { id:17, number:217, icon:"לִ", title:"The Infinitive", subtitle:"To do, in doing, when doing", difficulty:"Advanced", color:"#1B7A6E" },
      { id:18, number:218, icon:"לֹא", title:"Negation", subtitle:"Lo, Al, Ein — three ways to say no", difficulty:"Intermediate", color:"#2E4A33" },
      { id:19, number:219, icon:"אֵת", title:"The Direct Object Marker", subtitle:"The untranslatable Aleph-Tav", difficulty:"Intermediate", color:"#D4A853" },
      { id:20, number:220, icon:"ָ", title:"The Vowel System", subtitle:"Understanding the nikkud — Hebrew vowel points", difficulty:"Intermediate", color:"#1B7A6E" },
      { id:21, number:221, icon:"VSO", title:"Hebrew Word Order", subtitle:"Why Hebrew puts the verb first", difficulty:"Intermediate", color:"#C06C3E" },
      { id:22, number:222, icon:"הִפ", title:"The Hiphil Stem", subtitle:"Causative verbs — making something happen", difficulty:"Advanced", color:"#8B5CF6" },
      { id:23, number:223, icon:"הִת", title:"The Hithpael Stem", subtitle:"Reflexive verbs — acting on oneself", difficulty:"Advanced", color:"#E8625C" },
      { id:24, number:224, icon:"אֶח", title:"Hebrew Numbers", subtitle:"Cardinal, ordinal, and their quirks", difficulty:"Intermediate", color:"#2E4A33" },
      { id:25, number:225, icon:"אִם", title:"Conditional Sentences", subtitle:"If/then structures in Hebrew", difficulty:"Advanced", color:"#1B7A6E" },
      { id:26, number:226, icon:"עַד", title:"Temporal Clauses", subtitle:"When, until, before, after in Hebrew", difficulty:"Advanced", color:"#D4A853" },
      { id:27, number:227, icon:"שִׁיר", title:"Hebrew Poetry", subtitle:"Parallelism, chiasm, and acrostic structures", difficulty:"Advanced", color:"#C06C3E" },
    ];
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
              <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:"#8B6914", marginBottom:4 }}>Recommended Background</div>
              <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.7 }}>These lessons are most rewarding after completing the first 5 alphabet lessons (Aleph through He). You'll recognise the letters and sounds as we work through grammar patterns.</div>
            </div>
          </div>
          {/* Lesson list */}
          <Label icon="📝" t={ht2} color={ht2.muted}>Grammar Lessons — {GRAMMAR_LESSONS.length} Lessons</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {GRAMMAR_LESSONS.map((lesson, idx) => {
              const isDone = hebrewProgress[grammarLessonIds[lesson.number]]?.completed;
              return (
                <button key={lesson.id} onClick={async () => {
                  const { data } = await supabase.from("hebrew_lessons").select("*").eq("lesson_number", lesson.number).single();
                  if (data) { setGrammarLesson(data); nav("hebrew-grammar-lesson"); }
                }}
                  style={{ background:ht2.card, border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`4px solid ${lesson.color}`, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", transition:"all 0.15s" }}>
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
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:72, color:ht2.headerText, direction:"rtl", lineHeight:1.1, marginBottom:12, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.symbol}</div>
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
                          <span style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl" }}>{cell}</span>
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
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:24, color:ht2.accent, direction:"rtl", marginBottom:6 }}>{p.hebrew}</div>
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
                  <div key={ei} style={{ padding:"12px 14px", background:"rgba(255,255,255,0.6)", borderRadius:10, border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl", marginBottom:4 }}>{ex.hebrew}</div>
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
            <button onClick={() => markHebrewComplete(grammarLesson.id, 100)}
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

    const VERSE_DATA = {
      gen1v1: { ref:"Genesis 1:1", kjv:"In the beginning God created the heaven and the earth.", hebrew:"בְּרֵאשִׁית בָּרָא אֱלֹהִים אֵת הַשָּׁמַיִם וְאֵת הָאָרֶץ" },
      gen1v2: { ref:"Genesis 1:2", kjv:"And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.", hebrew:"וְהָאָרֶץ הָיְתָה תֹהוּ וָבֹהוּ וְחֹשֶׁךְ עַל־פְּנֵי תְהוֹם וְרוּחַ אֱלֹהִים מְרַחֶפֶת עַל־פְּנֵי הַמָּיִם" },
      psalm23v1: { ref:"Psalm 23:1", kjv:"The LORD is my shepherd; I shall not want.", hebrew:"יְהוָה רֹעִי לֹא אֶחְסָר" },
      deut6v4: { ref:"Deuteronomy 6:4", kjv:"Hear, O Israel: The LORD our God is one LORD.", hebrew:"שְׁמַע יִשְׂרָאֵל יְהוָה אֱלֹהֵינוּ יְהוָה אֶחָד" },
    };
    const VERSE = VERSE_DATA[readingVerse] || VERSE_DATA.gen1v1;

    const WORDS_GEN1V1 = [
      {
        hebrew: "בְּרֵאשִׁית",
        transliteration: "Bereshit",
        meaning: "In the beginning",
        grammar: "Bet (בְּ = in) + Reshit (רֵאשִׁית = beginning). The very first word of the Bible.",
        letters: [
          { l:"ב", name:"Bet", lesson:2, note:"The letter of house — the Bible begins in God's house" },
          { l:"ר", name:"Resh", lesson:20, note:"Head, beginning — the first, the highest" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent — takes the vowel sound here" },
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire, to press — the consuming start" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — the smallest letter" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — the end within the beginning" },
        ],
        devotional: "The rabbis asked: why does the Torah begin with Bet and not Aleph? Because Bet means house — God began creation by building a home. And Aleph waited humbly, so God honoured it by beginning the Ten Commandments with Aleph: Anokhi — I am.",
        color: "#C06C3E",
      },
      {
        hebrew: "בָּרָא",
        transliteration: "Bara",
        meaning: "Created",
        grammar: "A verb meaning to create out of nothing. Always used with God as subject — never humans.",
        letters: [
          { l:"ב", name:"Bet", lesson:2, note:"The house — what God is building" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — God acts as the head of creation" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength — the power behind the act" },
        ],
        devotional: "Only God bara. You can make, build, and craft — but you cannot create from nothing. This single verb separates the Creator from all creation. He spoke into absolute void and something real appeared.",
        color: "#2E4A33",
      },
      {
        hebrew: "אֱלֹהִים",
        transliteration: "Elohim",
        meaning: "God",
        grammar: "Plural noun (ending ים) used with singular verbs — the plural of majesty. Appears over 2,600 times.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Silent — God's quiet, powerful presence" },
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — God as teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's own letter breathed into this name" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — God's active power" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — the Spirit hovered over waters in Genesis 1:2" },
        ],
        devotional: "The first name of God in Scripture is not Father, not Saviour, not Lord — it is Elohim, the Creator. Before relationship comes existence. Before love comes life. God introduced Himself first through power, then through covenant.",
        color: "#8B5CF6",
      },
      {
        hebrew: "אֵת",
        transliteration: "Et",
        meaning: "(Direct object marker)",
        grammar: "Et (אֵת) has no English translation — it marks the direct object. It is made of Aleph (first letter) and Tav (last letter).",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter of the alphabet" },
          { l:"ת", name:"Tav", lesson:22, note:"The last letter of the alphabet" },
        ],
        devotional: "The rabbis noted that et (אֵת) contains Aleph and Tav — the first and last letters of the Hebrew alphabet. Jesus declared 'I am the Alpha and Omega' — in Hebrew: I am the Aleph and Tav. This tiny untranslatable word hidden in Genesis 1:1 was a signpost to the Word who was in the beginning.",
        color: "#D4A853",
      },
      {
        hebrew: "הַשָּׁמַיִם",
        transliteration: "HaShamayim",
        meaning: "The heavens",
        grammar: "Ha (הַ = the definite article) + Shamayim (שָּׁמַיִם = heavens, always plural).",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"He as the definite article — 'the'" },
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire — the blazing expanse of heaven" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — heaven and water share deep connection" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God stretched across the sky" },
          { l:"מ", name:"Mem (final)", lesson:13, note:"Final Mem ם — sealed, complete" },
        ],
        devotional: "The heavens are always plural in Hebrew — shamayim, never shameh. This plurality hints at layers: the sky we see, the stars beyond, and the dwelling place of God above all. Every time you look up, you see shamayim.",
        color: "#1B7A6E",
      },
      {
        hebrew: "וְאֵת",
        transliteration: "VeEt",
        meaning: "And (the)",
        grammar: "Vav (וְ = and) + Et (אֵת = direct object marker). The Vav of connection links heaven and earth.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"The nail of connection — joining heaven to earth" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength holding all together" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — marking what follows as direct object" },
        ],
        devotional: "The Vav joins heaven and earth in the very first verse. This tiny letter — the nail — connects the two realms God created. In Jewish mystical thought, the Vav is the channel between heaven and earth, the letter that makes relationship between Creator and creation possible.",
        color: "#C06C3E",
      },
      {
        hebrew: "הָאָרֶץ",
        transliteration: "HaAretz",
        meaning: "The earth",
        grammar: "Ha (הָ = the definite article) + Aretz (אָרֶץ = earth, land, ground).",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"He as the definite article — 'the'" },
          { l:"א", name:"Aleph", lesson:1, note:"Aleph — strength, the foundation" },
          { l:"ר", name:"Resh", lesson:20, note:"Resh — the head, the first matter formed" },
          { l:"צ", name:"Tsade", lesson:18, note:"Tsade — the righteous earth, made for the righteous" },
        ],
        devotional: "The earth is the final word of Genesis 1:1 — the destination of all creation. God began with Himself (Elohim), acted through His Word (bara), and ended with the earth — our home. The whole verse moves from heaven to earth, from infinite to finite, from Creator to creation.",
        color: "#2E4A33",
      },
    ];

    const WORDS_PSALM23V1 = [
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The sacred four-letter name of God — the Tetragrammaton (יהוה). Too holy to pronounce, Jewish readers say 'Adonai' (Lord) in its place. Appears 6,828 times in the OT.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The smallest letter — God's humility and power" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's very breath is in His name" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — connecting God to His people" },
          { l:"ה", name:"He", lesson:5, note:"Breath again — the name itself is breathing" },
        ],
        devotional: "The name YHWH is the first word of Psalm 23. David does not begin with 'God is powerful' or 'God is great' — he begins with the personal covenant name. The God of Psalm 23 is not a distant Creator but the God who made a covenant with Israel, who knows your name, who is present. Before any promise is made, the name itself is the foundation.",
        color: "#D4A853",
      },
      {
        hebrew: "רֹעִי",
        transliteration: "Ro'i",
        meaning: "My shepherd",
        grammar: "Ro'eh (רֹעֶה = shepherd) + the suffix י (i = my). The possessive 'my' is built directly into the word. This is intimate, personal language.",
        letters: [
          { l:"ר", name:"Resh", lesson:20, note:"Head — the shepherd as the head, the leader" },
          { l:"ע", name:"Ayin", lesson:16, note:"Eye — the shepherd who watches, who sees" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — and the possessive 'my'" },
        ],
        devotional: "Ro'i — my shepherd. Not a shepherd, not the shepherd, but my shepherd. David was himself a shepherd before he was a king. He knew what a shepherd does: leads to green pastures, guards from predators, searches for the lost one. When David calls YHWH his shepherd, he is drawing on everything he knew from the fields of Bethlehem.",
        color: "#2E4A33",
      },
      {
        hebrew: "לֹא",
        transliteration: "Lo",
        meaning: "Not / Shall not",
        grammar: "The simple Hebrew negative particle. Absolute and unconditional — 'I shall not' with certainty, not 'I probably won't'.",
        letters: [
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — the authority behind the promise" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength — the firm, unshakeable no" },
        ],
        devotional: "Lo — not. Two letters, one of the most powerful words in the Psalm. Because YHWH is my shepherd — therefore lo. The promise flows from the relationship. David doesn't say 'I will try not to want' or 'I hope not to want.' The lo is absolute because the Shepherd is absolute. The sufficiency is as certain as the Shepherd's identity.",
        color: "#1B7A6E",
      },
      {
        hebrew: "אֶחְסָר",
        transliteration: "Echsar",
        meaning: "Want / Lack",
        grammar: "From the root חָסַר (chasar — to lack, to be without). First person imperfect: 'I shall lack.' The imperfect tense points to ongoing, continuous sufficiency.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter — I, the speaker, the sheep" },
          { l:"ח", name:"Chet", lesson:8, note:"Life fence — what is kept inside, protected" },
          { l:"ס", name:"Samekh", lesson:15, note:"A support, a prop — being held up, not lacking" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the head of all needs is met" },
        ],
        devotional: "Echsar — I shall lack. This is the entire gospel of Psalm 23 in one word, negated by lo. YHWH is my shepherd, therefore I shall not lack. Not 'I shall have everything I want' but 'I shall lack nothing I truly need.' The sheep does not manage its own provision — it simply stays close to the shepherd. That is the whole secret.",
        color: "#8B5CF6",
      },
    ];

    const WORDS_GEN1V2 = [
      {
        hebrew: "וְהָאָרֶץ",
        transliteration: "VeHaAretz",
        meaning: "And the earth",
        grammar: "Vav (וְ = and) + Ha (הָ = the) + Aretz (אָרֶץ = earth). The Vav connects this verse directly to verse 1.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"The nail — connecting verse 2 to verse 1" },
          { l:"ה", name:"He", lesson:5, note:"The definite article 'the'" },
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the foundation of the earth" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the chief substance" },
          { l:"צ", name:"Tsade", lesson:18, note:"Righteousness — even in chaos, God's purpose holds" },
        ],
        devotional: "The very first word of verse 2 begins with Vav — 'and'. This is not a new story. It is a continuation. The earth God created in verse 1 is now described in its initial state: unformed, waiting. God does not abandon what He makes in its raw state.",
        color: "#2E4A33",
      },
      {
        hebrew: "הָיְתָה",
        transliteration: "Hayetah",
        meaning: "Was",
        grammar: "A feminine past tense verb from the root הָיָה (hayah — to be, to become). Matches the feminine noun Aretz.",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"Breath — existence itself" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — He determined this state" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — this was a sealed, appointed condition" },
          { l:"ה", name:"He", lesson:5, note:"Feminine ending — agreeing with Aretz" },
        ],
        devotional: "The earth was — hayetah. This verb is the root of the name YHWH (יהוה) — He Who Is, Was, and Will Be. Even in the description of formlessness, the very word used points to the eternal God who exists outside of time.",
        color: "#1B7A6E",
      },
      {
        hebrew: "תֹהוּ",
        transliteration: "Tohu",
        meaning: "Without form",
        grammar: "A noun meaning formless, chaos, emptiness. Used 20 times in the OT. Always describes something void of order.",
        letters: [
          { l:"ת", name:"Tav", lesson:22, note:"The seal — something marked as unfinished" },
          { l:"ה", name:"He", lesson:5, note:"Breath — a hollow, empty breath" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — suspended, not yet anchored" },
        ],
        devotional: "Tohu does not mean evil — it means unformed. God did not create a broken world. He created raw material. A sculptor sees the statue inside the marble. God saw the garden inside the tohu. He begins with chaos not because He is limited, but because He delights in forming.",
        color: "#C06C3E",
      },
      {
        hebrew: "וָבֹהוּ",
        transliteration: "VaVohu",
        meaning: "And void",
        grammar: "Vav (וָ = and) + Bohu (בֹהוּ = void, emptiness). Tohu and bohu always appear together in Scripture as a pair.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — joining tohu and bohu as inseparable twins" },
          { l:"ב", name:"Bet", lesson:2, note:"House — an empty house, waiting for inhabitants" },
          { l:"ה", name:"He", lesson:5, note:"Breath — barely there, waiting to be filled" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — suspended, incomplete" },
        ],
        devotional: "Tohu vavohu — formless and void. These two words only appear together three times in all of Scripture. Theologians call this the 'unformed and unfilled' state. God's work in creation is to form and to fill: forming on days 1–3, filling on days 4–6. Your life's empty places are not abandoned — they are waiting to be formed and filled.",
        color: "#8B5CF6",
      },
      {
        hebrew: "וְחֹשֶׁךְ",
        transliteration: "VeChoshekh",
        meaning: "And darkness",
        grammar: "Vav (וְ = and) + Choshekh (חֹשֶׁךְ = darkness). Choshekh means the absence of light — not an evil force but an unfilled state.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — adding to the description of the unformed earth" },
          { l:"ח", name:"Chet", lesson:8, note:"A fence, enclosure — darkness as a boundary" },
          { l:"ש", name:"Shin", lesson:21, note:"Fire — but here, fire not yet lit" },
          { l:"ך", name:"Kaf (final)", lesson:11, note:"The open hand — darkness as openness, waiting" },
        ],
        devotional: "Darkness was not created by God as an evil thing — it was simply the absence of what He was about to speak. God's first recorded act in creation is to speak light into darkness. He still does this. Whatever darkness you face is not beyond the reach of His first word: 'Let there be light.'",
        color: "#2E4A33",
      },
      {
        hebrew: "וְרוּחַ",
        transliteration: "VeRuach",
        meaning: "And the Spirit",
        grammar: "Vav (וְ = and) + Ruach (רוּחַ = Spirit, wind, breath — H7307). The same word means all three: Spirit, wind, breath.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — the Spirit enters the scene" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the Spirit as the head of all living things" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — the Spirit as connector between God and creation" },
          { l:"ח", name:"Chet", lesson:8, note:"Life fence — the Spirit as the boundary of life itself" },
        ],
        devotional: "Ruach — Spirit, wind, breath. This word holds three meanings in one. The Spirit of God is like breath: invisible, essential, life-giving. Like wind: powerful, direction-setting, you cannot see it but you see what it does. The same Ruach that hovered over the waters at creation hovers over every new beginning in your life.",
        color: "#D4A853",
      },
      {
        hebrew: "אֱלֹהִים",
        transliteration: "Elohim",
        meaning: "God",
        grammar: "Plural noun used with singular verbs — the plural of majesty. The same Elohim from Genesis 1:1, appearing again.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Silent — God's quiet, powerful presence" },
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — God as teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's own letter breathed into this name" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — God's active power" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — the Spirit hovered over the waters" },
        ],
        devotional: "Elohim appears again. In a verse describing chaos, emptiness, and darkness — God is still named. He is present in the tohu vavohu. He is not absent from your wilderness. The same God who spoke creation into order in verse 1 is standing over the void in verse 2, about to speak.",
        color: "#8B5CF6",
      },
      {
        hebrew: "מְרַחֶפֶת",
        transliteration: "Merachefet",
        meaning: "Moved / Hovered",
        grammar: "A Piel participle from רָחַף (rachaph) — to hover, flutter, brood. Used only twice in the OT: here and Deuteronomy 32:11 of an eagle over its nest.",
        letters: [
          { l:"מ", name:"Mem", lesson:13, note:"Water — hovering over the waters" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the Spirit as the head of all new life" },
          { l:"ח", name:"Chet", lesson:8, note:"Life — this hovering is the beginning of all life" },
          { l:"פ", name:"Pe", lesson:17, note:"Mouth — as if speaking life before the words come" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — a complete, purposeful movement" },
        ],
        devotional: "Merachefet — hovering, brooding, fluttering. The Spirit of God was not passive over the void. He was like a mother eagle beating her wings over her nest, warming, protecting, preparing to bring forth life. Before God spoke a single word of creation, the Spirit was already there — hovering with intention. He hovers over every chaos with the same purpose.",
        color: "#1B7A6E",
      },
      {
        hebrew: "הַמָּיִם",
        transliteration: "HaMayim",
        meaning: "The waters",
        grammar: "Ha (הַ = the) + Mayim (מָּיִם = waters, always plural). Water in Hebrew is always plural — mayim, never a singular form.",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"The definite article 'the'" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — Mem is the letter of water itself" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God moving through the waters" },
          { l:"מ", name:"Mem (final)", lesson:13, note:"Final Mem ם — sealed, the waters enclosed" },
        ],
        devotional: "The verse ends where the Spirit is hovering: over the waters. Water in Hebrew thought represents chaos, potential, and life. Mem — the letter of water — looks like waves. The Spirit hovered over the mayim, and out of those chaotic waters God would speak forth an ordered, beautiful world. Every ending in Scripture that seems like water — like chaos — is a canvas for God's next creation.",
        color: "#C06C3E",
      },
    ];

    const WORDS_DEUT6V4 = [
      {
        hebrew: "שְׁמַע",
        transliteration: "Shema",
        meaning: "Hear / Listen",
        grammar: "A Qal imperative — a direct command. Not 'you might hear' but 'Hear!' The command form makes this an urgent summons to active listening.",
        letters: [
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire — hearing that ignites, that burns within" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — hearing that flows through you and changes you" },
          { l:"ע", name:"Ayin", lesson:16, note:"Eye — to truly hear is to truly see" },
        ],
        devotional: "Shema — hear. The most important word in Judaism. This single imperative has been recited by Jewish people twice daily for over three thousand years. It is the first word a Jewish child learns and the last word on the lips of Jewish martyrs. To shema is not passive hearing — it is active, obedient, life-transforming response to the voice of God.",
        color: "#C06C3E",
      },
      {
        hebrew: "יִשְׂרָאֵל",
        transliteration: "Yisrael",
        meaning: "Israel",
        grammar: "The covenant name given to Jacob in Genesis 32:28 — meaning 'he who strives with God' or 'God strives.' Refers to both the nation and every individual within the covenant.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — the hand that renamed Jacob" },
          { l:"שׂ", name:"Shin", lesson:21, note:"Here as Sin — the striving, the wrestling" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the one who prevailed" },
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the strength received in the struggle" },
          { l:"ל", name:"Lamed", lesson:12, note:"The staff — guided and taught by God" },
        ],
        devotional: "Yisrael — the one who strives with God. This name was born in a night of wrestling at the Jabbok river. God calls His people by the name of a man who refused to let go until he received a blessing. The Shema is addressed to wrestlers, to those who have struggled with God and kept hold. It is not addressed to the comfortable but to the covenant people.",
        color: "#2E4A33",
      },
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The Tetragrammaton — the four-letter personal name of God. Appearing here for the first time in the Shema, establishing who is speaking and who is being declared.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The smallest letter — God's humility and transcendence" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the living God, not an idol" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — God nailed in covenant to His people" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the name itself breathes life" },
        ],
        devotional: "YHWH appears twice in this six-word verse. The first YHWH establishes identity — this is the covenant God of Israel, not a foreign deity. The rabbis taught that the two occurrences of YHWH point to God as He is known now and God as He will be fully known in the age to come. The God you know today is the same God who will be revealed in fullness.",
        color: "#D4A853",
      },
      {
        hebrew: "אֱלֹהֵינוּ",
        transliteration: "Eloheinu",
        meaning: "Our God",
        grammar: "Elohim (אֱלֹהִים) + the suffix נוּ (nu = our). The plural possessive 'our' — this declaration is communal, not just personal. Our God, not just my God.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the all-powerful God" },
          { l:"ל", name:"Lamed", lesson:12, note:"Teaching staff — God as our teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the living God among us" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — His hand upon us" },
          { l:"נ", name:"Nun", lesson:14, note:"Fish, life — the God of all living" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — and the suffix 'our'" },
        ],
        devotional: "Eloheinu — our God. Not my God in isolation but our God in community. The Shema is recited together. Faith in Israel was never purely private — it was communal, covenantal, shared. The same God who is YHWH the personal covenant God is also Elohim the cosmic Creator. He is both infinitely powerful and intimately ours.",
        color: "#8B5CF6",
      },
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The second occurrence of the Tetragrammaton in this verse. Together with the first YHWH it creates a declaration: YHWH — Eloheinu — YHWH. The name frames the confession.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"Yod again — the hand that holds all things" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the same God, breathing still" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — holding the whole declaration together" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the final breath, the final word" },
        ],
        devotional: "YHWH appears again, closing the declaration like a bookend. The structure is: YHWH — our God — YHWH. The personal name frames everything. Whatever stands between the two names of YHWH is held, defined, and owned by Him. Your life stands between the YHWH who created you and the YHWH who will receive you. All of it is held in His name.",
        color: "#D4A853",
      },
      {
        hebrew: "אֶחָד",
        transliteration: "Echad",
        meaning: "One",
        grammar: "The Hebrew word for one — echad. Unlike yachid (absolute solitary oneness), echad can mean a unified one — like one cluster of grapes or one evening and morning. The same word used for husband and wife becoming one flesh.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter — One, the beginning of all" },
          { l:"ח", name:"Chet", lesson:8, note:"Life — oneness as the source of all life" },
          { l:"ד", name:"Dalet", lesson:4, note:"Door — the one God as the only door" },
        ],
        devotional: "Echad — one. The final word of the Shema is the word that has sustained the Jewish people through every trial in history. Echad is a unified oneness — not a cold singularity but a oneness that contains richness. The rabbis said that when you recite Echad, you should dwell on it, extending the sound, meditating on God's sovereignty over every direction and dimension. One God. Everything else flows from this.",
        color: "#1B7A6E",
      },
    ];

    const WORDS = readingVerse === "gen1v2" ? WORDS_GEN1V2 : readingVerse === "psalm23v1" ? WORDS_PSALM23V1 : readingVerse === "deut6v4" ? WORDS_DEUT6V4 : WORDS_GEN1V1;
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
          <Label icon="📖" t={ht2} color={ht2.muted}>The 7 Words</Label>
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
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:ht2.accent, direction:"rtl", lineHeight:1.2, marginBottom:10, textShadow:`0 2px 12px ${ht2.accentLight}` }}>
              {currentWord.hebrew}
            </div>
            <div style={{ fontFamily:ht2.heading, fontSize:22, color:ht2.dark, marginBottom:4 }}>{currentWord.transliteration}</div>
            <div style={{ fontFamily:ht2.body, fontSize:16, color:ht2.muted, fontStyle:"italic", marginBottom:10 }}>{currentWord.meaning}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:13, color:ht2.text, lineHeight:1.65, textAlign:"left", padding:"10px 12px", background:ht2.accentLight, borderRadius:8 }}>{currentWord.grammar}</div>
          </Card>
          {/* Letter breakdown */}
          <div style={{ marginBottom:14 }}>
            <button onClick={() => setShowLetters(s => !s)}
              style={{ width:"100%", padding:"12px 16px", borderRadius:10, border:`1px solid ${ht2.accentBorder}`, background:showLetters?ht2.accentLight:ht2.card, fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.accent, cursor:"pointer", display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom: showLetters?8:0 }}>
              <span>🔠 Letter by Letter Breakdown ({currentWord.letters.length} letters)</span>
              <span>{showLetters?"▲":"▼"}</span>
            </button>
            {showLetters && (
              <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
                {currentWord.letters.map((lt,i) => (
                  <div key={i} style={{ background:ht2.card, borderRadius:10, padding:"12px 14px", border:`1px solid ${ht2.divider}`, display:"flex", alignItems:"center", gap:12 }}>
                    <div style={{ width:44, height:44, borderRadius:10, background:ht2.accentLight, border:`1px solid ${ht2.accentBorder}`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:26, color:ht2.accent, flexShrink:0, direction:"rtl" }}>{lt.l}</div>
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
  return null;
}
