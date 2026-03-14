// ═══════════════════════════════════════════════════
// THEME SYSTEM
// ═══════════════════════════════════════════════════
export const THEMES = {
  home: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Outfit',sans-serif", bg:"#FAF6F0", card:"#fff", headerGradient:"linear-gradient(165deg,#1C2B1F 0%,#2D1B4E 50%,#1A2F4B 100%)", headerText:"#F0E8D8", accent:"#D4A853", accentLight:"rgba(212,168,83,0.1)", accentBorder:"rgba(212,168,83,0.25)", dark:"#1C1612", text:"#3A3028", muted:"#7A6B55", light:"#B0A08A", divider:"rgba(180,160,130,0.2)", tabActive:"#2D1B4E", verseNum:"#D4A853", hebrewBg:"rgba(212,168,83,0.08)", stone:"linear-gradient(170deg,#F5EDE0 0%,#EDE3D1 30%,#E8DBCA 60%,#F0E6D6 100%)", stoneEdge:"rgba(180,160,130,0.35)", stoneText:"#2C2418" },
  garden: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Outfit',sans-serif", bg:"#FDF6EE", card:"#fff", headerGradient:"linear-gradient(165deg,#1C2B1F 0%,#2E4A33 100%)", headerText:"#F0E0C8", accent:"#C06C3E", accentLight:"rgba(192,108,62,0.08)", accentBorder:"rgba(192,108,62,0.2)", dark:"#1C2B1F", text:"#3A3028", muted:"#8B7355", light:"#B0A08A", divider:"rgba(180,160,130,0.2)", tabActive:"#2E4A33", verseNum:"#C06C3E", hebrewBg:"#F5EBDD", stone:"linear-gradient(170deg,#F2EBDF 0%,#EAE0D0 30%,#E4D8C6 60%,#ECE4D4 100%)", stoneEdge:"rgba(160,140,110,0.35)", stoneText:"#2A2418" },
  royal: { heading:"'Playfair Display',serif", body:"'Lora',serif", ui:"'Poppins',sans-serif", bg:"#FAF5FF", card:"#fff", headerGradient:"linear-gradient(165deg,#2D1052 0%,#5B2D8E 100%)", headerText:"#E8D5FF", accent:"#8B5CF6", accentLight:"rgba(139,92,246,0.06)", accentBorder:"rgba(139,92,246,0.18)", dark:"#2D1052", text:"#3D2A5C", muted:"#8B72B2", light:"#BBA8D8", divider:"rgba(139,92,246,0.12)", tabActive:"#5B2D8E", verseNum:"#8B5CF6", hebrewBg:"#F0E6FF", stone:"linear-gradient(170deg,#F0EAF5 0%,#E8E0EE 30%,#E2D8E8 60%,#EBE3F0 100%)", stoneEdge:"rgba(139,92,246,0.2)", stoneText:"#2D1B4E" },
  sunrise: { heading:"'DM Serif Display',serif", body:"'Lora',serif", ui:"'Nunito',sans-serif", bg:"#FFF8F0", card:"#fff", headerGradient:"linear-gradient(165deg,#2D1B4E 0%,#4A2D6B 100%)", headerText:"#F8E8D0", accent:"#E8625C", accentLight:"rgba(232,98,92,0.06)", accentBorder:"rgba(232,98,92,0.18)", dark:"#2D1B4E", text:"#4A3B2D", muted:"#8B6B4F", light:"#C0A888", divider:"rgba(232,98,92,0.12)", tabActive:"#4A2D6B", verseNum:"#E8625C", hebrewBg:"#FFF0E0", stone:"linear-gradient(170deg,#F5EDE2 0%,#EDE3D3 30%,#E8DACA 60%,#F0E6D8 100%)", stoneEdge:"rgba(200,160,120,0.3)", stoneText:"#2D1B1A" },
  ocean: { heading:"'Merriweather',serif", body:"'Lora',serif", ui:"'Quicksand',sans-serif", bg:"#F0F7F5", card:"#fff", headerGradient:"linear-gradient(165deg,#1A2F4B 0%,#1B5E5A 100%)", headerText:"#D4F0EB", accent:"#1B7A6E", accentLight:"rgba(27,122,110,0.06)", accentBorder:"rgba(27,122,110,0.18)", dark:"#1A2F4B", text:"#2A4A44", muted:"#5A8A82", light:"#90BAB2", divider:"rgba(27,122,110,0.12)", tabActive:"#1B5E5A", verseNum:"#1B7A6E", hebrewBg:"#E0F2EE", stone:"linear-gradient(170deg,#EDF5F2 0%,#E4EDE9 30%,#DCE6E2 60%,#E8F0EC 100%)", stoneEdge:"rgba(27,122,110,0.2)", stoneText:"#1A2F2B" },
};

export const DARK_THEMES = {
  home: { ...THEMES.home, bg:"#141210", card:"#1E1C18", dark:"#F0E8D8", text:"#D4C8B0", muted:"#9A8B72", light:"#6A5C48", divider:"rgba(180,160,130,0.15)", accentLight:"rgba(212,168,83,0.15)", accentBorder:"rgba(212,168,83,0.3)", hebrewBg:"rgba(212,168,83,0.1)", stone:"linear-gradient(170deg,#2A2520 0%,#252018 30%,#221E16 60%,#282320 100%)", stoneEdge:"rgba(180,160,130,0.2)", stoneText:"#E8DCC8" },
  garden: { ...THEMES.garden, bg:"#121410", card:"#1A1E16", dark:"#F0E0C8", text:"#C8B898", muted:"#9A8468", light:"#6A5C48", divider:"rgba(180,160,130,0.15)", accentLight:"rgba(192,108,62,0.12)", accentBorder:"rgba(192,108,62,0.25)", hebrewBg:"rgba(192,108,62,0.1)", stone:"linear-gradient(170deg,#242820 0%,#202418 30%,#1E2216 60%,#232620 100%)", stoneEdge:"rgba(160,140,110,0.2)", stoneText:"#E0D4C0" },
  royal: { ...THEMES.royal, bg:"#14101E", card:"#1C1828", dark:"#E8D5FF", text:"#C4B0E0", muted:"#8B72B2", light:"#5A4880", divider:"rgba(139,92,246,0.15)", accentLight:"rgba(139,92,246,0.12)", accentBorder:"rgba(139,92,246,0.25)", hebrewBg:"rgba(139,92,246,0.1)", stone:"linear-gradient(170deg,#201828 0%,#1C1624 30%,#1A1420 60%,#1E1826 100%)", stoneEdge:"rgba(139,92,246,0.2)", stoneText:"#D8C8F0" },
  sunrise: { ...THEMES.sunrise, bg:"#161210", card:"#201A16", dark:"#F8E8D0", text:"#D0B898", muted:"#9A7A5A", light:"#6A5840", divider:"rgba(232,98,92,0.15)", accentLight:"rgba(232,98,92,0.1)", accentBorder:"rgba(232,98,92,0.25)", hebrewBg:"rgba(232,98,92,0.1)", stone:"linear-gradient(170deg,#261E18 0%,#221A14 30%,#201812 60%,#241C16 100%)", stoneEdge:"rgba(200,160,120,0.2)", stoneText:"#E0D0B8" },
  ocean: { ...THEMES.ocean, bg:"#0E1614", card:"#14201E", dark:"#D4F0EB", text:"#A0C8C0", muted:"#6A9A90", light:"#4A7068", divider:"rgba(27,122,110,0.15)", accentLight:"rgba(27,122,110,0.1)", accentBorder:"rgba(27,122,110,0.25)", hebrewBg:"rgba(27,122,110,0.1)", stone:"linear-gradient(170deg,#182220 0%,#141E1C 30%,#121C1A 60%,#162020 100%)", stoneEdge:"rgba(27,122,110,0.2)", stoneText:"#C8E0D8" },
};

export const CATEGORY_THEME = { "Pentateuch":"garden","Historical":"garden","Wisdom":"royal","Major Prophets":"sunrise","Minor Prophets":"sunrise","Gospels":"ocean","Pauline Epistles":"royal","Pastoral Epistles":"royal","General Epistles":"royal","Prophecy":"sunrise" };

