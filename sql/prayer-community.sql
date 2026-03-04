-- ═══════════════════════════════════════════════════
-- PRAYER COMMUNITY — Phase 2: community_prayers table
-- ═══════════════════════════════════════════════════

CREATE TABLE community_prayers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  category TEXT NOT NULL DEFAULT 'general'
    CHECK (category IN ('health','family','world','praise','general')),
  is_anonymous BOOLEAN DEFAULT false,
  is_answered BOOLEAN DEFAULT false,
  answered_at TIMESTAMPTZ,
  testimony_text TEXT,
  expires_at TIMESTAMPTZ DEFAULT (NOW() + INTERVAL '60 days'),
  expiry_prompted BOOLEAN DEFAULT false,
  expiry_prompted_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for feed queries
CREATE INDEX idx_community_prayers_feed ON community_prayers (is_answered, created_at DESC);
CREATE INDEX idx_community_prayers_user ON community_prayers (user_id);
CREATE INDEX idx_community_prayers_category ON community_prayers (category);

-- RLS policies
ALTER TABLE community_prayers ENABLE ROW LEVEL SECURITY;

-- Anyone can read all community prayers
CREATE POLICY "Anyone can view community prayers"
  ON community_prayers FOR SELECT
  USING (true);

-- Auth users can insert their own
CREATE POLICY "Auth users can create prayers"
  ON community_prayers FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Only owner can update
CREATE POLICY "Users can update own prayers"
  ON community_prayers FOR UPDATE
  USING (auth.uid() = user_id);

-- Only owner can delete
CREATE POLICY "Users can delete own prayers"
  ON community_prayers FOR DELETE
  USING (auth.uid() = user_id);


-- ═══════════════════════════════════════════════════
-- PRAYER COMMUNITY — Phase 3: prayer_reactions table
-- ═══════════════════════════════════════════════════

CREATE TABLE prayer_reactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  prayer_id UUID REFERENCES community_prayers(id) ON DELETE CASCADE NOT NULL,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  reaction_type TEXT NOT NULL CHECK (reaction_type IN ('praying','heart','amen')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (prayer_id, user_id, reaction_type)
);

CREATE INDEX idx_prayer_reactions_prayer ON prayer_reactions (prayer_id);
CREATE INDEX idx_prayer_reactions_user ON prayer_reactions (user_id);

ALTER TABLE prayer_reactions ENABLE ROW LEVEL SECURITY;

-- Anyone can see reaction counts
CREATE POLICY "Anyone can view reactions"
  ON prayer_reactions FOR SELECT
  USING (true);

-- Auth users can add reactions
CREATE POLICY "Auth users can add reactions"
  ON prayer_reactions FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users can remove their own reactions
CREATE POLICY "Users can remove own reactions"
  ON prayer_reactions FOR DELETE
  USING (auth.uid() = user_id);


-- ═══════════════════════════════════════════════════
-- PRAYER COMMUNITY — Phase 4: prayer_slots table
-- ═══════════════════════════════════════════════════

CREATE TABLE prayer_slots (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  slot_hour INT NOT NULL CHECK (slot_hour >= 0 AND slot_hour < 24),
  slot_minute INT NOT NULL CHECK (slot_minute >= 0 AND slot_minute < 60),
  duration_minutes INT NOT NULL CHECK (duration_minutes IN (15, 30, 60)),
  frequency TEXT NOT NULL DEFAULT 'daily'
    CHECK (frequency IN ('daily','weekdays','custom')),
  custom_days INT[] DEFAULT '{}',
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_prayer_slots_user ON prayer_slots (user_id);
CREATE INDEX idx_prayer_slots_active ON prayer_slots (is_active, slot_hour, slot_minute);

ALTER TABLE prayer_slots ENABLE ROW LEVEL SECURITY;

-- Anyone can see slot coverage (for the clock)
CREATE POLICY "Anyone can view prayer slots"
  ON prayer_slots FOR SELECT
  USING (true);

-- Auth users can create slots
CREATE POLICY "Auth users can create slots"
  ON prayer_slots FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- Users can update their own slots
CREATE POLICY "Users can update own slots"
  ON prayer_slots FOR UPDATE
  USING (auth.uid() = user_id);

-- Users can delete their own slots
CREATE POLICY "Users can delete own slots"
  ON prayer_slots FOR DELETE
  USING (auth.uid() = user_id);


-- ═══════════════════════════════════════════════════
-- RPC: Get prayer coverage for the 24h clock
-- ═══════════════════════════════════════════════════

CREATE OR REPLACE FUNCTION get_prayer_coverage(target_day INT)
RETURNS TABLE(slot_hour INT, slot_minute INT, user_count BIGINT)
LANGUAGE sql STABLE
AS $$
  SELECT ps.slot_hour, ps.slot_minute, COUNT(DISTINCT ps.user_id)
  FROM prayer_slots ps
  WHERE ps.is_active = true
    AND (
      ps.frequency = 'daily'
      OR (ps.frequency = 'weekdays' AND target_day BETWEEN 1 AND 5)
      OR (ps.frequency = 'custom' AND target_day = ANY(ps.custom_days))
    )
  GROUP BY ps.slot_hour, ps.slot_minute;
$$;
