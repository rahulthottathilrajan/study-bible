"use client";
import { AppProvider, useApp } from "./context/AppContext";
import TimelineMaps from "./components/TimelineMaps";
import BibleBookTimeline from "./components/BibleBookTimeline";
import ProphecyFulfilment from "./components/ProphecyFulfilment";
import ArchaeologyCards from "./components/ArchaeologyCards";
import Apologetics from "./components/Apologetics";
import ReadingPlans from "./components/ReadingPlans";
import KidsCurriculum from "./components/KidsCurriculum";
import TeensCurriculum from "./components/TeensCurriculum";
import BibleSearch from "./components/BibleSearch";
import ErrorBoundary from "./components/ErrorBoundary";
import BottomNav from "./components/BottomNav";
import DonateModal from "./components/DonateModal";
import WelcomeModal from "./components/WelcomeModal";
import PrayerModal from "./components/PrayerModal";
import BadgeToast from "./components/BadgeToast";
import HomeView from "./views/HomeView";
import AccountView from "./views/AccountView";
import HebrewView from "./views/HebrewView";
import GreekView from "./views/GreekView";
import BibleView from "./views/BibleView";
import JournalView from "./views/JournalView";
import PrayerView from "./views/PrayerView";
import LearnView from "./views/LearnView";
import QuizView from "./views/QuizView";
import QuizBrowserView from "./views/QuizBrowserView";
import ShopView from "./views/ShopView";
import PodcastView from "./views/PodcastView";
import SmartChat from "./views/SmartChat";
import PodcastPlayer from "./components/PodcastPlayer";
import TermsView from "./views/TermsView";

