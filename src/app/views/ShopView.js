"use client";
import { useState, useEffect } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";

// ── Category icons (SVG inline) ──────────────────────────────────────────────
function ShirtIcon({ color }) {
  return (
    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20.38 3.46L16 2a4 4 0 01-8 0L3.62 3.46a2 2 0 00-1.34 2.23l.58 3.57a1 1 0 00.99.84H6v10c0 1.1.9 2 2 2h8a2 2 0 002-2V10h2.15a1 1 0 00.99-.84l.58-3.57a2 2 0 00-1.34-2.23z"/>
    </svg>
  );
}
function BookIcon({ color }) {
  return (
    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M4 19.5A2.5 2.5 0 016.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 014 19.5v-15A2.5 2.5 0 016.5 2z"/>
    </svg>
  );
}
function BookOpenIcon({ color }) {
  return (
    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
      <path d="M2 3h6a4 4 0 014 4v14a3 3 0 00-3-3H2z"/><path d="M22 3h-6a4 4 0 00-4 4v14a3 3 0 013-3h7z"/>
    </svg>
  );
}
function StickerIcon({ color }) {
  return (
    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke={color} strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round">
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

function getCategoryIcon(iconId, color) {
  if (iconId === "shirt") return <ShirtIcon color={color} />;
  if (iconId === "book") return <BookIcon color={color} />;
  if (iconId === "book-open") return <BookOpenIcon color={color} />;
  if (iconId === "sticker") return <StickerIcon color={color} />;
  return <BagIcon color={color} />;
}

// ── Coming Soon badge ─────────────────────────────────────────────────────────
function ComingSoonBadge() {
  return (
    <span style={{ display:"inline-block", background:"rgba(212,168,83,0.15)", color:"#b8860b", fontFamily:"system-ui,sans-serif", fontSize:9, fontWeight:700, letterSpacing:"0.08em", textTransform:"uppercase", padding:"2px 7px", borderRadius:20, border:"1px solid rgba(212,168,83,0.3)" }}>
      Coming Soon
    </span>
  );
}

// ── Product image placeholder ─────────────────────────────────────────────────
function ProductImagePlaceholder({ size = 120, icon, accent }) {
  return (
    <div style={{ width:size, height:size, borderRadius:12, background:`linear-gradient(135deg,${accent}15,${accent}08)`, border:`1.5px solid ${accent}22`, display:"flex", alignItems:"center", justifyContent:"center", flexShrink:0 }}>
      <BagIcon color={`${accent}55`} size={size * 0.38} />
    </div>
  );
}

// ── SHOP HOME ────────────────────────────────────────────────────────────────
function ShopHome({ catalogue, t, nav, goBack, darkMode, bp }) {
  const featured = catalogue.products.slice(0, 4);

  return (
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title="The Store" subtitle="Faith-inspired goods" onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 40px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>

          {/* Categories grid */}
          <div style={{ fontFamily:t.ui, fontSize:10, fontWeight:700, color:t.muted, textTransform:"uppercase", letterSpacing:"0.12em", marginBottom:14 }}>
            Shop by Category
          </div>
          <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:12, marginBottom:28 }}>
            {catalogue.categories.map(cat => (
              <button key={cat.id} className="pressable" onClick={() => nav("shop-category", { shopCategory: cat.id })}
                style={{ background:t.card, border:`1.5px solid ${t.accentBorder}`, borderRadius:16, padding:"18px 14px", display:"flex", flexDirection:"column", alignItems:"flex-start", gap:10, cursor:"pointer", textAlign:"left", position:"relative", overflow:"hidden" }}>
                <div style={{ width:50, height:50, borderRadius:12, background:`${t.accent}12`, display:"flex", alignItems:"center", justifyContent:"center" }}>
                  {getCategoryIcon(cat.icon, t.accent)}
                </div>
                <div>
                  <div style={{ fontFamily:t.heading, fontSize:15, fontWeight:700, color:t.dark, lineHeight:1.2, marginBottom:3 }}>{cat.name}</div>
                  <div style={{ fontFamily:t.ui, fontSize:10, color:t.muted, marginBottom:6 }}>{cat.tag}</div>
                  <ComingSoonBadge />
                </div>
              </button>
            ))}
          </div>

          {/* Divider */}
          <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:20 }}>
            <div style={{ flex:1, height:1, background:t.divider }} />
            <span style={{ fontFamily:t.heading, fontSize:11, color:t.muted, letterSpacing:"0.05em" }}>Featured</span>
            <div style={{ flex:1, height:1, background:t.divider }} />
          </div>

          {/* Featured products horizontal scroll */}
          <div style={{ display:"flex", gap:12, overflowX:"auto", paddingBottom:8, scrollbarWidth:"none" }}>
            {featured.map(p => (
              <button key={p.id} className="pressable" onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                style={{ minWidth:140, background:t.card, border:`1px solid ${t.divider}`, borderRadius:14, padding:"12px", display:"flex", flexDirection:"column", gap:8, cursor:"pointer", textAlign:"left", flexShrink:0 }}>
                <ProductImagePlaceholder size={116} accent={t.accent} />
                <div style={{ fontFamily:t.heading, fontSize:13, fontWeight:700, color:t.dark, lineHeight:1.3 }}>{p.name}</div>
                <div style={{ fontFamily:t.ui, fontSize:11, color:t.accent, fontWeight:600 }}>${p.price_usd.toFixed(2)}</div>
                <ComingSoonBadge />
              </button>
            ))}
          </div>

          {/* Mission note */}
          <div style={{ marginTop:28, background:`${t.accent}0A`, border:`1px solid ${t.accentBorder}`, borderRadius:14, padding:"16px 18px", display:"flex", gap:12, alignItems:"flex-start" }}>
            <span style={{ fontSize:20, flexShrink:0 }}>✦</span>
            <div>
              <div style={{ fontFamily:t.heading, fontSize:13, fontWeight:700, color:t.dark, marginBottom:4 }}>No ads. No pressure.</div>
              <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted, lineHeight:1.6 }}>Every purchase keeps The Bible Scrollers free for everyone. No subscriptions, no upselling — just goods you choose.</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

