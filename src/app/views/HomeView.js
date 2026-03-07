"use client";
import { useState, useRef, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, BADGES, BIBLE_TRANSLATIONS } from "../constants";
import { DBBadge, ChevIcon } from "../components/ui";
import ContinueReading from "../components/ContinueReading";
import VerseOfTheDay from "../components/VerseOfTheDay";
import GoToBar from "../components/GoToBar";

export default function HomeView() {
  const {
    ht, darkMode, setDarkMode, dbLive,
    user, profile, streak, earnedBadges,
    showInstall, setShowInstall, installPrompt,
    setDonateModal, nav, bibleTranslation, setBibleTranslation,
  } = useApp();
  const [showLangMenu, setShowLangMenu] = useState(false);
  const langRef = useRef(null);

  // Close dropdown on click outside
  useEffect(() => {
    if (!showLangMenu) return;
    const handler = (e) => { if (langRef.current && !langRef.current.contains(e.target)) setShowLangMenu(false); };
    document.addEventListener("mousedown", handler);
    return () => document.removeEventListener("mousedown", handler);
  }, [showLangMenu]);

  const currentTrans = BIBLE_TRANSLATIONS.find(t => t.id === bibleTranslation) || BIBLE_TRANSLATIONS[0];
  const groups = ["English", "Indian", "International"];
  const groupLabels = { English: "English", Indian: "\u092D\u093E\u0930\u0924\u0940\u092F", International: "International" };

  return (
    <div style={{ minHeight:"100vh",background:ht.bg }}>
      {/* ── MINIMAL TOP BAR ── */}
      <div style={{ background:ht.headerGradient,padding:"10px 16px",position:"sticky",top:0,zIndex:10 }}>
        <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between" }}>
          <div style={{ display:"flex",alignItems:"center",gap:8 }}>
            <svg width="22" height="22" viewBox="0 0 28 28" fill="none" style={{ filter:"drop-shadow(0 0 6px rgba(212,168,83,0.3))" }}>
              <defs><linearGradient id="crossGoldSm" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stopColor="#F5D485"/><stop offset="50%" stopColor="#D4A853"/><stop offset="100%" stopColor="#A87820"/></linearGradient></defs>
              <rect x="11" y="2" width="6" height="24" rx="1.5" fill="url(#crossGoldSm)"/><rect x="3" y="8" width="22" height="6" rx="1.5" fill="url(#crossGoldSm)"/>
            </svg>
            <h1 style={{ fontFamily:ht.heading,fontSize:18,fontWeight:800,color:ht.headerText,margin:0 }}>Study Bible</h1>
          </div>
          <button onClick={() => setDarkMode(!darkMode)} style={{ background:"rgba(255,255,255,0.1)",border:"1px solid rgba(255,255,255,0.15)",borderRadius:8,padding:"4px 10px",cursor:"pointer",display:"flex",alignItems:"center",gap:5,transition:"background 0.2s" }} title={darkMode ? "Switch to Light Mode" : "Switch to Dark Mode"}>
            <span style={{ fontSize:13 }}>{darkMode ? "☀️" : "🌙"}</span>
            <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:600,color:"rgba(255,255,255,0.7)" }}>{darkMode ? "Light" : "Dark"}</span>
          </button>
        </div>
        <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between",marginTop:6 }}>
          <div style={{ display:"flex",alignItems:"center",gap:8,position:"relative" }} ref={langRef}>
            <button onClick={() => setShowLangMenu(v => !v)} style={{ background:"rgba(255,255,255,0.08)",border:"1px solid rgba(255,255,255,0.15)",borderRadius:6,padding:"3px 8px",cursor:"pointer",display:"flex",alignItems:"center",gap:4,transition:"background 0.2s" }}>
              <span style={{ fontFamily:ht.ui,fontSize:10,color:ht.accent,letterSpacing:"0.1em",fontWeight:700 }}>{currentTrans.label}</span>
              <span style={{ fontSize:8,color:"rgba(255,255,255,0.5)",transform:showLangMenu?"rotate(180deg)":"rotate(0deg)",transition:"transform 0.2s" }}>▾</span>
            </button>
            {showLangMenu && (
              <div style={{ position:"absolute",top:"100%",left:0,marginTop:6,background:darkMode?"#1E1C18":"#fff",border:`1px solid ${ht.divider}`,borderRadius:12,padding:"8px 0",minWidth:200,boxShadow:"0 8px 24px rgba(0,0,0,0.2)",zIndex:100,animation:"fadeIn 0.15s ease" }}>
                {groups.map(g => {
                  const items = BIBLE_TRANSLATIONS.filter(t => t.group === g);
                  return (
                    <div key={g}>
                      <div style={{ padding:"6px 14px 4px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em" }}>{groupLabels[g]}</div>
                      {items.map(t => (
                        <button key={t.id} onClick={() => { setBibleTranslation(t.id); setShowLangMenu(false); }} style={{ width:"100%",display:"flex",alignItems:"center",justifyContent:"space-between",padding:"8px 14px",background:bibleTranslation===t.id ? (darkMode?"rgba(212,168,83,0.12)":"rgba(212,168,83,0.08)") : "transparent",border:"none",cursor:"pointer",textAlign:"left",transition:"background 0.15s" }}>
                          <div>
                            <span style={{ fontFamily:ht.ui,fontSize:13,fontWeight:bibleTranslation===t.id?700:500,color:bibleTranslation===t.id?ht.accent:(darkMode?"#D4C8B0":"#3A3028") }}>{t.label}</span>
                            <span style={{ fontFamily:ht.ui,fontSize:10,color:ht.muted,marginLeft:8 }}>{t.name}</span>
                          </div>
                          {bibleTranslation===t.id && <span style={{ color:ht.accent,fontSize:12 }}>✓</span>}
                        </button>
                      ))}
                    </div>
                  );
                })}
              </div>
            )}
            <DBBadge live={dbLive} t={ht} />
          </div>
          <div style={{ display:"flex",alignItems:"center",gap:8 }}>
            {user && Object.keys(earnedBadges).length > 0 && (
              <div onClick={() => nav("account")} title="View Achievements" style={{ display:"flex",alignItems:"center",gap:4,background:darkMode?"#1e3a5f":"#dbeafe",border:"1px solid #3b82f6",borderRadius:20,padding:"3px 10px",cursor:"pointer" }}>
                <span style={{ fontSize:12 }}>🏆</span>
                <span style={{ fontFamily:ht.ui,fontSize:11,fontWeight:700,color:"#3b82f6" }}>{Object.keys(earnedBadges).length}/{BADGES.length}</span>
              </div>
            )}
            {user && streak?.current_streak >= 1 && (
              <div title={`Best: ${streak.longest_streak} days`} style={{ display:"flex",alignItems:"center",gap:4,background:darkMode?"#78350f":"#fef3c7",border:"1px solid #d97706",borderRadius:20,padding:"3px 10px",cursor:"default" }}>
                <span style={{ fontSize:12 }}>🔥</span>
                <span style={{ fontFamily:ht.ui,fontSize:11,fontWeight:700,color:"#d97706" }}>{streak.current_streak}</span>
              </div>
            )}
            {!user && <button onClick={() => nav("account")} style={{ background:"rgba(212,168,83,0.25)",border:"1px solid rgba(212,168,83,0.45)",borderRadius:8,padding:"4px 12px",fontFamily:ht.ui,fontSize:10,fontWeight:700,color:"#fff",cursor:"pointer",letterSpacing:"0.03em" }}>Sign In</button>}
            {user && <span style={{ fontFamily:ht.ui,fontSize:10,color:"rgba(125,212,173,0.9)",fontWeight:700 }}>✓ {(profile?.display_name || user?.user_metadata?.display_name || "Reader")?.split(' ')[0]}</span>}
          </div>
        </div>
        <GoToBar />
      </div>
      {/* ── PWA INSTALL BANNER ── */}
      {showInstall && (
        <div style={{ background:darkMode?"#1c1917":"#f5f3ff",borderBottom:`1px solid ${ht.divider}`,padding:"10px 16px",display:"flex",alignItems:"center",gap:10 }}>
          <span style={{ fontSize:18 }}>📲</span>
          <span style={{ flex:1,fontFamily:ht.ui,fontSize:13,color:ht.text }}>Add to Home Screen for offline reading</span>
          <button
            onClick={() => { installPrompt?.prompt(); setShowInstall(false); }}
            style={{ background:ht.accent,color:"#fff",border:"none",borderRadius:8,padding:"5px 12px",fontSize:12,fontWeight:600,cursor:"pointer" }}>
            Install
          </button>
          <button
            onClick={() => { setShowInstall(false); try { localStorage.setItem("pwa-dismissed","1"); } catch {} }}
            style={{ background:"transparent",border:"none",color:ht.muted,fontSize:16,cursor:"pointer",padding:"0 4px" }}>
            ✕
          </button>
        </div>
      )}
      <div style={{ padding:"22px 20px 40px" }}>
        <div style={{ maxWidth:520,margin:"0 auto" }}>
          {/* ── SEARCH BAR ── */}
          <button onClick={() => nav("search")} style={{ width:"100%",display:"flex",alignItems:"center",gap:10,padding:"12px 16px",borderRadius:14,border:`1.5px solid ${ht.divider}`,background:ht.card,cursor:"pointer",marginBottom:16,boxShadow:"0 1px 4px rgba(0,0,0,0.04)",transition:"border 0.2s" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke={ht.muted} strokeWidth="2" strokeLinecap="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            <span style={{ fontFamily:ht.ui,fontSize:14,color:ht.light,fontWeight:500 }}>Search the Scriptures...</span>
          </button>
          {/* ── VERSE OF THE DAY ── */}
          <VerseOfTheDay nav={nav} ht={ht} />
          <button onClick={() => setDonateModal(true)} style={{ width:"100%",background:"linear-gradient(135deg,rgba(212,168,83,0.18),rgba(184,134,11,0.08))",border:"1px solid rgba(212,168,83,0.35)",borderRadius:14,padding:"14px 16px",marginBottom:18,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",gap:12,boxShadow:"0 2px 8px rgba(212,168,83,0.12)",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",top:0,left:0,right:0,height:2,background:"linear-gradient(90deg,transparent,rgba(212,168,83,0.6),transparent)" }}/>
            <div style={{ width:44,height:44,borderRadius:12,background:"linear-gradient(135deg,#4A90D9,#1A5C8A)",display:"flex",alignItems:"center",justifyContent:"center",fontSize:22,flexShrink:0,boxShadow:"0 2px 8px rgba(74,144,217,0.35)" }}>🕊️</div>
            <div style={{ flex:1 }}>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Support the Ministry</div>
              <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted,lineHeight:1.5,marginTop:2 }}>Every feature is free. Your generosity keeps it that way.</div>
            </div>
            <div style={{ color:ht.light }}><ChevIcon /></div>
          </button>
          {/* ── CONTINUE READING ── */}
          <ContinueReading nav={nav} ht={ht} user={user} />

          {/* ── THE HOLY SCRIPTURES ── */}
          <div style={{ marginBottom:6 }}>
            <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em",marginBottom:14,display:"flex",alignItems:"center",gap:8 }}>
              <span>📖</span> The Holy Scriptures
            </div>
            <div style={{ display:"flex", gap:12, marginBottom:16 }}>
              {[
                { t:"OT", l:"Old Testament", s:"39 Books", sub:"Genesis — Malachi", o:"בְּרֵאשִׁית", om:"In the Beginning", thm:"garden", icon:"📜" },
                { t:"NT", l:"New Testament", s:"27 Books", sub:"Matthew — Revelation", o:"Καινὴ Διαθήκη", om:"The New Covenant", thm:"ocean", icon:"✝️" },
              ].map(item => (
                <button key={item.t} onClick={() => nav("books",{testament:item.t})}
                  style={{ flex:1, cursor:"pointer", border:"none", background:"transparent", padding:0, display:"flex", flexDirection:"column", filter:"drop-shadow(0 4px 12px rgba(0,0,0,0.15))" }}>
                  {/* Top roll */}
                  <div style={{ height:22, background:THEMES[item.thm].headerGradient, borderRadius:"12px 12px 0 0", position:"relative", overflow:"hidden" }}>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"55%", height:8, background:"rgba(255,255,255,0.12)", borderRadius:10 }}/>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"30%", height:4, background:"rgba(255,255,255,0.08)", borderRadius:10 }}/>
                  </div>
                  {/* Parchment body */}
                  <div style={{ background:"linear-gradient(180deg,#FEF3D8 0%,#FAE8BB 40%,#FEF3D8 100%)", padding:"18px 10px 16px", borderLeft:`1px solid rgba(180,140,60,0.3)`, borderRight:`1px solid rgba(180,140,60,0.3)`, textAlign:"center", flex:1 }}>
                    <div style={{ fontSize:30, marginBottom:10, filter:"drop-shadow(0 2px 4px rgba(0,0,0,0.2))" }}>{item.icon}</div>
                    <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:700, color:THEMES[item.thm].dark, lineHeight:1.3, marginBottom:6 }}>{item.l}</div>
                    <div style={{ width:28, height:2, background:THEMES[item.thm].accent, borderRadius:2, margin:"0 auto 8px" }}/>
                    <div style={{ fontFamily:ht.ui, fontSize:11, color:THEMES[item.thm].muted, marginBottom:10, letterSpacing:"0.02em" }}>{item.s}</div>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:item.t==="OT"?17:13, color:THEMES[item.thm].accent, fontWeight:700, marginBottom:4, direction:item.t==="OT"?"rtl":"ltr", lineHeight:1.4 }}>{item.o}</div>
                    <div style={{ fontFamily:ht.body, fontSize:10.5, color:THEMES[item.thm].muted, fontStyle:"italic", lineHeight:1.5 }}>{item.om}</div>
                    <div style={{ marginTop:12, padding:"5px 10px", borderRadius:6, background:`${THEMES[item.thm].accent}18`, border:`1px solid ${THEMES[item.thm].accentBorder}`, display:"inline-block" }}>
                      <span style={{ fontFamily:ht.ui, fontSize:10, fontWeight:700, color:THEMES[item.thm].accent, textTransform:"uppercase", letterSpacing:"0.08em" }}>{item.sub}</span>
                    </div>
                  </div>
                  {/* Bottom roll */}
                  <div style={{ height:22, background:THEMES[item.thm].headerGradient, borderRadius:"0 0 12px 12px", position:"relative", overflow:"hidden" }}>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"55%", height:8, background:"rgba(255,255,255,0.12)", borderRadius:10 }}/>
                    <div style={{ position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)", width:"30%", height:4, background:"rgba(255,255,255,0.08)", borderRadius:10 }}/>
                  </div>
                </button>
              ))}
            </div>
          </div>

          {/* ── HEAR IT AS IT WAS WRITTEN ── */}
          <div style={{ marginBottom:6,marginTop:10 }}>
            <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em",marginBottom:14,display:"flex",alignItems:"center",gap:8 }}>
              <span>🗣️</span> Hear It As It Was Written
            </div>
            <div style={{ display:"flex",gap:12,marginBottom:16 }}>
              {/* Hebrew Card — Jerusalem Limestone */}
              <button onClick={() => nav("hebrew-home")} style={{ flex:1,cursor:"pointer",border:"none",background:"transparent",padding:0,filter:"drop-shadow(0 6px 16px rgba(0,0,0,0.25))" }}>
                <div style={{ borderRadius:14,overflow:"hidden",display:"flex",flexDirection:"column",border:"2px solid #8B6B3D",boxShadow:"inset 0 1px 0 rgba(255,255,255,0.15)" }}>
                  {/* Stone header */}
                  <div style={{ background:"linear-gradient(160deg,#4A3420 0%,#6B4A28 50%,#3D2810 100%)",padding:"16px 10px 12px",textAlign:"center",position:"relative",overflow:"hidden" }}>
                    <div style={{ position:"absolute",inset:0,backgroundImage:"repeating-linear-gradient(0deg,transparent,transparent 3px,rgba(0,0,0,0.04) 3px,rgba(0,0,0,0.04) 4px),repeating-linear-gradient(90deg,transparent,transparent 5px,rgba(255,255,255,0.02) 5px,rgba(255,255,255,0.02) 6px)" }}/>
                    <div style={{ position:"absolute",inset:0,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:56,color:"rgba(255,200,100,0.08)",direction:"rtl",fontWeight:700,userSelect:"none",lineHeight:1 }}>א</div>
                    <div style={{ position:"relative",zIndex:1,fontSize:26,marginBottom:6,filter:"drop-shadow(0 2px 4px rgba(0,0,0,0.4))" }}>🪨</div>
                    <div style={{ fontFamily:"'Times New Roman',serif",fontSize:19,color:"#D4A853",direction:"rtl",lineHeight:1,textShadow:"0 1px 4px rgba(0,0,0,0.5)" }}>עִבְרִית</div>
                  </div>
                  {/* Limestone body */}
                  <div style={{ background:"linear-gradient(180deg,#D6C9A8 0%,#C8B88A 50%,#BEA878 100%)",padding:"14px 10px",textAlign:"center",flex:1,borderTop:"1px solid #8B6B3D",boxShadow:"inset 0 2px 6px rgba(0,0,0,0.12)" }}>
                    <div style={{ fontFamily:ht.heading,fontSize:14,fontWeight:700,color:"#2A1A08",marginBottom:4 }}>Learn Hebrew</div>
                    <div style={{ width:28,height:2,background:"linear-gradient(90deg,transparent,#8B6B3D,transparent)",borderRadius:2,margin:"0 auto 8px" }}/>
                    <div style={{ fontFamily:ht.ui,fontSize:10.5,color:"#5C4420",lineHeight:1.6,marginBottom:10 }}>Moses · David · Isaiah in their own tongue</div>
                    <div style={{ display:"inline-block",padding:"5px 12px",borderRadius:4,background:"rgba(74,52,32,0.15)",border:"1px solid rgba(139,107,61,0.5)",boxShadow:"inset 0 1px 2px rgba(0,0,0,0.1)" }}>
                      <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:"#4A3420",textTransform:"uppercase",letterSpacing:"0.07em" }}>Start Learning →</span>
                    </div>
                  </div>
                </div>
              </button>
              {/* Greek Card — Pentelic Marble */}
              <button onClick={() => nav("greek-home")} style={{ flex:1,cursor:"pointer",border:"none",background:"transparent",padding:0,filter:"drop-shadow(0 6px 16px rgba(0,0,0,0.22))",position:"relative" }}>
                <div style={{ borderRadius:14,overflow:"hidden",display:"flex",flexDirection:"column",border:"2px solid #8A8FA8",boxShadow:"inset 0 1px 0 rgba(255,255,255,0.2)" }}>
                  {/* Marble header */}
                  <div style={{ background:"linear-gradient(160deg,#2A2A3E 0%,#3E3E56 50%,#22222E 100%)",padding:"16px 10px 12px",textAlign:"center",position:"relative",overflow:"hidden" }}>
                    <div style={{ position:"absolute",inset:0,backgroundImage:"repeating-linear-gradient(125deg,transparent,transparent 8px,rgba(255,255,255,0.015) 8px,rgba(255,255,255,0.015) 9px)" }}/>
                    <div style={{ position:"absolute",top:"20%",left:"-10%",width:"120%",height:"1px",background:"rgba(180,180,220,0.08)",transform:"rotate(-15deg)" }}/>
                    <div style={{ position:"absolute",top:"55%",left:"-10%",width:"120%",height:"1px",background:"rgba(180,180,220,0.06)",transform:"rotate(-15deg)" }}/>
                    <div style={{ position:"absolute",inset:0,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"serif",fontSize:56,color:"rgba(180,180,255,0.07)",fontWeight:700,userSelect:"none",lineHeight:1 }}>Α</div>
                    <div style={{ position:"relative",zIndex:1,fontSize:26,marginBottom:6,filter:"drop-shadow(0 2px 4px rgba(0,0,0,0.4))" }}>🏛️</div>
                    <div style={{ fontFamily:"serif",fontSize:19,color:"#B8C4D8",lineHeight:1,textShadow:"0 1px 4px rgba(0,0,0,0.5)" }}>Ἑλληνική</div>
                  </div>
                  {/* Marble body */}
                  <div style={{ background:"linear-gradient(180deg,#E8E8F0 0%,#D8D8E8 50%,#CCCCDC 100%)",padding:"14px 10px",textAlign:"center",flex:1,borderTop:"1px solid #8A8FA8",boxShadow:"inset 0 2px 6px rgba(0,0,0,0.08)",position:"relative",overflow:"hidden" }}>
                    <div style={{ position:"absolute",top:"15%",left:"-5%",width:"110%",height:"1px",background:"rgba(100,100,160,0.08)",transform:"rotate(-8deg)" }}/>
                    <div style={{ position:"absolute",top:"60%",left:"-5%",width:"110%",height:"1px",background:"rgba(100,100,160,0.06)",transform:"rotate(-8deg)" }}/>
                    <div style={{ position:"relative",zIndex:1 }}>
                      <div style={{ fontFamily:ht.heading,fontSize:14,fontWeight:700,color:"#1A1A2E",marginBottom:4 }}>Learn Greek</div>
                      <div style={{ width:28,height:2,background:"linear-gradient(90deg,transparent,#6A6A8A,transparent)",borderRadius:2,margin:"0 auto 8px" }}/>
                      <div style={{ fontFamily:ht.ui,fontSize:10.5,color:"#3A3A5A",lineHeight:1.6,marginBottom:10 }}>Paul · John · Luke in Koine Greek</div>
                      <div style={{ display:"inline-block",padding:"5px 12px",borderRadius:4,background:"rgba(42,42,62,0.12)",border:"1px solid rgba(138,143,168,0.5)",boxShadow:"inset 0 1px 2px rgba(0,0,0,0.08)" }}>
                        <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:"#2A2A4A",textTransform:"uppercase",letterSpacing:"0.07em" }}>Start Learning →</span>
                      </div>
                    </div>
                  </div>
                </div>
              </button>
            </div>
          </div>

          {/* ── GO DEEPER — Altar of Incense (diamond layout) ── */}
          <style>{`
            @keyframes altarPulse { 0%,100% { box-shadow: 0 0 0 2px rgba(212,168,83,0.5),0 0 30px rgba(212,168,83,0.2),0 0 60px rgba(212,168,83,0.08); } 50% { box-shadow: 0 0 0 3px rgba(212,168,83,0.6),0 0 40px rgba(212,168,83,0.35),0 0 80px rgba(212,168,83,0.15); } }
            @keyframes sealFloat { 0%,100% { transform: translateY(0px); } 50% { transform: translateY(-3px); } }
            @keyframes lineFlow { 0% { stroke-dashoffset: 20; } 100% { stroke-dashoffset: 0; } }
            .altar-seal { transition: transform 0.2s, box-shadow 0.2s; }
            .altar-seal:hover { transform: scale(1.08); }
            .altar-seal:active { transform: scale(0.95); }
          `}</style>
          <div style={{ marginBottom:6,marginTop:10 }}>
            <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em",marginBottom:14,display:"flex",alignItems:"center",gap:8 }}>
              <span>🔥</span> Go Deeper
            </div>
            <div style={{ background:"linear-gradient(160deg,#1C1612 0%,#2D1B4E 50%,#1A2F4B 100%)",borderRadius:20,padding:"30px 16px 22px",position:"relative",overflow:"hidden",boxShadow:"0 8px 32px rgba(0,0,0,0.35),inset 0 1px 0 rgba(255,255,255,0.05)" }}>
              {/* Stone texture */}
              <div style={{ position:"absolute",inset:0,opacity:0.3,pointerEvents:"none",backgroundImage:`url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.75' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.15'/%3E%3C/svg%3E")` }}/>
              {/* Pulsing radial glow from center */}
              <div style={{ position:"absolute",top:"50%",left:"50%",transform:"translate(-50%,-50%)",width:240,height:240,background:"radial-gradient(circle,rgba(212,168,83,0.18) 0%,rgba(212,168,83,0.05) 40%,transparent 70%)",pointerEvents:"none",animation:"altarPulse 4s ease-in-out infinite" }}/>
              {/* Animated connecting lines — dashed golden paths */}
              <svg style={{ position:"absolute",top:0,left:0,width:"100%",height:"100%",pointerEvents:"none",zIndex:0 }} viewBox="0 0 400 340" preserveAspectRatio="none">
                <line x1="200" y1="68" x2="100" y2="170" stroke="rgba(212,168,83,0.2)" strokeWidth="1" strokeDasharray="6 4" style={{ animation:"lineFlow 3s linear infinite" }}/>
                <line x1="200" y1="68" x2="300" y2="170" stroke="rgba(212,168,83,0.2)" strokeWidth="1" strokeDasharray="6 4" style={{ animation:"lineFlow 3s linear infinite",animationDelay:"0.5s" }}/>
                <line x1="100" y1="170" x2="200" y2="272" stroke="rgba(212,168,83,0.2)" strokeWidth="1" strokeDasharray="6 4" style={{ animation:"lineFlow 3s linear infinite",animationDelay:"1s" }}/>
                <line x1="300" y1="170" x2="200" y2="272" stroke="rgba(212,168,83,0.2)" strokeWidth="1" strokeDasharray="6 4" style={{ animation:"lineFlow 3s linear infinite",animationDelay:"1.5s" }}/>
              </svg>
              {/* Diamond grid */}
              <div style={{ position:"relative",zIndex:1,display:"flex",flexDirection:"column",alignItems:"center",gap:4 }}>
                {/* Top — Timeline */}
                {(() => { const s = { label:"Timeline",sub:"6,000 years",letter:"⌛",action:() => nav("timeline-home"),seal:"#8B2020",sealLight:"#C44040",glow:"rgba(196,64,64,0.25)" }; return (
                  <button onClick={s.action} className="pressable" style={{ background:"none",border:"none",cursor:"pointer",display:"flex",flexDirection:"column",alignItems:"center",gap:5,padding:8 }}>
                    <div className="altar-seal" style={{ width:58,height:58,borderRadius:"50%",background:`radial-gradient(circle at 35% 35%,${s.sealLight},${s.seal} 60%)`,display:"flex",alignItems:"center",justifyContent:"center",boxShadow:`0 0 0 3px rgba(255,255,255,0.85),0 0 20px ${s.glow},0 4px 12px rgba(0,0,0,0.35)`,animation:"sealFloat 4s ease-in-out infinite" }}>
                      <span style={{ fontSize:23,color:"rgba(255,255,255,0.9)",textShadow:"0 1px 2px rgba(0,0,0,0.3)" }}>{s.letter}</span>
                    </div>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:ht.heading,fontSize:13.5,fontWeight:700,color:"#FFFFFFDD",textShadow:"0 1px 3px rgba(0,0,0,0.4)" }}>{s.label} <span style={{ fontSize:11,opacity:0.5 }}>→</span></div>
                      <div style={{ fontFamily:ht.ui,fontSize:9.5,color:"rgba(255,255,255,0.4)",marginTop:1 }}>{s.sub}</div>
                    </div>
                  </button>
                ); })()}
                {/* Middle row — Prophecy + Center Flame + Apologetics */}
                <div style={{ display:"flex",alignItems:"center",justifyContent:"center",gap:0,width:"100%" }}>
                  {(() => { const s = { label:"Prophecy",sub:"300+ fulfilled",letter:"✦",action:() => nav("prophecy-home"),seal:"#4A2D8E",sealLight:"#7B52D4",glow:"rgba(123,82,212,0.25)" }; return (
                    <button onClick={s.action} className="pressable" style={{ background:"none",border:"none",cursor:"pointer",display:"flex",flexDirection:"column",alignItems:"center",gap:5,padding:8,flex:1 }}>
                      <div className="altar-seal" style={{ width:58,height:58,borderRadius:"50%",background:`radial-gradient(circle at 35% 35%,${s.sealLight},${s.seal} 60%)`,display:"flex",alignItems:"center",justifyContent:"center",boxShadow:`0 0 0 3px rgba(255,255,255,0.85),0 0 20px ${s.glow},0 4px 12px rgba(0,0,0,0.35)`,animation:"sealFloat 4s ease-in-out infinite",animationDelay:"0.5s" }}>
                        <span style={{ fontSize:23,color:"rgba(255,255,255,0.9)",textShadow:"0 1px 2px rgba(0,0,0,0.3)" }}>{s.letter}</span>
                      </div>
                      <div style={{ textAlign:"center" }}>
                        <div style={{ fontFamily:ht.heading,fontSize:13.5,fontWeight:700,color:"#FFFFFFDD",textShadow:"0 1px 3px rgba(0,0,0,0.4)" }}>{s.label} <span style={{ fontSize:11,opacity:0.5 }}>→</span></div>
                        <div style={{ fontFamily:ht.ui,fontSize:9.5,color:"rgba(255,255,255,0.4)",marginTop:1 }}>{s.sub}</div>
                      </div>
                    </button>
                  ); })()}
                  {/* Center altar flame — animated pulse */}
                  <div style={{ display:"flex",flexDirection:"column",alignItems:"center",gap:4,flexShrink:0 }}>
                    <div style={{ width:50,height:50,borderRadius:"50%",background:"radial-gradient(circle at 50% 40%,#D4A853,#8B6914 70%)",display:"flex",alignItems:"center",justifyContent:"center",animation:"altarPulse 4s ease-in-out infinite",flexShrink:0 }}>
                      <span style={{ fontSize:24,filter:"drop-shadow(0 0 8px rgba(255,180,50,0.7))" }}>🔥</span>
                    </div>
                    <div style={{ fontFamily:ht.ui,fontSize:8,color:"rgba(212,168,83,0.5)",textTransform:"uppercase",letterSpacing:"0.1em",whiteSpace:"nowrap" }}>Tap to explore</div>
                  </div>
                  {(() => { const s = { label:"Apologetics",sub:"Defend the faith",letter:"🛡️",action:() => nav("apologetics-home"),seal:"#1B5E4A",sealLight:"#2D8E6E",glow:"rgba(45,142,110,0.25)" }; return (
                    <button onClick={s.action} className="pressable" style={{ background:"none",border:"none",cursor:"pointer",display:"flex",flexDirection:"column",alignItems:"center",gap:5,padding:8,flex:1 }}>
                      <div className="altar-seal" style={{ width:58,height:58,borderRadius:"50%",background:`radial-gradient(circle at 35% 35%,${s.sealLight},${s.seal} 60%)`,display:"flex",alignItems:"center",justifyContent:"center",boxShadow:`0 0 0 3px rgba(255,255,255,0.85),0 0 20px ${s.glow},0 4px 12px rgba(0,0,0,0.35)`,animation:"sealFloat 4s ease-in-out infinite",animationDelay:"1s" }}>
                        <span style={{ fontSize:23,color:"rgba(255,255,255,0.9)",textShadow:"0 1px 2px rgba(0,0,0,0.3)" }}>{s.letter}</span>
                      </div>
                      <div style={{ textAlign:"center" }}>
                        <div style={{ fontFamily:ht.heading,fontSize:13.5,fontWeight:700,color:"#FFFFFFDD",textShadow:"0 1px 3px rgba(0,0,0,0.4)" }}>{s.label} <span style={{ fontSize:11,opacity:0.5 }}>→</span></div>
                        <div style={{ fontFamily:ht.ui,fontSize:9.5,color:"rgba(255,255,255,0.4)",marginTop:1 }}>{s.sub}</div>
                      </div>
                    </button>
                  ); })()}
                </div>
                {/* Bottom — Reading Plans */}
                {(() => { const s = { label:"Reading Plans",sub:"Guided journeys",letter:"☩",action:() => nav("reading-plans-home"),seal:"#8B6914",sealLight:"#C4961E",glow:"rgba(196,150,30,0.25)" }; return (
                  <button onClick={s.action} className="pressable" style={{ background:"none",border:"none",cursor:"pointer",display:"flex",flexDirection:"column",alignItems:"center",gap:5,padding:8 }}>
                    <div className="altar-seal" style={{ width:58,height:58,borderRadius:"50%",background:`radial-gradient(circle at 35% 35%,${s.sealLight},${s.seal} 60%)`,display:"flex",alignItems:"center",justifyContent:"center",boxShadow:`0 0 0 3px rgba(255,255,255,0.85),0 0 20px ${s.glow},0 4px 12px rgba(0,0,0,0.35)`,animation:"sealFloat 4s ease-in-out infinite",animationDelay:"1.5s" }}>
                      <span style={{ fontSize:23,color:"rgba(255,255,255,0.9)",textShadow:"0 1px 2px rgba(0,0,0,0.3)" }}>{s.letter}</span>
                    </div>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:ht.heading,fontSize:13.5,fontWeight:700,color:"#FFFFFFDD",textShadow:"0 1px 3px rgba(0,0,0,0.4)" }}>{s.label} <span style={{ fontSize:11,opacity:0.5 }}>→</span></div>
                      <div style={{ fontFamily:ht.ui,fontSize:9.5,color:"rgba(255,255,255,0.4)",marginTop:1 }}>{s.sub}</div>
                    </div>
                  </button>
                ); })()}
              </div>
            </div>
          </div>

          {/* ── LITTLE DISCIPLES ── */}
          <div style={{ marginBottom:22,marginTop:10 }}>
            <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em",marginBottom:14,display:"flex",alignItems:"center",gap:8 }}>
              <span>🐑</span> Little Disciples
            </div>
            <div onClick={() => nav("kids-curriculum-home")} style={{ background:"linear-gradient(135deg,rgba(212,168,83,0.08),rgba(139,92,246,0.06))",border:`1px solid ${ht.accentBorder}`,borderRadius:14,padding:"20px 18px",display:"flex",alignItems:"center",gap:14,cursor:"pointer" }}>
              <div style={{ width:52,height:52,borderRadius:14,background:"linear-gradient(135deg,rgba(212,168,83,0.3),rgba(139,92,246,0.3))",display:"flex",alignItems:"center",justifyContent:"center",fontSize:30,flexShrink:0 }}>🐑</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:ht.heading,fontSize:17,fontWeight:700,color:ht.dark,lineHeight:1.3 }}>Kids Church Curriculum</div>
                <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.accent,fontWeight:600,marginTop:1 }}>52-Week Bible Study · Ages 3–12</div>
                <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted,marginTop:4,lineHeight:1.7 }}>Age-grouped lessons that bring Scripture alive for the next generation — from toddlers to preteens.</div>
              </div>
              <div style={{ background:"rgba(16,185,129,0.12)",borderRadius:6,padding:"3px 10px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#059669",textTransform:"uppercase",letterSpacing:"0.05em",flexShrink:0 }}>New ✦</div>
            </div>
          </div>

          <div style={{ display:"flex",justifyContent:"center",gap:28,marginTop:22,padding:"14px 0",borderTop:`1px solid ${ht.divider}` }}>
            {[{n:"66",l:"Books"},{n:"1,189",l:"Chapters"},{n:"31,102",l:"Verses"}].map((s,i) => (
              <div key={i} style={{ textAlign:"center" }}>
                <div style={{ fontFamily:ht.heading,fontSize:20,fontWeight:700,color:ht.dark }}>{s.n}</div>
                <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.1em" }}>{s.l}</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
