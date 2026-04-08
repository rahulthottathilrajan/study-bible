"use client";

import { useApp } from "../../context/AppContext";
import { BackIcon } from "../../components/ui";

export function ShirtIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z" />
    </svg>
  );
}

export function BookIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M4 19.5A2.5 2.5 0 016.5 17H20" />
      <path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z" />
    </svg>
  );
}

export function BookOpenIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z" />
      <path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z" />
    </svg>
  );
}

export function StickerIcon({ color, size = 28 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c1.85 0 3.58-.5 5.06-1.38L21 21l-1.38-5.94A9.95 9.95 0 0022 12c0-5.52-4.48-10-10-10z" />
      <path d="M8 12h8M12 8v8" />
    </svg>
  );
}

export function BagIcon({ color, size = 24 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z" />
      <line x1="3" y1="6" x2="21" y2="6" />
      <path d="M16 10a4 4 0 01-8 0" />
    </svg>
  );
}

export function TruckIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <rect x="1" y="3" width="15" height="13" />
      <polygon points="16 8 20 8 23 11 23 16 16 16 16 8" />
      <circle cx="5.5" cy="18.5" r="2.5" />
      <circle cx="18.5" cy="18.5" r="2.5" />
    </svg>
  );
}

export function ShieldIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
      <polyline points="9 12 11 14 15 10" />
    </svg>
  );
}

export function RefreshIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="23 4 23 10 17 10" />
      <path d="M20.49 15a9 9 0 11-2.12-9.36L23 10" />
    </svg>
  );
}

export function TrashIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="3 6 5 6 21 6" />
      <path d="M19 6v14a2 2 0 01-2 2H7a2 2 0 01-2-2V6m3 0V4a2 2 0 012-2h4a2 2 0 012 2v2" />
    </svg>
  );
}

export function ChevRightIcon({ color, size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="9 18 15 12 9 6" />
    </svg>
  );
}

export function HeartIcon({ color = "#9ca3af", size = 16, filled = false }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill={filled ? color : "none"} stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z" />
    </svg>
  );
}

export function BellIcon({ color = "#9ca3af", size = 16, filled = false }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill={filled ? color : "none"} stroke={color} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9" />
      <path d="M13.73 21a2 2 0 01-3.46 0" />
    </svg>
  );
}

export function SearchIcon({ color = "#9ca3af", size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="11" cy="11" r="8" />
      <line x1="21" y1="21" x2="16.65" y2="16.65" />
    </svg>
  );
}

export function ShareIcon({ color = "#9ca3af", size = 16 }) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <circle cx="18" cy="5" r="3" />
      <circle cx="6" cy="12" r="3" />
      <circle cx="18" cy="19" r="3" />
      <line x1="8.59" y1="13.51" x2="15.42" y2="17.49" />
      <line x1="15.41" y1="6.51" x2="8.59" y2="10.49" />
    </svg>
  );
}

export function getCategoryIcon(iconId, color, size) {
  if (iconId === "shirt") return <ShirtIcon color={color} size={size} />;
  if (iconId === "book") return <BookIcon color={color} size={size} />;
  if (iconId === "book-open") return <BookOpenIcon color={color} size={size} />;
  if (iconId === "sticker") return <StickerIcon color={color} size={size} />;
  return <BagIcon color={color} size={size} />;
}

