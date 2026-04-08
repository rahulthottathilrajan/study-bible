"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, BIBLE_TRANSLATIONS, getBookName, QUIZ_BOOKS } from "../constants"; // CAT_ICONS used in Chapters view
import { ChevIcon, Spinner } from "../components/ui";
import Header from "../components/Header";
import AudioPlayer from "../components/AudioPlayer";
import { SimilarVersesPanel, VerseOverviewCard, VerseStudyPanels, VerseStudyTabs, VerseTextCard } from "./components/BibleStudyShared";
import { useBibleVerseListState } from "./hooks/useBibleVerseListState";
import { useBibleVerseStudyState } from "./hooks/useBibleVerseStudyState";

export default function BibleView() {
  const {
    view, book, chapter, verse, setVerse, tab, setTab, loading,
    testament, fontSize, setFontSize, FS, dbChapters, collapsed, setCollapsed,
    overviewOpen, setOverviewOpen,
    chapterMeta, verses, wordStudies, crossRefs,
    user, userNote, savedNote, noteLoading, highlight, shareCopied, communityNotes,
    chapterHighlights, chapterNotes, chapterCommunityNotes,
    setPrayerModal, setPrayerTitle, setPrayerText, noteRef,
    isOT, currentVerse, verseNums, t, ht, darkMode, bookInfo,
    hasVerseId, saveNote, deleteNote, toggleNotePublic, toggleHighlight, toggleBookmarkHL,
    copyVerseText, shareVerseImage, nav, goBack,
    chapterReads, markChapterRead, quizScores, bibleTranslation, bp,
    audioPlaying, audioVisible, setAudioPlaying, setAudioVisible,
    audioAvailable, audioSource, setAudioSource, audioCurrentVerse, setAudioCurrentVerse,
    audioCurrentWord,
    listenedChapters,
    getChapterFromCache, loadUserDataForChapter, fetchTranslatedVerses,
  } = useApp();

  const currentTransDef = BIBLE_TRANSLATIONS.find(tr => tr.id === bibleTranslation);
  const isRtl = currentTransDef?.rtl || false;
  const rtlStyle = isRtl ? { direction: "rtl", textAlign: "right" } : {};
  const isEnglishTrans = bibleTranslation === "kjv" || bibleTranslation === "bsb";
  const {
    verseRefs,
    autoScrollEnabled,
    setAutoScrollEnabled,
    chaptersData,
    visibleChNum,
    bottomSentinelRef,
    chapterHeaderRefs,
    renderVerseText,
  } = useBibleVerseListState({
    view,
    loading,
    book,
    chapter,
    bookInfo,
    bibleTranslation,
    getChapterFromCache,
    fetchTranslatedVerses,
    loadUserDataForChapter,
    audioPlaying,
    audioSource,
    audioCurrentVerse,
    audioCurrentWord,
    isRtl,
    t,
  });
  const {
    showColors,
    similarOpen,
    similarVerses,
    similarLoading,
    vWords,
    vRefs,
    outline,
    canPrev,
    canNext,
    tabOptions,
    toggleOverview,
    toggleHighlightPicker,
    goPrevVerse,
    goNextVerse,
    openVersePrayer,
    toggleSimilarOpen,
  } = useBibleVerseStudyState({
    view,
    book,
    chapter,
    verse,
    chapterMeta,
    wordStudies,
    crossRefs,
    verseNums,
    user,
    isEnglishTrans,
    isOT,
    setVerse,
    setTab,
    setOverviewOpen,
    setPrayerTitle,
    setPrayerText,
    setPrayerModal,
  });

  const VerseList = () => {
    const bookDisplayName = getBookName(book, bibleTranslation);
    if (loading && chaptersData.length === 0) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${bookDisplayName}`} subtitle="Loading..." onBack={goBack} showFontSize hideUser hidePrayer /><Spinner t={t} /></div>;
    if (!loading && chaptersData.length === 0) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${bookDisplayName}`} onBack={goBack} showFontSize hideUser hidePrayer /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>No verses loaded</div></div></div>;

    const isListeningHere = audioPlaying && audioSource === "verseList";
    const totalChapters = bookInfo?.chapters || 1;

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={`${bookDisplayName} ${visibleChNum}`} onBack={goBack} showFontSize hideUser hidePrayer
          right={audioAvailable ?
            <button onClick={() => {
              if (isListeningHere) { setAudioPlaying(false); } else {
                setAudioSource("verseList");
                setAudioVisible(true);
                setAudioPlaying(true);
              }
            }}
              style={{ display:"flex",alignItems:"center",gap:4,padding:"5px 10px",borderRadius:8,
                background:isListeningHere?`${t.accent}25`:"rgba(255,255,255,0.1)",
                border:"none",cursor:"pointer",color:t.headerText,transition:"all 0.15s" }}>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"/>
                <path d="M15.54 8.46a5 5 0 0 1 0 7.07"/>
                {isListeningHere && <path d="M19.07 4.93a10 10 0 0 1 0 14.14"/>}
              </svg>
              <span style={{ fontFamily:t.ui,fontSize:10,fontWeight:700,letterSpacing:"0.04em" }}>
                {isListeningHere ? "Listening" : "Listen"}
              </span>
            </button>
          : undefined}
        />
        <div style={{ maxWidth:bp.contentWide,margin:"0 auto",padding:`16px ${bp.pad}px ${audioVisible ? 160 : 100}px` }}>

          {chaptersData.map((chEntry) => {
            const { chNum, verses: chVerses, meta: chMeta, highlights: chHL, notes: chNT, communityNotes: chCN } = chEntry;
            const isRead = user && chapterReads.some(r => r.book_name === book && r.chapter_number === chNum);
            const chapterKey = `${book}-${chNum}`;
            const bestPct = (() => { const s = user ? (quizScores[chapterKey] || []) : []; return s.length > 0 ? Math.max(...s.map(x => x.percentage)) : null; })();

            return (
              <div key={chNum} style={{ marginBottom: 24 }}>

                {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ Chapter Header Card ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
                <div
                  ref={el => { chapterHeaderRefs.current[chNum] = el; }}
                  data-chapter={chNum}
                  style={{
                    textAlign:"center", padding:"28px 20px 20px",
                    background: t.accentLight, border:`1px solid ${t.accentBorder}`,
                    borderRadius: 16, marginBottom: 14,
                    boxShadow: `0 2px 8px rgba(0,0,0,0.05)`,
                  }}>
                  <div style={{ fontFamily:t.ui, fontSize:11, fontWeight:700, color:t.accent, textTransform:"uppercase", letterSpacing:"0.28em", marginBottom:6 }}>
                    {"CHAPTER " + String(chNum).split("").join(" ")}
                  </div>
                  {chMeta?.theme && (
                    <div style={{ fontFamily:t.heading, fontSize:16, fontWeight:600, color:t.dark, lineHeight:1.4, marginBottom:10 }}>
                      {chMeta.theme}
                    </div>
                  )}
                  <div style={{ display:"flex", alignItems:"center", justifyContent:"center", gap:8 }}>
                    <div style={{ width:28, height:1, background:t.accentBorder }} />
                    <span style={{ fontSize:10, color:t.accent }}>ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã¢â‚¬Å“Ãƒâ€šÃ‚Â¦</span>
                    <div style={{ width:28, height:1, background:t.accentBorder }} />
                  </div>
                </div>

                {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ Verses Card ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
                {chVerses.length > 0 && (
                  <div style={{background:t.card,borderRadius:14,border:`1px solid ${t.divider}`,overflow:"hidden",boxShadow:"0 1px 4px rgba(0,0,0,0.04)"}}>
                    {chVerses.map((v, vi) => {
                      const hl = (chHL || {})[v.verse_number];
                      const nt = (chNT || {})[v.verse_number];
                      const cn = (chCN || {})[v.verse_number];
                      const hlColor = hl?.highlight_color;
                      const isBookmarked = hl?.is_bookmarked;
                      const hasNote = !!nt;
                      const communityCount = cn?.length || 0;
                      const isLast = vi === chVerses.length - 1;
                      const isPlayingVerse = isListeningHere && audioCurrentVerse === v.verse_number && visibleChNum === chNum;
                      const refKey = `${chNum}-${v.verse_number}`;
                      return (
                        <button key={refKey}
                          ref={el => { verseRefs.current[refKey] = el; }}
                          onClick={() => nav("verse",{verse:v.verse_number,chapter:chNum,tab:"study"})}
                          style={{
                            width:"100%",
                            background: isPlayingVerse ? `${t.accent}10` : hlColor ? `${hlColor}08` : "transparent",
                            borderLeft: isPlayingVerse ? `3px solid ${t.accent}` : hlColor ? `3px solid ${hlColor}` : "3px solid transparent",
                            borderRight:"none",borderTop:"none",
                            borderBottom:isLast ? "none" : `1px solid ${t.divider}`,
                            padding:"14px 16px",textAlign:"left",cursor:"pointer",
                            display:"flex",gap:12,alignItems:"flex-start",
                            transition:"all 0.25s",position:"relative",
                            animation: isPlayingVerse ? "verseGlow 2s ease-in-out infinite" : "none",
                          }}>
                          <span style={{
                            fontFamily:t.heading,fontSize:22,fontWeight:800,color:hlColor || t.verseNum,
                            minWidth:28,textAlign:"center",lineHeight:1.2,flexShrink:0
                          }}>{v.verse_number}</span>
                          <div style={{flex:1,minWidth:0}}>
                            {renderVerseText(v.kjv_text, v.verse_number, {fontFamily:t.body,fontSize:FS[fontSize].list,color:t.text,lineHeight:1.65,...rtlStyle})}
                          </div>
                          {(isBookmarked || hasNote || communityCount > 0) && (
                            <div style={{display:"flex",alignItems:"center",gap:4,flexShrink:0,alignSelf:"flex-start",marginTop:2}}>
                              {isBookmarked && <span style={{fontSize:12,color:"#FFD700"}}>ÃƒÆ’Ã‚Â¢Ãƒâ€¹Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¦</span>}
                              {hasNote && <span style={{fontSize:11,color:t.muted}}>ÃƒÆ’Ã‚Â¢Ãƒâ€¦Ã¢â‚¬Å“Ãƒâ€šÃ‚ÂÃƒÆ’Ã‚Â¯Ãƒâ€šÃ‚Â¸Ãƒâ€šÃ‚Â</span>}
                              {communityCount > 0 && <span style={{fontFamily:t.ui,fontSize:9,color:t.accent,fontWeight:700,background:`${t.accent}12`,borderRadius:4,padding:"1px 4px"}}>{communityCount}</span>}
                            </div>
                          )}
                        </button>
                      );
                    })}
                  </div>
                )}

                {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ Between-Chapter Action Strip ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
                <div style={{ marginTop:16, display:"flex", flexDirection:"column", gap:10 }}>
                  {/* Mark as Read */}
                  <button
                    onClick={() => user ? (!isRead && markChapterRead(book, chNum)) : nav("account")}
                    style={{
                      width:"100%", display:"flex", alignItems:"center", justifyContent:"center", gap:8,
                      padding:"12px 16px", borderRadius:12,
                      background: isRead ? (darkMode ? "rgba(74,222,128,0.12)" : "rgba(74,222,128,0.08)") : (darkMode ? "rgba(255,255,255,0.05)" : "rgba(0,0,0,0.03)"),
                      border: `1px solid ${isRead ? "rgba(74,222,128,0.3)" : t.divider}`,
                      cursor: isRead ? "default" : "pointer", transition:"all 0.2s",
                    }}>
                    {isRead
                      ? <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#4ade80" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>
                      : <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={t.muted} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
                    }
                    <span style={{ fontFamily:t.ui, fontSize:13, fontWeight:700, color: isRead ? "#4ade80" : t.muted }}>
                      {isRead ? "Chapter Read" : "Mark as Read"}
                    </span>
                  </button>

                  {/* Quiz Hero CTA ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â only for books with quiz data */}
                  {QUIZ_BOOKS.includes(book) && <button
                    onClick={() => nav("quiz-intro",{book,chapter:chNum})}
                    style={{
                      width:"100%", padding:"18px 20px", borderRadius:14,
                      background: darkMode
                        ? "linear-gradient(135deg, #312e81 0%, #4c1d95 50%, #581c87 100%)"
                        : "linear-gradient(135deg, #7c3aed 0%, #6d28d9 50%, #5b21b6 100%)",
                      border:"none", cursor:"pointer",
                      boxShadow: "0 4px 20px rgba(124,58,237,0.3)",
                      textAlign:"left", position:"relative", overflow:"hidden",
                    }}>
                    {/* Shimmer overlay */}
                    <div style={{position:"absolute",top:0,left:0,right:0,bottom:0,background:"linear-gradient(90deg,transparent 0%,rgba(255,255,255,0.08) 50%,transparent 100%)",backgroundSize:"200% 100%",animation:"scanLine 3s linear infinite",pointerEvents:"none"}} />
                    <div style={{ position:"relative", display:"flex", alignItems:"center", gap:12 }}>
                      <div style={{ fontSize:28, flexShrink:0 }}>ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸Ãƒâ€¦Ã‚Â½Ãƒâ€šÃ‚Â¯</div>
                      <div style={{ flex:1 }}>
                        <div style={{ fontFamily:t.ui, fontSize:10, fontWeight:700, color:"rgba(255,255,255,0.7)", textTransform:"uppercase", letterSpacing:"0.14em", marginBottom:3 }}>
                          TEST YOUR KNOWLEDGE
                        </div>
                        <div style={{ fontFamily:t.heading, fontSize:15, fontWeight:700, color:"#fff" }}>
                          Take the Chapter {chNum} Quiz
                        </div>
                      </div>
                      {bestPct !== null && (
                        <div style={{ padding:"4px 10px", borderRadius:8, background:bestPct >= 70 ? "rgba(74,222,128,0.25)" : "rgba(248,113,113,0.25)", flexShrink:0 }}>
                          <span style={{ fontFamily:t.ui, fontSize:12, fontWeight:700, color:bestPct >= 70 ? "#4ade80" : "#f87171" }}>{bestPct}%</span>
                        </div>
                      )}
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="rgba(255,255,255,0.6)" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{flexShrink:0}}><polyline points="9 18 15 12 9 6"/></svg>
                    </div>
                  </button>}
                </div>

              </div>
            );
          })}

          {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ Bottom Sentinel (triggers next chapter load) ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
          <div ref={bottomSentinelRef} style={{ height:1 }} />

          {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ Loading More Indicator ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
          {(chaptersData.length > 0 && chaptersData[chaptersData.length - 1].chNum < totalChapters) && (
            <div style={{ textAlign:"center", padding:"20px 0" }}>
              <Spinner t={t} />
              <div style={{ fontFamily:t.ui, fontSize:11, color:t.muted, marginTop:6 }}>Loading next chapter...</div>
            </div>
          )}

          {/* ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ End of Book ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚ÂÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ */}
          {chaptersData.length > 0 && chaptersData[chaptersData.length - 1].chNum >= totalChapters && (
            <div style={{ textAlign:"center", padding:"32px 20px", margin:"8px 0" }}>
              <div style={{ fontSize:32, marginBottom:8 }}>ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“</div>
              <div style={{ fontFamily:t.heading, fontSize:16, fontWeight:700, color:t.dark, marginBottom:4 }}>
                End of {bookDisplayName}
              </div>
              <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted }}>
                {totalChapters} chapters ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â· You made it!
              </div>
            </div>
          )}

          {/* Back to playing FAB */}
          {isListeningHere && !autoScrollEnabled && (
            <button onClick={() => {
              setAutoScrollEnabled(true);
              if (audioCurrentVerse && verseRefs.current[audioCurrentVerse]) {
                verseRefs.current[audioCurrentVerse].scrollIntoView({ behavior:"smooth", block:"center" });
              }
            }}
              style={{ position:"fixed",bottom:audioVisible?130:80,right:16,zIndex:100,
                display:"flex",alignItems:"center",gap:6,padding:"8px 14px",borderRadius:20,
                background:t.accent,color:"#fff",fontFamily:t.ui,fontSize:11,fontWeight:700,
                border:"none",cursor:"pointer",boxShadow:"0 4px 16px rgba(0,0,0,0.25)",
                animation:"fadeIn 0.2s ease-out" }}>
              <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
                <polygon points="11 5 6 9 2 9 2 15 6 15 11 19 11 5"/>
              </svg>
              Back to V.{audioCurrentVerse}
            </button>
          )}
        </div>
      </div>
    );
  };

  // ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚ÂÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚ÂÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚Â VERSE STUDY ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚ÂÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚ÂÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â¢Ãƒâ€šÃ‚Â
  const VerseStudy = () => {
    const bookDisplayName = getBookName(book, bibleTranslation);
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={bookDisplayName} onBack={goBack} hidePrayer /><Spinner t={t} /><div style={{textAlign:"center",fontFamily:t.ui,fontSize:15,color:t.muted}}>Loading...</div></div>;
    if (!currentVerse) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={bookDisplayName} onBack={goBack} hidePrayer /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>Loading...</div></div></div>;

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={bookDisplayName} onBack={goBack} hidePrayer />
        <div style={{ maxWidth:bp.contentWide,margin:"0 auto",padding:`0 ${bp.pad}px ${audioVisible?68:40}px` }}>
          <VerseOverviewCard
            t={t}
            chapter={chapter}
            chapterMeta={chapterMeta}
            overviewOpen={overviewOpen}
            outline={outline}
            toggleOverview={toggleOverview}
          />

          <VerseTextCard
            t={t}
            darkMode={darkMode}
            highlight={highlight}
            audioPlaying={audioPlaying}
            audioAvailable={audioAvailable}
            setAudioPlaying={setAudioPlaying}
            setAudioSource={setAudioSource}
            setAudioVisible={setAudioVisible}
            verseTextLabel={bibleTranslation === "kjv" ? "KJV Text" : currentTransDef?.name || "Verse Text"}
            FS={FS}
            fontSize={fontSize}
            rtlStyle={rtlStyle}
            isRtl={isRtl}
            verse={verse}
            audioCurrentWord={audioCurrentWord}
            currentVerse={currentVerse}
            canPrev={canPrev}
            canNext={canNext}
            verseCount={verseNums.length}
            goPrevVerse={goPrevVerse}
            goNextVerse={goNextVerse}
            user={user}
            hasVerseId={hasVerseId}
            showColors={showColors}
            toggleHighlightPicker={toggleHighlightPicker}
            toggleBookmarkHL={toggleBookmarkHL}
            tab={tab}
            setTab={setTab}
            openVersePrayer={openVersePrayer}
            shareCopied={shareCopied}
            copyVerseText={copyVerseText}
            shareVerseImage={shareVerseImage}
            toggleHighlight={toggleHighlight}
          />

          <VerseStudyTabs t={t} tabOptions={tabOptions} tab={tab} setTab={setTab} />

          <VerseStudyPanels
            t={t}
            tab={tab}
            isEnglishTrans={isEnglishTrans}
            currentVerse={currentVerse}
            isOT={isOT}
            vWords={vWords}
            vRefs={vRefs}
            user={user}
            noteRef={noteRef}
            userNote={userNote}
            noteLoading={noteLoading}
            saveNote={saveNote}
            savedNote={savedNote}
            toggleNotePublic={toggleNotePublic}
            deleteNote={deleteNote}
            book={book}
            chapter={chapter}
            verse={verse}
            openVersePrayer={openVersePrayer}
            communityNotes={communityNotes}
            nav={nav}
          />

          <SimilarVersesPanel
            t={t}
            similarOpen={similarOpen}
            toggleSimilarOpen={toggleSimilarOpen}
            similarVerses={similarVerses}
            similarLoading={similarLoading}
            nav={nav}
            bibleTranslation={bibleTranslation}
          />

        </div>
      </div>
    );
  };


  // Render inner views as function calls (not <Component />) to prevent
  // unmount/remount on every parent re-render ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â inner functions get new
  // references each render, which React treats as different component types.
  const content = view === "books" ? Books()
    : view === "chapter" ? Chapters()
    : view === "verses" ? VerseList()
    : view === "verse" ? VerseStudy()
    : null;

  return (
    <>
      {content}
      {(view === "verses" || view === "verse") && audioAvailable && <AudioPlayer />}
    </>
  );
}


