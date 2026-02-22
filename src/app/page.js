"use client";
import { useState, useEffect, useCallback, useMemo, useRef } from "react";
import { supabase } from "../lib/supabase";

// ═══════════════════════════════════════════════════
// THEME SYSTEM
// ═══════════════════════════════════════════════════
const THEMES = {
  home: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Outfit',sans-serif", bg:"#FAF6F0", card:"#fff", headerGradient:"linear-gradient(165deg,#1C2B1F 0%,#2D1B4E 50%,#1A2F4B 100%)", headerText:"#F0E8D8", accent:"#D4A853", accentLight:"rgba(212,168,83,0.1)", accentBorder:"rgba(212,168,83,0.25)", dark:"#1C1612", text:"#3A3028", muted:"#7A6B55", light:"#B0A08A", divider:"rgba(180,160,130,0.2)", tabActive:"#2D1B4E", verseNum:"#D4A853", hebrewBg:"rgba(212,168,83,0.08)" },
  garden: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Outfit',sans-serif", bg:"#FDF6EE", card:"#fff", headerGradient:"linear-gradient(165deg,#1C2B1F 0%,#2E4A33 100%)", headerText:"#F0E0C8", accent:"#C06C3E", accentLight:"rgba(192,108,62,0.08)", accentBorder:"rgba(192,108,62,0.2)", dark:"#1C2B1F", text:"#3A3028", muted:"#8B7355", light:"#B0A08A", divider:"rgba(180,160,130,0.2)", tabActive:"#2E4A33", verseNum:"#C06C3E", hebrewBg:"#F5EBDD" },
  royal: { heading:"'Playfair Display',serif", body:"'Lora',serif", ui:"'Poppins',sans-serif", bg:"#FAF5FF", card:"#fff", headerGradient:"linear-gradient(165deg,#2D1052 0%,#5B2D8E 100%)", headerText:"#E8D5FF", accent:"#8B5CF6", accentLight:"rgba(139,92,246,0.06)", accentBorder:"rgba(139,92,246,0.18)", dark:"#2D1052", text:"#3D2A5C", muted:"#8B72B2", light:"#BBA8D8", divider:"rgba(139,92,246,0.12)", tabActive:"#5B2D8E", verseNum:"#8B5CF6", hebrewBg:"#F0E6FF" },
  sunrise: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Nunito',sans-serif", bg:"#FFF8F0", card:"#fff", headerGradient:"linear-gradient(165deg,#2D1B4E 0%,#4A2D6B 100%)", headerText:"#F8E8D0", accent:"#E8625C", accentLight:"rgba(232,98,92,0.06)", accentBorder:"rgba(232,98,92,0.18)", dark:"#2D1B4E", text:"#4A3B2D", muted:"#8B6B4F", light:"#C0A888", divider:"rgba(232,98,92,0.12)", tabActive:"#4A2D6B", verseNum:"#E8625C", hebrewBg:"#FFF0E0" },
  ocean: { heading:"'Merriweather',serif", body:"'Lora',serif", ui:"'Quicksand',sans-serif", bg:"#F0F7F5", card:"#fff", headerGradient:"linear-gradient(165deg,#1A2F4B 0%,#1B5E5A 100%)", headerText:"#D4F0EB", accent:"#1B7A6E", accentLight:"rgba(27,122,110,0.06)", accentBorder:"rgba(27,122,110,0.18)", dark:"#1A2F4B", text:"#2A4A44", muted:"#5A8A82", light:"#90BAB2", divider:"rgba(27,122,110,0.12)", tabActive:"#1B5E5A", verseNum:"#1B7A6E", hebrewBg:"#E0F2EE" },
};

const CATEGORY_THEME = { "Pentateuch":"garden","Historical":"garden","Wisdom":"royal","Major Prophets":"sunrise","Minor Prophets":"sunrise","Gospels":"ocean","Pauline Epistles":"royal","Pastoral Epistles":"royal","General Epistles":"royal","Prophecy":"sunrise" };

const BIBLE_BOOKS = [
  { name:"Genesis",testament:"OT",category:"Pentateuch",chapters:50,original:"בְּרֵאשִׁית",meaning:"In the Beginning",author:"Moses",dateWritten:"c. 1446–1406 BC" },
  { name:"Exodus",testament:"OT",category:"Pentateuch",chapters:40,original:"שְׁמוֹת",meaning:"Names" },
  { name:"Leviticus",testament:"OT",category:"Pentateuch",chapters:27,original:"וַיִּקְרָא",meaning:"And He Called" },
  { name:"Numbers",testament:"OT",category:"Pentateuch",chapters:36,original:"בְּמִדְבַּר",meaning:"In the Wilderness" },
  { name:"Deuteronomy",testament:"OT",category:"Pentateuch",chapters:34,original:"דְּבָרִים",meaning:"Words" },
  { name:"Joshua",testament:"OT",category:"Historical",chapters:24,original:"יְהוֹשֻׁעַ",meaning:"Yahweh is Salvation" },
  { name:"Judges",testament:"OT",category:"Historical",chapters:21,original:"שׁוֹפְטִים",meaning:"Judges" },
  { name:"Ruth",testament:"OT",category:"Historical",chapters:4,original:"רוּת",meaning:"Friend" },
  { name:"1 Samuel",testament:"OT",category:"Historical",chapters:31,original:"שְׁמוּאֵל א",meaning:"Heard by God" },
  { name:"2 Samuel",testament:"OT",category:"Historical",chapters:24,original:"שְׁמוּאֵל ב",meaning:"Heard by God" },
  { name:"1 Kings",testament:"OT",category:"Historical",chapters:22,original:"מְלָכִים א",meaning:"Kings" },
  { name:"2 Kings",testament:"OT",category:"Historical",chapters:25,original:"מְלָכִים ב",meaning:"Kings" },
  { name:"1 Chronicles",testament:"OT",category:"Historical",chapters:29,original:"דִּבְרֵי הַיָּמִים א",meaning:"Words of the Days" },
  { name:"2 Chronicles",testament:"OT",category:"Historical",chapters:36,original:"דִּבְרֵי הַיָּמִים ב",meaning:"Words of the Days" },
  { name:"Ezra",testament:"OT",category:"Historical",chapters:10,original:"עֶזְרָא",meaning:"Help" },
  { name:"Nehemiah",testament:"OT",category:"Historical",chapters:13,original:"נְחֶמְיָה",meaning:"Comforted by Yahweh" },
  { name:"Esther",testament:"OT",category:"Historical",chapters:10,original:"אֶסְתֵּר",meaning:"Star" },
  { name:"Job",testament:"OT",category:"Wisdom",chapters:42,original:"אִיּוֹב",meaning:"Persecuted" },
  { name:"Psalms",testament:"OT",category:"Wisdom",chapters:150,original:"תְּהִלִּים",meaning:"Praises" },
  { name:"Proverbs",testament:"OT",category:"Wisdom",chapters:31,original:"מִשְׁלֵי",meaning:"Proverbs" },
  { name:"Ecclesiastes",testament:"OT",category:"Wisdom",chapters:12,original:"קֹהֶלֶת",meaning:"Preacher" },
  { name:"Song of Solomon",testament:"OT",category:"Wisdom",chapters:8,original:"שִׁיר הַשִּׁירִים",meaning:"Song of Songs" },
  { name:"Isaiah",testament:"OT",category:"Major Prophets",chapters:66,original:"יְשַׁעְיָהוּ",meaning:"Salvation of Yahweh" },
  { name:"Jeremiah",testament:"OT",category:"Major Prophets",chapters:52,original:"יִרְמְיָהוּ",meaning:"Yahweh Exalts" },
  { name:"Lamentations",testament:"OT",category:"Major Prophets",chapters:5,original:"אֵיכָה",meaning:"How!" },
  { name:"Ezekiel",testament:"OT",category:"Major Prophets",chapters:48,original:"יְחֶזְקֵאל",meaning:"God Strengthens" },
  { name:"Daniel",testament:"OT",category:"Major Prophets",chapters:12,original:"דָּנִיֵּאל",meaning:"God is my Judge" },
  { name:"Hosea",testament:"OT",category:"Minor Prophets",chapters:14,original:"הוֹשֵׁעַ",meaning:"Salvation" },
  { name:"Joel",testament:"OT",category:"Minor Prophets",chapters:3,original:"יוֹאֵל",meaning:"Yahweh is God" },
  { name:"Amos",testament:"OT",category:"Minor Prophets",chapters:9,original:"עָמוֹס",meaning:"Burden Bearer" },
  { name:"Obadiah",testament:"OT",category:"Minor Prophets",chapters:1,original:"עֹבַדְיָה",meaning:"Servant of Yahweh" },
  { name:"Jonah",testament:"OT",category:"Minor Prophets",chapters:4,original:"יוֹנָה",meaning:"Dove" },
  { name:"Micah",testament:"OT",category:"Minor Prophets",chapters:7,original:"מִיכָה",meaning:"Who is like Yahweh?" },
  { name:"Nahum",testament:"OT",category:"Minor Prophets",chapters:3,original:"נַחוּם",meaning:"Comfort" },
  { name:"Habakkuk",testament:"OT",category:"Minor Prophets",chapters:3,original:"חֲבַקּוּק",meaning:"Embrace" },
  { name:"Zephaniah",testament:"OT",category:"Minor Prophets",chapters:3,original:"צְפַנְיָה",meaning:"Hidden by Yahweh" },
  { name:"Haggai",testament:"OT",category:"Minor Prophets",chapters:2,original:"חַגַּי",meaning:"Festive" },
  { name:"Zechariah",testament:"OT",category:"Minor Prophets",chapters:14,original:"זְכַרְיָה",meaning:"Remembered by Yahweh" },
  { name:"Malachi",testament:"OT",category:"Minor Prophets",chapters:4,original:"מַלְאָכִי",meaning:"My Messenger" },
  { name:"Matthew",testament:"NT",category:"Gospels",chapters:28,original:"Κατὰ Ματθαῖον",meaning:"Gift of God" },
  { name:"Mark",testament:"NT",category:"Gospels",chapters:16,original:"Κατὰ Μᾶρκον",meaning:"Polite/Shining" },
  { name:"Luke",testament:"NT",category:"Gospels",chapters:24,original:"Κατὰ Λουκᾶν",meaning:"Light Giving" },
  { name:"John",testament:"NT",category:"Gospels",chapters:21,original:"Κατὰ Ἰωάννην",meaning:"God is Gracious" },
  { name:"Acts",testament:"NT",category:"Historical",chapters:28,original:"Πράξεις Ἀποστόλων",meaning:"Acts of the Apostles" },
  { name:"Romans",testament:"NT",category:"Pauline Epistles",chapters:16,original:"Πρὸς Ῥωμαίους",meaning:"To the Romans" },
  { name:"1 Corinthians",testament:"NT",category:"Pauline Epistles",chapters:16,original:"Πρὸς Κορινθίους Αʹ",meaning:"To the Corinthians" },
  { name:"2 Corinthians",testament:"NT",category:"Pauline Epistles",chapters:13,original:"Πρὸς Κορινθίους Βʹ",meaning:"To the Corinthians" },
  { name:"Galatians",testament:"NT",category:"Pauline Epistles",chapters:6,original:"Πρὸς Γαλάτας",meaning:"To the Galatians" },
  { name:"Ephesians",testament:"NT",category:"Pauline Epistles",chapters:6,original:"Πρὸς Ἐφεσίους",meaning:"To the Ephesians" },
  { name:"Philippians",testament:"NT",category:"Pauline Epistles",chapters:4,original:"Πρὸς Φιλιππησίους",meaning:"To the Philippians" },
  { name:"Colossians",testament:"NT",category:"Pauline Epistles",chapters:4,original:"Πρὸς Κολοσσαεῖς",meaning:"To the Colossians" },
  { name:"1 Thessalonians",testament:"NT",category:"Pauline Epistles",chapters:5,original:"Πρὸς Θεσσαλονικεῖς Αʹ",meaning:"To the Thessalonians" },
  { name:"2 Thessalonians",testament:"NT",category:"Pauline Epistles",chapters:3,original:"Πρὸς Θεσσαλονικεῖς Βʹ",meaning:"To the Thessalonians" },
  { name:"1 Timothy",testament:"NT",category:"Pastoral Epistles",chapters:6,original:"Πρὸς Τιμόθεον Αʹ",meaning:"Honouring God" },
  { name:"2 Timothy",testament:"NT",category:"Pastoral Epistles",chapters:4,original:"Πρὸς Τιμόθεον Βʹ",meaning:"Honouring God" },
  { name:"Titus",testament:"NT",category:"Pastoral Epistles",chapters:3,original:"Πρὸς Τίτον",meaning:"Pleasing" },
  { name:"Philemon",testament:"NT",category:"Pastoral Epistles",chapters:1,original:"Πρὸς Φιλήμονα",meaning:"Loving" },
  { name:"Hebrews",testament:"NT",category:"General Epistles",chapters:13,original:"Πρὸς Ἑβραίους",meaning:"To the Hebrews" },
  { name:"James",testament:"NT",category:"General Epistles",chapters:5,original:"Ἰακώβου",meaning:"Supplanter" },
  { name:"1 Peter",testament:"NT",category:"General Epistles",chapters:5,original:"Πέτρου Αʹ",meaning:"Rock" },
  { name:"2 Peter",testament:"NT",category:"General Epistles",chapters:3,original:"Πέτρου Βʹ",meaning:"Rock" },
  { name:"1 John",testament:"NT",category:"General Epistles",chapters:5,original:"Ἰωάννου Αʹ",meaning:"God is Gracious" },
  { name:"2 John",testament:"NT",category:"General Epistles",chapters:1,original:"Ἰωάννου Βʹ",meaning:"God is Gracious" },
  { name:"3 John",testament:"NT",category:"General Epistles",chapters:1,original:"Ἰωάννου Γʹ",meaning:"God is Gracious" },
  { name:"Jude",testament:"NT",category:"General Epistles",chapters:1,original:"Ἰούδα",meaning:"Praise" },
  { name:"Revelation",testament:"NT",category:"Prophecy",chapters:22,original:"Ἀποκάλυψις",meaning:"Unveiling" },
];

const CAT_ICONS = { "Pentateuch":"📜","Historical":"⚔️","Wisdom":"💎","Major Prophets":"🔥","Minor Prophets":"📢","Gospels":"✝️","Pauline Epistles":"✉️","Pastoral Epistles":"📋","General Epistles":"📖","Prophecy":"👁️" };
const HIGHLIGHT_COLORS = ["#FFD700","#FF9B71","#7ED4AD","#82B1FF","#CE93D8","#F48FB1"];

// ─── Icons ───
const BackIcon = () => <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>;
const ChevIcon = () => <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="9 18 15 12 9 6"/></svg>;
const CrossIcon = () => <svg width="34" height="34" viewBox="0 0 28 28" fill="none"><rect x="11" y="2" width="6" height="24" rx="1" fill="currentColor" opacity="0.85"/><rect x="3" y="8" width="22" height="6" rx="1" fill="currentColor" opacity="0.85"/></svg>;
const UserIcon = () => <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>;
const PrayerIcon = () => <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round"><path d="M12 2L12 6M12 18L12 22M4.93 4.93L7.76 7.76M16.24 16.24L19.07 19.07M2 12H6M18 12H22M4.93 19.07L7.76 16.24M16.24 7.76L19.07 4.93"/></svg>;
const CloseIcon = () => <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>;

// ─── Themed UI ───
const Badge = ({children,t}) => <span style={{background:t.accentLight,color:t.accent,fontSize:10,padding:"2px 8px",borderRadius:6,fontFamily:t.ui,fontWeight:700,textTransform:"uppercase",letterSpacing:"0.05em"}}>{children}</span>;
const Label = ({icon,children,t,color}) => <div style={{fontFamily:t.ui,fontSize:11.5,fontWeight:700,color:color||t.accent,textTransform:"uppercase",letterSpacing:"0.1em",marginBottom:10,display:"flex",alignItems:"center",gap:6}}><span>{icon}</span> {children}</div>;
const Card = ({children,style={},accent,t}) => <div style={{background:accent?t.accentLight:t.card,borderRadius:14,padding:"18px 20px",border:`1px solid ${accent?t.accentBorder:t.divider}`,boxShadow:accent?"none":"0 1px 4px rgba(0,0,0,0.04)",animation:"fadeIn 0.3s ease",...style}}>{children}</div>;
const Btn = ({children,onClick,style={},disabled}) => <button onClick={onClick} disabled={disabled} style={{background:"rgba(255,255,255,0.15)",border:"none",borderRadius:8,padding:"8px",cursor:disabled?"default":"pointer",display:"flex",alignItems:"center",justifyContent:"center",transition:"all 0.2s",color:"inherit",opacity:disabled?0.4:1,...style}}>{children}</button>;
const Spinner = ({t}) => <div style={{display:"flex",justifyContent:"center",padding:40}}><div style={{width:32,height:32,border:`3px solid ${t.divider}`,borderTop:`3px solid ${t.accent}`,borderRadius:"50%",animation:"spin 0.8s linear infinite"}}/></div>;
const DBBadge = ({live,t}) => <span style={{fontSize:9,padding:"2px 6px",borderRadius:4,background:live?"#1a5c2a22":t.accentLight,color:live?"#1a5c2a":t.muted,fontFamily:"monospace",fontWeight:700}}>{live?"● LIVE":"● PREVIEW"}</span>;

