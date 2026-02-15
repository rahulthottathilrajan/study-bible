import { createClient } from '@supabase/supabase-js';

const supabaseUrl = "https://qpcafbwmvrkpztvvjnzx.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFwY2FmYndtdnJrcHp0dnZqbnp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzExNTcwMjksImV4cCI6MjA4NjczMzAyOX0.YJCDmQYupLg0nYwErE9GihpeJIGMVU2TKWITnDXkl_A";

export const supabase = createClient(supabaseUrl, supabaseKey);