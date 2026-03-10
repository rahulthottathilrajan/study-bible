"use client";
import { useApp } from "../context/AppContext";
import { CloseIcon, CrossIcon } from "./ui";

const BENEFITS = [
  { icon: "\u270F\uFE0F", text: "Save notes & highlights across devices" },
  { icon: "\uD83D\uDD25", text: "Track your reading streak & earn badges" },
  { icon: "\uD83D\uDE4F", text: "Join the prayer community" },
  { icon: "\uD83D\uDED2", text: "Access the store & digital library" },
];

export default function WelcomeModal() {
  const {
    welcomeModal, setWelcomeModal,
    ht, authMode, setAuthMode, authEmail, setAuthEmail, authPass, setAuthPass,
    authName, setAuthName, authError, authLoading, authShowPass, setAuthShowPass,
    authForgot, setAuthForgot, authForgotSent,
    handleAuth, handleForgotPassword, handleGoogleSignIn, nav,
  } = useApp();

  if (!welcomeModal) return null;

  const dismiss = () => {
    setWelcomeModal(false);
    try { localStorage.setItem("welcomeDismissed", "1"); } catch {}
  };

  const onAuth = async () => {
    await handleAuth();
    // Auth state change listener in AppContext will close modal when user is set
  };

  return (
    <div onClick={dismiss} style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
      <div onClick={e => e.stopPropagation()} style={{ background:ht.bg,borderRadius:20,padding:"28px 22px",width:"100%",maxWidth:420,maxHeight:"90vh",overflow:"auto",position:"relative",animation:"fadeIn 0.25s ease" }}>
        {/* Close */}
        <button onClick={dismiss} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>

        {/* Brand intro */}
        <div style={{ textAlign:"center",marginBottom:20 }}>
          <div style={{ color:ht.accent,marginBottom:8,display:"flex",justifyContent:"center" }}><CrossIcon /></div>
          <h2 style={{ fontFamily:ht.heading,fontSize:24,fontWeight:700,color:ht.dark,margin:0 }}>The Bible Scrollers</h2>
          <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"6px 0 0",lineHeight:1.5 }}>Your Complete KJV Study Companion</p>
        </div>

        {/* Benefits */}
        {!authForgot && (
          <div style={{ display:"flex",flexDirection:"column",gap:6,marginBottom:18,background:ht.card,borderRadius:12,padding:"12px 14px",border:`1px solid ${ht.divider}` }}>
            {BENEFITS.map((b, i) => (
              <div key={i} style={{ display:"flex",alignItems:"center",gap:10 }}>
                <span style={{ fontSize:16,flexShrink:0 }}>{b.icon}</span>
                <span style={{ fontFamily:ht.ui,fontSize:12,color:ht.text,lineHeight:1.5 }}>{b.text}</span>
              </div>
            ))}
          </div>
        )}

        {/* Auth heading */}
        <div style={{ textAlign:"center",marginBottom:10 }}>
          <div style={{ fontFamily:ht.ui,fontSize:14,fontWeight:700,color:ht.dark }}>
            {authForgot ? "Reset Password" : authMode === "login" ? "Sign In" : "Create Account"}
          </div>
          <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:2 }}>
            {authForgot ? "Enter your email and we\u2019ll send a reset link" : authMode === "login" ? "Access your notes, highlights & journal" : "Free account \u2014 sync your study across devices"}
          </div>
        </div>

        {/* Mode toggle */}
        {!authForgot && (
          <div style={{ display:"flex",background:ht.card,borderRadius:10,padding:3,marginBottom:14,border:`1px solid ${ht.divider}` }}>
            {[{id:"login",label:"Sign In"},{id:"signup",label:"Create Account"}].map(m => (
              <button key={m.id} onClick={() => setAuthMode(m.id)} style={{ flex:1,padding:"9px 6px",border:"none",borderRadius:8,background:authMode===m.id?ht.headerGradient:"transparent",color:authMode===m.id?(ht.headerText||"#fff"):ht.muted,fontFamily:ht.ui,fontSize:12,fontWeight:700,cursor:"pointer",transition:"all 0.15s" }}>
                {m.label}
              </button>
            ))}
          </div>
        )}

        {/* Form */}
        <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
          {!authForgot && authMode === "signup" && (
            <input value={authName} onChange={e => setAuthName(e.target.value)} placeholder="Display Name" style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:13,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box" }} />
          )}
          <input type="email" value={authEmail} onChange={e => setAuthEmail(e.target.value)} placeholder="Email address" style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:13,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box" }} />
          {!authForgot && (
            <div style={{ position:"relative" }}>
              <input type={authShowPass?"text":"password"} value={authPass} onChange={e => setAuthPass(e.target.value)} placeholder="Password" onKeyDown={e => e.key === "Enter" && onAuth()} style={{ width:"100%",padding:"12px 42px 12px 14px",borderRadius:10,border:`1.5px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:13,outline:"none",background:ht.bg,color:ht.dark,boxSizing:"border-box" }} />
              <button onClick={() => setAuthShowPass(v => !v)} style={{ position:"absolute",right:12,top:"50%",transform:"translateY(-50%)",background:"none",border:"none",cursor:"pointer",color:ht.muted,fontSize:14,padding:4 }}>
                {authShowPass ? "\uD83D\uDE48" : "\uD83D\uDC41"}
              </button>
            </div>
          )}
          {authError && <div style={{ fontFamily:ht.ui,fontSize:11,color:"#E8625C",textAlign:"center",padding:"4px 0" }}>{authError}</div>}

          <button onClick={authForgot ? handleForgotPassword : onAuth} disabled={authLoading} style={{ width:"100%",padding:"13px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText||"#fff",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginTop:2,opacity:authLoading?0.7:1 }}>
            {authLoading ? "..." : authForgot ? "Send Reset Link" : authMode === "login" ? "Sign In" : "Create Account"}
          </button>

          {authForgotSent && (
            <div style={{ fontFamily:ht.ui,fontSize:12,color:"#34A853",textAlign:"center",padding:"4px 0" }}>
              {"\u2713"} Reset link sent {"\u2014"} check your email
            </div>
          )}

          {!authForgot && authMode === "login" && (
            <button onClick={() => setAuthForgot(true)} style={{ background:"none",border:"none",cursor:"pointer",fontFamily:ht.ui,fontSize:12,color:ht.muted,textAlign:"center",padding:"2px 0" }}>
              Forgot password?
            </button>
          )}
          {authForgot && (
            <button onClick={() => setAuthForgot(false)} style={{ background:"none",border:"none",cursor:"pointer",fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",padding:"2px 0",fontWeight:600 }}>
              {"\u2190"} Back to Sign In
            </button>
          )}
        </div>

        {/* Google OAuth */}
        {!authForgot && (
          <>
            <div style={{ display:"flex",alignItems:"center",gap:12,margin:"14px 0" }}>
              <div style={{ flex:1,height:1,background:ht.divider }} />
              <span style={{ fontFamily:ht.ui,fontSize:11,color:ht.light }}>or</span>
              <div style={{ flex:1,height:1,background:ht.divider }} />
            </div>
            <button onClick={handleGoogleSignIn} style={{ width:"100%",padding:"12px",borderRadius:10,border:`1.5px solid ${ht.divider}`,background:ht.card,fontFamily:ht.ui,fontSize:13,fontWeight:600,color:ht.dark,cursor:"pointer",display:"flex",alignItems:"center",justifyContent:"center",gap:10 }}>
              <svg width="16" height="16" viewBox="0 0 24 24"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>
              Continue with Google
            </button>
          </>
        )}

        {/* Skip */}
        <button onClick={dismiss} style={{ width:"100%",marginTop:14,padding:"10px",background:"none",border:"none",cursor:"pointer",fontFamily:ht.ui,fontSize:13,color:ht.muted,fontWeight:600,textAlign:"center" }}>
          Maybe Later
        </button>

        {/* Terms */}
        <div style={{ textAlign:"center",marginTop:8 }}>
          <span style={{ fontFamily:ht.ui,fontSize:10,color:ht.light,lineHeight:1.5 }}>
            By signing in, you agree to our{" "}
            <span onClick={() => { dismiss(); nav("terms"); }} style={{ color:ht.accent,cursor:"pointer",textDecoration:"underline" }}>Terms & Privacy Policy</span>
          </span>
        </div>
      </div>
    </div>
  );
}
