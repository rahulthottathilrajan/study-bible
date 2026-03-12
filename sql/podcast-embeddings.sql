-- ============================================================
-- PODCAST EMBEDDINGS — pgvector setup for podcast discovery
-- ============================================================
-- Run in Supabase SQL Editor (Dashboard -> SQL Editor)
-- Safe to run multiple times (IF NOT EXISTS / CREATE OR REPLACE)
-- ============================================================

-- 1. Create podcast_embeddings table
CREATE TABLE IF NOT EXISTS podcast_embeddings (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  episode_ref text UNIQUE NOT NULL,
  title text NOT NULL,
  description text NOT NULL,
  content_text text NOT NULL,
  series_slug text NOT NULL,
  episode_number int NOT NULL,
  embedding vector(768) NOT NULL
);

-- 2. Create HNSW index for fast cosine similarity search
CREATE INDEX IF NOT EXISTS podcast_embeddings_embedding_idx
  ON podcast_embeddings
  USING hnsw (embedding vector_cosine_ops)
  WITH (m = 16, ef_construction = 64);

-- 3. Create index on episode_ref for direct lookups
CREATE INDEX IF NOT EXISTS podcast_embeddings_ref_idx
  ON podcast_embeddings (episode_ref);

-- 4. RPC: match_podcasts — for semantic podcast search
CREATE OR REPLACE FUNCTION match_podcasts(
  query_embedding vector(768),
  match_count int DEFAULT 3,
  similarity_threshold float DEFAULT 0.5
)
RETURNS TABLE(
  episode_ref text,
  title text,
  description text,
  series_slug text,
  episode_number int,
  similarity float
)
LANGUAGE plpgsql STABLE
SET search_path = 'public'
AS $$
BEGIN
  RETURN QUERY
  SELECT
    pe.episode_ref,
    pe.title,
    pe.description,
    pe.series_slug,
    pe.episode_number,
    (1 - (pe.embedding <=> query_embedding))::float AS similarity
  FROM podcast_embeddings pe
  WHERE (1 - (pe.embedding <=> query_embedding)) > similarity_threshold
  ORDER BY pe.embedding <=> query_embedding
  LIMIT match_count;
END;
$$;

-- 5. RLS: podcast_embeddings is read-only public data
ALTER TABLE podcast_embeddings ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public read access for podcast embeddings" ON podcast_embeddings;
CREATE POLICY "Public read access for podcast embeddings" ON podcast_embeddings
  FOR SELECT USING (true);

-- No INSERT/UPDATE/DELETE policies — only service role can write
