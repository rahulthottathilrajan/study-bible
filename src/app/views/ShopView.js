"use client";
import { useState, useEffect, useCallback } from "react";
import { useApp } from "../context/AppContext";
import Header from "../components/Header";

// ── Category icons ────────────────────────────────────────────────────────────
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

// ── Shared UI ─────────────────────────────────────────────────────────────────
function ComingSoonBadge() {
  return (
    <span style={{ display:"inline-block", background:"rgba(212,168,83,0.15)", color:"#b8860b", fontFamily:"system-ui,sans-serif", fontSize:9, fontWeight:700, letterSpacing:"0.08em", textTransform:"uppercase", padding:"2px 7px", borderRadius:20, border:"1px solid rgba(212,168,83,0.3)" }}>
      Coming Soon
    </span>
  );
}

function ProductImagePlaceholder({ size = 120, accent }) {
  return (
    <div style={{ width:size, height:size, borderRadius:12, background:`linear-gradient(135deg,${accent}15,${accent}08)`, border:`1.5px solid ${accent}22`, display:"flex", alignItems:"center", justifyContent:"center", flexShrink:0 }}>
      <BagIcon color={`${accent}55`} size={typeof size === "number" ? size * 0.38 : 32} />
    </div>
  );
}

// ── SHOP HOME ─────────────────────────────────────────────────────────────────
function ShopHome({ catalogue, t, nav, goBack, bp }) {
  const featured = catalogue.products.slice(0, 4);
  return (
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title="The Store" subtitle="Faith-inspired goods" onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 40px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>
          <div style={{ fontFamily:t.ui, fontSize:10, fontWeight:700, color:t.muted, textTransform:"uppercase", letterSpacing:"0.12em", marginBottom:14 }}>Shop by Category</div>
          <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:12, marginBottom:28 }}>
            {catalogue.categories.map(cat => (
              <button key={cat.id} className="pressable" onClick={() => nav("shop-category", { shopCategory: cat.id })}
                style={{ background:t.card, border:`1.5px solid ${t.accentBorder}`, borderRadius:16, padding:"18px 14px", display:"flex", flexDirection:"column", alignItems:"flex-start", gap:10, cursor:"pointer", textAlign:"left" }}>
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

          <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:20 }}>
            <div style={{ flex:1, height:1, background:t.divider }} />
            <span style={{ fontFamily:t.heading, fontSize:11, color:t.muted, letterSpacing:"0.05em" }}>Featured</span>
            <div style={{ flex:1, height:1, background:t.divider }} />
          </div>

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

// ── SHOP CATEGORY ─────────────────────────────────────────────────────────────
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
                    {p.status === "coming-soon" ? <ComingSoonBadge /> : <span style={{ fontFamily:t.ui, fontSize:9, fontWeight:700, color:"#059669", background:"rgba(16,185,129,0.1)", padding:"2px 8px", borderRadius:20, textTransform:"uppercase", letterSpacing:"0.06em" }}>Available</span>}
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

// ── SHOP PRODUCT ──────────────────────────────────────────────────────────────
function ShopProduct({ catalogue, shopProduct: shopProductId, t, nav, goBack, bp, user, addToCart }) {
  const [selectedSize, setSelectedSize] = useState(null);
  const [added, setAdded] = useState(false);
  const product = catalogue.products.find(p => p.id === shopProductId);
  if (!product) { goBack(); return null; }

  const isActive = product.status === "active";
  const needsSize = product.sizes && product.sizes.length > 0;
  const canAdd = isActive && (!needsSize || selectedSize);

  const handleAddToCart = () => {
    addToCart(product, 1, selectedSize);
    setAdded(true);
    setTimeout(() => { nav("shop-cart"); }, 600);
  };

  return (
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title={product.name} onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 60px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>

          {/* Image placeholder */}
          <div style={{ width:"100%", aspectRatio:"1", borderRadius:18, background:`linear-gradient(135deg,${t.accent}12,${t.accent}06)`, border:`1.5px solid ${t.accent}20`, display:"flex", alignItems:"center", justifyContent:"center", marginBottom:20 }}>
            <BagIcon color={`${t.accent}40`} size={72} />
          </div>

          {/* Name + tagline */}
          <div style={{ fontFamily:t.heading, fontSize:22, fontWeight:800, color:t.dark, lineHeight:1.2, marginBottom:4 }}>{product.name}</div>
          <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted, marginBottom:10 }}>{product.tagline}</div>

          {/* Price */}
          <div style={{ fontFamily:t.heading, fontSize:26, fontWeight:800, color:t.accent, marginBottom:16 }}>
            ${product.price_usd.toFixed(2)}{" "}
            <span style={{ fontSize:13, fontWeight:500, color:t.muted }}>USD</span>
            {product.fulfillment === "digital" && (
              <span style={{ marginLeft:8, fontFamily:t.ui, fontSize:11, fontWeight:600, color:"#059669", background:"rgba(16,185,129,0.1)", padding:"2px 8px", borderRadius:20 }}>Instant download</span>
            )}
          </div>

          {/* Size picker — shown for active products with sizes */}
          {isActive && needsSize && (
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

          {/* CTA — conditional on status */}
          {isActive ? (
            <div style={{ marginBottom:20 }}>
              {!user ? (
                <div style={{ background:`${t.accent}0C`, border:`1.5px solid ${t.accentBorder}`, borderRadius:16, padding:"18px", textAlign:"center" }}>
                  <div style={{ fontFamily:t.heading, fontSize:15, fontWeight:700, color:t.dark, marginBottom:6 }}>Sign in to purchase</div>
                  <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted, marginBottom:14 }}>Create a free account to add items to your cart.</div>
                  <button onClick={() => nav("account")} style={{ background:t.accent, color:"#fff", border:"none", borderRadius:10, padding:"10px 24px", fontFamily:t.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
                    Sign In
                  </button>
                </div>
              ) : (
                <button onClick={handleAddToCart} disabled={!canAdd || added}
                  style={{ width:"100%", padding:"16px", borderRadius:14, background:added ? "#059669" : canAdd ? t.accent : t.muted, color:"#fff", border:"none", fontFamily:t.heading, fontSize:16, fontWeight:700, cursor:canAdd && !added ? "pointer" : "default", transition:"background 0.2s", display:"flex", alignItems:"center", justifyContent:"center", gap:8 }}>
                  {added ? "✓ Added to Cart" : needsSize && !selectedSize ? "Select a size first" : "Add to Cart"}
                </button>
              )}
            </div>
          ) : (
            <div style={{ background:`${t.accent}0C`, border:`1.5px solid ${t.accentBorder}`, borderRadius:16, padding:"20px 18px", marginBottom:20, display:"flex", gap:14, alignItems:"center" }}>
              <div style={{ fontSize:32, flexShrink:0 }}>🛍</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:t.heading, fontSize:16, fontWeight:700, color:t.dark, marginBottom:4 }}>Coming Soon</div>
                <div style={{ fontFamily:t.ui, fontSize:12, color:t.muted, lineHeight:1.6 }}>We're preparing this for you. Check back soon — the store launches shortly.</div>
              </div>
            </div>
          )}

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

// ── SHOP CART ─────────────────────────────────────────────────────────────────
function ShopCart({ t, nav, goBack, bp, cart, removeFromCart, updateQty, user }) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const subtotal = cart.reduce((s, i) => s + i.product.price_usd * i.qty, 0);

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
    <div style={{ minHeight:"100vh", background:t.bg }}>
      <Header title="Your Cart" onBack={goBack} theme={t} hidePrayer hideUser />
      <div style={{ padding:`20px ${bp.pad}px 80px` }}>
        <div style={{ maxWidth:bp.content, margin:"0 auto" }}>

          {cart.length === 0 ? (
            <div style={{ textAlign:"center", padding:"60px 20px" }}>
              <div style={{ fontSize:48, marginBottom:16 }}>🛍</div>
              <div style={{ fontFamily:t.heading, fontSize:18, fontWeight:700, color:t.dark, marginBottom:8 }}>Your cart is empty</div>
              <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted, marginBottom:24 }}>Browse the store and add something faithful.</div>
              <button onClick={() => nav("shop-home")} style={{ background:t.accent, color:"#fff", border:"none", borderRadius:12, padding:"12px 28px", fontFamily:t.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
                Browse Store
              </button>
            </div>
          ) : (
            <>
              {/* Line items */}
              <div style={{ display:"flex", flexDirection:"column", gap:12, marginBottom:24 }}>
                {cart.map((item, idx) => (
                  <div key={item.product.id + (item.size || "") + idx} style={{ background:t.card, border:`1px solid ${t.divider}`, borderRadius:14, padding:"14px", display:"flex", gap:12, alignItems:"center" }}>
                    <ProductImagePlaceholder size={60} accent={t.accent} />
                    <div style={{ flex:1, minWidth:0 }}>
                      <div style={{ fontFamily:t.heading, fontSize:14, fontWeight:700, color:t.dark, lineHeight:1.3 }}>{item.product.name}</div>
                      {item.size && <div style={{ fontFamily:t.ui, fontSize:11, color:t.muted, marginTop:2 }}>Size: {item.size}</div>}
                      <div style={{ fontFamily:t.ui, fontSize:13, color:t.accent, fontWeight:700, marginTop:4 }}>${(item.product.price_usd * item.qty).toFixed(2)}</div>
                    </div>
                    <div style={{ display:"flex", flexDirection:"column", alignItems:"center", gap:6 }}>
                      <div style={{ display:"flex", alignItems:"center", gap:6, background:t.bg, borderRadius:8, padding:"2px 4px", border:`1px solid ${t.divider}` }}>
                        <button onClick={() => updateQty(item.product.id, item.size, item.qty - 1)} style={{ width:24, height:24, borderRadius:6, border:"none", background:"none", color:t.text, fontFamily:t.ui, fontSize:16, fontWeight:700, cursor:"pointer", display:"flex", alignItems:"center", justifyContent:"center" }}>−</button>
                        <span style={{ fontFamily:t.ui, fontSize:13, fontWeight:700, color:t.dark, minWidth:18, textAlign:"center" }}>{item.qty}</span>
                        <button onClick={() => updateQty(item.product.id, item.size, item.qty + 1)} style={{ width:24, height:24, borderRadius:6, border:"none", background:"none", color:t.text, fontFamily:t.ui, fontSize:16, fontWeight:700, cursor:"pointer", display:"flex", alignItems:"center", justifyContent:"center" }}>+</button>
                      </div>
                      <button onClick={() => removeFromCart(item.product.id, item.size)} style={{ background:"none", border:"none", color:t.muted, fontFamily:t.ui, fontSize:11, cursor:"pointer", padding:0 }}>Remove</button>
                    </div>
                  </div>
                ))}
              </div>

              {/* Order summary */}
              <div style={{ background:t.card, border:`1px solid ${t.divider}`, borderRadius:14, padding:"16px", marginBottom:16 }}>
                <div style={{ display:"flex", justifyContent:"space-between", marginBottom:10 }}>
                  <span style={{ fontFamily:t.ui, fontSize:13, color:t.muted }}>Subtotal</span>
                  <span style={{ fontFamily:t.ui, fontSize:14, fontWeight:700, color:t.dark }}>${subtotal.toFixed(2)}</span>
                </div>
                <div style={{ display:"flex", justifyContent:"space-between", paddingBottom:10, borderBottom:`1px solid ${t.divider}`, marginBottom:10 }}>
                  <span style={{ fontFamily:t.ui, fontSize:13, color:t.muted }}>Shipping</span>
                  <span style={{ fontFamily:t.ui, fontSize:12, color:t.muted, fontStyle:"italic" }}>Calculated at checkout</span>
                </div>
                <div style={{ display:"flex", justifyContent:"space-between" }}>
                  <span style={{ fontFamily:t.heading, fontSize:15, fontWeight:700, color:t.dark }}>Estimated Total</span>
                  <span style={{ fontFamily:t.heading, fontSize:16, fontWeight:800, color:t.accent }}>${subtotal.toFixed(2)}</span>
                </div>
              </div>

              {error && (
                <div style={{ background:"rgba(239,68,68,0.08)", border:"1px solid rgba(239,68,68,0.25)", borderRadius:10, padding:"10px 14px", marginBottom:12, fontFamily:t.ui, fontSize:12, color:"#dc2626" }}>
                  {error}
                </div>
              )}

              <button onClick={handleCheckout} disabled={loading || !user}
                style={{ width:"100%", padding:"16px", borderRadius:14, background:t.accent, color:"#fff", border:"none", fontFamily:t.heading, fontSize:16, fontWeight:700, cursor:loading ? "wait" : "pointer", opacity:loading ? 0.7 : 1, display:"flex", alignItems:"center", justifyContent:"center", gap:8, marginBottom:10 }}>
                {loading ? (
                  <><div style={{ width:18, height:18, border:"2px solid rgba(255,255,255,0.4)", borderTopColor:"#fff", borderRadius:"50%", animation:"spin 0.7s linear infinite" }} /> Processing…</>
                ) : "Proceed to Checkout"}
              </button>
              <div style={{ textAlign:"center", fontFamily:t.ui, fontSize:11, color:t.muted }}>
                You'll be redirected to Stripe's secure checkout page.
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}

// ── SHOP ORDER SUCCESS ────────────────────────────────────────────────────────
function ShopOrderSuccess({ t, nav, bp, clearCart, shopOrderSession }) {
  useEffect(() => { clearCart(); }, [clearCart]);
  return (
    <div style={{ minHeight:"100vh", background:t.bg, display:"flex", alignItems:"center", justifyContent:"center", padding:`20px ${bp.pad}px` }}>
      <div style={{ maxWidth:bp.content, width:"100%", textAlign:"center" }}>
        <div style={{ width:80, height:80, borderRadius:"50%", background:"rgba(16,185,129,0.12)", border:"2px solid rgba(16,185,129,0.3)", display:"flex", alignItems:"center", justifyContent:"center", margin:"0 auto 20px", fontSize:36 }}>
          ✓
        </div>
        <div style={{ fontFamily:t.heading, fontSize:26, fontWeight:800, color:t.dark, marginBottom:8 }}>Order Confirmed!</div>
        <div style={{ fontFamily:t.ui, fontSize:14, color:t.muted, lineHeight:1.7, marginBottom:6 }}>
          Thank you for supporting the ministry.
        </div>
        <div style={{ fontFamily:t.ui, fontSize:13, color:t.muted, lineHeight:1.7, marginBottom:32 }}>
          We'll email your order confirmation shortly.
        </div>
        {shopOrderSession && (
          <div style={{ fontFamily:t.ui, fontSize:11, color:t.muted, marginBottom:24, background:t.card, borderRadius:10, padding:"8px 14px", display:"inline-block" }}>
            Order ref: <span style={{ color:t.accent, fontWeight:600 }}>{shopOrderSession.slice(-8).toUpperCase()}</span>
          </div>
        )}
        <div style={{ display:"flex", gap:10, justifyContent:"center", flexWrap:"wrap" }}>
          <button onClick={() => nav("shop-home")} style={{ background:t.accent, color:"#fff", border:"none", borderRadius:12, padding:"12px 24px", fontFamily:t.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
            Continue Shopping
          </button>
          <button onClick={() => nav("home")} style={{ background:t.card, color:t.text, border:`1px solid ${t.divider}`, borderRadius:12, padding:"12px 24px", fontFamily:t.ui, fontSize:14, fontWeight:600, cursor:"pointer" }}>
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
    return <ShopProduct catalogue={catalogue} shopProduct={shopProduct} t={ht} nav={nav} goBack={goBack} bp={bp} user={user} addToCart={addToCart} />;
  }

  return <ShopHome catalogue={catalogue} t={ht} nav={nav} goBack={goBack} darkMode={darkMode} bp={bp} />;
}
