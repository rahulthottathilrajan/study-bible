"use client";
import { useState, useEffect, useCallback } from "react";
import { useApp } from "../context/AppContext";
import { BackIcon } from "../components/ui";
import { supabase } from "../../lib/supabase";

// ── Category icons ─────────────────────────────────────────────────────────────
function ShirtIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
    </svg>
  );
}
function BookIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M4 19.5A2.5 2.5 0 016.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z"/>
    </svg>
  );
}
function BookOpenIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/>
    </svg>
  );
}
function StickerIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c1.85 0 3.58-.5 5.06-1.38L21 21l-1.38-5.94A9.95 9.95 0 0022 12c0-5.52-4.48-10-10-10z"/>
      <path d="M8 12h8M12 8v8"/>
    </svg>
  );
}
function BagIcon({ color, size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/>
      <line x1="3" y1="6" x2="21" y2="6"/>
      <path d="M16 10a4 4 0 01-8 0"/>
    </svg>
  );
}
function TruckIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/>
    </svg>
  );
}
function ShieldIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><polyline points="9 12 11 14 15 10"/>
    </svg>
  );
}
function RefreshIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="23 4 23 10 17 10"/><path d="M20.49 15a9 9 0 11-2.12-9.36L23 10"/>
    </svg>
  );
}
function TrashIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 01-2 2H7a2 2 0 01-2-2V6m3 0V4a2 2 0 012-2h4a2 2 0 012 2v2"/>
    </svg>
  );
}
function ChevRightIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="9 18 15 12 9 6"/>
    </svg>
  );
}
function HeartIcon({ color = "#9ca3af", size = 16, filled = false }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill={filled ? color : "none"} stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"/>
    </svg>
  );
}
function BellIcon({ color = "#9ca3af", size = 16, filled = false }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill={filled ? color : "none"} stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9"/>
      <path d="M13.73 21a2 2 0 01-3.46 0"/>
    </svg>
  );
}
function SearchIcon({ color = "#9ca3af", size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
    </svg>
  );
}
function ShareIcon({ color = "#9ca3af", size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/>
      <line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/>
    </svg>
  );
}

function getCategoryIcon(iconId, color, size) {
  if (iconId === "shirt") return <ShirtIcon color={color} size={size} />;
  if (iconId === "book") return <BookIcon color={color} size={size} />;
  if (iconId === "book-open") return <BookOpenIcon color={color} size={size} />;
  if (iconId === "sticker") return <StickerIcon color={color} size={size} />;
  return <BagIcon color={color} size={size} />;
}

// ── Shop Header ────────────────────────────────────────────────────────────────
function ShopHeader({ title, subtitle, onBack, t }) {
  const { user, profile, darkMode, setDarkMode, nav, bp, setWelcomeModal } = useApp();
  const hPad = bp.isMobile ? 16 : bp.isTablet ? 24 : 32;
  const ht = t.headerText;
  const firstName = (profile?.display_name || user?.user_metadata?.display_name || "")?.split(" ")[0];

  return (
    <div style={{ background: t.headerGradient, padding: `10px ${hPad}px 0`, position: "sticky", top: 0, zIndex: 10 }}>
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between" }}>
        <div style={{ display: "flex", alignItems: "center", gap: 8, flex: 1, minWidth: 0 }}>
          {onBack && (
            <button onClick={onBack} style={{ color: ht, padding: "6px 10px 6px 6px", borderRadius: 8, background: "rgba(255,255,255,0.08)", border: "none", cursor: "pointer", display: "flex", alignItems: "center" }}>
              <BackIcon />
            </button>
          )}
          <div style={{ minWidth: 0 }}>
            <h2 style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: ht, margin: 0, whiteSpace: "nowrap", overflow: "hidden", textOverflow: "ellipsis" }}>{title}</h2>
            {subtitle && <div style={{ fontFamily: t.ui, fontSize: 11, color: `${ht}99`, marginTop: 1 }}>{subtitle}</div>}
          </div>
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: 8, flexShrink: 0 }}>
          <button
            onClick={() => setDarkMode(!darkMode)}
            style={{ background: "rgba(255,255,255,0.08)", border: "1px solid rgba(255,255,255,0.12)", borderRadius: 6, padding: "3px 8px", cursor: "pointer", display: "flex", alignItems: "center", gap: 4 }}
          >
            <span style={{ fontSize: 11 }}>{darkMode ? "☀️" : "🌙"}</span>
            <span style={{ fontFamily: t.ui, fontSize: 9, fontWeight: 600, color: "rgba(255,255,255,0.6)" }}>{darkMode ? "Light" : "Dark"}</span>
          </button>
          {!user && (
            <button onClick={() => setWelcomeModal(true)} style={{ background: "rgba(212,168,83,0.25)", border: "1px solid rgba(212,168,83,0.45)", borderRadius: 6, padding: "3px 10px", fontFamily: t.ui, fontSize: 9, fontWeight: 700, color: "#fff", cursor: "pointer", letterSpacing: "0.03em" }}>
              Sign In
            </button>
          )}
          {user && (
            <span onClick={() => nav("account")} style={{ fontFamily: t.ui, fontSize: 10, color: "rgba(125,212,173,0.9)", fontWeight: 700, cursor: "pointer" }}>
              ✓ {firstName}
            </span>
          )}
        </div>
      </div>
      <div style={{ height: 2, background: "linear-gradient(90deg, rgba(139,92,246,0.6), rgba(255,255,255,0.9), rgba(212,168,83,0.8), rgba(255,255,255,0.95), rgba(139,92,246,0.6))", backgroundSize: "200% 100%", animation: "goldFlow 3s linear infinite", marginTop: 8 }} />
    </div>
  );
}

// ── Shared UI primitives ───────────────────────────────────────────────────────
const GOLD_BORDER = {
  background: "linear-gradient(90deg, rgba(139,92,246,0.7), rgba(212,168,83,0.9), rgba(255,255,255,0.95), rgba(212,168,83,0.8), rgba(139,92,246,0.7))",
  backgroundSize: "300% 100%",
  animation: "goldFlow 3s linear infinite",
};

function GoldDivider({ style }) {
  return <div style={{ height: 2, borderRadius: 1, ...GOLD_BORDER, ...style }} />;
}

function ComingSoonBadge({ small }) {
  return (
    <span style={{ display: "inline-flex", alignItems: "center", gap: 3, background: "rgba(212,168,83,0.12)", color: "#b8860b", fontFamily: "system-ui,sans-serif", fontSize: small ? 8 : 9, fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", padding: small ? "2px 6px" : "3px 8px", borderRadius: 20, border: "1px solid rgba(212,168,83,0.25)" }}>
      ✦ Coming Soon
    </span>
  );
}

const BADGE_CONFIGS = {
  new:         { label: "New ✨",       bg: "#D4A853", color: "#fff" },
  featured:    { label: "Featured 🔥",  bg: "#7C3AED", color: "#fff" },
  best_seller: { label: "Best Seller",  bg: "#D97706", color: "#fff" },
};

function BadgePill({ badge }) {
  const cfg = BADGE_CONFIGS[badge];
  if (!cfg) return null;
  return (
    <div style={{
      position: "absolute", top: 8, left: 8, zIndex: 2,
      background: cfg.bg, color: cfg.color,
      fontFamily: "system-ui, sans-serif", fontSize: 9, fontWeight: 700,
      letterSpacing: "0.04em", padding: "3px 8px", borderRadius: 20,
      boxShadow: "0 1px 4px rgba(0,0,0,0.22)",
      whiteSpace: "nowrap",
    }}>
      {cfg.label}
    </div>
  );
}


function SectionLabel({ t, label, action, onAction }) {
  return (
    <div style={{ marginBottom: 14 }}>
      <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 6 }}>
        <span style={{ fontFamily: t.heading, fontSize: 13, fontWeight: 700, color: "#5B2D8E" }}>{label}</span>
        {action && (
          <button onClick={onAction} style={{ background: "none", border: "none", fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: t.accent, cursor: "pointer", display: "flex", alignItems: "center", gap: 2 }}>
            {action} <ChevRightIcon color={t.accent} size={12} />
          </button>
        )}
      </div>
      <div style={{ height: 2, borderRadius: 1, ...GOLD_BORDER }} />
    </div>
  );
}

