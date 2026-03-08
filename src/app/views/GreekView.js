"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";
import { supabase } from "../../lib/supabase";

export default function GreekView() {
  const {
    view, darkMode, user,
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, setGreekAlphabet, greekVocab, setGreekVocab,
    greekCategory, setGreekCategory, greekProgress,
    greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer,
    greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup,
    greekGrammarLesson, setGreekGrammarLesson, greekGrammarLessonIds,
    greekReadingVerse, setGreekReadingVerse,
    greekReadingStep, setGreekReadingStep,
    nav, goBack,
    markGreekComplete, loadGreekLesson, bp,
  } = useApp();

  // ═══ GREEK HOME ═══
  const GreekHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const categories = [
      { id:"alphabet", label:"Alphabet", icon:"Α", desc:"All 24 Greek letters" },
      { id:"vocabulary", label:"Vocabulary", icon:"📚", desc:"Key NT Greek words" },
      { id:"grammar", label:"Grammar", icon:"📝", desc:"How Greek works", action:() => nav("greek-grammar-home") },
      { id:"reading", label:"Reading", icon:"📖", desc:"Read NT Greek texts", action:() => nav("greek-reading-home") },
    ];
    const currentLessonIds = greekLessons.map(l => l.id);
    const completedCount = Object.values(greekProgress).filter(p => p.completed && currentLessonIds.includes(p.lesson_id)).length;
    const totalLessons = greekLessons.length;
    const GREEK_VOCAB_GROUPS = [
      { id:"names-titles", label:"Names & Titles of God", icon:"✝️", range:[25,29], color:"#1B7A6E", desc:"θεός, κύριος, Χριστός..." },
      { id:"salvation", label:"Salvation Words", icon:"🕊️", range:[30,34], color:"#1A2F4B", desc:"ἀγάπη, πίστις, χάρις..." },
      { id:"church", label:"Church & Community", icon:"⛪", range:[35,39], color:"#2A5E58", desc:"ἐκκλησία, εὐαγγέλιον..." },
      { id:"theological", label:"Theological Terms", icon:"📜", range:[40,44], color:"#1B7A6E", desc:"λόγος, δικαιοσύνη..." },
      { id:"action", label:"Action Words", icon:"⚡", range:[45,49], color:"#1A2F4B", desc:"πιστεύω, γινώσκω..." },
      { id:"prophecy", label:"Prophecy & End Times", icon:"🔭", range:[50,54], color:"#2A5E58", desc:"παρουσία, βασιλεία..." },
    ];
    const ALL_GREEK_LETTERS = [
      {upper:"Α",lower:"α",name:"Alpha",num:1},{upper:"Β",lower:"β",name:"Beta",num:2},{upper:"Γ",lower:"γ",name:"Gamma",num:3},
      {upper:"Δ",lower:"δ",name:"Delta",num:4},{upper:"Ε",lower:"ε",name:"Epsilon",num:5},{upper:"Ζ",lower:"ζ",name:"Zeta",num:6},
      {upper:"Η",lower:"η",name:"Eta",num:7},{upper:"Θ",lower:"θ",name:"Theta",num:8},{upper:"Ι",lower:"ι",name:"Iota",num:9},
      {upper:"Κ",lower:"κ",name:"Kappa",num:10},{upper:"Λ",lower:"λ",name:"Lambda",num:11},{upper:"Μ",lower:"μ",name:"Mu",num:12},
      {upper:"Ν",lower:"ν",name:"Nu",num:13},{upper:"Ξ",lower:"ξ",name:"Xi",num:14},{upper:"Ο",lower:"ο",name:"Omicron",num:15},
      {upper:"Π",lower:"π",name:"Pi",num:16},{upper:"Ρ",lower:"ρ",name:"Rho",num:17},{upper:"Σ",lower:"σ",name:"Sigma",num:18},
      {upper:"Τ",lower:"τ",name:"Tau",num:19},{upper:"Υ",lower:"υ",name:"Upsilon",num:20},{upper:"Φ",lower:"φ",name:"Phi",num:21},
      {upper:"Χ",lower:"χ",name:"Chi",num:22},{upper:"Ψ",lower:"ψ",name:"Psi",num:23},{upper:"Ω",lower:"ω",name:"Omega",num:24},
    ];
    return (
      <div style={{ minHeight:"100vh",background:gt.bg,paddingBottom:80 }}>
        <Header title="Learn Greek" subtitle="Biblical Greek · Ἑλληνική" onBack={goBack} theme={gt} />
        <div style={{ padding:`20px ${bp.pad}px 40px`,maxWidth:bp.content,margin:"0 auto" }}>
          {/* Hero */}
          <div style={{ background:gt.headerGradient,borderRadius:16,padding:"28px 20px",marginBottom:20,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              {greekCategory === "vocabulary" ? (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:48,color:gt.headerText,lineHeight:1.2,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>ἀγάπη</div>
                <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}99`,fontStyle:"italic",marginBottom:4 }}>agapē — Unconditional Love</div>
                <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>NT Vocabulary</div>
              </>) : (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:60,color:gt.headerText,lineHeight:1,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>Αλφα</div>
                <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}99`,fontStyle:"italic",marginBottom:4 }}>Alpha — The first letter</div>
                <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>Begin Your Journey</div>
              </>)}
            </div>
          </div>
          {/* Progress */}
          {user && totalLessons > 0 && (
            <Card t={gt} style={{ marginBottom:18 }}>
              <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:8 }}>
                <Label icon="📊" t={gt}>My Progress</Label>
                <span style={{ fontFamily:gt.ui,fontSize:13,fontWeight:700,color:gt.accent }}>{completedCount}/{totalLessons}</span>
              </div>
              <div style={{ background:gt.divider,borderRadius:6,height:8,overflow:"hidden" }}>
                <div style={{ width:`${totalLessons>0?(completedCount/totalLessons)*100:0}%`,height:"100%",background:gt.accent,borderRadius:6,transition:"width 0.5s ease" }}/>
              </div>
              <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.muted,marginTop:6 }}>{completedCount===0?"Start your first lesson below!":`${completedCount} lesson${completedCount>1?"s":""} completed · Keep going!`}</div>
            </Card>
          )}
          {/* Category Tabs */}
          <div style={{ display:"flex",gap:8,marginBottom:18,flexWrap:"wrap" }}>
            {categories.map(cat => (
              <button key={cat.id} onClick={() => { if (cat.action) { setGreekGrammarLesson(null); cat.action(); } else setGreekCategory(cat.id); }}
                style={{ flexShrink:0,padding:"8px 16px",borderRadius:20,border:greekCategory===cat.id&&!cat.action?"none":`1px solid ${gt.divider}`,background:greekCategory===cat.id&&!cat.action?gt.tabActive:gt.card,color:greekCategory===cat.id&&!cat.action?gt.headerText:gt.text,fontFamily:gt.ui,fontSize:12,fontWeight:700,cursor:"pointer",whiteSpace:"nowrap" }}>
                {cat.label}
              </button>
            ))}
          </div>
          {/* Lessons List */}
          <Label icon={greekCategory === "vocabulary" ? "📚" : "Α"} t={gt} color={gt.muted}>{greekCategory === "vocabulary" ? `Vocabulary — ${greekLessons.length} Lessons` : "The Greek Alphabet — 24 Letters"}</Label>
          {greekLessons.length === 0 ? <Spinner t={gt}/> : greekCategory === "vocabulary" ? (() => {
            return (
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {GREEK_VOCAB_GROUPS.map(group => {
                  const groupLessons = greekLessons.filter(l => l.lesson_number >= group.range[0] && l.lesson_number <= group.range[1]);
                  if (groupLessons.length === 0) return null;
                  const isOpen = greekVocabGroup === group.id;
                  const completedInGroup = groupLessons.filter(l => greekProgress[l.id]?.completed).length;
                  return (
                    <div key={group.id}>
                      <button onClick={() => setGreekVocabGroup(isOpen ? null : group.id)}
                        style={{ width:"100%",background:isOpen?group.color:gt.card,borderRadius:isOpen?"14px 14px 0 0":14,padding:"16px 18px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,border:`1px solid ${isOpen?group.color:gt.divider}`,borderBottom:isOpen?"none":"",transition:"all 0.2s",borderLeft:`4px solid ${group.color}` }}>
                        <div style={{ width:44,height:44,borderRadius:12,background:isOpen?"rgba(255,255,255,0.15)":`${group.color}18`,display:"flex",alignItems:"center",justifyContent:"center",fontSize:22,flexShrink:0 }}>{group.icon}</div>
                        <div style={{ flex:1 }}>
                          <div style={{ fontFamily:gt.heading,fontSize:16,fontWeight:700,color:isOpen?gt.headerText:gt.dark }}>{group.label}</div>
                          <div style={{ fontFamily:gt.ui,fontSize:12,color:isOpen?`${gt.headerText}88`:gt.muted,marginTop:2 }}>{group.desc}</div>
                        </div>
                        <div style={{ textAlign:"right",flexShrink:0 }}>
                          <div style={{ fontFamily:gt.ui,fontSize:11,fontWeight:700,color:isOpen?gt.accent:group.color,marginBottom:3 }}>{completedInGroup}/{groupLessons.length}</div>
                          <div style={{ fontFamily:gt.ui,fontSize:18,color:isOpen?gt.headerText:gt.muted }}>{isOpen?"▲":"▼"}</div>
                        </div>
                      </button>
                      {isOpen && (
                        <div style={{ border:`1px solid ${group.color}`,borderTop:"none",borderRadius:"0 0 14px 14px",overflow:"hidden" }}>
                          {groupLessons.map(lesson => {
                            const cnt = lesson.content || {};
                            const isDone = greekProgress[lesson.id]?.completed;
                            return (
                              <button key={lesson.id} onClick={() => { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}
                                style={{ background:gt.card,border:"none",borderBottom:`1px solid ${gt.divider}`,borderRadius:0,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":group.color}`,transition:"all 0.15s",width:"100%" }}>
                                <div style={{ minWidth:64,height:48,borderRadius:12,background:isDone?"#7ED4AD22":gt.accentLight,border:`1px solid ${isDone?"#7ED4AD44":gt.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:18,color:gt.accent,flexShrink:0,padding:"0 8px" }}>
                                  {cnt.word || "λόγος"}
                                </div>
                                <div style={{ flex:1 }}>
                                  <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                                    <span style={{ fontFamily:gt.heading,fontSize:15,fontWeight:700,color:gt.dark }}>{lesson.title}</span>
                                    {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                                  </div>
                                  <div style={{ fontFamily:gt.body,fontSize:12.5,color:gt.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                                  {cnt.transliteration && <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.accent,marginTop:3 }}>{cnt.transliteration}</div>}
                                </div>
                                <div style={{ color:gt.light,flexShrink:0 }}><ChevIcon/></div>
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
              {greekLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = greekProgress[lesson.id]?.completed;
                return (
                  <button key={lesson.id} onClick={() => { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}
                    style={{ background:gt.card,border:`1px solid ${isDone?"#7ED4AD44":gt.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":gt.accent}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)",transition:"all 0.15s" }}>
                    <div style={{ width:52,height:52,borderRadius:12,background:isDone?"#7ED4AD22":gt.accentLight,border:`1px solid ${isDone?"#7ED4AD44":gt.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:30,color:gt.accent,flexShrink:0 }}>
                      {cnt.letter || "Α"}
                    </div>
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                        <span style={{ fontFamily:gt.heading,fontSize:15,fontWeight:700,color:gt.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:gt.body,fontSize:12.5,color:gt.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                    </div>
                    <div style={{ textAlign:"right",flexShrink:0 }}>
                      <div style={{ fontFamily:gt.ui,fontSize:10,color:gt.light }}>Lesson {lesson.lesson_number}</div>
                      <div style={{ color:gt.light,marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
            </div>
          )}
          {/* 24-letter alphabet grid */}
          {greekCategory === "alphabet" && (
            <div style={{ marginTop:20 }}>
              <Label icon="🔡" t={gt} color={gt.muted}>All 24 Letters — Quick Reference</Label>
              <div style={{ display:"grid",gridTemplateColumns:"repeat(4,1fr)",gap:8 }}>
                {ALL_GREEK_LETTERS.map(al => {
                  const lesson = greekLessons.find(l => l.lesson_number === al.num);
                  const isDone = lesson && greekProgress[lesson.id]?.completed;
                  return (
                    <button key={al.num}
                      onClick={() => { if (lesson) { setGreekLesson(lesson); setGreekAlphabet(null); setGreekVocab([]); nav("greek-lesson"); }}}
                      style={{ background:isDone?"#7ED4AD22":lesson?gt.card:gt.bg,border:`1px solid ${isDone?"#7ED4AD55":lesson?gt.accentBorder:gt.divider}`,borderRadius:12,padding:"12px 6px",textAlign:"center",cursor:lesson?"pointer":"default",opacity:lesson?1:0.45,transition:"all 0.15s",position:"relative" }}>
                      {isDone && <div style={{ position:"absolute",top:4,right:6,fontSize:8,color:"#2E7D5B",fontWeight:800 }}>✓</div>}
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:lesson?gt.accent:gt.light,lineHeight:1,marginBottom:4 }}>{al.upper}<span style={{ fontSize:14 }}>{al.lower}</span></div>
                      <div style={{ fontFamily:gt.ui,fontSize:9,color:lesson?gt.text:gt.light,fontWeight:600 }}>{al.name}</div>
                      {!lesson && <div style={{ fontFamily:gt.ui,fontSize:8,color:gt.light,marginTop:2 }}>Soon</div>}
                    </button>
                  );
                })}
              </div>
              <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.muted,textAlign:"center",marginTop:10 }}>
                {greekLessons.length} of 24 letters available · More added regularly
              </div>
            </div>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK LESSON ═══

  const GreekLesson = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekLesson) return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title="Greek Lesson" onBack={goBack} theme={gt}/>
        <Spinner t={gt}/>
      </div>
    );
    const content = greekLesson.content || {};
    const verseConns = Array.isArray(greekLesson.verse_connections) ? greekLesson.verse_connections : [];
    const isDone = greekProgress[greekLesson.id]?.completed;
    const currentIdx = greekLessons.findIndex(l => l.id === greekLesson.id);
    const prevLesson = currentIdx > 0 ? greekLessons[currentIdx-1] : null;
    const nextLesson = currentIdx < greekLessons.length-1 ? greekLessons[currentIdx+1] : null;
    const isVocab = greekLesson.category === "vocabulary";
    return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title={greekLesson.title} subtitle={greekLesson.subtitle} onBack={goBack} theme={gt}
          right={isDone && <span style={{ fontFamily:gt.ui,fontSize:11,color:"#7ED4AD",fontWeight:700,background:"#7ED4AD22",padding:"4px 10px",borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Hero */}
          {isVocab ? (
            <div style={{ background:gt.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative",zIndex:1 }}>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:52,color:gt.headerText,lineHeight:1.2,marginBottom:14,textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.word}</div>
                <div style={{ fontFamily:gt.heading,fontSize:24,color:gt.accent,marginBottom:4 }}>{content.transliteration}</div>
                <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.part_of_speech}</div>
                <div style={{ display:"inline-block",background:"rgba(27,122,110,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:gt.ui,fontSize:11,color:gt.accent,letterSpacing:"0.05em" }}>
                  {content.strongs} · Appears {content.numeric_occurrences?.toLocaleString()} times in NT
                </div>
              </div>
            </div>
          ) : (
            <div style={{ background:gt.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative",zIndex:1 }}>
                <div style={{ display:"flex",justifyContent:"center",alignItems:"center",gap:24,marginBottom:14 }}>
                  <div style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif",fontSize:80,color:`${gt.headerText}55`,lineHeight:1 }}>{content.letterLower || greekAlphabet?.letter_lower || "α"}</div>
                    <div style={{ fontFamily:gt.ui,fontSize:9,color:`${gt.headerText}55`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Lowercase</div>
                  </div>
                  <div style={{ width:1,height:80,background:`${gt.headerText}22` }}/>
                  <div style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif",fontSize:108,color:gt.headerText,lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.letter || greekAlphabet?.greek_letter || "Α"}</div>
                    <div style={{ fontFamily:gt.ui,fontSize:9,color:`${gt.headerText}77`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Uppercase</div>
                  </div>
                </div>
                <div style={{ fontFamily:gt.heading,fontSize:26,color:gt.accent,marginBottom:4 }}>{content.name || greekAlphabet?.letter_name}</div>
                <div style={{ fontFamily:gt.body,fontSize:15,color:`${gt.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.transliteration || greekAlphabet?.transliteration}</div>
                <div style={{ display:"inline-block",background:"rgba(27,122,110,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:gt.ui,fontSize:11,color:gt.accent }}>
                  Numeric value: {content.numeric_value || greekAlphabet?.numeric_value}
                </div>
              </div>
            </div>
          )}
          {/* Pronunciation */}
          <Card t={gt} style={{ marginBottom:14 }}>
            <Label icon="🔊" t={gt}>Pronunciation</Label>
            <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.75 }}>{content.pronunciation || greekAlphabet?.pronunciation_guide}</div>
          </Card>
          {/* Pictograph (alphabet) or Etymology (vocab) */}
          {!isVocab && (
            <Card accent t={gt} style={{ marginBottom:14 }}>
              <Label icon="🏺" t={gt}>Phoenician Origin</Label>
              <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.75 }}>{content.pictograph || greekAlphabet?.pictographic}</div>
            </Card>
          )}
          {isVocab && content.etymology && (
            <Card accent t={gt} style={{ marginBottom:14 }}>
              <Label icon="📖" t={gt}>Etymology</Label>
              <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.75 }}>{content.etymology}</div>
            </Card>
          )}
          {/* Fun fact or theological significance */}
          {(content.fun_fact || content.theological_significance) && (
            <Card t={gt} style={{ marginBottom:14,borderLeft:`3px solid ${gt.accent}` }}>
              <Label icon="✨" t={gt}>{isVocab ? "Theological Significance" : "Did You Know?"}</Label>
              <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.8,fontStyle:"italic" }}>{content.fun_fact || content.theological_significance}</div>
            </Card>
          )}
          {/* Related words (vocab) */}
          {isVocab && content.related_words?.length > 0 && (
            <Card t={gt} style={{ marginBottom:14 }}>
              <Label icon="🔗" t={gt}>Related Words</Label>
              <div style={{ display:"flex",flexWrap:"wrap",gap:8 }}>
                {content.related_words.map((w,i) => (
                  <div key={i} style={{ background:gt.accentLight,border:`1px solid ${gt.accentBorder}`,borderRadius:8,padding:"6px 12px",fontFamily:"'Times New Roman',serif",fontSize:14,color:gt.accent }}>{w}</div>
                ))}
              </div>
            </Card>
          )}
          {/* Vocabulary words linked to this alphabet lesson */}
          {!isVocab && greekVocab.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="📚" t={gt} color={gt.muted}>Key NT Words This Lesson</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {greekVocab.map((word,i) => (
                  <div key={i} style={{ background:gt.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${gt.divider}` }}>
                    <div style={{ display:"flex",alignItems:"center",gap:10,marginBottom:6,flexWrap:"wrap" }}>
                      <span style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:gt.accent,fontWeight:700 }}>{word.greek_word}</span>
                      <span style={{ fontFamily:gt.body,fontSize:13,color:gt.muted,fontStyle:"italic" }}>({word.transliteration})</span>
                      <span style={{ marginLeft:"auto",background:gt.accentLight,border:`1px solid ${gt.accentBorder}`,padding:"2px 8px",borderRadius:4,fontFamily:"monospace",fontSize:10,color:gt.muted }}>{word.strongs_number}</span>
                    </div>
                    <div style={{ fontFamily:gt.ui,fontSize:13.5,color:gt.text,lineHeight:1.6,marginBottom:6 }}>{word.meaning}</div>
                    {word.example_verse_ref && (
                      <div style={{ fontFamily:gt.body,fontSize:12,color:gt.muted,fontStyle:"italic",padding:"8px 10px",background:gt.accentLight,borderRadius:8 }}>
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
            <Card t={gt} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={gt} color={gt.muted}>In the New Testament</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {verseConns.map((vc,i) => (
                  <div key={i} style={{ padding:"12px 14px",background:gt.accentLight,borderRadius:10,border:`1px solid ${gt.accentBorder}` }}>
                    <div style={{ fontFamily:gt.heading,fontSize:13,fontWeight:700,color:gt.accent,marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:gt.body,fontSize:13.5,color:gt.text,lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Practice Button */}
          <button onClick={() => { setGreekPracticeIdx(0); setGreekPracticeAnswer(null); setGreekPracticeScore(0); nav("greek-practice"); }}
            style={{ width:"100%",padding:"16px",borderRadius:14,border:"none",background:gt.headerGradient,color:gt.headerText,fontFamily:gt.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:12,boxShadow:"0 4px 15px rgba(27,122,110,0.25)" }}>
            ✍️ Practice This Lesson
          </button>
          {user && !isDone && (
            <button onClick={() => markGreekComplete(greekLesson.id, 0)}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:"1.5px solid #7ED4AD",background:"#7ED4AD11",color:"#2E7D5B",fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center",padding:"13px",borderRadius:12,background:"#7ED4AD22",border:"1px solid #7ED4AD44",marginBottom:12 }}>
              <span style={{ fontFamily:gt.ui,fontSize:13,color:"#2E7D5B",fontWeight:700 }}>
                ✓ Lesson Complete{greekProgress[greekLesson.id]?.score ? ` · Best Score: ${greekProgress[greekLesson.id].score}%` : ""}
              </span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center",padding:"12px",borderRadius:10,background:gt.accentLight,border:`1px solid ${gt.accentBorder}`,marginBottom:12 }}>
              <span style={{ fontFamily:gt.ui,fontSize:12,color:gt.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}
          {/* Prev / Next */}
          <div style={{ display:"flex",gap:10 }}>
            <button onClick={() => { if(prevLesson){ setGreekLesson(prevLesson); setGreekAlphabet(null); setGreekVocab([]); loadGreekLesson(prevLesson.id); }}} disabled={!prevLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${gt.divider}`,background:prevLesson?gt.card:gt.bg,fontFamily:gt.ui,fontSize:13,color:gt.dark,cursor:prevLesson?"pointer":"default",opacity:prevLesson?1:0.4 }}>← Prev</button>
            <button onClick={() => { if(nextLesson){ setGreekLesson(nextLesson); setGreekAlphabet(null); setGreekVocab([]); loadGreekLesson(nextLesson.id); }}} disabled={!nextLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${gt.divider}`,background:nextLesson?gt.card:gt.bg,fontFamily:gt.ui,fontSize:13,color:gt.dark,cursor:nextLesson?"pointer":"default",opacity:nextLesson?1:0.4 }}>Next →</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK PRACTICE ═══
  const GreekPractice = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekLesson) return null;
    const content = greekLesson.content || {};
    const questions = content.practice || [];
    if (questions.length === 0) return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title="Practice" onBack={goBack} theme={gt}/>
        <div style={{ textAlign:"center",padding:40 }}>
          <div style={{ fontSize:48,marginBottom:16 }}>✍️</div>
          <div style={{ fontFamily:gt.heading,fontSize:18,color:gt.dark }}>No practice questions yet</div>
        </div>
      </div>
    );
    const isDone = greekPracticeIdx >= questions.length;
    const currentQ = isDone ? null : questions[greekPracticeIdx];
    const isLast = greekPracticeIdx === questions.length - 1;
    const pct = isDone ? 100 : Math.round((greekPracticeIdx/questions.length)*100);
    const handleAnswer = (idx) => {
      if (greekPracticeAnswer !== null) return;
      setGreekPracticeAnswer(idx);
      if (currentQ.type === "choice" && idx === currentQ.answer) setGreekPracticeScore(s => s+1);
      if (currentQ.type === "identify") setGreekPracticeScore(s => s+1);
    };
    const handleNext = () => {
      if (isLast) {
        const finalScore = Math.round((greekPracticeScore/questions.length)*100);
        markGreekComplete(greekLesson.id, finalScore);
        setGreekPracticeIdx(questions.length);
      } else {
        setGreekPracticeIdx(i => i+1);
        setGreekPracticeAnswer(null);
      }
    };
    if (isDone) {
      const finalScore = Math.round((greekPracticeScore/questions.length)*100);
      return (
        <div style={{ minHeight:"100vh",background:gt.bg }}>
          <Header title="Practice Complete!" theme={gt} onBack={goBack}/>
          <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`40px ${bp.pad}px`,textAlign:"center" }}>
            <div style={{ fontSize:64,marginBottom:16 }}>🎉</div>
            <div style={{ fontFamily:gt.heading,fontSize:30,color:gt.dark,marginBottom:8 }}>Well Done!</div>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:64,color:gt.accent,marginBottom:20,lineHeight:1 }}>{content.letter || content.word}</div>
            <Card t={gt} style={{ marginBottom:22,textAlign:"center" }}>
              <div style={{ fontFamily:gt.ui,fontSize:13,color:gt.muted,marginBottom:6 }}>Your Score</div>
              <div style={{ fontFamily:gt.heading,fontSize:52,fontWeight:800,color:finalScore>=70?"#2E7D5B":gt.accent }}>{finalScore}%</div>
              <div style={{ fontFamily:gt.ui,fontSize:13,color:gt.muted }}>{greekPracticeScore} of {questions.length} correct</div>
              {finalScore>=70
                ? <div style={{ fontFamily:gt.body,fontSize:13,color:"#2E7D5B",marginTop:8,fontStyle:"italic" }}>Excellent! This lesson is now marked complete.</div>
                : <div style={{ fontFamily:gt.body,fontSize:13,color:gt.muted,marginTop:8,fontStyle:"italic" }}>Try again to strengthen your memory.</div>}
            </Card>
            <button onClick={() => nav("greek-home")} style={{ width:"100%",padding:"14px",borderRadius:12,border:"none",background:gt.headerGradient,color:gt.headerText,fontFamily:gt.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:10 }}>
              Back to Lessons
            </button>
            <button onClick={() => { setGreekPracticeIdx(0); setGreekPracticeAnswer(null); setGreekPracticeScore(0); }}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:`1.5px solid ${gt.accentBorder}`,background:"transparent",color:gt.accent,fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>
              Try Again
            </button>
          </div>
        </div>
      );
    }
    return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title={`Practice · ${greekLesson.title}`} subtitle={`Question ${greekPracticeIdx+1} of ${questions.length}`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.divider,borderRadius:6,height:6,marginBottom:22,overflow:"hidden" }}>
            <div style={{ width:`${pct}%`,height:"100%",background:gt.accent,borderRadius:6,transition:"width 0.4s ease" }}/>
          </div>
          <div style={{ textAlign:"center",marginBottom:20 }}>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:72,color:gt.accent,lineHeight:1 }}>{content.letter || content.word || "Α"}</div>
            <div style={{ fontFamily:gt.body,fontSize:13,color:gt.muted,fontStyle:"italic",marginTop:4 }}>{content.name || content.transliteration} · {content.transliteration || content.meaning}</div>
          </div>
          <Card t={gt} style={{ marginBottom:14 }}>
            <div style={{ fontFamily:gt.heading,fontSize:17,color:gt.dark,lineHeight:1.65,marginBottom:18 }}>{currentQ.question}</div>
            {currentQ.type === "identify" ? (
              <div>
                {greekPracticeAnswer === null
                  ? <button onClick={() => handleAnswer(0)} style={{ width:"100%",padding:"13px",borderRadius:10,border:`1.5px solid ${gt.accentBorder}`,background:gt.accentLight,color:gt.accent,fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>Reveal Answer</button>
                  : <div style={{ padding:"14px",background:"#7ED4AD22",borderRadius:10,border:"1px solid #7ED4AD55" }}>
                      <div style={{ fontFamily:gt.body,fontSize:14,color:"#2E7D5B",lineHeight:1.7 }}>{currentQ.answer}</div>
                    </div>
                }
              </div>
            ) : (
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {currentQ.options?.map((opt,i) => {
                  const isCorrect = i === currentQ.answer;
                  const isSelected = greekPracticeAnswer === i;
                  const showResult = greekPracticeAnswer !== null;
                  let bg = gt.bg, border = gt.divider, color = gt.text;
                  if (showResult && isCorrect) { bg="#7ED4AD22"; border="#7ED4AD"; color="#2E7D5B"; }
                  else if (showResult && isSelected && !isCorrect) { bg="#E8625C11"; border="#E8625C"; color="#E8625C"; }
                  return (
                    <button key={i} onClick={() => handleAnswer(i)}
                      style={{ width:"100%",padding:"13px 16px",borderRadius:10,border:`1.5px solid ${border}`,background:bg,color,fontFamily:gt.ui,fontSize:14,fontWeight:showResult&&isCorrect?700:500,cursor:greekPracticeAnswer===null?"pointer":"default",textAlign:"left",transition:"all 0.2s",display:"flex",justifyContent:"space-between",alignItems:"center" }}>
                      <span><span style={{ fontWeight:700,marginRight:10 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                      {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
                      {showResult && isSelected && !isCorrect && <span>✗</span>}
                    </button>
                  );
                })}
              </div>
            )}
          </Card>
          {greekPracticeAnswer !== null && (
            <button onClick={handleNext} style={{ width:"100%",padding:"15px",borderRadius:12,border:"none",background:gt.headerGradient,color:gt.headerText,fontFamily:gt.ui,fontSize:15,fontWeight:700,cursor:"pointer",boxShadow:"0 4px 15px rgba(27,122,110,0.2)" }}>
              {isLast ? "Finish & See Score →" : "Next Question →"}
            </button>
          )}
        </div>
      </div>
    );
  };

  // ═══ GREEK GRAMMAR HOME ═══
  const GreekGrammarHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const GRAMMAR_LESSONS = [
      { num:55, icon:"ὁ", title:"The Definite Article", subtitle:"How Greek says 'the' — with case, gender, number", difficulty:"Beginner", color:"#1B7A6E" },
      { num:56, icon:"γ/θ/n", title:"Noun Gender", subtitle:"Masculine, feminine, and neuter nouns", difficulty:"Beginner", color:"#1A2F4B" },
      { num:57, icon:"πτ", title:"The Five Cases", subtitle:"Nominative, genitive, dative, accusative, vocative", difficulty:"Beginner", color:"#2A5E58" },
      { num:58, icon:"1st", title:"1st Declension", subtitle:"Feminine nouns in -η and -α", difficulty:"Beginner", color:"#1B7A6E" },
      { num:59, icon:"2nd", title:"2nd Declension", subtitle:"Masculine in -ος and neuter in -ον", difficulty:"Beginner", color:"#1A2F4B" },
      { num:60, icon:"3rd", title:"3rd Declension", subtitle:"Consonant-stem nouns — the irregular group", difficulty:"Beginner", color:"#2A5E58" },
      { num:61, icon:"adj", title:"Adjectives", subtitle:"Agreement in case, gender, and number", difficulty:"Beginner", color:"#1B7A6E" },
      { num:62, icon:"ἐγώ", title:"Personal Pronouns", subtitle:"ἐγώ, σύ, αὐτός — I, you, he/she/it", difficulty:"Beginner", color:"#1A2F4B" },
      { num:63, icon:"ἐν", title:"Prepositions", subtitle:"ἐν, εἰς, ἐκ — in/into/out of", difficulty:"Beginner", color:"#2A5E58" },
      { num:64, icon:"λύω", title:"Present Active Indicative", subtitle:"The foundational verb paradigm", difficulty:"Intermediate", color:"#1B7A6E" },
      { num:65, icon:"fut", title:"Future & Imperfect", subtitle:"I will loose · I was loosing", difficulty:"Intermediate", color:"#1A2F4B" },
      { num:66, icon:"aor", title:"Aorist Tense", subtitle:"Simple past — the most common Greek past tense", difficulty:"Intermediate", color:"#2A5E58" },
      { num:67, icon:"perf", title:"Perfect & Pluperfect", subtitle:"I have loosed · I had loosed", difficulty:"Intermediate", color:"#1B7A6E" },
      { num:68, icon:"M/P", title:"Middle & Passive Voice", subtitle:"Subject acts on itself or receives the action", difficulty:"Intermediate", color:"#1A2F4B" },
      { num:69, icon:"inf", title:"Infinitives & Participles", subtitle:"Introduction to the verbal adjective", difficulty:"Intermediate", color:"#2A5E58" },
      { num:70, icon:"καί", title:"Key Conjunctions", subtitle:"καί, δέ, ἀλλά, γάρ, ὅτι, ἵνα", difficulty:"Intermediate", color:"#1B7A6E" },
      { num:71, icon:"οὗτ", title:"Demonstrative Pronouns", subtitle:"οὗτος (this) and ἐκεῖνος (that)", difficulty:"Intermediate", color:"#1A2F4B" },
      { num:72, icon:"ὅς", title:"Relative Pronouns", subtitle:"ὅς ἥ ὅ — who, which, that", difficulty:"Intermediate", color:"#2A5E58" },
      { num:73, icon:"subj", title:"Subjunctive Mood", subtitle:"Possibility, purpose, and conditional clauses", difficulty:"Advanced", color:"#1B7A6E" },
      { num:74, icon:"imp", title:"Imperative Mood", subtitle:"Commands — present vs aorist distinctions", difficulty:"Advanced", color:"#1A2F4B" },
      { num:75, icon:"ptc", title:"Participles Advanced", subtitle:"Circumstantial, genitive absolute, and more", difficulty:"Advanced", color:"#2A5E58" },
      { num:76, icon:"εἰ", title:"Conditional Sentences", subtitle:"The four classes of Greek conditionals", difficulty:"Advanced", color:"#1B7A6E" },
      { num:77, icon:"ὅτι", title:"Indirect Discourse", subtitle:"Reporting what someone said or thought", difficulty:"Advanced", color:"#1A2F4B" },
      { num:78, icon:"gen", title:"Genitive Absolute", subtitle:"The independent participial phrase", difficulty:"Advanced", color:"#2A5E58" },
      { num:79, icon:"ὁ δέ", title:"Article as Pronoun", subtitle:"ὁ δέ construction and Granville Sharp's Rule", difficulty:"Advanced", color:"#1B7A6E" },
      { num:80, icon:"SVO", title:"Word Order & Emphasis", subtitle:"How word position creates emphasis in Greek", difficulty:"Advanced", color:"#1A2F4B" },
      { num:81, icon:"MSS", title:"Textual Criticism Basics", subtitle:"5,800 manuscripts and how scholars evaluate them", difficulty:"Advanced", color:"#2A5E58" },
    ];
    return (
      <div style={{ minHeight:"100vh",background:gt.bg,paddingBottom:80 }}>
        <Header title="Greek Grammar" subtitle="How the language works" onBack={goBack} theme={gt} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.headerGradient,borderRadius:16,padding:"28px 20px",marginBottom:20,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:42,color:gt.headerText,marginBottom:10 }}>Ἐν ἀρχῇ</div>
              <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}88`,fontStyle:"italic",marginBottom:4 }}>In the beginning — understanding how Greek is built</div>
              <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.accent,letterSpacing:"0.1em",textTransform:"uppercase" }}>{GRAMMAR_LESSONS.length} Lessons</div>
            </div>
          </div>
          <div style={{ background:"rgba(27,122,110,0.08)",border:`1px solid rgba(27,122,110,0.2)`,borderRadius:12,padding:"14px 16px",marginBottom:18,display:"flex",gap:12,alignItems:"flex-start" }}>
            <div style={{ fontSize:22,flexShrink:0 }}>📖</div>
            <div>
              <div style={{ fontFamily:gt.heading,fontSize:14,fontWeight:700,color:gt.dark,marginBottom:4 }}>Recommended Background</div>
              <div style={{ fontFamily:gt.body,fontSize:13,color:gt.text,lineHeight:1.7 }}>These lessons build on the alphabet. Complete at least the first 5 alphabet lessons (Alpha through Epsilon) to recognise letters as you study grammar patterns.</div>
            </div>
          </div>
          <Label icon="📝" t={gt} color={gt.muted}>Grammar Lessons — {GRAMMAR_LESSONS.length} Lessons</Label>
          <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
            {GRAMMAR_LESSONS.map((lesson, idx) => {
              const isDone = greekProgress[greekGrammarLessonIds[lesson.num]]?.completed;
              return (
                <button key={lesson.num} onClick={async () => {
                  const { data } = await supabase.from("greek_lessons").select("*").eq("lesson_number", lesson.num).single();
                  if (data) { setGreekGrammarLesson(data); nav("greek-grammar-lesson"); }
                }}
                  style={{ background:gt.card,border:`1px solid ${isDone?"#7ED4AD44":gt.divider}`,borderRadius:14,padding:"16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`4px solid ${lesson.color}`,boxShadow:"0 1px 4px rgba(0,0,0,0.04)",transition:"all 0.15s" }}>
                  <div style={{ width:52,height:52,borderRadius:12,background:`${lesson.color}18`,border:`1px solid ${lesson.color}44`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:18,color:lesson.color,flexShrink:0 }}>{lesson.icon}</div>
                  <div style={{ flex:1 }}>
                    <div style={{ display:"flex",alignItems:"center",gap:8,marginBottom:2 }}>
                      <span style={{ fontFamily:gt.heading,fontSize:15,fontWeight:700,color:gt.dark }}>{lesson.title}</span>
                      {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                    </div>
                    <div style={{ fontFamily:gt.body,fontSize:12.5,color:gt.muted,fontStyle:"italic" }}>{lesson.subtitle}</div>
                    <div style={{ marginTop:5,display:"inline-block",background:`${lesson.color}18`,borderRadius:4,padding:"2px 8px",fontFamily:gt.ui,fontSize:9,fontWeight:700,color:lesson.color,textTransform:"uppercase",letterSpacing:"0.05em" }}>{lesson.difficulty}</div>
                  </div>
                  <div style={{ textAlign:"right",flexShrink:0 }}>
                    <div style={{ fontFamily:gt.ui,fontSize:10,color:gt.light,marginBottom:4 }}>Lesson {idx+1}</div>
                    <div style={{ color:gt.light }}><ChevIcon /></div>
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK GRAMMAR LESSON ═══
  const GreekGrammarLesson = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    if (!greekGrammarLesson) return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title="Grammar" onBack={goBack} theme={gt}/>
        <Spinner t={gt}/>
      </div>
    );
    const content = greekGrammarLesson.content || {};
    const verseConns = Array.isArray(greekGrammarLesson.verse_connections) ? greekGrammarLesson.verse_connections : [];
    const isDone = greekProgress[greekGrammarLesson.id]?.completed;
    const tables = content.tables || [];
    const examples = content.examples || [];
    const keyPoints = content.key_points || [];
    return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title={greekGrammarLesson.title} subtitle={greekGrammarLesson.subtitle} onBack={goBack} theme={gt}
          right={isDone && <span style={{ fontFamily:gt.ui,fontSize:11,color:"#7ED4AD",fontWeight:700,background:"#7ED4AD22",padding:"4px 10px",borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>
          {/* Hero */}
          <div style={{ background:gt.headerGradient,borderRadius:20,padding:"32px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.25),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:64,color:gt.headerText,lineHeight:1.1,marginBottom:12,textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.symbol}</div>
              <div style={{ fontFamily:gt.heading,fontSize:24,color:gt.accent,marginBottom:4 }}>{greekGrammarLesson.title}</div>
              <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}88`,fontStyle:"italic" }}>{greekGrammarLesson.subtitle}</div>
            </div>
          </div>
          {/* Overview */}
          <Card t={gt} style={{ marginBottom:14 }}>
            <Label icon="📋" t={gt}>Overview</Label>
            <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.8 }}>{content.overview}</div>
          </Card>
          {/* Key Points */}
          {keyPoints.length > 0 && (
            <Card t={gt} style={{ marginBottom:14 }}>
              <Label icon="💡" t={gt}>Key Points</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {keyPoints.map((kp,i) => (
                  <div key={i} style={{ display:"flex",gap:10,alignItems:"flex-start" }}>
                    <div style={{ width:22,height:22,borderRadius:"50%",background:gt.accent,color:"#fff",display:"flex",alignItems:"center",justifyContent:"center",fontFamily:gt.ui,fontSize:11,fontWeight:700,flexShrink:0,marginTop:1 }}>{i+1}</div>
                    <div style={{ fontFamily:gt.body,fontSize:13.5,color:gt.text,lineHeight:1.65 }}>{kp}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Grammar Tables */}
          {tables.map((table, ti) => (
            <div key={ti} style={{ marginBottom:16 }}>
              <Label icon="📊" t={gt} color={gt.muted}>{table.title}</Label>
              <div style={{ background:gt.card,borderRadius:14,border:`1px solid ${gt.divider}`,overflow:"hidden" }}>
                <div style={{ display:"flex",background:gt.headerGradient,padding:"10px 14px" }}>
                  {table.headers.map((h, hi) => (
                    <div key={hi} style={{ flex:1,fontFamily:gt.ui,fontSize:11,fontWeight:700,color:gt.accent,textTransform:"uppercase",letterSpacing:"0.08em",textAlign:"center" }}>{h}</div>
                  ))}
                </div>
                {table.rows.map((row, ri) => (
                  <div key={ri} style={{ display:"flex",padding:"12px 14px",borderTop:`1px solid ${gt.divider}`,background:ri%2===0?gt.card:gt.accentLight }}>
                    {row.map((cell, ci) => (
                      <div key={ci} style={{ flex:1,textAlign:"center" }}>
                        {ci === 0 ? (
                          <span style={{ fontFamily:"'Times New Roman',serif",fontSize:18,color:gt.accent }}>{cell}</span>
                        ) : (
                          <span style={{ fontFamily:ci===1?gt.body:gt.ui,fontSize:13,color:gt.text,fontStyle:ci===1?"italic":"normal" }}>{cell}</span>
                        )}
                      </div>
                    ))}
                  </div>
                ))}
              </div>
            </div>
          ))}
          {/* Examples in Scripture */}
          {examples.length > 0 && (
            <Card accent t={gt} style={{ marginBottom:16 }}>
              <Label icon="📖" t={gt}>Spot It in Scripture</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:12 }}>
                {examples.map((ex, ei) => (
                  <div key={ei} style={{ padding:"12px 14px",background:"rgba(255,255,255,0.06)",borderRadius:10,border:`1px solid ${gt.accentBorder}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif",fontSize:20,color:gt.accent,marginBottom:4 }}>{ex.greek}</div>
                    <div style={{ fontFamily:gt.heading,fontSize:12,fontWeight:700,color:gt.accent,marginBottom:4 }}>{ex.ref}</div>
                    <div style={{ fontFamily:gt.body,fontSize:13,color:gt.text,lineHeight:1.65 }}>{ex.explanation}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Verse Connections */}
          {verseConns.length > 0 && (
            <Card t={gt} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={gt} color={gt.muted}>In the Bible</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {verseConns.map((vc, i) => (
                  <div key={i} style={{ padding:"12px 14px",background:gt.accentLight,borderRadius:10,border:`1px solid ${gt.accentBorder}` }}>
                    <div style={{ fontFamily:gt.heading,fontSize:13,fontWeight:700,color:gt.accent,marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:gt.body,fontSize:13.5,color:gt.text,lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Practice Questions */}
          {content.practice?.length > 0 && (
            <Card t={gt} style={{ marginBottom:16 }}>
              <Label icon="✍️" t={gt} color={gt.muted}>Quick Check</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {content.practice.map((q, qi) => (
                  <div key={qi} style={{ padding:"12px 14px",background:gt.bg,borderRadius:10,border:`1px solid ${gt.divider}` }}>
                    <div style={{ fontFamily:gt.ui,fontSize:13,fontWeight:700,color:gt.dark,marginBottom:6 }}>{q.question}</div>
                    <div style={{ fontFamily:gt.body,fontSize:13,color:gt.muted,fontStyle:"italic",padding:"8px 10px",background:gt.accentLight,borderRadius:8 }}>→ {q.answer}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {user && !isDone && (
            <button onClick={() => markGreekComplete(greekGrammarLesson.id, 100)}
              style={{ width:"100%",padding:"14px",borderRadius:12,border:"1.5px solid #7ED4AD",background:"#7ED4AD11",color:"#2E7D5B",fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center",padding:"13px",borderRadius:12,background:"#7ED4AD22",border:"1px solid #7ED4AD44",marginBottom:12 }}>
              <span style={{ fontFamily:gt.ui,fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓ Lesson Complete</span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center",padding:"12px",borderRadius:10,background:gt.accentLight,border:`1px solid ${gt.accentBorder}`,marginBottom:12 }}>
              <span style={{ fontFamily:gt.ui,fontSize:12,color:gt.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}
          <button onClick={() => nav("greek-grammar-home")}
            style={{ width:"100%",padding:"13px",borderRadius:12,border:`1.5px solid ${gt.accentBorder}`,background:"transparent",color:gt.accent,fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>
            ← Back to Grammar Lessons
          </button>
        </div>
      </div>
    );
  };

  // ═══ GREEK READING HOME ═══
  const GreekReadingHome = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const VERSES = [
      { id:"john1v1", ref:"John 1:1", greek:"Ἐν ἀρχῇ ἦν ὁ λόγος", kjv:"In the beginning was the Word...", words:5, difficulty:"Beginner", tag:"The Logos", color:"#1B7A6E", available:true },
      { id:"john3v16", ref:"John 3:16", greek:"Οὕτως γὰρ ἠγάπησεν ὁ θεὸς τὸν κόσμον", kjv:"For God so loved the world...", words:7, difficulty:"Beginner", tag:"Salvation", color:"#1A2F4B", available:true },
      { id:"rom8v28", ref:"Romans 8:28", greek:"πάντα συνεργεῖ εἰς ἀγαθόν", kjv:"All things work together for good...", words:5, difficulty:"Intermediate", tag:"Providence", color:"#2A5E58", available:true },
      { id:"phil4v13", ref:"Philippians 4:13", greek:"πάντα ἰσχύω ἐν τῷ ἐνδυναμοῦντί με", kjv:"I can do all things through Christ...", words:7, difficulty:"Intermediate", tag:"Strength", color:"#1B7A6E", available:false },
    ];
    return (
      <div style={{ minHeight:"100vh",background:gt.bg,paddingBottom:80 }}>
        <Header title="Reading" subtitle="Read Scripture in Greek" onBack={goBack} theme={gt} />
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`20px ${bp.pad}px 40px` }}>
          <div style={{ background:gt.headerGradient,borderRadius:16,padding:"24px 20px",marginBottom:22,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:32,color:gt.headerText,marginBottom:10,textShadow:"0 2px 12px rgba(0,0,0,0.3)" }}>Ἐν ἀρχῇ</div>
              <div style={{ fontFamily:gt.body,fontSize:14,color:`${gt.headerText}88`,fontStyle:"italic",marginBottom:4 }}>Read God's Word word by word</div>
              <div style={{ fontFamily:gt.ui,fontSize:11,color:gt.accent,letterSpacing:"0.1em",textTransform:"uppercase" }}>Interactive Greek Reading</div>
            </div>
          </div>
          <div style={{ fontFamily:gt.body,fontSize:14,color:gt.muted,lineHeight:1.7,marginBottom:18,fontStyle:"italic" }}>
            Each session walks you through a NT verse word by word — with grammar notes, letter breakdowns, and theological insights.
          </div>
          <Label icon="📖" t={gt} color={gt.muted}>Choose a Verse</Label>
          <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
            {VERSES.map(v => (
              <button key={v.id}
                onClick={() => { if (v.available) { setGreekReadingVerse(v.id); setGreekReadingStep(0); nav("greek-reading"); } }}
                style={{ background:gt.card,border:`1px solid ${v.available?gt.accentBorder:gt.divider}`,borderRadius:14,padding:"16px",textAlign:"left",cursor:v.available?"pointer":"default",opacity:v.available?1:0.6,borderLeft:`4px solid ${v.color}`,transition:"all 0.15s" }}>
                <div style={{ display:"flex",justifyContent:"space-between",alignItems:"flex-start",marginBottom:6 }}>
                  <div>
                    <span style={{ fontFamily:gt.heading,fontSize:15,fontWeight:700,color:gt.dark }}>{v.ref}</span>
                    <span style={{ fontFamily:gt.ui,fontSize:10,color:v.color,background:`${v.color}18`,borderRadius:4,padding:"2px 7px",marginLeft:8,textTransform:"uppercase",letterSpacing:"0.05em" }}>{v.tag}</span>
                  </div>
                  {!v.available && <span style={{ fontFamily:gt.ui,fontSize:10,color:gt.light }}>🔒 Soon</span>}
                </div>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:18,color:v.color,marginBottom:6,lineHeight:1.6 }}>{v.greek}</div>
                <div style={{ fontFamily:gt.body,fontSize:12.5,color:gt.muted,fontStyle:"italic",marginBottom:8 }}>{v.kjv}</div>
                <div style={{ display:"flex",gap:8 }}>
                  <span style={{ fontFamily:gt.ui,fontSize:10,color:gt.light,background:gt.divider,borderRadius:4,padding:"2px 8px" }}>{v.words} words</span>
                  <span style={{ fontFamily:gt.ui,fontSize:10,color:gt.light,background:gt.divider,borderRadius:4,padding:"2px 8px" }}>{v.difficulty}</span>
                </div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ GREEK READING ═══
  const GreekReading = () => {
    const gt = darkMode ? DARK_THEMES.ocean : THEMES.ocean;
    const VERSE_DATA = {
      john1v1: { ref:"John 1:1", kjv:"In the beginning was the Word, and the Word was with God, and the Word was God.", greek:"Ἐν ἀρχῇ ἦν ὁ λόγος, καὶ ὁ λόγος ἦν πρὸς τὸν θεόν, καὶ θεὸς ἦν ὁ λόγος." },
      john3v16: { ref:"John 3:16", kjv:"For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.", greek:"Οὕτως γὰρ ἠγάπησεν ὁ θεὸς τὸν κόσμον, ὥστε τὸν υἱὸν αὐτοῦ τὸν μονογενῆ ἔδωκεν." },
      rom8v28: { ref:"Romans 8:28", kjv:"And we know that all things work together for good to them that love God.", greek:"οἴδαμεν δὲ ὅτι τοῖς ἀγαπῶσιν τὸν θεὸν πάντα συνεργεῖ εἰς ἀγαθόν." },
    };
    const WORDS_JOHN1V1 = [
      { greek:"Ἐν", transliteration:"En", meaning:"In", grammar:"Preposition governing the dative case. One of the most common Greek prepositions, appearing ~2,752 times in the NT.", letters:[{l:"Ε",name:"Epsilon",note:"Short 'e' — the everyday vowel"},{l:"ν",name:"Nu",note:"The 'n' sound — completing the preposition"}], devotional:"The Gospel of John opens not with a birth narrative but with a preposition: 'in'. In the beginning. In the Word. In God. John's entire Gospel is an invitation to enter — to be in Christ, as Christ is in the Father.", color:"#1B7A6E" },
      { greek:"ἀρχῇ", transliteration:"archē", meaning:"Beginning", grammar:"Dative singular feminine of ἀρχή (archē). Root of 'archaeology' and 'archangel'. Signifies the absolute beginning — not a beginning in a series but the origin of all.", letters:[{l:"α",name:"Alpha",note:"The first letter — fitting for 'beginning'"},{l:"ρ",name:"Rho",note:"Vibrant 'r' — the sound of origin"},{l:"χ",name:"Chi",note:"'kh' sound — from which 'Christ' (Χριστός) derives"},{l:"η",name:"Eta",note:"Long 'e' — the enduring vowel"}], devotional:"Ἐν ἀρχῇ echoes the opening of Genesis: בְּרֵאשִׁית — 'in the beginning'. John deliberately mirrors Genesis. The Word who was in the beginning of the Gospel is the same Word through whom the beginning of creation came.", color:"#1A2F4B" },
      { greek:"ἦν", transliteration:"ēn", meaning:"Was (already existing)", grammar:"Imperfect active indicative 3rd singular of εἰμί (to be). The imperfect tense indicates continuous past existence — not 'came to be' (ἐγένετο) but 'was already there'. A key distinction proving the eternal pre-existence of the Word.", letters:[{l:"η",name:"Eta",note:"Long 'e' — the extended existence"},{l:"ν",name:"Nu",note:"Closing the word — was, enduring"}], devotional:"Three times in John 1:1, ἦν appears: 'In the beginning was the Word... the Word was with God... the Word was God.' Not three different verbs but the same continuous existence — eternal, relational, divine. The Word did not begin; the Word was.", color:"#2A5E58" },
      { greek:"ὁ",  transliteration:"ho", meaning:"The", grammar:"Definite article, nominative masculine singular. Greek uses the article not just for definiteness but for identification. Here ὁ λόγος — 'the Word' — is a specific, identified person.", letters:[{l:"ο",name:"Omicron",note:"Short 'o' — the little vowel carrying great weight"}], devotional:"The definite article ὁ is one of the most powerful words in theology. John 1:1c reads 'θεὸς ἦν ὁ λόγος' — literally 'God was the Word'. Greek word order and the article tell us: the Word is God in nature, while God the Father is distinct in person. Centuries of Trinitarian theology hang on this tiny word.", color:"#1B7A6E" },
      { greek:"λόγος", transliteration:"logos", meaning:"Word / Reason / Logic", grammar:"Nominative masculine singular. Appears 330 times in the NT. In Greek philosophy, λόγος was the rational principle underlying the universe. John takes this concept and identifies it with a Person.", letters:[{l:"λ",name:"Lambda",note:"The 'l' of logic and law"},{l:"ο",name:"Omicron",note:"Short 'o'"},{l:"γ",name:"Gamma",note:"'g' sound — God's self-expression"},{l:"ο",name:"Omicron",note:"Short 'o'"},{l:"ς",name:"Sigma (final)",note:"Final sigma — ending with a whisper"}], devotional:"When John chose λόγος, every Greek philosopher would nod: yes, the rational principle behind existence. But then John said: ὁ λόγος became flesh. This was not philosophy — this was a person. The Logos was not an idea but a man you could touch. The Word that held the universe together wore sandals and wept at a tomb.", color:"#2A5E58" },
    ];
    const WORDS_JOHN3V16 = [
      { greek:"Οὕτως", transliteration:"Houtōs", meaning:"So / In this way", grammar:"Adverb indicating manner. Not 'so much' (a common misreading) but 'in this manner' — describing the nature of God's love as demonstrated by the gift of His Son.", letters:[{l:"Ο",name:"Omicron",note:"Short 'o' — beginning of the manner"},{l:"υ",name:"Upsilon",note:"The 'u' sound"},{l:"τ",name:"Tau",note:"The cross — τ is shaped like a cross"},{l:"ω",name:"Omega",note:"The great long 'o'"},{l:"ς",name:"Sigma final",note:"Sealing the word"}], devotional:"Οὕτως does not say God loved us 'so much' — it says God loved us 'in this way': by giving His Son. The focus is on the method of love, not the quantity. Quantity of love is shown elsewhere (nothing can separate us). Here the quality is shown — covenant love expressed through sacrifice.", color:"#1A2F4B" },
      { greek:"ἠγάπησεν", transliteration:"ēgapēsen", meaning:"Loved (completely)", grammar:"Aorist active indicative 3rd singular of ἀγαπάω. The aorist views the action as a complete whole — God's act of love in giving His Son was a decisive, completed action.", letters:[{l:"η",name:"Eta",note:"Long 'e' — the augment marking past tense"},{l:"γ",name:"Gamma",note:"'g' — the root of agape begins here"},{l:"α",name:"Alpha",note:"The 'a' of ἀγάπη"},{l:"π",name:"Pi",note:"'p' — like the pillars of love"},{l:"η",name:"Eta",note:"Long 'e' ending of the root"},{l:"σ",name:"Sigma",note:"Aorist sigma — marking the completed act"},{l:"ε",name:"Epsilon",note:"Short 'e' ending"},{l:"ν",name:"Nu",note:"Final 'n' — the third person ending"}], devotional:"ἠγάπησεν — God loved. The verb is aorist, completed. This is not a conditional or ongoing negotiation. God's love in the gift of Christ is a done deal — written in history, sealed in blood. You did not earn it. You cannot lose it. It happened.", color:"#1B7A6E" },
    ];
    const WORDS_ROM8V28 = [
      { greek:"πάντα", transliteration:"panta", meaning:"All things", grammar:"Nominative or accusative neuter plural of πᾶς. 'All things' — not some things, not most things. The scope is total.", letters:[{l:"π",name:"Pi",note:"The gate — all things pass through here"},{l:"α",name:"Alpha",note:"'a' — beginning of 'all'"},{l:"ν",name:"Nu",note:"'n' sound"},{l:"τ",name:"Tau",note:"'t' — shaped like a cross"},{l:"α",name:"Alpha",note:"Plural neuter ending"}], devotional:"πάντα — all things. Not just the pleasant things, not just the suffering you understand. ALL things. The Greek is unambiguous. Paul includes his own shipwrecks, beatings, and imprisonment in this 'all'. When he wrote it, he wrote it from chains.", color:"#2A5E58" },
      { greek:"συνεργεῖ", transliteration:"synergei", meaning:"Works together", grammar:"Present active indicative 3rd singular of συνεργέω. Root of our word 'synergy'. The present tense indicates continuous, ongoing working-together — not a one-time intervention.", letters:[{l:"σ",name:"Sigma",note:"'s' — together, united"},{l:"υ",name:"Upsilon",note:"'u' — the prefix σύν means 'with'"},{l:"ν",name:"Nu",note:"'n' completing 'syn'"},{l:"ε",name:"Epsilon",note:"Connecting vowel"},{l:"ρ",name:"Rho",note:"'r' of ergon — work"},{l:"γ",name:"Gamma",note:"'g' of 'ergon'"},{l:"ε",name:"Epsilon",note:"'e'"},{l:"ι",name:"Iota",note:"Present tense ending"}], devotional:"Συνεργεῖ — the God of the universe is in the business of making things work together. He is not passive. He is not watching. He is actively orchestrating. Your pain is not isolated, your joy is not random. Every thread is being woven.", color:"#1B7A6E" },
    ];
    const WORDS_MAP = { john1v1: WORDS_JOHN1V1, john3v16: WORDS_JOHN3V16, rom8v28: WORDS_ROM8V28 };
    const VERSE = VERSE_DATA[greekReadingVerse] || VERSE_DATA.john1v1;
    const WORDS = WORDS_MAP[greekReadingVerse] || WORDS_JOHN1V1;
    const currentWord = WORDS[greekReadingStep] || WORDS[0];
    const isLast = greekReadingStep >= WORDS.length - 1;
    return (
      <div style={{ minHeight:"100vh",background:gt.bg }}>
        <Header title={VERSE.ref} subtitle={`Word ${greekReadingStep+1} of ${WORDS.length}`} onBack={goBack} theme={gt}/>
        <div style={{ maxWidth:bp.content,margin:"0 auto",padding:`16px ${bp.pad}px 60px` }}>
          {/* Full verse */}
          <div style={{ background:gt.headerGradient,borderRadius:16,padding:"20px",marginBottom:18,position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 0%,rgba(27,122,110,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:17,color:gt.headerText,lineHeight:1.7,marginBottom:8 }}>{VERSE.greek}</div>
              <div style={{ fontFamily:gt.body,fontSize:12.5,color:`${gt.headerText}77`,fontStyle:"italic" }}>{VERSE.kjv}</div>
            </div>
          </div>
          {/* Progress */}
          <div style={{ display:"flex",gap:6,marginBottom:16 }}>
            {WORDS.map((_,i) => (
              <div key={i} onClick={() => setGreekReadingStep(i)} style={{ flex:1,height:4,borderRadius:2,background:i<=greekReadingStep?gt.accent:gt.divider,cursor:"pointer",transition:"background 0.2s" }}/>
            ))}
          </div>
          {/* Current word */}
          <div style={{ background:gt.headerGradient,borderRadius:20,padding:"32px 20px",marginBottom:16,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(27,122,110,0.3),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:64,color:gt.headerText,lineHeight:1.1,marginBottom:10,textShadow:"0 4px 24px rgba(0,0,0,0.3)" }}>{currentWord.greek}</div>
              <div style={{ fontFamily:gt.heading,fontSize:22,color:gt.accent,marginBottom:4 }}>{currentWord.transliteration}</div>
              <div style={{ fontFamily:gt.body,fontSize:15,color:`${gt.headerText}88`,fontStyle:"italic" }}>{currentWord.meaning}</div>
            </div>
          </div>
          {/* Grammar */}
          <Card t={gt} style={{ marginBottom:14 }}>
            <Label icon="📚" t={gt}>Grammar Note</Label>
            <div style={{ fontFamily:gt.body,fontSize:14,color:gt.text,lineHeight:1.8 }}>{currentWord.grammar}</div>
          </Card>
          {/* Letters */}
          {currentWord.letters?.length > 0 && (
            <Card t={gt} style={{ marginBottom:14 }}>
              <Label icon="🔡" t={gt}>Letter by Letter</Label>
              <div style={{ display:"flex",flexWrap:"wrap",gap:8,marginTop:4 }}>
                {currentWord.letters.map((ltr, li) => (
                  <div key={li} style={{ background:gt.accentLight,border:`1px solid ${gt.accentBorder}`,borderRadius:10,padding:"10px 12px",textAlign:"center",minWidth:56 }}>
                    <div style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:gt.accent,marginBottom:4 }}>{ltr.l}</div>
                    <div style={{ fontFamily:gt.ui,fontSize:9,fontWeight:700,color:gt.muted,marginBottom:3 }}>{ltr.name}</div>
                    <div style={{ fontFamily:gt.body,fontSize:10,color:gt.muted,fontStyle:"italic",lineHeight:1.4 }}>{ltr.note}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Devotional */}
          <Card t={gt} style={{ marginBottom:20,borderLeft:`3px solid ${gt.accent}` }}>
            <Label icon="✨" t={gt}>Devotional Insight</Label>
            <div style={{ fontFamily:gt.body,fontSize:14.5,color:gt.text,lineHeight:1.85,fontStyle:"italic" }}>{currentWord.devotional}</div>
          </Card>
          {/* Navigation */}
          <div style={{ display:"flex",gap:10 }}>
            <button onClick={() => setGreekReadingStep(s => Math.max(0,s-1))} disabled={greekReadingStep===0}
              style={{ flex:1,padding:"13px",borderRadius:12,border:`1px solid ${gt.divider}`,background:greekReadingStep>0?gt.card:gt.bg,fontFamily:gt.ui,fontSize:13,color:gt.dark,cursor:greekReadingStep>0?"pointer":"default",opacity:greekReadingStep>0?1:0.4 }}>← Previous</button>
            {!isLast
              ? <button onClick={() => setGreekReadingStep(s => s+1)} style={{ flex:2,padding:"13px",borderRadius:12,border:"none",background:gt.headerGradient,color:gt.headerText,fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>Next Word →</button>
              : <button onClick={() => nav("greek-reading-home")} style={{ flex:2,padding:"13px",borderRadius:12,border:"none",background:gt.headerGradient,color:gt.headerText,fontFamily:gt.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>🎉 Complete!</button>
            }
          </div>
        </div>
      </div>
    );
  };

  if (view === "greek-home") return <GreekHome />;
  if (view === "greek-lesson") return <GreekLesson />;
  if (view === "greek-practice") return <GreekPractice />;
  if (view === "greek-grammar-home") return <GreekGrammarHome />;
  if (view === "greek-grammar-lesson") return <GreekGrammarLesson />;
  if (view === "greek-reading-home") return <GreekReadingHome />;
  if (view === "greek-reading") return <GreekReading />;
  return null;
}
