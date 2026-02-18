import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

const supabaseAdmin = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const PRICES = {
  monthly: process.env.STRIPE_PRICE_MONTHLY,
  yearly: process.env.STRIPE_PRICE_YEARLY,
  lifetime: process.env.STRIPE_PRICE_LIFETIME,
};

export async function POST(request) {
  try {
    const { plan, userId, email } = await request.json();

    if (!plan || !userId || !email) {
      return Response.json({ error: 'Missing required fields' }, { status: 400 });
    }

    if (!PRICES[plan]) {
      return Response.json({ error: 'Invalid plan' }, { status: 400 });
    }

    // Check if user already has a Stripe customer
    const { data: sub } = await supabaseAdmin
      .from('subscriptions')
      .select('stripe_customer_id')
      .eq('user_id', userId)
      .single();

    let customerId = sub?.stripe_customer_id;

    // Create Stripe customer if needed
    if (!customerId) {
      const customer = await stripe.customers.create({
        email,
        metadata: { supabase_user_id: userId },
      });
      customerId = customer.id;

      // Save customer ID
      await supabaseAdmin
        .from('subscriptions')
        .upsert({ user_id: userId, stripe_customer_id: customerId, plan: 'free', status: 'active' });
    }

    // Create checkout session
    const sessionParams = {
      customer: customerId,
      payment_method_types: ['card'],
      line_items: [{ price: PRICES[plan], quantity: 1 }],
      success_url: `${process.env.NEXT_PUBLIC_SITE_URL}?payment=success`,
      cancel_url: `${process.env.NEXT_PUBLIC_SITE_URL}?payment=cancelled`,
      metadata: { userId, plan },
    };

    // Lifetime is one-time payment, others are subscriptions
    if (plan === 'lifetime') {
      sessionParams.mode = 'payment';
    } else {
      sessionParams.mode = 'subscription';
    }

    const session = await stripe.checkout.sessions.create(sessionParams);

    return Response.json({ url: session.url });
  } catch (error) {
    console.error('Stripe checkout error:', error);
    return Response.json({ error: error.message }, { status: 500 });
  }
}