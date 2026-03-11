export const dynamic = 'force-dynamic';

const ALLOWED_CURRENCIES = ['aed', 'usd', 'gbp', 'eur', 'inr', 'cad', 'aud', 'sgd', 'nzd'];
const MAX_DONATION = 10000; // Maximum donation amount in base currency units

export async function POST(request) {
  const Stripe = (await import('stripe')).default;
  const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: 'Invalid request body' }, { status: 400 });
  }

  const { amount, currency = 'aed', label = 'Donation' } = body;

  // Validate amount: must be a number, at least 1, at most MAX_DONATION
  const parsedAmount = Number(amount);
  if (!amount || isNaN(parsedAmount) || parsedAmount < 1) {
    return Response.json({ error: 'Amount must be at least 1' }, { status: 400 });
  }
  if (parsedAmount > MAX_DONATION) {
    return Response.json({ error: `Amount cannot exceed ${MAX_DONATION}` }, { status: 400 });
  }

  // Validate currency against allowed list
  const safeCurrency = String(currency).toLowerCase();
  if (!ALLOWED_CURRENCIES.includes(safeCurrency)) {
    return Response.json({ error: 'Invalid currency' }, { status: 400 });
  }

  // Sanitize label
  const safeLabel = String(label).slice(0, 100);

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price_data: {
          currency: safeCurrency,
          unit_amount: Math.round(parsedAmount * 100),
          product_data: {
            name: `The Bible Scrollers — ${safeLabel}`,
            description: 'Support the ministry. Every feature is free — your gift helps us keep building.',
          },
        },
        quantity: 1,
      }],
      success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?donate=success`,
      cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?donate=cancelled`,
      metadata: { type: 'donation', amount: String(parsedAmount), currency: safeCurrency, label: safeLabel },
    });

    return Response.json({ url: session.url });
  } catch (error) {
    console.error('[donate] Error:', error);
    return Response.json({ error: 'Something went wrong. Please try again.' }, { status: 500 });
  }
}
