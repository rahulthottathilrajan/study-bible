"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, HIGHLIGHT_COLORS } from "../constants";
import { ChevIcon, Badge, Label, Card, Btn, Spinner, DBBadge } from "../components/ui";
import Header from "../components/Header";

export default function BibleView() {
  const {
    view, book, chapter, verse, setVerse, tab, setTab, loading, dbLive,
    testament, fontSize, setFontSize, FS, dbChapters, collapsed, setCollapsed,
    booksCollapsed, setBooksCollapsed, overviewOpen, setOverviewOpen,
    chapterMeta, verses, wordStudies, crossRefs,
    user, userNote, savedNote, noteLoading, highlight, shareCopied, communityNotes,
    setPrayerModal, setPrayerTitle, setPrayerText, noteRef,
    isOT, currentVerse, verseNums, curIdx, t, ht, bookInfo,
    saveNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage, nav, goBack,
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


  if (view === "books") return <Books />;
  if (view === "chapter") return <Chapters />;
  if (view === "verses") return <VerseList />;
  if (view === "verse") return <VerseStudy />;
  return null;
}