export function ShopHeader({ title, subtitle, onBack, t }) {
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
          <button onClick={() => setDarkMode(!darkMode)} style={{ background: "rgba(255,255,255,0.08)", border: "1px solid rgba(255,255,255,0.12)", borderRadius: 6, padding: "3px 8px", cursor: "pointer", display: "flex", alignItems: "center", gap: 4 }}>
            <span style={{ fontSize: 11 }}>{darkMode ? "â˜€ï¸" : "ðŸŒ™"}</span>
            <span style={{ fontFamily: t.ui, fontSize: 9, fontWeight: 600, color: "rgba(255,255,255,0.6)" }}>{darkMode ? "Light" : "Dark"}</span>
          </button>
          {!user && (
            <button onClick={() => setWelcomeModal(true)} style={{ background: "rgba(212,168,83,0.25)", border: "1px solid rgba(212,168,83,0.45)", borderRadius: 6, padding: "3px 10px", fontFamily: t.ui, fontSize: 9, fontWeight: 700, color: "#fff", cursor: "pointer", letterSpacing: "0.03em" }}>
              Sign In
            </button>
          )}
          {user && (
            <span onClick={() => nav("account")} style={{ fontFamily: t.ui, fontSize: 10, color: "rgba(125,212,173,0.9)", fontWeight: 700, cursor: "pointer" }}>
              âœ“ {firstName}
            </span>
          )}
        </div>
      </div>
      <div style={{ height: 2, background: "linear-gradient(90deg, rgba(139,92,246,0.6), rgba(255,255,255,0.9), rgba(212,168,83,0.8), rgba(255,255,255,0.95), rgba(139,92,246,0.6))", backgroundSize: "200% 100%", animation: "goldFlow 3s linear infinite", marginTop: 8 }} />
    </div>
  );
}

export const GOLD_BORDER = {
  background: "linear-gradient(90deg, rgba(139,92,246,0.7), rgba(212,168,83,0.9), rgba(255,255,255,0.95), rgba(212,168,83,0.8), rgba(139,92,246,0.7))",
  backgroundSize: "300% 100%",
  animation: "goldFlow 3s linear infinite",
};

export function GoldDivider({ style }) {
  return <div style={{ height: 2, borderRadius: 1, ...GOLD_BORDER, ...style }} />;
}

export function ComingSoonBadge({ small }) {
  return (
    <span style={{ display: "inline-flex", alignItems: "center", gap: 3, background: "rgba(212,168,83,0.12)", color: "#b8860b", fontFamily: "system-ui,sans-serif", fontSize: small ? 8 : 9, fontWeight: 700, letterSpacing: "0.08em", textTransform: "uppercase", padding: small ? "2px 6px" : "3px 8px", borderRadius: 20, border: "1px solid rgba(212,168,83,0.25)" }}>
      âœ¦ Coming Soon
    </span>
  );
}

const BADGE_CONFIGS = {
  new: { label: "New âœ¨", bg: "#D4A853", color: "#fff" },
  featured: { label: "Featured ðŸ”¥", bg: "#7C3AED", color: "#fff" },
  best_seller: { label: "Best Seller", bg: "#D97706", color: "#fff" },
};

export function BadgePill({ badge }) {
  const cfg = BADGE_CONFIGS[badge];
  if (!cfg) return null;
  return (
    <div style={{ position: "absolute", top: 8, left: 8, zIndex: 2, background: cfg.bg, color: cfg.color, fontFamily: "system-ui, sans-serif", fontSize: 9, fontWeight: 700, letterSpacing: "0.04em", padding: "3px 8px", borderRadius: 20, boxShadow: "0 1px 4px rgba(0,0,0,0.22)", whiteSpace: "nowrap" }}>
      {cfg.label}
    </div>
  );
}

