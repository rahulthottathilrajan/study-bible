"use client";
import { useState, useEffect, useRef } from "react";

// ═══════════════════════════════════════════════════
// THEME
// ═══════════════════════════════════════════════════
const KC = {
  bg:      "#F0FDF4",
  card:    "#FFFFFF",
  hero:    "linear-gradient(135deg, #059669 0%, #10B981 50%, #047857 100%)",
  accent:  "#059669",
  accentLight: "#D1FAE5",
  text:    "#1F2937",
  muted:   "#6B7280",
  divider: "#E5E7EB",
  heading: "'Georgia', 'DM Serif Display', serif",
  body:    "'Georgia', serif",
  ui:      "'Outfit', 'Segoe UI', sans-serif",
};

const AGE_BADGES = {
  "3-5":  { bg: "#FEF3C7", color: "#92400E", label: "Ages 3–5" },
  "6-8":  { bg: "#DBEAFE", color: "#1E40AF", label: "Ages 6–8" },
  "9-12": { bg: "#EDE9FE", color: "#5B21B6", label: "Ages 9–12" },
};

const TERM_BADGES = {
  "Term 1": { bg: "#FEE2E2", color: "#991B1B", label: "Term 1 · Jan–Mar" },
  "Term 2": { bg: "#FEF3C7", color: "#92400E", label: "Term 2 · Apr–Jun" },
  "Term 3": { bg: "#DBEAFE", color: "#1E40AF", label: "Term 3 · Jul–Sep" },
  "Term 4": { bg: "#EDE9FE", color: "#5B21B6", label: "Term 4 · Oct–Dec" },
};

const MONTHS = [
  { label: "All", weeks: null },
  { label: "Jan", weeks: [1,2,3,4] },
  { label: "Feb", weeks: [5,6,7,8] },
  { label: "Mar", weeks: [9,10,11,12,13] },
  { label: "Apr", weeks: [14,15,16,17] },
  { label: "May", weeks: [18,19,20,21,22] },
  { label: "Jun", weeks: [23,24,25,26] },
  { label: "Jul", weeks: [27,28,29,30] },
  { label: "Aug", weeks: [31,32,33,34,35] },
  { label: "Sep", weeks: [36,37,38,39] },
  { label: "Oct", weeks: [40,41,42,43] },
  { label: "Nov", weeks: [44,45,46,47,48] },
  { label: "Dec", weeks: [49,50,51,52] },
];

