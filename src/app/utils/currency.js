// ── Currency utilities ─────────────────────────────────────────────────────────
// Auto-detects the user's likely currency from their browser timezone.
// No external API — instant, private, zero cost.

export const SUPPORTED_CURRENCIES = {
  AED: { symbol: "AED", name: "UAE Dirham",        flag: "🇦🇪", tiers: [10, 20, 30, 50, 100] },
  USD: { symbol: "USD", name: "US Dollar",          flag: "🇺🇸", tiers: [3, 5, 10, 25, 50]   },
  GBP: { symbol: "£",   name: "British Pound",      flag: "🇬🇧", tiers: [2, 5, 8, 20, 40]    },
  EUR: { symbol: "€",   name: "Euro",               flag: "🇪🇺", tiers: [3, 5, 10, 20, 50]   },
  AUD: { symbol: "A$",  name: "Australian Dollar",  flag: "🇦🇺", tiers: [5, 10, 15, 25, 50]  },
  CAD: { symbol: "C$",  name: "Canadian Dollar",    flag: "🇨🇦", tiers: [5, 10, 15, 25, 50]  },
  INR: { symbol: "₹",   name: "Indian Rupee",       flag: "🇮🇳", tiers: [100, 200, 500, 1000, 2000] },
  SGD: { symbol: "S$",  name: "Singapore Dollar",   flag: "🇸🇬", tiers: [5, 10, 15, 25, 50]  },
};

// Timezone prefix/exact match → currency code
const TZ_MAP = [
  ["Asia/Dubai",      "AED"],
  ["Asia/Muscat",     "AED"],
  ["Asia/Kolkata",    "INR"],
  ["Asia/Calcutta",   "INR"],
  ["Asia/Colombo",    "INR"],
  ["Asia/Dhaka",      "INR"],
  ["Asia/Karachi",    "INR"],
  ["Asia/Singapore",  "SGD"],
  ["Asia/Kuala",      "SGD"],  // Kuala_Lumpur / Kuching
  ["Australia/",      "AUD"],  // any Australian tz
  ["Pacific/Auckland","AUD"],
  ["Pacific/Sydney",  "AUD"],
  ["Europe/London",   "GBP"],
  ["Europe/Dublin",   "GBP"],
  ["America/Toronto", "CAD"],
  ["America/Vancouv", "CAD"],
  ["America/Winnipeg","CAD"],
  ["America/Halifax", "CAD"],
  ["America/Regina",  "CAD"],
  ["America/Edmonton","CAD"],
  ["America/",        "USD"],  // all other Americas → USD (US, LATAM, Caribbean)
  ["Europe/",         "EUR"],  // all other European tz
  ["Atlantic/",       "EUR"],
];

/**
 * Returns a currency code (e.g. "AED") based on the browser's timezone.
 * Falls back to "USD" if the timezone is unrecognised.
 */
export function detectCurrency() {
  try {
    const tz = Intl.DateTimeFormat().resolvedOptions().timeZone || "";
    for (const [prefix, code] of TZ_MAP) {
      if (tz.startsWith(prefix)) return code;
    }
  } catch {}
  return "USD";
}

/**
 * Format an amount for display: symbol + amount (no decimals for whole numbers,
 * 2 decimals otherwise). Handles currencies like INR where the symbol precedes.
 */
export function formatAmount(amount, currencyCode) {
  const cfg = SUPPORTED_CURRENCIES[currencyCode];
  if (!cfg) return `${currencyCode} ${amount}`;
  const sym = cfg.symbol;
  const val = Number.isInteger(amount) ? amount : amount.toFixed(2);
  // AED and SGD/CAD/AUD use "CODE amount" format; £€$ use symbol prefix
  if (["AED", "CAD", "AUD", "SGD"].includes(currencyCode)) return `${sym} ${val}`;
  return `${sym}${val}`;
}
