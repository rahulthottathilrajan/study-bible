import { getRequiredEnvForContext } from "../../../lib/server/env";
import { logServerError } from "../../../lib/server/logging";

export const dynamic = "force-dynamic";

const ALLOWED_CURRENCIES = ["aed", "usd", "gbp", "eur", "inr", "cad", "aud", "sgd", "nzd"];
const MAX_DONATION = 10000;

export async function POST(request) {
  const Stripe = (await import("stripe")).default;
  const { STRIPE_SECRET_KEY, NEXT_PUBLIC_SITE_URL } = getRequiredEnvForContext("stripe");
  const stripe = new Stripe(STRIPE_SECRET_KEY);

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: "Invalid request body" }, { status: 400 });
  }

  const { amount, currency = "aed", label = "Donation" } = body;
  const parsedAmount = Number(amount);

  if (!amount || Number.isNaN(parsedAmount) || parsedAmount < 1) {
    return Response.json({ error: "Amount must be at least 1" }, { status: 400 });
  }
  if (parsedAmount > MAX_DONATION) {
    return Response.json({ error: `Amount cannot exceed ${MAX_DONATION}` }, { status: 400 });
  }

  const safeCurrency = String(currency).toLowerCase();
  if (!ALLOWED_CURRENCIES.includes(safeCurrency)) {
    return Response.json({ error: "Invalid currency" }, { status: 400 });
  }

  const safeLabel = String(label).slice(0, 100);

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ["card"],
      mode: "payment",
      line_items: [{
        price_data: {
          currency: safeCurrency,
          unit_amount: Math.round(parsedAmount * 100),
          product_data: {
            name: `The Bible Scrollers - ${safeLabel}`,
            description: "Support the ministry. Every feature is free and your gift helps us keep building.",
          },
        },
        quantity: 1,
      }],
      success_url: `${NEXT_PUBLIC_SITE_URL}?donate=success`,
      cancel_url: `${NEXT_PUBLIC_SITE_URL}?donate=cancelled`,
      metadata: { type: "donation", amount: String(parsedAmount), currency: safeCurrency, label: safeLabel },
    });

    return Response.json({ url: session.url });
  } catch (donateError) {
    logServerError("donate_error", donateError, { currency: safeCurrency });
    return Response.json({ error: "Something went wrong. Please try again." }, { status: 500 });
  }
}
