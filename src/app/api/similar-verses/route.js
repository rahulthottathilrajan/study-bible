export const dynamic = 'force-dynamic';

export async function POST(request) {
  const { createClient } = await import('@supabase/supabase-js');

  let body;
  try {
    body = await request.json();
  } catch {
    return Response.json({ error: 'Invalid request body' }, { status: 400 });
  }

  const { verse_ref } = body;
  if (!verse_ref || typeof verse_ref !== 'string') {
    return Response.json({ error: 'verse_ref is required' }, { status: 400 });
  }

  // Sanitize: max 100 chars, must look like a verse ref
  const safeRef = String(verse_ref).trim().slice(0, 100);

  try {
    const supabaseAdmin = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL,
      process.env.SUPABASE_SERVICE_ROLE_KEY
    );

    const { data, error } = await supabaseAdmin.rpc('find_similar_verses', {
      target_ref: safeRef,
      match_count: 5,
    });

    if (error) {
      console.error('[similar-verses] RPC error:', error);
      return Response.json({ error: 'Failed to find similar verses' }, { status: 500 });
    }

    const results = (data || []).map(r => ({
      verse_ref: r.verse_ref,
      kjv_text: r.kjv_text,
      similarity: Math.round(r.similarity * 100) / 100,
    }));

    return Response.json({ results });
  } catch (err) {
    console.error('[similar-verses] Error:', err);
    return Response.json({ error: 'Something went wrong' }, { status: 500 });
  }
}
