"use client";
import { useApp } from "../context/AppContext";
import { Btn, BackIcon, UserIcon, PrayerIcon } from "./ui";
import GoToBar from "./GoToBar";
import UtilityStrip from "./UtilityStrip";

const hex2rgba = (hex, a) => { const v = parseInt(hex.replace("#",""),16); return `rgba(${(v>>16)&255},${(v>>8)&255},${v&255},${a})`; };

export default function Header({ title, subtitle, onBack, right, theme, hidePrayer, hideUser }) {
  const { user, profile, t, bp, setPrayerModal, handleLogout, nav } = useApp();
  const th = theme || t;
  const ac = th.accent, ht = th.headerText;
  return (
    <div style={{ background:th.headerGradient,padding:`12px ${bp.isMobile?16:bp.isTablet?24:32}px 0`,position:"sticky",top:0,zIndex:10 }}>
      <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between" }}>
        <div style={{ display:"flex",alignItems:"center",gap:8,flex:1,minWidth:0 }}>
          {onBack && <Btn onClick={onBack} style={{color:ht,padding:"6px 10px 6px 6px",borderRadius:8,background:"rgba(255,255,255,0.08)"}}><BackIcon /></Btn>}
          <div style={{ minWidth:0 }}>
            <h2 style={{ fontFamily:th.heading,fontSize:14,fontWeight:700,color:ht,margin:0,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis" }}>{title}</h2>
            {subtitle && <div style={{ fontFamily:th.ui,fontSize:11,color:`${ht}99`,marginTop:1 }}>{subtitle}</div>}
          </div>
        </div>
        <div style={{ display:"flex",alignItems:"center",gap:6,flexShrink:0 }}>
          {right}
          {!hidePrayer && user && <Btn onClick={() => setPrayerModal(true)} style={{color:ht}} title="Prayer Journal"><PrayerIcon /></Btn>}
          {!hideUser && <Btn onClick={() => user ? handleLogout() : nav("account")} style={{ color:ht,background:user?"rgba(125,212,173,0.2)":"rgba(255,255,255,0.1)",padding:"6px 10px",borderRadius:8 }}>
            <UserIcon />
            {user && <span style={{ fontFamily:th.ui,fontSize:10,marginLeft:4,fontWeight:600 }}>{(profile?.display_name || user?.user_metadata?.display_name || '')?.split(' ')[0] || '•'}</span>}
          </Btn>}
        </div>
      </div>
      {/* ── ANIMATED ACCENT LINE ── */}
      <div style={{ height:2,background:`linear-gradient(90deg,${hex2rgba(ac,0.6)},${hex2rgba(ht,0.9)},${hex2rgba(ac,0.8)},${hex2rgba(ht,0.95)},${hex2rgba(ac,0.6)})`,backgroundSize:"200% 100%",animation:"goldFlow 3s linear infinite",marginTop:6 }}/>
      <GoToBar />
      <UtilityStrip theme={th} />
    </div>
  );
}
