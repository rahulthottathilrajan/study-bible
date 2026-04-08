"use client";

import { useCallback, useEffect, useState } from "react";

function readArray(key) {
  try {
    return JSON.parse(localStorage.getItem(key) || "[]");
  } catch {
    return [];
  }
}

export function useShopViewState() {
  const [catalogue, setCatalogue] = useState(null);
  const [loadError, setLoadError] = useState(false);
  const [wishlist, setWishlist] = useState(() => readArray("shop_wishlist"));
  const [recent, setRecent] = useState(() => readArray("shop_recent"));
  const [notified, setNotified] = useState(() => readArray("shop_notify"));

  const toggleWishlist = useCallback((id) => {
    setWishlist((prev) => {
      const next = prev.includes(id) ? prev.filter((item) => item !== id) : [...prev, id];
      try { localStorage.setItem("shop_wishlist", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  const addToRecent = useCallback((id) => {
    setRecent((prev) => {
      const next = [id, ...prev.filter((item) => item !== id)].slice(0, 5);
      try { localStorage.setItem("shop_recent", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  const toggleNotify = useCallback((id) => {
    setNotified((prev) => {
      const next = prev.includes(id) ? prev.filter((item) => item !== id) : [...prev, id];
      try { localStorage.setItem("shop_notify", JSON.stringify(next)); } catch {}
      return next;
    });
  }, []);

  useEffect(() => {
    fetch("/data/shop-catalogue.json")
      .then((response) => response.json())
      .then(setCatalogue)
      .catch(() => setLoadError(true));
  }, []);

  return {
    catalogue,
    loadError,
    wishlist,
    toggleWishlist,
    recent,
    addToRecent,
    notified,
    toggleNotify,
  };
}