export const BIBLE_BOOKS = [
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

export const CAT_ICONS = { "Pentateuch":"📜","Historical":"⚔️","Wisdom":"💎","Major Prophets":"🔥","Minor Prophets":"📢","Gospels":"✝️","Pauline Epistles":"✉️","Pastoral Epistles":"📋","General Epistles":"📖","Prophecy":"👁️" };
export const HIGHLIGHT_COLORS = ["#FFD700","#FF9B71","#7ED4AD","#82B1FF","#CE93D8","#F48FB1"];

export const CHAPTER_GROUPS = {
  "Genesis": [
    { label:"Creation & Eden", icon:"🌿", chapters:[1,2] },
    { label:"The Fall & Its Consequences", icon:"🍎", chapters:[3,4,5] },
    { label:"The Flood & New Beginning", icon:"🌊", chapters:[6,7,8,9] },
    { label:"The Nations Scatter", icon:"🗼", chapters:[10,11] },
    { label:"Abraham — Father of Faith", icon:"⭐", chapters:[12,13,14,15,16,17,18,19,20,21,22,23,24,25] },
    { label:"Isaac & Jacob — The Promise Continues", icon:"🏕️", chapters:[26,27,28,29,30,31,32,33,34,35,36] },
    { label:"Joseph — Providence & Redemption", icon:"👑", chapters:[37,38,39,40,41,42,43,44,45,46,47,48,49,50] },
  ],
  "Exodus": [
    { label:"Israel in Egypt", icon:"⛓️", chapters:[1,2] },
    { label:"The Call of Moses", icon:"🔥", chapters:[3,4,5,6] },
    { label:"The Ten Plagues", icon:"🪲", chapters:[7,8,9,10,11,12] },
    { label:"The Exodus & Wilderness Journey", icon:"🏜️", chapters:[13,14,15,16,17,18] },
    { label:"The Law at Sinai", icon:"📜", chapters:[19,20,21,22,23,24] },
    { label:"The Tabernacle — God Dwells Among Us", icon:"🕍", chapters:[25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40] },
  ],
  "Leviticus": [
    { label:"The Offerings & Sacrifices", icon:"🔥", chapters:[1,2,3,4,5,6,7] },
    { label:"The Consecration of the Priesthood", icon:"✨", chapters:[8,9,10] },
    { label:"Laws of Purity", icon:"🧼", chapters:[11,12,13,14,15] },
    { label:"The Day of Atonement", icon:"⚖️", chapters:[16] },
    { label:"The Holiness Code", icon:"👑", chapters:[17,18,19,20,21,22,23,24,25,26,27] },
  ],
  "Numbers": [
    { label:"The Census & Preparation", icon:"📊", chapters:[1,2,3,4,5,6,7,8,9,10] },
    { label:"Journey from Sinai — Rebellion & Wandering", icon:"🏜️", chapters:[11,12,13,14,15,16,17,18,19,20,21] },
    { label:"Balaam & the Plains of Moab", icon:"🐴", chapters:[22,23,24,25] },
    { label:"Preparation for Canaan", icon:"🗺️", chapters:[26,27,28,29,30,31,32,33,34,35,36] },
  ],
  "Deuteronomy": [
    { label:"First Address — History Recalled", icon:"📖", chapters:[1,2,3,4] },
    { label:"Second Address — The Law Renewed", icon:"📜", chapters:[5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26] },
    { label:"Third Address — Covenant Renewal", icon:"✝️", chapters:[27,28,29,30] },
    { label:"Farewell & the Death of Moses", icon:"🕊️", chapters:[31,32,33,34] },
  ],
  "Joshua": [
    { label:"Preparation & Crossing the Jordan", icon:"🌊", chapters:[1,2,3,4,5] },
    { label:"The Conquest of Canaan", icon:"⚔️", chapters:[6,7,8,9,10,11,12] },
    { label:"Division of the Land", icon:"🗺️", chapters:[13,14,15,16,17,18,19,20,21] },
    { label:"Final Challenges & Covenant Renewal", icon:"🤝", chapters:[22,23,24] },
  ],
  "Judges": [
    { label:"Introduction — A Pattern of Failure", icon:"📉", chapters:[1,2,3] },
    { label:"The Major Judges", icon:"⚔️", chapters:[4,5,6,7,8,9,10,11,12] },
    { label:"Samson — Strength & Weakness", icon:"💪", chapters:[13,14,15,16] },
    { label:"Appendices — The Depths of Depravity", icon:"⚠️", chapters:[17,18,19,20,21] },
  ],
  "Ruth": [
    { label:"Naomi's Loss & Ruth's Loyalty", icon:"💔", chapters:[1] },
    { label:"Ruth Meets Boaz", icon:"🌾", chapters:[2,3] },
    { label:"Redemption & Restoration", icon:"💍", chapters:[4] },
  ],
  "1 Samuel": [
    { label:"Samuel — Judge & Prophet", icon:"📯", chapters:[1,2,3,4,5,6,7] },
    { label:"The King Demanded", icon:"👑", chapters:[8,9,10,11,12] },
    { label:"Saul's Reign & Rejection", icon:"📉", chapters:[13,14,15] },
    { label:"David's Rise", icon:"⭐", chapters:[16,17,18,19,20] },
    { label:"David as Fugitive", icon:"🏃", chapters:[21,22,23,24,25,26,27] },
    { label:"Saul's End", icon:"🕊️", chapters:[28,29,30,31] },
  ],
  "2 Samuel": [
    { label:"David — King of Judah", icon:"👑", chapters:[1,2,3,4] },
    { label:"David — King of All Israel", icon:"⭐", chapters:[5,6,7,8,9,10] },
    { label:"David's Sin & Its Consequences", icon:"⚠️", chapters:[11,12,13,14,15,16,17,18,19,20] },
    { label:"Appendices", icon:"📋", chapters:[21,22,23,24] },
  ],
  "1 Kings": [
    { label:"Solomon's Golden Reign", icon:"✨", chapters:[1,2,3,4,5,6,7,8,9,10,11] },
    { label:"The Kingdom Divided", icon:"💔", chapters:[12,13,14,15,16] },
    { label:"Elijah & the Contest with Baal", icon:"🔥", chapters:[17,18,19,20,21,22] },
  ],
  "2 Kings": [
    { label:"Elisha's Ministry", icon:"✨", chapters:[1,2,3,4,5,6,7,8] },
    { label:"The Fall of the Northern Kingdom", icon:"📉", chapters:[9,10,11,12,13,14,15,16,17] },
    { label:"Hezekiah & Josiah — Revival & Reform", icon:"🙏", chapters:[18,19,20,21,22,23] },
    { label:"The Fall of Jerusalem", icon:"💔", chapters:[24,25] },
  ],
  "1 Chronicles": [
    { label:"Genealogies — The Line of Promise", icon:"📜", chapters:[1,2,3,4,5,6,7,8,9] },
    { label:"The End of Saul", icon:"⚔️", chapters:[10] },
    { label:"David's Kingdom & Preparations for the Temple", icon:"👑", chapters:[11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29] },
  ],
  "2 Chronicles": [
    { label:"Solomon & the Temple", icon:"🕍", chapters:[1,2,3,4,5,6,7,8,9] },
    { label:"The Kings of Judah", icon:"👑", chapters:[10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36] },
  ],
  "Ezra": [
    { label:"Return from Exile", icon:"🏠", chapters:[1,2] },
    { label:"Rebuilding the Temple", icon:"🕍", chapters:[3,4,5,6] },
    { label:"Ezra's Return & Reform", icon:"📜", chapters:[7,8,9,10] },
  ],
  "Nehemiah": [
    { label:"Rebuilding the Walls", icon:"🧱", chapters:[1,2,3,4,5,6,7] },
    { label:"Covenant Renewal & The Law", icon:"📜", chapters:[8,9,10] },
    { label:"Community Life & Final Reforms", icon:"🏘️", chapters:[11,12,13] },
  ],
  "Esther": [
    { label:"Esther Becomes Queen", icon:"👑", chapters:[1,2] },
    { label:"Haman's Plot Against the Jews", icon:"⚠️", chapters:[3,4,5] },
    { label:"The Tables Turn", icon:"⚖️", chapters:[6,7,8] },
    { label:"Victory & the Feast of Purim", icon:"🎉", chapters:[9,10] },
  ],
  "Job": [
    { label:"Prologue — The Testing Begins", icon:"⚡", chapters:[1,2] },
    { label:"Job's Lament", icon:"💔", chapters:[3] },
    { label:"First Cycle of Speeches", icon:"🗣️", chapters:[4,5,6,7,8,9,10,11,12,13,14] },
    { label:"Second Cycle of Speeches", icon:"🗣️", chapters:[15,16,17,18,19,20,21] },
    { label:"Third Cycle of Speeches", icon:"🗣️", chapters:[22,23,24,25,26,27,28,29,30,31] },
    { label:"Elihu Speaks", icon:"💨", chapters:[32,33,34,35,36,37] },
    { label:"God Answers from the Whirlwind", icon:"🌪️", chapters:[38,39,40,41] },
    { label:"Epilogue — Restoration", icon:"🌅", chapters:[42] },
  ],
  "Psalms": [
    { label:"Book I — Psalms of David", icon:"🎵", chapters:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41] },
    { label:"Book II — The Exodus Psalms", icon:"🎵", chapters:[42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72] },
    { label:"Book III — Psalms of Asaph", icon:"🎵", chapters:[73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89] },
    { label:"Book IV — Moses & the Wilderness", icon:"🎵", chapters:[90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106] },
    { label:"Book V — Psalms of Ascent & Praise", icon:"🎵", chapters:[107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150] },
  ],
  "Proverbs": [
    { label:"In Praise of Wisdom", icon:"💡", chapters:[1,2,3,4,5,6,7,8,9] },
    { label:"Solomon's Proverbs I", icon:"📖", chapters:[10,11,12,13,14,15,16,17,18,19,20,21,22] },
    { label:"Sayings of the Wise", icon:"🗣️", chapters:[22,23,24] },
    { label:"Solomon's Proverbs II", icon:"📖", chapters:[25,26,27,28,29] },
    { label:"Agur & Lemuel — A Mother's Wisdom", icon:"👑", chapters:[30,31] },
  ],
  "Ecclesiastes": [
    { label:"Vanity of All Things", icon:"💨", chapters:[1,2] },
    { label:"Cycles, Seasons & Injustice", icon:"🔄", chapters:[3,4,5] },
    { label:"Observations on Life", icon:"👁️", chapters:[6,7,8] },
    { label:"Youth, Age & the Final Verdict", icon:"⏳", chapters:[9,10,11,12] },
  ],
  "Song of Solomon": [
    { label:"The Beloved's Longing", icon:"🌹", chapters:[1,2] },
    { label:"Seeking & Finding", icon:"❤️", chapters:[3,4,5] },
    { label:"Reunion, Beauty & Love's Triumph", icon:"🕊️", chapters:[6,7,8] },
  ],
  "Isaiah": [
    { label:"Book of Judgment — Woe to the Nations", icon:"⚖️", chapters:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39] },
    { label:"Book of Comfort — The Servant of the Lord", icon:"🕊️", chapters:[40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55] },
    { label:"Book of Glory — The New Creation", icon:"🌅", chapters:[56,57,58,59,60,61,62,63,64,65,66] },
  ],
  "Jeremiah": [
    { label:"Early Ministry & Call", icon:"📯", chapters:[1,2,3,4,5,6] },
    { label:"Temple Sermon & Conflict", icon:"🏛️", chapters:[7,8,9,10,11,12,13,14,15,16,17,18,19,20] },
    { label:"Kings, False Prophets & Exile", icon:"👑", chapters:[21,22,23,24,25,26,27,28,29] },
    { label:"The Book of Consolation", icon:"🌅", chapters:[30,31,32,33] },
    { label:"Judah's Last Days", icon:"📉", chapters:[34,35,36,37,38,39,40,41,42,43,44,45] },
    { label:"Oracles Against the Nations", icon:"⚡", chapters:[46,47,48,49,50,51] },
    { label:"The Fall of Jerusalem", icon:"💔", chapters:[52] },
  ],
  "Lamentations": [
    { label:"The Desolate City", icon:"💔", chapters:[1] },
    { label:"The Lord's Anger", icon:"⚡", chapters:[2] },
    { label:"Hope in the Midst of Suffering", icon:"🌅", chapters:[3] },
    { label:"Zion's Plea", icon:"🙏", chapters:[4] },
    { label:"Prayer for Restoration", icon:"🕊️", chapters:[5] },
  ],
  "Ezekiel": [
    { label:"Judgment on Jerusalem", icon:"⚡", chapters:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24] },
    { label:"Judgment on the Nations", icon:"⚖️", chapters:[25,26,27,28,29,30,31,32] },
    { label:"Restoration of Israel — Dry Bones", icon:"🦴", chapters:[33,34,35,36,37,38,39] },
    { label:"The New Temple & New City", icon:"🕍", chapters:[40,41,42,43,44,45,46,47,48] },
  ],
  "Daniel": [
    { label:"Stories at the Babylonian Court", icon:"🦁", chapters:[1,2,3,4,5,6] },
    { label:"Visions of Empires & the End", icon:"🔭", chapters:[7,8,9,10,11,12] },
  ],
  "Hosea": [
    { label:"Hosea's Marriage — A Living Parable", icon:"💍", chapters:[1,2,3] },
    { label:"Israel's Unfaithfulness", icon:"💔", chapters:[4,5,6,7,8,9,10] },
    { label:"God's Persistent Love", icon:"❤️", chapters:[11,12,13,14] },
  ],
  "Joel": [
    { label:"The Locust Plague — A Call to Repentance", icon:"🪲", chapters:[1] },
    { label:"The Day of the Lord", icon:"⚡", chapters:[2] },
    { label:"Restoration & the Spirit Poured Out", icon:"🌅", chapters:[3] },
  ],
  "Amos": [
    { label:"Oracles Against the Nations", icon:"⚡", chapters:[1,2] },
    { label:"Sermons Against Israel", icon:"📯", chapters:[3,4,5,6] },
    { label:"Five Visions of Judgment & Hope", icon:"👁️", chapters:[7,8,9] },
  ],
  "Obadiah": [{ label:"Judgment on Edom — Pride Before the Fall", icon:"⚖️", chapters:[1] }],
  "Jonah": [
    { label:"Running from God", icon:"🚢", chapters:[1] },
    { label:"Prayer from the Belly of the Fish", icon:"🐋", chapters:[2] },
    { label:"Nineveh Repents", icon:"🙏", chapters:[3] },
    { label:"Jonah's Anger & God's Compassion", icon:"😤", chapters:[4] },
  ],
  "Micah": [
    { label:"Judgment on Israel & Judah", icon:"⚡", chapters:[1,2,3] },
    { label:"The Future King from Bethlehem", icon:"⭐", chapters:[4,5] },
    { label:"The Covenant Lawsuit & God's Mercy", icon:"⚖️", chapters:[6,7] },
  ],
  "Nahum": [
    { label:"God's Majesty & Nineveh's Doom", icon:"⚡", chapters:[1] },
    { label:"The Fall of Nineveh Described", icon:"🏙️", chapters:[2] },
    { label:"The Cause of Nineveh's Ruin", icon:"⚖️", chapters:[3] },
  ],
  "Habakkuk": [
    { label:"The Prophet's Complaint & God's Answer", icon:"❓", chapters:[1,2] },
    { label:"The Prophet's Prayer of Trust", icon:"🙏", chapters:[3] },
  ],
  "Zephaniah": [
    { label:"The Day of the Lord — Universal Judgment", icon:"⚡", chapters:[1,2] },
    { label:"Woe & the Promise of Restoration", icon:"🌅", chapters:[3] },
  ],
  "Haggai": [
    { label:"Call to Rebuild the Temple", icon:"🕍", chapters:[1] },
    { label:"The Glory of the New Temple", icon:"✨", chapters:[2] },
  ],
  "Zechariah": [
    { label:"Eight Night Visions", icon:"🌙", chapters:[1,2,3,4,5,6] },
    { label:"Questions on Fasting & Future Glory", icon:"🙏", chapters:[7,8] },
    { label:"Two Burdens — The Coming King & His Kingdom", icon:"👑", chapters:[9,10,11,12,13,14] },
  ],
  "Malachi": [
    { label:"God's Love Questioned", icon:"❓", chapters:[1] },
    { label:"Priests & People Rebuked", icon:"⚠️", chapters:[2] },
    { label:"Justice, Tithing & the Faithful Remnant", icon:"⚖️", chapters:[3] },
    { label:"The Coming Day of the Lord", icon:"☀️", chapters:[4] },
  ],
  "Matthew": [
    { label:"Birth, Baptism & Temptation", icon:"⭐", chapters:[1,2,3,4] },
    { label:"The Sermon on the Mount", icon:"⛰️", chapters:[5,6,7] },
    { label:"Ministry & Miracles in Galilee", icon:"✨", chapters:[8,9,10,11,12] },
    { label:"Parables of the Kingdom", icon:"🌱", chapters:[13] },
    { label:"Growing Opposition", icon:"⚠️", chapters:[14,15,16,17] },
    { label:"Teaching on the Church & Kingdom", icon:"🏛️", chapters:[18,19,20] },
    { label:"Jerusalem — Confrontation & Olivet Discourse", icon:"🏙️", chapters:[21,22,23,24,25] },
    { label:"Passion, Death & Resurrection", icon:"✝️", chapters:[26,27,28] },
  ],
  "Mark": [
    { label:"The Beginning of the Gospel", icon:"🚀", chapters:[1,2,3] },
    { label:"Teaching, Miracles & Growing Faith", icon:"✨", chapters:[4,5,6,7,8] },
    { label:"The Road to Jerusalem", icon:"🛤️", chapters:[8,9,10] },
    { label:"Jerusalem Ministry & Olivet Discourse", icon:"🏙️", chapters:[11,12,13] },
    { label:"Passion, Death & Resurrection", icon:"✝️", chapters:[14,15,16] },
  ],
  "Luke": [
    { label:"Birth & Preparation", icon:"⭐", chapters:[1,2,3,4] },
    { label:"Galilean Ministry", icon:"🌊", chapters:[5,6,7,8,9] },
    { label:"The Journey to Jerusalem", icon:"🛤️", chapters:[10,11,12,13,14,15,16,17,18,19] },
    { label:"Jerusalem — Teaching & Conflict", icon:"🏙️", chapters:[20,21] },
    { label:"Passion, Death & Resurrection", icon:"✝️", chapters:[22,23,24] },
  ],
  "John": [
    { label:"The Word Made Flesh & First Signs", icon:"💡", chapters:[1,2,3,4] },
    { label:"Growing Faith & Deepening Conflict", icon:"⚔️", chapters:[5,6,7,8,9,10] },
    { label:"The Road to the Cross", icon:"🛤️", chapters:[11,12] },
    { label:"The Upper Room Discourse", icon:"🍞", chapters:[13,14,15,16,17] },
    { label:"Passion, Death & Resurrection", icon:"✝️", chapters:[18,19,20,21] },
  ],
  "Acts": [
    { label:"Jerusalem — Pentecost & the Early Church", icon:"🔥", chapters:[1,2,3,4,5,6,7] },
    { label:"Judea, Samaria & the Gentiles", icon:"🌍", chapters:[8,9,10,11,12] },
    { label:"Paul's First Missionary Journey", icon:"🚢", chapters:[13,14,15] },
    { label:"Paul's Second Journey — Europe Reached", icon:"🗺️", chapters:[16,17,18] },
    { label:"Paul's Third Journey — Ephesus", icon:"🏛️", chapters:[19,20,21] },
    { label:"Paul's Arrest, Trials & Defence", icon:"⚖️", chapters:[22,23,24,25,26] },
    { label:"Shipwreck & Arrival in Rome", icon:"🚢", chapters:[27,28] },
  ],
  "Romans": [
    { label:"The Problem — All Have Sinned", icon:"⚠️", chapters:[1,2,3] },
    { label:"The Solution — Justification by Faith", icon:"✝️", chapters:[4,5] },
    { label:"Sanctification — Dead to Sin, Alive to God", icon:"🕊️", chapters:[6,7,8] },
    { label:"Israel & the Mystery of the Gospel", icon:"🔭", chapters:[9,10,11] },
    { label:"Living the Gospel — Ethics & Love", icon:"❤️", chapters:[12,13,14,15,16] },
  ],
  "1 Corinthians": [
    { label:"Divisions & the Wisdom of the Cross", icon:"✝️", chapters:[1,2,3,4] },
    { label:"Sexual Ethics & Marriage", icon:"🤝", chapters:[5,6,7] },
    { label:"Christian Freedom & Worship", icon:"🙏", chapters:[8,9,10,11] },
    { label:"Spiritual Gifts & the Body of Christ", icon:"✨", chapters:[12,13,14] },
    { label:"The Resurrection — Everything Hangs on This", icon:"🌅", chapters:[15] },
    { label:"Closing Instructions", icon:"📝", chapters:[16] },
  ],
  "2 Corinthians": [
    { label:"Paul's Ministry — Suffering & Comfort", icon:"💪", chapters:[1,2,3,4,5,6,7] },
    { label:"The Collection — Generosity & Grace", icon:"🤲", chapters:[8,9] },
    { label:"Paul's Defence of His Apostleship", icon:"⚔️", chapters:[10,11,12,13] },
  ],
  "Galatians": [
    { label:"The Gospel Defended — No Other Gospel", icon:"📯", chapters:[1,2] },
    { label:"Faith vs. Law — Children of Abraham", icon:"⚖️", chapters:[3,4] },
    { label:"Life in the Spirit — Freedom & Fruit", icon:"🕊️", chapters:[5,6] },
  ],
  "Ephesians": [
    { label:"The Church's Calling — Seated in the Heavenlies", icon:"✨", chapters:[1,2,3] },
    { label:"The Church's Walk — Unity, Holiness & Armour", icon:"⚔️", chapters:[4,5,6] },
  ],
  "Philippians": [
    { label:"Joy in Chains — Christ is Gain", icon:"🎵", chapters:[1] },
    { label:"The Mind of Christ — Humility", icon:"🙇", chapters:[2] },
    { label:"Righteousness by Faith Alone", icon:"✝️", chapters:[3] },
    { label:"Peace, Contentment & Provision", icon:"🕊️", chapters:[4] },
  ],
  "Colossians": [
    { label:"Christ the Head — Supreme over All", icon:"👑", chapters:[1,2] },
    { label:"Life in Christ — Old Self & New", icon:"✨", chapters:[3,4] },
  ],
  "1 Thessalonians": [
    { label:"Paul's Thanksgiving & Defence", icon:"🙏", chapters:[1,2,3] },
    { label:"Holy Living & the Coming of Christ", icon:"⭐", chapters:[4,5] },
  ],
  "2 Thessalonians": [
    { label:"Encouragement in Persecution", icon:"💪", chapters:[1] },
    { label:"The Man of Lawlessness", icon:"⚠️", chapters:[2] },
    { label:"Final Instructions", icon:"📝", chapters:[3] },
  ],
  "1 Timothy": [
    { label:"Sound Doctrine & Prayer", icon:"🙏", chapters:[1,2] },
    { label:"Church Leadership — Overseers & Deacons", icon:"🏛️", chapters:[3] },
    { label:"Timothy's Charge — Godliness & Contentment", icon:"📯", chapters:[4,5,6] },
  ],
  "2 Timothy": [
    { label:"Unashamed of the Gospel", icon:"🔥", chapters:[1,2] },
    { label:"The Final Charge — Preach the Word", icon:"📯", chapters:[3,4] },
  ],
  "Titus": [
    { label:"Church Order & Sound Doctrine", icon:"🏛️", chapters:[1,2] },
    { label:"Grace That Transforms — Good Works", icon:"✨", chapters:[3] },
  ],
  "Philemon": [{ label:"Appeal for Onesimus — A Picture of Grace", icon:"🤝", chapters:[1] }],
  "Hebrews": [
    { label:"Christ Superior to Angels & Moses", icon:"✨", chapters:[1,2,3,4] },
    { label:"Christ Our Great High Priest", icon:"🙏", chapters:[5,6,7] },
    { label:"The New Covenant — Better Promises", icon:"✝️", chapters:[8,9,10] },
    { label:"The Hall of Faith", icon:"⭐", chapters:[11,12] },
    { label:"Final Exhortations", icon:"📝", chapters:[13] },
  ],
  "James": [
    { label:"Trials, Wisdom & the Word", icon:"💡", chapters:[1] },
    { label:"Faith & Works — Show Me Your Faith", icon:"⚖️", chapters:[2] },
    { label:"Taming the Tongue", icon:"🗣️", chapters:[3] },
    { label:"Worldliness, Pride & Submission", icon:"🙇", chapters:[4] },
    { label:"Patience, Prayer & Restoration", icon:"🙏", chapters:[5] },
  ],
  "1 Peter": [
    { label:"Living Hope — A Holy People", icon:"🌅", chapters:[1,2] },
    { label:"Suffering for Righteousness — Following Christ", icon:"✝️", chapters:[3,4,5] },
  ],
  "2 Peter": [
    { label:"Growth in Grace — Make Your Calling Sure", icon:"🌱", chapters:[1] },
    { label:"False Teachers — Destructive Heresies", icon:"⚠️", chapters:[2] },
    { label:"The Day of the Lord — New Heavens & Earth", icon:"🌅", chapters:[3] },
  ],
  "1 John": [
    { label:"Walking in the Light", icon:"💡", chapters:[1,2] },
    { label:"Children of God — Love One Another", icon:"❤️", chapters:[3,4] },
    { label:"Faith, Assurance & Eternal Life", icon:"✝️", chapters:[5] },
  ],
  "2 John": [{ label:"Truth & Love — Walk in His Commands", icon:"❤️", chapters:[1] }],
  "3 John": [{ label:"Hospitality, Truth & a Warning", icon:"🤝", chapters:[1] }],
  "Jude": [{ label:"Contend Earnestly for the Faith", icon:"⚔️", chapters:[1] }],
  "Revelation": [
    { label:"Letters to the Seven Churches", icon:"✉️", chapters:[1,2,3] },
    { label:"The Throne Room of Heaven", icon:"✨", chapters:[4,5] },
    { label:"The Seven Seals", icon:"📜", chapters:[6,7] },
    { label:"The Seven Trumpets", icon:"📯", chapters:[8,9,10,11] },
    { label:"Cosmic War — The Dragon & the Lamb", icon:"🐉", chapters:[12,13,14] },
    { label:"The Seven Bowls of Wrath", icon:"⚡", chapters:[15,16] },
    { label:"Babylon Falls — The Wedding Supper", icon:"🎉", chapters:[17,18,19] },
    { label:"The New Creation — All Things New", icon:"🌅", chapters:[20,21,22] },
  ],
};

