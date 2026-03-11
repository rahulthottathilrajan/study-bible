-- ============================================================
-- THE BIBLE SCROLLERS — SECURITY HARDENING MIGRATION
-- ============================================================
-- Run this once in Supabase SQL Editor (Dashboard → SQL Editor)
-- This enables RLS and adds policies for all tables that were
-- missing coverage. Safe to run multiple times (IF NOT EXISTS).
-- ============================================================

-- ============================================================
-- 1. USER PROFILES
--    Created by Supabase auth trigger — RLS must be set manually
-- ============================================================
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;

-- Users can only read their own profile
DROP POLICY IF EXISTS "Users can view own profile" ON user_profiles;
CREATE POLICY "Users can view own profile" ON user_profiles
  FOR SELECT USING (auth.uid() = id);

-- Users can update their own profile
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
CREATE POLICY "Users can update own profile" ON user_profiles
  FOR UPDATE USING (auth.uid() = id);

-- Supabase auth trigger needs to INSERT new profiles
DROP POLICY IF EXISTS "Service can insert profiles" ON user_profiles;
CREATE POLICY "Service can insert profiles" ON user_profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- ============================================================
-- 2. USER HIGHLIGHTS
-- ============================================================
ALTER TABLE user_highlights ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users manage own highlights" ON user_highlights;
CREATE POLICY "Users manage own highlights" ON user_highlights
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- 3. USER NOTES
--    Private notes + public notes (is_public=true visible to all)
-- ============================================================
ALTER TABLE user_notes ENABLE ROW LEVEL SECURITY;

-- Users can always see their own notes
DROP POLICY IF EXISTS "Users can view own notes" ON user_notes;
CREATE POLICY "Users can view own notes" ON user_notes
  FOR SELECT USING (auth.uid() = user_id);

-- Anyone can view notes marked public by their author
DROP POLICY IF EXISTS "Anyone can view public notes" ON user_notes;
CREATE POLICY "Anyone can view public notes" ON user_notes
  FOR SELECT USING (is_public = true);

-- Users can insert their own notes
DROP POLICY IF EXISTS "Users can insert own notes" ON user_notes;
CREATE POLICY "Users can insert own notes" ON user_notes
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Users can update their own notes
DROP POLICY IF EXISTS "Users can update own notes" ON user_notes;
CREATE POLICY "Users can update own notes" ON user_notes
  FOR UPDATE USING (auth.uid() = user_id);

-- Users can delete their own notes
DROP POLICY IF EXISTS "Users can delete own notes" ON user_notes;
CREATE POLICY "Users can delete own notes" ON user_notes
  FOR DELETE USING (auth.uid() = user_id);

-- ============================================================
-- 4. PRAYER JOURNAL (private — never public)
-- ============================================================
ALTER TABLE prayer_journal ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users manage own prayer journal" ON prayer_journal;
CREATE POLICY "Users manage own prayer journal" ON prayer_journal
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- 5. USER READING POSITION
-- ============================================================
ALTER TABLE user_reading_position ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users manage own reading position" ON user_reading_position;
CREATE POLICY "Users manage own reading position" ON user_reading_position
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- 6. HEBREW CONTENT (public read-only — no user writes via client)
-- ============================================================
ALTER TABLE hebrew_lessons ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read hebrew_lessons" ON hebrew_lessons;
CREATE POLICY "Public read hebrew_lessons" ON hebrew_lessons
  FOR SELECT USING (true);

ALTER TABLE hebrew_alphabet ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read hebrew_alphabet" ON hebrew_alphabet;
CREATE POLICY "Public read hebrew_alphabet" ON hebrew_alphabet
  FOR SELECT USING (true);

ALTER TABLE hebrew_vocabulary ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read hebrew_vocabulary" ON hebrew_vocabulary;
CREATE POLICY "Public read hebrew_vocabulary" ON hebrew_vocabulary
  FOR SELECT USING (true);

-- ============================================================
-- 7. USER HEBREW PROGRESS
-- ============================================================
ALTER TABLE user_hebrew_progress ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users manage own hebrew progress" ON user_hebrew_progress;
CREATE POLICY "Users manage own hebrew progress" ON user_hebrew_progress
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- 8. GREEK CONTENT (public read-only)
-- ============================================================
ALTER TABLE greek_lessons ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read greek_lessons" ON greek_lessons;
CREATE POLICY "Public read greek_lessons" ON greek_lessons
  FOR SELECT USING (true);

ALTER TABLE greek_alphabet ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read greek_alphabet" ON greek_alphabet;
CREATE POLICY "Public read greek_alphabet" ON greek_alphabet
  FOR SELECT USING (true);

ALTER TABLE greek_vocabulary ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read greek_vocabulary" ON greek_vocabulary;
CREATE POLICY "Public read greek_vocabulary" ON greek_vocabulary
  FOR SELECT USING (true);

-- ============================================================
-- 9. USER GREEK PROGRESS
-- ============================================================
ALTER TABLE user_greek_progress ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users manage own greek progress" ON user_greek_progress;
CREATE POLICY "Users manage own greek progress" ON user_greek_progress
  FOR ALL USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================
-- 10. BIBLE TIMELINE (public read-only)
-- ============================================================
ALTER TABLE bible_timeline_eras ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read bible_timeline_eras" ON bible_timeline_eras;
CREATE POLICY "Public read bible_timeline_eras" ON bible_timeline_eras
  FOR SELECT USING (true);

ALTER TABLE bible_timeline_events ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Public read bible_timeline_events" ON bible_timeline_events;
CREATE POLICY "Public read bible_timeline_events" ON bible_timeline_events
  FOR SELECT USING (true);

-- ============================================================
-- 11. SUBSCRIPTIONS
--     Writes handled exclusively by server-side Stripe webhook
--     (uses service_role key which bypasses RLS).
--     Client (anon key) may only read its own row.
-- ============================================================
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own subscription" ON subscriptions;
CREATE POLICY "Users can view own subscription" ON subscriptions
  FOR SELECT USING (auth.uid() = user_id);

-- ============================================================
-- 12. SHOP ORDERS
--     Writes handled exclusively by server-side Stripe webhook.
--     Client may only read its own orders.
-- ============================================================
ALTER TABLE shop_orders ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Users can view own shop orders" ON shop_orders;
CREATE POLICY "Users can view own shop orders" ON shop_orders
  FOR SELECT USING (auth.uid() = user_id);

-- ============================================================
-- DONE. Verify in Security Advisor: Dashboard → Security Advisor
-- All tables should now show 0 RLS errors.
-- ============================================================
