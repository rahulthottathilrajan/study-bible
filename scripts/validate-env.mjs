const requiredByContext = {
  supabase: ["NEXT_PUBLIC_SUPABASE_URL", "SUPABASE_SERVICE_ROLE_KEY"],
  checkout: [
    "STRIPE_SECRET_KEY",
    "STRIPE_PRICE_MONTHLY",
    "STRIPE_PRICE_YEARLY",
    "STRIPE_PRICE_LIFETIME",
    "NEXT_PUBLIC_SITE_URL",
  ],
  donate: ["STRIPE_SECRET_KEY", "NEXT_PUBLIC_SITE_URL"],
  semanticSearch: ["GEMINI_API_KEY"],
};

const missing = Object.entries(requiredByContext)
  .map(([context, keys]) => ({
    context,
    missing: keys.filter((key) => !process.env[key]),
  }))
  .filter((entry) => entry.missing.length > 0);

if (missing.length > 0) {
  for (const entry of missing) {
    console.error(`[validate-env] Missing ${entry.context} vars: ${entry.missing.join(", ")}`);
  }
  process.exit(1);
}

console.info("[validate-env] All required environment variables are present.");