// ═══════════════════════════════════════════════════
// MAIN APP
// ═══════════════════════════════════════════════════
export default function StudyBible() {
  // ─── Core state ───
  const [view, setView] = useState("home");
  const [testament, setTestament] = useState(null);
  const [book, setBook] = useState(null);
  const [chapter, setChapter] = useState(null);
  const [verse, setVerse] = useState(null);
  const [tab, setTab] = useState("study");
  const [fade, setFade] = useState(true);
  const [loading, setLoading] = useState(false);
  const [dbLive, setDbLive] = useState(false);

  // ─── Bible data ───
  const [dbChapters, setDbChapters] = useState({});
  const [chapterMeta, setChapterMeta] = useState(null);
  const [verses, setVerses] = useState([]);
  const [wordStudies, setWordStudies] = useState({});
  const [crossRefs, setCrossRefs] = useState({});

  // ─── Auth state ───
  const [user, setUser] = useState(null);
  const [authModal, setAuthModal] = useState(false);
  const [authMode, setAuthMode] = useState("login");
  const [authEmail, setAuthEmail] = useState("");
  const [authPass, setAuthPass] = useState("");
  const [authName, setAuthName] = useState("");
  const [authError, setAuthError] = useState("");
  const [authLoading, setAuthLoading] = useState(false);
  const [profile, setProfile] = useState(null);

  // ─── User features state ───
  const [userNote, setUserNote] = useState("");
  const [savedNote, setSavedNote] = useState(null);
  const [noteLoading, setNoteLoading] = useState(false);
  const [highlight, setHighlight] = useState(null);
  const [communityNotes, setCommunityNotes] = useState([]);
  const [prayerModal, setPrayerModal] = useState(false);
  const [prayers, setPrayers] = useState([]);
  const [prayerTitle, setPrayerTitle] = useState("");
  const [prayerText, setPrayerText] = useState("");
  const [prayerLoading, setPrayerLoading] = useState(false);
  const [allHighlights, setAllHighlights] = useState([]);
  const [hlLoading, setHlLoading] = useState(false);
  const [subscription, setSubscription] = useState(null);
  const [donateModal, setDonateModal] = useState(false);
  const noteRef = useRef(null);

  // ─── Hebrew Learning state ───
  const [hebrewLessons, setHebrewLessons] = useState([]);
  const [hebrewLesson, setHebrewLesson] = useState(null);
  const [hebrewAlphabet, setHebrewAlphabet] = useState(null);
  const [hebrewVocab, setHebrewVocab] = useState([]);
  const [hebrewCategory, setHebrewCategory] = useState('alphabet');
  const [hebrewProgress, setHebrewProgress] = useState({});
  const [hebrewPracticeMode, setHebrewPracticeMode] = useState(false);
  const [hebrewPracticeIdx, setHebrewPracticeIdx] = useState(0);
  const [hebrewPracticeAnswer, setHebrewPracticeAnswer] = useState(null);
  const [hebrewPracticeScore, setHebrewPracticeScore] = useState(0);
  const hebrewCache = useRef({});
  const [readingStep, setReadingStep] = useState(0);
  const [showLetters, setShowLetters] = useState(false);
  const [readingVerse, setReadingVerse] = useState('gen1v1');
  const [vocabGroup, setVocabGroup] = useState(null);
  const [grammarLesson, setGrammarLesson] = useState(null);
  

  const bookInfo = useMemo(() => book ? BIBLE_BOOKS.find(b => b.name === book) : null, [book]);
  const isOT = bookInfo?.testament === "OT";
  const currentVerse = verses.find(v => v.verse_number === verse);
  const verseNums = verses.map(v => v.verse_number).sort((a,b) => a - b);
  const curIdx = verseNums.indexOf(verse);
  const t = useMemo(() => bookInfo ? THEMES[CATEGORY_THEME[bookInfo.category] || "home"] : THEMES.home, [bookInfo]);
  const ht = THEMES.home;

  // ═══ AUTH ═══
  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null);
      if (session?.user) loadProfile(session.user.id);
    });
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
      if (session?.user) loadProfile(session.user.id);
      else setProfile(null);
    });
    return () => subscription.unsubscribe();
  }, []);

  const loadProfile = async (uid) => {
    const { data } = await supabase.from("user_profiles").select("*").eq("id", uid).single();
    if (data) setProfile(data);
    const { data: sub } = await supabase.from("subscriptions").select("*").eq("user_id", uid).single();
    if (sub) setSubscription(sub);
    else setSubscription({ plan: "free", status: "active" });
  };

  const handleAuth = async () => {
    setAuthError(""); setAuthLoading(true);
    try {
      if (authMode === "login") {
        const { error } = await supabase.auth.signInWithPassword({ email: authEmail, password: authPass });
        if (error) throw error;
      } else {
        const { error } = await supabase.auth.signUp({
          email: authEmail, password: authPass,
          options: { data: { display_name: authName || "Reader" } }
        });
        if (error) throw error;
      }
      setAuthModal(false); setAuthEmail(""); setAuthPass(""); setAuthName("");
    } catch (e) { setAuthError(e.message); }
    setAuthLoading(false);
  };

  const handleLogout = async () => { await supabase.auth.signOut(); setProfile(null); };

  const handleGoogleSignIn = async () => {
    await supabase.auth.signInWithOAuth({
      provider: "google",
      options: { redirectTo: window.location.origin }
    });
  };

  // ═══ USER FEATURES ═══
  // Load user data for current verse
  useEffect(() => {
    if (!user || !currentVerse) return;
    (async () => {
      // Load personal note
      const { data: note } = await supabase.from("user_notes").select("*").eq("user_id", user.id).eq("verse_id", currentVerse.id).maybeSingle();
      if (note) { setSavedNote(note); setUserNote(note.note_text); if (noteRef.current) noteRef.current.value = note.note_text; } else { setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = ""; }
      // Load highlight
      const { data: hl } = await supabase.from("user_highlights").select("*").eq("user_id", user.id).eq("verse_id", currentVerse.id).maybeSingle();
      setHighlight(hl);
      // Load community notes
      const { data: cn } = await supabase.from("user_notes").select("*, user_profiles(display_name)").eq("verse_id", currentVerse.id).eq("is_public", true).neq("user_id", user.id);
      setCommunityNotes(cn || []);
    })();
  }, [user, currentVerse]);

  // Clear user data when no user or verse changes
  useEffect(() => {
    if (!user) { setSavedNote(null); setUserNote(""); if (noteRef.current) noteRef.current.value = ""; setHighlight(null); setCommunityNotes([]); }
  }, [user, verse]);

  const saveNote = async () => {
    const noteText = noteRef.current?.value || "";
    if (!user || !currentVerse || !noteText.trim()) return;
    setNoteLoading(true);
    if (savedNote) {
      const { data } = await supabase.from("user_notes").update({ note_text: noteText, updated_at: new Date().toISOString() }).eq("id", savedNote.id).select().single();
      if (data) setSavedNote(data);
    } else {
      const { data } = await supabase.from("user_notes").insert({ user_id: user.id, verse_id: currentVerse.id, note_text: noteText }).select().single();
      if (data) setSavedNote(data);
    }
    setNoteLoading(false);
  };

  const toggleNotePublic = async () => {
    if (!savedNote) return;
    const { data } = await supabase.from("user_notes").update({ is_public: !savedNote.is_public }).eq("id", savedNote.id).select().single();
    if (data) setSavedNote(data);
  };

  const toggleHighlight = async (color) => {
    if (!user || !currentVerse) return;
    if (highlight?.highlight_color === color) {
      await supabase.from("user_highlights").delete().eq("id", highlight.id);
      setHighlight(null);
    } else if (highlight) {
      const { data } = await supabase.from("user_highlights").update({ highlight_color: color }).eq("id", highlight.id).select().single();
      if (data) setHighlight(data);
    } else {
      const { data } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: currentVerse.id, highlight_color: color }).select().single();
      if (data) setHighlight(data);
    }
  };

  const toggleBookmarkHL = async () => {
    if (!user || !currentVerse) return;
    if (highlight) {
      const { data } = await supabase.from("user_highlights").update({ is_bookmarked: !highlight.is_bookmarked }).eq("id", highlight.id).select().single();
      if (data) setHighlight(data);
    } else {
      const { data } = await supabase.from("user_highlights").insert({ user_id: user.id, verse_id: currentVerse.id, is_bookmarked: true, highlight_color: "#FFD700" }).select().single();
      if (data) setHighlight(data);
    }
  };

  // ═══ PRAYER JOURNAL ═══
  const loadPrayers = useCallback(async () => {
    if (!user) return;
    setPrayerLoading(true);
    const { data } = await supabase.from("prayer_journal").select("*").eq("user_id", user.id).order("created_at", { ascending: false });
    setPrayers(data || []);
    setPrayerLoading(false);
  }, [user]);

  useEffect(() => { if (prayerModal && user) loadPrayers(); }, [prayerModal, user, loadPrayers]);

  const addPrayer = async () => {
    if (!user || !prayerText.trim()) return;
    const entry = {
      user_id: user.id, title: prayerTitle || "Prayer", prayer_text: prayerText,
      verse_id: currentVerse?.id || null,
      book_name: book || null, chapter_number: chapter || null, verse_number: verse || null,
    };
    await supabase.from("prayer_journal").insert(entry);
    setPrayerTitle(""); setPrayerText("");
    loadPrayers();
  };

  const togglePrayerAnswered = async (id, current) => {
    await supabase.from("prayer_journal").update({ is_answered: !current }).eq("id", id);
    loadPrayers();
  };

  const deletePrayer = async (id) => {
    await supabase.from("prayer_journal").delete().eq("id", id);
    loadPrayers();
  };

  // ═══ LOAD ALL HIGHLIGHTS ═══
  const loadAllHighlights = useCallback(async () => {
    if (!user) return;
    setHlLoading(true);
    const { data } = await supabase
      .from("user_highlights")
      .select("*, verses(verse_number, kjv_text, chapter_id, chapters(chapter_number, book_id, books(name)))")
      .eq("user_id", user.id)
      .order("created_at", { ascending: false });
    setAllHighlights(data || []);
    setHlLoading(false);
  }, [user]);

  useEffect(() => { if ((view === "highlights" || view === "journal-home") && user) loadAllHighlights(); }, [view, user, loadAllHighlights]);
  useEffect(() => { if ((view === "account" || view === "journal-home") && user) loadPrayers(); }, [view, user, loadPrayers]);
  useEffect(() => { if (view === "account" && user) loadAllHighlights(); }, [view, user, loadAllHighlights]);

  // ═══ HEBREW LEARNING ═══
  const loadHebrewLessons = useCallback(async (cat = 'alphabet') => {
    const cacheKey = `lessons-${cat}`;
    if (hebrewCache.current[cacheKey]) { setHebrewLessons(hebrewCache.current[cacheKey]); return; }
    const { data } = await supabase.from("hebrew_lessons").select("*").eq("category", cat).order("lesson_number");
    if (data) { hebrewCache.current[cacheKey] = data; setHebrewLessons(data); }
  }, []);

  const loadHebrewLesson = useCallback(async (lessonId) => {
    const cacheKey = `lesson-${lessonId}`;
    if (hebrewCache.current[cacheKey]) {
      const cached = hebrewCache.current[cacheKey];
      setHebrewLesson(cached.lesson); setHebrewAlphabet(cached.alphabet); setHebrewVocab(cached.vocab);
      return;
    }
    const { data: lesson } = await supabase.from("hebrew_lessons").select("*").eq("id", lessonId).single();
    const { data: alphabet } = await supabase.from("hebrew_alphabet").select("*").eq("lesson_id", lessonId).single();
    const { data: vocab } = await supabase.from("hebrew_vocabulary").select("*").eq("lesson_id", lessonId).order("id");
    if (lesson) setHebrewLesson(lesson);
    if (alphabet) setHebrewAlphabet(alphabet);
    setHebrewVocab(vocab || []);
    hebrewCache.current[cacheKey] = { lesson, alphabet, vocab: vocab || [] };
  }, []);

  const loadHebrewProgress = useCallback(async () => {
    if (!user) return;
    const { data } = await supabase.from("user_hebrew_progress").select("*").eq("user_id", user.id);
    if (data) {
      const map = {}; data.forEach(p => { map[p.lesson_id] = p; });
      setHebrewProgress(map);
    }
  }, [user]);

  const markHebrewComplete = async (lessonId, score) => {
    if (!user) return;
    const existing = hebrewProgress[lessonId];
    if (existing) {
      await supabase.from("user_hebrew_progress").update({ completed: true, score: score || existing.score, completed_at: new Date().toISOString() }).eq("id", existing.id);
    } else {
      await supabase.from("user_hebrew_progress").insert({ user_id: user.id, lesson_id: lessonId, completed: true, score, completed_at: new Date().toISOString() });
    }
    loadHebrewProgress();
  };

  useEffect(() => { if (view === "hebrew-home") { loadHebrewLessons(hebrewCategory); loadHebrewProgress(); } }, [view, hebrewCategory, loadHebrewLessons, loadHebrewProgress]);
  useEffect(() => { if (view === "hebrew-lesson" && hebrewLesson?.id) loadHebrewLesson(hebrewLesson.id); }, [view]);

  // ═══ DB & NAVIGATION ═══
  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data?.length > 0 && !error) {
          setDbLive(true);
          const { data: chapData } = await supabase.from("chapters").select("book_id, chapter_number, theme, books(name)").order("chapter_number");
          if (chapData) {
            const chMap = {};
            chapData.forEach(c => { const n = c.books?.name; if (n) { if (!chMap[n]) chMap[n] = []; chMap[n].push({ num: c.chapter_number, theme: c.theme }); } });
            setDbChapters(chMap);
          }
        }
      } catch { setDbLive(false); }
    })();
  }, []);

  const loadChapter = useCallback(async (bookName, chNum) => {
    setLoading(true);
    try {
      const { data: bookData } = await supabase.from("books").select("id").eq("name", bookName).single();
      if (!bookData) { setLoading(false); return; }
      const { data: chData } = await supabase.from("chapters").select("*").eq("book_id", bookData.id).eq("chapter_number", chNum).single();
      if (!chData) { setLoading(false); return; }
      setChapterMeta(chData);
      const { data: vData } = await supabase.from("verses").select("*").eq("chapter_id", chData.id).order("verse_number");
      if (!vData?.length) { setLoading(false); return; }
      setVerses(vData);
      const vIds = vData.map(v => v.id);
      const { data: ws } = await supabase.from("word_studies").select("*").in("verse_id", vIds).order("word_order");
      const wsMap = {}; if (ws) ws.forEach(w => { if (!wsMap[w.verse_id]) wsMap[w.verse_id] = []; wsMap[w.verse_id].push(w); });
      setWordStudies(wsMap);
      const { data: cr } = await supabase.from("cross_references").select("*").in("verse_id", vIds).order("ref_order");
      const crMap = {}; if (cr) cr.forEach(r => { if (!crMap[r.verse_id]) crMap[r.verse_id] = []; crMap[r.verse_id].push(r); });
      setCrossRefs(crMap);
    } catch (e) { console.error(e); }
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

  useEffect(() => { if ((view === "verse" || view === "verses") && book && chapter && dbLive) loadChapter(book, chapter); }, [view, book, chapter, dbLive, loadChapter]);
  useEffect(() => { if (view === "verse" && !verse && verseNums.length > 0) setVerse(verseNums[0]); }, [view, verse, verseNums]);

  // Auth modal rendered inline below in return

  // Prayer modal rendered inline below in return

  // ═══════════════════════════════════════════════════
  // HEADER
  // ═══════════════════════════════════════════════════
  const Header = ({ title, subtitle, onBack, right, theme }) => {
    const th = theme || t;
    return (
      <div style={{ background:th.headerGradient,padding:"14px 20px 18px",position:"sticky",top:0,zIndex:10 }}>
        <div style={{ display:"flex",alignItems:"center",justifyContent:"space-between" }}>
          <div style={{ display:"flex",alignItems:"center",gap:10,flex:1,minWidth:0 }}>
            {onBack && <Btn onClick={onBack} style={{color:th.headerText}}><BackIcon /></Btn>}
            <div style={{ minWidth:0 }}>
              <h2 style={{ fontFamily:th.heading,fontSize:19,fontWeight:700,color:th.headerText,margin:0,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis" }}>{title}</h2>
              {subtitle && <div style={{ fontFamily:th.ui,fontSize:12,color:`${th.headerText}99`,marginTop:1 }}>{subtitle}</div>}
            </div>
          </div>
          <div style={{ display:"flex",alignItems:"center",gap:6,flexShrink:0 }}>
            {right}
            {user && <Btn onClick={() => setPrayerModal(true)} style={{color:th.headerText}} title="Prayer Journal"><PrayerIcon /></Btn>}
            <Btn onClick={() => user ? handleLogout() : setAuthModal(true)} style={{ color:th.headerText,background:user?"rgba(125,212,173,0.2)":"rgba(255,255,255,0.1)",padding:"6px 10px",borderRadius:8 }}>
              <UserIcon />
              {user && <span style={{ fontFamily:th.ui,fontSize:10,marginLeft:4,fontWeight:600 }}>{profile?.display_name?.split(' ')[0] || '•'}</span>}
            </Btn>
          </div>
        </div>
      </div>
    );
  };

  // ═══ HOME ═══
  const Home = () => (
    <div style={{ minHeight:"100vh",background:ht.bg }}>
      <div style={{ background:ht.headerGradient,padding:"50px 24px 42px",textAlign:"center",position:"relative",overflow:"hidden" }}>
        <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 0%,rgba(212,168,83,0.15) 0%,transparent 70%)" }}/>
        <div style={{ position:"relative",zIndex:1 }}>
          <div style={{ color:ht.accent,marginBottom:12 }}><CrossIcon /></div>
          <h1 style={{ fontFamily:ht.heading,fontSize:38,fontWeight:800,color:ht.headerText,margin:"0 0 6px" }}>Study Bible</h1>
          <div style={{ fontFamily:ht.ui,fontSize:14,color:ht.accent,letterSpacing:"0.15em",textTransform:"uppercase",marginBottom:8 }}>King James Version</div>
          <div style={{ fontFamily:ht.body,fontSize:13,color:`${ht.headerText}60`,fontStyle:"italic" }}>Hebrew & Greek · Word Studies · Cross-References · Notes</div>
          <div style={{ display:"flex",gap:8,justifyContent:"center",marginTop:12,alignItems:"center" }}>
            <DBBadge live={dbLive} t={ht} />
            {!user && <button onClick={() => setAuthModal(true)} style={{ background:"rgba(212,168,83,0.35)",border:"1px solid rgba(212,168,83,0.5)",borderRadius:8,padding:"8px 18px",fontFamily:ht.ui,fontSize:12,fontWeight:700,color:"#fff",cursor:"pointer",letterSpacing:"0.03em" }}>✏️ Sign In to Save Notes</button>}
            {user && <span style={{ fontFamily:ht.ui,fontSize:10,color:"rgba(125,212,173,0.8)",fontWeight:700 }}>✓ Signed in as {profile?.display_name || "Reader"}</span>}
          </div>
        </div>
      </div>
      <div style={{ padding:"22px 20px 40px" }}>
        <div style={{ maxWidth:520,margin:"0 auto" }}>
          <button onClick={() => setDonateModal(true)} style={{ width:"100%",background:"linear-gradient(135deg,rgba(212,168,83,0.1),rgba(212,168,83,0.05))",border:`1px solid ${ht.accentBorder}`,borderRadius:14,padding:"16px 18px",marginBottom:22,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",gap:14,boxShadow:"0 1px 4px rgba(0,0,0,0.04)" }}>
            <div style={{ width:44,height:44,borderRadius:12,background:"linear-gradient(135deg,#D4A853,#B8860B)",display:"flex",alignItems:"center",justifyContent:"center",fontSize:22,flexShrink:0 }}>❤️</div>
            <div style={{ flex:1 }}>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Support the Ministry</div>
              <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted,lineHeight:1.5,marginTop:2 }}>Every feature is free. Your generosity keeps it that way.</div>
            </div>
            <div style={{ color:ht.light }}><ChevIcon /></div>
          </button>
          <Label icon="📖" t={ht} color={ht.muted}>Browse the Bible</Label>
          {[
            { t:"OT",l:"Old Testament",s:"39 Books · Genesis to Malachi",o:"בְּרֵאשִׁית — In the Beginning",thm:"garden" },
            { t:"NT",l:"New Testament",s:"27 Books · Matthew to Revelation",o:"Ἡ Καινὴ Διαθήκη — The New Covenant",thm:"ocean" },
          ].map(item => (
            <button key={item.t} onClick={() => nav("books",{testament:item.t})} style={{ width:"100%",background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,padding:"18px",marginBottom:10,cursor:"pointer",textAlign:"left",transition:"all 0.2s",boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
              <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center" }}>
                <div>
                  <div style={{ fontFamily:ht.heading,fontSize:18,fontWeight:700,color:ht.dark }}>{item.l}</div>
                  <div style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted }}>{item.s}</div>
                  <div style={{ fontFamily:ht.body,fontSize:12.5,color:ht.light,fontStyle:"italic",marginTop:3 }}>{item.o}</div>
                </div>
                <div style={{ width:38,height:38,borderRadius:10,background:THEMES[item.thm].headerGradient,display:"flex",alignItems:"center",justifyContent:"center",color:THEMES[item.thm].headerText }}><ChevIcon /></div>
              </div>
            </button>
          ))}
          <Label icon="🏫" t={ht} color={ht.muted}>Learn the Original Languages</Label>
          <div style={{ display:"flex",gap:10,marginBottom:22 }}>
            <button onClick={() => nav("hebrew-home")} style={{ flex:1,background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,padding:"18px 16px",textAlign:"center",boxShadow:"0 1px 3px rgba(0,0,0,0.04)",cursor:"pointer",transition:"all 0.2s" }}>
              <div style={{ fontSize:32,marginBottom:8 }}>🕎</div>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:22,color:ht.dark,direction:"rtl",marginBottom:4 }}>עִבְרִית</div>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Learn Hebrew</div>
              <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4,lineHeight:1.5 }}>The language of the Old Testament</div>
              <div style={{ marginTop:8,background:"rgba(192,108,62,0.12)",borderRadius:6,padding:"3px 10px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#C06C3E",textTransform:"uppercase",letterSpacing:"0.05em",display:"inline-block" }}>Start Learning →</div>
            </button>
            <div style={{ flex:1,background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,padding:"18px 16px",textAlign:"center",boxShadow:"0 1px 3px rgba(0,0,0,0.04)",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",top:8,right:8,background:"rgba(27,122,110,0.12)",borderRadius:6,padding:"2px 8px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#1B7A6E",textTransform:"uppercase",letterSpacing:"0.05em" }}>Coming Soon</div>
              <div style={{ fontSize:32,marginBottom:8 }}>🏛️</div>
              <div style={{ fontFamily:"'Times New Roman',serif",fontSize:22,color:ht.dark,marginBottom:4 }}>Ἑλληνική</div>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Learn Greek</div>
              <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4,lineHeight:1.5 }}>The language of the New Testament</div>
            </div>
          </div>

          <Label icon="🔬" t={ht} color={ht.muted}>Study Tools</Label>
          <div style={{ display:"flex",gap:10,marginBottom:22 }}>
            <div style={{ flex:1,background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,padding:"18px 16px",textAlign:"center",boxShadow:"0 1px 3px rgba(0,0,0,0.04)",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",top:8,right:8,background:"rgba(212,168,83,0.12)",borderRadius:6,padding:"2px 8px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#D4A853",textTransform:"uppercase",letterSpacing:"0.05em" }}>Coming Soon</div>
              <div style={{ fontSize:32,marginBottom:8 }}>📜</div>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Biblical Timeline</div>
              <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4,lineHeight:1.5 }}>From Creation to Revelation</div>
            </div>
            <div style={{ flex:1,background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:14,padding:"18px 16px",textAlign:"center",boxShadow:"0 1px 3px rgba(0,0,0,0.04)",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",top:8,right:8,background:"rgba(232,98,92,0.12)",borderRadius:6,padding:"2px 8px",fontFamily:ht.ui,fontSize:9,fontWeight:700,color:"#E8625C",textTransform:"uppercase",letterSpacing:"0.05em" }}>Coming Soon</div>
              <div style={{ fontSize:32,marginBottom:8 }}>🛡️</div>
              <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:700,color:ht.dark }}>Apologetics</div>
              <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4,lineHeight:1.5 }}>Defend & understand the faith</div>
            </div>
          </div>

          <div style={{ display:"flex",justifyContent:"center",gap:28,marginTop:22,padding:"14px 0",borderTop:`1px solid ${ht.divider}` }}>
            {[{n:"66",l:"Books"},{n:"1,189",l:"Chapters"},{n:"31,102",l:"Verses"}].map((s,i) => (
              <div key={i} style={{ textAlign:"center" }}>
                <div style={{ fontFamily:ht.heading,fontSize:20,fontWeight:700,color:ht.dark }}>{s.n}</div>
                <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.1em" }}>{s.l}</div>
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
    const cats = {}; books.forEach(b => { if (!cats[b.category]) cats[b.category] = []; cats[b.category].push(b); });
    return (
      <div style={{ minHeight:"100vh",background:ht.bg }}>
        <Header title={testament === "OT" ? "Old Testament" : "New Testament"} subtitle={`${books.length} Books`} onBack={() => nav("home")} theme={ht} />
        <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
          {Object.entries(cats).map(([cat, catBooks]) => {
            const ct = THEMES[CATEGORY_THEME[cat] || "home"];
            return (
              <div key={cat} style={{ marginBottom:22 }}>
                <div style={{ display:"flex",alignItems:"center",gap:7,marginBottom:9 }}>
                  <span style={{ fontSize:15 }}>{CAT_ICONS[cat]}</span>
                  <span style={{ fontFamily:ct.ui,fontSize:12,fontWeight:700,color:ct.accent,textTransform:"uppercase",letterSpacing:"0.1em" }}>{cat}</span>
                  <div style={{ flex:1,height:1,background:ct.accentBorder }}/>
                </div>
                {catBooks.map(b => (
                  <button key={b.name} onClick={() => nav("chapter",{book:b.name})} style={{ width:"100%",background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:12,padding:"11px 14px",marginBottom:5,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",gap:12,borderLeft:`3px solid ${ct.accent}`,boxShadow:"0 1px 2px rgba(0,0,0,0.03)",transition:"all 0.15s" }}>
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:7 }}>
                        <span style={{ fontFamily:ct.heading,fontSize:14.5,fontWeight:600,color:ht.dark }}>{b.name}</span>
                        {(dbChapters[b.name]?.length > 0) && <Badge t={ct}>Study Notes</Badge>}
                      </div>
                      <div style={{ fontFamily:ct.ui,fontSize:12,color:ht.muted,marginTop:2 }}><span style={{ fontStyle:"italic",color:ht.light }}>{b.original}</span> — {b.meaning} · {b.chapters} ch.</div>
                    </div>
                    <div style={{ color:ht.light }}><ChevIcon /></div>
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
    const avail = dbChapters[book] || [];
    const availNums = avail.map(a => a.num);
    const getTheme = (ch) => { const found = avail.find(a => a.num === ch); return found?.theme || null; };
    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={book} subtitle={`${bookInfo.original} — ${bookInfo.meaning}`} onBack={() => nav("books",{testament:bookInfo.testament})} />
        <div style={{ padding:"18px 16px 40px",maxWidth:520,margin:"0 auto" }}>
          {bookInfo.author && <Card accent t={t} style={{marginBottom:14}}><div style={{fontFamily:t.ui,fontSize:13.5,color:t.text,lineHeight:1.6}}><strong>Author:</strong> {bookInfo.author} · <strong>Date:</strong> {bookInfo.dateWritten}</div></Card>}
          <Label icon="📋" t={t} color={t.muted}>{bookInfo.chapters} Chapters</Label>
          <div style={{ background:t.card,borderRadius:12,border:`1px solid ${t.divider}`,overflow:"hidden" }}>
            {Array.from({length:bookInfo.chapters},(_,i)=>i+1).map(ch => {
              const has = availNums.includes(ch);
              const theme = getTheme(ch);
              return (
                <button key={ch} onClick={() => { if (has) nav("verses",{chapter:ch,verse:null}); }} style={{ width:"100%",display:"flex",alignItems:"center",padding:"10px 14px",background:"transparent",border:"none",borderBottom:`1px solid ${t.divider}`,cursor:has?"pointer":"default",opacity:has?1:0.4,textAlign:"left",transition:"all 0.1s",gap:10 }}>
                  <span style={{ fontFamily:t.heading,fontSize:14,fontWeight:has?700:400,color:has?t.accent:t.light,minWidth:28,textAlign:"center" }}>{ch}</span>
                  <span style={{ flex:1,fontFamily:t.ui,fontSize:12.5,color:has?t.text:t.light,whiteSpace:"nowrap",overflow:"hidden",textOverflow:"ellipsis" }}>{theme || (has ? "Study available" : "—")}</span>
                  {has && <div style={{ color:t.light,flexShrink:0 }}><ChevIcon /></div>}
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  // ═══ VERSE LIST ═══
  const VerseList = () => {
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} subtitle="Loading verses..." onBack={() => nav("chapter",{book})} /><Spinner t={t} /></div>;
    if (!verses.length) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={() => nav("chapter",{book})} /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>📖</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>No verses loaded</div></div></div>;

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={`${book} ${chapter}`} subtitle={chapterMeta?.theme || `${verses.length} Verses`} onBack={() => nav("chapter",{book})} />
        <div style={{ maxWidth:620,margin:"0 auto",padding:"16px 16px 40px" }}>

          {/* Chapter Illustration */}
          {chapterMeta?.illustration_url && (
            <div style={{marginBottom:14,borderRadius:14,overflow:"hidden",boxShadow:"0 2px 12px rgba(0,0,0,0.1)"}}>
              <img src={chapterMeta.illustration_url} alt={`${book} ${chapter}`} style={{width:"100%",height:200,objectFit:"cover",display:"block"}} />
            </div>
          )}

          {/* Chapter Overview (compact) */}
          {chapterMeta?.overview && (
            <Card accent t={t} style={{marginBottom:14}}>
              <Label icon="📋" t={t}>Overview</Label>
              <div style={{fontFamily:t.body,fontSize:13.5,color:t.text,lineHeight:1.6,display:"-webkit-box",WebkitLineClamp:3,WebkitBoxOrient:"vertical",overflow:"hidden"}}>{chapterMeta.overview}</div>
            </Card>
          )}

          {/* All Verses */}
          <div style={{padding:"10px 14px",background:t.accentLight,borderRadius:8,marginBottom:10,display:"flex",alignItems:"center",gap:8}}>
            <span style={{fontSize:14}}>✨</span>
            <span style={{fontFamily:t.ui,fontSize:12,color:t.muted}}>Tap any verse to explore study notes, {isOT ? "Hebrew" : "Greek"} text & cross-references</span>
          </div>
          <div style={{display:"flex",flexDirection:"column",gap:6}}>
            {verses.map(v => (
              <button key={v.verse_number} onClick={() => nav("verse",{verse:v.verse_number,tab:"study"})}
                style={{
                  background:t.card,border:`1px solid ${t.divider}`,borderRadius:12,
                  padding:"14px 16px",textAlign:"left",cursor:"pointer",
                  display:"flex",gap:12,alignItems:"flex-start",
                  boxShadow:"0 1px 3px rgba(0,0,0,0.03)",transition:"all 0.15s"
                }}>
                <span style={{
                  fontFamily:t.heading,fontSize:18,fontWeight:800,color:t.verseNum,
                  minWidth:28,textAlign:"center",lineHeight:1.4
                }}>{v.verse_number}</span>
                <div style={{flex:1,minWidth:0}}>
                  <div style={{fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.65}}>{v.kjv_text}</div>
                </div>
                <div style={{color:t.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ VERSE STUDY ═══
  const VerseStudy = () => {
    if (loading) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={() => nav("verses",{book, chapter})} /><Spinner t={t} /><div style={{textAlign:"center",fontFamily:t.ui,fontSize:15,color:t.muted}}>Loading...</div></div>;
    if (!currentVerse) return <div style={{minHeight:"100vh",background:t.bg}}><Header title={`${book} ${chapter}`} onBack={() => nav("verses",{book, chapter})} /><div style={{textAlign:"center",padding:40}}><div style={{fontSize:48,marginBottom:16}}>📖</div><div style={{fontFamily:t.heading,fontSize:18,color:t.dark}}>{dbLive?"Loading...":"Connect to Supabase"}</div></div></div>;

    const ref = `${book} ${chapter}:${verse}`;
    const vWords = wordStudies[currentVerse.id] || [];
    const vRefs = crossRefs[currentVerse.id] || [];
    const outline = chapterMeta?.outline ? JSON.parse(chapterMeta.outline) : [];

    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={ref} subtitle={chapterMeta?.theme} onBack={() => nav("verses",{book,chapter})}
          right={<>
            <DBBadge live={dbLive} t={t} />
            {user && <Btn onClick={toggleBookmarkHL} style={{color:highlight?.is_bookmarked?"#ffd700":t.headerText,fontSize:18,padding:"7px 10px",background:highlight?.is_bookmarked?"rgba(255,215,0,0.2)":"rgba(255,255,255,0.1)"}}>{highlight?.is_bookmarked?"★":"☆"}</Btn>}
          </>}
        />
        <div style={{ maxWidth:620,margin:"0 auto",padding:"0 16px 40px" }}>
          {/* Chapter Overview */}
          {chapterMeta?.overview && (
            <Card accent t={t} style={{margin:"14px 0"}}>
              <Label icon="📋" t={t}>Chapter {chapter} Overview</Label>
              <div style={{fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.65}}>{chapterMeta.overview}</div>
              {chapterMeta.key_word_original && <div style={{marginTop:10,padding:"8px 12px",background:"rgba(255,255,255,0.6)",borderRadius:8,display:"flex",alignItems:"center",gap:8,flexWrap:"wrap"}}><Badge t={t}>Key Word</Badge><span style={{fontFamily:t.body,fontSize:14,color:t.dark,fontStyle:"italic"}}>{chapterMeta.key_word_original}</span><span style={{fontFamily:t.ui,fontSize:12,color:t.muted}}>— {chapterMeta.key_word_meaning}</span></div>}
              {outline.length > 0 && <div style={{marginTop:12}}><div style={{fontFamily:t.ui,fontSize:10,fontWeight:700,color:t.accent,textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:6}}>Outline</div>{outline.map((o,i) => <div key={i} style={{fontFamily:t.ui,fontSize:13,color:t.text,lineHeight:1.7,paddingLeft:12,borderLeft:`2px solid ${t.accentBorder}`,marginBottom:4}}>{o}</div>)}</div>}
            </Card>
          )}

          {/* KJV Text Card */}
          <Card t={t} style={{ margin:"12px 0 14px",position:"relative",background:highlight?.highlight_color ? `${highlight.highlight_color}15` : t.card,borderColor:highlight?.highlight_color ? `${highlight.highlight_color}40` : t.divider }}>
            <div style={{position:"absolute",top:-1,left:30,right:30,height:3,background:`linear-gradient(90deg,transparent,${t.accent},transparent)`,borderRadius:"0 0 2px 2px"}}/>
            <Label icon="📖" t={t}>KJV Text</Label>
            <div style={{fontFamily:t.body,fontSize:19.5,color:t.dark,lineHeight:1.7}}>
              <span style={{fontSize:38,fontWeight:800,color:t.verseNum,float:"left",lineHeight:0.85,marginRight:8,marginTop:4,fontFamily:t.heading}}>{verse}</span>
              {currentVerse.kjv_text}
            </div>
            {/* Highlight colors */}
            {user && <div style={{display:"flex",gap:6,marginTop:12,paddingTop:10,borderTop:`1px solid ${t.divider}`}}>
              <span style={{fontFamily:t.ui,fontSize:10,color:t.muted,alignSelf:"center",marginRight:4}}>Highlight:</span>
              {HIGHLIGHT_COLORS.map(c => <button key={c} onClick={() => toggleHighlight(c)} style={{width:24,height:24,borderRadius:"50%",background:c,border:highlight?.highlight_color===c?`3px solid ${t.dark}`:`2px solid ${c}66`,cursor:"pointer",transition:"all 0.15s"}} />)}
              {highlight?.highlight_color && <button onClick={() => toggleHighlight(highlight.highlight_color)} style={{fontFamily:t.ui,fontSize:10,color:t.muted,background:"none",border:"none",cursor:"pointer",textDecoration:"underline"}}>Clear</button>}
            </div>}
          </Card>

          {/* Tabs */}
          <div style={{ display:"flex",background:t.card,borderRadius:10,padding:3,marginBottom:14,border:`1px solid ${t.divider}` }}>
            {[
              {id:"study",label:"Study Notes"},
              {id:"original",label:isOT?"Hebrew":"Greek"},
              {id:"cross",label:`Cross-Refs${vRefs.length?` (${vRefs.length})`:""}`},
              ...(user ? [{id:"my",label:"My Notes"}] : [])
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)} style={{ flex:1,padding:"10px 4px",border:"none",borderRadius:8,background:tab===tb.id?t.tabActive:"transparent",color:tab===tb.id?t.headerText:t.muted,fontFamily:t.ui,fontSize:12,fontWeight:700,cursor:"pointer",transition:"all 0.15s" }}>{tb.label}</button>
            ))}
          </div>

          {/* Study Notes Tab */}
          {tab === "study" && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {currentVerse.study_note && <Card t={t}><Label icon="📝" t={t}>Study Note</Label><div style={{fontFamily:t.body,fontSize:15,color:t.text,lineHeight:1.75}}>{currentVerse.study_note}</div></Card>}
            {currentVerse.doctrinal_note && <Card accent t={t}><Label icon="⛪" t={t} color={t.dark}>Doctrinal Note</Label><div style={{fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.7,fontStyle:"italic"}}>{currentVerse.doctrinal_note}</div></Card>}
            {!currentVerse.study_note && !currentVerse.doctrinal_note && <Card t={t}><div style={{fontFamily:t.ui,fontSize:14,color:t.muted,textAlign:"center",padding:16}}>Study notes coming soon.</div></Card>}
          </div>}

          {/* Hebrew/Greek Tab */}
          {tab === "original" && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {currentVerse.original_text && <Card t={t}><Label icon="🕎" t={t}>{isOT?"Hebrew Text":"Greek Text"}</Label>
              <div style={{fontFamily:"'Times New Roman',serif",fontSize:isOT?24:19,color:t.dark,lineHeight:2,direction:isOT?"rtl":"ltr",textAlign:isOT?"right":"left",padding:"14px 18px",background:t.hebrewBg,borderRadius:10,marginBottom:10}}>{currentVerse.original_text}</div>
              {currentVerse.transliteration && <div style={{fontFamily:t.body,fontSize:14,color:t.muted,fontStyle:"italic",lineHeight:1.6}}><span style={{fontWeight:700,fontStyle:"normal",fontSize:10,textTransform:"uppercase",letterSpacing:"0.05em",fontFamily:t.ui}}>Transliteration: </span>{currentVerse.transliteration}</div>}
            </Card>}
            {vWords.length > 0 && <Card t={t}><Label icon="🔍" t={t}>Word Study</Label><div style={{display:"flex",flexDirection:"column",gap:9}}>
              {vWords.map((w,i) => <div key={i} style={{padding:"12px 14px",borderRadius:10,background:t.accentLight,border:`1px solid ${t.accentBorder}`}}>
                <div style={{display:"flex",alignItems:"center",gap:8,marginBottom:5,flexWrap:"wrap"}}>
                  <span style={{fontFamily:"'Times New Roman',serif",fontSize:isOT?20:16,color:t.accent,fontWeight:700,direction:isOT?"rtl":"ltr"}}>{w.original_word}</span>
                  <span style={{fontFamily:t.body,fontSize:13,color:t.muted,fontStyle:"italic"}}>({w.transliteration})</span>
                  <span style={{background:t.accentLight,border:`1px solid ${t.accentBorder}`,padding:"2px 7px",borderRadius:4,fontFamily:"monospace",fontSize:10.5,color:t.muted}}>{w.strongs_number}</span>
                </div>
                <div style={{fontFamily:t.ui,fontSize:13.5,color:t.text,lineHeight:1.6}}>{w.meaning}</div>
              </div>)}
            </div></Card>}
          </div>}

          {/* Cross-Refs Tab */}
          {tab === "cross" && <Card t={t}><Label icon="🔗" t={t}>Cross References</Label>
            {vRefs.length > 0 ? <div style={{display:"flex",flexWrap:"wrap",gap:7}}>{vRefs.map((r,i) => <span key={i} style={{background:t.accentLight,border:`1px solid ${t.accentBorder}`,borderRadius:8,padding:"8px 13px",fontFamily:t.ui,fontSize:13.5,color:t.dark,fontWeight:600}}>{r.reference}</span>)}</div>
            : <div style={{fontFamily:t.ui,fontSize:14,color:t.muted,textAlign:"center",padding:16}}>Cross references coming soon.</div>}
          </Card>}

          {/* MY NOTES Tab */}
          {tab === "my" && user && <div style={{display:"flex",flexDirection:"column",gap:12}}>
            <Card t={t}>
              <Label icon="✏️" t={t}>My Note on {book} {chapter}:{verse}</Label>
              <textarea ref={noteRef} defaultValue={userNote} placeholder="Write your personal thoughts, reflections, or insights on this verse..." rows={4} style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1px solid ${t.divider}`,fontFamily:t.body,fontSize:14,color:t.text,outline:"none",background:t.bg,resize:"vertical",lineHeight:1.7,boxSizing:"border-box" }} />
              <div style={{ display:"flex",gap:8,marginTop:10,alignItems:"center",flexWrap:"wrap" }}>
                <button onClick={saveNote} disabled={noteLoading} style={{ padding:"10px 20px",borderRadius:8,border:"none",background:t.accent,color:"#fff",fontFamily:t.ui,fontSize:13,fontWeight:700,cursor:"pointer" }}>{noteLoading ? "Saving..." : savedNote ? "Update Note" : "Save Note"}</button>
                {savedNote && <>
                  <button onClick={toggleNotePublic} style={{ padding:"8px 14px",borderRadius:8,border:`1px solid ${savedNote.is_public?'#7ED4AD':t.divider}`,background:savedNote.is_public?'#7ED4AD22':'transparent',fontFamily:t.ui,fontSize:12,fontWeight:600,color:savedNote.is_public?'#2E7D5B':t.muted,cursor:"pointer" }}>
                    {savedNote.is_public ? "🌍 Shared" : "🔒 Private"} — tap to {savedNote.is_public ? "make private" : "share"}
                  </button>
                </>}
              </div>
              {savedNote && <div style={{fontFamily:t.ui,fontSize:10,color:t.light,marginTop:8}}>Last saved: {new Date(savedNote.updated_at).toLocaleString()}</div>}
            </Card>

            <button onClick={() => { setPrayerTitle(`Prayer for ${book} ${chapter}:${verse}`); setPrayerText(""); setPrayerModal(true); }} style={{ padding:"14px",borderRadius:12,border:`1px dashed ${t.accentBorder}`,background:t.accentLight,fontFamily:t.ui,fontSize:14,fontWeight:600,color:t.accent,cursor:"pointer",textAlign:"center" }}>
              🙏 Add Prayer for This Verse
            </button>

            {communityNotes.length > 0 && <Card t={t}>
              <Label icon="🌍" t={t} color={t.muted}>Community Notes</Label>
              {communityNotes.map((cn,i) => <div key={i} style={{padding:"10px 12px",borderRadius:8,background:t.bg,marginBottom:6,border:`1px solid ${t.divider}`}}>
                <div style={{fontFamily:t.ui,fontSize:11,fontWeight:700,color:t.accent,marginBottom:4}}>{cn.user_profiles?.display_name || "Reader"}</div>
                <div style={{fontFamily:t.body,fontSize:13.5,color:t.text,lineHeight:1.65}}>{cn.note_text}</div>
              </div>)}
            </Card>}
          </div>}

          {/* Not logged in prompt for My Notes tab */}
          {tab === "my" && !user && <Card t={t}>
            <div style={{textAlign:"center",padding:20}}>
              <div style={{fontSize:36,marginBottom:12}}>🔐</div>
              <div style={{fontFamily:t.heading,fontSize:17,color:t.dark,marginBottom:6}}>Sign In to Add Notes</div>
              <div style={{fontFamily:t.ui,fontSize:13,color:t.muted,marginBottom:14}}>Save personal notes, highlight verses, and keep a prayer journal.</div>
              <button onClick={() => setAuthModal(true)} style={{padding:"12px 28px",borderRadius:10,border:"none",background:t.tabActive,color:t.headerText,fontFamily:t.ui,fontSize:14,fontWeight:700,cursor:"pointer"}}>Sign In / Sign Up</button>
            </div>
          </Card>}

          {/* Verse Navigation */}
          <div style={{display:"flex",justifyContent:"space-between",alignItems:"center",marginTop:18,gap:10}}>
            <Btn onClick={()=>{if(curIdx>0){setVerse(verseNums[curIdx-1]);setTab("study")}}} disabled={curIdx<=0} style={{flex:1,padding:"11px",background:curIdx>0?t.card:t.bg,border:`1px solid ${t.divider}`,borderRadius:10,fontFamily:t.ui,fontSize:14,color:t.dark}}>← Prev</Btn>
            <div style={{fontFamily:t.heading,fontSize:15,color:t.muted,fontWeight:700}}>v.{verse}</div>
            <Btn onClick={()=>{if(curIdx<verseNums.length-1){setVerse(verseNums[curIdx+1]);setTab("study")}}} disabled={curIdx>=verseNums.length-1} style={{flex:1,padding:"11px",background:curIdx<verseNums.length-1?t.card:t.bg,border:`1px solid ${t.divider}`,borderRadius:10,fontFamily:t.ui,fontSize:14,color:t.dark}}>Next →</Btn>
          </div>

          {/* All Verses Grid */}
          <Card t={t} style={{marginTop:16}}>
            <Label icon="📖" t={t} color={t.muted}>All Verses — Chapter {chapter}</Label>
            <div style={{display:"flex",flexWrap:"wrap",gap:5}}>
              {verseNums.map(v => <button key={v} onClick={()=>{setVerse(v);setTab("study")}} style={{width:40,height:40,borderRadius:8,background:v===verse?t.tabActive:t.accentLight,border:v===verse?"none":`1px solid ${t.accentBorder}`,color:v===verse?t.headerText:t.text,fontFamily:t.heading,fontSize:13,fontWeight:600,cursor:"pointer",transition:"all 0.15s"}}>{v}</button>)}
            </div>
          </Card>
        </div>
      </div>
    );
  };

  // ═══ HIGHLIGHTS COLLECTION ═══
  const Highlights = () => (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="My Highlights" subtitle={`${allHighlights.length} saved`} theme={ht} />
      <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
        {!user ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:36,marginBottom:12}}>🔐</div>
            <div style={{fontFamily:ht.heading,fontSize:17,color:ht.dark,marginBottom:6}}>Sign In to See Highlights</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,marginBottom:14}}>Highlight verses while reading and find them all here.</div>
            <button onClick={() => setAuthModal(true)} style={{padding:"12px 28px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText,fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer"}}>Sign In / Sign Up</button>
          </Card>
        ) : hlLoading ? <Spinner t={ht} /> : allHighlights.length === 0 ? (
          <Card t={ht} style={{textAlign:"center",padding:30}}>
            <div style={{fontSize:42,marginBottom:14}}>🎨</div>
            <div style={{fontFamily:ht.heading,fontSize:18,color:ht.dark,marginBottom:6}}>No Highlights Yet</div>
            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.muted,lineHeight:1.6}}>Open any verse and use the colored dots to highlight. Bookmarked and highlighted verses will appear here!</div>
          </Card>
        ) : (
          <div style={{display:"flex",flexDirection:"column",gap:8}}>
            {allHighlights.map(h => {
              const bName = h.verses?.chapters?.books?.name;
              const chNum = h.verses?.chapters?.chapter_number;
              const vNum = h.verses?.verse_number;
              const ref = `${bName} ${chNum}:${vNum}`;
              return (
                <button key={h.id} onClick={() => nav("verse",{book:bName,chapter:chNum,verse:vNum,tab:"study"})}
                  style={{ background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",gap:12,alignItems:"flex-start",borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                  <div style={{ flex:1 }}>
                    <div style={{display:"flex",alignItems:"center",gap:8,marginBottom:4}}>
                      <span style={{fontFamily:ht.heading,fontSize:14,fontWeight:700,color:ht.dark}}>{ref}</span>
                      {h.is_bookmarked && <span style={{fontSize:14}}>★</span>}
                    </div>
                    <div style={{fontFamily:ht.body,fontSize:13.5,color:ht.text,lineHeight:1.6,display:"-webkit-box",WebkitLineClamp:2,WebkitBoxOrient:"vertical",overflow:"hidden"}}>
                      {h.verses?.kjv_text}
                    </div>
                  </div>
                  <div style={{color:ht.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );

  // ═══ ACCOUNT PAGE ═══
  const Account = () => (
    <div style={{ minHeight:"100vh",background:ht.bg,paddingBottom:80 }}>
      <Header title="My Account" theme={ht} />
      <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
        {!user ? (
          <div style={{textAlign:"center",padding:"40px 20px"}}>
            <div style={{color:ht.accent,marginBottom:16}}><CrossIcon /></div>
            <h3 style={{fontFamily:ht.heading,fontSize:24,color:ht.dark,marginBottom:8}}>Welcome to Study Bible</h3>
            <div style={{fontFamily:ht.ui,fontSize:14,color:ht.muted,lineHeight:1.6,marginBottom:24}}>Sign in to save your notes, highlights, bookmarks, and prayer journal across all your devices.</div>
            <button onClick={() => { setAuthMode("signup"); setAuthModal(true); }} style={{width:"100%",padding:"14px",borderRadius:12,border:"none",background:ht.headerGradient,color:ht.headerText,fontFamily:ht.ui,fontSize:16,fontWeight:700,cursor:"pointer",marginBottom:10}}>Create Account</button>
            <button onClick={() => { setAuthMode("login"); setAuthModal(true); }} style={{width:"100%",padding:"14px",borderRadius:12,border:`1.5px solid ${ht.accent}`,background:"transparent",color:ht.accent,fontFamily:ht.ui,fontSize:16,fontWeight:700,cursor:"pointer",marginBottom:14}}>Sign In with Email</button>
            <div style={{ display:"flex",alignItems:"center",gap:12,marginBottom:14 }}>
              <div style={{flex:1,height:1,background:ht.divider}}/><span style={{fontFamily:ht.ui,fontSize:12,color:ht.light}}>or</span><div style={{flex:1,height:1,background:ht.divider}}/>
            </div>
            <button onClick={handleGoogleSignIn} style={{ width:"100%",padding:"14px",borderRadius:12,border:`1.5px solid ${ht.divider}`,background:ht.card,fontFamily:ht.ui,fontSize:16,fontWeight:600,color:ht.dark,cursor:"pointer",display:"flex",alignItems:"center",justifyContent:"center",gap:10 }}>
              <svg width="20" height="20" viewBox="0 0 24 24"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>
              Continue with Google
            </button>
          </div>
        ) : (
          <div style={{display:"flex",flexDirection:"column",gap:12}}>
            {/* Profile Card */}
            <Card t={ht}>
              <div style={{display:"flex",alignItems:"center",gap:14}}>
                <div style={{width:52,height:52,borderRadius:"50%",background:ht.headerGradient,display:"flex",alignItems:"center",justifyContent:"center",color:ht.headerText,fontFamily:ht.heading,fontSize:22,fontWeight:700}}>
                  {(profile?.display_name || "R")[0].toUpperCase()}
                </div>
                <div>
                  <div style={{fontFamily:ht.heading,fontSize:18,fontWeight:700,color:ht.dark}}>{profile?.display_name || "Reader"}</div>
                  <div style={{fontFamily:ht.ui,fontSize:12,color:ht.muted}}>{user.email}</div>
                  <div style={{fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:2}}>Joined {new Date(user.created_at).toLocaleDateString()}</div>
                </div>
              </div>
            </Card>

            {/* Stats */}
            <Card t={ht}>
              <Label icon="📊" t={ht} color={ht.muted}>My Study Stats</Label>
              <div style={{display:"grid",gridTemplateColumns:"1fr 1fr",gap:10}}>
                {[
                  {n: allHighlights.length, l:"Highlights", icon:"🎨"},
                  {n: allHighlights.filter(h=>h.is_bookmarked).length, l:"Bookmarks", icon:"★"},
                  {n: prayers.length, l:"Prayers", icon:"🙏"},
                  {n: prayers.filter(p=>p.is_answered).length, l:"Answered", icon:"✓"},
                ].map((s,i) => (
                  <div key={i} style={{background:ht.accentLight,borderRadius:10,padding:"14px",textAlign:"center",border:`1px solid ${ht.accentBorder}`}}>
                    <div style={{fontSize:14,marginBottom:4}}>{s.icon}</div>
                    <div style={{fontFamily:ht.heading,fontSize:22,fontWeight:700,color:ht.dark}}>{s.n}</div>
                    <div style={{fontFamily:ht.ui,fontSize:10,color:ht.muted,textTransform:"uppercase",letterSpacing:"0.08em"}}>{s.l}</div>
                  </div>
                ))}
              </div>
            </Card>

            {/* Quick Actions */}
            <Card t={ht}>
              <Label icon="⚡" t={ht} color={ht.muted}>Quick Actions</Label>
              {[
                {label:"My Highlights",icon:"🎨",action:()=>nav("highlights")},
                {label:"Prayer Journal",icon:"🙏",action:()=>setPrayerModal(true)},
              ].map((a,i) => (
                <button key={i} onClick={a.action} style={{width:"100%",display:"flex",alignItems:"center",gap:12,padding:"12px 14px",background:"transparent",border:`1px solid ${ht.divider}`,borderRadius:10,cursor:"pointer",marginBottom:6,textAlign:"left"}}>
                  <span style={{fontSize:18}}>{a.icon}</span>
                  <span style={{fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark,flex:1}}>{a.label}</span>
                  <div style={{color:ht.light}}><ChevIcon /></div>
                </button>
              ))}
            </Card>

            {/* Support the Ministry */}
            <Card accent t={ht}>
              <Label icon="❤️" t={ht}>Support the Ministry</Label>
              <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:12}}>
                This Study Bible is completely free — every feature, every word study, every tool. If this resource has blessed you, consider supporting the ministry so we can keep building and sharing God's Word.
              </div>
              <button onClick={() => setDonateModal(true)} style={{padding:"12px 24px",borderRadius:10,border:"none",background:"linear-gradient(135deg,#D4A853,#B8860B)",color:"#fff",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer",boxShadow:"0 2px 8px rgba(212,168,83,0.3)"}}>
                ❤️ Support This Ministry
              </button>
            </Card>

            {/* Sign Out */}
            <button onClick={handleLogout} style={{width:"100%",padding:"14px",borderRadius:12,border:`1.5px solid #E8625C44`,background:"#E8625C08",color:"#E8625C",fontFamily:ht.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginTop:8}}>Sign Out</button>
          </div>
        )}
      </div>
    </div>
  );

  // ═══ HEBREW HOME ═══
  const HebrewHome = () => {
    const ht2 = THEMES.garden;
    const categories = [
      { id:"alphabet", label:"Alphabet", icon:"א", desc:"All 22 Hebrew letters" },
      { id:"vocabulary", label:"Vocabulary", icon:"📚", desc:"Key biblical words" },
      { id:"grammar", label:"Grammar", icon:"📝", desc:"Sentence structure", action:() => nav("hebrew-grammar-home") },
      { id:"reading", label:"Reading", icon:"📖", desc:"Read biblical texts", action:() => nav("hebrew-reading-home") },
    ];
    const currentLessonIds = hebrewLessons.map(l => l.id);
    const completedCount = Object.values(hebrewProgress).filter(p => p.completed && currentLessonIds.includes(p.lesson_id)).length;
    const totalLessons = hebrewLessons.length;
    return (
      <div style={{ minHeight:"100vh",background:ht2.bg,paddingBottom:80 }}>
        <Header title="Learn Hebrew" subtitle="Biblical Hebrew · עִבְרִית" onBack={() => nav("home")} theme={ht2} />
        <div style={{ padding:"20px 20px 40px",maxWidth:520,margin:"0 auto" }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient,borderRadius:16,padding:"28px 20px",marginBottom:20,textAlign:"center",position:"relative",overflow:"hidden" }}>
            <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative",zIndex:1 }}>
              {hebrewCategory === "vocabulary" ? (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:42,color:ht2.headerText,direction:"rtl",lineHeight:1.2,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>אֱלֹהִים</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}99`,fontStyle:"italic",marginBottom:4 }}>Elohim — The Creator God</div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>Names of God</div>
              </>) : (<>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:56,color:ht2.headerText,direction:"rtl",lineHeight:1,marginBottom:10,textShadow:"0 4px 20px rgba(0,0,0,0.3)" }}>אָלֶף</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}99`,fontStyle:"italic",marginBottom:4 }}>Aleph — The first letter</div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.12em",textTransform:"uppercase" }}>Begin Your Journey</div>
              </>)}
            </div>
          </div>
          {/* Progress */}
          {user && totalLessons > 0 && (
            <Card t={ht2} style={{ marginBottom:18 }}>
              <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:8 }}>
                <Label icon="📊" t={ht2}>My Progress</Label>
                <span style={{ fontFamily:ht2.ui,fontSize:13,fontWeight:700,color:ht2.accent }}>{completedCount}/{totalLessons}</span>
              </div>
              <div style={{ background:ht2.divider,borderRadius:6,height:8,overflow:"hidden" }}>
                <div style={{ width:`${totalLessons>0?(completedCount/totalLessons)*100:0}%`,height:"100%",background:ht2.accent,borderRadius:6,transition:"width 0.5s ease" }}/>
              </div>
              <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.muted,marginTop:6 }}>{completedCount===0?"Start your first lesson below!":`${completedCount} lesson${completedCount>1?"s":""} completed · Keep going!`}</div>
            </Card>
          )}
          
          {/* Category Tabs */}
          <div style={{ display:"flex",gap:8,marginBottom:18,flexWrap:"wrap" }}>
            {categories.map(cat => (
              <button key={cat.id} onClick={() => { if (cat.action) { setReadingStep(0); setShowLetters(false); setGrammarLesson(null); cat.action(); } else if (!cat.soon) setHebrewCategory(cat.id); }}
                style={{ flexShrink:0,padding:"8px 16px",borderRadius:20,border:hebrewCategory===cat.id?"none":`1px solid ${ht2.divider}`,background:hebrewCategory===cat.id?ht2.tabActive:ht2.card,color:hebrewCategory===cat.id?ht2.headerText:cat.soon?ht2.light:ht2.text,fontFamily:ht2.ui,fontSize:12,fontWeight:700,cursor:cat.soon?"default":"pointer",opacity:cat.soon?0.55:1,whiteSpace:"nowrap" }}>
                {cat.label}{cat.soon?" 🔒":""}
              </button>
            ))}
          </div>
          {/* Lessons List */}
          <Label icon={hebrewCategory === "vocabulary" ? "📚" : "א"} t={ht2} color={ht2.muted}>{hebrewCategory === "vocabulary" ? `Vocabulary — ${hebrewLessons.length} Lessons` : "The Hebrew Alphabet — 22 Letters"}</Label>
          {hebrewLessons.length === 0 ? <Spinner t={ht2}/> : hebrewCategory === "vocabulary" ? (() => {
            const VOCAB_GROUPS = [
              { id:"names-of-god", label:"Names of God", icon:"✡️", range:[101,106], color:"#D4A853", desc:"The divine names of the Creator" },
              { id:"creation-covenant", label:"Creation & Covenant", icon:"🌿", range:[107,112], color:"#2E4A33", desc:"Words from the beginning" },
              { id:"family-words", label:"Family Words", icon:"👨‍👩‍👧‍👦", range:[113,116], color:"#C06C3E", desc:"Av, Em, Ben, Bat" },
              { id:"worship-words", label:"Worship Words", icon:"🙌", range:[117,120], color:"#8B5CF6", desc:"Hallelujah, Amen, Torah, Mitzvah" },
              { id:"prophecy-words", label:"Prophecy Words", icon:"🔥", range:[121,123], color:"#E8625C", desc:"Mashiach, Navi, Davar" },
            ];
            return (
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {VOCAB_GROUPS.map(group => {
                  const groupLessons = hebrewLessons.filter(l => l.lesson_number >= group.range[0] && l.lesson_number <= group.range[1]);
                  if (groupLessons.length === 0) return null;
                  const isOpen = vocabGroup === group.id;
                  const completedInGroup = groupLessons.filter(l => hebrewProgress[l.id]?.completed).length;
                  return (
                    <div key={group.id}>
                      <button onClick={() => setVocabGroup(isOpen ? null : group.id)}
                        style={{ width:"100%", background:isOpen?group.color:ht2.card, borderRadius:isOpen?"14px 14px 0 0":14, padding:"16px 18px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, border:`1px solid ${isOpen?group.color:ht2.divider}`, borderBottom:isOpen?"none":"", transition:"all 0.2s", borderLeft:`4px solid ${group.color}` }}>
                        <div style={{ width:44, height:44, borderRadius:12, background:isOpen?"rgba(255,255,255,0.15)":`${group.color}18`, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{group.icon}</div>
                        <div style={{ flex:1 }}>
                          <div style={{ fontFamily:ht2.heading, fontSize:16, fontWeight:700, color:isOpen?ht2.headerText:ht2.dark }}>{group.label}</div>
                          <div style={{ fontFamily:ht2.ui, fontSize:12, color:isOpen?`${ht2.headerText}88`:ht2.muted, marginTop:2 }}>{group.desc}</div>
                        </div>
                        <div style={{ textAlign:"right", flexShrink:0 }}>
                          <div style={{ fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:isOpen?ht2.accent:`${group.color}`, marginBottom:3 }}>{completedInGroup}/{groupLessons.length}</div>
                          <div style={{ fontFamily:ht2.ui, fontSize:18, color:isOpen?ht2.headerText:ht2.muted }}>{isOpen?"▲":"▼"}</div>
                        </div>
                      </button>
                      {isOpen && (
                        <div style={{ border:`1px solid ${group.color}`, borderTop:"none", borderRadius:"0 0 14px 14px", overflow:"hidden" }}>
                          {groupLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = hebrewProgress[lesson.id]?.completed;
                const isVocab = lesson.category === "vocabulary";
                return (
                  <button key={lesson.id} onClick={() => { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}
                    style={{ background:ht2.card,border:"none",borderBottom:`1px solid ${ht2.divider}`,borderRadius:0,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":group.color}`,transition:"all 0.15s",width:"100%" }}>
                    {/* Alphabet: show single letter. Vocabulary: show Hebrew word */}
                    {isVocab ? (
                      <div style={{ minWidth:64,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:18,color:ht2.accent,flexShrink:0,direction:"rtl",padding:"0 8px" }}>
                        {cnt.word || "אֱלֹהִים"}
                      </div>
                    ) : (
                      <div style={{ width:48,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:30,color:ht2.accent,flexShrink:0,direction:"rtl" }}>
                        {cnt.letter || "א"}
                      </div>
                    )}
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                        <span style={{ fontFamily:ht2.heading,fontSize:15,fontWeight:700,color:ht2.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:ht2.body,fontSize:12.5,color:ht2.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                      {isVocab && cnt.transliteration && (
                        <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.accent,marginTop:3,letterSpacing:"0.03em" }}>{cnt.transliteration}</div>
                      )}
                    </div>
                    <div style={{ textAlign:"right",flexShrink:0 }}>
                      {isVocab && <div style={{ fontFamily:ht2.ui,fontSize:9,color:ht2.light,marginBottom:2,textTransform:"uppercase",letterSpacing:"0.05em" }}>Vocab</div>}
                      {!isVocab && <div style={{ fontFamily:ht2.ui,fontSize:10,color:ht2.light }}>Lesson {lesson.lesson_number}</div>}
                      <div style={{ color:ht2.light,marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            );
          })() : (
            <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
              {hebrewLessons.map(lesson => {
                const cnt = lesson.content || {};
                const isDone = hebrewProgress[lesson.id]?.completed;
                return (
                  <button key={lesson.id} onClick={() => { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}
                    style={{ background:ht2.card,border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`,borderRadius:12,padding:"14px 16px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:14,borderLeft:`3px solid ${isDone?"#7ED4AD":ht2.accent}`,boxShadow:"0 1px 3px rgba(0,0,0,0.04)",transition:"all 0.15s" }}>
                    <div style={{ width:48,height:48,borderRadius:12,background:isDone?"#7ED4AD22":ht2.accentLight,border:`1px solid ${isDone?"#7ED4AD44":ht2.accentBorder}`,display:"flex",alignItems:"center",justifyContent:"center",fontFamily:"'Times New Roman',serif",fontSize:30,color:ht2.accent,flexShrink:0,direction:"rtl" }}>
                      {cnt.letter || "א"}
                    </div>
                    <div style={{ flex:1 }}>
                      <div style={{ display:"flex",alignItems:"center",gap:8 }}>
                        <span style={{ fontFamily:ht2.heading,fontSize:15,fontWeight:700,color:ht2.dark }}>{lesson.title}</span>
                        {isDone && <span style={{ fontSize:13,color:"#2E7D5B",fontWeight:700 }}>✓</span>}
                      </div>
                      <div style={{ fontFamily:ht2.body,fontSize:12.5,color:ht2.muted,fontStyle:"italic",marginTop:2 }}>{lesson.subtitle}</div>
                    </div>
                    <div style={{ textAlign:"right",flexShrink:0 }}>
                      <div style={{ fontFamily:ht2.ui,fontSize:10,color:ht2.light }}>Lesson {lesson.lesson_number}</div>
                      <div style={{ color:ht2.light,marginTop:2 }}><ChevIcon/></div>
                    </div>
                  </button>
                );
              })}
            </div>
          )}
          {/* Full 22-letter alphabet grid */}
          {(() => {
            const ALL_LETTERS = [
              {letter:"א",name:"Aleph",num:1},{letter:"ב",name:"Bet",num:2},{letter:"ג",name:"Gimel",num:3},
              {letter:"ד",name:"Dalet",num:4},{letter:"ה",name:"He",num:5},{letter:"ו",name:"Vav",num:6},
              {letter:"ז",name:"Zayin",num:7},{letter:"ח",name:"Chet",num:8},{letter:"ט",name:"Tet",num:9},
              {letter:"י",name:"Yod",num:10},{letter:"כ",name:"Kaf",num:11},{letter:"ל",name:"Lamed",num:12},
              {letter:"מ",name:"Mem",num:13},{letter:"נ",name:"Nun",num:14},{letter:"ס",name:"Samekh",num:15},
              {letter:"ע",name:"Ayin",num:16},{letter:"פ",name:"Pe",num:17},{letter:"צ",name:"Tsade",num:18},
              {letter:"ק",name:"Qof",num:19},{letter:"ר",name:"Resh",num:20},{letter:"שׁ",name:"Shin",num:21},
              {letter:"ת",name:"Tav",num:22},
            ];
            const ANCIENT = { "א":"𐤀","ב":"𐤁","ג":"𐤂","ד":"𐤃","ה":"𐤄","ו":"𐤅","ז":"𐤆","ח":"𐤇","ט":"𐤈","י":"𐤉","כ":"𐤊","ל":"𐤋","מ":"𐤌","נ":"𐤍","ס":"𐤎","ע":"𐤏","פ":"𐤐","צ":"𐤑","ק":"𐤒","ר":"𐤓","שׁ":"𐤔","ת":"𐤕" };
            const seededNums = hebrewLessons.map(l => l.lesson_number);
            return (
              <div style={{ marginTop:20, display: hebrewCategory === "alphabet" ? "block" : "none" }}>
                <Label icon="🔡" t={ht2} color={ht2.muted}>All 22 Letters — Quick Reference</Label>
                <div style={{ display:"grid",gridTemplateColumns:"repeat(4,1fr)",gap:8 }}>
                  {ALL_LETTERS.map(al => {
                    const hasLesson = seededNums.includes(al.num);
                    const lesson = hebrewLessons.find(l => l.lesson_number === al.num);
                    const isDone = lesson && hebrewProgress[lesson.id]?.completed;
                    return (
                      <button key={al.num}
                        onClick={() => { if (hasLesson && lesson) { setHebrewLesson(lesson); setHebrewAlphabet(null); setHebrewVocab([]); nav("hebrew-lesson"); }}}
                        style={{ background:isDone?"#7ED4AD22":hasLesson?ht2.card:ht2.bg,border:`1px solid ${isDone?"#7ED4AD55":hasLesson?ht2.accentBorder:ht2.divider}`,borderRadius:12,padding:"12px 6px",textAlign:"center",cursor:hasLesson?"pointer":"default",opacity:hasLesson?1:0.45,transition:"all 0.15s",position:"relative" }}>
                        {isDone && <div style={{ position:"absolute",top:4,right:6,fontSize:8,color:"#2E7D5B",fontWeight:800 }}>✓</div>}
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:11,color:ht2.light,marginBottom:1 }}>{ANCIENT[al.letter]}</div>
                        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:28,color:hasLesson?ht2.accent:ht2.light,direction:"rtl",lineHeight:1,marginBottom:4 }}>{al.letter}</div>
                        <div style={{ fontFamily:ht2.ui,fontSize:9,color:hasLesson?ht2.text:ht2.light,fontWeight:600 }}>{al.name}</div>
                        {!hasLesson && <div style={{ fontFamily:ht2.ui,fontSize:8,color:ht2.light,marginTop:2 }}>Soon</div>}
                      </button>
                    );
                  })}
                </div>
                <div style={{ fontFamily:ht2.ui,fontSize:11,color:ht2.muted,textAlign:"center",marginTop:10 }}>
                  {seededNums.length} of 22 letters available · More added regularly
                </div>
              </div>
            );
          })()}
        </div>
      </div>
    );
  };

  // ═══ HEBREW LESSON ═══
  const HebrewLesson = () => {
    const ht2 = THEMES.garden;
    if (!hebrewLesson) return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title="Hebrew Lesson" onBack={() => nav("hebrew-home")} theme={ht2}/>
        <Spinner t={ht2}/>
      </div>
    );
    const content = hebrewLesson.content || {};
    const verseConns = Array.isArray(hebrewLesson.verse_connections) ? hebrewLesson.verse_connections : [];
    const isDone = hebrewProgress[hebrewLesson.id]?.completed;
    const currentIdx = hebrewLessons.findIndex(l => l.id === hebrewLesson.id);
    const prevLesson = currentIdx > 0 ? hebrewLessons[currentIdx-1] : null;
    const nextLesson = currentIdx < hebrewLessons.length-1 ? hebrewLessons[currentIdx+1] : null;
    return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title={hebrewLesson.title} subtitle={hebrewLesson.subtitle} onBack={() => nav("hebrew-home")} theme={ht2}
          right={isDone && <span style={{ fontFamily:ht2.ui,fontSize:11,color:"#7ED4AD",fontWeight:700,background:"#7ED4AD22",padding:"4px 10px",borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:520,margin:"0 auto",padding:"16px 16px 40px" }}>
          {/* Big letter / word hero — adapts to alphabet vs vocabulary */}
          {hebrewLesson?.category === "vocabulary" ? (
            <div style={{ background:ht2.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
              <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
              <div style={{ position:"relative",zIndex:1 }}>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:52,color:ht2.headerText,direction:"rtl",lineHeight:1.2,marginBottom:14,textShadow:"0 4px 24px rgba(0,0,0,0.35)",letterSpacing:2 }}>{content.word}</div>
                <div style={{ fontFamily:ht2.heading,fontSize:24,color:ht2.accent,marginBottom:4 }}>{content.transliteration}</div>
                <div style={{ fontFamily:ht2.body,fontSize:14,color:`${ht2.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.part_of_speech}</div>
                <div style={{ display:"inline-block",background:"rgba(192,108,62,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.05em" }}>
                  {content.strongs} · Appears {content.numeric_occurrences?.toLocaleString()} times in OT
                </div>
              </div>
            </div>
          ) : (() => {
            const ANCIENT = { "א":"𐤀","ב":"𐤁","ג":"𐤂","ד":"𐤃","ה":"𐤄","ו":"𐤅","ז":"𐤆","ח":"𐤇","ט":"𐤈","י":"𐤉","כ":"𐤊","ל":"𐤋","מ":"𐤌","נ":"𐤍","ס":"𐤎","ע":"𐤏","פ":"𐤐","צ":"𐤑","ק":"𐤒","ר":"𐤓","שׁ":"𐤔","ת":"𐤕" };
            const modernLetter = content.letter || hebrewAlphabet?.hebrew_letter || "א";
            const ancientSymbol = ANCIENT[modernLetter] || "";
            return (
              <div style={{ background:ht2.headerGradient,borderRadius:20,padding:"36px 20px",marginBottom:18,textAlign:"center",position:"relative",overflow:"hidden" }}>
                <div style={{ position:"absolute",inset:0,background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
                <div style={{ position:"relative",zIndex:1 }}>
                  <div style={{ display:"flex",justifyContent:"center",alignItems:"center",gap:24,marginBottom:14 }}>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:80,color:`${ht2.headerText}55`,lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.2)" }}>{ancientSymbol}</div>
                      <div style={{ fontFamily:ht2.ui,fontSize:9,color:`${ht2.headerText}55`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Ancient</div>
                    </div>
                    <div style={{ width:1,height:80,background:`${ht2.headerText}22` }}/>
                    <div style={{ textAlign:"center" }}>
                      <div style={{ fontFamily:"'Times New Roman',serif",fontSize:108,color:ht2.headerText,direction:"rtl",lineHeight:1,textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{modernLetter}</div>
                      <div style={{ fontFamily:ht2.ui,fontSize:9,color:`${ht2.headerText}77`,textTransform:"uppercase",letterSpacing:"0.1em",marginTop:4 }}>Modern</div>
                    </div>
                  </div>
                  <div style={{ fontFamily:ht2.heading,fontSize:26,color:ht2.accent,marginBottom:4 }}>{content.name || hebrewAlphabet?.letter_name}</div>
                  <div style={{ fontFamily:ht2.body,fontSize:15,color:`${ht2.headerText}88`,fontStyle:"italic",marginBottom:10 }}>{content.transliteration || hebrewAlphabet?.transliteration}</div>
                  <div style={{ display:"inline-block",background:"rgba(192,108,62,0.25)",borderRadius:20,padding:"5px 16px",fontFamily:ht2.ui,fontSize:11,color:ht2.accent,letterSpacing:"0.05em" }}>
                    Numeric value: {content.numeric_value || hebrewAlphabet?.numeric_value}
                  </div>
                </div>
              </div>
            );
          })()}
          {/* Pronunciation */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <Label icon="🔊" t={ht2}>Pronunciation</Label>
            <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.75 }}>{content.pronunciation || hebrewAlphabet?.pronunciation_guide}</div>
          </Card>
          {/* Pictograph */}
          <Card accent t={ht2} style={{ marginBottom:14 }}>
            <Label icon="🖼️" t={ht2}>Ancient Pictograph</Label>
            <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.75 }}>{content.pictograph || hebrewAlphabet?.pictographic}</div>
          </Card>
          {/* Fun fact */}
          {content.fun_fact && (
            <Card t={ht2} style={{ marginBottom:14,borderLeft:`3px solid ${ht2.accent}` }}>
              <Label icon="✨" t={ht2}>Did You Know?</Label>
              <div style={{ fontFamily:ht2.body,fontSize:14.5,color:ht2.text,lineHeight:1.8,fontStyle:"italic" }}>{content.fun_fact}</div>
            </Card>
          )}
          {/* Vocabulary */}
          {hebrewVocab.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="📚" t={ht2} color={ht2.muted}>Key Words This Lesson</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {hebrewVocab.map((word,i) => (
                  <div key={i} style={{ background:ht2.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${ht2.divider}` }}>
                    <div style={{ display:"flex",alignItems:"center",gap:10,marginBottom:6,flexWrap:"wrap" }}>
                      <span style={{ fontFamily:"'Times New Roman',serif",fontSize:26,color:ht2.accent,direction:"rtl",fontWeight:700 }}>{word.hebrew_word}</span>
                      <span style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,fontStyle:"italic" }}>({word.transliteration})</span>
                      <span style={{ marginLeft:"auto",background:ht2.accentLight,border:`1px solid ${ht2.accentBorder}`,padding:"2px 8px",borderRadius:4,fontFamily:"monospace",fontSize:10,color:ht2.muted }}>{word.strongs_number}</span>
                    </div>
                    <div style={{ fontFamily:ht2.ui,fontSize:13.5,color:ht2.text,lineHeight:1.6,marginBottom:6 }}>{word.meaning}</div>
                    {word.example_verse_ref && (
                      <div style={{ fontFamily:ht2.body,fontSize:12,color:ht2.muted,fontStyle:"italic",padding:"8px 10px",background:ht2.hebrewBg,borderRadius:8 }}>
                        📖 <strong>{word.example_verse_ref}:</strong> "{word.example_verse_text}"
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}
          {/* Verse Connections */}
          {verseConns.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={ht2} color={ht2.muted}>In the Bible</Label>
              <div style={{ display:"flex",flexDirection:"column",gap:10 }}>
                {verseConns.map((vc,i) => (
                  <div key={i} style={{ padding:"12px 14px",background:ht2.accentLight,borderRadius:10,border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:ht2.heading,fontSize:13,fontWeight:700,color:ht2.accent,marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:ht2.body,fontSize:13.5,color:ht2.text,lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}
          {/* Practice Button */}
          <button onClick={() => { setHebrewPracticeIdx(0); setHebrewPracticeAnswer(null); setHebrewPracticeScore(0); nav("hebrew-practice"); }}
            style={{ width:"100%",padding:"16px",borderRadius:14,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:12,boxShadow:"0 4px 15px rgba(46,74,51,0.25)" }}>
            ✍️ Practice This Lesson
          </button>
          {/* Mark Complete / Done status */}
          {user && !isDone && (
            <button onClick={() => markHebrewComplete(hebrewLesson.id, 0)}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:"1.5px solid #7ED4AD",background:"#7ED4AD11",color:"#2E7D5B",fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer",marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center",padding:"13px",borderRadius:12,background:"#7ED4AD22",border:"1px solid #7ED4AD44",marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui,fontSize:13,color:"#2E7D5B",fontWeight:700 }}>
                ✓ Lesson Complete{hebrewProgress[hebrewLesson.id]?.score ? ` · Best Score: ${hebrewProgress[hebrewLesson.id].score}%` : ""}
              </span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center",padding:"12px",borderRadius:10,background:ht2.accentLight,border:`1px solid ${ht2.accentBorder}`,marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui,fontSize:12,color:ht2.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}
          {/* Prev / Next */}
          <div style={{ display:"flex",gap:10 }}>
            <button onClick={() => { if(prevLesson){ setHebrewLesson(prevLesson); setHebrewAlphabet(null); setHebrewVocab([]); loadHebrewLesson(prevLesson.id); }}} disabled={!prevLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${ht2.divider}`,background:prevLesson?ht2.card:ht2.bg,fontFamily:ht2.ui,fontSize:13,color:ht2.dark,cursor:prevLesson?"pointer":"default",opacity:prevLesson?1:0.4 }}>← Prev</button>
            <button onClick={() => { if(nextLesson){ setHebrewLesson(nextLesson); setHebrewAlphabet(null); setHebrewVocab([]); loadHebrewLesson(nextLesson.id); }}} disabled={!nextLesson}
              style={{ flex:1,padding:"12px",borderRadius:10,border:`1px solid ${ht2.divider}`,background:nextLesson?ht2.card:ht2.bg,fontFamily:ht2.ui,fontSize:13,color:ht2.dark,cursor:nextLesson?"pointer":"default",opacity:nextLesson?1:0.4 }}>Next →</button>
          </div>
        </div>
      </div>
    );
  };

  // ═══ HEBREW PRACTICE ═══
  const HebrewPractice = () => {
    const ht2 = THEMES.garden;
    if (!hebrewLesson) return null;
    const content = hebrewLesson.content || {};
    const questions = content.practice || [];
    if (questions.length === 0) return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title="Practice" onBack={() => nav("hebrew-lesson")} theme={ht2}/>
        <div style={{ textAlign:"center",padding:40 }}>
          <div style={{ fontSize:48,marginBottom:16 }}>✍️</div>
          <div style={{ fontFamily:ht2.heading,fontSize:18,color:ht2.dark }}>No practice questions yet</div>
        </div>
      </div>
    );
    const isDone = hebrewPracticeIdx >= questions.length;
    const currentQ = isDone ? null : questions[hebrewPracticeIdx];
    const isLast = hebrewPracticeIdx === questions.length - 1;
    const pct = isDone ? 100 : Math.round((hebrewPracticeIdx/questions.length)*100);

    const handleAnswer = (idx) => {
      if (hebrewPracticeAnswer !== null) return;
      setHebrewPracticeAnswer(idx);
      if (currentQ.type === "choice" && idx === currentQ.answer) setHebrewPracticeScore(s => s+1);
      if (currentQ.type === "identify") setHebrewPracticeScore(s => s+1);
    };
    const handleNext = () => {
      if (isLast) {
        const finalScore = Math.round((hebrewPracticeScore/questions.length)*100);
        markHebrewComplete(hebrewLesson.id, finalScore);
        setHebrewPracticeIdx(questions.length);
      } else {
        setHebrewPracticeIdx(i => i+1);
        setHebrewPracticeAnswer(null);
      }
    };

    // Done screen
    if (isDone) {
      const finalScore = Math.round((hebrewPracticeScore/questions.length)*100);
      return (
        <div style={{ minHeight:"100vh",background:ht2.bg }}>
          <Header title="Practice Complete!" theme={ht2} onBack={() => nav("hebrew-lesson")}/>
          <div style={{ maxWidth:520,margin:"0 auto",padding:"40px 20px",textAlign:"center" }}>
            <div style={{ fontSize:64,marginBottom:16 }}>🎉</div>
            <div style={{ fontFamily:ht2.heading,fontSize:30,color:ht2.dark,marginBottom:8 }}>Well Done!</div>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:64,color:ht2.accent,direction:"rtl",marginBottom:20,lineHeight:1 }}>{content.letter}</div>
            <Card t={ht2} style={{ marginBottom:22,textAlign:"center" }}>
              <div style={{ fontFamily:ht2.ui,fontSize:13,color:ht2.muted,marginBottom:6 }}>Your Score</div>
              <div style={{ fontFamily:ht2.heading,fontSize:52,fontWeight:800,color:finalScore>=70?"#2E7D5B":ht2.accent }}>{finalScore}%</div>
              <div style={{ fontFamily:ht2.ui,fontSize:13,color:ht2.muted }}>{hebrewPracticeScore} of {questions.length} correct</div>
              {finalScore>=70 ? <div style={{ fontFamily:ht2.body,fontSize:13,color:"#2E7D5B",marginTop:8,fontStyle:"italic" }}>Excellent! This lesson is now marked complete.</div>
                : <div style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,marginTop:8,fontStyle:"italic" }}>Try again to strengthen your memory.</div>}
            </Card>
            <button onClick={() => nav("hebrew-home")} style={{ width:"100%",padding:"14px",borderRadius:12,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:10 }}>
              Back to Lessons
            </button>
            <button onClick={() => { setHebrewPracticeIdx(0); setHebrewPracticeAnswer(null); setHebrewPracticeScore(0); }}
              style={{ width:"100%",padding:"13px",borderRadius:12,border:`1.5px solid ${ht2.accentBorder}`,background:"transparent",color:ht2.accent,fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>
              Try Again
            </button>
          </div>
        </div>
      );
    }

    return (
      <div style={{ minHeight:"100vh",background:ht2.bg }}>
        <Header title={`Practice · ${hebrewLesson.title}`} subtitle={`Question ${hebrewPracticeIdx+1} of ${questions.length}`} onBack={() => nav("hebrew-lesson")} theme={ht2}/>
        <div style={{ maxWidth:520,margin:"0 auto",padding:"16px 16px 40px" }}>
          {/* Progress bar */}
          <div style={{ background:ht2.divider,borderRadius:6,height:6,marginBottom:22,overflow:"hidden" }}>
            <div style={{ width:`${pct}%`,height:"100%",background:ht2.accent,borderRadius:6,transition:"width 0.4s ease" }}/>
          </div>
          {/* Letter reminder */}
          <div style={{ textAlign:"center",marginBottom:20 }}>
            <div style={{ fontFamily:"'Times New Roman',serif",fontSize:72,color:ht2.accent,direction:"rtl",lineHeight:1 }}>{content.letter}</div>
            <div style={{ fontFamily:ht2.body,fontSize:13,color:ht2.muted,fontStyle:"italic",marginTop:4 }}>{content.name} · {content.transliteration}</div>
          </div>
          {/* Question card */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <div style={{ fontFamily:ht2.heading,fontSize:17,color:ht2.dark,lineHeight:1.65,marginBottom:18 }}>{currentQ.question}</div>
            {currentQ.type === "identify" ? (
              <div>
                <div style={{ fontFamily:"'Times New Roman',serif",fontSize:36,color:ht2.dark,direction:"rtl",textAlign:"center",padding:"18px",background:ht2.hebrewBg,borderRadius:10,marginBottom:14,letterSpacing:4 }}>
                  {currentQ.question.includes(":") ? currentQ.question.split(":").pop().trim() : ""}
                </div>
                {hebrewPracticeAnswer === null
                  ? <button onClick={() => handleAnswer(0)} style={{ width:"100%",padding:"13px",borderRadius:10,border:`1.5px solid ${ht2.accentBorder}`,background:ht2.accentLight,color:ht2.accent,fontFamily:ht2.ui,fontSize:14,fontWeight:700,cursor:"pointer" }}>Reveal Answer</button>
                  : <div style={{ padding:"14px",background:"#7ED4AD22",borderRadius:10,border:"1px solid #7ED4AD55" }}>
                      <div style={{ fontFamily:ht2.body,fontSize:14,color:"#2E7D5B",lineHeight:1.7 }}>{currentQ.answer}</div>
                    </div>
                }
              </div>
            ) : (
              <div style={{ display:"flex",flexDirection:"column",gap:8 }}>
                {currentQ.options?.map((opt,i) => {
                  const isCorrect = i === currentQ.answer;
                  const isSelected = hebrewPracticeAnswer === i;
                  const showResult = hebrewPracticeAnswer !== null;
                  let bg = ht2.bg, border = ht2.divider, color = ht2.text;
                  if (showResult && isCorrect) { bg="#7ED4AD22"; border="#7ED4AD"; color="#2E7D5B"; }
                  else if (showResult && isSelected && !isCorrect) { bg="#E8625C11"; border="#E8625C"; color="#E8625C"; }
                  return (
                    <button key={i} onClick={() => handleAnswer(i)}
                      style={{ width:"100%",padding:"13px 16px",borderRadius:10,border:`1.5px solid ${border}`,background:bg,color,fontFamily:ht2.ui,fontSize:14,fontWeight:showResult&&isCorrect?700:500,cursor:hebrewPracticeAnswer===null?"pointer":"default",textAlign:"left",transition:"all 0.2s",display:"flex",justifyContent:"space-between",alignItems:"center" }}>
                      <span><span style={{ fontWeight:700,marginRight:10 }}>{["A","B","C","D"][i]}.</span>{opt}</span>
                      {showResult && isCorrect && <span style={{ fontWeight:800 }}>✓</span>}
                      {showResult && isSelected && !isCorrect && <span>✗</span>}
                    </button>
                  );
                })}
              </div>
            )}
          </Card>
          {/* Next button */}
          {hebrewPracticeAnswer !== null && (
            <button onClick={handleNext} style={{ width:"100%",padding:"15px",borderRadius:12,border:"none",background:ht2.headerGradient,color:ht2.headerText,fontFamily:ht2.ui,fontSize:15,fontWeight:700,cursor:"pointer",boxShadow:"0 4px 15px rgba(46,74,51,0.2)" }}>
              {isLast ? "Finish & See Score →" : "Next Question →"}
            </button>
          )}
        </div>
      </div>
    );
  };

  // ═══ LEARN HOME ═══
  const LearnHome = () => {
    const modules = [
      { id:"hebrew", icon:"🕎", label:"Learn Hebrew", sub:"Biblical Hebrew · עִבְרִית", color:"#C06C3E", bg:"rgba(192,108,62,0.1)", active:true, action:() => nav("hebrew-home") },
      { id:"greek", icon:"🏛️", label:"Learn Greek", sub:"Biblical Greek · Ἑλληνική", color:"#1B7A6E", bg:"rgba(27,122,110,0.1)", active:false },
      { id:"timeline", icon:"📜", label:"Biblical Timeline", sub:"From Creation to Revelation", color:"#D4A853", bg:"rgba(212,168,83,0.1)", active:false },
      { id:"apologetics", icon:"🛡️", label:"Apologetics", sub:"Defend & understand the faith", color:"#E8625C", bg:"rgba(232,98,92,0.1)", active:false },
      { id:"reading", icon:"📖", label:"Reading Plans", sub:"Guided Bible reading journeys", color:"#8B5CF6", bg:"rgba(139,92,246,0.1)", active:false },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="Learn" subtitle="Languages · History · Theology" onBack={() => nav("home")} theme={ht} />
        <div style={{ padding:"20px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Hero */}
          <div style={{ background:ht.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(212,168,83,0.15),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontSize:42, marginBottom:10 }}>🎓</div>
              <div style={{ fontFamily:ht.heading, fontSize:24, fontWeight:700, color:ht.headerText, marginBottom:6 }}>Learning Centre</div>
              <div style={{ fontFamily:ht.body, fontSize:13, color:`${ht.headerText}88`, fontStyle:"italic" }}>Deepen your understanding of God's Word</div>
            </div>
          </div>
          {/* Active modules */}
          <Label icon="✨" t={ht} color={ht.muted}>Available Now</Label>
          {modules.filter(m => m.active).map(m => (
            <button key={m.id} onClick={m.action}
              style={{ width:"100%", background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"20px 18px", marginBottom:12, cursor:"pointer", textAlign:"left", display:"flex", alignItems:"center", gap:14, boxShadow:"0 2px 8px rgba(0,0,0,0.06)", borderLeft:`4px solid ${m.color}` }}>
              <div style={{ width:54, height:54, borderRadius:14, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:28, flexShrink:0 }}>{m.icon}</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily:ht.heading, fontSize:17, fontWeight:700, color:ht.dark }}>{m.label}</div>
                <div style={{ fontFamily:ht.ui, fontSize:12, color:ht.muted, marginTop:3 }}>{m.sub}</div>
                <div style={{ marginTop:8, display:"inline-block", background:m.bg, borderRadius:6, padding:"3px 10px", fontFamily:ht.ui, fontSize:9, fontWeight:700, color:m.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>Start Learning →</div>
              </div>
              <div style={{ color:ht.light }}><ChevIcon /></div>
            </button>
          ))}
          {/* Coming soon */}
          <Label icon="🔒" t={ht} color={ht.muted}>Coming Soon</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {modules.filter(m => !m.active).map(m => (
              <div key={m.id} style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:14, padding:"16px 18px", display:"flex", alignItems:"center", gap:14, opacity:0.55 }}>
                <div style={{ width:44, height:44, borderRadius:12, background:m.bg, display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0 }}>{m.icon}</div>
                <div style={{ flex:1 }}>
                  <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:700, color:ht.dark }}>{m.label}</div>
                  <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.muted, marginTop:2 }}>{m.sub}</div>
                </div>
                <div style={{ fontFamily:ht.ui, fontSize:9, fontWeight:700, color:ht.light, textTransform:"uppercase", letterSpacing:"0.05em", background:ht.accentLight, padding:"3px 8px", borderRadius:4 }}>Soon</div>
              </div>
            ))}
          </div>
        </div>
      </div>
    );
  };

  // ═══ JOURNAL HOME ═══
  const JournalHome = () => {
    const currentTab = ["highlights","prayers"].includes(tab) ? tab : "highlights";
    return (
      <div style={{ minHeight:"100vh", background:ht.bg, paddingBottom:80 }}>
        <Header title="My Journal" subtitle="Highlights · Prayers · Reflections" theme={ht} />
        <div style={{ padding:"16px 20px 40px", maxWidth:520, margin:"0 auto" }}>
          {/* Tab switcher */}
          <div style={{ display:"flex", background:ht.card, borderRadius:10, padding:3, marginBottom:18, border:`1px solid ${ht.divider}` }}>
            {[
              { id:"highlights", label:"✨ Highlights", count:allHighlights.length },
              { id:"prayers", label:"🙏 Prayers", count:prayers.length }
            ].map(tb => (
              <button key={tb.id} onClick={() => setTab(tb.id)}
                style={{ flex:1, padding:"11px 8px", border:"none", borderRadius:8, background:currentTab===tb.id?ht.tabActive:"transparent", color:currentTab===tb.id?ht.headerText:ht.muted, fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:"pointer", transition:"all 0.15s" }}>
                {tb.label}{tb.count > 0 ? ` (${tb.count})` : ""}
              </button>
            ))}
          </div>

          {/* Not signed in */}
          {!user && (
            <Card t={ht} style={{ textAlign:"center", padding:30 }}>
              <div style={{ fontSize:36, marginBottom:12 }}>🔐</div>
              <div style={{ fontFamily:ht.heading, fontSize:17, color:ht.dark, marginBottom:6 }}>Sign In to See Your Journal</div>
              <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, marginBottom:14, lineHeight:1.6 }}>Save highlights, bookmarks, and prayers as you study God's Word.</div>
              <button onClick={() => setAuthModal(true)} style={{ padding:"12px 28px", borderRadius:10, border:"none", background:ht.headerGradient, color:ht.headerText, fontFamily:ht.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>Sign In / Sign Up</button>
            </Card>
          )}

          {/* HIGHLIGHTS TAB */}
          {user && currentTab === "highlights" && (
            hlLoading ? <Spinner t={ht} /> :
            allHighlights.length === 0 ? (
              <Card t={ht} style={{ textAlign:"center", padding:30 }}>
                <div style={{ fontSize:42, marginBottom:14 }}>🎨</div>
                <div style={{ fontFamily:ht.heading, fontSize:18, color:ht.dark, marginBottom:6 }}>No Highlights Yet</div>
                <div style={{ fontFamily:ht.ui, fontSize:13, color:ht.muted, lineHeight:1.6 }}>Open any verse and tap the coloured dots to highlight. Bookmarked verses appear here too.</div>
              </Card>
            ) : (
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {allHighlights.map(h => {
                  const bName = h.verses?.chapters?.books?.name;
                  const chNum = h.verses?.chapters?.chapter_number;
                  const vNum = h.verses?.verse_number;
                  const ref = `${bName} ${chNum}:${vNum}`;
                  return (
                    <button key={h.id} onClick={() => nav("verse", { book:bName, chapter:chNum, verse:vNum, tab:"study" })}
                      style={{ background:ht.card, border:`1px solid ${ht.divider}`, borderRadius:12, padding:"14px 16px", textAlign:"left", cursor:"pointer", display:"flex", gap:12, alignItems:"flex-start", borderLeft:`4px solid ${h.highlight_color || '#FFD700'}`, boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                      <div style={{ flex:1 }}>
                        <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:4 }}>
                          <span style={{ fontFamily:ht.heading, fontSize:14, fontWeight:700, color:ht.dark }}>{ref}</span>
                          {h.is_bookmarked && <span style={{ fontSize:14 }}>★</span>}
                        </div>
                        <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.6, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>{h.verses?.kjv_text}</div>
                      </div>
                      <div style={{ color:ht.light, flexShrink:0, alignSelf:"center" }}><ChevIcon /></div>
                    </button>
                  );
                })}
              </div>
            )
          )}

          {/* PRAYERS TAB */}
          {user && currentTab === "prayers" && (
            <div>
              <Card t={ht} style={{ marginBottom:14 }}>
                <Label icon="✏️" t={ht}>New Prayer</Label>
                <input value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder="Prayer title..." style={{ width:"100%", padding:"10px 0", border:"none", borderBottom:`1px solid ${ht.divider}`, fontFamily:ht.heading, fontSize:15, color:ht.dark, outline:"none", background:"transparent", marginBottom:10, boxSizing:"border-box" }} />
                <textarea value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width:"100%", padding:"8px 0", border:"none", fontFamily:ht.body, fontSize:14, color:ht.text, outline:"none", background:"transparent", resize:"vertical", lineHeight:1.7, boxSizing:"border-box" }} />
                <button onClick={async () => { await addPrayer(); }} disabled={!prayerText.trim()} style={{ marginTop:10, padding:"10px 20px", borderRadius:8, border:"none", background:prayerText.trim()?ht.accent:ht.divider, color:"#fff", fontFamily:ht.ui, fontSize:13, fontWeight:700, cursor:prayerText.trim()?"pointer":"default" }}>Add Prayer</button>
              </Card>
              {prayerLoading ? <Spinner t={ht} /> :
              prayers.length === 0 ? (
                <div style={{ textAlign:"center", padding:30, fontFamily:ht.body, fontSize:15, color:ht.muted, fontStyle:"italic" }}>Your prayers will appear here</div>
              ) : prayers.map(p => (
                <div key={p.id} style={{ background:ht.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${p.is_answered?"#7ED4AD44":ht.divider}`, marginBottom:8, borderLeft:`3px solid ${p.is_answered?"#7ED4AD":ht.accent}` }}>
                  <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start" }}>
                    <div style={{ flex:1 }}>
                      <div style={{ fontFamily:ht.heading, fontSize:15, fontWeight:600, color:ht.dark }}>{p.title}</div>
                      {p.book_name && <div style={{ fontFamily:ht.ui, fontSize:11, color:ht.accent, marginTop:2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                      <div style={{ fontFamily:ht.body, fontSize:13.5, color:ht.text, lineHeight:1.65, marginTop:6 }}>{p.prayer_text}</div>
                      <div style={{ fontFamily:ht.ui, fontSize:10, color:ht.light, marginTop:6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                    </div>
                    <div style={{ display:"flex", gap:6, flexShrink:0, marginLeft:10 }}>
                      <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding:"5px 10px", borderRadius:6, border:`1px solid ${p.is_answered?"#7ED4AD":ht.divider}`, background:p.is_answered?"#7ED4AD22":"transparent", fontFamily:ht.ui, fontSize:10, fontWeight:700, color:p.is_answered?"#2E7D5B":ht.muted, cursor:"pointer" }}>
                        {p.is_answered ? "✓ Answered" : "Mark Answered"}
                      </button>
                      <button onClick={() => deletePrayer(p.id)} style={{ padding:"5px 8px", borderRadius:6, border:`1px solid ${ht.divider}`, background:"transparent", fontFamily:ht.ui, fontSize:10, color:"#E8625C", cursor:"pointer" }}>✕</button>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    );
  };

  const HebrewGrammarHome = () => {
    const ht2 = THEMES.garden;
    const GRAMMAR_LESSONS = [
      { id:1, number:201, icon:"הַ", title:"The Definite Article", subtitle:"How Hebrew says 'the'", difficulty:"Beginner", color:"#C06C3E" },
      { id:2, number:202, icon:"וְ", title:"The Vav Conjunction", subtitle:"And, but, then — the connecting letter", difficulty:"Beginner", color:"#2E4A33" },
      { id:3, number:203, icon:"בְּ", title:"Prepositions", subtitle:"In, like, to, from — built into words", difficulty:"Beginner", color:"#D4A853" },
      { id:4, number:204, icon:"ז׳", title:"Noun Gender", subtitle:"Every noun is masculine or feminine", difficulty:"Beginner", color:"#1B7A6E" },
      { id:5, number:205, icon:"ים", title:"Plural Endings", subtitle:"How Hebrew makes nouns plural", difficulty:"Beginner", color:"#8B5CF6" },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg, paddingBottom:80 }}>
        <Header title="Hebrew Grammar" subtitle="How the language works" onBack={() => nav("hebrew-home")} theme={ht2} />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"20px 20px 40px" }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"28px 20px", marginBottom:20, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:42, color:ht2.headerText, direction:"rtl", marginBottom:10 }}>בְּרֵאשִׁית</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>Understanding how Hebrew is built</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>5 Beginner Lessons</div>
            </div>
          </div>
          {/* Beginner warning */}
          <div style={{ background:"#D4A85318", border:`1px solid #D4A85355`, borderRadius:12, padding:"14px 16px", marginBottom:18, display:"flex", gap:12, alignItems:"flex-start" }}>
            <div style={{ fontSize:22, flexShrink:0 }}>📖</div>
            <div>
              <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:"#8B6914", marginBottom:4 }}>Recommended Background</div>
              <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.7 }}>These lessons are most rewarding after completing the first 5 alphabet lessons (Aleph through He). You'll recognise the letters and sounds as we work through grammar patterns.</div>
            </div>
          </div>
          {/* Lesson list */}
          <Label icon="📝" t={ht2} color={ht2.muted}>Grammar Lessons — 5 Lessons</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
            {GRAMMAR_LESSONS.map((lesson, idx) => {
              const isDone = hebrewProgress[`grammar-${lesson.number}`]?.completed;
              return (
                <button key={lesson.id} onClick={async () => {
                  const { data } = await supabase.from("hebrew_lessons").select("*").eq("lesson_number", lesson.number).single();
                  if (data) { setGrammarLesson(data); nav("hebrew-grammar-lesson"); }
                }}
                  style={{ background:ht2.card, border:`1px solid ${isDone?"#7ED4AD44":ht2.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:"pointer", display:"flex", alignItems:"center", gap:14, borderLeft:`4px solid ${lesson.color}`, boxShadow:"0 1px 4px rgba(0,0,0,0.04)", transition:"all 0.15s" }}>
                  <div style={{ width:52, height:52, borderRadius:12, background:`${lesson.color}18`, border:`1px solid ${lesson.color}44`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:22, color:lesson.color, flexShrink:0, direction:"rtl" }}>{lesson.icon}</div>
                  <div style={{ flex:1 }}>
                    <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:2 }}>
                      <span style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.dark }}>{lesson.title}</span>
                      {isDone && <span style={{ fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓</span>}
                    </div>
                    <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.muted, fontStyle:"italic" }}>{lesson.subtitle}</div>
                    <div style={{ marginTop:5, display:"inline-block", background:`${lesson.color}18`, borderRadius:4, padding:"2px 8px", fontFamily:ht2.ui, fontSize:9, fontWeight:700, color:lesson.color, textTransform:"uppercase", letterSpacing:"0.05em" }}>{lesson.difficulty}</div>
                  </div>
                  <div style={{ textAlign:"right", flexShrink:0 }}>
                    <div style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, marginBottom:4 }}>Lesson {idx+1}</div>
                    <div style={{ color:ht2.light }}><ChevIcon /></div>
                  </div>
                </button>
              );
            })}
          </div>
        </div>
      </div>
    );
  };

  const HebrewGrammarLesson = () => {
    const ht2 = THEMES.garden;
    if (!grammarLesson) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="Grammar" onBack={() => nav("hebrew-grammar-home")} theme={ht2}/>
        <Spinner t={ht2}/>
      </div>
    );
    const content = grammarLesson.content || {};
    const verseConns = Array.isArray(grammarLesson.verse_connections) ? grammarLesson.verse_connections : [];
    const isDone = hebrewProgress[grammarLesson.id]?.completed;
    const tables = content.tables || [];
    const patterns = content.patterns || [];
    const examples = content.examples || [];

    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={grammarLesson.title} subtitle={grammarLesson.subtitle} onBack={() => nav("hebrew-grammar-home")} theme={ht2}
          right={isDone && <span style={{ fontFamily:ht2.ui, fontSize:11, color:"#7ED4AD", fontWeight:700, background:"#7ED4AD22", padding:"4px 10px", borderRadius:6 }}>✓ Complete</span>}
        />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"16px 16px 40px" }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:18, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.25),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:72, color:ht2.headerText, direction:"rtl", lineHeight:1.1, marginBottom:12, textShadow:"0 4px 24px rgba(0,0,0,0.35)" }}>{content.symbol}</div>
              <div style={{ fontFamily:ht2.heading, fontSize:24, color:ht2.accent, marginBottom:4 }}>{grammarLesson.title}</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic" }}>{grammarLesson.subtitle}</div>
            </div>
          </div>

          {/* Overview */}
          <Card t={ht2} style={{ marginBottom:14 }}>
            <Label icon="📋" t={ht2}>Overview</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14.5, color:ht2.text, lineHeight:1.8 }}>{content.overview}</div>
          </Card>

          {/* Grammar Tables */}
          {tables.map((table, ti) => (
            <div key={ti} style={{ marginBottom:16 }}>
              <Label icon="📊" t={ht2} color={ht2.muted}>{table.title}</Label>
              <div style={{ background:ht2.card, borderRadius:14, border:`1px solid ${ht2.divider}`, overflow:"hidden" }}>
                <div style={{ display:"flex", background:ht2.headerGradient, padding:"10px 14px" }}>
                  {table.headers.map((h, hi) => (
                    <div key={hi} style={{ flex:1, fontFamily:ht2.ui, fontSize:11, fontWeight:700, color:ht2.accent, textTransform:"uppercase", letterSpacing:"0.08em", textAlign:"center" }}>{h}</div>
                  ))}
                </div>
                {table.rows.map((row, ri) => (
                  <div key={ri} style={{ display:"flex", padding:"12px 14px", borderTop:`1px solid ${ht2.divider}`, background:ri%2===0?ht2.card:ht2.accentLight }}>
                    {row.map((cell, ci) => (
                      <div key={ci} style={{ flex:1, textAlign:"center" }}>
                        {ci === 0 ? (
                          <span style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl" }}>{cell}</span>
                        ) : (
                          <span style={{ fontFamily:ci===1?ht2.body:ht2.ui, fontSize:13, color:ht2.text, fontStyle:ci===1?"italic":"normal" }}>{cell}</span>
                        )}
                      </div>
                    ))}
                  </div>
                ))}
              </div>
            </div>
          ))}

          {/* Patterns */}
          {patterns.length > 0 && (
            <div style={{ marginBottom:16 }}>
              <Label icon="🔁" t={ht2} color={ht2.muted}>Patterns to Remember</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                {patterns.map((p, pi) => (
                  <div key={pi} style={{ background:ht2.card, borderRadius:12, padding:"14px 16px", border:`1px solid ${ht2.divider}`, borderLeft:`3px solid ${ht2.accent}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:24, color:ht2.accent, direction:"rtl", marginBottom:6 }}>{p.hebrew}</div>
                    <div style={{ fontFamily:ht2.heading, fontSize:14, fontWeight:700, color:ht2.dark, marginBottom:4 }}>{p.rule}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", lineHeight:1.65 }}>{p.explanation}</div>
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* Real verse examples */}
          {examples.length > 0 && (
            <Card accent t={ht2} style={{ marginBottom:16 }}>
              <Label icon="📖" t={ht2}>Spot It in Scripture</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:12 }}>
                {examples.map((ex, ei) => (
                  <div key={ei} style={{ padding:"12px 14px", background:"rgba(255,255,255,0.6)", borderRadius:10, border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:22, color:ht2.accent, direction:"rtl", marginBottom:4 }}>{ex.hebrew}</div>
                    <div style={{ fontFamily:ht2.heading, fontSize:12, fontWeight:700, color:ht2.accent, marginBottom:4 }}>{ex.ref}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.text, lineHeight:1.65 }}>{ex.explanation}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Devotional */}
          {content.devotional && (
            <Card t={ht2} style={{ marginBottom:16, borderLeft:`3px solid ${ht2.accent}` }}>
              <Label icon="✨" t={ht2}>Insight</Label>
              <div style={{ fontFamily:ht2.body, fontSize:14.5, color:ht2.text, lineHeight:1.8, fontStyle:"italic" }}>{content.devotional}</div>
            </Card>
          )}

          {/* Verse connections */}
          {verseConns.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="🔗" t={ht2} color={ht2.muted}>In the Bible</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {verseConns.map((vc, i) => (
                  <div key={i} style={{ padding:"12px 14px", background:ht2.accentLight, borderRadius:10, border:`1px solid ${ht2.accentBorder}` }}>
                    <div style={{ fontFamily:ht2.heading, fontSize:13, fontWeight:700, color:ht2.accent, marginBottom:5 }}>{vc.ref}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13.5, color:ht2.text, lineHeight:1.7 }}>{vc.connection}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Practice questions */}
          {content.practice?.length > 0 && (
            <Card t={ht2} style={{ marginBottom:16 }}>
              <Label icon="✍️" t={ht2} color={ht2.muted}>Quick Check</Label>
              <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
                {content.practice.map((q, qi) => (
                  <div key={qi} style={{ padding:"12px 14px", background:ht2.bg, borderRadius:10, border:`1px solid ${ht2.divider}` }}>
                    <div style={{ fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.dark, marginBottom:6 }}>{q.question}</div>
                    <div style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", padding:"8px 10px", background:ht2.accentLight, borderRadius:8 }}>→ {q.answer}</div>
                  </div>
                ))}
              </div>
            </Card>
          )}

          {/* Complete button */}
          {user && !isDone && (
            <button onClick={() => markHebrewComplete(grammarLesson.id, 100)}
              style={{ width:"100%", padding:"14px", borderRadius:12, border:"1.5px solid #7ED4AD", background:"#7ED4AD11", color:"#2E7D5B", fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer", marginBottom:12 }}>
              ✓ Mark as Complete
            </button>
          )}
          {isDone && (
            <div style={{ textAlign:"center", padding:"13px", borderRadius:12, background:"#7ED4AD22", border:"1px solid #7ED4AD44", marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui, fontSize:13, color:"#2E7D5B", fontWeight:700 }}>✓ Lesson Complete</span>
            </div>
          )}
          {!user && (
            <div style={{ textAlign:"center", padding:"12px", borderRadius:10, background:ht2.accentLight, border:`1px solid ${ht2.accentBorder}`, marginBottom:12 }}>
              <span style={{ fontFamily:ht2.ui, fontSize:12, color:ht2.muted }}>🔐 Sign in to save your progress</span>
            </div>
          )}

          <button onClick={() => nav("hebrew-grammar-home")}
            style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${ht2.accentBorder}`, background:"transparent", color:ht2.accent, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
            ← Back to Grammar Lessons
          </button>
        </div>
      </div>
    );
  };

  const HebrewReadingHome = () => {
    const ht2 = THEMES.garden;
    const VERSES = [
      {
        id: "gen1v1",
        ref: "Genesis 1:1",
        hebrew: "בְּרֵאשִׁית בָּרָא אֱלֹהִים אֵת הַשָּׁמַיִם וְאֵת הָאָרֶץ",
        kjv: "In the beginning God created the heaven and the earth.",
        words: 7,
        difficulty: "Beginner",
        tag: "Creation",
        color: "#2E4A33",
        available: true,
      },
      {
        id: "gen1v2",
        ref: "Genesis 1:2",
        hebrew: "וְהָאָרֶץ הָיְתָה תֹהוּ וָבֹהוּ",
        kjv: "And the earth was without form, and void...",
        words: 9,
        difficulty: "Beginner",
        tag: "Creation",
        color: "#1B7A6E",
        available: true,
      },
      {
        id: "psalm23v1",
        ref: "Psalm 23:1",
        hebrew: "יְהוָה רֹעִי לֹא אֶחְסָר",
        kjv: "The LORD is my shepherd; I shall not want.",
        words: 4,
        difficulty: "Intermediate",
        tag: "Psalms",
        color: "#8B5CF6",
        available: true,
      },
      {
        id: "deut6v4",
        ref: "Deuteronomy 6:4",
        hebrew: "שְׁמַע יִשְׂרָאֵל יְהוָה אֱלֹהֵינוּ יְהוָה אֶחָד",
        kjv: "Hear, O Israel: The LORD our God is one LORD.",
        words: 6,
        difficulty: "Intermediate",
        tag: "The Shema",
        color: "#D4A853",
        available: true,
      },
    ];
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg, paddingBottom:80 }}>
        <Header title="Reading" subtitle="Read Scripture in Hebrew" onBack={() => nav("hebrew-home")} theme={ht2} />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"20px 20px 40px" }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"24px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:32, color:ht2.headerText, direction:"rtl", marginBottom:10, textShadow:"0 2px 12px rgba(0,0,0,0.3)" }}>בְּרֵאשִׁית</div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>Read God's Word word by word</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>Interactive Hebrew Reading</div>
            </div>
          </div>
          {/* Intro */}
          <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.muted, lineHeight:1.7, marginBottom:18, fontStyle:"italic" }}>
            Each lesson walks you through a verse word by word — with every letter explained, grammar notes, and devotional insights.
          </div>
          {/* Verse list */}
          <Label icon="📖" t={ht2} color={ht2.muted}>Choose a Verse</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:10 }}>
            {VERSES.map(v => (
              <button key={v.id}
                onClick={() => { if (v.available) { setReadingVerse(v.id); setReadingStep(0); setShowLetters(false); nav("hebrew-reading"); } }}
                style={{ background:ht2.card, border:`1px solid ${v.available ? ht2.accentBorder : ht2.divider}`, borderRadius:14, padding:"16px", textAlign:"left", cursor:v.available?"pointer":"default", opacity:v.available?1:0.6, borderLeft:`4px solid ${v.color}`, transition:"all 0.15s" }}>
                <div style={{ display:"flex", justifyContent:"space-between", alignItems:"flex-start", marginBottom:6 }}>
                  <div>
                    <span style={{ fontFamily:ht2.heading, fontSize:15, fontWeight:700, color:ht2.dark }}>{v.ref}</span>
                    <span style={{ fontFamily:ht2.ui, fontSize:10, color:v.color, background:`${v.color}18`, borderRadius:4, padding:"2px 7px", marginLeft:8, textTransform:"uppercase", letterSpacing:"0.05em" }}>{v.tag}</span>
                  </div>
                  {!v.available && <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light }}>🔒 Soon</span>}
                </div>
                <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:v.color, direction:"rtl", marginBottom:6, lineHeight:1.6 }}>{v.hebrew}</div>
                <div style={{ fontFamily:ht2.body, fontSize:12.5, color:ht2.muted, fontStyle:"italic", marginBottom:8 }}>{v.kjv}</div>
                <div style={{ display:"flex", gap:8 }}>
                  <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{v.words} words</span>
                  <span style={{ fontFamily:ht2.ui, fontSize:10, color:ht2.light, background:ht2.divider, borderRadius:4, padding:"2px 8px" }}>{v.difficulty}</span>
                </div>
              </button>
            ))}
          </div>
        </div>
      </div>
    );
  };

  const HebrewReading = () => {
    const ht2 = THEMES.garden;

    const VERSE_DATA = {
      gen1v1: { ref:"Genesis 1:1", kjv:"In the beginning God created the heaven and the earth.", hebrew:"בְּרֵאשִׁית בָּרָא אֱלֹהִים אֵת הַשָּׁמַיִם וְאֵת הָאָרֶץ" },
      gen1v2: { ref:"Genesis 1:2", kjv:"And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters.", hebrew:"וְהָאָרֶץ הָיְתָה תֹהוּ וָבֹהוּ וְחֹשֶׁךְ עַל־פְּנֵי תְהוֹם וְרוּחַ אֱלֹהִים מְרַחֶפֶת עַל־פְּנֵי הַמָּיִם" },
      psalm23v1: { ref:"Psalm 23:1", kjv:"The LORD is my shepherd; I shall not want.", hebrew:"יְהוָה רֹעִי לֹא אֶחְסָר" },
      deut6v4: { ref:"Deuteronomy 6:4", kjv:"Hear, O Israel: The LORD our God is one LORD.", hebrew:"שְׁמַע יִשְׂרָאֵל יְהוָה אֱלֹהֵינוּ יְהוָה אֶחָד" },
    };
    const VERSE = VERSE_DATA[readingVerse] || VERSE_DATA.gen1v1;

    const WORDS_GEN1V1 = [
      {
        hebrew: "בְּרֵאשִׁית",
        transliteration: "Bereshit",
        meaning: "In the beginning",
        grammar: "Bet (בְּ = in) + Reshit (רֵאשִׁית = beginning). The very first word of the Bible.",
        letters: [
          { l:"ב", name:"Bet", lesson:2, note:"The letter of house — the Bible begins in God's house" },
          { l:"ר", name:"Resh", lesson:20, note:"Head, beginning — the first, the highest" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent — takes the vowel sound here" },
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire, to press — the consuming start" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — the smallest letter" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — the end within the beginning" },
        ],
        devotional: "The rabbis asked: why does the Torah begin with Bet and not Aleph? Because Bet means house — God began creation by building a home. And Aleph waited humbly, so God honoured it by beginning the Ten Commandments with Aleph: Anokhi — I am.",
        color: "#C06C3E",
      },
      {
        hebrew: "בָּרָא",
        transliteration: "Bara",
        meaning: "Created",
        grammar: "A verb meaning to create out of nothing. Always used with God as subject — never humans.",
        letters: [
          { l:"ב", name:"Bet", lesson:2, note:"The house — what God is building" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — God acts as the head of creation" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength — the power behind the act" },
        ],
        devotional: "Only God bara. You can make, build, and craft — but you cannot create from nothing. This single verb separates the Creator from all creation. He spoke into absolute void and something real appeared.",
        color: "#2E4A33",
      },
      {
        hebrew: "אֱלֹהִים",
        transliteration: "Elohim",
        meaning: "God",
        grammar: "Plural noun (ending ים) used with singular verbs — the plural of majesty. Appears over 2,600 times.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Silent — God's quiet, powerful presence" },
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — God as teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's own letter breathed into this name" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — God's active power" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — the Spirit hovered over waters in Genesis 1:2" },
        ],
        devotional: "The first name of God in Scripture is not Father, not Saviour, not Lord — it is Elohim, the Creator. Before relationship comes existence. Before love comes life. God introduced Himself first through power, then through covenant.",
        color: "#8B5CF6",
      },
      {
        hebrew: "אֵת",
        transliteration: "Et",
        meaning: "(Direct object marker)",
        grammar: "Et (אֵת) has no English translation — it marks the direct object. It is made of Aleph (first letter) and Tav (last letter).",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter of the alphabet" },
          { l:"ת", name:"Tav", lesson:22, note:"The last letter of the alphabet" },
        ],
        devotional: "The rabbis noted that et (אֵת) contains Aleph and Tav — the first and last letters of the Hebrew alphabet. Jesus declared 'I am the Alpha and Omega' — in Hebrew: I am the Aleph and Tav. This tiny untranslatable word hidden in Genesis 1:1 was a signpost to the Word who was in the beginning.",
        color: "#D4A853",
      },
      {
        hebrew: "הַשָּׁמַיִם",
        transliteration: "HaShamayim",
        meaning: "The heavens",
        grammar: "Ha (הַ = the definite article) + Shamayim (שָּׁמַיִם = heavens, always plural).",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"He as the definite article — 'the'" },
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire — the blazing expanse of heaven" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — heaven and water share deep connection" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God stretched across the sky" },
          { l:"מ", name:"Mem (final)", lesson:13, note:"Final Mem ם — sealed, complete" },
        ],
        devotional: "The heavens are always plural in Hebrew — shamayim, never shameh. This plurality hints at layers: the sky we see, the stars beyond, and the dwelling place of God above all. Every time you look up, you see shamayim.",
        color: "#1B7A6E",
      },
      {
        hebrew: "וְאֵת",
        transliteration: "VeEt",
        meaning: "And (the)",
        grammar: "Vav (וְ = and) + Et (אֵת = direct object marker). The Vav of connection links heaven and earth.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"The nail of connection — joining heaven to earth" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength holding all together" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — marking what follows as direct object" },
        ],
        devotional: "The Vav joins heaven and earth in the very first verse. This tiny letter — the nail — connects the two realms God created. In Jewish mystical thought, the Vav is the channel between heaven and earth, the letter that makes relationship between Creator and creation possible.",
        color: "#C06C3E",
      },
      {
        hebrew: "הָאָרֶץ",
        transliteration: "HaAretz",
        meaning: "The earth",
        grammar: "Ha (הָ = the definite article) + Aretz (אָרֶץ = earth, land, ground).",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"He as the definite article — 'the'" },
          { l:"א", name:"Aleph", lesson:1, note:"Aleph — strength, the foundation" },
          { l:"ר", name:"Resh", lesson:20, note:"Resh — the head, the first matter formed" },
          { l:"צ", name:"Tsade", lesson:18, note:"Tsade — the righteous earth, made for the righteous" },
        ],
        devotional: "The earth is the final word of Genesis 1:1 — the destination of all creation. God began with Himself (Elohim), acted through His Word (bara), and ended with the earth — our home. The whole verse moves from heaven to earth, from infinite to finite, from Creator to creation.",
        color: "#2E4A33",
      },
    ];

    const WORDS_PSALM23V1 = [
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The sacred four-letter name of God — the Tetragrammaton (יהוה). Too holy to pronounce, Jewish readers say 'Adonai' (Lord) in its place. Appears 6,828 times in the OT.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The smallest letter — God's humility and power" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's very breath is in His name" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — connecting God to His people" },
          { l:"ה", name:"He", lesson:5, note:"Breath again — the name itself is breathing" },
        ],
        devotional: "The name YHWH is the first word of Psalm 23. David does not begin with 'God is powerful' or 'God is great' — he begins with the personal covenant name. The God of Psalm 23 is not a distant Creator but the God who made a covenant with Israel, who knows your name, who is present. Before any promise is made, the name itself is the foundation.",
        color: "#D4A853",
      },
      {
        hebrew: "רֹעִי",
        transliteration: "Ro'i",
        meaning: "My shepherd",
        grammar: "Ro'eh (רֹעֶה = shepherd) + the suffix י (i = my). The possessive 'my' is built directly into the word. This is intimate, personal language.",
        letters: [
          { l:"ר", name:"Resh", lesson:20, note:"Head — the shepherd as the head, the leader" },
          { l:"ע", name:"Ayin", lesson:16, note:"Eye — the shepherd who watches, who sees" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — and the possessive 'my'" },
        ],
        devotional: "Ro'i — my shepherd. Not a shepherd, not the shepherd, but my shepherd. David was himself a shepherd before he was a king. He knew what a shepherd does: leads to green pastures, guards from predators, searches for the lost one. When David calls YHWH his shepherd, he is drawing on everything he knew from the fields of Bethlehem.",
        color: "#2E4A33",
      },
      {
        hebrew: "לֹא",
        transliteration: "Lo",
        meaning: "Not / Shall not",
        grammar: "The simple Hebrew negative particle. Absolute and unconditional — 'I shall not' with certainty, not 'I probably won't'.",
        letters: [
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — the authority behind the promise" },
          { l:"א", name:"Aleph", lesson:1, note:"Silent strength — the firm, unshakeable no" },
        ],
        devotional: "Lo — not. Two letters, one of the most powerful words in the Psalm. Because YHWH is my shepherd — therefore lo. The promise flows from the relationship. David doesn't say 'I will try not to want' or 'I hope not to want.' The lo is absolute because the Shepherd is absolute. The sufficiency is as certain as the Shepherd's identity.",
        color: "#1B7A6E",
      },
      {
        hebrew: "אֶחְסָר",
        transliteration: "Echsar",
        meaning: "Want / Lack",
        grammar: "From the root חָסַר (chasar — to lack, to be without). First person imperfect: 'I shall lack.' The imperfect tense points to ongoing, continuous sufficiency.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter — I, the speaker, the sheep" },
          { l:"ח", name:"Chet", lesson:8, note:"Life fence — what is kept inside, protected" },
          { l:"ס", name:"Samekh", lesson:15, note:"A support, a prop — being held up, not lacking" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the head of all needs is met" },
        ],
        devotional: "Echsar — I shall lack. This is the entire gospel of Psalm 23 in one word, negated by lo. YHWH is my shepherd, therefore I shall not lack. Not 'I shall have everything I want' but 'I shall lack nothing I truly need.' The sheep does not manage its own provision — it simply stays close to the shepherd. That is the whole secret.",
        color: "#8B5CF6",
      },
    ];

    const WORDS_GEN1V2 = [
      {
        hebrew: "וְהָאָרֶץ",
        transliteration: "VeHaAretz",
        meaning: "And the earth",
        grammar: "Vav (וְ = and) + Ha (הָ = the) + Aretz (אָרֶץ = earth). The Vav connects this verse directly to verse 1.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"The nail — connecting verse 2 to verse 1" },
          { l:"ה", name:"He", lesson:5, note:"The definite article 'the'" },
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the foundation of the earth" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the chief substance" },
          { l:"צ", name:"Tsade", lesson:18, note:"Righteousness — even in chaos, God's purpose holds" },
        ],
        devotional: "The very first word of verse 2 begins with Vav — 'and'. This is not a new story. It is a continuation. The earth God created in verse 1 is now described in its initial state: unformed, waiting. God does not abandon what He makes in its raw state.",
        color: "#2E4A33",
      },
      {
        hebrew: "הָיְתָה",
        transliteration: "Hayetah",
        meaning: "Was",
        grammar: "A feminine past tense verb from the root הָיָה (hayah — to be, to become). Matches the feminine noun Aretz.",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"Breath — existence itself" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — He determined this state" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — this was a sealed, appointed condition" },
          { l:"ה", name:"He", lesson:5, note:"Feminine ending — agreeing with Aretz" },
        ],
        devotional: "The earth was — hayetah. This verb is the root of the name YHWH (יהוה) — He Who Is, Was, and Will Be. Even in the description of formlessness, the very word used points to the eternal God who exists outside of time.",
        color: "#1B7A6E",
      },
      {
        hebrew: "תֹהוּ",
        transliteration: "Tohu",
        meaning: "Without form",
        grammar: "A noun meaning formless, chaos, emptiness. Used 20 times in the OT. Always describes something void of order.",
        letters: [
          { l:"ת", name:"Tav", lesson:22, note:"The seal — something marked as unfinished" },
          { l:"ה", name:"He", lesson:5, note:"Breath — a hollow, empty breath" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — suspended, not yet anchored" },
        ],
        devotional: "Tohu does not mean evil — it means unformed. God did not create a broken world. He created raw material. A sculptor sees the statue inside the marble. God saw the garden inside the tohu. He begins with chaos not because He is limited, but because He delights in forming.",
        color: "#C06C3E",
      },
      {
        hebrew: "וָבֹהוּ",
        transliteration: "VaVohu",
        meaning: "And void",
        grammar: "Vav (וָ = and) + Bohu (בֹהוּ = void, emptiness). Tohu and bohu always appear together in Scripture as a pair.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — joining tohu and bohu as inseparable twins" },
          { l:"ב", name:"Bet", lesson:2, note:"House — an empty house, waiting for inhabitants" },
          { l:"ה", name:"He", lesson:5, note:"Breath — barely there, waiting to be filled" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — suspended, incomplete" },
        ],
        devotional: "Tohu vavohu — formless and void. These two words only appear together three times in all of Scripture. Theologians call this the 'unformed and unfilled' state. God's work in creation is to form and to fill: forming on days 1–3, filling on days 4–6. Your life's empty places are not abandoned — they are waiting to be formed and filled.",
        color: "#8B5CF6",
      },
      {
        hebrew: "וְחֹשֶׁךְ",
        transliteration: "VeChoshekh",
        meaning: "And darkness",
        grammar: "Vav (וְ = and) + Choshekh (חֹשֶׁךְ = darkness). Choshekh means the absence of light — not an evil force but an unfilled state.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — adding to the description of the unformed earth" },
          { l:"ח", name:"Chet", lesson:8, note:"A fence, enclosure — darkness as a boundary" },
          { l:"ש", name:"Shin", lesson:21, note:"Fire — but here, fire not yet lit" },
          { l:"ך", name:"Kaf (final)", lesson:11, note:"The open hand — darkness as openness, waiting" },
        ],
        devotional: "Darkness was not created by God as an evil thing — it was simply the absence of what He was about to speak. God's first recorded act in creation is to speak light into darkness. He still does this. Whatever darkness you face is not beyond the reach of His first word: 'Let there be light.'",
        color: "#2E4A33",
      },
      {
        hebrew: "וְרוּחַ",
        transliteration: "VeRuach",
        meaning: "And the Spirit",
        grammar: "Vav (וְ = and) + Ruach (רוּחַ = Spirit, wind, breath — H7307). The same word means all three: Spirit, wind, breath.",
        letters: [
          { l:"ו", name:"Vav", lesson:6, note:"And — the Spirit enters the scene" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the Spirit as the head of all living things" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — the Spirit as connector between God and creation" },
          { l:"ח", name:"Chet", lesson:8, note:"Life fence — the Spirit as the boundary of life itself" },
        ],
        devotional: "Ruach — Spirit, wind, breath. This word holds three meanings in one. The Spirit of God is like breath: invisible, essential, life-giving. Like wind: powerful, direction-setting, you cannot see it but you see what it does. The same Ruach that hovered over the waters at creation hovers over every new beginning in your life.",
        color: "#D4A853",
      },
      {
        hebrew: "אֱלֹהִים",
        transliteration: "Elohim",
        meaning: "God",
        grammar: "Plural noun used with singular verbs — the plural of majesty. The same Elohim from Genesis 1:1, appearing again.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Silent — God's quiet, powerful presence" },
          { l:"ל", name:"Lamed", lesson:12, note:"The teaching staff — God as teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — God's own letter breathed into this name" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — God's active power" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — the Spirit hovered over the waters" },
        ],
        devotional: "Elohim appears again. In a verse describing chaos, emptiness, and darkness — God is still named. He is present in the tohu vavohu. He is not absent from your wilderness. The same God who spoke creation into order in verse 1 is standing over the void in verse 2, about to speak.",
        color: "#8B5CF6",
      },
      {
        hebrew: "מְרַחֶפֶת",
        transliteration: "Merachefet",
        meaning: "Moved / Hovered",
        grammar: "A Piel participle from רָחַף (rachaph) — to hover, flutter, brood. Used only twice in the OT: here and Deuteronomy 32:11 of an eagle over its nest.",
        letters: [
          { l:"מ", name:"Mem", lesson:13, note:"Water — hovering over the waters" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the Spirit as the head of all new life" },
          { l:"ח", name:"Chet", lesson:8, note:"Life — this hovering is the beginning of all life" },
          { l:"פ", name:"Pe", lesson:17, note:"Mouth — as if speaking life before the words come" },
          { l:"ת", name:"Tav", lesson:22, note:"The seal — a complete, purposeful movement" },
        ],
        devotional: "Merachefet — hovering, brooding, fluttering. The Spirit of God was not passive over the void. He was like a mother eagle beating her wings over her nest, warming, protecting, preparing to bring forth life. Before God spoke a single word of creation, the Spirit was already there — hovering with intention. He hovers over every chaos with the same purpose.",
        color: "#1B7A6E",
      },
      {
        hebrew: "הַמָּיִם",
        transliteration: "HaMayim",
        meaning: "The waters",
        grammar: "Ha (הַ = the) + Mayim (מָּיִם = waters, always plural). Water in Hebrew is always plural — mayim, never a singular form.",
        letters: [
          { l:"ה", name:"He", lesson:5, note:"The definite article 'the'" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — Mem is the letter of water itself" },
          { l:"י", name:"Yod", lesson:10, note:"The hand of God moving through the waters" },
          { l:"מ", name:"Mem (final)", lesson:13, note:"Final Mem ם — sealed, the waters enclosed" },
        ],
        devotional: "The verse ends where the Spirit is hovering: over the waters. Water in Hebrew thought represents chaos, potential, and life. Mem — the letter of water — looks like waves. The Spirit hovered over the mayim, and out of those chaotic waters God would speak forth an ordered, beautiful world. Every ending in Scripture that seems like water — like chaos — is a canvas for God's next creation.",
        color: "#C06C3E",
      },
    ];

    const WORDS_DEUT6V4 = [
      {
        hebrew: "שְׁמַע",
        transliteration: "Shema",
        meaning: "Hear / Listen",
        grammar: "A Qal imperative — a direct command. Not 'you might hear' but 'Hear!' The command form makes this an urgent summons to active listening.",
        letters: [
          { l:"שׁ", name:"Shin", lesson:21, note:"Fire — hearing that ignites, that burns within" },
          { l:"מ", name:"Mem", lesson:13, note:"Water — hearing that flows through you and changes you" },
          { l:"ע", name:"Ayin", lesson:16, note:"Eye — to truly hear is to truly see" },
        ],
        devotional: "Shema — hear. The most important word in Judaism. This single imperative has been recited by Jewish people twice daily for over three thousand years. It is the first word a Jewish child learns and the last word on the lips of Jewish martyrs. To shema is not passive hearing — it is active, obedient, life-transforming response to the voice of God.",
        color: "#C06C3E",
      },
      {
        hebrew: "יִשְׂרָאֵל",
        transliteration: "Yisrael",
        meaning: "Israel",
        grammar: "The covenant name given to Jacob in Genesis 32:28 — meaning 'he who strives with God' or 'God strives.' Refers to both the nation and every individual within the covenant.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The hand of God — the hand that renamed Jacob" },
          { l:"שׂ", name:"Shin", lesson:21, note:"Here as Sin — the striving, the wrestling" },
          { l:"ר", name:"Resh", lesson:20, note:"Head — the one who prevailed" },
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the strength received in the struggle" },
          { l:"ל", name:"Lamed", lesson:12, note:"The staff — guided and taught by God" },
        ],
        devotional: "Yisrael — the one who strives with God. This name was born in a night of wrestling at the Jabbok river. God calls His people by the name of a man who refused to let go until he received a blessing. The Shema is addressed to wrestlers, to those who have struggled with God and kept hold. It is not addressed to the comfortable but to the covenant people.",
        color: "#2E4A33",
      },
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The Tetragrammaton — the four-letter personal name of God. Appearing here for the first time in the Shema, establishing who is speaking and who is being declared.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"The smallest letter — God's humility and transcendence" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the living God, not an idol" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — God nailed in covenant to His people" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the name itself breathes life" },
        ],
        devotional: "YHWH appears twice in this six-word verse. The first YHWH establishes identity — this is the covenant God of Israel, not a foreign deity. The rabbis taught that the two occurrences of YHWH point to God as He is known now and God as He will be fully known in the age to come. The God you know today is the same God who will be revealed in fullness.",
        color: "#D4A853",
      },
      {
        hebrew: "אֱלֹהֵינוּ",
        transliteration: "Eloheinu",
        meaning: "Our God",
        grammar: "Elohim (אֱלֹהִים) + the suffix נוּ (nu = our). The plural possessive 'our' — this declaration is communal, not just personal. Our God, not just my God.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"Strength — the all-powerful God" },
          { l:"ל", name:"Lamed", lesson:12, note:"Teaching staff — God as our teacher and authority" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the living God among us" },
          { l:"י", name:"Yod", lesson:10, note:"The hand — His hand upon us" },
          { l:"נ", name:"Nun", lesson:14, note:"Fish, life — the God of all living" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — and the suffix 'our'" },
        ],
        devotional: "Eloheinu — our God. Not my God in isolation but our God in community. The Shema is recited together. Faith in Israel was never purely private — it was communal, covenantal, shared. The same God who is YHWH the personal covenant God is also Elohim the cosmic Creator. He is both infinitely powerful and intimately ours.",
        color: "#8B5CF6",
      },
      {
        hebrew: "יְהוָה",
        transliteration: "YHWH",
        meaning: "The LORD",
        grammar: "The second occurrence of the Tetragrammaton in this verse. Together with the first YHWH it creates a declaration: YHWH — Eloheinu — YHWH. The name frames the confession.",
        letters: [
          { l:"י", name:"Yod", lesson:10, note:"Yod again — the hand that holds all things" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the same God, breathing still" },
          { l:"ו", name:"Vav", lesson:6, note:"The nail — holding the whole declaration together" },
          { l:"ה", name:"He", lesson:5, note:"Breath — the final breath, the final word" },
        ],
        devotional: "YHWH appears again, closing the declaration like a bookend. The structure is: YHWH — our God — YHWH. The personal name frames everything. Whatever stands between the two names of YHWH is held, defined, and owned by Him. Your life stands between the YHWH who created you and the YHWH who will receive you. All of it is held in His name.",
        color: "#D4A853",
      },
      {
        hebrew: "אֶחָד",
        transliteration: "Echad",
        meaning: "One",
        grammar: "The Hebrew word for one — echad. Unlike yachid (absolute solitary oneness), echad can mean a unified one — like one cluster of grapes or one evening and morning. The same word used for husband and wife becoming one flesh.",
        letters: [
          { l:"א", name:"Aleph", lesson:1, note:"The first letter — One, the beginning of all" },
          { l:"ח", name:"Chet", lesson:8, note:"Life — oneness as the source of all life" },
          { l:"ד", name:"Dalet", lesson:4, note:"Door — the one God as the only door" },
        ],
        devotional: "Echad — one. The final word of the Shema is the word that has sustained the Jewish people through every trial in history. Echad is a unified oneness — not a cold singularity but a oneness that contains richness. The rabbis said that when you recite Echad, you should dwell on it, extending the sound, meditating on God's sovereignty over every direction and dimension. One God. Everything else flows from this.",
        color: "#1B7A6E",
      },
    ];

    const WORDS = readingVerse === "gen1v2" ? WORDS_GEN1V2 : readingVerse === "psalm23v1" ? WORDS_PSALM23V1 : readingVerse === "deut6v4" ? WORDS_DEUT6V4 : WORDS_GEN1V1;
    const totalWords = WORDS.length;
    const currentWord = readingStep >= 1 && readingStep <= totalWords ? WORDS[readingStep - 1] : null;

    // Intro screen
    if (readingStep === 0) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={`Read ${VERSE.ref}`} subtitle="Word by Word · Letter by Letter" onBack={() => nav("hebrew-reading-home")} theme={ht2} />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"20px 20px 40px" }}>
          {/* Hero */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:22, textAlign:"center", position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:28, color:ht2.headerText, direction:"rtl", lineHeight:1.8, marginBottom:16, textShadow:"0 2px 12px rgba(0,0,0,0.3)", letterSpacing:1 }}>
                {VERSE.hebrew}
              </div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic", marginBottom:4 }}>{VERSE.kjv}</div>
              <div style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.accent, letterSpacing:"0.1em", textTransform:"uppercase" }}>{VERSE.ref}</div>
            </div>
          </div>
          {/* What you will learn */}
          <Card t={ht2} style={{ marginBottom:16 }}>
            <Label icon="🎓" t={ht2}>What You Will Learn</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8 }}>
              <strong>{VERSE.ref}</strong> contains <strong>{totalWords} Hebrew words</strong>. In this lesson you will read each word one by one — seeing every letter, its name, and its meaning. You will discover the profound depth God packed into every word of Scripture.
            </div>
          </Card>
          {/* Word overview */}
          <Label icon="📖" t={ht2} color={ht2.muted}>The 7 Words</Label>
          <div style={{ display:"flex", flexDirection:"column", gap:6, marginBottom:22 }}>
            {WORDS.map((w,i) => (
              <div key={i} style={{ background:ht2.card, borderRadius:10, padding:"12px 14px", border:`1px solid ${ht2.divider}`, display:"flex", alignItems:"center", gap:12, borderLeft:`3px solid ${w.color}` }}>
                <span style={{ fontFamily:ht2.ui, fontSize:11, color:ht2.light, minWidth:16 }}>{i+1}</span>
                <span style={{ fontFamily:"'Times New Roman',serif", fontSize:20, color:w.color, direction:"rtl", minWidth:80 }}>{w.hebrew}</span>
                <span style={{ fontFamily:ht2.body, fontSize:13, color:ht2.muted, fontStyle:"italic", flex:1 }}>{w.meaning}</span>
              </div>
            ))}
          </div>
          <button onClick={() => { setReadingStep(1); setShowLetters(false); }}
            style={{ width:"100%", padding:"16px", borderRadius:14, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:16, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(46,74,51,0.25)" }}>
            Begin Reading →
          </button>
        </div>
      </div>
    );

    // Full verse celebration screen
    if (readingStep === totalWords + 1) return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title="You Read It!" subtitle={`${VERSE.ref} Complete`} onBack={() => setReadingStep(0)} theme={ht2} />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"24px 20px 40px", textAlign:"center" }}>
          <div style={{ fontSize:64, marginBottom:16 }}>🎉</div>
          <div style={{ fontFamily:ht2.heading, fontSize:28, color:ht2.dark, marginBottom:8 }}>Shalom!</div>
          <div style={{ fontFamily:ht2.body, fontSize:15, color:ht2.muted, fontStyle:"italic", marginBottom:24, lineHeight:1.7 }}>
            You have just read the first verse of God's Word in its original Hebrew.
          </div>
          {/* Full verse display */}
          <div style={{ background:ht2.headerGradient, borderRadius:20, padding:"32px 20px", marginBottom:22, position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.2),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1 }}>
              <div style={{ fontFamily:"'Times New Roman',serif", fontSize:26, color:ht2.headerText, direction:"rtl", lineHeight:2, marginBottom:16, textShadow:"0 2px 12px rgba(0,0,0,0.3)", letterSpacing:1 }}>
                {VERSE.hebrew}
              </div>
              {/* Word by word */}
              <div style={{ display:"flex", flexWrap:"wrap", justifyContent:"center", gap:8, direction:"rtl", marginBottom:16 }}>
                {WORDS.map((w,i) => (
                  <div key={i} style={{ textAlign:"center", background:"rgba(255,255,255,0.1)", borderRadius:8, padding:"6px 10px" }}>
                    <div style={{ fontFamily:"'Times New Roman',serif", fontSize:18, color:ht2.headerText }}>{w.hebrew}</div>
                    <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.accent, marginTop:2 }}>{w.meaning}</div>
                  </div>
                ))}
              </div>
              <div style={{ fontFamily:ht2.body, fontSize:14, color:`${ht2.headerText}88`, fontStyle:"italic" }}>{VERSE.kjv}</div>
            </div>
          </div>
          <Card t={ht2} style={{ marginBottom:16, textAlign:"left" }}>
            <Label icon="✨" t={ht2}>Reflection</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8 }}>
              {readingVerse === "gen1v1" && <>Genesis 1:1 contains exactly <strong>7 words</strong> and <strong>28 letters</strong> (7×4). The middle word is <strong>אֵת</strong> — Aleph and Tav, the first and last letters of the alphabet. Jesus declared: "I am the Alpha and Omega" — the Aleph and Tav. He was hidden in the first verse of Genesis, waiting to be found.</>}
              {readingVerse === "gen1v2" && <>Genesis 1:2 introduces the <strong>Ruach Elohim</strong> — the Spirit of God — hovering over the waters. The word <strong>מְרַחֶפֶת</strong> (merachefet) appears only twice in all of Scripture: here, and in Deuteronomy 32:11 of an eagle hovering over its nest. The Spirit of God is not passive — He hovers with intention, preparing to bring forth life from chaos.</>}
              {readingVerse === "psalm23v1" && <>Psalm 23:1 is only <strong>4 words</strong> in Hebrew yet contains the entire gospel of God's provision. David, a shepherd himself, chose the most intimate image he knew to describe God. The possessive <strong>רֹעִי</strong> (my shepherd) — not a shepherd, not the shepherd — makes this the most personal declaration in all the Psalms.</>}
              {readingVerse === "deut6v4" && <>The Shema contains <strong>6 words</strong> and has been recited by Jewish people twice daily for over 3,000 years. The final letter of <strong>שְׁמַע</strong> (Ayin — ע) and the final letter of <strong>אֶחָד</strong> (Dalet — ד) are written larger in Torah scrolls. Together they spell <strong>עֵד</strong> (ed) — witness. Every time the Shema is recited, Israel bears witness to the oneness of God.</>}
            </div>
          </Card>
          <button onClick={() => setReadingStep(0)}
            style={{ width:"100%", padding:"14px", borderRadius:12, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:15, fontWeight:700, cursor:"pointer", marginBottom:10 }}>
            Read Again
          </button>
          <button onClick={() => nav("hebrew-home")}
            style={{ width:"100%", padding:"13px", borderRadius:12, border:`1.5px solid ${ht2.accentBorder}`, background:"transparent", color:ht2.accent, fontFamily:ht2.ui, fontSize:14, fontWeight:700, cursor:"pointer" }}>
            Back to Lessons
          </button>
        </div>
      </div>
    );

    // Word study screen
    return (
      <div style={{ minHeight:"100vh", background:ht2.bg }}>
        <Header title={`Word ${readingStep} of ${totalWords}`} subtitle={`${currentWord.transliteration} — ${currentWord.meaning}`} onBack={() => readingStep === 1 ? setReadingStep(0) : setReadingStep(s => s-1)} theme={ht2} />
        <div style={{ maxWidth:520, margin:"0 auto", padding:"16px 16px 40px" }}>
          {/* Progress */}
          <div style={{ background:ht2.divider, borderRadius:6, height:6, marginBottom:20, overflow:"hidden" }}>
            <div style={{ width:`${((readingStep-1)/totalWords)*100}%`, height:"100%", background:ht2.accent, borderRadius:6, transition:"width 0.4s ease" }}/>
          </div>
          {/* Full verse context */}
          <div style={{ background:ht2.headerGradient, borderRadius:16, padding:"16px 18px", marginBottom:16, position:"relative", overflow:"hidden" }}>
            <div style={{ position:"absolute", inset:0, background:"radial-gradient(ellipse at 50% 30%,rgba(192,108,62,0.15),transparent 70%)" }}/>
            <div style={{ position:"relative", zIndex:1, display:"flex", flexWrap:"wrap", justifyContent:"center", gap:6, direction:"rtl" }}>
              {WORDS.map((w,i) => (
                <span key={i} style={{ fontFamily:"'Times New Roman',serif", fontSize:i===readingStep-1?22:15, color:i===readingStep-1?ht2.accent:`${ht2.headerText}66`, fontWeight:i===readingStep-1?700:400, transition:"all 0.3s", padding:"2px 4px", borderRadius:4, background:i===readingStep-1?"rgba(192,108,62,0.2)":"transparent" }}>
                  {w.hebrew}
                </span>
              ))}
            </div>
          </div>
          {/* Big word */}
          <Card t={ht2} style={{ marginBottom:14, textAlign:"center" }}>
            <div style={{ fontFamily:"'Times New Roman',serif", fontSize:64, color:ht2.accent, direction:"rtl", lineHeight:1.2, marginBottom:10, textShadow:`0 2px 12px ${ht2.accentLight}` }}>
              {currentWord.hebrew}
            </div>
            <div style={{ fontFamily:ht2.heading, fontSize:22, color:ht2.dark, marginBottom:4 }}>{currentWord.transliteration}</div>
            <div style={{ fontFamily:ht2.body, fontSize:16, color:ht2.muted, fontStyle:"italic", marginBottom:10 }}>{currentWord.meaning}</div>
            <div style={{ fontFamily:ht2.ui, fontSize:13, color:ht2.text, lineHeight:1.65, textAlign:"left", padding:"10px 12px", background:ht2.accentLight, borderRadius:8 }}>{currentWord.grammar}</div>
          </Card>
          {/* Letter breakdown */}
          <div style={{ marginBottom:14 }}>
            <button onClick={() => setShowLetters(s => !s)}
              style={{ width:"100%", padding:"12px 16px", borderRadius:10, border:`1px solid ${ht2.accentBorder}`, background:showLetters?ht2.accentLight:ht2.card, fontFamily:ht2.ui, fontSize:13, fontWeight:700, color:ht2.accent, cursor:"pointer", display:"flex", justifyContent:"space-between", alignItems:"center", marginBottom: showLetters?8:0 }}>
              <span>🔠 Letter by Letter Breakdown ({currentWord.letters.length} letters)</span>
              <span>{showLetters?"▲":"▼"}</span>
            </button>
            {showLetters && (
              <div style={{ display:"flex", flexDirection:"column", gap:6 }}>
                {currentWord.letters.map((lt,i) => (
                  <div key={i} style={{ background:ht2.card, borderRadius:10, padding:"12px 14px", border:`1px solid ${ht2.divider}`, display:"flex", alignItems:"center", gap:12 }}>
                    <div style={{ width:44, height:44, borderRadius:10, background:ht2.accentLight, border:`1px solid ${ht2.accentBorder}`, display:"flex", alignItems:"center", justifyContent:"center", fontFamily:"'Times New Roman',serif", fontSize:26, color:ht2.accent, flexShrink:0, direction:"rtl" }}>{lt.l}</div>
                    <div style={{ flex:1 }}>
                      <div style={{ fontFamily:ht2.heading, fontSize:13, fontWeight:700, color:ht2.dark }}>{lt.name}</div>
                      <div style={{ fontFamily:ht2.body, fontSize:12, color:ht2.muted, fontStyle:"italic", marginTop:2 }}>{lt.note}</div>
                    </div>
                    <div style={{ fontFamily:ht2.ui, fontSize:9, color:ht2.accent, textAlign:"right", flexShrink:0, background:ht2.accentLight, padding:"3px 8px", borderRadius:4 }}>Lesson {lt.lesson}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
          {/* Devotional */}
          <Card accent t={ht2} style={{ marginBottom:20 }}>
            <Label icon="✨" t={ht2}>Insight</Label>
            <div style={{ fontFamily:ht2.body, fontSize:14, color:ht2.text, lineHeight:1.8, fontStyle:"italic" }}>{currentWord.devotional}</div>
          </Card>
          {/* Navigation */}
          <button onClick={() => { setReadingStep(s => s+1); setShowLetters(false); }}
            style={{ width:"100%", padding:"16px", borderRadius:14, border:"none", background:ht2.headerGradient, color:ht2.headerText, fontFamily:ht2.ui, fontSize:15, fontWeight:700, cursor:"pointer", boxShadow:"0 4px 15px rgba(46,74,51,0.2)" }}>
            {readingStep === totalWords ? "Complete — See Full Verse 🎉" : `Next Word: ${WORDS[readingStep].transliteration} →`}
          </button>
        </div>
      </div>
    );
  };

  // ═══ BOTTOM NAV ═══
  const showNav = !["verse","verses","hebrew-lesson","hebrew-practice"].includes(view);
  const navItems = [
    { id:"home", label:"Home", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> },
    { id:"bible", label:"Bible", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg> },
    { id:"learn", label:"Learn", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M22 10v6M2 10l10-5 10 5-10 5z"/><path d="M6 12v5c3 3 9 3 12 0v-5"/></svg> },
    { id:"journal", label:"Journal", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="12" y1="18" x2="12" y2="12"/><line x1="9" y1="15" x2="15" y2="15"/></svg> },
    { id:"account", label:"Account", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg> },
  ];

  // ═══ RENDER ═══
  return (
    <div style={{ maxWidth:640,margin:"0 auto",transition:"opacity 0.12s ease",opacity:fade?1:0,minHeight:"100vh",paddingBottom:showNav?68:0 }}>
      {view === "home" && Home()}
      {view === "books" && Books()}
      {view === "chapter" && Chapters()}
      {view === "verses" && VerseList()}
      {view === "verse" && VerseStudy()}
      {view === "highlights" && Highlights()}
      {view === "account" && Account()}
      {view === "learn-home" && LearnHome()}
      {view === "journal-home" && JournalHome()}
      {view === "hebrew-grammar-home" && HebrewGrammarHome()}
      {view === "hebrew-grammar-lesson" && HebrewGrammarLesson()}
      {view === "hebrew-home" && HebrewHome()}
      {view === "hebrew-lesson" && HebrewLesson()}
      {view === "hebrew-practice" && HebrewPractice()}
      {view === "hebrew-reading-home" && HebrewReadingHome()}
      {view === "hebrew-reading" && HebrewReading()}

      {/* BOTTOM NAV */}
      {showNav && (
        <div style={{ position:"fixed",bottom:0,left:0,right:0,zIndex:50,background:ht.card,borderTop:`1px solid ${ht.divider}`,boxShadow:"0 -2px 12px rgba(0,0,0,0.06)" }}>
          <div style={{ maxWidth:640,margin:"0 auto",display:"flex",justifyContent:"space-around",alignItems:"center",padding:"6px 0 10px" }}>
            {navItems.map(item => {
              const isActive =
                  (item.id === "home" && view === "home") ||
                  (item.id === "bible" && ["books","chapter","verses","verse"].includes(view)) ||
                  (item.id === "learn" && ["learn-home","hebrew-home","hebrew-lesson","hebrew-practice","hebrew-reading-home","hebrew-reading","hebrew-grammar-home","hebrew-grammar-lesson"].includes(view)) ||
                  (item.id === "journal" && ["journal-home","highlights"].includes(view)) ||
                  (item.id === "account" && view === "account");
              return (
                <button key={item.id} onClick={() => {
                  if (item.id === "bible") nav("books", { testament: testament || "OT" });
                  else if (item.id === "learn") nav("learn-home");
                  else if (item.id === "journal") { if (user) { setTab("highlights"); nav("journal-home"); } else setAuthModal(true); }
                  else nav(item.id);
                }} style={{ display:"flex",flexDirection:"column",alignItems:"center",gap:2,background:"none",border:"none",cursor:"pointer",padding:"4px 12px",color:isActive?ht.accent:ht.muted,transition:"all 0.15s",opacity:isActive?1:0.7 }}>
                  <div style={{ transform:isActive?"scale(1.1)":"scale(1)",transition:"transform 0.15s" }}>{item.icon}</div>
                  <span style={{ fontFamily:ht.ui,fontSize:10,fontWeight:isActive?700:500,letterSpacing:"0.02em" }}>{item.label}</span>
                  {isActive && <div style={{ width:4,height:4,borderRadius:"50%",background:ht.accent,marginTop:-1 }}/>}
                </button>
              );
            })}
          </div>
        </div>
      )}
      {/* AUTH MODAL */}
      {authModal && (
        <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.5)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:20 }}>
          <div style={{ background:ht.card,borderRadius:20,padding:"28px 24px",width:"100%",maxWidth:380,position:"relative" }}>
            <button onClick={() => setAuthModal(false)} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
            <div style={{ textAlign:"center",marginBottom:20 }}>
              <div style={{ color:ht.accent,marginBottom:8 }}><CrossIcon /></div>
              <h3 style={{ fontFamily:ht.heading,fontSize:22,color:ht.dark,margin:0 }}>{authMode === "login" ? "Welcome Back" : "Join the Study"}</h3>
              <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"6px 0 0" }}>{authMode === "login" ? "Sign in to access your notes & journal" : "Create an account to save your study"}</p>
            </div>
            {authMode === "signup" && (
              <input key="auth-name" value={authName} onChange={e => setAuthName(e.target.value)} placeholder="Display Name" style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,marginBottom:10,outline:"none",background:ht.bg,boxSizing:"border-box" }} />
            )}
            <input key="auth-email" type="email" value={authEmail} onChange={e => setAuthEmail(e.target.value)} placeholder="Email" style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,marginBottom:10,outline:"none",background:ht.bg,boxSizing:"border-box" }} />
            <input key="auth-pass" type="password" value={authPass} onChange={e => setAuthPass(e.target.value)} placeholder="Password" onKeyDown={e => e.key === "Enter" && handleAuth()} style={{ width:"100%",padding:"12px 14px",borderRadius:10,border:`1px solid ${ht.divider}`,fontFamily:ht.ui,fontSize:14,marginBottom:10,outline:"none",background:ht.bg,boxSizing:"border-box" }} />
            {authError && <div style={{ fontFamily:ht.ui,fontSize:12,color:"#E8625C",marginBottom:10,textAlign:"center" }}>{authError}</div>}
            <button onClick={handleAuth} disabled={authLoading} style={{ width:"100%",padding:"13px",borderRadius:10,border:"none",background:ht.headerGradient,color:ht.headerText||"#fff",fontFamily:ht.ui,fontSize:15,fontWeight:700,cursor:"pointer",marginBottom:12 }}>
              {authLoading ? "..." : authMode === "login" ? "Sign In" : "Create Account"}
            </button>
            <div style={{ display:"flex",alignItems:"center",gap:12,marginBottom:12 }}>
              <div style={{flex:1,height:1,background:ht.divider}}/><span style={{fontFamily:ht.ui,fontSize:12,color:ht.light}}>or</span><div style={{flex:1,height:1,background:ht.divider}}/>
            </div>
            <button onClick={handleGoogleSignIn} style={{ width:"100%",padding:"12px",borderRadius:10,border:`1.5px solid ${ht.divider}`,background:ht.card,fontFamily:ht.ui,fontSize:14,fontWeight:600,color:ht.dark,cursor:"pointer",display:"flex",alignItems:"center",justifyContent:"center",gap:10,marginBottom:14 }}>
              <svg width="18" height="18" viewBox="0 0 24 24"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92a5.06 5.06 0 0 1-2.2 3.32v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.1z" fill="#4285F4"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg>
              Continue with Google
            </button>
            <div style={{ textAlign:"center",fontFamily:ht.ui,fontSize:13,color:ht.muted }}>
              {authMode === "login" ? "New here? " : "Already have an account? "}
              <span onClick={() => { setAuthMode(authMode === "login" ? "signup" : "login"); setAuthError(""); }} style={{ color:ht.accent,cursor:"pointer",fontWeight:600 }}>
                {authMode === "login" ? "Create Account" : "Sign In"}
              </span>
            </div>
          </div>
        </div>
      )}

      {/* DONATE MODAL */}
      {donateModal && (
        <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.6)",zIndex:100,display:"flex",alignItems:"center",justifyContent:"center",padding:16 }}>
          <div style={{ background:ht.bg,borderRadius:20,padding:"28px 22px",width:"100%",maxWidth:420,maxHeight:"90vh",overflow:"auto",position:"relative" }}>
            <button onClick={() => setDonateModal(false)} style={{ position:"absolute",top:14,right:14,background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
            <div style={{ textAlign:"center",marginBottom:22 }}>
              <div style={{fontSize:40,marginBottom:8}}>❤️</div>
              <h3 style={{ fontFamily:ht.heading,fontSize:24,color:ht.dark,margin:0 }}>Support the Ministry</h3>
              <p style={{ fontFamily:ht.ui,fontSize:13,color:ht.muted,margin:"8px 0 0",lineHeight:1.6 }}>Every feature is free. Your generosity helps us keep building.</p>
            </div>

            <div style={{background:ht.card,borderRadius:12,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18}}>
              <div style={{fontFamily:ht.body,fontSize:14,color:ht.text,lineHeight:1.75,fontStyle:"italic",textAlign:"center"}}>
                "Give, and it shall be given unto you; good measure, pressed down, and shaken together, and running over."
              </div>
              <div style={{fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",marginTop:4}}>— Luke 6:38 (KJV)</div>
            </div>

            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:18,textAlign:"center"}}>
              Every verse, every word study, every tool — completely free. Your generosity helps us keep building and sharing God's Word with the world.
            </div>

            {/* Donation amounts */}
            <div style={{display:"flex",flexDirection:"column",gap:8}}>
              {[
                {amount:"AED 10",label:"Plant a seed",icon:"🌱"},
                {amount:"AED 20",label:"Light a lamp",icon:"🕯️"},
                {amount:"AED 30",label:"Support a chapter",icon:"📖"},
                {amount:"AED 50",label:"Support a book",icon:"📚"},
                {amount:"AED 100",label:"A generous blessing",icon:"🙏"},
              ].map((d,i) => (
                <a key={i} href={`https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200`} target="_blank" rel="noopener noreferrer"
                  style={{
                    width:"100%",padding:"14px 18px",borderRadius:12,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",justifyContent:"space-between",
                    background:i===3?"linear-gradient(135deg,#D4A853,#B8860B)":ht.card,
                    border:i===3?"none":`1.5px solid ${ht.divider}`,
                    color:i===3?"#fff":ht.dark,
                    boxShadow:i===3?"0 4px 15px rgba(212,168,83,0.3)":"none",
                    textDecoration:"none",boxSizing:"border-box"
                  }}>
                  <div style={{display:"flex",alignItems:"center",gap:10}}>
                    <span style={{fontSize:20}}>{d.icon}</span>
                    <div>
                      <div style={{fontFamily:ht.heading,fontSize:15,fontWeight:700}}>{d.label}</div>
                    </div>
                  </div>
                  <div style={{fontFamily:ht.heading,fontSize:20,fontWeight:800}}>{d.amount}</div>
                </a>
              ))}
            </div>

            <div style={{textAlign:"center",marginTop:16}}>
              <a href={`https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200`} target="_blank" rel="noopener noreferrer"
                style={{fontFamily:ht.ui,fontSize:13,color:ht.accent,fontWeight:600,textDecoration:"none"}}>
                Or enter a custom amount →
              </a>
            </div>

            <div style={{textAlign:"center",marginTop:12,fontFamily:ht.ui,fontSize:11,color:ht.light}}>
              Secure payment via Stripe · Tax-deductible where applicable
            </div>
          </div>
        </div>
      )}

      {/* PRAYER JOURNAL MODAL */}
      {prayerModal && (
        <div style={{ position:"fixed",inset:0,background:"rgba(0,0,0,0.5)",zIndex:100,display:"flex",alignItems:"flex-end",justifyContent:"center" }}>
          <div style={{ background:ht.bg,borderRadius:"20px 20px 0 0",padding:"24px 20px 32px",width:"100%",maxWidth:640,maxHeight:"85vh",overflow:"auto" }}>
            <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:18 }}>
              <h3 style={{ fontFamily:ht.heading,fontSize:22,color:ht.dark,margin:0 }}>🙏 Prayer Journal</h3>
              <button onClick={() => setPrayerModal(false)} style={{ background:"none",border:"none",cursor:"pointer",color:ht.muted }}><CloseIcon /></button>
            </div>
            <div style={{ background:ht.card,borderRadius:14,padding:"16px 18px",border:`1px solid ${ht.divider}`,marginBottom:18 }}>
              <input key="prayer-title" value={prayerTitle} onChange={e => setPrayerTitle(e.target.value)} placeholder={currentVerse ? `Prayer for ${book} ${chapter}:${verse}` : "Prayer title"} style={{ width:"100%",padding:"10px 0",border:"none",fontFamily:ht.heading,fontSize:16,color:ht.dark,outline:"none",background:"transparent" }} />
              <textarea key="prayer-text" value={prayerText} onChange={e => setPrayerText(e.target.value)} placeholder="Write your prayer..." rows={3} style={{ width:"100%",padding:"8px 0",border:"none",fontFamily:ht.body,fontSize:14,color:ht.text,outline:"none",background:"transparent",resize:"vertical",lineHeight:1.7 }} />
              {currentVerse && <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.muted,marginTop:4 }}>Linked to: {book} {chapter}:{verse}</div>}
              <button onClick={addPrayer} disabled={!prayerText.trim()} style={{ marginTop:10,padding:"10px 20px",borderRadius:8,border:"none",background:prayerText.trim()?ht.accent:ht.divider,color:"#fff",fontFamily:ht.ui,fontSize:13,fontWeight:700,cursor:prayerText.trim()?"pointer":"default" }}>Add Prayer</button>
            </div>
            {prayerLoading ? <Spinner t={ht} /> : prayers.length === 0 ? (
              <div style={{ textAlign:"center",padding:30,fontFamily:ht.body,fontSize:15,color:ht.muted,fontStyle:"italic" }}>Your prayers will appear here</div>
            ) : prayers.map(p => (
              <div key={p.id} style={{ background:ht.card,borderRadius:12,padding:"14px 16px",border:`1px solid ${p.is_answered?'#7ED4AD44':ht.divider}`,marginBottom:8,borderLeft:`3px solid ${p.is_answered?'#7ED4AD':ht.accent}` }}>
                <div style={{ display:"flex",justifyContent:"space-between",alignItems:"flex-start" }}>
                  <div style={{ flex:1 }}>
                    <div style={{ fontFamily:ht.heading,fontSize:15,fontWeight:600,color:ht.dark }}>{p.title}</div>
                    {p.book_name && <div style={{ fontFamily:ht.ui,fontSize:11,color:ht.accent,marginTop:2 }}>{p.book_name} {p.chapter_number}:{p.verse_number}</div>}
                    <div style={{ fontFamily:ht.body,fontSize:13.5,color:ht.text,lineHeight:1.65,marginTop:6 }}>{p.prayer_text}</div>
                    <div style={{ fontFamily:ht.ui,fontSize:10,color:ht.light,marginTop:6 }}>{new Date(p.created_at).toLocaleDateString()}</div>
                  </div>
                  <div style={{ display:"flex",gap:6,flexShrink:0,marginLeft:10 }}>
                    <button onClick={() => togglePrayerAnswered(p.id, p.is_answered)} style={{ padding:"5px 10px",borderRadius:6,border:`1px solid ${p.is_answered?'#7ED4AD':ht.divider}`,background:p.is_answered?'#7ED4AD22':'transparent',fontFamily:ht.ui,fontSize:10,fontWeight:700,color:p.is_answered?'#2E7D5B':ht.muted,cursor:"pointer" }}>
                      {p.is_answered ? "✓ Answered" : "Mark Answered"}
                    </button>
                    <button onClick={() => deletePrayer(p.id)} style={{ padding:"5px 8px",borderRadius:6,border:`1px solid ${ht.divider}`,background:"transparent",fontFamily:ht.ui,fontSize:10,color:"#E8625C",cursor:"pointer" }}>✕</button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}