// ── SHOP CATEGORY ────────────────────────────────────────────────────────────
function ShopCategory({ catalogue, shopCategory, t, nav, goBack, bp }) {
  const cat = catalogue.categories.find(c => c.id === shopCategory);
  const products = catalogue.products.filter(p => p.category_id === shopCategory);

  if (!cat) { goBack(); return null; }

  return (
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title={cat.name} subtitle={cat.tag} onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 40px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>
          <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted, marginBottom:20, lineHeight:1.6 }}>{cat.description}</div>

          {products.length === 0 ? (
            <div style={{ textAlign:"center", padding:"60px 20px" }}>
              <div style={{ fontSize:40, marginBottom:12 }}>🛍</div>
              <div style={{ fontFamily:t.heading, fontSize:16, fontWeight:700, color:t.dark, marginBottom:6 }}>Products Coming Soon</div>
              <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted }}>We're curating the best faith-inspired {cat.name.toLowerCase()} for you.</div>
            </div>
          ) : (
            <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:14 }}>
              {products.map(p => (
                <button key={p.id} className="pressable" onClick={() => nav("shop-product", { shopCategory: p.category_id, shopProduct: p.id })}
                  style={{ background:t.card, border:`1px solid ${t.divider}`, borderRadius:14, padding:"12px", display:"flex", flexDirection:"column", gap:8, cursor:"pointer", textAlign:"left" }}>
                  <div style={{ width:"100%", aspectRatio:"1", borderRadius:10, background:`${t.accent}10`, border:`1px solid ${t.accent}18`, display:"flex", alignItems:"center", justifyContent:"center" }}>
                    <BagIcon color={`${t.accent}50`} size={36} />
                  </div>
                  <div style={{ fontFamily:t.heading, fontSize:13, fontWeight:700, color:t.dark, lineHeight:1.3 }}>{p.name}</div>
                  <div style={{ fontFamily:t.ui, fontSize:10, color:t.muted }}>{p.tagline}</div>
                  <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between" }}>
                    <span style={{ fontFamily:t.ui, fontSize:13, color:t.accent, fontWeight:700 }}>${p.price_usd.toFixed(2)}</span>
                    <ComingSoonBadge />
                  </div>
                </button>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ── SHOP PRODUCT ─────────────────────────────────────────────────────────────
function ShopProduct({ catalogue, shopProduct, t, goBack, bp }) {
  const [selectedSize, setSelectedSize] = useState(null);
  const product = catalogue.products.find(p => p.id === shopProduct);

  if (!product) { goBack(); return null; }

  const isFulfillmentDigital = product.fulfillment === "digital";

  return (
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title={product.name} onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 60px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>

          {/* Product image placeholder */}
          <div style={{ width:"100%", aspectRatio:"1", borderRadius:18, background:`linear-gradient(135deg,${t.accent}12,${t.accent}06)`, border:`1.5px solid ${t.accent}20`, display:"flex", alignItems:"center", justifyContent:"center", marginBottom:20 }}>
            <BagIcon color={`${t.accent}40`} size={72} />
          </div>

          {/* Name + tagline */}
          <div style={{ fontFamily:t.heading, fontSize:22, fontWeight:800, color:t.dark, lineHeight:1.2, marginBottom:4 }}>{product.name}</div>
          <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted, marginBottom:10 }}>{product.tagline}</div>

          {/* Price */}
          <div style={{ fontFamily:t.heading, fontSize:26, fontWeight:800, color:t.accent, marginBottom:16 }}>
            ${product.price_usd.toFixed(2)} <span style={{ fontSize:13, fontWeight:500, color:t.muted }}>USD</span>
            {isFulfillmentDigital && <span style={{ marginLeft:8, fontFamily:t.ui, fontSize:11, fontWeight:600, color:"#059669", background:"rgba(16,185,129,0.1)", padding:"2px 8px", borderRadius:20 }}>Instant download</span>}
          </div>

          {/* Size picker */}
          {product.sizes && product.sizes.length > 0 && (
            <div style={{ marginBottom:20 }}>
              <div style={{ fontFamily:t.ui, fontSize:11, fontWeight:700, color:t.muted, textTransform:"uppercase", letterSpacing:"0.1em", marginBottom:10 }}>Select Size</div>
              <div style={{ display:"flex", gap:8, flexWrap:"wrap" }}>
                {product.sizes.map(s => (
                  <button key={s} onClick={() => setSelectedSize(s)}
                    style={{ padding:"6px 14px", borderRadius:8, border:`1.5px solid ${selectedSize===s ? t.accent : t.divider}`, background:selectedSize===s ? `${t.accent}15` : t.card, color:selectedSize===s ? t.accent : t.text, fontFamily:t.ui, fontSize:13, fontWeight:selectedSize===s ? 700 : 500, cursor:"pointer", transition:"all 0.15s" }}>
                    {s}
                  </button>
                ))}
              </div>
            </div>
          )}

          {/* Coming Soon CTA */}
          <div style={{ background:`${t.accent}0C`, border:`1.5px solid ${t.accentBorder}`, borderRadius:16, padding:"20px 18px", marginBottom:20, display:"flex", gap:14, alignItems:"center" }}>
            <div style={{ fontSize:32, flexShrink:0 }}>🛍</div>
            <div style={{ flex:1 }}>
              <div style={{ fontFamily:t.heading, fontSize:16, fontWeight:700, color:t.dark, marginBottom:4 }}>Coming Soon</div>
              <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted, lineHeight:1.6 }}>We're preparing this for you. Check back soon — the store launches shortly.</div>
            </div>
          </div>

          {/* Description */}
          <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted, lineHeight:1.8 }}>{product.description}</div>

          {/* Tags */}
          {product.tags && product.tags.length > 0 && (
            <div style={{ display:"flex", gap:6, flexWrap:"wrap", marginTop:16 }}>
              {product.tags.map(tag => (
                <span key={tag} style={{ fontFamily:t.ui, fontSize:10, color:t.muted, background:t.card, border:`1px solid ${t.divider}`, borderRadius:20, padding:"2px 10px" }}>#{tag}</span>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

// ── MAIN SHOPVIEW ────────────────────────────────────────────────────────────
export default function ShopView() {
  const { view, ht, darkMode, nav, goBack, bp, shopCategory, shopProduct } = useApp();
  const [catalogue, setCatalogue] = useState(null);
  const [loadError, setLoadError] = useState(false);

  useEffect(() => {
    fetch("/data/shop-catalogue.json")
      .then(r => r.json())
      .then(setCatalogue)
      .catch(() => setLoadError(true));
  }, []);

  if (loadError) {
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, display:"flex", alignItems:"center", justifyContent:"center", padding:20 }}>
        <div style={{ textAlign:"center" }}>
          <div style={{ fontSize:32, marginBottom:12 }}>🛍</div>
          <div style={{ fontFamily:ht.heading, fontSize:16, fontWeight:700, color:ht.dark }}>Store unavailable</div>
          <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, marginTop:6 }}>Please try again later.</div>
        </div>
      </div>
    );
  }

  if (!catalogue) {
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, display:"flex", alignItems:"center", justifyContent:"center" }}>
        <div style={{ width:32, height:32, border:`3px solid ${ht.accent}30`, borderTopColor:ht.accent, borderRadius:"50%", animation:"spin 0.8s linear infinite" }} />
      </div>
    );
  }

  if (view === "shop-category") {
    return <ShopCategory catalogue={catalogue} shopCategory={shopCategory} t={ht} nav={nav} goBack={goBack} bp={bp} />;
  }
  if (view === "shop-product") {
    return <ShopProduct catalogue={catalogue} shopProduct={shopProduct} t={ht} goBack={goBack} bp={bp} />;
  }

  return <ShopHome catalogue={catalogue} t={ht} nav={nav} goBack={goBack} darkMode={darkMode} bp={bp} />;
}
