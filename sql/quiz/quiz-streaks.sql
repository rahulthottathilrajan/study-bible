-- ═══════════════════════════════════════════════════
-- QUIZ STREAKS — Daily quiz engagement tracking
-- ═══════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS user_quiz_streaks (
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  last_quiz_date DATE,
  total_quizzes_completed INTEGER DEFAULT 0,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE user_quiz_streaks ENABLE ROW LEVEL SECURITY;

-- RLS Policies
CREATE POLICY "Users read own quiz streak"
  ON user_quiz_streaks FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users insert own quiz streak"
  ON user_quiz_streaks FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users update own quiz streak"
  ON user_quiz_streaks FOR UPDATE
  USING (auth.uid() = user_id);
