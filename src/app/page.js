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
import BibleView from "./views/BibleView";
import JournalView from "./views/JournalView";
import LearnView from "./views/LearnView";
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
      {(view === "books" || view === "chapter" || view === "verses" || view === "verse") && <BibleView />}
      {(view === "highlights" || view === "journal-home") && <JournalView />}
      {view === "account" && <AccountView />}
      {(view === "learn-home" || view === "timeline-home" || view === "timeline-era" || view === "timeline-era-detail") && <LearnView />}
      {view.startsWith("hebrew-") && <HebrewView />}
      {view.startsWith("greek-") && <GreekView />}
      {view === "timeline-maps" && <TimelineMaps nav={nav} darkMode={darkMode} />}
      {view === "timeline-books" && <BibleBookTimeline nav={nav} darkMode={darkMode} />}
      {view === "prophecy-home" && <ProphecyFulfilment nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "timeline-archaeology" && <ArchaeologyCards nav={nav} darkMode={darkMode} />}
      {view === "apologetics-home" && <Apologetics nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "reading-plans-home" && <ReadingPlans nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} />}
      {view === "kids-curriculum-home" && <KidsCurriculum nav={nav} darkMode={darkMode} />}

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
