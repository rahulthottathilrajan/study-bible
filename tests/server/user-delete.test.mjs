import test from "node:test";
import assert from "node:assert/strict";
import { deleteUserData, USER_DELETE_TABLES } from "../../src/lib/server/user-delete.js";

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

test("deleteUserData deletes every configured table", async () => {
  const result = await deleteUserData(createDeleteClient(), "user-1");
  assert.equal(result.ok, true);
  assert.equal(result.table, null);
  assert.equal(USER_DELETE_TABLES.length > 0, true);
});

test("deleteUserData stops on the first failure", async () => {
  const result = await deleteUserData(createDeleteClient("shop_orders"), "user-1");
  assert.equal(result.ok, false);
  assert.equal(result.table, "shop_orders");
  assert.match(result.error.message, /failed:shop_orders/);
});
