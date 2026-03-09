"use client";
import { useState, useEffect, useCallback, useRef } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";

// ── Category icons ────────────────────────────────────────────────────────────
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

function getCategoryIcon(iconId, color, size) {
  if (iconId === "shirt") return <ShirtIcon color={color} size={size} />;
  if (iconId === "book") return <BookIcon color={color} size={size} />;
  if (iconId === "book-open") return <BookOpenIcon color={color} size={size} />;
  if (iconId === "sticker") return <StickerIcon color={color} size={size} />;
  return <BagIcon color={color} size={size} />;
}

// ── Shared UI ─────────────────────────────────────────────────────────────────
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

function QuickAddBtn({ t, onClick, disabled, added }) {
  return (
    <button
      onClick={e => { e.stopPropagation(); onClick(); }}
      disabled={disabled}
      style={{
        width: 30, height: 30, borderRadius: 8,
        background: added ? "#059669" : t.accent,
        border: "none", color: "#fff",
        display: "flex", alignItems: "center", justifyContent: "center",
        cursor: disabled ? "default" : "pointer",
        fontSize: 18, fontWeight: 700, lineHeight: 1,
        transition: "all 0.2s",
        opacity: disabled ? 0.5 : 1,
        flexShrink: 0,
      }}
    >
      {added ? "✓" : "+"}
    </button>
  );
}

function SectionLabel({ t, label, action, onAction }) {
  return (
    <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 14 }}>
      <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
        <div style={{ width: 3, height: 16, borderRadius: 2, background: t.accent }} />
        <span style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark }}>{label}</span>
      </div>
      {action && (
        <button onClick={onAction} style={{ background: "none", border: "none", fontFamily: t.ui, fontSize: 12, fontWeight: 600, color: t.accent, cursor: "pointer", display: "flex", alignItems: "center", gap: 2 }}>
          {action} <ChevRightIcon color={t.accent} size={12} />
        </button>
      )}
    </div>
  );
}

