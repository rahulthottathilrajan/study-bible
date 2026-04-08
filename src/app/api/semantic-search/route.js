import { getRequiredEnvForContext } from "../../../lib/server/env";
import { logServerError, logServerEvent } from "../../../lib/server/logging";
import { createSupabaseAdmin, requireAuthenticatedUser } from "../../../lib/server/supabase-admin";

export const dynamic = "force-dynamic";

const queryCache = new Map();
const CACHE_TTL = 5 * 60 * 1000;
const MAX_CACHE_SIZE = 200;

export async function POST(request) {
  getRequiredEnvForContext("semanticSearch");
  getRequiredEnvForContext("supabase");
  const supabaseAdmin = createSupabaseAdmin();

  const { user, error: authError } = await requireAuthenticatedUser(request, supabaseAdmin);
  if (authError || !user) {
    return Response.json({ error: "Sign in required for semantic Bible search" }, { status: 401 });
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid request body" }, { status: 400 });
  }

  const { query, include_podcasts } = body;
  if (!query || typeof query !== "string" || query.trim().length < 3) {
    return Response.json({ error: "Query must be at least 3 characters" }, { status: 400 });
  }

  const normalizedQuery = query.trim().toLowerCase();
  const cacheKey = include_podcasts ? `${normalizedQuery}:+p` : normalizedQuery;
  const userCacheKey = `${user.id}:${cacheKey}`;
  const cached = queryCache.get(userCacheKey);

  if (cached && Date.now() - cached.ts < CACHE_TTL) {
    return Response.json({ results: cached.results, podcasts: cached.podcasts || [] });
  }

  try {
    logServerEvent("semantic_search_requested", {
      userId: user.id,
      includePodcasts: Boolean(include_podcasts),
      queryLength: normalizedQuery.length,
    });

    const embResponse = await fetch(
      `https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-001:embedContent?key=${process.env.GEMINI_API_KEY}`,
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          model: "models/gemini-embedding-001",
          content: { parts: [{ text: query.trim() }] },
          taskType: "RETRIEVAL_QUERY",
          outputDimensionality: 768,
        }),
      }
    );

    if (!embResponse.ok) {
      logServerError("semantic_search_gemini_error", new Error(`status:${embResponse.status}`), { userId: user.id });
      return Response.json({ error: "Search service temporarily unavailable" }, { status: 503 });
    }

    const embData = await embResponse.json();
    const embedding = embData.embedding?.values;
    if (!embedding || !embedding.length) {
      logServerError("semantic_search_embedding_error", new Error("Missing embedding values"), { userId: user.id });
      return Response.json({ error: "Failed to process search query" }, { status: 500 });
    }

    const { data, error } = await supabaseAdmin.rpc("match_verses", {
      query_embedding: JSON.stringify(embedding),
      match_count: 20,
      similarity_threshold: 0.5,
    });

    if (error) {
      logServerError("semantic_search_rpc_error", error, { userId: user.id });
      return Response.json({ error: "Search failed" }, { status: 500 });
    }

    const results = (data || []).map((row) => ({
      verse_ref: row.verse_ref,
      kjv_text: row.kjv_text,
      similarity: Math.round(row.similarity * 100) / 100,
    }));

    let podcasts = [];
    if (include_podcasts) {
      const { data: podData, error: podError } = await supabaseAdmin.rpc("match_podcasts", {
        query_embedding: JSON.stringify(embedding),
        match_count: 5,
        similarity_threshold: 0.5,
      });

      if (podError) {
        logServerError("semantic_search_podcast_rpc_error", podError, { userId: user.id });
      } else {
        podcasts = (podData || []).map((row) => ({
          episode_ref: row.episode_ref,
          title: row.title,
          description: row.description,
          series_slug: row.series_slug,
          episode_number: row.episode_number,
          similarity: Math.round(row.similarity * 100) / 100,
        }));
      }
    }

    if (queryCache.size >= MAX_CACHE_SIZE) {
      const oldest = queryCache.keys().next().value;
      queryCache.delete(oldest);
    }
    queryCache.set(userCacheKey, { results, podcasts, ts: Date.now() });

    return Response.json({ results, podcasts });
  } catch (searchError) {
    logServerError("semantic_search_error", searchError, { userId: user.id });
    return Response.json({ error: "Something went wrong" }, { status: 500 });
  }
}
