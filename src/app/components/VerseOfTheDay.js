"use client";
import { useState, useEffect, useMemo } from "react";

// ── Curated Verses ──
// 120 beloved passages — the day-of-year picks one deterministically
const VERSES = [
  { ref: "John 3:16", text: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life." },
  { ref: "Psalm 23:1", text: "The LORD is my shepherd; I shall not want." },
  { ref: "Proverbs 3:5", text: "Trust in the LORD with all thine heart; and lean not unto thine own understanding." },
  { ref: "Romans 8:28", text: "And we know that all things work together for good to them that love God, to them who are the called according to his purpose." },
  { ref: "Isaiah 40:31", text: "But they that wait upon the LORD shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint." },
  { ref: "Philippians 4:13", text: "I can do all things through Christ which strengtheneth me." },
  { ref: "Jeremiah 29:11", text: "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end." },
  { ref: "Psalm 46:10", text: "Be still, and know that I am God: I will be exalted among the heathen, I will be exalted in the earth." },
  { ref: "Matthew 11:28", text: "Come unto me, all ye that labour and are heavy laden, and I will give you rest." },
  { ref: "Romans 12:2", text: "And be not conformed to this world: but be ye transformed by the renewing of your mind, that ye may prove what is that good, and acceptable, and perfect, will of God." },
  { ref: "2 Timothy 1:7", text: "For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind." },
  { ref: "Psalm 119:105", text: "Thy word is a lamp unto my feet, and a light unto my path." },
  { ref: "Joshua 1:9", text: "Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest." },
  { ref: "Galatians 5:22-23", text: "But the fruit of the Spirit is love, joy, peace, longsuffering, gentleness, goodness, faith, meekness, temperance: against such there is no law." },
  { ref: "Hebrews 11:1", text: "Now faith is the substance of things hoped for, the evidence of things not seen." },
  { ref: "Psalm 27:1", text: "The LORD is my light and my salvation; whom shall I fear? the LORD is the strength of my life; of whom shall I be afraid?" },
  { ref: "Isaiah 41:10", text: "Fear thou not; for I am with thee: be not dismayed; for I am thy God: I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness." },
  { ref: "Romans 5:8", text: "But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us." },
  { ref: "Psalm 34:8", text: "O taste and see that the LORD is good: blessed is the man that trusteth in him." },
  { ref: "Ephesians 2:8-9", text: "For by grace are ye saved through faith; and that not of yourselves: it is the gift of God: not of works, lest any man should boast." },
  { ref: "1 Corinthians 13:4-5", text: "Charity suffereth long, and is kind; charity envieth not; charity vaunteth not itself, is not puffed up, doth not behave itself unseemly, seeketh not her own, is not easily provoked, thinketh no evil." },
  { ref: "Psalm 37:4", text: "Delight thyself also in the LORD; and he shall give thee the desires of thine heart." },
  { ref: "Matthew 6:33", text: "But seek ye first the kingdom of God, and his righteousness; and all these things shall be added unto you." },
  { ref: "Colossians 3:23", text: "And whatsoever ye do, do it heartily, as to the Lord, and not unto men." },
  { ref: "Psalm 91:1-2", text: "He that dwelleth in the secret place of the most High shall abide under the shadow of the Almighty. I will say of the LORD, He is my refuge and my fortress: my God; in him will I trust." },
  { ref: "1 Peter 5:7", text: "Casting all your care upon him; for he careth for you." },
  { ref: "Psalm 139:14", text: "I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well." },
  { ref: "Lamentations 3:22-23", text: "It is of the LORD's mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness." },
  { ref: "James 1:5", text: "If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him." },
  { ref: "Matthew 5:16", text: "Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven." },
  { ref: "Deuteronomy 31:6", text: "Be strong and of a good courage, fear not, nor be afraid of them: for the LORD thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee." },
  { ref: "Psalm 121:1-2", text: "I will lift up mine eyes unto the hills, from whence cometh my help. My help cometh from the LORD, which made heaven and earth." },
  { ref: "2 Corinthians 5:17", text: "Therefore if any man be in Christ, he is a new creature: old things are passed away; behold, all things are become new." },
  { ref: "Philippians 4:6-7", text: "Be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto God. And the peace of God, which passeth all understanding, shall keep your hearts and minds through Christ Jesus." },
  { ref: "Psalm 100:4-5", text: "Enter into his gates with thanksgiving, and into his courts with praise: be thankful unto him, and bless his name. For the LORD is good; his mercy is everlasting; and his truth endureth to all generations." },
  { ref: "Proverbs 16:3", text: "Commit thy works unto the LORD, and thy thoughts shall be established." },
  { ref: "Romans 15:13", text: "Now the God of hope fill you with all joy and peace in believing, that ye may abound in hope, through the power of the Holy Ghost." },
  { ref: "Isaiah 53:5", text: "But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed." },
  { ref: "Psalm 51:10", text: "Create in me a clean heart, O God; and renew a right spirit within me." },
  { ref: "1 John 4:19", text: "We love him, because he first loved us." },
  { ref: "Micah 6:8", text: "He hath shewed thee, O man, what is good; and what doth the LORD require of thee, but to do justly, and to love mercy, and to walk humbly with thy God?" },
  { ref: "Psalm 16:11", text: "Thou wilt shew me the path of life: in thy presence is fulness of joy; at thy right hand there are pleasures for evermore." },
  { ref: "Hebrews 12:2", text: "Looking unto Jesus the author and finisher of our faith; who for the joy that was set before him endured the cross, despising the shame, and is set down at the right hand of the throne of God." },
  { ref: "Psalm 18:2", text: "The LORD is my rock, and my fortress, and my deliverer; my God, my strength, in whom I will trust; my buckler, and the horn of my salvation, and my high tower." },
  { ref: "Genesis 1:1", text: "In the beginning God created the heaven and the earth." },
  { ref: "Romans 8:38-39", text: "For I am persuaded, that neither death, nor life, nor angels, nor principalities, nor powers, nor things present, nor things to come, nor height, nor depth, nor any other creature, shall be able to separate us from the love of God, which is in Christ Jesus our Lord." },
  { ref: "Psalm 103:2-3", text: "Bless the LORD, O my soul, and forget not all his benefits: who forgiveth all thine iniquities; who healeth all thy diseases." },
  { ref: "Proverbs 18:10", text: "The name of the LORD is a strong tower: the righteous runneth into it, and is safe." },
  { ref: "John 14:6", text: "Jesus saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me." },
  { ref: "Matthew 28:20", text: "Teaching them to observe all things whatsoever I have commanded you: and, lo, I am with you always, even unto the end of the world. Amen." },
  { ref: "Psalm 42:1", text: "As the deer panteth after the water brooks, so panteth my soul after thee, O God." },
  { ref: "Isaiah 26:3", text: "Thou wilt keep him in perfect peace, whose mind is stayed on thee: because he trusteth in thee." },
  { ref: "John 8:32", text: "And ye shall know the truth, and the truth shall make you free." },
  { ref: "Psalm 4:8", text: "I will both lay me down in peace, and sleep: for thou, LORD, only makest me dwell in safety." },
  { ref: "1 Thessalonians 5:16-18", text: "Rejoice evermore. Pray without ceasing. In every thing give thanks: for this is the will of God in Christ Jesus concerning you." },
  { ref: "Proverbs 22:6", text: "Train up a child in the way he should go: and when he is old, he will not depart from it." },
  { ref: "Psalm 62:1-2", text: "Truly my soul waiteth upon God: from him cometh my salvation. He only is my rock and my salvation; he is my defence; I shall not be greatly moved." },
  { ref: "2 Corinthians 12:9", text: "And he said unto me, My grace is sufficient for thee: for my strength is made perfect in weakness." },
  { ref: "Revelation 21:4", text: "And God shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away." },
  { ref: "Psalm 23:4", text: "Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me." },
  { ref: "John 1:1", text: "In the beginning was the Word, and the Word was with God, and the Word was God." },
  { ref: "Proverbs 4:23", text: "Keep thy heart with all diligence; for out of it are the issues of life." },
  { ref: "Matthew 7:7", text: "Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you." },
  { ref: "Psalm 145:18", text: "The LORD is nigh unto all them that call upon him, to all that call upon him in truth." },
  { ref: "Isaiah 55:8-9", text: "For my thoughts are not your thoughts, neither are your ways my ways, saith the LORD. For as the heavens are higher than the earth, so are my ways higher than your ways, and my thoughts than your thoughts." },
  { ref: "Romans 6:23", text: "For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord." },
  { ref: "Psalm 19:1", text: "The heavens declare the glory of God; and the firmament sheweth his handywork." },
  { ref: "Ecclesiastes 3:1", text: "To every thing there is a season, and a time to every purpose under the heaven." },
  { ref: "1 John 1:9", text: "If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness." },
  { ref: "Psalm 34:18", text: "The LORD is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit." },
  { ref: "Hebrews 13:8", text: "Jesus Christ the same yesterday, and to day, and for ever." },
  { ref: "Proverbs 3:6", text: "In all thy ways acknowledge him, and he shall direct thy paths." },
  { ref: "Matthew 19:26", text: "But Jesus beheld them, and said unto them, With men this is impossible; but with God all things are possible." },
  { ref: "Psalm 90:12", text: "So teach us to number our days, that we may apply our hearts unto wisdom." },
  { ref: "John 10:10", text: "The thief cometh not, but for to steal, and to kill, and to destroy: I am come that they might have life, and that they might have it more abundantly." },
  { ref: "Nahum 1:7", text: "The LORD is good, a strong hold in the day of trouble; and he knoweth them that trust in him." },
  { ref: "James 4:8", text: "Draw nigh to God, and he will draw nigh to you." },
  { ref: "Psalm 73:26", text: "My flesh and my heart faileth: but God is the strength of my heart, and my portion for ever." },
  { ref: "Romans 10:9", text: "That if thou shalt confess with thy mouth the Lord Jesus, and shalt believe in thine heart that God hath raised him from the dead, thou shalt be saved." },
  { ref: "2 Chronicles 7:14", text: "If my people, which are called by my name, shall humble themselves, and pray, and seek my face, and turn from their wicked ways; then will I hear from heaven, and will forgive their sin, and will heal their land." },
  { ref: "Psalm 46:1", text: "God is our refuge and strength, a very present help in trouble." },
  { ref: "John 15:5", text: "I am the vine, ye are the branches: He that abideth in me, and I in him, the same bringeth forth much fruit: for without me ye can do nothing." },
  { ref: "Isaiah 43:2", text: "When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee." },
  { ref: "Psalm 8:1", text: "O LORD our Lord, how excellent is thy name in all the earth! who hast set thy glory above the heavens." },
  { ref: "1 Corinthians 10:13", text: "There hath no temptation taken you but such as is common to man: but God is faithful, who will not suffer you to be tempted above that ye are able; but will with the temptation also make a way to escape, that ye may be able to bear it." },
  { ref: "Proverbs 27:17", text: "Iron sharpeneth iron; so a man sharpeneth the countenance of his friend." },
  { ref: "Ephesians 6:10", text: "Finally, my brethren, be strong in the Lord, and in the power of his might." },
  { ref: "Psalm 147:3", text: "He healeth the broken in heart, and bindeth up their wounds." },
  { ref: "John 16:33", text: "These things I have spoken unto you, that in me ye might have peace. In the world ye shall have tribulation: but be of good cheer; I have overcome the world." },
  { ref: "Numbers 6:24-26", text: "The LORD bless thee, and keep thee: the LORD make his face shine upon thee, and be gracious unto thee: the LORD lift up his countenance upon thee, and give thee peace." },
  { ref: "Psalm 55:22", text: "Cast thy burden upon the LORD, and he shall sustain thee: he shall never suffer the righteous to be moved." },
  { ref: "Matthew 5:6", text: "Blessed are they which do hunger and thirst after righteousness: for they shall be filled." },
  { ref: "1 Chronicles 16:34", text: "O give thanks unto the LORD; for he is good; for his mercy endureth for ever." },
  { ref: "Zephaniah 3:17", text: "The LORD thy God in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing." },
  { ref: "Psalm 32:8", text: "I will instruct thee and teach thee in the way which thou shalt go: I will guide thee with mine eye." },
  { ref: "John 11:25", text: "Jesus said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live." },
  { ref: "Isaiah 12:2", text: "Behold, God is my salvation; I will trust, and not be afraid: for the LORD JEHOVAH is my strength and my song; he also is become my salvation." },
  { ref: "Psalm 150:6", text: "Let every thing that hath breath praise the LORD. Praise ye the LORD." },
  { ref: "Matthew 6:26", text: "Behold the fowls of the air: for they sow not, neither do they reap, nor gather into barns; yet your heavenly Father feedeth them. Are ye not much better than they?" },
  { ref: "1 John 4:8", text: "He that loveth not knoweth not God; for God is love." },
  { ref: "Psalm 63:1", text: "O God, thou art my God; early will I seek thee: my soul thirsteth for thee, my flesh longeth for thee in a dry and thirsty land, where no water is." },
  { ref: "Habakkuk 2:14", text: "For the earth shall be filled with the knowledge of the glory of the LORD, as the waters cover the sea." },
  { ref: "Hebrews 4:16", text: "Let us therefore come boldly unto the throne of grace, that we may obtain mercy, and find grace to help in time of need." },
  { ref: "Proverbs 31:25", text: "Strength and honour are her clothing; and she shall rejoice in time to come." },
  { ref: "Psalm 118:24", text: "This is the day which the LORD hath made; we will rejoice and be glad in it." },
  { ref: "John 14:27", text: "Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid." },
  { ref: "Psalm 56:3", text: "What time I am afraid, I will trust in thee." },
  { ref: "Romans 8:31", text: "What shall we then say to these things? If God be for us, who can be against us?" },
  { ref: "Isaiah 9:6", text: "For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counseller, The mighty God, The everlasting Father, The Prince of Peace." },
  { ref: "Psalm 27:14", text: "Wait on the LORD: be of good courage, and he shall strengthen thine heart: wait, I say, on the LORD." },
  { ref: "2 Peter 3:9", text: "The Lord is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance." },
  { ref: "Psalm 33:4", text: "For the word of the LORD is right; and all his works are done in truth." },
  { ref: "Matthew 22:37-38", text: "Jesus said unto him, Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment." },
  { ref: "Psalm 40:1-2", text: "I waited patiently for the LORD; and he inclined unto me, and heard my cry. He brought me up also out of an horrible pit, out of the miry clay, and set my feet upon a rock, and established my goings." },
  { ref: "Philippians 1:6", text: "Being confident of this very thing, that he which hath begun a good work in you will perform it until the day of Jesus Christ." },
  { ref: "Psalm 138:8", text: "The LORD will perfect that which concerneth me: thy mercy, O LORD, endureth for ever: forsake not the works of thine own hands." },
  { ref: "John 13:34", text: "A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another." },
  { ref: "Psalm 86:15", text: "But thou, O Lord, art a God full of compassion, and gracious, longsuffering, and plenteous in mercy and truth." },
];

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  const diff = now - start;
  return Math.floor(diff / (1000 * 60 * 60 * 24));
}

