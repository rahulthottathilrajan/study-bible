-- =============================================
-- LEARN GREEK — Part 1: Tables, Indexes & RLS
-- =============================================
-- Run this FIRST in Supabase SQL Editor
-- =============================================

-- 1. GREEK LESSONS (main lesson table)
CREATE TABLE IF NOT EXISTS greek_lessons (
  id BIGSERIAL PRIMARY KEY,
  lesson_number INTEGER NOT NULL,
  category TEXT NOT NULL CHECK (category IN ('alphabet', 'vocabulary', 'grammar')),
  title TEXT NOT NULL,
  subtitle TEXT,
  content JSONB NOT NULL DEFAULT '{}',
  verse_connections JSONB NOT NULL DEFAULT '[]'
);

-- 2. GREEK ALPHABET (letter data linked to alphabet lessons)
CREATE TABLE IF NOT EXISTS greek_alphabet (
  id BIGSERIAL PRIMARY KEY,
  lesson_id BIGINT NOT NULL REFERENCES greek_lessons(id) ON DELETE CASCADE,
  greek_letter TEXT NOT NULL,
  letter_name TEXT NOT NULL,
  transliteration TEXT NOT NULL,
  numeric_value INTEGER,
  pronunciation_guide TEXT,
  pictographic TEXT
);

-- 3. GREEK VOCABULARY (words linked to lessons)
CREATE TABLE IF NOT EXISTS greek_vocabulary (
  id BIGSERIAL PRIMARY KEY,
  lesson_id BIGINT NOT NULL REFERENCES greek_lessons(id) ON DELETE CASCADE,
  greek_word TEXT NOT NULL,
  transliteration TEXT NOT NULL,
  meaning TEXT NOT NULL,
  part_of_speech TEXT,
  strongs_number TEXT,
  numeric_occurrences INTEGER,
  example_verse_ref TEXT,
  example_verse_text TEXT
);

-- 4. USER PROGRESS (per-user completion tracking)
CREATE TABLE IF NOT EXISTS user_greek_progress (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  lesson_id BIGINT NOT NULL REFERENCES greek_lessons(id) ON DELETE CASCADE,
  completed BOOLEAN NOT NULL DEFAULT FALSE,
  score INTEGER DEFAULT 0,
  completed_at TIMESTAMPTZ,
  UNIQUE(user_id, lesson_id)
);

-- 5. INDEXES
CREATE INDEX IF NOT EXISTS idx_greek_lessons_category ON greek_lessons(category);
CREATE INDEX IF NOT EXISTS idx_greek_alphabet_lesson ON greek_alphabet(lesson_id);
CREATE INDEX IF NOT EXISTS idx_greek_vocabulary_lesson ON greek_vocabulary(lesson_id);
CREATE INDEX IF NOT EXISTS idx_user_greek_progress_user ON user_greek_progress(user_id);

-- 6. ROW LEVEL SECURITY
ALTER TABLE greek_lessons ENABLE ROW LEVEL SECURITY;
ALTER TABLE greek_alphabet ENABLE ROW LEVEL SECURITY;
ALTER TABLE greek_vocabulary ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_greek_progress ENABLE ROW LEVEL SECURITY;

-- Lessons, alphabet, vocabulary: readable by everyone
CREATE POLICY "Greek lessons viewable by everyone"
  ON greek_lessons FOR SELECT USING (true);

CREATE POLICY "Greek alphabet viewable by everyone"
  ON greek_alphabet FOR SELECT USING (true);

CREATE POLICY "Greek vocabulary viewable by everyone"
  ON greek_vocabulary FOR SELECT USING (true);

-- Progress: users can only access their own
CREATE POLICY "Users can view own greek progress"
  ON user_greek_progress FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own greek progress"
  ON user_greek_progress FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own greek progress"
  ON user_greek_progress FOR UPDATE USING (auth.uid() = user_id);
