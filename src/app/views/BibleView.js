"use client";
import { useState, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, HIGHLIGHT_COLORS, BIBLE_TRANSLATIONS } from "../constants";
import { ChevIcon, Badge, Label, Card, Spinner } from "../components/ui";
import Header from "../components/Header";
import AudioPlayer from "../components/AudioPlayer";

export default function BibleView() {
  const {
    view, book, chapter, verse, setVerse, tab, setTab, loading,
    testament, fontSize, setFontSize, FS, dbChapters, collapsed, setCollapsed,
    booksCollapsed, setBooksCollapsed, overviewOpen, setOverviewOpen,
    chapterMeta, verses, wordStudies, crossRefs,
    user, userNote, savedNote, noteLoading, highlight, shareCopied, communityNotes,
    chapterHighlights, chapterNotes, chapterCommunityNotes,
    setPrayerModal, setPrayerTitle, setPrayerText, noteRef,
    isOT, currentVerse, verseNums, t, ht, darkMode, bookInfo,
    hasVerseId, saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage, nav, goBack,
    chapterReads, markChapterRead, quizScores, bibleTranslation, bp,
    audioPlaying, audioVisible, setAudioPlaying, setAudioVisible,
    listenedChapters,
  } = useApp();

  const [showColors, setShowColors] = useState(false);
  const currentTransDef = BIBLE_TRANSLATIONS.find(tr => tr.id === bibleTranslation);
  const isRtl = currentTransDef?.rtl || false;
  const rtlStyle = isRtl ? { direction: "rtl", textAlign: "right" } : {};

  // Reset color picker when verse changes
  useEffect(() => { setShowColors(false); }, [verse]);

  // ═══ BOOKS ═══
  const Books = () => {
    const books = BIBLE_BOOKS.filter(b => b.testament === testament);
    const cats = {}; books.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return (
      <div style={{ minHeight:"100vh",background:ht.bg }}>
        <Header title="The Holy Scriptures" onBack={goBack} theme={ht} hidePrayer hideUser />
        <div style={{ padding:`20px ${bp.pad}px 40px`,maxWidth:bp.content,margin:"0 auto" }}>

          {/* ── Testament Picker (Parchment Scrolls) ── */}
          <div style={{ display:"flex", gap:12, marginBottom:20 }}>
            {[
              { t:"OT", l:"Old Testament", s:"39 Books", sub:"Genesis — Malachi", o:"בְּרֵאשִׁית", om:"In the Beginning", thm:"garden", icon:"📜" },
              { t:"NT", l:"New Testament", s:"27 Books", sub:"Matthew — Revelation", o:"Καινὴ Διαθήκη", om:"The New Covenant", thm:"ocean", icon:"✝️" },
            ].map(item => {
              const isSel = testament === item.t;
              const st = THEMES[item.thm];
              return (
                <button key={item.t} onClick={() => nav("books",{testament:item.t})}
                  style={{ flex:1, cursor:"pointer", border:"none", background:"transparent", padding:0, display:"flex", flexDirection:"column", filter:`drop-shadow(0 4px 12px rgba(0,0,0,${isSel?0.2:0.1}))`, opacity:isSel?1:0.65, transition:"opacity 0.2s, filter 0.2s" }}>
                  <div style={{ height:18, background:st.headerGradient, borderRadius:"10px 10px 0 0", position:"relative", overflow:"hidden" }}>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"55%", height:6, background:"rgba(255,255,255,0.12)", borderRadius:10 }}/>
                  </div>
                  <div style={{ background:"linear-gradient(180deg,#FEF3D8 0%,#FAE8BB 40%,#FEF3D8 100%)", padding:"14px 8px 12px", borderLeft:`1px solid rgba(180,140,60,0.3)`, borderRight:`1px solid rgba(180,140,60,0.3)`, textAlign:"center", flex:1 }}>
                    <div style={{ fontSize:26, marginBottom:6, filter:"drop-shadow(0 2px 4px rgba(0,0,0,0.2))" }}>{item.icon}</div>
                    <div style={{ fontFamily:ht.heading, fontSize:14, fontWeight:700, color:st.dark, lineHeight:1.3, marginBottom:4 }}>{item.l}</div>
                    <div style={{ width:24, height:2, background:st.accent, borderRadius:2, margin:"0 auto 6px" }}/>
                    <div style={{ fontFamily:ht.ui, fontSize:10, color:st.muted, letterSpacing:"0.02em" }}>{item.s}</div>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:item.t==="OT"?15:12, color:st.accent, fontWeight:700, marginTop:6, direction:item.t==="OT"?"rtl":"ltr", lineHeight:1.4 }}>{item.o}</div>
                    <div style={{ fontFamily:ht.body, fontSize:9.5, color:st.muted, fontStyle:"italic", lineHeight:1.5 }}>{item.om}</div>
                  </div>
                  <div style={{ height:18, background:st.headerGradient, borderRadius:"0 0 10px 10px", position:"relative", overflow:"hidden" }}>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"55%", height:6, background:"rgba(255,255,255,0.12)", borderRadius:10 }}/>
                  </div>
                </button>
              );
            })}
          </div>

          {/* ── Stats ── */}
          <div style={{ display:"flex",justifyContent:"center",marginBottom:16 }}>
            {[{n:"66",l:"Books"},{n:"1,189",l:"Chapters"},{n:"31,102",l:"Verses"}].map((s,i) => (
              <div key={i} style={{ textAlign:"center",flex:1,borderRight:i<2?`1px solid ${ht.divider}`:"none",padding:"0 8px" }}>
                <div style={{ fontFamily:ht.heading,fontSize:18,fontWeight:700,color:ht.dark,letterSpacing:"-0.02em" }}>{s.n}</div>
                <div style={{ fontFamily:ht.ui,fontSize:9,fontWeight:600,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:1 }}>{s.l}</div>
              </div>
            ))}
          </div>

          {/* ── Selected Testament Label ── */}
          <div style={{ fontFamily:ht.ui, fontSize:10, fontWeight:700, color:ht.muted, textTransform:"uppercase", letterSpacing:"0.12em", marginBottom:14, display:"flex", alignItems:"center", gap:8 }}>
            <span>{testament === "OT" ? "📜" : "✝️"}</span> {testament === "OT" ? "Old Testament" : "New Testament"} · {books.length} Books
          </div>

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
                    {catBooks.map((b, bi) => {
                      return (
                        <button key={b.name} className="pressable" onClick={() => nav("chapter",{book:b.name})} style={{ width:"100%",background:"transparent",border:"none",borderBottom:bi<catBooks.length-1?`1px dashed ${ht.divider}`:"none",padding:"12px 16px",cursor:"pointer",textAlign:"left",transition:"background 0.15s" }}>
                          <div style={{ display:"flex",alignItems:"baseline",justifyContent:"space-between",marginBottom:3 }}>
                            <span style={{ fontFamily:ct.heading,fontSize:13,fontWeight:700,color:ht.dark }}>{b.name}</span>
                            <span style={{ fontFamily:ct.ui,fontSize:10,fontWeight:700,color:ct.accent,background:`${ct.accent}15`,borderRadius:10,padding:"2px 8px" }}>{b.chapters} ch</span>
                          </div>
                          <div style={{ fontFamily:"'Times New Roman',serif",fontSize:12,color:ht.light,fontStyle:"italic" }}>{b.original} <span style={{ fontFamily:ct.ui,fontStyle:"normal",fontSize:10,color:ht.muted }}>· {b.meaning}</span></div>
                        </button>
                      );
                    })}
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

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={book} subtitle={`${bookInfo.original} — ${bookInfo.meaning}`} onBack={goBack} />
        <div style={{ padding:`18px ${bp.pad}px 40px`,maxWidth:bp.content,margin:"0 auto" }}>

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
                      const isLast = ci === group.chapters.length - 1;
                      const isRead = chapterReads.some(r => r.book_name === book && r.chapter_number === ch);
                      const isListened = listenedChapters.includes(`${book}:${ch}`);
                      const chKey = `${book}-${ch}`;
                      const qScores = quizScores[chKey] || [];
                      const bestPct = qScores.length > 0 ? Math.max(...qScores.map(s => s.percentage)) : null;
                      return (
                        <button key={ch}
                          className={has?"pressable":""}
                          onClick={() => { if (has) nav("verses",{chapter:ch,verse:null}); }}
                          style={{ width:"100%",display:"flex",alignItems:"center",padding:"12px 14px",background:"transparent",border:"none",borderBottom:isLast ? "none" : `1px dashed ${t.divider}`,cursor:has?"pointer":"default",textAlign:"left",transition:"background 0.15s",gap:12 }}>

                          {/* Chapter number circle */}
                          <div style={{ flexShrink:0,width:34,height:34,borderRadius:"50%",display:"flex",alignItems:"center",justifyContent:"center",
                            background:has ? (isRead ? "#22c55e" : t.accent) : "transparent",
                            border:has ? "none" : `1.5px solid ${t.divider}`,
                            boxShadow:has ? `0 2px 6px ${isRead ? "rgba(34,197,94,0.25)" : `${t.accent}30`}` : "none",
                            position:"relative"
                          }}>
                            {has && isRead ? (
                              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                            ) : (
                              <span style={{ fontFamily:t.heading,fontSize:14,fontWeight:700,color:has ? "#fff" : t.light }}>{ch}</span>
                            )}
                          </div>

                          {/* Two-line layout */}
                          <div style={{ flex:1,minWidth:0 }}>
                            <div style={{ fontFamily:t.ui,fontSize:14,fontWeight:has?600:400,color:has?t.dark:t.light,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis",lineHeight:1.3 }}>
                              {theme || (has ? "Study available" : "Coming soon")}
                            </div>
                            <div style={{ fontFamily:t.ui,fontSize:11,color:t.muted,marginTop:2,opacity:has?1:0.5 }}>
                              {has ? (isRead ? `Ch ${ch} · Completed` : `Ch ${ch} · Study available`) : `Ch ${ch}`}
                            </div>
                          </div>

                          {/* Progress badges */}
                          <div style={{ display:"flex",alignItems:"center",gap:5,flexShrink:0 }}>
                            {bestPct !== null && (
                              <span style={{ fontFamily:t.ui,fontSize:10,fontWeight:700,padding:"2px 6px",borderRadius:6,
                                background:bestPct >= 70 ? "rgba(34,197,94,0.12)" : "rgba(239,68,68,0.1)",
                                color:bestPct >= 70 ? "#22c55e" : "#ef4444"
                              }}>{bestPct}%</span>
                            )}
                            {isListened && <span style={{ fontSize:12,opacity:0.75 }} title="Listened">🎧</span>}
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
        <div style={{ maxWidth:bp.contentWide,margin:"0 auto",padding:`16px ${bp.pad}px 40px` }}>


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
          <div style={{background:t.card,borderRadius:14,border:`1px solid ${t.divider}`,overflow:"hidden",boxShadow:"0 1px 4px rgba(0,0,0,0.04)"}}>
            {verses.map((v, vi) => {
              const hl = chapterHighlights[v.verse_number];
              const nt = chapterNotes[v.verse_number];
              const cn = chapterCommunityNotes[v.verse_number];
              const hlColor = hl?.highlight_color;
              const isBookmarked = hl?.is_bookmarked;
              const hasNote = !!nt;
              const communityCount = cn?.length || 0;
              const isLast = vi === verses.length - 1;
              return (
                <button key={v.verse_number} onClick={() => nav("verse",{verse:v.verse_number,tab:"study"})}
                  style={{
                    width:"100%",background:hlColor ? `${hlColor}08` : "transparent",
                    borderLeft:hlColor ? `3px solid ${hlColor}` : "3px solid transparent",
                    borderRight:"none",borderTop:"none",
                    borderBottom:isLast ? "none" : `1px solid ${t.divider}`,
                    padding:"14px 16px",textAlign:"left",cursor:"pointer",
                    display:"flex",gap:12,alignItems:"flex-start",
                    transition:"all 0.15s",position:"relative"
                  }}>
                  <span style={{
                    fontFamily:t.heading,fontSize:22,fontWeight:800,color:hlColor || t.verseNum,
                    minWidth:28,textAlign:"center",lineHeight:1.2,flexShrink:0
                  }}>{v.verse_number}</span>
                  <div style={{flex:1,minWidth:0}}>
                    <div style={{fontFamily:t.body,fontSize:FS[fontSize].list,color:t.text,lineHeight:1.65,...rtlStyle}}>{v.kjv_text}</div>
                  </div>
                  {(isBookmarked || hasNote || communityCount > 0) && (
                    <div style={{display:"flex",alignItems:"center",gap:4,flexShrink:0,alignSelf:"flex-start",marginTop:2}}>
                      {isBookmarked && <span style={{fontSize:12,color:"#FFD700"}}>★</span>}
                      {hasNote && <span style={{fontSize:11,color:t.muted}}>✏️</span>}
                      {communityCount > 0 && <span style={{fontFamily:t.ui,fontSize:9,color:t.accent,fontWeight:700,background:`${t.accent}12`,borderRadius:4,padding:"1px 4px"}}>{communityCount}</span>}
                    </div>
                  )}
                </button>
              );
            })}
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
        <AudioPlayer />
        <Header title={book} onBack={goBack} hidePrayer />
        <div style={{ maxWidth:bp.contentWide,margin:"0 auto",padding:`0 ${bp.pad}px ${audioVisible?68:40}px` }}>
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
            border:`1.5px solid ${audioPlaying ? t.accent : highlight?.highlight_color ? `${highlight.highlight_color}40` : t.divider}`,
            boxShadow:`inset 0 1px 2px rgba(255,255,255,${darkMode?0.02:0.3}), 0 2px 8px rgba(0,0,0,${darkMode?0.25:0.06})`,
            transition:"background 0.3s,border-color 0.3s",
          }}>
            <div style={{display:"flex",alignItems:"center",justifyContent:"space-between"}}>
              <Label icon="📖" t={t}>{bibleTranslation === "kjv" ? "KJV Text" : currentTransDef?.name || "Verse Text"}</Label>
              <button
                onClick={() => { if (audioPlaying) { setAudioPlaying(false); } else { setAudioVisible(true); setAudioPlaying(true); } }}
                title={audioPlaying ? "Pause" : "Listen to this verse"}
                style={{ display:"flex",alignItems:"center",gap:5,padding:"4px 10px",borderRadius:16,border:`1px solid ${audioPlaying?t.accent:t.accentBorder}`,background:audioPlaying?`${t.accent}15`:"transparent",color:audioPlaying?t.accent:t.muted,cursor:"pointer",transition:"all 0.15s",fontFamily:t.ui,fontSize:11,fontWeight:600 }}>
                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
                  <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"/>
                  <path d="M15.54 8.46a5 5 0 0 1 0 7.07"/>
                  {audioPlaying && <path d="M19.07 4.93a10 10 0 0 1 0 14.14"/>}
                </svg>
                {audioPlaying ? "Playing" : "Listen"}
              </button>
            </div>

            {/* Verse text */}
            <div style={{fontFamily:t.body,fontSize:FS[fontSize].detail,color:t.dark,lineHeight:1.85,padding:"8px 0 12px",...rtlStyle}}>
              <span style={{fontSize:"clamp(22px,7vw,30px)",fontWeight:800,color:t.accent,float:isRtl?"right":"left",lineHeight:0.85,marginRight:isRtl?0:8,marginLeft:isRtl?8:0,marginTop:4,fontFamily:t.heading}}>{verse}</span>
              {currentVerse.kjv_text}
            </div>

            {/* Prev / Next navigation */}
            {(() => { const idx = verseNums.indexOf(verse); const canPrev = idx > 0; const canNext = idx < verseNums.length - 1; return (
            <div style={{display:"flex",alignItems:"center",justifyContent:"space-between",marginTop:6}}>
              <button onClick={() => {if(canPrev){setVerse(verseNums[idx-1]);setTab("study")}}} disabled={!canPrev}
                style={{padding:"5px 10px",borderRadius:16,border:`1px solid ${canPrev?t.accentBorder:"transparent"}`,background:"transparent",fontFamily:t.ui,fontSize:11,fontWeight:700,color:canPrev?t.accent:t.light,cursor:canPrev?"pointer":"default",opacity:canPrev?1:0.35,transition:"all 0.2s"}}>
                ‹ Prev
              </button>
              <span style={{fontFamily:t.ui,fontSize:11,color:t.muted}}>{verse} of {verseNums.length}</span>
              <button onClick={() => {if(canNext){setVerse(verseNums[idx+1]);setTab("study")}}} disabled={!canNext}
                style={{padding:"5px 10px",borderRadius:16,border:`1px solid ${canNext?t.accentBorder:"transparent"}`,background:"transparent",fontFamily:t.ui,fontSize:11,fontWeight:700,color:canNext?t.accent:t.light,cursor:canNext?"pointer":"default",opacity:canNext?1:0.35,transition:"all 0.2s"}}>
                Next ›
              </button>
            </div>
            ); })()}

            {/* Always-visible action bar */}
            {user && (
              <div style={{borderRadius:10,padding:"8px 4px",marginTop:8,background:`${t.accent}0A`,border:`1px solid ${t.accentBorder}`,opacity:hasVerseId?1:0.4,pointerEvents:hasVerseId?"auto":"none"}}>
                {!hasVerseId && <div style={{fontFamily:t.ui,fontSize:10,color:t.muted,textAlign:"center",padding:"4px 0 2px"}}>Features available for seeded chapters</div>}
                <div style={{display:"flex",alignItems:"center",justifyContent:"space-evenly"}}>
                  {[
                    { label:"Highlight", active:showColors && hasVerseId, onClick:() => setShowColors(c => !c),
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="m9 11-6 6v3h9l3-3"/><path d="m22 12-4.6 4.6a2 2 0 0 1-2.8 0l-5.2-5.2a2 2 0 0 1 0-2.8L14 4"/></svg>,
                      svgActive:<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><path d="m9 11-6 6v3h9l3-3"/><path d="m22 12-4.6 4.6a2 2 0 0 1-2.8 0l-5.2-5.2a2 2 0 0 1 0-2.8L14 4"/></svg> },
                    { label:"Bookmark", active:highlight?.is_bookmarked, onClick:toggleBookmarkHL, activeColor:"#ffd700",
                      svg:<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>,
                      svgActive:<svg width="18" height="18" viewBox="0 0 24 24" fill="#ffd700" stroke="#ffd700" strokeWidth="1.8"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg> },
                    { label:"Note", active:tab === "my", onClick:() => setTab("my"),
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
                      style={{display:"flex",alignItems:"center",justifyContent:"center",width:36,height:36,borderRadius:8,border:"none",background:a.active?`${a.activeColor||t.accent}15`:"transparent",color:a.active?(a.activeColor||t.accent):t.muted,cursor:"pointer",transition:"all 0.15s",padding:0}}>
                      {a.active && a.svgActive ? a.svgActive : a.svg}
                    </button>
                  ))}
                </div>

                {/* Highlight color picker — expands below */}
                {showColors && (
                  <div style={{display:"flex",gap:7,paddingTop:8,animation:"fadeIn 0.15s ease",alignItems:"center",justifyContent:"center"}}>
                    {HIGHLIGHT_COLORS.map(c => <button key={c} onClick={() => toggleHighlight(c)} style={{width:26,height:26,borderRadius:"50%",background:c,border:highlight?.highlight_color===c?`3px solid ${t.dark}`:`2px solid ${c}88`,cursor:"pointer",transition:"all 0.15s",transform:highlight?.highlight_color===c?"scale(1.15)":"scale(1)"}} />)}
                    {highlight?.highlight_color && <button onClick={() => toggleHighlight(highlight.highlight_color)} style={{fontFamily:t.ui,fontSize:10,color:t.muted,background:"none",border:"none",cursor:"pointer",textDecoration:"underline",marginLeft:4}}>Clear</button>}
                  </div>
                )}
              </div>
            )}

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
