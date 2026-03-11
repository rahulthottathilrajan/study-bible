export const dynamic = 'force-dynamic';

const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

export async function POST(request) {
  const Stripe = (await import('stripe')).default;
  const { createClient } = await import('@supabase/supabase-js');

  const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
  const supabaseAdmin = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL,
    process.env.SUPABASE_SERVICE_ROLE_KEY
  );

  // ── Verify auth token — never trust userId from request body ──
  const authHeader = request.headers.get('authorization');
  const token = authHeader?.split(' ')[1];
  if (!token) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const { data: { user }, error: authError } = await supabaseAdmin.auth.getUser(token);
  if (authError || !user) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const userId = user.id;

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: 'Invalid request body' }, { status: 400 });
  }

  const { cart, userEmail } = body;

  if (!cart?.length) {
    return Response.json({ error: 'Cart is required' }, { status: 400 });
  }

  // Validate cart size (max 50 items)
  if (cart.length > 50) {
    return Response.json({ error: 'Cart too large' }, { status: 400 });
  }

  // Validate and sanitize email
  const safeEmail = userEmail && EMAIL_REGEX.test(userEmail) ? userEmail : undefined;

  try {
    const line_items = cart.map(item => ({
      price_data: {
        currency: 'usd',
        unit_amount: Math.round(item.product.price_usd * 100),
        product_data: {
          name: String(item.product.name).slice(0, 250),
          description: item.size
            ? `Size: ${String(item.size).slice(0, 100)}`
            : String(item.product.tagline || item.product.name).slice(0, 250),
        },
      },
      quantity: Math.min(Math.max(1, Math.floor(Number(item.qty))), 99),
    }));

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      mode: 'payment',
      line_items,
      customer_email: safeEmail,
      success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?shop_order=success&session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?shop_order=cancelled`,
      metadata: {
        type: 'shop_order',
        userId,
        cart: JSON.stringify(
          cart.slice(0, 50).map(i => ({
            id: i.product.id,
            name: String(i.product.name).slice(0, 100),
            qty: Math.min(Math.max(1, Math.floor(Number(i.qty))), 99),
            size: i.size ? String(i.size).slice(0, 50) : null,
            price: i.product.price_usd,
          }))
        ),
      },
      shipping_address_collection: {
        allowed_countries: ['AE', 'IN', 'GB', 'US', 'AU', 'CA', 'SG', 'DE', 'FR', 'NL', 'NZ'],
      },
    });

    return Response.json({ url: session.url });
  } catch (error) {
    console.error('[shop-checkout] Error:', error);
    return Response.json({ error: 'Something went wrong. Please try again.' }, { status: 500 });
  }
}
