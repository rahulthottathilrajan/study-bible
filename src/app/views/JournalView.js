"use client";
import { useApp } from "../context/AppContext";
import { Card, Label, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";

export default function JournalView() {
  const {
    view, ht, user, allHighlights, hlLoading,
    tab, setTab, prayers, prayerLoading,
    prayerTitle, setPrayerTitle, prayerText, setPrayerText,
    addPrayer, togglePrayerAnswered, deletePrayer, nav,
  } = useApp();

  // ═══ HIGHLIGHTS COLLECTION ═══
  const Highlights = () => (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="My Highlights" subtitle={`${allHighlights.length} saved`} theme={ht} />
      <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
        {!user ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:36,marginBottom:12}}>🔐</div>
            <div style={{fontFamily:ht.heading,fontSize:17,color:ht.dark,marginBottom:6}}>Sign In to See Highlights</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,marginBottom:14}}>Highlight verses while reading and find them all here.</div>
            <button onClick={() => nav("account")} style={{padding:"12px 28px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText,fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer"}}>Sign In / Sign Up</button>
          </Card>
        ) : hlLoading ? <Spinner t={ht} /> : allHighlights.length === 0 ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:42,marginBottom:14}}>🎨</div>
            <div style={{fontFamily:ht.heading,fontSize:18,color:ht.dark,marginBottom:6}}>No Highlights Yet</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,lineHeight:1.6}}>Open any verse and use the colored dots to highlight. Bookmarked and highlighted verses will appear here!</div>
          </Card>
        ) : (
          <div style={{display:"flex",flexDirection:"column",gap:8}}>
            {allHighlights.map(h => {
              const bName = h.verses?.chapters?.books?.name;
              const chNum = h.verses?.chapters?.chapter_number;
              const vNum = h.verses?.verse_number;
              const ref = `${bName} ${chNum}:${vNum}`;
              return (
                <button key={h.id} onClick={() => nav("verse",{book:bName,chapter:chNum,verse:vNum,tab:"study"})}
                  style={{ background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",gap:12,alignItems:"flex-start",borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                  <div style={{ flex:1 }}>
                    <div style={{display:"flex",alignItems:"center",gap:8,marginBottom:4}}>
                      <span style={{fontFamily:ht.heading,fontSize:14,fontWeight:700,color:ht.dark}}>{ref}</span>
                      {h.is_bookmarked && <span style={{fontSize:14}}>★</span>}
                    </div>
                    <div style={{fontFamily:ht.body,fontSize:13.5,color:ht.text,lineHeight:1.6,display:"-webkit-box",WebkitLineClamp:2,WebkitBoxOrient:"vertical",overflow:"hidden"}}>
                      {h.verses?.kjv_text}
                    </div>
                  </div>
                  <div style={{color:ht.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );

  // ═══ JOURNAL HOME ═══
  const JournalHome = () => {
    const currentTab = ["highlights","prayers"].includes(tab) ? tab : "highlights";
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="My Journal" subtitle="Highlights · Prayers · Reflections" theme={ht} />
        <div style={{ padding:"16px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Tab switcher */}
          <div style={{ display:"flex", background:ht.card, borderRadius:10, padding:3, marginBottom:18, border:`1px solid ${ht.divider}` }}>
            {[
              { id:"highlights", label:"✨ Highlights", count:allHighlights.length },
              { id:"prayers", label:"🙏 Prayers", count:prayers.length }
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)}
                style={{ flex:1, padding:"11px 8px", border:"none", borderRadius:8, background:currentTab===tb.id?ht.tabActive:"transparent", color:currentTab===tb.id?ht.headerText:ht.muted, fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:"pointer", transition:"all 0.15s" }}>
                {tb.label}{tb.count > 0 ? ` (${tb.count})` : ""}
              </button>
            ))}
          </div>

          {/* Not signed in */}
          {!user && (
            <Card t={ht} style={{ textAlign:"center", padding:30 }}>
              <div style={{ fontSize:36, marginBottom:12 }}>🔐</div>
              <div style={{ fontFamily:ht.heading, fontSize:17, color:ht.dark, marginBottom:6 }}>Sign In to See Your Journal</div>
              <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, marginBottom:14, lineHeight:1.6 }}>Save highlights, bookmarks, and prayers as you study God's Word.</div>
              <button onClick={() => nav("account")} style={{ padding:"12px 28px", borderRadius:10, border:"none", background:ht.headerGradient, color:ht.headerText, fontFamily:ht.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Sign In / Sign Up</button>
            </Card>
          )}

          {/* HIGHLIGHTS TAB */}
          {user && currentTab === "highlights" && (
            hlLoading ? <Spinner t={ht} /> :
            allHighlights.length === 0 ? (
              <Card t={ht} style={{ textAlign:"center", padding:30 }}>
                <div style={{ fontSize:42, marginBottom:14 }}>🎨</div>
                <div style={{ fontFamily:ht.heading, fontSize:18, color:ht.dark, marginBottom:6 }}>No Highlights Yet</div>
                <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, lineHeight:1.6 }}>Open any verse and tap the coloured dots to highlight. Bookmarked verses appear here too.</div>
              </Card>
            ) : (
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {allHighlights.map(h => {
                  const bName = h.verses?.chapters?.books?.name;
                  const chNum = h.verses?.chapters?.chapter_number;
                  const vNum = h.verses?.verse_number;
                  const ref = `${bName} ${chNum}:${vNum}`;
                  return (
                    <button key={h.id} onClick={() => nav("verse", { book:bName, chapter:chNum, verse:vNum, tab:"study" })}
                      style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:12, padding:"14px 16px", textAlign:"left", cursor:"pointer", display:"flex", gap:12, alignItems:"flex-start", borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`, boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                      <div style={{ flex:1 }}>
                        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4 }}>
                          <span style={{ fontFamily:ht.heading, fontSize:14, fontWeight:700, color:ht.dark }}>{ref}</span>
                          {h.is_bookmarked && <span style={{ fontSize:14 }}>★</span>}
                        </div>
                        <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.6, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>{h.verses?.kjv_text}</div>
                      </div>
                      <div style={{ color:ht.light, flexShrink:0, alignSelf:"center" }}><ChevIcon /></div>
                    </button>
                  );
                })}
              </div>
            )
          )}

          {/* PRAYERS TAB */}
          {user && currentTab === "prayers" && (
            <div>
              <Card t={ht} style={{ marginBottom:14 }}>
                <Label icon="✏️" t={ht}>New Prayer</Label>
                <input value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder="Prayer title..." style={{ width:"100%", padding:"10px 0", border:"none", borderBottom:`1px solid ${ht.divider}`, fontFamily:ht.heading, fontSize:15, color:ht.dark, outline:"none", background:"transparent", marginBottom:10, boxSizing:"border-box" }} />
                <textarea value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width:"100%", padding:"8px 0", border:"none", fontFamily:ht.body, fontSize:14, color:ht.text, outline:"none", background:"transparent", resize:"vertical", lineHeight:1.7, boxSizing:"border-box" }} />
                <button onClick={async () => { await addPrayer(); }} disabled={!prayerText.trim()} style={{ marginTop:10, padding:"10px 20px", borderRadius:8, border:"none", background:prayerText.trim()?ht.accent:ht.divider, color:"#fff", fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:prayerText.trim()?"pointer":"default" }}>Add Prayer</button>
              </Card>
              {prayerLoading ? <Spinner t={ht} /> :
              prayers.length === 0 ? (
                <div style={{ textAlign:"center", padding:30, fontFamily:ht.body, fontSize:15, color:ht.muted, fontStyle:"italic" }}>Your prayers will appear here</div>
              ) : prayers.map(p => (
                <div key={p.id} style={{ background:ht.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${p.is_answered?"#7ED4AD44":ht.divider}`, marginBottom:8, borderLeft:`3px solid ${p.is_answered?"#7ED4AD":ht.accent}` }}>
                  <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                    <div style={{ flex:1 }}>
                      <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:600, color:ht.dark }}>{p.title}</div>
                      {p.book_name && <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.accent, marginTop:2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                      <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.65, marginTop:6 }}>{p.prayer_text}</div>
                      <div style={{ fontFamily:ht.ui, fontSize:10, color:ht.light, marginTop:6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                    </div>
                    <div style={{ display:"flex", gap:6, flexShrink:0, marginLeft:10 }}>
                      <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding:"5px 10px", borderRadius:6, border:`1px solid ${p.is_answered?"#7ED4AD":ht.divider}`, background:p.is_answered?"#7ED4AD22":"transparent", fontFamily:ht.ui, fontSize:10, fontWeight:700, color:p.is_answered?"#2E7D5B":ht.muted, cursor:"pointer" }}>
                        {p.is_answered ? "✓ Answered" : "Mark Answered"}
                      </button>
                      <button onClick={() => deletePrayer(p.id)} style={{ padding:"5px 8px", borderRadius:6, border:`1px solid ${ht.divider}`, background:"transparent", fontFamily:ht.ui, fontSize:10, color:"#E8625C", cursor:"pointer" }}>✕</button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };


  if (view === "highlights") return <Highlights />;
  if (view === "journal-home") return <JournalHome />;
  return null;
}
