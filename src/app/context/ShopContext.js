"use client";

import { createContext, useCallback, useContext, useEffect, useMemo, useState } from "react";

const ShopContext = createContext(null);

export function ShopProvider({ children }) {
  const [shopCategory, setShopCategory] = useState(null);
  const [shopProduct, setShopProduct] = useState(null);
  const [cart, setCart] = useState(() => {
    try {
      const saved = localStorage.getItem("cart");
      return saved ? JSON.parse(saved) : [];
    } catch {
      return [];
    }
  });
  const [shopOrderSession, setShopOrderSession] = useState(null);

  useEffect(() => {
    try {
      localStorage.setItem("cart", JSON.stringify(cart));
    } catch {}
  }, [cart]);

  const addToCart = useCallback((product, qty = 1, size = null) => {
    setCart((prev) => {
      const key = product.id + (size || "");
      const existing = prev.find((item) => item.product.id + (item.size || "") === key);
      if (existing) {
        return prev.map((item) => item.product.id + (item.size || "") === key ? { ...item, qty: item.qty + qty } : item);
      }
      return [...prev, { product, qty, size }];
    });
  }, []);

  const removeFromCart = useCallback((productId, size = null) => {
    setCart((prev) => prev.filter((item) => !(item.product.id === productId && (item.size || null) === (size || null))));
  }, []);

  const updateQty = useCallback((productId, size, qty) => {
    if (qty < 1) {
      removeFromCart(productId, size);
      return;
    }
    setCart((prev) => prev.map((item) => item.product.id === productId && (item.size || null) === (size || null) ? { ...item, qty } : item));
  }, [removeFromCart]);

  const clearCart = useCallback(() => setCart([]), []);

  const cartCount = useMemo(() => cart.reduce((sum, item) => sum + item.qty, 0), [cart]);

  const value = useMemo(() => ({
    shopCategory,
    setShopCategory,
    shopProduct,
    setShopProduct,
    cart,
    setCart,
    addToCart,
    removeFromCart,
    updateQty,
    clearCart,
    cartCount,
    shopOrderSession,
    setShopOrderSession,
  }), [
    addToCart,
    cart,
    cartCount,
    clearCart,
    removeFromCart,
    shopCategory,
    shopOrderSession,
    shopProduct,
    updateQty,
  ]);

  return <ShopContext.Provider value={value}>{children}</ShopContext.Provider>;
}

export function useShopContext() {
  const ctx = useContext(ShopContext);
  if (!ctx) throw new Error("useShopContext must be used within ShopProvider");
  return ctx;
}
