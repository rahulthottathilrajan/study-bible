-- ============================================================
-- VOTD ENGAGEMENT TRACKING
-- ============================================================
-- Run in Supabase SQL Editor (Dashboard -> SQL Editor)
-- Safe to run multiple times (IF NOT EXISTS / CREATE OR REPLACE)
-- ============================================================

-- 1. Aggregate counters table (one row per verse_ref)
CREATE TABLE IF NOT EXISTS votd_counters (
  verse_ref TEXT PRIMARY KEY,
  like_count BIGINT NOT NULL DEFAULT 0,
  share_count BIGINT NOT NULL DEFAULT 0
);

ALTER TABLE votd_counters ENABLE ROW LEVEL SECURITY;

-- Anyone can read counters (for displaying counts)
DROP POLICY IF EXISTS "Anyone can view VOTD counters" ON votd_counters;
CREATE POLICY "Anyone can view VOTD counters"
  ON votd_counters FOR SELECT
  USING (true);

-- No direct INSERT/UPDATE/DELETE policies — all writes go through RPC


-- 2. Per-user like tracking (for heart toggle persistence)
CREATE TABLE IF NOT EXISTS votd_user_likes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  verse_ref TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (user_id, verse_ref)
);

CREATE INDEX IF NOT EXISTS idx_votd_user_likes_user ON votd_user_likes (user_id);
CREATE INDEX IF NOT EXISTS idx_votd_user_likes_ref ON votd_user_likes (verse_ref);

ALTER TABLE votd_user_likes ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own VOTD likes" ON votd_user_likes;
CREATE POLICY "Users can view own VOTD likes"
  ON votd_user_likes FOR SELECT
  USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can insert own VOTD likes" ON votd_user_likes;
CREATE POLICY "Users can insert own VOTD likes"
  ON votd_user_likes FOR INSERT
  WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own VOTD likes" ON votd_user_likes;
CREATE POLICY "Users can delete own VOTD likes"
  ON votd_user_likes FOR DELETE
  USING (auth.uid() = user_id);


-- 3. RPC: Increment like count (atomic upsert)
CREATE OR REPLACE FUNCTION increment_votd_like(target_ref TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = 'public'
AS $$
BEGIN
  INSERT INTO votd_counters (verse_ref, like_count, share_count)
  VALUES (target_ref, 1, 0)
  ON CONFLICT (verse_ref)
  DO UPDATE SET like_count = votd_counters.like_count + 1;
END;
$$;

-- 4. RPC: Decrement like count (floor at 0)
CREATE OR REPLACE FUNCTION decrement_votd_like(target_ref TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = 'public'
AS $$
BEGIN
  UPDATE votd_counters
  SET like_count = GREATEST(like_count - 1, 0)
  WHERE verse_ref = target_ref;
END;
$$;

-- 5. RPC: Increment share count
CREATE OR REPLACE FUNCTION increment_votd_share(target_ref TEXT)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = 'public'
AS $$
BEGIN
  INSERT INTO votd_counters (verse_ref, like_count, share_count)
  VALUES (target_ref, 0, 1)
  ON CONFLICT (verse_ref)
  DO UPDATE SET share_count = votd_counters.share_count + 1;
END;
$$;