// ── SHOP HOME ─────────────────────────────────────────────────────────────────
function ShopHome({ catalogue, t, nav, goBack, bp, addToCart }) {
  const featured = catalogue.products.slice(0, 6);
  const [addedIds, setAddedIds] = useState({});
  const scrollRef = useRef(null);

  const handleQuickAdd = (p) => {
    if (p.status === "coming-soon") return;
    addToCart(p, 1, null);
    setAddedIds(prev => ({ ...prev, [p.id]: true }));
    setTimeout(() => setAddedIds(prev => ({ ...prev, [p.id]: false })), 1200);
  };

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 40 }}>
      <Header title="The Store" subtitle="Faith-inspired goods" onBack={goBack} theme={t} hidePrayer hideUser />

      <div style={{ padding: `0 ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* ── Hero Banner ── */}
          <div style={{ marginTop: 16, marginBottom: 24, borderRadius: 20, overflow: "hidden", position: "relative" }}>
            {/* Gold+purple animated border */}
            <div style={{ position: "absolute", inset: 0, borderRadius: 20, padding: 2, zIndex: 0 }}>
              <div style={{ position: "absolute", inset: 0, borderRadius: 20, ...GOLD_BORDER }} />
            </div>
            {/* Inner content */}
            <div style={{ position: "relative", zIndex: 1, margin: 2, borderRadius: 18, background: `linear-gradient(135deg, ${t.dark}F8, ${t.dark}EE)`, padding: "28px 22px 24px", display: "flex", flexDirection: "column", gap: 10 }}>
              <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                <span style={{ fontSize: 20 }}>✦</span>
                <span style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: "rgba(212,168,83,0.8)", textTransform: "uppercase", letterSpacing: "0.15em" }}>The Bible Scrollers Store</span>
              </div>
              <div style={{ fontFamily: t.heading, fontSize: 24, fontWeight: 800, color: "#F0E8D8", lineHeight: 1.2 }}>
                Faith-Inspired{"\n"}Goods
              </div>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: "rgba(240,232,216,0.65)", lineHeight: 1.5 }}>
                Modest clothing, curated books & scripture art — every purchase keeps the app free.
              </div>
              <button
                onClick={() => {
                  const el = document.getElementById("shop-categories");
                  if (el) el.scrollIntoView({ behavior: "smooth" });
                }}
                style={{ alignSelf: "flex-start", marginTop: 4, background: "rgba(212,168,83,0.9)", color: "#1C1612", border: "none", borderRadius: 10, padding: "9px 20px", fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: "pointer" }}
              >
                Browse Collection
              </button>
            </div>
          </div>

          {/* ── Category Pills (horizontal scroll) ── */}
          <div id="shop-categories">
            <SectionLabel t={t} label="Categories" />
          </div>
          <div
            ref={scrollRef}
            style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 6, marginBottom: 28, scrollbarWidth: "none", msOverflowStyle: "none" }}
          >
            {catalogue.categories.map(cat => (
              <button
                key={cat.id}
                className="pressable"
                onClick={() => nav("shop-category", { shopCategory: cat.id })}
                style={{
                  flexShrink: 0,
                  display: "flex", alignItems: "center", gap: 8,
                  background: t.card, border: `1.5px solid ${t.accentBorder}`,
                  borderRadius: 28, padding: "8px 16px 8px 10px",
                  cursor: "pointer",
                  transition: "all 0.15s",
                }}
              >
                <div style={{ width: 34, height: 34, borderRadius: "50%", background: `${t.accent}12`, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                  {getCategoryIcon(cat.icon, t.accent, 18)}
                </div>
                <div style={{ textAlign: "left" }}>
                  <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, whiteSpace: "nowrap" }}>{cat.name}</div>
                  <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, whiteSpace: "nowrap" }}>{cat.tag}</div>
                </div>
              </button>
            ))}
          </div>

          {/* ── Featured Products (2-col grid) ── */}
          <SectionLabel t={t} label="Featured" action="See All" onAction={() => nav("shop-category", { shopCategory: catalogue.categories[0]?.id })} />

          <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 28 }}>
            {featured.map(p => {
              const isComingSoon = p.status === "coming-soon";
              return (
                <button
                  key={p.id}
                  className="pressable"
                  onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                  style={{ background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden", display: "flex", flexDirection: "column" }}
                >
                  {/* Image area */}
                  <div style={{ width: "100%", aspectRatio: "1", background: `linear-gradient(145deg, ${t.accent}12, ${t.accent}06)`, display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
                    <BagIcon color={`${t.accent}35`} size={40} />
                    {isComingSoon && (
                      <div style={{ position: "absolute", top: 8, left: 8 }}>
                        <ComingSoonBadge small />
                      </div>
                    )}
                  </div>
                  {/* Info */}
                  <div style={{ padding: "10px 12px 12px", flex: 1, display: "flex", flexDirection: "column", gap: 4 }}>
                    <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.dark, lineHeight: 1.3, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>{p.name}</div>
                    <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted, lineHeight: 1.3 }}>{p.tagline}</div>
                    <div style={{ marginTop: "auto", display: "flex", alignItems: "center", justifyContent: "space-between", paddingTop: 6 }}>
                      <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: t.dark }}>${p.price_usd.toFixed(2)}</span>
                      {isComingSoon ? (
                        <div style={{ width: 30, height: 30, borderRadius: 8, background: `${t.accent}10`, display: "flex", alignItems: "center", justifyContent: "center" }}>
                          <BagIcon color={`${t.accent}40`} size={14} />
                        </div>
                      ) : (
                        <QuickAddBtn t={t} onClick={() => handleQuickAdd(p)} added={addedIds[p.id]} />
                      )}
                    </div>
                  </div>
                </button>
              );
            })}
          </div>

          {/* ── Mission Note ── */}
          <div style={{ borderRadius: 16, overflow: "hidden", position: "relative" }}>
            <div style={{ position: "absolute", inset: 0, borderRadius: 16, ...GOLD_BORDER, opacity: 0.5 }} />
            <div style={{ margin: 1.5, borderRadius: 14.5, background: t.card, padding: "18px 16px", display: "flex", gap: 14, alignItems: "flex-start", position: "relative" }}>
              <div style={{ width: 40, height: 40, borderRadius: 10, background: `${t.accent}10`, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0, fontSize: 18 }}>✦</div>
              <div style={{ flex: 1 }}>
                <div style={{ fontFamily: t.heading, fontSize: 14, fontWeight: 700, color: t.dark, marginBottom: 4 }}>No ads. No pressure.</div>
                <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, lineHeight: 1.6 }}>Every purchase keeps The Bible Scrollers free for everyone. No subscriptions, no upselling — just goods you choose.</div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  );
}

// ── SHOP CATEGORY ─────────────────────────────────────────────────────────────
function ShopCategory({ catalogue, shopCategory, t, nav, goBack, bp, addToCart }) {
  const cat = catalogue.categories.find(c => c.id === shopCategory);
  const allProducts = catalogue.products.filter(p => p.category_id === shopCategory);
  const [sort, setSort] = useState("all");
  const [addedIds, setAddedIds] = useState({});

  if (!cat) { goBack(); return null; }

  const sorted = sort === "price-asc"
    ? [...allProducts].sort((a, b) => a.price_usd - b.price_usd)
    : sort === "price-desc"
    ? [...allProducts].sort((a, b) => b.price_usd - a.price_usd)
    : allProducts;

  const handleQuickAdd = (p) => {
    if (p.status === "coming-soon") return;
    addToCart(p, 1, null);
    setAddedIds(prev => ({ ...prev, [p.id]: true }));
    setTimeout(() => setAddedIds(prev => ({ ...prev, [p.id]: false })), 1200);
  };

  const sortOptions = [
    { id: "all", label: "All" },
    { id: "price-asc", label: "Price ↑" },
    { id: "price-desc", label: "Price ↓" },
  ];

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 40 }}>
      <Header title={cat.name} subtitle={cat.tag} onBack={goBack} theme={t} hidePrayer hideUser />

      {/* Sticky filter bar */}
      <div style={{ position: "sticky", top: 0, zIndex: 10, background: t.bg, borderBottom: `1px solid ${t.divider}`, padding: `10px ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto", display: "flex", gap: 8, alignItems: "center" }}>
          {sortOptions.map(o => (
            <button
              key={o.id}
              onClick={() => setSort(o.id)}
              style={{
                padding: "6px 14px", borderRadius: 20,
                background: sort === o.id ? t.accent : "transparent",
                color: sort === o.id ? "#fff" : t.muted,
                border: sort === o.id ? "none" : `1px solid ${t.divider}`,
                fontFamily: t.ui, fontSize: 12, fontWeight: 600,
                cursor: "pointer", transition: "all 0.15s",
              }}
            >
              {o.label}
            </button>
          ))}
          <span style={{ marginLeft: "auto", fontFamily: t.ui, fontSize: 11, color: t.muted }}>{sorted.length} items</span>
        </div>
      </div>

      <div style={{ padding: `16px ${bp.pad}px 40px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>
          {/* Category description */}
          <div style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, marginBottom: 18, lineHeight: 1.6 }}>{cat.description}</div>

          {sorted.length === 0 ? (
            <div style={{ textAlign: "center", padding: "60px 20px" }}>
              <div style={{ fontSize: 40, marginBottom: 12 }}>🛍</div>
              <div style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark, marginBottom: 6 }}>Products Coming Soon</div>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>We're curating the best faith-inspired {cat.name.toLowerCase()} for you.</div>
            </div>
          ) : (
            <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12 }}>
              {sorted.map(p => {
                const isComingSoon = p.status === "coming-soon";
                return (
                  <button
                    key={p.id}
                    className="pressable"
                    onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                    style={{ background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16, padding: 0, cursor: "pointer", textAlign: "left", overflow: "hidden", display: "flex", flexDirection: "column" }}
                  >
                    {/* Square image area */}
                    <div style={{ width: "100%", aspectRatio: "1", background: `linear-gradient(145deg, ${t.accent}12, ${t.accent}06)`, display: "flex", alignItems: "center", justifyContent: "center", position: "relative" }}>
                      <BagIcon color={`${t.accent}35`} size={36} />
                      {isComingSoon && (
                        <div style={{ position: "absolute", top: 8, left: 8 }}>
                          <ComingSoonBadge small />
                        </div>
                      )}
                    </div>
                    {/* Info */}
                    <div style={{ padding: "10px 12px 12px", flex: 1, display: "flex", flexDirection: "column", gap: 3 }}>
                      <div style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 700, color: t.dark, lineHeight: 1.3 }}>{p.name}</div>
                      <div style={{ fontFamily: t.ui, fontSize: 10, color: t.muted }}>{p.tagline}</div>
                      <div style={{ marginTop: "auto", display: "flex", alignItems: "center", justifyContent: "space-between", paddingTop: 6 }}>
                        <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: t.dark }}>${p.price_usd.toFixed(2)}</span>
                        {isComingSoon ? (
                          <div style={{ width: 30, height: 30, borderRadius: 8, background: `${t.accent}10`, display: "flex", alignItems: "center", justifyContent: "center" }}>
                            <BagIcon color={`${t.accent}40`} size={14} />
                          </div>
                        ) : (
                          <QuickAddBtn t={t} onClick={() => handleQuickAdd(p)} added={addedIds[p.id]} />
                        )}
                      </div>
                    </div>
                  </button>
                );
              })}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ── SHOP PRODUCT ──────────────────────────────────────────────────────────────
function ShopProduct({ catalogue, shopProduct: shopProductId, t, nav, goBack, bp, user, addToCart }) {
  const [selectedSize, setSelectedSize] = useState(null);
  const [added, setAdded] = useState(false);
  const [activeTab, setActiveTab] = useState("description");
  const [carouselIndex, setCarouselIndex] = useState(0);
  const product = catalogue.products.find(p => p.id === shopProductId);
  if (!product) { goBack(); return null; }

  const isActive = product.status === "active";
  const isComingSoon = product.status === "coming-soon";
  const needsSize = product.sizes && product.sizes.length > 0;
  const canAdd = isActive && (!needsSize || selectedSize);
  const carouselSlots = 3; // placeholder slots

  const handleAddToCart = () => {
    addToCart(product, 1, selectedSize);
    setAdded(true);
    setTimeout(() => { nav("shop-cart"); }, 600);
  };

  const trustBadges = [
    { icon: <ShieldIcon color={t.accent} />, label: "Secure Payment" },
    { icon: <TruckIcon color={t.accent} />, label: "Global Shipping" },
    { icon: <RefreshIcon color={t.accent} />, label: "Easy Returns" },
  ];

  const tabs = [
    { id: "description", label: "Description" },
    { id: "details", label: "Details" },
  ];

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 90 }}>
      <Header title={product.name} onBack={goBack} theme={t} hidePrayer hideUser />

      <div style={{ padding: `0 ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* ── Image Carousel Placeholder ── */}
          <div style={{ marginTop: 12, marginBottom: 20 }}>
            <div style={{ width: "100%", aspectRatio: "1", borderRadius: 20, background: `linear-gradient(145deg, ${t.accent}12, ${t.accent}06)`, border: `1.5px dashed ${t.accent}25`, display: "flex", alignItems: "center", justifyContent: "center", position: "relative", overflow: "hidden" }}>
              <div style={{ position: "absolute", inset: 0, background: `radial-gradient(circle at 35% 35%, ${t.accent}10 0%, transparent 50%)` }} />
              <BagIcon color={`${t.accent}30`} size={72} />
            </div>
            {/* Carousel dots */}
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

          {/* ── Name + Price ── */}
          <div style={{ marginBottom: 4 }}>
            {isComingSoon && <div style={{ marginBottom: 8 }}><ComingSoonBadge /></div>}
            <div style={{ fontFamily: t.heading, fontSize: 22, fontWeight: 800, color: t.dark, lineHeight: 1.2 }}>{product.name}</div>
          </div>
          <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 12 }}>{product.tagline}</div>
          <div style={{ display: "flex", alignItems: "baseline", gap: 8, marginBottom: 20 }}>
            <span style={{ fontFamily: t.heading, fontSize: 28, fontWeight: 800, color: t.dark }}>${product.price_usd.toFixed(2)}</span>
            <span style={{ fontFamily: t.ui, fontSize: 12, fontWeight: 500, color: t.muted }}>USD</span>
            {product.fulfillment === "digital" && (
              <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 600, color: "#059669", background: "rgba(16,185,129,0.1)", padding: "3px 10px", borderRadius: 20 }}>Instant download</span>
            )}
          </div>

          <GoldDivider style={{ marginBottom: 20, opacity: 0.6 }} />

          {/* ── Size Selector (pill row) ── */}
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

          {/* ── Trust Badges ── */}
          <div style={{ display: "flex", justifyContent: "space-around", background: t.card, border: `1px solid ${t.divider}`, borderRadius: 14, padding: "14px 8px", marginBottom: 20 }}>
            {trustBadges.map((b, i) => (
              <div key={i} style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6 }}>
                {b.icon}
                <span style={{ fontFamily: t.ui, fontSize: 9, fontWeight: 600, color: t.muted, textAlign: "center", lineHeight: 1.3 }}>{b.label}</span>
              </div>
            ))}
          </div>

          {/* ── Tabbed Content ── */}
          <div style={{ marginBottom: 20 }}>
            <div style={{ display: "flex", borderBottom: `2px solid ${t.divider}`, marginBottom: 14 }}>
              {tabs.map(tab => (
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
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, lineHeight: 1.8 }}>
                {product.description}
              </div>
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

      {/* ── Sticky Bottom CTA ── */}
      <div style={{
        position: "fixed", bottom: 64, left: 0, right: 0, zIndex: 20,
        background: t.bg, borderTop: `1px solid ${t.divider}`,
        padding: `10px ${bp.pad}px`,
      }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>
          {isActive ? (
            !user ? (
              <button onClick={() => nav("account")} style={{ width: "100%", padding: "14px", borderRadius: 14, background: t.accent, color: "#fff", border: "none", fontFamily: t.ui, fontSize: 15, fontWeight: 700, cursor: "pointer" }}>
                Sign in to Purchase
              </button>
            ) : (
              <button
                onClick={handleAddToCart}
                disabled={!canAdd || added}
                style={{
                  width: "100%", padding: "14px", borderRadius: 14,
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
            )
          ) : (
            <div style={{ width: "100%", padding: "14px", borderRadius: 14, background: `${t.accent}12`, border: `1.5px solid ${t.accentBorder}`, textAlign: "center" }}>
              <span style={{ fontFamily: t.ui, fontSize: 14, fontWeight: 700, color: t.dark }}>✦ Coming Soon</span>
            </div>
          )}
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
function ShopCart({ t, nav, goBack, bp, cart, removeFromCart, updateQty, user }) {
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
      const res = await fetch("/api/shop-checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cart, userId: user.id, userEmail: user.email }),
      });
      const data = await res.json();
      if (data.url) { window.location.href = data.url; }
      else setError(data.error || "Checkout failed. Please try again.");
    } catch {
      setError("Network error. Please try again.");
    }
    setLoading(false);
  }, [cart, user]);

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: cart.length > 0 ? 140 : 40 }}>
      <Header title="Your Cart" subtitle={cart.length > 0 ? `${itemCount} item${itemCount !== 1 ? "s" : ""}` : undefined} onBack={goBack} theme={t} hidePrayer hideUser />

      <div style={{ padding: `16px ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {cart.length === 0 ? (
            <div style={{ textAlign: "center", padding: "60px 20px" }}>
              <div style={{ width: 80, height: 80, borderRadius: "50%", background: `${t.accent}0C`, display: "flex", alignItems: "center", justifyContent: "center", margin: "0 auto 20px" }}>
                <BagIcon color={`${t.accent}50`} size={36} />
              </div>
              <div style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 700, color: t.dark, marginBottom: 8 }}>Your cart is empty</div>
              <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 24, lineHeight: 1.6 }}>Browse the store and add something faithful.</div>
              <button onClick={() => nav("shop-home")} style={{ background: t.accent, color: "#fff", border: "none", borderRadius: 12, padding: "12px 28px", fontFamily: t.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>
                Browse Store
              </button>
            </div>
          ) : (
            <>
              {/* Cart items */}
              <div style={{ display: "flex", flexDirection: "column", gap: 10, marginBottom: 20 }}>
                {cart.map((item, idx) => (
                  <div
                    key={item.product.id + (item.size || "") + idx}
                    style={{
                      background: t.card, border: `1px solid ${t.divider}`, borderRadius: 16,
                      padding: "14px", display: "flex", gap: 12, alignItems: "center",
                      position: "relative", overflow: "hidden",
                    }}
                  >
                    {/* Swipe hint gradient (visual only) */}
                    <div style={{ position: "absolute", right: 0, top: 0, bottom: 0, width: 40, background: `linear-gradient(90deg, transparent, rgba(239,68,68,0.04))`, pointerEvents: "none" }} />

                    {/* Image */}
                    <div style={{ width: 64, height: 64, borderRadius: 12, background: `linear-gradient(135deg, ${t.accent}14, ${t.accent}06)`, display: "flex", alignItems: "center", justifyContent: "center", flexShrink: 0 }}>
                      <BagIcon color={`${t.accent}40`} size={24} />
                    </div>

                    {/* Info */}
                    <div style={{ flex: 1, minWidth: 0 }}>
                      <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, lineHeight: 1.3, marginBottom: 2 }}>{item.product.name}</div>
                      {item.size && <div style={{ fontFamily: t.ui, fontSize: 11, color: t.muted }}>Size: {item.size}</div>}
                      <div style={{ display: "flex", alignItems: "center", gap: 10, marginTop: 6 }}>
                        <span style={{ fontFamily: t.ui, fontSize: 15, fontWeight: 800, color: t.dark }}>${(item.product.price_usd * item.qty).toFixed(2)}</span>
                      </div>
                    </div>

                    {/* Qty + remove */}
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

              {/* Promo code */}
              <div style={{ display: "flex", gap: 8, marginBottom: 20 }}>
                <input
                  type="text"
                  placeholder="Promo code"
                  value={promoCode}
                  onChange={e => setPromoCode(e.target.value)}
                  style={{
                    flex: 1, padding: "10px 14px",
                    borderRadius: 12, border: `1.5px solid ${t.divider}`,
                    background: t.card, color: t.dark,
                    fontFamily: t.ui, fontSize: 13,
                    outline: "none",
                  }}
                />
                <button
                  style={{
                    padding: "10px 18px", borderRadius: 12,
                    background: promoCode.trim() ? t.accent : `${t.muted}30`,
                    color: promoCode.trim() ? "#fff" : t.muted,
                    border: "none", fontFamily: t.ui, fontSize: 13, fontWeight: 700,
                    cursor: promoCode.trim() ? "pointer" : "default",
                  }}
                >
                  Apply
                </button>
              </div>

              {/* Order summary */}
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
                {promoCode.trim() && (
                  <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
                    <span style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Promo</span>
                    <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted, fontStyle: "italic" }}>—</span>
                  </div>
                )}
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

      {/* ── Floating Checkout Bar ── */}
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
  useEffect(() => { clearCart(); }, [clearCart]);
  return (
    <div style={{ minHeight: "100vh", background: t.bg, display: "flex", alignItems: "center", justifyContent: "center", padding: `20px ${bp.pad}px` }}>
      <div style={{ maxWidth: bp.content, width: "100%", textAlign: "center" }}>
        {/* Success ring with gold border */}
        <div style={{ position: "relative", width: 90, height: 90, margin: "0 auto 24px" }}>
          <div style={{ position: "absolute", inset: 0, borderRadius: "50%", ...GOLD_BORDER, opacity: 0.6 }} />
          <div style={{ position: "absolute", inset: 2, borderRadius: "50%", background: t.card, display: "flex", alignItems: "center", justifyContent: "center" }}>
            <span style={{ fontSize: 36, color: "#059669" }}>✓</span>
          </div>
        </div>
        <div style={{ fontFamily: t.heading, fontSize: 26, fontWeight: 800, color: t.dark, marginBottom: 8 }}>Order Confirmed!</div>
        <div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, lineHeight: 1.7, marginBottom: 6 }}>
          Thank you for supporting the ministry.
        </div>
        <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, lineHeight: 1.7, marginBottom: 28 }}>
          We'll email your order confirmation shortly.
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
          user, cart, addToCart, removeFromCart, updateQty, clearCart, shopOrderSession } = useApp();
  const [catalogue, setCatalogue] = useState(null);
  const [loadError, setLoadError] = useState(false);

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
    return <ShopCart t={ht} nav={nav} goBack={goBack} bp={bp} cart={cart} removeFromCart={removeFromCart} updateQty={updateQty} user={user} />;
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
    return <ShopCategory catalogue={catalogue} shopCategory={shopCategory} t={ht} nav={nav} goBack={goBack} bp={bp} addToCart={addToCart} />;
  }
  if (view === "shop-product") {
    return <ShopProduct catalogue={catalogue} shopProduct={shopProduct} t={ht} nav={nav} goBack={goBack} bp={bp} user={user} addToCart={addToCart} />;
  }

  return <ShopHome catalogue={catalogue} t={ht} nav={nav} goBack={goBack} darkMode={darkMode} bp={bp} addToCart={addToCart} cart={cart} />;
}
