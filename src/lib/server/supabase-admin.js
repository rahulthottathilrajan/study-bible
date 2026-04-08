import { createClient } from "@supabase/supabase-js";
import { getRequiredEnvForContext } from "./env";

export function createSupabaseAdmin(url, serviceRoleKey) {
  const {
    NEXT_PUBLIC_SUPABASE_URL,
    SUPABASE_SERVICE_ROLE_KEY,
  } = url && serviceRoleKey
    ? {
        NEXT_PUBLIC_SUPABASE_URL: url,
        SUPABASE_SERVICE_ROLE_KEY: serviceRoleKey,
      }
    : getRequiredEnvForContext("supabase");

  return createClient(NEXT_PUBLIC_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);
}

export async function requireAuthenticatedUser(request, supabaseAdmin = createSupabaseAdmin()) {
  const authHeader = request.headers.get("authorization");
  const token = authHeader?.split(" ")[1];

  if (!token) {
    return { user: null, error: "Missing bearer token" };
  }

  const {
    data: { user },
    error,
  } = await supabaseAdmin.auth.getUser(token);

  if (error || !user) {
    return { user: null, error: "Invalid auth token" };
  }

  return { user, error: null };
}
