export const dynamic = 'force-dynamic';

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

  if (!amount || isNaN(amount) || amount < 1) {
    return Response.json({ error: 'Amount must be at least 1' }, { status: 400 });
  }

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items: [{
        price_data: {
          currency,
          unit_amount: Math.round(Number(amount) * 100),
          product_data: {
            name: `The Bible Scrollers — ${label}`,
            description: 'Support the ministry. Every feature is free — your gift helps us keep building.',
          },
        },
        quantity: 1,
      }],
      success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?donate=success`,
      cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?donate=cancelled`,
      metadata: { type: 'donation', amount: String(amount), currency, label },
    });

    return Response.json({ url: session.url });
  } catch (error) {
    console.error('Donate checkout error:', error);
    return Response.json({ error: error.message }, { status: 500 });
  }
}
