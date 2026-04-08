import assert from "node:assert/strict";
import { getRequiredEnv } from "../../src/lib/server/env.js";
import { normalizeShopCart } from "../../src/lib/server/shop-catalog.js";
import { deleteUserData, USER_DELETE_TABLES } from "../../src/lib/server/user-delete.js";

function ok(name) {
  console.info(`ok - ${name}`);
}

function createDeleteClient(failingTable = null) {
  return {
    from(table) {
      return {
        delete() {
          return {
            async eq() {
              if (failingTable === table) {
                return { error: new Error(`failed:${table}`) };
              }
              return { error: null };
            },
          };
        },
      };
    },
  };
}

async function run() {
  const values = getRequiredEnv(["FOO", "BAZ"], {
    env: { FOO: "bar", BAZ: "qux" },
    context: "test",
  });
  assert.deepEqual(values, { FOO: "bar", BAZ: "qux" });
  ok("getRequiredEnv returns requested values");

  assert.throws(
    () => getRequiredEnv(["FOO", "MISSING"], { env: { FOO: "bar" }, context: "test" }),
    /Missing required environment variables for test: MISSING/
  );
  ok("getRequiredEnv throws when values are missing");

  const normalized = await normalizeShopCart([
    {
      productId: "white-tee-001",
      qty: 2,
      size: "M",
      product: { name: "Tampered", price_usd: 0.01 },
    },
  ]);
  assert.equal(normalized.error, null);
  assert.equal(normalized.items[0].product.name, "The Scrollers White Tee");
  assert.equal(normalized.items[0].product.price_usd, 24.99);
  ok("normalizeShopCart resolves authoritative product data");

  const invalidSize = await normalizeShopCart([
    { product: { id: "white-tee-001" }, qty: 1, size: "XXXL" },
  ]);
  assert.match(invalidSize.error, /Invalid size/);
  ok("normalizeShopCart rejects invalid sizes");

  const missingProduct = await normalizeShopCart([{ productId: "missing-product", qty: 1 }]);
  assert.match(missingProduct.error, /Unknown or unavailable product/);
  ok("normalizeShopCart rejects unavailable products");

  const deleteSuccess = await deleteUserData(createDeleteClient(), "user-1");
  assert.equal(deleteSuccess.ok, true);
  assert.equal(USER_DELETE_TABLES.length > 0, true);
  ok("deleteUserData deletes every configured table");

  const deleteFailure = await deleteUserData(createDeleteClient("shop_orders"), "user-1");
  assert.equal(deleteFailure.ok, false);
  assert.equal(deleteFailure.table, "shop_orders");
  assert.match(deleteFailure.error.message, /failed:shop_orders/);
  ok("deleteUserData stops on the first failure");
}

run().catch((error) => {
  console.error("not ok - test run failed");
  console.error(error);
  process.exit(1);
});
