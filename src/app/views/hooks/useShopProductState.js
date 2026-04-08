"use client";

import { useCallback, useEffect, useMemo, useState } from "react";

export function useShopProductState({
  catalogue,
  shopProductId,
  addToCart,
  nav,
  wishlist,
  notified,
  toggleNotify,
  addToRecent,
}) {
  const [selectedSizesByProduct, setSelectedSizesByProduct] = useState({});
  const [addedProductId, setAddedProductId] = useState(null);
  const [activeTabsByProduct, setActiveTabsByProduct] = useState({});
  const [carouselIndexesByProduct, setCarouselIndexesByProduct] = useState({});
  const [notifyToastProductId, setNotifyToastProductId] = useState(null);
  const [addedIds, setAddedIds] = useState({});

  const product = useMemo(
    () => catalogue.products.find((entry) => entry.id === shopProductId) || null,
    [catalogue.products, shopProductId],
  );

  useEffect(() => {
    if (!product) return;
    addToRecent(product.id);
  }, [addToRecent, product]);

  const selectedSize = selectedSizesByProduct[shopProductId] || null;
  const setSelectedSize = useCallback((value) => {
    setSelectedSizesByProduct((prev) => ({ ...prev, [shopProductId]: value }));
  }, [shopProductId]);

  const added = addedProductId === shopProductId;
  const activeTab = activeTabsByProduct[shopProductId] || "description";
  const setActiveTab = useCallback((value) => {
    setActiveTabsByProduct((prev) => ({ ...prev, [shopProductId]: value }));
  }, [shopProductId]);

  const carouselIndex = carouselIndexesByProduct[shopProductId] || 0;
  const setCarouselIndex = useCallback((value) => {
    setCarouselIndexesByProduct((prev) => ({ ...prev, [shopProductId]: value }));
  }, [shopProductId]);

  const notifyToast = notifyToastProductId === shopProductId;

  const isActive = product?.status === "active";
  const isComingSoon = product?.status === "coming-soon";
  const needsSize = Boolean(product?.sizes?.length);
  const canAdd = Boolean(product && isActive && (!needsSize || selectedSize));
  const isWishlisted = Boolean(product && wishlist.includes(product.id));
  const isNotified = Boolean(product && notified.includes(product.id));
  const hasImages = Boolean(product?.images?.length);
  const carouselSlots = hasImages ? product.images.length : 3;

  const handleAddToCart = useCallback(() => {
    if (!product) return;
    addToCart(product, 1, selectedSize);
    setAddedProductId(product.id);
    setTimeout(() => {
      nav("shop-cart");
    }, 600);
  }, [addToCart, nav, product, selectedSize]);

  const handleQuickAdd = useCallback((nextProduct) => {
    if (nextProduct.status === "coming-soon") return;
    addToCart(nextProduct, 1, null);
    setAddedIds((prev) => ({ ...prev, [nextProduct.id]: true }));
    setTimeout(() => {
      setAddedIds((prev) => ({ ...prev, [nextProduct.id]: false }));
    }, 1200);
  }, [addToCart]);

  const similarItems = useMemo(() => {
    if (!product) return [];
    const sameCategory = catalogue.products.filter(
      (entry) => entry.id !== product.id && entry.category_id === product.category_id,
    );
    return sameCategory.length >= 2
      ? sameCategory
      : catalogue.products.filter((entry) => entry.id !== product.id);
  }, [catalogue.products, product]);

  const handleToggleNotify = useCallback(() => {
    if (!product) return;
    toggleNotify(product.id);
    if (!isNotified) {
      setNotifyToastProductId(product.id);
      setTimeout(() => setNotifyToastProductId(null), 2500);
    }
  }, [isNotified, product, toggleNotify]);

  const trustBadges = useMemo(() => ([
    { icon: "shield", label: "Secure Payment" },
    { icon: "truck", label: "Global Shipping" },
    { icon: "refresh", label: "Easy Returns" },
  ]), []);

  return {
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
  };
}