// ═══════════════════════════════════════════════════
// MAIN APP
// ═══════════════════════════════════════════════════
function StudyBibleContent() {
  const { view, darkMode, nav, ht, bp, updateSectionPosition, trackLearnExploration } = useApp();

  const showNav = !["verse","hebrew-lesson","hebrew-practice","greek-lesson","greek-practice"].includes(view);

  return (
    <div style={{ maxWidth:bp.shell,margin:"0 auto",minHeight:"100vh",paddingBottom:showNav?68:0 }}>
      <style>{`.pressable{transition:background 0.15s,transform 0.1s!important}.pressable:hover{background:rgba(0,0,0,0.03)!important}.pressable:active{background:rgba(0,0,0,0.07)!important;transform:scale(0.985)}@keyframes stoneShimmer{0%{background-position:250% 0}50%{background-position:-50% 0}100%{background-position:250% 0}}`}</style>
      {view === "home" && <ErrorBoundary theme={ht} label="Home"><HomeView /></ErrorBoundary>}
      {view === "search" && <ErrorBoundary theme={ht} label="Search"><BibleSearch nav={nav} ht={ht} /></ErrorBoundary>}
      {(view === "books" || view === "chapter" || view === "verses" || view === "verse") && <ErrorBoundary theme={ht} label="Bible"><BibleView /></ErrorBoundary>}
      {view === "highlights" && <ErrorBoundary theme={ht} label="Highlights"><JournalView /></ErrorBoundary>}
      {view.startsWith("prayer-") && <ErrorBoundary theme={ht} label="Prayer"><PrayerView /></ErrorBoundary>}
      {view === "account" && <ErrorBoundary theme={ht} label="Account"><AccountView /></ErrorBoundary>}
      {(view === "learn-home" || view === "timeline-home" || view === "timeline-era" || view === "timeline-era-detail") && <ErrorBoundary theme={ht} label="Learn"><LearnView /></ErrorBoundary>}
      {view.startsWith("hebrew-") && <ErrorBoundary theme={ht} label="Hebrew"><HebrewView /></ErrorBoundary>}
      {view.startsWith("greek-") && <ErrorBoundary theme={ht} label="Greek"><GreekView /></ErrorBoundary>}
      {view === "timeline-maps" && <ErrorBoundary theme={ht} label="Maps"><TimelineMaps nav={nav} darkMode={darkMode} /></ErrorBoundary>}
      {view === "timeline-books" && <ErrorBoundary theme={ht} label="Timeline"><BibleBookTimeline nav={nav} darkMode={darkMode} /></ErrorBoundary>}
      {view === "prophecy-home" && <ErrorBoundary theme={ht} label="Prophecy"><ProphecyFulfilment nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} trackLearnExploration={trackLearnExploration} /></ErrorBoundary>}
      {view === "timeline-archaeology" && <ErrorBoundary theme={ht} label="Archaeology"><ArchaeologyCards nav={nav} darkMode={darkMode} trackLearnExploration={trackLearnExploration} /></ErrorBoundary>}
      {view === "apologetics-home" && <ErrorBoundary theme={ht} label="Apologetics"><Apologetics nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} /></ErrorBoundary>}
      {view === "reading-plans-home" && <ErrorBoundary theme={ht} label="Reading Plans"><ReadingPlans nav={nav} onPositionSave={updateSectionPosition} darkMode={darkMode} /></ErrorBoundary>}
      {view === "kids-curriculum-home" && <ErrorBoundary theme={ht} label="Kids Curriculum"><KidsCurriculum nav={nav} darkMode={darkMode} /></ErrorBoundary>}
      {view === "teens-curriculum-home" && <ErrorBoundary theme={ht} label="Teens Curriculum"><TeensCurriculum nav={nav} darkMode={darkMode} /></ErrorBoundary>}
      {view === "quiz-browser" && <ErrorBoundary theme={ht} label="Quiz Browser"><QuizBrowserView /></ErrorBoundary>}
      {view.startsWith("quiz-") && view !== "quiz-browser" && <ErrorBoundary theme={ht} label="Quiz"><QuizView /></ErrorBoundary>}
      {view.startsWith("shop-") && <ErrorBoundary theme={ht} label="Shop"><ShopView /></ErrorBoundary>}
      {view.startsWith("podcast-") && <ErrorBoundary theme={ht} label="Podcast"><PodcastView /></ErrorBoundary>}
      {view === "smart-chat" && <ErrorBoundary theme={ht} label="Smart Chat"><SmartChat /></ErrorBoundary>}
      {view === "terms" && <ErrorBoundary theme={ht} label="Terms"><TermsView /></ErrorBoundary>}

      <PodcastPlayer mode="mini" />
      <BadgeToast />
      <BottomNav />
      {/* ── FLOATING CHAT FAB ── */}
      {!view.startsWith("shop-") && view !== "smart-chat" && view !== "terms" && (
        <div style={{ position:"fixed", bottom: showNav ? 78 : 20, right: 16, zIndex: 45, animation:"chatFabIn 0.5s ease" }}>
          {/* Animated border ring (rotates gold↔purple) */}
          <div className="chat-fab-ring" style={{
            width: 64, height: 64, borderRadius: "50%", padding: 3,
            background: "conic-gradient(#D4A853, #805AD5, #D4A853, #6B46C1, #D4A853)",
            boxShadow: "0 4px 20px rgba(212,168,83,0.35), 0 0 28px rgba(128,90,213,0.3), 0 2px 8px rgba(0,0,0,0.2)",
          }}>
            <button
              onClick={() => nav("smart-chat")}
              aria-label="Ask the Bible"
              style={{
                width: "100%", height: "100%", borderRadius: "50%", border: "none", cursor: "pointer",
                background: ht.headerGradient,
                display: "flex", alignItems: "center", justifyContent: "center",
                transition: "transform 0.15s",
                position: "relative",
              }}
              onMouseEnter={e => { e.currentTarget.parentElement.style.transform = "scale(1.12)"; }}
              onMouseLeave={e => { e.currentTarget.parentElement.style.transform = "scale(1)"; }}
            >
              <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round" style={{ filter:"drop-shadow(0 1px 2px rgba(0,0,0,0.3))" }}>
                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
              </svg>
              {/* Sparkle dot */}
              <div style={{ position:"absolute", top: 1, right: 3, width: 10, height: 10, borderRadius: "50%", background: "#F6E05E", border: "2px solid rgba(255,255,255,0.9)", animation: "chatSparkle 2s ease-in-out infinite" }}/>
            </button>
          </div>
        </div>
      )}
      <style>{`@keyframes chatFabIn{0%{opacity:0;transform:scale(0.3) translateY(30px)}100%{opacity:1;transform:scale(1) translateY(0)}}.chat-fab-ring{animation:chatRingSpin 4s linear infinite,chatFabGlow 3s ease-in-out infinite;transition:transform 0.15s}@keyframes chatRingSpin{0%{background:conic-gradient(from 0deg,#D4A853,#805AD5,#D4A853,#6B46C1,#D4A853)}25%{background:conic-gradient(from 90deg,#D4A853,#805AD5,#D4A853,#6B46C1,#D4A853)}50%{background:conic-gradient(from 180deg,#D4A853,#805AD5,#D4A853,#6B46C1,#D4A853)}75%{background:conic-gradient(from 270deg,#D4A853,#805AD5,#D4A853,#6B46C1,#D4A853)}100%{background:conic-gradient(from 360deg,#D4A853,#805AD5,#D4A853,#6B46C1,#D4A853)}}@keyframes chatFabGlow{0%,100%{box-shadow:0 4px 20px rgba(212,168,83,0.35),0 0 28px rgba(128,90,213,0.3),0 2px 8px rgba(0,0,0,0.2)}50%{box-shadow:0 4px 28px rgba(212,168,83,0.55),0 0 40px rgba(128,90,213,0.45),0 2px 12px rgba(0,0,0,0.25)}}@keyframes chatSparkle{0%,100%{opacity:1;transform:scale(1)}50%{opacity:0.6;transform:scale(0.8)}}`}</style>
      <WelcomeModal />
      <DonateModal />
      <PrayerModal />
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
