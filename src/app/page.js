"use client";
import { useState, useEffect, useCallback, useMemo } from "react";
import { supabase } from "../lib/supabase";

// ═══════════════════════════════════════════════════
// THEME SYSTEM — 4 unique themes for different Bible sections
// ═══════════════════════════════════════════════════

const THEMES = {
  // 🏠 HOME — welcoming blend
  home: {
    heading: "'DM Serif Display', serif",
    body: "'Lora', serif",
    ui: "'Outfit', sans-serif",
    bg: "#FAF6F0",
    card: "#fff",
    headerGradient: "linear-gradient(165deg, #1C2B1F 0%, #2D1B4E 50%, #1A2F4B 100%)",
    headerText: "#F0E8D8",
    accent: "#D4A853",
    accentLight: "rgba(212,168,83,0.1)",
    accentBorder: "rgba(212,168,83,0.25)",
    dark: "#1C1612",
    text: "#3A3028",
    muted: "#7A6B55",
    light: "#B0A08A",
    divider: "rgba(180,160,130,0.2)",
    tabActive: "#2D1B4E",
    verseNum: "#D4A853",
    hebrewBg: "rgba(212,168,83,0.08)",
  },

  // 🌿 SUNSET GARDEN — Pentateuch & Historical
  garden: {
    heading: "'DM Serif Display', serif",
    body: "'Lora', serif",
    ui: "'Outfit', sans-serif",
    bg: "#FDF6EE",
    card: "#fff",
    headerGradient: "linear-gradient(165deg, #1C2B1F 0%, #2E4A33 100%)",
    headerText: "#F0E0C8",
    accent: "#C06C3E",
    accentLight: "rgba(192,108,62,0.08)",
    accentBorder: "rgba(192,108,62,0.2)",
    dark: "#1C2B1F",
    text: "#3A3028",
    muted: "#8B7355",
    light: "#B0A08A",
    divider: "rgba(180,160,130,0.2)",
    tabActive: "#2E4A33",
    verseNum: "#C06C3E",
    hebrewBg: "#F5EBDD",
    secondaryAccent: "#E09858",
  },

  // 👑 ROYAL PURPLE — Wisdom & Epistles
  royal: {
    heading: "'Playfair Display', serif",
    body: "'Lora', serif",
    ui: "'Poppins', sans-serif",
    bg: "#FAF5FF",
    card: "#fff",
    headerGradient: "linear-gradient(165deg, #2D1052 0%, #5B2D8E 100%)",
    headerText: "#E8D5FF",
    accent: "#8B5CF6",
    accentLight: "rgba(139,92,246,0.06)",
    accentBorder: "rgba(139,92,246,0.18)",
    dark: "#2D1052",
    text: "#3D2A5C",
    muted: "#8B72B2",
    light: "#BBA8D8",
    divider: "rgba(139,92,246,0.12)",
    tabActive: "#5B2D8E",
    verseNum: "#8B5CF6",
    hebrewBg: "#F0E6FF",
    secondaryAccent: "#D4A853",
  },

  // 🔥 WARM SUNRISE — Prophets & Revelation
  sunrise: {
    heading: "'DM Serif Display', serif",
    body: "'Lora', serif",
    ui: "'Nunito', sans-serif",
    bg: "#FFF8F0",
    card: "#fff",
    headerGradient: "linear-gradient(165deg, #2D1B4E 0%, #4A2D6B 100%)",
    headerText: "#F8E8D0",
    accent: "#E8625C",
    accentLight: "rgba(232,98,92,0.06)",
    accentBorder: "rgba(232,98,92,0.18)",
    dark: "#2D1B4E",
    text: "#4A3B2D",
    muted: "#8B6B4F",
    light: "#C0A888",
    divider: "rgba(232,98,92,0.12)",
    tabActive: "#4A2D6B",
    verseNum: "#E8625C",
    hebrewBg: "#FFF0E0",
    secondaryAccent: "#F2994A",
  },

  // 🌊 OCEAN OF PEACE — Gospels
  ocean: {
    heading: "'Merriweather', serif",
    body: "'Lora', serif",
    ui: "'Quicksand', sans-serif",
    bg: "#F0F7F5",
    card: "#fff",
    headerGradient: "linear-gradient(165deg, #1A2F4B 0%, #1B5E5A 100%)",
    headerText: "#D4F0EB",
    accent: "#1B7A6E",
    accentLight: "rgba(27,122,110,0.06)",
    accentBorder: "rgba(27,122,110,0.18)",
    dark: "#1A2F4B",
    text: "#2A4A44",
    muted: "#5A8A82",
    light: "#90BAB2",
    divider: "rgba(27,122,110,0.12)",
    tabActive: "#1B5E5A",
    verseNum: "#1B7A6E",
    hebrewBg: "#E0F2EE",
    secondaryAccent: "#48B0A2",
  },
};

// Map categories to themes
const CATEGORY_THEME = {
  "Pentateuch": "garden",
  "Historical": "garden",
  "Wisdom": "royal",
  "Major Prophets": "sunrise",
  "Minor Prophets": "sunrise",
  "Gospels": "ocean",
  "Pauline Epistles": "royal",
  "Pastoral Epistles": "royal",
  "General Epistles": "royal",
  "Prophecy": "sunrise",
};

