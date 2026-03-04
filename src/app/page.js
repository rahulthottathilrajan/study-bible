"use client";
import { AppProvider, useApp } from "./context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, HIGHLIGHT_COLORS, CHAPTER_GROUPS } from "./constants";
import { BackIcon, ChevIcon, CrossIcon, UserIcon, PrayerIcon, CloseIcon, Badge, Label, Card, Btn, Spinner, DBBadge } from "./components/ui";
import TimelineMaps from "./components/TimelineMaps";
import BibleBookTimeline from "./components/BibleBookTimeline";
import ProphecyFulfilment from "./components/ProphecyFulfilment";
import ArchaeologyCards from "./components/ArchaeologyCards";
import Apologetics from "./components/Apologetics";
import ReadingPlans from "./components/ReadingPlans";
import KidsCurriculum from "./components/KidsCurriculum";
import ContinueReading from "./components/ContinueReading";
import BibleSearch from "./components/BibleSearch";
import Header from "./components/Header";
import HomeView from "./views/HomeView";
import AccountView from "./views/AccountView";
import HebrewView from "./views/HebrewView";
import GreekView from "./views/GreekView";
import VerseOfTheDay from "./components/VerseOfTheDay";



// ═══════════════════════════════════════════════════
// MAIN APP
// ═══════════════════════════════════════════════════
function StudyBibleContent() {
  // ─── App state from context ───
  const {
    view, setView, testament, setTestament, book, setBook, chapter, setChapter,
    verse, setVerse, tab, setTab, fade, setFade, loading, setLoading,
    dbLive, setDbLive, darkMode, setDarkMode, fontSize, setFontSize, FS,
    dbChapters, collapsed, setCollapsed, booksCollapsed, setBooksCollapsed,
    overviewOpen, setOverviewOpen, chapterMeta, verses, wordStudies, crossRefs,
    installPrompt, showInstall, setShowInstall,
    user, authMode, setAuthMode, authEmail, setAuthEmail, authPass, setAuthPass,
    authName, setAuthName, authError, setAuthError, authLoading, authShowPass, setAuthShowPass,
    authForgot, setAuthForgot, authForgotSent, setAuthForgotSent, profile, streak,
    userNote, setUserNote, savedNote, setSavedNote, noteLoading, highlight,
    shareCopied, communityNotes, prayerModal, setPrayerModal, prayers, prayerTitle,
    setPrayerTitle, prayerText, setPrayerText, prayerLoading, allHighlights, hlLoading,
    donateModal, setDonateModal, noteRef,
    hebrewLessons, hebrewLesson, setHebrewLesson, hebrewAlphabet, hebrewVocab,
    hebrewCategory, setHebrewCategory, hebrewProgress, hebrewPracticeMode, setHebrewPracticeMode,
    hebrewPracticeIdx, setHebrewPracticeIdx, hebrewPracticeAnswer, setHebrewPracticeAnswer,
    hebrewPracticeScore, setHebrewPracticeScore, readingStep, setReadingStep,
    showLetters, setShowLetters, readingVerse, setReadingVerse,
    vocabGroup, setVocabGroup, grammarLesson, setGrammarLesson, grammarLessonIds,
    greekLessons, greekLesson, setGreekLesson, greekAlphabet, greekVocab,
    greekCategory, setGreekCategory, greekProgress, greekPracticeIdx, setGreekPracticeIdx,
    greekPracticeAnswer, setGreekPracticeAnswer, greekPracticeScore, setGreekPracticeScore,
    greekVocabGroup, setGreekVocabGroup, greekGrammarLesson, setGreekGrammarLesson,
    greekGrammarLessonIds, greekReadingVerse, setGreekReadingVerse, greekReadingStep, setGreekReadingStep,
    timelineEras, timelineEvents, timelineSelectedEra, setTimelineSelectedEra,
    timelineSelectedEvent, setTimelineSelectedEvent, timelineLoading, timelineEventsLoading,
    timelineExpandedEvent, setTimelineExpandedEvent, timelineSearchQuery, setTimelineSearchQuery,
    timelineAllEvents, timelineSearchActive, setTimelineSearchActive,
    bookInfo, isOT, currentVerse, verseNums, curIdx, t, ht,
    handleAuth, handleLogout, handleForgotPassword, handleGoogleSignIn,
    saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage,
    loadPrayers, addPrayer, togglePrayerAnswered, deletePrayer,
    loadAllHighlights,
    loadHebrewLessons, loadHebrewLesson, loadHebrewProgress, markHebrewComplete,
    loadGreekLessons, loadGreekLesson, loadGreekProgress, markGreekComplete,
    loadTimelineEras, loadAllTimelineEvents, loadTimelineEvents,
    loadChapter, goBack, nav, savePositionToSupabase, updateSectionPosition,
    updateStreak,
  } = useApp();

  // ═══ BOOKS ═══
  const Books = () => {
    const books = BIBLE_BOOKS.filter(b => b.testament === testament);
    const cats = {}; books.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return (
      <div style={{ minHeight:"100vh",background:ht.bg }}>
        <Header title={testament === "OT" ? "Old Testament" : "New Testament"} subtitle={`${books.length} Books`} onBack={goBack} theme={ht} />
        <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
          {Object.entries(cats).map(([cat, catBooks]) => {
            const ct = THEMES[CATEGORY_THEME[cat] || "home"];
            const isOpen = booksCollapsed[cat] === true;
            return (
              <div key={cat} style={{ marginBottom:14 }}>
                {/* Stone Tablet Header */}
                <button onClick={() => setBooksCollapsed(prev => ({...prev,[cat]:!prev[cat]}))}
                  style={{ width:"100%",display:"flex",alignItems:"center",gap:12,padding:"14px 16px",background:`linear-gradient(135deg,${ct.accentLight},${ct.card})`,border:`1px solid ${ct.accentBorder}`,borderLeft:`4px solid ${ct.accent}`,borderRadius:isOpen?"12px 12px 0 0":12,cursor:"pointer",textAlign:"left",boxShadow:`0 3px 8px rgba(0,0,0,0.07),inset 0 1px 0 rgba(255,255,255,0.7)`,transition:"all 0.2s" }}>
                  <span style={{ fontSize:22,flexShrink:0 }}>{CAT_ICONS[cat]}</span>
                  <div style={{ flex:1 }}>
                    <div style={{ fontFamily:ct.ui,fontSize:13,fontWeight:700,color:ct.dark,textTransform:"uppercase",letterSpacing:"0.1em" }}>{cat}</div>
                    <div style={{ fontFamily:ct.ui,fontSize:11,color:ct.muted,marginTop:2 }}>{catBooks.length} books · tap to {isOpen?"collapse":"explore"}</div>
                  </div>
                  <span style={{ fontSize:16,color:ct.accent,transform:isOpen?"rotate(0deg)":"rotate(-90deg)",transition:"transform 0.25s",display:"inline-block",flexShrink:0 }}>▾</span>
                </button>
                {/* Books Drawer */}
                {isOpen && (
                  <div style={{ border:`1px solid rgba(180,160,120,0.3)`,borderTop:"none",borderRadius:"0 0 12px 12px",overflow:"hidden",background:ht.card,boxShadow:"0 4px 10px rgba(0,0,0,0.06)" }}>
                    {catBooks.map((b, bi) => (
                      <button key={b.name} className="pressable" onClick={() => nav("chapter",{book:b.name})} style={{ width:"100%",background:"transparent",border:"none",borderBottom:bi<catBooks.length-1?`1px solid ${ht.divider}`:"none",padding:"11px 14px",cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",gap:12,borderLeft:`3px solid ${ct.accent}`,transition:"background 0.15s" }}>
                        <div style={{ flex:1 }}>
                          <div style={{ display:"flex",alignItems:"center",gap:7 }}>
                            <span style={{ fontFamily:ct.heading,fontSize:14.5,fontWeight:600,color:ht.dark }}>{b.name}</span>
                            {(dbChapters[b.name]?.length > 0) && <Badge t={ct}>Study Notes</Badge>}
                          </div>
                          <div style={{ fontFamily:ct.ui,fontSize:12,color:ht.muted,marginTop:2 }}><span style={{ fontStyle:"italic",color:ht.light }}>{b.original}</span> — {b.meaning} · {b.chapters} ch.</div>
                        </div>
                        <div style={{ color:ht.light }}><ChevIcon /></div>
                      </button>
                    ))}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    );
  };

  // ═══ CHAPTERS ═══
  const Chapters = () => {
    if (!bookInfo) return null;
    const avail = dbChapters[book] || [];
    const availNums = avail.map(a => a.num);
    const getTheme = (ch) => { const found = avail.find(a => a.num === ch); return found?.theme || null; };
    const groups = CHAPTER_GROUPS[book] || [{ label:"All Chapters", icon:"📖", chapters:Array.from({length:bookInfo.chapters},(_,i)=>i+1) }];
    const toggleGroup = (i) => setCollapsed(prev => ({...prev,[i]:!prev[i]}));

    // Progress indicators — derive from existing state
    const userNoteChapters = new Set([]);
    const userBookmarkChapters = new Set([]);

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={book} subtitle={`${bookInfo.original} — ${bookInfo.meaning}`} onBack={goBack} />
        <div style={{ padding:"18px 16px 40px",maxWidth:520,margin:"0 auto" }}>

          {/* Book info card */}
          {bookInfo.author && (
            <div style={{ background:t.card,border:`1px solid ${t.divider}`,borderRadius:14,padding:"14px 16px",marginBottom:18,boxShadow:"0 1px 4px rgba(0,0,0,0.04)" }}>
              <div style={{ fontFamily:t.ui,fontSize:13,color:t.text,lineHeight:1.8 }}>
                <span style={{ fontWeight:700,color:t.dark }}>Author: </span>{bookInfo.author}
                {bookInfo.dateWritten && <><span style={{ color:t.divider }}> · </span><span style={{ fontWeight:700,color:t.dark }}>Date: </span>{bookInfo.dateWritten}</>}
              </div>
            </div>
          )}

          {/* Legend */}
          <div style={{ display:"flex",gap:16,marginBottom:18,padding:"10px 14px",background:t.accentLight,borderRadius:10 }}>
            <div style={{ display:"flex",alignItems:"center",gap:5,fontFamily:t.ui,fontSize:11,color:t.muted }}>
              <span style={{ width:8,height:8,borderRadius:"50%",background:t.accent,display:"inline-block" }}/>Study Ready
            </div>
            <div style={{ display:"flex",alignItems:"center",gap:5,fontFamily:t.ui,fontSize:11,color:t.muted }}>
              <span style={{ fontSize:11 }}>✏️</span> Your Notes
            </div>
            <div style={{ display:"flex",alignItems:"center",gap:5,fontFamily:t.ui,fontSize:11,color:t.muted }}>
              <span style={{ fontSize:11 }}>★</span> Bookmarked
            </div>
          </div>

          {/* Empty state banner */}
          {availNums.length === 0 && (
            <div style={{ padding:"16px 18px",marginBottom:18,background:`linear-gradient(135deg,${t.accentLight},${t.card})`,border:`1px solid ${t.accentBorder}`,borderRadius:14,textAlign:"center" }}>
              <div style={{ fontSize:22,marginBottom:6 }}>📜</div>
              <div style={{ fontFamily:t.heading,fontSize:15,fontWeight:700,color:t.dark,marginBottom:4 }}>Study notes coming soon</div>
              <div style={{ fontFamily:t.ui,fontSize:12,color:t.muted,lineHeight:1.5 }}>Genesis is fully seeded with verse-by-verse study notes, Hebrew text, and cross-references. More books are being prepared.</div>
            </div>
          )}

          {/* Grouped chapters */}
          {groups.map((group, gi) => {
            const groupHasContent = group.chapters.some(ch => availNums.includes(ch));
            const isCollapsed = collapsed[gi];
            return (
              <div key={gi} style={{ marginBottom:12 }}>
                {/* Group header */}
                <button
                  onClick={() => toggleGroup(gi)}
                  style={{ width:"100%",display:"flex",alignItems:"center",gap:10,padding:"12px 14px",background:groupHasContent ? `linear-gradient(135deg,${t.accentLight},${t.card})` : t.card,border:`1px solid ${groupHasContent ? t.accentBorder : t.divider}`,borderRadius:isCollapsed ? 12 : "12px 12px 0 0",cursor:"pointer",textAlign:"left",transition:"all 0.2s" }}>
                  <span style={{ fontSize:18,flexShrink:0 }}>{group.icon}</span>
                  <div style={{ flex:1 }}>
                    <div style={{ fontFamily:t.heading,fontSize:15,fontWeight:700,color:groupHasContent ? t.dark : t.muted,lineHeight:1.3 }}>{group.label}</div>
                    <div style={{ fontFamily:t.ui,fontSize:11,color:t.muted,marginTop:2 }}>
                      {group.chapters.length === 1 ? `Chapter ${group.chapters[0]}` : `Chapters ${group.chapters[0]}–${group.chapters[group.chapters.length-1]}`}
                      {groupHasContent && <span style={{ color:t.accent,fontWeight:700 }}> · Study available</span>}
                    </div>
                  </div>
                  <span style={{ fontFamily:t.ui,fontSize:12,color:t.muted,transform:isCollapsed?"rotate(0deg)":"rotate(180deg)",transition:"transform 0.2s" }}>▾</span>
                </button>

                {/* Chapter rows */}
                {!isCollapsed && (
                  <div style={{ border:`1px solid ${groupHasContent ? t.accentBorder : t.divider}`,borderTop:"none",borderRadius:"0 0 12px 12px",overflow:"hidden",background:t.card }}>
                    {group.chapters.map((ch, ci) => {
                      const has = availNums.includes(ch);
                      const theme = getTheme(ch);
                      const hasNote = userNoteChapters.has(ch);
                      const hasBookmark = userBookmarkChapters.has(ch);
                      const isLast = ci === group.chapters.length - 1;
                      return (
                        <button key={ch}
                          className={has?"pressable":""}
                          onClick={() => { if (has) nav("verses",{chapter:ch,verse:null}); }}
                          style={{ width:"100%",display:"flex",alignItems:"center",padding:"12px 14px",background:"transparent",border:"none",borderBottom:isLast ? "none" : `1px solid ${t.divider}`,cursor:has?"pointer":"default",opacity:has?1:0.4,textAlign:"left",transition:"background 0.15s",gap:12 }}>

                          {/* Chapter number with dot indicator */}
                          <div style={{ position:"relative",flexShrink:0,width:32,height:32,display:"flex",alignItems:"center",justifyContent:"center" }}>
                            <span style={{ fontFamily:t.heading,fontSize:15,fontWeight:has?700:400,color:has?t.accent:t.light }}>{ch}</span>
                            {has && <span style={{ position:"absolute",top:0,right:0,width:7,height:7,borderRadius:"50%",background:t.accent,boxShadow:`0 0 0 2px ${t.bg}` }}/>}
                          </div>

                          {/* Title */}
                          <div style={{ flex:1,minWidth:0 }}>
                            <div style={{ fontFamily:t.ui,fontSize:13,color:has?t.text:t.light,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis",lineHeight:1.5 }}>
                              {theme || (has ? "Study available" : "Coming soon")}
                            </div>
                          </div>

                          {/* Progress badges */}
                          <div style={{ display:"flex",alignItems:"center",gap:5,flexShrink:0 }}>
                            {hasNote && <span style={{ fontSize:11,opacity:0.8 }}>✏️</span>}
                            {hasBookmark && <span style={{ fontSize:11,color:"#FFD700",opacity:0.9 }}>★</span>}
                            {has && <div style={{ color:t.light }}><ChevIcon /></div>}
                          </div>
                        </button>
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })}

          {/* Stats footer */}
          <div style={{ display:"flex",justifyContent:"center",gap:28,marginTop:10,padding:"14px 0",borderTop:`1px solid ${t.divider}` }}>
            <div style={{ textAlign:"center" }}>
              <div style={{ fontFamily:t.heading,fontSize:20,fontWeight:700,color:t.dark }}>{bookInfo.chapters}</div>
              <div style={{ fontFamily:t.ui,fontSize:10,color:t.muted,textTransform:"uppercase",letterSpacing:"0.1em" }}>Chapters</div>
            </div>
            <div style={{ textAlign:"center" }}>
              <div style={{ fontFamily:t.heading,fontSize:20,fontWeight:700,color:t.accent }}>{availNums.length}</div>
              <div style={{ fontFamily:t.ui,fontSize:10,color:t.muted,textTransform:"uppercase",letterSpacing:"0.1em" }}>Study Ready</div>
            </div>
            <div style={{ textAlign:"center" }}>
              <div style={{ fontFamily:t.heading,fontSize:20,fontWeight:700,color:t.dark }}>{groups.length}</div>
              <div style={{ fontFamily:t.ui,fontSize:10,color:t.muted,textTransform:"uppercase",letterSpacing:"0.1em" }}>Acts</div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  // ═══ VERSE LIST ═══
  const VerseList = () => {
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} subtitle="Loading verses..." onBack={goBack} /><Spinner t={t} /></div>;
    if (!verses.length) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={goBack} /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>📖</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>No verses loaded</div></div></div>;

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={`${book} ${chapter}`} subtitle={chapterMeta?.theme || `${verses.length} Verses`} onBack={goBack} />
        <div style={{ maxWidth:620,margin:"0 auto",padding:"16px 16px 40px" }}>

          {/* Chapter Illustration */}
          {chapterMeta?.illustration_url && (
            <div style={{marginBottom:14,borderRadius:14,overflow:"hidden",boxShadow:"0 2px 12px rgba(0,0,0,0.1)"}}>
              <img src={chapterMeta.illustration_url} alt={`${book} ${chapter}`} style={{width:"100%",height:200,objectFit:"cover",display:"block"}} />
            </div>
          )}

          {/* Chapter Overview (compact) */}
          {chapterMeta?.overview && (
            <Card accent t={t} style={{marginBottom:14}}>
              <Label icon="📋" t={t}>Overview</Label>
              <div style={{fontFamily:t.body,fontSize:13.5,color:t.text,lineHeight:1.6,display:"-webkit-box",WebkitLineClamp:3,WebkitBoxOrient:"vertical",overflow:"hidden"}}>{chapterMeta.overview}</div>
            </Card>
          )}

          {/* All Verses */}
          <div style={{padding:"8px 12px",background:t.accentLight,borderRadius:8,marginBottom:10,display:"flex",alignItems:"center",justifyContent:"space-between",gap:8}}>
            <div style={{display:"flex",alignItems:"center",gap:8}}>
              <span style={{fontSize:14}}>✨</span>
              <span style={{fontFamily:t.ui,fontSize:12,color:t.muted}}>Tap any verse to explore study notes, {isOT ? "Hebrew" : "Greek"} text & cross-references</span>
            </div>
            <div style={{display:"flex",alignItems:"center",gap:3,flexShrink:0}}>
              {["small","medium","large","xlarge"].map((s,i) => (
                <button key={s} onClick={() => setFontSize(s)} style={{
                  fontFamily:t.ui,fontWeight:700,border:"none",cursor:"pointer",borderRadius:6,
                  padding:"2px 6px",lineHeight:1,
                  fontSize:[10,12,14,17][i],
                  background:fontSize===s ? t.accent : "transparent",
                  color:fontSize===s ? "#fff" : t.muted,
                  transition:"all 0.15s"
                }}>A</button>
              ))}
            </div>
          </div>
          <div style={{display:"flex",flexDirection:"column",gap:6}}>
            {verses.map(v => (
              <button key={v.verse_number} onClick={() => nav("verse",{verse:v.verse_number,tab:"study"})}
                style={{
                  background:t.card,border:`1px solid ${t.divider}`,borderRadius:12,
                  padding:"14px 16px",textAlign:"left",cursor:"pointer",
                  display:"flex",gap:12,alignItems:"flex-start",
                  boxShadow:"0 1px 3px rgba(0,0,0,0.03)",transition:"all 0.15s"
                }}>
                <span style={{
                  fontFamily:t.heading,fontSize:18,fontWeight:800,color:t.verseNum,
                  minWidth:28,textAlign:"center",lineHeight:1.4
                }}>{v.verse_number}</span>
                <div style={{flex:1,minWidth:0}}>
                  <div style={{fontFamily:t.body,fontSize:FS[fontSize].list,color:t.text,lineHeight:1.65}}>{v.kjv_text}</div>
                </div>
                <div style={{color:t.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ VERSE STUDY ═══
  const VerseStudy = () => {
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={goBack} /><Spinner t={t} /><div style={{textAlign:"center",fontFamily:t.ui,fontSize:15,color:t.muted}}>Loading...</div></div>;
    if (!currentVerse) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={goBack} /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>📖</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>{dbLive?"Loading...":"Connect to Supabase"}</div></div></div>;

    const ref = `${book} ${chapter}:${verse}`;
    const vWords = wordStudies[currentVerse.id] || [];
    const vRefs = crossRefs[currentVerse.id] || [];
    const outline = chapterMeta?.outline ? JSON.parse(chapterMeta.outline) : [];

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={ref} subtitle={chapterMeta?.theme} onBack={goBack}
          right={<>
            <DBBadge live={dbLive} t={t} />
            {user && <Btn onClick={toggleBookmarkHL} style={{color:highlight?.is_bookmarked?"#ffd700":t.headerText,fontSize:18,padding:"7px 10px",background:highlight?.is_bookmarked?"rgba(255,215,0,0.2)":"rgba(255,255,255,0.1)"}}>{highlight?.is_bookmarked?"★":"☆"}</Btn>}
          </>}
        />
        <div style={{ maxWidth:620,margin:"0 auto",padding:"0 16px 40px" }}>
          {chapterMeta?.overview && (
            <div style={{margin:"14px 0"}}>
              <button
                onClick={() => setOverviewOpen(o => !o)}
                style={{ width:"100%",display:"flex",alignItems:"center",gap:10,padding:"11px 16px",background:overviewOpen?t.accentLight:t.card,border:`1px solid ${overviewOpen?t.accentBorder:t.divider}`,borderRadius:overviewOpen?"12px 12px 0 0":12,cursor:"pointer",textAlign:"left",transition:"all 0.2s" }}>
                <span style={{fontSize:16,flexShrink:0}}>📋</span>
                <div style={{flex:1}}>
                  <span style={{fontFamily:t.heading,fontSize:14,fontWeight:700,color:t.dark}}>Chapter {chapter} Overview</span>
                  {!overviewOpen && chapterMeta.key_word_original && <span style={{fontFamily:t.ui,fontSize:11,color:t.muted,marginLeft:8}}>· {chapterMeta.key_word_original}</span>}
                </div>
                <span style={{fontFamily:t.ui,fontSize:12,color:t.muted,transform:overviewOpen?"rotate(180deg)":"rotate(0deg)",transition:"transform 0.2s"}}>▾</span>
              </button>
              {overviewOpen && (
                <div style={{background:t.accentLight,border:`1px solid ${t.accentBorder}`,borderTop:"none",borderRadius:"0 0 12px 12px",padding:"14px 16px"}}>
                  <div style={{fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.65,marginBottom:chapterMeta.key_word_original||outline.length?12:0}}>{chapterMeta.overview}</div>
                  {chapterMeta.key_word_original && <div style={{padding:"8px 12px",background:"rgba(255,255,255,0.6)",borderRadius:8,display:"flex",alignItems:"center",gap:8,flexWrap:"wrap",marginBottom:outline.length?10:0}}><Badge t={t}>Key Word</Badge><span style={{fontFamily:t.body,fontSize:14,color:t.dark,fontStyle:"italic"}}>{chapterMeta.key_word_original}</span><span style={{fontFamily:t.ui,fontSize:12,color:t.muted}}>— {chapterMeta.key_word_meaning}</span></div>}
                  {outline.length > 0 && <div><div style={{fontFamily:t.ui,fontSize:10,fontWeight:700,color:t.accent,textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:6}}>Outline</div>{outline.map((o,i) => <div key={i} style={{fontFamily:t.ui,fontSize:13,color:t.text,lineHeight:1.7,paddingLeft:12,borderLeft:`2px solid ${t.accentBorder}`,marginBottom:4}}>{o}</div>)}</div>}
                </div>
              )}
            </div>
          )}

  

          {/* KJV Text Card */}
          <Card t={t} style={{ margin:"12px 0 14px",position:"relative",background:highlight?.highlight_color ? `${highlight.highlight_color}15` : t.card,borderColor:highlight?.highlight_color ? `${highlight.highlight_color}40` : t.divider }}>
            <div style={{position:"absolute",top:-1,left:30,right:30,height:3,background:`linear-gradient(90deg,transparent,${t.accent},transparent)`,borderRadius:"0 0 2px 2px"}}/>
            <Label icon="📖" t={t}>KJV Text</Label>
            <div style={{fontFamily:t.body,fontSize:FS[fontSize].detail,color:t.dark,lineHeight:1.7}}>
              <span style={{fontSize:"clamp(28px,9vw,38px)",fontWeight:800,color:t.verseNum,float:"left",lineHeight:0.85,marginRight:6,marginTop:4,fontFamily:t.heading}}>{verse}</span>
              {currentVerse.kjv_text}
            </div>
            {/* Highlight colors */}
            {user && <div style={{display:"flex",gap:6,marginTop:12,paddingTop:10,borderTop:`1px solid ${t.divider}`}}>
              <span style={{fontFamily:t.ui,fontSize:10,color:t.muted,alignSelf:"center",marginRight:4}}>Highlight:</span>
              {HIGHLIGHT_COLORS.map(c => <button key={c} onClick={() => toggleHighlight(c)} style={{width:24,height:24,borderRadius:"50%",background:c,border:highlight?.highlight_color===c?`3px solid ${t.dark}`:`2px solid ${c}66`,cursor:"pointer",transition:"all 0.15s"}} />)}
              {highlight?.highlight_color && <button onClick={() => toggleHighlight(highlight.highlight_color)} style={{fontFamily:t.ui,fontSize:10,color:t.muted,background:"none",border:"none",cursor:"pointer",textDecoration:"underline"}}>Clear</button>}
            </div>}
            {/* Share row */}
            <div style={{display:"flex",gap:8,marginTop:10,paddingTop:10,borderTop:`1px solid ${t.divider}`}}>
              <button onClick={copyVerseText} style={{padding:"6px 14px",borderRadius:20,border:`1px solid ${shareCopied?"#22c55e":t.divider}`,background:shareCopied?"#22c55e18":"transparent",color:shareCopied?"#22c55e":t.muted,fontFamily:t.ui,fontSize:12,fontWeight:600,cursor:"pointer",transition:"all 0.2s"}}>{shareCopied?"✓ Copied!":"Copy text"}</button>
              <button onClick={shareVerseImage} style={{padding:"6px 14px",borderRadius:20,border:`1px solid ${t.divider}`,background:"transparent",color:t.muted,fontFamily:t.ui,fontSize:12,fontWeight:600,cursor:"pointer"}}>Share image</button>
            </div>
          </Card>

          {/* Tabs */}
          <div style={{ display:"flex",background:t.card,borderRadius:10,padding:3,marginBottom:14,border:`1px solid ${t.divider}`,overflowX:"auto",WebkitOverflowScrolling:"touch",scrollbarWidth:"none" }}>
            {[
              {id:"study",label:"Study Notes"},
              {id:"original",label:isOT?"Hebrew":"Greek"},
              {id:"cross",label:`Cross-Refs${vRefs.length?` (${vRefs.length})`:""}`},
              ...(user ? [{id:"my",label:"My Notes"}] : [])
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)} style={{ flex:"0 0 auto",minWidth:80,padding:"10px 8px",border:"none",borderRadius:8,background:tab===tb.id?t.tabActive:"transparent",color:tab===tb.id?t.headerText:t.muted,fontFamily:t.ui,fontSize:12,fontWeight:700,cursor:"pointer",transition:"all 0.15s",whiteSpace:"nowrap" }}>{tb.label}</button>
            ))}
          </div>

          {/* Study Notes Tab */}
          {tab === "study" && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {currentVerse.study_note && <Card t={t}><Label icon="📝" t={t}>Study Note</Label><div style={{fontFamily:t.body,fontSize:15,color:t.text,lineHeight:1.75}}>{currentVerse.study_note}</div></Card>}
            {currentVerse.doctrinal_note && <Card accent t={t}><Label icon="⛪" t={t} color={t.dark}>Doctrinal Note</Label><div style={{fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.7,fontStyle:"italic"}}>{currentVerse.doctrinal_note}</div></Card>}
            {!currentVerse.study_note && !currentVerse.doctrinal_note && <Card t={t}><div style={{fontFamily:t.ui,fontSize:14,color:t.muted,textAlign:"center",padding:16}}>Study notes coming soon.</div></Card>}
          </div>}

          {/* Hebrew/Greek Tab */}
          {tab === "original" && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {currentVerse.original_text && <Card t={t}><Label icon="🕎" t={t}>{isOT?"Hebrew Text":"Greek Text"}</Label>
              <div style={{fontFamily:"'Times New Roman',serif",fontSize:isOT?24:19,color:t.dark,lineHeight:2,direction:isOT?"rtl":"ltr",textAlign:isOT?"right":"left",padding:"14px 18px",background:t.hebrewBg,borderRadius:10,marginBottom:10}}>{currentVerse.original_text}</div>
              {currentVerse.transliteration && <div style={{fontFamily:t.body,fontSize:14,color:t.muted,fontStyle:"italic",lineHeight:1.6}}><span style={{fontWeight:700,fontStyle:"normal",fontSize:10,textTransform:"uppercase",letterSpacing:"0.05em",fontFamily:t.ui}}>Transliteration: </span>{currentVerse.transliteration}</div>}
            </Card>}
            {vWords.length > 0 && <Card t={t}><Label icon="🔍" t={t}>Word Study</Label><div style={{display:"flex",flexDirection:"column",gap:9}}>
              {vWords.map((w,i) => <div key={i} style={{padding:"12px 14px",borderRadius:10,background:t.accentLight,border:`1px solid ${t.accentBorder}`}}>
                <div style={{display:"flex",alignItems:"center",gap:8,marginBottom:5,flexWrap:"wrap"}}>
                  <span style={{fontFamily:"'Times New Roman',serif",fontSize:isOT?20:16,color:t.accent,fontWeight:700,direction:isOT?"rtl":"ltr"}}>{w.original_word}</span>
                  <span style={{fontFamily:t.body,fontSize:13,color:t.muted,fontStyle:"italic"}}>({w.transliteration})</span>
                  <span style={{background:t.accentLight,border:`1px solid ${t.accentBorder}`,padding:"2px 7px",borderRadius:4,fontFamily:"monospace",fontSize:10.5,color:t.muted}}>{w.strongs_number}</span>
                </div>
                <div style={{fontFamily:t.ui,fontSize:13.5,color:t.text,lineHeight:1.6}}>{w.meaning}</div>
              </div>)}
            </div></Card>}
          </div>}

          {/* Cross-Refs Tab */}
          {tab === "cross" && <Card t={t}><Label icon="🔗" t={t}>Cross References</Label>
            {vRefs.length > 0 ? <div style={{display:"flex",flexWrap:"wrap",gap:7}}>{vRefs.map((r,i) => <span key={i} style={{background:t.accentLight,border:`1px solid ${t.accentBorder}`,borderRadius:8,padding:"8px 13px",fontFamily:t.ui,fontSize:13.5,color:t.dark,fontWeight:600}}>{r.reference}</span>)}</div>
            : <div style={{fontFamily:t.ui,fontSize:14,color:t.muted,textAlign:"center",padding:16}}>Cross references coming soon.</div>}
          </Card>}

          {/* MY NOTES Tab */}
          {tab === "my" && user && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            <Card t={t}>
              <Label icon="✏️" t={t}>My Note on {book} {chapter}:{verse}</Label>
              <textarea ref={noteRef} defaultValue={userNote} placeholder="Write your personal thoughts, reflections, or insights on this verse..." rows={4} style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1px solid ${t.divider}`,fontFamily:t.body,fontSize:14,color:t.text,outline:"none",background:t.bg,resize:"vertical",lineHeight:1.7,boxSizing:"border-box" }} />
              <div style={{ display:"flex",gap:8,marginTop:10,alignItems:"center",flexWrap:"wrap" }}>
                <button onClick={saveNote} disabled={noteLoading} style={{ padding:"10px 20px",borderRadius:8,border:"none",background:t.accent,color:"#fff",fontFamily:t.ui,fontSize:13,fontWeight:700,cursor:"pointer" }}>{noteLoading ? "Saving..." : savedNote ? "Update Note" : "Save Note"}</button>
                {savedNote && <>
                  <button onClick={toggleNotePublic} style={{ padding:"8px 14px",borderRadius:8,border:`1px solid ${savedNote.is_public?'#7ED4AD':t.divider}`,background:savedNote.is_public?'#7ED4AD22':'transparent',fontFamily:t.ui,fontSize:12,fontWeight:600,color:savedNote.is_public?'#2E7D5B':t.muted,cursor:"pointer" }}>
                    {savedNote.is_public ? "🌍 Shared" : "🔒 Private"} — tap to {savedNote.is_public ? "make private" : "share"}
                  </button>
                </>}
              </div>
              {savedNote && <div style={{fontFamily:t.ui,fontSize:10,color:t.light,marginTop:8}}>Last saved: {new Date(savedNote.updated_at).toLocaleString()}</div>}
            </Card>

            <button onClick={() => { setPrayerTitle(`Prayer for ${book} ${chapter}:${verse}`); setPrayerText(""); setPrayerModal(true); }} style={{ padding:"14px",borderRadius:12,border:`1px dashed ${t.accentBorder}`,background:t.accentLight,fontFamily:t.ui,fontSize:14,fontWeight:600,color:t.accent,cursor:"pointer",textAlign:"center" }}>
              🙏 Add Prayer for This Verse
            </button>

            {communityNotes.length > 0 && <Card t={t}>
              <Label icon="🌍" t={t} color={t.muted}>Community Notes</Label>
              {communityNotes.map((cn,i) => <div key={i} style={{padding:"10px 12px",borderRadius:8,background:t.bg,marginBottom:6,border:`1px solid ${t.divider}`}}>
                <div style={{fontFamily:t.ui,fontSize:11,fontWeight:700,color:t.accent,marginBottom:4}}>{cn.user_profiles?.display_name || "Reader"}</div>
                <div style={{fontFamily:t.body,fontSize:13.5,color:t.text,lineHeight:1.65}}>{cn.note_text}</div>
              </div>)}
            </Card>}
          </div>}

          {/* Not logged in prompt for My Notes tab */}
          {tab === "my" && !user && <Card t={t}>
            <div style={{textAlign:"center",padding:20}}>
              <div style={{fontSize:36,marginBottom:12}}>🔐</div>
              <div style={{fontFamily:t.heading,fontSize:17,color:t.dark,marginBottom:6}}>Sign In to Add Notes</div>
              <div style={{fontFamily:t.ui,fontSize:13,color:t.muted,marginBottom:14}}>Save personal notes, highlight verses, and keep a prayer journal.</div>
              <button onClick={() => nav("account")} style={{padding:"12px 28px",borderRadius:10,border:"none",background:t.tabActive,color:t.headerText,fontFamily:t.ui,fontSize:14,fontWeight:700,cursor:"pointer"}}>Sign In / Sign Up</button>
            </div>
          </Card>}

          {/* Verse Navigation */}
          <div style={{display:"flex",justifyContent:"space-between",alignItems:"center",marginTop:18,gap:10}}>
            <Btn onClick={()=>{if(curIdx>0){setVerse(verseNums[curIdx-1]);setTab("study")}}} disabled={curIdx<=0} style={{flex:1,padding:"11px",background:curIdx>0?t.card:t.bg,border:`1px solid ${t.divider}`,borderRadius:10,fontFamily:t.ui,fontSize:14,color:t.dark}}>← Prev</Btn>
            <div style={{fontFamily:t.heading,fontSize:15,color:t.muted,fontWeight:700}}>v.{verse}</div>
            <Btn onClick={()=>{if(curIdx<verseNums.length-1){setVerse(verseNums[curIdx+1]);setTab("study")}}} disabled={curIdx>=verseNums.length-1} style={{flex:1,padding:"11px",background:curIdx<verseNums.length-1?t.card:t.bg,border:`1px solid ${t.divider}`,borderRadius:10,fontFamily:t.ui,fontSize:14,color:t.dark}}>Next →</Btn>
          </div>

          {/* All Verses Grid */}
          <Card t={t} style={{marginTop:16}}>
            <Label icon="📖" t={t} color={t.muted}>All Verses — Chapter {chapter}</Label>
            <div style={{display:"flex",flexWrap:"wrap",gap:5}}>
              {verseNums.map(v => <button key={v} onClick={()=>{setVerse(v);setTab("study")}} style={{width:40,height:40,borderRadius:8,background:v===verse?t.tabActive:t.accentLight,border:v===verse?"none":`1px solid ${t.accentBorder}`,color:v===verse?t.headerText:t.text,fontFamily:t.heading,fontSize:13,fontWeight:600,cursor:"pointer",transition:"all 0.15s"}}>{v}</button>)}
            </div>
          </Card>
        </div>
      </div>
    );
  };

  // ═══ HIGHLIGHTS COLLECTION ═══
  const Highlights = () => (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="My Highlights" subtitle={`${allHighlights.length} saved`} theme={ht} />
      <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
        {!user ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:36,marginBottom:12}}>🔐</div>
            <div style={{fontFamily:ht.heading,fontSize:17,color:ht.dark,marginBottom:6}}>Sign In to See Highlights</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,marginBottom:14}}>Highlight verses while reading and find them all here.</div>
            <button onClick={() => nav("account")} style={{padding:"12px 28px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText,fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer"}}>Sign In / Sign Up</button>
          </Card>
        ) : hlLoading ? <Spinner t={ht} /> : allHighlights.length === 0 ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:42,marginBottom:14}}>🎨</div>
            <div style={{fontFamily:ht.heading,fontSize:18,color:ht.dark,marginBottom:6}}>No Highlights Yet</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,lineHeight:1.6}}>Open any verse and use the colored dots to highlight. Bookmarked and highlighted verses will appear here!</div>
          </Card>
        ) : (
          <div style={{display:"flex",flexDirection:"column",gap:8}}>
            {allHighlights.map(h => {
              const bName = h.verses?.chapters?.books?.name;
              const chNum = h.verses?.chapters?.chapter_number;
              const vNum = h.verses?.verse_number;
              const ref = `${bName} ${chNum}:${vNum}`;
              return (
                <button key={h.id} onClick={() => nav("verse",{book:bName,chapter:chNum,verse:vNum,tab:"study"})}
                  style={{ background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",gap:12,alignItems:"flex-start",borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                  <div style={{ flex:1 }}>
                    <div style={{display:"flex",alignItems:"center",gap:8,marginBottom:4}}>
                      <span style={{fontFamily:ht.heading,fontSize:14,fontWeight:700,color:ht.dark}}>{ref}</span>
                      {h.is_bookmarked && <span style={{fontSize:14}}>★</span>}
                    </div>
                    <div style={{fontFamily:ht.body,fontSize:13.5,color:ht.text,lineHeight:1.6,display:"-webkit-box",WebkitLineClamp:2,WebkitBoxOrient:"vertical",overflow:"hidden"}}>
                      {h.verses?.kjv_text}
                    </div>
                  </div>
                  <div style={{color:ht.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );

  // ═══ ACCOUNT PAGE ═══
  // ═══ HEBREW HOME ═══

  // ═══ LEARN HOME ═══
  const LearnHome = () => {
    const modules = [
      { id:"hebrew", icon:"🕎", label:"Learn Hebrew", sub:"Biblical Hebrew · עִבְרִית", color:"#C06C3E", bg:"rgba(192,108,62,0.1)", active:true, action:() => nav("hebrew-home") },
      { id:"greek", icon:"🏛️", label:"Learn Greek", sub:"Biblical Greek · Ἑλληνική", color:"#1B7A6E", bg:"rgba(27,122,110,0.1)", active:true, action:() => nav("greek-home") },
      { id:"timeline", icon:"📜", label:"Biblical Timeline", sub:"From Creation to Revelation", color:"#E8625C", bg:"rgba(232,98,92,0.1)", active:true, action:() => nav("timeline-home") },
      { id:"apologetics", icon:"🛡️", label:"Apologetics", sub:"Defend & understand the faith", color:"#1B7A6E", bg:"rgba(27,122,110,0.1)", active:true, action:() => nav("apologetics-home") },
      { id:"prophecy", icon:"🔭", label:"Prophecy & Fulfilment", sub:"300+ Messianic Predictions", color:"#8B5CF6", bg:"rgba(139,92,246,0.1)", active:true, action:() => nav("prophecy-home") },
      { id:"reading", icon:"🗓️", label:"Reading Plans", sub:"Guided Bible journeys", color:"#D4A853", bg:"rgba(212,168,83,0.1)", active:true, action:() => nav("reading-plans-home") },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="Learn" subtitle="Languages · History · Theology" onBack={goBack} theme={ht} />
        <div style={{ padding:"20px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Hero */}
          <div style={{ background:ht.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(212,168,83,0.15),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:42, marginBottom:10 }}>🎓</div>
              <div style={{ fontFamily:ht.heading, fontSize:24, fontWeight:700, color:ht.headerText, marginBottom:6 }}>Learning Centre</div>
              <div style={{ fontFamily:ht.body, fontSize:13, color:`${ht.headerText}88`, fontStyle:"italic" }}>Deepen your understanding of God's Word</div>
            </div>
          </div>
          {/* Active modules */}
          <Label icon="✨" t={ht} color={ht.muted}>Available Now</Label>
          {modules.filter(m => m.active).map(m => (
            <button key={m.id} onClick={m.action}
              style={{ width:"100%", background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"20px 18px", marginBottom:12, cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.06)", borderLeft:`4px solid ${m.color}` }}>
              <div style={{ width:54, height:54, borderRadius:14, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:28, flexShrink:0 }}>{m.icon}</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:ht.heading, fontSize:17, fontWeight:700, color:ht.dark }}>{m.label}</div>
                <div style={{ fontFamily:ht.ui, fontSize:12, color:ht.muted, marginTop:3 }}>{m.sub}</div>
                <div style={{ marginTop:8, display:"inline-block", background:m.bg, borderRadius:6, padding:"3px 10px", fontFamily:ht.ui, fontSize:9, fontWeight:700, color:m.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>Start Learning →</div>
              </div>
              <div style={{ color:ht.light }}><ChevIcon /></div>
            </button>
          ))}
          {/* Coming soon */}
          <Label icon="🔒" t={ht} color={ht.muted}>Coming Soon</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {modules.filter(m => !m.active).map(m => (
              <div key={m.id} style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"16px 18px", display:"flex", alignItems:"center", gap:14, opacity:0.55 }}>
                <div style={{ width:44, height:44, borderRadius:12, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{m.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:700, color:ht.dark }}>{m.label}</div>
                  <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.muted, marginTop:2 }}>{m.sub}</div>
                </div>
                <div style={{ fontFamily:ht.ui, fontSize:9, fontWeight:700, color:ht.light, textTransform:"uppercase", letterSpacing:"0.05em", background:ht.accentLight, padding:"3px 8px", borderRadius:4 }}>Soon</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ JOURNAL HOME ═══
  const JournalHome = () => {
    const currentTab = ["highlights","prayers"].includes(tab) ? tab : "highlights";
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="My Journal" subtitle="Highlights · Prayers · Reflections" theme={ht} />
        <div style={{ padding:"16px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Tab switcher */}
          <div style={{ display:"flex", background:ht.card, borderRadius:10, padding:3, marginBottom:18, border:`1px solid ${ht.divider}` }}>
            {[
              { id:"highlights", label:"✨ Highlights", count:allHighlights.length },
              { id:"prayers", label:"🙏 Prayers", count:prayers.length }
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)}
                style={{ flex:1, padding:"11px 8px", border:"none", borderRadius:8, background:currentTab===tb.id?ht.tabActive:"transparent", color:currentTab===tb.id?ht.headerText:ht.muted, fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:"pointer", transition:"all 0.15s" }}>
                {tb.label}{tb.count > 0 ? ` (${tb.count})` : ""}
              </button>
            ))}
          </div>

          {/* Not signed in */}
          {!user && (
            <Card t={ht} style={{ textAlign:"center", padding:30 }}>
              <div style={{ fontSize:36, marginBottom:12 }}>🔐</div>
              <div style={{ fontFamily:ht.heading, fontSize:17, color:ht.dark, marginBottom:6 }}>Sign In to See Your Journal</div>
              <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, marginBottom:14, lineHeight:1.6 }}>Save highlights, bookmarks, and prayers as you study God's Word.</div>
              <button onClick={() => nav("account")} style={{ padding:"12px 28px", borderRadius:10, border:"none", background:ht.headerGradient, color:ht.headerText, fontFamily:ht.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Sign In / Sign Up</button>
            </Card>
          )}

          {/* HIGHLIGHTS TAB */}
          {user && currentTab === "highlights" && (
            hlLoading ? <Spinner t={ht} /> :
            allHighlights.length === 0 ? (
              <Card t={ht} style={{ textAlign:"center", padding:30 }}>
                <div style={{ fontSize:42, marginBottom:14 }}>🎨</div>
                <div style={{ fontFamily:ht.heading, fontSize:18, color:ht.dark, marginBottom:6 }}>No Highlights Yet</div>
                <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, lineHeight:1.6 }}>Open any verse and tap the coloured dots to highlight. Bookmarked verses appear here too.</div>
              </Card>
            ) : (
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {allHighlights.map(h => {
                  const bName = h.verses?.chapters?.books?.name;
                  const chNum = h.verses?.chapters?.chapter_number;
                  const vNum = h.verses?.verse_number;
                  const ref = `${bName} ${chNum}:${vNum}`;
                  return (
                    <button key={h.id} onClick={() => nav("verse", { book:bName, chapter:chNum, verse:vNum, tab:"study" })}
                      style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:12, padding:"14px 16px", textAlign:"left", cursor:"pointer", display:"flex", gap:12, alignItems:"flex-start", borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`, boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                      <div style={{ flex:1 }}>
                        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4 }}>
                          <span style={{ fontFamily:ht.heading, fontSize:14, fontWeight:700, color:ht.dark }}>{ref}</span>
                          {h.is_bookmarked && <span style={{ fontSize:14 }}>★</span>}
                        </div>
                        <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.6, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>{h.verses?.kjv_text}</div>
                      </div>
                      <div style={{ color:ht.light, flexShrink:0, alignSelf:"center" }}><ChevIcon /></div>
                    </button>
                  );
                })}
              </div>
            )
          )}

          {/* PRAYERS TAB */}
          {user && currentTab === "prayers" && (
            <div>
              <Card t={ht} style={{ marginBottom:14 }}>
                <Label icon="✏️" t={ht}>New Prayer</Label>
                <input value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder="Prayer title..." style={{ width:"100%", padding:"10px 0", border:"none", borderBottom:`1px solid ${ht.divider}`, fontFamily:ht.heading, fontSize:15, color:ht.dark, outline:"none", background:"transparent", marginBottom:10, boxSizing:"border-box" }} />
                <textarea value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width:"100%", padding:"8px 0", border:"none", fontFamily:ht.body, fontSize:14, color:ht.text, outline:"none", background:"transparent", resize:"vertical", lineHeight:1.7, boxSizing:"border-box" }} />
                <button onClick={async () => { await addPrayer(); }} disabled={!prayerText.trim()} style={{ marginTop:10, padding:"10px 20px", borderRadius:8, border:"none", background:prayerText.trim()?ht.accent:ht.divider, color:"#fff", fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:prayerText.trim()?"pointer":"default" }}>Add Prayer</button>
              </Card>
              {prayerLoading ? <Spinner t={ht} /> :
              prayers.length === 0 ? (
                <div style={{ textAlign:"center", padding:30, fontFamily:ht.body, fontSize:15, color:ht.muted, fontStyle:"italic" }}>Your prayers will appear here</div>
              ) : prayers.map(p => (
                <div key={p.id} style={{ background:ht.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${p.is_answered?"#7ED4AD44":ht.divider}`, marginBottom:8, borderLeft:`3px solid ${p.is_answered?"#7ED4AD":ht.accent}` }}>
                  <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                    <div style={{ flex:1 }}>
                      <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:600, color:ht.dark }}>{p.title}</div>
                      {p.book_name && <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.accent, marginTop:2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                      <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.65, marginTop:6 }}>{p.prayer_text}</div>
                      <div style={{ fontFamily:ht.ui, fontSize:10, color:ht.light, marginTop:6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                    </div>
                    <div style={{ display:"flex", gap:6, flexShrink:0, marginLeft:10 }}>
                      <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding:"5px 10px", borderRadius:6, border:`1px solid ${p.is_answered?"#7ED4AD":ht.divider}`, background:p.is_answered?"#7ED4AD22":"transparent", fontFamily:ht.ui, fontSize:10, fontWeight:700, color:p.is_answered?"#2E7D5B":ht.muted, cursor:"pointer" }}>
                        {p.is_answered ? "✓ Answered" : "Mark Answered"}
                      </button>
                      <button onClick={() => deletePrayer(p.id)} style={{ padding:"5px 8px", borderRadius:6, border:`1px solid ${ht.divider}`, background:"transparent", fontFamily:ht.ui, fontSize:10, color:"#E8625C", cursor:"pointer" }}>✕</button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // TIMELINE COMPONENTS
  // ═══════════════════════════════════════════════════
  const st = darkMode ? DARK_THEMES.sunrise : THEMES.sunrise;

  const TimelineHome = () => {
    const sections = [
      { id:"timeline-era", icon:"📅", label:"Chronological Timeline", sub:"From Creation to the Early Church", color:"#E8625C", desc:"Explore all 14 biblical eras with key events, dates, and scripture." },
      { id:"timeline-maps", icon:"🗺️", label:"Historical Maps", sub:"The world of the Bible", color:"#1B7A6E", desc:"Period maps — Exodus route, the twelve tribes, Paul's journeys, and more." },
      { id:"timeline-books", icon:"📚", label:"Bible Book Timeline", sub:"When each book was written", color:"#D4A853", desc:"See the Bible as a library built over 1,500 years." },
      { id:"timeline-archaeology", icon:"⛏️", label:"Archaeological Evidence", sub:"Faith confirmed in the ground", color:"#8B5CF6", desc:"Dead Sea Scrolls, Tel Dan inscription, Hezekiah's Tunnel, and more." },
    ];
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title="Bible Timeline" subtitle="From Creation to Revelation" onBack={goBack} theme={st} />
        <div style={{ padding:"20px 20px 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Hero */}
          <div style={{ background:st.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:24, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 20%,rgba(232,98,92,0.25),transparent 65%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:52, marginBottom:12 }}>📜</div>
              <div style={{ fontFamily:st.heading, fontSize:26, fontWeight:700, color:st.headerText, marginBottom:6, lineHeight:1.2 }}>Biblical History</div>
              <div style={{ fontFamily:st.body, fontSize:13.5, color:`${st.headerText}88`, fontStyle:"italic", lineHeight:1.6, marginBottom:12 }}>
                6,000 years of redemptive history — from the first word of Genesis to the last verse of Revelation
              </div>
              <div style={{ display:"flex", justifyContent:"center", gap:16, flexWrap:"wrap" }}>
                {[["14","Eras"],["100+","Events"],["9","Maps"],["20+","Discoveries"]].map(([num,lbl]) => (
                  <div key={lbl} style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:st.heading, fontSize:22, fontWeight:800, color:st.accent }}>{num}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:`${st.headerText}70`, textTransform:"uppercase", letterSpacing:"0.08em" }}>{lbl}</div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Era colour strip teaser */}
          <div style={{ display:"flex", borderRadius:10, overflow:"hidden", marginBottom:22, height:10 }}>
            {[["#1B7A6E",2],["#5A7A3E",2],["#D4A853",2],["#C06C3E",2],["#8B5CF6",2],["#6B8A5A",2],["#B8860B",2],["#E8625C",2],["#C06C3E",1],["#2A4A6B",1],["#6BAE75",1],["#7A6B8A",1],["#D4A853",2],["#E8625C",2]].map(([color, weight], i) => (
              <div key={i} style={{ flex:weight, background:color }}/>
            ))}
          </div>

          {/* Section cards */}
          <Label icon="🗓️" t={st} color={st.muted}>Explore</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:12 }}>
            {sections.map(s => (
              <button key={s.id}
                onClick={() => { if (s.id === "timeline-era") nav("timeline-era"); else if (s.id === "timeline-maps") nav("timeline-maps"); else if (s.id === "timeline-books") nav("timeline-books"); else if (s.id === "timeline-archaeology") nav("timeline-archaeology"); }}
                style={{ width:"100%", background:st.card, border:`1px solid ${st.divider}`, borderRadius:16, padding:"18px 16px", cursor:(s.id==="timeline-era"||s.id==="timeline-maps"||s.id==="timeline-books"||s.id==="timeline-archaeology")?"pointer":"default", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.05)", borderLeft:`4px solid ${s.color}`, opacity:(s.id==="timeline-era"||s.id==="timeline-maps"||s.id==="timeline-books"||s.id==="timeline-archaeology")?1:0.6, transition:"all 0.15s" }}>
                <div style={{ width:52, height:52, borderRadius:14, background:`${s.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:26, flexShrink:0 }}>{s.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:3 }}>
                    <div style={{ fontFamily:st.heading, fontSize:16, fontWeight:700, color:st.dark }}>{s.label}</div>
                    {(s.id !== "timeline-era" && s.id !== "timeline-maps" && s.id !== "timeline-books" && s.id !== "timeline-archaeology") && <span style={{ fontFamily:st.ui, fontSize:9, color:st.light, background:st.divider, borderRadius:4, padding:"2px 6px", fontWeight:700, textTransform:"uppercase" }}>Soon</span>}
                  </div>
                  <div style={{ fontFamily:st.ui, fontSize:12, color:st.muted, marginBottom:4 }}>{s.sub}</div>
                  <div style={{ fontFamily:st.body, fontSize:12, color:st.light, lineHeight:1.5, fontStyle:"italic" }}>{s.desc}</div>
                </div>
                {(s.id === "timeline-era" || s.id === "timeline-maps" || s.id === "timeline-books" || s.id === "timeline-archaeology") && <div style={{ color:st.light, flexShrink:0 }}><ChevIcon /></div>}
              </button>
            ))}
          </div>

          {/* Featured verse */}
          <div style={{ marginTop:24, background:st.headerGradient, borderRadius:16, padding:"22px 20px", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:st.body, fontSize:15, color:st.headerText, fontStyle:"italic", lineHeight:1.8, marginBottom:8 }}>
                "Known unto God are all his works from the beginning of the world."
              </div>
              <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700, letterSpacing:"0.05em" }}>Acts 15:18</div>
            </div>
          </div>

        </div>
      </div>
    );
  };

  const TimelineBar = () => {
    if (!timelineEras.length) return null;
    return (
      <div style={{ overflowX:"auto", WebkitOverflowScrolling:"touch", margin:"0 -14px", padding:"0 14px" }}>
        <div style={{ display:"flex", gap:8, paddingBottom:6, minWidth:"max-content" }}>
          {timelineEras.map(era => (
            <div
              key={era.era_key}
              onClick={() => { setTimelineSelectedEra(era); nav("timeline-era-detail"); }}
              style={{
                display:"flex", alignItems:"center", gap:6,
                background:era.color, borderRadius:50,
                padding:"7px 14px 7px 10px", cursor:"pointer",
                boxShadow:`0 2px 8px ${era.color}55`,
                flexShrink:0, transition:"transform 0.15s, box-shadow 0.15s",
              }}
              onMouseEnter={e => { e.currentTarget.style.transform="scale(1.06)"; e.currentTarget.style.boxShadow=`0 4px 14px ${era.color}88`; }}
              onMouseLeave={e => { e.currentTarget.style.transform="scale(1)"; e.currentTarget.style.boxShadow=`0 2px 8px ${era.color}55`; }}
            >
              <span style={{ fontSize:16, lineHeight:1 }}>{era.icon}</span>
              <span style={{ fontFamily:st.ui, fontSize:11, fontWeight:800, color:"#fff", letterSpacing:0.2, whiteSpace:"nowrap" }}>
                {era.title}
              </span>
              <span style={{ fontFamily:st.ui, fontSize:9, fontWeight:500, color:"rgba(255,255,255,0.75)", whiteSpace:"nowrap" }}>
                {era.year_display}
              </span>
            </div>
          ))}
        </div>
      </div>
    );
  };
    
  const TimelineEras = () => {
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title="Biblical Eras" subtitle="14 periods of redemptive history" onBack={goBack} theme={st} />
        <div style={{ padding:"16px 16px 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Search bar */}
          <div style={{ position:"relative", marginBottom:16 }}>
            <input
              value={timelineSearchQuery}
              onChange={e => {
                setTimelineSearchQuery(e.target.value);
                if (e.target.value.length > 0 && !timelineSearchActive) {
                  setTimelineSearchActive(true);
                  loadAllTimelineEvents();
                }
                if (e.target.value.length === 0) setTimelineSearchActive(false);
              }}
              placeholder="🔍 Search events, figures, books..."
              style={{ width:"100%", padding:"12px 16px", borderRadius:12, border:`1.5px solid ${timelineSearchActive ? st.accent : st.divider}`, fontFamily:st.ui, fontSize:14, color:st.text, outline:"none", background:st.card, boxSizing:"border-box", transition:"border 0.2s" }}
            />
            {timelineSearchQuery.length > 0 && (
              <button onClick={() => { setTimelineSearchQuery(""); setTimelineSearchActive(false); }}
                style={{ position:"absolute", right:12, top:"50%", transform:"translateY(-50%)", background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:16 }}>✕</button>
            )}
          </div>

          {/* Search results */}
          {timelineSearchActive && timelineSearchQuery.length > 0 && (() => {
            const q = timelineSearchQuery.toLowerCase();
            const results = timelineAllEvents.filter(ev =>
              ev.title?.toLowerCase().includes(q) ||
              ev.subtitle?.toLowerCase().includes(q) ||
              ev.description?.toLowerCase().includes(q) ||
              ev.scripture_primary?.toLowerCase().includes(q) ||
              ev.significance?.toLowerCase().includes(q) ||
              ev.historical_context?.toLowerCase().includes(q)
            );
            const eraMap = {};
            timelineEras.forEach(e => { eraMap[e.era_key] = e; });
            return (
              <div style={{ marginBottom:18 }}>
                <div style={{ fontFamily:st.ui, fontSize:11, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:10 }}>
                  {results.length} result{results.length !== 1 ? "s" : ""} for "{timelineSearchQuery}"
                </div>
                {results.length === 0 ? (
                  <div style={{ textAlign:"center", padding:"24px 16px", background:st.card, borderRadius:14, border:`1px solid ${st.divider}`, fontFamily:st.body, fontSize:14, color:st.muted, fontStyle:"italic" }}>
                    No events found. Try a different word.
                  </div>
                ) : results.map(ev => {
                  const era = eraMap[ev.era_key];
                  return (
                    <div key={ev.id}
                      onClick={() => { if (era) { setTimelineSelectedEra(era); setTimelineExpandedEvent(ev.id); setTimelineSearchQuery(""); setTimelineSearchActive(false); loadTimelineEvents(era.era_key); nav("timeline-era-detail"); } }}
                      style={{ background:st.card, borderRadius:12, padding:"14px 16px", marginBottom:8, border:`1px solid ${era?.color}33`, borderLeft:`4px solid ${era?.color || st.accent}`, cursor:"pointer", transition:"all 0.15s" }}>
                      <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4, flexWrap:"wrap" }}>
                        <span style={{ fontSize:18 }}>{ev.icon}</span>
                        <span style={{ fontFamily:st.heading, fontSize:14, fontWeight:700, color:st.dark }}>{ev.title}</span>
                        {ev.is_featured && <span style={{ fontFamily:st.ui, fontSize:8, fontWeight:800, color:"#fff", background:era?.color, borderRadius:4, padding:"2px 6px" }}>★ Key</span>}
                      </div>
                      <div style={{ fontFamily:st.ui, fontSize:10, color:era?.color, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.04em", marginBottom:3 }}>{era?.title} · {ev.year_display}</div>
                      {ev.description && <div style={{ fontFamily:st.body, fontSize:12.5, color:st.muted, fontStyle:"italic", lineHeight:1.5, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>{ev.description}</div>}
                    </div>
                  );
                })}
              </div>
            );
          })()}

          {/* Era colour strip */}
          <div style={{ display:"flex", borderRadius:10, overflow:"hidden", marginBottom:18, height:8 }}>
            {timelineEras.map((era, i) => (
              <div key={i} style={{ flex:1, background:era.color, cursor:"pointer" }}
                onClick={() => { setTimelineSelectedEra(era); setTimelineExpandedEvent(null); nav("timeline-era-detail"); }}/>
            ))}
          </div>

          {/* Visual timeline bar */}
          {timelineEras.length > 0 && (
            <div style={{
              background:st.card, borderRadius:14, padding:"14px 14px 10px",
              marginBottom:18, border:`1px solid ${st.border}`,
              boxShadow:"0 2px 8px rgba(0,0,0,0.06)"
            }}>
              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.muted, letterSpacing:1, textTransform:"uppercase", marginBottom:10 }}>
                ← Tap an era to explore →
              </div>
              <TimelineBar />
            </div>
          )}

          {timelineLoading ? <Spinner t={st} /> : (
            <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
              {timelineEras.map(era => (
                <button key={era.era_key}
                  onClick={() => { setTimelineSelectedEra(era); setTimelineExpandedEvent(null); nav("timeline-era-detail"); }}
                  style={{ width:"100%", background:st.card, border:`1px solid ${st.divider}`, borderRadius:16, padding:"16px", cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", borderLeft:`4px solid ${era.color}`, transition:"all 0.15s" }}>
                  <div style={{ width:50, height:50, borderRadius:13, background:`${era.color}22`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:24, flexShrink:0 }}>{era.icon}</div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div style={{ fontFamily:st.heading, fontSize:16, fontWeight:700, color:st.dark, marginBottom:2 }}>{era.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700, marginBottom:3, textTransform:"uppercase", letterSpacing:"0.04em" }}>{era.year_display}</div>
                    <div style={{ fontFamily:st.body, fontSize:12.5, color:st.muted, lineHeight:1.5, fontStyle:"italic" }}>{era.subtitle}</div>
                    <div style={{ marginTop:6, display:"flex", alignItems:"center", gap:8 }}>
                      {era.event_count > 0 && (
                        <span style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:era.color, background:`${era.color}15`, borderRadius:5, padding:"2px 8px" }}>
                          {era.event_count} event{era.event_count !== 1 ? "s" : ""}
                        </span>
                      )}
                    </div>
                  </div>
                  <div style={{ color:st.light, flexShrink:0 }}><ChevIcon /></div>
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  const TimelineEraDetail = () => {
    if (!timelineSelectedEra) return null;
    const era = timelineSelectedEra;
    const allEvents = timelineEvents;
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title={era.title} subtitle={era.year_display} onBack={goBack} theme={st} />
        <div style={{ padding:"0 0 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Era hero banner */}
          <div style={{ background:`linear-gradient(165deg, #2D1B4E 0%, ${era.color}99 100%)`, padding:"28px 20px", textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:`radial-gradient(ellipse at 50% 30%, ${era.color}44, transparent 65%)` }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:48, marginBottom:8 }}>{era.icon}</div>
              <div style={{ fontFamily:st.heading, fontSize:22, fontWeight:700, color:"#fff", marginBottom:4 }}>{era.title}</div>
              <div style={{ fontFamily:st.ui, fontSize:13, color:"rgba(255,255,255,0.75)", fontWeight:700, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:10 }}>{era.year_display}</div>
              <div style={{ fontFamily:st.body, fontSize:13, color:"rgba(255,255,255,0.75)", lineHeight:1.7, fontStyle:"italic", maxWidth:360, margin:"0 auto" }}>{era.subtitle}</div>
            </div>
          </div>

          <div style={{ padding:"16px 16px 0" }}>

            {/* Key verse */}
            {era.key_verse && (
              <div style={{ background:`${era.color}11`, border:`1px solid ${era.color}44`, borderRadius:14, padding:"16px 18px", marginBottom:16, borderLeft:`3px solid ${era.color}` }}>
                <div style={{ fontFamily:st.body, fontSize:14, color:st.text, fontStyle:"italic", lineHeight:1.7, marginBottom:6 }}>"{era.key_verse}"</div>
                <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700 }}>{era.key_verse_ref}</div>
              </div>
            )}

            {/* Description */}
            <div style={{ background:st.card, borderRadius:14, padding:"16px 18px", border:`1px solid ${st.divider}`, marginBottom:16 }}>
              <Label icon="📋" t={st}>Overview</Label>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.8 }}>{era.description}</div>
            </div>

            {/* Key figures */}
            {era.key_figures?.length > 0 && (
              <div style={{ marginBottom:16 }}>
                <Label icon="👤" t={st} color={st.muted}>Key Figures</Label>
                <div style={{ display:"flex", flexWrap:"wrap", gap:8 }}>
                  {era.key_figures.map(f => (
                    <span key={f} style={{ background:`${era.color}18`, color:era.color, fontFamily:st.ui, fontSize:12, fontWeight:700, padding:"5px 12px", borderRadius:20, border:`1px solid ${era.color}33` }}>{f}</span>
                  ))}
                </div>
              </div>
            )}

            {/* Key books */}
            {era.key_books?.length > 0 && (
              <div style={{ marginBottom:18 }}>
                <Label icon="📖" t={st} color={st.muted}>Key Books</Label>
                <div style={{ display:"flex", flexWrap:"wrap", gap:6 }}>
                  {era.key_books.map(b => (
                    <span key={b} style={{ background:st.accentLight, color:st.accent, fontFamily:st.ui, fontSize:11, fontWeight:600, padding:"4px 10px", borderRadius:6, border:`1px solid ${st.accentBorder}` }}>{b}</span>
                  ))}
                </div>
              </div>
            )}

            {/* Events */}
            <Label icon="📅" t={st} color={st.muted}>Events in This Era</Label>
            {timelineEventsLoading ? <Spinner t={st} /> : (
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {allEvents.map(event => {
                  const isExpanded = timelineExpandedEvent === event.id;
                  return (
                    <div key={event.id} style={{ background:event.is_featured ? `${era.color}09` : st.card, borderRadius:14, border:`1px solid ${isExpanded ? era.color+'66' : event.is_featured ? era.color+'44' : st.divider}`, overflow:"hidden", boxShadow:isExpanded?`0 2px 12px ${era.color}22`:event.is_featured?`0 2px 8px ${era.color}22`:"0 1px 3px rgba(0,0,0,0.04)", transition:"all 0.2s" }}>

                      {/* Event header — always visible */}
                      <button onClick={() => setTimelineExpandedEvent(isExpanded ? null : event.id)}
                        style={{ width:"100%", background:"transparent", border:"none", padding:"14px 16px", cursor:"pointer", textAlign:"left", display:"flex", alignItems:"flex-start", gap:12 }}>
                        <div style={{ width:40, height:40, borderRadius:10, background:`${era.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:20, flexShrink:0, marginTop:2 }}>{event.icon}</div>
                        <div style={{ flex:1, minWidth:0 }}>
                          <div style={{ display:"flex", alignItems:"center", gap:6, flexWrap:"wrap", marginBottom:3 }}>
                            <div style={{ fontFamily:st.heading, fontSize:15, fontWeight:700, color:st.dark }}>{event.title}</div>
                            {event.is_featured && <span style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:"#fff", background:`linear-gradient(135deg, ${era.color}, ${era.color}cc)`, borderRadius:6, padding:"3px 8px", textTransform:"uppercase", letterSpacing:"0.05em", boxShadow:`0 2px 6px ${era.color}55` }}>★ Key Event</span>}
                          </div>
                          {event.subtitle && <div style={{ fontFamily:st.body, fontSize:12, color:st.muted, fontStyle:"italic", marginBottom:3 }}>{event.subtitle}</div>}
                          <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700 }}>{event.year_display}</div>
                        </div>
                        <div style={{ color:isExpanded?era.color:st.light, flexShrink:0, transform:isExpanded?"rotate(90deg)":"rotate(0deg)", transition:"transform 0.2s", marginTop:4 }}><ChevIcon /></div>
                      </button>

                      {/* Expanded content */}
                      {isExpanded && (
                        <div style={{ padding:"0 16px 16px", borderTop:`1px solid ${era.color}22` }}>

                          {event.scripture_primary && (
                            <div style={{ background:`${era.color}0D`, borderRadius:10, padding:"12px 14px", marginBottom:12, marginTop:12, borderLeft:`3px solid ${era.color}` }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:era.color, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:4 }}>📖 Scripture</div>
                              <div style={{ fontFamily:st.heading, fontSize:14, fontWeight:700, color:st.dark }}>{event.scripture_primary}</div>
                            </div>
                          )}

                          {event.description && (
                            <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.8, marginBottom:12 }}>{event.description}</div>
                          )}

                          {event.historical_context && (
                            <div style={{ background:st.accentLight, borderRadius:10, padding:"12px 14px", marginBottom:10, border:`1px solid ${st.accentBorder}` }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.accent, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>🏛️ Historical Context</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.historical_context}</div>
                            </div>
                          )}

                          {event.archaeological_note && (
                            <div style={{ background:"rgba(27,122,110,0.06)", borderRadius:10, padding:"12px 14px", marginBottom:10, border:"1px solid rgba(27,122,110,0.15)" }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:"#1B7A6E", textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>⛏️ Archaeological Note</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.archaeological_note}</div>
                            </div>
                          )}

                          {event.significance && (
                            <div style={{ background:"rgba(212,168,83,0.08)", borderRadius:10, padding:"12px 14px", border:"1px solid rgba(212,168,83,0.2)" }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:"#B8860B", textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>✨ Why This Matters</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.significance}</div>
                            </div>
                          )}

                        </div>
                      )}
                    </div>
                  );
                })}
                {allEvents.length === 0 && !timelineEventsLoading && (
                  <div style={{ textAlign:"center", padding:30, fontFamily:st.body, fontSize:14, color:st.muted, fontStyle:"italic" }}>Events coming soon for this era.</div>
                )}
                            </div>
            )}
          </div>

          {/* Era navigation — prev / next */}
          {(() => {
            const idx = timelineEras.findIndex(e => e.era_key === era.era_key);
            const prev = idx > 0 ? timelineEras[idx - 1] : null;
            const next = idx < timelineEras.length - 1 ? timelineEras[idx + 1] : null;
            if (!prev && !next) return null;
            return (
              <div style={{ display:"flex", gap:10, padding:"20px 16px 8px", borderTop:`1px solid ${st.divider}`, marginTop:8 }}>
                {prev ? (
                  <div
                    onClick={() => { setTimelineSelectedEra(prev); loadTimelineEvents(prev.era_key); }}
                    style={{ flex:1, background:st.card, border:`1px solid ${prev.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", borderLeft:`4px solid ${prev.color}` }}
                  >
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>← Previous</div>
                    <div style={{ fontSize:18, marginBottom:2 }}>{prev.icon}</div>
                    <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{prev.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:prev.color, fontWeight:600, marginTop:2 }}>{prev.year_display}</div>
                  </div>
                ) : <div style={{ flex:1 }} />}
                {next ? (
                  <div
                    onClick={() => { setTimelineSelectedEra(next); loadTimelineEvents(next.era_key); }}
                    style={{ flex:1, background:st.card, border:`1px solid ${next.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", textAlign:"right", borderRight:`4px solid ${next.color}` }}
                  >
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>Next →</div>
                    <div style={{ fontSize:18, marginBottom:2 }}>{next.icon}</div>
                    <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{next.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:next.color, fontWeight:600, marginTop:2 }}>{next.year_display}</div>
                  </div>
                ) : <div style={{ flex:1 }} />}
              </div>
            );
          })()}

        </div>
      </div>
    );
  };

  // ═══ BOTTOM NAV ═══
  const showNav = !["verse","verses","hebrew-lesson","hebrew-practice","greek-lesson","greek-practice"].includes(view);
  const navItems = [
    { id:"home", label:"Home", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> },
    { id:"bible", label:"Bible", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg> },
    { id:"learn", label:"Learn", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg> },
    { id:"journal", label:"Journal", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="12" y1="18" x2="12" y2="12"/><line x1="9" y1="15" x2="15" y2="15"/></svg> },
    { id:"account", label:"Account", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg> },
  ];

  // ═══ RENDER ═══
  return (
    <div style={{ maxWidth:640,margin:"0 auto",transition:"opacity 0.12s ease",opacity:fade?1:0,minHeight:"100vh",paddingBottom:showNav?68:0 }}>
      <style>{`.pressable{transition:background 0.15s,transform 0.1s!important}.pressable:hover{background:rgba(0,0,0,0.03)!important}.pressable:active{background:rgba(0,0,0,0.07)!important;transform:scale(0.985)}@keyframes stoneShimmer{0%{background-position:250% 0}50%{background-position:-50% 0}100%{background-position:250% 0}}`}</style>
      {view === "home" && <HomeView />}
      {view === "search" && <BibleSearch nav={nav} ht={ht} />}
      {view === "books" && Books()}
      {view === "chapter" && Chapters()}
      {view === "verses" && VerseList()}
      {view === "verse" && VerseStudy()}
      {view === "highlights" && Highlights()}
      {view === "account" && <AccountView />}
      {view === "learn-home" && LearnHome()}
      {view === "journal-home" && JournalHome()}
      {view.startsWith("hebrew-") && <HebrewView />}
      {view.startsWith("greek-") && <GreekView />}
      {view === "timeline-home" && TimelineHome()}
      {view === "timeline-maps" && <TimelineMaps nav={nav} darkMode={darkMode} />}
      {view === "timeline-books" && <BibleBookTimeline nav={nav} darkMode={darkMode} />}
      {view === "prophecy-home" && <ProphecyFulfilment nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "timeline-archaeology" && <ArchaeologyCards nav={nav} darkMode={darkMode} />}
      {view === "apologetics-home" && <Apologetics nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "reading-plans-home" && <ReadingPlans nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "kids-curriculum-home" && <KidsCurriculum nav={nav} darkMode={darkMode} />}
      {view === "timeline-era" && TimelineEras()}
      {view === "timeline-era-detail" && TimelineEraDetail()}

      {/* BOTTOM NAV */}
      {showNav && (
        <div style={{ position:"fixed",bottom:0,left:0,right:0,zIndex:50,background:ht.card,borderTop:`1px solid ${ht.divider}`,boxShadow:"0 -2px 12px rgba(0,0,0,0.06)" }}>
          <div style={{ maxWidth:640,margin:"0 auto",display:"flex",justifyContent:"space-around",alignItems:"center",padding:"6px 0 10px" }}>
            {navItems.map(item => {
              const isActive =
                  (item.id === "home" && view === "home") ||
                  (item.id === "bible" && ["books","chapter","verses","verse"].includes(view)) ||
                  (item.id === "learn" && ["learn-home","hebrew-home","hebrew-lesson","hebrew-practice","hebrew-reading-home","hebrew-reading","hebrew-grammar-home","hebrew-grammar-lesson","greek-home","greek-lesson","greek-practice","greek-reading-home","greek-reading","greek-grammar-home","greek-grammar-lesson","timeline-home","timeline-era","timeline-era-detail","timeline-maps","timeline-books","timeline-archaeology","prophecy-home","apologetics-home","reading-plans-home"].includes(view)) ||
                  (item.id === "journal" && ["journal-home","highlights"].includes(view)) ||
                  (item.id === "account" && view === "account");
              return (
                <button key={item.id} onClick={() => {
                  if (item.id === "bible") { const bibleViews = ["books","chapter","verses","verse"]; if (bibleViews.includes(view)) { nav("books", { testament: testament || "OT" }); } else { try { const lr = JSON.parse(localStorage.getItem("lastRead")); if (lr?.book && lr?.chapter && lr?.verse) { nav("verse", { testament:lr.testament, book:lr.book, chapter:lr.chapter, verse:lr.verse }); } else { nav("books", { testament: testament || "OT" }); } } catch { nav("books", { testament: testament || "OT" }); } } }
                  else if (item.id === "learn") nav("learn-home");
                  else if (item.id === "journal") { if (user) { setTab("highlights"); nav("journal-home"); } else nav("account"); }
                  else nav(item.id);
                }} style={{ display:"flex",flexDirection:"column",alignItems:"center",gap:1,background:"none",border:"none",cursor:"pointer",padding:"4px 6px",color:isActive?ht.accent:ht.muted,transition:"all 0.18s ease",opacity:isActive?1:0.65 }}>
                  <div style={{ display:"flex",flexDirection:"column",alignItems:"center",gap:2,padding:"4px 14px 3px",borderRadius:20,background:isActive?`${ht.accent}18`:"transparent",transition:"background 0.18s ease" }}>
                    <div style={{ transform:isActive?"scale(1.08)":"scale(1)",transition:"transform 0.15s" }}>{item.icon}</div>
                  </div>
                  <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:isActive?700:500,letterSpacing:"0.02em" }}>{item.label}</span>
                </button>
              );
            })}
          </div>
        </div>
      )}

      {/* DONATE MODAL */}
      {donateModal && (
        <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
          <div style={{ background:ht.bg,borderRadius:20,padding:"28px 22px",width:"100%",maxWidth:420,maxHeight:"90vh",overflow:"auto",position:"relative" }}>
            <button onClick={() => setDonateModal(false)} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
            <div style={{ textAlign:"center",marginBottom:22 }}>
              <div style={{fontSize:40,marginBottom:8}}>❤️</div>
              <h3 style={{ fontFamily:ht.heading,fontSize:24,color:ht.dark,margin:0 }}>Support the Ministry</h3>
              <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"8px 0 0",lineHeight:1.6 }}>Every feature is free. Your generosity helps us keep building.</p>
            </div>

            <div style={{background:ht.card,borderRadius:12,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18}}>
              <div style={{fontFamily:ht.body,fontSize:14,color:ht.text,lineHeight:1.75,fontStyle:"italic",textAlign:"center"}}>
                "Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over."
              </div>
              <div style={{fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",marginTop:4}}>— Luke 6:38 (KJV)</div>
            </div>

            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:18,textAlign:"center"}}>
              Every verse, every word study, every tool — completely free. Your generosity helps us keep building and sharing God's Word with the world.
            </div>

            {/* Donation amounts */}
            <div style={{display:"flex",flexDirection:"column",gap:8}}>
              {[
                {amount:"AED 10",label:"Plant a seed",icon:"🌱"},
                {amount:"AED 20",label:"Light a lamp",icon:"🕯️"},
                {amount:"AED 30",label:"Support a chapter",icon:"📖"},
                {amount:"AED 50",label:"Support a book",icon:"📚"},
                {amount:"AED 100",label:"A generous blessing",icon:"🙏"},
              ].map((d,i) => (
                <a key={i} href={`https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200`} target="_blank" rel="noopener noreferrer"
                  style={{
                    width:"100%",padding:"14px 18px",borderRadius:12,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",justifyContent:"space-between",
                    background:i===3?"linear-gradient(135deg,#D4A853,#B8860B)":ht.card,
                    border:i===3?"none":`1.5px solid ${ht.divider}`,
                    color:i===3?"#fff":ht.dark,
                    boxShadow:i===3?"0 4px 15px rgba(212,168,83,0.3)":"none",
                    textDecoration:"none",boxSizing:"border-box"
                  }}>
                  <div style={{display:"flex",alignItems:"center",gap:10}}>
                    <span style={{fontSize:20}}>{d.icon}</span>
                    <div>
                      <div style={{fontFamily:ht.heading,fontSize:15,fontWeight:700}}>{d.label}</div>
                    </div>
                  </div>
                  <div style={{fontFamily:ht.heading,fontSize:20,fontWeight:800}}>{d.amount}</div>
                </a>
              ))}
            </div>

            <div style={{textAlign:"center",marginTop:16}}>
              <a href={`https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200`} target="_blank" rel="noopener noreferrer"
                style={{fontFamily:ht.ui,fontSize:13,color:ht.accent,fontWeight:600,textDecoration:"none"}}>
                Or enter a custom amount →
              </a>
            </div>

            <div style={{textAlign:"center",marginTop:12,fontFamily:ht.ui,fontSize:11,color:ht.light}}>
              Secure payment via Stripe · Tax-deductible where applicable
            </div>
          </div>
        </div>
      )}

      {/* PRAYER JOURNAL MODAL */}
      {prayerModal && (
        <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.5)",zIndex:100,display:"flex",alignItems:"flex-end",justifyContent:"center" }}>
          <div style={{ background:ht.bg,borderRadius:"20px 20px 0 0",padding:"24px 20px 32px",width:"100%",maxWidth:640,maxHeight:"85vh",overflow:"auto" }}>
            <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:18 }}>
              <h3 style={{ fontFamily:ht.heading,fontSize:22,color:ht.dark,margin:0 }}>🙏 Prayer Journal</h3>
              <button onClick={() => setPrayerModal(false)} style={{ background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
            </div>
            <div style={{ background:ht.card,borderRadius:14,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18 }}>
              <input key="prayer-title" value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder={currentVerse ? `Prayer for ${book} ${chapter}:${verse}` : "Prayer title"} style={{ width:"100%",padding:"10px 0",border:"none",fontFamily:ht.heading,fontSize:16,color:ht.dark,outline:"none",background:"transparent" }} />
              <textarea key="prayer-text" value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width:"100%",padding:"8px 0",border:"none",fontFamily:ht.body,fontSize:14,color:ht.text,outline:"none",background:"transparent",resize:"vertical",lineHeight:1.7 }} />
              {currentVerse && <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4 }}>Linked to: {book} {chapter}:{verse}</div>}
              <button onClick={addPrayer} disabled={!prayerText.trim()} style={{ marginTop:10,padding:"10px 20px",borderRadius:8,border:"none",background:prayerText.trim()?ht.accent:ht.divider,color:"#fff",fontFamily:ht.ui,fontSize:13,fontWeight:700,cursor:prayerText.trim()?"pointer":"default" }}>Add Prayer</button>
            </div>
            {prayerLoading ? <Spinner t={ht} /> : prayers.length === 0 ? (
              <div style={{ textAlign:"center",padding:30,fontFamily:ht.body,fontSize:15,color:ht.muted,fontStyle:"italic" }}>Your prayers will appear here</div>
            ) : prayers.map(p => (
              <div key={p.id} style={{ background:ht.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${p.is_answered?'#7ED4AD44':ht.divider}`,marginBottom:8,borderLeft:`3px solid ${p.is_answered?'#7ED4AD':ht.accent}` }}>
                <div style={{ display:"flex",justifyContent:"space-between",alignItems:"flex-start" }}>
                  <div style={{ flex:1 }}>
                    <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:600,color:ht.dark }}>{p.title}</div>
                    {p.book_name && <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.accent,marginTop:2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                    <div style={{ fontFamily:ht.body,fontSize:13.5,color:ht.text,lineHeight:1.65,marginTop:6 }}>{p.prayer_text}</div>
                    <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                  </div>
                  <div style={{ display:"flex",gap:6,flexShrink:0,marginLeft:10 }}>
                    <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding:"5px 10px",borderRadius:6,border:`1px solid ${p.is_answered?'#7ED4AD':ht.divider}`,background:p.is_answered?'#7ED4AD22':'transparent',fontFamily:ht.ui,fontSize:10,fontWeight:700,color:p.is_answered?'#2E7D5B':ht.muted,cursor:"pointer" }}>
                      {p.is_answered ? "✓ Answered" : "Mark Answered"}
                    </button>
                    <button onClick={() => deletePrayer(p.id)} style={{ padding:"5px 8px",borderRadius:6,border:`1px solid ${ht.divider}`,background:"transparent",fontFamily:ht.ui,fontSize:10,color:"#E8625C",cursor:"pointer" }}>✕</button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}

export default function StudyBible() {
  return (
    <AppProvider>
      <StudyBibleContent />
    </AppProvider>
  );
}
