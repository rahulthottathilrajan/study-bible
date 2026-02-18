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

  useEffect(() => { if (view === "highlights" && user) loadAllHighlights(); }, [view, user, loadAllHighlights]);
  useEffect(() => { if (view === "account" && user) { loadAllHighlights(); loadPrayers(); } }, [view, user, loadAllHighlights, loadPrayers]);

  // ═══ DB & NAVIGATION ═══
  useEffect(() => {
    (async () => {
      try {
        const { data, error } = await supabase.from("books").select("name").limit(1);
        if (data?.length > 0 && !error) {
          setDbLive(true);
          const { data: chapData } = await supabase.from("chapters").select("book_id, chapter_number, books(name)").order("chapter_number");
          if (chapData) {
            const chMap = {};
            chapData.forEach(c => { const n = c.books?.name; if (n) { if (!chMap[n]) chMap[n] = []; chMap[n].push(c.chapter_number); } });
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
          <Label icon="⭐" t={ht} color={ht.muted}>Featured Passages</Label>
          <div style={{ display:"flex",flexDirection:"column",gap:7,marginBottom:26 }}>
            {[
              { bk:"Genesis",ch:1,v:1,t:"In the Beginning",s:"The Creation — 31 verses with Hebrew study",thm:"garden" },
              { bk:"Genesis",ch:1,v:26,t:"Image of God",s:"Let us make man in our image",thm:"garden" },
              { bk:"Genesis",ch:1,v:31,t:"Very Good",s:"God's final evaluation of creation",thm:"garden" },
              { bk:"Genesis",ch:1,v:3,t:"Let There Be Light",s:"God's first spoken word",thm:"garden" },
            ].map((f,i) => {
              const ft = THEMES[f.thm];
              return (
                <button key={i} onClick={() => nav("verse",{book:f.bk,chapter:f.ch,verse:f.v,tab:"study"})} style={{ background:ht.card,border:`1px solid ${ht.divider}`,borderRadius:12,padding:"13px 15px",textAlign:"left",cursor:"pointer",display:"flex",alignItems:"center",gap:13,transition:"all 0.2s",boxShadow:"0 1px 3px rgba(0,0,0,0.04)" }}>
                  <div style={{ width:42,height:42,borderRadius:10,flexShrink:0,background:ft.headerGradient,display:"flex",alignItems:"center",justifyContent:"center",color:ft.headerText,fontFamily:ft.heading,fontSize:16,fontWeight:700 }}>G</div>
                  <div style={{ flex:1 }}>
                    <div style={{ fontFamily:ht.heading,fontSize:14.5,fontWeight:600,color:ht.dark }}>{f.t}</div>
                    <div style={{ fontFamily:ht.ui,fontSize:12,color:ht.muted }}>{f.bk} {f.ch}:{f.v} — {f.s}</div>
                  </div>
                  <div style={{ color:ht.light }}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
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
    return (
      <div style={{ minHeight:"100vh",background:t.bg }}>
        <Header title={book} subtitle={`${bookInfo.original} — ${bookInfo.meaning}`} onBack={() => nav("books",{testament:bookInfo.testament})} />
        <div style={{ padding:"22px 20px 40px",maxWidth:520,margin:"0 auto" }}>
          {bookInfo.author && <Card accent t={t} style={{marginBottom:16}}><div style={{fontFamily:t.ui,fontSize:13.5,color:t.text,lineHeight:1.6}}><strong>Author:</strong> {bookInfo.author} · <strong>Date:</strong> {bookInfo.dateWritten}</div></Card>}
          <Label icon="📋" t={t} color={t.muted}>Select Chapter</Label>
          <div style={{ display:"grid",gridTemplateColumns:"repeat(auto-fill,minmax(52px,1fr))",gap:7 }}>
            {Array.from({length:bookInfo.chapters},(_,i)=>i+1).map(ch => {
              const has = avail.includes(ch);
              return <button key={ch} onClick={()=>{if(has)nav("verses",{chapter:ch,verse:null})}} style={{ background:has?t.card:t.bg,border:has?`1.5px solid ${t.accentBorder}`:`1px solid ${t.divider}`,borderRadius:10,padding:"13px 0",cursor:has?"pointer":"default",fontFamily:t.heading,fontSize:15,fontWeight:has?700:400,color:has?t.dark:t.light,position:"relative",opacity:has?1:0.5,boxShadow:has?"0 2px 6px rgba(0,0,0,0.05)":"none" }}>
                {ch}{has && <div style={{position:"absolute",top:3,right:3,width:6,height:6,borderRadius:"50%",background:t.accent}}/>}
              </button>;
            })}
          </div>
          <div style={{marginTop:16,padding:"10px 14px",background:t.accentLight,borderRadius:8,display:"flex",alignItems:"center",gap:8}}>
            <div style={{width:6,height:6,borderRadius:"50%",background:t.accent}}/><span style={{fontFamily:t.ui,fontSize:12,color:t.muted}}>Colored dots = chapters with study notes</span>
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
          <div style={{display:"flex",flexDirection:"column",gap:6}}>
            {verses.map(v => {
              const hasStudy = v.study_note || v.doctrinal_note;
              const hasOriginal = v.original_text;
              const vWordCount = (wordStudies[v.id] || []).length;
              const vRefCount = (crossRefs[v.id] || []).length;
              return (
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
                    <div style={{
                      fontFamily:t.body,fontSize:14.5,color:t.text,lineHeight:1.65,
                      display:"-webkit-box",WebkitLineClamp:2,WebkitBoxOrient:"vertical",overflow:"hidden"
                    }}>{v.kjv_text}</div>
                    <div style={{display:"flex",gap:6,marginTop:8,flexWrap:"wrap"}}>
                      {hasStudy && <Badge t={t}>Study Notes</Badge>}
                      {hasOriginal && <Badge t={t}>{isOT ? "Hebrew" : "Greek"}</Badge>}
                      {vWordCount > 0 && <Badge t={t}>{vWordCount} Words</Badge>}
                      {vRefCount > 0 && <Badge t={t}>{vRefCount} Refs</Badge>}
                    </div>
                  </div>
                  <div style={{color:t.light,flexShrink:0,alignSelf:"center"}}><ChevIcon /></div>
                </button>
              );
            })}
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

  // ═══ BOTTOM NAV ═══
  const showNav = !["verse","verses"].includes(view);
  const navItems = [
    { id:"home", label:"Home", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg> },
    { id:"books", label:"Books", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg> },
    { id:"highlights", label:"Highlights", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2z"/></svg> },
    { id:"prayer", label:"Prayers", icon: <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg> },
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

      {/* BOTTOM NAV */}
      {showNav && (
        <div style={{ position:"fixed",bottom:0,left:0,right:0,zIndex:50,background:ht.card,borderTop:`1px solid ${ht.divider}`,boxShadow:"0 -2px 12px rgba(0,0,0,0.06)" }}>
          <div style={{ maxWidth:640,margin:"0 auto",display:"flex",justifyContent:"space-around",alignItems:"center",padding:"6px 0 10px" }}>
            {navItems.map(item => {
              const isActive = (item.id === "books" && ["books","chapter"].includes(view)) || (item.id === "prayer" ? false : view === item.id);
              return (
                <button key={item.id} onClick={() => {
                  if (item.id === "prayer") { if (user) setPrayerModal(true); else setAuthModal(true); }
                  else if (item.id === "books") nav("books", { testament: testament || "OT" });
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
                "Freely ye have received, freely give."
              </div>
              <div style={{fontFamily:ht.ui,fontSize:12,color:ht.accent,textAlign:"center",marginTop:4}}>— Matthew 10:8 (KJV)</div>
            </div>

            <div style={{fontFamily:ht.ui,fontSize:13,color:ht.text,lineHeight:1.7,marginBottom:18,textAlign:"center"}}>
              Your support helps us add more books, audio Bible, visual Bible, apologetics resources, and keep everything free for everyone.
            </div>

            {/* Donation amounts */}
            <div style={{display:"flex",flexDirection:"column",gap:8}}>
              {[
                {amount:"$5",label:"Buy us a coffee",icon:"☕"},
                {amount:"$15",label:"Support a chapter",icon:"📖"},
                {amount:"$30",label:"Support a book",icon:"📚"},
                {amount:"$100",label:"Generous blessing",icon:"🙏"},
              ].map((d,i) => (
                <a key={i} href={`https://buy.stripe.com/test_4gM8wH6l4fFC2sFgu90x200`} target="_blank" rel="noopener noreferrer"
                  style={{
                    width:"100%",padding:"14px 18px",borderRadius:12,cursor:"pointer",textAlign:"left",display:"flex",alignItems:"center",justifyContent:"space-between",
                    background:i===2?"linear-gradient(135deg,#D4A853,#B8860B)":ht.card,
                    border:i===2?"none":`1.5px solid ${ht.divider}`,
                    color:i===2?"#fff":ht.dark,
                    boxShadow:i===2?"0 4px 15px rgba(212,168,83,0.3)":"none",
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