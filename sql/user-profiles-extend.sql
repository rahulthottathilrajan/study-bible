-- Extended profile fields for user_profiles table
-- Run this in Supabase SQL editor

ALTER TABLE user_profiles
  ADD COLUMN IF NOT EXISTS full_name text,
  ADD COLUMN IF NOT EXISTS date_of_birth date,
  ADD COLUMN IF NOT EXISTS gender text,
  ADD COLUMN IF NOT EXISTS phone_country_code text DEFAULT '+1',
  ADD COLUMN IF NOT EXISTS phone_number text,
  ADD COLUMN IF NOT EXISTS nickname text;