// ═══════════════════════════════════════════════════
// GAMIFICATION — BADGES
// ═══════════════════════════════════════════════════
export const BADGE_CATEGORIES = [
  { id:"bible",  label:"Bible",  icon:"📖" },
  { id:"hebrew", label:"Hebrew", icon:"📜" },
  { id:"greek",  label:"Greek",  icon:"📘" },
  { id:"learn",  label:"Learn",  icon:"📚" },
  { id:"prayer", label:"Prayer", icon:"🙏" },
  { id:"audio",  label:"Audio",  icon:"🎧" },
  { id:"podcast", label:"Podcast", icon:"🎙️" },
  { id:"community", label:"Community", icon:"🤝" },
];

export const BADGES = [
  // Bible (12)
  { id:"first_light",   category:"bible",  name:"First Light",       icon:"🕯️", description:"Read your first chapter" },
  { id:"bookworm",      category:"bible",  name:"Bookworm",          icon:"📚", description:"Read 10 chapters" },
  { id:"scholar",       category:"bible",  name:"Scholar",           icon:"🎓", description:"Read 50 chapters" },
  { id:"highlighter",   category:"bible",  name:"Highlighter",       icon:"🖍️", description:"Highlight 10 verses" },
  { id:"color_palette", category:"bible",  name:"Color Palette",     icon:"🎨", description:"Use all 5 highlight colors" },
  { id:"scribe",        category:"bible",  name:"Scribe",            icon:"✍️", description:"Write 10 notes" },
  { id:"bookmarker",    category:"bible",  name:"Bookmarker",        icon:"🔖", description:"Bookmark 25 verses" },
  { id:"devoted",       category:"bible",  name:"Devoted",           icon:"🔥", description:"30-day reading streak" },
  { id:"quiz_starter",  category:"bible",  name:"Quiz Starter",      icon:"📝", description:"Complete your first chapter quiz" },
  { id:"quiz_whiz",     category:"bible",  name:"Quiz Whiz",         icon:"🧠", description:"Complete 10 chapter quizzes" },
  { id:"perfect_score", category:"bible",  name:"Perfect Score",     icon:"💯", description:"Get 100% on a chapter quiz" },
  { id:"quiz_master",   category:"bible",  name:"Quiz Master",       icon:"🏆", description:"Complete 50 chapter quizzes" },
  // Hebrew (4)
  { id:"aleph",          category:"hebrew", name:"Aleph",             icon:"א",  description:"Complete your first Hebrew lesson" },
  { id:"aleph_bet",      category:"hebrew", name:"Aleph-Bet Master",  icon:"📜", description:"Complete all alphabet lessons" },
  { id:"hebrew_scholar", category:"hebrew", name:"Hebrew Scholar",    icon:"🕎", description:"Complete all Hebrew lessons" },
  { id:"perfect_hebrew", category:"hebrew", name:"Perfect Hebrew",    icon:"💯", description:"Score 100% on a Hebrew practice" },
  // Greek (4)
  { id:"alpha",          category:"greek",  name:"Alpha",             icon:"A",  description:"Complete your first Greek lesson" },
  { id:"alpha_omega",    category:"greek",  name:"Alpha-Omega Master",icon:"🏛️", description:"Complete all alphabet lessons" },
  { id:"greek_scholar",  category:"greek",  name:"Greek Scholar",     icon:"📘", description:"Complete all Greek lessons" },
  { id:"perfect_greek",  category:"greek",  name:"Perfect Greek",     icon:"💯", description:"Score 100% on a Greek practice" },
  // Learn (4)
  { id:"time_traveler",  category:"learn",  name:"Time Traveler",     icon:"⏳", description:"Explore your first timeline era" },
  { id:"historian",      category:"learn",  name:"Historian",         icon:"📅", description:"Explore all 14 timeline eras" },
  { id:"prophet",        category:"learn",  name:"Prophet",           icon:"🔭", description:"Read 10 prophecies" },
  { id:"archaeologist",  category:"learn",  name:"Archaeologist",     icon:"⛏️", description:"View 5 archaeology cards" },
  // Prayer (4)
  { id:"intercessor",       category:"prayer", name:"Intercessor",       icon:"🙏", description:"React to 10 community prayers" },
  { id:"prayer_warrior",    category:"prayer", name:"Prayer Warrior",    icon:"⚔️", description:"Complete 5 prayer slots" },
  { id:"testimony",         category:"prayer", name:"Testimony",         icon:"✝️", description:"Share your first testimony" },
  { id:"community_builder", category:"prayer", name:"Community Builder", icon:"🤝", description:"Post 5 prayer requests" },
  // Audio (3)
  { id:"first_listen",    category:"audio", name:"First Listen",    icon:"🎧", description:"Listen to your first chapter" },
  { id:"audio_scholar",   category:"audio", name:"Audio Scholar",   icon:"📻", description:"Listen to 10 chapters" },
  { id:"audio_marathon",  category:"audio", name:"Audio Marathon",  icon:"🏅", description:"Listen to 50 chapters" },
  // Podcast (4)
  { id:"first_listen_podcast", category:"podcast", name:"First Episode",    icon:"🎙️", description:"Listen to your first podcast episode" },
  { id:"podcast_regular",      category:"podcast", name:"Regular Listener", icon:"📻", description:"Listen to 7 podcast episodes" },
  { id:"podcast_devotee",      category:"podcast", name:"Devotee",          icon:"🏅", description:"Listen to 30 podcast episodes" },
  { id:"podcast_noter",        category:"podcast", name:"Note Taker",       icon:"📝", description:"Write your first podcast note" },
  // Teens (4)
  { id:"first_lesson_teen", category:"learn", name:"First Lesson",     icon:"\uD83D\uDCD6", description:"Complete your first teens lesson" },
  { id:"term_complete_teen",category:"learn", name:"Term Complete",    icon:"\uD83C\uDFAF", description:"Complete all 13 lessons in a term" },
  { id:"journaler",         category:"learn", name:"Journaler",        icon:"\uD83D\uDCD3", description:"Write 10 journal entries" },
  { id:"graduate_teen",     category:"learn", name:"Graduate",         icon:"\uD83C\uDF93", description:"Complete all 52 teens lessons" },
  // Community (1)
  { id:"birthday_blessed", category:"community", name:"Birthday Blessed", icon:"🎂", description:"Open the app on your birthday" },
];