// ─── BIBLE STRUCTURE ───
const BIBLE_BOOKS = [
  { name: "Genesis", testament: "OT", category: "Pentateuch", chapters: 50, original: "בְּרֵאשִׁית", meaning: "In the Beginning", author: "Moses", dateWritten: "c. 1446–1406 BC" },
  { name: "Exodus", testament: "OT", category: "Pentateuch", chapters: 40, original: "שְׁמוֹת", meaning: "Names" },
  { name: "Leviticus", testament: "OT", category: "Pentateuch", chapters: 27, original: "וַיִּקְרָא", meaning: "And He Called" },
  { name: "Numbers", testament: "OT", category: "Pentateuch", chapters: 36, original: "בְּמִדְבַּר", meaning: "In the Wilderness" },
  { name: "Deuteronomy", testament: "OT", category: "Pentateuch", chapters: 34, original: "דְּבָרִים", meaning: "Words" },
  { name: "Joshua", testament: "OT", category: "Historical", chapters: 24, original: "יְהוֹשֻׁעַ", meaning: "Yahweh is Salvation" },
  { name: "Judges", testament: "OT", category: "Historical", chapters: 21, original: "שׁוֹפְטִים", meaning: "Judges" },
  { name: "Ruth", testament: "OT", category: "Historical", chapters: 4, original: "רוּת", meaning: "Friend" },
  { name: "1 Samuel", testament: "OT", category: "Historical", chapters: 31, original: "שְׁמוּאֵל א", meaning: "Heard by God" },
  { name: "2 Samuel", testament: "OT", category: "Historical", chapters: 24, original: "שְׁמוּאֵל ב", meaning: "Heard by God" },
  { name: "1 Kings", testament: "OT", category: "Historical", chapters: 22, original: "מְלָכִים א", meaning: "Kings" },
  { name: "2 Kings", testament: "OT", category: "Historical", chapters: 25, original: "מְלָכִים ב", meaning: "Kings" },
  { name: "1 Chronicles", testament: "OT", category: "Historical", chapters: 29, original: "דִּבְרֵי הַיָּמִים א", meaning: "Words of the Days" },
  { name: "2 Chronicles", testament: "OT", category: "Historical", chapters: 36, original: "דִּבְרֵי הַיָּמִים ב", meaning: "Words of the Days" },
  { name: "Ezra", testament: "OT", category: "Historical", chapters: 10, original: "עֶזְרָא", meaning: "Help" },
  { name: "Nehemiah", testament: "OT", category: "Historical", chapters: 13, original: "נְחֶמְיָה", meaning: "Comforted by Yahweh" },
  { name: "Esther", testament: "OT", category: "Historical", chapters: 10, original: "אֶסְתֵּר", meaning: "Star" },
  { name: "Job", testament: "OT", category: "Wisdom", chapters: 42, original: "אִיּוֹב", meaning: "Persecuted" },
  { name: "Psalms", testament: "OT", category: "Wisdom", chapters: 150, original: "תְּהִלִּים", meaning: "Praises" },
  { name: "Proverbs", testament: "OT", category: "Wisdom", chapters: 31, original: "מִשְׁלֵי", meaning: "Proverbs" },
  { name: "Ecclesiastes", testament: "OT", category: "Wisdom", chapters: 12, original: "קֹהֶלֶת", meaning: "Preacher" },
  { name: "Song of Solomon", testament: "OT", category: "Wisdom", chapters: 8, original: "שִׁיר הַשִּׁירִים", meaning: "Song of Songs" },
  { name: "Isaiah", testament: "OT", category: "Major Prophets", chapters: 66, original: "יְשַׁעְיָהוּ", meaning: "Salvation of Yahweh" },
  { name: "Jeremiah", testament: "OT", category: "Major Prophets", chapters: 52, original: "יִרְמְיָהוּ", meaning: "Yahweh Exalts" },
  { name: "Lamentations", testament: "OT", category: "Major Prophets", chapters: 5, original: "אֵיכָה", meaning: "How!" },
  { name: "Ezekiel", testament: "OT", category: "Major Prophets", chapters: 48, original: "יְחֶזְקֵאל", meaning: "God Strengthens" },
  { name: "Daniel", testament: "OT", category: "Major Prophets", chapters: 12, original: "דָּנִיֵּאל", meaning: "God is my Judge" },
  { name: "Hosea", testament: "OT", category: "Minor Prophets", chapters: 14, original: "הוֹשֵׁעַ", meaning: "Salvation" },
  { name: "Joel", testament: "OT", category: "Minor Prophets", chapters: 3, original: "יוֹאֵל", meaning: "Yahweh is God" },
  { name: "Amos", testament: "OT", category: "Minor Prophets", chapters: 9, original: "עָמוֹס", meaning: "Burden Bearer" },
  { name: "Obadiah", testament: "OT", category: "Minor Prophets", chapters: 1, original: "עֹבַדְיָה", meaning: "Servant of Yahweh" },
  { name: "Jonah", testament: "OT", category: "Minor Prophets", chapters: 4, original: "יוֹנָה", meaning: "Dove" },
  { name: "Micah", testament: "OT", category: "Minor Prophets", chapters: 7, original: "מִיכָה", meaning: "Who is like Yahweh?" },
  { name: "Nahum", testament: "OT", category: "Minor Prophets", chapters: 3, original: "נַחוּם", meaning: "Comfort" },
  { name: "Habakkuk", testament: "OT", category: "Minor Prophets", chapters: 3, original: "חֲבַקּוּק", meaning: "Embrace" },
  { name: "Zephaniah", testament: "OT", category: "Minor Prophets", chapters: 3, original: "צְפַנְיָה", meaning: "Hidden by Yahweh" },
  { name: "Haggai", testament: "OT", category: "Minor Prophets", chapters: 2, original: "חַגַּי", meaning: "Festive" },
  { name: "Zechariah", testament: "OT", category: "Minor Prophets", chapters: 14, original: "זְכַרְיָה", meaning: "Remembered by Yahweh" },
  { name: "Malachi", testament: "OT", category: "Minor Prophets", chapters: 4, original: "מַלְאָכִי", meaning: "My Messenger" },
  { name: "Matthew", testament: "NT", category: "Gospels", chapters: 28, original: "Κατὰ Ματθαῖον", meaning: "Gift of God" },
  { name: "Mark", testament: "NT", category: "Gospels", chapters: 16, original: "Κατὰ Μᾶρκον", meaning: "Polite/Shining" },
  { name: "Luke", testament: "NT", category: "Gospels", chapters: 24, original: "Κατὰ Λουκᾶν", meaning: "Light Giving" },
  { name: "John", testament: "NT", category: "Gospels", chapters: 21, original: "Κατὰ Ἰωάννην", meaning: "God is Gracious" },
  { name: "Acts", testament: "NT", category: "Historical", chapters: 28, original: "Πράξεις Ἀποστόλων", meaning: "Acts of the Apostles" },
  { name: "Romans", testament: "NT", category: "Pauline Epistles", chapters: 16, original: "Πρὸς Ῥωμαίους", meaning: "To the Romans" },
  { name: "1 Corinthians", testament: "NT", category: "Pauline Epistles", chapters: 16, original: "Πρὸς Κορινθίους Αʹ", meaning: "To the Corinthians" },
  { name: "2 Corinthians", testament: "NT", category: "Pauline Epistles", chapters: 13, original: "Πρὸς Κορινθίους Βʹ", meaning: "To the Corinthians" },
  { name: "Galatians", testament: "NT", category: "Pauline Epistles", chapters: 6, original: "Πρὸς Γαλάτας", meaning: "To the Galatians" },
  { name: "Ephesians", testament: "NT", category: "Pauline Epistles", chapters: 6, original: "Πρὸς Ἐφεσίους", meaning: "To the Ephesians" },
  { name: "Philippians", testament: "NT", category: "Pauline Epistles", chapters: 4, original: "Πρὸς Φιλιππησίους", meaning: "To the Philippians" },
  { name: "Colossians", testament: "NT", category: "Pauline Epistles", chapters: 4, original: "Πρὸς Κολοσσαεῖς", meaning: "To the Colossians" },
  { name: "1 Thessalonians", testament: "NT", category: "Pauline Epistles", chapters: 5, original: "Πρὸς Θεσσαλονικεῖς Αʹ", meaning: "To the Thessalonians" },
  { name: "2 Thessalonians", testament: "NT", category: "Pauline Epistles", chapters: 3, original: "Πρὸς Θεσσαλονικεῖς Βʹ", meaning: "To the Thessalonians" },
  { name: "1 Timothy", testament: "NT", category: "Pastoral Epistles", chapters: 6, original: "Πρὸς Τιμόθεον Αʹ", meaning: "Honouring God" },
  { name: "2 Timothy", testament: "NT", category: "Pastoral Epistles", chapters: 4, original: "Πρὸς Τιμόθεον Βʹ", meaning: "Honouring God" },
  { name: "Titus", testament: "NT", category: "Pastoral Epistles", chapters: 3, original: "Πρὸς Τίτον", meaning: "Pleasing" },
  { name: "Philemon", testament: "NT", category: "Pastoral Epistles", chapters: 1, original: "Πρὸς Φιλήμονα", meaning: "Loving" },
  { name: "Hebrews", testament: "NT", category: "General Epistles", chapters: 13, original: "Πρὸς Ἑβραίους", meaning: "To the Hebrews" },
  { name: "James", testament: "NT", category: "General Epistles", chapters: 5, original: "Ἰακώβου", meaning: "Supplanter" },
  { name: "1 Peter", testament: "NT", category: "General Epistles", chapters: 5, original: "Πέτρου Αʹ", meaning: "Rock" },
  { name: "2 Peter", testament: "NT", category: "General Epistles", chapters: 3, original: "Πέτρου Βʹ", meaning: "Rock" },
  { name: "1 John", testament: "NT", category: "General Epistles", chapters: 5, original: "Ἰωάννου Αʹ", meaning: "God is Gracious" },
  { name: "2 John", testament: "NT", category: "General Epistles", chapters: 1, original: "Ἰωάννου Βʹ", meaning: "God is Gracious" },
  { name: "3 John", testament: "NT", category: "General Epistles", chapters: 1, original: "Ἰωάννου Γʹ", meaning: "God is Gracious" },
  { name: "Jude", testament: "NT", category: "General Epistles", chapters: 1, original: "Ἰούδα", meaning: "Praise" },
  { name: "Revelation", testament: "NT", category: "Prophecy", chapters: 22, original: "Ἀποκάλυψις", meaning: "Unveiling" },
];