function parseRef(ref) {
  // Parse "Book Chapter:Verse" or "Book Chapter:Verse-Verse"
  const m = ref.match(/^(.+?)\s+(\d+):(.+)$/);
  if (!m) return null;
  return { book: m[1], chapter: parseInt(m[2]), verse: m[3] };
}

export default function VerseOfTheDay({ nav, ht }) {
  const [refreshKey, setRefreshKey] = useState(0);

  const verse = useMemo(() => {
    const idx = (getDayOfYear() + refreshKey) % VERSES.length;
    return VERSES[idx];
  }, [refreshKey]);

  const parsed = parseRef(verse.ref);

  const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];

  const handleNavigate = () => {
    if (!parsed) return;
    const testament = OT_BOOKS.includes(parsed.book) ? "OT" : "NT";
    // Map book names that might differ (e.g. Psalms vs Psalm)
    const bookName = parsed.book === "Psalm" ? "Psalms" : parsed.book;
    nav("verse", { testament, book: bookName, chapter: parsed.chapter, verse: parseInt(parsed.verse) });
  };

  return (
    <div style={{ marginBottom: 18 }}>
      <div style={{
        fontFamily: ht.ui, fontSize: 10, fontWeight: 700, color: ht.muted,
        textTransform: "uppercase", letterSpacing: "0.12em", marginBottom: 10,
        display: "flex", alignItems: "center", gap: 8,
      }}>
        <span>✨</span> Verse of the Day
      </div>

      <div
        onClick={handleNavigate}
        style={{
          cursor: "pointer",
          background: `linear-gradient(135deg, ${ht.card} 0%, ${ht.accentLight || ht.card} 100%)`,
          borderRadius: 16,
          padding: "20px 20px 16px",
          border: `1.5px solid ${ht.accentBorder || ht.divider}`,
          boxShadow: `0 2px 12px rgba(0,0,0,0.06), inset 0 1px 0 rgba(255,255,255,0.1)`,
          position: "relative",
          overflow: "hidden",
          animation: "fadeIn 0.4s ease",
        }}
      >
        {/* Decorative accent line */}
        <div style={{
          position: "absolute", top: 0, left: 0, right: 0, height: 3,
          background: `linear-gradient(90deg, transparent, ${ht.accent}, transparent)`,
        }} />

        {/* Opening quote mark */}
        <div style={{
          fontFamily: "Georgia, 'Times New Roman', serif",
          fontSize: 48, lineHeight: 1, color: `${ht.accent}30`,
          position: "absolute", top: 10, left: 14, userSelect: "none",
        }}>"</div>

        {/* Verse text */}
        <div style={{
          fontFamily: ht.body,
          fontSize: 15,
          color: ht.dark || ht.text,
          lineHeight: 1.8,
          fontStyle: "italic",
          padding: "4px 0 12px 18px",
        }}>
          {verse.text}
        </div>

        {/* Reference + refresh */}
        <div style={{
          display: "flex", alignItems: "center", justifyContent: "space-between",
          paddingLeft: 18,
        }}>
          <div style={{
            fontFamily: ht.heading,
            fontSize: 13, fontWeight: 700,
            color: ht.accent,
            letterSpacing: "0.02em",
          }}>
            — {verse.ref}
          </div>

          <button
            onClick={(e) => { e.stopPropagation(); setRefreshKey(k => k + 1); }}
            title="Show another verse"
            style={{
              background: `${ht.accent}15`,
              border: `1px solid ${ht.accent}30`,
              borderRadius: 8,
              padding: "5px 10px",
              cursor: "pointer",
              display: "flex", alignItems: "center", gap: 4,
              transition: "background 0.2s",
            }}
          >
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke={ht.accent} strokeWidth="2.5" strokeLinecap="round">
              <path d="M23 4v6h-6"/><path d="M1 20v-6h6"/>
              <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"/>
            </svg>
            <span style={{ fontFamily: ht.ui, fontSize: 9, fontWeight: 700, color: ht.accent, textTransform: "uppercase", letterSpacing: "0.05em" }}>
              Another
            </span>
          </button>
        </div>

        {/* Tap hint */}
        <div style={{
          fontFamily: ht.ui, fontSize: 9.5, color: ht.light || ht.muted,
          textAlign: "center", marginTop: 10, opacity: 0.7,
        }}>
          Tap to read in context
        </div>
      </div>
    </div>
  );
}
