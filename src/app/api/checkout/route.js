export const dynamic = 'force-dynamic';

const PRICES = {
  monthly: process.env.STRIPE_PRICE_MONTHLY,
  yearly: process.env.STRIPE_PRICE_YEARLY,
  lifetime: process.env.STRIPE_PRICE_LIFETIME,
};

const VALID_PLANS = ['monthly', 'yearly', 'lifetime'];

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
  const email = user.email;

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: 'Invalid request body' }, { status: 400 });
  }

  const { plan } = body;

  if (!plan || !VALID_PLANS.includes(plan)) {
    return Response.json({ error: 'Invalid plan' }, { status: 400 });
  }

  if (!PRICES[plan]) {
    return Response.json({ error: 'Plan not configured' }, { status: 400 });
  }

  try {
    const { data: sub } = await supabaseAdmin
      .from('subscriptions')
      .select('stripe_customer_id')
      .eq('user_id', userId)
      .single();

    let customerId = sub?.stripe_customer_id;

    if (!customerId) {
      const customer = await stripe.customers.create({
        email,
        metadata: { supabase_user_id: userId },
      });
      customerId = customer.id;

      await supabaseAdmin
        .from('subscriptions')
        .upsert({ user_id: userId, stripe_customer_id: customerId, plan: 'free', status: 'active' });
    }

    const sessionParams = {
      customer: customerId,
      payment_method_types: ['card'],
      line_items: [{ price: PRICES[plan], quantity: 1 }],
      success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?payment=success`,
      cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?payment=cancelled`,
      metadata: { userId, plan },
    };

    if (plan === 'lifetime') {
      sessionParams.mode = 'payment';
    } else {
      sessionParams.mode = 'subscription';
    }

    const session = await stripe.checkout.sessions.create(sessionParams);

    return Response.json({ url: session.url });
  } catch (error) {
    console.error('[checkout] Error:', error);
    return Response.json({ error: 'Something went wrong. Please try again.' }, { status: 500 });
  }
}
