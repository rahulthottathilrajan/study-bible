"use client";
import { useApp } from "../context/AppContext";
import { Btn, BackIcon, UserIcon, PrayerIcon } from "./ui";

export default function Header({ title, subtitle, onBack, right, theme }) {
  const { user, profile, t, setPrayerModal, handleLogout, nav } = useApp();
  const th = theme || t;
  return (
    <div style={{ background:th.headerGradient,padding:"12px 16px 14px",position:"sticky",top:0,zIndex:10 }}>
      <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between" }}>
        <div style={{ display:"flex",alignItems:"center",gap:8,flex:1,minWidth:0 }}>
          {onBack && <Btn onClick={onBack} style={{color:th.headerText,padding:"6px 10px 6px 6px",borderRadius:8,background:"rgba(255,255,255,0.08)"}}><BackIcon /></Btn>}
          <div style={{ minWidth:0 }}>
            <h2 style={{ fontFamily:th.heading,fontSize:17,fontWeight:700,color:th.headerText,margin:0,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis" }}>{title}</h2>
            {subtitle && <div style={{ fontFamily:th.ui,fontSize:11,color:`${th.headerText}99`,marginTop:1 }}>{subtitle}</div>}
          </div>
        </div>
        <div style={{ display:"flex",alignItems:"center",gap:6,flexShrink:0 }}>
          {right}
          {user && <Btn onClick={() => setPrayerModal(true)} style={{color:th.headerText}} title="Prayer Journal"><PrayerIcon /></Btn>}
          <Btn onClick={() => user ? handleLogout() : nav("account")} style={{ color:th.headerText,background:user?"rgba(125,212,173,0.2)":"rgba(255,255,255,0.1)",padding:"6px 10px",borderRadius:8 }}>
            <UserIcon />
            {user && <span style={{ fontFamily:th.ui,fontSize:10,marginLeft:4,fontWeight:600 }}>{(profile?.display_name || user?.user_metadata?.display_name || '')?.split(' ')[0] || '•'}</span>}
          </Btn>
        </div>
      </div>
    </div>
  );
}