// ═══════════════════════════════════════════════════
// BIRTHDAY BLESSING VERSES (KJV)
// ═══════════════════════════════════════════════════
export const BIRTHDAY_VERSES = [
  { ref: "Jeremiah 29:11", text: "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end." },
  { ref: "Psalm 139:14", text: "I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well." },
  { ref: "Numbers 6:24-26", text: "The LORD bless thee, and keep thee: The LORD make his face shine upon thee, and be gracious unto thee: The LORD lift up his countenance upon thee, and give thee peace." },
  { ref: "Psalm 118:24", text: "This is the day which the LORD hath made; we will rejoice and be glad in it." },
  { ref: "Psalm 20:4", text: "Grant thee according to thine own heart, and fulfil all thy counsel." },
  { ref: "Psalm 37:4", text: "Delight thyself also in the LORD; and he shall give thee the desires of thine heart." },
  { ref: "Psalm 90:12", text: "So teach us to number our days, that we may apply our hearts unto wisdom." },
  { ref: "Proverbs 9:11", text: "For by me thy days shall be multiplied, and the years of thy life shall be increased." },
  { ref: "Lamentations 3:22-23", text: "It is of the LORD's mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness." },
  { ref: "Psalm 91:16", text: "With long life will I satisfy him, and shew him my salvation." },
  { ref: "3 John 1:2", text: "Beloved, I wish above all things that thou mayest prosper and be in health, even as thy soul prospereth." },
  { ref: "Isaiah 46:4", text: "And even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you." },
];