// ═══════════════════════════════════════════════════
// LESSONS DATA — JANUARY (Weeks 1–4)
// ═══════════════════════════════════════════════════
const LESSONS = [
  // ── Week 1 ──────────────────────────────────
  {
    week: 1,
    title: "God Made Everything",
    bibleRef: "Genesis 1:1–2:3",
    keyVerse: "In the beginning God created the heaven and the earth. — Genesis 1:1",
    theme: "Creation",
    term: "Term 1",
    month: "Jan",
    icon: "🌍",
    color: "#059669",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Look around the room — what is the most beautiful thing you can see? Who do you think made it? Today we are going to learn about the one who made EVERYTHING!",

    story: {
      "3-5": "A long, long time ago — before there were any trees, animals, or people — there was nothing at all. Only God was there. And God said, 'Let there be light!' And WHOOSH — light appeared! Then God made the sky, the sea, the land, the flowers, the sun and moon, the fish and birds, and all the animals. On the very last day God made people — a man called Adam and a woman called Eve. God looked at everything He had made and said, 'This is VERY good!' Then God rested.",
      "6-8": "Before anything existed, God was there. He didn't need materials or tools — He simply spoke, and things came into being. Day by day He shaped the world: light and dark, sky and seas, land and plants, sun and stars, fish and birds, animals of every kind. Then came the crowning moment — God formed the first man, Adam, from the dust of the ground and breathed life into him. He made Eve to be Adam's companion. God looked at all He had made and declared it 'very good.' On the seventh day, God rested — not because He was tired, but to show us that rest is holy.",
      "9-12": "Genesis opens with the most powerful sentence ever written: 'In the beginning God created the heaven and the earth.' Before matter, energy, time, or space — God already existed. He created ex nihilo — out of nothing. Each day of creation reveals something about God's character: He brings order from chaos, light from darkness, life from dust. Humanity is the pinnacle — made 'in the image of God' (imago Dei), meaning we reflect God's nature in ways no animal does. We can think, love, create, and know right from wrong. On the seventh day God rested, establishing a pattern of Sabbath rest that runs through the entire Bible. John 1:1–3 tells us that Jesus — the Word — was the agent of creation. Everything was made through Him and for Him."
    },

    scripture: {
      "3-5": "In the beginning God created the heaven and the earth.\n— Genesis 1:1",
      "6-8": "In the beginning God created the heaven and the earth. And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters. And God said, Let there be light: and there was light.\n— Genesis 1:1–3",
      "9-12": "In the beginning God created the heaven and the earth. And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved upon the face of the waters. And God said, Let there be light: and there was light. And God saw the light, that it was good: and God divided the light from the darkness.\n— Genesis 1:1–4\n\nAnd God said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth.\n— Genesis 1:26\n\nAll things were made by him; and without him was not any thing made that was made.\n— John 1:3"
    },

    activities: {
      "3-5": "🎨 Draw and colour the 7 days of creation — one picture for each day! What is your favourite thing God made? Tell someone!\n\n🌍 Paper Bag Earth: Paint or colour a paper bag blue and green to look like the Earth. Write 'God Made Everything' on the back.",
      "6-8": "🎨 Make a Creation Wheel — draw a big circle, divide it into 7 segments, and draw one thing from each day of creation in each segment. Decorate it beautifully!\n\n📖 Look up Genesis 1 and list every time it says 'And God saw that it was good.' How many times does it appear?",
      "9-12": "📖 Read through Genesis 1 carefully. List everything God called 'good.' Now read John 1:1–3 — who was present at creation? What does this tell us about Jesus?\n\n✍️ Write a short poem or paragraph praising God as Creator. Use at least 3 specific things from Genesis 1 in your writing."
    },

    supplies: "Paper bag, blue & green paint or crayons, markers, large white paper, scissors, glue stick",

    discussionQuestions: [
      "If you could ask God why He made one thing, what would it be?",
      "What does it mean that humans were made 'in God's image'? How are we different from animals?",
      "Why is it important that GOD created everything — and not nobody or something else?"
    ],

    reflection: "Today I learned that God made EVERYTHING — the whole world, every animal, every star — just by speaking. And He made ME in His image. That means I am special to God!",

    prayer: "Dear God, thank You for making everything — the sun, the stars, the animals, and me! Help me to remember that You are the maker of all things and that everything belongs to You. Amen.",

    teacherNote: "Emphasise that God created ex nihilo — out of nothing. He didn't need materials. This sets up the whole Bible: God is the owner and Lord of everything because He made everything. For older children, connect to John 1:1–3 — Jesus (the Word) was there at creation. The phrase 'Let us make' in Genesis 1:26 is a hint at the Trinity. The doctrine of creation undergirds everything: if God made all things, He has the right to rule all things. The Sabbath rest (Genesis 2:2–3) is picked up again in Hebrews 4 as pointing to the ultimate rest found in Christ.",

    memoryVerse: "In the beginning God created the heaven and the earth. — Genesis 1:1",
  },

  // ── Week 2 ──────────────────────────────────
  {
    week: 2,
    title: "The Garden and the Fall",
    bibleRef: "Genesis 2:7–3:24",
    keyVerse: "For God so loved the world, that he gave his only begotten Son. — John 3:16",
    theme: "Sin & Grace",
    term: "Term 1",
    month: "Jan",
    icon: "🍎",
    color: "#DC2626",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever been told not to touch something — but you REALLY wanted to? What happened? Today we will learn about the first time someone disobeyed God.",

    story: {
      "3-5": "God made a beautiful garden called Eden for Adam and Eve to live in. There were yummy fruits on every tree. God said they could eat from any tree — except one. 'Don't eat from that tree,' God said. But a sneaky serpent came and said, 'Go on, eat it!' Eve ate the fruit, and Adam did too. They had disobeyed God. They felt ashamed and tried to hide. But God came looking for them — because He still loved them. Even though they had to leave the garden, God made a promise: one day, He would send someone to fix everything.",
      "6-8": "God made Adam from dust and breathed life into him. He made Eve to be Adam's perfect helper. They lived in a beautiful garden called Eden — everything they needed was there. God gave them one rule: don't eat from the tree of the knowledge of good and evil. But the serpent tricked Eve, saying 'You won't really die — you'll become like God!' Eve ate the fruit and gave some to Adam. Immediately they felt shame and hid from God. Sin had entered the world. But even in this sad moment, God showed kindness — He clothed them and made a promise: one day, someone from Eve's family would crush the serpent's head.",
      "9-12": "Genesis 2–3 is one of the most important passages in the entire Bible. God formed Adam from the dust (showing our humble origins) and breathed life into him (showing our divine dignity). Eve was made from Adam's side — not from his head to rule over him, nor from his feet to be trampled, but from his side to be his equal companion. God gave one prohibition: the tree of the knowledge of good and evil. The serpent's strategy was subtle — he questioned God's word ('Hath God said?'), denied the consequences ('Ye shall not surely die'), and offered a counterfeit promise ('Ye shall be as gods'). This is still how temptation works today. The Fall brought death, shame, broken relationships, and separation from God. But Genesis 3:15 — the Protoevangelium (first gospel) — promises that the 'seed of the woman' would one day crush the serpent's head. This is the first prophecy of Jesus. And notice: God clothed Adam and Eve with animal skins — innocent blood was shed to cover their shame. This foreshadows the atonement."
    },

    scripture: {
      "3-5": "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.\n— John 3:16",
      "6-8": "And the LORD God commanded the man, saying, Of every tree of the garden thou mayest freely eat: But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.\n— Genesis 2:16–17\n\nFor God so loved the world, that he gave his only begotten Son.\n— John 3:16",
      "9-12": "And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.\n— Genesis 3:15\n\nUnto Adam also and to his wife did the LORD God make coats of skins, and clothed them.\n— Genesis 3:21\n\nFor God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life.\n— John 3:16"
    },

    activities: {
      "3-5": "🎨 Draw the Garden of Eden — with lots of trees, flowers, and animals. What fruit would you grow there?\n\n🐍 Make a paper serpent with a zigzag paper strip. Write 'God keeps His promises' on it.",
      "6-8": "🌳 Make a 'choices tree' — on one side draw good choices and their results, on the other side draw bad choices and their consequences.\n\n📖 Find three kind things God does in Genesis 3 even though Adam and Eve sinned. Write them down.",
      "9-12": "📖 Read Genesis 3:15 carefully. This is called the 'Protoevangelium' — the first gospel promise. Who is the 'seed of the woman' who would crush the serpent's head? (Hint: Galatians 4:4)\n\n✍️ Compare how the serpent tempts Eve with how Satan tempts Jesus in Matthew 4:1–11. What is different about how Jesus responds?"
    },

    supplies: "Coloured paper, scissors, markers, paper strips for serpent craft, glue, brown paper bags",

    discussionQuestions: [
      "Why do you think Adam and Eve disobeyed when they had everything they needed?",
      "What are the consequences of their choice that we still feel today?",
      "Even in Genesis 3, God shows kindness. Can you find it in the passage?"
    ],

    reflection: "Today I learned that when the first people disobeyed God, everything went wrong — but God STILL loved them and promised to send a rescuer. That rescuer is Jesus!",

    prayer: "Dear God, I am sorry for the times I disobey You. Thank You that even when we sin, You don't stop loving us. Thank You for sending Jesus to be the one who crushes the serpent and makes everything right. Amen.",

    teacherNote: "Don't rush past the mercy in Genesis 3. God clothes Adam and Eve — innocent animals are killed to cover their shame. This foreshadows the atonement. The promise in 3:15 is the seed of the entire redemptive story. The serpent's three-part strategy (questioning God's word, denying consequences, offering a false promise) is exactly what Satan uses throughout Scripture — and in our lives today. For older children, draw the line from Genesis 3:15 through the whole Bible: the 'seed' is traced through Seth, Noah, Abraham, Judah, David, and finally to Jesus (Galatians 4:4). This is the scarlet thread of redemption.",

    memoryVerse: "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life. — John 3:16",
  },

  // ── Week 3 ──────────────────────────────────
  {
    week: 3,
    title: "Noah and the Flood",
    bibleRef: "Genesis 6–9",
    keyVerse: "I do set my bow in the cloud, and it shall be for a token of a covenant. — Genesis 9:13",
    theme: "Judgment & Covenant",
    term: "Term 1",
    month: "Jan",
    icon: "🌈",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever made a promise to someone? Did you keep it? Today we will learn about the BIGGEST promise God ever made — and the rainbow that proves it!",

    story: {
      "3-5": "After Adam and Eve, people kept doing bad things. God was very sad. But there was one man who loved God — his name was Noah. God told Noah to build a HUGE boat called an ark. Noah obeyed, even when people laughed at him. Then God brought two of every animal to the ark. It rained and rained for 40 days! The whole world was covered in water. But Noah and his family and the animals were safe inside the ark. When the water went away, God put a beautiful rainbow in the sky and said, 'I promise I will never flood the whole earth again.'",
      "6-8": "The world became very wicked. People had forgotten God and filled the earth with violence. But Noah loved God and walked with Him. God told Noah to build a giant boat called an ark — and Noah trusted God and obeyed, even when people laughed at him for years. God sent animals to the ark — two of most kinds, seven of the clean animals. Then the rain came for 40 days and 40 nights. Everything outside the ark was destroyed. When the waters finally receded, Noah built an altar and thanked God. Then God made a covenant — a solemn promise — and put a rainbow in the sky as the sign: He would never flood the whole earth again.",
      "9-12": "By Genesis 6, humanity had become so corrupt that 'every imagination of the thoughts of his heart was only evil continually' (Genesis 6:5). God's judgment was just — but His grace was evident in Noah. Noah 'found grace in the eyes of the LORD' (6:8) — this is the first use of the word 'grace' in the Bible. God gave the world 120 years of warning while Noah built the ark (2 Peter 2:5 calls Noah 'a preacher of righteousness'). The ark itself is a picture of salvation — you are either inside it and safe, or outside it and lost. There is only one door (Genesis 6:16), just as Jesus says 'I am the door' (John 10:9). After the flood, God establishes His covenant with Noah — the first explicit covenant in Scripture. The rainbow is a sign that God keeps His promises even when humanity fails. Peter later uses the flood as a picture of baptism (1 Peter 3:20–21) — the waters that judged the world also carried the ark to safety."
    },

    scripture: {
      "3-5": "I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.\n— Genesis 9:13",
      "6-8": "But Noah found grace in the eyes of the LORD.\n— Genesis 6:8\n\nI do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.\n— Genesis 9:13",
      "9-12": "And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.\n— Genesis 6:5\n\nBut Noah found grace in the eyes of the LORD.\n— Genesis 6:8\n\nI do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.\n— Genesis 9:13\n\nWhich sometime were disobedient, when once the longsuffering of God waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.\n— 1 Peter 3:20"
    },

    activities: {
      "3-5": "🎨 Draw Noah's ark with animals going in two by two! How many animals can you draw?\n\n🌈 Make a rainbow mobile — cut strips of coloured paper (red, orange, yellow, green, blue, purple) and hang them from a cotton wool cloud.",
      "6-8": "🏗️ Build a model ark from cardboard or craft sticks. Label the three decks. How big was the real ark? (Hint: Genesis 6:15 — about 450 feet long!)\n\n📖 Find every covenant God makes in the Bible that you can. Start a 'Covenant List' — you'll add to it all year!",
      "9-12": "📖 Read 1 Peter 3:20–21. Peter says the flood is a picture of baptism. What do the waters represent? What does the ark represent? How does this help us understand what baptism means?\n\n✍️ The word 'grace' appears for the first time in Genesis 6:8. Write your own definition of grace based on Noah's story. How is God's grace different from fairness?"
    },

    supplies: "Coloured paper strips, cotton wool, string, cardboard, craft sticks, glue, scissors, markers, thread for mobile",

    discussionQuestions: [
      "Noah obeyed God when it was very hard and people laughed at him. When is it hard to obey God?",
      "Why is God's judgment in the flood fair? Why is His mercy to Noah also fair?",
      "Rainbows are a sign of God's promise. What promises of God can you trust today?"
    ],

    reflection: "Today I learned that even when the world was very bad, God saved Noah and his family. God always keeps His promises — and the rainbow reminds us every time we see one!",

    prayer: "Dear God, thank You that You always keep Your promises. Thank You for saving Noah, and thank You for saving me through Jesus. When I see a rainbow, help me to remember how faithful You are. Amen.",

    teacherNote: "The ark is a picture of salvation — you're either in it or outside it. There is one door, which God Himself shuts (Genesis 7:16). Connect to 1 Peter 3:20–21, where Peter uses the flood as a picture of baptism. For older children, discuss why God's judgment is just, not cruel: He gave the world 120 years of warning while Noah built the ark (2 Peter 2:5). The Noahic covenant is unconditional — God binds Himself, not man. This pattern (God making and keeping covenants that humans break) culminates in the new covenant in Christ's blood. The first mention of 'grace' in Genesis 6:8 is significant — Noah didn't earn his place on the ark. He 'found' grace — it was a gift.",

    memoryVerse: "I do set my bow in the cloud, and it shall be for a token of a covenant. — Genesis 9:13",
  },

  // ── Week 4 ──────────────────────────────────
  {
    week: 4,
    title: "The Tower of Babel",
    bibleRef: "Genesis 11:1–9",
    keyVerse: "Pride goeth before destruction. — Proverbs 16:18",
    theme: "Pride & Humility",
    term: "Term 1",
    month: "Jan",
    icon: "🏗️",
    color: "#B45309",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever tried to build something really, really tall — like a block tower? What happened? Today we will learn about the TALLEST tower anyone ever tried to build — and why God stopped it!",

    story: {
      "3-5": "After the flood, everyone in the world spoke the same language. God told people to spread out across the earth. But they didn't listen! Instead, they said, 'Let's build a tower so tall it reaches heaven! Then everyone will think WE are great!' God saw what they were doing. He knew their hearts were full of pride. So God mixed up their languages — suddenly nobody could understand each other! They couldn't finish the tower, and they had to spread out after all. The place was called Babel, which sounds like the word for 'mixed up.'",
      "6-8": "After the flood, everyone in the world spoke the same language. Instead of spreading across the earth as God commanded, they gathered in one place and said, 'Let us build a city and a tower whose top reaches heaven — let us make a name for ourselves!' They wanted to be famous. They wanted to reach God on their own terms. But God came down and saw their pride. He confused their languages so they couldn't understand each other. They stopped building and scattered across the earth — which is exactly what God had told them to do in the first place! The city was called Babel. This is why the world has so many languages.",
      "9-12": "The Tower of Babel is about much more than a building project. After the flood, God told Noah's descendants to 'fill the earth' (Genesis 9:1). Instead, they gathered in one place and said, 'Let us make a name for ourselves, lest we be scattered' (Genesis 11:4). This was direct rebellion — they feared what God had commanded. The tower was a ziggurat — a man-made mountain to reach the heavens on their own terms. It's the sin of autonomy: wanting to get to God by human effort rather than receiving Him by grace. Notice the irony: they built a tower to 'reach heaven,' but God had to 'come down' to even see it (11:5). The scattering of languages was judgment — but it was also mercy, preventing a unified humanity from spiralling deeper into corporate sin. And here's the beautiful reversal: at Pentecost (Acts 2), God reversed Babel. The Holy Spirit enabled people from every language to hear the gospel. What pride scattered, the Spirit reunited."
    },

    scripture: {
      "3-5": "Pride goeth before destruction, and an haughty spirit before a fall.\n— Proverbs 16:18",
      "6-8": "And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.\n— Genesis 11:4\n\nPride goeth before destruction, and an haughty spirit before a fall.\n— Proverbs 16:18",
      "9-12": "And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth. And the LORD came down to see the city and the tower, which the children of men builded.\n— Genesis 11:4–5\n\nPride goeth before destruction, and an haughty spirit before a fall.\n— Proverbs 16:18\n\nWherefore God also hath highly exalted him, and given him a name which is above every name.\n— Philippians 2:9"
    },

    activities: {
      "3-5": "🧱 Build a tower with blocks or LEGO as high as you can! What happened when it fell? Talk about why God didn't like the people's plan.\n\n🎨 Draw the Tower of Babel — make it very tall! Around the bottom draw people looking confused, speaking different languages.",
      "6-8": "🌍 Learn to say 'God loves you' in 3 different languages! Why does God love ALL people from EVERY language? (Try: French — 'Dieu t'aime', Spanish — 'Dios te ama', Zulu — 'UNkulunkulu uyakuthanda')\n\n📖 Read Acts 2:1–12. At Babel God divided languages. At Pentecost, what did God do? Draw a 'before and after' comparison.",
      "9-12": "📖 Compare Genesis 11:4 ('let us make a name for ourselves') with Philippians 2:9–11 ('God gave Him a name above every name'). What is the difference between seeking your own glory and receiving glory from God?\n\n✍️ Design your own tower on paper. On each floor write something people today try to use to 'make a name' for themselves. Then write above the tower what God says matters instead."
    },

    supplies: "Building blocks or LEGO, large paper, markers, coloured pencils",

    discussionQuestions: [
      "Why is it wrong to want to make yourself famous instead of giving glory to God?",
      "Is it wrong to build big things or be ambitious? What's the difference between godly ambition and pride?",
      "How does Pentecost (Acts 2) reverse what happened at Babel?"
    ],

    reflection: "Today I learned that when people tried to make themselves great without God, it didn't work. Real greatness comes from following God — not from making a name for ourselves.",

    prayer: "Dear God, help me not to be proud or try to make myself important. You are the greatest, and everything I have comes from You. Help me to use my life to make YOUR name great, not mine. Amen.",

    teacherNote: "Babel is about the sin of autonomy — wanting to reach God on our own terms, to make a name for ourselves rather than God. The Hebrew wordplay is significant: they wanted to build in 'Bavel' but God 'balal' (confused) their language. Connect to Philippians 2:9–11: God has given Jesus the name above every name — the very thing the builders of Babel wanted for themselves. The Babel-Pentecost reversal is one of the most beautiful typological arcs in Scripture. At Babel, one language became many as judgment. At Pentecost, many languages were united in one gospel as grace. For older students, you can connect this to the vision in Revelation 7:9 — every nation, tribe, people, and language gathered before the throne. What Babel scattered, the gospel gathers.",

    memoryVerse: "Pride goeth before destruction, and an haughty spirit before a fall. — Proverbs 16:18",
  },

  // ═══════════════════════════════════════════════════
  // MONTHS 2–12 WILL BE APPENDED HERE
  // ═══════════════════════════════════════════════════
];


