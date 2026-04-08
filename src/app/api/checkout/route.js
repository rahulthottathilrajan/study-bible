import { getRequiredEnvForContext, getRequiredStripePrices } from "../../../lib/server/env";
import { logServerError } from "../../../lib/server/logging";
import { createSupabaseAdmin, requireAuthenticatedUser } from "../../../lib/server/supabase-admin";

export const dynamic = "force-dynamic";

const PRICES = {
  monthly: process.env.STRIPE_PRICE_MONTHLY,
  yearly: process.env.STRIPE_PRICE_YEARLY,
  lifetime: process.env.STRIPE_PRICE_LIFETIME,
};

const VALID_PLANS = ["monthly", "yearly", "lifetime"];

export async function POST(request) {
  const Stripe = (await import("stripe")).default;
  const { STRIPE_SECRET_KEY, NEXT_PUBLIC_SITE_URL } = getRequiredEnvForContext("stripe");
  getRequiredEnvForContext("supabase");
  getRequiredStripePrices();

  const stripe = new Stripe(STRIPE_SECRET_KEY);
  const supabaseAdmin = createSupabaseAdmin();

  const { user, error: authError } = await requireAuthenticatedUser(request, supabaseAdmin);
  if (authError || !user) {
    return Response.json({ error: "Unauthorized" }, { status: 401 });
  }

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid request body" }, { status: 400 });
  }

  const { plan } = body;
  if (!plan || !VALID_PLANS.includes(plan)) {
    return Response.json({ error: "Invalid plan" }, { status: 400 });
  }

  if (!PRICES[plan]) {
    return Response.json({ error: "Plan not configured" }, { status: 400 });
  }

  try {
    const { data: sub } = await supabaseAdmin
      .from("subscriptions")
      .select("stripe_customer_id")
      .eq("user_id", user.id)
      .single();

    let customerId = sub?.stripe_customer_id;
    if (!customerId) {
      const customer = await stripe.customers.create({
        email: user.email,
        metadata: { supabase_user_id: user.id },
      });
      customerId = customer.id;

      await supabaseAdmin
        .from("subscriptions")
        .upsert({ user_id: user.id, stripe_customer_id: customerId, plan: "free", status: "active" });
    }

    const sessionParams = {
      customer: customerId,
      payment_method_types: ["card"],
      line_items: [{ price: PRICES[plan], quantity: 1 }],
      success_url: `${NEXT_PUBLIC_SITE_URL}?payment=success`,
      cancel_url: `${NEXT_PUBLIC_SITE_URL}?payment=cancelled`,
      metadata: { userId: user.id, plan },
    };

    sessionParams.mode = plan === "lifetime" ? "payment" : "subscription";
    const session = await stripe.checkout.sessions.create(sessionParams);

    return Response.json({ url: session.url });
  } catch (checkoutError) {
    logServerError("subscription_checkout_error", checkoutError, { userId: user.id });
    return Response.json({ error: "Something went wrong. Please try again." }, { status: 500 });
  }
}
