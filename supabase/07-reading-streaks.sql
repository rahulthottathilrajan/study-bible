-- =============================================
-- READING STREAKS — user_reading_streaks table
-- =============================================
-- Run in Supabase SQL Editor after 06c-greek-grammar-advanced.sql

CREATE TABLE IF NOT EXISTS user_reading_streaks (
  user_id        UUID        PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  current_streak INT         NOT NULL DEFAULT 1,
  longest_streak INT         NOT NULL DEFAULT 1,
  last_read_date DATE        NOT NULL,
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE user_reading_streaks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own streak"
  ON user_reading_streaks FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own streak"
  ON user_reading_streaks FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own streak"
  ON user_reading_streaks FOR UPDATE
  USING (auth.uid() = user_id);
