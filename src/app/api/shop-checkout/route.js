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

  const { cart, userId, userEmail } = body;

  if (!cart?.length || !userId) {
    return Response.json({ error: 'Cart and userId are required' }, { status: 400 });
  }

  const line_items = cart.map(item => ({
    price_data: {
      currency: 'usd',
      unit_amount: Math.round(item.product.price_usd * 100),
      product_data: {
        name: item.product.name,
        description: item.size ? `Size: ${item.size}` : (item.product.tagline || item.product.name),
      },
    },
    quantity: item.qty,
  }));

  const session = await stripe.checkout.sessions.create({
    payment_method_types: ['card'],
    mode: 'payment',
    line_items,
    customer_email: userEmail || undefined,
    success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?shop_order=success&session_id={CHECKOUT_SESSION_ID}`,
    cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?shop_order=cancelled`,
    metadata: {
      type: 'shop_order',
      userId,
      cart: JSON.stringify(
        cart.map(i => ({
          id: i.product.id,
          name: i.product.name,
          qty: i.qty,
          size: i.size || null,
          price: i.product.price_usd,
        }))
      ),
    },
    shipping_address_collection: {
      allowed_countries: ['AE', 'IN', 'GB', 'US', 'AU', 'CA', 'SG', 'DE', 'FR', 'NL', 'NZ'],
    },
  });

  return Response.json({ url: session.url });
}
