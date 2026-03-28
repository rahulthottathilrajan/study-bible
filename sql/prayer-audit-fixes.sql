-- ═══════════════════════════════════════════════════
-- PRAYER AUDIT FIXES — Security, Privacy, Moderation
-- Run after prayer-community.sql
-- ═══════════════════════════════════════════════════

-- ─────────────────────────────────────────────────
-- 1. Content length constraints
-- ─────────────────────────────────────────────────
DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'cp_title_length') THEN
    ALTER TABLE community_prayers ADD CONSTRAINT cp_title_length CHECK (char_length(title) <= 200);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'cp_body_length') THEN
    ALTER TABLE community_prayers ADD CONSTRAINT cp_body_length CHECK (char_length(body) <= 2000);
  END IF;
END $$;

DO $$ BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'pj_title_length') THEN
    ALTER TABLE prayer_journal ADD CONSTRAINT pj_title_length CHECK (char_length(title) <= 200);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'pj_text_length') THEN
    ALTER TABLE prayer_journal ADD CONSTRAINT pj_text_length CHECK (char_length(prayer_text) <= 2000);
  END IF;
END $$;

-- ─────────────────────────────────────────────────
-- 2. Anonymous privacy view
--    Nullifies user_id for anonymous prayers so
--    clients cannot trace anonymous posters
-- ─────────────────────────────────────────────────
CREATE OR REPLACE VIEW community_prayers_public AS
SELECT
  id,
  CASE WHEN is_anonymous THEN NULL ELSE user_id END AS user_id,
  title, body, category, is_anonymous, is_answered,
  answered_at, testimony_text, expires_at, expiry_prompted,
  expiry_prompted_at, created_at, updated_at
FROM community_prayers;

-- Grant access (RLS on base table still enforced via SECURITY INVOKER default)
GRANT SELECT ON community_prayers_public TO authenticated;

-- ─────────────────────────────────────────────────
-- 3. Prayer reports table
-- ─────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS prayer_reports (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  prayer_id UUID REFERENCES community_prayers(id) ON DELETE CASCADE NOT NULL,
  reporter_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  reason TEXT NOT NULL CHECK (reason IN ('inappropriate','spam','harassment','other')),
  details TEXT CHECK (char_length(details) <= 500),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE (prayer_id, reporter_id)
);

ALTER TABLE prayer_reports ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own reports"
  ON prayer_reports FOR SELECT USING (auth.uid() = reporter_id);

CREATE POLICY "Auth users can report"
  ON prayer_reports FOR INSERT WITH CHECK (auth.uid() = reporter_id);

-- ─────────────────────────────────────────────────
-- 4. Timezone column on prayer_slots
-- ─────────────────────────────────────────────────
DO $$ BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'prayer_slots' AND column_name = 'timezone'
  ) THEN
    ALTER TABLE prayer_slots ADD COLUMN timezone TEXT DEFAULT 'UTC';
  END IF;
END $$;

-- ─────────────────────────────────────────────────
-- 5. Updated coverage RPC (returns duration + tz)
-- ─────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION get_prayer_coverage(target_day INT)
RETURNS TABLE(slot_hour INT, slot_minute INT, duration_minutes INT, timezone TEXT, user_count BIGINT)
LANGUAGE sql STABLE
SET search_path = public
AS $$
  SELECT ps.slot_hour, ps.slot_minute, ps.duration_minutes, ps.timezone, COUNT(DISTINCT ps.user_id)
  FROM prayer_slots ps
  WHERE ps.is_active = true
    AND (
      ps.frequency = 'daily'
      OR (ps.frequency = 'weekdays' AND target_day BETWEEN 1 AND 5)
      OR (ps.frequency = 'custom' AND target_day = ANY(ps.custom_days))
    )
  GROUP BY ps.slot_hour, ps.slot_minute, ps.duration_minutes, ps.timezone;
$$;

-- ─────────────────────────────────────────────────
-- 6. Server-side expiry cleanup (pg_cron)
--    Runs daily at 3 AM UTC
-- ─────────────────────────────────────────────────
CREATE EXTENSION IF NOT EXISTS pg_cron;

SELECT cron.schedule(
  'cleanup-expired-prayers',
  '0 3 * * *',
  $$
    -- Auto-delete prayers that were prompted 48h+ ago with no response
    DELETE FROM community_prayers
    WHERE is_answered = false
      AND expiry_prompted = true
      AND expiry_prompted_at < NOW() - INTERVAL '48 hours';

    -- Auto-prompt prayers that expired but owner hasn't visited
    UPDATE community_prayers
    SET expiry_prompted = true, expiry_prompted_at = NOW(), updated_at = NOW()
    WHERE is_answered = false
      AND expires_at < NOW()
      AND expiry_prompted = false;
  $$
);
