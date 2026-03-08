"use client";
import { useState, useRef, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { BIBLE_TRANSLATIONS } from "../constants";
import { DBBadge } from "./ui";

export default function UtilityStrip({ theme, showLangPicker = false }) {
  const {
    ht, darkMode, setDarkMode, dbLive,
    user, profile, streak,
    nav, bibleTranslation, setBibleTranslation,
  } = useApp();
  const th = theme || ht;
  const [showLangMenu, setShowLangMenu] = useState(false);
  const langRef = useRef(null);

  useEffect(() => {
    if (!showLangMenu) return;
    const handler = (e) => { if (langRef.current && !langRef.current.contains(e.target)) setShowLangMenu(false); };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, [showLangMenu]);

  const currentTrans = BIBLE_TRANSLATIONS.find(t => t.id === bibleTranslation) || BIBLE_TRANSLATIONS[0];
  const groups = ["English", "Indian", "International"];
  const groupLabels = { English: "English", Indian: "\u092D\u093E\u0930\u0924\u0940\u092F", International: "International" };
  const firstName = (profile?.display_name || user?.user_metadata?.display_name || "Reader")?.split(' ')[0];

  return (
    <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between",padding:"6px 0 8px",borderTop:"1px solid rgba(255,255,255,0.08)",marginTop:2 }}>
      <div style={{ display:"flex",alignItems:"center",gap:8,position:"relative" }} ref={langRef}>
        {showLangPicker && (
          <>
            <button onClick={() => setShowLangMenu(v => !v)} style={{ background:"rgba(255,255,255,0.08)",border:"1px solid rgba(255,255,255,0.12)",borderRadius:6,padding:"3px 8px",cursor:"pointer",display:"flex",alignItems:"center",gap:4,transition:"background 0.2s" }}>
              <span style={{ fontFamily:th.ui,fontSize:10,color:th.accent,letterSpacing:"0.1em",fontWeight:700 }}>{currentTrans.label}</span>
              <span style={{ fontSize:8,color:"rgba(255,255,255,0.5)",transform:showLangMenu?"rotate(180deg)":"rotate(0deg)",transition:"transform 0.2s" }}>&#9662;</span>
            </button>
            {showLangMenu && (
              <div style={{ position:"absolute",top:"100%",left:0,marginTop:6,background:darkMode?"#1E1C18":"#fff",border:`1px solid ${th.divider}`,borderRadius:12,padding:"8px 0",minWidth:200,boxShadow:"0 8px 24px rgba(0,0,0,0.2)",zIndex:100,animation:"fadeIn 0.15s ease" }}>
                {groups.map(g => {
                  const items = BIBLE_TRANSLATIONS.filter(t => t.group === g);
                  return (
                    <div key={g}>
                      <div style={{ padding:"6px 14px 4px",fontFamily:th.ui,fontSize:9,fontWeight:700,color:th.muted,textTransform:"uppercase",letterSpacing:"0.12em" }}>{groupLabels[g]}</div>
                      {items.map(t => (
                        <button key={t.id} onClick={() => { setBibleTranslation(t.id); setShowLangMenu(false); }} style={{ width:"100%",display:"flex",alignItems:"center",justifyContent:"space-between",padding:"8px 14px",background:bibleTranslation===t.id ? (darkMode?"rgba(212,168,83,0.12)":"rgba(212,168,83,0.08)") : "transparent",border:"none",cursor:"pointer",textAlign:"left",transition:"background 0.15s" }}>
                          <div>
                            <span style={{ fontFamily:th.ui,fontSize:13,fontWeight:bibleTranslation===t.id?700:500,color:bibleTranslation===t.id?th.accent:(darkMode?"#D4C8B0":"#3A3028") }}>{t.label}</span>
                            <span style={{ fontFamily:th.ui,fontSize:10,color:th.muted,marginLeft:8 }}>{t.name}</span>
                          </div>
                          {bibleTranslation===t.id && <span style={{ color:th.accent,fontSize:12 }}>&#10003;</span>}
                        </button>
                      ))}
                    </div>
                  );
                })}
              </div>
            )}
          </>
        )}
        <DBBadge live={dbLive} t={th} />
      </div>
      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
        {user && streak?.current_streak >= 1 && (
          <div title={`Best: ${streak.longest_streak} days`} style={{ display:"flex",alignItems:"center",gap:3,cursor:"default" }}>
            <span style={{ fontSize:11 }}>&#128293;</span>
            <span style={{ fontFamily:th.ui,fontSize:10,fontWeight:700,color:"#d97706" }}>{streak.current_streak}</span>
          </div>
        )}
        <button onClick={() => setDarkMode(!darkMode)} style={{ background:"rgba(255,255,255,0.08)",border:"1px solid rgba(255,255,255,0.12)",borderRadius:6,padding:"3px 8px",cursor:"pointer",display:"flex",alignItems:"center",gap:4,transition:"background 0.2s" }} title={darkMode ? "Switch to Light Mode" : "Switch to Dark Mode"}>
          <span style={{ fontSize:11 }}>{darkMode ? "\u2600\uFE0F" : "\uD83C\uDF19"}</span>
          <span style={{ fontFamily:th.ui,fontSize:9,fontWeight:600,color:"rgba(255,255,255,0.6)" }}>{darkMode ? "Light" : "Dark"}</span>
        </button>
        {!user && <button onClick={() => nav("account")} style={{ background:"rgba(212,168,83,0.25)",border:"1px solid rgba(212,168,83,0.45)",borderRadius:6,padding:"3px 10px",fontFamily:th.ui,fontSize:9,fontWeight:700,color:"#fff",cursor:"pointer",letterSpacing:"0.03em" }}>Sign In</button>}
        {user && <span onClick={() => nav("account")} style={{ fontFamily:th.ui,fontSize:10,color:"rgba(125,212,173,0.9)",fontWeight:700,cursor:"pointer" }}>&#10003; {firstName}</span>}
      </div>
    </div>
  );
}
