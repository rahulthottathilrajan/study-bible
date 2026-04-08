import { getRequiredEnvForContext } from "../../../lib/server/env";
import { logServerError, logServerEvent } from "../../../lib/server/logging";
import { normalizeShopCart } from "../../../lib/server/shop-catalog";
import { createSupabaseAdmin, requireAuthenticatedUser } from "../../../lib/server/supabase-admin";

export const dynamic = "force-dynamic";

export async function POST(request) {
  const Stripe = (await import("stripe")).default;
  const { STRIPE_SECRET_KEY, NEXT_PUBLIC_SITE_URL } = getRequiredEnvForContext("stripe");
  getRequiredEnvForContext("supabase");

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

  const { cart } = body;
  const { items, error } = await normalizeShopCart(cart);
  if (error) {
    return Response.json({ error }, { status: 400 });
  }

  try {
    const lineItems = items.map((item) => ({
      price_data: {
        currency: "usd",
        unit_amount: Math.round(item.product.price_usd * 100),
        product_data: {
          name: String(item.product.name).slice(0, 250),
          description: item.size
            ? `Size: ${String(item.size).slice(0, 100)}`
            : String(item.product.tagline || item.product.name).slice(0, 250),
        },
      },
      quantity: item.qty,
    }));

    logServerEvent("shop_checkout_requested", {
      userId: user.id,
      itemCount: items.length,
      totalUsd: Number(items.reduce((sum, item) => sum + item.product.price_usd * item.qty, 0).toFixed(2)),
    });

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      line_items: lineItems,
      customer_email: user.email || undefined,
      success_url: `${NEXT_PUBLIC_SITE_URL}?shop_order=success&session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${NEXT_PUBLIC_SITE_URL}?shop_order=cancelled`,
      metadata: {
        type: "shop_order",
        userId: user.id,
        cart: JSON.stringify(
          items.map((item) => ({
            id: item.product.id,
            name: String(item.product.name).slice(0, 100),
            qty: item.qty,
            size: item.size ? String(item.size).slice(0, 50) : null,
            price: item.product.price_usd,
          }))
        ),
      },
      shipping_address_collection: {
        allowed_countries: ["AE", "IN", "GB", "US", "AU", "CA", "SG", "DE", "FR", "NL", "NZ"],
      },
    });

    return Response.json({ url: session.url });
  } catch (checkoutError) {
    logServerError("shop_checkout_error", checkoutError, { userId: user.id });
    return Response.json({ error: "Something went wrong. Please try again." }, { status: 500 });
  }
}
