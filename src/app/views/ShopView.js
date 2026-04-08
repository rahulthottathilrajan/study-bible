"use client";
import { useCallback, useEffect, useState } from "react";
import { useApp } from "../context/AppContext";
import { BackIcon } from "../components/ui";
import { useShopViewState } from "./hooks/useShopViewState";
import { useShopCartState } from "./hooks/useShopCartState";
import { useShopHomeState } from "./hooks/useShopHomeState";
import { useShopCategoryState } from "./hooks/useShopCategoryState";
import { useShopProductState } from "./hooks/useShopProductState";
import {
  BagIcon,
  BellIcon,
  ComingSoonBadge,
  getCategoryIcon,
  GoldDivider,
  GOLD_BORDER,
  HeartIcon,
  HorizontalProductStrip,
  ProductCard,
  ProductImg,
  RefreshIcon,
  ShareIcon,
  ScriptureCard,
  SectionLabel,
  SearchBar,
  ShieldIcon,
  ShopHeader,
  TrashIcon,
  TruckIcon,
} from "./components/ShopShared";

function ShopHome({ catalogue, t, nav, goBack, bp, addToCart, wishlist, toggleWishlist, recent, notified, toggleNotify }) {
  const {
    addedIds,
    searchQuery,
    setSearchQuery,
    notifyToast,
    setNotifyToast,
    promoDismissed,
    setPromoDismissed,
    promoNotifyToast,
    setPromoNotifyToast,
    handleQuickAdd,
    recentProducts,
    savedProducts,
    searchResults,
    isSearching,
    featured,
    mostLoved,
    underFifteen,
    newArrivals,
  } = useShopHomeState({
    catalogue,
    recent,
    wishlist,
    addToCart,
  });

  const purple = "#5B2D8E";
  const purpleLight = "rgba(91,45,142,0.08)";

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: 40 }}>
      <ShopHeader title="The Store" subtitle="Faith-inspired goods" onBack={goBack} t={t} />

      <div style={{ padding: `0 ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* ── Promotional Hero ── */}
          <div style={{ marginTop: 16, marginBottom: 0, borderRadius: 20, overflow: "hidden", position: "relative" }}>
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
                  ✓ You&apos;re on the list! We&apos;ll notify you of new arrivals.
                </div>
              )}
            </div>
          </div>

          {/* ── Seasonal Promo Banner ── */}
          {catalogue.promo?.active && !promoDismissed && (
            <div style={{ marginTop: 20, borderRadius: 16, overflow: "hidden", position: "relative", animation: "fadeIn 0.3s ease" }}>
              <div style={{
                background: `linear-gradient(135deg, ${catalogue.promo.color || "#5B2D8E"} 0%, #7C3AED 55%, #D4A853 100%)`,
                padding: "20px 18px",
                position: "relative",
              }}>
                <button
                  onClick={() => setPromoDismissed(true)}
                  style={{ position: "absolute", top: 10, right: 10, background: "rgba(255,255,255,0.15)", border: "none", borderRadius: "50%", width: 28, height: 28, cursor: "pointer", display: "flex", alignItems: "center", justifyContent: "center", color: "rgba(255,255,255,0.8)", fontSize: 15, fontWeight: 700, lineHeight: 1 }}
                >
                  ✕
                </button>
                <div style={{ fontFamily: "'DM Serif Display', Georgia, serif", fontSize: 20, fontWeight: 700, color: "#fff", lineHeight: 1.2, marginBottom: 6, paddingRight: 30 }}>
                  {catalogue.promo.title}
                </div>
                <div style={{ fontFamily: "'Lora', Georgia, serif", fontSize: 13, color: "rgba(255,255,255,0.8)", fontStyle: "italic", lineHeight: 1.5, marginBottom: 14 }}>
                  {catalogue.promo.subtitle}
                </div>
                <button
                  onClick={() => {
                    toggleNotify("promo-launch");
                    setPromoNotifyToast(true);
                    setTimeout(() => setPromoNotifyToast(false), 2500);
                  }}
                  style={{ background: "#D4A853", color: "#fff", border: "none", borderRadius: 10, padding: "9px 20px", fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", boxShadow: "0 2px 8px rgba(212,168,83,0.35)" }}
                >
                  {notified.includes("promo-launch") ? "✓ Subscribed" : catalogue.promo.cta}
                </button>
                {promoNotifyToast && !notified.includes("promo-launch") ? null : promoNotifyToast && (
                  <div style={{ marginTop: 8, fontFamily: t.ui, fontSize: 11, color: "rgba(125,212,173,0.95)", fontWeight: 600 }}>
                    ✓ We&apos;ll notify you when the collection drops!
                  </div>
                )}
              </div>
            </div>
          )}

          {/* ── How It Works ── */}
          <div style={{ marginTop: 20, marginBottom: 0 }}>
            <SectionLabel t={t} label="How It Works" />
            <div style={{ background: t.card, border: "1.5px solid rgba(212,168,83,0.35)", borderRadius: 16, padding: "18px 14px" }}>
              <div style={{ display: "flex", alignItems: "center", justifyContent: "center" }}>
                {/* Step 1 */}
                <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, flex: 1 }}>
                  <div style={{ width: 48, height: 48, borderRadius: "50%", background: "rgba(212,168,83,0.12)", display: "flex", alignItems: "center", justifyContent: "center" }}>
                    <span style={{ fontSize: 22, lineHeight: 1 }}>🛍️</span>
                  </div>
                  <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: "#5B2D8E", textAlign: "center", lineHeight: 1.2 }}>Browse &amp; Save</span>
                </div>
                {/* Arrow 1 */}
                <span style={{ fontSize: 16, color: "#D4A853", fontWeight: 700, flexShrink: 0, marginTop: -14 }}>›</span>
                {/* Step 2 */}
                <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, flex: 1 }}>
                  <div style={{ width: 48, height: 48, borderRadius: "50%", background: "rgba(212,168,83,0.12)", display: "flex", alignItems: "center", justifyContent: "center" }}>
                    <span style={{ fontSize: 22, lineHeight: 1 }}>🛒</span>
                  </div>
                  <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: "#5B2D8E", textAlign: "center", lineHeight: 1.2 }}>Add to Cart</span>
                </div>
                {/* Arrow 2 */}
                <span style={{ fontSize: 16, color: "#D4A853", fontWeight: 700, flexShrink: 0, marginTop: -14 }}>›</span>
                {/* Step 3 */}
                <div style={{ display: "flex", flexDirection: "column", alignItems: "center", gap: 6, flex: 1 }}>
                  <div style={{ width: 48, height: 48, borderRadius: "50%", background: "rgba(212,168,83,0.12)", display: "flex", alignItems: "center", justifyContent: "center" }}>
                    <span style={{ fontSize: 22, lineHeight: 1 }}>✉️</span>
                  </div>
                  <span style={{ fontFamily: t.ui, fontSize: 11, fontWeight: 700, color: "#5B2D8E", textAlign: "center", lineHeight: 1.2 }}>Order Confirmed</span>
                </div>
              </div>
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
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 20 }}>
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

              {/* ── Promo Strips ── */}
              {mostLoved.length > 0 && (
                <div style={{ marginBottom: 20 }}>
                  <SectionLabel t={t} label="Most Loved" />
                  <div className="shop-scroll-hide" style={{ display: "flex", gap: 12, overflowX: "auto", paddingBottom: 4 }}>
                    {mostLoved.map(p => (
                      <div key={p.id} style={{ flexShrink: 0, width: 170 }}>
                        <ProductCard p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                      </div>
                    ))}
                  </div>
                </div>
              )}
              {underFifteen.length > 0 && (
                <div style={{ marginBottom: 20 }}>
                  <SectionLabel t={t} label="Under $15" />
                  <div className="shop-scroll-hide" style={{ display: "flex", gap: 12, overflowX: "auto", paddingBottom: 4 }}>
                    {underFifteen.map(p => (
                      <div key={p.id} style={{ flexShrink: 0, width: 170 }}>
                        <ProductCard p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                      </div>
                    ))}
                  </div>
                </div>
              )}
              {newArrivals.length > 0 && (
                <div style={{ marginBottom: 20 }}>
                  <SectionLabel t={t} label="New Arrivals" />
                  <div className="shop-scroll-hide" style={{ display: "flex", gap: 12, overflowX: "auto", paddingBottom: 4 }}>
                    {newArrivals.map(p => (
                      <div key={p.id} style={{ flexShrink: 0, width: 170 }}>
                        <ProductCard p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                      </div>
                    ))}
                  </div>
                </div>
              )}

              {/* ── Featured ── */}
              <SectionLabel t={t} label="Featured" action="See All" onAction={() => nav("shop-category", { shopCategory: catalogue.categories[0]?.id })} />
              <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 20 }}>
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
  const {
    cat,
    allProducts,
    sort,
    setSort,
    statusFilter,
    setStatusFilter,
    subFilter,
    setSubFilter,
    addedIds,
    handleQuickAdd,
    subcategories,
    sortedProducts,
  } = useShopCategoryState({
    catalogue,
    shopCategory,
    addToCart,
  });

  if (!cat) { goBack(); return null; }

  const sorted = sortedProducts;




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
  const {
    selectedSize,
    setSelectedSize,
    added,
    activeTab,
    setActiveTab,
    carouselIndex,
    setCarouselIndex,
    notifyToast,
    addedIds,
    product,
    isActive,
    isComingSoon,
    needsSize,
    canAdd,
    isWishlisted,
    isNotified,
    hasImages,
    carouselSlots,
    handleAddToCart,
    handleQuickAdd,
    similarItems,
    handleToggleNotify,
    trustBadges,
  } = useShopProductState({
    catalogue,
    shopProductId,
    addToCart,
    nav,
    wishlist,
    notified,
    toggleNotify,
    addToRecent,
  });

  if (!product) { goBack(); return null; }

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
            {product.price_original_usd && (
              <span style={{ fontFamily: t.ui, fontSize: 16, fontWeight: 500, color: t.muted, textDecoration: "line-through" }}>${product.price_original_usd.toFixed(2)}</span>
            )}
            <span style={{ fontFamily: t.heading, fontSize: 28, fontWeight: 800, color: "#5B2D8E" }}>${product.price_usd.toFixed(2)}</span>
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
                {b.icon === "shield" ? <ShieldIcon color={t.accent} /> : b.icon === "truck" ? <TruckIcon color={t.accent} /> : <RefreshIcon color={t.accent} />}
                <span style={{ fontFamily: t.ui, fontSize: 9, fontWeight: 600, color: t.muted, textAlign: "center" }}>{b.label}</span>
              </div>
            ))}
          </div>

          {notifyToast && (
            <div style={{ background: "rgba(16,185,129,0.08)", border: "1px solid rgba(16,185,129,0.25)", borderRadius: 12, padding: "10px 14px", marginBottom: 16, fontFamily: t.ui, fontSize: 12, color: "#059669", animation: "fadeIn 0.2s ease", textAlign: "center" }}>
              🔔 We&apos;ll let you know when it&apos;s available!
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

          {/* ── You May Also Like ── */}
          {similarItems.length > 0 && (
            <div style={{ marginBottom: 20 }}>
              <SectionLabel t={t} label="You May Also Like" />
              <div className="shop-scroll-hide" style={{ display: "flex", gap: 12, overflowX: "auto", paddingBottom: 4 }}>
                {similarItems.map(p => (
                  <div key={p.id} style={{ flexShrink: 0, width: 170 }}>
                    <ProductCard p={p} t={t} nav={nav} wishlist={wishlist} toggleWishlist={toggleWishlist} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                  </div>
                ))}
              </div>
            </div>
          )}

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
function ShopCart({ t, nav, goBack, bp, cart, removeFromCart, updateQty, user, wishlist, toggleWishlist, catalogue, addToCart }) {
  const {
    loading,
    error,
    promoCode,
    setPromoCode,
    addedIds,
    handleQuickAdd,
    subtotal,
    itemCount,
    handleCheckout,
  } = useShopCartState({
    cart,
    user,
    addToCart,
  });

  return (
    <div style={{ minHeight: "100vh", background: t.bg, paddingBottom: cart.length > 0 ? 140 : 40 }}>
      <ShopHeader title="Your Cart" subtitle={cart.length > 0 ? `${itemCount} item${itemCount !== 1 ? "s" : ""}` : undefined} onBack={goBack} t={t} />

      <div style={{ padding: `16px ${bp.pad}px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {cart.length === 0 ? (
            <div>
              {/* Confetti empty state */}
              <div style={{ textAlign: "center", padding: "52px 20px 32px" }}>
                <div style={{ position: "relative", width: 120, height: 120, margin: "0 auto 24px" }}>
                  <div style={{ width: 120, height: 120, borderRadius: "50%", background: `${t.accent}0C`, display: "flex", alignItems: "center", justifyContent: "center" }}>
                    <span style={{ fontSize: 72, lineHeight: 1, userSelect: "none" }}>🧺</span>
                  </div>
                  {[
                    { color: "#D4A853", top: 6, left: 14, delay: "0s", char: "✦" },
                    { color: "#5B2D8E", top: 2, right: 18, delay: "0.4s", char: "★" },
                    { color: "#E8625C", top: 30, left: -2, delay: "0.8s", char: "●" },
                    { color: "#D4A853", bottom: 12, right: -4, delay: "1.2s", char: "✦" },
                    { color: "#5B2D8E", bottom: 4, left: 10, delay: "0.6s", char: "★" },
                    { color: "#E8625C", top: 10, right: -2, delay: "1.0s", char: "●" },
                  ].map((dot, i) => (
                    <span key={i} style={{ position: "absolute", top: dot.top, left: dot.left, right: dot.right, bottom: dot.bottom, color: dot.color, fontSize: 10, animation: `confettiFloat 2.4s ease-in-out ${dot.delay} infinite`, pointerEvents: "none" }}>{dot.char}</span>
                  ))}
                </div>
                <div style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 700, color: t.dark, marginBottom: 8 }}>Your cart is empty</div>
                <div style={{ fontFamily: t.ui, fontSize: 13, color: t.muted, marginBottom: 24, lineHeight: 1.6 }}>Browse the store and add something faithful.</div>
                <button onClick={() => nav("shop-home")} style={{ background: "#5B2D8E", color: "#fff", border: "none", borderRadius: 12, padding: "12px 28px", fontFamily: t.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>
                  Browse Collection
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

              {/* You May Also Need */}
              {catalogue && (() => {
                const cartIds = new Set(cart.map(i => i.product.id));
                const suggestions = catalogue.products
                  .filter(p => p.status === "active" && !cartIds.has(p.id))
                  .slice(0, 4);
                if (!suggestions.length) return null;
                return (
                  <div style={{ marginBottom: 20 }}>
                    <SectionLabel t={t} label="You May Also Need" />
                    <div className="shop-scroll-hide" style={{ display: "flex", gap: 10, overflowX: "auto", paddingBottom: 4 }}>
                      {suggestions.map(p => (
                        <div key={p.id} style={{ flexShrink: 0, width: 140 }}>
                          <ProductCard p={p} t={t} nav={nav} wishlist={wishlist || []} toggleWishlist={toggleWishlist || (() => {})} onQuickAdd={handleQuickAdd} addedIds={addedIds} />
                        </div>
                      ))}
                    </div>
                  </div>
                );
              })()}

              {/* Order Summary */}
              <div style={{ background: t.card, borderLeft: "3px solid #D4A853", borderRadius: 16, padding: "16px", marginBottom: 16, boxShadow: "0 1px 4px rgba(0,0,0,0.06)" }}>
                <div style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark, marginBottom: 12 }}>Order Summary</div>
                <GoldDivider style={{ marginBottom: 12, opacity: 0.4 }} />
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
                  <span style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Subtotal ({itemCount} item{itemCount !== 1 ? "s" : ""})</span>
                  <span style={{ fontFamily: t.ui, fontSize: 13, fontWeight: 700, color: t.dark }}>${subtotal.toFixed(2)}</span>
                </div>
                <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
                  <span style={{ fontFamily: t.ui, fontSize: 13, color: t.muted }}>Shipping</span>
                  <span style={{ fontFamily: t.ui, fontSize: 12, color: "#059669", fontWeight: 600 }}>Free on all orders 🌍</span>
                </div>
                <div style={{ height: 1, background: t.divider, margin: "6px 0 12px" }} />
                <div style={{ display: "flex", justifyContent: "space-between" }}>
                  <span style={{ fontFamily: t.heading, fontSize: 16, fontWeight: 700, color: t.dark }}>Total</span>
                  <span style={{ fontFamily: t.heading, fontSize: 18, fontWeight: 800, color: "#5B2D8E" }}>${subtotal.toFixed(2)}</span>
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
            <div style={{ textAlign: "center", fontFamily: t.ui, fontSize: 11, color: t.muted, lineHeight: 1.5 }}>
              🔒 Secure checkout · Ships in 5–7 days · Easy returns
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
          We&apos;ll email your order confirmation shortly.
        </div>

        <div style={{ borderRadius: 14, overflow: "hidden", position: "relative", marginBottom: 20 }}>
          <div style={{ position: "absolute", inset: 0, ...GOLD_BORDER, opacity: 0.4 }} />
          <div style={{ margin: 1.5, borderRadius: 12.5, background: t.card, padding: "14px 18px" }}>
            <div style={{ fontFamily: "Georgia, serif", fontSize: 13, color: t.muted, lineHeight: 1.75, fontStyle: "italic" }}>
              &ldquo;Every good gift and every perfect gift is from above, and cometh down from the Father of lights.&rdquo;
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
  const {
    catalogue,
    loadError,
    wishlist,
    toggleWishlist,
    recent,
    addToRecent,
    notified,
    toggleNotify,
  } = useShopViewState();

  if (view === "shop-order-success") {
    return <ShopOrderSuccess t={ht} nav={nav} bp={bp} clearCart={clearCart} shopOrderSession={shopOrderSession} />;
  }
  if (view === "shop-cart") {
    return <ShopCart t={ht} nav={nav} goBack={goBack} bp={bp} cart={cart} removeFromCart={removeFromCart} updateQty={updateQty} user={user} wishlist={wishlist} toggleWishlist={toggleWishlist} catalogue={catalogue} addToCart={addToCart} />;
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

  return <ShopHome catalogue={catalogue} t={ht} nav={nav} goBack={goBack} darkMode={darkMode} bp={bp} addToCart={addToCart} cart={cart} wishlist={wishlist} toggleWishlist={toggleWishlist} recent={recent} notified={notified} toggleNotify={toggleNotify} />;
}
