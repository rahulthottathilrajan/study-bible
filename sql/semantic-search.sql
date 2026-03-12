-- ============================================================
-- SEMANTIC SEARCH — pgvector setup
-- ============================================================
-- Run in Supabase SQL Editor (Dashboard -> SQL Editor)
-- Safe to run multiple times (IF NOT EXISTS / CREATE OR REPLACE)
-- ============================================================

-- 1. Enable the vector extension
CREATE EXTENSION IF NOT EXISTS vector;

-- 2. Create verse_embeddings table
CREATE TABLE IF NOT EXISTS verse_embeddings (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  verse_ref text UNIQUE NOT NULL,
  kjv_text text NOT NULL,
  embedding vector(768) NOT NULL
);

-- 3. Create HNSW index for fast cosine similarity search
CREATE INDEX IF NOT EXISTS verse_embeddings_embedding_idx
  ON verse_embeddings
  USING hnsw (embedding vector_cosine_ops)
  WITH (m = 16, ef_construction = 64);

-- 4. Create index on verse_ref for direct lookups
CREATE INDEX IF NOT EXISTS verse_embeddings_ref_idx
  ON verse_embeddings (verse_ref);

-- 5. RPC: match_verses — for semantic search queries
CREATE OR REPLACE FUNCTION match_verses(
  query_embedding vector(768),
  match_count int DEFAULT 20,
  similarity_threshold float DEFAULT 0.5
)
RETURNS TABLE(
  verse_ref text,
  kjv_text text,
  similarity float
)
LANGUAGE plpgsql STABLE
SET search_path = 'public'
AS $$
BEGIN
  RETURN QUERY
  SELECT
    ve.verse_ref,
    ve.kjv_text,
    (1 - (ve.embedding <=> query_embedding))::float AS similarity
  FROM verse_embeddings ve
  WHERE (1 - (ve.embedding <=> query_embedding)) > similarity_threshold
  ORDER BY ve.embedding <=> query_embedding
  LIMIT match_count;
END;
$$;

-- 6. RPC: find_similar_verses — for "Similar Verses" in VerseStudy
CREATE OR REPLACE FUNCTION find_similar_verses(
  target_ref text,
  match_count int DEFAULT 5
)
RETURNS TABLE(
  verse_ref text,
  kjv_text text,
  similarity float
)
LANGUAGE plpgsql STABLE
SET search_path = 'public'
AS $$
BEGIN
  RETURN QUERY
  SELECT
    ve.verse_ref,
    ve.kjv_text,
    (1 - (ve.embedding <=> target.embedding))::float AS similarity
  FROM verse_embeddings ve
  CROSS JOIN (
    SELECT embedding FROM verse_embeddings WHERE verse_embeddings.verse_ref = target_ref
  ) target
  WHERE ve.verse_ref != target_ref
  ORDER BY ve.embedding <=> target.embedding
  LIMIT match_count;
END;
$$;

-- 7. RLS: verse_embeddings is read-only public data
ALTER TABLE verse_embeddings ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public read access for verse embeddings" ON verse_embeddings;
CREATE POLICY "Public read access for verse embeddings" ON verse_embeddings
  FOR SELECT USING (true);

-- No INSERT/UPDATE/DELETE policies — only service role can write
