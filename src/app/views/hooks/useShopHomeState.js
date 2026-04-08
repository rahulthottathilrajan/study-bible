"use client";

import { useCallback, useMemo, useState } from "react";

export function useShopHomeState({ catalogue, recent, wishlist, addToCart }) {
  const [addedIds, setAddedIds] = useState({});
  const [searchQuery, setSearchQuery] = useState("");
  const [notifyToast, setNotifyToast] = useState(false);
  const [promoDismissed, setPromoDismissed] = useState(false);
  const [promoNotifyToast, setPromoNotifyToast] = useState(false);

  const handleQuickAdd = useCallback((product) => {
    if (product.status === "coming-soon") return;
    addToCart(product, 1, null);
    setAddedIds((prev) => ({ ...prev, [product.id]: true }));
    setTimeout(() => {
      setAddedIds((prev) => ({ ...prev, [product.id]: false }));
    }, 1200);
  }, [addToCart]);

  const recentProducts = useMemo(
    () => recent.map((id) => catalogue.products.find((product) => product.id === id)).filter(Boolean),
    [catalogue.products, recent],
  );

  const savedProducts = useMemo(
    () => wishlist.map((id) => catalogue.products.find((product) => product.id === id)).filter(Boolean),
    [catalogue.products, wishlist],
  );

  const searchResults = useMemo(() => {
    if (!searchQuery.trim()) return [];
    const query = searchQuery.toLowerCase();
    return catalogue.products.filter((product) => (
      product.name.toLowerCase().includes(query) ||
      (product.tagline || "").toLowerCase().includes(query) ||
      (product.tags || []).some((tag) => tag.toLowerCase().includes(query))
    ));
  }, [catalogue.products, searchQuery]);

  const featured = useMemo(() => catalogue.products.slice(0, 6), [catalogue.products]);
  const mostLoved = useMemo(
    () => [...catalogue.products].sort((a, b) => (b.rating_count || 0) - (a.rating_count || 0)).slice(0, 4),
    [catalogue.products],
  );
  const underFifteen = useMemo(
    () => catalogue.products.filter((product) => product.price_usd < 15),
    [catalogue.products],
  );
  const newArrivals = useMemo(
    () => catalogue.products.filter((product) => product.badge === "new"),
    [catalogue.products],
  );

  return {
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
    isSearching: searchQuery.trim().length > 0,
    featured,
    mostLoved,
    underFifteen,
    newArrivals,
  };
}
