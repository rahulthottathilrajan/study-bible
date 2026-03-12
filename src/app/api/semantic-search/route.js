export const dynamic = 'force-dynamic';

// Server-side cache for repeated queries (survives across requests in same instance)
const queryCache = new Map();
const CACHE_TTL = 5 * 60 * 1000; // 5 minutes
const MAX_CACHE_SIZE = 200;

export async function POST(request) {
  const { createClient } = await import('@supabase/supabase-js');

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: 'Invalid request body' }, { status: 400 });
  }

  const { query, include_podcasts } = body;
  if (!query || typeof query !== 'string' || query.trim().length < 3) {
    return Response.json({ error: 'Query must be at least 3 characters' }, { status: 400 });
  }

  const normalizedQuery = query.trim().toLowerCase();

  const cacheKey = include_podcasts ? `${normalizedQuery}:+p` : normalizedQuery;

  // Check cache
  const cached = queryCache.get(cacheKey);
  if (cached && Date.now() - cached.ts < CACHE_TTL) {
    return Response.json({ results: cached.results, podcasts: cached.podcasts || [] });
  }

  try {
    // 1. Embed the query using Gemini
    const embResponse = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent?key=${process.env.GEMINI_API_KEY}`,
      {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          model: 'models/gemini-embedding-001',
          content: { parts: [{ text: query.trim() }] },
          taskType: 'RETRIEVAL_QUERY',
          outputDimensionality: 768,
        }),
      }
    );

    if (!embResponse.ok) {
      console.error('[semantic-search] Gemini error:', embResponse.status, await embResponse.text());
      return Response.json({ error: 'Search service temporarily unavailable' }, { status: 503 });
    }

    const embData = await embResponse.json();
    const embedding = embData.embedding?.values;
    if (!embedding || !embedding.length) {
      console.error('[semantic-search] Unexpected embedding dimensions:', embedding?.length);
      return Response.json({ error: 'Failed to process search query' }, { status: 500 });
    }

    // 2. Query Supabase pgvector via RPC
    const supabaseAdmin = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL,
      process.env.SUPABASE_SERVICE_ROLE_KEY
    );

    const { data, error } = await supabaseAdmin.rpc('match_verses', {
      query_embedding: JSON.stringify(embedding),
      match_count: 20,
      similarity_threshold: 0.5,
    });

    if (error) {
      console.error('[semantic-search] Supabase RPC error:', error);
      return Response.json({ error: 'Search failed' }, { status: 500 });
    }

    const results = (data || []).map(r => ({
      verse_ref: r.verse_ref,
      kjv_text: r.kjv_text,
      similarity: Math.round(r.similarity * 100) / 100,
    }));

    // 3. Optionally search podcast embeddings
    let podcasts = [];
    if (include_podcasts) {
      const { data: podData, error: podError } = await supabaseAdmin.rpc('match_podcasts', {
        query_embedding: JSON.stringify(embedding),
        match_count: 5,
        similarity_threshold: 0.5,
      });

      if (podError) {
        console.error('[semantic-search] Podcast RPC error:', podError);
      } else {
        podcasts = (podData || []).map(r => ({
          episode_ref: r.episode_ref,
          title: r.title,
          description: r.description,
          series_slug: r.series_slug,
          episode_number: r.episode_number,
          similarity: Math.round(r.similarity * 100) / 100,
        }));
      }
    }

    // Cache results
    if (queryCache.size >= MAX_CACHE_SIZE) {
      const oldest = queryCache.keys().next().value;
      queryCache.delete(oldest);
    }
    queryCache.set(cacheKey, { results, podcasts, ts: Date.now() });

    return Response.json({ results, podcasts });
  } catch (err) {
    console.error('[semantic-search] Error:', err);
    return Response.json({ error: 'Something went wrong' }, { status: 500 });
  }
}