// ── Enhanced Shared UI ─────────────────────────────────────────────────────────

function ProductImg({ product, size = "full", accent }) {
  if (product.images && product.images[0]) {
    return (
      <img
        src={product.images[0]}
        alt={product.name}
        style={{ width: "100%", height: "100%", objectFit: "cover", display: "block" }}
      />
    );
  }
  const bg = product.colorBg || (accent ? `${accent}10` : "rgba(91,45,142,0.06)");
  const emojiSize = size === "small" ? 26 : size === "medium" ? 38 : 54;
  return (
    <div style={{ width: "100%", height: "100%", background: bg, display: "flex", alignItems: "center", justifyContent: "center" }}>
      <span style={{ fontSize: emojiSize, lineHeight: 1, userSelect: "none" }}>{product.emoji || "📦"}</span>
    </div>
  );
}

function StarRating({ rating, count, t }) {
  if (!rating) return null;
  return (
    <div style={{ display: "flex", alignItems: "center", gap: 3 }}>
      <span style={{ color: "#d97706", fontSize: 11 }}>★</span>
      <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: "#d97706" }}>{rating.toFixed(1)}</span>
      <span style={{ fontFamily: t.ui, fontSize: 10, color: t.muted }}>({count})</span>
    </div>
  );
}

function HeartBtn({ isWishlisted, onToggle }) {
  return (
    <button
      onClick={e => { e.stopPropagation(); onToggle(); }}
      aria-label={isWishlisted ? "Remove from wishlist" : "Save to wishlist"}
      style={{
        position: "absolute", top: 8, right: 8,
        width: 32, height: 32, borderRadius: "50%",
        background: isWishlisted ? "rgba(239,68,68,0.9)" : "rgba(255,255,255,0.88)",
        border: "none", cursor: "pointer",
        display: "flex", alignItems: "center", justifyContent: "center",
        boxShadow: "0 1px 5px rgba(0,0,0,0.18)",
        transition: "background 0.15s",
        animation: isWishlisted ? "heartPop 0.3s ease" : "none",
        zIndex: 2,
      }}
    >
      <HeartIcon color={isWishlisted ? "#fff" : "#9ca3af"} size={14} filled={isWishlisted} />
    </button>
  );
}

function ProductCard({ p, t, nav, wishlist, toggleWishlist, onQuickAdd, addedIds }) {
  const isComingSoon = p.status === "coming-soon";
  const isWishlisted = wishlist.includes(p.id);
  const purple = "#5B2D8E";
  return (
    <div style={{ position: "relative" }}>
      <button
        className="pressable"
        onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
        style={{ width: "100%", background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden", display: "flex", flexDirection: "column" }}
      >
        <div style={{ width: "100%", aspectRatio: "4/3", position: "relative", overflow: "hidden" }}>
          <ProductImg product={p} accent={t.accent} />
          {isComingSoon ? (
            <div style={{ position: "absolute", top: 8, left: 8 }}>
              <ComingSoonBadge small />
            </div>
          ) : p.badge ? (
            <BadgePill badge={p.badge} />
          ) : null}
          {/* Quick Add overlay — bottom-right of image */}
          <button
            key={addedIds[p.id] ? "added" : "add"}
            onClick={e => { e.stopPropagation(); if (!isComingSoon) onQuickAdd(p); }}
            disabled={isComingSoon}
            style={{
              position: "absolute", bottom: 8, right: 8, zIndex: 2,
              width: 32, height: 32, borderRadius: "50%",
              background: addedIds[p.id] ? "#059669" : isComingSoon ? "rgba(156,163,175,0.65)" : "rgba(91,45,142,0.9)",
              border: "none",
              cursor: isComingSoon ? "default" : "pointer",
              display: "flex", alignItems: "center", justifyContent: "center",
              boxShadow: "0 2px 6px rgba(0,0,0,0.22)",
              animation: "scaleIn 0.25s cubic-bezier(0.34,1.56,0.64,1) both",
              transition: "background 0.2s",
            }}
          >
            {addedIds[p.id]
              ? <span style={{ color: "#fff", fontSize: 13, fontWeight: 700, lineHeight: 1 }}>✓</span>
              : <BagIcon color="#fff" size={13} />}
          </button>
        </div>
        <div style={{ padding: "10px 12px 12px", flex: 1, display: "flex", flexDirection: "column", gap: 3 }}>
          <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
          <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, lineHeight: 1.3 }}>{p.tagline}</div>
          {p.rating && <StarRating rating={p.rating} count={p.rating_count} t={t} />}
          <div style={{ marginTop: "auto", paddingTop: 6 }}>
            <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: purple }}>${p.price_usd.toFixed(2)}</span>
          </div>
        </div>
      </button>
      <HeartBtn isWishlisted={isWishlisted} onToggle={() => toggleWishlist(p.id)} />
    </div>
  );
}

function HorizontalProductStrip({ products, t, nav, label }) {
  if (!products.length) return null;
  return (
    <div style={{ marginBottom: 24 }}>
      <SectionLabel t={t} label={label} />
      <div className="shop-scroll-hide" style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 4 }}>
        {products.map(p => (
          <button
            key={p.id}
            onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
            style={{ flexShrink: 0, width: 110, background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden" }}
          >
            <div style={{ width: "100%", aspectRatio: "1", overflow: "hidden" }}>
              <ProductImg product={p} accent={t.accent} size="small" />
            </div>
            <div style={{ padding: "7px 9px 9px" }}>
              <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
              <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 800, color: "#5B2D8E", marginTop: 3 }}>${p.price_usd.toFixed(2)}</div>
            </div>
          </button>
        ))}
      </div>
    </div>
  );
}

function SearchBar({ value, onChange, t }) {
  return (
    <div style={{ position: "relative", marginBottom: 20, marginTop: 16 }}>
      <div style={{ position: "absolute", left: 12, top: "50%", transform: "translateY(-50%)", pointerEvents: "none" }}>
        <SearchIcon color={t.muted} size={16} />
      </div>
      <input
        type="search"
        placeholder="Search products…"
        value={value}
        onChange={e => onChange(e.target.value)}
        style={{
          width: "100%", padding: "11px 36px 11px 38px",
          borderRadius: 12, border: `1.5px solid ${value ? t.accent : t.divider}`,
          background: t.card, color: t.dark,
          fontFamily: t.ui, fontSize: 13,
          outline: "none", transition: "border-color 0.15s",
        }}
      />
      {value && (
        <button
          onClick={() => onChange("")}
          style={{ position: "absolute", right: 10, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", cursor: "pointer", color: t.muted, fontSize: 18, padding: 4, lineHeight: 1 }}
        >×</button>
      )}
    </div>
  );
}

function ScriptureCard({ t }) {
  return (
    <div style={{ borderRadius: 14, overflow: "hidden", position: "relative", marginBottom: 16 }}>
      <div style={{ position: "absolute", inset: 0, ...GOLD_BORDER, opacity: 0.45 }} />
      <div style={{ margin: 1.5, borderRadius: 12.5, background: t.card, padding: "14px 16px", position: "relative" }}>
        <div style={{ fontFamily: "Georgia, serif", fontSize: 12, color: t.muted, lineHeight: 1.75, fontStyle: "italic", textAlign: "center" }}>
          "Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over."
        </div>
        <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textAlign: "center", marginTop: 6, letterSpacing: "0.05em" }}>— Luke 6:38</div>
      </div>
    </div>
  );
}

