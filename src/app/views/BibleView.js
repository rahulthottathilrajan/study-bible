"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, CHAPTER_GROUPS, BIBLE_TRANSLATIONS, getBookName } from "../constants"; // CAT_ICONS used in Chapters view
import { ChevIcon, Spinner } from "../components/ui";
import Header from "../components/Header";
import AudioPlayer from "../components/AudioPlayer";
import { VerseListChapterSection, VerseListFooter } from "./components/BibleReaderShared";
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

  const Books = () => {
    const books = BIBLE_BOOKS.filter((entry) => entry.testament === testament);
    return (
      <div style={{ minHeight: "100vh", background: ht.bg }}>
        <Header title="The Holy Scriptures" onBack={goBack} theme={ht} hidePrayer hideUser />
        <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          <div style={{ display: "flex", gap: 12, marginBottom: 20 }}>
            {[
              { t: "OT", l: "Old Testament", s: "39 Books", sub: "Genesis - Malachi", o: "בְּרֵאשִׁית", om: "In the Beginning", thm: "garden", icon: "📜" },
              { t: "NT", l: "New Testament", s: "27 Books", sub: "Matthew - Revelation", o: "Καινὴ Διαθήκη", om: "The New Covenant", thm: "ocean", icon: "✝️" },
            ].map((item) => {
              const isSelected = testament === item.t;
              const theme = THEMES[item.thm];
              return (
                <button
                  key={item.t}
                  onClick={() => nav("books", { testament: item.t })}
                  style={{
                    flex: 1,
                    cursor: "pointer",
                    border: "none",
                    background: "transparent",
                    padding: 0,
                    display: "flex",
                    flexDirection: "column",
                    filter: `drop-shadow(0 4px 12px rgba(0,0,0,${isSelected ? 0.2 : 0.1}))`,
                    opacity: isSelected ? 1 : 0.65,
                    transition: "opacity 0.2s, filter 0.2s",
                  }}
                >
                  <div style={{ height: 18, background: theme.headerGradient, borderRadius: "10px 10px 0 0", position: "relative", overflow: "hidden" }}>
                    <div style={{ position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)", width: "55%", height: 6, background: "rgba(255,255,255,0.12)", borderRadius: 10 }} />
                  </div>
                  <div style={{ background: darkMode ? "linear-gradient(180deg,#2A2620 0%,#231F1A 40%,#2A2620 100%)" : "linear-gradient(180deg,#FEF3D8 0%,#FAE8BB 40%,#FEF3D8 100%)", padding: "14px 8px 12px", borderLeft: "1px solid rgba(180,140,60,0.3)", borderRight: "1px solid rgba(180,140,60,0.3)", textAlign: "center", flex: 1 }}>
                    <div style={{ fontSize: 26, marginBottom: 6, filter: "drop-shadow(0 2px 4px rgba(0,0,0,0.2))" }}>{item.icon}</div>
                    <div style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: theme.dark, lineHeight: 1.3, marginBottom: 4 }}>{item.l}</div>
                    <div style={{ width: 24, height: 2, background: theme.accent, borderRadius: 2, margin: "0 auto 6px" }} />
                    <div style={{ fontFamily: ht.ui, fontSize: 10, color: theme.muted, letterSpacing: "0.02em" }}>{item.s}</div>
                    <div style={{ fontFamily: "'Times New Roman',serif", fontSize: item.t === "OT" ? 15 : 12, color: theme.accent, fontWeight: 700, marginTop: 6, direction: item.t === "OT" ? "rtl" : "ltr", lineHeight: 1.4 }}>{item.o}</div>
                    <div style={{ fontFamily: ht.body, fontSize: 9.5, color: theme.muted, fontStyle: "italic", lineHeight: 1.5 }}>{item.om}</div>
                  </div>
                  <div style={{ height: 18, background: theme.headerGradient, borderRadius: "0 0 10px 10px", position: "relative", overflow: "hidden" }}>
                    <div style={{ position: "absolute", top: "50%", left: "50%", transform: "translate(-50%,-50%)", width: "55%", height: 6, background: "rgba(255,255,255,0.12)", borderRadius: 10 }} />
                  </div>
                </button>
              );
            })}
          </div>

          <div style={{ display: "flex", justifyContent: "center", marginBottom: 16 }}>
            {[{ n: "66", l: "Books" }, { n: "1,189", l: "Chapters" }, { n: "31,102", l: "Verses" }].map((stat, index) => (
              <div key={stat.l} style={{ textAlign: "center", flex: 1, borderRight: index < 2 ? `1px solid ${ht.divider}` : "none", padding: "0 8px" }}>
                <div style={{ fontFamily: ht.heading, fontSize: 18, fontWeight: 700, color: ht.dark, letterSpacing: "-0.02em" }}>{stat.n}</div>
                <div style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 600, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.1em", marginTop: 1 }}>{stat.l}</div>
              </div>
            ))}
          </div>

          <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14, display: "flex", alignItems: "center", gap: 8 }}>
            <span>{testament === "OT" ? "📜" : "✝️"}</span> {testament === "OT" ? "Old Testament" : "New Testament"} · {books.length} Books
          </div>

          <div style={{ background: ht.card, borderRadius: 14, border: `1px solid ${ht.divider}`, overflow: "hidden", boxShadow: "0 1px 4px rgba(0,0,0,0.04)" }}>
            {books.map((entry, index) => {
              const categoryTheme = THEMES[CATEGORY_THEME[entry.category] || "home"];
              return (
                <button
                  key={entry.name}
                  className="pressable"
                  onClick={() => nav("verses", { book: entry.name, chapter: 1 })}
                  style={{ width: "100%", background: "transparent", border: "none", borderBottom: index < books.length - 1 ? `1px solid ${ht.divider}` : "none", padding: "14px 16px", cursor: "pointer", textAlign: "left", display: "flex", alignItems: "center", gap: 12, transition: "background 0.15s" }}
                >
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 3 }}>
                      <span style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 700, color: ht.dark }}>{getBookName(entry.name, bibleTranslation)}</span>
                      <span style={{ fontFamily: categoryTheme.ui, fontSize: 9, fontWeight: 700, color: categoryTheme.accent, background: `${categoryTheme.accent}15`, borderRadius: 10, padding: "2px 8px", textTransform: "uppercase", letterSpacing: "0.04em", flexShrink: 0 }}>{entry.category}</span>
                    </div>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.muted }}>{entry.chapters} chapters · {entry.original} <span style={{ fontStyle: "italic", fontSize: 10 }}>· {entry.meaning}</span></div>
                  </div>
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={ht.light} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ flexShrink: 0 }}>
                    <polyline points="9 18 15 12 9 6" />
                  </svg>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  const Chapters = () => {
    if (!bookInfo) return null;
    const availableChapters = dbChapters[book] || [];
    const availableNumbers = availableChapters.map((entry) => entry.num);
    const getTheme = (chapterNumber) => {
      const found = availableChapters.find((entry) => entry.num === chapterNumber);
      return found?.theme || null;
    };
    const groups = CHAPTER_GROUPS[book] || [{ label: "All Chapters", icon: "📖", chapters: Array.from({ length: bookInfo.chapters }, (_, index) => index + 1) }];
    const toggleGroup = (groupIndex) => setCollapsed((prev) => ({ ...prev, [groupIndex]: !prev[groupIndex] }));

    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={getBookName(book, bibleTranslation)} subtitle={`${bookInfo.original} - ${bookInfo.meaning}`} onBack={goBack} />
        <div style={{ padding: `18px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
          {bookInfo.author && (
            <div style={{ background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: "14px 16px", marginBottom: 18, boxShadow: "0 1px 4px rgba(0,0,0,0.04)" }}>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.text, lineHeight: 1.8 }}>
                <span style={{ fontWeight: 700, color: t.dark }}>Author: </span>{bookInfo.author}
                {bookInfo.dateWritten && <><span style={{ color: t.divider }}> · </span><span style={{ fontWeight: 700, color: t.dark }}>Date: </span>{bookInfo.dateWritten}</>}
              </div>
            </div>
          )}

          {availableNumbers.length === 0 && (
            <div style={{ padding: "16px 18px", marginBottom: 18, background: `linear-gradient(135deg,${t.accentLight},${t.card})`, border: `1px solid ${t.accentBorder}`, borderRadius: 14, textAlign: "center" }}>
              <div style={{ fontSize: 22, marginBottom: 6 }}>📜</div>
              <div style={{ fontFamily: t.heading, fontSize: 15, fontWeight: 700, color: t.dark, marginBottom: 4 }}>Study notes coming soon</div>
              <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, lineHeight: 1.5 }}>27 books are fully seeded with verse-by-verse study notes, original language text, and cross-references. More books are being prepared.</div>
            </div>
          )}

          {groups.map((group, groupIndex) => {
            const groupHasContent = group.chapters.some((chapterNumber) => availableNumbers.includes(chapterNumber));
            const isGroupCollapsed = collapsed[groupIndex];
            return (
              <div key={`${group.label}-${groupIndex}`} style={{ marginBottom: 12 }}>
                <button
                  onClick={() => toggleGroup(groupIndex)}
                  style={{ width: "100%", display: "flex", alignItems: "center", gap: 10, padding: "12px 14px", background: groupHasContent ? `linear-gradient(135deg,${t.accentLight},${t.card})` : t.card, border: `1px solid ${groupHasContent ? t.accentBorder : t.divider}`, borderRadius: isGroupCollapsed ? 12 : "12px 12px 0 0", cursor: "pointer", textAlign: "left", transition: "all 0.2s" }}
                >
                  <span style={{ fontSize: 18, flexShrink: 0 }}>{group.icon}</span>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontFamily: t.heading, fontSize: 15, fontWeight: 700, color: groupHasContent ? t.dark : t.muted, lineHeight: 1.3 }}>{group.label}</div>
                    <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginTop: 2 }}>
                      {group.chapters.length === 1 ? `Chapter ${group.chapters[0]}` : `Chapters ${group.chapters[0]}-${group.chapters[group.chapters.length - 1]}`}
                      {groupHasContent && <span style={{ color: t.accent, fontWeight: 700 }}> · Study available</span>}
                    </div>
                  </div>
                  <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, transform: isGroupCollapsed ? "rotate(0deg)" : "rotate(180deg)", transition: "transform 0.2s" }}>▾</span>
                </button>

                {!isGroupCollapsed && (
                  <div style={{ border: `1px solid ${groupHasContent ? t.accentBorder : t.divider}`, borderTop: "none", borderRadius: "0 0 12px 12px", overflow: "hidden", background: t.card }}>
                    {group.chapters.map((chapterNumber, chapterIndex) => {
                      const hasStudy = availableNumbers.includes(chapterNumber);
                      const theme = getTheme(chapterNumber);
                      const isLast = chapterIndex === group.chapters.length - 1;
                      const isRead = chapterReads.some((entry) => entry.book_name === book && entry.chapter_number === chapterNumber);
                      const isListened = listenedChapters.includes(`${book}:${chapterNumber}`);
                      const chapterKey = `${book}-${chapterNumber}`;
                      const scoreList = quizScores[chapterKey] || [];
                      const bestPct = scoreList.length > 0 ? Math.max(...scoreList.map((score) => score.percentage)) : null;
                      return (
                        <button
                          key={chapterNumber}
                          className={hasStudy ? "pressable" : ""}
                          onClick={() => { if (hasStudy) nav("verses", { chapter: chapterNumber, verse: null }); }}
                          style={{ width: "100%", display: "flex", alignItems: "center", padding: "12px 14px", background: "transparent", border: "none", borderBottom: isLast ? "none" : `1px dashed ${t.divider}`, cursor: hasStudy ? "pointer" : "default", textAlign: "left", transition: "background 0.15s", gap: 12 }}
                        >
                          <div style={{ flexShrink: 0, width: 34, height: 34, borderRadius: "50%", display: "flex", alignItems: "center", justifyContent: "center", background: hasStudy ? (isRead ? "#22c55e" : t.accent) : "transparent", border: hasStudy ? "none" : `1.5px solid ${t.divider}`, boxShadow: hasStudy ? `0 2px 6px ${isRead ? "rgba(34,197,94,0.25)" : `${t.accent}30`}` : "none", position: "relative" }}>
                            {hasStudy && isRead ? (
                              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="3" strokeLinecap="round" strokeLinejoin="round">
                                <polyline points="20 6 9 17 4 12" />
                              </svg>
                            ) : (
                              <span style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: hasStudy ? "#fff" : t.light }}>{chapterNumber}</span>
                            )}
                          </div>

                          <div style={{ flex: 1, minWidth: 0 }}>
                            <div style={{ fontFamily: t.ui, fontSize: 14, fontWeight: hasStudy ? 600 : 400, color: hasStudy ? t.dark : t.light, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis", lineHeight: 1.3 }}>
                              {theme || (hasStudy ? "Study available" : "Coming soon")}
                            </div>
                            <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginTop: 2, opacity: hasStudy ? 1 : 0.5 }}>
                              {hasStudy ? (isRead ? `Ch ${chapterNumber} · Completed` : `Ch ${chapterNumber} · Study available`) : `Ch ${chapterNumber}`}
                            </div>
                          </div>

                          <div style={{ display: "flex", alignItems: "center", gap: 5, flexShrink: 0 }}>
                            {bestPct !== null && (
                              <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, padding: "2px 6px", borderRadius: 6, background: bestPct >= 70 ? "rgba(34,197,94,0.12)" : "rgba(239,68,68,0.1)", color: bestPct >= 70 ? "#22c55e" : "#ef4444" }}>
                                {bestPct}%
                              </span>
                            )}
                            {isListened && <span style={{ fontSize: 12, opacity: 0.75 }} title="Listened">🎧</span>}
                            {hasStudy && <div style={{ color: t.light }}><ChevIcon /></div>}
                          </div>
                        </button>
                      );
                    })}
                  </div>
                )}
              </div>
            );
          })}

          <div style={{ display: "flex", justifyContent: "center", gap: 28, marginTop: 10, padding: "14px 0", borderTop: `1px solid ${t.divider}` }}>
            <div style={{ textAlign: "center" }}>
              <div style={{ fontFamily: t.heading, fontSize: 20, fontWeight: 700, color: t.dark }}>{bookInfo.chapters}</div>
              <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, textTransform: "uppercase", letterSpacing: "0.1em" }}>Chapters</div>
            </div>
            <div style={{ textAlign: "center" }}>
              <div style={{ fontFamily: t.heading, fontSize: 20, fontWeight: 700, color: t.accent }}>{availableNumbers.length}</div>
              <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, textTransform: "uppercase", letterSpacing: "0.1em" }}>Study Ready</div>
            </div>
            <div style={{ textAlign: "center" }}>
              <div style={{ fontFamily: t.heading, fontSize: 20, fontWeight: 700, color: t.dark }}>{groups.length}</div>
              <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, textTransform: "uppercase", letterSpacing: "0.1em" }}>Sections</div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const VerseList = () => {
    const bookDisplayName = getBookName(book, bibleTranslation);
    if (loading && chaptersData.length === 0) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${bookDisplayName}`} subtitle="Loading..." onBack={goBack} showFontSize hideUser hidePrayer /><Spinner t={t} /></div>;
    if (!loading && chaptersData.length === 0) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${bookDisplayName}`} onBack={goBack} showFontSize hideUser hidePrayer /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>ÃƒÆ’Ã‚Â°Ãƒâ€¦Ã‚Â¸ÃƒÂ¢Ã¢â€šÂ¬Ã…â€œÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>No verses loaded</div></div></div>;

    const isListeningHere = audioPlaying && audioSource === "verseList";
    const totalChapters = bookInfo?.chapters || 1;
    const setChapterHeaderRef = (chapterNumber, element) => {
      chapterHeaderRefs.current[chapterNumber] = element;
    };
    const setVerseRef = (refKey, element) => {
      verseRefs.current[refKey] = element;
    };

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
          {chaptersData.map((chapterEntry) => (
            <VerseListChapterSection
              key={chapterEntry.chNum}
              chapterEntry={chapterEntry}
              book={book}
              user={user}
              chapterReads={chapterReads}
              quizScores={quizScores}
              setChapterHeaderRef={setChapterHeaderRef}
              setVerseRef={setVerseRef}
              audioCurrentVerse={audioCurrentVerse}
              visibleChNum={visibleChNum}
              isListeningHere={isListeningHere}
              nav={nav}
              renderVerseText={renderVerseText}
              t={t}
              FS={FS}
              fontSize={fontSize}
              rtlStyle={rtlStyle}
              markChapterRead={markChapterRead}
              darkMode={darkMode}
            />
          ))}

          <VerseListFooter
            t={t}
            bottomSentinelRef={bottomSentinelRef}
            hasMoreChapters={chaptersData.length > 0 && chaptersData[chaptersData.length - 1].chNum < totalChapters}
            chaptersData={chaptersData}
            totalChapters={totalChapters}
            bookDisplayName={bookDisplayName}
            isListeningHere={isListeningHere}
            autoScrollEnabled={autoScrollEnabled}
            setAutoScrollEnabled={setAutoScrollEnabled}
            audioCurrentVerse={audioCurrentVerse}
            verseRefs={verseRefs}
            audioVisible={audioVisible}
          />
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


