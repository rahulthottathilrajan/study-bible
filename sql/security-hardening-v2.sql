-- ============================================================
-- THE BIBLE SCROLLERS — SECURITY HARDENING v2
-- ============================================================
-- Fixes remaining RLS policy gaps identified in security audit.
-- Also adds UNIQUE constraint on shop_orders for idempotency.
-- Safe to run multiple times (DROP POLICY IF EXISTS).
-- ============================================================

-- ============================================================
-- 1. USER PROFILES — add missing DELETE policy
-- ============================================================
DROP POLICY IF EXISTS "Users can delete own profile" ON user_profiles;
CREATE POLICY "Users can delete own profile" ON user_profiles
  FOR DELETE USING (auth.uid() = id);

-- ============================================================
-- 2. USER QUIZ SCORES — add missing UPDATE + DELETE policies
-- ============================================================
DROP POLICY IF EXISTS "Users can update own quiz scores" ON user_quiz_scores;
CREATE POLICY "Users can update own quiz scores" ON user_quiz_scores
  FOR UPDATE USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own quiz scores" ON user_quiz_scores;
CREATE POLICY "Users can delete own quiz scores" ON user_quiz_scores
  FOR DELETE USING (auth.uid() = user_id);

-- ============================================================
-- 3. USER BADGES — add missing UPDATE + DELETE policies
-- ============================================================
DROP POLICY IF EXISTS "Users can update own badges" ON user_badges;
CREATE POLICY "Users can update own badges" ON user_badges
  FOR UPDATE USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can delete own badges" ON user_badges;
CREATE POLICY "Users can delete own badges" ON user_badges
  FOR DELETE USING (auth.uid() = user_id);

-- ============================================================
-- 4. USER CHAPTER READS — add missing UPDATE policy
-- ============================================================
DROP POLICY IF EXISTS "Users can update own reads" ON user_chapter_reads;
CREATE POLICY "Users can update own reads" ON user_chapter_reads
  FOR UPDATE USING (auth.uid() = user_id);

-- ============================================================
-- 5. COMMUNITY PRAYERS — restrict SELECT to authenticated users
--    Prevents unauthenticated scraping of all prayer data
-- ============================================================
DROP POLICY IF EXISTS "Anyone can view community prayers" ON community_prayers;
DROP POLICY IF EXISTS "Auth users can view community prayers" ON community_prayers;
CREATE POLICY "Auth users can view community prayers" ON community_prayers
  FOR SELECT USING (auth.uid() IS NOT NULL);

-- ============================================================
-- 6. SHOP ORDERS — add UNIQUE constraint for webhook idempotency
--    Prevents duplicate orders if Stripe retransmits an event
-- ============================================================
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'shop_orders_session_unique'
  ) THEN
    ALTER TABLE shop_orders
      ADD CONSTRAINT shop_orders_session_unique UNIQUE (stripe_session_id);
  END IF;
END $$;

-- ============================================================
-- DONE. Run this in Supabase SQL Editor.
-- Verify: Security Advisor should show 0 errors / 0 warnings.
-- ============================================================
