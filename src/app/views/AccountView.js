"use client";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";
import { Card, Label, CrossIcon, ChevIcon } from "../components/ui";
import { BADGES, BADGE_CATEGORIES, BIBLE_TRANSLATIONS } from "../constants";

export default function AccountView() {
  const {
    user, profile, streak, darkMode, setDarkMode, fontSize, setFontSize, ht, bibleTranslation, setBibleTranslation,
    authMode, setAuthMode, authEmail, setAuthEmail, authPass, setAuthPass,
    authName, setAuthName, authError, authLoading, authShowPass, setAuthShowPass,
    authForgot, setAuthForgot, authForgotSent,
    allHighlights, prayers, earnedBadges,
    handleAuth, handleLogout, handleForgotPassword, handleGoogleSignIn,
    nav, setDonateModal,
  } = useApp();

  return (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="My Account" theme={ht} />
      <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
        {!user ? (
          <div style={{maxWidth:400,margin:"0 auto",paddingTop:8}}>
            {/* Hero */}
            <div style={{textAlign:"center",padding:"28px 0 20px"}}>
              <div style={{color:ht.accent,marginBottom:10,display:"flex",justifyContent:"center"}}><CrossIcon /></div>
              <div style={{fontFamily:ht.heading,fontSize:26,fontWeight:700,color:ht.dark,marginBottom:6}}>
                {authForgot ? "Reset Password" : authMode === "login" ? "Welcome Back" : "Join the Study"}
              </div>
              <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,lineHeight:1.6}}>
                {authForgot ? "Enter your email and we'll send a reset link" : authMode === "login" ? "Sign in to access your notes, highlights & journal" : "Create a free account to save your study across devices"}
              </div>
            </div>

            {/* Mode toggle (only for login/signup, not forgot) */}
            {!authForgot && (
              <div style={{display:"flex",background:ht.card,borderRadius:10,padding:3,marginBottom:20,border:`1px solid ${ht.divider}`}}>
                {[{id:"login",label:"Sign In"},{id:"signup",label:"Create Account"}].map(m => (
                  <button key={m.id} onClick={() => { setAuthMode(m.id); }} style={{flex:1,padding:"10px 8px",border:"none",borderRadius:8,background:authMode===m.id?ht.headerGradient:"transparent",color:authMode===m.id?ht.headerText:ht.muted,fontFamily:ht.ui,fontSize:13,fontWeight:700,cursor:"pointer",transition:"all 0.15s"}}>
                    {m.label}
                  </button>
                ))}
              </div>
            )}

            {/* Form */}
            <div style={{display:"flex",flexDirection:"column",gap:10}}>
              {!authForgot && authMode === "signup" && (
                <input value={authName} onChange={e => setAuthName(e.target.value)} placeholder="Display Name" style={{width:"100%",padding:"13px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box"}} />
              )}
              <input type="email" value={authEmail} onChange={e => setAuthEmail(e.target.value)} placeholder="Email address" style={{width:"100%",padding:"13px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box"}} />
              {!authForgot && (
                <div style={{position:"relative"}}>
                  <input type={authShowPass?"text":"password"} value={authPass} onChange={e => setAuthPass(e.target.value)} placeholder="Password" onKeyDown={e => e.key === "Enter" && handleAuth()} style={{width:"100%",padding:"13px 44px 13px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box"}} />
                  <button onClick={() => setAuthShowPass(v => !v)} style={{position:"absolute",right:12,top:"50%",transform:"translateY(-50%)",background:"none",border:"none",cursor:"pointer",color:ht.muted,fontSize:16,padding:4}}>
                    {authShowPass ? "🙈" : "👁"}
                  </button>
                </div>
              )}
              {authError && <div style={{fontFamily:ht.ui,fontSize:12,color:"#E8625C",textAlign:"center",padding:"6px 0"}}>{authError}</div>}

              <button onClick={authForgot ? handleForgotPassword : handleAuth} disabled={authLoading} style={{width:"100%",padding:"14px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText||"#fff",fontFamily:ht.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginTop:2,opacity:authLoading?0.7:1}}>
                {authLoading ? "..." : authForgot ? "Send Reset Link" : authMode === "login" ? "Sign In" : "Create Account"}
              </button>

              {authForgotSent && (
                <div style={{fontFamily:ht.ui,fontSize:13,color:"#34A853",textAlign:"center",padding:"6px 0"}}>
                  ✓ Reset link sent — check your email
                </div>
              )}

              {!authForgot && authMode === "login" && (
                <button onClick={() => { setAuthForgot(true); }} style={{background:"none",border:"none",cursor:"pointer",fontFamily:ht.ui,fontSize:13,color:ht.muted,textAlign:"center",padding:"2px 0"}}>
                  Forgot password?
                </button>
              )}

              {authForgot && (
                <button onClick={() => { setAuthForgot(false); }} style={{background:"none",border:"none",cursor:"pointer",fontFamily:ht.ui,fontSize:13,color:ht.accent,textAlign:"center",padding:"2px 0",fontWeight:600}}>
                  ← Back to Sign In
                </button>
              )}
            </div>

            {/* Divider + Google (not on forgot screen) */}
            {!authForgot && (
              <>
                <div style={{display:"flex",alignItems:"center",gap:12,margin:"18px 0"}}>
                  <div style={{flex:1,height:1,background:ht.divider}}/><span style={{fontFamily:ht.ui,fontSize:12,color:ht.light}}>or</span><div style={{flex:1,height:1,background:ht.divider}}/>
                </div>
                <button onClick={handleGoogleSignIn} style={{width:"100%",padding:"13px",borderRadius:10,border:`1.5px solid ${ht.divider}`,background:ht.card,fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark,cursor:"pointer",display:"flex",alignItems:"center",justifyContent:"center",gap:10}}>
                  <svg width="18" height="18" viewBox="0 0 24 24"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>
                  Continue with Google
                </button>
              </>
            )}
          </div>
        ) : (
          <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {/* Profile Card */}
            <Card t={ht}>
              <div style={{display:"flex",alignItems:"center",gap:14}}>
                <div style={{width:52,height:52,borderRadius:"50%",background:ht.headerGradient,display:"flex",alignItems:"center",justifyContent:"center",color:ht.headerText,fontFamily:ht.heading,fontSize:22,fontWeight:700}}>
                  {(profile?.display_name || user?.user_metadata?.display_name || "R")[0].toUpperCase()}
                </div>
                <div>
                  <div style={{fontFamily:ht.heading,fontSize:18,fontWeight:700,color:ht.dark}}>{profile?.display_name || user?.user_metadata?.display_name || "Reader"}</div>
                  <div style={{fontFamily:ht.ui,fontSize:12,color:ht.muted}}>{user.email}</div>
                  <div style={{fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:2}}>Joined {new Date(user.created_at).toLocaleDateString()}</div>
                </div>
              </div>
            </Card>

            {/* Stats */}
            <Card t={ht}>
              <Label icon="📊" t={ht} color={ht.muted}>My Study Stats</Label>
              <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:10}}>
                {[
                  {n: allHighlights.length, l:"Highlights", icon:"🎨"},
                  {n: allHighlights.filter(h=>h.is_bookmarked).length, l:"Bookmarks", icon:"★"},
                  {n: prayers.length, l:"Prayers", icon:"🙏"},
                  {n: prayers.filter(p=>p.is_answered).length, l:"Answered", icon:"✓"},
                ].map((s,i) => (
                  <div key={i} style={{background:ht.accentLight,borderRadius:10,padding:"14px",textAlign:"center",border:`1px solid ${ht.accentBorder}`}}>
                    <div style={{fontSize:14,marginBottom:4}}>{s.icon}</div>
                    <div style={{fontFamily:ht.heading,fontSize:22,fontWeight:700,color:ht.dark}}>{s.n}</div>
                    <div style={{fontFamily:ht.ui,fontSize:10,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.08em"}}>{s.l}</div>
                  </div>
                ))}
              </div>
              {streak && streak.current_streak >= 1 && (
                <div style={{ marginTop:10,background:darkMode?"#78350f":"#fef3c7",borderRadius:10,padding:"14px 18px",border:"1px solid #d97706",display:"flex",alignItems:"center",justifyContent:"space-between" }}>
                  <div style={{ display:"flex",alignItems:"center",gap:10 }}>
                    <span style={{ fontSize:22 }}>🔥</span>
                    <div>
                      <div style={{ fontFamily:ht.heading,fontSize:20,fontWeight:700,color:darkMode?"#fef3c7":"#92400e" }}>{streak.current_streak}-day streak</div>
                      <div style={{ fontFamily:ht.ui,fontSize:11,color:darkMode?"#d97706":"#b45309",marginTop:2 }}>Keep reading daily to maintain it</div>
                    </div>
                  </div>
                  <div style={{ textAlign:"right" }}>
                    <div style={{ fontFamily:ht.ui,fontSize:10,color:darkMode?"#d97706":"#b45309",textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:2 }}>Best</div>
                    <div style={{ fontFamily:ht.heading,fontSize:18,fontWeight:700,color:darkMode?"#fef3c7":"#92400e" }}>{streak.longest_streak}</div>
                  </div>
                </div>
              )}
              {user && !streak && (
                <div style={{ marginTop:10,background:ht.accentLight,borderRadius:10,padding:"12px 16px",border:`1px solid ${ht.accentBorder}`,textAlign:"center" }}>
                  <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted }}>🔥 Open a verse to start your reading streak!</div>
                </div>
              )}
            </Card>

            {/* Achievements */}
            <Card t={ht}>
              <Label icon="🏆" t={ht} color={ht.muted}>Achievements ({Object.keys(earnedBadges).length}/{BADGES.length})</Label>
              {BADGE_CATEGORIES.map(cat => {
                const catBadges = BADGES.filter(b => b.category === cat.id);
                const earnedCount = catBadges.filter(b => earnedBadges[b.id]).length;
                return (
                  <div key={cat.id} style={{ marginBottom: 16 }}>
                    <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between",marginBottom:6 }}>
                      <span style={{ fontFamily:ht.ui,fontSize:12,fontWeight:700,color:ht.dark }}>{cat.icon} {cat.label}</span>
                      <span style={{ fontFamily:ht.ui,fontSize:10,color:ht.muted }}>{earnedCount}/{catBadges.length}</span>
                    </div>
                    <div style={{ height:4,borderRadius:2,background:ht.divider,marginBottom:10 }}>
                      <div style={{ height:"100%",borderRadius:2,background:ht.accent,width:`${catBadges.length > 0 ? (earnedCount/catBadges.length)*100 : 0}%`,transition:"width 0.3s" }} />
                    </div>
                    <div style={{ display:"grid",gridTemplateColumns:"1fr 1fr",gap:8 }}>
                      {catBadges.map(badge => {
                        const earned = !!earnedBadges[badge.id];
                        return (
                          <div key={badge.id} style={{
                            padding:"10px 12px",borderRadius:10,
                            border:`1px ${earned?"solid":"dashed"} ${earned?ht.accent:ht.divider}`,
                            background:earned?ht.accentLight:"transparent",
                            opacity:earned?1:0.45,
                            display:"flex",alignItems:"center",gap:8,
                          }}>
                            <span style={{ fontSize:20 }}>{badge.icon}</span>
                            <div style={{ minWidth:0 }}>
                              <div style={{ fontFamily:ht.ui,fontSize:12,fontWeight:700,color:ht.dark }}>{badge.name}</div>
                              <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.muted,lineHeight:1.4 }}>{badge.description}</div>
                              {earned && <div style={{ fontFamily:ht.ui,fontSize:9,color:ht.accent,marginTop:2 }}>Earned {new Date(earnedBadges[badge.id].earned_at).toLocaleDateString()}</div>}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  </div>
                );
              })}
            </Card>

            {/* Settings */}
            <Card t={ht}>
              <Label icon="⚙️" t={ht} color={ht.muted}>Settings</Label>
              <div style={{display:"flex",alignItems:"center",justifyContent:"space-between",padding:"12px 14px",border:`1px solid ${ht.divider}`,borderRadius:10,marginBottom:6}}>
                <div style={{display:"flex",alignItems:"center",gap:12}}>
                  <span style={{fontSize:18}}>{darkMode ? "🌙" : "☀️"}</span>
                  <span style={{fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark}}>Dark Mode</span>
                </div>
                <button onClick={() => setDarkMode(!darkMode)} style={{width:48,height:26,borderRadius:13,border:"none",cursor:"pointer",position:"relative",background:darkMode ? ht.accent : ht.divider,transition:"background 0.25s",padding:0}}>
                  <div style={{width:22,height:22,borderRadius:11,background:"#fff",position:"absolute",top:2,left:darkMode?24:2,transition:"left 0.25s",boxShadow:"0 1px 3px rgba(0,0,0,0.2)"}}/>
                </button>
              </div>
              <div style={{padding:"12px 14px",border:`1px solid ${ht.divider}`,borderRadius:10,marginBottom:6}}>
                <div style={{display:"flex",alignItems:"center",gap:12,marginBottom:10}}>
                  <span style={{fontSize:18}}>Aa</span>
                  <span style={{fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark}}>Reading Size</span>
                </div>
                <div style={{display:"flex",gap:6}}>
                  {[{id:"small",label:"S"},{id:"medium",label:"M"},{id:"large",label:"L"},{id:"xlarge",label:"XL"}].map(({id,label}) => (
                    <button key={id} onClick={() => setFontSize(id)} style={{
                      flex:1,padding:"8px 0",borderRadius:8,border:`1.5px solid ${fontSize===id ? ht.accent : ht.divider}`,
                      background:fontSize===id ? ht.accent : "transparent",
                      color:fontSize===id ? "#fff" : ht.muted,
                      fontFamily:ht.ui,fontSize:13,fontWeight:700,cursor:"pointer",
                      transition:"all 0.15s"
                    }}>{label}</button>
                  ))}
                </div>
              </div>
              <div style={{padding:"12px 14px",border:`1px solid ${ht.divider}`,borderRadius:10,marginBottom:6}}>
                <div style={{display:"flex",alignItems:"center",gap:12,marginBottom:10}}>
                  <span style={{fontSize:18}}>🌐</span>
                  <span style={{fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark}}>Bible Translation</span>
                </div>
                {["English","Indian","International"].map(group => {
                  const items = BIBLE_TRANSLATIONS.filter(t => t.group === group);
                  return (
                    <div key={group} style={{marginBottom:8}}>
                      <div style={{fontFamily:ht.ui,fontSize:10,fontWeight:700,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:5}}>{group === "Indian" ? "\u092D\u093E\u0930\u0924\u0940\u092F" : group}</div>
                      <div style={{display:"flex",flexWrap:"wrap",gap:5}}>
                        {items.map(t => (
                          <button key={t.id} onClick={() => setBibleTranslation(t.id)} style={{
                            padding:"6px 10px",borderRadius:7,border:`1.5px solid ${bibleTranslation===t.id ? ht.accent : ht.divider}`,
                            background:bibleTranslation===t.id ? ht.accent : "transparent",
                            color:bibleTranslation===t.id ? "#fff" : ht.muted,
                            fontFamily:ht.ui,fontSize:12,fontWeight:700,cursor:"pointer",
                            transition:"all 0.15s"
                          }}>{t.label}</button>
                        ))}
                      </div>
                    </div>
                  );
                })}
                {bibleTranslation !== "kjv" && (
                  <div style={{fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:4,lineHeight:1.4}}>
                    {BIBLE_TRANSLATIONS.find(t => t.id === bibleTranslation)?.name} — Study notes remain in English (KJV)
                  </div>
                )}
              </div>
            </Card>

            {/* Quick Actions */}
            <Card t={ht}>
              <Label icon="⚡" t={ht} color={ht.muted}>Quick Actions</Label>
              {[
                {label:"My Highlights",icon:"🎨",action:()=>nav("highlights")},
                {label:"Prayer Community",icon:"🙏",action:()=>nav("prayer-home")},
              ].map((a,i) => (
                <button key={i} onClick={a.action} style={{width:"100%",display:"flex",alignItems:"center",gap:12,padding:"12px 14px",background:"transparent",border:`1px solid ${ht.divider}`,borderRadius:10,cursor:"pointer",marginBottom:6,textAlign:"left"}}>
                  <span style={{fontSize:18}}>{a.icon}</span>
                  <span style={{fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark,flex:1}}>{a.label}</span>
                  <div style={{color:ht.light}}><ChevIcon /></div>
                </button>
              ))}
            </Card>

            {/* Support the Ministry */}
            <Card accent t={ht}>
              <Label icon="❤️" t={ht}>Support the Ministry</Label>
              <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:12}}>
                This Study Bible is completely free — every feature, every word study, every tool. If this resource has blessed you, consider supporting the ministry so we can keep building and sharing God's Word.
              </div>
              <button onClick={() => setDonateModal(true)} style={{padding:"12px 24px",borderRadius:10,border:"none",background:"linear-gradient(135deg,#D4A853,#B8860B)",color:"#fff",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer",boxShadow:"0 2px 8px rgba(212,168,83,0.3)"}}>
                ❤️ Support This Ministry
              </button>
            </Card>

            {/* Sign Out */}
            <button onClick={handleLogout} style={{width:"100%",padding:"14px",borderRadius:12,border:`1.5px solid #E8625C44`,background:"#E8625C08",color:"#E8625C",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginTop:8}}>Sign Out</button>
          </div>
        )}
      </div>
    </div>
  );
}
