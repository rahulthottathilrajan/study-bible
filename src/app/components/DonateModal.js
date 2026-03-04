"use client";
import { useApp } from "../context/AppContext";
import { CloseIcon } from "./ui";

const DONATIONS = [
  { amount:"AED 10", label:"Plant a seed", icon:"\ud83c\udf31" },
  { amount:"AED 20", label:"Light a lamp", icon:"\ud83d\udd6f\ufe0f" },
  { amount:"AED 30", label:"Support a chapter", icon:"\ud83d\udcd6" },
  { amount:"AED 50", label:"Support a book", icon:"\ud83d\udcda" },
  { amount:"AED 100", label:"A generous blessing", icon:"\ud83d\ude4f" },
];

const STRIPE_URL = "https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200";

export default function DonateModal() {
  const { donateModal, setDonateModal, ht } = useApp();

  if (!donateModal) return null;

  return (
    <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
      <div style={{ background:ht.bg,borderRadius:20,padding:"28px 22px",width:"100%",maxWidth:420,maxHeight:"90vh",overflow:"auto",position:"relative" }}>
        <button onClick={() => setDonateModal(false)} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
        <div style={{ textAlign:"center",marginBottom:22 }}>
          <div style={{fontSize:40,marginBottom:8}}>{"\u2764\ufe0f"}</div>
          <h3 style={{ fontFamily:ht.heading,fontSize:24,color:ht.dark,margin:0 }}>Support the Ministry</h3>
          <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"8px 0 0",lineHeight:1.6 }}>Every feature is free. Your generosity helps us keep building.</p>
        </div>

        <div style={{background:ht.card,borderRadius:12,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18}}>
          <div style={{fontFamily:ht.body,fontSize:14,color:ht.text,lineHeight:1.75,fontStyle:"italic",textAlign:"center"}}>
            {"\u201c"}Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over.{"\u201d"}
          </div>
          <div style={{fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",marginTop:4}}>{"\u2014"} Luke 6:38 (KJV)</div>
        </div>

        <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:18,textAlign:"center"}}>
          Every verse, every word study, every tool {"\u2014"} completely free. Your generosity helps us keep building and sharing God{"\u2019"}s Word with the world.
        </div>

        <div style={{display:"flex",flexDirection:"column",gap:8}}>
          {DONATIONS.map((d,i) => (
            <a key={i} href={STRIPE_URL} target="_blank" rel="noopener noreferrer"
              style={{
                width:"100%",padding:"14px 18px",borderRadius:12,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",justifyContent:"space-between",
                background:i===3?"linear-gradient(135deg,#D4A853,#B8860B)":ht.card,
                border:i===3?"none":`1.5px solid ${ht.divider}`,
                color:i===3?"#fff":ht.dark,
                boxShadow:i===3?"0 4px 15px rgba(212,168,83,0.3)":"none",
                textDecoration:"none",boxSizing:"border-box"
              }}>
              <div style={{display:"flex",alignItems:"center",gap:10}}>
                <span style={{fontSize:20}}>{d.icon}</span>
                <div>
                  <div style={{fontFamily:ht.heading,fontSize:15,fontWeight:700}}>{d.label}</div>
                </div>
              </div>
              <div style={{fontFamily:ht.heading,fontSize:20,fontWeight:800}}>{d.amount}</div>
            </a>
          ))}
        </div>

        <div style={{textAlign:"center",marginTop:16}}>
          <a href={STRIPE_URL} target="_blank" rel="noopener noreferrer"
            style={{fontFamily:ht.ui,fontSize:13,color:ht.accent,fontWeight:600,textDecoration:"none"}}>
            Or enter a custom amount {"\u2192"}
          </a>
        </div>

        <div style={{textAlign:"center",marginTop:12,fontFamily:ht.ui,fontSize:11,color:ht.light}}>
          Secure payment via Stripe {"\u00b7"} Tax-deductible where applicable
        </div>
      </div>
    </div>
  );
}
