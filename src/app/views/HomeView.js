"use client";
import { useState, useEffect, useRef } from "react";
import { useApp } from "../context/AppContext";
import ContinueReading from "../components/ContinueReading";
import VerseOfTheDay from "../components/VerseOfTheDay";
import GoToBar from "../components/GoToBar";
import UtilityStrip from "../components/UtilityStrip";
import { BIRTHDAY_VERSES, THEMES } from "../constants";

function MannaCard({ ht, nav }) {
  const [seriesSlug, setSeriesSlug] = useState(null);
  const loaded = useRef(false);

  useEffect(() => {
    if (loaded.current) return;
    loaded.current = true;
    fetch("/data/podcasts/index.json").then(r => r.json()).then(data => {
      if (data?.series?.length) setSeriesSlug(data.series[0].slug);
    }).catch(() => {});
  }, []);

  return (
    <button onClick={() => {
      if (seriesSlug) {
        nav("podcast-detail", { podcastSeries: seriesSlug });
      } else {
        nav("podcast-home");
      }
    }} style={{ flex:1,display:"flex",alignItems:"center",gap:10,padding:"10px 12px",borderRadius:12,border:"1px solid rgba(212,168,83,0.35)",background:ht.headerGradient,cursor:"pointer",animation:"navGlow 3s ease-in-out infinite" }}>
      <span style={{ fontSize:18 }}>{"\uD83C\uDF3E"}</span>
      <div style={{ minWidth:0 }}>
        <div style={{ fontFamily:ht.heading,fontSize:11,fontWeight:700,color:ht.headerText,lineHeight:1.2 }}>Today&apos;s Manna</div>
        <div style={{ fontFamily:ht.ui,fontSize:8,color:`${ht.headerText}77`,marginTop:1,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis" }}>Daily Devotional Podcasts</div>
      </div>
    </button>
  );
}

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
          <button onClick={() => setDonateModal(true)} title="Support the Ministry" style={{ background:"rgba(255,255,255,0.1)",border:"1px solid rgba(255,255,255,0.15)",borderRadius:10,padding:"5px 10px",cursor:"pointer",display:"flex",alignItems:"center",gap:5,transition:"background 0.2s" }}>
            <span style={{ fontSize:14,lineHeight:1 }}>🕊️</span>
            <span style={{ fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"rgba(255,255,255,0.7)",letterSpacing:"0.05em" }}>SUPPORT</span>
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
          {/* ── OT / NT MINI PARCHMENT SCROLLS WITH CROSS OVERLAY ── */}
          <div style={{ position:"relative",marginBottom:16 }}>
            <div style={{ display:"flex",gap:10 }}>
              {[
                { t:"OT", l:"Old Testament", s:"39 Books", o:"\u05D1\u05B0\u05BC\u05E8\u05B5\u05D0\u05E9\u05C1\u05B4\u05D9\u05EA", om:"In the Beginning", thm:"garden", icon:"\uD83D\uDCDC" },
                { t:"NT", l:"New Testament", s:"27 Books", o:"\u039A\u03B1\u03B9\u03BD\u1F74 \u0394\u03B9\u03B1\u03B8\u03AE\u03BA\u03B7", om:"The New Covenant", thm:"ocean", icon:"\u271D\uFE0F" },
              ].map(item => {
                const st = THEMES[item.thm];
                return (
                  <button key={item.t} onClick={() => nav("books",{testament:item.t})}
                    style={{ flex:1,cursor:"pointer",border:"none",background:"transparent",padding:0,display:"flex",flexDirection:"column",filter:"drop-shadow(0 3px 8px rgba(0,0,0,0.15))" }}>
                    <div style={{ height:12,background:st.headerGradient,borderRadius:"8px 8px 0 0",position:"relative",overflow:"hidden" }}>
                      <div style={{ position:"absolute",top:"50%",left:"50%",transform:"translate(-50%,-50%)",width:"50%",height:4,background:"rgba(255,255,255,0.12)",borderRadius:8 }}/>
                    </div>
                    <div style={{ background:darkMode?"linear-gradient(180deg,#2A2620 0%,#231F1A 40%,#2A2620 100%)":"linear-gradient(180deg,#FEF3D8 0%,#FAE8BB 40%,#FEF3D8 100%)",padding:"10px 6px 8px",borderLeft:"1px solid rgba(180,140,60,0.3)",borderRight:"1px solid rgba(180,140,60,0.3)",textAlign:"center",flex:1 }}>
                      <div style={{ fontSize:18,marginBottom:3,filter:"drop-shadow(0 1px 2px rgba(0,0,0,0.15))" }}>{item.icon}</div>
                      <div style={{ fontFamily:ht.heading,fontSize:10,fontWeight:700,color:st.dark,lineHeight:1.3,marginBottom:2 }}>{item.l}</div>
                      <div style={{ width:16,height:1.5,background:st.accent,borderRadius:2,margin:"0 auto 3px" }}/>
                      <div style={{ fontFamily:ht.ui,fontSize:8,color:st.muted,letterSpacing:"0.02em" }}>{item.s}</div>
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:item.t==="OT"?11:9,color:st.accent,fontWeight:700,marginTop:4,direction:item.t==="OT"?"rtl":"ltr",lineHeight:1.3 }}>{item.o}</div>
                      <div style={{ fontFamily:ht.body,fontSize:7.5,color:st.muted,fontStyle:"italic",lineHeight:1.4 }}>{item.om}</div>
                    </div>
                    <div style={{ height:12,background:st.headerGradient,borderRadius:"0 0 8px 8px",position:"relative",overflow:"hidden" }}>
                      <div style={{ position:"absolute",top:"50%",left:"50%",transform:"translate(-50%,-50%)",width:"50%",height:4,background:"rgba(255,255,255,0.12)",borderRadius:8 }}/>
                    </div>
                  </button>
                );
              })}
            </div>
            {/* Cross with shawl — overlaid on top, centered between scrolls */}
            <img src="/images/cross-shawl.png" alt="" style={{ position:"absolute",top:"50%",left:"50%",transform:"translate(-50%,-50%)",width:56,height:56,objectFit:"contain",pointerEvents:"none",filter:"drop-shadow(0 2px 6px rgba(0,0,0,0.3))",zIndex:1 }}/>
          </div>
          {/* ── STATS (compact) ── */}
          <div style={{ display:"flex",justifyContent:"center",marginBottom:14 }}>
            {[{n:"66",l:"Books"},{n:"1,189",l:"Chapters"},{n:"31,102",l:"Verses"}].map((s,i) => (
              <div key={i} style={{ textAlign:"center",flex:1,borderRight:i<2?`1px solid ${ht.divider}`:"none",padding:"0 6px" }}>
                <div style={{ fontFamily:ht.heading,fontSize:16,fontWeight:700,color:ht.dark,letterSpacing:"-0.02em" }}>{s.n}</div>
                <div style={{ fontFamily:ht.ui,fontSize:8,fontWeight:600,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.08em",marginTop:1 }}>{s.l}</div>
              </div>
            ))}
          </div>
          {/* ── VERSE OF THE DAY ── */}
          <VerseOfTheDay nav={nav} ht={ht} />
          {/* ── TODAY'S MANNA + LEARNING CENTRE ── */}
          <style>{`@keyframes navGlow { 0%,100% { border-color: rgba(212,168,83,0.35); box-shadow: 0 2px 8px rgba(0,0,0,0.12), 0 0 6px rgba(212,168,83,0.1); } 50% { border-color: rgba(212,168,83,0.7); box-shadow: 0 2px 8px rgba(0,0,0,0.12), 0 0 10px rgba(212,168,83,0.2); } }`}</style>
          <div style={{ display:"flex",gap:10,marginBottom:16 }}>
            <MannaCard ht={ht} nav={nav} />
            <button onClick={() => nav("learn-home")} style={{ flex:1,display:"flex",alignItems:"center",gap:10,padding:"10px 12px",borderRadius:12,border:"1px solid rgba(212,168,83,0.35)",background:ht.headerGradient,cursor:"pointer",animation:"navGlow 3s ease-in-out infinite" }}>
              <span style={{ fontSize:18 }}>{"\uD83C\uDF93"}</span>
              <div>
                <div style={{ fontFamily:ht.heading,fontSize:11,fontWeight:700,color:ht.headerText,lineHeight:1.2 }}>Learning Centre</div>
                <div style={{ fontFamily:ht.ui,fontSize:8,color:`${ht.headerText}77`,marginTop:1 }}>Languages · History</div>
              </div>
            </button>
          </div>
          {/* ── CONTINUE READING ── */}
          <ContinueReading nav={nav} ht={ht} user={user} />

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
            <div style={{ display:"flex",gap:12,marginBottom:16 }}>
              {/* Kids Card — Warm Stained Glass */}
              <button onClick={() => nav("kids-curriculum-home")} style={{ flex:1,cursor:"pointer",border:"none",background:"transparent",padding:0,filter:"drop-shadow(0 6px 18px rgba(0,0,0,0.2))" }}>
                <div style={{ borderRadius:14,overflow:"hidden",display:"flex",flexDirection:"column",border:"2px solid #C8963C",boxShadow:"inset 0 1px 0 rgba(255,255,255,0.3)" }}>
                  {/* Glass panel — warm rainbow light rays */}
                  <div style={{ background:"linear-gradient(180deg,#1A1208 0%,#2A1A0A 100%)",padding:"18px 10px 14px",textAlign:"center",position:"relative",overflow:"hidden" }}>
                    {/* Radial light burst */}
                    <div style={{ position:"absolute",top:"-20%",left:"50%",transform:"translateX(-50%)",width:"140%",height:"140%",background:"radial-gradient(ellipse at 50% 30%,rgba(255,200,80,0.18) 0%,rgba(255,120,50,0.1) 25%,rgba(200,80,180,0.06) 50%,transparent 70%)" }}/>
                    {/* Lead caming lines (vertical) */}
                    <div style={{ position:"absolute",top:0,left:"30%",width:"1px",height:"100%",background:"rgba(180,160,100,0.15)" }}/>
                    <div style={{ position:"absolute",top:0,left:"70%",width:"1px",height:"100%",background:"rgba(180,160,100,0.15)" }}/>
                    {/* Lead caming lines (horizontal) */}
                    <div style={{ position:"absolute",top:"35%",left:0,width:"100%",height:"1px",background:"rgba(180,160,100,0.12)" }}/>
                    <div style={{ position:"absolute",top:"70%",left:0,width:"100%",height:"1px",background:"rgba(180,160,100,0.1)" }}/>
                    {/* Gothic arch glow */}
                    <div style={{ position:"absolute",top:0,left:"15%",right:"15%",height:"60%",borderRadius:"0 0 50% 50%",background:"radial-gradient(ellipse at 50% 0%,rgba(255,220,100,0.12),transparent 70%)" }}/>
                    <div style={{ position:"relative",zIndex:1,fontSize:28,marginBottom:6,filter:"drop-shadow(0 2px 8px rgba(255,180,50,0.4))" }}>🐑</div>
                    <div style={{ position:"relative",zIndex:1,fontFamily:"serif",fontSize:14,color:"#F0D080",lineHeight:1,textShadow:"0 0 12px rgba(255,200,80,0.4),0 1px 3px rgba(0,0,0,0.6)" }}>Ages 3–12</div>
                  </div>
                  {/* Info panel — warm cream */}
                  <div style={{ background:"linear-gradient(180deg,#FFF8EC 0%,#F5E8D0 50%,#EDE0C4 100%)",padding:"14px 10px",textAlign:"center",flex:1,borderTop:"2px solid #C8963C",boxShadow:"inset 0 2px 8px rgba(200,150,60,0.1)" }}>
                    <div style={{ fontFamily:ht.heading,fontSize:14,fontWeight:700,color:"#3A2408",marginBottom:4 }}>Kids Church Curriculum</div>
                    <div style={{ width:28,height:2,background:"linear-gradient(90deg,transparent,#C8963C,transparent)",borderRadius:2,margin:"0 auto 8px" }}/>
                    <div style={{ fontFamily:ht.ui,fontSize:10.5,color:"#7A5A20",lineHeight:1.6,marginBottom:10 }}>52-Week Bible Study</div>
                    <div style={{ display:"inline-block",padding:"5px 12px",borderRadius:4,background:"rgba(200,150,60,0.12)",border:"1px solid rgba(200,150,60,0.4)",boxShadow:"inset 0 1px 2px rgba(0,0,0,0.06)" }}>
                      <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:"#6B4A10",textTransform:"uppercase",letterSpacing:"0.07em" }}>Explore →</span>
                    </div>
                  </div>
                </div>
              </button>
              {/* Teens Card — Deep Jewel Stained Glass */}
              <button onClick={() => nav("teens-curriculum-home")} style={{ flex:1,cursor:"pointer",border:"none",background:"transparent",padding:0,filter:"drop-shadow(0 6px 18px rgba(0,0,0,0.22))" }}>
                <div style={{ borderRadius:14,overflow:"hidden",display:"flex",flexDirection:"column",border:"2px solid #5B4A8A",boxShadow:"inset 0 1px 0 rgba(255,255,255,0.2)" }}>
                  {/* Glass panel — deep jewel tones */}
                  <div style={{ background:"linear-gradient(180deg,#0A0818 0%,#14102A 100%)",padding:"18px 10px 14px",textAlign:"center",position:"relative",overflow:"hidden" }}>
                    {/* Radial light burst — cool jewel */}
                    <div style={{ position:"absolute",top:"-20%",left:"50%",transform:"translateX(-50%)",width:"140%",height:"140%",background:"radial-gradient(ellipse at 50% 30%,rgba(120,80,255,0.18) 0%,rgba(80,50,200,0.1) 25%,rgba(50,100,220,0.06) 50%,transparent 70%)" }}/>
                    {/* Lead caming lines (vertical) */}
                    <div style={{ position:"absolute",top:0,left:"30%",width:"1px",height:"100%",background:"rgba(140,120,200,0.15)" }}/>
                    <div style={{ position:"absolute",top:0,left:"70%",width:"1px",height:"100%",background:"rgba(140,120,200,0.15)" }}/>
                    {/* Lead caming lines (horizontal) */}
                    <div style={{ position:"absolute",top:"35%",left:0,width:"100%",height:"1px",background:"rgba(140,120,200,0.12)" }}/>
                    <div style={{ position:"absolute",top:"70%",left:0,width:"100%",height:"1px",background:"rgba(140,120,200,0.1)" }}/>
                    {/* Gothic arch glow */}
                    <div style={{ position:"absolute",top:0,left:"15%",right:"15%",height:"60%",borderRadius:"0 0 50% 50%",background:"radial-gradient(ellipse at 50% 0%,rgba(120,80,255,0.12),transparent 70%)" }}/>
                    <div style={{ position:"relative",zIndex:1,fontSize:28,marginBottom:6,filter:"drop-shadow(0 2px 8px rgba(120,80,255,0.4))" }}>🔥</div>
                    <div style={{ position:"relative",zIndex:1,fontFamily:"serif",fontSize:14,color:"#B8A0F0",lineHeight:1,textShadow:"0 0 12px rgba(120,80,255,0.4),0 1px 3px rgba(0,0,0,0.6)" }}>Ages 13–18</div>
                  </div>
                  {/* Info panel — cool lavender */}
                  <div style={{ background:"linear-gradient(180deg,#F0ECF8 0%,#E4DEF0 50%,#D8D0E8 100%)",padding:"14px 10px",textAlign:"center",flex:1,borderTop:"2px solid #5B4A8A",boxShadow:"inset 0 2px 8px rgba(91,74,138,0.08)" }}>
                    <div style={{ fontFamily:ht.heading,fontSize:14,fontWeight:700,color:"#1A1030",marginBottom:4 }}>Teens Bible Study</div>
                    <div style={{ width:28,height:2,background:"linear-gradient(90deg,transparent,#5B4A8A,transparent)",borderRadius:2,margin:"0 auto 8px" }}/>
                    <div style={{ fontFamily:ht.ui,fontSize:10.5,color:"#4A3A6A",lineHeight:1.6,marginBottom:10 }}>52-Week Deep Study</div>
                    <div style={{ display:"inline-block",padding:"5px 12px",borderRadius:4,background:"rgba(91,74,138,0.1)",border:"1px solid rgba(91,74,138,0.35)",boxShadow:"inset 0 1px 2px rgba(0,0,0,0.06)" }}>
                      <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:700,color:"#2A1A4A",textTransform:"uppercase",letterSpacing:"0.07em" }}>Explore →</span>
                    </div>
                  </div>
                </div>
              </button>
            </div>
          </div>

          {/* ── THE STORE ── */}
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

        </div>
      </div>
    </div>
  );
}