// ── SHOP HOME ─────────────────────────────────────────────────────────────────
function ShopHome({ catalogue, t, nav, goBack, bp, addToCart, wishlist, toggleWishlist, recent }) {
  const [addedIds, setAddedIds] = useState({});
  const [searchQuery, setSearchQuery] = useState("");
  const [notifyToast, setNotifyToast] = useState(false);

  const handleQuickAdd = (p) => {
    if (p.status === "coming-soon") return;
    addToCart(p, 1, null);
    setAddedIds(prev => ({ ...prev, [p.id]: true }));
    setTimeout(() => setAddedIds(prev => ({ ...prev, [p.id]: false })), 1200);
  };

  const purple = "#5B2D8E";
  const purpleLight = "rgba(91,45,142,0.08)";

  const recentProducts = recent.map(id => catalogue.products.find(p => p.id === id)).filter(Boolean);
  const savedProducts = wishlist.map(id => catalogue.products.find(p => p.id === id)).filter(Boolean);

  const searchResults = searchQuery.trim()
    ? catalogue.products.filter(p => {
        const q = searchQuery.toLowerCase();
        return (
          p.name.toLowerCase().includes(q) ||
          (p.tagline || "").toLowerCase().includes(q) ||
          (p.tags || []).some(tag => tag.toLowerCase().includes(q))
        );
      })
    : [];
  const isSearching = searchQuery.trim().length > 0;
  const featured = catalogue.products.slice(0, 6);

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 40 }}>
      <ShopHeader title="The Store" subtitle="Faith-inspired goods" onBack={goBack} t={t} />

      <div style={{ padding: `0 ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* ── Promotional Hero ── */}
          <div style={{ marginTop: 16, marginBottom: 4, borderRadius: 20, overflow: "hidden", position: "relative" }}>
            <div style={{ position: "absolute", inset: 0, borderRadius: 20, ...GOLD_BORDER }} />
            <div style={{
              position: "relative", margin: 2, borderRadius: 18,
              background: "linear-gradient(145deg, #2D1052 0%, #5B2D8E 60%, #7C3AED 100%)",
              padding: "26px 22px 22px",
            }}>
              <div style={{ display: "inline-flex", alignItems: "center", gap: 5, background: "rgba(212,168,83,0.2)", border: "1px solid rgba(212,168,83,0.4)", borderRadius: 20, padding: "3px 10px", marginBottom: 10 }}>
                <span style={{ color: "#D4A853", fontSize: 9 }}>✦</span>
                <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: "#D4A853", letterSpacing: "0.1em", textTransform: "uppercase" }}>The Bible Scrollers Store</span>
              </div>
              <div style={{ fontFamily: t.heading, fontSize: 24, fontWeight: 800, color: "#fff", lineHeight: 1.15, marginBottom: 8 }}>
                Wear your faith.<br />Share the Word.
              </div>
              <div style={{ fontFamily: t.ui, fontSize: 12, color: "rgba(255,255,255,0.7)", lineHeight: 1.6, marginBottom: 16 }}>
                Modest clothing, curated books & scripture art — made for the faithful.
              </div>
              <div style={{ display: "flex", gap: 8, flexWrap: "wrap" }}>
                <button
                  onClick={() => { const el = document.getElementById("shop-categories"); if (el) el.scrollIntoView({ behavior: "smooth" }); }}
                  style={{ background: "#D4A853", color: "#fff", border: "none", borderRadius: 10, padding: "9px 20px", fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: "pointer" }}
                >
                  Browse Collection
                </button>
                <button
                  onClick={() => { setNotifyToast(true); setTimeout(() => setNotifyToast(false), 2500); }}
                  style={{ display: "flex", alignItems: "center", gap: 6, background: "rgba(255,255,255,0.1)", border: "1px solid rgba(255,255,255,0.2)", borderRadius: 10, padding: "9px 16px", fontFamily: t.ui, fontSize: 13, fontWeight: 600, color: "rgba(255,255,255,0.85)", cursor: "pointer" }}
                >
                  <BellIcon color="rgba(255,255,255,0.85)" size={14} />
                  New Arrivals
                </button>
              </div>
              {notifyToast && (
                <div style={{ marginTop: 10, fontFamily: t.ui, fontSize: 11, color: "rgba(125,212,173,0.9)", fontWeight: 600, animation: "fadeIn 0.2s ease" }}>
                  ✓ You're on the list! We'll notify you of new arrivals.
                </div>
              )}
            </div>
          </div>

          {/* ── Search Bar ── */}
          <SearchBar value={searchQuery} onChange={setSearchQuery} t={t} />

          {isSearching ? (
            <div>
              <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, marginBottom: 14 }}>
                {searchResults.length > 0
                  ? `${searchResults.length} result${searchResults.length !== 1 ? "s" : ""} for "${searchQuery}"`
                  : `No results for "${searchQuery}"`}
              </div>
              {searchResults.length > 0 ? (
                <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12 }}>
                  {searchResults.map(p => (
                    <ProductCard key={p.id} p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                  ))}
                </div>
              ) : (
                <div style={{ textAlign: "center", padding: "40px 20px" }}>
                  <div style={{ fontSize: 40, marginBottom: 12 }}>🔍</div>
                  <div style={{ fontFamily: t.heading, fontSize: 15, fontWeight: 700, color: t.dark, marginBottom: 6 }}>Nothing found</div>
                  <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>Try: clothing, books, stickers, hoodie…</div>
                </div>
              )}
            </div>
          ) : (
            <>
              {/* ── Categories ── */}
              <div id="shop-categories">
                <SectionLabel t={t} label="Categories" />
              </div>
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 28 }}>
                {catalogue.categories.map(cat => (
                  <button
                    key={cat.id}
                    className="pressable"
                    onClick={() => nav("shop-category", { shopCategory: cat.id })}
                    style={{
                      background: t.card, border: `1.5px solid ${t.divider}`,
                      borderRadius: 16, padding: "18px 14px",
                      display: "flex", flexDirection: "column", alignItems: "center",
                      gap: 8, cursor: "pointer", textAlign: "center",
                    }}
                  >
                    <div style={{ width: 48, height: 48, borderRadius: 14, background: purpleLight, display: "flex", alignItems: "center", justifyContent: "center" }}>
                      {getCategoryIcon(cat.icon, purple, 24)}
                    </div>
                    <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark }}>{cat.name}</div>
                    <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, lineHeight: 1.3 }}>{cat.tag}</div>
                  </button>
                ))}
              </div>

              {savedProducts.length > 0 && (
                <HorizontalProductStrip products={savedProducts} t={t} nav={nav} label="❤ Saved" />
              )}
              {recentProducts.length > 0 && (
                <HorizontalProductStrip products={recentProducts} t={t} nav={nav} label="Recently Viewed" />
              )}

              {/* ── Featured ── */}
              <SectionLabel t={t} label="Featured" action="See All" onAction={() => nav("shop-category", { shopCategory: catalogue.categories[0]?.id })} />
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 28 }}>
                {featured.map(p => (
                  <ProductCard key={p.id} p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                ))}
              </div>

              {/* ── Mission Note ── */}
              <div style={{ borderRadius: 16, overflow: "hidden", position: "relative" }}>
                <div style={{ position: "absolute", inset: 0, borderRadius: 16, ...GOLD_BORDER, opacity: 0.5 }} />
                <div style={{ margin: 1.5, borderRadius: 14.5, background: t.card, padding: "18px 16px", display: "flex", gap: 14, alignItems: "flex-start", position: "relative" }}>
                  <div style={{ width: 40, height: 40, borderRadius: 10, background: purpleLight, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                    <span style={{ fontSize: 16, color: purple }}>✦</span>
                  </div>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: purple, marginBottom: 4 }}>Faith-first. No ads. No noise.</div>
                    <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, lineHeight: 1.6 }}>Every purchase supports the ministry. Thoughtfully made goods for believers — things worth having.</div>
                  </div>
                </div>
              </div>
            </>
          )}

        </div>
      </div>
    </div>
  );
}

// ── SHOP CATEGORY ─────────────────────────────────────────────────────────────
function ShopCategory({ catalogue, shopCategory, t, nav, goBack, bp, addToCart, wishlist, toggleWishlist }) {
  const { darkMode } = useApp();
  const cat = catalogue.categories.find(c => c.id === shopCategory);
  const allProducts = catalogue.products.filter(p => p.category_id === shopCategory);
  const [sort, setSort] = useState("all");
  const [statusFilter, setStatusFilter] = useState("all");
  const [subFilter, setSubFilter] = useState("all");
  const [addedIds, setAddedIds] = useState({});

  // Reset sub-filter when category changes
  useEffect(() => { setSubFilter("all"); }, [shopCategory]);

  if (!cat) { goBack(); return null; }

  const handleQuickAdd = (p) => {
    if (p.status === "coming-soon") return;
    addToCart(p, 1, null);
    setAddedIds(prev => ({ ...prev, [p.id]: true }));
    setTimeout(() => setAddedIds(prev => ({ ...prev, [p.id]: false })), 1200);
  };

  // Build subcategories from products
  const subcategories = [];
  const seenSubs = new Set();
  allProducts.forEach(p => {
    if (p.subcategory && !seenSubs.has(p.subcategory)) {
      seenSubs.add(p.subcategory);
      subcategories.push({ name: p.subcategory, emoji: p.emoji, colorBg: p.colorBg });
    }
  });

  // Apply filters
  let sorted = allProducts;
  if (subFilter !== "all") sorted = sorted.filter(p => p.subcategory === subFilter);
  if (statusFilter !== "all") sorted = sorted.filter(p => p.status === statusFilter);
  if (sort === "price-asc") sorted = [...sorted].sort((a, b) => a.price_usd - b.price_usd);
  if (sort === "price-desc") sorted = [...sorted].sort((a, b) => b.price_usd - a.price_usd);

  const sortOptions = [
    { id: "all", label: "All" },
    { id: "price-asc", label: "Price ↑" },
    { id: "price-desc", label: "Price ↓" },
  ];
  const statusOptions = [
    { id: "all", label: "All" },
    { id: "active", label: "Available" },
    { id: "coming-soon", label: "Coming Soon" },
  ];

  const purple = "#5B2D8E";
  const gold = "#D4A853";
  const railBg = darkMode ? t.card : "#FAF6F0";

  return (
    <div style={{ minHeight: "100vh", background: t.bg }}>
      <ShopHeader title={cat.name} subtitle={cat.tag} onBack={goBack} t={t} />

      <div style={{ display: "flex" }}>
        {/* ── Left-rail category navigator ── */}
        <div style={{
          width: 72, flexShrink: 0,
          position: "sticky", top: 44, alignSelf: "flex-start",
          height: "calc(100vh - 44px)",
          background: railBg,
          borderRight: `1px solid ${t.divider}`,
          display: "flex", flexDirection: "column",
          paddingTop: 12, gap: 2,
          overflowY: "auto",
        }}>
          {catalogue.categories.map(c => {
            const isActive = c.id === shopCategory;
            return (
              <button
                key={c.id}
                onClick={() => nav("shop-category", { shopCategory: c.id })}
                style={{
                  display: "flex", flexDirection: "column", alignItems: "center",
                  gap: 3, padding: "10px 4px",
                  background: "none", border: "none", cursor: "pointer",
                  borderLeft: isActive ? `3px solid ${purple}` : "3px solid transparent",
                  transition: "all 0.15s",
                }}
              >
                <span style={{ fontSize: 28, lineHeight: 1 }}>{c.emoji || "🛍"}</span>
                <span style={{
                  fontFamily: t.ui, fontSize: 9, fontWeight: isActive ? 700 : 500,
                  color: isActive ? purple : t.muted,
                  lineHeight: 1.1, textAlign: "center",
                  maxWidth: 60, overflow: "hidden", textOverflow: "ellipsis",
                }}>
                  {c.name.length > 10 ? c.name.split(" ")[0] : c.name}
                </span>
              </button>
            );
          })}
        </div>

        {/* ── Main content ── */}
        <div style={{ flex: 1, minWidth: 0, paddingBottom: 40 }}>

          {/* ── Category header banner ── */}
          <div style={{
            background: "linear-gradient(145deg, #2D1052 0%, #5B2D8E 60%, #7C3AED 100%)",
            padding: "18px 16px",
            borderBottomLeftRadius: 20, borderBottomRightRadius: 20,
            minHeight: 130, display: "flex", flexDirection: "column", justifyContent: "center",
          }}>
            <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
              <span style={{ fontSize: 48, lineHeight: 1, flexShrink: 0 }}>{cat.emoji || "🛍"}</span>
              <div style={{ flex: 1, minWidth: 0 }}>
                <div style={{ fontFamily: "'DM Serif Display', Georgia, serif", fontSize: 22, fontWeight: 800, color: gold, marginBottom: 6, lineHeight: 1.15 }}>{cat.name}</div>
                <div style={{ display: "flex", gap: 6, flexWrap: "wrap" }}>
                  <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: "#fff", background: "rgba(255,255,255,0.15)", padding: "2px 8px", borderRadius: 20 }}>{cat.tag}</span>
                  <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: "#fff", background: "rgba(255,255,255,0.15)", padding: "2px 8px", borderRadius: 20 }}>{allProducts.length} item{allProducts.length !== 1 ? "s" : ""}</span>
                </div>
              </div>
            </div>
            <div style={{ fontFamily: t.ui, fontSize: 11, color: "rgba(255,255,255,0.6)", marginTop: 10, lineHeight: 1.4 }}>{cat.description}</div>
          </div>

          {/* ── Sub-category circular grid ── */}
          {subcategories.length > 0 && (
            <div style={{ padding: "16px 12px 8px" }}>
              <div style={{ display: "grid", gridTemplateColumns: "repeat(3, 1fr)", gap: 10, justifyItems: "center" }}>
                {/* "All" pill */}
                <button
                  onClick={() => setSubFilter("all")}
                  style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, background: "none", border: "none", cursor: "pointer", padding: 4 }}
                >
                  <div style={{
                    width: 80, height: 80, borderRadius: "50%",
                    background: subFilter === "all" ? `${purple}18` : `${t.muted}0A`,
                    border: subFilter === "all" ? `2px solid ${purple}` : `2px solid transparent`,
                    display: "flex", alignItems: "center", justifyContent: "center",
                    transition: "all 0.15s",
                  }}>
                    <span style={{ fontSize: 28 }}>✦</span>
                  </div>
                  <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: subFilter === "all" ? 700 : 500, color: subFilter === "all" ? purple : t.muted }}>All</span>
                </button>
                {subcategories.map(sub => (
                  <button
                    key={sub.name}
                    onClick={() => setSubFilter(sub.name)}
                    style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, background: "none", border: "none", cursor: "pointer", padding: 4 }}
                  >
                    <div style={{
                      width: 80, height: 80, borderRadius: "50%",
                      background: subFilter === sub.name ? `${purple}18` : (sub.colorBg || `${t.muted}0A`),
                      border: subFilter === sub.name ? `2px solid ${purple}` : `2px solid transparent`,
                      display: "flex", alignItems: "center", justifyContent: "center",
                      transition: "all 0.15s",
                    }}>
                      <span style={{ fontSize: 28 }}>{sub.emoji}</span>
                    </div>
                    <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: subFilter === sub.name ? 700 : 500, color: subFilter === sub.name ? purple : t.muted }}>{sub.name}</span>
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* ── Sort / filter bar ── */}
          <div style={{ position: "sticky", top: 0, zIndex: 9, background: t.bg, borderBottom: `1px solid ${t.divider}`, padding: "10px 12px" }}>
            <div style={{ display: "flex", gap: 6, alignItems: "center", marginBottom: 7 }}>
              <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: t.muted, minWidth: 28 }}>Sort</span>
              {sortOptions.map(o => (
                <button
                  key={o.id}
                  onClick={() => setSort(o.id)}
                  style={{
                    padding: "5px 12px", borderRadius: 20,
                    background: sort === o.id ? t.accent : "transparent",
                    color: sort === o.id ? "#fff" : t.muted,
                    border: sort === o.id ? "none" : `1px solid ${t.divider}`,
                    fontFamily: t.ui, fontSize: 11, fontWeight: 600,
                    cursor: "pointer", transition: "all 0.15s",
                  }}
                >
                  {o.label}
                </button>
              ))}
              <span style={{ marginLeft: "auto", fontFamily: t.ui, fontSize: 11, color: t.muted }}>{sorted.length} items</span>
            </div>
            <div style={{ display: "flex", gap: 6, alignItems: "center" }}>
              <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 600, color: t.muted, minWidth: 28 }}>Show</span>
              {statusOptions.map(o => (
                <button
                  key={o.id}
                  onClick={() => setStatusFilter(o.id)}
                  style={{
                    padding: "5px 12px", borderRadius: 20,
                    background: statusFilter === o.id ? purple : "transparent",
                    color: statusFilter === o.id ? "#fff" : t.muted,
                    border: statusFilter === o.id ? "none" : `1px solid ${t.divider}`,
                    fontFamily: t.ui, fontSize: 11, fontWeight: 600,
                    cursor: "pointer", transition: "all 0.15s",
                  }}
                >
                  {o.label}
                </button>
              ))}
            </div>
          </div>

          {/* ── Product grid ── */}
          <div style={{ padding: "16px 12px" }}>
            {sorted.length === 0 ? (
              <div style={{ textAlign: "center", padding: "60px 20px" }}>
                <div style={{ fontSize: 40, marginBottom: 12 }}>🛍</div>
                <div style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark, marginBottom: 6 }}>No products match this filter</div>
                <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Try a different filter or check back soon.</div>
              </div>
            ) : (
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12 }}>
                {sorted.map(p => (
                  <ProductCard key={p.id} p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                ))}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}

// ── SHOP PRODUCT ──────────────────────────────────────────────────────────────
function ShopProduct({ catalogue, shopProduct: shopProductId, t, nav, goBack, bp, user, addToCart, setWelcomeModal, wishlist, toggleWishlist, notified, toggleNotify, addToRecent }) {
  const [selectedSize, setSelectedSize] = useState(null);
  const [added, setAdded] = useState(false);
  const [activeTab, setActiveTab] = useState("description");
  const [carouselIndex, setCarouselIndex] = useState(0);
  const [notifyToast, setNotifyToast] = useState(false);
  const product = catalogue.products.find(p => p.id === shopProductId);
  if (!product) { goBack(); return null; }

  // eslint-disable-next-line react-hooks/rules-of-hooks
  useEffect(() => {
    addToRecent(product.id);
  }, [product.id]); // eslint-disable-line react-hooks/exhaustive-deps

  const isActive = product.status === "active";
  const isComingSoon = product.status === "coming-soon";
  const needsSize = product.sizes && product.sizes.length > 0;
  const canAdd = isActive && (!needsSize || selectedSize);
  const isWishlisted = wishlist.includes(product.id);
  const isNotified = notified.includes(product.id);
  const hasImages = product.images && product.images.length > 0;
  const carouselSlots = hasImages ? product.images.length : 3;

  const handleAddToCart = () => {
    addToCart(product, 1, selectedSize);
    setAdded(true);
    setTimeout(() => { nav("shop-cart"); }, 600);
  };

  const handleToggleNotify = () => {
    toggleNotify(product.id);
    if (!isNotified) {
      setNotifyToast(true);
      setTimeout(() => setNotifyToast(false), 2500);
    }
  };

  const trustBadges = [
    { icon: <ShieldIcon color={t.accent} />, label: "Secure Payment" },
    { icon: <TruckIcon color={t.accent} />, label: "Global Shipping" },
    { icon: <RefreshIcon color={t.accent} />, label: "Easy Returns" },
  ];

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 90 }}>
      <ShopHeader title={product.name} onBack={goBack} t={t} />

      <div style={{ padding: `0 ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* Image Area */}
          <div style={{ marginTop: 12, marginBottom: 20 }}>
            <div style={{ width: "100%", aspectRatio: "4/3", borderRadius: 20, overflow: "hidden", border: `1.5px solid ${t.divider}`, position: "relative" }}>
              {hasImages ? (
                <img src={product.images[carouselIndex]} alt={product.name} style={{ width: "100%", height: "100%", objectFit: "cover" }} />
              ) : (
                <ProductImg product={product} accent={t.accent} size="full" />
              )}
              {isComingSoon && (
                <div style={{ position: "absolute", top: 12, left: 12 }}>
                  <ComingSoonBadge />
                </div>
              )}
            </div>
            <div style={{ display: "flex", justifyContent: "center", gap: 8, marginTop: 12 }}>
              {Array.from({ length: carouselSlots }).map((_, i) => (
                <button
                  key={i}
                  onClick={() => setCarouselIndex(i)}
                  style={{
                    width: carouselIndex === i ? 20 : 8, height: 8,
                    borderRadius: 4,
                    background: carouselIndex === i ? t.accent : `${t.muted}40`,
                    border: "none", cursor: "pointer",
                    transition: "all 0.2s",
                  }}
                />
              ))}
            </div>
          </div>

          {/* Name + Rating + Price */}
          <div style={{ fontFamily: t.heading, fontSize: 22, fontWeight: 800, color: t.dark, lineHeight: 1.2, marginBottom: 4 }}>{product.name}</div>
          <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 8 }}>{product.tagline}</div>

          {product.rating && (
            <div style={{ display: "flex", alignItems: "center", gap: 6, marginBottom: 12 }}>
              <div style={{ display: "flex", gap: 1 }}>
                {[1,2,3,4,5].map(n => (
                  <span key={n} style={{ color: n <= Math.round(product.rating) ? "#d97706" : "#e5e7eb", fontSize: 14 }}>★</span>
                ))}
              </div>
              <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: "#d97706" }}>{product.rating.toFixed(1)}</span>
              <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>({product.rating_count} reviews)</span>
            </div>
          )}

          <div style={{ display: "flex", alignItems: "baseline", gap: 8, marginBottom: 20 }}>
            <span style={{ fontFamily: t.heading, fontSize: 28, fontWeight: 800, color: t.dark }}>${product.price_usd.toFixed(2)}</span>
            <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>USD</span>
            {product.fulfillment === "digital" && (
              <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 600, color: "#059669", background: "rgba(16,185,129,0.1)", padding: "3px 10px", borderRadius: 20 }}>Instant download</span>
            )}
          </div>

          <GoldDivider style={{ marginBottom: 20, opacity: 0.6 }} />

          {/* Size Selector */}
          {needsSize && (
            <div style={{ marginBottom: 20 }}>
              <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.dark, marginBottom: 10 }}>Size</div>
              <div style={{ display: "flex", gap: 8, flexWrap: "wrap" }}>
                {product.sizes.map(s => {
                  const sel = selectedSize === s;
                  return (
                    <button
                      key={s}
                      onClick={() => setSelectedSize(s)}
                      style={{
                        padding: "8px 18px", borderRadius: 24,
                        border: `1.5px solid ${sel ? t.accent : t.divider}`,
                        background: sel ? `${t.accent}15` : t.card,
                        color: sel ? t.accent : t.text,
                        fontFamily: t.ui, fontSize: 13, fontWeight: sel ? 700 : 500,
                        cursor: "pointer", transition: "all 0.15s",
                      }}
                    >
                      {s}
                    </button>
                  );
                })}
              </div>
            </div>
          )}

          {/* Trust Badges */}
          <div style={{ display: "flex", justifyContent: "space-around", background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: "14px 8px", marginBottom: 20 }}>
            {trustBadges.map((b, i) => (
              <div key={i} style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6 }}>
                {b.icon}
                <span style={{ fontFamily: t.ui, fontSize: 9, fontWeight: 600, color: t.muted, textAlign: "center" }}>{b.label}</span>
              </div>
            ))}
          </div>

          {notifyToast && (
            <div style={{ background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.25)", borderRadius: 12, padding: "10px 14px", marginBottom: 16, fontFamily: t.ui, fontSize: 12, color: "#059669", animation: "fadeIn 0.2s ease", textAlign: "center" }}>
              🔔 We'll let you know when it's available!
            </div>
          )}

          {/* Tabbed Content */}
          <div style={{ marginBottom: 20 }}>
            <div style={{ display: "flex", borderBottom: `2px solid ${t.divider}`, marginBottom: 14 }}>
              {[{ id: "description", label: "Description" }, { id: "details", label: "Details" }].map(tab => (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  style={{
                    flex: 1, padding: "10px 0",
                    background: "none", border: "none",
                    borderBottom: activeTab === tab.id ? `2px solid ${t.accent}` : "2px solid transparent",
                    marginBottom: -2,
                    fontFamily: t.ui, fontSize: 13, fontWeight: activeTab === tab.id ? 700 : 500,
                    color: activeTab === tab.id ? t.dark : t.muted,
                    cursor: "pointer", transition: "all 0.15s",
                  }}
                >
                  {tab.label}
                </button>
              ))}
            </div>
            {activeTab === "description" && (
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, lineHeight: 1.8 }}>{product.description}</div>
            )}
            {activeTab === "details" && (
              <div style={{ display: "flex", flexDirection: "column", gap: 10 }}>
                <DetailRow t={t} label="Category" value={catalogue.categories.find(c => c.id === product.category_id)?.name || "—"} />
                <DetailRow t={t} label="Fulfillment" value={product.fulfillment === "digital" ? "Instant Digital Download" : product.fulfillment === "printful" ? "Print-on-Demand (Printful)" : "Dropship — Global"} />
                {needsSize && <DetailRow t={t} label="Sizes" value={product.sizes.join(", ")} />}
                {product.tags?.length > 0 && (
                  <div style={{ display: "flex", gap: 6, flexWrap: "wrap", marginTop: 4 }}>
                    {product.tags.map(tag => (
                      <span key={tag} style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, background: `${t.accent}08`, border: `1px solid ${t.divider}`, borderRadius: 20, padding: "3px 10px" }}>#{tag}</span>
                    ))}
                  </div>
                )}
              </div>
            )}
          </div>

        </div>
      </div>

      {/* Sticky Bottom CTA */}
      <div style={{
        position: "fixed", bottom: 64, left: 0, right: 0, zIndex: 20,
        background: t.bg, borderTop: `1px solid ${t.divider}`,
        padding: `10px ${bp.pad}px`,
      }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>
          {isComingSoon ? (
            <div style={{ display: "flex", gap: 8 }}>
              <button
                onClick={handleToggleNotify}
                style={{
                  flex: 1, padding: "13px", borderRadius: 14,
                  background: isNotified ? "rgba(16,185,129,0.1)" : `${t.accent}12`,
                  border: `1.5px solid ${isNotified ? "rgba(16,185,129,0.4)" : t.accentBorder}`,
                  color: isNotified ? "#059669" : t.dark,
                  fontFamily: t.ui, fontSize: 14, fontWeight: 700,
                  cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", gap: 8,
                  transition: "all 0.2s",
                }}
              >
                <BellIcon color={isNotified ? "#059669" : t.dark} size={16} filled={isNotified} />
                {isNotified ? "Subscribed ✓" : "Notify me when available"}
              </button>
              <button
                onClick={() => toggleWishlist(product.id)}
                style={{
                  width: 48, height: 48, borderRadius: 14,
                  background: isWishlisted ? "rgba(239,68,68,0.1)" : t.card,
                  border: `1.5px solid ${isWishlisted ? "rgba(239,68,68,0.3)" : t.divider}`,
                  cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center",
                  flexShrink: 0, transition: "all 0.2s",
                }}
              >
                <HeartIcon color={isWishlisted ? "#ef4444" : t.muted} size={18} filled={isWishlisted} />
              </button>
            </div>
          ) : isActive ? (
            !user ? (
              <button onClick={() => setWelcomeModal(true)} style={{ width: "100%", padding: "14px", borderRadius: 14, background: t.accent, color: "#fff", border: "none", fontFamily: t.ui, fontSize: 15, fontWeight: 700, cursor: "pointer" }}>
                Sign in to Purchase
              </button>
            ) : (
              <div style={{ display: "flex", gap: 8 }}>
                <button
                  onClick={handleAddToCart}
                  disabled={!canAdd || added}
                  style={{
                    flex: 1, padding: "14px", borderRadius: 14,
                    background: added ? "#059669" : canAdd ? t.accent : `${t.muted}60`,
                    color: "#fff", border: "none",
                    fontFamily: t.ui, fontSize: 15, fontWeight: 700,
                    cursor: canAdd && !added ? "pointer" : "default",
                    transition: "background 0.2s",
                    display: "flex", alignItems: "center", justifyContent: "center", gap: 8,
                  }}
                >
                  {added ? "✓ Added — Going to Cart…" : needsSize && !selectedSize ? "Select a Size" : "Add to Cart"}
                </button>
                <button
                  onClick={() => toggleWishlist(product.id)}
                  style={{
                    width: 50, height: 50, borderRadius: 14,
                    background: isWishlisted ? "rgba(239,68,68,0.1)" : t.card,
                    border: `1.5px solid ${isWishlisted ? "rgba(239,68,68,0.3)" : t.divider}`,
                    cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center",
                    flexShrink: 0, transition: "all 0.2s",
                  }}
                >
                  <HeartIcon color={isWishlisted ? "#ef4444" : t.muted} size={18} filled={isWishlisted} />
                </button>
              </div>
            )
          ) : null}
        </div>
      </div>
    </div>
  );
}

