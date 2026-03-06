-- ============================================
-- KJV STUDY BIBLE - SUPABASE DATABASE SCHEMA
-- ============================================
-- Run this in your Supabase SQL Editor (https://supabase.com/dashboard)
-- This creates the complete structure for the Study Bible app.

-- 1. BOOKS TABLE
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  testament TEXT NOT NULL CHECK (testament IN ('Old Testament', 'New Testament')),
  category TEXT NOT NULL,
  total_chapters INTEGER NOT NULL,
  book_order INTEGER NOT NULL,
  original_name TEXT,          -- Hebrew or Greek name
  original_meaning TEXT,       -- English meaning of the original name
  author TEXT,
  date_written TEXT,
  key_theme TEXT,
  summary TEXT
);

-- 2. CHAPTERS TABLE
CREATE TABLE chapters (
  id SERIAL PRIMARY KEY,
  book_id INTEGER REFERENCES books(id) ON DELETE CASCADE,
  chapter_number INTEGER NOT NULL,
  overview TEXT,
  theme TEXT,
  key_word_original TEXT,
  key_word_meaning TEXT,
  outline TEXT,                -- JSON array of outline points
  UNIQUE(book_id, chapter_number)
);

-- 3. VERSES TABLE
CREATE TABLE verses (
  id SERIAL PRIMARY KEY,
  chapter_id INTEGER REFERENCES chapters(id) ON DELETE CASCADE,
  verse_number INTEGER NOT NULL,
  kjv_text TEXT NOT NULL,
  original_text TEXT,          -- Hebrew or Greek
  transliteration TEXT,
  study_note TEXT,
  doctrinal_note TEXT,
  application_note TEXT,
  historical_context TEXT,
  UNIQUE(chapter_id, verse_number)
);

-- 4. WORD STUDIES TABLE
CREATE TABLE word_studies (
  id SERIAL PRIMARY KEY,
  verse_id INTEGER REFERENCES verses(id) ON DELETE CASCADE,
  original_word TEXT NOT NULL,
  transliteration TEXT NOT NULL,
  strongs_number TEXT NOT NULL,
  meaning TEXT NOT NULL,
  usage_notes TEXT,
  word_order INTEGER DEFAULT 0
);

-- 5. CROSS REFERENCES TABLE
CREATE TABLE cross_references (
  id SERIAL PRIMARY KEY,
  verse_id INTEGER REFERENCES verses(id) ON DELETE CASCADE,
  reference TEXT NOT NULL,     -- e.g. "John 1:1-3"
  context TEXT,                -- Brief context of why this is referenced
  ref_order INTEGER DEFAULT 0
);

-- 6. BOOKMARKS TABLE (for user bookmarks)
CREATE TABLE bookmarks (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  verse_id INTEGER REFERENCES verses(id) ON DELETE CASCADE,
  note TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, verse_id)
);

-- 7. READING PROGRESS TABLE
CREATE TABLE reading_progress (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  chapter_id INTEGER REFERENCES chapters(id) ON DELETE CASCADE,
  completed BOOLEAN DEFAULT FALSE,
  last_read_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, chapter_id)
);

-- ============================================
-- INDEXES FOR PERFORMANCE
-- ============================================
CREATE INDEX idx_chapters_book ON chapters(book_id);
CREATE INDEX idx_verses_chapter ON verses(chapter_id);
CREATE INDEX idx_word_studies_verse ON word_studies(verse_id);
CREATE INDEX idx_cross_refs_verse ON cross_references(verse_id);
CREATE INDEX idx_bookmarks_user ON bookmarks(user_id);
CREATE INDEX idx_reading_progress_user ON reading_progress(user_id);

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================
-- Bible content is public read
ALTER TABLE books ENABLE ROW LEVEL SECURITY;
ALTER TABLE chapters ENABLE ROW LEVEL SECURITY;
ALTER TABLE verses ENABLE ROW LEVEL SECURITY;
ALTER TABLE word_studies ENABLE ROW LEVEL SECURITY;
ALTER TABLE cross_references ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public read books" ON books FOR SELECT USING (true);
CREATE POLICY "Public read chapters" ON chapters FOR SELECT USING (true);
CREATE POLICY "Public read verses" ON verses FOR SELECT USING (true);
CREATE POLICY "Public read word_studies" ON word_studies FOR SELECT USING (true);
CREATE POLICY "Public read cross_references" ON cross_references FOR SELECT USING (true);

-- Bookmarks are user-specific
ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own bookmarks" ON bookmarks
  FOR ALL USING (auth.uid() = user_id);

ALTER TABLE reading_progress ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users manage own progress" ON reading_progress
  FOR ALL USING (auth.uid() = user_id);

-- ============================================
-- HELPFUL VIEWS
-- ============================================
CREATE VIEW verse_full AS
SELECT 
  v.id as verse_id,
  b.name as book_name,
  b.testament,
  b.category,
  c.chapter_number,
  v.verse_number,
  v.kjv_text,
  v.original_text,
  v.transliteration,
  v.study_note,
  v.doctrinal_note,
  c.theme as chapter_theme,
  c.overview as chapter_overview
FROM verses v
JOIN chapters c ON v.chapter_id = c.id
JOIN books b ON c.book_id = b.id;

-- ============================================
-- DONE! Now seed your data using the app or SQL inserts.
-- ============================================