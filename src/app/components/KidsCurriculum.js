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
      "9-12": "🎨 Create an illustrated 'Seven Days of Creation' journal page — draw or paint each day with its key creation, and write the matching verse underneath each one. Make it beautiful enough to frame!\n\n✍️ Write a poem or hymn praising God as Creator. Include at least 5 specific things from Genesis 1. Decorate the border of your poem with drawings of creation."
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
      "9-12": "📖 Make a 'Scarlet Thread' bookmark: cut a long red ribbon or paper strip. Write Genesis 3:15 at the top — the first promise of a rescuer. You'll add more verses to this bookmark as the year goes on, tracing God's rescue plan through the whole Bible.\n\n✍️ Write a diary entry from Eve's perspective on the day of the Fall. What did she see, feel, and think? End with what she might have felt when God made the promise in Genesis 3:15."
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
      "9-12": "📖 Design an illustrated 'Covenant Poster' — draw the ark, the rainbow, and write out Genesis 9:13. Around the border, list every covenant you can find in the Bible so far. Leave space to add more as the year continues!\n\n✍️ The word 'grace' appears for the first time in Genesis 6:8. Create a hand-lettered artwork of the word GRACE with your own definition written inside or around the letters. Decorate it with images from Noah's story."
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
      "9-12": "🎨 Create a side-by-side poster: BABEL on the left, PENTECOST on the right. Illustrate both scenes — the tower and confused people vs. the flames and united people. Write the key verse for each and draw arrows showing how God reversed what happened at Babel.\n\n✍️ Design your own tower on paper. On each floor write something people today try to use to 'make a name' for themselves. Then write above the tower what God says matters instead. Make it into a poster you could show your class."
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

  // ── Week 5 ──────────────────────────────────
  {
    week: 5,
    title: "God Calls Abraham",
    bibleRef: "Genesis 12:1–9; 15:1–6",
    keyVerse: "And he believed in the LORD; and he counted it to him for righteousness. — Genesis 15:6",
    theme: "Faith & Calling",
    term: "Term 1",
    month: "Feb",
    icon: "⭐",
    color: "#D97706",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever moved to a new place — a new house, a new school? Were you scared? Excited? Today we meet a man who left EVERYTHING behind because God asked him to!",

    story: {
      "3-5": "God spoke to a man called Abram and said, 'Leave your home and go to a place I will show you.' That was a big ask! Abram didn't know where he was going. But he trusted God and went. God made wonderful promises to Abram: 'I will give you a big family. I will bless you. And through your family, the whole world will be blessed!' One night God said, 'Look up at the stars — count them if you can! That's how big your family will be.' Abram believed God, and God was very pleased.",
      "6-8": "God called a man named Abram to leave his home city of Ur and go to a land God would show him. God made three amazing promises: a great nation would come from him, his name would be great, and ALL families on earth would be blessed through him. Abram didn't know where he was going — but he trusted God and went. Later, God told Abram to look at the stars — that's how many descendants he would have. Abram believed God, and God counted his faith as righteousness. God changed his name to Abraham, meaning 'father of many nations.'",
      "9-12": "The call of Abram in Genesis 12 is one of the great turning points of the Bible. After Babel scattered humanity, God begins His rescue plan — not through a nation or an army, but through one ordinary man. God makes three promises: land, descendants, and blessing to all nations. Abram's response is remarkable — he 'went out, not knowing whither he went' (Hebrews 11:8). In Genesis 15, God makes a covenant with Abram. When Abram asks how he can know God will keep His word, God performs an ancient covenant ceremony — passing between the halved animals as a smoking furnace and burning lamp. Critically, only God passes through — He binds Himself unilaterally. And the key verse (Genesis 15:6) becomes the foundation of Paul's doctrine of justification by faith in Romans 4 and Galatians 3. Abraham was saved by believing God — not by circumcision or the Law, which came later."
    },

    scripture: {
      "3-5": "And he believed in the LORD; and he counted it to him for righteousness.\n— Genesis 15:6",
      "6-8": "Now the LORD had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee: And I will make of thee a great nation, and I will bless thee.\n— Genesis 12:1–2\n\nAnd he believed in the LORD; and he counted it to him for righteousness.\n— Genesis 15:6",
      "9-12": "Now the LORD had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee: And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.\n— Genesis 12:1–2\n\nAnd he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be. And he believed in the LORD; and he counted it to him for righteousness.\n— Genesis 15:5–6\n\nFor what saith the scripture? Abraham believed God, and it was counted unto him for righteousness.\n— Romans 4:3"
    },

    activities: {
      "3-5": "⭐ Count as many stars as you can on a dark piece of paper with white dots or stickers. God told Abraham his family would be that big!\n\n🎨 Draw Abraham looking up at a sky FULL of stars. Write 'God keeps His promises' at the top.",
      "6-8": "🗺️ Make a map showing Abraham's journey from Ur to Haran to Canaan. How far did he travel? (Hint: about 1,000 miles!)\n\n📖 God made 3 promises to Abraham: land, family, and blessing. Can you find where each one comes true in the Bible?",
      "9-12": "🗺️ Create a detailed illustrated map of Abraham's journey from Ur to Haran to Canaan. Mark each stop, add drawings of key events (the call, the stars, the covenant ceremony), and write the matching Bible verse at each location.\n\n✍️ Write a letter from Abraham to his family back in Ur, explaining why he left everything behind. What would he say about God's promises? Make it feel real — include details about the journey, his feelings, and his faith."
    },

    supplies: "Dark paper (black or navy), white crayons or star stickers, glue, markers, large paper for map drawing",

    discussionQuestions: [
      "Have you ever had to trust someone when you didn't know what would happen?",
      "God promised Abraham things he couldn't see yet. What has God promised us that we haven't seen yet?",
      "How does the promise to Abraham — blessing for all nations — come true in Jesus?"
    ],

    reflection: "Today I learned that Abraham trusted God even when he didn't know where he was going. God counts our faith as the most important thing — not how good we are, but whether we believe Him.",

    prayer: "Dear God, thank You for Abraham's example of faith. Help me to trust You even when I can't see what's ahead. I believe Your promises are true — just like Abraham did. Amen.",

    teacherNote: "The Abrahamic covenant is foundational to the whole Bible. Three promises: land, descendants, blessing to all nations. Paul quotes Genesis 15:6 in Romans and Galatians as the foundation of justification by faith. Make sure older children understand that Abraham was saved by faith — not by circumcision or the Law, which came later. The covenant ceremony in Genesis 15:17 is extraordinary — in ancient Near Eastern custom, both parties walked between the pieces, but here only God passes through. He takes the full obligation upon Himself. This is pure grace — a pattern that finds its fulfilment in the cross.",

    memoryVerse: "And he believed in the LORD; and he counted it to him for righteousness. — Genesis 15:6",
  },

  // ── Week 6 ──────────────────────────────────
  {
    week: 6,
    title: "Abraham and Isaac — The Ultimate Test",
    bibleRef: "Genesis 22:1–19",
    keyVerse: "God will provide himself a lamb. — Genesis 22:8",
    theme: "Obedience & Substitution",
    term: "Term 1",
    month: "Feb",
    icon: "🐑",
    color: "#065F46",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "What is the hardest thing anyone has ever asked you to do? Did you do it? Today we will learn about the hardest thing God EVER asked someone to do — and how it points us to Jesus.",

    story: {
      "3-5": "God gave Abraham and Sarah a son called Isaac. They loved him SO much! One day, God asked Abraham to do something very, very hard — to give Isaac back to God on a mountain. Abraham was very sad, but he trusted God completely. He took Isaac up the mountain. But just as Abraham was about to obey, God said 'STOP! Now I know you trust me with everything.' Then Abraham saw a ram caught in some bushes nearby. God had provided the ram to take Isaac's place! Abraham called that place 'The LORD Will Provide.'",
      "6-8": "God tested Abraham in the hardest way possible — He asked him to offer his only son Isaac as a sacrifice. Abraham loved Isaac more than anything in the world. But he trusted God completely. He took Isaac to Mount Moriah and built an altar. Isaac even carried the wood on his back. When Isaac asked, 'Where is the lamb?' Abraham answered with one of the most faith-filled sentences in the Bible: 'God will provide himself a lamb.' Just as Abraham raised the knife, God's angel called out: 'STOP!' God provided a ram caught in the bushes to take Isaac's place. This story points us forward to Jesus — God's own Son — who would one day be the Lamb of God.",
      "9-12": "Genesis 22 is the most important type (shadow) of Christ in the entire Old Testament. God asks Abraham to sacrifice Isaac — the son of promise, the one through whom all the covenant promises would be fulfilled. The journey takes three days (the same duration between the crucifixion and resurrection). Isaac carries the wood on his back, just as Jesus carried His cross. The location — Mount Moriah — is the same ridge where Solomon's temple would be built, and where Jesus would be crucified. Abraham's words in verse 8 are prophetic: 'God will provide himself a lamb.' The ram caught in the thicket is a substitute — it dies so Isaac lives. Hebrews 11:17–19 tells us Abraham believed God could raise Isaac from the dead. He had resurrection faith. And the key insight: Isaac was not a passive victim — as a young man he could have overpowered his elderly father. His willing submission mirrors Christ's willing sacrifice. The substitution theme — an innocent one dying in place of another — is the heart of the gospel."
    },

    scripture: {
      "3-5": "God will provide himself a lamb.\n— Genesis 22:8",
      "6-8": "And Abraham said, My son, God will provide himself a lamb for a burnt offering: so they went both of them together.\n— Genesis 22:8\n\nAnd Abraham called the name of that place Jehovahjireh: as it is said to this day, In the mount of the LORD it shall be seen.\n— Genesis 22:14",
      "9-12": "And Abraham said, My son, God will provide himself a lamb for a burnt offering: so they went both of them together.\n— Genesis 22:8\n\nAnd Abraham called the name of that place Jehovahjireh.\n— Genesis 22:14\n\nBy faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son... Accounting that God was able to raise him up, even from the dead; from whence also he received him in a figure.\n— Hebrews 11:17, 19\n\nBehold the Lamb of God, which taketh away the sin of the world.\n— John 1:29"
    },

    activities: {
      "3-5": "🐑 Draw the ram caught in the bush. Write 'God always provides!' underneath. What has God given your family?\n\n🎨 Make a paper ram from cotton wool and card. Glue cotton balls onto a sheep shape and write 'The LORD Will Provide' at the bottom.",
      "6-8": "📖 Make a timeline showing how God's plan unfolds: Abraham's test (Genesis 22) → Passover lamb (Exodus 12) → John the Baptist says 'Behold the Lamb of God' (John 1:29) → The cross. Draw a picture for each step.\n\n🐑 Make a cotton wool lamb and write Genesis 22:8 on it.",
      "9-12": "🎨 Create an illustrated two-column comparison poster: 'MOUNT MORIAH → MOUNT CALVARY.' On the left draw Genesis 22, on the right draw the crucifixion. Draw lines connecting every parallel: the beloved son, the wood carried on the back, the three-day journey, the substitute, the mountain. Make it a teaching tool you could show someone.\n\n✍️ Write a short story from Isaac's perspective. He's walking up the mountain carrying the wood. What is he thinking? What does he feel when he sees the altar? When the ram appears? Try to capture the emotion of that moment."
    },

    supplies: "Cotton wool or cotton balls, card/cardboard, glue, scissors, markers, brown paper for ram shape",

    discussionQuestions: [
      "Why do you think God tested Abraham this way?",
      "What does it mean for God to 'provide' something? Can you think of a time He provided for you?",
      "Jesus is called the Lamb of God. How is He like the ram in this story? How is He different?"
    ],

    reflection: "Today I learned that God tested Abraham's trust and provided a ram to take Isaac's place. This points to Jesus — God provided His own Son to take OUR place. The LORD will always provide!",

    prayer: "Dear God, thank You that You always provide what we need. Thank You most of all for providing Jesus — the Lamb of God — to take our place. Help me to trust You the way Abraham did. Amen.",

    teacherNote: "This is the most important type/shadow in the Pentateuch. The ram as substitute, the mountain (Moriah — the same hill as Calvary), the three-day journey (Genesis 22:4, cf. the resurrection). For older children: Isaac was not a passive victim — as a young man he could have overpowered his elderly father. His willing submission mirrors Christ. Don't soften the substitution motif — this is the heart of the gospel. The phrase 'God will provide himself a lamb' is doubly prophetic: God will provide a lamb, and God will provide Himself as the lamb. Jehovahjireh ('the LORD will provide') is one of the compound names of God that reveals His character.",

    memoryVerse: "God will provide himself a lamb. — Genesis 22:8",
  },

  // ── Week 7 ──────────────────────────────────
  {
    week: 7,
    title: "Jacob and Esau — God's Surprising Choice",
    bibleRef: "Genesis 25:19–34; 28:10–22",
    keyVerse: "I am with thee, and will keep thee in all places whither thou goest. — Genesis 28:15",
    theme: "Grace & God's Sovereignty",
    term: "Term 1",
    month: "Feb",
    icon: "🪜",
    color: "#1D4ED8",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever had a dream that felt really real? What was it about? Today we will learn about a man who had the most AMAZING dream — a staircase reaching all the way to heaven!",

    story: {
      "3-5": "Isaac grew up and had twin sons — Esau and Jacob. Esau was big and hairy and loved the outdoors. Jacob was quieter and stayed near the tents. Jacob wasn't always honest — he tricked his brother and his father. But God chose Jacob to carry on Abraham's special promise. One night, when Jacob was sleeping outside with a rock for a pillow, he had an amazing dream: a giant staircase going up to heaven, with angels walking up and down! God stood at the top and said, 'I am with you. I will keep you wherever you go.' Jacob called that place Bethel — it means 'House of God.'",
      "6-8": "Isaac had twin sons — Esau and Jacob. Esau was born first and was strong and hairy. Jacob came second, grabbing Esau's heel. Jacob was clever but not always good — he tricked his brother out of his birthright and stole his father's blessing. But God chose Jacob to carry on the covenant promises. One night, fleeing from his angry brother, Jacob slept under the stars. He dreamed of a staircase reaching to heaven with angels ascending and descending. God stood above it and repeated the promises He had made to Abraham and Isaac: land, descendants, and blessing for all nations. When Jacob woke up he said, 'Surely the LORD is in this place, and I knew it not!' He named it Bethel — 'House of God.'",
      "9-12": "The story of Jacob and Esau is about God's sovereign grace — His freedom to choose whom He will, for reasons that are His alone. Before the twins were born, God told Rebekah that 'the elder shall serve the younger' (Genesis 25:23). Paul uses this in Romans 9:10–13 to explain that God's choice is not based on works but on His own purpose. Jacob was a deceiver — his name literally means 'heel-grabber' or 'supplanter.' He cheated Esau and lied to Isaac. Yet God chose him. This is grace: God doesn't choose the deserving. At Bethel, Jacob — alone, afraid, and guilty — receives the covenant promises. The ladder (or staircase) connecting heaven and earth is later interpreted by Jesus Himself in John 1:51: 'Ye shall see heaven open, and the angels of God ascending and descending upon the Son of man.' Jesus IS the ladder — the one who connects God and humanity. The staircase at Babel went nowhere; the staircase at Bethel connects heaven and earth through grace."
    },

    scripture: {
      "3-5": "I am with thee, and will keep thee in all places whither thou goest.\n— Genesis 28:15",
      "6-8": "And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of God ascending and descending on it.\n— Genesis 28:12\n\nI am with thee, and will keep thee in all places whither thou goest.\n— Genesis 28:15",
      "9-12": "And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of God ascending and descending on it. And, behold, the LORD stood above it, and said, I am the LORD God of Abraham thy father, and the God of Isaac.\n— Genesis 28:12–13\n\nI am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land.\n— Genesis 28:15\n\nAnd he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of God ascending and descending upon the Son of man.\n— John 1:51"
    },

    activities: {
      "3-5": "🪜 Draw Jacob's dream ladder reaching up to heaven. Who is at the top? Draw angels going up and down the steps!\n\n🎨 Make a ladder from craft sticks and string. Hang a paper angel on it.",
      "6-8": "🎭 Make a 'heel-grabber' hand puppet for Jacob and a hairy Esau puppet from a paper bag. Act out the story of the birthright and the blessing.\n\n📖 Jacob saw angels going up and down the ladder. In John 1:51, Jesus says HE is the ladder. Draw a picture showing how Jesus connects heaven and earth.",
      "9-12": "🪜 Build a Jacob's Ladder craft — use cardboard strips and ribbon to make a real Jacob's ladder toy (look up instructions). On each rung, write one of God's promises to Jacob. At the top write John 1:51 — Jesus is the true ladder.\n\n🎨 Create a 'BABEL vs. BETHEL' contrast poster. Draw the tower on one side and the ladder on the other. Label who is reaching in each scene. At Babel, humans reach UP. At Bethel, God reaches DOWN. Write a sentence explaining why this matters."
    },

    supplies: "Craft sticks, string, paper bags, cotton wool (for Esau's hair), markers, large paper, glue",

    discussionQuestions: [
      "Jacob wasn't very good — he cheated and lied. Why would God choose him?",
      "Has God ever been with you in a place that felt scary or unknown?",
      "Jacob's ladder connects heaven and earth. In John 1:51, Jesus says HE is the ladder. What does that mean?"
    ],

    reflection: "Today I learned that God chose Jacob — even though Jacob was not a good person. God's love is not about what we deserve. He is with us everywhere we go, even when we don't realise it!",

    prayer: "Dear God, thank You that You don't choose us because we are perfect — You choose us because of Your grace. Thank You for being with me in every place, just like You were with Jacob. Help me to see You in my life today. Amen.",

    teacherNote: "Don't skip over Jacob's moral failures — they make grace more glorious. God's choice of Jacob is the foundation of Paul's argument about election in Romans 9. The ladder is explicitly interpreted by Jesus in John 1:51 as a picture of Himself: the one who opens the way between God and humanity. The contrast with Babel is powerful: at Babel, humans tried to build their way up to God (and failed). At Bethel, God comes down to a sinful man sleeping on the ground. This is always the direction of grace — God descends to us. Jacob's name is later changed to Israel ('he struggles with God'), which becomes the name of God's people.",

    memoryVerse: "I am with thee, and will keep thee in all places whither thou goest. — Genesis 28:15",
  },

  // ── Week 8 ──────────────────────────────────
  {
    week: 8,
    title: "Joseph — The Pit to the Palace",
    bibleRef: "Genesis 37; 39–50",
    keyVerse: "But as for you, ye thought evil against me; but God meant it unto good. — Genesis 50:20",
    theme: "Suffering & Providence",
    term: "Term 1",
    month: "Feb",
    icon: "🌈",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever had something really unfair happen to you? How did it make you feel? Today we will learn about a young man who went through the WORST things — and how God used every single one of them for good.",

    story: {
      "3-5": "Jacob had a son called Joseph. Joseph was his favourite, and Jacob gave him a beautiful coat of many colours. Joseph's brothers were SO jealous. They did something terrible — they threw Joseph into a deep pit and then sold him to strangers going to Egypt. Poor Joseph! He was far from home and became a slave. But God was with Joseph in every hard place. Even when Joseph was put in prison for something he didn't do, God helped him. One day, the king of Egypt had a scary dream, and Joseph explained it. The king was so amazed that he made Joseph the second most important person in all of Egypt! Later, Joseph's brothers came to Egypt for food — and Joseph forgave them!",
      "6-8": "Joseph was Jacob's favourite son, and his brothers were deeply jealous. They sold him as a slave to traders heading to Egypt. In Egypt, Joseph served in a rich man's house, but was falsely accused and thrown in prison. Yet God was with Joseph in every hard place. God gave Joseph the ability to interpret dreams. When Pharaoh had terrifying dreams that no one could explain, Joseph was brought from prison to help. He told Pharaoh that seven years of plenty would be followed by seven years of famine — and that Egypt must prepare. Pharaoh made Joseph second in command of all Egypt! When the famine came, Joseph's brothers came to Egypt for food. Joseph could have taken revenge — but instead he forgave them and said, 'You meant it for evil, but God meant it for good, to save many people alive.'",
      "9-12": "Joseph's story spans 14 chapters of Genesis and is the most complete 'type' (foreshadowing) of Christ in the Old Testament. Consider the parallels: both were beloved sons of their fathers, both were betrayed by those closest to them, both were sold for pieces of silver, both suffered unjustly, both were raised from a place of humiliation to the highest position, and both ended up saving the very people who rejected them. Joseph's journey — from favourite son to the pit, to slavery, to prison, to the throne — reveals God's providence at work in suffering. The key verse (Genesis 50:20) is one of the most profound statements in all Scripture: what humans intended as evil, God intended for good. This is not a denial of suffering but a declaration that God is sovereign over it. Paul echoes this exact principle in Romans 8:28. For Joseph, forgiveness was not cheap — he wept. But it was real and complete. This points to the costly forgiveness of the cross."
    },

    scripture: {
      "3-5": "But as for you, ye thought evil against me; but God meant it unto good.\n— Genesis 50:20",
      "6-8": "But as for you, ye thought evil against me; but God meant it unto good, to bring to pass, as it is this day, to save much people alive.\n— Genesis 50:20\n\nAnd the LORD was with Joseph, and he was a prosperous man.\n— Genesis 39:2",
      "9-12": "But as for you, ye thought evil against me; but God meant it unto good, to bring to pass, as it is this day, to save much people alive.\n— Genesis 50:20\n\nAnd the LORD was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian. And his master saw that the LORD was with him, and that the LORD made all that he did to prosper in his hand.\n— Genesis 39:2–3\n\nAnd we know that all things work together for good to them that love God, to them who are the called according to his purpose.\n— Romans 8:28"
    },

    activities: {
      "3-5": "🎨 Make a multi-coloured coat from strips of coloured paper glued onto a coat shape. Just like Joseph's special coat! Write 'God is with me' on the back.\n\n🌈 Draw Joseph in his beautiful coat, then draw Joseph as a ruler in Egypt. God turned the sad story into a happy one!",
      "6-8": "🗺️ Make a story map: Coat → Pit → Potiphar's house → Prison → Palace. Write what Joseph learned at each stage. How was God working at each point?\n\n📖 Joseph forgave his brothers even though they were very cruel. Write a letter of forgiveness to someone (you don't have to send it — it's between you and God).",
      "9-12": "🎨 Create a 'Joseph → Jesus' illustrated parallel poster with two columns. Draw a scene from Joseph's life on the left and the matching scene from Jesus' life on the right: betrayed by brothers / betrayed by Judas, sold for silver / sold for silver, pit & prison / tomb, raised to the throne / raised from the dead. Make it colourful and detailed.\n\n✍️ Create a woven 'coat of many colours' from strips of coloured paper. On each strip, write one of God's promises from Genesis. Weave them together to show how God's plan holds together even through suffering."
    },

    supplies: "Strips of coloured paper, coat template (large paper cut in coat shape), glue, scissors, markers, crayons",

    discussionQuestions: [
      "When bad things happen, is it possible God is still in control? How does Joseph's story help us believe that?",
      "Joseph forgave his brothers. Have you ever had to forgive someone who hurt you badly?",
      "What does 'God meant it unto good' tell us about how God uses suffering?"
    ],

    reflection: "Today I learned that even when terrible things happened to Joseph, God was with him the whole time. God can take the worst things and turn them into something good. He does the same for me!",

    prayer: "Dear God, when hard or unfair things happen to me, help me to remember Joseph. You were with him in the pit, in prison, and in the palace. You are with me too. Help me to trust that You are working all things for good. Amen.",

    teacherNote: "Joseph is the most complete type of Christ in Genesis — the parallel is too detailed to be accidental. The key verse (Genesis 50:20) is a profound statement of divine providence and is directly echoed by Paul in Romans 8:28. Don't hurry the suffering sections — children need to understand that God is present in hard times before they can understand that He redeems them. Joseph's forgiveness is worth dwelling on: he doesn't minimise what his brothers did ('ye thought evil against me'), but he sees God's hand behind the human evil. This is the biblical theology of suffering: not that God causes evil, but that He is sovereign over it and can bring good from it. End of February — recap the arc: Abraham believed → Isaac was spared → Jacob was chosen → Joseph suffered and triumphed. In every generation, God keeps His covenant promises despite human failure.",

    memoryVerse: "But as for you, ye thought evil against me; but God meant it unto good. — Genesis 50:20",
  },

  // ── Week 9 ──────────────────────────────────
  {
    week: 9,
    title: "Moses — The Burning Bush",
    bibleRef: "Exodus 2:1–10; 3:1–4:17",
    keyVerse: "I AM THAT I AM. — Exodus 3:14",
    theme: "God's Name & Call",
    term: "Term 1",
    month: "Mar",
    icon: "🔥",
    color: "#DC2626",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If a bush suddenly caught on fire but DIDN'T burn up — would you go and look? Today we meet a man who did exactly that, and God spoke to him from the flames!",

    story: {
      "3-5": "Baby Moses was born at a scary time. A mean king wanted to hurt all the Israelite baby boys. Moses' mummy hid him in a basket on the river. Guess who found him? The king's own daughter! She raised Moses as a prince. When Moses grew up, he ran away to the desert. One day he saw something amazing — a bush on fire, but it wasn't burning up! God spoke from the bush: 'Moses! Take off your shoes — this ground is holy. I want you to go back to Egypt and set my people free!' Moses was scared, but God said, 'I will be with you.'",
      "6-8": "Moses was born when Pharaoh was killing Israelite baby boys. His mother hid him in a basket on the river Nile. Pharaoh's daughter found him and raised him as an Egyptian prince. But Moses knew he was an Israelite. One day, after making a terrible mistake, he fled to the desert. For 40 years he was a shepherd — far from the palace. Then God appeared in a bush that burned but was not consumed. God told Moses His name: 'I AM THAT I AM.' He commanded Moses to go to Pharaoh and say, 'Let my people go!' Moses made excuses — 'I can't speak well!' — but God promised to be with him and gave him signs to prove His power.",
      "9-12": "Moses' life falls into three 40-year periods: 40 years as a prince in Egypt, 40 years as a shepherd in Midian, and 40 years leading Israel in the wilderness. God's timing is precise — He spent 80 years preparing Moses for his mission. The burning bush reveals the most important name of God in the Old Testament: YHWH — 'I AM THAT I AM' (Exodus 3:14). This name declares God's eternal, self-existent nature. He is not 'I WAS' or 'I WILL BE' — He IS, always present tense. Jesus deliberately uses this language in John 8:58 ('Before Abraham was, I AM'), which caused the religious leaders to try to stone Him for blasphemy. In John's Gospel, Jesus makes seven 'I AM' statements (I am the bread of life, the light of the world, the door, the good shepherd, the resurrection and the life, the way, the truth and the life, the true vine). Each one echoes the divine name revealed at the bush. Moses' reluctance and excuses remind us that God uses the weak and unwilling — His power is made perfect in weakness (2 Corinthians 12:9)."
    },

    scripture: {
      "3-5": "I AM THAT I AM.\n— Exodus 3:14",
      "6-8": "And God said unto Moses, I AM THAT I AM: and he said, Thus shalt thou say unto the children of Israel, I AM hath sent me unto you.\n— Exodus 3:14\n\nCertainly I will be with thee.\n— Exodus 3:12",
      "9-12": "And God said unto Moses, I AM THAT I AM: and he said, Thus shalt thou say unto the children of Israel, I AM hath sent me unto you.\n— Exodus 3:14\n\nCertainly I will be with thee.\n— Exodus 3:12\n\nJesus said unto them, Verily, verily, I say unto you, Before Abraham was, I am.\n— John 8:58"
    },

    activities: {
      "3-5": "🔥 Make a burning bush from torn orange and red tissue paper screwed up and glued to a brown paper tree shape. It's on fire — but not burning up!\n\n👣 Draw around your feet on paper. Write 'Holy Ground' on it — just like God told Moses!",
      "6-8": "📖 Make a 'Staff of Moses' from a stick and paper. When God gave Moses his staff, what miracles did it perform later? Research and list them.\n\n🔥 Make a diorama of the burning bush scene in a shoebox. Include Moses, the bush, and his sandals on the ground.",
      "9-12": "🎨 Create an 'I AM' poster — write 'I AM THAT I AM' in large letters at the centre. Around it, illustrate all 7 'I AM' statements Jesus makes in John's Gospel (bread, light, door, shepherd, resurrection, way, vine). Draw a symbol for each one and write the verse reference.\n\n✍️ Write a diary entry from Moses at the burning bush. Describe what he sees, hears, and feels. Include his excuses and God's replies. End with the moment he takes off his sandals — what does holy ground feel like?"
    },

    supplies: "Orange and red tissue paper, brown paper, glue, shoebox, sticks, large paper for feet tracing, markers",

    discussionQuestions: [
      "Moses made lots of excuses when God called him. What excuses do we make when God asks us to do something?",
      "God said 'I AM' — not 'I WAS' or 'I WILL BE.' What does the present tense mean for us today?",
      "God chose Moses even though he'd made big mistakes. What does that tell us about God's grace?"
    ],

    reflection: "Today I learned that God's name is 'I AM' — He is always here, always now, always with me. Even when Moses felt afraid and made excuses, God said 'I will be with you.' He says the same to me!",

    prayer: "Dear God, You are the great I AM. You are always with me — yesterday, today, and forever. When I feel afraid or not good enough, remind me that You don't call the perfect — You call the willing. Help me to say 'Here I am!' like Moses. Amen.",

    teacherNote: "The divine name YHWH (I AM) is the most important name of God in the OT. Jesus deliberately uses this language in John 8:58 ('Before Abraham was, I AM') — causing the religious leaders to try to stone Him for blasphemy. Older children can explore all 7 'I AM' sayings of John's Gospel. Moses as deliverer points to Christ as the greater deliverer. The burning bush itself is a picture: God's presence fills something ordinary (a bush) without destroying it — just as God would later fill the tabernacle, the temple, and ultimately a human body (John 1:14) with His glory.",

    memoryVerse: "I AM THAT I AM. — Exodus 3:14",
  },

  // ── Week 10 ──────────────────────────────────
  {
    week: 10,
    title: "The Passover — Blood on the Door",
    bibleRef: "Exodus 11–12",
    keyVerse: "For even Christ our passover is sacrificed for us. — 1 Corinthians 5:7",
    theme: "Redemption & Substitution",
    term: "Term 1",
    month: "Mar",
    icon: "🩸",
    color: "#92400E",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If you could paint ONE thing on your front door to show everyone who lives there, what would it be? Today we will learn about the night God's people painted something on their doors — and it saved their lives.",

    story: {
      "3-5": "God's people were slaves in Egypt. God sent Moses to say, 'Let my people go!' But Pharaoh said NO. So God sent plagues — frogs, bugs, darkness, and more. But Pharaoh kept saying no. Finally, God said one more terrible thing would happen — the oldest child in every family would die. BUT God gave His people a way to be safe: 'Kill a lamb and put the blood on your doorposts. When I see the blood, I will PASS OVER your house.' That night, every family with blood on the door was safe. This was called the Passover — the night God set His people free!",
      "6-8": "God sent ten plagues on Egypt to free His people. Each plague showed that God was more powerful than the Egyptian gods. The last plague was the most serious: the death of every firstborn. But God gave His people a way to be protected. Each family had to kill a perfect lamb, put its blood on the doorposts, roast the lamb, and eat it in readiness to leave — with sandals on and bags packed. When God's angel passed through Egypt that night, he passed over every house marked with blood. The lamb died so the firstborn could live. This is substitution — one life given in place of another. That same night, Pharaoh finally let the Israelites go.",
      "9-12": "The Passover is the central saving event of the Old Testament — and it is not coincidence that Jesus chose Passover week to die. Every detail of Exodus 12 points forward to the cross. The lamb had to be 'without blemish' (Exodus 12:5) — Peter says Jesus was a 'lamb without blemish and without spot' (1 Peter 1:19). The blood was applied with hyssop (Exodus 12:22) — hyssop appears again at the cross (John 19:29). No bone of the lamb could be broken (Exodus 12:46) — fulfilled in John 19:36. The lamb died so the firstborn lived — this is penal substitution in its earliest form. Paul makes it explicit: 'Christ our passover is sacrificed for us' (1 Corinthians 5:7). The Passover meal becomes the Lord's Supper — Jesus takes the bread and cup from the Passover table and says 'This is my body... this is my blood of the new covenant.' The Passover was not about the goodness of the people inside the house — it was about the blood on the door. Salvation has always been by grace through faith, applied through substitutionary sacrifice."
    },

    scripture: {
      "3-5": "For even Christ our passover is sacrificed for us.\n— 1 Corinthians 5:7",
      "6-8": "And the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you.\n— Exodus 12:13\n\nFor even Christ our passover is sacrificed for us.\n— 1 Corinthians 5:7",
      "9-12": "Your lamb shall be without blemish, a male of the first year.\n— Exodus 12:5\n\nAnd the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you.\n— Exodus 12:13\n\nFor even Christ our passover is sacrificed for us.\n— 1 Corinthians 5:7\n\nForasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Christ, as of a lamb without blemish and without spot.\n— 1 Peter 1:18–19"
    },

    activities: {
      "3-5": "✋ Make a red handprint on paper — the blood on the doorpost! Talk about how the lamb kept the family safe. Write 'God protects me' under your handprint.\n\n🐑 Draw a little white lamb. This lamb saved the family — just like Jesus saves us.",
      "6-8": "🍽️ Set a Passover table: a picture of a lamb, bitter herbs (something green), bread without yeast (a cracker), and a cup. Look up what each item means and label them.\n\n📖 Match the Passover elements to Jesus: the lamb = ?, the blood = ?, the unleavened bread = ?, the hyssop = ? Use the New Testament to find your answers.",
      "9-12": "🎨 Design an illustrated 'Passover → Cross' infographic on a large sheet of paper. Draw each Passover element on the left (lamb, blood, hyssop, unleavened bread, unbroken bones) and its New Testament fulfilment on the right. Use arrows, colour coding, and verse references. Make it clear enough to teach someone else.\n\n🍽️ Create a paper Passover Seder plate — draw a large circle, divide it into sections, and in each section illustrate and label one element of the meal. Write the matching New Testament verse beside each one."
    },

    supplies: "Red paint or red paper, white paper, crackers, green herbs (for display), cup, paper plate, markers",

    discussionQuestions: [
      "Why did God use a lamb? What makes a sacrifice meaningful?",
      "The blood didn't protect because the people were good — it protected because they trusted God's word. How is that like how Jesus saves us?",
      "The Passover is still remembered by Jewish people today. Why is it important to remember what God has done?"
    ],

    reflection: "Today I learned that God saved His people through the blood of a lamb. The Passover lamb points straight to Jesus — the Lamb of God who takes away the sin of the world. It's not about being good enough — it's about trusting in the blood.",

    prayer: "Dear God, thank You for the Passover — for showing us that a lamb can take our place. Thank You that Jesus is the perfect Lamb whose blood saves everyone who trusts in Him. I put my trust in Him today. Amen.",

    teacherNote: "The Passover is the central saving event of the Old Testament — and Jesus deliberately chose Passover week to die. Every detail points forward: the lamb without blemish (1 Peter 1:19), the hyssop (John 19:29), the unbroken bones (John 19:36 quoting Exodus 12:46). The Lord's Supper replaces the Passover as the new covenant memorial meal. This is one of the richest typological lessons in the curriculum. Emphasise that the protection was not about the moral quality of the people inside the house — it was about the blood on the door. This is the gospel in miniature: salvation by grace through faith in the substitutionary sacrifice.",

    memoryVerse: "For even Christ our passover is sacrificed for us. — 1 Corinthians 5:7",
  },

  // ── Week 11 ──────────────────────────────────
  {
    week: 11,
    title: "Crossing the Red Sea",
    bibleRef: "Exodus 14–15",
    keyVerse: "The LORD shall fight for you, and ye shall hold your peace. — Exodus 14:14",
    theme: "God's Power & Deliverance",
    term: "Term 1",
    month: "Mar",
    icon: "🌊",
    color: "#1B7A6E",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Imagine you're running away from something scary — and suddenly there's a HUGE sea in front of you and you can't swim. What would you do? Today we learn what God did!",

    story: {
      "3-5": "After the Passover, God's people left Egypt — they were FREE! But Pharaoh changed his mind and sent his army to chase them. The people were SO scared — the sea was in front of them and soldiers were behind them! But Moses said, 'Don't be afraid! Watch what God will do!' Then God did something AMAZING — He split the sea in two! The people walked through on dry ground with walls of water on both sides. When the Egyptians tried to follow, the water came back and they were stopped. God's people were safe! They sang the happiest song ever.",
      "6-8": "After the Passover, Pharaoh let the Israelites go. But then he changed his mind and sent his entire army after them. The Israelites were trapped — the Red Sea in front, the Egyptian army behind. They panicked and blamed Moses. But Moses said the most powerful words: 'Fear ye not, stand still, and see the salvation of the LORD... The LORD shall fight for you, and ye shall hold your peace.' God told Moses to stretch his staff over the sea. The waters divided and the Israelites walked through on dry ground! When the Egyptians followed, the waters collapsed on them. Then Moses and the people sang the Song of Moses — the oldest song in the Bible.",
      "9-12": "The Red Sea crossing is the paradigmatic salvation event of the Old Testament — everything after it is measured against it. The Israelites' situation was humanly impossible: sea ahead, army behind, desert on both sides. God deliberately led them to this dead end (Exodus 14:1–4) so that He alone would receive the glory. Moses' command in 14:14 is one of the great verses of Scripture: 'The LORD shall fight for you, and ye shall hold your peace.' Salvation is God's work, not ours. The crossing has deep theological significance. Paul says the Israelites were 'baptised unto Moses in the cloud and in the sea' (1 Corinthians 10:1–2) — the water that destroyed the enemy also saved God's people. Romans 6:1–4 connects baptism to dying and rising. The Song of Moses (Exodus 15) is one of the oldest pieces of literature in the Bible — and it reappears in Revelation 15:3, where the redeemed in glory 'sing the song of Moses the servant of God, and the song of the Lamb.' What begins at the Red Sea ends in the new creation."
    },

    scripture: {
      "3-5": "The LORD shall fight for you, and ye shall hold your peace.\n— Exodus 14:14",
      "6-8": "Fear ye not, stand still, and see the salvation of the LORD, which he will shew to you to day.\n— Exodus 14:13\n\nThe LORD shall fight for you, and ye shall hold your peace.\n— Exodus 14:14",
      "9-12": "Fear ye not, stand still, and see the salvation of the LORD, which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever. The LORD shall fight for you, and ye shall hold your peace.\n— Exodus 14:13–14\n\nMoreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea; And were all baptized unto Moses in the cloud and in the sea.\n— 1 Corinthians 10:1–2\n\nAnd they sing the song of Moses the servant of God, and the song of the Lamb.\n— Revelation 15:3"
    },

    activities: {
      "3-5": "🌊 Make a split-sea craft: fold blue paper in half, cut wavy shapes along the fold so the 'sea' opens up. Draw stick people walking through on dry ground!\n\n🎶 Sing a praise song together! The Israelites sang after God saved them — what song can you sing to thank God?",
      "6-8": "📖 Learn the first 3 verses of the Song of Moses (Exodus 15:1–3). It's the oldest song in the Bible! Can you put it to a tune?\n\n🌊 Create a diorama: blue paper walls for the sea, sand at the bottom, tiny figures walking through. Show Pharaoh's army behind them.",
      "9-12": "🎶 Write your own 'Song of Praise' inspired by the Song of Moses (Exodus 15). It can be a poem, a rap, or a hymn — at least 8 lines. Include at least 3 things God has done that you want to praise Him for. Illustrate the border with waves and dry ground.\n\n🎨 Create a split-scene diorama or poster: the Red Sea on one side (Exodus 14) and a baptism scene on the other (Romans 6). Draw visual connections showing how the water in both events represents dying to the old life and rising to the new."
    },

    supplies: "Blue paper, scissors, sand or yellow paper, small figures or drawings, tape, glue, markers",

    discussionQuestions: [
      "The Israelites were scared even though God had already done amazing things. Why do we forget what God has done?",
      "'The LORD shall fight for you' — when have you felt like you needed God to fight for you?",
      "What does it mean to praise God with singing? Why is music important in worship?"
    ],

    reflection: "Today I learned that when God's people were completely stuck, God made a way through the sea! He fights for His people. When I feel trapped or scared, God is still able to make a way.",

    prayer: "Dear God, You are mighty and powerful! You split the sea and saved Your people. When I feel stuck and afraid, remind me that You fight for me. I want to sing praises to You like Moses did. Amen.",

    teacherNote: "The Red Sea crossing is the paradigmatic salvation event of the OT — everything after it is measured against it. Connect to Romans 6:1–4 (baptism as dying and rising) and 1 Corinthians 10:1–4. The Song of Moses (Exodus 15) is echoed in Revelation 15:3 — the redeemed in glory sing the Song of Moses and the Song of the Lamb. This powerful bookend spans the entire Bible. The command to 'stand still' (14:13) is theologically rich — salvation is God's work, and our role is to trust, not to strive. This is a great passage for children who are anxious or afraid.",

    memoryVerse: "The LORD shall fight for you, and ye shall hold your peace. — Exodus 14:14",
  },

  // ── Week 12 ──────────────────────────────────
  {
    week: 12,
    title: "The Ten Commandments",
    bibleRef: "Exodus 19–20",
    keyVerse: "Thou shalt love the Lord thy God with all thy heart. — Matthew 22:37",
    theme: "God's Law & Love",
    term: "Term 1",
    month: "Mar",
    icon: "📜",
    color: "#374151",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Do you have rules at home? What are they? Are rules to make you sad — or to keep you safe? Today we learn the TEN most important rules God ever gave.",

    story: {
      "3-5": "God brought His people to a big mountain called Sinai. The mountain was covered in smoke and there was thunder and lightning — God was there! He gave His people TEN special rules called the commandments. The first rules were about loving God: have no other gods, don't make idols, respect God's name, rest on God's special day. The other rules were about loving people: honour your mum and dad, don't hurt anyone, don't steal, don't lie, don't want what other people have. These rules weren't to make life hard — they were to show people how to live as God's free family!",
      "6-8": "God brought His people to Mount Sinai. The mountain was covered in thick smoke, lightning flashed, and a trumpet sounded — God's presence was awesome and terrifying. He gave them the Ten Commandments — ten rules carved on two stone tablets. The first four are about loving God (no other gods, no idols, honour His name, keep the Sabbath). The last six are about loving people (honour parents, don't murder, don't commit adultery, don't steal, don't lie, don't covet). These commands weren't given to EARN God's love — He had already saved them from Egypt! The commands were to show them how to LIVE as God's rescued people. Jesus later summed up all ten in two: love God with all your heart, and love your neighbour as yourself.",
      "9-12": "A critical point that many people miss: the Ten Commandments were given AFTER the exodus. God didn't say, 'Obey these laws and I'll save you.' He saved them first, then gave them the law. This is the pattern of all biblical ethics: grace precedes law. The law has three functions (Luther's three uses): (1) a civil guide for society, (2) a curb on sin — showing us boundaries, and (3) a mirror — revealing our sin and our need for a Saviour. Romans 3:20 says 'by the law is the knowledge of sin.' Galatians 3:24 calls the law a 'schoolmaster to bring us unto Christ.' The law is holy, just, and good (Romans 7:12) — but it cannot save us because we cannot keep it perfectly. Only Jesus kept all ten commandments perfectly. He didn't abolish the law — He fulfilled it (Matthew 5:17). Jesus summed up the law in two commands: love God completely (Deuteronomy 6:5) and love your neighbour as yourself (Leviticus 19:18). Every commandment flows from love."
    },

    scripture: {
      "3-5": "Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind.\n— Matthew 22:37",
      "6-8": "And God spake all these words, saying, I am the LORD thy God, which have brought thee out of the land of Egypt, out of the house of bondage. Thou shalt have no other gods before me.\n— Exodus 20:1–3\n\nThou shalt love the Lord thy God with all thy heart.\n— Matthew 22:37",
      "9-12": "I am the LORD thy God, which have brought thee out of the land of Egypt, out of the house of bondage. Thou shalt have no other gods before me.\n— Exodus 20:2–3\n\nThou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment. And the second is like unto it, Thou shalt love thy neighbour as thyself. On these two commandments hang all the law and the prophets.\n— Matthew 22:37–40\n\nTherefore by the deeds of the law there shall no flesh be justified in his sight: for by the law is the knowledge of sin.\n— Romans 3:20"
    },

    activities: {
      "3-5": "📜 Make two stone tablets from grey card. Draw 5 simple pictures on each — one for each commandment. Can you remember all ten?\n\n🎨 Draw a big heart. Inside write 'Love God' and 'Love People' — that's what all the commandments are really about!",
      "6-8": "📖 Sort the 10 commandments into two groups: love for God (1–4) and love for people (5–10). Jesus said ALL the law hangs on these two loves. Make a poster showing this.\n\n📜 Make stone tablets from grey foam or cardboard. Write the commandment numbers on each and decorate them.",
      "9-12": "📜 Design your own set of illustrated stone tablets. Draw two tablet shapes on thick card, write the 10 commandments (abbreviated), and add a small illustration for each one. On the back, write Jesus' summary (Matthew 22:37–40) in large decorated letters.\n\n🎨 Create an infographic poster titled 'What the Law Does.' Illustrate the three purposes: (1) a mirror — showing us our sin, (2) a guardrail — protecting society, (3) a signpost — pointing us to Christ. Use Romans 3:20 and Galatians 3:24 as your key verses."
    },

    supplies: "Grey card or foam, markers, scissors, large paper for poster, coloured pencils",

    discussionQuestions: [
      "Why do we need rules? What would the world be like without any?",
      "Which commandment do you find hardest to keep? Why?",
      "Jesus kept all 10 perfectly. How does that help us?"
    ],

    reflection: "Today I learned that God gave us His commandments not to make us sad but to show us how to love. I can't keep them perfectly — but Jesus did, for me!",

    prayer: "Dear God, thank You for Your commandments. They show me what love looks like. I know I can't keep them perfectly — but Jesus did. Help me to love You with all my heart and to love the people around me. Amen.",

    teacherNote: "Critical point: the commandments came AFTER the exodus — God didn't say 'obey the law and I'll save you.' He saved them first, THEN gave the law. This is the pattern of all biblical ethics: grace precedes law. The law functions as (1) a civil guide, (2) a curb on sin, (3) a mirror showing us our need. Luther's three uses of the law are worth teaching to older students here. Jesus doesn't abolish the law — He fulfils it (Matthew 5:17). The preamble 'I am the LORD thy God, which have brought thee out of Egypt' (Exodus 20:2) is crucial — it grounds the commands in grace, not works.",

    memoryVerse: "Thou shalt love the Lord thy God with all thy heart. — Matthew 22:37",
  },

  // ── Week 13 ──────────────────────────────────
  {
    week: 13,
    title: "The Tabernacle — God Lives with His People",
    bibleRef: "Exodus 25–27; 40:34–38",
    keyVerse: "Let them make me a sanctuary; that I may dwell among them. — Exodus 25:8",
    theme: "God's Presence",
    term: "Term 1",
    month: "Mar",
    icon: "⛺",
    color: "#B45309",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If God wanted to live right next to you — in a tent in your garden — how would that make you feel? Today we learn about the time God said, 'Build me a tent — I want to live with my people!'",

    story: {
      "3-5": "God told Moses, 'I want to live with my people!' So God gave Moses very special instructions to build a beautiful tent called the Tabernacle. It had a big yard outside, a special room inside, and a VERY special room at the very centre called the Most Holy Place — that's where God's presence lived! A big, thick curtain separated people from God's presence. Only the High Priest could go in, once a year. But one day, when Jesus died on the cross, that curtain was TORN in two — from top to bottom! That means because of Jesus, anyone can come close to God.",
      "6-8": "God gave Moses detailed instructions for building the Tabernacle — a special tent where God's presence would dwell among His people. It had three sections: the outer courtyard (with the bronze altar and laver), the Holy Place (with the lampstand, table of bread, and altar of incense), and the Most Holy Place (with the Ark of the Covenant, where God's glory rested). A thick curtain separated the Holy Place from God's presence — only the High Priest could enter, once a year, with blood. Everything in the Tabernacle pointed to something about God and His plan. And when Jesus died, Matthew 27:51 tells us the curtain was torn from top to bottom — God opened the way for everyone to come into His presence.",
      "9-12": "The Tabernacle is one of the richest typological sections of Scripture. Every element points to Christ. The bronze altar represents Jesus' sacrifice. The laver represents cleansing (baptism). The lampstand represents Jesus the Light of the World. The bread of the Presence represents Jesus the Bread of Life. The altar of incense represents prayer (Revelation 8:3–4). The curtain represents the barrier between God and sinful humanity — torn at the crucifixion (Matthew 27:51). The Ark of the Covenant represents God's throne of grace. John 1:14 says Jesus 'tabernacled' among us — the Greek word literally means 'pitched His tent.' The entire book of Hebrews uses the Tabernacle as its theological framework for understanding Christ's high priestly work (Hebrews 9:1–14). The Tabernacle was a shadow; Jesus is the reality. This is the climax of Term 1 — recap the arc: Creation → Fall → Covenant (Abraham) → Redemption (Passover) → Law (Sinai) → Presence (Tabernacle). This is the gospel in miniature."
    },

    scripture: {
      "3-5": "Let them make me a sanctuary; that I may dwell among them.\n— Exodus 25:8",
      "6-8": "Let them make me a sanctuary; that I may dwell among them.\n— Exodus 25:8\n\nAnd, behold, the veil of the temple was rent in twain from the top to the bottom.\n— Matthew 27:51",
      "9-12": "Let them make me a sanctuary; that I may dwell among them.\n— Exodus 25:8\n\nAnd the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.\n— John 1:14\n\nAnd, behold, the veil of the temple was rent in twain from the top to the bottom.\n— Matthew 27:51\n\nBut Christ being come an high priest of good things to come, by a greater and more perfect tabernacle, not made with hands.\n— Hebrews 9:11"
    },

    activities: {
      "3-5": "⛺ Build a mini Tabernacle from a shoebox and fabric. Put a gold star inside to represent God's presence. Talk about how amazing it is that God wanted to live close to His people!\n\n🎨 Draw the Tabernacle and colour it gold, blue, and purple — the colours God chose.",
      "6-8": "📐 Make a labelled diagram of the Tabernacle: outer court, bronze altar, laver, Holy Place, lampstand, table of bread, altar of incense, curtain, Ark of the Covenant. What did each item teach the people about God?\n\n📦 Make a miniature Ark of the Covenant from a small gold-painted box with two craft-stick angels on top.",
      "9-12": "🏗️ Build a detailed model or labelled diorama of the Tabernacle using a shoebox, card, and craft materials. Label every item (altar, laver, lampstand, bread table, incense altar, curtain, ark) and attach a small tag to each one explaining what it points to in Jesus.\n\n🎨 Create an illustrated timeline poster: 'Where God Dwells.' Draw four scenes in order: the Tabernacle (Exodus 25:8) → Solomon's Temple (1 Kings 8:10–11) → Jesus in the flesh (John 1:14) → The believer (1 Corinthians 6:19). Write the verse under each scene. Title it: 'God Has Always Wanted to Live With His People.'"
    },

    supplies: "Shoebox, fabric scraps, gold paint or foil, craft sticks, small box, glue, scissors, markers, large paper for diagram",

    discussionQuestions: [
      "God wanted to live WITH His people. Why is that important? What does it tell us about God?",
      "The curtain kept people away from God's presence. What did the tearing of the curtain (Matthew 27:51) mean for us?",
      "How does Jesus fulfil everything the Tabernacle pointed to?"
    ],

    reflection: "Today I learned that God wants to live with His people — He always has! The Tabernacle was His tent, then Jesus came to 'tabernacle' among us, and now God lives in everyone who trusts Jesus by His Holy Spirit.",

    prayer: "Dear God, it amazes me that You — the Creator of everything — want to live with us! Thank You for the Tabernacle that showed Your people You were near. Thank You for Jesus who tore the curtain so we can come close to You. Thank You for Your Spirit who lives in me. Amen.",

    teacherNote: "The Tabernacle is one of the richest typological sections of Scripture. John 1:14 says Jesus 'tabernacled' among us — the same Greek word. The book of Hebrews uses the Tabernacle as its primary theological framework for understanding Christ's high priestly work. End of Term 1 — recap the entire arc: Creation → Fall → Covenant (Abraham) → Redemption (Passover) → Law → Presence (Tabernacle). This is the gospel in miniature. Every lesson this term has pointed to Jesus. Use this week to help children see the big picture: God made us, we broke the relationship, but God never stopped pursuing us — through promises, through sacrifice, through law, and through His presence.",

    memoryVerse: "Let them make me a sanctuary; that I may dwell among them. — Exodus 25:8",
  },

  // ── Week 14 ──────────────────────────────────
  {
    week: 14,
    title: "Joshua and the Promised Land",
    bibleRef: "Joshua 1–6",
    keyVerse: "Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest. — Joshua 1:9",
    theme: "Courage & Promise",
    term: "Term 2",
    month: "Apr",
    icon: "⚔️",
    color: "#B91C1C",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever had to be really brave? What happened? Today we meet a man who had to lead an entire nation into a new land — and the first city had HUGE walls!",

    story: {
      "3-5": "Moses had died, and now Joshua was the new leader. God told Joshua, 'Be strong and brave! I am with you!' Joshua led the people to the Jordan River — and God dried it up so they could walk across! The first city they came to was Jericho, with walls so tall and thick that people lived inside them. God gave Joshua a strange plan: march around the city once a day for six days, then seven times on the seventh day — then blow trumpets and SHOUT! Joshua obeyed, and the walls of Jericho came crashing DOWN! God gave them the victory.",
      "6-8": "After Moses died, God chose Joshua to lead Israel into the Promised Land. God's first words to him were powerful: 'Be strong and of a good courage... for the LORD thy God is with thee.' Joshua led the people across the Jordan River — which God miraculously dried up, just like the Red Sea. The first challenge was the fortified city of Jericho. Instead of a battle plan, God gave a worship plan: march around the city for seven days, with priests carrying the Ark of the Covenant and blowing trumpets. On the seventh day they marched seven times, then shouted — and the massive walls collapsed. God was showing that the victory belonged to Him, not to military strength.",
      "9-12": "The book of Joshua marks the fulfilment of promises God made to Abraham over 400 years earlier. The land promised in Genesis 12 is now being entered. Joshua ('Yehoshua' — 'Yahweh is salvation') shares the same name as Jesus ('Yeshua' in Greek). Both lead God's people into their inheritance — Joshua into Canaan, Jesus into the kingdom of God. The Jordan crossing deliberately echoes the Red Sea: the same God who brought them out of Egypt brings them into the land. Jericho's conquest is significant because God's strategy was deliberately non-military. Marching, trumpets, and shouting — this was worship, not warfare. God was establishing a principle that runs through Scripture: 'Not by might, nor by power, but by my spirit, saith the LORD of hosts' (Zechariah 4:6). The walls fell by faith (Hebrews 11:30). Note also Rahab — a Canaanite prostitute who believed in Israel's God and was saved. She appears in the genealogy of Jesus (Matthew 1:5). Grace extends beyond ethnic boundaries."
    },

    scripture: {
      "3-5": "Be strong and of a good courage; be not afraid.\n— Joshua 1:9",
      "6-8": "Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest.\n— Joshua 1:9",
      "9-12": "Have not I commanded thee? Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest.\n— Joshua 1:9\n\nBy faith the walls of Jericho fell down, after they were compassed about seven days.\n— Hebrews 11:30\n\nNot by might, nor by power, but by my spirit, saith the LORD of hosts.\n— Zechariah 4:6"
    },

    activities: {
      "3-5": "🧱 Build walls from blocks or boxes — then march around them 7 times, shout, and knock them down! Just like Joshua!\n\n🎺 Make a trumpet from a rolled-up paper cone. March around the room and blow your trumpet!",
      "6-8": "🗺️ Draw a map of Joshua's campaign: the Jordan crossing, Jericho, Ai, and the division of the land among the 12 tribes.\n\n📖 Read Hebrews 11:30. The walls fell 'by faith.' What does it mean to fight a battle by faith instead of by strength?",
      "9-12": "🗺️ Design a 'Battle of Jericho' strategy poster. Draw the city walls, the marching route (7 days), the positions of the priests and ark, and the moment the walls fall. Include a key explaining each element. Add Joshua 6:20 and Hebrews 11:30 at the bottom.\n\n✍️ Create a one-page 'teaching card' about Rahab to explain her story to a younger child. Draw her picture, write a simple version of her story, and explain why she matters — she's in the family tree of Jesus! (Matthew 1:5). Make it colourful and clear."
    },

    supplies: "Building blocks or boxes, paper cones for trumpets, large paper for maps, markers, tape",

    discussionQuestions: [
      "God told Joshua to 'be strong and courageous' THREE times. Why do you think He repeated it?",
      "The battle plan for Jericho was marching and shouting — not fighting. Why did God do it this way?",
      "Where do you need God's courage in your life right now?"
    ],

    reflection: "Today I learned that God fights for His people in surprising ways. The walls of Jericho didn't fall because of a big army — they fell because God's people trusted and obeyed. When I am afraid, God says, 'Be strong — I am with you!'",

    prayer: "Dear God, You are stronger than any wall. When I face things that feel too big or too scary, help me to remember Joshua. You are with me wherever I go. Give me courage and faith to trust Your plan, even when it seems strange. Amen.",

    teacherNote: "Joshua is a type of Christ — they share the same Hebrew name. The Jordan crossing echoes the Red Sea, establishing continuity between the exodus generation and the conquest generation. Jericho's fall is deliberately non-military to establish that victory belongs to God. Rahab's inclusion in Jesus' genealogy (Matthew 1:5) is one of the great demonstrations of grace crossing ethnic and moral boundaries. Hebrews 11:30–31 places both the walls' fall and Rahab's faith side by side. For older students, discuss how the conquest of Canaan relates to God's judgment on the Amorites (Genesis 15:16) — their sin had reached its full measure.",

    memoryVerse: "Be strong and of a good courage; be not afraid, neither be thou dismayed: for the LORD thy God is with thee whithersoever thou goest. — Joshua 1:9",
  },

  // ── Week 15 ──────────────────────────────────
  {
    week: 15,
    title: "Deborah — A Brave Leader",
    bibleRef: "Judges 4–5",
    keyVerse: "I will surely go with thee. — Judges 4:9",
    theme: "Courage & Women of Faith",
    term: "Term 2",
    month: "Apr",
    icon: "⚡",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Can you think of a really brave woman — someone in your family, from history, or from a book? Today we meet one of the bravest women in the Bible — a leader, a judge, and a prophetess named Deborah!",

    story: {
      "3-5": "After Joshua died, God's people kept forgetting Him and getting into trouble. But God always sent someone to help. One of those helpers was a woman named Deborah. She was a judge — she helped people solve their problems and told them what God said. When a mean king was hurting God's people, Deborah told a man named Barak, 'God says GO and fight!' Barak was scared and said, 'I'll only go if YOU come with me.' Deborah said, 'I'll come!' And God gave them the victory. Deborah was brave because she trusted God.",
      "6-8": "During the time of the judges, Israel kept falling into a cycle: they would forget God, an enemy would oppress them, they would cry out to God, and God would raise up a judge to deliver them. Deborah was special — she was a prophetess, a judge, and a military leader. When Jabin king of Canaan oppressed Israel for 20 years with 900 iron chariots, Deborah summoned Barak and told him God's battle plan. Barak wouldn't go without her. Deborah agreed but told him the glory would go to a woman. The victory came through a thunderstorm that bogged down the chariots, and Sisera the general was defeated. Then Deborah sang one of the great victory songs in Scripture (Judges 5).",
      "9-12": "The book of Judges follows a repeated cycle: apostasy → oppression → crying out → deliverance → rest → apostasy again. It's a sobering picture of human unfaithfulness and God's patient mercy. Deborah stands out as the only judge who was already leading before a military crisis — she was a prophetess and judge whom all Israel came to for wisdom (Judges 4:4–5). In a patriarchal culture, her leadership was remarkable and God-ordained. Barak's reluctance and Deborah's courage are contrasted intentionally. The victory belonged to God — He sent a storm that turned Sisera's 900 iron chariots from an advantage into a disaster (Judges 5:4, 20–21). The Song of Deborah (Judges 5) is one of the oldest pieces of Hebrew poetry and celebrates God as the divine warrior. Deborah's story shows that God uses whoever is willing and faithful, regardless of cultural expectations."
    },

    scripture: {
      "3-5": "I will surely go with thee.\n— Judges 4:9",
      "6-8": "And Deborah said unto Barak, Up; for this is the day in which the LORD hath delivered Sisera into thine hand: is not the LORD gone out before thee?\n— Judges 4:14\n\nI will surely go with thee.\n— Judges 4:9",
      "9-12": "And Deborah, a prophetess, the wife of Lapidoth, she judged Israel at that time.\n— Judges 4:4\n\nAnd Deborah said unto Barak, Up; for this is the day in which the LORD hath delivered Sisera into thine hand: is not the LORD gone out before thee?\n— Judges 4:14\n\nThey fought from heaven; the stars in their courses fought against Sisera.\n— Judges 5:20"
    },

    activities: {
      "3-5": "👩‍⚖️ Draw a picture of brave Deborah under her palm tree, helping people. Write 'Be Brave for God' at the top.\n\n⚡ Act out the story! One person is Deborah, one is Barak, and everyone else is the army. March and shout when Deborah gives the command!",
      "6-8": "📖 Read Judges 4 and make a comic strip with 6 panels telling the story: Deborah under the palm tree → Barak summoned → The battle → The storm → Victory → The song of praise.\n\n✍️ Deborah was brave when others were afraid. Write about a time you were brave for God or for what was right.",
      "9-12": "🎨 Draw a large illustrated 'Judges Cycle' diagram — a circular arrow chart with 5 stages: Sin → Oppression → Crying Out → Deliverance → Rest. At each stage, draw a small scene and write an example from the book of Judges. In the centre, write: 'They needed a permanent Saviour.'\n\n✍️ Design a 'Courage Award' certificate for Deborah. Include her name, title (prophetess, judge, leader), her key actions, her key quote (Judges 4:14), and an illustration. Make it look like a real award — borders, seal, and all."
    },

    supplies: "Paper, markers, coloured pencils, optional props for acting out the story (scarves, toy swords)",

    discussionQuestions: [
      "Deborah was brave when others were afraid. Where does real courage come from?",
      "Barak wouldn't go without Deborah. Is it okay to need help being brave? Who helps you?",
      "God used a woman to lead His people when the men were afraid. What does this tell us about God?"
    ],

    reflection: "Today I learned that God used Deborah — a woman of faith and courage — to save His people. God doesn't look at who the world expects to lead. He looks for people who trust Him and are willing to be brave.",

    prayer: "Dear God, thank You for Deborah's courage. She trusted You and led Your people when others were afraid. Help me to be brave like Deborah — to stand up for what is right, even when it's hard. You go before me, and that gives me courage. Amen.",

    teacherNote: "Deborah's story is important for showing children that God uses women powerfully in His purposes. She was prophet, judge, and military strategist — already in a leadership role before the crisis began. The Song of Deborah (Judges 5) is considered one of the oldest texts in the Bible and celebrates God as the divine warrior who fights through nature itself. The repeated judges cycle (sin-suffering-supplication-salvation) is a miniature picture of humanity's need for a permanent Saviour — the judges deliver temporarily, but only Christ delivers permanently.",

    memoryVerse: "I will surely go with thee. — Judges 4:9",
  },

  // ── Week 16 ──────────────────────────────────
  {
    week: 16,
    title: "Gideon's 300",
    bibleRef: "Judges 6–7",
    keyVerse: "The LORD said unto Gideon, The people are too many. — Judges 7:2",
    theme: "Weakness & Strength",
    term: "Term 2",
    month: "Apr",
    icon: "🏺",
    color: "#0369A1",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If you were going into a battle, would you want MORE soldiers or FEWER? What if God said, 'You have TOO MANY'? That's exactly what happened today!",

    story: {
      "3-5": "God's people were in trouble again. An enemy called the Midianites kept stealing their food. God called a man named Gideon to fight them. Gideon was scared — he was hiding in a hole! But God said, 'You are a mighty warrior!' Gideon gathered a big army — 32,000 men. But God said, 'Too many! Send some home.' After two rounds, only 300 were left! With just 300 men, torches, and trumpets hidden inside clay pots, they surrounded the enemy camp at night. They blew their trumpets, smashed the pots, and shouted, 'The sword of the LORD and of Gideon!' The enemy panicked and ran away. God won with just 300!",
      "6-8": "The Midianites were so numerous they were 'like grasshoppers' — and they destroyed everything. Gideon was the least important person in the weakest family, hiding from the enemy. But God called him 'mighty man of valour' and told him to save Israel. Gideon gathered 32,000 soldiers, but God said, 'Too many — if you win, you'll think YOU did it.' He reduced the army to 10,000, then to just 300. The battle plan was bizarre: each man carried a trumpet and a torch hidden in a clay jar. At Gideon's signal they blew the trumpets, smashed the jars (revealing the light), and shouted. The Midianites panicked and destroyed each other. God deliberately used weakness to show His strength.",
      "9-12": "Gideon's story is about God's power being displayed through human weakness — a theme Paul develops in 2 Corinthians 12:9 ('my strength is made perfect in weakness'). God's reduction of the army from 32,000 to 300 is deliberate: 'lest Israel vaunt themselves against me, saying, Mine own hand hath saved me' (Judges 7:2). God refuses to share His glory with human effort. The method of victory is pure theatre — trumpets, clay pots, torches, and shouting. No swords were drawn. The theological point is unmistakable: salvation belongs to the Lord. Paul uses the image of 'treasure in earthen vessels' (2 Corinthians 4:7) — the gospel is the light, we are the fragile clay jars. When the jar is broken, the light shines out. Gideon himself is flawed — he tests God with the fleece (a sign of doubt, not faith) and later makes an idol (Judges 8:27). Yet God uses him. This is consistent with the whole Bible: God uses imperfect people to accomplish His perfect purposes."
    },

    scripture: {
      "3-5": "The LORD said unto Gideon, The people are too many.\n— Judges 7:2",
      "6-8": "And the LORD said unto Gideon, The people that are with thee are too many for me to give the Midianites into their hands, lest Israel vaunt themselves against me, saying, Mine own hand hath saved me.\n— Judges 7:2",
      "9-12": "And the LORD said unto Gideon, The people that are with thee are too many for me to give the Midianites into their hands, lest Israel vaunt themselves against me, saying, Mine own hand hath saved me.\n— Judges 7:2\n\nBut we have this treasure in earthen vessels, that the excellency of the power may be of God, and not of us.\n— 2 Corinthians 4:7\n\nMy grace is sufficient for thee: for my strength is made perfect in weakness.\n— 2 Corinthians 12:9"
    },

    activities: {
      "3-5": "🏺 Make a 'Gideon torch' from a paper cup (the jar) with a yellow paper flame inside. At the count of 3, lift the cup to reveal the light!\n\n🎺 March around the room with your torch and a noisemaker. Shout 'The sword of the LORD!' at the signal.",
      "6-8": "📖 Do the maths: 32,000 → 10,000 → 300. What percentage of the army was left? Why did God want such a small number? Write your answer.\n\n🏺 Make clay pot lanterns from paper cups. Put a battery tea light inside, cover with the cup, then 'smash' (lift) the cup to reveal the light. Connect to 2 Corinthians 4:7 — we are the jars, God's light is inside!",
      "9-12": "🏺 Make your own 'clay jar lantern' — decorate a paper cup or small pot to look like an earthen vessel. Write 2 Corinthians 4:7 on it. Place a battery tea light inside. When you lift the jar, the light shines out — just like God's power shining through our weakness.\n\n🎨 Design a 'God Uses Weakness' infographic. Draw Gideon's army shrinking: 32,000 → 10,000 → 300. Illustrate the trumpets, jars, and torches. Write the key principle at the bottom: 'Not by might, nor by power, but by my Spirit' (Zechariah 4:6). Make it poster-sized and colourful."
    },

    supplies: "Paper cups, battery tea lights or yellow paper, tape, noisemakers, markers",

    discussionQuestions: [
      "Why did God reduce the army from 32,000 to 300? What was He trying to teach?",
      "Gideon felt weak and unimportant. Has God ever used you when you felt that way?",
      "We are like clay jars with God's light inside. What does that mean for how we live?"
    ],

    reflection: "Today I learned that God doesn't need a big, strong army — He uses small, weak things to show His power. I don't have to be the strongest or smartest. God's strength shines brightest through my weakness!",

    prayer: "Dear God, thank You that You don't need me to be strong — You ARE strong! Like Gideon's 300, You can do amazing things through the smallest and weakest. Help me to let Your light shine through me, even when I feel like a fragile clay jar. Amen.",

    teacherNote: "Gideon's story perfectly illustrates 2 Corinthians 4:7 ('treasure in earthen vessels') and 12:9 ('my strength is made perfect in weakness'). God deliberately reduces the army so that no one can claim the victory was theirs. The clay pots hiding the torches are a beautiful image — when the pots are broken, the light shines out. This is how the gospel works through us: our brokenness reveals God's glory. Note Gideon's flaws — the fleece test shows doubt, and he later falls into idolatry (8:27). God uses imperfect people throughout Scripture. For older students, connect to how Paul boasts in his weaknesses rather than his strengths.",

    memoryVerse: "The LORD said unto Gideon, The people are too many. — Judges 7:2",
  },

  // ── Week 17 ──────────────────────────────────
  {
    week: 17,
    title: "Samson — Strength and Weakness",
    bibleRef: "Judges 13–16",
    keyVerse: "My strength goeth from me. — Judges 16:17",
    theme: "Pride & Repentance",
    term: "Term 2",
    month: "Apr",
    icon: "💪",
    color: "#92400E",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Who is the strongest person you know? What makes them strong? Today we'll meet the strongest man in the Bible — but his REAL weakness wasn't what you'd expect.",

    story: {
      "3-5": "Before Samson was born, an angel told his parents he would be special — set apart for God. Samson grew up and became the STRONGEST man who ever lived! He could fight a lion with his bare hands! God gave Samson his strength for a special purpose — to rescue God's people from the Philistines. But Samson kept making bad choices. He told his secret to a woman called Delilah, and she cut his hair while he slept. His strength left him because he had turned away from God. But in the end, Samson prayed one last prayer, and God gave him strength one more time.",
      "6-8": "Samson was a Nazirite — set apart for God from birth. His long hair was a sign of his vow to God, and God gave him supernatural strength. He killed a lion, defeated a thousand Philistines, and broke every chain they put on him. But Samson's real weakness was his pride and his choices. He kept going where he shouldn't go and trusting people he shouldn't trust. Delilah kept asking for his secret. Finally, he told her: 'If my hair is cut, my strength will leave me.' She betrayed him. The Philistines blinded him and made him a slave. But in prison, Samson's hair began to grow — and more importantly, his heart returned to God. His final prayer was one of humble repentance, and God answered it with power.",
      "9-12": "Samson is one of the most tragic figures in Scripture — a man with the greatest physical gift and the weakest moral character. He was a Nazirite from birth (Numbers 6), consecrated to God with three vows: no wine, no contact with the dead, and no cutting of hair. Samson broke all three. His story reveals that spiritual power is not the same as spiritual maturity. His strength came from God's Spirit (Judges 14:6, 19; 15:14), but he treated it like his own possession. Delilah's persistence and Samson's pride led to his downfall — he 'knew not that the LORD was departed from him' (16:20), one of the saddest sentences in the Bible. Yet the story doesn't end in tragedy. In the Philistine temple, blind and humiliated, Samson prays the most honest prayer of his life. God answers. Hebrews 11:32 lists Samson among the heroes of faith — not for his strength, but for his final act of trust. The lesson is clear: it's never too late to return to God, but sin always has consequences."
    },

    scripture: {
      "3-5": "My strength goeth from me.\n— Judges 16:17",
      "6-8": "And he wist not that the LORD was departed from him.\n— Judges 16:20\n\nAnd Samson called unto the LORD, and said, O Lord GOD, remember me, I pray thee, and strengthen me, I pray thee, only this once.\n— Judges 16:28",
      "9-12": "And he wist not that the LORD was departed from him.\n— Judges 16:20\n\nAnd Samson called unto the LORD, and said, O Lord GOD, remember me, I pray thee, and strengthen me, I pray thee, only this once, O God.\n— Judges 16:28\n\nAnd what shall I more say? for the time would fail me to tell of Gedeon, and of Barak, and of Samson.\n— Hebrews 11:32"
    },

    activities: {
      "3-5": "💪 Have a 'strength contest' — who can hold a book with an outstretched arm the longest? Now talk about it: real strength comes from God, not from muscles!\n\n🎨 Draw Samson at two moments: strong and proud, then blind and praying. Which picture shows more faith?",
      "6-8": "📖 Make a 'Samson timeline' showing his highs and lows: birth → lion → victories → Delilah → capture → prayer → final act. At each point, was Samson close to God or far from God?\n\n✍️ Write a journal entry as if you were Samson in prison. What would you say to God?",
      "9-12": "📖 Create a 'Samson: Rise & Fall' comic strip with at least 8 panels. Show the key moments: birth announcement → lion → victories → Delilah → haircut → capture → blindness → final prayer. Use colour to show when he's close to God (bright) vs. far from God (dark).\n\n✍️ Write a diary entry as Samson in prison. He's blind, chained, and grinding grain. What does he think about? What does he regret? What does he say to God? End with his final prayer from Judges 16:28."
    },

    supplies: "Paper, markers, books (for strength contest), coloured pencils, journal paper",

    discussionQuestions: [
      "Samson had great strength but made terrible choices. What is the difference between being talented and being wise?",
      "Samson drifted from God slowly, one bad choice at a time. How do we protect ourselves from drifting?",
      "Even at the very end, God heard Samson's prayer. What does that tell us about God's mercy?"
    ],

    reflection: "Today I learned that real strength doesn't come from muscles — it comes from staying close to God. Samson was the strongest man alive but his pride was his weakness. Even when he failed, God still heard his prayer. It's never too late to turn back to God.",

    prayer: "Dear God, help me to remember that my strength comes from You, not from myself. Protect me from pride and from drifting away from You one small step at a time. And if I ever do wander, thank You that it's never too late to come back. You always hear my prayer. Amen.",

    teacherNote: "Samson is a cautionary tale about gifts without character. He had the Spirit's power but not the Spirit's fruit. His story shows that spiritual power and spiritual maturity are not the same thing. The three Nazirite vows — broken one by one — illustrate how sin progresses gradually. 'He knew not that the LORD was departed' (16:20) is perhaps the most sobering verse in Judges. Yet Hebrews 11:32 includes Samson among the faithful — redeemed not by his strength but by his final prayer of faith. For older students, discuss how Samson's story prepares us for the need for a better deliverer — one who is both powerful AND faithful. That deliverer is Jesus.",

    memoryVerse: "My strength goeth from me. — Judges 16:17",
  },

  // ═══════════════════════════════════════════════════
  // MONTHS 5–12 WILL BE APPENDED HERE
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