// ═══════════════════════════════════════════════════
// BIBLE TRANSLATIONS (multilingual CDN)
// ═══════════════════════════════════════════════════
export const BIBLE_TRANSLATIONS = [
  { id: "kjv", label: "KJV", name: "King James Version", lang: "English", group: "English", local: true },
  { id: "bsb", label: "BSB", name: "Berean Standard Bible", lang: "English", group: "English", cdnId: "bsb" },
  { id: "HINIRV", label: "\u0939\u093F\u0928\u094D\u0926\u0940", name: "Hindi IRV", lang: "Hindi", group: "Indian", cdnId: "HINIRV" },
  { id: "mal_irv", label: "\u0D2E\u0D32\u0D2F\u0D3E\u0D33\u0D02", name: "Malayalam IRV", lang: "Malayalam", group: "Indian", cdnId: "mal_irv" },
  { id: "tam_irv", label: "\u0BA4\u0BAE\u0BBF\u0BB4\u0BCD", name: "Tamil IRV", lang: "Tamil", group: "Indian", cdnId: "tam_irv" },
  { id: "tel_irv", label: "\u0C24\u0C46\u0C32\u0C41\u0C17\u0C41", name: "Telugu IRV", lang: "Telugu", group: "Indian", cdnId: "tel_irv" },
  { id: "kan_irv", label: "\u0C95\u0CA8\u0CCD\u0CA8\u0CA1", name: "Kannada IRV", lang: "Kannada", group: "Indian", cdnId: "kan_irv" },
  { id: "fra_lsg", label: "Fran\u00E7ais", name: "Louis Segond 1910", lang: "French", group: "International", cdnId: "fra_lsg" },
  { id: "spa_r09", label: "Espa\u00F1ol", name: "Reina Valera 1909", lang: "Spanish", group: "International", cdnId: "spa_r09" },
  { id: "cmn_cu1", label: "\u4E2D\u6587", name: "Chinese Union Version", lang: "Chinese", group: "International", cdnId: "cmn_cu1" },
  { id: "ARBNAV", label: "\u0627\u0644\u0639\u0631\u0628\u064A\u0629", name: "New Arabic Version", lang: "Arabic", group: "International", cdnId: "ARBNAV", rtl: true },
];

