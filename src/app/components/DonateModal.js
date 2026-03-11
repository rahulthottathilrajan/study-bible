"use client";
import { useState } from "react";
import { useApp } from "../context/AppContext";
import { CloseIcon } from "./ui";
import { SUPPORTED_CURRENCIES, formatAmount } from "../utils/currency";

const TIER_LABELS = [
  { icon: "🌱", label: "Plant a seed" },
  { icon: "🕯️", label: "Light a lamp" },
  { icon: "📖", label: "Support a chapter" },
  { icon: "📚", label: "Support a book" },
  { icon: "🙏", label: "A generous blessing" },
];

export default function DonateModal() {
  const { donateModal, setDonateModal, donateSuccess, setDonateSuccess, ht, currency } = useApp();
  const [loadingTier, setLoadingTier] = useState(null);
  const [customAmount, setCustomAmount] = useState("");
  const [error, setError] = useState(null);

  if (!donateModal) return null;

  const cfg = SUPPORTED_CURRENCIES[currency] || SUPPORTED_CURRENCIES.USD;
  const tiers = cfg.tiers.map((amount, i) => ({ amount, ...TIER_LABELS[i] }));

  const handleClose = () => { setDonateModal(false); setDonateSuccess(false); };

  // ── Thank-you screen shown after returning from Stripe ──────────────────────
  if (donateSuccess) {
    return (
      <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
        <div style={{ background:ht.bg,borderRadius:20,padding:"36px 28px",width:"100%",maxWidth:380,textAlign:"center",position:"relative" }}>
          <button onClick={handleClose} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
          <div style={{ fontSize:52,marginBottom:12 }}>🙏</div>
          <h3 style={{ fontFamily:ht.heading,fontSize:22,color:ht.dark,margin:"0 0 10px" }}>God bless you!</h3>
          <p style={{ fontFamily:ht.ui,fontSize:14,color:ht.muted,lineHeight:1.7,margin:"0 0 20px" }}>
            Your generous gift helps us keep building and sharing God's Word with the world — completely free.
          </p>
          <div style={{ background:ht.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${ht.divider}`,marginBottom:20 }}>
            <div style={{ fontFamily:ht.body,fontSize:13,color:ht.text,lineHeight:1.75,fontStyle:"italic" }}>
              "Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over."
            </div>
            <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.accent,marginTop:4 }}>— Luke 6:38 (KJV)</div>
          </div>
          <button onClick={handleClose} style={{ background:ht.accent,color:"#fff",border:"none",borderRadius:12,padding:"12px 32px",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>
            Continue Reading
          </button>
        </div>
      </div>
    );
  }

  // ── Main donate form ─────────────────────────────────────────────────────────
  const handleDonate = async (amount, label) => {
    setError(null);
    setLoadingTier(amount);
    try {
      const res = await fetch("/api/donate", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ amount, label, currency: currency.toLowerCase() }),
      });
      const data = await res.json();
      if (data.url) { window.location.href = data.url; }
      else { setError(data.error || "Something went wrong. Please try again."); setLoadingTier(null); }
    } catch {
      setError("Network error. Please try again.");
      setLoadingTier(null);
    }
  };

  const handleCustom = () => {
    const val = parseFloat(customAmount);
    if (!val || val < 1) { setError(`Please enter an amount of at least 1 ${currency}.`); return; }
    handleDonate(val, `Custom donation — ${formatAmount(val, currency)}`);
  };

  const isLoading = loadingTier !== null;

  return (
    <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
      <div style={{ background:ht.bg,borderRadius:20,padding:"28px 22px",width:"100%",maxWidth:420,maxHeight:"90vh",overflow:"auto",position:"relative" }}>
        <button
          onClick={() => { if (!isLoading) handleClose(); }}
          style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}
        >
          <CloseIcon />
        </button>

        {/* Header */}
        <div style={{ textAlign:"center",marginBottom:22 }}>
          <div style={{ fontSize:40,marginBottom:8 }}>❤️</div>
          <h3 style={{ fontFamily:ht.heading,fontSize:24,color:ht.dark,margin:0 }}>Support the Ministry</h3>
          <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"8px 0 0",lineHeight:1.6 }}>Every feature is free. Your generosity helps us keep building.</p>
        </div>

        {/* Scripture */}
        <div style={{ background:ht.card,borderRadius:12,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18 }}>
          <div style={{ fontFamily:ht.body,fontSize:14,color:ht.text,lineHeight:1.75,fontStyle:"italic",textAlign:"center" }}>
            "Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over."
          </div>
          <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",marginTop:4 }}>— Luke 6:38 (KJV)</div>
        </div>

        {/* Currency badge */}
        <div style={{ display:"flex",alignItems:"center",justifyContent:"center",gap:6,marginBottom:14 }}>
          <span style={{ fontSize:14 }}>{cfg.flag}</span>
          <span style={{ fontFamily:ht.ui,fontSize:11,fontWeight:600,color:ht.muted }}>
            Amounts in {cfg.name} ({currency})
          </span>
        </div>

        {/* Tier buttons */}
        <div style={{ display:"flex",flexDirection:"column",gap:8,marginBottom:16 }}>
          {tiers.map((tier, i) => {
            const isThis = loadingTier === tier.amount;
            const isFeatured = i === 3;
            return (
              <button
                key={tier.amount}
                onClick={() => !isLoading && handleDonate(tier.amount, tier.label)}
                disabled={isLoading}
                style={{
                  width:"100%",padding:"14px 18px",borderRadius:12,cursor:isLoading?"default":"pointer",
                  textAlign:"left",display:"flex",alignItems:"center",justifyContent:"space-between",
                  background: isFeatured ? "linear-gradient(135deg,#D4A853,#B8860B)" : ht.card,
                  border: isFeatured ? "none" : `1.5px solid ${ht.divider}`,
                  color: isFeatured ? "#fff" : ht.dark,
                  boxShadow: isFeatured ? "0 4px 15px rgba(212,168,83,0.3)" : "none",
                  opacity: isLoading && !isThis ? 0.5 : 1,
                  transition: "opacity 0.15s",
                  boxSizing:"border-box",
                }}
              >
                <div style={{ display:"flex",alignItems:"center",gap:10 }}>
                  <span style={{ fontSize:20 }}>{tier.icon}</span>
                  <span style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700 }}>{tier.label}</span>
                </div>
                <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                  <span style={{ fontFamily:ht.heading,fontSize:18,fontWeight:800 }}>
                    {formatAmount(tier.amount, currency)}
                  </span>
                  {isThis && (
                    <div style={{ width:16,height:16,border:`2px solid ${isFeatured?"rgba(255,255,255,0.4)":ht.accent+"40"}`,borderTopColor:isFeatured?"#fff":ht.accent,borderRadius:"50%",animation:"spin 0.7s linear infinite",flexShrink:0 }} />
                  )}
                </div>
              </button>
            );
          })}
        </div>

        {/* Custom amount */}
        <div style={{ background:ht.card,borderRadius:12,border:`1.5px solid ${ht.divider}`,padding:"14px 16px",marginBottom:12 }}>
          <div style={{ fontFamily:ht.ui,fontSize:12,fontWeight:700,color:ht.muted,marginBottom:8 }}>
            Custom amount ({currency})
          </div>
          <div style={{ display:"flex",gap:8 }}>
            <div style={{ flex:1,position:"relative" }}>
              <span style={{ position:"absolute",left:12,top:"50%",transform:"translateY(-50%)",fontFamily:ht.ui,fontSize:13,color:ht.muted,pointerEvents:"none" }}>
                {cfg.symbol}
              </span>
              <input
                type="number"
                min="1"
                step="1"
                placeholder={`e.g. ${cfg.tiers[2]}`}
                value={customAmount}
                onChange={e => { setCustomAmount(e.target.value); setError(null); }}
                disabled={isLoading}
                style={{
                  width:"100%",padding:`10px 14px 10px ${cfg.symbol.length > 2 ? "52px" : "32px"}`,
                  borderRadius:10,border:`1.5px solid ${ht.divider}`,
                  background:ht.bg,color:ht.dark,
                  fontFamily:ht.ui,fontSize:14,outline:"none",
                  boxSizing:"border-box",
                }}
              />
            </div>
            <button
              onClick={handleCustom}
              disabled={isLoading || !customAmount}
              style={{
                padding:"10px 18px",borderRadius:10,border:"none",
                background: customAmount && !isLoading ? ht.accent : `${ht.muted}30`,
                color: customAmount && !isLoading ? "#fff" : ht.muted,
                fontFamily:ht.ui,fontSize:13,fontWeight:700,
                cursor: customAmount && !isLoading ? "pointer" : "default",
                display:"flex",alignItems:"center",gap:6,flexShrink:0,
              }}
            >
              {loadingTier === "custom" ? (
                <div style={{ width:14,height:14,border:"2px solid rgba(255,255,255,0.4)",borderTopColor:"#fff",borderRadius:"50%",animation:"spin 0.7s linear infinite" }} />
              ) : "Give"}
            </button>
          </div>
        </div>

        {/* Error */}
        {error && (
          <div style={{ background:"rgba(239,68,68,0.08)",border:"1px solid rgba(239,68,68,0.25)",borderRadius:10,padding:"10px 14px",marginBottom:10,fontFamily:ht.ui,fontSize:12,color:"#dc2626" }}>
            {error}
          </div>
        )}

        <div style={{ textAlign:"center",marginTop:8,fontFamily:ht.ui,fontSize:11,color:ht.light }}>
          Secure payment via Stripe · Tax-deductible where applicable
        </div>
      </div>
    </div>
  );
}
