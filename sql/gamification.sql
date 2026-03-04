-- ═══════════════════════════════════════════════════
-- GAMIFICATION — user_chapter_reads
-- Track which chapters a user has marked as read
-- ═══════════════════════════════════════════════════

CREATE TABLE user_chapter_reads (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  book_name TEXT NOT NULL,
  chapter_number INTEGER NOT NULL,
  read_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (user_id, book_name, chapter_number)
);

CREATE INDEX idx_chapter_reads_user ON user_chapter_reads (user_id);
CREATE INDEX idx_chapter_reads_book ON user_chapter_reads (user_id, book_name);

ALTER TABLE user_chapter_reads ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own reads"
  ON user_chapter_reads FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Auth users can insert reads"
  ON user_chapter_reads FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own reads"
  ON user_chapter_reads FOR DELETE
  USING (auth.uid() = user_id);

-- ═══════════════════════════════════════════════════
-- GAMIFICATION — user_badges
-- Stores which badges a user has earned (definitions in constants.js)
-- ═══════════════════════════════════════════════════

CREATE TABLE user_badges (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  badge_id TEXT NOT NULL,
  earned_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (user_id, badge_id)
);

CREATE INDEX idx_user_badges_user ON user_badges (user_id);

ALTER TABLE user_badges ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own badges"
  ON user_badges FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Auth users can insert badges"
  ON user_badges FOR INSERT
  WITH CHECK (auth.uid() = user_id);
