"use client";
import { useApp } from "../context/AppContext";

const NAV_ITEMS = [
  { id:"home", label:"Home", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> },
  { id:"bible", label:"Bible", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg> },
  { id:"learn", label:"Learn", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg> },
  { id:"journal", label:"Journal", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="12" y1="18" x2="12" y2="12"/><line x1="9" y1="15" x2="15" y2="15"/></svg> },
  { id:"account", label:"Account", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg> },
];

const HIDDEN_VIEWS = ["verse","verses","hebrew-lesson","hebrew-practice","greek-lesson","greek-practice"];
const BIBLE_VIEWS = ["books","chapter","verses","verse"];
const LEARN_VIEWS = ["learn-home","hebrew-home","hebrew-lesson","hebrew-practice","hebrew-reading-home","hebrew-reading","hebrew-grammar-home","hebrew-grammar-lesson","greek-home","greek-lesson","greek-practice","greek-reading-home","greek-reading","greek-grammar-home","greek-grammar-lesson","timeline-home","timeline-era","timeline-era-detail","timeline-maps","timeline-books","timeline-archaeology","prophecy-home","apologetics-home","reading-plans-home"];
const JOURNAL_VIEWS = ["journal-home","highlights"];

export default function BottomNav() {
  const { view, nav, testament, user, setTab, ht } = useApp();

  if (HIDDEN_VIEWS.includes(view)) return null;

  return (
    <div style={{ position:"fixed",bottom:0,left:0,right:0,zIndex:50,background:ht.card,borderTop:`1px solid ${ht.divider}`,boxShadow:"0 -2px 12px rgba(0,0,0,0.06)" }}>
      <div style={{ maxWidth:640,margin:"0 auto",display:"flex",justifyContent:"space-around",alignItems:"center",padding:"6px 0 10px" }}>
        {NAV_ITEMS.map(item => {
          const isActive =
            (item.id === "home" && view === "home") ||
            (item.id === "bible" && BIBLE_VIEWS.includes(view)) ||
            (item.id === "learn" && LEARN_VIEWS.includes(view)) ||
            (item.id === "journal" && JOURNAL_VIEWS.includes(view)) ||
            (item.id === "account" && view === "account");
          return (
            <button key={item.id} onClick={() => {
              if (item.id === "bible") { if (BIBLE_VIEWS.includes(view)) { nav("books", { testament: testament || "OT" }); } else { try { const lr = JSON.parse(localStorage.getItem("lastRead")); if (lr?.book && lr?.chapter && lr?.verse) { nav("verse", { testament:lr.testament, book:lr.book, chapter:lr.chapter, verse:lr.verse }); } else { nav("books", { testament: testament || "OT" }); } } catch { nav("books", { testament: testament || "OT" }); } } }
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
  );
}
