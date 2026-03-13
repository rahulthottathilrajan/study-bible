// ═══════════════════════════════════════════════════
// KJV Study Bible — Service Worker
// ═══════════════════════════════════════════════════
// Strategies:
//   Navigation (HTML)      → Cache-first (app shell)
//   Supabase API GET       → Network-first + data cache fallback
//   Next.js static assets  → Stale-while-revalidate
//   Everything else        → Network-only

const SHELL_CACHE  = "bible-shell-v2";
const DATA_CACHE   = "bible-data-v2";
const STATIC_CACHE = "bible-static-v2";
const ALL_CACHES   = [SHELL_CACHE, DATA_CACHE, STATIC_CACHE];

// ── Install: pre-cache the app shell ──────────────
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(SHELL_CACHE)
      .then((cache) => cache.add("/"))
      .then(() => self.skipWaiting())
  );
});

// ── Activate: remove stale caches ─────────────────
self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys()
      .then((keys) =>
        Promise.all(
          keys
            .filter((k) => !ALL_CACHES.includes(k))
            .map((k) => caches.delete(k))
        )
      )
      .then(() => self.clients.claim())
  );
});

// ── Fetch ──────────────────────────────────────────
self.addEventListener("fetch", (event) => {
  const { request } = event;
  const url = new URL(request.url);

  // Only intercept GET requests — let POST/PUT (auth, notes, highlights) go direct
  if (request.method !== "GET") return;

  // Supabase API calls → network-first, fall back to cached verse data
  if (url.hostname.includes("supabase.co")) {
    event.respondWith(networkFirst(request, DATA_CACHE));
    return;
  }

  // Same-origin navigation → serve cached shell, refresh in background
  if (request.mode === "navigate") {
    event.respondWith(
      caches.match("/").then((cached) => {
        const networkFetch = fetch(request).then((res) => {
          if (res.ok) {
            caches.open(SHELL_CACHE).then((c) => c.put("/", res.clone()));
          }
          return res;
        });
        return cached || networkFetch;
      })
    );
    return;
  }

  // Next.js static assets (/_next/…) → stale-while-revalidate
  if (url.pathname.startsWith("/_next/")) {
    event.respondWith(staleWhileRevalidate(request, STATIC_CACHE));
    return;
  }

  // All other same-origin requests (fonts, images, etc.) → stale-while-revalidate
  if (url.origin === self.location.origin) {
    event.respondWith(staleWhileRevalidate(request, STATIC_CACHE));
  }
  // Cross-origin (CDNs, analytics) → network-only (fall through)
});

// ── Strategy helpers ───────────────────────────────

async function networkFirst(request, cacheName) {
  try {
    const response = await fetch(request);
    if (response.ok) {
      const cache = await caches.open(cacheName);
      cache.put(request, response.clone());
    }
    return response;
  } catch {
    const cached = await caches.match(request);
    return cached || new Response(
      JSON.stringify({ error: "Offline — no cached data available" }),
      { status: 503, headers: { "Content-Type": "application/json" } }
    );
  }
}

async function staleWhileRevalidate(request, cacheName) {
  const cache = await caches.open(cacheName);
  const cached = await cache.match(request);

  const networkPromise = fetch(request)
    .then((res) => {
      if (res.ok) cache.put(request, res.clone());
      return res;
    })
    .catch(() => cached);

  return cached || networkPromise;
}
