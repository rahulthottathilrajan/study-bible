import test from "node:test";
import assert from "node:assert/strict";
import { normalizeShopCart } from "../../src/lib/server/shop-catalog.js";

test("normalizeShopCart resolves authoritative product data", async () => {
  const { items, error } = await normalizeShopCart([
    {
      productId: "white-tee-001",
      qty: 2,
      size: "M",
      product: { name: "Tampered", price_usd: 0.01 },
    },
  ]);

  assert.equal(error, null);
  assert.equal(items.length, 1);
  assert.equal(items[0].product.name, "The Scrollers White Tee");
  assert.equal(items[0].product.price_usd, 24.99);
  assert.equal(items[0].qty, 2);
  assert.equal(items[0].size, "M");
});

test("normalizeShopCart supports legacy payloads but rejects invalid sizes", async () => {
  const { error } = await normalizeShopCart([
    {
      product: { id: "white-tee-001" },
      qty: 1,
      size: "XXXL",
    },
  ]);

  assert.match(error, /Invalid size/);
});

test("normalizeShopCart rejects unavailable products", async () => {
  const { error } = await normalizeShopCart([{ productId: "missing-product", qty: 1 }]);
  assert.match(error, /Unknown or unavailable product/);
});
