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
        <button
          onClick={() => nav("smart-chat")}
          aria-label="Ask the Bible"
          style={{
            position:"fixed", bottom: showNav ? 78 : 20, right: 16, zIndex: 45,
            width: 54, height: 54, borderRadius: "50%", border: "none", cursor: "pointer",
            background: ht.accent, boxShadow: `0 4px 14px ${ht.accent}55, 0 2px 6px rgba(0,0,0,0.15)`,
            display: "flex", alignItems: "center", justifyContent: "center",
            animation: "chatFabIn 0.4s ease, chatFabPulse 3s ease-in-out 1s infinite",
            transition: "transform 0.15s, box-shadow 0.15s",
          }}
          onMouseEnter={e => { e.currentTarget.style.transform = "scale(1.1)"; }}
          onMouseLeave={e => { e.currentTarget.style.transform = "scale(1)"; }}
        >
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
          </svg>
        </button>
      )}
      <style>{`@keyframes chatFabIn{0%{opacity:0;transform:scale(0.5) translateY(20px)}100%{opacity:1;transform:scale(1) translateY(0)}}@keyframes chatFabPulse{0%,100%{box-shadow:0 4px 14px ${ht?.accent || '#805AD5'}55,0 2px 6px rgba(0,0,0,0.15)}50%{box-shadow:0 4px 20px ${ht?.accent || '#805AD5'}88,0 2px 10px rgba(0,0,0,0.2)}}`}</style>
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