export const CDN_NARRATORS = [
  { id: "gilbert", label: "Gilbert", description: "Clear, measured reading" },
  { id: "hays",    label: "Hays",    description: "Warm, pastoral tone" },
  { id: "souer",   label: "Souer",   description: "Traditional narration" },
];

// ElevenLabs pre-generated audio — translations with HD MP3s in Supabase Storage
export const ELEVENLABS_TRANSLATIONS = ["kjv"];
export const ELEVENLABS_AUDIO_BUCKET = "bible-audio";

export const BOOK_CODE_MAP = {
  "Genesis":"GEN","Exodus":"EXO","Leviticus":"LEV","Numbers":"NUM","Deuteronomy":"DEU",
  "Joshua":"JOS","Judges":"JDG","Ruth":"RUT","1 Samuel":"1SA","2 Samuel":"2SA",
  "1 Kings":"1KI","2 Kings":"2KI","1 Chronicles":"1CH","2 Chronicles":"2CH",
  "Ezra":"EZR","Nehemiah":"NEH","Esther":"EST","Job":"JOB","Psalms":"PSA",
  "Proverbs":"PRO","Ecclesiastes":"ECC","Song of Solomon":"SNG","Isaiah":"ISA",
  "Jeremiah":"JER","Lamentations":"LAM","Ezekiel":"EZK","Daniel":"DAN",
  "Hosea":"HOS","Joel":"JOL","Amos":"AMO","Obadiah":"OBA","Jonah":"JON",
  "Micah":"MIC","Nahum":"NAM","Habakkuk":"HAB","Zephaniah":"ZEP","Haggai":"HAG",
  "Zechariah":"ZEC","Malachi":"MAL","Matthew":"MAT","Mark":"MRK","Luke":"LUK",
  "John":"JHN","Acts":"ACT","Romans":"ROM","1 Corinthians":"1CO","2 Corinthians":"2CO",
  "Galatians":"GAL","Ephesians":"EPH","Philippians":"PHP","Colossians":"COL",
  "1 Thessalonians":"1TH","2 Thessalonians":"2TH","1 Timothy":"1TI","2 Timothy":"2TI",
  "Titus":"TIT","Philemon":"PHM","Hebrews":"HEB","James":"JAS","1 Peter":"1PE",
  "2 Peter":"2PE","1 John":"1JN","2 John":"2JN","3 John":"3JN","Jude":"JUD",
  "Revelation":"REV",
};

