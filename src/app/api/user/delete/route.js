export const dynamic = 'force-dynamic';

// GDPR Right to Erasure — deletes ALL user data and auth account
export async function POST(request) {
  const { createClient } = await import('@supabase/supabase-js');

  const supabaseAdmin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY
  );

  // ── Verify auth token ──
  const authHeader = request.headers.get('authorization');
  const token = authHeader?.split(' ')[1];
  if (!token) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const { data: { user }, error: authError } = await supabaseAdmin.auth.getUser(token);
  if (authError || !user) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const userId = user.id;

  try {
    // Delete all user data in order (respect foreign key dependencies)
    const tables = [
      'user_notes',
      'user_highlights',
      'prayer_journal',
      'prayer_reactions',
      'community_prayers',
      'prayer_slots',
      'user_badges',
      'user_chapter_reads',
      'user_quiz_scores',
      'user_reading_position',
      'user_hebrew_progress',
      'user_greek_progress',
      'subscriptions',
      'shop_orders',
      'votd_user_likes',
      'user_profiles',
    ];

    for (const table of tables) {
      const col = table === 'user_profiles' ? 'id' : 'user_id';
      await supabaseAdmin.from(table).delete().eq(col, userId);
    }

    // Delete the auth account itself
    const { error: deleteError } = await supabaseAdmin.auth.admin.deleteUser(userId);
    if (deleteError) {
      console.error('[user/delete] Auth delete error:', deleteError);
      return Response.json({ error: 'Something went wrong. Please try again.' }, { status: 500 });
    }

    return Response.json({ success: true });
  } catch (error) {
    console.error('[user/delete] Error:', error);
    return Response.json({ error: 'Something went wrong. Please try again.' }, { status: 500 });
  }
}
