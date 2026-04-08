import { readFile } from "node:fs/promises";
import path from "node:path";

let cachedCatalogue = null;

async function readCatalogueFile() {
  const cataloguePath = path.join(process.cwd(), "public", "data", "shop-catalogue.json");
  const raw = await readFile(cataloguePath, "utf8");
  return JSON.parse(raw);
}

export async function loadShopCatalogue() {
  if (!cachedCatalogue) {
    cachedCatalogue = await readCatalogueFile();
  }
  return cachedCatalogue;
}

function normalizeCartEntry(entry) {
  if (!entry || typeof entry !== "object") {
    return { productId: null, qty: NaN, size: null };
  }

  const productId = typeof entry.productId === "string"
    ? entry.productId
    : typeof entry.product?.id === "string"
      ? entry.product.id
      : null;

  const size = typeof entry.size === "string" ? entry.size.trim() : null;
  const qty = Number(entry.qty);

  return { productId, qty, size: size || null };
}

function validateSize(product, size) {
  const supportedSizes = Array.isArray(product.sizes) ? product.sizes : [];

  if (supportedSizes.length === 0) {
    return size ? { ok: false, error: `Product ${product.id} does not support size selection` } : { ok: true, size: null };
  }

  if (!size) {
    return { ok: false, error: `Product ${product.id} requires a size` };
  }

  if (!supportedSizes.includes(size)) {
    return { ok: false, error: `Invalid size for product ${product.id}` };
  }

  return { ok: true, size };
}

export async function normalizeShopCart(cart) {
  if (!Array.isArray(cart) || cart.length === 0) {
    return { items: [], error: "Cart is required" };
  }

  if (cart.length > 50) {
    return { items: [], error: "Cart too large" };
  }

  const catalogue = await loadShopCatalogue();
  const products = new Map((catalogue.products || []).map((product) => [product.id, product]));
  const items = [];

  for (const rawEntry of cart) {
    const entry = normalizeCartEntry(rawEntry);
    if (!entry.productId) {
      return { items: [], error: "Each cart item must include a productId" };
    }

    const product = products.get(entry.productId);
    if (!product || product.status !== "active") {
      return { items: [], error: `Unknown or unavailable product: ${entry.productId}` };
    }

    if (!Number.isFinite(entry.qty) || entry.qty < 1) {
      return { items: [], error: `Invalid quantity for product ${entry.productId}` };
    }

    const safeQty = Math.min(Math.floor(entry.qty), 99);
    const sizeCheck = validateSize(product, entry.size);
    if (!sizeCheck.ok) {
      return { items: [], error: sizeCheck.error };
    }

    items.push({
      productId: product.id,
      qty: safeQty,
      size: sizeCheck.size,
      product: {
        id: product.id,
        name: product.name,
        tagline: product.tagline || product.name,
        price_usd: product.price_usd,
        category_id: product.category_id,
        fulfillment: product.fulfillment,
      },
    });
  }

  return { items, error: null };
}