// ═══════════════════════════════════════════════════
// MULTILINGUAL BOOK NAMES
// Keys: hi=Hindi, ml=Malayalam, ta=Tamil, te=Telugu,
//       kn=Kannada, fr=French, es=Spanish, zh=Chinese, ar=Arabic
// ═══════════════════════════════════════════════════
export const BOOK_NAMES_I18N = {
  "Genesis":         { hi:"उत्पत्ति",        ml:"ഉൽപ്പത്തി",        ta:"ஆதியாகமம்",      te:"ఆదికాండము",            kn:"ಆದಿಕಾಂಡ",             fr:"Genèse",                 es:"Génesis",         zh:"创世记",      ar:"سفر التكوين" },
  "Exodus":          { hi:"निर्गमन",          ml:"പുറപ്പാട്",        ta:"யாத்திராகமம்",   te:"నిర్గమకాండము",         kn:"ವಿಮೋಚನಕಾಂಡ",          fr:"Exode",                  es:"Éxodo",           zh:"出埃及记",    ar:"سفر الخروج" },
  "Leviticus":       { hi:"लेवीय",            ml:"ലേവ്യപുസ്തകം",    ta:"லேவியராகமம்",    te:"లేవీయకాండము",          kn:"ಯಾಜಕಕಾಂಡ",            fr:"Lévitique",              es:"Levítico",        zh:"利未记",      ar:"سفر اللاويين" },
  "Numbers":         { hi:"गिनती",            ml:"സംഖ്യ",            ta:"எண்ணாகமம்",      te:"సంఖ్యాకాండము",         kn:"ಅರಣ್ಯಕಾಂಡ",           fr:"Nombres",                es:"Números",         zh:"民数记",      ar:"سفر العدد" },
  "Deuteronomy":     { hi:"व्यवस्थाविवरण",   ml:"ആവർത്തനം",        ta:"உபாகமம்",         te:"ద్వితీయోపదేశకాండము",  kn:"ಧರ್ಮೋಪದೇಶಕಾಂಡ",       fr:"Deutéronome",            es:"Deuteronomio",    zh:"申命记",      ar:"سفر التثنية" },
  "Joshua":          { hi:"यहोशू",            ml:"യോശുവ",            ta:"யோசுவா",          te:"యెహోషువ",              kn:"ಯೆಹೋಶುವ",             fr:"Josué",                  es:"Josué",           zh:"约书亚记",    ar:"سفر يشوع" },
  "Judges":          { hi:"न्यायियों",        ml:"ന്യായാധിപന്മാർ",  ta:"நியாயாதிபதிகள்", te:"న్యాయాధిపతులు",        kn:"ನ್ಯಾಯಾಧಿಪತಿಗಳು",      fr:"Juges",                  es:"Jueces",          zh:"士师记",      ar:"سفر القضاة" },
  "Ruth":            { hi:"रूत",              ml:"രൂത്ത്",           ta:"ரூத்",            te:"రూతు",                 kn:"ರೂತ್",                 fr:"Ruth",                   es:"Rut",             zh:"路得记",      ar:"سفر راعوث" },
  "1 Samuel":        { hi:"1 शमूएल",          ml:"1 ശമൂവേൽ",        ta:"1 சாமுவேல்",      te:"1 సమూయేలు",            kn:"1 ಸಮುವೇಲ",            fr:"1 Samuel",               es:"1 Samuel",        zh:"撒母耳记上",  ar:"سفر صموئيل الأول" },
  "2 Samuel":        { hi:"2 शमूएल",          ml:"2 ശമൂവേൽ",        ta:"2 சாமுவேல்",      te:"2 సమూయేలు",            kn:"2 ಸಮುವೇಲ",            fr:"2 Samuel",               es:"2 Samuel",        zh:"撒母耳记下",  ar:"سفر صموئيل الثاني" },
  "1 Kings":         { hi:"1 राजा",           ml:"1 രാജാക്കന്മാർ",  ta:"1 இராஜாக்கள்",   te:"1 రాజులు",             kn:"1 ರಾಜರು",              fr:"1 Rois",                 es:"1 Reyes",         zh:"列王纪上",    ar:"سفر الملوك الأول" },
  "2 Kings":         { hi:"2 राजा",           ml:"2 രാജാക്കന്മാർ",  ta:"2 இராஜாக்கள்",   te:"2 రాజులు",             kn:"2 ರಾಜರು",              fr:"2 Rois",                 es:"2 Reyes",         zh:"列王纪下",    ar:"سفر الملوك الثاني" },
  "1 Chronicles":    { hi:"1 इतिहास",         ml:"1 ദിനവൃത്താന്തം", ta:"1 நாளாகமம்",     te:"1 దినవృత్తాంతములు",   kn:"1 ಪೂರ್ವಕಾಲವೃತ್ತಾಂತ",fr:"1 Chroniques",           es:"1 Crónicas",      zh:"历代志上",    ar:"سفر أخبار الأيام الأول" },
  "2 Chronicles":    { hi:"2 इतिहास",         ml:"2 ദിനവൃത്താന്തം", ta:"2 நாளாகமம்",     te:"2 దినవృత్తాంతములు",   kn:"2 ಪೂರ್ವಕಾಲವೃತ್ತಾಂತ",fr:"2 Chroniques",           es:"2 Crónicas",      zh:"历代志下",    ar:"سفر أخبار الأيام الثاني" },
  "Ezra":            { hi:"एज्रा",            ml:"എസ്ര",             ta:"எஸ்றா",           te:"ఎజ్రా",                kn:"ಎಜ್ರಾ",               fr:"Esdras",                 es:"Esdras",          zh:"以斯拉记",    ar:"سفر عزرا" },
  "Nehemiah":        { hi:"नहेमायाह",         ml:"നെഹെമ്യാ",         ta:"நெகேமியா",        te:"నెహెమ్యా",             kn:"ನೆಹೆಮಿಯ",              fr:"Néhémie",                es:"Nehemías",        zh:"尼希米记",    ar:"سفر نحميا" },
  "Esther":          { hi:"एस्तेर",           ml:"എസ്ഥേർ",           ta:"எஸ்தர்",          te:"ఎస్తేరు",              kn:"ಎಸ್ತೇರ್",              fr:"Esther",                 es:"Ester",           zh:"以斯帖记",    ar:"سفر إستير" },
  "Job":             { hi:"अय्यूब",           ml:"ഇയ്യോബ്",          ta:"யோபு",            te:"యోబు",                 kn:"ಯೋಬ",                  fr:"Job",                    es:"Job",             zh:"约伯记",      ar:"سفر أيوب" },
  "Psalms":          { hi:"भजन संहिता",       ml:"സങ്കീർത്തനം",     ta:"சங்கீதம்",        te:"కీర్తనలు",             kn:"ಕೀರ್ತನೆ",              fr:"Psaumes",                es:"Salmos",          zh:"诗篇",        ar:"سفر المزامير" },
  "Proverbs":        { hi:"नीतिवचन",          ml:"സദൃശ്യവാക്യങ്ങൾ", ta:"நீதிமொழிகள்",    te:"సామెతలు",              kn:"ಜ್ಞಾನೋಕ್ತಿಗಳು",       fr:"Proverbes",              es:"Proverbios",      zh:"箴言",        ar:"سفر الأمثال" },
  "Ecclesiastes":    { hi:"उपदेशक",           ml:"സഭാപ്രസംഗി",       ta:"பிரசங்கி",        te:"ప్రసంగి",              kn:"ಪ್ರಸಂಗಿ",              fr:"Ecclésiaste",            es:"Eclesiastés",     zh:"传道书",      ar:"سفر الجامعة" },
  "Song of Solomon": { hi:"श्रेष्ठगीत",      ml:"ഉത്തമഗീതം",        ta:"உன்னதப்பாட்டு",  te:"పరమగీతము",             kn:"ಪರಮಗೀತ",               fr:"Cantique des Cantiques", es:"Cantares",        zh:"雅歌",        ar:"نشيد الأناشيد" },
  "Isaiah":          { hi:"यशायाह",           ml:"യെശയ്യാ",          ta:"ஏசாயா",           te:"యెషయా",                kn:"ಯೆಶಾಯ",               fr:"Ésaïe",                  es:"Isaías",          zh:"以赛亚书",    ar:"سفر إشعياء" },
  "Jeremiah":        { hi:"यिर्मयाह",         ml:"യിരെമ്യാ",         ta:"எரேமியா",         te:"యిర్మీయా",             kn:"ಯೆರೆಮಿಯ",              fr:"Jérémie",                es:"Jeremías",        zh:"耶利米书",    ar:"سفر إرميا" },
  "Lamentations":    { hi:"विलापगीत",         ml:"വിലാപങ്ങൾ",        ta:"புலம்பல்",        te:"విలాపవాక్యములు",       kn:"ವಿಲಾಪಸಂಹಿತೆ",         fr:"Lamentations",           es:"Lamentaciones",   zh:"耶利米哀歌",  ar:"مراثي إرميا" },
  "Ezekiel":         { hi:"यहेजकेल",          ml:"യഹസ്കേൽ",          ta:"எசேக்கியேல்",     te:"యెహెజ్కేలు",           kn:"ಯೆಹೆಜ್ಕೇಲ",           fr:"Ézéchiel",               es:"Ezequiel",        zh:"以西结书",    ar:"سفر حزقيال" },
  "Daniel":          { hi:"दानिय्येल",        ml:"ദാനിയേൽ",          ta:"தானியேல்",        te:"దానియేలు",             kn:"ದಾನಿಯೇಲ",              fr:"Daniel",                 es:"Daniel",          zh:"但以理书",    ar:"سفر دانيال" },
  "Hosea":           { hi:"होशे",             ml:"ഹോശേയ",            ta:"ஓசேயா",           te:"హోషేయ",                kn:"ಹೋಶೇಯ",               fr:"Osée",                   es:"Oseas",           zh:"何西阿书",    ar:"سفر هوشع" },
  "Joel":            { hi:"योएल",             ml:"യോവേൽ",            ta:"யோவேல்",          te:"యోవేలు",               kn:"ಯೋವೇಲ",               fr:"Joël",                   es:"Joel",            zh:"约珥书",      ar:"سفر يوئيل" },
  "Amos":            { hi:"आमोस",             ml:"ആമോസ്",            ta:"ஆமோஸ்",           te:"ఆమోసు",                kn:"ಆಮೋಸ",                 fr:"Amos",                   es:"Amós",            zh:"阿摩司书",    ar:"سفر عاموس" },
  "Obadiah":         { hi:"ओबद्याह",          ml:"ഓബദ്യാ",           ta:"ஒபதியா",          te:"ఓబద్యా",               kn:"ಓಬದ್ಯ",                fr:"Abdias",                 es:"Abdías",          zh:"俄巴底亚书",  ar:"سفر عوبديا" },
  "Jonah":           { hi:"योना",             ml:"യോനാ",             ta:"யோனா",            te:"యోనా",                 kn:"ಯೋನ",                  fr:"Jonas",                  es:"Jonás",           zh:"约拿书",      ar:"سفر يونان" },
  "Micah":           { hi:"मीका",             ml:"മീഖാ",             ta:"மீகா",             te:"మీకా",                 kn:"ಮೀಕ",                  fr:"Michée",                 es:"Miqueas",         zh:"弥迦书",      ar:"سفر ميخا" },
  "Nahum":           { hi:"नाहूम",            ml:"നഹൂം",             ta:"நாகூம்",           te:"నాహూము",               kn:"ನಾಹೂಮ",                fr:"Nahoum",                 es:"Nahúm",           zh:"那鸿书",      ar:"سفر ناحوم" },
  "Habakkuk":        { hi:"हबक्कूक",          ml:"ഹബക്കൂക്ക്",       ta:"ஆபகூக்",          te:"హబక్కూకు",             kn:"ಹಬಕ್ಕೂಕ",              fr:"Habacuc",                es:"Habacuc",         zh:"哈巴谷书",    ar:"سفر حبقوق" },
  "Zephaniah":       { hi:"सपन्याह",          ml:"സെഫന്യാ",          ta:"செப்பனியா",        te:"సెఫన్యా",              kn:"ಸೆಫನ್ಯ",               fr:"Sophonie",               es:"Sofonías",        zh:"西番雅书",    ar:"سفر صفنيا" },
  "Haggai":          { hi:"हाग्गै",           ml:"ഹഗ്ഗായി",          ta:"ஆகாய்",           te:"హగ్గయి",               kn:"ಹಗ್ಗಾಯ",               fr:"Aggée",                  es:"Hageo",           zh:"哈该书",      ar:"سفر حجي" },
  "Zechariah":       { hi:"जकर्याह",          ml:"സെഖര്യ",           ta:"சகரியா",          te:"జెకర్యా",              kn:"ಜೆಕರ್ಯ",               fr:"Zacharie",               es:"Zacarías",        zh:"撒迦利亚书",  ar:"سفر زكريا" },
  "Malachi":         { hi:"मलाकी",            ml:"മലാഖി",            ta:"மல்கியா",         te:"మలాకీ",                kn:"ಮಲಾಕಿ",                fr:"Malachie",               es:"Malaquías",       zh:"玛拉基书",    ar:"سفر ملاخي" },
  "Matthew":         { hi:"मत्ती",            ml:"മത്തായി",          ta:"மத்தேயு",         te:"మత్తయి",               kn:"ಮತ್ತಾಯ",               fr:"Matthieu",               es:"Mateo",           zh:"马太福音",    ar:"إنجيل متى" },
  "Mark":            { hi:"मरकुस",            ml:"മർക്കൊസ്",         ta:"மாற்கு",          te:"మార్కు",               kn:"ಮಾರ್ಕ",                fr:"Marc",                   es:"Marcos",          zh:"马可福音",    ar:"إنجيل مرقس" },
  "Luke":            { hi:"लूका",             ml:"ലൂക്കൊസ്",         ta:"லூக்கா",          te:"లూకా",                 kn:"ಲೂಕ",                  fr:"Luc",                    es:"Lucas",           zh:"路加福音",    ar:"إنجيل لوقا" },
  "John":            { hi:"यूहन्ना",          ml:"യോഹന്നാൻ",         ta:"யோவான்",          te:"యోహాను",               kn:"ಯೋಹಾನ",               fr:"Jean",                   es:"Juan",            zh:"约翰福音",    ar:"إنجيل يوحنا" },
  "Acts":            { hi:"प्रेरितों के काम",ml:"അ.പ്ര.",            ta:"அப்போஸ்தலர்",     te:"అపొస్తలుల కార్యములు", kn:"ಅಪೊಸ್ತಲರ ಕೃತ್ಯ",      fr:"Actes",                  es:"Hechos",          zh:"使徒行传",    ar:"سفر أعمال الرسل" },
  "Romans":          { hi:"रोमियों",          ml:"റോമർ",             ta:"ரோமர்",           te:"రోమీయులకు",            kn:"ರೋಮನ್ನರಿಗೆ",           fr:"Romains",                es:"Romanos",         zh:"罗马书",      ar:"رسالة رومية" },
  "1 Corinthians":   { hi:"1 कुरिन्थियों",   ml:"1 കൊരിന്ത്യർ",    ta:"1 கொரிந்தியர்",  te:"1 కొరింథీయులకు",       kn:"1 ಕೊರಿಂಥದವರಿಗೆ",     fr:"1 Corinthiens",          es:"1 Corintios",     zh:"哥林多前书",  ar:"رسالة كورنثوس الأولى" },
  "2 Corinthians":   { hi:"2 कुरिन्थियों",   ml:"2 കൊരിന്ത്യർ",    ta:"2 கொரிந்தியர்",  te:"2 కొరింథీయులకు",       kn:"2 ಕೊರಿಂಥದವರಿಗೆ",     fr:"2 Corinthiens",          es:"2 Corintios",     zh:"哥林多后书",  ar:"رسالة كورنثوس الثانية" },
  "Galatians":       { hi:"गलातियों",         ml:"ഗലാത്യർ",          ta:"கலாத்தியர்",      te:"గలతియులకు",            kn:"ಗಲಾತ್ಯರಿಗೆ",           fr:"Galates",                es:"Gálatas",         zh:"加拉太书",    ar:"رسالة غلاطية" },
  "Ephesians":       { hi:"इफिसियों",         ml:"എഫേസ്യർ",          ta:"எபேசியர்",        te:"ఎఫెసీయులకు",           kn:"ಎಫೆಸಿಯರಿಗೆ",           fr:"Éphésiens",              es:"Efesios",         zh:"以弗所书",    ar:"رسالة أفسس" },
  "Philippians":     { hi:"फिलिप्पियों",      ml:"ഫിലിപ്പ്യർ",      ta:"பிலிப்பியர்",     te:"ఫిలిప్పీయులకు",        kn:"ಫಿಲಿಪ್ಪಿಯರಿಗೆ",       fr:"Philippiens",            es:"Filipenses",      zh:"腓立比书",    ar:"رسالة فيلبي" },
  "Colossians":      { hi:"कुलुस्सियों",      ml:"കൊലൊസ്സ്യർ",      ta:"கொலோசெயர்",       te:"కొలొస్సీయులకు",        kn:"ಕೊಲೊಸ್ಸೆಯರಿಗೆ",       fr:"Colossiens",             es:"Colosenses",      zh:"歌罗西书",    ar:"رسالة كولوسي" },
  "1 Thessalonians": { hi:"1 थिस्सलुनीकियों",ml:"1 തെസ്സലൊ.",       ta:"1 தெசலோனிக்கேயர்",te:"1 థెస్సలొనీకయులకు",   kn:"1 ಥೆಸಲೋನಿಕದವರಿಗೆ",   fr:"1 Thessaloniciens",      es:"1 Tesalonicenses",zh:"帖撒罗尼迦前书",ar:"رسالة تسالونيكي الأولى" },
  "2 Thessalonians": { hi:"2 थिस्सलुनीकियों",ml:"2 തെസ്സലൊ.",       ta:"2 தெசலோனிக்கேயர்",te:"2 థెస్సలొనీకయులకు",   kn:"2 ಥೆಸಲೋನಿಕದವರಿಗೆ",   fr:"2 Thessaloniciens",      es:"2 Tesalonicenses",zh:"帖撒罗尼迦后书",ar:"رسالة تسالونيكي الثانية" },
  "1 Timothy":       { hi:"1 तीमुथियुस",      ml:"1 തിമൊഥെ.",        ta:"1 தீமோத்தேயு",   te:"1 తిమోతికి",           kn:"1 ತಿಮೋತಿಗೆ",           fr:"1 Timothée",             es:"1 Timoteo",       zh:"提摩太前书",  ar:"رسالة تيموثاوس الأولى" },
  "2 Timothy":       { hi:"2 तीमुथियुस",      ml:"2 തിമൊഥെ.",        ta:"2 தீமோத்தேயு",   te:"2 తిమోతికి",           kn:"2 ತಿಮೋತಿಗೆ",           fr:"2 Timothée",             es:"2 Timoteo",       zh:"提摩太后书",  ar:"رسالة تيموثاوس الثانية" },
  "Titus":           { hi:"तीतुस",            ml:"തീത്തൊസ്",         ta:"தீத்து",          te:"తీతుకు",               kn:"ತೀತನಿಗೆ",              fr:"Tite",                   es:"Tito",            zh:"提多书",      ar:"رسالة تيطس" },
  "Philemon":        { hi:"फिलेमोन",          ml:"ഫിലേമോൻ",          ta:"பிலேமோன்",        te:"ఫిలేమోనుకు",           kn:"ಫಿಲೆಮೋನನಿಗೆ",         fr:"Philémon",               es:"Filemón",         zh:"腓利门书",    ar:"رسالة فليمون" },
  "Hebrews":         { hi:"इब्रानियों",       ml:"എബ്രായർ",          ta:"எபிரெயர்",        te:"హెబ్రీయులకు",          kn:"ಇಬ್ರಾಯರಿಗೆ",           fr:"Hébreux",                es:"Hebreos",         zh:"希伯来书",    ar:"رسالة العبرانيين" },
  "James":           { hi:"याकूब",            ml:"യാക്കോബ്",         ta:"யாக்கோபு",        te:"యాకోబు",               kn:"ಯಾಕೋಬ",                fr:"Jacques",                es:"Santiago",        zh:"雅各书",      ar:"رسالة يعقوب" },
  "1 Peter":         { hi:"1 पतरस",           ml:"1 പത്രൊസ്",        ta:"1 பேதுரு",        te:"1 పేతురు",             kn:"1 ಪೇತ್ರ",              fr:"1 Pierre",               es:"1 Pedro",         zh:"彼得前书",    ar:"رسالة بطرس الأولى" },
  "2 Peter":         { hi:"2 पतरस",           ml:"2 പത്രൊസ്",        ta:"2 பேதுரு",        te:"2 పేతురు",             kn:"2 ಪೇತ್ರ",              fr:"2 Pierre",               es:"2 Pedro",         zh:"彼得后书",    ar:"رسالة بطرس الثانية" },
  "1 John":          { hi:"1 यूहन्ना",        ml:"1 യോഹന്നാൻ",       ta:"1 யோவான்",        te:"1 యోహాను",             kn:"1 ಯೋಹಾನ",              fr:"1 Jean",                 es:"1 Juan",          zh:"约翰一书",    ar:"رسالة يوحنا الأولى" },
  "2 John":          { hi:"2 यूहन्ना",        ml:"2 യോഹന്നാൻ",       ta:"2 யோவான்",        te:"2 యోహాను",             kn:"2 ಯೋಹಾನ",              fr:"2 Jean",                 es:"2 Juan",          zh:"约翰二书",    ar:"رسالة يوحنا الثانية" },
  "3 John":          { hi:"3 यूहन्ना",        ml:"3 യോഹന്നാൻ",       ta:"3 யோவான்",        te:"3 యోహాను",             kn:"3 ಯೋಹಾನ",              fr:"3 Jean",                 es:"3 Juan",          zh:"约翰三书",    ar:"رسالة يوحنا الثالثة" },
  "Jude":            { hi:"यहूदा",            ml:"യൂദാ",             ta:"யூதா",            te:"యూదా",                 kn:"ಯೂದ",                  fr:"Jude",                   es:"Judas",           zh:"犹大书",      ar:"رسالة يهوذا" },
  "Revelation":      { hi:"प्रकाशितवाक्य",   ml:"വെളിപ്പാട്",       ta:"வெளிப்படுத்தல்", te:"ప్రకటన గ్రంథము",      kn:"ಪ್ರಕಟಣೆ",              fr:"Apocalypse",             es:"Apocalipsis",     zh:"启示录",      ar:"سفر الرؤيا" },
};

// Maps BIBLE_TRANSLATIONS id → BOOK_NAMES_I18N language key
const _LANG_MAP = {
  HINIRV:"hi", mal_irv:"ml", tam_irv:"ta", tel_irv:"te",
  kan_irv:"kn", fra_lsg:"fr", spa_r09:"es", cmn_cu1:"zh", ARBNAV:"ar",
};

// Books that have quiz JSON files in /public/data/quizzes/
export const QUIZ_BOOKS = [
  "Genesis",
  "Matthew", "Mark", "Luke", "John", "Acts",
  "Romans", "1 Corinthians", "2 Corinthians", "Galatians", "Ephesians",
  "Philippians", "Colossians", "1 Thessalonians", "2 Thessalonians",
  "1 Timothy", "2 Timothy", "Titus", "Philemon",
  "Hebrews", "James", "1 Peter", "2 Peter",
  "1 John", "2 John", "3 John", "Jude", "Revelation",
];

/** Returns the localised book name for the active translation, falling back to English. */
export function getBookName(englishName, translationId) {
  if (!translationId || !englishName) return englishName || "";
  const lang = _LANG_MAP[translationId];
  if (!lang) return englishName;
  return BOOK_NAMES_I18N[englishName]?.[lang] || englishName;
}
