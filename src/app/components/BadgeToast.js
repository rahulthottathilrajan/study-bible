"use client";
import { useEffect } from "react";
import { useApp } from "../context/AppContext";

export default function BadgeToast() {
  const { badgeToast, setBadgeToast, nav, ht, darkMode } = useApp();

  useEffect(() => {
    if (!badgeToast) return;
    const t = setTimeout(() => setBadgeToast(null), 4000);
    return () => clearTimeout(t);
  }, [badgeToast, setBadgeToast]);

  if (!badgeToast) return null;

  return (
    <div
      onClick={() => { setBadgeToast(null); nav("account"); }}
      style={{
        position: "fixed", top: 20, left: "50%", transform: "translateX(-50%)",
        zIndex: 9999, cursor: "pointer",
        background: darkMode ? "#2a2318" : "#fffbeb",
        border: "2px solid #d97706",
        borderRadius: 16, padding: "12px 20px",
        display: "flex", alignItems: "center", gap: 12,
        boxShadow: "0 8px 32px rgba(217,119,6,0.25)",
        animation: "badgeSlideIn 0.4s ease",
        maxWidth: "90vw",
      }}
    >
      <style>{`@keyframes badgeSlideIn{0%{opacity:0;transform:translateX(-50%) translateY(-20px)}100%{opacity:1;transform:translateX(-50%) translateY(0)}}`}</style>
      <span style={{ fontSize: 28 }}>{badgeToast.icon}</span>
      <div>
        <div style={{ fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: "#d97706", textTransform: "uppercase", letterSpacing: "0.1em" }}>
          Badge Earned!
        </div>
        <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: darkMode ? "#fef3c7" : "#92400e", marginTop: 2 }}>
          {badgeToast.name}
        </div>
      </div>
    </div>
  );
}
