"use client";
import { useApp } from "../context/AppContext";

const NAV_ITEMS = [
  { id:"home", label:"Home", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> },
  { id:"bible", label:"Bible", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg> },
  { id:"learn", label:"Learn", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg> },
  { id:"pray", label:"Community", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg> },
  { id:"shop", label:"Shop", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/></svg> },
];

const HIDDEN_VIEWS = ["verse","hebrew-lesson","hebrew-practice","greek-lesson","greek-practice","quiz-active"];
const BIBLE_VIEWS = ["books","chapter","verses","verse"];
const LEARN_VIEWS = ["learn-home","hebrew-home","hebrew-lesson","hebrew-practice","hebrew-reading-home","hebrew-reading","hebrew-grammar-home","hebrew-grammar-lesson","greek-home","greek-lesson","greek-practice","greek-reading-home","greek-reading","greek-grammar-home","greek-grammar-lesson","timeline-home","timeline-era","timeline-era-detail","timeline-maps","timeline-books","timeline-archaeology","prophecy-home","apologetics-home","reading-plans-home"];
const PRAYER_VIEWS = ["prayer-home","prayer-community","prayer-clock","prayer-journal","prayer-testimony","prayer-slot-active"];
const SHOP_VIEWS = ["shop-home","shop-category","shop-product","shop-cart","shop-order-success"];

export default function BottomNav() {
  const { view, nav, testament, user, ht, bp, cartCount } = useApp();

  if (HIDDEN_VIEWS.includes(view)) return null;

  return (
    <div style={{ position:"fixed",bottom:0,left:0,right:0,zIndex:50,background:ht.card,borderTop:`1px solid ${ht.divider}`,boxShadow:"0 -1px 0 ${ht.divider}, 0 -4px 20px rgba(0,0,0,0.07)" }}>
      <div style={{ maxWidth:bp.shell,margin:"0 auto",display:"flex",justifyContent:"space-around",alignItems:"center",padding:bp.isMobile?"5px 0 10px":"7px 0 11px" }}>
        {NAV_ITEMS.map(item => {
          const isActive =
            (item.id === "home" && view === "home") ||
            (item.id === "bible" && BIBLE_VIEWS.includes(view)) ||
            (item.id === "learn" && LEARN_VIEWS.includes(view)) ||
            (item.id === "pray" && PRAYER_VIEWS.includes(view)) ||
            (item.id === "shop" && SHOP_VIEWS.includes(view));
          return (
            <button key={item.id} onClick={() => {
              if (item.id === "bible") { nav("books", { testament: testament || "OT" }); }
              else if (item.id === "learn") nav("learn-home");
              else if (item.id === "pray") { nav("prayer-home"); }
              else if (item.id === "shop") { nav("shop-home"); }
              else nav(item.id);
            }} style={{ display:"flex",flexDirection:"column",alignItems:"center",gap:2,background:"none",border:"none",cursor:"pointer",padding:"2px 4px",color:isActive?ht.accent:ht.muted,transition:"color 0.2s ease,opacity 0.2s ease",opacity:isActive?1:0.55,minWidth:0,flex:1 }}>
              {/* Icon pill */}
              <div style={{
                display:"flex",alignItems:"center",justifyContent:"center",
                width:44,height:30,borderRadius:15,
                background: isActive ? `${ht.accent}22` : "transparent",
                transition:"background 0.22s ease",
              }}>
                <div style={{ transform:isActive?"scale(1.08)":"scale(1)",transition:"transform 0.18s ease",position:"relative",lineHeight:0 }}>
                  {item.icon}
                  {item.id === "shop" && cartCount > 0 && (
                    <span style={{ position:"absolute",top:-3,right:-5,minWidth:16,height:16,background:"#ef4444",color:"#fff",borderRadius:8,fontSize:9,fontWeight:700,display:"flex",alignItems:"center",justifyContent:"center",padding:"0 3px",lineHeight:1 }}>
                      {cartCount > 9 ? "9+" : cartCount}
                    </span>
                  )}
                </div>
              </div>
              {/* Label */}
              <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:isActive?700:500,letterSpacing:"0.01em",lineHeight:1 }}>{item.label}</span>
            </button>
          );
        })}
      </div>
    </div>
  );
}
