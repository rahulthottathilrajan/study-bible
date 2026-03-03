// ─── Icons ───
export const BackIcon = () => <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>;
export const ChevIcon = () => <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>;
export const CrossIcon = () => (
  <svg width="38" height="38" viewBox="0 0 28 28" fill="none">
    <defs>
      <linearGradient id="crossGold" x1="0" y1="0" x2="1" y2="1">
        <stop offset="0%" stopColor="#F5D485"/>
        <stop offset="50%" stopColor="#D4A853"/>
        <stop offset="100%" stopColor="#A87820"/>
      </linearGradient>
      <filter id="crossGlow">
        <feGaussianBlur stdDeviation="1.2" result="blur"/>
        <feMerge><feMergeNode in="blur"/><feMergeNode in="SourceGraphic"/></feMerge>
      </filter>
    </defs>
    <rect x="11" y="2" width="6" height="24" rx="1.5" fill="url(#crossGold)" filter="url(#crossGlow)"/>
    <rect x="3" y="8" width="22" height="6" rx="1.5" fill="url(#crossGold)" filter="url(#crossGlow)"/>
  </svg>
);
export const UserIcon = () => <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>;
export const PrayerIcon = () => <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"><path d="M12 2L12 6M12 18L12 22M4.93 4.93L7.76 7.76M16.24 16.24L19.07 19.07M2 12H6M18 12H22M4.93 19.07L7.76 16.24M16.24 7.76L19.07 4.93"/></svg>;
export const CloseIcon = () => <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>;

// ─── Themed UI Components ───
export const Badge = ({children,t}) => <span style={{background:t.accentLight,color:t.accent,fontSize:10,padding:"2px 8px",borderRadius:6,fontFamily:t.ui,fontWeight:700,textTransform:"uppercase",letterSpacing:"0.05em"}}>{children}</span>;
export const Label = ({icon,children,t,color}) => <div style={{fontFamily:t.ui,fontSize:11.5,fontWeight:700,color:color||t.accent,textTransform:"uppercase",letterSpacing:"0.1em",marginBottom:10,display:"flex",alignItems:"center",gap:6}}><span>{icon}</span> {children}</div>;
export const Card = ({children,style={},accent,t}) => <div style={{background:accent?t.accentLight:t.card,borderRadius:14,padding:"18px 20px",border:`1px solid ${accent?t.accentBorder:t.divider}`,boxShadow:accent?"none":"0 1px 4px rgba(0,0,0,0.04)",animation:"fadeIn 0.3s ease",...style}}>{children}</div>;
export const Btn = ({children,onClick,style={},disabled}) => <button onClick={onClick} disabled={disabled} style={{background:"rgba(255,255,255,0.15)",border:"none",borderRadius:8,padding:"8px",cursor:disabled?"default":"pointer",display:"flex",alignItems:"center",justifyContent:"center",transition:"all 0.2s",color:"inherit",opacity:disabled?0.4:1,...style}}>{children}</button>;
export const Spinner = ({t}) => <div style={{display:"flex",justifyContent:"center",padding:40}}><div style={{width:32,height:32,border:`3px solid ${t.divider}`,borderTop:`3px solid ${t.accent}`,borderRadius:"50%",animation:"spin 0.8s linear infinite"}}/></div>;
export const DBBadge = ({live,t}) => <span style={{fontSize:9,padding:"2px 6px",borderRadius:4,background:live?"#1a5c2a22":t.accentLight,color:live?"#1a5c2a":t.muted,fontFamily:"monospace",fontWeight:700}}>{live?"● LIVE":"● PREVIEW"}</span>;