// ═══════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════
export default function KidsCurriculum({ nav }) {

  // ── State ────────────────────────────────────
  const [activeTab, setActiveTab]             = useState("lessons");
  const [selectedLesson, setSelectedLesson]   = useState(null);
  const [modalOpen, setModalOpen]             = useState(false);
  const [animIn, setAnimIn]                   = useState(false);
  const [ageFilter, setAgeFilter]             = useState("6-8");
  const [termFilter, setTermFilter]           = useState("All");
  const [monthFilter, setMonthFilter]         = useState("All");
  const [completedLessons, setCompletedLessons] = useState([]);
  const [revealedQs, setRevealedQs]           = useState({});
  const [parentNotesOpen, setParentNotesOpen] = useState(false);
  const modalRef = useRef(null);

  // ── Helpers ──────────────────────────────────
  const filteredLessons = LESSONS.filter(l => {
    if (termFilter !== "All" && l.term !== termFilter) return false;
    if (monthFilter !== "All") {
      const m = MONTHS.find(mo => mo.label === monthFilter);
      if (m && m.weeks && !m.weeks.includes(l.week)) return false;
    }
    return true;
  });

  const openLesson = (lesson) => {
    setSelectedLesson(lesson);
    setModalOpen(true);
    setRevealedQs({});
    setParentNotesOpen(false);
    setTimeout(() => setAnimIn(true), 20);
  };

  const closeModal = () => {
    setAnimIn(false);
    setTimeout(() => { setModalOpen(false); setSelectedLesson(null); }, 280);
  };

  const toggleComplete = (week) => {
    setCompletedLessons(prev =>
      prev.includes(week) ? prev.filter(w => w !== week) : [...prev, week]
    );
  };

  const toggleQ = (i) => {
    setRevealedQs(prev => ({ ...prev, [i]: !prev[i] }));
  };

  const completedCount = completedLessons.length;
  const progressPct = Math.round((completedCount / 52) * 100);

  // ── Scroll lock ──────────────────────────────
  useEffect(() => {
    if (modalOpen) document.body.style.overflow = "hidden";
    else document.body.style.overflow = "";
    return () => { document.body.style.overflow = ""; };
  }, [modalOpen]);

  // ═══════════════════════════════════════════════
  // RENDER — LESSON CARD
  // ═══════════════════════════════════════════════
  const LessonCard = (lesson) => {
    const done = completedLessons.includes(lesson.week);
    const tb = TERM_BADGES[lesson.term] || {};
    return (
      <div key={lesson.week} onClick={() => openLesson(lesson)} style={{
        background: KC.card, borderRadius: 14, padding: 0,
        border: `1px solid ${KC.divider}`, borderLeft: `4px solid ${lesson.color}`,
        cursor: "pointer", position: "relative", overflow: "hidden",
        transition: "transform 0.15s, box-shadow 0.15s",
        boxShadow: "0 1px 4px rgba(0,0,0,0.04)",
      }}
        onMouseEnter={e => { e.currentTarget.style.transform = "translateY(-2px)"; e.currentTarget.style.boxShadow = "0 4px 12px rgba(0,0,0,0.08)"; }}
        onMouseLeave={e => { e.currentTarget.style.transform = ""; e.currentTarget.style.boxShadow = "0 1px 4px rgba(0,0,0,0.04)"; }}
      >
        {done && <div style={{ position: "absolute", top: 8, right: 8, width: 22, height: 22, borderRadius: "50%", background: "#059669", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 12, color: "#fff" }}>✓</div>}
        <div style={{ padding: "14px 14px 12px" }}>
          <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 8 }}>
            <span style={{ background: lesson.color + "18", color: lesson.color, fontFamily: KC.ui, fontSize: 10, fontWeight: 700, padding: "2px 8px", borderRadius: 6, letterSpacing: 0.5, textTransform: "uppercase" }}>Week {lesson.week}</span>
            <span style={{ fontSize: 20 }}>{lesson.icon}</span>
          </div>
          <div style={{ fontFamily: KC.heading, fontSize: 15, fontWeight: 700, color: KC.text, lineHeight: 1.3, marginBottom: 4 }}>{lesson.title}</div>
          <div style={{ fontFamily: KC.ui, fontSize: 11, color: KC.muted, marginBottom: 8 }}>{lesson.bibleRef}</div>
          <div style={{ fontFamily: KC.body, fontSize: 12, color: KC.accent, fontStyle: "italic", lineHeight: 1.45, marginBottom: 10, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
            &ldquo;{lesson.keyVerse.split("—")[0].trim()}&rdquo;
          </div>
          <div style={{ display: "flex", alignItems: "center", gap: 6, flexWrap: "wrap" }}>
            <span style={{ background: tb.bg, color: tb.color, fontFamily: KC.ui, fontSize: 9, fontWeight: 600, padding: "2px 7px", borderRadius: 4 }}>{lesson.term}</span>
            {lesson.ageGroups.map(ag => {
              const ab = AGE_BADGES[ag];
              return <span key={ag} style={{ background: ab.bg, color: ab.color, fontFamily: KC.ui, fontSize: 9, fontWeight: 600, padding: "2px 7px", borderRadius: 4 }}>{ag}</span>;
            })}
          </div>
        </div>
        <div style={{ borderTop: `1px solid ${KC.divider}`, padding: "8px 14px", display: "flex", alignItems: "center", justifyContent: "space-between" }}>
          <span style={{ fontFamily: KC.ui, fontSize: 11, fontWeight: 600, color: KC.accent }}>View Lesson →</span>
          <span style={{ fontFamily: KC.body, fontSize: 11, color: KC.muted }}>{lesson.theme}</span>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════
  // RENDER — STORYBOOK SECTION WRAPPER
  // ═══════════════════════════════════════════════
  const Section = ({ icon, title, timing, children, collapsed, onToggle, altBg }) => (
    <div style={{ marginBottom: 0 }}>
      <div onClick={onToggle} style={{
        display: "flex", alignItems: "center", gap: 10, padding: "14px 20px",
        background: altBg || "#fff",
        cursor: onToggle ? "pointer" : "default",
        borderBottom: `1px solid ${KC.divider}`,
      }}>
        <span style={{ fontSize: 20 }}>{icon}</span>
        <div style={{ flex: 1 }}>
          <div style={{ fontFamily: KC.heading, fontSize: 15, fontWeight: 700, color: KC.text }}>{title}</div>
          {timing && <div style={{ fontFamily: KC.ui, fontSize: 10, color: KC.muted, marginTop: 1 }}>{timing}</div>}
        </div>
        {onToggle && <span style={{ fontSize: 13, color: KC.muted, transition: "transform 0.2s", transform: collapsed ? "rotate(0deg)" : "rotate(180deg)" }}>▼</span>}
      </div>
      {!collapsed && <div style={{ padding: "16px 20px", background: altBg || "#fff", borderBottom: `1px solid ${KC.divider}` }}>{children}</div>}
    </div>
  );

  const ScriptureBlock = ({ text }) => (
    <div style={{
      background: "#FFFBEB", border: "1px solid #FDE68A", borderLeft: "3px solid #D97706",
      borderRadius: 10, padding: "16px 18px",
      fontFamily: KC.body, fontSize: 14, color: "#78350F", lineHeight: 1.75, fontStyle: "italic",
      whiteSpace: "pre-line",
    }}>
      {text}
    </div>
  );

  // ═══════════════════════════════════════════════
  // RENDER — LESSON MODAL (STORYBOOK FLOW)
  // ═══════════════════════════════════════════════
  const LessonModal = () => {
    if (!modalOpen || !selectedLesson) return null;
    const L = selectedLesson;
    const age = ageFilter;
    const done = completedLessons.includes(L.week);

    const getAgeContent = (field) => {
      if (typeof field === "string") return field;
      return field[age] || field["6-8"] || "";
    };

    return (
      <div style={{
        position: "fixed", inset: 0, zIndex: 9999,
        background: "rgba(0,0,0,0.5)",
        opacity: animIn ? 1 : 0,
        transition: "opacity 0.28s ease",
      }} onClick={closeModal}>
        <div ref={modalRef} onClick={e => e.stopPropagation()} style={{
          position: "absolute", bottom: 0, left: 0, right: 0,
          maxHeight: "92vh", background: KC.bg,
          borderRadius: "20px 20px 0 0", overflow: "hidden",
          display: "flex", flexDirection: "column",
          transform: animIn ? "translateY(0)" : "translateY(100%)",
          transition: "transform 0.3s cubic-bezier(0.32,0.72,0,1)",
        }}>
          {/* ── Sticky Header ─────────────────── */}
          <div style={{
            background: L.color, padding: "16px 20px 14px",
            display: "flex", alignItems: "flex-start", gap: 12, flexShrink: 0,
          }}>
            <button onClick={closeModal} style={{ background: "rgba(255,255,255,0.2)", border: "none", borderRadius: 8, padding: "6px 10px", color: "#fff", fontSize: 15, cursor: "pointer", fontFamily: KC.ui }}>✕</button>
            <div style={{ flex: 1 }}>
              <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 4 }}>
                <span style={{ background: "rgba(255,255,255,0.2)", color: "#fff", fontFamily: KC.ui, fontSize: 10, fontWeight: 700, padding: "2px 8px", borderRadius: 6 }}>WEEK {L.week}</span>
                <span style={{ fontSize: 22 }}>{L.icon}</span>
              </div>
              <div style={{ fontFamily: KC.heading, fontSize: 20, fontWeight: 700, color: "#fff", lineHeight: 1.25 }}>{L.title}</div>
              <div style={{ fontFamily: KC.ui, fontSize: 12, color: "rgba(255,255,255,0.8)", marginTop: 4 }}>{L.bibleRef}</div>
            </div>
          </div>

          {/* ── Age Toggle ────────────────────── */}
          <div style={{
            display: "flex", gap: 6, padding: "10px 20px", background: "#fff",
            borderBottom: `1px solid ${KC.divider}`, flexShrink: 0,
          }}>
            {["3-5","6-8","9-12"].map(ag => {
              const ab = AGE_BADGES[ag];
              const active = ageFilter === ag;
              return (
                <button key={ag} onClick={() => setAgeFilter(ag)} style={{
                  flex: 1, padding: "7px 0", borderRadius: 8, border: "none",
                  background: active ? ab.bg : "#F3F4F6",
                  color: active ? ab.color : KC.muted,
                  fontFamily: KC.ui, fontSize: 12, fontWeight: active ? 700 : 500,
                  cursor: "pointer", transition: "all 0.15s",
                }}>
                  {ab.label}
                </button>
              );
            })}
          </div>

          {/* ── Scrollable Storybook ──────────── */}
          <div style={{ flex: 1, overflowY: "auto", WebkitOverflowScrolling: "touch" }}>

            {/* 1. Before We Start */}
            <Section icon="🌟" title="Before We Start" timing="5 minutes">
              <p style={{ fontFamily: KC.body, fontSize: 14.5, color: KC.text, lineHeight: 1.7, margin: 0 }}>{L.warmUp}</p>
            </Section>

            {/* 2. The Story */}
            <Section icon="📖" title="The Story" timing="10 minutes">
              <p style={{ fontFamily: KC.body, fontSize: 14.5, color: KC.text, lineHeight: 1.75, margin: 0 }}>
                {getAgeContent(L.story)}
              </p>
            </Section>

            {/* 3. Scripture */}
            <Section icon="📜" title="Scripture Reading" timing="5 minutes">
              <ScriptureBlock text={getAgeContent(L.scripture)} />
            </Section>

            {/* 4. Think About It */}
            <Section icon="💭" title="Think About It" timing="10 minutes">
              <p style={{ fontFamily: KC.ui, fontSize: 12, color: KC.muted, margin: "0 0 12px", lineHeight: 1.5 }}>Tap each question to reveal it. Talk about it with your family or class!</p>
              {L.discussionQuestions.map((q, i) => (
                <div key={i} onClick={() => toggleQ(i)} style={{
                  background: revealedQs[i] ? "#ECFDF5" : "#F9FAFB",
                  border: `1px solid ${revealedQs[i] ? "#A7F3D0" : KC.divider}`,
                  borderRadius: 10, padding: "12px 14px", marginBottom: 8,
                  cursor: "pointer", transition: "all 0.2s",
                }}>
                  <div style={{ display: "flex", alignItems: "flex-start", gap: 8 }}>
                    <span style={{
                      width: 24, height: 24, borderRadius: "50%",
                      background: revealedQs[i] ? KC.accent : "#D1D5DB",
                      color: "#fff", display: "flex", alignItems: "center", justifyContent: "center",
                      fontFamily: KC.ui, fontSize: 11, fontWeight: 700, flexShrink: 0, marginTop: 1,
                    }}>{i + 1}</span>
                    <span style={{
                      fontFamily: KC.body, fontSize: 14, color: revealedQs[i] ? KC.text : KC.muted,
                      lineHeight: 1.55, filter: revealedQs[i] ? "none" : "blur(4px)",
                      transition: "filter 0.25s, color 0.25s", userSelect: revealedQs[i] ? "auto" : "none",
                    }}>{q}</span>
                  </div>
                  {!revealedQs[i] && <div style={{ fontFamily: KC.ui, fontSize: 10, color: KC.accent, marginTop: 6, marginLeft: 32 }}>Tap to reveal</div>}
                </div>
              ))}
            </Section>

            {/* 5. Create & Explore */}
            <Section icon="🎨" title="Create & Explore" timing="15 minutes" altBg="#FEFCE8">
              {L.supplies && (
                <div style={{ background: "#FFF7ED", border: "1px solid #FDBA74", borderRadius: 8, padding: "10px 14px", marginBottom: 14 }}>
                  <div style={{ fontFamily: KC.ui, fontSize: 11, fontWeight: 700, color: "#9A3412", marginBottom: 4 }}>📦 You will need:</div>
                  <div style={{ fontFamily: KC.body, fontSize: 13, color: "#78350F", lineHeight: 1.6 }}>{L.supplies}</div>
                </div>
              )}
              <div style={{ fontFamily: KC.body, fontSize: 14.5, color: KC.text, lineHeight: 1.75, whiteSpace: "pre-line" }}>
                {getAgeContent(L.activities)}
              </div>
            </Section>

            {/* 6. Memory Verse */}
            <Section icon="✨" title="Memory Verse">
              <div style={{
                background: "linear-gradient(135deg, #ECFDF5 0%, #D1FAE5 100%)",
                border: "1px solid #A7F3D0", borderRadius: 12, padding: 20, textAlign: "center",
              }}>
                <div style={{ fontFamily: KC.heading, fontSize: 18, color: "#065F46", lineHeight: 1.6, fontStyle: "italic" }}>
                  &ldquo;{L.memoryVerse.split("—")[0].trim()}&rdquo;
                </div>
                <div style={{ fontFamily: KC.ui, fontSize: 12, color: "#059669", fontWeight: 600, marginTop: 8 }}>
                  — {L.memoryVerse.split("—").slice(1).join("—").trim()}
                </div>
              </div>
              <p style={{ fontFamily: KC.ui, fontSize: 12, color: KC.muted, textAlign: "center", marginTop: 10, lineHeight: 1.5 }}>
                Say this verse three times. Can you say it without looking? What is God telling you through these words?
              </p>
            </Section>

            {/* 7. What I Learned Today */}
            <Section icon="📝" title="What I Learned Today">
              <div style={{
                background: "#F0FDF4", border: "1px dashed #86EFAC", borderRadius: 10, padding: "16px 18px",
              }}>
                <p style={{ fontFamily: KC.body, fontSize: 14.5, color: KC.text, lineHeight: 1.7, margin: 0 }}>{L.reflection}</p>
              </div>
            </Section>

            {/* 8. Let's Pray */}
            <Section icon="🙏" title="Let's Pray">
              <div style={{
                background: "#EFF6FF", border: "1px solid #BFDBFE", borderRadius: 10, padding: "16px 18px",
              }}>
                <p style={{ fontFamily: KC.body, fontSize: 14.5, color: "#1E3A5F", lineHeight: 1.75, margin: 0, fontStyle: "italic" }}>{L.prayer}</p>
              </div>
            </Section>

            {/* 9. Parent & Teacher Notes */}
            <Section icon="👨‍🏫" title="Parent & Teacher Notes" collapsed={!parentNotesOpen} onToggle={() => setParentNotesOpen(!parentNotesOpen)} altBg="#F9FAFB">
              <div style={{
                background: "#F3F4F6", border: "1px solid #D1D5DB", borderRadius: 10, padding: "16px 18px",
              }}>
                <p style={{ fontFamily: KC.body, fontSize: 13.5, color: "#374151", lineHeight: 1.8, margin: 0 }}>{L.teacherNote}</p>
              </div>
            </Section>

            {/* ── Mark as Taught ───────────────── */}
            <div style={{ padding: "20px 20px 40px", textAlign: "center" }}>
              <button onClick={() => toggleComplete(L.week)} style={{
                padding: "14px 32px", borderRadius: 12, border: "none",
                background: done ? "#F3F4F6" : KC.accent,
                color: done ? KC.muted : "#fff",
                fontFamily: KC.ui, fontSize: 15, fontWeight: 700, cursor: "pointer",
                transition: "all 0.2s",
                boxShadow: done ? "none" : "0 2px 8px rgba(5,150,105,0.3)",
              }}>
                {done ? "✓ Lesson Complete" : "Mark Lesson as Taught"}
              </button>
            </div>
          </div>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════
  // RENDER — MAIN
  // ═══════════════════════════════════════════════
  return (
    <div style={{ minHeight: "100vh", background: KC.bg }}>

      {/* ── Hero ──────────────────────────────── */}
      <div style={{ background: KC.hero, padding: "20px 20px 24px", position: "relative" }}>
        <button onClick={() => nav("learn-home")} style={{
          background: "rgba(255,255,255,0.15)", border: "none", borderRadius: 8,
          padding: "6px 12px", color: "#fff", fontFamily: KC.ui, fontSize: 13,
          cursor: "pointer", marginBottom: 14,
        }}>← Back</button>

        <div style={{ display: "flex", alignItems: "center", gap: 12, marginBottom: 8 }}>
          <span style={{ fontSize: 36 }}>🧒</span>
          <div>
            <h1 style={{ fontFamily: KC.heading, fontSize: 24, fontWeight: 700, color: "#fff", margin: 0, lineHeight: 1.2 }}>Kids Church Curriculum</h1>
            <p style={{ fontFamily: KC.ui, fontSize: 13, color: "rgba(255,255,255,0.8)", margin: "4px 0 0" }}>52 weeks · Ages 3–12 · KJV Bible</p>
          </div>
        </div>

        {/* Stats */}
        <div style={{ display: "flex", gap: 12, marginTop: 14 }}>
          {[
            { n: "52", l: "Lessons" },
            { n: "4", l: "Terms" },
            { n: "3", l: "Age Groups" },
            { n: String(completedCount), l: "Taught" },
          ].map((s, i) => (
            <div key={i} style={{
              flex: 1, background: "rgba(255,255,255,0.12)", borderRadius: 10,
              padding: "8px 0", textAlign: "center",
            }}>
              <div style={{ fontFamily: KC.heading, fontSize: 18, fontWeight: 700, color: "#fff" }}>{s.n}</div>
              <div style={{ fontFamily: KC.ui, fontSize: 10, color: "rgba(255,255,255,0.7)" }}>{s.l}</div>
            </div>
          ))}
        </div>

        {completedCount > 0 && (
          <div style={{ marginTop: 12 }}>
            <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 4 }}>
              <span style={{ fontFamily: KC.ui, fontSize: 10, color: "rgba(255,255,255,0.7)" }}>Year Progress</span>
              <span style={{ fontFamily: KC.ui, fontSize: 10, color: "rgba(255,255,255,0.9)", fontWeight: 700 }}>{progressPct}%</span>
            </div>
            <div style={{ height: 6, borderRadius: 3, background: "rgba(255,255,255,0.15)" }}>
              <div style={{ height: 6, borderRadius: 3, background: "#fff", width: `${progressPct}%`, transition: "width 0.4s ease" }} />
            </div>
          </div>
        )}
      </div>

      {/* ── Tabs ──────────────────────────────── */}
      <div style={{
        display: "flex", background: "#fff", borderBottom: `1px solid ${KC.divider}`,
        position: "sticky", top: 0, zIndex: 100,
      }}>
        {["lessons", "progress"].map(tab => (
          <button key={tab} onClick={() => setActiveTab(tab)} style={{
            flex: 1, padding: "12px 0", border: "none", background: "transparent",
            borderBottom: activeTab === tab ? `2px solid ${KC.accent}` : "2px solid transparent",
            fontFamily: KC.ui, fontSize: 13, fontWeight: activeTab === tab ? 700 : 500,
            color: activeTab === tab ? KC.accent : KC.muted,
            cursor: "pointer", transition: "all 0.15s",
          }}>
            {tab === "lessons" ? "📚 Lessons" : "📊 My Progress"}
          </button>
        ))}
      </div>

      {/* ═══════════════════════════════════════ */}
      {/* LESSONS TAB                            */}
      {/* ═══════════════════════════════════════ */}
      {activeTab === "lessons" && (
        <div>
          {/* Term filter */}
          <div style={{ padding: "12px 16px 0", display: "flex", gap: 6, flexWrap: "wrap" }}>
            {["All","Term 1","Term 2","Term 3","Term 4"].map(t => {
              const active = termFilter === t;
              const tb = TERM_BADGES[t] || {};
              return (
                <button key={t} onClick={() => { setTermFilter(t); setMonthFilter("All"); }} style={{
                  padding: "6px 12px", borderRadius: 20, border: "none",
                  background: active ? (t === "All" ? KC.accent : tb.bg) : "#F3F4F6",
                  color: active ? (t === "All" ? "#fff" : tb.color) : KC.muted,
                  fontFamily: KC.ui, fontSize: 11, fontWeight: active ? 700 : 500,
                  cursor: "pointer", transition: "all 0.15s",
                }}>
                  {t}
                </button>
              );
            })}
          </div>

          {/* Month filter */}
          <div style={{ padding: "8px 16px 12px", display: "flex", gap: 4, overflowX: "auto", WebkitOverflowScrolling: "touch" }}>
            {MONTHS.map(m => {
              const active = monthFilter === m.label;
              return (
                <button key={m.label} onClick={() => { setMonthFilter(m.label); if (m.label !== "All") setTermFilter("All"); }} style={{
                  padding: "5px 10px", borderRadius: 16, border: `1px solid ${active ? KC.accent : KC.divider}`,
                  background: active ? KC.accentLight : "#fff",
                  color: active ? KC.accent : KC.muted,
                  fontFamily: KC.ui, fontSize: 10, fontWeight: active ? 700 : 500,
                  cursor: "pointer", transition: "all 0.15s", whiteSpace: "nowrap", flexShrink: 0,
                }}>
                  {m.label}
                </button>
              );
            })}
          </div>

          {/* Age filter */}
          <div style={{ padding: "0 16px 14px", display: "flex", gap: 6 }}>
            <span style={{ fontFamily: KC.ui, fontSize: 11, color: KC.muted, alignSelf: "center", marginRight: 4 }}>Viewing for:</span>
            {["3-5","6-8","9-12"].map(ag => {
              const ab = AGE_BADGES[ag];
              const active = ageFilter === ag;
              return (
                <button key={ag} onClick={() => setAgeFilter(ag)} style={{
                  padding: "5px 12px", borderRadius: 16, border: "none",
                  background: active ? ab.bg : "#F3F4F6",
                  color: active ? ab.color : KC.muted,
                  fontFamily: KC.ui, fontSize: 11, fontWeight: active ? 700 : 500,
                  cursor: "pointer", transition: "all 0.15s",
                }}>
                  {ab.label}
                </button>
              );
            })}
          </div>

          {/* Lesson grid */}
          <div style={{
            display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(280px, 1fr))",
            gap: 12, padding: "0 16px 30px",
          }}>
            {filteredLessons.length > 0 ? filteredLessons.map(l => LessonCard(l)) : (
              <div style={{ gridColumn: "1 / -1", textAlign: "center", padding: 40 }}>
                <div style={{ fontSize: 40, marginBottom: 12 }}>📭</div>
                <div style={{ fontFamily: KC.heading, fontSize: 16, color: KC.text }}>No lessons yet for this period</div>
                <div style={{ fontFamily: KC.ui, fontSize: 13, color: KC.muted, marginTop: 6 }}>More lessons are being added — check back soon!</div>
              </div>
            )}
          </div>
        </div>
      )}

      {/* ═══════════════════════════════════════ */}
      {/* PROGRESS TAB                           */}
      {/* ═══════════════════════════════════════ */}
      {activeTab === "progress" && (
        <div style={{ padding: "20px 16px 40px" }}>
          <div style={{
            background: "#fff", borderRadius: 14, padding: 20,
            border: `1px solid ${KC.divider}`, marginBottom: 16, textAlign: "center",
          }}>
            <div style={{ fontFamily: KC.heading, fontSize: 36, fontWeight: 700, color: KC.accent }}>{completedCount}</div>
            <div style={{ fontFamily: KC.ui, fontSize: 13, color: KC.muted }}>of 52 lessons taught</div>
            <div style={{ height: 8, borderRadius: 4, background: "#E5E7EB", marginTop: 14 }}>
              <div style={{ height: 8, borderRadius: 4, background: KC.accent, width: `${progressPct}%`, transition: "width 0.4s ease" }} />
            </div>
            <div style={{ fontFamily: KC.ui, fontSize: 12, color: KC.accent, fontWeight: 600, marginTop: 8 }}>{progressPct}% complete</div>
          </div>

          {completedCount === 0 ? (
            <div style={{ textAlign: "center", padding: 30 }}>
              <div style={{ fontSize: 48, marginBottom: 12 }}>🌱</div>
              <div style={{ fontFamily: KC.heading, fontSize: 17, color: KC.text }}>Your journey begins here!</div>
              <div style={{ fontFamily: KC.body, fontSize: 14, color: KC.muted, marginTop: 8, lineHeight: 1.6 }}>Open any lesson and tap &ldquo;Mark Lesson as Taught&rdquo; when you finish. Your progress will appear here.</div>
            </div>
          ) : (
            <div>
              <div style={{ fontFamily: KC.heading, fontSize: 16, color: KC.text, marginBottom: 12 }}>Completed Lessons</div>
              {LESSONS.filter(l => completedLessons.includes(l.week)).map(l => (
                <div key={l.week} onClick={() => openLesson(l)} style={{
                  display: "flex", alignItems: "center", gap: 12,
                  background: "#fff", borderRadius: 10, padding: "12px 14px",
                  border: `1px solid ${KC.divider}`, marginBottom: 8, cursor: "pointer",
                  borderLeft: `4px solid ${l.color}`,
                }}>
                  <span style={{ fontSize: 22 }}>{l.icon}</span>
                  <div style={{ flex: 1 }}>
                    <div style={{ fontFamily: KC.heading, fontSize: 14, fontWeight: 600, color: KC.text }}>Week {l.week}: {l.title}</div>
                    <div style={{ fontFamily: KC.ui, fontSize: 11, color: KC.muted }}>{l.bibleRef}</div>
                  </div>
                  <span style={{ width: 24, height: 24, borderRadius: "50%", background: "#059669", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 12, color: "#fff", flexShrink: 0 }}>✓</span>
                </div>
              ))}
            </div>
          )}

          {completedCount >= 52 && (
            <div style={{
              background: "linear-gradient(135deg, #ECFDF5, #D1FAE5)", borderRadius: 14,
              padding: 24, textAlign: "center", marginTop: 16,
              border: "1px solid #A7F3D0",
            }}>
              <div style={{ fontSize: 48, marginBottom: 8 }}>🎉</div>
              <div style={{ fontFamily: KC.heading, fontSize: 20, fontWeight: 700, color: "#065F46" }}>Congratulations!</div>
              <div style={{ fontFamily: KC.body, fontSize: 14, color: "#047857", lineHeight: 1.6, marginTop: 8 }}>You have completed all 52 lessons! A full year of God's Word, from Creation to the New Creation. Well done, good and faithful servant!</div>
            </div>
          )}
        </div>
      )}

      {/* ── Modal ─────────────────────────────── */}
      {LessonModal()}
    </div>
  );
}