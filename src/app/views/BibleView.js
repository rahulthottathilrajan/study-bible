"use client";
import { useState, useEffect, useRef } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, HIGHLIGHT_COLORS, BIBLE_TRANSLATIONS } from "../constants";
import { ChevIcon, Badge, Label, Card, Spinner } from "../components/ui";
import Header from "../components/Header";

export default function BibleView() {
  const {
    view, book, chapter, verse, setVerse, tab, setTab, loading,
    testament, fontSize, setFontSize, FS, dbChapters, collapsed, setCollapsed,
    booksCollapsed, setBooksCollapsed, overviewOpen, setOverviewOpen,
    chapterMeta, verses, wordStudies, crossRefs,
    user, userNote, savedNote, noteLoading, highlight, shareCopied, communityNotes,
    setPrayerModal, setPrayerTitle, setPrayerText, noteRef,
    isOT, currentVerse, verseNums, t, ht, darkMode, bookInfo,
    saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage, nav, goBack,
    chapterReads, markChapterRead, quizScores, bibleTranslation,
  } = useApp();

  const [showColors, setShowColors] = useState(false);
  const verseScrollRef = useRef(null);
  const currentTransDef = BIBLE_TRANSLATIONS.find(tr => tr.id === bibleTranslation);
  const isRtl = currentTransDef?.rtl || false;
  const rtlStyle = isRtl ? { direction: "rtl", textAlign: "right" } : {};

  // Reset color picker when verse changes
  useEffect(() => { setShowColors(false); }, [verse]);

  // Auto-scroll verse strip — works on both mount and verse change
  const scrollVerseIntoView = (behavior = "smooth") => {
    const el = verseScrollRef.current;
    if (!el) return;
    const active = el.querySelector('[data-active="true"]');
    if (!active) return;
    const left = active.offsetLeft - el.offsetWidth / 2 + active.offsetWidth / 2;
    el.scrollTo({ left, behavior });
  };
  useEffect(() => {
    // Double-raf ensures DOM has fully laid out after React render
    const raf = requestAnimationFrame(() => {
      requestAnimationFrame(() => scrollVerseIntoView("smooth"));
    });
    return () => cancelAnimationFrame(raf);
  }, [verse, view]); // eslint-disable-line react-hooks/exhaustive-deps

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
                            {chapterReads.some(r => r.book_name === book && r.chapter_number === ch) && <span style={{ fontSize:11,color:"#22c55e",fontWeight:700 }}>✓</span>}
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


          {bibleTranslation !== "kjv" && currentTransDef && (
            <div style={{display:"flex",alignItems:"center",gap:6,padding:"6px 10px",background:t.accentLight,borderRadius:8,marginBottom:10,border:`1px solid ${t.accentBorder}`}}>
              <span style={{fontSize:12}}>🌐</span>
              <span style={{fontFamily:t.ui,fontSize:11,fontWeight:600,color:t.accent}}>{currentTransDef.name}</span>
              <span style={{fontFamily:t.ui,fontSize:10,color:t.muted}}>— Study notes in English (KJV)</span>
            </div>
          )}

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
          {user && (
            (() => {
              const isRead = chapterReads.some(r => r.book_name === book && r.chapter_number === chapter);
              const chapterKey = `${book}-${chapter}`;
              const qScores = quizScores[chapterKey] || [];
              const bestPct = qScores.length > 0 ? Math.max(...qScores.map(s => s.percentage)) : null;
              return (
                <>
                  <button onClick={() => { if (!isRead) markChapterRead(book, chapter); }}
                    style={{
                      width:"100%",padding:"10px 14px",borderRadius:10,marginBottom:10,
                      border:`1px solid ${isRead ? "#22c55e" : t.accentBorder}`,
                      background:isRead ? "rgba(34,197,94,0.08)" : t.accentLight,
                      fontFamily:t.ui,fontSize:13,fontWeight:700,cursor:isRead?"default":"pointer",
                      color:isRead ? "#22c55e" : t.accent,
                      display:"flex",alignItems:"center",justifyContent:"center",gap:8,
                      transition:"all 0.2s",
                    }}>
                    {isRead ? "✓ Chapter Read" : "📖 Mark Chapter as Read"}
                  </button>
                  <button onClick={() => nav("quiz-intro", { book, chapter })}
                    style={{
                      width:"100%",padding:"10px 14px",borderRadius:10,marginBottom:10,
                      border:`1px solid ${t.accentBorder}`,
                      background:t.accentLight,
                      fontFamily:t.ui,fontSize:13,fontWeight:700,cursor:"pointer",
                      color:t.accent,
                      display:"flex",alignItems:"center",justifyContent:"center",gap:8,
                      transition:"all 0.2s",
                    }}>
                    📝 Take Quiz
                    {bestPct !== null && (
                      <span style={{
                        fontSize:11,padding:"2px 7px",borderRadius:6,marginLeft:4,
                        background:bestPct >= 70 ? "rgba(34,197,94,0.12)" : "rgba(239,68,68,0.1)",
                        color:bestPct >= 70 ? "#22c55e" : "#ef4444",
                      }}>
                        Best: {bestPct}%
                      </span>
                    )}
                  </button>
                </>
              );
            })()
          )}
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
                  <div style={{fontFamily:t.body,fontSize:FS[fontSize].list,color:t.text,lineHeight:1.65,...rtlStyle}}>{v.kjv_text}</div>
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
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={book} onBack={goBack} hidePrayer /><Spinner t={t} /><div style={{textAlign:"center",fontFamily:t.ui,fontSize:15,color:t.muted}}>Loading...</div></div>;
    if (!currentVerse) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={book} onBack={goBack} hidePrayer /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>📖</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>Loading...</div></div></div>;

    const vWords = wordStudies[String(verse)] || [];
    const vRefs = crossRefs[String(verse)] || [];
    const outline = chapterMeta?.outline ? JSON.parse(chapterMeta.outline) : [];

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={book} onBack={goBack} hidePrayer />
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
          <div style={{
            margin:"12px 0 14px",position:"relative",borderRadius:16,padding:"22px 22px 18px",
            background:highlight?.highlight_color ? `${highlight.highlight_color}15` : `linear-gradient(170deg, ${t.bg}, ${t.card} 40%, ${t.bg} 100%)`,
            border:`1.5px solid ${highlight?.highlight_color ? `${highlight.highlight_color}40` : t.divider}`,
            boxShadow:`inset 0 1px 2px rgba(255,255,255,${darkMode?0.02:0.3}), 0 2px 8px rgba(0,0,0,${darkMode?0.25:0.06})`,
            transition:"background 0.3s,border-color 0.3s",
          }}>
            <Label icon="📖" t={t}>{bibleTranslation === "kjv" ? "KJV Text" : currentTransDef?.name || "Verse Text"}</Label>

            {/* Verse text */}
            <div style={{fontFamily:t.body,fontSize:FS[fontSize].detail,color:t.dark,lineHeight:1.85,padding:"8px 0 12px",...rtlStyle}}>
              <span style={{fontSize:"clamp(22px,7vw,30px)",fontWeight:800,color:t.accent,float:isRtl?"right":"left",lineHeight:0.85,marginRight:isRtl?0:8,marginLeft:isRtl?8:0,marginTop:4,fontFamily:t.heading}}>{verse}</span>
              {currentVerse.kjv_text}
            </div>

            {/* Always-visible action bar — gradient strip with outlined SVG icons */}
            {user && (
              <div style={{background:t.headerGradient,borderRadius:10,padding:"8px 4px",marginTop:8,border:"1px solid rgba(255,255,255,0.08)"}}>
                <div style={{display:"flex",alignItems:"center",justifyContent:"space-evenly"}}>
                  {[
                    { label:"Highlight", active:showColors, onClick:() => setShowColors(c => !c),
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M8 14s1.5 2 4 2 4-2 4-2"/><line x1="9" y1="9" x2="9.01" y2="9"/><line x1="15" y1="9" x2="15.01" y2="9"/></svg>,
                      svgActive:<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" strokeWidth="1.8"><circle cx="12" cy="12" r="10"/></svg> },
                    { label:"Bookmark", active:highlight?.is_bookmarked, onClick:toggleBookmarkHL, activeColor:"#ffd700",
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>,
                      svgActive:<svg width="18" height="18" viewBox="0 0 24 24" fill="#ffd700" stroke="#ffd700" strokeWidth="1.8"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> },
                    { label:"Note", onClick:() => setTab("my"),
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M12 20h9"/><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"/></svg> },
                    { label:"Pray", onClick:() => { setPrayerTitle(`${book} ${chapter}:${verse}`); setPrayerText(""); setPrayerModal(true); },
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="M12 21C12 21 8 16.5 5 12.5C3 9.5 4 6 7 5C9 4.2 11 5 12 7C13 5 15 4.2 17 5C20 6 21 9.5 19 12.5C16 16.5 12 21 12 21Z"/></svg> },
                    { label:shareCopied?"Copied":"Copy", active:shareCopied, onClick:copyVerseText, activeColor:"#22c55e",
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg>,
                      svgActive:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#22c55e" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg> },
                    { label:"Share", onClick:shareVerseImage,
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/></svg> },
                  ].map((a,i) => (
                    <button key={i} onClick={a.onClick}
                      style={{display:"flex",alignItems:"center",justifyContent:"center",width:36,height:36,borderRadius:8,border:"none",background:a.active?"rgba(255,255,255,0.15)":"transparent",color:a.active?(a.activeColor||"rgba(255,255,255,0.95)"):"rgba(255,255,255,0.55)",cursor:"pointer",transition:"all 0.15s",padding:0}}>
                      {a.active && a.svgActive ? a.svgActive : a.svg}
                    </button>
                  ))}
                </div>

                {/* Highlight color picker — expands below */}
                {showColors && (
                  <div style={{display:"flex",gap:7,paddingTop:8,animation:"fadeIn 0.15s ease",alignItems:"center",justifyContent:"center"}}>
                    {HIGHLIGHT_COLORS.map(c => <button key={c} onClick={() => toggleHighlight(c)} style={{width:26,height:26,borderRadius:"50%",background:c,border:highlight?.highlight_color===c?"3px solid rgba(255,255,255,0.9)":`2px solid ${c}88`,cursor:"pointer",transition:"all 0.15s",transform:highlight?.highlight_color===c?"scale(1.15)":"scale(1)"}} />)}
                    {highlight?.highlight_color && <button onClick={() => toggleHighlight(highlight.highlight_color)} style={{fontFamily:t.ui,fontSize:10,color:"rgba(255,255,255,0.5)",background:"none",border:"none",cursor:"pointer",textDecoration:"underline",marginLeft:4}}>Clear</button>}
                  </div>
                )}
              </div>
            )}

            {/* Verse scrubber — notch/slider style */}
            <div style={{marginTop:12,paddingTop:10,borderTop:`1px solid ${t.divider}`}}>
              <div ref={verseScrollRef} style={{position:"relative",overflowX:"auto",WebkitOverflowScrolling:"touch",scrollbarWidth:"none",padding:"6px 0 4px",maskImage:"linear-gradient(90deg, transparent, #000 4%, #000 96%, transparent)",WebkitMaskImage:"linear-gradient(90deg, transparent, #000 4%, #000 96%, transparent)"}}>
                {/* Track line */}
                <div style={{position:"absolute",top:"50%",left:0,right:0,height:2,background:t.divider,transform:"translateY(-50%)",pointerEvents:"none"}} />
                {/* Verse dots/notches */}
                <div style={{display:"flex",alignItems:"center",gap:0,position:"relative"}}>
                  {verseNums.map(v => {
                    const isActive = v === verse;
                    return (
                      <button key={v} data-active={isActive?"true":undefined} onClick={()=>{setVerse(v);setTab("study")}}
                        style={{display:"flex",flexDirection:"column",alignItems:"center",justifyContent:"center",border:"none",background:"transparent",cursor:"pointer",padding:isActive?"0 3px":"0 2px",flexShrink:0,transition:"all 0.2s",position:"relative"}}>
                        {/* Dot or raised notch */}
                        <div style={{
                          width:isActive?30:8, height:isActive?30:8, borderRadius:isActive?15:4,
                          background:isActive?`linear-gradient(135deg, ${t.accent}, ${t.tabActive})`:t.muted+"55",
                          display:"flex",alignItems:"center",justifyContent:"center",
                          transition:"all 0.2s",
                          boxShadow:isActive?`0 2px 8px ${t.accent}44`:"none",
                        }}>
                          {isActive && <span style={{fontFamily:t.heading,fontSize:12,fontWeight:800,color:"#fff",lineHeight:1}}>{v}</span>}
                        </div>
                        {/* Number label below for every 5th verse (or first/last) */}
                        {!isActive && (v % 5 === 0 || v === 1 || v === verseNums[verseNums.length-1]) && (
                          <span style={{fontFamily:t.ui,fontSize:8,color:t.muted,marginTop:2,lineHeight:1}}>{v}</span>
                        )}
                      </button>
                    );
                  })}
                </div>
              </div>
            </div>
          </div>

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

        </div>
      </div>
    );
  };


  if (view === "books") return <Books />;
  if (view === "chapter") return <Chapters />;
  if (view === "verses") return <VerseList />;
  if (view === "verse") return <VerseStudy />;
  return null;
}
