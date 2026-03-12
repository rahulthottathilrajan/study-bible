-- ═══════════════════════════════════════════════════
-- PODCAST — podcast_listening_position
-- Track user's listening progress per episode
-- ═══════════════════════════════════════════════════

CREATE TABLE podcast_listening_position (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  series_slug TEXT NOT NULL,
  episode_number INTEGER NOT NULL,
  timestamp_seconds REAL NOT NULL DEFAULT 0,
  completed BOOLEAN DEFAULT false,
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (user_id, series_slug, episode_number)
);

CREATE INDEX idx_podcast_pos_user ON podcast_listening_position (user_id);
CREATE INDEX idx_podcast_pos_series ON podcast_listening_position (user_id, series_slug);

ALTER TABLE podcast_listening_position ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own podcast positions"
  ON podcast_listening_position FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Auth users can insert podcast positions"
  ON podcast_listening_position FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own podcast positions"
  ON podcast_listening_position FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own podcast positions"
  ON podcast_listening_position FOR DELETE
  USING (auth.uid() = user_id);

-- ═══════════════════════════════════════════════════
-- PODCAST — podcast_notes
-- User notes linked to episodes, optionally at a timestamp
-- ═══════════════════════════════════════════════════

CREATE TABLE podcast_notes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  series_slug TEXT NOT NULL,
  episode_number INTEGER NOT NULL,
  note_text TEXT NOT NULL CHECK (char_length(note_text) <= 2000),
  timestamp_seconds REAL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_podcast_notes_user ON podcast_notes (user_id);
CREATE INDEX idx_podcast_notes_episode ON podcast_notes (user_id, series_slug, episode_number);

ALTER TABLE podcast_notes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own podcast notes"
  ON podcast_notes FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Auth users can insert podcast notes"
  ON podcast_notes FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own podcast notes"
  ON podcast_notes FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own podcast notes"
  ON podcast_notes FOR DELETE
  USING (auth.uid() = user_id);