export function SectionLabel({ t, label, action, onAction }) {
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

export function ProductImg({ product, size = "full", accent }) {
  if (product.images && product.images[0]) {
    return <img src={product.images[0]} alt={product.name} style={{ width: "100%", height: "100%", objectFit: "cover", display: "block" }} />;
  }
  if (product.status === "coming-soon") {
    const labelSize = size === "small" ? 8 : size === "medium" ? 9 : 11;
    const iconSize = size === "small" ? 24 : size === "medium" ? 32 : 40;
    return (
      <div style={{ width: "100%", height: "100%", background: "#2D1052", display: "flex", flexDirection: "column", alignItems: "center", justifyContent: "center", gap: size === "small" ? 4 : 8 }}>
        <svg width={iconSize} height={iconSize} viewBox="0 0 40 40" fill="none">
          <path d="M20 4L20 36M12 20L28 20" stroke="rgba(212,168,83,0.3)" strokeWidth="2.5" strokeLinecap="round" />
          <path d="M8 8C8 8 14 12 20 12C26 12 32 8 32 8" stroke="rgba(212,168,83,0.3)" strokeWidth="1.5" strokeLinecap="round" />
          <path d="M8 32C8 32 14 28 20 28C26 28 32 32 32 32" stroke="rgba(212,168,83,0.3)" strokeWidth="1.5" strokeLinecap="round" />
        </svg>
        <span style={{ fontFamily: "system-ui, sans-serif", fontSize: labelSize, fontWeight: 700, color: "#D4A853", letterSpacing: "0.08em", textTransform: "uppercase" }}>Coming Soon</span>
      </div>
    );
  }
  const bg = product.colorBg || (accent ? `${accent}10` : "rgba(91,45,142,0.06)");
  const emojiSize = size === "small" ? 26 : size === "medium" ? 38 : 54;
  return (
    <div style={{ width: "100%", height: "100%", background: bg, display: "flex", alignItems: "center", justifyContent: "center" }}>
      <span style={{ fontSize: emojiSize, lineHeight: 1, userSelect: "none" }}>{product.emoji || "ðŸ“¦"}</span>
    </div>
  );
}

export function StarRating({ rating, count, t }) {
  if (!rating) return null;
  return (
    <div style={{ display: "flex", alignItems: "center", gap: 3 }}>
      <span style={{ color: "#d97706", fontSize: 11 }}>â˜…</span>
      <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: "#d97706" }}>{rating.toFixed(1)}</span>
      <span style={{ fontFamily: t.ui, fontSize: 10, color: t.muted }}>({count})</span>
    </div>
  );
}

export function HeartBtn({ isWishlisted, onToggle }) {
  return (
    <button onClick={(e) => { e.stopPropagation(); onToggle(); }} aria-label={isWishlisted ? "Remove from wishlist" : "Save to wishlist"} style={{ position: "absolute", top: 8, right: 8, width: 32, height: 32, borderRadius: "50%", background: isWishlisted ? "rgba(239,68,68,0.9)" : "rgba(255,255,255,0.88)", border: "none", cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", boxShadow: "0 1px 5px rgba(0,0,0,0.18)", transition: "background 0.15s", animation: isWishlisted ? "heartPop 0.3s ease" : "none", zIndex: 2 }}>
      <HeartIcon color={isWishlisted ? "#fff" : "#9ca3af"} size={14} filled={isWishlisted} />
    </button>
  );
}

export function ProductCard({ p, t, nav, wishlist, toggleWishlist, onQuickAdd, addedIds }) {
  const isComingSoon = p.status === "coming-soon";
  const isWishlisted = wishlist.includes(p.id);
  const purple = "#5B2D8E";
  return (
    <div style={{ position: "relative" }}>
      <button className="pressable" onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })} style={{ width: "100%", background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden", display: "flex", flexDirection: "column" }}>
        <div style={{ width: "100%", aspectRatio: "4/3", position: "relative", overflow: "hidden" }}>
          <ProductImg product={p} accent={t.accent} />
          {isComingSoon ? <div style={{ position: "absolute", top: 8, left: 8 }}><ComingSoonBadge small /></div> : p.badge ? <BadgePill badge={p.badge} /> : null}
          <button key={addedIds[p.id] ? "added" : "add"} onClick={(e) => { e.stopPropagation(); if (!isComingSoon) onQuickAdd(p); }} disabled={isComingSoon} style={{ position: "absolute", bottom: 8, right: 8, zIndex: 2, width: 32, height: 32, borderRadius: "50%", background: addedIds[p.id] ? "#059669" : isComingSoon ? "rgba(156,163,175,0.65)" : "rgba(91,45,142,0.9)", border: "none", cursor: isComingSoon ? "default" : "pointer", display: "flex", alignItems: "center", justifyContent: "center", boxShadow: "0 2px 6px rgba(0,0,0,0.22)", animation: "scaleIn 0.25s cubic-bezier(0.34,1.56,0.64,1) both", transition: "background 0.2s" }}>
            {addedIds[p.id] ? <span style={{ color: "#fff", fontSize: 13, fontWeight: 700, lineHeight: 1 }}>âœ“</span> : <BagIcon color="#fff" size={13} />}
          </button>
        </div>
        <div style={{ padding: "10px 12px 12px", flex: 1, display: "flex", flexDirection: "column", gap: 3 }}>
          <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
          <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, lineHeight: 1.3 }}>{p.tagline}</div>
          {p.rating && <StarRating rating={p.rating} count={p.rating_count} t={t} />}
          <div style={{ marginTop: "auto", paddingTop: 6, display: "flex", alignItems: "baseline", gap: 5 }}>
            {p.price_original_usd && <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 500, color: t.muted, textDecoration: "line-through" }}>${p.price_original_usd.toFixed(2)}</span>}
            <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: purple }}>${p.price_usd.toFixed(2)}</span>
          </div>
        </div>
      </button>
      <HeartBtn isWishlisted={isWishlisted} onToggle={() => toggleWishlist(p.id)} />
    </div>
  );
}

