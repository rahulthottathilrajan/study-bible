import { getRequiredEnv } from "../../../lib/server/env";
import { logServerError } from "../../../lib/server/logging";
import { createSupabaseAdmin } from "../../../lib/server/supabase-admin";

export const dynamic = "force-dynamic";

export async function POST(request) {
  const Stripe = (await import("stripe")).default;
  const {
    STRIPE_SECRET_KEY,
    STRIPE_WEBHOOK_SECRET,
    NEXT_PUBLIC_SUPABASE_URL,
    SUPABASE_SERVICE_ROLE_KEY,
  } = getRequiredEnv(
    [
      "STRIPE_SECRET_KEY",
      "STRIPE_WEBHOOK_SECRET",
      "NEXT_PUBLIC_SUPABASE_URL",
      "SUPABASE_SERVICE_ROLE_KEY",
    ],
    { context: "webhook" }
  );

  const stripe = new Stripe(STRIPE_SECRET_KEY);
  const supabaseAdmin = createSupabaseAdmin(NEXT_PUBLIC_SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

  const body = await request.text();
  const sig = request.headers.get("stripe-signature");

  let event;
  try {
    event = stripe.webhooks.constructEvent(body, sig, STRIPE_WEBHOOK_SECRET);
  } catch (signatureError) {
    logServerError("webhook_signature_error", signatureError);
    return Response.json({ error: "Invalid signature" }, { status: 400 });
  }

  try {
    switch (event.type) {
      case "checkout.session.completed": {
        const session = event.data.object;

        if (session.metadata?.type === "shop_order") {
          const { userId, cart } = session.metadata;
          if (userId && cart) {
            const { data: existing } = await supabaseAdmin
              .from("shop_orders")
              .select("id")
              .eq("stripe_session_id", session.id)
              .single();

            if (!existing) {
              let totalUsd = 0;
              try {
                const lineItems = await stripe.checkout.sessions.listLineItems(session.id, { limit: 100 });
                totalUsd = lineItems.data.reduce((sum, item) => sum + item.amount_total / 100, 0);
              } catch {
                const items = JSON.parse(cart);
                totalUsd = items.reduce((sum, item) => sum + item.price * item.qty, 0);
              }

              await supabaseAdmin.from("shop_orders").insert({
                user_id: userId,
                stripe_session_id: session.id,
                items: JSON.parse(cart),
                total_usd: parseFloat(totalUsd.toFixed(2)),
                status: "confirmed",
              });
            }
          }
          break;
        }

        const userId = session.metadata?.userId;
        const plan = session.metadata?.plan;
        if (userId && plan) {
          const update = {
            plan,
            status: "active",
            stripe_customer_id: session.customer,
            current_period_start: new Date().toISOString(),
            updated_at: new Date().toISOString(),
          };

          if (plan === "lifetime") {
            update.current_period_end = "2099-12-31T23:59:59Z";
          } else if (session.subscription) {
            update.stripe_subscription_id = session.subscription;
            const sub = await stripe.subscriptions.retrieve(session.subscription);
            update.current_period_end = new Date(sub.current_period_end * 1000).toISOString();
          }

          await supabaseAdmin.from("subscriptions").upsert({ user_id: userId, ...update });
        }
        break;
      }

      case "customer.subscription.updated": {
        const subscription = event.data.object;
        const { data: sub } = await supabaseAdmin
          .from("subscriptions")
          .select("user_id")
          .eq("stripe_customer_id", subscription.customer)
          .single();

        if (sub) {
          await supabaseAdmin
            .from("subscriptions")
            .update({
              status: subscription.status === "active" ? "active" : "past_due",
              current_period_end: new Date(subscription.current_period_end * 1000).toISOString(),
              updated_at: new Date().toISOString(),
            })
            .eq("user_id", sub.user_id);
        }
        break;
      }

      case "customer.subscription.deleted": {
        const subscription = event.data.object;
        const { data: sub } = await supabaseAdmin
          .from("subscriptions")
          .select("user_id")
          .eq("stripe_customer_id", subscription.customer)
          .single();

        if (sub) {
          await supabaseAdmin
            .from("subscriptions")
            .update({
              plan: "free",
              status: "expired",
              stripe_subscription_id: null,
              current_period_end: null,
              updated_at: new Date().toISOString(),
            })
            .eq("user_id", sub.user_id);
        }
        break;
      }
    }

    return Response.json({ received: true });
  } catch (webhookError) {
    logServerError("webhook_processing_error", webhookError, { eventType: event.type });
    return Response.json({ error: "Webhook processing failed" }, { status: 500 });
  }
}
