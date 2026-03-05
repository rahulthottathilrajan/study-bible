-- ═══════════════════════════════════════════════════
-- CHAPTER QUIZZES — chapter_quizzes
-- Stores quiz questions per chapter per difficulty
-- ═══════════════════════════════════════════════════

CREATE TABLE chapter_quizzes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  book_name TEXT NOT NULL,
  chapter_number INTEGER NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('kids', 'teens', 'adults')),
  question_number INTEGER NOT NULL,
  question TEXT NOT NULL,
  option_a TEXT NOT NULL,
  option_b TEXT NOT NULL,
  option_c TEXT NOT NULL,
  option_d TEXT NOT NULL,
  correct_answer TEXT NOT NULL CHECK (correct_answer IN ('a', 'b', 'c', 'd')),
  explanation TEXT,
  UNIQUE (book_name, chapter_number, difficulty, question_number)
);

CREATE INDEX idx_quiz_chapter ON chapter_quizzes (book_name, chapter_number, difficulty);

ALTER TABLE chapter_quizzes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view quizzes"
  ON chapter_quizzes FOR SELECT
  USING (true);

-- ═══════════════════════════════════════════════════
-- CHAPTER QUIZZES — user_quiz_scores
-- Stores user quiz attempt results
-- ═══════════════════════════════════════════════════

CREATE TABLE user_quiz_scores (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  book_name TEXT NOT NULL,
  chapter_number INTEGER NOT NULL,
  difficulty TEXT NOT NULL CHECK (difficulty IN ('kids', 'teens', 'adults')),
  score INTEGER NOT NULL,
  total_questions INTEGER NOT NULL,
  percentage NUMERIC(5,2) NOT NULL,
  attempted_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_quiz_scores_user ON user_quiz_scores (user_id);
CREATE INDEX idx_quiz_scores_chapter ON user_quiz_scores (user_id, book_name, chapter_number);

ALTER TABLE user_quiz_scores ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own quiz scores"
  ON user_quiz_scores FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Auth users can insert quiz scores"
  ON user_quiz_scores FOR INSERT
  WITH CHECK (auth.uid() = user_id);
