"use client";
import { useState, useRef, useMemo, useCallback, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { supabase } from "../../lib/supabase";

// ── Curated Short Verses ──
// ~45 most-memorized KJV verses, each under ~130 chars for consistent card heights
const VERSES = [
  { ref: "Psalm 23:1", text: "The LORD is my shepherd; I shall not want." },
  { ref: "Philippians 4:13", text: "I can do all things through Christ which strengtheneth me." },
  { ref: "Proverbs 3:5", text: "Trust in the LORD with all thine heart; and lean not unto thine own understanding." },
  { ref: "Genesis 1:1", text: "In the beginning God created the heaven and the earth." },
  { ref: "Psalm 46:1", text: "God is our refuge and strength, a very present help in trouble." },
  { ref: "John 14:6", text: "Jesus saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me." },
  { ref: "Romans 8:28", text: "And we know that all things work together for good to them that love God, to them who are the called according to his purpose." },
  { ref: "Psalm 119:105", text: "Thy word is a lamp unto my feet, and a light unto my path." },
  { ref: "Matthew 11:28", text: "Come unto me, all ye that labour and are heavy laden, and I will give you rest." },
  { ref: "Hebrews 11:1", text: "Now faith is the substance of things hoped for, the evidence of things not seen." },
  { ref: "1 Peter 5:7", text: "Casting all your care upon him; for he careth for you." },
  { ref: "Proverbs 3:6", text: "In all thy ways acknowledge him, and he shall direct thy paths." },
  { ref: "John 8:32", text: "And ye shall know the truth, and the truth shall make you free." },
  { ref: "1 John 4:19", text: "We love him, because he first loved us." },
  { ref: "Psalm 56:3", text: "What time I am afraid, I will trust in thee." },
  { ref: "James 4:8", text: "Draw nigh to God, and he will draw nigh to you." },
  { ref: "Hebrews 13:8", text: "Jesus Christ the same yesterday, and to day, and for ever." },
  { ref: "1 John 4:8", text: "He that loveth not knoweth not God; for God is love." },
  { ref: "Psalm 150:6", text: "Let every thing that hath breath praise the LORD. Praise ye the LORD." },
  { ref: "Psalm 51:10", text: "Create in me a clean heart, O God; and renew a right spirit within me." },
  { ref: "Proverbs 16:3", text: "Commit thy works unto the LORD, and thy thoughts shall be established." },
  { ref: "Colossians 3:23", text: "And whatsoever ye do, do it heartily, as to the Lord, and not unto men." },
  { ref: "Proverbs 4:23", text: "Keep thy heart with all diligence; for out of it are the issues of life." },
  { ref: "Psalm 118:24", text: "This is the day which the LORD hath made; we will rejoice and be glad in it." },
  { ref: "Psalm 37:4", text: "Delight thyself also in the LORD; and he shall give thee the desires of thine heart." },
  { ref: "Psalm 34:8", text: "O taste and see that the LORD is good: blessed is the man that trusteth in him." },
  { ref: "John 1:1", text: "In the beginning was the Word, and the Word was with God, and the Word was God." },
  { ref: "Romans 8:31", text: "What shall we then say to these things? If God be for us, who can be against us?" },
  { ref: "Psalm 42:1", text: "As the deer panteth after the water brooks, so panteth my soul after thee, O God." },
  { ref: "Proverbs 18:10", text: "The name of the LORD is a strong tower: the righteous runneth into it, and is safe." },
  { ref: "Psalm 19:1", text: "The heavens declare the glory of God; and the firmament sheweth his handywork." },
  { ref: "Ecclesiastes 3:1", text: "To every thing there is a season, and a time to every purpose under the heaven." },
  { ref: "Psalm 90:12", text: "So teach us to number our days, that we may apply our hearts unto wisdom." },
  { ref: "Ephesians 6:10", text: "Finally, my brethren, be strong in the Lord, and in the power of his might." },
  { ref: "Psalm 147:3", text: "He healeth the broken in heart, and bindeth up their wounds." },
  { ref: "Proverbs 31:25", text: "Strength and honour are her clothing; and she shall rejoice in time to come." },
  { ref: "1 Chronicles 16:34", text: "O give thanks unto the LORD; for he is good; for his mercy endureth for ever." },
  { ref: "Psalm 27:1", text: "The LORD is my light and my salvation; whom shall I fear? the LORD is the strength of my life; of whom shall I be afraid?" },
  { ref: "2 Timothy 1:7", text: "For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind." },
  { ref: "Romans 5:8", text: "But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us." },
  { ref: "Isaiah 26:3", text: "Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee." },
  { ref: "Matthew 7:7", text: "Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you." },
  { ref: "Romans 6:23", text: "For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord." },
  { ref: "2 Corinthians 12:9", text: "And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness." },
  { ref: "Psalm 27:14", text: "Wait on the LORD: be of good courage, and he shall strengthen thine heart: wait, I say, on the LORD." },
  { ref: "Nahum 1:7", text: "The LORD is good, a strong hold in the day of trouble; and he knoweth them that trust in him." },
  { ref: "Psalm 73:26", text: "My flesh and my heart faileth: but God is the strength of my heart, and my portion for ever." },
  { ref: "Matthew 5:16", text: "Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven." },
  { ref: "Psalm 33:4", text: "For the word of the LORD is right; and all his works are done in truth." },
];

// ── 5 gradient palettes for the carousel cards ──
const VOTD_GRADIENTS = [
  { bg: "linear-gradient(135deg, #2D1B4E 0%, #4A2D8E 40%, #1A1A3E 100%)", text: "#E8DFF5", ref: "#C9A0FF", quote: "rgba(201,160,255,0.15)", accent: "#9B6FD4", hint: "rgba(201,160,255,0.4)" },
  { bg: "linear-gradient(135deg, #3A2410 0%, #6B4A28 40%, #2A1808 100%)", text: "#F5ECD8", ref: "#D4A853", quote: "rgba(212,168,83,0.15)", accent: "#D4A853", hint: "rgba(212,168,83,0.4)" },
  { bg: "linear-gradient(135deg, #0A2A2A 0%, #1A5C5C 40%, #0A3A3A 100%)", text: "#D8F5F0", ref: "#5EC4B0", quote: "rgba(94,196,176,0.15)", accent: "#5EC4B0", hint: "rgba(94,196,176,0.4)" },
  { bg: "linear-gradient(135deg, #1A2F1A 0%, #2D5A2D 40%, #102010 100%)", text: "#D8F0D8", ref: "#7DD47D", quote: "rgba(125,212,125,0.15)", accent: "#7DD47D", hint: "rgba(125,212,125,0.4)" },
  { bg: "linear-gradient(135deg, #3A1A1A 0%, #8B2020 40%, #2A0A0A 100%)", text: "#F5DCD8", ref: "#E88A7A", quote: "rgba(232,138,122,0.15)", accent: "#E88A7A", hint: "rgba(232,138,122,0.4)" },
];

const CARD_COUNT = VERSES.length;

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / (1000 * 60 * 60 * 24));
}

