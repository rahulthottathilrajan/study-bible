"use client";

import { useCallback, useState } from "react";
import { supabase } from "../../../lib/supabase";

export function useShopCartState({ cart, user, addToCart }) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [promoCode, setPromoCode] = useState("");
  const [addedIds, setAddedIds] = useState({});

  const handleQuickAdd = useCallback((product) => {
    if (product.status === "coming-soon") return;
    addToCart(product, 1, null);
    setAddedIds((prev) => ({ ...prev, [product.id]: true }));
    setTimeout(() => {
      setAddedIds((prev) => ({ ...prev, [product.id]: false }));
    }, 1200);
  }, [addToCart]);

  const subtotal = cart.reduce((sum, item) => sum + item.product.price_usd * item.qty, 0);
  const itemCount = cart.reduce((sum, item) => sum + item.qty, 0);

  const handleCheckout = useCallback(async () => {
    if (!user || cart.length === 0) return;
    setLoading(true);
    setError(null);
    try {
      const session = await supabase.auth.getSession();
      const token = session.data.session?.access_token;
      const normalizedCart = cart.map((item) => ({
        productId: item.product.id,
        qty: item.qty,
        ...(item.size ? { size: item.size } : {}),
      }));
      const res = await fetch("/api/shop-checkout", {
        method: "POST",
        headers: { "Content-Type": "application/json", ...(token ? { Authorization: `Bearer ${token}` } : {}) },
        body: JSON.stringify({ cart: normalizedCart, userEmail: user.email }),
      });
      const data = await res.json();
      if (data.url && data.url.startsWith("https://checkout.stripe.com")) {
        window.location.href = data.url;
      } else if (data.url) {
        setError("Invalid redirect. Please try again.");
      } else {
        setError(data.error || "Checkout failed. Please try again.");
      }
    } catch {
      setError("Network error. Please try again.");
    }
    setLoading(false);
  }, [cart, user]);

  return {
    loading,
    error,
    promoCode,
    setPromoCode,
    addedIds,
    handleQuickAdd,
    subtotal,
    itemCount,
    handleCheckout,
  };
}