const CAT_ICONS = { "Pentateuch":"📜","Historical":"⚔️","Wisdom":"💎","Major Prophets":"🔥","Minor Prophets":"📢","Gospels":"✝️","Pauline Epistles":"✉️","Pastoral Epistles":"📋","General Epistles":"📖","Prophecy":"👁️" };

// ─── Icons as components ───
const BackIcon = () => <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>;
const ChevIcon = () => <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>;
const CrossIcon = () => <svg width="34" height="34" viewBox="0 0 28 28" fill="none"><rect x="11" y="2" width="6" height="24" rx="1" fill="currentColor" opacity="0.85"/><rect x="3" y="8" width="22" height="6" rx="1" fill="currentColor" opacity="0.85"/></svg>;

// ─── Themed UI Components ───
const Badge = ({children, t}) => <span style={{background:t.accentLight,color:t.accent,fontSize:10,padding:"2px 8px",borderRadius:6,fontFamily:t.ui,fontWeight:700,textTransform:"uppercase",letterSpacing:"0.05em"}}>{children}</span>;
const Label = ({icon,children,t,color}) => <div style={{fontFamily:t.ui,fontSize:11.5,fontWeight:700,color:color||t.accent,textTransform:"uppercase",letterSpacing:"0.1em",marginBottom:10,display:"flex",alignItems:"center",gap:6}}><span>{icon}</span> {children}</div>;
const Card = ({children,style={},accent,t}) => <div style={{background:accent?t.accentLight:t.card,borderRadius:14,padding:"18px 20px",border:`1px solid ${accent?t.accentBorder:t.divider}`,boxShadow:accent?"none":"0 1px 4px rgba(0,0,0,0.04)",animation:"fadeIn 0.3s ease",...style}}>{children}</div>;
const Btn = ({children,onClick,style={},disabled}) => <button onClick={onClick} disabled={disabled} style={{background:"rgba(255,255,255,0.15)",border:"none",borderRadius:8,padding:"8px",cursor:disabled?"default":"pointer",display:"flex",alignItems:"center",justifyContent:"center",transition:"all 0.2s",color:"inherit",opacity:disabled?0.4:1,...style}}>{children}</button>;
const Spinner = ({t}) => <div style={{display:"flex",justifyContent:"center",padding:40}}><div style={{width:32,height:32,border:`3px solid ${t.divider}`,borderTop:`3px solid ${t.accent}`,borderRadius:"50%",animation:"spin 0.8s linear infinite"}}/></div>;
const DBBadge = ({live,t}) => <span style={{fontSize:9,padding:"2px 6px",borderRadius:4,background:live?"#1a5c2a22":t.accentLight,color:live?"#1a5c2a":t.muted,fontFamily:"monospace",fontWeight:700}}>{live?"● LIVE":"● PREVIEW"}</span>;