function parseRef(ref) {
  const m = ref.match(/^(.+?)\s+(\d+):(.+)$/);
  if (!m) return null;
  return { book: m[1], chapter: parseInt(m[2]), verse: m[3] };
}

function formatCount(n) {
  if (!n || n <= 0) return "";
  if (n >= 1_000_000) return (n / 1_000_000).toFixed(n >= 10_000_000 ? 0 : 1).replace(/\.0$/, "") + "M";
  if (n >= 1_000) return (n / 1_000).toFixed(n >= 10_000 ? 0 : 1).replace(/\.0$/, "") + "K";
  return String(n);
}

const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];

export default function VerseOfTheDay({ nav, ht }) {
  const { user } = useApp();
  const scrollRef = useRef(null);
  const [likedSet, setLikedSet] = useState(new Set());
  const [counters, setCounters] = useState({});
  const [copied, setCopied] = useState(false);
  const loadedRef = useRef(false);

  // Rotate all verses so today's pick is first
  const verses = useMemo(() => {
    const startIdx = getDayOfYear() % VERSES.length;
    return Array.from({ length: CARD_COUNT }, (_, i) => VERSES[(startIdx + i) % VERSES.length]);
  }, []);

  // Fetch aggregate counters + user's liked verses on mount
  useEffect(() => {
    if (loadedRef.current) return;
    loadedRef.current = true;

    const refs = VERSES.map(v => v.ref);
    supabase
      .from("votd_counters")
      .select("verse_ref, like_count, share_count")
      .in("verse_ref", refs)
      .then(({ data }) => {
        if (data) {
          const map = {};
          data.forEach(row => { map[row.verse_ref] = row; });
          setCounters(map);
        }
      });

    if (user) {
      supabase
        .from("votd_user_likes")
        .select("verse_ref")
        .eq("user_id", user.id)
        .then(({ data }) => {
          if (data) setLikedSet(new Set(data.map(r => r.verse_ref)));
        });
    }
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const handleNavigate = useCallback((verse) => {
    const parsed = parseRef(verse.ref);
    if (!parsed) return;
    const testament = OT_BOOKS.includes(parsed.book) ? "OT" : "NT";
    const bookName = parsed.book === "Psalm" ? "Psalms" : parsed.book;
    nav("verse", { testament, book: bookName, chapter: parsed.chapter, verse: parseInt(parsed.verse) });
  }, [nav]);

  const handleLike = useCallback((verse) => {
    const ref = verse.ref;
    const wasLiked = likedSet.has(ref);

    // Optimistic UI
    setLikedSet(prev => {
      const next = new Set(prev);
      if (wasLiked) next.delete(ref); else next.add(ref);
      return next;
    });
    setCounters(prev => {
      const cur = prev[ref] || { like_count: 0, share_count: 0 };
      return { ...prev, [ref]: { ...cur, like_count: Math.max(0, cur.like_count + (wasLiked ? -1 : 1)) } };
    });

    // Fire-and-forget RPC for aggregate counter
    if (wasLiked) {
      supabase.rpc("decrement_votd_like", { target_ref: ref });
    } else {
      supabase.rpc("increment_votd_like", { target_ref: ref });
    }

    // Persist per-user like (authenticated only)
    if (user) {
      if (wasLiked) {
        supabase.from("votd_user_likes").delete().eq("user_id", user.id).eq("verse_ref", ref);
      } else {
        supabase.from("votd_user_likes").insert({ user_id: user.id, verse_ref: ref });
      }
    }
  }, [likedSet, user]);

  const handleShare = useCallback(async (verse) => {
    const text = `"${verse.text}" — ${verse.ref} (KJV)`;
    let shared = false;
    if (navigator.share) {
      try { await navigator.share({ text }); shared = true; } catch {}
    } else {
      try { await navigator.clipboard.writeText(text); setCopied(true); setTimeout(() => setCopied(false), 2000); shared = true; } catch {}
    }
    if (shared) {
      setCounters(prev => {
        const cur = prev[verse.ref] || { like_count: 0, share_count: 0 };
        return { ...prev, [verse.ref]: { ...cur, share_count: cur.share_count + 1 } };
      });
      supabase.rpc("increment_votd_share", { target_ref: verse.ref });
    }
  }, []);

  return (
    <div style={{ marginBottom: 16 }}>
      {/* Scroll container */}
      <div
        ref={scrollRef}
        className="votd-scroll"
        style={{
          display: "flex",
          overflowX: "auto",
          scrollSnapType: "x mandatory",
          WebkitOverflowScrolling: "touch",
          scrollbarWidth: "none",
          msOverflowStyle: "none",
          borderRadius: 14,
          gap: 0,
        }}
      >
        <style>{`.votd-scroll::-webkit-scrollbar { display: none; }`}</style>
        {verses.map((verse, i) => {
          const g = VOTD_GRADIENTS[i % VOTD_GRADIENTS.length];
          const isLiked = likedSet.has(verse.ref);
          const likeCount = formatCount(counters[verse.ref]?.like_count);
          const shareCount = formatCount(counters[verse.ref]?.share_count);
          return (
            <div
              key={i}
              style={{
                flex: "0 0 100%",
                scrollSnapAlign: "start",
                background: g.bg,
                borderRadius: 14,
                padding: "16px 18px 12px",
                boxShadow: "0 2px 12px rgba(0,0,0,0.12)",
                position: "relative",
                overflow: "hidden",
                boxSizing: "border-box",
              }}
            >
              {/* Top accent line */}
              <div style={{
                position: "absolute", top: 0, left: 0, right: 0, height: 3,
                background: `linear-gradient(90deg, transparent, ${g.accent}, transparent)`,
              }} />

              {/* Verse text — compact */}
              <div
                onClick={() => handleNavigate(verse)}
                style={{
                  cursor: "pointer",
                  fontFamily: ht.body,
                  fontSize: "clamp(13px, 3.5vw, 16px)",
                  color: g.text,
                  lineHeight: 1.7,
                  fontStyle: "italic",
                  padding: "4px 0 8px 0",
                }}
              >
                &ldquo;{verse.text}&rdquo;
              </div>

              {/* Reference + actions row */}
              <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between" }}>
                <div
                  onClick={() => handleNavigate(verse)}
                  style={{
                    cursor: "pointer",
                    fontFamily: ht.heading,
                    fontSize: 12, fontWeight: 700,
                    color: g.ref,
                    letterSpacing: "0.02em",
                  }}
                >
                  — {verse.ref}
                </div>

                {/* Social icons — Heart + Share */}
                <div style={{ display: "flex", alignItems: "center", gap: 14 }}>
                  {/* Heart */}
                  <button onClick={(e) => { e.stopPropagation(); handleLike(verse); }}
                    style={{ background: "none", border: "none", cursor: "pointer", padding: 2, display: "flex", alignItems: "center", gap: 4, transition: "transform 0.15s" }}
                    aria-label={isLiked ? "Unlike verse" : "Like verse"}>
                    <svg width="18" height="18" viewBox="0 0 24 24" fill={isLiked ? "#EF4444" : "none"} stroke={isLiked ? "#EF4444" : (g.hint || g.ref)} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
                      <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                    </svg>
                    {likeCount && <span style={{ fontFamily: ht.ui, fontSize: 10, color: g.hint || g.ref, fontWeight: 600 }}>{likeCount}</span>}
                  </button>
                  {/* Share */}
                  <button onClick={(e) => { e.stopPropagation(); handleShare(verse); }}
                    style={{ background: "none", border: "none", cursor: "pointer", padding: 2, display: "flex", alignItems: "center", gap: 4, position: "relative" }}
                    aria-label="Share verse">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke={g.hint || g.ref} strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
                      <path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"/><polyline points="16 6 12 2 8 6"/><line x1="12" y1="2" x2="12" y2="15"/>
                    </svg>
                    {shareCount && <span style={{ fontFamily: ht.ui, fontSize: 10, color: g.hint || g.ref, fontWeight: 600 }}>{shareCount}</span>}
                    {copied && <span style={{ position: "absolute", top: -20, left: "50%", transform: "translateX(-50%)", fontFamily: ht.ui, fontSize: 9, color: g.accent, whiteSpace: "nowrap", fontWeight: 600 }}>Copied!</span>}
                  </button>
                </div>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
