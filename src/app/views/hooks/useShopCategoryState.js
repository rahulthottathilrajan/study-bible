"use client";

import { useCallback, useMemo, useState } from "react";

export function useShopCategoryState({ catalogue, shopCategory, addToCart }) {
  const cat = useMemo(
    () => catalogue.categories.find((category) => category.id === shopCategory),
    [catalogue.categories, shopCategory],
  );
  const allProducts = useMemo(
    () => catalogue.products.filter((product) => product.category_id === shopCategory),
    [catalogue.products, shopCategory],
  );

  const [sort, setSort] = useState("all");
  const [statusFilter, setStatusFilter] = useState("all");
  const [subFiltersByCategory, setSubFiltersByCategory] = useState({});
  const [addedIds, setAddedIds] = useState({});
  const subFilter = subFiltersByCategory[shopCategory] || "all";
  const setSubFilter = useCallback((value) => {
    setSubFiltersByCategory((prev) => ({ ...prev, [shopCategory]: value }));
  }, [shopCategory]);

  const handleQuickAdd = useCallback((product) => {
    if (product.status === "coming-soon") return;
    addToCart(product, 1, null);
    setAddedIds((prev) => ({ ...prev, [product.id]: true }));
    setTimeout(() => {
      setAddedIds((prev) => ({ ...prev, [product.id]: false }));
    }, 1200);
  }, [addToCart]);

  const subcategories = useMemo(() => {
    const categories = [];
    const seenSubs = new Set();
    allProducts.forEach((product) => {
      if (product.subcategory && !seenSubs.has(product.subcategory)) {
        seenSubs.add(product.subcategory);
        categories.push({ name: product.subcategory, emoji: product.emoji, colorBg: product.colorBg });
      }
    });
    return categories;
  }, [allProducts]);

  const sortedProducts = useMemo(() => {
    let nextProducts = allProducts;
    if (subFilter !== "all") nextProducts = nextProducts.filter((product) => product.subcategory === subFilter);
    if (statusFilter !== "all") nextProducts = nextProducts.filter((product) => product.status === statusFilter);
    if (sort === "price-asc") nextProducts = [...nextProducts].sort((a, b) => a.price_usd - b.price_usd);
    if (sort === "price-desc") nextProducts = [...nextProducts].sort((a, b) => b.price_usd - a.price_usd);
    return nextProducts;
  }, [allProducts, sort, statusFilter, subFilter]);

  return {
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
    sortOptions: [
      { id: "all", label: "All" },
      { id: "price-asc", label: "Price ↑" },
      { id: "price-desc", label: "Price ↓" },
    ],
    statusOptions: [
      { id: "all", label: "All" },
      { id: "active", label: "Available" },
      { id: "coming-soon", label: "Coming Soon" },
    ],
  };
}
