import { getRequiredEnvForContext } from "../../../../lib/server/env";
import { logServerError, logServerEvent } from "../../../../lib/server/logging";
import { createSupabaseAdmin, requireAuthenticatedUser } from "../../../../lib/server/supabase-admin";
import { deleteUserData } from "../../../../lib/server/user-delete";

export const dynamic = "force-dynamic";

export async function POST(request) {
  getRequiredEnvForContext("supabase");
  const supabaseAdmin = createSupabaseAdmin();

  const { user, error: authError } = await requireAuthenticatedUser(request, supabaseAdmin);
  if (authError || !user) {
    return Response.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    logServerEvent("user_delete_requested", { userId: user.id });
    const deleteResult = await deleteUserData(supabaseAdmin, user.id);

    if (!deleteResult.ok) {
      logServerError("user_delete_dependency_error", deleteResult.error, {
        userId: user.id,
        table: deleteResult.table,
      });
      return Response.json(
        { error: "We could not safely delete your account right now. No auth data was removed." },
        { status: 500 }
      );
    }

    const { error: deleteError } = await supabaseAdmin.auth.admin.deleteUser(user.id);
    if (deleteError) {
      logServerError("user_delete_auth_error", deleteError, { userId: user.id });
      return Response.json({ error: "Something went wrong. Please try again." }, { status: 500 });
    }

    return Response.json({ success: true });
  } catch (deleteError) {
    logServerError("user_delete_error", deleteError, { userId: user.id });
    return Response.json({ error: "Something went wrong. Please try again." }, { status: 500 });
  }
}