export function HorizontalProductStrip({ products, t, nav, label }) {
  if (!products.length) return null;
  return (
    <div style={{ marginBottom: 20 }}>
      <SectionLabel t={t} label={label} />
      <div className="shop-scroll-hide" style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 4 }}>
        {products.map((p) => (
          <button key={p.id} onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })} style={{ flexShrink: 0, width: 110, background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden" }}>
            <div style={{ width: "100%", aspectRatio: "1", overflow: "hidden" }}>
              <ProductImg product={p} accent={t.accent} size="small" />
            </div>
            <div style={{ padding: "7px 9px 9px" }}>
              <div style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
              <div style={{ display: "flex", alignItems: "baseline", gap: 4, marginTop: 3 }}>
                {p.price_original_usd && <span style={{ fontFamily: t.ui, fontSize: 9, color: t.muted, textDecoration: "line-through" }}>${p.price_original_usd.toFixed(2)}</span>}
                <span style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 800, color: "#5B2D8E" }}>${p.price_usd.toFixed(2)}</span>
              </div>
            </div>
          </button>
        ))}
      </div>
    </div>
  );
}

export function SearchBar({ value, onChange, t }) {
  return (
    <div style={{ position: "relative", marginBottom: 20, marginTop: 20 }}>
      <div style={{ position: "absolute", left: 12, top: "50%", transform: "translateY(-50%)", pointerEvents: "none" }}>
        <SearchIcon color={t.muted} size={16} />
      </div>
      <input type="search" placeholder="Search productsâ€¦" value={value} onChange={(e) => onChange(e.target.value)} style={{ width: "100%", padding: "11px 36px 11px 38px", borderRadius: 12, border: `1.5px solid ${value ? t.accent : t.divider}`, background: t.card, color: t.dark, fontFamily: t.ui, fontSize: 13, outline: "none", transition: "border-color 0.15s" }} />
      {value && <button onClick={() => onChange("")} style={{ position: "absolute", right: 10, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", cursor: "pointer", color: t.muted, fontSize: 18, padding: 4, lineHeight: 1 }}>Ã—</button>}
    </div>
  );
}

export function ScriptureCard({ t }) {
  return (
    <div style={{ borderRadius: 14, overflow: "hidden", position: "relative", marginBottom: 16 }}>
      <div style={{ position: "absolute", inset: 0, ...GOLD_BORDER, opacity: 0.45 }} />
      <div style={{ margin: 1.5, borderRadius: 12.5, background: t.card, padding: "14px 16px", position: "relative" }}>
        <div style={{ fontFamily: "Georgia, serif", fontSize: 12, color: t.muted, lineHeight: 1.75, fontStyle: "italic", textAlign: "center" }}>
          &ldquo;Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over.&rdquo;
        </div>
        <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textAlign: "center", marginTop: 6, letterSpacing: "0.05em" }}>â€” Luke 6:38</div>
      </div>
    </div>
  );
}
