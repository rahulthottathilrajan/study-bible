import test from "node:test";
import assert from "node:assert/strict";
import { getRequiredEnv } from "../../src/lib/server/env.js";

test("getRequiredEnv returns requested values", () => {
  const env = { FOO: "bar", BAZ: "qux" };
  const values = getRequiredEnv(["FOO", "BAZ"], { env, context: "test" });
  assert.deepEqual(values, { FOO: "bar", BAZ: "qux" });
});

test("getRequiredEnv throws when values are missing", () => {
  assert.throws(
    () => getRequiredEnv(["FOO", "MISSING"], { env: { FOO: "bar" }, context: "test" }),
    /Missing required environment variables for test: MISSING/
  );
});
