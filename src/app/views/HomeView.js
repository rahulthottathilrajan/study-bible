"use client";
import { useState, useEffect, useRef } from "react";
import { useApp } from "../context/AppContext";
import ContinueReading from "../components/ContinueReading";
import VerseOfTheDay from "../components/VerseOfTheDay";
import GoToBar from "../components/GoToBar";
import UtilityStrip from "../components/UtilityStrip";
import HymnOfTheDay from "../components/HymnOfTheDay";
import { BIRTHDAY_VERSES } from "../constants";

export default function HomeView() {
  const {
    ht, darkMode, user, profile, bp, isBirthdayToday,
    showInstall, setShowInstall, installPrompt,
    setDonateModal, nav,
  } = useApp();

  // ─── Welcome-back / Birthday splash (only on fresh app open, not refresh/in-app nav) ───
  const [showSplash, setShowSplash] = useState(false);
  const [splashFading, setSplashFading] = useState(false);
  const [splashName, setSplashName] = useState("");
  const [splashIsBirthday, setSplashIsBirthday] = useState(false);
  const [birthdayVerse, setBirthdayVerse] = useState(null);
  const splashRan = useRef(false);

  useEffect(() => {
    if (splashRan.current) return;
    if (!user) return;
    splashRan.current = true;
    try {
      const alreadyInSession = sessionStorage.getItem("appOpened");
      const hasVisitedBefore = localStorage.getItem("lastVisit");
      sessionStorage.setItem("appOpened", "1");
      localStorage.setItem("lastVisit", String(Date.now()));
      if (alreadyInSession || !hasVisitedBefore) return;
      const name = profile?.nickname || (profile?.full_name || profile?.display_name || user?.user_metadata?.display_name || "").split(" ")[0] || "Reader";
      if (!name) return;
      setSplashName(name);
      // Birthday splash replaces welcome-back
      if (isBirthdayToday) {
        setSplashIsBirthday(true);
        const now = new Date();
        const dayOfYear = Math.floor((now - new Date(now.getFullYear(), 0, 0)) / 86400000);
        setBirthdayVerse(BIRTHDAY_VERSES[dayOfYear % BIRTHDAY_VERSES.length]);
      }
      setShowSplash(true);
      const showDuration = isBirthdayToday ? 3600 : 2400;
      setTimeout(() => setSplashFading(true), showDuration);
      setTimeout(() => { setShowSplash(false); setSplashFading(false); }, showDuration + 600);
    } catch {}
  }, [user, profile, isBirthdayToday]);

  return (
    <div style={{ minHeight:"100vh",background:ht.bg }}>
      {/* ── MINIMAL TOP BAR ── */}
      <div style={{ background:ht.headerGradient,padding:"10px 16px 0",position:"sticky",top:0,zIndex:10 }}>
        {/* Row 1: Logo + Title | Support Icon */}
        <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between" }}>
          <div style={{ display:"flex",alignItems:"center",gap:8 }}>
            <img src="/icon.png" alt="The Bible Scrollers" width={34} height={34} style={{ filter:"drop-shadow(0 0 8px rgba(212,168,83,0.4))" }} />
            <h1 style={{ fontFamily:ht.heading,fontSize:17,fontWeight:800,color:ht.headerText,margin:0 }}>The Bible Scrollers</h1>
          </div>
          <button onClick={() => setDonateModal(true)} title="Support the Ministry" style={{ background:"rgba(255,255,255,0.1)",border:"1px solid rgba(255,255,255,0.15)",borderRadius:10,padding:"5px 10px",cursor:"pointer",display:"flex",alignItems:"center",gap:4,transition:"background 0.2s" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" style={{ filter:"drop-shadow(0 1px 2px rgba(0,0,0,0.3))" }}>
              {/* Body + head */}
              <path d="M13 7c-1.2 0-2.2.8-2.2 2 0 .5.2 1 .6 1.4L5 15.5s3.2-1 5.3-.2L12 18l1.7-2.7c2.1-.8 5.3.2 5.3.2l-5.6-5.1c.4-.4.6-.9.6-1.4 0-1.2-1-2-2-2z" fill="rgba(255,255,255,0.9)" stroke="rgba(255,255,255,0.6)" strokeWidth="0.3"/>
              {/* Olive branch from beak */}
              <path d="M15 8.5c1.2-.8 3-1 4.5-.5" stroke="#6B8E4E" strokeWidth="0.8" strokeLinecap="round" fill="none"/>
              <ellipse cx="18" cy="7.5" rx="1.5" ry="0.8" transform="rotate(-20 18 7.5)" fill="#7DA85C" opacity="0.9"/>
              <ellipse cx="19.8" cy="7.8" rx="1.2" ry="0.7" transform="rotate(-10 19.8 7.8)" fill="#6B9E4E" opacity="0.8"/>
            </svg>
            <span style={{ fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"rgba(255,255,255,0.7)",letterSpacing:"0.05em" }}>GIVE</span>
          </button>
        </div>
        {/* ── ANIMATED ACCENT LINE ── */}
        <div style={{ height:2,background:"linear-gradient(90deg,rgba(212,168,83,0.6),rgba(255,255,255,0.9),rgba(212,168,83,0.8),rgba(255,245,220,0.95),rgba(212,168,83,0.6))",backgroundSize:"200% 100%",animation:"goldFlow 3s linear infinite",marginTop:6 }}/>
        {/* GoToBar */}
        <div style={{ paddingTop:4 }}>
          <GoToBar showUtilities />
        </div>
        {/* ── UTILITY STRIP (LIVE badge only) ── */}
        <UtilityStrip theme={ht} />
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
      {/* ── SPLASH (Birthday or Welcome-Back) ── */}
      {showSplash && (
        <div style={{ position:"fixed",inset:0,zIndex:100,display:"flex",flexDirection:"column",alignItems:"center",justifyContent:"center",background:splashIsBirthday?"linear-gradient(165deg,#2D1B4E 0%,#5B2D8E 40%,#D4A853 100%)":ht.headerGradient,opacity:splashFading?0:1,transition:"opacity 0.6s ease",pointerEvents:"none" }}>
          {splashIsBirthday ? (
            <>
              <div style={{ fontSize:56,marginBottom:16,animation:"dropIn 0.5s ease" }}>🎂</div>
              <div style={{ fontFamily:ht.heading,fontSize:28,fontWeight:800,color:"#F0E8D8",textAlign:"center",marginBottom:8,animation:"fadeIn 0.6s ease" }}>
                Happy Birthday, {splashName}!
              </div>
              {birthdayVerse && (
                <div style={{ fontFamily:ht.body||ht.ui,fontSize:14,fontStyle:"italic",color:"rgba(240,232,216,0.85)",textAlign:"center",maxWidth:300,lineHeight:1.7,marginBottom:6,animation:"fadeIn 0.8s ease",padding:"0 20px" }}>
                  &ldquo;{birthdayVerse.text}&rdquo;
                </div>
              )}
              {birthdayVerse && (
                <div style={{ fontFamily:ht.ui,fontSize:11,fontWeight:600,color:"rgba(212,168,83,0.9)",textAlign:"center",animation:"fadeIn 1s ease" }}>
                  &mdash; {birthdayVerse.ref}
                </div>
              )}
              <div style={{ marginTop:20,fontFamily:ht.ui,fontSize:12,color:"rgba(240,232,216,0.6)",textAlign:"center",animation:"fadeIn 1.2s ease" }}>
                May God richly bless your new year of life.
              </div>
              <div style={{ marginTop:20,width:40,height:3,borderRadius:2,background:"rgba(212,168,83,0.4)",animation:"fadeIn 1.4s ease" }}/>
            </>
          ) : (
            <>
              <div style={{ fontSize:48,marginBottom:16,animation:"dropIn 0.5s ease" }}>✝</div>
              <div style={{ fontFamily:ht.heading,fontSize:26,fontWeight:800,color:ht.headerText||"#fff",textAlign:"center",marginBottom:8,animation:"fadeIn 0.6s ease" }}>
                Welcome back, {splashName}!
              </div>
              <div style={{ fontFamily:ht.ui,fontSize:14,color:`${ht.headerText||"#fff"}cc`,textAlign:"center",maxWidth:280,lineHeight:1.7,animation:"fadeIn 0.8s ease" }}>
                May God bless you and guide your study today.
              </div>
              <div style={{ marginTop:24,width:40,height:3,borderRadius:2,background:`${ht.headerText||"#fff"}44`,animation:"fadeIn 1s ease" }}/>
            </>
          )}
        </div>
      )}
      <div style={{ padding:`22px ${bp.pad}px 40px` }}>
        <div style={{ maxWidth:bp.content,margin:"0 auto" }}>
          {/* ── SEARCH BAR ── */}
          <style>{`@keyframes searchGlow { 0%,100% { border-color: rgba(128,90,213,0.5); box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 6px rgba(128,90,213,0.15); } 50% { border-color: rgba(212,168,83,0.55); box-shadow: inset 0 1px 3px rgba(0,0,0,0.06), 0 0 10px rgba(212,168,83,0.2); } }`}</style>
          <button onClick={() => nav("search")} style={{ width:"100%",display:"flex",alignItems:"center",gap:10,padding:"14px 18px",borderRadius:14,border:"1.5px solid rgba(128,90,213,0.5)",background:ht.card,cursor:"pointer",marginBottom:16,animation:"searchGlow 3s ease-in-out infinite" }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2" strokeLinecap="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
            <span style={{ fontFamily:ht.ui,fontSize:14,color:ht.light,fontWeight:500 }}>Search the Scriptures...</span>
          </button>
          {/* ── QUICK NAV STRIPS ── */}
          <style>{`@keyframes navGlow { 0%,100% { border-color: rgba(212,168,83,0.35); box-shadow: 0 2px 8px rgba(0,0,0,0.12), 0 0 6px rgba(212,168,83,0.1); } 50% { border-color: rgba(212,168,83,0.7); box-shadow: 0 2px 8px rgba(0,0,0,0.12), 0 0 10px rgba(212,168,83,0.2); } }`}</style>
          <div style={{ display:"flex",gap:10,marginBottom:16 }}>
            <button onClick={() => nav("books")} style={{ flex:1,display:"flex",alignItems:"center",gap:10,padding:"10px 12px",borderRadius:12,border:"1px solid rgba(212,168,83,0.35)",background:ht.headerGradient,cursor:"pointer",animation:"navGlow 3s ease-in-out infinite" }}>
              <span style={{ fontSize:18 }}>📖</span>
              <div>
                <div style={{ fontFamily:ht.heading,fontSize:11,fontWeight:700,color:ht.headerText,lineHeight:1.2 }}>The Holy Bible</div>
                <div style={{ fontFamily:ht.ui,fontSize:8,color:`${ht.headerText}77`,marginTop:1 }}>66 Books · KJV</div>
              </div>
            </button>
            <button onClick={() => nav("learn-home")} style={{ flex:1,display:"flex",alignItems:"center",gap:10,padding:"10px 12px",borderRadius:12,border:"1px solid rgba(212,168,83,0.35)",background:ht.headerGradient,cursor:"pointer",animation:"navGlow 3s ease-in-out infinite" }}>
              <span style={{ fontSize:18 }}>🎓</span>
              <div>
                <div style={{ fontFamily:ht.heading,fontSize:11,fontWeight:700,color:ht.headerText,lineHeight:1.2 }}>Learning Centre</div>
                <div style={{ fontFamily:ht.ui,fontSize:8,color:`${ht.headerText}77`,marginTop:1 }}>Languages · History</div>
              </div>
            </button>
          </div>
          {/* ── THE STORE CARD ── */}
          <button onClick={() => nav("shop-home")} className="pressable" style={{ width:"100%",display:"flex",alignItems:"center",gap:14,padding:"14px 16px",borderRadius:14,border:`1px solid ${ht.accentBorder}`,background:`linear-gradient(135deg,${ht.accent}10,${ht.accent}05)`,cursor:"pointer",marginBottom:16,textAlign:"left" }}>
            <div style={{ width:44,height:44,borderRadius:12,background:`${ht.accent}18`,display:"flex",alignItems:"center",justifyContent:"center",flexShrink:0 }}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/>
              </svg>
            </div>
            <div style={{ flex:1 }}>
              <div style={{ fontFamily:ht.heading,fontSize:14,fontWeight:700,color:ht.dark,lineHeight:1.2 }}>The Store</div>
              <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:2 }}>Books · Clothing · Stickers</div>
            </div>
            <span style={{ fontFamily:ht.ui,fontSize:9,fontWeight:700,color:ht.accent,background:`${ht.accent}15`,padding:"3px 8px",borderRadius:20,textTransform:"uppercase",letterSpacing:"0.06em",flexShrink:0 }}>New</span>
          </button>
          {/* ── CONTINUE READING (WhatsApp status bar) ── */}
          <ContinueReading nav={nav} ht={ht} user={user} />
          {/* ── VERSE OF THE DAY ── */}
          <VerseOfTheDay nav={nav} ht={ht} />

          {/* ── HYMN OF THE DAY ── */}
          <HymnOfTheDay nav={nav} ht={ht} />
          <div style={{ marginTop: -12, marginBottom: 22, textAlign: "right", paddingRight: 4 }}>
            <button onClick={() => nav("songs-home")} style={{ background: "none", border: "none", cursor: "pointer", fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.accent, padding: "4px 0", letterSpacing: "0.01em" }}>Browse All Hymns &rarr;</button>
          </div>

          {/* ── QUIZ MASTER ── */}
          <div style={{ marginBottom: 22 }}>
            <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 14, display: "flex", alignItems: "center", gap: 8 }}>
              <span>🏆</span> Quiz Master
            </div>
            <div onClick={() => nav("quiz-browser")} className="pressable" style={{ background: `linear-gradient(135deg,${ht.accent}12,${ht.card})`, border: `1px solid ${ht.accentBorder}`, borderRadius: 14, padding: "18px 18px", display: "flex", alignItems: "center", gap: 14, cursor: "pointer", position: "relative", overflow: "hidden" }}>
              <div style={{ position: "absolute", bottom: 0, left: 0, right: 0, height: 3, background: `linear-gradient(90deg,${ht.accent},${ht.accent}88,${ht.accent})`, opacity: 0.6, borderRadius: "0 0 14px 14px" }} />
              <div style={{ width: 52, height: 52, borderRadius: 14, background: `${ht.accent}20`, display: "flex", alignItems: "center", justifyContent: "center", fontSize: 30, flexShrink: 0 }}>🏆</div>
              <div style={{ flex: 1 }}>
                <div style={{ fontFamily: ht.heading, fontSize: 17, fontWeight: 700, color: ht.dark, lineHeight: 1.3 }}>Test Your Bible Knowledge</div>
                <div style={{ fontFamily: ht.ui, fontSize: 11, color: ht.accent, fontWeight: 600, marginTop: 1 }}>26 Books · 3 Difficulty Levels</div>
                <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted, marginTop: 4, lineHeight: 1.6 }}>Kids, Teens &amp; Adults — choose your level and dive into a chapter quiz.</div>
              </div>
              <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round" style={{ flexShrink: 0 }}>
                <polyline points="9 18 15 12 9 6" />
              </svg>
            </div>
          </div>

          {/* ── LITTLE DISCIPLES ── */}
          <div style={{ marginBottom:22,marginTop:10 }}>
            <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.12em",marginBottom:14,display:"flex",alignItems:"center",gap:8 }}>
              <span>🐑</span> Little Disciples
            </div>
            <div onClick={() => nav("kids-curriculum-home")} style={{ background:"linear-gradient(135deg,rgba(212,168,83,0.08),rgba(139,92,246,0.06))",border:`1px solid ${ht.accentBorder}`,borderRadius:14,padding:"20px 18px",display:"flex",alignItems:"center",gap:14,cursor:"pointer",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",bottom:0,left:0,right:0,height:3,background:"linear-gradient(90deg, #FF6B6B, #FFD93D, #6BCB77, #4D96FF, #9B59B6)",borderRadius:"0 0 14px 14px" }}/>
              <div style={{ width:56,height:56,borderRadius:14,background:"linear-gradient(135deg,rgba(212,168,83,0.3),rgba(139,92,246,0.3))",display:"flex",alignItems:"center",justifyContent:"center",fontSize:32,flexShrink:0 }}>🐑</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:ht.heading,fontSize:17,fontWeight:700,color:ht.dark,lineHeight:1.3 }}>Kids Church Curriculum</div>
                <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.accent,fontWeight:600,marginTop:1 }}>52-Week Bible Study · Ages 3–12</div>
                <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted,marginTop:4,lineHeight:1.7 }}>Age-grouped lessons that bring Scripture alive for the next generation — from toddlers to preteens.</div>
              </div>
              <div style={{ background:"rgba(16,185,129,0.12)",borderRadius:6,padding:"3px 10px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#059669",textTransform:"uppercase",letterSpacing:"0.05em",flexShrink:0 }}>New ✦</div>
            </div>
          </div>

          <div style={{ marginTop:22,position:"relative" }}>
            <div style={{ display:"flex",alignItems:"center",gap:8,marginBottom:14 }}>
              <div style={{ flex:1,height:1,background:ht.divider }}/>
              <span style={{ fontFamily:ht.heading,fontSize:12,color:ht.muted,letterSpacing:"0.05em" }}>✦</span>
              <div style={{ flex:1,height:1,background:ht.divider }}/>
            </div>
            <div style={{ display:"flex",justifyContent:"center" }}>
              {[{n:"66",l:"Books"},{n:"1,189",l:"Chapters"},{n:"31,102",l:"Verses"}].map((s,i) => (
                <div key={i} style={{ textAlign:"center",flex:1,borderRight:i<2?`1px solid ${ht.divider}`:"none",padding:"0 8px" }}>
                  <div style={{ fontFamily:ht.heading,fontSize:24,fontWeight:700,color:ht.dark,letterSpacing:"-0.02em" }}>{s.n}</div>
                  <div style={{ fontFamily:ht.ui,fontSize:10,fontWeight:600,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:2 }}>{s.l}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
