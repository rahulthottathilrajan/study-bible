"use client";
import { useRef, useMemo, useCallback } from "react";

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

const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];

export default function VerseOfTheDay({ nav, ht }) {
  const scrollRef = useRef(null);

  // Rotate all 120 verses so today's pick is first
  const verses = useMemo(() => {
    const startIdx = getDayOfYear() % VERSES.length;
    return Array.from({ length: CARD_COUNT }, (_, i) => VERSES[(startIdx + i) % VERSES.length]);
  }, []);

  const handleNavigate = useCallback((verse) => {
    const parsed = parseRef(verse.ref);
    if (!parsed) return;
    const testament = OT_BOOKS.includes(parsed.book) ? "OT" : "NT";
    const bookName = parsed.book === "Psalm" ? "Psalms" : parsed.book;
    nav("verse", { testament, book: bookName, chapter: parsed.chapter, verse: parseInt(parsed.verse) });
  }, [nav]);

  return (
    <div style={{ marginBottom: 20 }}>
      <div style={{
        fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.accent,
        textTransform: "uppercase", letterSpacing: "0.14em", marginBottom: 12,
        display: "flex", alignItems: "center", gap: 8,
      }}>
        <span>&#10024;</span> Verse of the Day
      </div>

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
          borderRadius: 18,
          gap: 0,
        }}
      >
        <style>{`.votd-scroll::-webkit-scrollbar { display: none; }`}</style>
        {verses.map((verse, i) => {
          const g = VOTD_GRADIENTS[i % VOTD_GRADIENTS.length];
          return (
            <div
              key={i}
              onClick={() => handleNavigate(verse)}
              style={{
                flex: "0 0 100%",
                scrollSnapAlign: "start",
                cursor: "pointer",
                background: g.bg,
                borderRadius: 18,
                padding: "28px 24px 22px",
                boxShadow: "0 4px 20px rgba(0,0,0,0.15), 0 1px 3px rgba(0,0,0,0.08)",
                position: "relative",
                overflow: "hidden",
                boxSizing: "border-box",
              }}
            >
              {/* Top accent line */}
              <div style={{
                position: "absolute", top: 0, left: 0, right: 0, height: 4,
                background: `linear-gradient(90deg, transparent, ${g.accent}, transparent)`,
              }} />

              {/* Opening quote mark */}
              <div style={{
                fontFamily: "Georgia, 'Times New Roman', serif",
                fontSize: 64, lineHeight: 1, color: g.quote,
                position: "absolute", top: 8, left: 16, userSelect: "none",
              }}>{"\u201C"}</div>

              {/* Verse text */}
              <div style={{
                fontFamily: ht.body,
                fontSize: "clamp(17px, 4.5vw, 21px)",
                color: g.text,
                lineHeight: 1.9,
                fontStyle: "italic",
                padding: "8px 0 16px 22px",
              }}>
                {verse.text}
              </div>

              {/* Reference */}
              <div style={{
                fontFamily: ht.heading,
                fontSize: 15, fontWeight: 700,
                color: g.ref,
                letterSpacing: "0.02em",
                paddingLeft: 22,
              }}>
                — {verse.ref}
              </div>

              {/* Tap hint */}
              <div style={{
                fontFamily: ht.ui, fontSize: 10, color: g.hint,
                textAlign: "center", marginTop: 14,
              }}>
                Tap to read in context
              </div>
            </div>
          );
        })}
      </div>

    </div>
  );
}
