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
  // MAY — Weeks 18–22
  // ═══════════════════════════════════════════════════

  // ── Week 18 ──────────────────────────────────
  {
    week: 18,
    title: "Ruth — Faithful Love",
    bibleRef: "Ruth 1–4",
    keyVerse: "Whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy God my God. — Ruth 1:16",
    theme: "Loyalty & Redemption",
    term: "Term 2",
    month: "May",
    icon: "🌾",
    color: "#B45309",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever had to move somewhere completely new — a new house, a new school, a new country? How did it feel? Today we meet a woman who left EVERYTHING behind to follow someone she loved — and to follow God.",

    story: {
      "3-5": "Naomi was a lady who was very, very sad. Her husband had died, and so had her two sons. She was far from home and all alone. Naomi said to her two daughters-in-law, 'Go back to your families.' One of them, Orpah, said goodbye and left. But the other one, Ruth, held on tight and said, 'No! I won't leave you. Where you go, I will go. Your God will be my God.' So Ruth and Naomi walked all the way back to Bethlehem together. Ruth worked hard picking up leftover grain in the fields to get food for them. A kind man named Boaz saw Ruth and looked after her. Boaz married Ruth, and they had a baby boy! And guess what? That baby's great-great-great grandson would be King David — and one day, Jesus would be born into that same family!",
      "6-8": "During the time of the judges, a famine hit Israel. A man named Elimelech took his wife Naomi and their two sons to the land of Moab. While there, Elimelech died. The two sons married Moabite women — Orpah and Ruth — but then both sons died too. Naomi was left with nothing. She decided to return to Bethlehem and told her daughters-in-law to go back to their own families. Orpah tearfully left. But Ruth clung to Naomi and spoke some of the most beautiful words in the Bible: 'Whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy God my God.' Ruth chose loyalty over comfort. Back in Bethlehem, Ruth went gleaning — picking up leftover grain after the harvesters, which was how the poorest people survived. She happened to work in the field of a man named Boaz, a relative of Naomi's husband. Boaz was kind, generous, and godly. He protected Ruth and made sure she had plenty of food. Naomi realized Boaz could be their 'kinsman-redeemer' — a close relative with the right to buy back family land and marry Ruth to carry on the family name. Boaz agreed, and Ruth and Boaz married. Their son Obed became the grandfather of King David. And through that family line, Jesus Himself would be born (Matthew 1:5).",
      "9-12": "The Book of Ruth is a masterpiece of biblical storytelling — set 'in the days when the judges ruled' (1:1), it provides a stunning contrast to the chaos of Judges. Where Judges shows Israel at its worst, Ruth shows faithfulness at its best. The Hebrew word that drives the whole story is 'chesed' — steadfast, covenant love. Ruth shows chesed to Naomi by refusing to abandon her. Boaz shows chesed to Ruth by going beyond legal obligation to care for her. And behind it all, God shows chesed to His people by weaving a Moabite widow into the lineage of the Messiah. Ruth was a Gentile from Moab — a nation born from Lot's sin (Genesis 19) and often hostile to Israel. Yet she confesses faith in Israel's God and is welcomed into the covenant community. This is radical. The concept of the kinsman-redeemer (Hebrew: go'el) is central. A go'el was a close relative who had the right to buy back family property and marry a widow to continue the family line (Leviticus 25:25; Deuteronomy 25:5–6). Boaz fulfils this role for Ruth. He is a picture of Christ — our Kinsman-Redeemer who had the right (He became human), the power (He is God), and the willingness (He chose the cross) to redeem us. Ruth 4:17 gives the payoff: their son Obed is the grandfather of David, and Matthew 1:5 places Ruth in the genealogy of Jesus. A Moabite widow, redeemed by grace, becomes an ancestor of the King of Kings."
    },

    scripture: {
      "3-5": "Whither thou goest, I will go.\n— Ruth 1:16",
      "6-8": "And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy God my God.\n— Ruth 1:16\n\nThe LORD recompense thy work, and a full reward be given thee of the LORD God of Israel, under whose wings thou art come to trust.\n— Ruth 2:12",
      "9-12": "And Ruth said, Intreat me not to leave thee, or to return from following after thee: for whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy God my God: Where thou diest, will I die, and there will I be buried: the LORD do so to me, and more also, if ought but death part thee and me.\n— Ruth 1:16–17\n\nThe LORD recompense thy work, and a full reward be given thee of the LORD God of Israel, under whose wings thou art come to trust.\n— Ruth 2:12\n\nAnd the women said unto Naomi, Blessed be the LORD, which hath not left thee this day without a kinsman.\n— Ruth 4:14"
    },

    activities: {
      "3-5": "🌾 Make a 'grain field' picture — glue real cereal or rice grains onto paper to make a field. Draw Ruth in the middle picking up grain. Add a big sun and Boaz watching kindly from the side.\n\n🎨 Draw a big heart and inside it write (or have a grown-up help you write): 'Where you go, I will go.' Decorate it with flowers and give it to someone you love!",
      "6-8": "📖 Create a 4-panel comic strip of Ruth's story: (1) Naomi says goodbye, (2) Ruth clings to her, (3) Ruth gleans in Boaz's field, (4) Ruth and Boaz's wedding. Add speech bubbles with real Bible words.\n\n🌾 Make a woven paper 'harvest mat.' Cut strips of brown, gold, and green paper and weave them together. On the mat, write Ruth 2:12 — 'under whose wings thou art come to trust.' This represents Ruth finding safety under God's care.",
      "9-12": "📖 Create an illustrated 'Kinsman-Redeemer' study page. Draw two columns: 'BOAZ' on the left and 'JESUS' on the right. List every parallel: both had the RIGHT to redeem, the POWER to redeem, and the WILLINGNESS to redeem. Include verse references for each point. Illustrate with drawings of the harvest field and the cross. Make it detailed enough to teach someone else.\n\n✍️ Write a diary entry from Ruth's perspective on the day she made her famous declaration to Naomi. What was she leaving behind in Moab? What was she afraid of? What made her choose to stay? Describe the walk to Bethlehem — what did she see, feel, and pray? End with her first evening in a new land."
    },

    supplies: "Paper, markers, crayons, glue, cereal or rice grains, brown/gold/green paper strips (for weaving), scissors, coloured pencils, journal paper",

    discussionQuestions: [
      "Ruth gave up everything familiar to stay with Naomi and follow God. What is the hardest thing you've ever had to give up? How did it feel?",
      "Boaz went beyond what he had to do — he was extra kind and generous. Who in your life is like Boaz? How can you be a 'Boaz' to someone this week?",
      "Ruth was a foreigner, yet God put her in the family line of Jesus. What does that tell us about who God welcomes into His family?"
    ],

    reflection: "Today I learned that faithful love — sticking with someone no matter what — is one of the most beautiful things in the Bible. Ruth chose loyalty over comfort, and God honoured her beyond anything she could have imagined. God puts broken people into His beautiful plan.",

    prayer: "Dear God, thank You for the story of Ruth. Help me to love the people in my life with faithful, loyal love — the kind that stays even when it's hard. Thank You that You are our Kinsman-Redeemer, the one who came to bring us back into Your family. Thank You that Your family is open to everyone who trusts in You. Amen.",

    teacherNote: "Ruth is a theological goldmine. The concept of chesed (steadfast covenant love) runs through the book — Ruth shows it to Naomi, Boaz shows it to Ruth, and God shows it to all of them. The kinsman-redeemer (go'el) is one of the richest types of Christ in the Old Testament. Boaz had the right (he was a relative), the resources (he was wealthy), and the willingness (he chose to act). Jesus meets all three criteria perfectly — He became human (right), He is God (resources), and He went to the cross willingly (willingness). For older students, note that Ruth the Moabitess being in Jesus' genealogy (Matthew 1:5) foreshadows the gospel going to all nations. God's plan was never for Israel alone. The book also quietly answers the question: 'Where is God in the everyday?' There are no miracles, no angels, no plagues. Just providence — God working through ordinary kindness, hard work, and faithful decisions.",

    memoryVerse: "Whither thou goest, I will go; and where thou lodgest, I will lodge: thy people shall be my people, and thy God my God. — Ruth 1:16",
  },

  // ── Week 19 ──────────────────────────────────
  {
    week: 19,
    title: "Hannah's Prayer",
    bibleRef: "1 Samuel 1–2",
    keyVerse: "For this child I prayed; and the LORD hath given me my petition which I asked of him. — 1 Samuel 1:27",
    theme: "Prayer & Faithfulness",
    term: "Term 2",
    month: "May",
    icon: "🙏",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever wanted something SO much that you prayed and prayed and prayed for it? Did you have to wait a long time? Today we meet a woman who poured her whole heart out to God — and He heard every word.",

    story: {
      "3-5": "Hannah was very sad. She wanted a baby more than anything in the world, but she didn't have one. Every year she went to God's special house — the tabernacle — and she prayed and cried and asked God for a child. One year, Hannah prayed SO hard that her lips were moving but no sound came out! The priest Eli thought something was wrong, but Hannah said, 'No — I'm just talking to God from my heart.' Hannah made a big promise: 'God, if you give me a son, I will give him back to You.' God heard Hannah's prayer! She had a baby boy and named him Samuel, which means 'God heard me.' When Samuel was old enough, Hannah kept her promise and brought him to live at the tabernacle to serve God. She was so happy that she sang a beautiful song of praise!",
      "6-8": "Hannah was one of two wives of a man named Elkanah. The other wife, Peninnah, had many children, but Hannah had none. Year after year Peninnah teased Hannah and made her cry. It broke Hannah's heart. Every year the family went to Shiloh to worship at the tabernacle. One year, Hannah was so distressed that she went to the tabernacle and poured out her soul to God. She wept bitterly and made a vow: 'O LORD of hosts, if thou wilt indeed look on the affliction of thine handmaid, and give unto thine handmaid a man child, then I will give him unto the LORD all the days of his life' (1 Samuel 1:11). She prayed so intensely that only her lips moved — no sound came out. The priest Eli saw her and thought she was drunk! But when Hannah explained, Eli said, 'Go in peace: and the God of Israel grant thee thy petition.' God remembered Hannah. She gave birth to a son and named him Samuel — meaning 'heard by God.' When he was weaned, Hannah did something extraordinary: she kept her promise and brought Samuel to the tabernacle to serve God for his entire life. Then she sang one of the most powerful praise songs in the Bible (1 Samuel 2:1–10), declaring God's faithfulness to the humble and broken-hearted.",
      "9-12": "Hannah's story opens the books of Samuel and marks a turning point in Israel's history. The nation is in spiritual decline — the priest Eli's own sons are corrupt (1 Samuel 2:12) — and into this darkness, God raises up a leader born from one woman's desperate prayer. Hannah's prayer in 1 Samuel 1 is a model of biblical lament. She doesn't pray politely — she pours out her soul (1:15), weeps bitterly (1:10), and makes a costly vow. Eli mistakes her intensity for drunkenness, which tells us how rare genuine heartfelt prayer had become in Israel. Her vow is radical: she asks for a son and promises to give him back as a Nazirite (1:11 — 'no razor shall come upon his head'). This is not a bargain — it's an act of surrender. She is saying, 'God, I trust You with the thing I want most.' God answers, and Samuel is born. Hannah keeps her vow — after weaning, she brings Samuel to serve at Shiloh. Her song of praise (1 Samuel 2:1–10) is one of the great theological poems in Scripture. It celebrates God as the one who reverses human expectations: the barren woman has seven children, the mighty are broken, the hungry are fed. Mary's Magnificat (Luke 1:46–55) echoes Hannah's song almost word for word — both women praise God for lifting up the humble and bringing down the proud. Hannah teaches us that prayer is not about getting what we want — it's about trusting God with what we want most."
    },

    scripture: {
      "3-5": "For this child I prayed; and the LORD hath given me my petition which I asked of him.\n— 1 Samuel 1:27",
      "6-8": "And she was in bitterness of soul, and prayed unto the LORD, and wept sore.\n— 1 Samuel 1:10\n\nFor this child I prayed; and the LORD hath given me my petition which I asked of him: Therefore also I have lent him to the LORD; as long as he liveth he shall be lent to the LORD.\n— 1 Samuel 1:27–28",
      "9-12": "And she was in bitterness of soul, and prayed unto the LORD, and wept sore. And she vowed a vow, and said, O LORD of hosts, if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child, then I will give him unto the LORD all the days of his life.\n— 1 Samuel 1:10–11\n\nFor this child I prayed; and the LORD hath given me my petition which I asked of him: Therefore also I have lent him to the LORD; as long as he liveth he shall be lent to the LORD.\n— 1 Samuel 1:27–28\n\nMy heart rejoiceth in the LORD, mine horn is exalted in the LORD.\n— 1 Samuel 2:1"
    },

    activities: {
      "3-5": "🎨 Draw a picture of Hannah kneeling and praying at the tabernacle. Make her hands folded and draw big teardrops coming down. Then draw a second picture next to it: Hannah smiling and holding baby Samuel! Write 'God heard me!' above the pictures.\n\n🧸 Make a little baby Samuel using a clothespin or a paper roll. Wrap it in cloth or tissue paper. Practice holding it and saying, 'For this child I prayed!'",
      "6-8": "📖 Create a 'Hannah's Prayer Journal' mini-book. Fold two sheets of paper in half to make a booklet. Page 1: Draw Hannah crying and praying. Page 2: Write her prayer in your own words. Page 3: Draw Hannah bringing Samuel to the tabernacle. Page 4: Write Hannah's praise song in your own words. Decorate the cover with the title and 1 Samuel 1:27.\n\n✍️ Design a 'Prayer Reminder' bookmark. Write '1 Samuel 1:27' at the top, draw Hannah praying, and add three things YOU are praying for right now at the bottom. Decorate with colourful borders.",
      "9-12": "📖 Create a side-by-side illustrated comparison of Hannah's Song (1 Samuel 2:1–10) and Mary's Magnificat (Luke 1:46–55). Draw two columns on a large sheet. For each song, list the key themes: God lifts the humble, God brings down the proud, God feeds the hungry, God remembers His people. Draw arrows connecting the matching themes. Illustrate each woman at the top of her column. Write a sentence at the bottom explaining why God chose these two women to introduce Samuel and Jesus.\n\n✍️ Write a letter from Hannah to her son Samuel, written on the day she leaves him at the tabernacle. What does she want him to know? How does she explain her decision? What does she tell him about prayer, about God, and about the promise she made? Make it emotional, honest, and full of faith."
    },

    supplies: "Paper, markers, crayons, clothespin or toilet paper roll (for baby Samuel), tissue paper or fabric scraps, stapler (for mini-book), coloured pencils, card stock (for bookmark), journal paper",

    discussionQuestions: [
      "Hannah prayed with her whole heart — not just words, but tears and deep feeling. What does it mean to pray like that? Is it okay to cry when you pray?",
      "Hannah gave back to God the thing she wanted most. Why is that so hard to do? Is there something you're holding on to that God might be asking you to trust Him with?",
      "Eli thought Hannah was drunk because he'd never seen anyone pray that hard. Why do you think real, heartfelt prayer had become so rare in Israel?"
    ],

    reflection: "Today I learned that God hears every prayer — even the ones with no words, just tears. Hannah trusted God with the thing she wanted most in the world, and God was faithful. I can bring ANYTHING to God in prayer, and He listens.",

    prayer: "Dear God, thank You that You hear me when I pray — even when I can't find the right words. Help me to be honest with You like Hannah was. Help me to trust You with the things I want most, knowing that Your plan is always better than mine. You are faithful, and I praise You. Amen.",

    teacherNote: "Hannah's story is a masterclass in prayer. Her prayer in chapter 1 is raw, honest lament — and God honours it. Eli's confusion (1:14) reveals how spiritually dead the tabernacle had become under his leadership. Hannah's vow is not transactional ('give me X and I'll do Y') but an act of total surrender — she's asking God for a son she already plans to give back. Her song in chapter 2 is theologically rich: it moves from personal praise to cosmic theology, declaring that God reverses all human hierarchies. The verbal parallels between Hannah's song and Mary's Magnificat are too precise to be coincidental — Luke clearly presents Mary as a 'new Hannah,' and Jesus as a greater Samuel. For older students, note that Samuel's birth marks the transition from the judges to the monarchy — God uses one faithful woman's prayer to reshape the entire nation. The lesson: never underestimate the impact of persistent, surrendered prayer.",

    memoryVerse: "For this child I prayed; and the LORD hath given me my petition which I asked of him. — 1 Samuel 1:27",
  },

  // ═══════════════════════════════════════════════════
  // ── Week 20 ──────────────────────────────────
  {
    week: 20,
    title: "Samuel Hears God's Voice",
    bibleRef: "1 Samuel 3",
    keyVerse: "Speak, LORD; for thy servant heareth. — 1 Samuel 3:9",
    theme: "Listening to God",
    term: "Term 2",
    month: "May",
    icon: "👂",
    color: "#2563EB",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever heard someone call your name and you didn't know who it was? What did you do? Today we'll hear about a boy who heard a voice in the middle of the night — and it turned out to be GOD!",

    story: {
      "3-5": "Samuel was a little boy who lived in God's house — the tabernacle. His mummy Hannah had promised him to God, so he helped the old priest Eli. One night, Samuel was lying in bed when he heard a voice: 'Samuel! Samuel!' He jumped up and ran to Eli. 'Here I am! You called me!' But Eli said, 'I didn't call you. Go back to bed.' It happened again — and AGAIN! Three times! Finally Eli understood: 'It must be God calling you! Next time, say: Speak, LORD, for thy servant heareth.' Samuel lay back down. God called again: 'Samuel! Samuel!' And this time Samuel answered, 'Speak, LORD, for thy servant heareth.' God spoke to Samuel that night, and Samuel listened. He grew up to be a great prophet who always listened to God.",
      "6-8": "After Hannah brought young Samuel to the tabernacle, he grew up serving God under the priest Eli. Eli was old, and his own sons were wicked — they didn't care about God at all. The Bible says something sad: 'the word of the LORD was precious in those days; there was no open vision' (1 Samuel 3:1). God wasn't speaking much because so few people were listening. But one night, God broke the silence. While Samuel lay in the tabernacle near the Ark of the Covenant, he heard a voice calling his name. He ran to Eli three times, thinking the old priest had called him. On the third time, Eli realized it was the LORD. He told Samuel, 'Go, lie down: and it shall be, if he call thee, that thou shalt say, Speak, LORD; for thy servant heareth.' God called again, and Samuel answered with those famous words. God gave Samuel a serious message — a prophecy of judgement against Eli's family because of his sons' sin. It was a hard message, but Samuel was faithful to deliver it. From that night on, Samuel became God's prophet, and 'the LORD was with him, and did let none of his words fall to the ground' (1 Samuel 3:19).",
      "9-12": "1 Samuel 3 is one of the most important turning points in the Old Testament — the moment God raises up a new voice in a time of spiritual silence. The chapter opens with a devastating statement: 'the word of the LORD was precious in those days; there was no open vision' (3:1). The Hebrew word for 'precious' here means 'rare' — God's voice had become scarce because the spiritual leadership had failed. Eli was passive, and his sons Hophni and Phinehas were corrupt (2:12–17). Into this void, God calls a boy. Samuel's three trips to Eli's room reveal that he didn't yet 'know the LORD' — the word had not yet been 'revealed unto him' (3:7). This isn't a criticism; it's a description of where every person starts. We need God to initiate. When Samuel finally responds with 'Speak, LORD; for thy servant heareth,' he models the posture every believer should have: availability, humility, and readiness to obey. The message God gives is devastating — judgement on Eli's house. Samuel is afraid to tell Eli (3:15), but Eli insists, and Samuel faithfully reports every word. This is the cost of being God's messenger: sometimes the message is hard. The chapter closes with a summary statement that echoes through the rest of Samuel's life: 'the LORD was with him, and did let none of his words fall to the ground' (3:19). Samuel becomes the last judge, the first of the great prophets, and the man who will anoint both Saul and David. It all started with a boy who said, 'Speak, LORD.'"
    },

    scripture: {
      "3-5": "Speak, LORD; for thy servant heareth.\n— 1 Samuel 3:9",
      "6-8": "And the LORD called Samuel again the third time. And he arose and went to Eli, and said, Here am I; for thou didst call me. And Eli perceived that the LORD had called the child.\n— 1 Samuel 3:8\n\nSpeak, LORD; for thy servant heareth.\n— 1 Samuel 3:9",
      "9-12": "And the word of the LORD was precious in those days; there was no open vision.\n— 1 Samuel 3:1\n\nAnd the LORD came, and stood, and called as at other times, Samuel, Samuel. Then Samuel answered, Speak; for thy servant heareth.\n— 1 Samuel 3:10\n\nAnd Samuel grew, and the LORD was with him, and did let none of his words fall to the ground.\n— 1 Samuel 3:19"
    },

    activities: {
      "3-5": "🎨 Draw a picture of Samuel lying in bed in the dark tabernacle with a big golden light shining down — that's God calling! Add a speech bubble from the light that says 'Samuel! Samuel!' and a speech bubble from Samuel that says 'Speak, LORD!'\n\n👂 Play a 'Listening Game' — one person hides and calls someone's name in a whisper. Can you find who is calling? Talk about how we need to learn to listen for God's voice too!",
      "6-8": "📖 Make a 3-fold 'Samuel's Night' scene. Fold a large sheet into three panels: Panel 1 — Samuel asleep, the voice calling (draw sound waves). Panel 2 — Samuel running to Eli (draw Eli shaking his head). Panel 3 — Samuel kneeling, saying 'Speak, LORD.' Write the key verse under panel 3.\n\n✍️ Create a decorated 'Listening Ear' poster — draw a large ear in the centre and write '1 Samuel 3:9' inside it. Around the ear, write five ways we can listen to God today (Bible, prayer, wise people, church, creation). Decorate with borders and colour.",
      "9-12": "📖 Create an illustrated timeline of 1 Samuel 3 — at least 8 scenes from 'Samuel lying down' through 'none of his words fell to the ground.' For each scene, write the verse reference and a one-sentence caption. Use shading to show the progression from darkness (God's word is rare) to light (God speaks again). Make it detailed and colourful enough to display.\n\n✍️ Write a reflective diary entry from Samuel's perspective on the morning AFTER God spoke to him. He has to tell Eli the hard message. What is he feeling — fear, awe, reluctance? How does he find the courage? Include his thoughts about what God's voice sounded like and what it means for his future. End with Eli's response and how it affected Samuel."
    },

    supplies: "Paper, markers, crayons, large sheets for folding, coloured pencils, journal paper, gold/yellow crayons or paint (for light effects)",

    discussionQuestions: [
      "Samuel didn't recognise God's voice at first — it took three times. Why do you think God was patient with him? Is God patient with us when we're slow to listen?",
      "God gave Samuel a really hard message to deliver. Have you ever had to say something true but difficult? What happened?",
      "The Bible says God's word was 'rare' in those days. What do you think makes it easier or harder to hear God? What can we do to be better listeners?"
    ],

    reflection: "Today I learned that God still speaks — and the most important thing I can do is listen. Samuel was just a boy, but he was willing to hear God and obey. I want to have that same heart: 'Speak, LORD; for thy servant heareth.'",

    prayer: "Dear God, thank You that You want to speak to me. Help me to be like Samuel — ready to listen, willing to obey, even when the message is hard. Open my ears to hear Your voice through the Bible, through prayer, and through the people You put in my life. Speak, LORD — I'm listening. Amen.",

    teacherNote: "This chapter marks the transition from the period of the judges to the prophetic era. The rarity of God's word (3:1) is a direct consequence of failed leadership — Eli knew his sons were wicked but did nothing (3:13). God bypasses the established priesthood and speaks to a child, foreshadowing a pattern: God often chooses the unlikely and the young. Samuel's response — 'Speak, LORD; for thy servant heareth' — is the model prayer of availability. Note that Samuel initially says 'Speak' without 'LORD' (3:10 in some readings) — Eli had to teach him to address God properly. This highlights the need for mentors in faith. For older students: Samuel's role as the last judge, first kingmaker prophet, and bridge between two eras makes him one of the most pivotal figures in the Old Testament. His calling story parallels other call narratives (Moses, Isaiah, Jeremiah) — reluctance followed by commission.",

    memoryVerse: "Speak, LORD; for thy servant heareth. — 1 Samuel 3:9",
  },

  // ── Week 21 ──────────────────────────────────
  {
    week: 21,
    title: "David and Goliath",
    bibleRef: "1 Samuel 17",
    keyVerse: "The battle is the LORD's, and he will give you into our hands. — 1 Samuel 17:47",
    theme: "Faith & Courage",
    term: "Term 2",
    month: "May",
    icon: "⚔️",
    color: "#DC2626",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "What is the biggest, scariest thing you've ever faced — a test, a bully, a dark room, something new? Did you feel too small to handle it? Today we meet a boy who was TINY compared to his enemy — but he had a BIG God.",

    story: {
      "3-5": "The Israelites were in big trouble. A GIANT man called Goliath came out every day and shouted, 'Send someone to fight me!' He was taller than a door — almost ten feet tall! All the soldiers were terrified. Nobody was brave enough to fight him. Then along came David — a young shepherd boy. He wasn't a soldier. He was just bringing lunch for his brothers! But when David heard Goliath making fun of God, he was angry. 'I'll fight him!' David said. King Saul said, 'You're just a boy!' But David said, 'God helped me fight a lion and a bear when I was looking after my sheep. He'll help me fight this giant too!' David picked up five smooth stones from a stream and took his sling. He ran toward Goliath and shouted, 'You come with a sword, but I come in the name of the LORD!' David swung his sling — WHOOSH! The stone hit Goliath right on the forehead, and the giant fell down with a CRASH! David won — not because he was strong, but because GOD was with him!",
      "6-8": "The Philistine army and the Israelite army stood on opposite hills with a valley between them. Every morning and evening for forty days, a giant warrior named Goliath marched out and challenged Israel: 'Choose a man to fight me. If he wins, we'll be your servants. If I win, you'll serve us.' Goliath was over nine feet tall, wearing bronze armour that weighed 125 pounds. His spear shaft was like a weaver's beam. Every Israelite soldier — including King Saul — was terrified. Young David arrived at the camp to bring food to his brothers. When he heard Goliath's challenge, he was outraged — not because of the giant's size, but because he was defying 'the armies of the living God' (17:26). David volunteered to fight. Saul was sceptical, but David explained how God had helped him kill a lion and a bear while protecting his sheep. David refused Saul's heavy armour. Instead, he chose five smooth stones from the brook and his shepherd's sling. As he faced Goliath, he declared one of the boldest statements in the Bible: 'Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of the LORD of hosts, the God of the armies of Israel, whom thou hast defied' (17:45). With a single stone, David struck Goliath down. The giant fell face-first, and the Philistine army fled. David's victory was not military — it was theological. The battle was the LORD's.",
      "9-12": "1 Samuel 17 is one of the best-known chapters in the Bible, but it's far more than an underdog story. It's a theological showdown between the gods of Philistia and the living God of Israel. Goliath is not just a big man — he's a champion warrior (the Hebrew word is 'ish habbenayim,' man of the space between), a representative combatant whose victory would enslave an entire nation. For forty days he defies Israel morning and evening (17:16) — a period of testing that echoes other biblical forty-day trials. Saul, who stands 'head and shoulders above' every other Israelite (9:2), should have been the one to fight. He's the king — the human champion Israel asked for. But he cowers in his tent. The contrast is deliberate: the king Israel chose by human standards fails; the boy God chose by divine standards succeeds. David's credentials are not military but pastoral. He's a shepherd who has faced lions and bears — and he frames those encounters theologically: 'The LORD that delivered me out of the paw of the lion, and out of the paw of the bear, he will deliver me out of the hand of this Philistine' (17:37). David's faith is built on past experience of God's faithfulness. His five smooth stones are not a backup plan — slingers in the ancient world were lethal precision fighters. But the real weapon is David's declaration in 17:45–47. He reframes the entire battle: it's not David vs. Goliath but God vs. the gods. 'The battle is the LORD's' (17:47) becomes a defining statement for the rest of David's life. The New Testament parallel is clear: where Israel's human king failed, God's chosen king succeeded. David points to Jesus — the true King who faced the ultimate enemy (sin and death) and won, not with a sword, but with a cross."
    },

    scripture: {
      "3-5": "The battle is the LORD's.\n— 1 Samuel 17:47",
      "6-8": "Thou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of the LORD of hosts, the God of the armies of Israel, whom thou hast defied.\n— 1 Samuel 17:45\n\nThe battle is the LORD's, and he will give you into our hands.\n— 1 Samuel 17:47",
      "9-12": "The LORD that delivered me out of the paw of the lion, and out of the paw of the bear, he will deliver me out of the hand of this Philistine.\n— 1 Samuel 17:37\n\nThou comest to me with a sword, and with a spear, and with a shield: but I come to thee in the name of the LORD of hosts, the God of the armies of Israel, whom thou hast defied. This day will the LORD deliver thee into mine hand.\n— 1 Samuel 17:45–46\n\nFor the battle is the LORD's, and he will give you into our hands.\n— 1 Samuel 17:47"
    },

    activities: {
      "3-5": "🎨 Draw the BIGGEST giant you can on a large piece of paper — make him fill the whole page! Then draw tiny David at the bottom with his sling. Write 'The battle is the LORD's!' at the top.\n\n🪨 Go outside (or use a bowl) and find five smooth stones. Wash them and use a marker to write one word on each stone: GOD – IS – WITH – ME – ALWAYS. Keep them as your 'David stones' to remember that God is bigger than any giant!",
      "6-8": "📖 Create a battle scene diorama in a shoebox. On one side, make Goliath from a cardboard tube — tall, with foil armour and a toothpick spear. On the other side, make small David with a sling. In the valley between them, write '1 Samuel 17:47' on the ground. Add cotton ball clouds and painted hills.\n\n🎨 Design a 'Giant Slayer Shield' from a paper plate. On the front, write 'The Battle is the LORD's!' and draw David's sling and five stones. On the back, write three 'giants' you face (fear, worry, anger) and next to each one write a Bible truth that defeats it.",
      "9-12": "📖 Create an illustrated tactical map of the Valley of Elah. Draw the two hills, the valley, the brook where David collected stones, and the positions of both armies. Mark David's approach path and Goliath's position. Add annotations with key verse references at each location. Include a 'comparison box' in the corner listing Goliath's weapons vs. David's weapons, and write '1 Samuel 17:47' as the conclusion. Make it detailed enough to use as a teaching aid.\n\n✍️ Write a war correspondent's report of the battle as if you were a journalist embedded with the Israelite army. Describe the forty days of terror, interview the soldiers about their fear, capture the moment David arrives and volunteers, and report the battle in vivid detail. End with David's speech in 17:45–47 and the army's reaction. Write it as a front-page news story with a headline."
    },

    supplies: "Large paper, markers, crayons, smooth stones, permanent markers, shoebox, cardboard tubes, aluminium foil, toothpicks, paper plates, cotton balls, paint, glue, coloured pencils, journal paper",

    discussionQuestions: [
      "Everyone else saw Goliath and thought, 'He's too big to fight.' David saw Goliath and thought, 'He's too big to miss.' What made David see things differently from everyone else?",
      "David's faith wasn't new — he'd already trusted God with the lion and the bear. How do small acts of faith prepare us for bigger ones?",
      "Saul was the tallest man in Israel and the king, but he was too afraid to fight. David was a shepherd boy, but he wasn't afraid at all. What does this tell us about where real courage comes from?"
    ],

    reflection: "Today I learned that the giants in my life are never bigger than my God. David didn't win because he was strong or skilled — he won because he trusted God completely. When I face something scary, I don't have to face it alone. The battle is the LORD's.",

    prayer: "Dear God, thank You that no giant is too big for You. When I face things that scare me — problems that feel too big, people who seem too strong, challenges I can't handle — help me to remember that the battle is Yours. Give me the courage of David and the faith to run TOWARD my giants, not away from them. You are bigger than anything I will ever face. Amen.",

    teacherNote: "This chapter rewards careful reading. Goliath's forty-day challenge echoes Israel's forty years in the wilderness and Jesus' forty days of temptation — periods of testing that reveal character. Saul's failure is key: Israel asked for a king 'like the nations' (8:5), and Saul looks the part (9:2), but when the test comes, the human king fails. God's king — chosen not by height but by heart (16:7) — succeeds. David's five stones are often moralised, but in context, Goliath had four brothers (2 Samuel 21:15–22), so David may have been prepared for all five. His sling was not a toy — ancient slingers could hit targets at 100+ yards with lethal force. But the text makes clear that the victory belongs to God, not to David's skill. For older students: David foreshadows Christ. Both are shepherd-kings from Bethlehem, both face an enemy the whole nation fears, both win a victory that saves others, and both do it not with worldly power but with divine authority. Where David used a stone, Jesus used a cross.",

    memoryVerse: "The battle is the LORD's, and he will give you into our hands. — 1 Samuel 17:47",
  },

  // ── Week 22 ──────────────────────────────────
  {
    week: 22,
    title: "David and Jonathan — True Friendship",
    bibleRef: "1 Samuel 18–20",
    keyVerse: "There is a friend that sticketh closer than a brother. — Proverbs 18:24",
    theme: "Friendship & Loyalty",
    term: "Term 2",
    month: "May",
    icon: "🤝",
    color: "#0891B2",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Who is your best friend? What makes them special? What's the bravest or kindest thing they've ever done for you? Today we'll meet two best friends whose friendship was so strong that it changed history.",

    story: {
      "3-5": "After David beat the giant Goliath, he met the king's son, Jonathan. They became the BEST of friends — the Bible says Jonathan loved David 'as his own soul.' Jonathan gave David his own robe, his sword, and his bow — that was like saying, 'Everything I have is yours!' But Jonathan's father, King Saul, became very jealous of David. Saul wanted to hurt David! Jonathan was stuck in the middle — he loved his father AND his friend. Jonathan chose to protect David, even though it was dangerous. He warned David that Saul was coming, and David had to run away. Before David left, the two friends cried together and made a promise: 'We will be friends forever, and God is between us.' Jonathan was a TRUE friend — the kind who loves you even when it costs them something.",
      "6-8": "After David's victory over Goliath, something beautiful happened: 'the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul' (1 Samuel 18:1). Jonathan was the prince — next in line for the throne. David was a shepherd boy. But their friendship crossed every social barrier. Jonathan made a covenant with David and gave him his robe, armour, sword, and bow (18:4). This wasn't just generosity — it was symbolic. The prince was handing his royal identity to the future king. Meanwhile, King Saul grew increasingly jealous of David. The women sang, 'Saul hath slain his thousands, and David his ten thousands' (18:7), and Saul's jealousy turned to murderous rage. He threw a spear at David — twice. Jonathan found himself in an impossible position: loyalty to his father or loyalty to his friend. He chose to protect David, even confronting his own father. In chapter 20, Jonathan devised a plan with arrows to warn David whether it was safe to stay or he must flee. When the signal came — 'run' — the two friends met secretly, wept together, and renewed their covenant. Jonathan said, 'Go in peace, forasmuch as we have sworn both of us in the name of the LORD' (20:42). Jonathan sacrificed his own future to protect God's chosen king. That's the deepest kind of friendship — one that puts the other person first, even at great personal cost.",
      "9-12": "The friendship of David and Jonathan is the greatest human friendship in Scripture — and it's far more than a heartwarming story. It's a study in covenant loyalty, selfless sacrifice, and the difference between God's kingdom and human kingdoms. Jonathan was the crown prince. By every human right, the throne was his. But he recognised something his father Saul refused to see: God had chosen David. Jonathan's response to this reality is extraordinary — he doesn't resent David or compete with him. Instead, he makes a covenant with him (18:3), strips off his royal robes and weapons and gives them to David (18:4), and actively works to see God's will accomplished, even though it means giving up his own future. This is the opposite of Saul, who clung to power at any cost. The contrast between Saul and Jonathan is one of the most important character studies in the Old Testament. Saul represents human ambition — grasping, fearful, jealous, willing to kill to keep his crown. Jonathan represents godly surrender — open-handed, brave, loyal, willing to decrease so that God's chosen one can increase. John the Baptist would echo this same spirit centuries later: 'He must increase, but I must decrease' (John 3:30). In 1 Samuel 20, the arrow scene is a masterpiece of suspense and emotion. When the signal confirms David must flee, the two friends weep together — 'David exceeded' in his grief (20:41). Jonathan's final words are a covenant blessing: 'The LORD be between me and thee, and between my seed and thy seed, for ever' (20:42). David never forgot this covenant. Years later, after Jonathan's death, David sought out Jonathan's son Mephibosheth and showed him 'chesed' — covenant kindness — for Jonathan's sake (2 Samuel 9). True friendship leaves a legacy."
    },

    scripture: {
      "3-5": "There is a friend that sticketh closer than a brother.\n— Proverbs 18:24",
      "6-8": "And the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul.\n— 1 Samuel 18:1\n\nThere is a friend that sticketh closer than a brother.\n— Proverbs 18:24",
      "9-12": "And the soul of Jonathan was knit with the soul of David, and Jonathan loved him as his own soul.\n— 1 Samuel 18:1\n\nAnd Jonathan stripped himself of the robe that was upon him, and gave it to David, and his garments, even to his sword, and to his bow, and to his girdle.\n— 1 Samuel 18:4\n\nThere is a friend that sticketh closer than a brother.\n— Proverbs 18:24\n\nGreater love hath no man than this, that a man lay down his life for his friends.\n— John 15:13"
    },

    activities: {
      "3-5": "🎨 Draw David and Jonathan standing side by side, holding hands. Give Jonathan a crown and robe, and show him handing his sword to David. Draw a big heart around them both and write 'Best Friends' at the top!\n\n🤝 Make 'Friendship Bracelets' — twist together two colours of yarn or strips of paper. As you twist, talk about what makes a good friend: kind, loyal, brave, honest. Wear your bracelet as a reminder!",
      "6-8": "📖 Create a 'Friendship Covenant' scroll. Roll up a piece of paper to look like a scroll. Inside, write a friendship covenant between David and Jonathan — use their own words from the Bible. Then below it, write your own friendship covenant: promises you want to make to your best friend. Decorate the borders with a sword, a bow, and a robe (Jonathan's gifts).\n\n🎨 Make an 'Arrow Signal' craft. Draw a large target with three zones: SAFE (green), WARNING (yellow), DANGER (red). Attach a paper arrow with a brass fastener so it can spin. Retell the story of Jonathan's arrow signal to warn David. Write 1 Samuel 20:42 at the bottom.",
      "9-12": "📖 Create a detailed illustrated character comparison poster: 'SAUL vs. JONATHAN — Two Responses to God's Choice.' Draw a line down the middle. On the left, illustrate Saul's response to David (jealousy, spear-throwing, obsession with power) with verse references. On the right, illustrate Jonathan's response (covenant, gift-giving, self-sacrifice, protection) with verse references. At the bottom, write the question: 'When God promotes someone else, which response do I choose?' Make it visually striking with contrasting colours — dark/angry for Saul, warm/bright for Jonathan.\n\n✍️ Write two diary entries — one from Jonathan's perspective on the day he gave David his robe and weapons, and one from the day of the arrow signal when he said goodbye. In the first entry, explore what it felt like to hand over his royal identity. In the second, capture the grief of the farewell and the hope in the covenant. End with Jonathan's reflection on what true friendship costs."
    },

    supplies: "Paper, markers, crayons, yarn or paper strips (for bracelets), scroll-sized paper, brass fasteners, scissors, coloured pencils, journal paper, brown paper or tea-staining materials (for scroll effect)",

    discussionQuestions: [
      "Jonathan gave up his right to be king because he recognised God had chosen David. That's incredibly hard. Have you ever had to be happy for someone who got something you wanted?",
      "Saul and Jonathan both knew David would be king — but they responded completely differently. What made the difference between them?",
      "Proverbs 18:24 says there is 'a friend that sticketh closer than a brother.' Who is the ultimate friend who sticks closer than anyone? (Hint: John 15:13)"
    ],

    reflection: "Today I learned what true friendship looks like — not just having fun together, but being loyal, brave, and selfless. Jonathan gave up his crown for his friend because he trusted God's plan. The greatest friend of all is Jesus, who gave up everything for us.",

    prayer: "Dear God, thank You for the gift of friendship. Help me to be a friend like Jonathan — loyal, brave, and willing to put others before myself. And thank You that Jesus is the friend who sticks closer than a brother. He gave up His throne in heaven to come and save us. Help me to be that kind of friend to others. Amen.",

    teacherNote: "The David-Jonathan narrative is rich in covenant theology. Jonathan's gift of his royal garments (18:4) is a symbolic abdication — he's acknowledging David as God's chosen king. This puts Jonathan in a unique category: a man who willingly surrenders legitimate power because he trusts God's choice over his own rights. The Saul/Jonathan contrast is one of the best character studies for older children: same information, opposite responses. Saul clings to his crown; Jonathan releases his. For the 9–12 group, draw out the parallel with John the Baptist ('He must increase, but I must decrease') and ultimately with Christ, who 'made himself of no reputation' (Philippians 2:7). David's later care for Mephibosheth (2 Samuel 9) shows that covenant friendship has generational consequences — a powerful lesson about loyalty beyond death.",

    memoryVerse: "There is a friend that sticketh closer than a brother. — Proverbs 18:24",
  },

  // ═══════════════════════════════════════════════════
  // JUNE — Weeks 23–26
  // ═══════════════════════════════════════════════════

  // ── Week 23 ──────────────────────────────────
  {
    week: 23,
    title: "King David — The Shepherd King",
    bibleRef: "2 Samuel 5–7; Psalm 23",
    keyVerse: "The LORD is my shepherd; I shall not want. — Psalm 23:1",
    theme: "God's Provision",
    term: "Term 2",
    month: "Jun",
    icon: "👑",
    color: "#D97706",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If you could be king or queen for a day, what's the FIRST thing you would do? Today we meet the greatest king Israel ever had — and the amazing thing is, he started as a shepherd boy!",

    story: {
      "3-5": "Do you remember David, the boy who beat the giant? Well, David grew up, and God made him king over all of Israel! But David never forgot where he came from. Before he was a king, he was a shepherd — a boy who looked after sheep on the green hills. David knew that just like he took care of his sheep, GOD took care of HIM. So David wrote the most famous poem in the whole Bible: 'The LORD is my shepherd; I shall not want.' That means God gives me everything I need! God leads me to green grass and quiet water. God walks with me even in scary, dark places. God protects me and prepares good things for me. David was a king with a crown, but in his heart, he was always a sheep — and God was always his shepherd.",
      "6-8": "After years of running from Saul, hiding in caves, and living as an outlaw, David finally became king — first over the tribe of Judah, and then over all twelve tribes of Israel. He conquered Jerusalem and made it his capital — the 'City of David.' He brought the Ark of the Covenant to Jerusalem with celebration, dancing and music. Then David wanted to build God a permanent house — a temple. But God said something amazing through the prophet Nathan: 'You won't build ME a house — I will build YOU a house!' God promised David that his throne would last forever (2 Samuel 7:16). This is the Davidic Covenant — one of the most important promises in the Bible, because it points straight to Jesus, the 'Son of David' who sits on an eternal throne. Through it all, David remembered his roots. Psalm 23, written by a king, uses the language of a shepherd. David knew from personal experience what it meant to lead sheep to still waters, to protect them from predators, to guide them through dark valleys. And he knew that God did exactly the same for him. That's why he could write with such confidence: 'The LORD is my shepherd; I shall not want.'",
      "9-12": "David's reign marks the golden age of Israel — but it's the Davidic Covenant in 2 Samuel 7 that carries the most lasting theological weight. When David proposes building God a temple, God reverses the offer through Nathan: 'the LORD telleth thee that he will make thee an house' (7:11). God promises David three things: a great name, a permanent place for Israel, and an eternal dynasty — 'thy throne shall be established for ever' (7:16). This covenant is unconditional. Unlike the Mosaic covenant (which depends on Israel's obedience), the Davidic covenant depends on God's faithfulness alone. It becomes the foundation of messianic hope. Every prophet who speaks of a coming king roots their prophecy in 2 Samuel 7. When the angel Gabriel announces Jesus' birth, he echoes this covenant directly: 'The Lord God shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end' (Luke 1:32–33). Psalm 23, David's most beloved writing, is a masterclass in theological poetry. It moves through six metaphors of God's care: provision (green pastures), peace (still waters), restoration (restoreth my soul), guidance (paths of righteousness), protection (the valley of the shadow of death), and abundance (a table before enemies, cup overflowing). The psalm moves from 'He' language (talking about God) to 'Thou' language (talking to God) — the shift happens at the darkest moment, the valley. It's in the hardest places that our relationship with God becomes most personal. Jesus calls Himself 'the good shepherd' (John 10:11) and deliberately claims David's imagery — but goes further: 'the good shepherd giveth his life for the sheep.' David protected his sheep from lions. Jesus laid down His life for His."
    },

    scripture: {
      "3-5": "The LORD is my shepherd; I shall not want.\n— Psalm 23:1",
      "6-8": "The LORD is my shepherd; I shall not want. He maketh me to lie down in green pastures: he leadeth me beside the still waters. He restoreth my soul.\n— Psalm 23:1–3\n\nThine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever.\n— 2 Samuel 7:16",
      "9-12": "The LORD is my shepherd; I shall not want. He maketh me to lie down in green pastures: he leadeth me beside the still waters. He restoreth my soul: he leadeth me in the paths of righteousness for his name's sake. Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me.\n— Psalm 23:1–4\n\nThine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever.\n— 2 Samuel 7:16\n\nI am the good shepherd: the good shepherd giveth his life for the sheep.\n— John 10:11"
    },

    activities: {
      "3-5": "🎨 Draw a beautiful green field with a stream running through it. Add fluffy sheep, flowers, and a shepherd (that's God!). Put yourself in the picture as one of the sheep! Write 'The LORD is my shepherd' at the top in big colourful letters.\n\n👑 Make a crown from card or paper. On each point of the crown, draw one thing from Psalm 23: green grass, water, a path, a dark valley with a light, a table with food, a cup overflowing. Wear your crown and remember: God is YOUR shepherd!",
      "6-8": "📖 Create an illustrated Psalm 23 booklet. Take 3 sheets of paper, fold them in half to make a 6-page book. On each page, write one section of Psalm 23 and draw a full illustration for it: green pastures, still waters, restored soul, valley of shadow, table before enemies, cup overflowing. Design a cover with David as both shepherd and king.\n\n🎨 Build a 'Shepherd's Field' diorama in a shoebox lid. Use cotton balls for sheep, green paper or fabric for grass, blue paper for a stream, and craft sticks for a shepherd's staff. Add a small crown next to the staff to show David was both shepherd and king. Write Psalm 23:1 on the base.",
      "9-12": "📖 Create an illustrated 'Psalm 23 Annotated Study Page.' Write out the full psalm in your best handwriting in the centre of a large sheet. Around each verse, add annotations: (1) what the metaphor means, (2) a cross-reference to another Bible verse, and (3) a small illustration. Highlight the shift from 'He' to 'Thou' at verse 4 and annotate why this matters. At the bottom, connect Psalm 23 to John 10:11 — David the shepherd → Jesus the Good Shepherd. Make it detailed enough to frame or use as a study resource.\n\n✍️ Write a creative retelling of Psalm 23 from the perspective of one of David's actual sheep. Describe a day in the life: waking in the green pasture, drinking at the still water, following the shepherd through a dark ravine, arriving at a safe campsite where food is prepared. What does the sheep see, hear, and feel? End with the sheep's reflection: 'I shall dwell in the house of the LORD for ever.' Make the reader feel what it means to be shepherded by God."
    },

    supplies: "Paper, markers, crayons, card stock (for crown), stapler (for booklet), shoebox lid, cotton balls, green paper/fabric, blue paper, craft sticks, glue, coloured pencils, large sheets for study page, journal paper",

    discussionQuestions: [
      "David went from shepherd boy to king of Israel — but he never stopped thinking of himself as God's sheep. Why is it important to remember where we came from?",
      "In Psalm 23, the language changes from 'He leads me' to 'Thou art with me' right at the darkest moment — the valley of the shadow of death. Why do you think we feel closest to God in the hardest times?",
      "God promised David an eternal throne. How is Jesus the ultimate fulfilment of that promise?"
    ],

    reflection: "Today I learned that God is my shepherd — He provides for me, guides me, protects me, and never leaves me, even in the darkest valley. David knew this from experience as both a shepherd and a king. I can trust the same God David trusted.",

    prayer: "Dear God, You are my shepherd, and I shall not want. Thank You for green pastures and still waters — for the peaceful, good things in my life. Thank You that even in the darkest valleys, You are with me. Help me to trust You as David did — whether life feels like a green meadow or a dark valley. You are always with me. Amen.",

    teacherNote: "Two major theological threads converge in this lesson: the Davidic Covenant (2 Samuel 7) and the Shepherd King motif (Psalm 23). The Davidic Covenant is unconditional and eternal — God promises to build David a 'house' (dynasty), and this promise survives every failure, exile, and disaster in Israel's history. It is the basis of all messianic prophecy. For Psalm 23, note the structure: verses 1–3 use third person ('He'), but at verse 4, in the darkest moment, David switches to second person ('Thou'). Suffering makes faith personal. For the 9–12 group: Jesus claims the shepherd imagery explicitly in John 10, but surpasses David — David risked his life for sheep; Jesus gave His life. The 'table before enemies' (v.5) shifts the metaphor from pastoral to royal — the shepherd becomes a host, and the sheep becomes an honoured guest. This progression mirrors God's relationship with His people: He doesn't just protect us; He dignifies us.",

    memoryVerse: "The LORD is my shepherd; I shall not want. — Psalm 23:1",
  },

  // ── Week 24 ──────────────────────────────────
  {
    week: 24,
    title: "Solomon's Wisdom",
    bibleRef: "1 Kings 3; Proverbs 1",
    keyVerse: "The fear of the LORD is the beginning of wisdom. — Proverbs 1:7",
    theme: "Wisdom",
    term: "Term 2",
    month: "Jun",
    icon: "📖",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If God said to you right now, 'Ask for ANYTHING you want, and I'll give it to you,' what would you ask for? A million pounds? Superpowers? Today we meet a king who could have asked for ANYTHING — and his answer surprised everyone.",

    story: {
      "3-5": "David's son Solomon became king after David died. One night, God came to Solomon in a dream and said, 'Ask for anything you want!' Solomon could have asked to be rich. He could have asked to live forever. He could have asked to beat all his enemies. But Solomon said, 'God, I'm just young and I don't know how to be a good king. Please give me a WISE heart so I can lead your people well.' God was SO pleased with Solomon's answer! God said, 'Because you asked for wisdom instead of riches, I'll give you wisdom AND riches AND honour — more than any king has ever had!' Solomon became the wisest man in the whole world. People came from far away just to hear his wise words. He wrote thousands of proverbs — little sayings about how to live well. And the most important one was this: 'The fear of the LORD is the beginning of wisdom.' That means knowing God is where ALL wisdom starts!",
      "6-8": "After David died, his son Solomon became king of Israel. Solomon loved God, but he was young and felt overwhelmed. One night at Gibeon, God appeared to Solomon in a dream and made an astonishing offer: 'Ask what I shall give thee' (1 Kings 3:5). Solomon's response reveals his character. He didn't ask for wealth, long life, or victory over enemies. Instead he prayed, 'Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?' (3:9). God was delighted. He gave Solomon wisdom beyond any human who had ever lived — AND riches and honour as a bonus. Solomon's wisdom was immediately tested. Two women came to him, both claiming to be the mother of the same baby. Solomon said, 'Bring me a sword. Cut the child in two and give half to each woman.' The real mother cried out, 'Give her the baby! Don't kill him!' The other woman said, 'Neither mine nor thine — divide it.' Solomon knew instantly who the real mother was. All Israel heard and marvelled: 'the wisdom of God was in him' (3:28). Solomon went on to write the book of Proverbs — a collection of God-given wisdom for daily life. The foundation of it all? 'The fear of the LORD is the beginning of knowledge' (Proverbs 1:7). True wisdom doesn't start with cleverness — it starts with reverence for God.",
      "9-12": "Solomon's reign represents the peak of Israel's political and cultural power — but it begins with a prayer of remarkable humility. At Gibeon, God's offer to Solomon is open-ended: 'Ask what I shall give thee' (1 Kings 3:5). Solomon could have asked for anything. His request for 'an understanding heart' (Hebrew: leb shomea — literally a 'listening heart') pleased God precisely because it showed Solomon understood something most rulers don't: wisdom is not something you possess, it's something you receive. God grants Solomon wisdom 'so that there was none like thee before thee, neither after thee shall any arise like unto thee' (3:12). The Hebrew word for wisdom — 'chokmah' — is practical, not abstract. It means skill for living, the ability to navigate complex situations with discernment and righteousness. Solomon's famous judgement of the two mothers (3:16–28) demonstrates this: he reads human nature with surgical precision. The Book of Proverbs, largely attributed to Solomon, opens with a thesis statement: 'The fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction' (1:7). The Hebrew word 'yirah' (fear) doesn't mean terror — it means reverent awe, the recognition that God is God and we are not. This is the foundation of all true understanding. Without it, knowledge becomes arrogance. However, Solomon's story has a tragic second act. 1 Kings 11 records that his many foreign wives 'turned away his heart after other gods' (11:4). The wisest man who ever lived failed to follow his own advice. This is a sobering reminder: knowing what's right and doing what's right are not the same thing. Solomon's failure points to the need for one greater than Solomon — Jesus, who declared, 'a greater than Solomon is here' (Matthew 12:42). Jesus is wisdom incarnate (1 Corinthians 1:30), and unlike Solomon, He never turned away."
    },

    scripture: {
      "3-5": "The fear of the LORD is the beginning of wisdom.\n— Proverbs 1:7",
      "6-8": "Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad.\n— 1 Kings 3:9\n\nThe fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.\n— Proverbs 1:7",
      "9-12": "Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?\n— 1 Kings 3:9\n\nThe fear of the LORD is the beginning of knowledge: but fools despise wisdom and instruction.\n— Proverbs 1:7\n\nThe queen of the south shall rise up in the judgment with this generation, and shall condemn it: for she came from the uttermost parts of the earth to hear the wisdom of Solomon; and, behold, a greater than Solomon is here.\n— Matthew 12:42"
    },

    activities: {
      "3-5": "👑 Make a 'Wise King Crown' from card. On each point of the crown, draw something Solomon was wise about: animals, trees, fair judgement, and buildings. Write 'Ask God for Wisdom!' on the front.\n\n🎨 Draw the famous story: Solomon, two women, and the baby. Show Solomon sitting on his big throne looking wise. Draw the real mother reaching out with love and the other mother looking cross. Write 'Wisdom comes from God!' at the bottom.",
      "6-8": "📖 Create a 'Book of Proverbs' mini-book. Fold and staple 4 sheets of paper to make a booklet. On each page, write a different proverb from the Bible in your best handwriting and illustrate it. Include Proverbs 1:7, 3:5–6, 15:1, 16:18, and 22:6. Design a cover that says 'The Proverbs of Solomon' with a crown and scroll illustration.\n\n🎨 Design a 'Wisdom vs. Foolishness' comparison poster. Draw a path that splits into two roads. On the 'Wisdom' road, illustrate the Proverbs characteristics (listening, patience, kindness, humility). On the 'Foolishness' road, illustrate the opposite. Write Proverbs 1:7 at the fork in the road.",
      "9-12": "📖 Create an illustrated 'Solomon: Rise & Fall' infographic on a large sheet. Design it as an arc — rising from his humble prayer at Gibeon through his wisdom, the temple construction, and the visit of the Queen of Sheba, then falling through his many wives, idol worship, and the kingdom dividing. At the peak write 1 Kings 3:9; at the bottom write 1 Kings 11:4. Add a box at the bottom: 'A Greater Than Solomon Is Here — Matthew 12:42.' Use colour to show the transition from faithfulness (gold/bright) to unfaithfulness (grey/dark).\n\n✍️ Write a letter from old Solomon to his younger self — the young king who stood at Gibeon and asked for wisdom. What would the older, wiser-but-failed Solomon warn himself about? What would he say he got right? What would he say he got wrong? Include references to his own proverbs that he failed to follow. Make it reflective, honest, and moving."
    },

    supplies: "Card stock (for crown), paper, markers, crayons, stapler (for booklet), large sheets for poster/infographic, coloured pencils, journal paper, gold crayons or paint",

    discussionQuestions: [
      "Solomon could have asked God for ANYTHING — and he asked for wisdom. Why do you think that pleased God so much? What would you have asked for?",
      "Proverbs 1:7 says 'The fear of the LORD is the beginning of wisdom.' What does it mean to 'fear' God? Is it being scared, or something else?",
      "Solomon was the wisest man who ever lived, but he still made terrible choices later in life. What does that tell us about the difference between knowing what's right and doing what's right?"
    ],

    reflection: "Today I learned that true wisdom starts with knowing God — not with being clever. Solomon asked for wisdom and God gave it generously. But I also learned that knowledge without obedience isn't enough. I need to ask God for wisdom AND for the strength to follow it.",

    prayer: "Dear God, like Solomon I ask for wisdom — not cleverness, but a heart that listens to You. Help me to fear You — to stand in awe of who You are. And help me not just to KNOW what's right but to DO what's right. You are the source of all wisdom, and I trust You. Amen.",

    teacherNote: "Solomon's story is a cautionary tale wrapped in a success story. His prayer at Gibeon (1 Kings 3:9) is one of the model prayers in Scripture — asking for a 'listening heart' (leb shomea) rather than power or wealth. God's generous response shows that He delights in giving wisdom to those who ask (cf. James 1:5). However, the full arc of Solomon's life must be told honestly, especially for older children. 1 Kings 11 reveals that Solomon's foreign wives led him into idolatry — the wisest man alive broke the most fundamental commandment. This creates a critical teaching moment: wisdom and obedience are not the same thing. Solomon wrote Proverbs but failed to live by them. The 'greater than Solomon' reference in Matthew 12:42 is essential — Jesus is both perfectly wise and perfectly obedient. Where Solomon failed, Christ succeeds. For the 9–12 group, the Hebrew concept of chokmah (practical wisdom/skill for living) vs. mere intellectual knowledge is worth unpacking.",

    memoryVerse: "The fear of the LORD is the beginning of wisdom. — Proverbs 1:7",
  },

  // ── Week 25 ──────────────────────────────────
  {
    week: 25,
    title: "Elijah on Mount Carmel",
    bibleRef: "1 Kings 18",
    keyVerse: "The LORD, he is the God; the LORD, he is the God. — 1 Kings 18:39",
    theme: "God's Power & Boldness",
    term: "Term 2",
    month: "Jun",
    icon: "🔥",
    color: "#EA580C",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever had to stand up for something you believed in, even when EVERYONE else disagreed? How did it feel? Today we meet a man who stood alone against 450 enemies — and God showed up in the most spectacular way.",

    story: {
      "3-5": "The people of Israel had forgotten God. Their wicked King Ahab and his wife Jezebel worshipped a pretend god called Baal. But God had a brave man named Elijah. Elijah said, 'Let's have a contest on top of Mount Carmel! The prophets of Baal can build an altar and pray to their god. I'll build an altar and pray to MY God. Whichever god sends fire from heaven — HE is the real God!' The 450 prophets of Baal prayed and danced and shouted ALL DAY. Nothing happened. Not even a spark! Then it was Elijah's turn. He built his altar and poured WATER all over it — so much water that it filled a trench around it! Then Elijah prayed a simple prayer: 'LORD God, let the people know that You are the true God.' And WHOOOOSH! Fire fell from heaven! It burned up the sacrifice, the wood, the stones, the dust, and even licked up all the water! The people fell on their faces and cried, 'The LORD, HE is the God!'",
      "6-8": "King Ahab was one of the most wicked kings in Israel's history. He married Jezebel, a foreign princess who worshipped Baal, and together they led Israel into widespread idol worship. They killed God's prophets and built Baal temples across the land. Into this darkness, God sent Elijah — one man against an entire corrupt system. After three years of drought (God's judgement on the land), Elijah challenged Ahab to a showdown on Mount Carmel: 450 prophets of Baal against one prophet of the LORD. The rules were simple: each side would prepare a sacrifice but light no fire. The god who answered by fire would be proved real. The prophets of Baal went first. They prayed, shouted, danced, and even cut themselves from morning until evening. Elijah mocked them: 'Cry louder! Maybe he's sleeping, or on a journey!' (18:27). Nothing happened. Then Elijah stepped forward. He repaired the broken altar of the LORD, arranged the sacrifice, and did something astonishing — he drenched everything with twelve jars of water, filling a trench around the altar. He wanted there to be absolutely no doubt. Then he prayed — not a long prayer, not a loud prayer, just a simple, confident request: 'LORD God of Abraham, Isaac, and of Israel, let it be known this day that thou art God in Israel' (18:36). Fire fell from heaven. It consumed the sacrifice, the wood, the stones, the dust, and evaporated every drop of water. The people fell on their faces: 'The LORD, he is the God; the LORD, he is the God!' (18:39). One man plus God is always a majority.",
      "9-12": "The Mount Carmel showdown in 1 Kings 18 is one of the most dramatic scenes in the Old Testament — and it's about far more than a fire contest. It's the climax of a national spiritual crisis. Under Ahab and Jezebel, Baal worship had become Israel's official religion. Jezebel had systematically murdered God's prophets (18:4), and Obadiah had hidden a hundred of them in caves. Israel was in full apostasy. Elijah's challenge cuts to the heart of the issue: 'How long halt ye between two opinions? if the LORD be God, follow him: but if Baal, then follow him' (18:21). The Hebrew word for 'halt' (pasach) means to limp or hobble — Israel was spiritually crippled by trying to worship both gods. The Baal prophets' failure is deliberately emphasised. Their frantic worship — shouting, dancing, cutting themselves (18:28) — represents everything pagan religion demands: human effort, self-harm, desperation. Elijah's response is the opposite: calm confidence in a God who doesn't need to be woken up. His mockery (18:27) is theological polemic — Baal was supposedly the storm god who controlled fire and rain, yet he can't even light a bonfire. Elijah's water-soaking is not showing off. Twelve jars of water in the middle of a three-year drought is an act of extravagant faith — he's making the miracle harder to prove that God can handle anything. The number twelve corresponds to the twelve tribes, symbolising that this contest is about the whole nation's identity. When fire falls, it doesn't just burn the sacrifice — it consumes everything: wood, stones, dust, and water (18:38). This is not natural fire. It's the presence of God, and it leaves nothing for human hands to claim credit for. The people's confession — 'The LORD, he is the God' — uses the covenant name YHWH. They're not just acknowledging a powerful deity; they're returning to their covenant God. For all its power, the Mount Carmel story also reveals Elijah's humanity. In the very next chapter (1 Kings 19), the man who faced 450 prophets runs in terror from one woman, Jezebel. Even the greatest faith has moments of fear — and God meets Elijah in that low place with gentle provision, not rebuke."
    },

    scripture: {
      "3-5": "The LORD, he is the God; the LORD, he is the God.\n— 1 Kings 18:39",
      "6-8": "How long halt ye between two opinions? if the LORD be God, follow him: but if Baal, then follow him.\n— 1 Kings 18:21\n\nThen the fire of the LORD fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench.\n— 1 Kings 18:38\n\nThe LORD, he is the God; the LORD, he is the God.\n— 1 Kings 18:39",
      "9-12": "And Elijah came unto all the people, and said, How long halt ye between two opinions? if the LORD be God, follow him: but if Baal, then follow him. And the people answered him not a word.\n— 1 Kings 18:21\n\nHear me, O LORD, hear me, that this people may know that thou art the LORD God, and that thou hast turned their heart back again.\n— 1 Kings 18:37\n\nThen the fire of the LORD fell, and consumed the burnt sacrifice, and the wood, and the stones, and the dust, and licked up the water that was in the trench. And when all the people saw it, they fell on their faces: and they said, The LORD, he is the God; the LORD, he is the God.\n— 1 Kings 18:38–39"
    },

    activities: {
      "3-5": "🔥 Make a Mount Carmel craft — build an 'altar' from stacked brown paper or cardboard pieces. Put scrunched-up red, orange, and yellow tissue paper on top for the fire from heaven. Add cotton ball 'water' around the base. Write 'God sent the fire!' on a card next to it.\n\n🎨 Draw the moment the fire falls — a big mountain, Elijah with his arms up, fire coming down from the sky, and all the people falling on their faces saying 'The LORD is God!' Use lots of red, orange, and yellow!",
      "6-8": "📖 Create a 'Mount Carmel Showdown' comic strip with at least 6 panels: (1) Elijah challenges the people, (2) Baal prophets dancing and shouting — nothing happens, (3) Elijah mocks them, (4) Elijah rebuilds the altar and pours water, (5) Fire falls from heaven, (6) People cry 'The LORD, he is the God!' Add speech bubbles with real Bible quotes.\n\n🔥 Build a 3D altar from small boxes or blocks, stacked and wrapped in brown paper. Add tissue paper flames. Place a card next to it with the 'scoreboard': BAAL: 0 / THE LORD: ∞. Write 1 Kings 18:39 below.",
      "9-12": "📖 Create a detailed illustrated 'Mount Carmel Battle Map and Infographic.' Draw the mountain, the two altars, the positions of the crowds, and the trench. Add a timeline running down the side showing: morning (Baal prophets begin), noon (Elijah mocks), evening (Elijah prays), and the fire falling. Include annotation boxes explaining the significance of: the twelve jars of water (twelve tribes), the broken altar being repaired (covenant restored), and the fire consuming even the stones (nothing left for human credit). Make it poster-sized and visually dramatic.\n\n✍️ Write a newspaper front page reporting the events of Mount Carmel. Include a headline, a lead article describing the contest, a sidebar with Elijah's 1 Kings 18:21 quote, a 'witness interview' (what a bystander saw and felt), and an editorial asking 'What does this mean for Israel?' Design it to look like a real newspaper with columns, a masthead, and illustrations."
    },

    supplies: "Brown paper or cardboard (for altar), red/orange/yellow tissue paper, cotton balls, small boxes or blocks, glue, markers, crayons, large sheets for comic strip/infographic, coloured pencils, journal paper, newspaper-style layout paper",

    discussionQuestions: [
      "Elijah asked Israel: 'How long will you go back and forth between two opinions?' Is it possible to try to follow God AND other things at the same time? What happens when we do?",
      "Elijah was ONE man against 450. He was outnumbered but not outpowered. When have you felt outnumbered? What does this story teach us about being in the minority?",
      "After this incredible victory, Elijah ran away in fear the very next day (1 Kings 19). Why do you think even strong faith has weak moments? How does God respond to Elijah's fear?"
    ],

    reflection: "Today I learned that the LORD is the one true God — and one person plus God is always enough. Elijah stood alone with complete confidence, not in himself, but in God. When I face situations where I'm outnumbered or things seem impossible, I can trust that God's power is more than enough.",

    prayer: "Dear God, You are the one true God — there is no other. Give me the courage of Elijah to stand for You even when I'm the only one. Help me to stop going back and forth and to follow You with my whole heart. And when I feel afraid or alone, remind me that You are with me and Your power is more than enough. Amen.",

    teacherNote: "1 Kings 18 is rich with typology and theological depth. The contest format — two altars, two prayers, one answer — is designed to force Israel out of syncretism. Elijah's question (18:21) uses 'halt' (pasach = limp/hobble), which is the same root as 'Passover' (pesach) — Israel is limping past the God who saved them. The twelve jars of water correspond to the twelve tribes and symbolically represent the whole nation being 'baptised' in this act of faith. The fire consumes everything — wood, stones, dust, water — leaving nothing for anyone to claim credit. This is sola gratia in action. For older students, the contrast between Baal worship (self-effort, self-harm, desperation) and Elijah's worship (calm prayer, trust, confidence) is a profound picture of the difference between works-based religion and grace-based faith. Don't skip 1 Kings 19 in discussion — Elijah's depression after the victory teaches that spiritual highs are often followed by lows, and God meets us with bread, water, and a still small voice, not condemnation.",

    memoryVerse: "The LORD, he is the God; the LORD, he is the God. — 1 Kings 18:39",
  },

  // ═══════════════════════════════════════════════════
  // ── Week 26 ──────────────────────────────────
  {
    week: 26,
    title: "Elisha and the Widow's Oil",
    bibleRef: "2 Kings 4:1–7",
    keyVerse: "What shall I do for thee? tell me, what hast thou in the house? — 2 Kings 4:2",
    theme: "God's Provision & Miracles",
    term: "Term 2",
    month: "Jun",
    icon: "🫗",
    color: "#0D9488",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever felt like you had almost NOTHING left — maybe the last biscuit, the last coin, the last bit of hope? What did you do? Today we meet a woman who had nothing left except one tiny jar of oil — and God turned it into something incredible.",

    story: {
      "3-5": "A poor woman came crying to the prophet Elisha. 'My husband has died and I owe money! The man I owe is going to take my two boys away!' Elisha asked, 'What do you have in your house?' The woman said, 'Nothing — just one tiny jar of oil.' Elisha said, 'Go and borrow as many empty jars as you can from all your neighbours. Then go inside, shut the door, and start pouring your little jar of oil into all the empty ones.' The woman did what Elisha said. She poured and poured and POURED. The oil kept flowing! Jar after jar after jar — they all filled up! The oil didn't stop until every single jar was full. Then Elisha said, 'Go sell the oil, pay what you owe, and live on the rest.' God took the tiny bit she had and made it MORE than enough!",
      "6-8": "After Elijah was taken up to heaven, his servant Elisha continued his work as God's prophet. One day a widow came to Elisha in desperation. Her husband — a faithful man who had served God — had died and left behind debts. The creditor was coming to take her two sons as slaves to pay it off. This was legal in ancient Israel, but it was devastating. Elisha asked one question: 'What hast thou in the house?' (4:2). She had almost nothing — just a single pot of oil. Elisha's instructions were unusual: borrow as many empty vessels as possible from neighbours, then go inside with her sons, shut the door, and start pouring. What happened next was pure miracle. The tiny jar of oil kept pouring — vessel after vessel filled to the brim. Her sons kept bringing jars, and she kept pouring. The oil only stopped when there were no more empty vessels. Elisha told her to sell the oil, pay her debt, and live on the rest. God didn't just meet her need — He exceeded it abundantly. The miracle had one key condition: the woman had to act in faith BEFORE she saw the result. She borrowed jars for oil she didn't have yet. And the amount of miracle she received was directly connected to the number of jars she collected. More faith, more vessels, more provision.",
      "9-12": "2 Kings 4:1–7 is a compact but theologically rich miracle narrative. The widow's situation represents the worst-case scenario in ancient Israel: a dead husband, crushing debt, and children about to be enslaved. She has no legal recourse, no social safety net, and no earthly hope. Elisha's question — 'What hast thou in the house?' — is the same question God asks throughout Scripture. He doesn't start with what we lack; He starts with what we have. Moses had a rod. David had five stones. A boy had five loaves. This widow had a pot of oil. God's miraculous provision consistently begins with our small offering of faith. The instruction to 'shut the door' (4:4) is significant. The miracle happens in private, away from spectacle. This echoes Jesus' teaching on prayer in Matthew 6:6 — 'when thou prayest, enter into thy closet, and shut thy door.' God's provision is intimate, not performative. The most striking detail is that the oil stopped flowing when the vessels ran out (4:6). The miracle was limited not by God's supply but by the woman's preparation. If she had collected more jars, more oil would have flowed. This is a profound principle: God's provision often matches the size of our faith-filled expectation. The oil in Scripture consistently symbolises the Holy Spirit (1 Samuel 16:13, Isaiah 61:1, Acts 10:38). The widow's jar that never runs dry points to the inexhaustible nature of God's Spirit — poured out abundantly for all who bring their empty vessels to Him. Paul captures this principle in Ephesians 3:20: God 'is able to do exceeding abundantly above all that we ask or think.'"
    },

    scripture: {
      "3-5": "What shall I do for thee? tell me, what hast thou in the house?\n— 2 Kings 4:2",
      "6-8": "What shall I do for thee? tell me, what hast thou in the house? And she said, Thine handmaid hath not any thing in the house, save a pot of oil.\n— 2 Kings 4:2\n\nGo, sell the oil, and pay thy debt, and live thou and thy children of the rest.\n— 2 Kings 4:7",
      "9-12": "What shall I do for thee? tell me, what hast thou in the house? And she said, Thine handmaid hath not any thing in the house, save a pot of oil.\n— 2 Kings 4:2\n\nAnd it came to pass, when the vessels were full, that she said unto her son, Bring me yet a vessel. And he said unto her, There is not a vessel more. And the oil stayed.\n— 2 Kings 4:6\n\nNow unto him that is able to do exceeding abundantly above all that we ask or think, according to the power that worketh in us.\n— Ephesians 3:20"
    },

    activities: {
      "3-5": "🫗 Set up a 'pouring station' with a small jug of water and lots of little cups. Let each child pour from the jug into the cups. Talk about how the widow's oil kept going and going because GOD made it last! Count how many cups you filled.\n\n🎨 Draw the widow's house with lots and lots of jars inside — some big, some small, some tall, some round — ALL overflowing with golden oil! Draw the widow smiling and her sons helping. Write 'God gives MORE than enough!' at the top.",
      "6-8": "📖 Make a 'Miracle Oil' flip book. Fold 4 sheets of paper in half and staple. Page by page, tell the story: (1) Widow crying to Elisha, (2) Elisha asks 'What do you have?', (3) Sons collecting empty jars, (4) Door shut — oil pouring, (5) Jars filling up one by one, (6) Oil stops — every jar full, (7) Widow sells oil and pays debt, (8) Write Ephesians 3:20 as the lesson. Illustrate each page.\n\n🫗 Create a 'What Do You Have?' poster. Draw a large jar in the centre labelled 'My Small Thing.' Around the jar, draw arrows pointing outward to many smaller jars, each labelled with something God can do with what we offer: 'courage,' 'kindness,' 'a prayer,' 'a smile,' 'sharing.' Write 2 Kings 4:2 at the top.",
      "9-12": "📖 Create an illustrated 'God Starts With What You Have' infographic. Draw a grid showing 5 biblical examples of God using something small: Moses' rod, David's stones, the boy's loaves, the widow's oil, and Mary's 'yes.' For each one, draw the small offering on the left and the mighty result on the right with an arrow between them. Add the verse reference for each. At the bottom, write: 'What do YOU have in your house?' and Ephesians 3:20. Make it colourful, detailed, and poster-sized.\n\n✍️ Write a short story from the perspective of the widow's older son. Describe knocking on neighbours' doors to borrow jars (what did they think?), carrying them home, shutting the door, and watching his mother pour oil from one tiny jar that never runs out. What does he feel — fear, confusion, awe, joy? Describe the moment the last jar fills and the oil stops. End with his reflection on what he learned about God that day."
    },

    supplies: "Small jug and cups (for pouring activity), paper, markers, crayons, stapler (for flip book), large sheets for poster/infographic, coloured pencils, gold/yellow crayons or paint, journal paper",

    discussionQuestions: [
      "Elisha didn't ask the widow what she NEEDED — he asked what she already HAD. Why do you think God starts with what we have, instead of just giving us something new?",
      "The oil stopped flowing when the jars ran out — not when God's supply ran out. What does that teach us about faith and expectation?",
      "The miracle happened behind a closed door — just the widow and her sons. Why do you think God sometimes works in private rather than in public?"
    ],

    reflection: "Today I learned that God doesn't need me to have a lot — He just needs me to bring what I have and trust Him with it. The widow had one tiny jar, but God made it overflow. Whatever I have — even if it feels small — is enough when I put it in God's hands.",

    prayer: "Dear God, thank You that You can take the smallest thing and make it more than enough. Help me not to focus on what I don't have, but to bring what I DO have to You. Like the widow, I want to trust You behind the closed door — to pour out in faith and watch You fill every empty space. You are the God of more than enough. Amen.",

    teacherNote: "This miracle is compact but theologically loaded. Elisha's question — 'What hast thou in the house?' — establishes a biblical principle: God's miracles begin with human offering, however small. The pattern repeats throughout Scripture (Moses' rod, Gideon's 300, the boy's loaves). The 'shut the door' detail (4:4) is significant — the miracle is private, not spectacular. God's provision doesn't require an audience. The oil stopping when the vessels run out (4:6) is the key teaching point: God's supply is unlimited, but our capacity to receive is limited by our faith and preparation. For older students, oil as a symbol of the Holy Spirit is worth exploring (1 Samuel 16:13, Isaiah 61:1). The widow's never-ending oil foreshadows the Spirit's inexhaustible provision. The story also has echoes of Elijah's earlier miracle with the widow of Zarephath (1 Kings 17:8–16), showing continuity between the two prophets.",

    memoryVerse: "What shall I do for thee? tell me, what hast thou in the house? — 2 Kings 4:2",
  },

  // ═══════════════════════════════════════════════════
  // JULY — Weeks 27–30
  // ═══════════════════════════════════════════════════

  // ── Week 27 ──────────────────────────────────
  {
    week: 27,
    title: "Isaiah's Vision of God",
    bibleRef: "Isaiah 6",
    keyVerse: "Here am I; send me. — Isaiah 6:8",
    theme: "Holiness & Calling",
    term: "Term 3",
    month: "Jul",
    icon: "✨",
    color: "#7C3AED",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Imagine you walked into a room and suddenly saw the most powerful, beautiful, amazing person you could ever imagine — someone so bright you could barely look at them. What would you do? Today we see what happened when a man named Isaiah saw GOD.",

    story: {
      "3-5": "Isaiah was a man who loved God. One day, God let Isaiah see something AMAZING. Isaiah saw God sitting on a huge, high throne! God was so great that just the bottom of His robe filled the whole temple! Around God were angels called seraphim. They had six wings each — two covered their faces, two covered their feet, and two they used to fly. They were calling out to each other: 'Holy, holy, holy is the LORD! The whole earth is full of His glory!' The building SHOOK and filled with smoke! Isaiah was terrified. He cried, 'Oh no! I'm not good enough to be here!' But one of the angels flew over with a hot coal from the altar and touched Isaiah's lips. 'Your sin is taken away,' the angel said. Then God's voice asked, 'Who shall I send? Who will go for me?' And Isaiah answered bravely: 'Here am I — send ME!'",
      "6-8": "In the year that King Uzziah died, God gave Isaiah an extraordinary vision. He saw the Lord sitting on a throne, high and lifted up, with the train of His robe filling the entire temple. Above the throne stood seraphim — fiery angelic beings, each with six wings. With two they covered their faces (even angels can't look directly at God's glory), with two they covered their feet (in humility before His holiness), and with two they flew. They cried out to one another in a never-ending chorus: 'Holy, holy, holy, is the LORD of hosts: the whole earth is full of his glory' (6:3). The doorposts shook and the temple filled with smoke. Isaiah's response was not awe but horror at himself: 'Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, the LORD of hosts' (6:5). In the presence of perfect holiness, Isaiah saw his own sin clearly for the first time. But God didn't leave him in despair. A seraph flew to Isaiah carrying a live coal from the altar and touched his lips: 'Thine iniquity is taken away, and thy sin purged' (6:7). Cleansed and forgiven, Isaiah then heard God's voice: 'Whom shall I send, and who will go for us?' Isaiah's answer became one of the most famous lines in the Bible: 'Here am I; send me.' He went from terror to confession to cleansing to calling — all in one encounter.",
      "9-12": "Isaiah 6 is one of the most theologically dense chapters in the Old Testament. The timing matters: 'In the year that king Uzziah died' (6:1). Uzziah had been a strong king for 52 years, and his death created a national crisis. Into this uncertainty, Isaiah sees the TRUE King — the Lord 'high and lifted up,' seated on His throne, with His robe filling the temple. The earthly king is dead; the heavenly King reigns. The seraphim (the word means 'burning ones') are unique to this passage. Their six-winged posture is instructive: two wings cover their faces (they cannot gaze fully at God's holiness), two cover their feet (humility before His glory), and two are for flight (readiness to serve). Even the highest angels worship with reverence and humility. Their cry — 'Holy, holy, holy' — is the only attribute of God repeated three times in Scripture. This triple repetition (the trisagion) represents the superlative degree in Hebrew. God is not just holy — He is the holiest of all possible holiness. The threefold repetition also hints at the Trinity — a connection made explicit in John 12:41, where John says Isaiah 'saw his [Jesus'] glory.' Isaiah's response — 'Woe is me! for I am undone' — is the proper human response to God's holiness. The Hebrew 'undone' (nidmeti) means to be destroyed or silenced. In God's light, all our pretence of goodness collapses. Isaiah doesn't say 'Woe is them' (pointing at others' sin) but 'Woe is ME.' True encounter with God always produces self-awareness before commission. The coal from the altar is the key: Isaiah cannot cleanse himself. Purification must come from God's altar — from sacrifice. This points forward to the cross, where the ultimate sacrifice would purge sin permanently (Hebrews 10:10). Only AFTER being cleansed does Isaiah hear the commission: 'Whom shall I send?' God doesn't send dirty vessels. The order matters: vision → conviction → cleansing → calling. You cannot skip steps."
    },

    scripture: {
      "3-5": "Here am I; send me.\n— Isaiah 6:8",
      "6-8": "Holy, holy, holy, is the LORD of hosts: the whole earth is full of his glory.\n— Isaiah 6:3\n\nThen said I, Woe is me! for I am undone; because I am a man of unclean lips.\n— Isaiah 6:5\n\nHere am I; send me.\n— Isaiah 6:8",
      "9-12": "Holy, holy, holy, is the LORD of hosts: the whole earth is full of his glory.\n— Isaiah 6:3\n\nThen said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, the LORD of hosts.\n— Isaiah 6:5\n\nThen flew one of the seraphims unto me, having a live coal in his hand, which he had taken with the tongs from off the altar: And he laid it upon my mouth, and said, Lo, this hath touched thy lips; and thine iniquity is taken away, and thy sin purged.\n— Isaiah 6:6–7\n\nAlso I heard the voice of the Lord, saying, Whom shall I send, and who will go for us? Then said I, Here am I; send me.\n— Isaiah 6:8"
    },

    activities: {
      "3-5": "👼 Make a seraphim angel craft — draw or cut out an angel shape from paper. Give it SIX wings (fold paper to cut three pairs). Use gold and red colours. Glue it onto dark blue or purple paper to show God's throne room. Write 'Holy, holy, holy!' above it.\n\n🎨 Draw God's throne room — make it BIG and BRIGHT! Draw the huge throne, the seraphim flying around it, clouds of smoke, and tiny Isaiah at the bottom looking amazed. Use your brightest colours for God's glory and write 'Here am I; send me!' at the bottom.",
      "6-8": "📖 Create a 4-step visual sequence poster showing Isaiah's encounter: (1) VISION — draw the throne, seraphim, and glory. (2) CONVICTION — draw Isaiah fallen down, crying 'Woe is me!' (3) CLEANSING — draw the angel touching Isaiah's lips with the coal. (4) CALLING — draw Isaiah standing tall, saying 'Here am I; send me!' Label each step and write the matching verse underneath. Use a progression of colours from overwhelming brightness to calm readiness.\n\n✨ Make a 'burning coal' craft — scrunch up red and orange tissue paper around a small stone or ball of foil to create a 'coal.' Attach a tag that reads Isaiah 6:7 — 'Thine iniquity is taken away.' Discuss what the coal represents: God's cleansing that we can't do ourselves.",
      "9-12": "📖 Create a detailed illustrated study page of Isaiah 6 showing the four-step progression: VISION → CONVICTION → CLEANSING → CALLING. For each step, write the key verses, draw an illustration, and add theological annotations explaining what it means. Include a side panel explaining the seraphim's six wings (what each pair represents), the significance of the triple 'Holy,' and how the coal from the altar points to the cross (Hebrews 10:10). At the bottom, draw a connection to John 12:41 — Isaiah saw Jesus' glory. Make it study-guide quality.\n\n✍️ Write a first-person account from Isaiah's perspective of the vision in chapter 6. Describe what he sees, hears, smells, and feels at each stage — the overwhelming throne room, the earthquake, the smoke, the terror of seeing his own sin, the searing touch of the coal, and the moment he hears God's voice and responds. Make the reader FEEL the progression from terror to commission. End with Isaiah walking out of the temple — what has changed in him?"
    },

    supplies: "Paper, markers, crayons, scissors, glue, gold and red paper or paint, tissue paper (red/orange), small stones or foil balls, dark blue/purple paper, coloured pencils, large sheets for poster/study page, journal paper",

    discussionQuestions: [
      "When Isaiah saw God's holiness, the first thing he noticed was his own sin — not anyone else's. Why does being close to God show us the truth about ourselves?",
      "Isaiah couldn't cleanse himself — the angel had to bring the coal from God's altar. What does that teach us about how sin is dealt with? Can we fix ourselves?",
      "God asked, 'Who will go for us?' — He didn't force Isaiah. He invited him. Why does God ask for volunteers instead of just commanding people?"
    ],

    reflection: "Today I learned that God is holy — so holy that even angels cover their faces. When I see how perfect God is, I realise how much I need His forgiveness. But God doesn't leave me in my sin — He cleanses me and then asks, 'Will you go for Me?' My answer can be the same as Isaiah's: 'Here am I; send me.'",

    prayer: "Dear God, You are holy, holy, holy — there is no one like You. When I come close to You, show me the truth about myself and then cleanse me with Your grace. I can't fix my own sin, but You can. And once You've made me clean, I want to say like Isaiah: Here am I — send me. Use me for Your purposes. Amen.",

    teacherNote: "Isaiah 6 contains the four-step pattern of every genuine encounter with God: vision (seeing God as He is), conviction (seeing ourselves as we are), cleansing (receiving grace we cannot earn), and calling (being sent on mission). This order is non-negotiable — you cannot skip from vision to calling without going through conviction and cleansing. The trisagion ('Holy, holy, holy') is the only divine attribute given triple emphasis in Scripture — not 'love, love, love' or 'mighty, mighty, mighty,' but 'holy, holy, holy.' Holiness is the foundational attribute from which all others flow. For the 9–12 group, John 12:41 is a critical cross-reference: John explicitly says Isaiah saw Christ's glory. This makes the throne room a Trinitarian scene — the 'us' in 'who will go for us?' (6:8) gains Trinitarian significance. The coal from the altar connects directly to the sacrificial system and ultimately to the cross — cleansing always comes through sacrifice, never through self-effort.",

    memoryVerse: "Here am I; send me. — Isaiah 6:8",
  },

  // ── Week 28 ──────────────────────────────────
  {
    week: 28,
    title: "The Suffering Servant",
    bibleRef: "Isaiah 53",
    keyVerse: "He was wounded for our transgressions, he was bruised for our iniquities. — Isaiah 53:5",
    theme: "The Cross Foretold",
    term: "Term 3",
    month: "Jul",
    icon: "✝️",
    color: "#991B1B",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Has anyone ever taken a punishment for you — maybe a brother or sister got in trouble so you wouldn't have to? How did that feel? Today we read something Isaiah wrote 700 years before Jesus — and it describes the cross PERFECTLY.",

    story: {
      "3-5": "A long, long time before Jesus was born, God told a man called Isaiah something very important. God said that one day, someone very special would come. This special person would be hurt — not because He did anything wrong, but because of what WE did wrong. Isaiah said this person would be like a gentle lamb. People would be mean to Him, but He wouldn't fight back. He would take the punishment that should have been ours. Why? Because He LOVED us. This special person is Jesus! Hundreds of years before Jesus was born, God already had a plan to save us. Jesus took OUR punishment so we could be forgiven. That's the best news in the whole world!",
      "6-8": "About 700 years before Jesus was born, the prophet Isaiah wrote something incredible — a description so detailed that it reads like an eyewitness account of the crucifixion. Isaiah 53 describes a 'Suffering Servant' who would come to save God's people — not by conquering armies but by suffering in their place. Isaiah says He was 'despised and rejected of men; a man of sorrows, and acquainted with grief' (53:3). He was 'wounded for our transgressions' and 'bruised for our iniquities' (53:5). He was led 'as a lamb to the slaughter' and didn't open His mouth to defend Himself (53:7). He was buried with the wicked but also with the rich (53:9) — Jesus was crucified between thieves and buried in a rich man's tomb. And here's the amazing part: Isaiah says this happened on PURPOSE. 'The LORD hath laid on him the iniquity of us all' (53:6). God placed our sin on the Servant so that we could be healed. 'With his stripes we are healed' (53:5). This isn't a coincidence — this is God's rescue plan, announced centuries in advance. The Suffering Servant is Jesus, and Isaiah 53 is the clearest picture of the gospel in the entire Old Testament.",
      "9-12": "Isaiah 53 is the most remarkable prophetic passage in the Old Testament — written approximately 700 years before Christ, it describes the crucifixion, burial, and atoning purpose of Jesus with such precision that early critics argued it must have been written after the fact. The Dead Sea Scrolls (discovered 1947) proved the text predates Jesus by centuries. The passage is the fourth 'Servant Song' in Isaiah (the others are 42:1–9, 49:1–7, 50:4–9), and it answers the question Israel had been asking for centuries: how will God save His people? The answer shocked everyone: not through a conquering warrior, but through a suffering servant. The theology of Isaiah 53 is substitutionary atonement in its purest form. The key words are forensic: 'wounded FOR our transgressions,' 'bruised FOR our iniquities,' 'the chastisement of our peace was UPON him,' 'the LORD hath laid ON him the iniquity of us all' (53:5–6). The prepositions are critical — every one indicates transfer. Our sin is placed on Him; His righteousness is given to us. This is the great exchange. Verse 7 — 'he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth' — is the exact passage the Ethiopian eunuch was reading when Philip encountered him in Acts 8:32–35. Philip 'began at the same scripture, and preached unto him Jesus.' The details match Jesus' life precisely: despised and rejected (John 1:11), a man of sorrows (John 11:35), silent before His accusers (Matthew 27:12–14), numbered with transgressors (Mark 15:27–28), buried in a rich man's tomb (Matthew 27:57–60), and ultimately vindicated — 'he shall see his seed, he shall prolong his days' (53:10), pointing to the resurrection. Isaiah 53 demolishes the idea that Jesus' death was an accident or a tragedy. It was planned 'from the foundation of the world' (Revelation 13:8). The cross is not plan B — it is plan A."
    },

    scripture: {
      "3-5": "He was wounded for our transgressions, he was bruised for our iniquities.\n— Isaiah 53:5",
      "6-8": "He is despised and rejected of men; a man of sorrows, and acquainted with grief.\n— Isaiah 53:3\n\nHe was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.\n— Isaiah 53:5\n\nAll we like sheep have gone astray; we have turned every one to his own way; and the LORD hath laid on him the iniquity of us all.\n— Isaiah 53:6",
      "9-12": "He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.\n— Isaiah 53:3\n\nSurely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of God, and afflicted. But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed.\n— Isaiah 53:4–5\n\nAll we like sheep have gone astray; we have turned every one to his own way; and the LORD hath laid on him the iniquity of us all.\n— Isaiah 53:6\n\nHe was taken from prison and from judgment: and who shall declare his generation? for he was cut off out of the land of the living: for the transgression of my people was he stricken.\n— Isaiah 53:8"
    },

    activities: {
      "3-5": "🐑 Make a cotton ball lamb — draw a lamb shape on paper and cover it with cotton balls glued on for fluffy wool. Write 'The Lamb of God' underneath. Talk about how Jesus is called God's Lamb because He took our punishment, just like the lambs in the temple.\n\n🎨 Draw two pictures side by side: (1) a sad face with dark clouds labelled 'OUR sin,' and (2) a bright cross with light coming out of it labelled 'HIS love.' Draw an arrow from the sin picture to the cross — Jesus took it all! Write Isaiah 53:5 at the bottom.",
      "6-8": "📖 Create an 'Isaiah 53 → The Gospels' matching chart. On a large sheet, write key phrases from Isaiah 53 on the left side and the matching Gospel fulfilment on the right. Draw lines connecting them. Include at least 6 pairs: despised/rejected → John 1:11, silent before accusers → Matthew 27:12, wounded for our sins → John 19:1, lamb to slaughter → John 1:29, buried with the rich → Matthew 27:57–60, numbered with transgressors → Mark 15:27. Illustrate with small drawings.\n\n✝️ Make a 'Prophesied & Fulfilled' folded card. On the outside write 'Written 700 Years Before' with Isaiah's name and a scroll drawing. Open the card — inside, write the key verse (Isaiah 53:5) on the left and the fulfilment at the cross on the right, with an illustration of the empty cross. This is a teaching card you could share with someone.",
      "9-12": "📖 Create a comprehensive illustrated 'Isaiah 53 Verse-by-Verse Study Map.' Write out the key verses of Isaiah 53 down the centre of a large sheet. On the left side, add the Old Testament context (what did this mean to Isaiah's original audience?). On the right side, add the New Testament fulfilment with specific Gospel references. Draw connecting arrows and illustrations. Include the Acts 8:32–35 story (the Ethiopian eunuch) as a case study in the corner showing how the early church understood this passage. Make it study-guide quality with colour coding: prophecy in one colour, fulfilment in another.\n\n✍️ Write a reflective essay titled 'The Cross Is Not Plan B.' Using Isaiah 53 and at least 3 New Testament cross-references, make the case that Jesus' death was not an accident or tragedy but God's planned rescue mission announced 700 years in advance. Address the question: why did salvation HAVE to come through suffering? Write at least 300 words with a clear introduction, argument, and conclusion."
    },

    supplies: "Paper, markers, crayons, cotton balls, glue, large sheets for chart/study map, coloured pencils, card stock (for folded card), journal paper",

    discussionQuestions: [
      "Isaiah 53 was written 700 years before Jesus. How does that change the way you see the cross — knowing it was planned that far in advance?",
      "Verse 6 says 'all we like sheep have gone astray.' What does it mean to 'go astray'? In what ways do we wander from God?",
      "The Servant doesn't defend Himself — He's 'silent before His accusers.' Why is Jesus' silence so powerful? What would YOU have said in His place?"
    ],

    reflection: "Today I learned that the cross was not an accident — it was God's rescue plan, announced hundreds of years before Jesus was born. Jesus was wounded for MY transgressions and bruised for MY iniquities. He took the punishment I deserved so that I could be healed and forgiven.",

    prayer: "Dear God, thank You for planning my rescue before I was even born. Thank You, Jesus, for being the Suffering Servant — for taking the wounds that should have been mine. Help me never to take the cross for granted. You were wounded for me, bruised for me, punished for me — and with Your stripes I am healed. I love You. Amen.",

    teacherNote: "Isaiah 53 is the theological backbone of the atonement. The Dead Sea Scroll of Isaiah (1QIsaᵃ), dated to approximately 125 BC, contains the full text of chapter 53, proving it predates Jesus by at least a century and a half. The chapter's theology of substitutionary atonement is unmistakable: the prepositions in 53:4–6 ('for our,' 'upon him,' 'on him') all indicate transfer of guilt. This is penal substitution — not moral example or political martyrdom. The Ethiopian eunuch episode in Acts 8 is the Bible's own interpretive guide: when asked 'Of whom does the prophet speak?', Philip answers by preaching Jesus. For the 9–12 group, the four Servant Songs (42:1–9, 49:1–7, 50:4–9, 52:13–53:12) progressively reveal the Messiah's identity and mission. Note that 53:10 says 'it pleased the LORD to bruise him' — not sadistic pleasure, but the Father's joy in the redemption the Son's sacrifice would accomplish. This is the most explicitly cross-centred lesson in the curriculum.",

    memoryVerse: "He was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed. — Isaiah 53:5",
  },

  // ── Week 29 ──────────────────────────────────
  {
    week: 29,
    title: "Jeremiah — The Weeping Prophet",
    bibleRef: "Jeremiah 1; 29:11",
    keyVerse: "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end. — Jeremiah 29:11",
    theme: "Hope in Hard Times",
    term: "Term 3",
    month: "Jul",
    icon: "😢",
    color: "#4338CA",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever tried to tell someone something important and they just wouldn't listen? How did that feel? Today we meet a prophet who spent his whole life telling people the truth — and almost nobody listened. But he never gave up.",

    story: {
      "3-5": "Jeremiah was a young man when God spoke to him and said, 'Before you were even born, I knew you! I chose you to be my prophet.' Jeremiah was scared. He said, 'But God, I'm too young! I don't know what to say!' God said, 'Don't be afraid. I am with you, and I will tell you what to say.' So Jeremiah became God's messenger. He told the people to stop doing wrong things and come back to God. But the people didn't want to listen. They got angry at Jeremiah. They put him in prison. They threw him into a muddy pit! Jeremiah cried and cried — that's why people call him 'the weeping prophet.' But even when things were really hard, God gave Jeremiah a beautiful promise: 'I have good plans for you — plans to give you hope and a future.' God never left Jeremiah, and He never leaves us either.",
      "6-8": "God called Jeremiah when he was very young — perhaps still a teenager. God's words were remarkable: 'Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations' (Jeremiah 1:5). Jeremiah protested — 'I am a child!' — but God touched his mouth and said, 'I have put my words in thy mouth' (1:9). Jeremiah's ministry lasted over 40 years, and it was the hardest prophetic calling in the Bible. God told him he would never marry (16:2), that his own family would betray him (12:6), and that the people would reject his message. And they did — violently. Jeremiah was mocked, beaten, put in stocks, thrown into prison, and lowered into a cistern full of mud where he sank and nearly died (38:6). He wept over Jerusalem's coming destruction even as the people laughed at his warnings. But in the middle of all that pain, God gave Jeremiah — and through him, all of us — one of the most precious promises in the Bible: 'For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end' (29:11). This wasn't a promise that life would be easy. It was a promise that even in exile, even in suffering, God had not forgotten His people. He had a future and a hope for them — and He has one for you too.",
      "9-12": "Jeremiah's calling in chapter 1 contains one of the most profound statements about divine sovereignty and human identity in Scripture: 'Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee' (1:5). God's knowledge of Jeremiah precedes Jeremiah's existence. This establishes a principle that runs through the Bible: God's purpose for your life is older than your life. Jeremiah's ministry (c. 627–586 BC) spanned the final decades before Jerusalem's destruction by Babylon. He was called to deliver an unpopular message: Babylon was coming, resistance was futile, and this was GOD'S judgement, not just political misfortune. The false prophets preached peace; Jeremiah preached repentance. He was hated for it. Jeremiah 20:7–18 contains some of the most raw lament in Scripture — the prophet accuses God of deceiving him, says he wishes he'd never been born, yet in the same breath declares that God's word is 'as a burning fire shut up in my bones' (20:9) that he cannot hold back. This tension — pain and faithfulness coexisting — is the heartbeat of Jeremiah's life. Jeremiah 29:11 is one of the most quoted verses in the Bible, but its context is often missed. It's not written to comfortable people seeking career guidance. It's written to EXILES — people ripped from their homes and carried to Babylon. God tells them to build houses, plant gardens, and pray for the city that enslaved them (29:5–7). THEN He says, 'I know the plans I have for you.' The promise of hope comes in the context of displacement and suffering. That makes it far more powerful than a motivational poster. God's good plans don't guarantee comfort — they guarantee purpose, even in exile. Jeremiah also prophesies the New Covenant (31:31–34) — the promise that God would write His law on human hearts rather than on tablets of stone. Jesus fulfils this at the Last Supper: 'This cup is the new testament in my blood' (Luke 22:20). Jeremiah, the weeping prophet, planted the seed for the greatest hope in human history."
    },

    scripture: {
      "3-5": "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end.\n— Jeremiah 29:11",
      "6-8": "Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.\n— Jeremiah 1:5\n\nFor I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end.\n— Jeremiah 29:11",
      "9-12": "Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations.\n— Jeremiah 1:5\n\nThen the LORD put forth his hand, and touched my mouth. And the LORD said unto me, Behold, I have put my words in thy mouth.\n— Jeremiah 1:9\n\nFor I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end. Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you.\n— Jeremiah 29:11–12\n\nBehold, the days come, saith the LORD, that I will make a new covenant with the house of Israel.\n— Jeremiah 31:31"
    },

    activities: {
      "3-5": "🎨 Draw two pictures: (1) Jeremiah looking sad with tears coming down his face and people turning away from him. (2) A big bright sun with Jeremiah smiling underneath it, with the words 'God has good plans for me!' Use dark colours for the sad picture and bright colours for the hopeful one.\n\n💌 Make a 'God's Promise' card — fold a piece of paper in half. On the outside draw a rainy day. On the inside draw a sunny day and write 'Jeremiah 29:11 — God has good plans for YOU!' Give it to someone who needs encouragement.",
      "6-8": "📖 Create a 'Life of Jeremiah' illustrated timeline. Draw at least 6 key moments: (1) God's call — 'Before I formed thee,' (2) Jeremiah preaches — people reject him, (3) Put in stocks, (4) Thrown in the muddy cistern, (5) Jerusalem falls — Jeremiah weeps, (6) The promise of Jeremiah 29:11 shines through it all. Use a mix of dark and bright colours to show the contrast between suffering and hope.\n\n✍️ Design a 'God's Promise Jar' — decorate a paper cup or small container. Write Jeremiah 29:11 on the outside. On small paper strips, write 5 promises from God found in the Bible. Fold them up and put them inside the jar. When you feel discouraged, pull one out and read it!",
      "9-12": "📖 Create an illustrated study page titled 'Jeremiah 29:11 in Context.' In the centre, write the famous verse. Around it, map the FULL context: who was it written to (exiles in Babylon), what was their situation (displaced, grieving, hopeless), what did God tell them to do first (29:5–7 — build, plant, pray for Babylon), and THEN the promise. Add a section showing how this verse is often misused (comfort for comfortable people) vs. what it really means (purpose in suffering). Include the New Covenant prophecy (31:31–34) as Jeremiah's greatest contribution. Make it a study resource that corrects the shallow reading.\n\n✍️ Write a diary entry from Jeremiah at the bottom of the muddy cistern (Jeremiah 38:6). He's sinking in the mud, abandoned by his people, rejected for telling the truth. What does he think about? Does he regret being God's prophet? How does he hold on to hope? Include his internal struggle between despair and the 'burning fire' he can't hold back (20:9). End with his rescue and what he feels as he's pulled out."
    },

    supplies: "Paper, markers, crayons, coloured pencils, card stock (for promise card), paper cups (for promise jar), small paper strips, large sheets for timeline/study page, journal paper, dark and bright coloured supplies for contrast",

    discussionQuestions: [
      "God told Jeremiah, 'Before I formed you, I knew you.' What does it mean that God knew you before you were born? How does that make you feel about your life's purpose?",
      "Jeremiah told the truth for over 40 years and almost nobody listened. Why didn't he just give up? What kept him going?",
      "Jeremiah 29:11 was written to people in EXILE — not people in comfort. How does knowing the context change the way you read that famous verse?"
    ],

    reflection: "Today I learned that God has good plans for me — not just when life is easy, but ESPECIALLY when life is hard. Jeremiah suffered more than almost any prophet, but he never stopped trusting God's promise. Even in my darkest moments, God knows the plans He has for me: plans for hope and a future.",

    prayer: "Dear God, thank You for knowing me before I was even born. Thank You for having good plans for me — plans for hope, not harm, even when life is really difficult. Help me to be faithful like Jeremiah — to keep speaking Your truth even when it's unpopular, and to trust Your promises even when I can't see how they'll come true. Your plans are bigger than my pain. Amen.",

    teacherNote: "Jeremiah is one of the most relatable figures in Scripture because he's the most emotionally transparent. His laments (sometimes called the 'Confessions of Jeremiah' — 11:18–23, 12:1–6, 15:10–21, 17:14–18, 18:18–23, 20:7–18) are raw, honest prayers that give children permission to be honest with God. The critical teaching point about 29:11 is CONTEXT. It's written to exiles, not to comfortable seekers. God tells them to settle into Babylon, serve its welfare, and wait 70 years. The promise of a 'future and a hope' comes wrapped in a call to patience, service, and trust in the dark. This makes the verse far more powerful — and far more useful — than a greeting card platitude. For the 9–12 group, Jeremiah's New Covenant prophecy (31:31–34) is his greatest theological contribution. The old covenant was external (stone tablets); the new covenant is internal (written on hearts). Jesus explicitly claims this at the Last Supper (Luke 22:20). Jeremiah, rejected in his lifetime, planted the seed for the gospel.",

    memoryVerse: "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end. — Jeremiah 29:11",
  },

  // ── Week 30 ──────────────────────────────────
  {
    week: 30,
    title: "Daniel in the Lions' Den",
    bibleRef: "Daniel 6",
    keyVerse: "My God hath sent his angel, and hath shut the lions' mouths. — Daniel 6:22",
    theme: "Courage & Prayer",
    term: "Term 3",
    month: "Jul",
    icon: "🦁",
    color: "#B45309",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If someone told you, 'Stop praying to God or you'll be thrown to the lions,' what would you do? Would you keep praying, or would you hide? Today we meet a man who chose to keep praying — no matter what.",

    story: {
      "3-5": "Daniel was a very old man who loved God with all his heart. He lived in a faraway land called Babylon, and he worked for the king — King Darius. Daniel was so good at his job that the king wanted to put him in charge of EVERYTHING. The other workers were jealous! They tried to find something wrong with Daniel, but they couldn't — he was honest and faithful. So they came up with a sneaky plan. They tricked the king into making a new law: 'For 30 days, nobody is allowed to pray to anyone except the king. If they do, they'll be thrown into a pit of hungry lions!' When Daniel heard about the law, did he stop praying? NO! He went to his room, opened his window toward Jerusalem, got on his knees, and prayed to God — just like he always did, three times a day. The jealous men caught him and told the king. King Darius was so sad, but he couldn't change his own law. Daniel was thrown into the lions' den. The king couldn't sleep all night! At sunrise he ran to the pit and cried, 'Daniel! Did your God save you?' And Daniel called back, 'My God sent His angel and shut the lions' mouths! They haven't hurt me at all!' The king was overjoyed! He pulled Daniel out and told the whole kingdom: 'Daniel's God is the living God!'",
      "6-8": "Daniel had been taken to Babylon as a young man and had served faithfully through the reigns of multiple kings. Now elderly, he served under Darius the Mede with such excellence that the king planned to set him over the whole kingdom. This provoked intense jealousy among the other officials. They searched for any fault in Daniel's conduct but found none — 'he was faithful, neither was there any error or fault found in him' (6:4). Unable to find corruption, they targeted the only thing they could: his faithfulness to God. They manipulated King Darius into signing an irrevocable decree: for 30 days, anyone who prayed to any god or man other than the king would be thrown into the den of lions. Daniel knew about the decree. He had a choice: compromise quietly for 30 days, or continue his practice of prayer. Daniel went to his upper room, opened his window toward Jerusalem, knelt down, and prayed three times a day — exactly as he had always done (6:10). He didn't hide. He didn't protest. He simply continued to pray. The officials caught him and reported him to the king. Darius was devastated — he loved Daniel — but the law of the Medes and Persians could not be changed. Daniel was thrown into the den, and a stone was sealed over the mouth. The king spent a sleepless night fasting. At dawn he rushed to the den and called out in anguish: 'O Daniel, servant of the living God, is thy God, whom thou servest continually, able to deliver thee from the lions?' Daniel's calm reply echoed from the pit: 'My God hath sent his angel, and hath shut the lions' mouths, that they have not hurt me' (6:22). Daniel was lifted out without a scratch. Darius issued a decree that all people should 'tremble and fear before the God of Daniel: for he is the living God' (6:26).",
      "9-12": "Daniel 6 is often taught as a children's story, but it's actually a sophisticated narrative about political conspiracy, legal manipulation, and the cost of uncompromising faithfulness. Daniel was approximately 80 years old at this point. He had served with integrity through the Babylonian Empire and into the Persian period — over 60 years in foreign government. His competence and character were so exceptional that King Darius planned to promote him over the entire kingdom (6:3). The conspirators knew they could not find fault in Daniel's work or character (6:4) — a remarkable testimony. So they engineered a law designed with one specific target. The 30-day prayer ban exploited the Persian legal principle that royal decrees were irrevocable (the same principle appears in Esther with Haman's decree). Daniel's response in verse 10 is one of the most deliberate acts of civil disobedience in the Bible. Three details matter: he prayed in his upper room (visible, not hidden), with windows open toward Jerusalem (maintaining his covenantal identity as an exile), and 'as he did aforetime' (this was not a protest — it was a continuation of lifelong practice). Daniel didn't start praying to make a point. He kept praying because stopping would have been a denial of everything he was. The lions' den functions as a death-and-resurrection narrative. Daniel descends into a sealed pit (like a tomb), is given up for dead, and emerges alive at dawn. The stone is rolled away, and the one who seemed condemned is vindicated. The parallels to Christ's burial and resurrection are unmistakable. Jesus Himself draws on Daniel's faithfulness when He quotes Daniel in His own teaching (Matthew 24:15). For the 9–12 group, it's worth noting that Daniel's faithfulness didn't prevent the trial — it sustained him through it. God didn't stop Daniel from entering the den; He met Daniel inside it. This is a critical distinction: faith is not a shield against difficulty but a presence within it."
    },

    scripture: {
      "3-5": "My God hath sent his angel, and hath shut the lions' mouths.\n— Daniel 6:22",
      "6-8": "Now when Daniel knew that the writing was signed, he went into his house; and his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed, and gave thanks before his God, as he did aforetime.\n— Daniel 6:10\n\nMy God hath sent his angel, and hath shut the lions' mouths, that they have not hurt me.\n— Daniel 6:22",
      "9-12": "Then the presidents and princes sought to find occasion against Daniel concerning the kingdom; but they could find none occasion nor fault; forasmuch as he was faithful, neither was there any error or fault found in him.\n— Daniel 6:4\n\nNow when Daniel knew that the writing was signed, he went into his house; and his windows being open in his chamber toward Jerusalem, he kneeled upon his knees three times a day, and prayed, and gave thanks before his God, as he did aforetime.\n— Daniel 6:10\n\nMy God hath sent his angel, and hath shut the lions' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.\n— Daniel 6:22\n\nHe is the living God, and stedfast for ever, and his kingdom that which shall not be destroyed, and his dominion shall be even unto the end.\n— Daniel 6:26"
    },

    activities: {
      "3-5": "🦁 Make a lion using a paper plate — colour it orange/yellow, add a mane from cut strips of brown/orange paper around the edge, draw a face, and add googly eyes or drawn eyes. Make the lion's mouth SHUT with a strip of tape or paper. Write 'God shut the lions' mouths!' on the tape.\n\n🎨 Draw Daniel in the lions' den — put Daniel in the middle looking peaceful and calm, with big lions all around him with their mouths closed. Add an angel with glowing wings protecting Daniel. Use dark colours for the den and bright colours for the angel!",
      "6-8": "📖 Make a 3D lions' den scene in a shoebox. Paint the inside dark brown/grey (a stone cave). Make Daniel from a clothespin or paper figure — posed kneeling in prayer. Add paper or clay lions around him with mouths shut. Place a 'stone' (painted ball of foil) at the entrance. Above the scene, hang a small paper angel from thread. Write Daniel 6:22 on the outside of the box.\n\n✍️ Create a 'Daniel's Prayer Life' poster. In the centre, draw Daniel at his window praying toward Jerusalem. Around him, write the three times he prayed daily (morning, noon, evening). At each time, write a Bible verse about prayer (e.g., Psalm 55:17, 1 Thessalonians 5:17, Philippians 4:6). Decorate with a border that includes lions, an angel, and a sunrise. Write 'Pray Without Ceasing' as the title.",
      "9-12": "📖 Create an illustrated 'Daniel 6 — Death and Resurrection Parallels' study poster. Draw two columns: DANIEL on the left, JESUS on the right. Map the parallels: falsely accused by jealous leaders, condemned under an irrevocable law, placed in a sealed pit/tomb, a stone placed over the entrance, emerged alive at dawn, accusers judged, and the king/world proclaims 'He is the living God.' Include verse references for each parallel from Daniel 6 and the Gospels. Add illustrations and make it visually compelling enough to display.\n\n✍️ Write a reflective essay or narrative titled 'The Night in the Den.' Imagine Daniel's experience from the moment the stone seals the entrance. What does he see, hear, and feel in the darkness? When does the angel appear? What do the lions do? What does Daniel pray about during the long night? End with dawn — the king's voice, the stone rolled away, and the light flooding in. Weave in the theological point: God didn't prevent the den; He was present in it."
    },

    supplies: "Paper plates, orange/yellow/brown paper strips, tape, markers, crayons, shoeboxes, paint, clothespins or paper figures, clay, aluminium foil, thread, large sheets for poster/study page, coloured pencils, journal paper",

    discussionQuestions: [
      "Daniel didn't start praying to be rebellious — he simply kept doing what he'd always done. Why is it important to build habits of prayer BEFORE the hard times come?",
      "Daniel's enemies couldn't find a single fault in his life — the only 'fault' was his faithfulness to God. What does it look like to live with that kind of integrity?",
      "God didn't stop Daniel from being thrown into the den — He met him INSIDE it. What's the difference between God preventing our trials and God being with us through them?"
    ],

    reflection: "Today I learned that faithfulness to God sometimes means facing lions — real or metaphorical. Daniel didn't hide his faith or compromise under pressure. He kept praying because prayer was who he was, not just something he did. And God didn't abandon him. He may not always keep me OUT of the den, but He will always be WITH me in it.",

    prayer: "Dear God, give me the courage of Daniel — to keep praying, keep trusting, and keep being faithful even when it costs me. Help me to build habits of prayer now so that when hard times come, I don't have to think about it — I just pray. Thank You that even in the lions' den, You are with me. You shut the lions' mouths, and You are the living God. Amen.",

    teacherNote: "Daniel 6 functions on multiple levels: as a story of personal courage, as political commentary on unjust law, and as a death-and-resurrection typology. The parallels between Daniel's den experience and Christ's tomb are striking and intentional in the narrative's structure: false accusation, sealed stone, emergence at dawn, vindication. For older students, Daniel's response to the decree is a model of principled civil disobedience — he doesn't protest, organise resistance, or make a speech. He simply continues to pray 'as he did aforetime' (6:10). This is the key: Daniel's faithfulness in crisis was built on decades of faithfulness in ordinary life. The phrase 'as he did aforetime' is the most important phrase in the chapter. Also note that Daniel was approximately 80 years old — this is not a story about youthful courage but about lifelong consistency. The theological distinction between God preventing trials vs. God being present in trials is crucial for children to grasp early. Faith doesn't guarantee exemption from the den; it guarantees companionship in it.",

    memoryVerse: "My God hath sent his angel, and hath shut the lions' mouths. — Daniel 6:22",
  },

  // ═══════════════════════════════════════════════════
  // ═══════════════════════════════════════════════════
  // AUGUST — Weeks 31–35
  // ═══════════════════════════════════════════════════

  // ── Week 31 ──────────────────────────────────
  {
    week: 31,
    title: "Shadrach, Meshach and Abednego",
    bibleRef: "Daniel 3",
    keyVerse: "Our God whom we serve is able to deliver us from the burning fiery furnace. — Daniel 3:17",
    theme: "Faith Under Pressure",
    term: "Term 3",
    month: "Aug",
    icon: "🔥",
    color: "#DC2626",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever been told to do something you KNEW was wrong, but everyone around you was doing it? What did you do? Today we meet three young men who refused to bow — even when the punishment was a furnace of fire.",

    story: {
      "3-5": "King Nebuchadnezzar built a HUGE golden statue — as tall as a building! He told everyone in the whole kingdom: 'When the music plays, you MUST bow down and worship my statue. If you don't, you'll be thrown into a fiery furnace!' The music played and EVERYONE bowed down — except three brave young men: Shadrach, Meshach, and Abednego. They loved God and they ONLY worshipped Him. The king was furious! 'Bow down or I'll throw you in the fire!' The three friends said, 'Our God CAN save us from the fire. But even if He doesn't, we still won't worship your statue!' The king made the furnace SEVEN times hotter and threw them in. But then something AMAZING happened — the king looked into the furnace and said, 'Didn't we throw THREE men in? I see FOUR! And the fourth one looks like the Son of God!' God was IN the fire with them! When they came out, their clothes didn't even smell like smoke!",
      "6-8": "King Nebuchadnezzar of Babylon set up an enormous golden image — ninety feet tall — on the plain of Dura. He commanded that when the music played, every person in the kingdom must bow down and worship the statue. The penalty for refusal was immediate execution in a blazing furnace. Everyone obeyed — except three Jewish exiles: Shadrach, Meshach, and Abednego. They had been taken from their homeland as teenagers and had risen to positions of authority in Babylon, but they drew an absolute line at idol worship. When they were reported to the king, Nebuchadnezzar gave them one more chance: 'Who is that God that shall deliver you out of my hands?' (3:15). Their answer is one of the greatest statements of faith in the Bible: 'Our God whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king. But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image' (3:17–18). 'But if not.' Those three words change everything. Their faith wasn't conditional on rescue. They trusted God's power AND His wisdom — even if His answer was no. The furious king heated the furnace seven times hotter and had them bound and thrown in. The fire was so intense it killed the soldiers who threw them in. But when the king peered into the flames, he saw four figures walking freely — and the fourth 'is like the Son of God' (3:25). They were pulled out without a single burn, and their clothes didn't even smell of smoke. Nebuchadnezzar issued a decree honouring their God: 'There is no other God that can deliver after this sort' (3:29).",
      "9-12": "Daniel 3 presents one of the sharpest tests of faith in Scripture: worship the state or face death. The context is imperial totalitarianism — Nebuchadnezzar's golden image was not merely religious; it was a political loyalty test. Bowing meant submitting to Babylon's authority as absolute. The three Hebrew exiles — whose Babylonian names (Shadrach, Meshach, Abednego) replaced their Hebrew ones (Hananiah, Mishael, Azariah) — had already compromised externally by accepting new names and government positions. But they drew an immovable line at the first commandment: 'Thou shalt have no other gods before me' (Exodus 20:3). Their response to Nebuchadnezzar in 3:16–18 is a masterclass in theological courage. It contains two critical elements. First: 'Our God whom we serve IS ABLE to deliver us.' They affirm God's power without hesitation. Second: 'BUT IF NOT... we will not serve thy gods.' This is the crucial phrase. Their obedience is not contingent on the outcome. They don't say, 'God will definitely save us.' They say, 'God can save us. But even if He chooses not to, our answer is the same.' This is faith at its highest — trusting God's character regardless of God's decision. The 'fourth man' in the furnace (3:25) is one of the most debated figures in the Old Testament. Nebuchadnezzar describes him as 'like the Son of God' (or 'a son of the gods' in his pagan understanding). Many scholars identify this as a Christophany — a pre-incarnation appearance of Christ. Whether or not we can be dogmatic about that identification, the theological point is clear: God doesn't just rescue FROM the fire; He is present IN the fire. This echoes Isaiah 43:2: 'When thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.' The detail that their clothes didn't smell of smoke (3:27) is not trivial — it means the fire had absolutely no power over them. The only thing the fire burned was their ropes (3:25) — the very things that bound them. The trial designed to destroy them actually set them free. This is a profound principle: sometimes God uses the furnace not to destroy us but to liberate us from what was binding us."
    },

    scripture: {
      "3-5": "Our God whom we serve is able to deliver us from the burning fiery furnace.\n— Daniel 3:17",
      "6-8": "Our God whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king. But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.\n— Daniel 3:17–18\n\nHe answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of God.\n— Daniel 3:25",
      "9-12": "If it be so, our God whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king. But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.\n— Daniel 3:17–18\n\nHe answered and said, Lo, I see four men loose, walking in the midst of the fire, and they have no hurt; and the form of the fourth is like the Son of God.\n— Daniel 3:25\n\nWhen thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.\n— Isaiah 43:2"
    },

    activities: {
      "3-5": "🔥 Make a 'Fiery Furnace' craft — use a brown paper bag as the furnace. Cut orange, red, and yellow tissue paper flames and glue them inside and around the top. Draw four stick figures inside (three friends + the fourth man glowing bright!). Write 'God was WITH them!' on the bag.\n\n🎨 Draw the king looking into the furnace with a shocked face. Inside the flames, draw four people walking around happily — not burning! Make the fourth figure glow with gold or white to show He is special. Write 'I see FOUR!' in a speech bubble for the king.",
      "6-8": "📖 Create a 'But If Not' courage poster. Draw the furnace in the centre with huge flames. Inside the furnace, draw the four figures walking freely. Above the furnace, write the full declaration from Daniel 3:17–18 in your best handwriting. Below the furnace, write: 'Real faith trusts God's character, not just God's rescue.' Decorate with a dramatic colour scheme — fiery reds and oranges contrasting with cool blues and golds for the figures inside.\n\n🔥 Build a 3D furnace scene from a small box. Paint the inside red/orange, add tissue paper flames, and place four small figures inside (three standing, one glowing — use foil or gold paper for the fourth). On the outside of the box write Daniel 3:25. Display it as a reminder of God's presence in the fire.",
      "9-12": "📖 Create a detailed illustrated study page titled 'The Fire Only Burned Their Ropes.' In the centre, draw the furnace scene with the four figures. Around it, add annotated study boxes: (1) The political context — what the statue represented, (2) 'But if not' — why these three words are the most important in the chapter, (3) The fourth man — Christophany and Isaiah 43:2 connection, (4) The fire burned only the ropes — how trials can liberate rather than destroy. Include verse references throughout. At the bottom, write the application: 'What ropes is God burning off in YOUR life right now?' Make it study-guide quality with colour coding.\n\n✍️ Write a three-part creative piece: Part 1 — A diary entry from one of the three friends the night before the music plays (they know what's coming — what do they discuss and decide?). Part 2 — The moment inside the furnace (what do they see, feel, and experience when the fourth figure appears?). Part 3 — A reflection written years later about what they learned. Weave in the key theological point: faith is not about guaranteed rescue; it's about trust regardless of outcome."
    },

    supplies: "Brown paper bags, tissue paper (red/orange/yellow), markers, crayons, glue, small boxes, paint, small figures or clothespins, aluminium foil, gold paper, coloured pencils, large sheets for poster/study page, journal paper",

    discussionQuestions: [
      "'But if not.' These three words are the most powerful part of the story. Why is it so important that their faith didn't depend on being rescued?",
      "The only thing the fire burned was the ropes that bound them. Have you ever gone through a hard time that actually set you free from something?",
      "The fourth man in the fire — who do you think he was? What does it mean that God doesn't just rescue us FROM the fire but joins us IN it?"
    ],

    reflection: "Today I learned that real faith says, 'God CAN save me — but even if He doesn't, I will still trust Him.' Shadrach, Meshach, and Abednego didn't know the ending of their story when they made their stand. They chose faithfulness before they saw the rescue. That's what true courage looks like.",

    prayer: "Dear God, give me 'but if not' faith — the kind that trusts You whether or not You rescue me the way I hope. Help me to stand when everyone else bows, to trust Your character when I can't see Your plan, and to know that even in the fire, You are with me. You are able. And even if not — You are still God. Amen.",

    teacherNote: "Daniel 3 is about more than courage — it's about the nature of faith itself. The 'but if not' clause (3:18) is the theological heart of the chapter. The three men affirm both God's ability (He CAN deliver) and God's sovereignty (He may CHOOSE not to). Their obedience is not transactional — they're not obeying because they expect rescue. This is the highest form of faith: trust without conditions. For the 9–12 group, the detail that the fire only burned their ropes (3:25) is worth extended discussion. The furnace, designed to destroy, actually liberated. This is a pattern throughout Scripture: what the enemy means for evil, God uses for good (Genesis 50:20). The 'fourth man' is best understood as a Christophany — a pre-incarnation appearance of Christ. This connects to Isaiah 43:2 and to God's presence with His people in every 'furnace' of life. The political dimension is also important: the statue was a loyalty test, making this a story about the limits of state authority over conscience — a theme with enduring relevance.",

    memoryVerse: "Our God whom we serve is able to deliver us from the burning fiery furnace. — Daniel 3:17",
  },

  // ── Week 32 ──────────────────────────────────
  {
    week: 32,
    title: "Jonah — Running from God",
    bibleRef: "Jonah 1–4",
    keyVerse: "Salvation is of the LORD. — Jonah 2:9",
    theme: "Repentance & God's Mercy",
    term: "Term 3",
    month: "Aug",
    icon: "🐋",
    color: "#0369A1",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever been asked to do something and you REALLY didn't want to do it — so much that you tried to run away or hide? What happened? Today we meet a prophet who tried to run from GOD. Spoiler: it didn't work!",

    story: {
      "3-5": "God told Jonah, 'Go to the big city of Nineveh and tell the people to stop being wicked!' But Jonah didn't WANT to go. He didn't like those people! So Jonah ran the OTHER way. He got on a boat going as far from Nineveh as possible. But you can't run from God! God sent a HUGE storm. The boat was tossing and rocking. The sailors were terrified! Jonah said, 'It's my fault — throw me in the sea!' They did, and the storm stopped. But God wasn't finished with Jonah. He sent a GIGANTIC fish that swallowed Jonah whole! Jonah was inside that fish for THREE days and THREE nights! Inside the dark, stinky fish, Jonah prayed: 'I'm sorry, God! Salvation is of the LORD!' And God told the fish to spit Jonah out — BLEH! — right onto the beach. This time, Jonah obeyed. He went to Nineveh, told them God's message, and guess what? The WHOLE city repented! God forgave them. But Jonah was grumpy about it — he wanted God to punish them, not forgive them! God had to teach Jonah that His love and mercy are for EVERYONE.",
      "6-8": "God called Jonah to preach to Nineveh — the capital of Assyria, Israel's worst enemy. The Assyrians were brutal and cruel, and Jonah wanted nothing to do with them. So he boarded a ship sailing in the opposite direction, to Tarshish (the farthest known point west). But fleeing from God is futile. God sent a violent storm that threatened to break the ship apart. While the pagan sailors desperately prayed to their gods, Jonah was asleep below deck — running from God had made him spiritually numb. When the lot fell on Jonah, he confessed: 'I am a Hebrew; and I fear the LORD, the God of heaven, which hath made the sea and the dry land' (1:9). He told them to throw him overboard. They reluctantly did, and the sea became calm. God appointed a great fish to swallow Jonah, and he spent three days and three nights in its belly. From that dark prison, Jonah prayed one of the most desperate and beautiful prayers in Scripture, ending with the declaration: 'Salvation is of the LORD' (2:9). God commanded the fish to vomit Jonah onto dry land. This time, Jonah obeyed. He walked through Nineveh preaching judgement, and to his astonishment, the entire city — from the king to the cattle — repented in sackcloth and ashes. God relented from the disaster. But here's the twist: Jonah was ANGRY that God showed mercy. He sat outside the city sulking, wanting to watch it burn. God grew a plant to shade Jonah, then sent a worm to kill it. When Jonah mourned the plant, God made His point: 'Thou hast had pity on the gourd… and should not I spare Nineveh, that great city?' (4:10–11). The book ends with God's question hanging in the air — unanswered. The real problem in the story isn't the storm or the fish. It's the prophet's heart.",
      "9-12": "Jonah is one of the most misunderstood books in the Bible. It's not primarily about a fish — it's about the scandalous breadth of God's mercy and the ugliness of religious self-righteousness. Jonah is a prophet who would rather die than see his enemies forgiven. His flight to Tarshish (1:3) is not mere disobedience — it's theological rebellion. Jonah later confesses his motivation: 'I knew that thou art a gracious God, and merciful, slow to anger, and of great kindness, and repentest thee of the evil' (4:2). He ran precisely BECAUSE he knew God would forgive Nineveh if they repented. He didn't want that. The Assyrians had been Israel's tormentors — they were known for skinning captives alive and impaling them on stakes. Jonah wanted justice, not mercy. The storm sequence reveals layers of irony. The pagan sailors are more spiritually responsive than the prophet of God — they pray, they fear, they sacrifice. Jonah sleeps. The lots fall on Jonah, and even his confession is tinged with contradiction: he claims to 'fear the LORD' while actively running from Him. The three days in the fish's belly is the detail Jesus Himself highlights as a type of His own death and resurrection: 'For as Jonas was three days and three nights in the whale's belly; so shall the Son of man be three days and three nights in the heart of the earth' (Matthew 12:40). Jonah descends into the sea (death), is entombed in the fish (burial), and is expelled onto dry land (resurrection). The Nineveh repentance (chapter 3) is the greatest revival in the Old Testament — an entire pagan city turns to God. But chapter 4 is the real climax. Jonah's anger at God's mercy exposes the core sin of religious pride: believing that grace is only for people like us. God's final object lesson — the plant, the worm, the scorching wind — strips away Jonah's selfishness. God's closing question (4:11) is addressed not just to Jonah but to every reader who has ever resented God's mercy toward someone they considered undeserving. The book has no resolution. Jonah never answers. The question is left for us."
    },

    scripture: {
      "3-5": "Salvation is of the LORD.\n— Jonah 2:9",
      "6-8": "And he said unto them, I am an Hebrew; and I fear the LORD, the God of heaven, which hath made the sea and the dry land.\n— Jonah 1:9\n\nSalvation is of the LORD.\n— Jonah 2:9\n\nAnd should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons?\n— Jonah 4:11",
      "9-12": "But Jonah rose up to flee unto Tarshish from the presence of the LORD.\n— Jonah 1:3\n\nI cried by reason of mine affliction unto the LORD, and he heard me; out of the belly of hell cried I, and thou heardest my voice.\n— Jonah 2:2\n\nSalvation is of the LORD.\n— Jonah 2:9\n\nI knew that thou art a gracious God, and merciful, slow to anger, and of great kindness, and repentest thee of the evil.\n— Jonah 4:2\n\nFor as Jonas was three days and three nights in the whale's belly; so shall the Son of man be three days and three nights in the heart of the earth.\n— Matthew 12:40"
    },

    activities: {
      "3-5": "🐋 Make a big whale from a paper plate — fold the plate in half, paint it blue/grey, add a tail from card, an eye, and a big mouth that opens. Cut out a small Jonah figure on card and place him inside the whale's mouth! Practice opening and closing the mouth to 'swallow' and 'spit out' Jonah.\n\n🎨 Draw three scenes in a row: (1) Jonah running to a boat — looking worried, (2) Jonah inside the big fish — praying, (3) Jonah walking to the big city — obeying! Write 'Salvation is of the LORD!' under the pictures.",
      "6-8": "📖 Create a 'Jonah Map Journey' poster. Draw a simple map showing: Joppa (where Jonah boarded), the arrow pointing to Tarshish (wrong direction!), the storm in the sea, the big fish, the beach where Jonah was spat out, and Nineveh (the right destination). At each location, write a key verse and a one-sentence summary. Add a compass rose and colour the sea with waves and the fish.\n\n🐋 Build a Jonah-in-the-fish craft. Make a large fish shape from two paper plates stapled together (leaving the mouth open). Paint it blue/grey. Create a small Jonah figure from card that can slide in and out of the fish's mouth. On the fish's body, write Jonah 2:9. Practice 'swallowing' and 'spitting out' Jonah as you retell the story.",
      "9-12": "📖 Create an illustrated 'Jonah: The Real Problem Isn't the Fish' study page. Divide a large sheet into four quadrants, one for each chapter. Chapter 1: draw the fleeing prophet and the storm — annotate the irony (pagan sailors are more responsive than God's prophet). Chapter 2: draw the fish and Jonah's prayer — annotate the death/burial/resurrection typology and Matthew 12:40. Chapter 3: draw Nineveh's repentance — annotate it as the greatest revival in the OT. Chapter 4: draw Jonah sulking under the dead plant — annotate God's unanswered question (4:11). In the centre, write the thesis: 'Jonah's real problem wasn't the whale — it was his heart.' Make it study-guide quality.\n\n✍️ Write two contrasting diary entries. Entry 1: Jonah on the night before the fish spits him out — what has he learned in the dark? What does his prayer (chapter 2) reveal about his heart? Entry 2: Jonah sitting outside Nineveh in chapter 4, furious that God forgave the city. What is he really angry about? Let the reader see the contrast between Jonah who prayed for mercy in the fish and Jonah who resents mercy for others. End with God's question and Jonah's silence."
    },

    supplies: "Paper plates, blue/grey paint, card stock, stapler, markers, crayons, scissors, glue, large sheets for map/study page, coloured pencils, journal paper",

    discussionQuestions: [
      "Jonah didn't run because he was afraid — he ran because he KNEW God would forgive Nineveh and he didn't want that. Have you ever been upset that someone you didn't like received grace?",
      "Inside the fish, Jonah cried out for God's mercy. But when God showed mercy to Nineveh, Jonah was furious. What does this teach us about how we sometimes want grace for ourselves but not for others?",
      "The book of Jonah ends with God's unanswered question. Why do you think God leaves it open? What would YOUR answer be?"
    ],

    reflection: "Today I learned that God's mercy is bigger than my sense of fairness. Jonah wanted God to love him but punish his enemies. But 'salvation is of the LORD' — and the LORD gets to decide who receives it. I need to be careful that my heart doesn't become like Jonah's, resenting grace for people I think don't deserve it.",

    prayer: "Dear God, thank You that Your mercy is bigger than I can imagine — big enough for me AND for people I might not think deserve it. Forgive me for the times I've been like Jonah — happy to receive Your grace but unwilling to share it. Help me to have a heart as wide as Yours. Salvation is of the LORD. Amen.",

    teacherNote: "Jonah subverts expectations at every turn. The prophet is the villain; the pagans are the heroes. The sailors fear God before Jonah does; Nineveh repents faster than Israel ever did. This is deliberate satire aimed at Israel's exclusivism. The fish is the least important part of the story — it's a vehicle (literally) to get Jonah where he needs to be. The theological centre is chapter 4: Jonah's anger at God's mercy reveals the sin of religious entitlement. His quotation of Exodus 34:6 ('gracious, merciful, slow to anger') in 4:2 — one of the most beautiful descriptions of God in the OT — is spoken in COMPLAINT, not praise. Jesus' use of the Jonah sign (Matthew 12:40) makes the three days in the fish a type of the tomb. For the 9–12 group, the unanswered question of 4:11 is a brilliant literary and theological device — it forces every reader to answer for themselves. The book asks: is God allowed to be merciful to people you hate?",

    memoryVerse: "Salvation is of the LORD. — Jonah 2:9",
  },

  // ── Week 33 ──────────────────────────────────
  {
    week: 33,
    title: "Esther — For Such a Time as This",
    bibleRef: "Esther 4–5",
    keyVerse: "Who knoweth whether thou art come to the kingdom for such a time as this? — Esther 4:14",
    theme: "Courage & Providence",
    term: "Term 3",
    month: "Aug",
    icon: "👸",
    color: "#9333EA",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever been in exactly the right place at exactly the right time to help someone? Maybe it felt like a coincidence — but was it? Today we meet a queen whose whole life led to ONE brave moment that saved her entire nation.",

    story: {
      "3-5": "Esther was a beautiful Jewish girl who lived in a faraway land called Persia. She had no mummy or daddy — her cousin Mordecai looked after her. One day, the king chose Esther to be his queen! But nobody knew Esther was Jewish. A mean man called Haman hated the Jewish people and tricked the king into making a law to hurt them all. Mordecai told Esther, 'You have to go to the king and ask him to save our people!' Esther was scared. Nobody was allowed to go to the king without being invited — not even the queen! If she went and the king was angry, she could die! But Mordecai said something very special: 'Maybe God made you queen for exactly this moment.' Esther was very brave. She said, 'I will go to the king. And if I die, I die.' She put on her royal robes, walked into the throne room, and the king held out his golden scepter — that meant she was welcome! Esther invited the king to a special dinner, and there she told him about Haman's wicked plan. The king was furious at Haman, and the Jewish people were SAVED! Esther's courage saved her whole nation!",
      "6-8": "The book of Esther reads like a thriller. Set in the Persian Empire, it tells the story of a young Jewish orphan named Hadassah (Esther is her Persian name) who becomes queen — not knowing that God was positioning her for the most important moment of her life. The villain is Haman, a powerful official who despises the Jews because Mordecai (Esther's cousin) refuses to bow to him. Haman convinces King Ahasuerus to issue a decree to destroy all Jews throughout the empire. When Mordecai learns of the plot, he sends an urgent message to Esther: 'Think not with thyself that thou shalt escape in the king's house, more than all the Jews. For if thou altogether holdest thy peace at this time, then shall there enlargement and deliverance arise to the Jews from another place; but thou and thy father's house shall be destroyed: and who knoweth whether thou art come to the kingdom for such a time as this?' (4:13–14). These words reveal Mordecai's deep faith: he's confident God WILL deliver — the question is whether Esther will be part of it. Esther asks all the Jews to fast for three days, then makes her famous declaration: 'I will go in unto the king, which is not according to the law: and if I perish, I perish' (4:16). Through a series of perfectly timed events — the king's sleepless night, the reading of old records, Haman's humiliation — the plot unravels. Esther reveals her identity and Haman's treachery at a banquet. Haman is executed on the very gallows he built for Mordecai. The Jews are saved. Remarkably, God's name is never mentioned in the entire book of Esther — yet His fingerprints are on every page. This is the Bible's greatest illustration of providence: God working behind the scenes through ordinary events to accomplish extraordinary salvation.",
      "9-12": "Esther is unique in the biblical canon — it's the only book that never mentions God by name. Yet it may be the most powerful demonstration of God's providence in all of Scripture. Every event in the story — Vashti's removal, Esther's selection, Mordecai overhearing an assassination plot, the king's insomnia — appears natural on the surface but is orchestrated with divine precision. The book asks the reader to see God's hand precisely where it seems most hidden. Mordecai's challenge to Esther in 4:13–14 is one of the most theologically loaded statements in the Old Testament. Two principles emerge: first, God's purposes will be accomplished regardless — 'deliverance shall arise from another place.' God doesn't NEED Esther; He invites her to participate. Second, divine positioning carries responsibility — 'who knoweth whether thou art come to the kingdom for such a time as this?' Every person is placed by providence. The question is whether we'll recognise our moment. Esther's response — 'if I perish, I perish' (4:16) — echoes the same unconditional faith we saw in Shadrach, Meshach, and Abednego. She acts without a guaranteed outcome. Her request for fasting (4:16) is the closest the book comes to explicit prayer — Esther seeks divine help without the narrative ever naming the divine Helper. The reversal structure of Esther is remarkable: Haman is hanged on his own gallows (7:10), the day appointed for Jewish destruction becomes a day of Jewish triumph (9:1), and the one who refused to bow (Mordecai) is paraded in royal honour through the streets (6:11). This reversal pattern echoes throughout Scripture: God lifts the humble and brings down the proud (cf. Hannah's song, Mary's Magnificat, the Beatitudes). For the 9–12 group, Esther also raises important questions about hidden faith and compromise. Esther concealed her Jewish identity for years (2:10). Was that wise caution or cowardly silence? The book doesn't condemn her but shows that a moment comes when silence is no longer an option. There are times when faith must go public, regardless of the cost."
    },

    scripture: {
      "3-5": "Who knoweth whether thou art come to the kingdom for such a time as this?\n— Esther 4:14",
      "6-8": "For if thou altogether holdest thy peace at this time, then shall there enlargement and deliverance arise to the Jews from another place; but thou and thy father's house shall be destroyed: and who knoweth whether thou art come to the kingdom for such a time as this?\n— Esther 4:14\n\nI will go in unto the king, which is not according to the law: and if I perish, I perish.\n— Esther 4:16",
      "9-12": "Think not with thyself that thou shalt escape in the king's house, more than all the Jews. For if thou altogether holdest thy peace at this time, then shall there enlargement and deliverance arise to the Jews from another place; but thou and thy father's house shall be destroyed: and who knoweth whether thou art come to the kingdom for such a time as this?\n— Esther 4:13–14\n\nGo, gather together all the Jews that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish.\n— Esther 4:16"
    },

    activities: {
      "3-5": "👸 Make a Queen Esther crown from card stock. Decorate it with gems (coloured stickers, glitter, or drawn jewels). On the inside of the crown, write: 'For such a time as this!' Wear the crown and practice walking bravely like Esther walked to the king.\n\n🎨 Draw Esther in her beautiful royal robes walking into the throne room. Make the king on his throne looking surprised, holding out his golden scepter. Draw a big heart around Esther and write 'BRAVE!' above her head.",
      "6-8": "📖 Create a 'God's Hidden Hand' storyboard of Esther with at least 6 panels. In each panel, draw the event AND write underneath it what was REALLY happening behind the scenes (God's providence). For example: Panel 1 — Esther becomes queen ('God was positioning a rescuer'). Panel 4 — The king can't sleep, reads old records ('God reminds the king of Mordecai's loyalty'). Show how every 'coincidence' was actually God at work.\n\n👑 Make a 'Golden Scepter' from a cardboard tube wrapped in gold foil or painted gold. Attach a star or jewel shape at the top. Use it to retell the story — when the scepter extends, Esther is welcomed. Write Esther 4:14 on a tag and tie it to the scepter.",
      "9-12": "📖 Create a detailed 'Reversals in Esther' illustrated chart. Map every reversal in the book: Haman plans destruction → Jews are saved, Haman builds gallows for Mordecai → Haman is hanged on them, Haman demands honour → Mordecai receives it, the day of Jewish death → the day of Jewish victory. For each reversal, draw a before/after illustration and write the chapter and verse reference. Add a section connecting this reversal pattern to other biblical reversals (Hannah's song, the Magnificat, the Beatitudes). Title it: 'God Turns It Around.' Make it poster-sized.\n\n✍️ Write a reflective essay titled 'The Book That Never Mentions God.' Explore how the book of Esther demonstrates God's providence without ever naming Him. Discuss at least three events that seem like coincidences but form a pattern too precise to be accidental. Address the question: is God's silence the same as God's absence? Draw connections to times in our own lives when God seems hidden but is actually at work. Write at least 300 words with a clear thesis and conclusion."
    },

    supplies: "Card stock, stickers/glitter/drawn jewels (for crown), markers, crayons, cardboard tubes, gold foil or paint, star shapes, string (for tag), large sheets for storyboard/chart, coloured pencils, journal paper",

    discussionQuestions: [
      "God's name is never mentioned in the book of Esther — yet His fingerprints are everywhere. Can you spot the 'coincidences' that were really God at work?",
      "Mordecai said that if Esther stayed silent, deliverance would come 'from another place.' What does that tell us about God's plans — does He NEED us, or does He INVITE us?",
      "Esther hid her Jewish identity for years, then finally spoke up when it mattered most. Is there a time when being silent about your faith stops being wisdom and starts being compromise?"
    ],

    reflection: "Today I learned that even when I can't see God, He is working. Every 'coincidence' in Esther's story was actually God positioning people for His purposes. Maybe He's doing the same in my life right now. The question isn't whether God has a plan — it's whether I'll be brave enough to play my part.",

    prayer: "Dear God, even when I can't see You working, I trust that You are. Help me to recognise my 'for such a time as this' moments — the times You've placed me somewhere for a reason. Give me Esther's courage to speak up, step out, and trust You with the outcome. If I perish, I perish — but I will trust You. Amen.",

    teacherNote: "Esther is the Bible's masterclass on providence — God's sovereign governance of events without visible miraculous intervention. The absence of God's name is a literary device that forces the reader to see God in the pattern of events rather than in spectacular signs. For children, this teaches an essential spiritual skill: recognising God's work in 'ordinary' circumstances. Mordecai's theology in 4:13–14 is carefully balanced: he's certain of deliverance ('from another place') but uncertain of Esther's role ('who knoweth?'). This combination of confidence in God's sovereignty and humility about human participation is a model for faith. For the 9–12 group, the question about hidden faith vs. public courage is worth serious discussion. Esther's concealment of her identity (2:10) was initially protective, but the crisis forced her hand. There are seasons for wisdom and seasons for boldness — the book suggests that the cost of permanent silence is higher than the risk of speaking up. The reversal structure (Haman on his own gallows) echoes Proverbs 26:27: 'Whoso diggeth a pit shall fall therein.'",

    memoryVerse: "Who knoweth whether thou art come to the kingdom for such a time as this? — Esther 4:14",
  },

  // ── Week 34 ──────────────────────────────────
  {
    week: 34,
    title: "Nehemiah Rebuilds the Wall",
    bibleRef: "Nehemiah 1–2; 4",
    keyVerse: "The God of heaven, he will prosper us; therefore we his servants will arise and build. — Nehemiah 2:20",
    theme: "Prayer & Action",
    term: "Term 3",
    month: "Aug",
    icon: "🧱",
    color: "#92400E",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever seen something broken and thought, 'Somebody should fix that'? What if YOU were the somebody? Today we meet a man who saw something broken, cried about it, prayed about it, and then got up and DID something about it.",

    story: {
      "3-5": "Nehemiah worked for the king of Persia — he was the king's special cup-bearer. One day, some visitors came from far away and told Nehemiah terrible news: 'The walls of Jerusalem are broken down! The gates are burned!' Nehemiah sat down and CRIED. Jerusalem was God's special city, and it was in ruins! But Nehemiah didn't just cry — he PRAYED. 'God, please help me fix the walls!' Then Nehemiah asked the king for permission to go and rebuild. The king said YES and gave him supplies! When Nehemiah got to Jerusalem, he gathered all the people and said, 'Come on — let's BUILD!' Everyone worked together. Some bad people tried to stop them, but Nehemiah said, 'Don't be afraid! Remember the LORD — He is great and mighty!' They kept building with a tool in one hand and a sword in the other! And in just 52 DAYS, the wall was finished! God answered Nehemiah's prayers because he prayed AND worked!",
      "6-8": "Nehemiah was a Jew living in Persia, serving as cupbearer to King Artaxerxes — a trusted position close to the king. When he heard that Jerusalem's walls were still in ruins decades after the exile, he wept, fasted, and prayed for days (1:4). His prayer in chapter 1 is a model of how to approach God: he starts with worship, confesses sin (including his own), claims God's promises, and then makes a specific request. Nehemiah didn't just pray — he planned. When the king noticed his sadness and asked what was wrong, Nehemiah sent up a quick silent prayer ('so I prayed to the God of heaven' — 2:4) and then made a bold request: permission, letters of safe passage, and building materials. The king granted everything. In Jerusalem, Nehemiah secretly surveyed the ruined walls at night (2:12–16), then rallied the people with his famous declaration: 'The God of heaven, he will prosper us; therefore we his servants will arise and build' (2:20). The work was immediately opposed. Sanballat, Tobiah, and Geshem mocked, threatened, and plotted against them. But Nehemiah's response was both spiritual and practical: 'We made our prayer unto our God, and set a watch' (4:9). They prayed AND posted guards. Workers held a tool in one hand and a weapon in the other (4:17). Against all odds, the wall was completed in just 52 days (6:15). When the enemies heard, 'they were much cast down in their own eyes: for they perceived that this work was wrought of our God' (6:16). Nehemiah shows us that faith isn't passive — it prays with one hand and builds with the other.",
      "9-12": "Nehemiah is the Bible's case study in godly leadership — combining passionate prayer with strategic action. Set around 445 BC, it takes place roughly 90 years after the first exiles returned to Jerusalem under Zerubbabel. The temple had been rebuilt (Ezra 1–6), but the city walls were still in ruins, leaving the people vulnerable and demoralised. Walls in the ancient world weren't just military — they represented civic identity, security, and dignity. Nehemiah's prayer in chapter 1 follows a deliberate structure: adoration (1:5), confession (1:6–7), appeal to God's promises (1:8–9), and specific petition (1:11). This is not a crisis prayer — it's a sustained, theologically informed intercession lasting days. Notice that he confesses corporate sin ('we have sinned') including his own family. Nehemiah is not pointing fingers; he's identifying with the problem. His approach to the king (chapter 2) reveals a man who has already done his homework. He doesn't just say 'help' — he has a specific plan, a timeline, and a list of materials. The silent prayer of 2:4 ('so I prayed to the God of heaven') shows a life of prayer so habitual that he can access it mid-conversation with a king. The opposition from Sanballat, Tobiah, and Geshem escalated through mockery (2:19), ridicule (4:1–3), threats of violence (4:8), deception (6:1–4), and intimidation (6:5–9). Nehemiah's response at each stage combined prayer and practical action. His famous 4:9 — 'We made our prayer unto our God, and set a watch' — is the definitive statement on the relationship between faith and works. Prayer without action is presumption; action without prayer is self-reliance. Nehemiah did both simultaneously. The 52-day completion (6:15) astonished everyone — including the enemies — and served as visible proof that God was behind the project. For the 9–12 group, Nehemiah's leadership principles are remarkably relevant: he assessed the situation personally (2:12–16), he shared the vision clearly (2:17–18), he assigned work strategically (chapter 3), he adapted to opposition, and he refused to be distracted from the mission (6:3 — 'I am doing a great work, so that I cannot come down'). This final line is perhaps the most quotable leadership principle in the Bible."
    },

    scripture: {
      "3-5": "The God of heaven, he will prosper us; therefore we his servants will arise and build.\n— Nehemiah 2:20",
      "6-8": "We made our prayer unto our God, and set a watch against them day and night.\n— Nehemiah 4:9\n\nThe God of heaven, he will prosper us; therefore we his servants will arise and build.\n— Nehemiah 2:20",
      "9-12": "O Lord, I beseech thee, let now thine ear be attentive to the prayer of thy servant, and to the prayer of thy servants, who desire to fear thy name: and prosper, I pray thee, thy servant this day, and grant him mercy in the sight of this man.\n— Nehemiah 1:11\n\nThe God of heaven, he will prosper us; therefore we his servants will arise and build.\n— Nehemiah 2:20\n\nWe made our prayer unto our God, and set a watch against them day and night.\n— Nehemiah 4:9\n\nI am doing a great work, so that I cannot come down: why should the work cease, whilst I leave it, and come down to you?\n— Nehemiah 6:3"
    },

    activities: {
      "3-5": "🧱 Build a wall! Use blocks, Legos, sugar cubes, or small boxes to build a wall together. As you build, talk about how the people of Jerusalem all worked together. When it's finished, cheer and say, 'The God of heaven helped us build!'\n\n🎨 Draw Nehemiah and his team building the big wall — some people laying bricks, some carrying supplies, some holding swords to protect the builders. Draw the wall going all the way across the page. Write 'Arise and Build!' at the top in big letters.",
      "6-8": "📖 Create a 'Nehemiah's Leadership Plan' poster. Divide the page into 5 sections: (1) SEE THE PROBLEM — draw the broken walls. (2) PRAY — draw Nehemiah on his knees. (3) PLAN — draw his list of materials and request to the king. (4) RALLY THE TEAM — draw people working together. (5) COMPLETE THE MISSION — draw the finished wall with '52 Days!' Write the key verse at each stage.\n\n🧱 Build a mini-wall from clay, cardboard blocks, or sugar cubes on a paper base. Around the base, add small paper figures — some building, some standing guard with 'swords' (toothpicks). Add a tiny banner on the wall that reads 'Nehemiah 2:20.' Display it as a reminder that prayer + action = results.",
      "9-12": "📖 Create an illustrated 'Nehemiah's Leadership Principles' infographic. Draw Nehemiah in the centre and surround him with annotated leadership principles drawn from the text: (1) He wept — leaders feel the problem (1:4), (2) He prayed — leaders seek God first (1:5–11), (3) He planned — leaders prepare before they act (2:4–8), (4) He assessed — leaders survey before they speak (2:12–16), (5) He rallied — leaders cast vision (2:17–18), (6) He adapted — leaders respond to opposition (4:9, 16–17), (7) He refused distraction — 'I am doing a great work' (6:3). For each principle, include the verse and a small illustration. Make it poster-sized and applicable beyond Bible study — these are real-world leadership principles.\n\n✍️ Write a modern-day retelling of Nehemiah's story set in your own community. Something is broken (a park, a community centre, a relationship, a ministry). A person sees the problem, prays about it, makes a plan, faces opposition, and completes the work. Keep the same structure and principles as Nehemiah but set it in a context your age group would relate to. Include dialogue and at least one scene where the character has to choose between giving up and pressing on."
    },

    supplies: "Building blocks/Legos/sugar cubes/small boxes, paper, markers, crayons, clay or cardboard, toothpicks, small paper figures, large sheets for poster/infographic, coloured pencils, journal paper, paper base for mini-wall",

    discussionQuestions: [
      "Nehemiah didn't just pray — he also planned, worked, and fought. What does his example teach us about the balance between trusting God and taking action?",
      "Nehemiah was a cupbearer, not a builder. God didn't call an expert — He called someone who cared. What does that tell us about who God uses?",
      "When enemies tried to trick Nehemiah into leaving the wall, he said, 'I am doing a great work, so that I cannot come down.' What distractions try to pull YOU away from what God has called you to do?"
    ],

    reflection: "Today I learned that prayer and action go together. Nehemiah cried, prayed, planned, and then got up and BUILT. He didn't wait for someone else to fix the problem — he became the answer to his own prayer. When I see something broken, maybe God is asking ME to help fix it.",

    prayer: "Dear God, when I see broken things — in my community, in my friendships, in the world — help me not just to cry about them but to pray AND act. Give me Nehemiah's courage to arise and build, his wisdom to plan carefully, and his focus to ignore distractions. You are the God of heaven, and You will prosper the work. Amen.",

    teacherNote: "Nehemiah is the most practical book of leadership in the Bible. His approach — weep, pray, plan, act, adapt — is a transferable framework for any challenging project. The 4:9 principle ('prayer + a watch') is the definitive biblical statement on faith and works: neither alone is sufficient. For the 9–12 group, Nehemiah's refusal to come down from the wall (6:3) is a critical leadership lesson about focus and distraction. Sanballat's attempts escalated through mockery, threats, false alliances, and slander — yet Nehemiah's response was consistent: keep building. Note also Nehemiah 3, which lists builders by name and section — everyone had a specific assignment. This is a model of the body of Christ: each person has a role, and the whole project depends on each part functioning. The 52-day completion was proof of divine involvement; the enemies themselves acknowledged it (6:16). For application: ask children what 'walls' in their own world need rebuilding — and what their role might be.",

    memoryVerse: "The God of heaven, he will prosper us; therefore we his servants will arise and build. — Nehemiah 2:20",
  },

  // ── Week 35 ──────────────────────────────────
  {
    week: 35,
    title: "The Psalms — How to Pray Every Feeling",
    bibleRef: "Psalms 22; 46; 103",
    keyVerse: "Bless the LORD, O my soul: and all that is within me, bless his holy name. — Psalm 103:1",
    theme: "Worship & Lament",
    term: "Term 3",
    month: "Aug",
    icon: "🎵",
    color: "#059669",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Do you ever feel happy AND sad in the same day? Excited AND afraid? Grateful AND worried? Do you think it's okay to tell God ALL of those feelings — even the messy ones? Today we'll learn that the Psalms are God's invitation to bring EVERY feeling to Him.",

    story: {
      "3-5": "The Book of Psalms is like a big songbook — 150 songs and poems that people wrote to God. Some psalms are HAPPY: 'Bless the LORD, O my soul!' Some psalms are SAD: 'My God, my God, why hast thou forsaken me?' Some psalms are SCARED: 'God is our refuge and strength — He's a big safe place when we're afraid!' The amazing thing about the Psalms is that God wants us to tell Him EVERYTHING we feel. Happy? Tell God! Sad? Tell God! Angry? Tell God! Scared? Tell God! The Psalms teach us that there is no wrong feeling to bring to God. He is big enough to handle all of them. King David wrote many of the psalms, and he was sometimes happy, sometimes sad, sometimes scared, and sometimes in trouble — but he ALWAYS talked to God about it.",
      "6-8": "The Book of Psalms is the Bible's prayer and worship manual — 150 poems covering every human emotion. Today we look at three psalms that show three different ways to talk to God. PSALM 22 is a psalm of LAMENT — crying out in pain. It begins, 'My God, my God, why hast thou forsaken me?' (22:1). David wrote this from a place of deep suffering. Incredibly, Jesus quoted these exact words from the cross (Matthew 27:46). The psalm describes being surrounded by enemies, bones out of joint, and hands and feet pierced (22:16) — written 1,000 years before crucifixion was invented. Yet it ends in praise: 'He hath not despised nor abhorred the affliction of the afflicted' (22:24). PSALM 46 is a psalm of TRUST — finding peace in chaos. 'God is our refuge and strength, a very present help in trouble. Therefore will not we fear, though the earth be removed' (46:1–2). Even if mountains fall into the sea, God is our safe place. The famous command 'Be still, and know that I am God' (46:10) comes from this psalm. PSALM 103 is a psalm of PRAISE — overflowing gratitude. 'Bless the LORD, O my soul: and all that is within me, bless his holy name. Bless the LORD, O my soul, and forget not all his benefits' (103:1–2). David lists God's blessings: He forgives, heals, redeems, crowns with lovingkindness, and satisfies with good things. Together, these three psalms show us that we can bring EVERY feeling to God — pain, fear, and joy — and He welcomes them all.",
      "9-12": "The Psalter is the most emotionally honest book in the Bible — and arguably in all of literature. It contains 150 poems spanning the full range of human experience: ecstatic praise, grinding despair, righteous anger, quiet trust, bitter complaint, and joyful thanksgiving. The psalms were Israel's songbook, used in both public worship and private devotion. They teach us that prayer is not about performing for God but about being real with God. PSALM 22 is a psalm of lament — one of the most remarkable prophecies in the Old Testament. Written by David around 1000 BC, it describes experiences David never had: 'they pierced my hands and my feet' (22:16), 'they part my garments among them, and cast lots upon my vesture' (22:18). These details match the crucifixion accounts with forensic precision — yet crucifixion wouldn't be invented by the Romans for another 600+ years. Jesus' cry from the cross — 'My God, my God, why hast thou forsaken me?' (Matthew 27:46) — is a direct quotation of Psalm 22:1. By quoting the psalm's opening line, Jesus invites His hearers to read the entire psalm, which moves from agony to vindication. Lament is not the absence of faith; it's the exercise of faith in the dark. PSALM 46 is a psalm of confidence — a declaration that God is unshakeable even when everything else is. The Hebrew word for 'refuge' (machseh) means shelter or hiding place. 'Be still and know that I am God' (46:10) — the Hebrew 'be still' (raphah) means to cease striving, to let go, to stop fighting. It's a command to surrender control. Martin Luther wrote 'A Mighty Fortress Is Our God' based on this psalm. PSALM 103 is a psalm of praise — David's comprehensive catalogue of God's character. He lists at least twelve benefits: forgiveness, healing, redemption, lovingkindness, satisfaction, renewal, justice, revelation, mercy, patience, steadfast love, and compassion. The central theological statement is 103:8–12: God is merciful, gracious, slow to anger, and removes our sins 'as far as the east is from the west.' Together these three psalms model the full range of biblical prayer: lament (22), trust (46), and praise (103). The Psalms give us permission to be honest — even messy — before God. As C.S. Lewis noted, the psalms are not polite — they're true."
    },

    scripture: {
      "3-5": "Bless the LORD, O my soul.\n— Psalm 103:1\n\nGod is our refuge and strength.\n— Psalm 46:1",
      "6-8": "My God, my God, why hast thou forsaken me?\n— Psalm 22:1\n\nGod is our refuge and strength, a very present help in trouble.\n— Psalm 46:1\n\nBe still, and know that I am God.\n— Psalm 46:10\n\nBless the LORD, O my soul: and all that is within me, bless his holy name.\n— Psalm 103:1",
      "9-12": "My God, my God, why hast thou forsaken me? why art thou so far from helping me, and from the words of my roaring?\n— Psalm 22:1\n\nThey pierced my hands and my feet.\n— Psalm 22:16\n\nGod is our refuge and strength, a very present help in trouble. Therefore will not we fear, though the earth be removed, and though the mountains be carried into the midst of the sea.\n— Psalm 46:1–2\n\nBe still, and know that I am God.\n— Psalm 46:10\n\nBless the LORD, O my soul: and all that is within me, bless his holy name. Bless the LORD, O my soul, and forget not all his benefits.\n— Psalm 103:1–2\n\nAs far as the east is from the west, so far hath he removed our transgressions from us.\n— Psalm 103:12"
    },

    activities: {
      "3-5": "🎨 Make a 'Feelings Faces' poster. Draw four big circles and make each one a different face: HAPPY, SAD, SCARED, THANKFUL. Under each face, write a simple psalm line: Happy — 'Bless the LORD!' Sad — 'My God, why?' Scared — 'God is my safe place.' Thankful — 'Forget not all His benefits!' Decorate with bright colours.\n\n🎵 Sing or say Psalm 103:1 together as a chant: 'Bless the LORD, O my soul!' Clap or stamp on each beat. Make up actions for the words — point up for LORD, hand on chest for soul, open arms for bless. Practice until everyone knows it!",
      "6-8": "📖 Create a 'Three Psalms, Three Prayers' triptych (a three-panel folded artwork). Panel 1 (Psalm 22): LAMENT — draw dark colours, a person crying out, hands reaching up. Write Psalm 22:1. Panel 2 (Psalm 46): TRUST — draw a strong fortress in a storm, calm inside. Write Psalm 46:1. Panel 3 (Psalm 103): PRAISE — draw bright colours, a person with arms raised, surrounded by blessings. Write Psalm 103:1. Fold so all three panels connect.\n\n✍️ Write your own psalm! Choose one of the three types: a lament (tell God about something hard), a trust psalm (tell God you believe He's in control), or a praise psalm (list everything you're grateful for). Write at least 8 lines and decorate the border. Share it with the group if you're comfortable.",
      "9-12": "📖 Create a comprehensive 'Psalms Prayer Guide' booklet. Fold 4 sheets of paper to make an 8-page booklet. Page 1: Cover — 'How to Pray Every Feeling.' Pages 2–3: LAMENT (Psalm 22) — when you're hurting. Write key verses, explain the type, and add a prompt: 'Write your own lament here.' Pages 4–5: TRUST (Psalm 46) — when you're afraid. Same format. Pages 6–7: PRAISE (Psalm 103) — when you're grateful. Same format. Page 8: A personal prayer using all three elements. Illustrate each section and make it something you'd actually use for personal devotions.\n\n✍️ Write a three-part original psalm that moves through all three emotions in sequence — just as many biblical psalms do. Part 1: Lament (pour out a real struggle or pain — be honest). Part 2: Trust (turn toward God in the middle of the pain — declare what you know to be true). Part 3: Praise (end with worship — list what God has done and who He is). Model it on the arc of Psalm 22, which moves from 'My God, why have you forsaken me?' to 'He has done this!' Use vivid imagery and make it personal."
    },

    supplies: "Paper, markers, crayons, large sheets for poster/triptych, coloured pencils, stapler (for booklet), journal paper, musical instruments or clapping hands (for rhythm activity)",

    discussionQuestions: [
      "The Psalms include anger, sadness, fear, and doubt — right there in the Bible! Why do you think God included these honest emotions in His Word? Does it change how you pray?",
      "Psalm 22 starts with despair but ends with praise. Why do you think so many psalms follow this pattern — from pain to hope? What changes in the middle?",
      "'Be still and know that I am God' — the Hebrew means 'stop striving, let go.' Why is that so hard for us? What would it look like to actually do it?"
    ],

    reflection: "Today I learned that God doesn't want polished prayers — He wants honest ones. The Psalms teach me that I can cry out in pain (Psalm 22), rest in trust (Psalm 46), and overflow with praise (Psalm 103) — and God welcomes all of it. There is no feeling too big, too messy, or too raw for God.",

    prayer: "Dear God, thank You for the Psalms — for showing me that EVERY feeling is welcome in Your presence. When I'm hurting, I can cry out like David. When I'm afraid, I can find refuge in You. When I'm grateful, I can praise You with everything in me. Bless the LORD, O my soul — and all that is within me, bless Your holy name. Amen.",

    teacherNote: "This lesson introduces children to the Psalms as a prayer tool, not just a book to read. The three psalm types covered — lament (22), trust (46), and praise (103) — represent the most common categories (scholars identify at least 7 types, but these three are foundational). Psalm 22 is critical: it's both a lament AND a messianic prophecy. The crucifixion details (pierced hands/feet, divided garments, lots cast) predate crucifixion by centuries and are confirmed by the Dead Sea Scrolls. Jesus' quotation from the cross invites the entire psalm to be read as His experience. For the 9–12 group, emphasise that biblical lament is not complaining — it's directed toward God, rooted in relationship, and usually moves toward trust. The pattern of lament psalms (address God → describe the problem → ask for help → express trust → praise) gives children a framework for honest prayer. Psalm 46:10's 'be still' (raphah) is countercultural for children who are told to always be busy and productive. 'Let go and know that I am God' is a radical invitation to surrender control.",

    memoryVerse: "Bless the LORD, O my soul: and all that is within me, bless his holy name. — Psalm 103:1",
  },

  // ═══════════════════════════════════════════════════
  // ═══════════════════════════════════════════════════
  // SEPTEMBER — Weeks 36–39
  // ═══════════════════════════════════════════════════

  // ── Week 36 ──────────────────────────────────
  {
    week: 36,
    title: "Micah's Promise — The Ruler from Bethlehem",
    bibleRef: "Micah 5:2; Matthew 2:6",
    keyVerse: "Out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting. — Micah 5:2",
    theme: "Prophecy",
    term: "Term 3",
    month: "Sep",
    icon: "⭐",
    color: "#B45309",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "If you could pick ANY city in the world for the most important person ever to be born in, which would you choose? A huge capital? A famous place? God chose a tiny little village nobody paid attention to. Today we find out why.",

    story: {
      "3-5": "A long time before Jesus was born, God told a man called Micah a very special secret. God said, 'The King I'm going to send — the one who will save the world — won't be born in a big, fancy city. He'll be born in tiny little BETHLEHEM!' Bethlehem was so small that most people didn't even think about it. But God had a BIG plan for that little place. And hundreds of years later, that's exactly what happened! Mary and Joseph had to travel to Bethlehem, and that's where baby Jesus was born — just like God promised through Micah. God keeps EVERY promise, even ones made hundreds and hundreds of years before!",
      "6-8": "About 700 years before Jesus was born, the prophet Micah made an astonishing prediction. While the great prophets focused on Jerusalem, Micah pointed to a tiny village: 'But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting' (Micah 5:2). This verse contains two stunning details. First, the LOCATION — Bethlehem, a village so small it barely appeared on maps. It was known for one thing: it was the hometown of David. God was signalling that the promised King would come from David's line, born in David's city. Second, the IDENTITY — this ruler's origins are 'from of old, from everlasting.' This isn't describing a normal human birth. This King existed before He was born. He is eternal. This is a prophecy of the divine Messiah. When the wise men came searching for the newborn King, Herod's scholars knew exactly where to look. They quoted Micah 5:2 (Matthew 2:5–6). The prophecy was so specific that it served as a literal map to Jesus' birthplace. God chose the smallest, humblest place to introduce the greatest King — because God's kingdom has always worked upside down: the last shall be first, the humble shall be exalted, and the King of the universe arrives in a manger.",
      "9-12": "Micah 5:2 is one of the most precise messianic prophecies in the Old Testament — it names the exact birthplace of the Messiah seven centuries before the event. Micah was a contemporary of Isaiah, prophesying during the reigns of Jotham, Ahaz, and Hezekiah (c. 735–700 BC). While Isaiah operated in the royal court, Micah was a rural prophet from Moresheth, a small town in Judah. He spoke for the poor and oppressed against corrupt leaders. The specificity of Micah 5:2 is remarkable on multiple levels. Bethlehem Ephratah ('Ephratah' distinguishes it from another Bethlehem in Zebulun) was insignificant — Micah himself notes it is 'little among the thousands of Judah.' Yet God deliberately chose it, continuing His pattern of choosing the small, the weak, and the overlooked (cf. 1 Corinthians 1:27). Bethlehem was David's city (1 Samuel 16:1), and the prophecy signals a Davidic king — but this is no ordinary descendant. The phrase 'whose goings forth have been from of old, from everlasting' (Hebrew: miqedem, mimey olam) attributes eternal pre-existence to this ruler. This is not a human king; this is God entering human history. The New Testament confirms the fulfilment precisely. In Matthew 2:3–6, when Herod asks the chief priests where the Messiah would be born, they quote Micah 5:2 without hesitation. The prophecy was well known and undisputed. The mechanism of fulfilment is itself remarkable: Caesar Augustus' census decree (Luke 2:1) forced Mary and Joseph to travel from Nazareth to Bethlehem at the exact time of Jesus' birth. A pagan emperor's administrative decision fulfilled a 700-year-old Hebrew prophecy. This is providence operating on a global political scale. For the 9–12 group, Micah 5:2 also raises the theological question of Christ's pre-existence. 'From everlasting' is the same language used of God Himself in Psalm 90:2. The Messiah is not merely a future king — He is the eternal God who steps into time. John 1:1 echoes this: 'In the beginning was the Word, and the Word was with God, and the Word was God.'"
    },

    scripture: {
      "3-5": "But thou, Bethlehem… out of thee shall he come forth unto me that is to be ruler in Israel.\n— Micah 5:2",
      "6-8": "But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting.\n— Micah 5:2\n\nAnd thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Israel.\n— Matthew 2:6",
      "9-12": "But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting.\n— Micah 5:2\n\nAnd thou Bethlehem, in the land of Juda, art not the least among the princes of Juda: for out of thee shall come a Governor, that shall rule my people Israel.\n— Matthew 2:6\n\nIn the beginning was the Word, and the Word was with God, and the Word was God.\n— John 1:1"
    },

    activities: {
      "3-5": "⭐ Build a little Bethlehem scene! Use a small box as a stable, cotton wool for sheep, straw or yellow paper for the manger, and small figures for Mary, Joseph, and baby Jesus. Add a big star on top made from yellow card. Write 'Bethlehem!' on a sign next to it.\n\n🎨 Draw a TINY village with a HUGE star above it. Make the village really small — just a few houses — and make the star really big and bright. Write 'God chose the littlest place!' at the top.",
      "6-8": "📖 Create a 'Prophecy → Fulfilment' scroll. On one half, write Micah 5:2 as the prophecy (decorate with an Old Testament scroll illustration and the date '~700 BC'). On the other half, write Matthew 2:6 and Luke 2:4–7 as the fulfilment (decorate with a manger scene). Connect them with an arrow labelled '700 years!' Roll it up as a scroll and tie with ribbon.\n\n🗺️ Draw a map showing Nazareth and Bethlehem. Draw Mary and Joseph's journey path between them. At Nazareth, write 'Where they lived.' At Bethlehem, write 'Where God said the King would be born — Micah 5:2.' Add Caesar Augustus at the top issuing the census decree, and write: 'God used a pagan emperor to fulfil His promise!'",
      "9-12": "📖 Create a comprehensive 'Bethlehem Prophecy Web' study poster. Place Micah 5:2 in the centre. Around it, map every connection: (1) Bethlehem as David's city (1 Samuel 16:1), (2) 'From everlasting' and Christ's pre-existence (John 1:1, Psalm 90:2), (3) Matthew 2:5–6 — the scribes quoting Micah to Herod, (4) Luke 2:1–4 — Caesar's census as the mechanism of fulfilment, (5) God's pattern of choosing the small and humble (1 Corinthians 1:27). Draw connecting lines, add illustrations, and include a timeline showing the 700-year gap. Make it study-guide quality.\n\n✍️ Write a short reflective piece titled 'The Emperor Who Fulfilled a Prophecy Without Knowing It.' Explore how Caesar Augustus' census decree — a purely political act — became the mechanism that placed Mary and Joseph in Bethlehem at the exact right moment. Discuss what this reveals about God's sovereignty over world events. How does God use the decisions of people who don't even believe in Him to accomplish His purposes? Include at least three Scripture references and write at least 250 words."
    },

    supplies: "Small boxes, cotton wool, straw or yellow paper, small figures, yellow card (for star), paper, markers, crayons, ribbon, large sheets for poster, coloured pencils, journal paper",

    discussionQuestions: [
      "God chose the tiniest village for the biggest event in history. Why does God so often use small, overlooked things and places? What does that mean for YOU?",
      "Micah says this ruler's origins are 'from everlasting.' What does that tell us about who this King really is? Is this just a human king?",
      "A Roman emperor's tax decree brought Mary and Joseph to Bethlehem at the exact right time. What does that tell us about God's control over world events — even the decisions of people who don't know Him?"
    ],

    reflection: "Today I learned that God keeps His promises — even ones made 700 years in advance. He chose tiny Bethlehem for the birth of the eternal King, and He used a pagan emperor's decree to make it happen. Nothing is too small for God to use, and nothing is too big for God to control.",

    prayer: "Dear God, You are the God who keeps every promise. You announced Bethlehem 700 years early and then moved an entire empire to make it happen. Help me to trust that You're working in my life too — even when I can't see it. You use the small and the overlooked, and You are sovereign over everything. Thank You for sending Your eternal King to tiny Bethlehem. Amen.",

    teacherNote: "Micah 5:2 is one of the clearest messianic prophecies to teach because it's specific (a named location), verifiable (the fulfilment is recorded in the Gospels), and theologically rich ('from everlasting' implies divine pre-existence). The Dead Sea Scrolls include fragments of Micah, confirming the text predates Jesus. The key teaching points are: (1) God chooses the small — Bethlehem was insignificant by every human measure. (2) The ruler is eternal — 'from everlasting' uses divine-attribute language. (3) Providence operates through politics — Caesar's census was God's mechanism. For the 9–12 group, the pre-existence language opens the door to Christology: the baby in the manger is the eternal God. Compare 'from everlasting' with John 1:1, John 8:58 ('before Abraham was, I am'), and Colossians 1:17 ('he is before all things'). This lesson bridges the Old Testament prophets to the New Testament narratives — we're about to enter the Christmas story.",

    memoryVerse: "Out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting. — Micah 5:2",
  },

  // ── Week 37 ──────────────────────────────────
  {
    week: 37,
    title: "John the Baptist — Make Way for the King",
    bibleRef: "Luke 1:5–25; 57–80; Isaiah 40:3",
    keyVerse: "Prepare ye the way of the LORD, make straight in the desert a highway for our God. — Isaiah 40:3",
    theme: "Preparation & Humility",
    term: "Term 3",
    month: "Sep",
    icon: "📢",
    color: "#92400E",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Have you ever been really excited about someone important coming to visit — maybe a grandparent, or a special guest? What did you do to get ready? Today we meet the man whose WHOLE LIFE was about getting people ready for the most important arrival in history.",

    story: {
      "3-5": "Before Jesus was born, God had a special plan. He was going to send someone to get everybody ready — like a man who runs ahead shouting, 'The King is coming! Get ready!' That person was John. John's parents were Zechariah and Elizabeth. They were very old and had no children. One day an angel appeared to Zechariah in the temple and said, 'Your wife is going to have a baby! Name him John. He will get people ready for the Lord!' Zechariah couldn't believe it, so the angel said, 'Because you didn't believe me, you won't be able to speak until the baby is born!' When baby John was born, everyone wanted to call him Zechariah Jr. But Elizabeth said, 'No — his name is JOHN!' They asked Zechariah, and he wrote on a tablet: 'His name is John.' Instantly he could speak again! He was so happy that he praised God and said a beautiful prophecy about his son: 'You will go before the Lord to prepare His way!' John grew up in the wilderness, wore rough camel-hair clothes, and ate wild honey and locusts. He called out to everyone: 'Repent! Get your hearts ready! The King is coming!'",
      "6-8": "The story of John the Baptist begins with a miracle. His parents, Zechariah and Elizabeth, were elderly and childless — a source of deep sorrow in their culture. Zechariah was a priest, and while serving in the temple, the angel Gabriel appeared and announced that Elizabeth would bear a son. His name would be John, and he would 'go before him in the spirit and power of Elias, to make ready a people prepared for the Lord' (Luke 1:17). Zechariah doubted and was struck mute until John's birth. When the baby was born and Zechariah confirmed the name 'John' (meaning 'God is gracious'), his speech returned and he burst into prophecy — the Benedictus (Luke 1:67–79). He declared that his son would be 'the prophet of the Highest' who would 'go before the face of the Lord to prepare his ways' (1:76). John fulfilled the ancient prophecy of Isaiah 40:3: 'The voice of him that crieth in the wilderness, Prepare ye the way of the LORD, make straight in the desert a highway for our God.' In the ancient world, when a king was coming, a herald would run ahead to clear the road, fill in potholes, and straighten the path. John was God's herald — but the road he prepared was the human heart. He called people to repent, to be baptised, and to make their hearts ready for the Messiah. John's humility was extraordinary. When people wondered if HE was the Messiah, he said, 'I indeed baptize you with water; but one mightier than I cometh, the latchet of whose shoes I am not worthy to unloose' (Luke 3:16). John's whole purpose was to point to someone greater — and then step aside. Jesus called him the greatest man ever born of a woman (Matthew 11:11).",
      "9-12": "John the Baptist is one of the most pivotal figures in redemptive history — the last Old Testament prophet, the forerunner of the Messiah, and the bridge between the old covenant and the new. His birth narrative in Luke 1 parallels the birth of Samuel: elderly parents, divine announcement, a child consecrated from the womb. Luke is deliberately connecting the opening of the gospel era with the opening of the prophetic era. The angel Gabriel's announcement to Zechariah (Luke 1:13–17) is loaded with Old Testament echoes. John will come 'in the spirit and power of Elias' (1:17), fulfilling Malachi 4:5–6, which promised that Elijah would return before 'the great and dreadful day of the LORD.' John IS the Elijah figure — not literally reincarnated, but carrying the same prophetic mantle and mission. Zechariah's Benedictus (1:67–79) is one of the great theological poems of the New Testament. It moves from the macro (God has visited and redeemed His people, fulfilling the Abrahamic and Davidic covenants) to the micro (little baby John will be the prophet who prepares the way). The tender shift in verse 76 — 'And thou, child, shalt be called the prophet of the Highest' — is a father looking at his newborn son and speaking destiny over him. Isaiah 40:3 provides John's job description: 'Prepare ye the way of the LORD.' In the ancient Near East, a royal herald would go before a king's procession to ensure the road was smooth, straight, and worthy of the monarch. John's 'road preparation' is spiritual — calling people to repentance, clearing the debris of sin and religious complacency so their hearts would be ready to receive the King. John's humility is the defining characteristic of his ministry. He consistently deflected attention to Jesus: 'He must increase, but I must decrease' (John 3:30). He compared himself to a voice, not a person — 'I am the voice of one crying in the wilderness' (John 1:23). Jesus' assessment of John is the highest compliment in the Gospels: 'Among them that are born of women there hath not risen a greater than John the Baptist' (Matthew 11:11). Yet Jesus adds a stunning qualifier: 'he that is least in the kingdom of heaven is greater than he.' John belongs to the era of promise; believers belong to the era of fulfilment."
    },

    scripture: {
      "3-5": "Prepare ye the way of the LORD.\n— Isaiah 40:3",
      "6-8": "The voice of him that crieth in the wilderness, Prepare ye the way of the LORD, make straight in the desert a highway for our God.\n— Isaiah 40:3\n\nAnd thou, child, shalt be called the prophet of the Highest: for thou shalt go before the face of the Lord to prepare his ways.\n— Luke 1:76",
      "9-12": "The voice of him that crieth in the wilderness, Prepare ye the way of the LORD, make straight in the desert a highway for our God.\n— Isaiah 40:3\n\nAnd thou, child, shalt be called the prophet of the Highest: for thou shalt go before the face of the Lord to prepare his ways.\n— Luke 1:76\n\nHe must increase, but I must decrease.\n— John 3:30\n\nAmong them that are born of women there hath not risen a greater than John the Baptist.\n— Matthew 11:11"
    },

    activities: {
      "3-5": "📢 Make a 'Herald's Trumpet' from a rolled-up piece of card. Decorate it with bright colours. Practice calling out: 'Prepare ye the way of the LORD! The King is coming!' March around the room like John the Baptist announcing the good news.\n\n🎨 Draw John the Baptist in the wilderness — give him rough camel-hair clothes, a leather belt, wild hair, and draw him standing by a river. Add people listening to him. Write 'Get Ready! The King is Coming!' in a big speech bubble.",
      "6-8": "📖 Create a 'Prepare the Way' road-building poster. Draw a winding road being straightened and smoothed — with potholes being filled and rocks being cleared. On the old bumpy road, label obstacles: 'selfishness,' 'pride,' 'sin,' 'ignoring God.' On the straight new road, label the preparations: 'repentance,' 'humility,' 'prayer,' 'obedience.' At the end of the road, draw Jesus arriving. Write Isaiah 40:3 at the top.\n\n✍️ Make a 'Prophet Profile Card' for John the Baptist. On a large card, draw John on one side. On the other side, fill in: NAME, PARENTS, PROPHECY HE FULFILLED (Isaiah 40:3), HIS MESSAGE ('Repent!'), HIS CLOTHING, HIS FOOD, WHAT JESUS SAID ABOUT HIM (Matthew 11:11), HIS MOTTO ('He must increase, I must decrease'). Decorate the border with wilderness imagery.",
      "9-12": "📖 Create an illustrated 'Bridge Between the Covenants' study page about John the Baptist. Place John in the centre as the bridge figure. On the left, map his Old Testament connections: Isaiah 40:3 (the voice), Malachi 4:5 (the Elijah figure), and the Samuel birth parallels. On the right, map his New Testament impact: baptising Jesus, pointing disciples to the Lamb, and Jesus' tribute in Matthew 11:11. Include Zechariah's Benedictus as a boxed theological summary. Add the key question at the bottom: 'What does John 3:30 — He must increase, I must decrease — look like in MY life?' Make it study-guide quality.\n\n✍️ Write a reflective piece from Zechariah's perspective on the night John is born. For nine months he's been unable to speak — forced into silence and contemplation. Now, as he holds his newborn son and his voice returns, he bursts into the Benedictus. What has he been thinking during those silent months? What does he feel as he looks at this baby and speaks destiny over him? What does he understand now that he didn't when the angel first appeared? Include references to Luke 1:67–79."
    },

    supplies: "Card stock (for trumpet), markers, crayons, large sheets for poster/study page, coloured pencils, card for profile, journal paper, brown/green colours for wilderness imagery",

    discussionQuestions: [
      "John's whole purpose was to point people to Jesus, not to himself. What does it look like to 'decrease so Jesus can increase' in your own life?",
      "John prepared the way by calling people to repent. What 'road blocks' might be in YOUR heart that need clearing before you can fully follow Jesus?",
      "Jesus said John was the greatest person ever born — yet John wore rough clothes, lived in the wilderness, and never performed a miracle. What does Jesus' definition of 'great' look like compared to the world's definition?"
    ],

    reflection: "Today I learned that true greatness isn't about being famous or powerful — it's about pointing people to Jesus. John the Baptist was the greatest man born of a woman, and his whole life was about saying, 'Look — there's the Lamb of God!' I want my life to point to Jesus too.",

    prayer: "Dear God, help me to be like John — willing to prepare the way for Jesus in the lives of people around me. Give me humility to say, 'He must increase, and I must decrease.' I don't need to be in the spotlight; I just need to point people to You. Prepare the road of my heart — clear away the pride, the sin, the selfishness — so that Jesus is the one people see. Amen.",

    teacherNote: "John the Baptist is the hinge between the Old and New Testaments. His birth narrative deliberately parallels Samuel's (elderly parents, divine announcement, prophetic child), signalling that a new era is dawning. Gabriel's announcement that John will come 'in the spirit and power of Elias' (Luke 1:17) fulfils Malachi 4:5–6, the last prophecy of the Old Testament. John closes the prophetic gap. His ministry model — 'He must increase, I must decrease' (John 3:30) — is the purest expression of Christian humility in Scripture. For the 9–12 group, the paradox of Matthew 11:11 is worth exploring: John is the greatest born of women, yet the least in the kingdom is greater. This isn't a diminishment of John but an elevation of the new covenant reality — those who live after the cross and resurrection have access to what John could only point to. Also note that Zechariah's nine months of silence (Luke 1:20) served as a period of enforced contemplation — his doubt led to a season of listening before he could speak prophetically. Sometimes God uses silence to prepare us.",

    memoryVerse: "Prepare ye the way of the LORD, make straight in the desert a highway for our God. — Isaiah 40:3",
  },

  // ── Week 38 ──────────────────────────────────
  {
    week: 38,
    title: "The Annunciation — Mary's Yes",
    bibleRef: "Luke 1:26–56",
    keyVerse: "Be it unto me according to thy word. — Luke 1:38",
    theme: "Faith & Surrender",
    term: "Term 3",
    month: "Sep",
    icon: "🕊️",
    color: "#2563EB",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Has anyone ever asked you to do something HUGE — something that seemed impossible or really scary — and you had to decide whether to say yes or no? What did you do? Today we hear about the most important 'yes' a human being ever said.",

    story: {
      "3-5": "Mary was a young woman who lived in a little town called Nazareth. She loved God very much. One day, something AMAZING happened. An angel called Gabriel appeared to her! Mary was frightened, but Gabriel said, 'Don't be afraid, Mary. God is very pleased with you. You are going to have a very special baby, and you will call Him JESUS. He will be the Son of God — the King whose kingdom will never end!' Mary was confused. 'How can this happen?' she asked. Gabriel said, 'The Holy Spirit will come upon you. Nothing is impossible with God!' And Mary said the most beautiful words: 'I am God's servant. Let it happen to me just as you said.' Mary said YES to God — even though it was scary, even though she didn't understand everything. And because she said yes, the most wonderful thing in all of history was about to happen: God was coming into the world as a baby!",
      "6-8": "In the sixth month after Elizabeth conceived John, God sent the angel Gabriel to a town called Nazareth, to a young virgin named Mary. She was engaged to a carpenter named Joseph, a descendant of King David. Gabriel's greeting was extraordinary: 'Hail, thou that art highly favoured, the Lord is with thee: blessed art thou among women' (Luke 1:28). Mary was troubled — not by the angel's appearance, but by his words. What could this greeting mean? Gabriel continued with the most momentous announcement in human history: 'Thou shalt conceive in thy womb, and bring forth a son, and shalt call his name JESUS. He shall be great, and shall be called the Son of the Highest: and the Lord God shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end' (1:31–33). Mary asked one practical question: 'How shall this be, seeing I know not a man?' (1:34). Unlike Zechariah, who doubted WHETHER God could do it, Mary asked HOW God would do it — a question of logistics, not faith. Gabriel explained that the Holy Spirit would overshadow her, and that her relative Elizabeth was already miraculously pregnant. Then came the truth that undergirds everything: 'For with God nothing shall be impossible' (1:37). Mary's response is the greatest act of human surrender in the Bible: 'Behold the handmaid of the Lord; be it unto me according to thy word' (1:38). She visited Elizabeth, and when Elizabeth greeted her, Mary burst into the Magnificat (1:46–55) — a song of praise celebrating God's faithfulness to the humble and the hungry.",
      "9-12": "The Annunciation (Luke 1:26–38) is the moment that changes everything. The eternal God is about to enter human history through the womb of a teenage girl in an obscure village. The theological weight of this passage cannot be overstated. Gabriel's description of the child in 1:31–33 weaves together multiple Old Testament strands: 'Jesus' (the Greek form of Joshua, meaning 'God saves'), 'Son of the Highest' (divine identity), 'the throne of his father David' (Davidic covenant fulfilment, 2 Samuel 7:16), and 'of his kingdom there shall be no end' (eternal reign, Daniel 7:14). Every major messianic prophecy converges in this announcement. Mary's question — 'How shall this be?' (1:34) — is fundamentally different from Zechariah's doubt (1:18). Zechariah asked 'Whereby shall I know this?' — demanding proof. Mary asks 'How?' — seeking understanding while already willing to obey. Gabriel's answer introduces the mystery of the Incarnation: 'The Holy Ghost shall come upon thee, and the power of the Highest shall overshadow thee' (1:35). The word 'overshadow' (episkiasei) is the same word used for God's glory cloud covering the tabernacle (Exodus 40:35). Mary's body becomes the new Holy of Holies — the place where God's presence dwells. Mary's response — 'Behold the handmaid of the Lord; be it unto me according to thy word' (1:38) — is the most consequential act of human will in Scripture. The word 'handmaid' (doule) means 'slave' — Mary places herself entirely at God's disposal. She says yes without knowing the full cost: social scandal, potential abandonment by Joseph, lifelong misunderstanding, and ultimately watching her son die on a cross. The Magnificat (1:46–55) reveals Mary's theological depth. It echoes Hannah's song (1 Samuel 2:1–10) almost line for line: God scatters the proud, puts down the mighty, lifts the humble, fills the hungry. Mary understands that what is happening to her is not just personal — it's the culmination of God's covenant faithfulness to Abraham (1:55). She sees herself within the grand narrative of redemption. For the 9–12 group: Mary's yes is often romanticised, but it was radical and costly. In first-century Palestine, a pregnant unmarried woman faced shame, divorce, and potentially death by stoning (Deuteronomy 22:23–24). Mary said yes to God's plan knowing it would turn her world upside down."
    },

    scripture: {
      "3-5": "Be it unto me according to thy word.\n— Luke 1:38",
      "6-8": "And the angel said unto her, Fear not, Mary: for thou hast found favour with God. And, behold, thou shalt conceive in thy womb, and bring forth a son, and shalt call his name JESUS.\n— Luke 1:30–31\n\nFor with God nothing shall be impossible.\n— Luke 1:37\n\nBehold the handmaid of the Lord; be it unto me according to thy word.\n— Luke 1:38",
      "9-12": "He shall be great, and shall be called the Son of the Highest: and the Lord God shall give unto him the throne of his father David: And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end.\n— Luke 1:32–33\n\nThe Holy Ghost shall come upon thee, and the power of the Highest shall overshadow thee: therefore also that holy thing which shall be born of thee shall be called the Son of God.\n— Luke 1:35\n\nFor with God nothing shall be impossible.\n— Luke 1:37\n\nBehold the handmaid of the Lord; be it unto me according to thy word.\n— Luke 1:38\n\nMy soul doth magnify the Lord, and my spirit hath rejoiced in God my Saviour.\n— Luke 1:46–47"
    },

    activities: {
      "3-5": "🕊️ Make a 'Mary's Yes' craft — cut out a large speech bubble from white card. Inside it write: 'Be it unto me according to thy word!' Decorate the bubble with a dove (the Holy Spirit), flowers, and stars. Punch a hole and tie a ribbon so it can hang as a decoration.\n\n🎨 Draw the angel Gabriel visiting Mary. Make Gabriel bright and glowing with big wings. Draw Mary looking surprised but calm. Add a speech bubble for Gabriel ('Don't be afraid!') and one for Mary ('Yes, Lord!'). Use your brightest colours for the angel.",
      "6-8": "📖 Create a side-by-side 'Zechariah vs. Mary' response card. Fold a sheet in half. On the left, draw Zechariah in the temple with the angel. Write his question ('How shall I know this?' — doubt) and the result (struck mute). On the right, draw Mary in her home with Gabriel. Write her question ('How shall this be?' — seeking understanding) and the result (she says yes). At the bottom, write: 'Same angel. Same impossible news. Different responses. What will YOUR response be?'\n\n🎵 Write out the Magnificat (Luke 1:46–55) on a decorated scroll. Use your best handwriting and add illustrations in the margins: a crown toppling (the mighty brought down), a loaf of bread (the hungry filled), a hand lifted up (the humble exalted). Roll it and tie with ribbon as a keepsake.",
      "9-12": "📖 Create a detailed 'Annunciation Study Page' showing how Gabriel's announcement fulfils multiple Old Testament prophecies. In the centre, write Luke 1:31–33. Draw connecting lines to: Isaiah 7:14 (virgin birth), 2 Samuel 7:16 (David's throne forever), Daniel 7:14 (everlasting kingdom), Isaiah 9:6–7 (Wonderful, Counsellor, Mighty God). For each connection, write the OT verse and a brief annotation. Add a section comparing Mary's response to Hannah's response (both say 'handmaid,' both sing a song of praise). Make it comprehensive and visually striking.\n\n✍️ Write a diary entry from Mary on the evening after Gabriel leaves. She's alone in her room in Nazareth. What is she feeling — awe, fear, joy, confusion? What questions is she wrestling with? How will she tell Joseph? What does she think about when Gabriel said 'nothing shall be impossible with God'? Capture both the wonder and the weight of her 'yes.' End with her decision to visit Elizabeth — the one person who might understand."
    },

    supplies: "White card, markers, crayons, scissors, ribbon, hole punch, paper for scroll, large sheets for study page, coloured pencils, journal paper, gold/white colours for angel illustrations",

    discussionQuestions: [
      "Mary said yes to God without knowing the full cost. What does it mean to say 'yes' to God when you don't know how everything will turn out?",
      "Zechariah asked 'How shall I KNOW?' (demanding proof). Mary asked 'How shall this BE?' (seeking understanding). What's the difference between those two questions?",
      "Gabriel said 'nothing shall be impossible with God.' Do you really believe that? What 'impossible' thing might God be asking you to trust Him with?"
    ],

    reflection: "Today I learned that the most powerful thing a person can say to God is 'yes.' Mary didn't understand everything. She didn't know the full cost. But she trusted God and surrendered her life to His plan. I want to have that same faith — to say, 'Be it unto me according to thy word,' even when I can't see the whole picture.",

    prayer: "Dear God, like Mary, I want to say yes to You — even when I don't understand, even when it's scary, even when it costs me. Help me to trust that nothing is impossible with You. Be it unto me according to Your word. I am Yours. Use me for Your purposes, whatever they may be. Amen.",

    teacherNote: "The Annunciation is the New Testament's most important announcement, and Luke frames it with extraordinary theological care. Gabriel's words compress multiple OT prophecies into a single birth announcement. The contrast between Zechariah and Mary is instructive: both receive impossible news from the same angel, but their responses differ fundamentally. Zechariah demands verification; Mary seeks clarification while already willing. The word 'overshadow' (episkiasei, 1:35) is a deliberate echo of the Shekinah glory at the tabernacle — Mary's body becomes the dwelling place of God. For the 9–12 group, the Magnificat reveals that Mary was theologically literate — her song draws from Hannah's prayer, the Psalms, and the prophets. She's not a passive vessel but an active participant who understands the redemptive-historical significance of what God is doing. The social cost of Mary's yes should not be minimised: an unmarried pregnant woman in first-century Palestine faced severe consequences. Her faith was not romantic — it was radical and risky.",

    memoryVerse: "Be it unto me according to thy word. — Luke 1:38",
  },

  // ── Week 39 ──────────────────────────────────
  {
    week: 39,
    title: "The Nativity — The Word Became Flesh",
    bibleRef: "Luke 2:1–20; John 1:1–14",
    keyVerse: "And the Word was made flesh, and dwelt among us. — John 1:14",
    theme: "The Incarnation",
    term: "Term 3",
    month: "Sep",
    icon: "👶",
    color: "#D97706",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "What's the most important thing that has EVER happened? Not in your life — in ALL of history? Today we arrive at the moment everything has been pointing to. The King is here.",

    story: {
      "3-5": "It was finally time! God's promise was coming true. Mary and Joseph had to travel to Bethlehem because the ruler of the land said everyone had to go to their family's town. The journey was long and Mary was very tired because baby Jesus was almost ready to be born. When they got to Bethlehem, there was no room for them anywhere! So they stayed in a place where animals slept. And there, in that simple, humble place, baby Jesus was born. Mary wrapped Him in soft cloths and laid Him in a manger — a feeding box for animals. The King of the whole universe came as a tiny baby, lying in a box of hay! Out in the fields nearby, shepherds were watching their sheep. Suddenly the sky lit up with a BRIGHT angel who said, 'Don't be afraid! I bring you wonderful news! Today in Bethlehem, a Saviour is born — He is Christ the Lord!' Then the whole sky filled with angels singing, 'Glory to God in the highest, and on earth peace!' The shepherds ran to Bethlehem and found Mary, Joseph, and the baby — just as the angel said. God kept His promise. The Saviour was here!",
      "6-8": "Caesar Augustus issued a decree that the entire Roman world should be taxed, requiring everyone to return to their ancestral town. Joseph, being of David's line, travelled from Nazareth to Bethlehem — with Mary, who was expecting her baby any day. This was no coincidence. 700 years earlier, Micah had prophesied that the ruler of Israel would come from Bethlehem (Micah 5:2). A pagan emperor's administrative decision fulfilled God's ancient promise. Bethlehem was crowded. There was no room in the inn. Mary gave birth and laid her firstborn son in a manger — a stone or wooden feeding trough for animals. The King of Kings entered the world not in a palace but in the humblest place imaginable. Meanwhile, in the fields outside Bethlehem, shepherds were keeping watch over their flocks. An angel appeared, and the glory of the Lord shone around them. They were terrified. But the angel said, 'Fear not: for, behold, I bring you good tidings of great joy, which shall be to all people. For unto you is born this day in the city of David a Saviour, which is Christ the Lord' (Luke 2:10–11). Three titles in one announcement: Saviour (He rescues), Christ (He is the anointed King), Lord (He is God). Then a multitude of heavenly hosts appeared, praising God: 'Glory to God in the highest, and on earth peace, good will toward men' (2:14). The shepherds hurried to Bethlehem and found everything exactly as the angel described. They spread the word, and all who heard it were amazed. John's Gospel adds the cosmic perspective: 'In the beginning was the Word, and the Word was with God, and the Word was God... And the Word was made flesh, and dwelt among us' (John 1:1, 14). The God who spoke the universe into existence entered it as a baby. That is the miracle of Christmas.",
      "9-12": "The Nativity is the hinge of all human history — the moment the eternal God enters time, the infinite becomes finite, and the Creator becomes a creature. Luke and John give us complementary accounts: Luke tells us HOW it happened (the historical facts); John tells us WHAT it means (the theological reality). Luke's account (2:1–20) is grounded in history. He names the emperor (Caesar Augustus), the governor (Cyrenius), and the location (Bethlehem). These are not mythological details — they're verifiable facts that anchor the incarnation in real-world events. The 'no room in the inn' detail is theologically loaded: the Creator of the universe comes to His own world, and there is no space for Him. John 1:11 makes this explicit: 'He came unto his own, and his own received him not.' The manger is the ultimate symbol of divine humility. The Greek word for 'manger' (phatne) means a feeding trough. God lays Himself where animals eat — making Himself accessible to the lowest, the poorest, the most overlooked. The shepherds are the first to hear the announcement — not priests, not scholars, not kings. Shepherds were among the lowest social class in first-century Palestine, considered unreliable witnesses in court. Yet God chose them as the first evangelists. The angel's announcement packs extraordinary theology into a single verse: 'Unto you is born this day in the city of David a Saviour, which is Christ the Lord' (2:11). 'Saviour' (soter) — He rescues from sin. 'Christ' (christos = anointed one) — He is the promised Messiah-King. 'Lord' (kyrios) — the Septuagint's translation of YHWH. The baby in the manger is the LORD God of Israel. John's prologue (1:1–14) provides the cosmic framework. 'In the beginning was the Word' — John deliberately echoes Genesis 1:1. The 'Word' (Logos) is the pre-existent, divine Son through whom all things were created (1:3). John 1:14 — 'the Word was made flesh and dwelt among us' — is the most staggering sentence in the Bible. 'Dwelt' (eskenosen) literally means 'tabernacled' or 'pitched His tent.' God, who once dwelt in the Tabernacle and the Temple, now dwells in human flesh. Jesus is the ultimate temple — the place where God and humanity meet. The Incarnation is not God wearing a human costume. It is God becoming fully human while remaining fully God — the mystery the early church councils spent centuries articulating. As Athanasius wrote, 'He became what we are so that we might become what He is.'"
    },

    scripture: {
      "3-5": "For unto you is born this day in the city of David a Saviour, which is Christ the Lord.\n— Luke 2:11",
      "6-8": "For unto you is born this day in the city of David a Saviour, which is Christ the Lord. And this shall be a sign unto you; Ye shall find the babe wrapped in swaddling clothes, lying in a manger.\n— Luke 2:11–12\n\nGlory to God in the highest, and on earth peace, good will toward men.\n— Luke 2:14\n\nAnd the Word was made flesh, and dwelt among us.\n— John 1:14",
      "9-12": "In the beginning was the Word, and the Word was with God, and the Word was God. The same was in the beginning with God. All things were made by him; and without him was not any thing made that was made.\n— John 1:1–3\n\nAnd the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.\n— John 1:14\n\nFor unto you is born this day in the city of David a Saviour, which is Christ the Lord.\n— Luke 2:11\n\nGlory to God in the highest, and on earth peace, good will toward men.\n— Luke 2:14"
    },

    activities: {
      "3-5": "👶 Build a simple nativity scene using craft materials — a box for the stable, straw or yellow paper for hay, small figures for Mary and Joseph, a cloth-wrapped figure for baby Jesus in a small container (the manger), and cotton ball sheep. Add a star on top made from yellow card. Tell the story as you build each piece.\n\n🎨 Draw the night sky FULL of angels! Make the sky dark blue or black, then fill it with bright, glowing angels singing 'Glory to God!' Draw the shepherds on the ground below looking up in wonder. Use gold, white, and silver for the angels.",
      "6-8": "📖 Create a Nativity newspaper front page — 'The Bethlehem Herald.' Write a headline ('KING BORN IN MANGER!'), a lead article summarising Luke 2:1–20, a 'shepherd eyewitness interview,' and a sidebar quoting the angel's announcement. Add a 'weather report' (clear skies, unusual star activity) and an 'editorial' asking 'What does this birth mean for Israel?' Design it with columns and illustrations like a real newspaper.\n\n⭐ Make a 'Names of Jesus' star decoration. Cut a large star from card. On each point, write one title from the birth narratives: Saviour, Christ, Lord, Word, Immanuel. In the centre, write John 1:14. Decorate with gold and silver, punch a hole, and hang it.",
      "9-12": "📖 Create an illustrated 'Two Gospels, One Story' comparative study page. Divide a large sheet into two halves: LUKE (left) and JOHN (right). Under Luke, map the historical details: Caesar's decree, Bethlehem, manger, shepherds, angels. Under John, map the theological truths: the pre-existent Word, Creator of all things, light in darkness, the Word made flesh. Draw connecting lines between the two accounts showing how they complement each other. Add a central annotation explaining 'dwelt' (eskenosen = tabernacled) and its connection to Exodus 40:34 (God's glory filling the tabernacle). Make it comprehensive and visually striking.\n\n✍️ Write a creative piece titled 'The Night the Infinite Became Small.' Using both Luke 2 and John 1, describe Christmas night from two perspectives simultaneously: the cosmic view (the eternal Word stepping into time) and the ground-level view (a young couple, a borrowed stable, a baby's cry). Weave the two perspectives together so the reader feels both the vast theological significance and the intimate human reality. End with the shepherds arriving — what do they see? What do they NOT yet understand? Write at least 300 words."
    },

    supplies: "Small boxes, straw or yellow paper, small figures, cloth scraps, cotton balls, yellow card, markers, crayons, newspaper-style layout paper, card stock (for star), gold/silver colours, hole punch, ribbon, large sheets for study page, coloured pencils, journal paper",

    discussionQuestions: [
      "There was 'no room in the inn' for Jesus. The Creator of the universe arrived and there was no space for Him. What does that tell us about how the world receives God?",
      "The shepherds — the lowest people in society — were the first to hear the good news. Why does God keep choosing the overlooked and the humble? What does that mean for you?",
      "John says the Word 'dwelt' (tabernacled) among us. What does it mean that God moved into our neighbourhood? Why did He do it that way instead of appearing in power and glory?"
    ],

    reflection: "Today I arrived at the most important moment in history: the Word became flesh. God didn't send a message — He came Himself. He didn't arrive in a palace — He was born in a stable. He wasn't announced to kings — He was announced to shepherds. Everything about the Nativity tells me that God comes to the humble, the small, and the overlooked. He came for ME.",

    prayer: "Dear God, thank You for the miracle of Christmas — not tinsel and presents, but the eternal Word becoming a baby. Thank You that You didn't stay far away but came close — so close that You lay in a manger. You are the Saviour, the Christ, and the Lord. Help me to always have room for You. Glory to God in the highest! Amen.",

    teacherNote: "The Nativity lesson weaves together Luke's historical narrative and John's theological prologue. Luke anchors the incarnation in verifiable history (named rulers, a specific city, datable events). John provides the cosmic interpretation: the baby in the manger is the eternal Logos through whom all creation exists. The word eskenosen (1:14, 'dwelt/tabernacled') is the theological key — it connects the incarnation to the entire Old Testament trajectory of God dwelling with His people (tabernacle → temple → Christ → the believer). For the 9–12 group, the three titles in Luke 2:11 deserve careful unpacking: 'Saviour' (soter — rescue from sin, not just political oppression), 'Christ' (christos — the anointed Messiah-King promised throughout the OT), 'Lord' (kyrios — the Septuagint's word for YHWH). The angel is telling shepherds that a baby in a feeding trough is the LORD God. The manger as a sign (2:12) is deeply ironic: the sign of the King is NOT a throne but a trough. This is the upside-down kingdom. The shepherds as first witnesses is socially revolutionary — God bypasses every power structure to announce the greatest event in history to the least prestigious audience imaginable.",

    memoryVerse: "And the Word was made flesh, and dwelt among us. — John 1:14",
  },

  // ═══════════════════════════════════════════════════
  // OCTOBER — Weeks 40–43
  // ═══════════════════════════════════════════════════

  // ── Week 40 ──────────────────────────────────
  {
    week: 40,
    title: "The Baptism and Temptation of Jesus",
    bibleRef: "Matthew 3–4",
    keyVerse: "This is my beloved Son, in whom I am well pleased. — Matthew 3:17",
    theme: "Identity & Temptation",
    term: "Term 4",
    month: "Oct",
    icon: "🕊️",
    color: "#1D4ED8",
    ageGroups: ["3-5","6-8","9-12"],

    warmUp: "Has someone you love ever said something to you that made you feel really special — like 'I'm so proud of you' or 'You're amazing'? How did that feel? Today we hear God the Father say those words to His Son — and then we see what happened next.",

    story: {
      "3-5": "When Jesus was a grown-up, He went to the River Jordan to be baptised by His cousin John. As Jesus came up out of the water, something wonderful happened — the heavens opened, the Holy Spirit came down like a beautiful dove, and God the Father spoke from heaven: 'This is my beloved Son, in whom I am well pleased!' WOW! Then the Holy Spirit led Jesus into the wilderness — a big, empty, dry place. Jesus was there for 40 DAYS with no food! He was very hungry. That's when the devil came and tried to trick Jesus. The devil said, 'If you're God's Son, turn these stones into bread!' But Jesus said, 'No! The Bible says people need God's word, not just food!' The devil tried again and again, but every time, Jesus answered with the Bible. The devil gave up and left, and angels came to take care of Jesus. Jesus beat every temptation because He knew God's Word!",
      "6-8": "Before Jesus began His public ministry, two things happened that define everything that followed: His baptism and His temptation. At the Jordan River, Jesus came to John to be baptised. John protested: 'I have need to be baptised of thee, and comest thou to me?' (Matthew 3:14). Jesus had no sin to confess — so why be baptised? He said, 'Suffer it to be so now: for thus it becometh us to fulfil all righteousness' (3:15). Jesus was identifying with sinful humanity — stepping into our place. As He rose from the water, three extraordinary things happened simultaneously: the heavens opened, the Spirit descended like a dove, and the Father spoke: 'This is my beloved Son, in whom I am well pleased' (3:17). All three persons of the Trinity appear in one moment. Immediately after, the Spirit led Jesus into the wilderness for 40 days of fasting. The devil came with three temptations, each targeting a different vulnerability. First: 'If thou be the Son of God, command that these stones be made bread' (4:3) — a temptation to use divine power for personal comfort. Jesus replied with Deuteronomy 8:3: 'Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.' Second: the devil took Jesus to the temple pinnacle and challenged Him to jump, quoting Psalm 91. Jesus responded with Deuteronomy 6:16: 'Thou shalt not tempt the Lord thy God.' Third: the devil offered Jesus all the kingdoms of the world in exchange for worship. Jesus commanded: 'Get thee hence, Satan: for it is written, Thou shalt worship the Lord thy God, and him only shalt thou serve' (4:10). Every answer came from Deuteronomy — the book Israel failed to live by in their own wilderness. Where Israel failed for 40 years, Jesus succeeded in 40 days. He is the true Israel.",
      "9-12": "Matthew 3–4 presents the launch of Jesus' public ministry through two defining events: baptism (identity declared) and temptation (identity tested). The sequence is theologically deliberate — the Father affirms who Jesus is, and then the enemy challenges it. Jesus' baptism raises an immediate theological question: why does the sinless Son of God submit to a baptism of repentance? The answer lies in the concept of identification. Jesus enters the water not for His own sin but for ours — He's enacting the substitution that will culminate at the cross. Paul later explains: 'He hath made him to be sin for us, who knew no sin; that we might be made the righteousness of God in him' (2 Corinthians 5:21). The baptismal scene is explicitly Trinitarian: the Son is baptised, the Spirit descends, the Father speaks. 'This is my beloved Son, in whom I am well pleased' (3:17) echoes both Psalm 2:7 ('Thou art my Son') and Isaiah 42:1 ('my servant… in whom my soul delighteth'). Jesus is simultaneously the royal Son (Psalm 2) and the Suffering Servant (Isaiah 42) — King and sacrifice in one person. The temptation narrative (4:1–11) is the theological counterpart to Israel's 40-year wilderness failure. The parallels are precise: Israel was hungry and grumbled (Exodus 16) — Jesus was hungry and trusted; Israel tested God at Massah (Exodus 17) — Jesus refused to test the Father; Israel worshipped the golden calf (Exodus 32) — Jesus worshipped God alone. All three of Jesus' responses come from Deuteronomy 6–8 — Moses' instructions to Israel for the wilderness. Where Israel failed every test, Jesus passes every one. He is the faithful Son Israel was meant to be. The devil's approach is significant: each temptation begins with 'If thou be the Son of God' — directly challenging the identity the Father had just declared. This reveals the enemy's primary strategy: make you doubt who God says you are. Jesus never debates the devil — He quotes Scripture. He doesn't argue, explain, or negotiate. He wields 'the sword of the Spirit, which is the word of God' (Ephesians 6:17). The practical lesson: when temptation comes, the defence is not willpower but the Word of God."
    },

    scripture: {
      "3-5": "This is my beloved Son, in whom I am well pleased.\n— Matthew 3:17",
      "6-8": "This is my beloved Son, in whom I am well pleased.\n— Matthew 3:17\n\nMan shall not live by bread alone, but by every word that proceedeth out of the mouth of God.\n— Matthew 4:4\n\nThou shalt worship the Lord thy God, and him only shalt thou serve.\n— Matthew 4:10",
      "9-12": "And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased.\n— Matthew 3:17\n\nIt is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of God.\n— Matthew 4:4\n\nIt is written again, Thou shalt not tempt the Lord thy God.\n— Matthew 4:7\n\nGet thee hence, Satan: for it is written, Thou shalt worship the Lord thy God, and him only shalt thou serve.\n— Matthew 4:10\n\nFor we have not an high priest which cannot be touched with the feeling of our infirmities; but was in all points tempted like as we are, yet without sin.\n— Hebrews 4:15"
    },

    activities: {
      "3-5": "🕊️ Make a dove craft — cut a dove shape from white paper or a paper plate. Add wings by folding white paper in a fan shape and attaching it. Glue or draw an olive branch in its beak. Hang it from a string. Talk about how the Holy Spirit came down like a dove when Jesus was baptised.\n\n🎨 Draw the baptism scene: the River Jordan with Jesus standing in the water, a dove coming down from the sky, and bright light from heaven. Write 'This is my beloved Son!' in the sky in big golden letters.",
      "6-8": "📖 Create a 'Three Temptations' tri-fold poster. Fold a large sheet into three panels. Panel 1: STONES TO BREAD — draw the desert, stones, and Jesus quoting Deuteronomy 8:3. Panel 2: TEMPLE PINNACLE — draw the temple height, the devil quoting Psalm 91, and Jesus quoting Deuteronomy 6:16. Panel 3: KINGDOMS OF THE WORLD — draw mountains with kingdoms, the devil's offer, and Jesus' final command with Deuteronomy 6:13. Under each panel, write what the temptation was really about: comfort, spectacle, power.\n\n🗡️ Make a 'Sword of the Spirit' bookmark. Cut card into a sword shape. On the blade, write the three Bible verses Jesus used (Deuteronomy 8:3, 6:16, 6:13). On the handle, write 'The Sword of the Spirit — Ephesians 6:17.' Decorate it as a real sword with a cross-guard. Use it as your actual Bible bookmark!",
      "9-12": "📖 Create a detailed 'Israel Failed, Jesus Succeeded' parallel study page. Draw two columns: ISRAEL IN THE WILDERNESS (left) and JESUS IN THE WILDERNESS (right). Map three parallels: (1) Hungry — Israel grumbled (Exodus 16) vs. Jesus trusted (Matthew 4:4), (2) Testing God — Israel demanded water at Massah (Exodus 17) vs. Jesus refused to test the Father (Matthew 4:7), (3) Idolatry — Israel made the golden calf (Exodus 32) vs. Jesus worshipped God alone (Matthew 4:10). Add annotations showing that all three of Jesus' answers come from Deuteronomy 6–8. At the bottom, write the thesis: 'Jesus is the faithful Israel, the obedient Son who succeeds where the nation failed.' Make it study-guide quality.\n\n✍️ Write a reflective essay titled 'If Thou Be the Son of God.' Explore how the devil's strategy in each temptation begins with challenging Jesus' identity — the very identity the Father had JUST declared at the baptism. Apply this to the reader's life: how does the enemy try to make us doubt who God says we are? How do we fight back? Use Jesus' method — Scripture, not argument — as the model. Include at least three Bible references and write at least 300 words."
    },

    supplies: "White paper or paper plates, scissors, string, fan-fold paper, markers, crayons, large sheets for tri-fold poster/study page, card stock (for sword bookmark), coloured pencils, journal paper, gold crayons or paint",

    discussionQuestions: [
      "At the baptism, the Father said, 'This is my beloved Son.' At the temptation, the devil said, 'IF you are the Son of God.' Why do you think the enemy targets our IDENTITY? How does he try to make you doubt who God says you are?",
      "Jesus answered every temptation with Scripture — not with arguments or willpower. What does that teach us about the importance of knowing the Bible?",
      "Jesus was tempted in every way we are, yet without sin (Hebrews 4:15). Why is it important that Jesus experienced real temptation? How does that help us when WE are tempted?"
    ],

    reflection: "Today I learned two life-changing things. First: God calls me His beloved child, and that identity can never be taken away. Second: when temptation comes, I don't fight it with willpower — I fight it with the Word of God. Jesus showed me how. Every time the devil challenged Him, Jesus said, 'It is written.' I need to know the Word so I can wield the Word.",

    prayer: "Dear God, thank You for calling me Your beloved child. When the enemy tries to make me doubt who I am, help me to stand firm in what YOU say about me. And when temptation comes, give me the strength to do what Jesus did — to answer with Your Word. Help me to know the Bible so well that it becomes my sword. You are pleased with me through Jesus, and that's enough. Amen.",

    teacherNote: "Matthew 3–4 establishes the theological pattern for Jesus' entire ministry: identity declared, then identity tested. The baptism is Trinitarian (Son baptised, Spirit descends, Father speaks) and combines two OT texts — Psalm 2:7 (royal Son) and Isaiah 42:1 (suffering Servant) — revealing Jesus as both King and sacrifice. The temptation narrative is structured as an Israel-Jesus parallel: 40 days mirrors 40 years, three temptations mirror three failures, and all three responses come from Deuteronomy 6–8. This shows Jesus as the 'true Israel' who obeys where the nation disobeyed. The devil's 'if thou be the Son of God' is critical — it's an identity attack immediately after an identity declaration. For children, this is deeply applicable: the enemy's primary tactic is to make us question what God has said about us. Jesus' response model — Scripture quoted accurately in context, without debate or explanation — is the believer's template for spiritual warfare. For the 9–12 group, Hebrews 4:15 adds pastoral warmth: Jesus was genuinely tempted, not play-acting. His victory is not the victory of someone who couldn't have failed — it's the victory of someone who was truly tested and chose obedience.",

    memoryVerse: "This is my beloved Son, in whom I am well pleased. — Matthew 3:17",
  },

  // ═══════════════════════════════════════════════════
  // WEEKS 41–52 WILL BE APPENDED HERE
  // ═══════════════════════════════════════════════════
  // ═══════════════════════════════════════════════════
  // ═══════════════════════════════════════════════════
  // ═══════════════════════════════════════════════════
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