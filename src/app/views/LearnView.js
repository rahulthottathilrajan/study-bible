"use client";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";
import { Label, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";

export default function LearnView() {
  const {
    view, darkMode, ht, nav, goBack,
    timelineEras, timelineEvents, timelineSelectedEra, setTimelineSelectedEra,
    timelineLoading, timelineEventsLoading, timelineExpandedEvent, setTimelineExpandedEvent,
    timelineSearchQuery, setTimelineSearchQuery, timelineAllEvents,
    timelineSearchActive, setTimelineSearchActive,
    loadAllTimelineEvents, loadTimelineEvents,
    trackLearnExploration,
  } = useApp();

  const st = darkMode ? DARK_THEMES.sunrise : THEMES.sunrise;

  // Track era exploration for badges
  if (view === "timeline-era-detail" && timelineSelectedEra?.era_key) {
    trackLearnExploration("erasExplored", timelineSelectedEra.era_key);
  }

  // ═══ LEARN HOME ═══
  const LearnHome = () => {
    const modules = [
      { id:"hebrew", icon:"🕎", label:"Learn Hebrew", sub:"Biblical Hebrew · עִבְרִית", color:"#C06C3E", bg:"rgba(192,108,62,0.1)", active:true, action:() => nav("hebrew-home") },
      { id:"greek", icon:"🏛️", label:"Learn Greek", sub:"Biblical Greek · Ἑλληνική", color:"#1B7A6E", bg:"rgba(27,122,110,0.1)", active:true, action:() => nav("greek-home") },
      { id:"timeline", icon:"📜", label:"Biblical Timeline", sub:"From Creation to Revelation", color:"#E8625C", bg:"rgba(232,98,92,0.1)", active:true, action:() => nav("timeline-home") },
      { id:"apologetics", icon:"🛡️", label:"Apologetics", sub:"Defend & understand the faith", color:"#1B7A6E", bg:"rgba(27,122,110,0.1)", active:true, action:() => nav("apologetics-home") },
      { id:"prophecy", icon:"🔭", label:"Prophecy & Fulfilment", sub:"300+ Messianic Predictions", color:"#8B5CF6", bg:"rgba(139,92,246,0.1)", active:true, action:() => nav("prophecy-home") },
      { id:"reading", icon:"🗓️", label:"Reading Plans", sub:"Guided Bible journeys", color:"#D4A853", bg:"rgba(212,168,83,0.1)", active:true, action:() => nav("reading-plans-home") },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="Learn" subtitle="Languages · History · Theology" onBack={goBack} theme={ht} />
        <div style={{ padding:"20px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Hero */}
          <div style={{ background:ht.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(212,168,83,0.15),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:42, marginBottom:10 }}>🎓</div>
              <div style={{ fontFamily:ht.heading, fontSize:24, fontWeight:700, color:ht.headerText, marginBottom:6 }}>Learning Centre</div>
              <div style={{ fontFamily:ht.body, fontSize:13, color:`${ht.headerText}88`, fontStyle:"italic" }}>Deepen your understanding of God's Word</div>
            </div>
          </div>
          {/* Active modules */}
          <Label icon="✨" t={ht} color={ht.muted}>Available Now</Label>
          {modules.filter(m => m.active).map(m => (
            <button key={m.id} onClick={m.action}
              style={{ width:"100%", background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"20px 18px", marginBottom:12, cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.06)", borderLeft:`4px solid ${m.color}` }}>
              <div style={{ width:54, height:54, borderRadius:14, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:28, flexShrink:0 }}>{m.icon}</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:ht.heading, fontSize:17, fontWeight:700, color:ht.dark }}>{m.label}</div>
                <div style={{ fontFamily:ht.ui, fontSize:12, color:ht.muted, marginTop:3 }}>{m.sub}</div>
                <div style={{ marginTop:8, display:"inline-block", background:m.bg, borderRadius:6, padding:"3px 10px", fontFamily:ht.ui, fontSize:9, fontWeight:700, color:m.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>Start Learning →</div>
              </div>
              <div style={{ color:ht.light }}><ChevIcon /></div>
            </button>
          ))}
          {/* Coming soon */}
          <Label icon="🔒" t={ht} color={ht.muted}>Coming Soon</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {modules.filter(m => !m.active).map(m => (
              <div key={m.id} style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"16px 18px", display:"flex", alignItems:"center", gap:14, opacity:0.55 }}>
                <div style={{ width:44, height:44, borderRadius:12, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{m.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:700, color:ht.dark }}>{m.label}</div>
                  <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.muted, marginTop:2 }}>{m.sub}</div>
                </div>
                <div style={{ fontFamily:ht.ui, fontSize:9, fontWeight:700, color:ht.light, textTransform:"uppercase", letterSpacing:"0.05em", background:ht.accentLight, padding:"3px 8px", borderRadius:4 }}>Soon</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  };


  const TimelineHome = () => {
    const sections = [
      { id:"timeline-era", icon:"📅", label:"Chronological Timeline", sub:"From Creation to the Early Church", color:"#E8625C", desc:"Explore all 14 biblical eras with key events, dates, and scripture." },
      { id:"timeline-maps", icon:"🗺️", label:"Historical Maps", sub:"The world of the Bible", color:"#1B7A6E", desc:"Period maps — Exodus route, the twelve tribes, Paul's journeys, and more." },
      { id:"timeline-books", icon:"📚", label:"Bible Book Timeline", sub:"When each book was written", color:"#D4A853", desc:"See the Bible as a library built over 1,500 years." },
      { id:"timeline-archaeology", icon:"⛏️", label:"Archaeological Evidence", sub:"Faith confirmed in the ground", color:"#8B5CF6", desc:"Dead Sea Scrolls, Tel Dan inscription, Hezekiah's Tunnel, and more." },
    ];
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title="Bible Timeline" subtitle="From Creation to Revelation" onBack={goBack} theme={st} />
        <div style={{ padding:"20px 20px 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Hero */}
          <div style={{ background:st.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:24, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 20%,rgba(232,98,92,0.25),transparent 65%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:52, marginBottom:12 }}>📜</div>
              <div style={{ fontFamily:st.heading, fontSize:26, fontWeight:700, color:st.headerText, marginBottom:6, lineHeight:1.2 }}>Biblical History</div>
              <div style={{ fontFamily:st.body, fontSize:13.5, color:`${st.headerText}88`, fontStyle:"italic", lineHeight:1.6, marginBottom:12 }}>
                6,000 years of redemptive history — from the first word of Genesis to the last verse of Revelation
              </div>
              <div style={{ display:"flex", justifyContent:"center", gap:16, flexWrap:"wrap" }}>
                {[["14","Eras"],["100+","Events"],["9","Maps"],["20+","Discoveries"]].map(([num,lbl]) => (
                  <div key={lbl} style={{ textAlign:"center" }}>
                    <div style={{ fontFamily:st.heading, fontSize:22, fontWeight:800, color:st.accent }}>{num}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:`${st.headerText}70`, textTransform:"uppercase", letterSpacing:"0.08em" }}>{lbl}</div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Era colour strip teaser */}
          <div style={{ display:"flex", borderRadius:10, overflow:"hidden", marginBottom:22, height:10 }}>
            {[["#1B7A6E",2],["#5A7A3E",2],["#D4A853",2],["#C06C3E",2],["#8B5CF6",2],["#6B8A5A",2],["#B8860B",2],["#E8625C",2],["#C06C3E",1],["#2A4A6B",1],["#6BAE75",1],["#7A6B8A",1],["#D4A853",2],["#E8625C",2]].map(([color, weight], i) => (
              <div key={i} style={{ flex:weight, background:color }}/>
            ))}
          </div>

          {/* Section cards */}
          <Label icon="🗓️" t={st} color={st.muted}>Explore</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:12 }}>
            {sections.map(s => (
              <button key={s.id}
                onClick={() => { if (s.id === "timeline-era") nav("timeline-era"); else if (s.id === "timeline-maps") nav("timeline-maps"); else if (s.id === "timeline-books") nav("timeline-books"); else if (s.id === "timeline-archaeology") nav("timeline-archaeology"); }}
                style={{ width:"100%", background:st.card, border:`1px solid ${st.divider}`, borderRadius:16, padding:"18px 16px", cursor:(s.id==="timeline-era"||s.id==="timeline-maps"||s.id==="timeline-books"||s.id==="timeline-archaeology")?"pointer":"default", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.05)", borderLeft:`4px solid ${s.color}`, opacity:(s.id==="timeline-era"||s.id==="timeline-maps"||s.id==="timeline-books"||s.id==="timeline-archaeology")?1:0.6, transition:"all 0.15s" }}>
                <div style={{ width:52, height:52, borderRadius:14, background:`${s.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:26, flexShrink:0 }}>{s.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:3 }}>
                    <div style={{ fontFamily:st.heading, fontSize:16, fontWeight:700, color:st.dark }}>{s.label}</div>
                    {(s.id !== "timeline-era" && s.id !== "timeline-maps" && s.id !== "timeline-books" && s.id !== "timeline-archaeology") && <span style={{ fontFamily:st.ui, fontSize:9, color:st.light, background:st.divider, borderRadius:4, padding:"2px 6px", fontWeight:700, textTransform:"uppercase" }}>Soon</span>}
                  </div>
                  <div style={{ fontFamily:st.ui, fontSize:12, color:st.muted, marginBottom:4 }}>{s.sub}</div>
                  <div style={{ fontFamily:st.body, fontSize:12, color:st.light, lineHeight:1.5, fontStyle:"italic" }}>{s.desc}</div>
                </div>
                {(s.id === "timeline-era" || s.id === "timeline-maps" || s.id === "timeline-books" || s.id === "timeline-archaeology") && <div style={{ color:st.light, flexShrink:0 }}><ChevIcon /></div>}
              </button>
            ))}
          </div>

          {/* Featured verse */}
          <div style={{ marginTop:24, background:st.headerGradient, borderRadius:16, padding:"22px 20px", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 80% 50%,rgba(232,98,92,0.15),transparent 60%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:st.body, fontSize:15, color:st.headerText, fontStyle:"italic", lineHeight:1.8, marginBottom:8 }}>
                "Known unto God are all his works from the beginning of the world."
              </div>
              <div style={{ fontFamily:st.ui, fontSize:11, color:st.accent, fontWeight:700, letterSpacing:"0.05em" }}>Acts 15:18</div>
            </div>
          </div>

        </div>
      </div>
    );
  };

  const TimelineBar = () => {
    if (!timelineEras.length) return null;
    return (
      <div style={{ overflowX:"auto", WebkitOverflowScrolling:"touch", margin:"0 -14px", padding:"0 14px" }}>
        <div style={{ display:"flex", gap:8, paddingBottom:6, minWidth:"max-content" }}>
          {timelineEras.map(era => (
            <div
              key={era.era_key}
              onClick={() => { setTimelineSelectedEra(era); nav("timeline-era-detail"); }}
              style={{
                display:"flex", alignItems:"center", gap:6,
                background:era.color, borderRadius:50,
                padding:"7px 14px 7px 10px", cursor:"pointer",
                boxShadow:`0 2px 8px ${era.color}55`,
                flexShrink:0, transition:"transform 0.15s, box-shadow 0.15s",
              }}
              onMouseEnter={e => { e.currentTarget.style.transform="scale(1.06)"; e.currentTarget.style.boxShadow=`0 4px 14px ${era.color}88`; }}
              onMouseLeave={e => { e.currentTarget.style.transform="scale(1)"; e.currentTarget.style.boxShadow=`0 2px 8px ${era.color}55`; }}
            >
              <span style={{ fontSize:16, lineHeight:1 }}>{era.icon}</span>
              <span style={{ fontFamily:st.ui, fontSize:11, fontWeight:800, color:"#fff", letterSpacing:0.2, whiteSpace:"nowrap" }}>
                {era.title}
              </span>
              <span style={{ fontFamily:st.ui, fontSize:9, fontWeight:500, color:"rgba(255,255,255,0.75)", whiteSpace:"nowrap" }}>
                {era.year_display}
              </span>
            </div>
          ))}
        </div>
      </div>
    );
  };
    
  const TimelineEras = () => {
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title="Biblical Eras" subtitle="14 periods of redemptive history" onBack={goBack} theme={st} />
        <div style={{ padding:"16px 16px 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Search bar */}
          <div style={{ position:"relative", marginBottom:16 }}>
            <input
              value={timelineSearchQuery}
              onChange={e => {
                setTimelineSearchQuery(e.target.value);
                if (e.target.value.length > 0 && !timelineSearchActive) {
                  setTimelineSearchActive(true);
                  loadAllTimelineEvents();
                }
                if (e.target.value.length === 0) setTimelineSearchActive(false);
              }}
              placeholder="🔍 Search events, figures, books..."
              style={{ width:"100%", padding:"12px 16px", borderRadius:12, border:`1.5px solid ${timelineSearchActive ? st.accent : st.divider}`, fontFamily:st.ui, fontSize:14, color:st.text, outline:"none", background:st.card, boxSizing:"border-box", transition:"border 0.2s" }}
            />
            {timelineSearchQuery.length > 0 && (
              <button onClick={() => { setTimelineSearchQuery(""); setTimelineSearchActive(false); }}
                style={{ position:"absolute", right:12, top:"50%", transform:"translateY(-50%)", background:"none", border:"none", cursor:"pointer", color:st.muted, fontSize:16 }}>✕</button>
            )}
          </div>

          {/* Search results */}
          {timelineSearchActive && timelineSearchQuery.length > 0 && (() => {
            const q = timelineSearchQuery.toLowerCase();
            const results = timelineAllEvents.filter(ev =>
              ev.title?.toLowerCase().includes(q) ||
              ev.subtitle?.toLowerCase().includes(q) ||
              ev.description?.toLowerCase().includes(q) ||
              ev.scripture_primary?.toLowerCase().includes(q) ||
              ev.significance?.toLowerCase().includes(q) ||
              ev.historical_context?.toLowerCase().includes(q)
            );
            const eraMap = {};
            timelineEras.forEach(e => { eraMap[e.era_key] = e; });
            return (
              <div style={{ marginBottom:18 }}>
                <div style={{ fontFamily:st.ui, fontSize:11, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:10 }}>
                  {results.length} result{results.length !== 1 ? "s" : ""} for "{timelineSearchQuery}"
                </div>
                {results.length === 0 ? (
                  <div style={{ textAlign:"center", padding:"24px 16px", background:st.card, borderRadius:14, border:`1px solid ${st.divider}`, fontFamily:st.body, fontSize:14, color:st.muted, fontStyle:"italic" }}>
                    No events found. Try a different word.
                  </div>
                ) : results.map(ev => {
                  const era = eraMap[ev.era_key];
                  return (
                    <div key={ev.id}
                      onClick={() => { if (era) { setTimelineSelectedEra(era); setTimelineExpandedEvent(ev.id); setTimelineSearchQuery(""); setTimelineSearchActive(false); loadTimelineEvents(era.era_key); nav("timeline-era-detail"); } }}
                      style={{ background:st.card, borderRadius:12, padding:"14px 16px", marginBottom:8, border:`1px solid ${era?.color}33`, borderLeft:`4px solid ${era?.color || st.accent}`, cursor:"pointer", transition:"all 0.15s" }}>
                      <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4, flexWrap:"wrap" }}>
                        <span style={{ fontSize:18 }}>{ev.icon}</span>
                        <span style={{ fontFamily:st.heading, fontSize:14, fontWeight:700, color:st.dark }}>{ev.title}</span>
                        {ev.is_featured && <span style={{ fontFamily:st.ui, fontSize:8, fontWeight:800, color:"#fff", background:era?.color, borderRadius:4, padding:"2px 6px" }}>★ Key</span>}
                      </div>
                      <div style={{ fontFamily:st.ui, fontSize:10, color:era?.color, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.04em", marginBottom:3 }}>{era?.title} · {ev.year_display}</div>
                      {ev.description && <div style={{ fontFamily:st.body, fontSize:12.5, color:st.muted, fontStyle:"italic", lineHeight:1.5, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>{ev.description}</div>}
                    </div>
                  );
                })}
              </div>
            );
          })()}

          {/* Era colour strip */}
          <div style={{ display:"flex", borderRadius:10, overflow:"hidden", marginBottom:18, height:8 }}>
            {timelineEras.map((era, i) => (
              <div key={i} style={{ flex:1, background:era.color, cursor:"pointer" }}
                onClick={() => { setTimelineSelectedEra(era); setTimelineExpandedEvent(null); nav("timeline-era-detail"); }}/>
            ))}
          </div>

          {/* Visual timeline bar */}
          {timelineEras.length > 0 && (
            <div style={{
              background:st.card, borderRadius:14, padding:"14px 14px 10px",
              marginBottom:18, border:`1px solid ${st.border}`,
              boxShadow:"0 2px 8px rgba(0,0,0,0.06)"
            }}>
              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.muted, letterSpacing:1, textTransform:"uppercase", marginBottom:10 }}>
                ← Tap an era to explore →
              </div>
              <TimelineBar />
            </div>
          )}

          {timelineLoading ? <Spinner t={st} /> : (
            <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
              {timelineEras.map(era => (
                <button key={era.era_key}
                  onClick={() => { setTimelineSelectedEra(era); setTimelineExpandedEvent(null); nav("timeline-era-detail"); }}
                  style={{ width:"100%", background:st.card, border:`1px solid ${st.divider}`, borderRadius:16, padding:"16px", cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", borderLeft:`4px solid ${era.color}`, transition:"all 0.15s" }}>
                  <div style={{ width:50, height:50, borderRadius:13, background:`${era.color}22`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:24, flexShrink:0 }}>{era.icon}</div>
                  <div style={{ flex:1, minWidth:0 }}>
                    <div style={{ fontFamily:st.heading, fontSize:16, fontWeight:700, color:st.dark, marginBottom:2 }}>{era.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700, marginBottom:3, textTransform:"uppercase", letterSpacing:"0.04em" }}>{era.year_display}</div>
                    <div style={{ fontFamily:st.body, fontSize:12.5, color:st.muted, lineHeight:1.5, fontStyle:"italic" }}>{era.subtitle}</div>
                    <div style={{ marginTop:6, display:"flex", alignItems:"center", gap:8 }}>
                      {era.event_count > 0 && (
                        <span style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:era.color, background:`${era.color}15`, borderRadius:5, padding:"2px 8px" }}>
                          {era.event_count} event{era.event_count !== 1 ? "s" : ""}
                        </span>
                      )}
                    </div>
                  </div>
                  <div style={{ color:st.light, flexShrink:0 }}><ChevIcon /></div>
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  const TimelineEraDetail = () => {
    if (!timelineSelectedEra) return null;
    const era = timelineSelectedEra;
    const allEvents = timelineEvents;
    return (
      <div style={{ minHeight:"100vh", background:st.bg, paddingBottom:80 }}>
        <Header title={era.title} subtitle={era.year_display} onBack={goBack} theme={st} />
        <div style={{ padding:"0 0 40px", maxWidth:520, margin:"0 auto" }}>

          {/* Era hero banner */}
          <div style={{ background:`linear-gradient(165deg, #2D1B4E 0%, ${era.color}99 100%)`, padding:"28px 20px", textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:`radial-gradient(ellipse at 50% 30%, ${era.color}44, transparent 65%)` }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:48, marginBottom:8 }}>{era.icon}</div>
              <div style={{ fontFamily:st.heading, fontSize:22, fontWeight:700, color:"#fff", marginBottom:4 }}>{era.title}</div>
              <div style={{ fontFamily:st.ui, fontSize:13, color:"rgba(255,255,255,0.75)", fontWeight:700, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:10 }}>{era.year_display}</div>
              <div style={{ fontFamily:st.body, fontSize:13, color:"rgba(255,255,255,0.75)", lineHeight:1.7, fontStyle:"italic", maxWidth:360, margin:"0 auto" }}>{era.subtitle}</div>
            </div>
          </div>

          <div style={{ padding:"16px 16px 0" }}>

            {/* Key verse */}
            {era.key_verse && (
              <div style={{ background:`${era.color}11`, border:`1px solid ${era.color}44`, borderRadius:14, padding:"16px 18px", marginBottom:16, borderLeft:`3px solid ${era.color}` }}>
                <div style={{ fontFamily:st.body, fontSize:14, color:st.text, fontStyle:"italic", lineHeight:1.7, marginBottom:6 }}>"{era.key_verse}"</div>
                <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700 }}>{era.key_verse_ref}</div>
              </div>
            )}

            {/* Description */}
            <div style={{ background:st.card, borderRadius:14, padding:"16px 18px", border:`1px solid ${st.divider}`, marginBottom:16 }}>
              <Label icon="📋" t={st}>Overview</Label>
              <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.8 }}>{era.description}</div>
            </div>

            {/* Key figures */}
            {era.key_figures?.length > 0 && (
              <div style={{ marginBottom:16 }}>
                <Label icon="👤" t={st} color={st.muted}>Key Figures</Label>
                <div style={{ display:"flex", flexWrap:"wrap", gap:8 }}>
                  {era.key_figures.map(f => (
                    <span key={f} style={{ background:`${era.color}18`, color:era.color, fontFamily:st.ui, fontSize:12, fontWeight:700, padding:"5px 12px", borderRadius:20, border:`1px solid ${era.color}33` }}>{f}</span>
                  ))}
                </div>
              </div>
            )}

            {/* Key books */}
            {era.key_books?.length > 0 && (
              <div style={{ marginBottom:18 }}>
                <Label icon="📖" t={st} color={st.muted}>Key Books</Label>
                <div style={{ display:"flex", flexWrap:"wrap", gap:6 }}>
                  {era.key_books.map(b => (
                    <span key={b} style={{ background:st.accentLight, color:st.accent, fontFamily:st.ui, fontSize:11, fontWeight:600, padding:"4px 10px", borderRadius:6, border:`1px solid ${st.accentBorder}` }}>{b}</span>
                  ))}
                </div>
              </div>
            )}

            {/* Events */}
            <Label icon="📅" t={st} color={st.muted}>Events in This Era</Label>
            {timelineEventsLoading ? <Spinner t={st} /> : (
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {allEvents.map(event => {
                  const isExpanded = timelineExpandedEvent === event.id;
                  return (
                    <div key={event.id} style={{ background:event.is_featured ? `${era.color}09` : st.card, borderRadius:14, border:`1px solid ${isExpanded ? era.color+'66' : event.is_featured ? era.color+'44' : st.divider}`, overflow:"hidden", boxShadow:isExpanded?`0 2px 12px ${era.color}22`:event.is_featured?`0 2px 8px ${era.color}22`:"0 1px 3px rgba(0,0,0,0.04)", transition:"all 0.2s" }}>

                      {/* Event header — always visible */}
                      <button onClick={() => setTimelineExpandedEvent(isExpanded ? null : event.id)}
                        style={{ width:"100%", background:"transparent", border:"none", padding:"14px 16px", cursor:"pointer", textAlign:"left", display:"flex", alignItems:"flex-start", gap:12 }}>
                        <div style={{ width:40, height:40, borderRadius:10, background:`${era.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:20, flexShrink:0, marginTop:2 }}>{event.icon}</div>
                        <div style={{ flex:1, minWidth:0 }}>
                          <div style={{ display:"flex", alignItems:"center", gap:6, flexWrap:"wrap", marginBottom:3 }}>
                            <div style={{ fontFamily:st.heading, fontSize:15, fontWeight:700, color:st.dark }}>{event.title}</div>
                            {event.is_featured && <span style={{ fontFamily:st.ui, fontSize:9, fontWeight:800, color:"#fff", background:`linear-gradient(135deg, ${era.color}, ${era.color}cc)`, borderRadius:6, padding:"3px 8px", textTransform:"uppercase", letterSpacing:"0.05em", boxShadow:`0 2px 6px ${era.color}55` }}>★ Key Event</span>}
                          </div>
                          {event.subtitle && <div style={{ fontFamily:st.body, fontSize:12, color:st.muted, fontStyle:"italic", marginBottom:3 }}>{event.subtitle}</div>}
                          <div style={{ fontFamily:st.ui, fontSize:11, color:era.color, fontWeight:700 }}>{event.year_display}</div>
                        </div>
                        <div style={{ color:isExpanded?era.color:st.light, flexShrink:0, transform:isExpanded?"rotate(90deg)":"rotate(0deg)", transition:"transform 0.2s", marginTop:4 }}><ChevIcon /></div>
                      </button>

                      {/* Expanded content */}
                      {isExpanded && (
                        <div style={{ padding:"0 16px 16px", borderTop:`1px solid ${era.color}22` }}>

                          {event.scripture_primary && (
                            <div style={{ background:`${era.color}0D`, borderRadius:10, padding:"12px 14px", marginBottom:12, marginTop:12, borderLeft:`3px solid ${era.color}` }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:era.color, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:4 }}>📖 Scripture</div>
                              <div style={{ fontFamily:st.heading, fontSize:14, fontWeight:700, color:st.dark }}>{event.scripture_primary}</div>
                            </div>
                          )}

                          {event.description && (
                            <div style={{ fontFamily:st.body, fontSize:14, color:st.text, lineHeight:1.8, marginBottom:12 }}>{event.description}</div>
                          )}

                          {event.historical_context && (
                            <div style={{ background:st.accentLight, borderRadius:10, padding:"12px 14px", marginBottom:10, border:`1px solid ${st.accentBorder}` }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:st.accent, textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>🏛️ Historical Context</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.historical_context}</div>
                            </div>
                          )}

                          {event.archaeological_note && (
                            <div style={{ background:"rgba(27,122,110,0.06)", borderRadius:10, padding:"12px 14px", marginBottom:10, border:"1px solid rgba(27,122,110,0.15)" }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:"#1B7A6E", textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>⛏️ Archaeological Note</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.archaeological_note}</div>
                            </div>
                          )}

                          {event.significance && (
                            <div style={{ background:"rgba(212,168,83,0.08)", borderRadius:10, padding:"12px 14px", border:"1px solid rgba(212,168,83,0.2)" }}>
                              <div style={{ fontFamily:st.ui, fontSize:10, fontWeight:700, color:"#B8860B", textTransform:"uppercase", letterSpacing:"0.06em", marginBottom:5 }}>✨ Why This Matters</div>
                              <div style={{ fontFamily:st.body, fontSize:13, color:st.text, lineHeight:1.7 }}>{event.significance}</div>
                            </div>
                          )}

                        </div>
                      )}
                    </div>
                  );
                })}
                {allEvents.length === 0 && !timelineEventsLoading && (
                  <div style={{ textAlign:"center", padding:30, fontFamily:st.body, fontSize:14, color:st.muted, fontStyle:"italic" }}>Events coming soon for this era.</div>
                )}
                            </div>
            )}
          </div>

          {/* Era navigation — prev / next */}
          {(() => {
            const idx = timelineEras.findIndex(e => e.era_key === era.era_key);
            const prev = idx > 0 ? timelineEras[idx - 1] : null;
            const next = idx < timelineEras.length - 1 ? timelineEras[idx + 1] : null;
            if (!prev && !next) return null;
            return (
              <div style={{ display:"flex", gap:10, padding:"20px 16px 8px", borderTop:`1px solid ${st.divider}`, marginTop:8 }}>
                {prev ? (
                  <div
                    onClick={() => { setTimelineSelectedEra(prev); loadTimelineEvents(prev.era_key); }}
                    style={{ flex:1, background:st.card, border:`1px solid ${prev.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", borderLeft:`4px solid ${prev.color}` }}
                  >
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>← Previous</div>
                    <div style={{ fontSize:18, marginBottom:2 }}>{prev.icon}</div>
                    <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{prev.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:prev.color, fontWeight:600, marginTop:2 }}>{prev.year_display}</div>
                  </div>
                ) : <div style={{ flex:1 }} />}
                {next ? (
                  <div
                    onClick={() => { setTimelineSelectedEra(next); loadTimelineEvents(next.era_key); }}
                    style={{ flex:1, background:st.card, border:`1px solid ${next.color}40`, borderRadius:12, padding:"12px 14px", cursor:"pointer", textAlign:"right", borderRight:`4px solid ${next.color}` }}
                  >
                    <div style={{ fontFamily:st.ui, fontSize:9, fontWeight:700, color:st.muted, textTransform:"uppercase", letterSpacing:1, marginBottom:4 }}>Next →</div>
                    <div style={{ fontSize:18, marginBottom:2 }}>{next.icon}</div>
                    <div style={{ fontFamily:st.heading, fontSize:13, fontWeight:700, color:st.text, lineHeight:1.3 }}>{next.title}</div>
                    <div style={{ fontFamily:st.ui, fontSize:10, color:next.color, fontWeight:600, marginTop:2 }}>{next.year_display}</div>
                  </div>
                ) : <div style={{ flex:1 }} />}
              </div>
            );
          })()}

        </div>
      </div>
    );
  };


  if (view === "learn-home") return <LearnHome />;
  if (view === "timeline-home") return <TimelineHome />;
  if (view === "timeline-era") return <TimelineEras />;
  if (view === "timeline-era-detail") return <TimelineEraDetail />;
  return null;
}
