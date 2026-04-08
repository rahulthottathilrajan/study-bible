import { NextResponse } from 'next/server';

// ── Simple in-memory rate limiter for payment endpoints ──────────────────────
// Uses a sliding window per IP. Note: this is per-serverless-instance.
// For production scale, upgrade to @upstash/ratelimit + @upstash/redis.
// ─────────────────────────────────────────────────────────────────────────────

const RATE_LIMITS = {
  '/api/checkout':        { limit: 10, windowMs: 60 * 60 * 1000 }, // 10/hour
  '/api/shop-checkout':   { limit: 10, windowMs: 60 * 60 * 1000 }, // 10/hour
  '/api/donate':          { limit: 20, windowMs: 60 * 60 * 1000 }, // 20/hour
};

// In-memory store: Map<key, { count, windowStart }>
const store = new Map();

function getRateKey(pathname, ip) {
  return `${pathname}::${ip}`;
}

function isRateLimited(pathname, ip) {
  const config = RATE_LIMITS[pathname];
  if (!config) return false;

  const now = Date.now();
  const key = getRateKey(pathname, ip);
  const entry = store.get(key);

  if (!entry || now - entry.windowStart > config.windowMs) {
    // New window
    store.set(key, { count: 1, windowStart: now });
    return false;
  }

  if (entry.count >= config.limit) {
    return true;
  }

  entry.count++;
  return false;
}

export function proxy(request) {
  const { pathname } = request.nextUrl;

  // Only apply to payment API routes
  if (!RATE_LIMITS[pathname]) {
    return NextResponse.next();
  }

  // Only apply to POST requests
  if (request.method !== 'POST') {
    return NextResponse.next();
  }

  const ip =
    request.headers.get('x-forwarded-for')?.split(',')[0].trim() ||
    request.headers.get('x-real-ip') ||
    'unknown';

  if (isRateLimited(pathname, ip)) {
    return new NextResponse(
      JSON.stringify({ error: 'Too many requests. Please try again later.' }),
      {
        status: 429,
        headers: {
          'Content-Type': 'application/json',
          'Retry-After': '3600',
        },
      }
    );
  }

  return NextResponse.next();
}

export const config = {
  matcher: ['/api/checkout', '/api/shop-checkout', '/api/donate'],
};
