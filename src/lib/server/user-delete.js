export const USER_DELETE_TABLES = [
  "user_notes",
  "user_highlights",
  "prayer_journal",
  "prayer_reactions",
  "community_prayers",
  "prayer_slots",
  "user_badges",
  "user_chapter_reads",
  "user_quiz_scores",
  "user_reading_position",
  "user_hebrew_progress",
  "user_greek_progress",
  "subscriptions",
  "shop_orders",
  "votd_user_likes",
  "user_profiles",
];

export async function deleteUserData(supabaseAdmin, userId) {
  for (const table of USER_DELETE_TABLES) {
    const column = table === "user_profiles" ? "id" : "user_id";
    const { error } = await supabaseAdmin.from(table).delete().eq(column, userId);

    if (error) {
      return { ok: false, table, error };
    }
  }

  return { ok: true, table: null, error: null };
}
