const REQUIRED_ENV_BY_CONTEXT = {
  supabase: [
    "NEXT_PUBLIC_SUPABASE_URL",
    "SUPABASE_SERVICE_ROLE_KEY",
  ],
  stripe: [
    "STRIPE_SECRET_KEY",
    "NEXT_PUBLIC_SITE_URL",
  ],
  semanticSearch: [
    "GEMINI_API_KEY",
  ],
};

export function getRequiredEnv(keys, options = {}) {
  const env = options.env || process.env;
  const missing = keys.filter((key) => !env[key]);

  if (missing.length > 0) {
    const context = options.context ? ` for ${options.context}` : "";
    throw new Error(`Missing required environment variables${context}: ${missing.join(", ")}`);
  }

  return Object.fromEntries(keys.map((key) => [key, env[key]]));
}

export function getRequiredEnvForContext(context, options = {}) {
  const keys = REQUIRED_ENV_BY_CONTEXT[context] || [];
  return getRequiredEnv(keys, { ...options, context });
}

export function getRequiredStripePrices(options = {}) {
  return getRequiredEnv(
    ["STRIPE_PRICE_MONTHLY", "STRIPE_PRICE_YEARLY", "STRIPE_PRICE_LIFETIME"],
    { ...options, context: "stripe-prices" }
  );
}
