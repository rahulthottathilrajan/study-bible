// append-term2-teens.cjs
// Appends Term 2 (Weeks 14-26) to TEEN_LESSONS in TeensCurriculumData.js
const fs = require("fs");
const path = require("path");

const TARGET = path.join(__dirname, "../src/app/components/TeensCurriculumData.js");

const TERM2_LESSONS = [

  // ═══════════════════════════════════════════════════
  // WEEK 14 — ABRAHAM: THE CALL TO LEAVE EVERYTHING
  // ═══════════════════════════════════════════════════
  {
    week: 14,
    title: "Abraham: The Call to Leave Everything",
    bibleRef: "Genesis 12:1-9, Hebrews 11:8-10",
    keyVerse: "By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went. — Hebrews 11:8",
    theme: "Faith-Driven Obedience",
    term: "Term 2",
    month: "Apr",
    icon: "🏕️",
    color: "#92400E",

    hook: "God told a 75-year-old man to pack everything he owned, leave his home, his family, his culture, and his country — and go to a land God would show him later. No map. No destination. No guarantee except God's word. Would you go? What would it take for you to trust God that completely?",

    deepDive: {
      passage: "Genesis 12:1-9, Hebrews 11:8-10",
      context: "Abram lived in Ur of the Chaldees — one of the most advanced cities in the ancient world, a centre of commerce, culture, and idol worship. He was 75 years old, wealthy, settled, and embedded in a pagan society that worshipped the moon god Nanna. Then God spoke to him with the most radical invitation in history: 'Get thee out of thy country, and from thy kindred, and from thy father's house, unto a land that I will shew thee.' God did not give him a map or a timeline. He gave him a promise and a command — in that order. The promise was enormous: a great nation, a great name, blessing to all families of the earth. The command was equally enormous: leave everything familiar and walk into the unknown. Hebrews 11:8 records the staggering response: 'he obeyed; and he went out, not knowing whither he went.' This is the definition of faith-driven obedience — acting on God's word before you can see the outcome. Abraham is called the 'father of the faithful' (Romans 4:11) not because he had perfect faith but because he acted on the faith he had. His obedience was not blind — it was informed by his knowledge of who God was. The God who calls always provides. The God who promises always fulfils. Abraham staked everything on that conviction.",
      keyPoints: [
        "God's call came with both command and promise — the command required action before the promise was visible. This is the pattern of faith throughout Scripture.",
        "Abraham left Ur at age 75 — proof that God's call is not limited by age, background, or circumstance. It is never too late to obey.",
        "He 'went out, not knowing whither he went' (Hebrews 11:8) — genuine faith does not require a complete map, only a trustworthy Guide.",
        "The promise to Abraham — 'in thee shall all families of the earth be blessed' — was ultimately fulfilled in Jesus Christ (Galatians 3:8, 3:16).",
        "Abraham built altars at every camp (Genesis 12:7, 8) — worship was his response to God's presence. Obedience and worship are inseparable."
      ],
      obedienceLink: "Abraham's obedience cost him everything familiar — his city, his culture, his comfort zone. True obedience to God rarely leads to a known destination. It leads to a trustworthy God who knows the destination. The question is not 'Where is God taking me?' but 'Is God trustworthy enough to follow?'",
    },

    wordStudy: {
      word: "Lech-lecha",
      original: "לֶךְ-לְךָ",
      transliteration: "lech-lecha",
      strongsNumber: "H3212 / H3212",
      language: "Hebrew",
      definition: "Go — for yourself; go forth; literally 'go, yourself' — an emphatic imperative calling for personal, decisive movement",
      usage: "This phrase opens Genesis 12:1 and is one of the most significant two-word commands in the Hebrew Bible. The reflexive particle 'lecha' (to/for yourself) makes the command intensely personal — God is not sending a messenger or an army, He is calling Abram himself to move. Rabbinical tradition reads this as 'go to your own self' — the journey to Canaan was also a journey inward, a discovery of who Abram was in God.",
      connection: "God's call to Abraham is also His call to every believer. 'Lech-lecha' — go, personally, decisively, from the comfort of what you know, toward the God who knows what you cannot yet see. Every act of obedience is a 'lech-lecha' moment — a personal, non-transferable choice to move when God speaks.",
      relatedVerses: [
        "Genesis 22:2 — The same phrase 'lech-lecha' is used again when God calls Abraham to Mount Moriah. Two defining moments of Abraham's life are marked by the same command.",
        "Matthew 4:19 — 'Follow me' — Jesus uses the same pattern: a personal call demanding a decisive response.",
        "Luke 9:23 — 'If any man will come after me, let him deny himself, and take up his cross daily, and follow me.'"
      ],
    },

    faithStory: {
      title: "The Man Who Left Everything for a Promise",
      narrative: "Imagine Abram on the morning of departure. His servants are loading camels. Sarai is saying goodbye to friends she has known for decades. The city of Ur — with its temples, its markets, its familiar streets — shimmers in the morning heat. Abram is 75 years old. He has built a life here. He has wealth, status, and roots that go deep. And then he walks away from all of it. Not because he saw a vision. Not because an angel appeared with a detailed itinerary. Because God spoke — and Abram believed that the God who spoke was worth obeying. Every single day of the journey was a daily renewal of that decision. When the road stretched into unknown territory, he could have turned back. When Sarai grew tired, he could have made camp permanently. When the land he was promised turned out to be occupied by Canaanites, he could have concluded he had misheard. But he built altars. He worshipped at every stopping point. He kept walking. Hebrews 11 tells us that Abraham looked for 'a city which hath foundations, whose builder and maker is God.' He was not just walking to a land — he was walking toward a God who was big enough to be trusted with everything. And across four thousand years of history, Abraham's obedient walk echoes into every heart that has ever heard God's call and had to choose between comfort and faith.",
      moralLesson: "The call to follow God always costs something. It cost Abraham his homeland. It may cost you your popularity, your plans, your comfort zone, or your certainty about the future. But what you gain is infinitely greater than what you leave behind — because you gain the presence of the God who called you.",
    },

    prophecyConnection: {
      title: "Abraham's Seed — The Messiah",
      otRef: "Genesis 12:3",
      otText: "And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.",
      ntRef: "Galatians 3:8, 3:16",
      ntText: "And the scripture, foreseeing that God would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed... Now to Abraham and his seed were the promises made. He saith not, And to seeds, as of many; but as of one, And to thy seed, which is Christ.",
      explanation: "The promise God made to Abraham in Genesis 12:3 — 'in thee shall all families of the earth be blessed' — was not primarily about Abraham's physical descendants. Paul reveals in Galatians 3 that 'seed' is singular, pointing to one specific descendant: Jesus Christ. The gospel was preached to Abraham 2,000 years before Calvary. Every nation on earth has been blessed through Abraham's obedience — because that obedience set the lineage that would bring the Saviour into the world.",
      status: "Literal Fulfilment — Jesus Christ",
    },

    thinkDeeper: {
      question: "Is it irrational to obey a God you cannot see, going to a place you don't know, based on a promise you haven't yet received?",
      challenge: "A classmate says: 'I only do what makes sense to me. Following God blindly sounds like a cult.' How would you explain the difference between blind obedience and faith-driven trust?",
      hints: [
        "Abraham's faith was not blind — it was based on evidence. God had already spoken to him (Acts 7:2). Obedience is not irrational when the One giving the command has already proven His character.",
        "We trust doctors without understanding every medication, engineers without understanding every bridge calculation, pilots without understanding aerodynamics. Trust based on proven expertise is rational — not blind.",
        "The greatest risk Abraham could have taken was to stay in Ur. Disobeying God meant missing everything God had planned. Sometimes the riskiest choice is the safest one."
      ],
      conclusion: "Faith-driven obedience is not irrational — it is trust based on the character of God. Abraham had already encountered the living God. He was not following a rumour — he was obeying a Person he had come to know. The more you know God, the more rational obedience becomes.",
    },

    discussionQuestions: [
      "Abraham left everything to follow God. What is one thing God might be asking you to leave behind — a habit, a relationship, an attitude — that is holding you back from fully following Him?",
      "God's promise to Abraham came before the details. Is there an area of your life where God is asking you to trust His promise before you can see His plan?",
      "Why do you think God chose a 75-year-old man to start a nation? What does this tell you about how God measures readiness?",
      "Abraham built altars of worship everywhere he camped. What is your personal habit of worship? Do you stop to acknowledge God in your daily journey?"
    ],

    journalPrompt: {
      prompt: "Write about one specific area of your life where God is calling you to 'lech-lecha' — to leave something behind and step into the unknown with Him. What are you afraid of leaving? What do you believe God is promising if you obey?",
      reflection: "Abraham obeyed without knowing where he was going. I do not need to know the full plan — I need to know the One with the plan. Today I choose to trust the God who calls over the comfort of what I already know.",
    },

    memoryVerse: "By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went. — Hebrews 11:8",
    closingPrayer: "Father Abraham's God — You are the same yesterday, today, and forever. You called Abraham out of Ur and into Your purpose, and You are calling me out of my comfort zone into Your plan. Give me the courage to obey Your voice even when I cannot see the destination. Help me to trust Your character more than I trust my own understanding. In Jesus' name, Amen.",

    leaderNote: "Term 2 opens with the greatest model of obedient faith in the Old Testament. Set the tone clearly: this term is not about learning facts about heroes — it is about being formed by their example. The word 'lech-lecha' is a powerful devotional anchor; consider writing it on the board and returning to it throughout the term. Key application: ask teens to identify their own 'Ur' — the comfortable, familiar thing that keeps them from fully obeying God. This is deeply personal and should be handled with pastoral sensitivity.",
  },

  // ═══════════════════════════════════════════════════
  // WEEK 15 — ABRAHAM & ISAAC: THE ULTIMATE TEST
  // ═══════════════════════════════════════════════════
  {
    week: 15,
    title: "Abraham & Isaac: The Ultimate Test",
    bibleRef: "Genesis 22:1-19, Hebrews 11:17-19",
    keyVerse: "And he said, Take now thy son, thine only son Isaac, whom thou lovest, and get thee into the land of Moriah; and offer him there for a burnt offering. — Genesis 22:2",
    theme: "Obedience at Any Cost",
    term: "Term 2",
    month: "Apr",
    icon: "🔥",
    color: "#B45309",

    hook: "God asked Abraham to do the one thing that seemed to contradict everything God had ever promised him. Sacrifice Isaac — the miracle son, the child of the covenant, the only hope for the nation God had sworn to build. How do you obey a command that seems to cancel all of God's other promises?",

    deepDive: {
      passage: "Genesis 22:1-19, Hebrews 11:17-19",
      context: "Genesis 22 is considered one of the most theologically profound and emotionally intense passages in all of Scripture. Abraham is now an old man. Isaac — the miracle son born to a 100-year-old father and 90-year-old mother — is the fulfilment of God's decades-long promise. And then God speaks again, this time with a command that shatters everything: 'Take now thy son, thine only son Isaac, whom thou lovest... and offer him there for a burnt offering.' The text makes no attempt to soften this. God calls Isaac 'thine only son... whom thou lovest.' He knows exactly what He is asking. The test was real. The obedience required was total. What is remarkable is Abraham's response: he rose up early the next morning and began the journey. He did not argue, delay, negotiate, or seek counsel. Hebrews 11:19 reveals the key to his obedience: 'Accounting that God was able to raise him up, even from the dead.' Abraham had so deeply internalized the faithfulness of God that he believed God could fulfil His promises even through resurrection if necessary. He trusted God's character more than he understood God's plan. At the crucial moment, God stopped him, provided a ram caught in the thicket, and named the place 'Jehovah-Jireh' — the LORD will provide. This event is not only the supreme test of Abraham's faith; it is also the supreme prophetic picture of the Father offering His own Son on a cross on that same mountain range two millennia later.",
      keyPoints: [
        "The test was designed to reveal what was in Abraham's heart — not to inform God, who already knew. God tests to strengthen, not to discover.",
        "Abraham's early morning obedience (Genesis 22:3) is significant: he did not wait, deliberate, or delay. Prompt obedience is a mark of genuine faith.",
        "Isaac carrying the wood up the mountain is a direct type of Christ carrying His cross to Golgotha — on the same mountain range (Moriah / Jerusalem).",
        "The ram 'caught in a thicket' — thorns on its head — is another type of Christ, the substitute sacrifice who bore the crown of thorns in our place.",
        "Jehovah-Jireh (the LORD will provide) is not just a historical statement — it is a theological promise for every believer facing impossible circumstances."
      ],
      obedienceLink: "Abraham passed the ultimate test of obedience because his trust in God's character was greater than his love for the gift God had given him. He loved God more than he loved what God had given him. This is the test every believer must eventually face: will you love the Giver more than the gift?",
    },

    wordStudy: {
      word: "Nisah",
      original: "נִסָּה",
      transliteration: "nisah",
      strongsNumber: "H5254",
      language: "Hebrew",
      definition: "To test, to try, to prove — used of God testing His people to strengthen and reveal their faith",
      usage: "Genesis 22:1 opens with 'God did tempt (nisah) Abraham' — but the KJV word 'tempt' here carries the meaning of 'test' or 'prove,' not temptation to sin (James 1:13 makes clear God does not tempt to evil). The same root is used in Exodus 20:20 when Moses tells Israel God tests them 'that his fear may be before your faces, that ye sin not.' God's tests are designed to build what they test — like a trainer who pushes an athlete to develop strength.",
      connection: "Every trial you face as a believer is a 'nisah' — not a punishment, not an accident, but a proving ground that strengthens your faith and reveals what is truly in your heart. James 1:3 confirms: 'the trying of your faith worketh patience.' God tested Abraham at 100 years old — He will test you too. The question is not if but whether you will trust His character through it.",
      relatedVerses: [
        "Exodus 20:20 — 'God is come to prove (nisah) you, that his fear may be before your faces, that ye sin not.'",
        "James 1:2-3 — 'Count it all joy when ye fall into divers temptations; knowing this, that the trying of your faith worketh patience.'",
        "1 Peter 1:7 — 'That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Jesus Christ.'"
      ],
    },

    faithStory: {
      title: "The Father Who Let Go",
      narrative: "Three days. That is how long Abraham walked toward Mount Moriah knowing what God had asked him to do. Three days to think. Three days to remember Isaac's first laugh, his first steps, the impossible morning when Sarah held him for the first time. Three days to wrestle with a command that made no human sense. And yet he kept walking. When they arrived at the foot of the mountain, Abraham told his servants: 'Abide ye here with the ass; and I and the lad will go yonder and worship, and come again to you.' Notice: 'we will come again.' Abraham spoke resurrection faith before he even reached the altar. He did not know how — but he knew the God who could. As they climbed, Isaac asked the question that must have pierced Abraham's heart like a blade: 'Behold the fire and the wood: but where is the lamb for a burnt offering?' Abraham answered with words that echo through four thousand years of history: 'My son, God will provide himself a lamb.' He did not know he was prophesying. He did not know that two thousand years later, on that same mountain range, God the Father would watch His own Son carry wood up a hill — and this time, He would not stop the knife. He would let it fall. Because the ram that was provided for Isaac was only a shadow. The real Lamb was still coming.",
      moralLesson: "The deepest test of obedience is not whether you will follow God when things make sense — it is whether you will trust Him when they don't. Abraham trusted God's character when he could not understand God's plan. That is the faith that moves mountains.",
    },

    prophecyConnection: {
      title: "The Ram and the Lamb of God",
      otRef: "Genesis 22:8, 22:13-14",
      otText: "Abraham said, My son, God will provide himself a lamb for a burnt offering... And Abraham lifted up his eyes, and looked, and behold behind him a ram caught in a thicket by his horns: and Abraham went and took the ram, and offered him up for a burnt offering in the stead of his son.",
      ntRef: "John 1:29, Romans 8:32",
      ntText: "The next day John seeth Jesus coming unto him, and saith, Behold the Lamb of God, which taketh away the sin of the world. / He that spared not his own Son, but delivered him up for us all, how shall he not with him also freely give us all things?",
      explanation: "Genesis 22 is one of the most detailed prophetic types in all of Scripture. Isaac = the beloved son freely offered. The ram = the substitute sacrifice. Mount Moriah = the mountain where Solomon later built the Temple, and where Jerusalem stands — the city where Jesus was crucified. The thorns of the thicket = the crown of thorns. Abraham's words 'God will provide himself a lamb' were not just comfort to Isaac — they were prophecy. God provided the ram as a shadow and His own Son as the reality. Romans 8:32 echoes Genesis 22:16 almost word for word: the God who 'spared not his own Son' is the same God who accepted Abraham's offering on that mountain.",
      status: "Prophetic Type — Fulfilled in Jesus Christ at Calvary",
    },

    thinkDeeper: {
      question: "How could a good God ask a father to kill his own son? Isn't that immoral?",
      challenge: "An atheist says: 'The God of Genesis 22 is a monster — He asked a man to murder his child. I could never worship a God like that.' How would you respond?",
      hints: [
        "God stopped Abraham before Isaac was harmed (Genesis 22:12). God never intended Isaac to die — He intended Abraham's heart to be revealed. The test was real; the execution was not.",
        "God was not asking Abraham to do something He Himself would not do. The Father did not stop the knife when His own Son hung on the cross. Genesis 22 is not the story of divine cruelty — it is the story of divine foreshadowing.",
        "Context matters: God had already demonstrated His character through decades of covenant faithfulness. Abraham was not obeying a stranger — he was obeying a God whose track record was perfect."
      ],
      conclusion: "Genesis 22 is not evidence of divine cruelty — it is the greatest prophetic preview of divine love in the entire Old Testament. The God who tested Abraham with his son is the same God who gave His own Son without restraint. Understanding the cross transforms how we read this story.",
    },

    discussionQuestions: [
      "What is your 'Isaac' — the gift God has given you that you love so much it could become more important to you than God Himself?",
      "Abraham rose 'early in the morning' to obey (v.3). What does prompt, unhesitating obedience look like in your daily life? Where do you tend to delay?",
      "Hebrews 11:19 says Abraham 'accounted that God was able to raise him from the dead.' How does your belief in God's power affect your willingness to obey difficult commands?",
      "Isaac trusted his father even when he was bound and laid on the altar (he was old enough to resist). What does this tell us about the relationship between trust and obedience?"
    ],

    journalPrompt: {
      prompt: "Is there something God is asking you to 'lay on the altar' — surrender fully to Him, even though it is precious to you? Write honestly about what it is and what is holding you back from surrender. Then write a prayer of release.",
      reflection: "Abraham loved Isaac more than anything in the world — except God. The test revealed where his ultimate loyalty lay. I want my ultimate loyalty to be to God, not to His gifts. Today I am choosing to hold loosely the things I love most.",
    },

    memoryVerse: "By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son. — Hebrews 11:17",
    closingPrayer: "Jehovah-Jireh — the God who provides. You tested Abraham and found him faithful. You tested him with the thing he loved most, and his love for You was greater. I want that kind of love. Teach me to hold loosely the gifts You have given me and to love the Giver above all. And thank You — that on Mount Calvary, You did not stop the knife. You gave Your Son for me. I will not waste that love. Amen.",

    leaderNote: "This is one of the most emotionally charged lessons of the year. Handle it with care. The key theological insight is the prophetic type: Isaac/ram/Moriah pointing to Christ/Cross/Jerusalem. Help teens see that this is not a story of cruelty but of substitution. The personal application — 'What is your Isaac?' — is powerful but vulnerable. Create a safe space. The journal prompt of surrender is significant; consider giving teens time to write in silence before closing prayer. Note: Hebrews 11:19 is the key interpretive verse — Abraham expected resurrection. He was not acting blindly but with profound theological conviction.",
  },

  // ═══════════════════════════════════════════════════
  // WEEK 16 — JOSEPH: OBEDIENT IN SUFFERING
  // ═══════════════════════════════════════════════════
  {
    week: 16,
    title: "Joseph: Obedient in Suffering",
    bibleRef: "Genesis 37:1-28, Genesis 39:1-23",
    keyVerse: "And the LORD was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian. — Genesis 39:2",
    theme: "Integrity Under Pressure",
    term: "Term 2",
    month: "Apr",
    icon: "⛓️",
    color: "#1D4ED8",

    hook: "Your brothers hate you. They strip your coat off your back, throw you in a pit, and sell you into slavery. Then your boss's wife lies about you and you go to prison for something you didn't do. At what point do you decide God has abandoned you — or do you keep obeying anyway?",

    deepDive: {
      passage: "Genesis 37:1-28, Genesis 39:1-23",
      context: "Joseph's story is one of the most complete character studies in the Bible — a 13-year journey from favoured son to slave to prisoner before a single promise was fulfilled. Joseph was the eleventh of twelve sons of Jacob, the favourite child, gifted with prophetic dreams that showed his brothers bowing before him. His brothers' jealousy curdled into hatred, and at age 17, he was stripped of his coat of many colours, thrown into a pit, and sold to Ishmaelite traders for twenty pieces of silver. Taken to Egypt, he was purchased by Potiphar, a high official in Pharaoh's court. In Potiphar's house, Genesis 39 records one of the most important phrases in Joseph's story: 'And the LORD was with Joseph.' This phrase appears four times across chapters 39-41. The Lord was with Joseph in slavery. The Lord was with Joseph in prison. The Lord was with Joseph at the lowest point of his life. Joseph did not experience God's presence as a reward for easy obedience — he experienced it as a companion through unjust suffering. When Potiphar's wife falsely accused him of assault and he was thrown into prison, Joseph could have responded with bitterness, compromise, or revenge. Instead, he remained faithful. He maintained his integrity when it cost him everything. This is not passive endurance — it is active, disciplined obedience to God's character when obedience brings suffering rather than reward.",
      keyPoints: [
        "'The LORD was with Joseph' (Genesis 39:2, 3, 21, 23) — God's presence is not a guarantee of comfort; it is a promise of companionship through every season, including the worst ones.",
        "Joseph refused Potiphar's wife with a theological argument: 'How then can I do this great wickedness, and sin against God?' (39:9). He did not say 'I might get caught' — he said 'I would be sinning against God.' His morality was God-centred, not circumstance-driven.",
        "Joseph's suffering was a series of injustices he did not deserve — sold by his brothers, falsely accused by Potiphar's wife, forgotten by the cupbearer. Yet at no point does Scripture record him becoming bitter or abandoning his integrity.",
        "Every low point in Joseph's life was a stepping stone God was using to position him for the next stage of the plan. The pit led to Potiphar's house. Potiphar's house led to prison. Prison led to Pharaoh.",
        "Obedience in suffering is more powerful than obedience in success — because it demonstrates that your faith is not transactional. You are not obeying for reward; you are obeying because God is worthy."
      ],
      obedienceLink: "Joseph obeyed God's moral standard when disobedience would have been easier, more comfortable, and unreported. He shows us that obedience is not about what you can get away with — it is about who you are when no one is watching except God.",
    },

    wordStudy: {
      word: "Tsadiq",
      original: "צַדִּיק",
      transliteration: "tsadiq",
      strongsNumber: "H6662",
      language: "Hebrew",
      definition: "Righteous, just, one who is in right standing — a person whose character and conduct conform to God's standard",
      usage: "Though the word tsadiq is not directly applied to Joseph in Genesis 39, his conduct perfectly embodies it. The righteous person in Hebrew thought was not someone with a perfect record but someone who maintained covenant faithfulness — to God, to their employer, to their community — regardless of personal cost. Joseph's refusal of Potiphar's wife was a tsadiq moment: choosing God's standard over personal pleasure, opportunity, or safety.",
      connection: "In a culture that defines 'righteous' as 'a good person by general standards,' the Hebrew tsadiq demands more — conformity to God's revealed character and commands. Joseph was tsadiq not because life was easy but because his commitment to God's standard did not flex under pressure. Proverbs 24:16 says 'a just man (tsadiq) falleth seven times, and riseth up again.' Righteousness is not the absence of falling — it is the refusal to stay down.",
      relatedVerses: [
        "Proverbs 11:3 — 'The integrity of the upright shall guide them: but the perverseness of transgressors shall destroy them.'",
        "Psalm 37:25 — 'I have been young, and now am old; yet have I not seen the righteous forsaken, nor his seed begging bread.'",
        "Matthew 5:10 — 'Blessed are they which are persecuted for righteousness' sake: for theirs is the kingdom of heaven.'"
      ],
    },

    faithStory: {
      title: "The Boy Who Kept His Integrity",
      narrative: "Seventeen years old. Foreign slave. Standing in an Egyptian household, having lost his home, his family, his language, and his freedom. Most people in Joseph's position would have concluded that God's promises were lies and that integrity was a luxury only the free could afford. Joseph concluded the opposite. He worked so faithfully for Potiphar that the Egyptian handed over his entire household to him without oversight. Every single day in Potiphar's house was a choice: to embitter, or to serve. To collapse inward, or to grow outward. Then came the test that cost him everything he had built. Potiphar's wife saw Joseph — a young man who was 'well-favoured and goodly to look to' — and she wanted him. Day after day she propositioned him. Day after day he refused. And then came the day she grabbed his garment, and he ran — leaving the garment in her hand. Running from sin cost him his position, his reputation, and his freedom. He went from the head of a wealthy household to the floor of a prison cell on the word of a liar. And the text says: 'the LORD was with Joseph.' Not 'despite the injustice.' Not 'eventually, after he recovered.' Now. In the prison. In the dark. The presence of God did not depend on the justice of Joseph's circumstances. It depended on the faithfulness of God's character.",
      moralLesson: "When obedience to God costs you something in this world, it always gains you something more valuable — the presence of God and the formation of a character that circumstances cannot steal. Joseph lost his coat twice and his freedom twice — and gained a soul that no prison could contain.",
    },

    prophecyConnection: {
      title: "Joseph — A Type of the Rejected and Exalted Christ",
      otRef: "Genesis 37:28, 39:20",
      otText: "Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmaelites for twenty pieces of silver... And Joseph's master took him, and put him into the prison.",
      ntRef: "Matthew 27:3-5, Acts 2:23-24",
      ntText: "Then Judas, which had betrayed him, when he saw that he was condemned, repented himself, and brought again the thirty pieces of silver to the chief priests... / Him, being delivered by the determinate counsel and foreknowledge of God, ye have taken, and by wicked hands have crucified and slain: Whom God hath raised up.",
      explanation: "Joseph is one of the most complete types of Christ in the Old Testament: beloved son of his father, rejected and betrayed by his brothers, sold for pieces of silver, falsely accused, imprisoned with two others (one saved, one condemned), and ultimately exalted to the highest position. As Jesus was betrayed for thirty pieces of silver by Judas and falsely condemned, Joseph was sold for twenty pieces of silver and falsely accused. Both were raised from their lowest point to the position of saviour — Joseph to save Egypt and his family from famine; Jesus to save the world from sin.",
      status: "Prophetic Type — Fulfilled in Jesus Christ",
    },

    thinkDeeper: {
      question: "If God was truly with Joseph, why did he go from a pit to slavery to prison? Why doesn't God protect His people from suffering?",
      challenge: "A friend going through a hard time says: 'If God is real and loves me, why is He letting this happen?' How would you answer from Joseph's story?",
      hints: [
        "God's presence is not the same as God's protection from all hardship. Joseph was with God in the pit, in slavery, and in prison — each of which was a stage God was using for a purpose Joseph could not yet see.",
        "Suffering in the Bible is rarely explained as punishment. It is often described as preparation. Romans 8:28 — 'all things work together for good to them that love God.' Not some things. All things.",
        "The alternative — a life of comfort with no trials — produces a character that has never been tested. Gold that has never been through fire is not yet proven gold. God's goal is not our comfort but our character."
      ],
      conclusion: "God does not waste suffering. Joseph's pit, prison, and unjust accusations were not detours from God's plan — they were the road map of God's plan. The question is not 'Why is this happening?' but 'What is God building in me through this?'",
    },

    discussionQuestions: [
      "Joseph maintained integrity when no one was watching and when the consequences of integrity were unjust. What area of your life looks different when you think no one is watching?",
      "Joseph refused Potiphar's wife because sin against his master would be 'sin against God.' How does viewing sin as primarily against God change how you think about your choices?",
      "Have you ever experienced a time when doing the right thing made things worse, not better? How did you respond? How would you respond differently now?",
      "'The LORD was with Joseph' — in the pit, in slavery, in prison. What does God's presence mean to you in your own hard seasons? Is it enough?"
    ],

    journalPrompt: {
      prompt: "Write about a time when you were treated unfairly or when doing the right thing seemed to backfire. Looking back, can you see any way God was present in that situation? What would you say to your younger self in that moment?",
      reflection: "Joseph did not know the end of the story while he was living in chapter 39. Neither do I. But God does. Today I choose to trust that 'the LORD is with me' — even in my prison, even in my pit — and that He is working a plan I cannot yet see.",
    },

    memoryVerse: "And the LORD was with Joseph, and he was a prosperous man; and he was in the house of his master the Egyptian. — Genesis 39:2",
    closingPrayer: "Lord, I don't always understand why hard things happen to faithful people. I see it in Joseph's story. I sometimes feel it in my own. But Joseph's story shows me that Your presence is not a promise of ease — it is a promise of company through everything. Help me to maintain integrity when it costs me. Help me to trust You in the pit. And help me to remember that You are working a plan that my present circumstances cannot cancel. Amen.",

    leaderNote: "This lesson is deeply personal for teens who have experienced injustice, family dysfunction, or suffering they did not deserve. Approach with pastoral sensitivity. The key truth: God's presence ≠ God's protection from all hardship. Joseph was 'with God' in his worst moments. The faith story deliberately centres on the prison — make sure teens do not spiritually fast-forward to Genesis 45 (next week). The formation of Joseph's character happened in the dark years. This week is about building a theology of suffering before celebrating the victory.",
  },

  // ═══════════════════════════════════════════════════
  // WEEK 17 — JOSEPH: GOD'S SOVEREIGN PLAN
  // ═══════════════════════════════════════════════════
  {
    week: 17,
    title: "Joseph: God's Sovereign Plan",
    bibleRef: "Genesis 45:1-15, Genesis 50:19-21",
    keyVerse: "But as for you, ye thought evil against me; but God meant it unto good, to bring to pass, as it is this day, to save much people alive. — Genesis 50:20",
    theme: "Forgiveness & Sovereignty",
    term: "Term 2",
    month: "Apr",
    icon: "👑",
    color: "#7C3AED",

    hook: "The brothers who sold you into slavery are now bowing at your feet — and you have the power to destroy them. Would you? Joseph had every human reason to take revenge. Instead, he said five words that changed everything: 'God meant it unto good.' How do you get to a place where you can say that about the worst thing that ever happened to you?",

    deepDive: {
      passage: "Genesis 45:1-15, Genesis 50:19-21",
      context: "After 13 years of slavery and imprisonment, Joseph was suddenly elevated from prison to Prime Minister of Egypt in a single day — second only to Pharaoh. The famine he had predicted brought his brothers to Egypt seeking grain. They stood before him, not recognising the teenager they had sold, now a powerful ruler. Joseph had three tests to determine whether his brothers had changed before he revealed himself. When he finally did, the emotion was so intense that he wept so loudly the Egyptians outside heard it. His words are among the most remarkable in Scripture: 'I am Joseph your brother, whom ye sold into Egypt. Now therefore be not grieved, nor angry with yourselves, for God did send me before you to preserve life.' This is not denial of what happened — he names it plainly: 'whom ye sold.' It is not minimisation — the suffering was real. It is a theological reinterpretation of events through the lens of divine sovereignty. Joseph had come to understand something that would have destroyed lesser people: God's sovereignty operates through human sin without endorsing it. The brothers were guilty. Their actions were evil. And God used it all to place exactly the right person in exactly the right position at exactly the right moment to save millions of lives. Genesis 50:20 — spoken after Jacob died and the brothers feared revenge — is the pinnacle: 'Ye thought evil against me; but God meant it unto good.' Human intention and divine intention are both real. Both are named. And God's intention overrides without cancelling human responsibility.",
      keyPoints: [
        "Sovereignty and human responsibility coexist in Genesis 50:20 — 'ye meant evil' (human responsibility) 'but God meant it unto good' (divine sovereignty). Both are true simultaneously.",
        "Joseph's forgiveness was not conditioned on his brothers' repentance — he forgave before they expressed remorse. This is grace that mirrors the gospel.",
        "Joseph identified God as the author of his journey: 'God did send me before you' (45:7). He did not see 13 years of suffering as random — he saw divine purpose threading through every dark chapter.",
        "The word 'preserve' (45:7 — 'to save your lives by a great deliverance') anticipates the greatest preservation in history: the salvation of humanity through Christ.",
        "Forgiveness freed Joseph — not his brothers. Bitterness would have imprisoned him more securely than Potiphar's dungeon ever did."
      ],
      obedienceLink: "Joseph's obedience to God's moral standard through 13 years of suffering was the preparation for his moment of supreme influence. You cannot shortcut the formation process. The character built in the hidden years is the character deployed in the public years.",
    },

    wordStudy: {
      word: "Chashab",
      original: "חָשַׁב",
      transliteration: "chashab",
      strongsNumber: "H2803",
      language: "Hebrew",
      definition: "To think, to plan, to devise, to reckon, to count — implies intentional design and careful calculation",
      usage: "Genesis 50:20 uses this word twice: the brothers 'thought' (chashab) evil, but God 'thought' (chashab) it unto good. The same Hebrew word for human scheming is used for divine planning — showing that God's sovereign intention and human sinful intention can operate on the same events simultaneously. This is not a comfortable truth — it is a profound one.",
      connection: "God is not reacting to your circumstances. He is planning through them. The same word used for the brothers' evil scheming is used for God's redemptive purpose. Your lowest moments are not outside God's plan — they are inside it. Jeremiah 29:11 uses a related concept: 'I know the thoughts (chashab) I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end.'",
      relatedVerses: [
        "Jeremiah 29:11 — 'For I know the thoughts (chashab) that I think toward you, saith the LORD, thoughts of peace, and not of evil.'",
        "Romans 8:28 — 'And we know that all things work together for good to them that love God, to them who are the called according to his purpose.'",
        "Isaiah 46:10 — 'Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure.'"
      ],
    },

    faithStory: {
      title: "The Moment the Story Made Sense",
      narrative: "There came a moment when Joseph saw everything from above. Not literally — but theologically. He saw the pit, and he saw Pharaoh's palace. He saw the slave market, and he saw the prison, and he saw the throne. He saw his brothers' treachery, and he saw two years of famine still ahead, and seven years of plenty already stored. And in that moment, the jagged, broken, agonising pieces of his story assembled themselves into a mosaic — and he saw that every piece had been placed by a hand that never dropped one. The evil his brothers did was real. Their guilt was real. The pain of each chapter was real. But so was God's design threaded through every scene. Joseph wept — not from weakness but from the overwhelming recognition that a God who loves with that kind of sovereign intentionality is a God worth every ounce of trust. And then he said the most grace-saturated words in all of Genesis: 'Now therefore be not grieved, nor angry with yourselves.' He was releasing his brothers not because they deserved it but because he had seen enough of God's sovereignty to know that bitterness was a waste of the life God had preserved. Forgiveness was not weakness — it was the fruit of a man who had learned, through 13 years of darkness, that God's plan is bigger than human sin.",
      moralLesson: "You may not be able to rewrite the painful chapters of your story — but you can choose how to interpret them. Joseph's choice to trust God's sovereignty over his suffering was not naive optimism. It was informed, battle-tested faith. When you can say 'God meant it for good,' you are not minimising the pain — you are maximising the God who redeems it.",
    },

    prophecyConnection: {
      title: "The Rejected Brother Who Became the Saviour",
      otRef: "Genesis 45:4-7",
      otText: "And Joseph said unto his brethren, Come near to me, I pray you. And they came near. And he said, I am Joseph your brother, whom ye sold into Egypt. Now therefore be not grieved, nor angry with yourselves, for God did send me before you to preserve life.",
      ntRef: "Acts 7:9-10, Acts 2:36-38",
      ntText: "And the patriarchs, moved with envy, sold Joseph into Egypt: but God was with him, And delivered him out of all his afflictions, and gave him favour and wisdom in the sight of Pharaoh king of Egypt; and he made him governor over Egypt and all his house. / Therefore let all the house of Israel know assuredly, that God hath made that same Jesus, whom ye have crucified, both Lord and Christ.",
      explanation: "Stephen's sermon in Acts 7 explicitly identifies Joseph as a type of Christ: the beloved son rejected by his brothers who became the saviour of the very people who rejected him. As Joseph revealed himself to his brothers and said 'I am Joseph,' Jesus will one day be revealed to a world that rejected Him. As Joseph's brothers asked 'What shall we do?' and were met with forgiveness, so on Pentecost Peter's hearers asked 'What shall we do?' — and were met with the forgiveness of Christ. The pattern is unmistakable. The God who worked through Joseph's suffering is the same God who worked through the Cross.",
      status: "Prophetic Type — Fulfilled in Jesus Christ",
    },

    thinkDeeper: {
      question: "If God is sovereign over evil, does that make Him responsible for it? And if He can bring good from evil — why allow the evil in the first place?",
      challenge: "A friend says: 'If God is in control of everything, then He caused my abuse/suffering. I can't forgive a God like that.' How would you respond?",
      hints: [
        "Genesis 50:20 clearly distinguishes between human intention (evil) and divine intention (good). God did not cause the brothers' sin — He overruled it. There is a difference between sovereignty and authorship.",
        "God's sovereignty does not remove human freedom or responsibility. The brothers were guilty. God used their sin for good — He did not approve of their sin. A judge can use a criminal's testimony to solve a case without approving the crime.",
        "The question 'Why allow evil?' has no complete answer this side of eternity — but the Cross gives us a partial one. God did not stand at a safe distance from suffering. He entered it, at the cost of His Son."
      ],
      conclusion: "God's sovereignty over suffering is not an explanation — it is a comfort. We may not understand why. But we can trust the character of the God who entered suffering Himself. Joseph could not explain chapter 37 while he lived in chapter 39. But looking back from chapter 45, he could see God's hand on every page.",
    },

    discussionQuestions: [
      "Joseph forgave his brothers before they expressed remorse. Is there someone in your life who has wronged you whom you need to forgive — regardless of whether they have apologised?",
      "Joseph saw God's sovereign hand even in the evil done to him. Is there a painful chapter of your story that you can begin to view through the lens of God's purpose — not minimising the pain, but trusting the Planner?",
      "How does Genesis 50:20 change the way you pray about difficult circumstances? Instead of asking 'Why is this happening?' what better question could you ask?",
      "Joseph's integrity during the hidden years prepared him for his public moment of influence. What character is God building in you in your 'hidden years' right now?"
    ],

    journalPrompt: {
      prompt: "Write the 'Genesis 50:20' statement over the hardest chapter of your life so far: '[Name of person/event] meant it for evil, but God is meaning it for good, to accomplish [what you can see or imagine].' If you can't fill in the last blank yet, write: 'I don't know yet what God is accomplishing — but I trust that He is.'",
      reflection: "I may be in chapter 39 of my story right now. But God is already writing chapter 45. He sees the end from the beginning. I choose to trust the Author even when I cannot see the next page.",
    },

    memoryVerse: "But as for you, ye thought evil against me; but God meant it unto good, to bring to pass, as it is this day, to save much people alive. — Genesis 50:20",
    closingPrayer: "Sovereign God — You are not surprised by anything that has happened to me. You knew every painful chapter before I lived it. Like Joseph, I choose today to trust Your sovereign goodness over my own limited understanding. Teach me to forgive as Joseph forgave — freely, fully, not because the wrong was small, but because Your grace is large. And help me to see Your hand working in the hard places of my life, bringing good from what was meant for evil. Amen.",

    leaderNote: "This lesson pairs with Week 16 to complete Joseph's story. The key theological tension is sovereignty vs. human responsibility — Genesis 50:20 holds both without resolving the tension into easy answers. Do not try to explain God's sovereignty away or minimise it. Lean into the mystery. The most powerful application is the forgiveness invitation — many teens carry real wounds from real people. The journal prompt is designed to be transformative but must be introduced with care. Consider allowing extended silent writing time. The connection to Acts 7 (Stephen's sermon) plants the seed for how to read the OT as pointing to Christ.",
  },

  // ═══════════════════════════════════════════════════
  // WEEK 18 — MOSES: EXCUSES VS. GOD'S CALL
  // ═══════════════════════════════════════════════════
  {
    week: 18,
    title: "Moses: Excuses vs. God's Call",
    bibleRef: "Exodus 3:1-4:17, Hebrews 11:24-27",
    keyVerse: "Come now therefore, and I will send thee unto Pharaoh, that thou mayest bring forth my people the children of Israel out of Egypt. — Exodus 3:10",
    theme: "Answering God's Call",
    term: "Term 2",
    month: "May",
    icon: "🔥",
    color: "#DC2626",

    hook: "God appeared to Moses in a burning bush and gave him the most important mission in Israelite history. Moses' response? Five excuses in a row. 'Who am I? What shall I say? What if they don't believe me? I can't speak well. Send someone else.' Sound familiar? When God calls you, what excuses do you make?",

    deepDive: {
      passage: "Exodus 3:1-4:17, Hebrews 11:24-27",
      context: "Moses' encounter at the burning bush is one of the most dramatic theophanies — divine appearances — in all of Scripture. Moses was 80 years old, a fugitive shepherd in Midian, having fled Egypt 40 years earlier after killing an Egyptian and being rejected by his own people. He was not seeking a mission. He was tending sheep. And suddenly a bush burns but is not consumed, a voice calls his name, holy ground is established, and God reveals His eternal name: I AM THAT I AM. The mission was staggering: return to Egypt, confront the most powerful ruler in the world, and lead two million enslaved Israelites to freedom. And Moses — who had grown up in Pharaoh's palace, been educated in the finest schools of Egypt, and was described as 'mighty in words and in deeds' (Acts 7:22) — offered five consecutive excuses for why he was not the right man. Each excuse reveals a common human failure: prioritising self-assessment over God's assessment. The pattern of Moses' excuses is instructive: 'Who am I?' (identity objection), 'What shall I say?' (knowledge objection), 'What if they don't believe me?' (credibility objection), 'I am not eloquent' (ability objection), 'Send someone else' (willingness objection). God answered every single one. His answer to all five was essentially the same: I will be with you. The sufficiency of God does not depend on the suitability of the person — it depends on the presence of God with the person.",
      keyPoints: [
        "God does not call the equipped — He equips the called. Moses' self-assessed inadequacy was real. God's sufficiency was more real.",
        "The burning bush — fire that consumed without destroying — was a picture of God's holy presence among His people. His holiness does not destroy those He calls; it commissions them.",
        "'I AM THAT I AM' (YHWH — Yahweh) is God's covenant name — the eternally self-existent One. He who IS cannot fail to fulfil what He has promised.",
        "Hebrews 11:24-27 reveals the faith behind Moses' eventual obedience: 'he endured, as seeing him who is invisible.' His faith was in a God he could not fully see.",
        "God's anger at Moses' final excuse (4:14) is significant — persistent excuse-making in the face of God's call is not humility. It is disobedience dressed as humility."
      ],
      obedienceLink: "Every excuse Moses made was really a statement about himself. Every answer God gave was a statement about God. The call to obedience is always an invitation to stop looking at yourself and start looking at the One who called you.",
    },

    wordStudy: {
      word: "Ehyeh",
      original: "אֶהְיֶה",
      transliteration: "ehyeh",
      strongsNumber: "H1961",
      language: "Hebrew",
      definition: "I AM, I will be, I exist — the first-person form of the verb 'to be,' expressing eternal self-existence",
      usage: "Exodus 3:14 — 'And God said unto Moses, I AM THAT I AM: and he said, Thus shalt thou say unto the children of Israel, I AM hath sent me unto you.' Ehyeh is derived from hayah (to be/become). It is an imperfect verb, suggesting ongoing, unceasing existence. God's name does not say 'I WAS' (past tense) or 'I WILL BE' (future tense) — it says 'I AM' — eternally present. This name is intimately linked to the covenant name YHWH (the LORD), which comes from the same root.",
      connection: "When Moses asked for God's name — essentially asking 'Who are You, and can I trust You?' — God's answer was His eternal self-existence: I AM THE ONE WHO IS. No beginning. No end. No limitation. No dependence on anything outside Himself. The God who called Moses is the God who cannot fail, cannot change, and cannot abandon what He has started. Jesus claimed this same name in John 8:58: 'Before Abraham was, I AM' — identifying Himself as the same I AM who spoke from the burning bush.",
      relatedVerses: [
        "John 8:58 — 'Jesus said unto them, Verily, verily, I say unto you, Before Abraham was, I am.'",
        "John 14:6 — 'I am the way, the truth, and the life' — one of seven 'I AM' statements in John's Gospel.",
        "Revelation 1:8 — 'I am Alpha and Omega, the beginning and the ending, saith the Lord, which is, and which was, and which is to come, the Almighty.'"
      ],
    },

    faithStory: {
      title: "The Reluctant Voice That Changed History",
      narrative: "Moses had everything a man could lose: a royal education, a future as Egypt's next great leader, a place of honour in the most powerful kingdom on earth. He threw it all away in a moment of rash justice — killing an Egyptian abuser, fleeing into the desert, spending 40 years as a shepherd in Midian. By the time God appeared at the burning bush, Moses had spent four decades concluding that his life was finished, his calling missed, his usefulness spent. He was eighty years old. He was tending someone else's sheep on the far side of the wilderness. He was nobody. And then the bush burned — and did not burn up. And God said: 'Moses, Moses.' Two syllables that changed the world. God did not appear to the young, gifted, confident Moses of 40 years earlier. He appeared to the broken, humbled, self-disqualified Moses of the wilderness — because this Moses had been through enough to know that the mission could not be accomplished in human strength. Every excuse Moses made was real. He genuinely felt inadequate. He genuinely could not see how the plan would work. And God — with patient, persistent grace — answered every one. Not because Moses finally talked himself into it. Not because he ran out of objections. But because eventually, the weight of God's call was greater than the weight of Moses' fear. And he went.",
      moralLesson: "God's call does not wait for you to feel ready. It waits for you to trust the One who is sending you. Moses was most usable when he was most aware of his own insufficiency — because then God's power would get the credit, not Moses' ability.",
    },

    prophecyConnection: {
      title: "The Prophet Like Moses — Jesus Christ",
      otRef: "Deuteronomy 18:15, 18",
      otText: "The LORD thy God will raise up unto thee a Prophet from the midst of thee, of thy brethren, like unto me; unto him ye shall hearken... I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him.",
      ntRef: "Acts 3:22-23, John 1:21, John 6:14",
      ntText: "For Moses truly said unto the fathers, A prophet shall the Lord your God raise up unto you of your brethren, like unto me; him shall ye hear in all things whatsoever he shall say unto you. / And they asked him, What then? Art thou Elias? And he saith, I am not. Art thou that prophet? And he answered, No. / Then those men, when they had seen the miracle that Jesus did, said, This is of a truth that prophet that should come into the world.",
      explanation: "Moses himself predicted a coming Prophet greater than himself (Deuteronomy 18:15) — one whom Israel must obey. The New Testament explicitly identifies this Prophet as Jesus Christ (Acts 3:22). The parallels are intentional: Moses was born under a death sentence (Pharaoh's decree) — so was Jesus (Herod's massacre). Moses spent time in exile and returned — so did Jesus (Egypt, Matthew 2:15). Moses gave the Law from a mountain — Jesus gave the new law from a mountain (Sermon on the Mount). Moses interceded for rebellious Israel — Jesus intercedes at the right hand of the Father.",
      status: "Direct Prediction — Fulfilled in Jesus Christ",
    },

    thinkDeeper: {
      question: "Is there a difference between godly humility ('I am not worthy/able') and disguised disobedience ('I don't want to / I'm afraid')?",
      challenge: "A Christian teen says: 'I don't share my faith because I'm not good enough at explaining it. I'll wait until I know more.' Is this humility or an excuse?",
      hints: [
        "God answered every one of Moses' excuses with a promise of His presence: 'Certainly I will be with thee' (3:12), 'I will teach you what to say' (4:12). If God's presence and help are promised, what excuse remains?",
        "The difference between humility and excuse-making: humility says 'I cannot do this without God.' Excuse-making says 'Therefore I won't do it at all.' Humility leans into God's strength; excuses retreat from it.",
        "1 Corinthians 1:27-28 — 'God hath chosen the weak things of the world to confound the things which are mighty.' God specifically chooses inadequate people so that the results cannot be credited to human ability."
      ],
      conclusion: "Godly humility agrees with God's assessment of our weakness AND God's assessment of His sufficiency. Excuses agree with the first half but reject the second. When you say 'I can't' but God says 'I will be with you' — the conversation is over. The next move is obedience.",
    },

    discussionQuestions: [
      "Which of Moses' five excuses do you identify with most? What is the specific 'I can't' that holds you back from full obedience to God?",
      "God answered every excuse Moses made. What is God's answer to your specific excuse? (Search Scripture — He has probably already answered it.)",
      "Moses spent 40 years in the wilderness being humbled before God could use him. Is there an area of your life where God might be using a 'wilderness season' to prepare you?",
      "Hebrews 11:27 says Moses 'endured, as seeing him who is invisible.' What does it look like to live with that kind of spiritual sight today — making decisions based on the unseen God rather than visible circumstances?"
    ],

    journalPrompt: {
      prompt: "Write out your personal list of excuses for not fully following God — the 'but I...' statements you give Him. Then, next to each one, write what you think God's answer would be based on Scripture. End with a response to God: 'Lord, despite my [biggest excuse], I choose to obey because...'",
      reflection: "Moses' excuses were answered by God's presence. My excuses are answered by the same God. The question is not whether I am capable — it is whether God is with me. And He is. So my excuses are overcome.",
    },

    memoryVerse: "Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say. — Exodus 4:12",
    closingPrayer: "I AM — the God who was and is and always will be. You did not need Moses' eloquence, his confidence, or his perfection. You needed his yes. Lord, I give You my yes today. Not because I feel ready, not because I have it figured out, but because You have said 'I will be with you.' That is enough. Take my excuses and replace them with Your presence. In the name of Jesus, who is the I AM made flesh, Amen.",

    leaderNote: "The five excuses of Moses are deeply relatable to teenagers who feel inadequate, overlooked, or disqualified. This lesson is a powerful antidote to the paralysis of self-doubt. Key pastoral application: help teens distinguish between genuine humility (which God honours and equips) and disguised fear/disobedience (which God patiently but firmly challenges). The word study on 'Ehyeh' is rich — take time with it. The connection to Jesus' 'I AM' statements in John's Gospel is a powerful NT bridge. Consider ending with a time of personal prayer where teens tell God their specific excuse and listen for His answer.",
  },

  // ═══════════════════════════════════════════════════
  // WEEK 19 — THE EXODUS & THE PASSOVER LAMB
  // ═══════════════════════════════════════════════════
  {
    week: 19,
    title: "The Exodus & the Passover Lamb",
    bibleRef: "Exodus 12:1-30, 1 Corinthians 5:7",
    keyVerse: "For even Christ our passover is sacrificed for us. — 1 Corinthians 5:7",
    theme: "Redemption Through Substitution",
    term: "Term 2",
    month: "May",
    icon: "🐑",
    color: "#065F46",

    hook: "Death was moving through Egypt that night. Every firstborn — from Pharaoh's palace to the prison cell — would die. But there was one way to be spared: a lamb, slain, its blood painted on the doorposts. The angel of death would see the blood and pass over that house. Two thousand years later, John the Baptist pointed to Jesus and said: 'Behold the Lamb of God.' What is the connection?",

    deepDive: {
      passage: "Exodus 12:1-30, 1 Corinthians 5:7",
      context: "The Passover is the foundational redemptive event of the Old Testament — the moment that defines Israel's identity as a people saved by God's grace through the substitutionary death of an innocent lamb. After nine devastating plagues, Pharaoh refused to release Israel. The tenth plague — the death of every firstborn — would break him. But God provided an escape: each Israelite household was to select a lamb on the tenth day of the month, keep it for four days, then slaughter it at evening on the fourteenth day. The lamb had to be without blemish — a male of the first year. Its blood was to be applied to the two doorposts and the upper lintel of the house with a branch of hyssop. They were to roast the lamb with fire and eat it that night, fully dressed and ready to depart. When the angel of death passed through Egypt, he would see the blood and pass over that house. The protection was not in the quality of the family inside — it was in the blood on the door. A wicked Israelite who applied the blood was safe. A righteous Egyptian who did not was not. Salvation was by blood, not by personal merit. Paul makes the interpretation explicit in 1 Corinthians 5:7: 'For even Christ our passover is sacrificed for us.' Jesus is the Lamb — without blemish, slain, His blood applied to the doorposts of the heart. The Exodus is not just history — it is the gospel in preview.",
      keyPoints: [
        "The lamb had to be 'without blemish' (12:5) — a perfect, spotless substitute. Jesus, the sinless Son of God, is the only one who qualifies as the perfect Lamb.",
        "The blood had to be applied — it was not enough that the lamb died. The blood had to be placed on the doorpost. Knowing about the Lamb is not the same as applying His blood by faith.",
        "Hyssop — a small, common plant — was used to apply the blood (12:22). Hyssop appears again at the Cross: 'they filled a spunge with vinegar, and put it upon hyssop, and put it to his mouth' (John 19:29). The same plant that applied the Passover blood was present at Calvary.",
        "The Passover lamb was killed on the fourteenth of Nisan — the same day Jesus was crucified, according to the Synoptic chronology. The timing is not accidental.",
        "The command to remember the Passover annually (12:14) was institutionalised as the Lord's Supper in the New Testament — same event, fulfilled sacrifice."
      ],
      obedienceLink: "Obedience to God's Passover instructions required an act of faith that seemed foolish to onlookers — slaughtering a lamb and painting blood on your doorposts. But salvation has always operated the same way: trust and obey the provision God has made, even when it does not make sense by human logic.",
    },

    wordStudy: {
      word: "Pesach",
      original: "פֶּסַח",
      transliteration: "pesach",
      strongsNumber: "H6453",
      language: "Hebrew",
      definition: "Passover — to pass over, to spare, to leap over, to protect",
      usage: "The word 'pesach' in Exodus 12:11-13 carries the idea of God actively protecting those who are sheltered under the blood. It is not merely that the angel 'skipped over' the house — he saw the blood and actively passed over, protecting the household. The Passover was not a passive event; it was an active divine protection triggered by the presence of the substitutionary blood.",
      connection: "God does not 'pass over' our sin — He punishes it. But when the blood of the Lamb is applied by faith, the punishment falls on the substitute instead of on us. This is substitutionary atonement — the heart of the gospel. Jesus did not 'skip over' our sin; He absorbed its full penalty so that God's justice could be satisfied and God's mercy could be applied to all who trust in the blood of the Lamb.",
      relatedVerses: [
        "John 1:29 — 'Behold the Lamb of God, which taketh away the sin of the world.'",
        "1 Peter 1:18-19 — 'Ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Christ, as of a lamb without blemish and without spot.'",
        "Revelation 5:12 — 'Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.'"
      ],
    },

    faithStory: {
      title: "The Night That Changed Everything",
      narrative: "Imagine the night of the first Passover. Darkness fell over Egypt like a shroud. In Israelite homes, the smell of roasting lamb filled the air. Families huddled together, fully dressed, sandals on their feet, staffs in their hands — ready to move at a moment's notice. Children were awake, asking questions. What is happening? Why are we eating so quickly? Why is there blood on the door? And the fathers answered the question that would be asked at every Passover for the next three and a half thousand years: 'Because we were slaves, and God is delivering us tonight. Because an innocent lamb died in our place. Because when death comes to our street, it will see the blood and pass over our house.' They did not know that the questions their children were asking would echo into a night in an upper room, two thousand years later, when Jesus took bread and wine and said: 'This is my body, broken for you. This is my blood of the new covenant, shed for the remission of sins.' They did not know that the Passover they were celebrating was a rehearsal — that the real Lamb was still coming, that He would be selected four days before His death (just as the lamb was selected on the tenth and killed on the fourteenth), that He would die without a bone broken (John 19:36, echoing Exodus 12:46), and that His blood would be the only covering sufficient to make death itself pass over — not just for one nation on one night, but for every human soul across all of history who trusts in His name.",
      moralLesson: "The Passover lamb was not a good idea or a religious ritual — it was a rescue. Salvation has always been by blood, by grace, through faith in God's provision. You cannot earn your way past the angel of judgment. You can only shelter under the blood of the Lamb.",
    },

    prophecyConnection: {
      title: "The Passover Lamb Fulfilled at Calvary",
      otRef: "Exodus 12:5, 12:46",
      otText: "Your lamb shall be without blemish, a male of the first year... Neither shall ye break a bone thereof.",
      ntRef: "John 19:33-36, 1 Corinthians 5:7",
      ntText: "But when they came to Jesus, and saw that he was dead already, they brake not his legs... For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken. / For even Christ our passover is sacrificed for us.",
      explanation: "The precision of the prophetic type is staggering. The Passover lamb specifications in Exodus 12 function as a detailed description of the crucifixion: without blemish (Jesus was sinless), a male of the first year (Jesus in his prime), slain at evening between the two evenings (Jesus died at approximately 3pm on Passover day), no bone broken (verified at the Cross when soldiers broke the legs of the two thieves but not Jesus) — an action John explicitly notes as fulfilment of Exodus 12:46. Paul calls Jesus 'our passover' without qualification. The Exodus Passover was not symbolically similar to Calvary — it was Calvary in prophetic preview.",
      status: "Detailed Prophetic Type — Fulfilled at Calvary with surgical precision",
    },

    thinkDeeper: {
      question: "Why does Christianity insist on blood? Couldn't God just forgive without a sacrifice? Why is the cross necessary?",
      challenge: "A Muslim classmate says: 'In Islam, God simply forgives when you repent. Christianity's idea of God needing a blood sacrifice sounds barbaric.' How would you explain the cross?",
      hints: [
        "The question is not whether God can forgive — it is whether justice can be satisfied. A judge who simply releases every criminal, regardless of guilt, is not merciful — he is corrupt. God's forgiveness must satisfy His justice, not bypass it.",
        "The sacrifice is not about God needing blood — it is about sin having a consequence (death, Romans 6:23) and a substitute bearing that consequence in our place. This is not barbarism — it is mercy.",
        "God did not require someone else to die instead of demanding justice. God Himself entered the story and paid the price: 'God was in Christ, reconciling the world unto himself' (2 Corinthians 5:19). The Judge became the sacrifice."
      ],
      conclusion: "The cross is not a pagan blood sacrifice appeasing an angry deity — it is God's own justice and God's own mercy meeting at the same point. The Judge entered the dock. The Creator paid the debt of the creature. Far from being barbaric, the cross is the most morally coherent act in the universe.",
    },

    discussionQuestions: [
      "The Passover blood protected regardless of the moral quality of the family inside — it was about the blood on the door, not the goodness of the people. How does this reshape your understanding of salvation by grace?",
      "The lamb was slain and the blood was applied — knowing about the lamb was not enough. In your life, have you applied the blood of Jesus by personal faith, or do you only know about it?",
      "Why do you think God chose the image of a lamb — gentle, innocent, vulnerable — to represent His Son? What does this reveal about the nature of salvation?",
      "The Lord's Supper (communion) is a continuation of the Passover celebration. Does knowing the deep OT roots of communion change how you participate in it?"
    ],

    journalPrompt: {
      prompt: "Write a reflection on this question: Am I sheltered under the blood of the Lamb — personally, by faith — or am I simply aware of Christianity as a religion? If you have never personally trusted Christ as your Passover Lamb, write a prayer of surrender and trust today.",
      reflection: "The lamb died so that I might live. That is the gospel in one sentence. Not my goodness, not my efforts, not my religion — the Lamb's blood, applied by faith. I want to live my entire life in the shelter of that blood.",
    },

    memoryVerse: "For even Christ our passover is sacrificed for us. — 1 Corinthians 5:7",
    closingPrayer: "Lamb of God, You take away the sin of the world. You are the Passover Lamb that Egypt's Passover only previewed. Your blood is on the doorpost of my heart by faith. Death has no claim on me — not because I am good, but because You are perfect. Thank You that I did not need to be worthy — I only needed to trust in the One who was. Receive my worship, O Lamb who was slain and who lives forever. Amen.",

    leaderNote: "This lesson is the theological centrepiece of Term 2. The Passover is the richest single event in the Old Testament for understanding the gospel. Take extra time with the prophetic connection — the precision of detail (no broken bones, timing, hyssop, selection on the 10th) is compelling evidence for the divine authorship of Scripture. The apologetics section on 'why blood?' is one teens frequently encounter — prepare well. Consider incorporating the Lord's Supper/communion into this session if church context allows. Journal prompt is an evangelistic invitation — handle with care and pastoral sensitivity. Some teens may respond in genuine faith for the first time.",
  },

]; // end Term 2 partial batch 1

module.exports = TERM2_LESSONS;