function DetailRow({ t, label, value }) {
  return (
    <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", padding: "8px 0", borderBottom: `1px solid ${t.divider}` }}>
      <span style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: t.muted }}>{label}</span>
      <span style={{ fontFamily: t.ui, fontSize: 12, color: t.dark, textAlign: "right", maxWidth: "60%" }}>{value}</span>
    </div>
  );
}

// ── SHOP CART ─────────────────────────────────────────────────────────────────
function ShopCart({ t, nav, goBack, bp, cart, removeFromCart, updateQty, user, wishlist, catalogue }) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [promoCode, setPromoCode] = useState("");

  const subtotal = cart.reduce((s, i) => s + i.product.price_usd * i.qty, 0);
  const itemCount = cart.reduce((s, i) => s + i.qty, 0);

  const handleCheckout = useCallback(async () => {
    if (!user || cart.length === 0) return;
    setLoading(true);
    setError(null);
    try {
      const session = await supabase.auth.getSession();
      const token = session.data.session?.access_token;
      const res = await fetch("/api/shop-checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json", ...(token ? { Authorization: `Bearer ${token}` } : {}) },
        body: JSON.stringify({ cart, userEmail: user.email }),
      });
      const data = await res.json();
      if (data.url && data.url.startsWith("https://checkout.stripe.com")) {
        window.location.href = data.url;
      } else if (data.url) {
        setError("Invalid redirect. Please try again.");
      } else setError(data.error || "Checkout failed. Please try again.");
    } catch {
      setError("Network error. Please try again.");
    }
    setLoading(false);
  }, [cart, user]);

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: cart.length > 0 ? 140 : 40 }}>
      <ShopHeader title="Your Cart" subtitle={cart.length > 0 ? `${itemCount} item${itemCount !== 1 ? "s" : ""}` : undefined} onBack={goBack} t={t} />

      <div style={{ padding: `16px ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {cart.length === 0 ? (
            <div>
              {/* Empty state illustration */}
              <div style={{ textAlign: "center", padding: "52px 20px 32px" }}>
                <div style={{ width: 80, height: 80, borderRadius: "50%", background: `${t.accent}0C`, display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 20px" }}>
                  <BagIcon color={`${t.accent}50`} size={36} />
                </div>
                <div style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 700, color: t.dark, marginBottom: 8 }}>Your cart is empty</div>
                <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 24, lineHeight: 1.6 }}>Browse the store and add something faithful.</div>
                <button onClick={() => nav("shop-home")} style={{ background: t.accent, color: "#fff", border: "none", borderRadius: 12, padding: "12px 28px", fontFamily: t.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>
                  Browse Store
                </button>
              </div>

              {/* Discovery: Saved Items */}
              {catalogue && wishlist && wishlist.length > 0 && (() => {
                const saved = wishlist.map(id => catalogue.products.find(p => p.id === id)).filter(Boolean);
                if (!saved.length) return null;
                return (
                  <div style={{ marginBottom: 28 }}>
                    <SectionLabel t={t} label="❤ Saved Items" />
                    <div className="shop-scroll-hide" style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 4 }}>
                      {saved.map(p => (
                        <button key={p.id} onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                          style={{ flexShrink: 0, width: 110, background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden" }}>
                          <div style={{ width: "100%", aspectRatio: "1", overflow: "hidden" }}>
                            <ProductImg product={p} accent={t.accent} size="small" />
                          </div>
                          <div style={{ padding: "7px 9px 9px" }}>
                            <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
                            <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 800, color: "#5B2D8E", marginTop: 3 }}>${p.price_usd.toFixed(2)}</div>
                          </div>
                        </button>
                      ))}
                    </div>
                  </div>
                );
              })()}

              {/* Discovery: You Might Like */}
              {catalogue && (() => {
                const active = catalogue.products.filter(p => p.status === "active");
                if (!active.length) return null;
                return (
                  <div style={{ marginBottom: 28 }}>
                    <SectionLabel t={t} label="You Might Like" />
                    <div className="shop-scroll-hide" style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 4 }}>
                      {active.map(p => (
                        <button key={p.id} onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                          style={{ flexShrink: 0, width: 110, background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden" }}>
                          <div style={{ width: "100%", aspectRatio: "1", overflow: "hidden" }}>
                            <ProductImg product={p} accent={t.accent} size="small" />
                          </div>
                          <div style={{ padding: "7px 9px 9px" }}>
                            <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
                            <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 800, color: "#5B2D8E", marginTop: 3 }}>${p.price_usd.toFixed(2)}</div>
                          </div>
                        </button>
                      ))}
                    </div>
                  </div>
                );
              })()}
            </div>
          ) : (
            <>
              <div style={{ display: "flex", flexDirection: "column", gap: 10, marginBottom: 20 }}>
                {cart.map((item, idx) => (
                  <div
                    key={item.product.id + (item.size || "") + idx}
                    style={{ background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: "14px", display: "flex", gap: 12, alignItems: "center" }}
                  >
                    <div style={{ width: 64, height: 64, borderRadius: 12, overflow: "hidden", flexShrink: 0 }}>
                      <ProductImg product={item.product} accent={t.accent} size="small" />
                    </div>
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, lineHeight: 1.3, marginBottom: 2 }}>{item.product.name}</div>
                      {item.size && <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted }}>Size: {item.size}</div>}
                      <div style={{ marginTop: 6 }}>
                        <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: t.dark }}>${(item.product.price_usd * item.qty).toFixed(2)}</span>
                      </div>
                    </div>
                    <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, flexShrink: 0 }}>
                      <div style={{ display: "flex", alignItems: "center", background: t.bg, borderRadius: 10, border: `1px solid ${t.divider}`, overflow: "hidden" }}>
                        <button onClick={() => updateQty(item.product.id, item.size, item.qty - 1)} style={{ width: 30, height: 30, border: "none", background: "none", color: t.dark, fontSize: 16, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>−</button>
                        <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, minWidth: 22, textAlign: "center" }}>{item.qty}</span>
                        <button onClick={() => updateQty(item.product.id, item.size, item.qty + 1)} style={{ width: 30, height: 30, border: "none", background: "none", color: t.dark, fontSize: 16, fontWeight: 700, cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center" }}>+</button>
                      </div>
                      <button onClick={() => removeFromCart(item.product.id, item.size)} style={{ background: "none", border: "none", cursor: "pointer", padding: 2, display: "flex", alignItems: "center", gap: 2 }}>
                        <TrashIcon color={`${t.muted}80`} size={13} />
                        <span style={{ fontFamily: t.ui, fontSize: 10, color: t.muted }}>Remove</span>
                      </button>
                    </div>
                  </div>
                ))}
              </div>

              <ScriptureCard t={t} />

              <div style={{ display: "flex", gap: 8, marginBottom: 20 }}>
                <input
                  type="text"
                  placeholder="Promo code"
                  value={promoCode}
                  onChange={e => setPromoCode(e.target.value)}
                  style={{ flex: 1, padding: "10px 14px", borderRadius: 12, border: `1.5px solid ${t.divider}`, background: t.card, color: t.dark, fontFamily: t.ui, fontSize: 13, outline: "none" }}
                />
                <button
                  style={{ padding: "10px 18px", borderRadius: 12, background: promoCode.trim() ? t.accent : `${t.muted}30`, color: promoCode.trim() ? "#fff" : t.muted, border: "none", fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: promoCode.trim() ? "pointer" : "default" }}
                >
                  Apply
                </button>
              </div>

              <div style={{ background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: "16px", marginBottom: 16 }}>
                <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, marginBottom: 12 }}>Order Summary</div>
                <GoldDivider style={{ marginBottom: 12, opacity: 0.4 }} />
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
                  <span style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Subtotal ({itemCount} item{itemCount !== 1 ? "s" : ""})</span>
                  <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark }}>${subtotal.toFixed(2)}</span>
                </div>
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
                  <span style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Shipping</span>
                  <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, fontStyle: "italic" }}>At checkout</span>
                </div>
                <div style={{ height: 1, background: t.divider, margin: "6px 0 12px" }} />
                <div style={{ display: "flex", justifyContent: "space-between" }}>
                  <span style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark }}>Total</span>
                  <span style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 800, color: t.accent }}>${subtotal.toFixed(2)}</span>
                </div>
              </div>

              {error && (
                <div style={{ background: "rgba(239,68,68,0.08)", border: "1px solid rgba(239,68,68,0.25)", borderRadius: 12, padding: "10px 14px", marginBottom: 12, fontFamily: t.ui, fontSize: 12, color: "#dc2626" }}>
                  {error}
                </div>
              )}
            </>
          )}
        </div>
      </div>

      {cart.length > 0 && (
        <div style={{
          position: "fixed", bottom: 64, left: 0, right: 0, zIndex: 20,
          background: t.bg, borderTop: `1px solid ${t.divider}`,
          padding: `0 ${bp.pad}px`,
        }}>
          <div style={{ maxWidth: bp.content, margin: "0 auto", padding: "10px 0" }}>
            <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 8 }}>
              <div>
                <span style={{ fontFamily: t.ui, fontSize: 11, color: t.muted }}>Total</span>
                <div style={{ fontFamily: t.heading, fontSize: 20, fontWeight: 800, color: t.dark }}>${subtotal.toFixed(2)}</div>
              </div>
              <button
                onClick={handleCheckout}
                disabled={loading || !user}
                style={{
                  padding: "14px 32px", borderRadius: 14,
                  background: t.accent, color: "#fff", border: "none",
                  fontFamily: t.ui, fontSize: 15, fontWeight: 700,
                  cursor: loading ? "wait" : "pointer",
                  opacity: loading ? 0.7 : 1,
                  display: "flex", alignItems: "center", gap: 8,
                }}
              >
                {loading ? (
                  <><div style={{ width: 16, height: 16, border: "2px solid rgba(255,255,255,0.4)", borderTopColor: "#fff", borderRadius: "50%", animation: "spin 0.7s linear infinite" }} /> Processing…</>
                ) : "Checkout"}
              </button>
            </div>
            <div style={{ textAlign: "center", fontFamily: t.ui, fontSize: 10, color: t.muted }}>
              Secure checkout via Stripe
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ── SHOP ORDER SUCCESS ────────────────────────────────────────────────────────
function ShopOrderSuccess({ t, nav, bp, clearCart, shopOrderSession }) {
  const [copied, setCopied] = useState(false);
  useEffect(() => { clearCart(); }, [clearCart]);

  const handleShare = async () => {
    const text = "I just ordered from The Bible Scrollers Store! Faith-inspired goods — check it out.";
    const url = "https://study-bible-two.vercel.app/";
    if (typeof navigator !== "undefined" && navigator.share) {
      try { await navigator.share({ title: "The Bible Scrollers Store", text, url }); } catch {}
    } else if (typeof navigator !== "undefined" && navigator.clipboard) {
      try {
        await navigator.clipboard.writeText(`${text} ${url}`);
        setCopied(true);
        setTimeout(() => setCopied(false), 2000);
      } catch {}
    }
  };

  return (
    <div style={{ minHeight: "100vh", background: t.bg, display: "flex", alignItems: "center", justifyContent: "center", padding: `20px ${bp.pad}px` }}>
      <div style={{ maxWidth: bp.content, width: "100%", textAlign: "center" }}>
        <div style={{ position: "relative", width: 96, height: 96, margin: "0 auto 28px", animation: "scaleIn 0.45s cubic-bezier(0.34,1.56,0.64,1) both" }}>
          <div style={{ position: "absolute", inset: 0, borderRadius: "50%", ...GOLD_BORDER, opacity: 0.7 }} />
          <div style={{ position: "absolute", inset: 2.5, borderRadius: "50%", background: t.card, display: "flex", alignItems: "center", justifyContent: "center" }}>
            <span style={{ fontSize: 38, color: "#059669" }}>✓</span>
          </div>
        </div>

        <div style={{ fontFamily: t.heading, fontSize: 26, fontWeight: 800, color: t.dark, marginBottom: 8 }}>Order Confirmed!</div>
        <div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, lineHeight: 1.7, marginBottom: 4 }}>
          Thank you for supporting the ministry.
        </div>
        <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, lineHeight: 1.7, marginBottom: 20 }}>
          We'll email your order confirmation shortly.
        </div>

        <div style={{ borderRadius: 14, overflow: "hidden", position: "relative", marginBottom: 20 }}>
          <div style={{ position: "absolute", inset: 0, ...GOLD_BORDER, opacity: 0.4 }} />
          <div style={{ margin: 1.5, borderRadius: 12.5, background: t.card, padding: "14px 18px" }}>
            <div style={{ fontFamily: "Georgia, serif", fontSize: 13, color: t.muted, lineHeight: 1.75, fontStyle: "italic" }}>
              "Every good gift and every perfect gift is from above, and cometh down from the Father of lights."
            </div>
            <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.accent, marginTop: 6, letterSpacing: "0.05em" }}>— James 1:17</div>
          </div>
        </div>

        {shopOrderSession && (
          <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted, marginBottom: 24, background: t.card, borderRadius: 12, padding: "10px 16px", display: "inline-block", border: `1px solid ${t.divider}` }}>
            Order ref: <span style={{ color: t.accent, fontWeight: 700, letterSpacing: "0.05em" }}>{shopOrderSession.slice(-8).toUpperCase()}</span>
          </div>
        )}

        <div style={{ display: "flex", gap: 10, justifyContent: "center", flexWrap: "wrap" }}>
          <button onClick={() => nav("shop-home")} style={{ background: t.accent, color: "#fff", border: "none", borderRadius: 12, padding: "12px 24px", fontFamily: t.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>
            Continue Shopping
          </button>
          <button
            onClick={handleShare}
            style={{ display: "flex", alignItems: "center", gap: 6, background: t.card, color: t.text, border: `1px solid ${t.divider}`, borderRadius: 12, padding: "12px 20px", fontFamily: t.ui, fontSize: 14, fontWeight: 600, cursor: "pointer" }}
          >
            <ShareIcon color={t.muted} size={15} />
            {copied ? "Copied!" : "Share"}
          </button>
          <button onClick={() => nav("home")} style={{ background: t.card, color: t.text, border: `1px solid ${t.divider}`, borderRadius: 12, padding: "12px 24px", fontFamily: t.ui, fontSize: 14, fontWeight: 600, cursor: "pointer" }}>
            Go Home
          </button>
        </div>
      </div>
    </div>
  );
}

// ── MAIN SHOPVIEW ─────────────────────────────────────────────────────────────
export default function ShopView() {
  const { view, ht, darkMode, nav, goBack, bp, shopCategory, shopProduct,
          user, cart, addToCart, removeFromCart, updateQty, clearCart, shopOrderSession, setWelcomeModal } = useApp();
  const [catalogue, setCatalogue] = useState(null);
  const [loadError, setLoadError] = useState(false);

  const [wishlist, setWishlist] = useState(() => {
    try { return JSON.parse(localStorage.getItem("shop_wishlist") || "[]"); } catch { return []; }
  });
  const toggleWishlist = useCallback((id) => {
    setWishlist(prev => {
      const next = prev.includes(id) ? prev.filter(x => x !== id) : [...prev, id];
      try { localStorage.setItem("shop_wishlist", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  const [recent, setRecent] = useState(() => {
    try { return JSON.parse(localStorage.getItem("shop_recent") || "[]"); } catch { return []; }
  });
  const addToRecent = useCallback((id) => {
    setRecent(prev => {
      const next = [id, ...prev.filter(x => x !== id)].slice(0, 5);
      try { localStorage.setItem("shop_recent", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  const [notified, setNotified] = useState(() => {
    try { return JSON.parse(localStorage.getItem("shop_notify") || "[]"); } catch { return []; }
  });
  const toggleNotify = useCallback((id) => {
    setNotified(prev => {
      const next = prev.includes(id) ? prev.filter(x => x !== id) : [...prev, id];
      try { localStorage.setItem("shop_notify", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  useEffect(() => {
    fetch("/data/shop-catalogue.json")
      .then(r => r.json())
      .then(setCatalogue)
      .catch(() => setLoadError(true));
  }, []);

  if (view === "shop-order-success") {
    return <ShopOrderSuccess t={ht} nav={nav} bp={bp} clearCart={clearCart} shopOrderSession={shopOrderSession} />;
  }
  if (view === "shop-cart") {
    return <ShopCart t={ht} nav={nav} goBack={goBack} bp={bp} cart={cart} removeFromCart={removeFromCart} updateQty={updateQty} user={user} wishlist={wishlist} catalogue={catalogue} />;
  }

  if (loadError) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, display: "flex", alignItems: "center", justifyContent: "center", padding: 20 }}>
        <div style={{ textAlign: "center" }}>
          <div style={{ width: 64, height: 64, borderRadius: "50%", background: `${ht.accent}0C`, display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 16px" }}>
            <BagIcon color={`${ht.accent}50`} size={28} />
          </div>
          <div style={{ fontFamily: ht.heading, fontSize: 16, fontWeight: 700, color: ht.dark }}>Store unavailable</div>
          <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginTop: 6 }}>Please try again later.</div>
        </div>
      </div>
    );
  }

  if (!catalogue) {
    return (
      <div style={{ minHeight: "100vh", background: ht.bg, display: "flex", alignItems: "center", justifyContent: "center" }}>
        <div style={{ width: 32, height: 32, border: `3px solid ${ht.accent}30`, borderTopColor: ht.accent, borderRadius: "50%", animation: "spin 0.8s linear infinite" }} />
      </div>
    );
  }

  if (view === "shop-category") {
    return <ShopCategory catalogue={catalogue} shopCategory={shopCategory} t={ht} nav={nav} goBack={goBack} bp={bp} addToCart={addToCart} wishlist={wishlist} toggleWishlist={toggleWishlist} />;
  }
  if (view === "shop-product") {
    return <ShopProduct catalogue={catalogue} shopProduct={shopProduct} t={ht} nav={nav} goBack={goBack} bp={bp} user={user} addToCart={addToCart} setWelcomeModal={setWelcomeModal} wishlist={wishlist} toggleWishlist={toggleWishlist} notified={notified} toggleNotify={toggleNotify} addToRecent={addToRecent} />;
  }

  return <ShopHome catalogue={catalogue} t={ht} nav={nav} goBack={goBack} darkMode={darkMode} bp={bp} addToCart={addToCart} cart={cart} wishlist={wishlist} toggleWishlist={toggleWishlist} recent={recent} />;
}