// ═══ MAIN APP ═══
export default function StudyBible() {
  const [view, setView] = useState("home");
  const [testament, setTestament] = useState(null);
  const [book, setBook] = useState(null);
  const [chapter, setChapter] = useState(null);
  const [verse, setVerse] = useState(null);
  const [tab, setTab] = useState("study");
  const [bookmarks, setBookmarks] = useState([]);
  const [fade, setFade] = useState(true);
  const [loading, setLoading] = useState(false);
  const [dbLive, setDbLive] = useState(false);

  const [dbChapters, setDbChapters] = useState({});
  const [chapterMeta, setChapterMeta] = useState(null);
  const [verses, setVerses] = useState([]);
  const [wordStudies, setWordStudies] = useState({});
  const [crossRefs, setCrossRefs] = useState({});

  const bookInfo = useMemo(() => book ? BIBLE_BOOKS.find(b => b.name === book) : null, [book]);
  const isOT = bookInfo?.testament === "OT";
  const currentVerse = verses.find(v => v.verse_number === verse);
  const verseNums = verses.map(v => v.verse_number).sort((a,b) => a - b);
  const curIdx = verseNums.indexOf(verse);

  // Get active theme based on current book
  const t = useMemo(() => {
    if (!bookInfo) return THEMES.home;
    return THEMES[CATEGORY_THEME[bookInfo.category] || "home"];
  }, [bookInfo]);

  // Home always uses home theme
  const ht = THEMES.home;

  // ─── Check DB connection ───
  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data && data.length > 0 && !error) {
          setDbLive(true);
          const { data: chapData } = await supabase
            .from("chapters")
            .select("book_id, chapter_number, books(name)")
            .order("chapter_number");
          if (chapData) {
            const chMap = {};
            chapData.forEach(c => {
              const bName = c.books?.name;
              if (bName) { if (!chMap[bName]) chMap[bName] = []; chMap[bName].push(c.chapter_number); }
            });
            setDbChapters(chMap);
          }
        }
      } catch { setDbLive(false); }
    })();
  }, []);

  // ─── Load chapter data ───
  const loadChapter = useCallback(async (bookName, chNum) => {
    setLoading(true);
    try {
      const { data: bookData } = await supabase.from("books").select("id").eq("name", bookName).single();
      if (!bookData) { setLoading(false); return; }
      const { data: chData } = await supabase.from("chapters").select("*").eq("book_id", bookData.id).eq("chapter_number", chNum).single();
      if (!chData) { setLoading(false); return; }
      setChapterMeta(chData);
      const { data: vData } = await supabase.from("verses").select("*").eq("chapter_id", chData.id).order("verse_number");
      if (!vData || vData.length === 0) { setLoading(false); return; }
      setVerses(vData);
      const vIds = vData.map(v => v.id);
      const { data: ws } = await supabase.from("word_studies").select("*").in("verse_id", vIds).order("word_order");
      const wsMap = {};
      if (ws) ws.forEach(w => { if (!wsMap[w.verse_id]) wsMap[w.verse_id] = []; wsMap[w.verse_id].push(w); });
      setWordStudies(wsMap);
      const { data: cr } = await supabase.from("cross_references").select("*").in("verse_id", vIds).order("ref_order");
      const crMap = {};
      if (cr) cr.forEach(r => { if (!crMap[r.verse_id]) crMap[r.verse_id] = []; crMap[r.verse_id].push(r); });
      setCrossRefs(crMap);
    } catch (e) { console.error("Load error:", e); }
    setLoading(false);
  }, []);

  const nav = useCallback((v, opts = {}) => {
    setFade(false);
    setTimeout(() => {
      setView(v);
      if (opts.testament !== undefined) setTestament(opts.testament);
      if (opts.book !== undefined) setBook(opts.book);
      if (opts.chapter !== undefined) setChapter(opts.chapter);
      if (opts.verse !== undefined) setVerse(opts.verse);
      if (opts.tab !== undefined) setTab(opts.tab);
      setFade(true);
    }, 120);
  }, []);

  useEffect(() => {
    if (view === "verse" && book && chapter && dbLive) loadChapter(book, chapter);
  }, [view, book, chapter, dbLive, loadChapter]);

  useEffect(() => {
    if (view === "verse" && !verse && verseNums.length > 0) setVerse(verseNums[0]);
  }, [view, verse, verseNums]);

  const toggleBookmark = (ref) => setBookmarks(prev => prev.includes(ref) ? prev.filter(b => b !== ref) : [...prev, ref]);

  // ─── HEADER ───
  const Header = ({ title, subtitle, onBack, right, theme }) => {
    const th = theme || t;
    return (
      <div style={{ background: th.headerGradient, padding: "14px 20px 18px", position: "sticky", top: 0, zIndex: 10 }}>
        <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between" }}>
          <div style={{ display: "flex", alignItems: "center", gap: 10 }}>
            {onBack && <Btn onClick={onBack} style={{ color: th.headerText }}><BackIcon /></Btn>}
            <div>
              <h2 style={{ fontFamily: th.heading, fontSize: 19, fontWeight: 700, color: th.headerText, margin: 0 }}>{title}</h2>
              {subtitle && <div style={{ fontFamily: th.ui, fontSize: 12, color: `${th.headerText}99`, marginTop: 1 }}>{subtitle}</div>}
            </div>
          </div>
          {right}
        </div>
      </div>
    );
  };

  // ═══ HOME ═══
  const Home = () => (
    <div style={{ minHeight: "100vh", background: ht.bg }}>
      <div style={{ background: ht.headerGradient, padding: "50px 24px 42px", textAlign: "center", position: "relative", overflow: "hidden" }}>
        <div style={{ position: "absolute", inset: 0, background: "radial-gradient(ellipse at 50% 0%, rgba(212,168,83,0.15) 0%, transparent 70%)" }}/>
        <div style={{ position: "relative", zIndex: 1 }}>
          <div style={{ color: ht.accent, marginBottom: 12 }}><CrossIcon /></div>
          <h1 style={{ fontFamily: ht.heading, fontSize: 38, fontWeight: 800, color: ht.headerText, margin: "0 0 6px" }}>Study Bible</h1>
          <div style={{ fontFamily: ht.ui, fontSize: 14, color: ht.accent, letterSpacing: "0.15em", textTransform: "uppercase", marginBottom: 8 }}>King James Version</div>
          <div style={{ fontFamily: ht.body, fontSize: 13, color: `${ht.headerText}60`, fontStyle: "italic" }}>Hebrew & Greek · Word Studies · Cross-References · Notes</div>
          <div style={{ marginTop: 12 }}><DBBadge live={dbLive} t={ht} /></div>
        </div>
      </div>

      <div style={{ padding: "22px 20px 40px" }}>
        <div style={{ maxWidth: 520, margin: "0 auto" }}>
          <Label icon="⭐" t={ht} color={ht.muted}>Featured Passages</Label>
          <div style={{ display: "flex", flexDirection: "column", gap: 7, marginBottom: 26 }}>
            {[
              { bk: "Genesis", ch: 1, v: 1, t: "In the Beginning", s: "The Creation — 31 verses with Hebrew study", thm: "garden" },
              { bk: "Genesis", ch: 1, v: 26, t: "Image of God", s: "Let us make man in our image", thm: "garden" },
              { bk: "Genesis", ch: 1, v: 31, t: "Very Good", s: "God's final evaluation of creation", thm: "garden" },
              { bk: "Genesis", ch: 1, v: 3, t: "Let There Be Light", s: "God's first spoken word", thm: "garden" },
            ].map((f, i) => {
              const ft = THEMES[f.thm];
              return (
                <button key={i} onClick={() => nav("verse", { book: f.bk, chapter: f.ch, verse: f.v, tab: "study" })} style={{
                  background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12, padding: "13px 15px",
                  textAlign: "left", cursor: "pointer", display: "flex", alignItems: "center", gap: 13,
                  transition: "all 0.2s", boxShadow: "0 1px 3px rgba(0,0,0,0.04)"
                }}>
                  <div style={{ width: 42, height: 42, borderRadius: 10, flexShrink: 0, background: ft.headerGradient, display: "flex", alignItems: "center", justifyContent: "center", color: ft.headerText, fontFamily: ft.heading, fontSize: 16, fontWeight: 700 }}>G</div>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontFamily: ht.heading, fontSize: 14.5, fontWeight: 600, color: ht.dark }}>{f.t}</div>
                    <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted }}>{f.bk} {f.ch}:{f.v} — {f.s}</div>
                  </div>
                  <div style={{ color: ht.light }}><ChevIcon /></div>
                </button>
              );
            })}
          </div>

          <Label icon="📖" t={ht} color={ht.muted}>Browse the Bible</Label>
          {[
            { t: "OT", l: "Old Testament", s: "39 Books · Genesis to Malachi", o: "בְּרֵאשִׁית — In the Beginning", thm: "garden" },
            { t: "NT", l: "New Testament", s: "27 Books · Matthew to Revelation", o: "Ἡ Καινὴ Διαθήκη — The New Covenant", thm: "ocean" },
          ].map(item => {
            const it = THEMES[item.thm];
            return (
              <button key={item.t} onClick={() => nav("books", { testament: item.t })} style={{
                width: "100%", background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 14, padding: "18px",
                marginBottom: 10, cursor: "pointer", textAlign: "left", transition: "all 0.2s", boxShadow: "0 1px 3px rgba(0,0,0,0.04)"
              }}>
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
                  <div>
                    <div style={{ fontFamily: ht.heading, fontSize: 18, fontWeight: 700, color: ht.dark }}>{item.l}</div>
                    <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted }}>{item.s}</div>
                    <div style={{ fontFamily: ht.body, fontSize: 12.5, color: ht.light, fontStyle: "italic", marginTop: 3 }}>{item.o}</div>
                  </div>
                  <div style={{ width: 38, height: 38, borderRadius: 10, background: it.headerGradient, display: "flex", alignItems: "center", justifyContent: "center", color: it.headerText }}><ChevIcon /></div>
                </div>
              </button>
            );
          })}

          <div style={{ display: "flex", justifyContent: "center", gap: 28, marginTop: 22, padding: "14px 0", borderTop: `1px solid ${ht.divider}` }}>
            {[{ n: "66", l: "Books" }, { n: "1,189", l: "Chapters" }, { n: "31,102", l: "Verses" }].map((s,i) => (
              <div key={i} style={{ textAlign: "center" }}>
                <div style={{ fontFamily: ht.heading, fontSize: 20, fontWeight: 700, color: ht.dark }}>{s.n}</div>
                <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted, textTransform: "uppercase", letterSpacing: "0.1em" }}>{s.l}</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );

  // ═══ BOOKS ═══
  const Books = () => {
    const books = BIBLE_BOOKS.filter(b => b.testament === testament);
    const cats = {};
    books.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return (
      <div style={{ minHeight: "100vh", background: ht.bg }}>
        <Header title={testament === "OT" ? "Old Testament" : "New Testament"} subtitle={`${books.length} Books`} onBack={() => nav("home")} theme={ht} />
        <div style={{ padding: "20px 20px 40px", maxWidth: 520, margin: "0 auto" }}>
          {Object.entries(cats).map(([cat, catBooks]) => {
            const ct = THEMES[CATEGORY_THEME[cat] || "home"];
            return (
              <div key={cat} style={{ marginBottom: 22 }}>
                <div style={{ display: "flex", alignItems: "center", gap: 7, marginBottom: 9 }}>
                  <span style={{ fontSize: 15 }}>{CAT_ICONS[cat]}</span>
                  <span style={{ fontFamily: ct.ui, fontSize: 12, fontWeight: 700, color: ct.accent, textTransform: "uppercase", letterSpacing: "0.1em" }}>{cat}</span>
                  <div style={{ flex: 1, height: 1, background: ct.accentBorder }}/>
                </div>
                {catBooks.map(b => (
                  <button key={b.name} onClick={() => nav("chapter", { book: b.name })} style={{
                    width: "100%", background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12, padding: "11px 14px",
                    marginBottom: 5, cursor: "pointer", textAlign: "left", display: "flex", alignItems: "center", gap: 12,
                    borderLeft: `3px solid ${ct.accent}`, boxShadow: "0 1px 2px rgba(0,0,0,0.03)", transition: "all 0.15s"
                  }}>
                    <div style={{ flex: 1 }}>
                      <div style={{ display: "flex", alignItems: "center", gap: 7 }}>
                        <span style={{ fontFamily: ct.heading, fontSize: 14.5, fontWeight: 600, color: ht.dark }}>{b.name}</span>
                        {(dbChapters[b.name]?.length > 0) && <Badge t={ct}>Study Notes</Badge>}
                      </div>
                      <div style={{ fontFamily: ct.ui, fontSize: 12, color: ht.muted, marginTop: 2 }}>
                        <span style={{ fontStyle: "italic", color: ht.light }}>{b.original}</span> — {b.meaning} · {b.chapters} ch.
                      </div>
                    </div>
                    <div style={{ color: ht.light }}><ChevIcon /></div>
                  </button>
                ))}
              </div>
            );
          })}
        </div>
      </div>
    );
  };

  // ═══ CHAPTERS ═══
  const Chapters = () => {
    if (!bookInfo) return null;
    const availableChapters = dbChapters[book] || [];
    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={book} subtitle={`${bookInfo.original} — ${bookInfo.meaning}`} onBack={() => nav("books", { testament: bookInfo.testament })} />
        <div style={{ padding: "22px 20px 40px", maxWidth: 520, margin: "0 auto" }}>
          {bookInfo.author && (
            <Card accent t={t} style={{ marginBottom: 16 }}>
              <div style={{ fontFamily: t.ui, fontSize: 13.5, color: t.text, lineHeight: 1.6 }}>
                <strong>Author:</strong> {bookInfo.author} · <strong>Date:</strong> {bookInfo.dateWritten}
              </div>
            </Card>
          )}
          <Label icon="📋" t={t} color={t.muted}>Select Chapter</Label>
          <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(52px, 1fr))", gap: 7 }}>
            {Array.from({ length: bookInfo.chapters }, (_, i) => i + 1).map(ch => {
              const has = availableChapters.includes(ch);
              return (
                <button key={ch} onClick={() => { if (has) nav("verse", { chapter: ch, verse: null, tab: "study" }); }}
                  style={{
                    background: has ? t.card : `${t.bg}`, border: has ? `1.5px solid ${t.accentBorder}` : `1px solid ${t.divider}`,
                    borderRadius: 10, padding: "13px 0", cursor: has ? "pointer" : "default",
                    fontFamily: t.heading, fontSize: 15, fontWeight: has ? 700 : 400,
                    color: has ? t.dark : t.light, position: "relative", opacity: has ? 1 : 0.5,
                    boxShadow: has ? "0 2px 6px rgba(0,0,0,0.05)" : "none", transition: "all 0.15s"
                  }}>
                  {ch}
                  {has && <div style={{ position: "absolute", top: 3, right: 3, width: 6, height: 6, borderRadius: "50%", background: t.accent }}/>}
                </button>
              );
            })}
          </div>
          <div style={{ marginTop: 16, padding: "10px 14px", background: t.accentLight, borderRadius: 8, display: "flex", alignItems: "center", gap: 8 }}>
            <div style={{ width: 6, height: 6, borderRadius: "50%", background: t.accent }}/>
            <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>Colored dots = chapters with study notes</span>
          </div>
        </div>
      </div>
    );
  };

  // ═══ VERSE STUDY ═══
  const VerseStudy = () => {
    if (loading) return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter}`} onBack={() => nav("chapter", { book })} />
        <Spinner t={t} />
        <div style={{ textAlign: "center", fontFamily: t.ui, fontSize: 15, color: t.muted }}>Loading from Supabase...</div>
      </div>
    );

    if (!currentVerse) return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={`${book} ${chapter}`} onBack={() => nav("chapter", { book })} />
        <div style={{ textAlign: "center", padding: 40 }}>
          <div style={{ fontSize: 48, marginBottom: 16 }}>📖</div>
          <div style={{ fontFamily: t.heading, fontSize: 18, color: t.dark, marginBottom: 8 }}>
            {dbLive ? "Loading verses..." : "Connect to Supabase to view study content"}
          </div>
        </div>
      </div>
    );

    const ref = `${book} ${chapter}:${verse}`;
    const isBookmarked = bookmarks.includes(ref);
    const vWords = wordStudies[currentVerse.id] || [];
    const vRefs = crossRefs[currentVerse.id] || [];
    const outline = chapterMeta?.outline ? JSON.parse(chapterMeta.outline) : [];

    return (
      <div style={{ minHeight: "100vh", background: t.bg }}>
        <Header title={ref} subtitle={chapterMeta?.theme} onBack={() => nav("chapter", { book })}
          right={
            <div style={{ display: "flex", gap: 8, alignItems: "center" }}>
              <DBBadge live={dbLive} t={t} />
              <Btn onClick={() => toggleBookmark(ref)} style={{ color: isBookmarked ? "#ffd700" : t.headerText, fontSize: 18, padding: "7px 10px", background: isBookmarked ? "rgba(255,215,0,0.2)" : "rgba(255,255,255,0.1)" }}>
                {isBookmarked ? "★" : "☆"}
              </Btn>
            </div>
          }
        />

        <div style={{ maxWidth: 620, margin: "0 auto", padding: "0 16px 40px" }}>
          {chapterMeta?.overview && (
            <Card accent t={t} style={{ margin: "14px 0" }}>
              <Label icon="📋" t={t}>Chapter {chapter} Overview</Label>
              <div style={{ fontFamily: t.body, fontSize: 14.5, color: t.text, lineHeight: 1.65 }}>{chapterMeta.overview}</div>
              {chapterMeta.key_word_original && (
                <div style={{ marginTop: 10, padding: "8px 12px", background: "rgba(255,255,255,0.6)", borderRadius: 8, display: "flex", alignItems: "center", gap: 8, flexWrap: "wrap" }}>
                  <Badge t={t}>Key Word</Badge>
                  <span style={{ fontFamily: t.body, fontSize: 14, color: t.dark, fontStyle: "italic" }}>{chapterMeta.key_word_original}</span>
                  <span style={{ fontFamily: t.ui, fontSize: 12, color: t.muted }}>— {chapterMeta.key_word_meaning}</span>
                </div>
              )}
              {outline.length > 0 && (
                <div style={{ marginTop: 12 }}>
                  <div style={{ fontFamily: t.ui, fontSize: 10, fontWeight: 700, color: t.accent, textTransform: "uppercase", letterSpacing: "0.08em", marginBottom: 6 }}>Outline</div>
                  {outline.map((o, i) => (
                    <div key={i} style={{ fontFamily: t.ui, fontSize: 13, color: t.text, lineHeight: 1.7, paddingLeft: 12, borderLeft: `2px solid ${t.accentBorder}`, marginBottom: 4 }}>{o}</div>
                  ))}
                </div>
              )}
            </Card>
          )}

          <Card t={t} style={{ margin: "12px 0 14px", position: "relative" }}>
            <div style={{ position: "absolute", top: -1, left: 30, right: 30, height: 3, background: `linear-gradient(90deg, transparent, ${t.accent}, transparent)`, borderRadius: "0 0 2px 2px" }}/>
            <Label icon="📖" t={t}>KJV Text</Label>
            <div style={{ fontFamily: t.body, fontSize: 19.5, color: t.dark, lineHeight: 1.7 }}>
              <span style={{ fontSize: 38, fontWeight: 800, color: t.verseNum, float: "left", lineHeight: 0.85, marginRight: 8, marginTop: 4, fontFamily: t.heading }}>{verse}</span>
              {currentVerse.kjv_text}
            </div>
          </Card>

          <div style={{ display: "flex", background: t.card, borderRadius: 10, padding: 3, marginBottom: 14, border: `1px solid ${t.divider}` }}>
            {[
              { id: "study", label: "Study Notes" },
              { id: "original", label: isOT ? "Hebrew" : "Greek" },
              { id: "cross", label: `Cross-Refs${vRefs.length ? ` (${vRefs.length})` : ""}` }
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)} style={{
                flex: 1, padding: "10px 6px", border: "none", borderRadius: 8,
                background: tab === tb.id ? t.tabActive : "transparent",
                color: tab === tb.id ? t.headerText : t.muted,
                fontFamily: t.ui, fontSize: 13, fontWeight: 700, cursor: "pointer", transition: "all 0.15s"
              }}>{tb.label}</button>
            ))}
          </div>

          {tab === "study" && (
            <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
              {currentVerse.study_note && (
                <Card t={t}><Label icon="📝" t={t}>Study Note</Label>
                  <div style={{ fontFamily: t.body, fontSize: 15, color: t.text, lineHeight: 1.75 }}>{currentVerse.study_note}</div>
                </Card>
              )}
              {currentVerse.doctrinal_note && (
                <Card accent t={t}><Label icon="⛪" t={t} color={t.dark}>Doctrinal Note</Label>
                  <div style={{ fontFamily: t.body, fontSize: 14.5, color: t.text, lineHeight: 1.7, fontStyle: "italic" }}>{currentVerse.doctrinal_note}</div>
                </Card>
              )}
              {!currentVerse.study_note && !currentVerse.doctrinal_note && (
                <Card t={t}><div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, textAlign: "center", padding: 16 }}>Study notes coming soon.</div></Card>
              )}
            </div>
          )}

          {tab === "original" && (
            <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
              {currentVerse.original_text && (
                <Card t={t}><Label icon="🕎" t={t}>{isOT ? "Hebrew Text" : "Greek Text"}</Label>
                  <div style={{ fontFamily: "'Times New Roman',serif", fontSize: isOT ? 24 : 19, color: t.dark, lineHeight: 2, direction: isOT ? "rtl" : "ltr", textAlign: isOT ? "right" : "left", padding: "14px 18px", background: t.hebrewBg, borderRadius: 10, marginBottom: 10 }}>
                    {currentVerse.original_text}
                  </div>
                  {currentVerse.transliteration && (
                    <div style={{ fontFamily: t.body, fontSize: 14, color: t.muted, fontStyle: "italic", lineHeight: 1.6 }}>
                      <span style={{ fontWeight: 700, fontStyle: "normal", fontSize: 10, textTransform: "uppercase", letterSpacing: "0.05em", fontFamily: t.ui }}>Transliteration: </span>
                      {currentVerse.transliteration}
                    </div>
                  )}
                </Card>
              )}
              {vWords.length > 0 && (
                <Card t={t}><Label icon="🔍" t={t}>Word Study</Label>
                  <div style={{ display: "flex", flexDirection: "column", gap: 9 }}>
                    {vWords.map((w, i) => (
                      <div key={i} style={{ padding: "12px 14px", borderRadius: 10, background: t.accentLight, border: `1px solid ${t.accentBorder}` }}>
                        <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 5, flexWrap: "wrap" }}>
                          <span style={{ fontFamily: "'Times New Roman',serif", fontSize: isOT ? 20 : 16, color: t.accent, fontWeight: 700, direction: isOT ? "rtl" : "ltr" }}>{w.original_word}</span>
                          <span style={{ fontFamily: t.body, fontSize: 13, color: t.muted, fontStyle: "italic" }}>({w.transliteration})</span>
                          <span style={{ background: t.accentLight, border: `1px solid ${t.accentBorder}`, padding: "2px 7px", borderRadius: 4, fontFamily: "monospace", fontSize: 10.5, color: t.muted }}>{w.strongs_number}</span>
                        </div>
                        <div style={{ fontFamily: t.ui, fontSize: 13.5, color: t.text, lineHeight: 1.6 }}>{w.meaning}</div>
                      </div>
                    ))}
                  </div>
                </Card>
              )}
            </div>
          )}

          {tab === "cross" && (
            <Card t={t}>
              <Label icon="🔗" t={t}>Cross References</Label>
              {vRefs.length > 0 ? (
                <div style={{ display: "flex", flexWrap: "wrap", gap: 7 }}>
                  {vRefs.map((r, i) => (
                    <span key={i} style={{ background: t.accentLight, border: `1px solid ${t.accentBorder}`, borderRadius: 8, padding: "8px 13px", fontFamily: t.ui, fontSize: 13.5, color: t.dark, fontWeight: 600 }}>
                      {r.reference}
                    </span>
                  ))}
                </div>
              ) : (
                <div style={{ fontFamily: t.ui, fontSize: 14, color: t.muted, textAlign: "center", padding: 16 }}>Cross references coming soon.</div>
              )}
            </Card>
          )}

          <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginTop: 18, gap: 10 }}>
            <Btn onClick={() => { if (curIdx > 0) { setVerse(verseNums[curIdx - 1]); setTab("study"); } }} disabled={curIdx <= 0}
              style={{ flex: 1, padding: "11px", background: curIdx > 0 ? t.card : t.bg, border: `1px solid ${t.divider}`, borderRadius: 10, fontFamily: t.ui, fontSize: 14, color: t.dark }}>
              ← Prev
            </Btn>
            <div style={{ fontFamily: t.heading, fontSize: 15, color: t.muted, fontWeight: 700 }}>v.{verse}</div>
            <Btn onClick={() => { if (curIdx < verseNums.length - 1) { setVerse(verseNums[curIdx + 1]); setTab("study"); } }} disabled={curIdx >= verseNums.length - 1}
              style={{ flex: 1, padding: "11px", background: curIdx < verseNums.length - 1 ? t.card : t.bg, border: `1px solid ${t.divider}`, borderRadius: 10, fontFamily: t.ui, fontSize: 14, color: t.dark }}>
              Next →
            </Btn>
          </div>

          <Card t={t} style={{ marginTop: 16 }}>
            <Label icon="📖" t={t} color={t.muted}>All Verses — Chapter {chapter}</Label>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 5 }}>
              {verseNums.map(v => (
                <button key={v} onClick={() => { setVerse(v); setTab("study"); }} style={{
                  width: 40, height: 40, borderRadius: 8,
                  background: v === verse ? t.tabActive : t.accentLight,
                  border: v === verse ? "none" : `1px solid ${t.accentBorder}`,
                  color: v === verse ? t.headerText : t.text,
                  fontFamily: t.heading, fontSize: 13, fontWeight: 600, cursor: "pointer", transition: "all 0.15s"
                }}>{v}</button>
              ))}
            </div>
          </Card>
        </div>
      </div>
    );
  };

  return (
    <div style={{ maxWidth: 640, margin: "0 auto", transition: "opacity 0.12s ease", opacity: fade ? 1 : 0, minHeight: "100vh" }}>
      {view === "home" && <Home />}
      {view === "books" && <Books />}
      {view === "chapter" && <Chapters />}
      {view === "verse" && <VerseStudy />}
    </div>
  );
}