/**
 * Batch 1: Emotional Struggles (Episodes 3-12)
 * "Daily Word" Podcast — The Bible Scrollers
 *
 * Central theme: Jesus Christ is the answer.
 * Format: ~750 words, ~5 minutes, KJV only
 *
 * Run: node scripts/generate-podcast-batch1.cjs
 */

const fs = require('fs');
const path = require('path');

// Helper: auto-timestamp transcript segments based on word count
// ~150 words/min = 2.5 words/sec
function timestampTranscript(segments) {
  let currentTime = 0;
  return segments.map(text => {
    const wordCount = text.split(/\s+/).length;
    const duration = Math.round((wordCount / 2.5) + 0.5); // slight pause between segments
    const start = currentTime;
    const end = currentTime + duration;
    currentTime = end;
    return { start, end, text };
  });
}

const episodes = {

  // ─────────────────────────────────────────────────────────
  // EPISODE 3: Anxiety — "When Worry Keeps You Awake"
  // ─────────────────────────────────────────────────────────
  "3": {
    title: "When Worry Keeps You Awake",
    date: "2026-03-15",
    description: "Finding rest from anxiety through the words of Jesus and the promises of God that silence every worried thought.",
    bibleRef: "Philippians 4:6-7",
    duration: 300,
    audioFile: "daily-word/ep-003.mp3",
    keyPoints: [
      "God invites us to cast every anxiety on Him",
      "Jesus directly commanded us not to worry",
      "God's peace guards our hearts when we pray instead of panic"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "It's three in the morning. Your eyes are wide open. Your mind is racing — bills, deadlines, that conversation you can't stop replaying. The what-ifs are circling like vultures.",
      "You've tried deep breaths. You've tried counting sheep. You've tried scrolling your phone until your eyes blur. But worry has its grip on you, and it won't let go.",
      "If that's you right now, or if that's been you recently — stay with me for the next five minutes. Because God has something powerful to say about this.",

      "Here's the truth about anxiety: it's real. It's not a sign of weak faith. It's not something to be ashamed of. And you're not the only one who feels it.",
      "Anxiety is what happens when a human heart carries weight it was never designed to carry alone.",
      "We worry about our children. We worry about our health. We worry about money. We worry about relationships. We worry about things that haven't even happened yet — and may never happen.",
      "And the enemy loves to pile it on — whispering that things will never get better, that you're failing, that God has forgotten your address.",
      "But that is a lie. And the Word of God destroys it.",

      "In Matthew chapter six, verse twenty-five, Jesus Himself says these words directly to you.",
      "Therefore I say unto you, Take no thought for your life, what ye shall eat, or what ye shall drink; nor yet for your body, what ye shall put on. Is not the life more than meat, and the body than raiment?",
      "Jesus isn't dismissing your needs. He knows you need food. He knows you need shelter. He's saying — your Father already knows what you need before you ask. You don't have to carry this.",
      "Then in verse twenty-seven He asks a question that stops anxiety in its tracks.",
      "Which of you by taking thought can add one cubit unto his stature?",
      "In other words — has worrying ever actually solved anything? Has a single anxious thought ever added one moment to your life? The answer, of course, is no.",

      "Now listen to the apostle Paul, writing from a Roman prison cell — not a comfortable home, not a quiet study, a prison — in Philippians chapter four, verses six and seven.",
      "Be careful for nothing; but in every thing by prayer and supplication with thanksgiving let your requests be made known unto God.",
      "And the peace of God, which passeth all understanding, shall keep your hearts and minds through Christ Jesus.",
      "Did you catch that? The peace of God will keep your heart. That word keep in the original Greek is a military term — phroureō. It means to guard, to stand watch over, to protect like a soldier at a fortress gate.",
      "God's peace doesn't just comfort you. It stands guard over your mind. It posts a sentry at the door of your heart and says — no anxious thought gets past me tonight.",

      "And Peter drives it home in First Peter chapter five, verse seven.",
      "Casting all your care upon him; for he careth for you.",
      "All your care. Not some of it. Not the big worries. All of it — the bills, the diagnosis, the text they haven't returned, the future you can't see. All of it. Because He genuinely, deeply, personally cares for you.",

      "So where is Jesus in all of this? He is the Prince of Peace. Isaiah chapter nine, verse six — that's His title.",
      "He is the one who slept soundly in a boat during a raging storm — and then stood up, spoke three words, and silenced the wind and the waves. Peace, be still.",
      "That same Jesus is speaking over your anxious heart right now. Peace. Be still.",
      "He didn't just come to save you from sin. He came to save you from the crushing weight of worry, fear, and sleepless nights.",
      "He is your rest. He is your answer. Not a technique. Not a breathing exercise. Not a strategy. A Person — the Lord Jesus Christ. And He invites you to come to Him.",

      "Here's what I want you to do today. Just one thing.",
      "Take the biggest worry on your heart right now — name it out loud — and speak it to God in prayer.",
      "Say, Lord, I'm giving this to you. I can't carry it anymore. But you can. And you will. And then leave it at His feet. Don't pick it back up.",

      "Let's pray together. Father, we come to you right now with heavy hearts and racing minds.",
      "We lay every single anxious thought at the feet of Jesus. Guard our hearts, Lord. Guard our minds.",
      "Replace our worry with your peace — the peace that passes all understanding, the peace the world cannot give and cannot take away.",
      "We trust you tonight. We trust you tomorrow. In Jesus' precious name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 4: Fear — "When You're Afraid of Tomorrow"
  // ─────────────────────────────────────────────────────────
  "4": {
    title: "When You're Afraid of Tomorrow",
    date: "2026-03-16",
    description: "Conquering the fear of the unknown through God's presence and His promise to never leave you.",
    bibleRef: "Isaiah 41:10",
    duration: 300,
    audioFile: "daily-word/ep-004.mp3",
    keyPoints: [
      "Fear of the unknown is universal — but God holds tomorrow",
      "God commands 'fear not' over 365 times in Scripture",
      "Jesus conquered the ultimate unknown — death itself"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "What if it doesn't work out? What if the diagnosis is bad? What if they leave? What if I lose everything? What if I fail?",
      "Fear of tomorrow is one of the heaviest burdens a person can carry. Because you can't fight what hasn't happened yet. You can't solve a problem that doesn't exist yet. But your mind insists on trying.",
      "If fear has been stealing your sleep, your joy, or your peace — I want you to hear what God says about it today.",

      "Fear is powerful. It can paralyze you. It can keep you from making decisions, from stepping out in faith, from saying yes to what God is calling you to do.",
      "Fear whispers — what if something terrible happens? And before you can stop it, your imagination has already written the worst possible ending to your story.",
      "Maybe you're facing a medical appointment you've been dreading. Maybe you're walking into an uncertain season — a new job, a failed marriage, an empty nest, a financial crisis.",
      "The future feels like a dark room, and you're terrified of what might be in it.",
      "But here is what you need to know — God is already in that room. He is already in your tomorrow. And He is not worried.",

      "In Isaiah chapter forty-one, verse ten, God speaks with breathtaking tenderness and authority.",
      "Fear thou not; for I am with thee: be not dismayed; for I am thy God: I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.",
      "Count the promises packed into that single verse. I am with you. I am your God. I will strengthen you. I will help you. I will hold you up with my righteous hand.",
      "Five promises. One verse. One God who means every word. That's how serious He is about your fear.",

      "In Second Timothy chapter one, verse seven, Paul writes to a young pastor named Timothy who was struggling with fear.",
      "For God hath not given us the spirit of fear; but of power, and of love, and of a sound mind.",
      "That spirit of fear gripping your chest right now? It didn't come from God. He gave you something entirely different — power, love, and a sound, stable, clear mind. Fear is the counterfeit. The Spirit of God is the real thing.",

      "And in Psalm twenty-three, verse four — perhaps the most beloved passage in all of Scripture — David writes from experience.",
      "Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me.",
      "Notice — David didn't say he avoided the valley. He walked through it. Through the worst place imaginable. But he feared no evil. Why? Not because the valley wasn't real. Because God was with him in it.",

      "And this is where Jesus changes everything.",
      "Jesus walked into the darkest tomorrow any human has ever faced — the cross. He knew exactly what was coming. He sweat drops of blood in the garden of Gethsemane.",
      "But He went anyway. Not because He wasn't afraid. Because He trusted His Father. And on the other side of that terrible Friday was resurrection Sunday.",
      "Jesus conquered the ultimate unknown. He conquered death itself. And because He did, you never have to face tomorrow alone.",
      "The One who holds your future already defeated the worst thing it could ever contain.",

      "Today, I want you to do one thing. When fear whispers its what-ifs — answer it out loud.",
      "Say — what if God is faithful? What if He comes through like He always has? What if tomorrow is better than I think? Replace the enemy's what-if with God's what-if. Because God's track record is undefeated.",

      "Let's pray. Lord, we are afraid. We admit it openly before you. But today, we choose to trust you more than we trust our fear.",
      "You are already in our tomorrow. You hold every unknown moment in your mighty hands.",
      "Give us courage. Give us peace. Walk with us through every valley. In Jesus' name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 5: Depression — "When Darkness Feels Overwhelming"
  // ─────────────────────────────────────────────────────────
  "5": {
    title: "When Darkness Feels Overwhelming",
    date: "2026-03-17",
    description: "Speaking God's light into the heaviness of depression — you are not forgotten, and the darkness will not win.",
    bibleRef: "Psalm 34:18",
    duration: 300,
    audioFile: "daily-word/ep-005.mp3",
    keyPoints: [
      "Depression is not a faith failure — even great men of God experienced it",
      "God is close to the brokenhearted",
      "Jesus came specifically to heal the heavy in spirit"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "Some mornings, getting out of bed feels like climbing a mountain. The world is moving, but you feel frozen. Everything takes effort — eating, talking, even breathing feels heavy.",
      "Colors seem dimmer. Laughter feels far away. The things that used to bring you joy feel hollow. And you wonder — does anyone even notice? Does anyone even care?",
      "If you're in that place right now, please don't turn this off. This episode is for you. And I need you to hear every word.",

      "Let me say something important first. Depression is not a sign that God is angry with you. It is not proof that your faith is too weak. It is not a character flaw.",
      "Elijah — the mighty prophet who called fire down from heaven and defeated four hundred and fifty prophets of Baal — sat under a tree in the wilderness and asked God to let him die.",
      "David — the man after God's own heart, the giant-killer — wrote psalm after psalm from the pit of despair. How long wilt thou forget me, O LORD? he cried. Forever?",
      "Jeremiah wept so much they called him the weeping prophet. He said his eyes were a fountain of tears.",
      "If depression meant God had abandoned you, He would have abandoned some of His greatest servants. But He didn't leave them. And He has not left you.",

      "Psalm thirty-four, verse eighteen speaks directly into this darkness.",
      "The LORD is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.",
      "Did you hear that? God doesn't stand far off when you're broken. He doesn't cross to the other side of the road. He draws near. He moves closer. He comes to you.",
      "When the rest of the world pulls away because they don't understand — God pulls in.",

      "In Isaiah chapter sixty-one, verses one through three — the very passage Jesus chose to read when He stood up in the synagogue to announce His ministry — we find these words.",
      "The Spirit of the Lord GOD is upon me; because the LORD hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted.",
      "To give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness.",
      "Jesus chose that passage on purpose. He was saying — this is why I came. I came to bind up the brokenhearted. To trade your ashes for beauty. Your mourning for joy. Your spirit of heaviness for a garment of praise.",

      "And in Psalm forty-two, verse eleven, the psalmist does something remarkable — he preaches to his own soul.",
      "Why art thou cast down, O my soul? and why art thou disquieted within me? hope thou in God: for I shall yet praise him, who is the health of my countenance, and my God.",
      "Even in the depths, he chose to speak hope over his own darkness. I shall yet praise Him. Not because I feel like it right now. Because He is worthy. And morning is coming.",

      "Jesus understands the deepest darkness a human soul can experience. On the cross, He cried out — My God, my God, why hast thou forsaken me?",
      "He entered that darkness willingly — so that you would never have to face yours alone.",
      "He is the light of the world. And John chapter one, verse five tells us — the light shineth in darkness; and the darkness comprehended it not.",
      "The darkness could not overcome His light then. It cannot overcome it now. And it will not overcome you.",

      "Here's one thing for today. You don't have to feel better right now. But do this — tell God exactly how you feel. No filter. No church voice. No pretending. Just raw, honest prayer.",
      "He can handle your pain. He is not intimidated by your tears. He's waiting to hear from you.",
      "And if you need help beyond prayer — a counselor, a doctor, a trusted friend — reaching out is not weakness. It's wisdom. God often sends His comfort through people.",

      "Let's pray. Father, we come to you from the lowest place. Some of us can barely whisper your name right now.",
      "But you are near to the brokenhearted. Draw close, Lord. Lift the heaviness. Shine your light into this darkness.",
      "Remind us that weeping may endure for a night, but joy comes in the morning. We hold on to you. In Jesus' name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 6: Anger — "When Rage Burns Inside You"
  // ─────────────────────────────────────────────────────────
  "6": {
    title: "When Rage Burns Inside You",
    date: "2026-03-18",
    description: "Letting God's Word tame the fire of anger before it destroys what matters most.",
    bibleRef: "James 1:19-20",
    duration: 300,
    audioFile: "daily-word/ep-006.mp3",
    keyPoints: [
      "Anger itself isn't always sin — but unchecked anger destroys",
      "God's wisdom: be slow to anger, quick to listen",
      "Jesus showed righteous anger and perfect self-control"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "Your jaw is clenched. Your fists are tight. Someone said something, did something — or didn't do something — and now there's a fire burning in your chest that won't go out.",
      "You want to explode. You want to say things you can't take back. You want them to feel what you feel. And honestly? The rage feels completely justified.",
      "Before you send that text, before you make that call, before you do anything — stay with me for five minutes. Let God speak before your anger does.",

      "Anger is one of the most powerful emotions a human being can experience. And it can feel righteous — like you have every right to burn.",
      "Maybe you were wronged. Maybe someone hurt your child. Maybe the injustice is real, the betrayal is deep, and the offense is legitimate.",
      "But here's the danger — unchecked anger doesn't just burn the person who wronged you. It burns everything around you. It burns your marriage. It burns your friendships. It burns your reputation. It burns your health. It burns your witness.",
      "Anger promises you justice. But it delivers destruction. And the enemy knows that. He wants you to hold onto it tightly.",
      "Because as long as you're gripping rage with both hands, you can't grip grace. You can't hold onto peace. You can't embrace forgiveness.",

      "James chapter one, verses nineteen through twenty, gives us God's battle plan for anger.",
      "Wherefore, my beloved brethren, let every man be swift to hear, slow to speak, slow to wrath: For the wrath of man worketh not the righteousness of God.",
      "Three clear commands. Be quick to listen. Be slow to speak. Be slow to get angry. Because — and this is the key — human anger does not produce the righteous life that God desires.",
      "Your anger, no matter how justified it feels, will not create the outcome God wants.",

      "In Ephesians chapter four, verses twenty-six and twenty-seven, Paul gives a stunning instruction.",
      "Be ye angry, and sin not: let not the sun go down upon your wrath: Neither give place to the devil.",
      "Notice — he doesn't say never be angry. There are things worth being angry about — injustice, oppression, exploitation of the weak. But he says don't let your anger lead you into sin. And don't let it stay overnight.",
      "Because when anger moves in and unpacks its bags and settles into your heart — it gives the devil a foothold. A base of operations in your life.",

      "Proverbs chapter fifteen, verse one gives us a weapon that's stronger than rage.",
      "A soft answer turneth away wrath: but grievous words stir up strife.",
      "A soft answer. Not a weak answer — a controlled one. It takes more strength to speak gently when you're furious than it does to shout. Gentleness under pressure is power under control.",

      "And Psalm thirty-seven, verse eight warns us plainly.",
      "Cease from anger, and forsake wrath: fret not thyself in any wise to do evil.",

      "Now, Jesus Himself got angry. He walked into the temple and flipped over the money-changers' tables. He burned with righteous indignation against those who exploited the poor and turned His Father's house into a marketplace.",
      "But His anger was always aimed at injustice — never at personal revenge. And even in His fiercest moment, He never sinned.",
      "On the cross — beaten, mocked, spit upon, nails through His hands — He spoke words that should level every angry heart. Father, forgive them; for they know not what they do.",
      "That's the power of Christ in you. Righteous anger. Perfect self-control. Supernatural forgiveness. And that same Holy Spirit lives inside you if you belong to Him.",

      "Today, here's your one thing. Before you respond to that person, that situation, that message — pause. Take ten seconds of silence.",
      "And pray four words: Lord, speak through me. Let Him be your filter. Let His Spirit control your tongue before your anger becomes your deepest regret.",

      "Let's pray. Father, we confess — our anger has gotten the best of us too many times. We've said things we can't unsay. We've done damage we wish we could undo.",
      "Tame this fire, Lord. Give us the self-control that only your Spirit provides.",
      "Help us be quick to listen, slow to speak, and slow to wrath. Make us more like Jesus. In His mighty name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 7: Loneliness — "When No One Understands"
  // ─────────────────────────────────────────────────────────
  "7": {
    title: "When No One Understands",
    date: "2026-03-19",
    description: "Discovering that even in the deepest loneliness, you are never truly alone — God is closer than you think.",
    bibleRef: "Deuteronomy 31:6",
    duration: 300,
    audioFile: "daily-word/ep-007.mp3",
    keyPoints: [
      "Loneliness can exist even in a crowd",
      "God promises He will never leave or forsake you",
      "Jesus experienced ultimate loneliness on the cross so you'd never be alone"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "You can be in a room full of people and still feel completely alone. You can have hundreds of contacts in your phone and no one you'd actually call at two in the morning.",
      "Loneliness isn't always about being physically by yourself. It's the deep, aching sense of being unseen. Unknown. Disconnected from the world around you.",
      "If that ache is sitting heavy in your chest right now, lean in close. God has something personal to tell you today.",

      "Loneliness is one of the most painful experiences a human being can endure. Research tells us it's as damaging to your health as smoking fifteen cigarettes a day. But you don't need studies to tell you that. You feel it.",
      "That hollow quiet when everyone's gone home. That sense that no one truly sees the real you. That exhausting performance of pretending you're fine when you're dying inside.",
      "Maybe you've moved to a new city and haven't found your people yet. Maybe a relationship ended and took your social world with it. Maybe you're surrounded by family every day but still feel invisible.",
      "Maybe you've tried to explain your pain to someone and they just changed the subject. They didn't mean to hurt you. They just didn't understand.",
      "But here's what I desperately need you to hear today — Someone does understand. And His name is Jesus.",

      "In Deuteronomy chapter thirty-one, verse six, God makes a covenant promise that has echoed through every generation of believers.",
      "Be strong and of a good courage, fear not, nor be afraid of them: for the LORD thy God, he it is that doth go with thee; he will not fail thee, nor forsake thee.",
      "He will not fail you. He will not forsake you. That is not a hopeful wish. That is not a motivational poster. That is an unbreakable covenant promise from Almighty God.",

      "The writer of Hebrews repeats this promise in chapter thirteen, verse five.",
      "I will never leave thee, nor forsake thee.",
      "Now here's what's remarkable about the Greek behind that verse. It uses a five-fold negation. It literally reads — I will never, no never, no never, no never, no never leave you or forsake you. Five times God says never. He wanted to make absolutely, completely certain that you heard Him.",

      "And in Isaiah chapter forty-nine, verses fifteen and sixteen, God says something that should stop you in your tracks.",
      "Can a woman forget her sucking child, that she should not have compassion on the son of her womb? yea, they may forget, yet will I not forget thee.",
      "Behold, I have graven thee upon the palms of my hands.",
      "Your name is engraved — carved permanently — into the palms of God's hands. Even a mother might forget her nursing child. But God says — I will never forget you. Not possible. Your name is written on me.",

      "Jesus knows what loneliness feels like. In the garden of Gethsemane, on the worst night of His life, He asked His three closest friends to stay awake and pray with Him. They fell asleep. Three times.",
      "On the cross, He was abandoned by the crowds who had cheered Him. Denied by Peter. Betrayed by Judas. And then — the ultimate loneliness — He cried out, My God, my God, why hast thou forsaken me?",
      "He experienced total, absolute abandonment — separation from His own Father. Why? So that you would never, ever have to be separated from God. He bore your loneliness on that cross.",
      "Because of what Jesus did, you are never truly alone. Not in your darkest night. Not in your quietest room. Not on your longest day. Not ever.",

      "Your one thing today — talk to God like He's sitting right next to you. Because He is. Tell Him about your day. Tell Him what hurts. Tell Him what you're afraid of. You don't need fancy words or perfect theology. Just talk. He is right there. And He's listening.",

      "Let's pray. Father, we feel so alone sometimes. The silence is deafening and the ache is real.",
      "But you have promised — five times over — that you will never leave us. Help us sense your presence right now, in this very moment.",
      "Remind us that we are seen, we are known, we are loved, and we are engraved on the palms of your hands.",
      "Thank you for Jesus, who bore the ultimate loneliness so we could have your companionship forever. In His name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 8: Grief/Loss — "When Your Heart Is Broken"
  // ─────────────────────────────────────────────────────────
  "8": {
    title: "When Your Heart Is Broken",
    date: "2026-03-20",
    description: "Walking through grief with a God who weeps with you and promises to make all things new.",
    bibleRef: "Psalm 34:18",
    duration: 300,
    audioFile: "daily-word/ep-008.mp3",
    keyPoints: [
      "Grief is love with nowhere to go — and God honors it",
      "Jesus wept — He enters our grief personally",
      "There is coming a day when every tear will be wiped away"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "There's an empty chair at the table. A name you can't say without your voice breaking. A side of the bed that's cold. A phone number you still can't delete.",
      "Grief is one of the heaviest things a human heart will ever carry. And if you're carrying it right now, I am so deeply sorry for your loss.",
      "Don't rush through this. Stay right here. Let God meet you in the middle of your pain.",

      "Grief is not something to fix. It's not a problem to solve or a phase to get through. Someone once said grief is love with nowhere to go. And that's exactly right.",
      "When you lose someone — a parent, a child, a spouse, a lifelong friend — part of your world simply goes dark. And no one can turn that light back on for you.",
      "People say it gets easier with time. Sometimes it does. Sometimes it doesn't. Sometimes the grief hits you in the grocery store at two in the afternoon when you see their favorite cereal, and suddenly you can't breathe.",
      "And well-meaning people say things like — they're in a better place, or God needed another angel. And maybe they mean well. But the place you're standing in right now feels unbearable.",
      "Here's what matters — God doesn't ask you to pretend it doesn't hurt. He doesn't rush you. He doesn't give you a deadline for your tears. He meets you right in the middle of the hurt.",

      "Psalm thirty-four, verse eighteen.",
      "The LORD is nigh unto them that are of a broken heart; and saveth such as be of a contrite spirit.",
      "When your heart is shattered into a thousand pieces, God doesn't stay at a distance. He moves closer. He draws near. He sits with you in the silence.",

      "And here's something that changes everything. Two words in John chapter eleven, verse thirty-five — the shortest verse in the Bible and one of the most powerful.",
      "Jesus wept.",
      "Jesus stood at the tomb of His dear friend Lazarus — fully knowing He was about to raise him from the dead — and He wept. He wasn't weeping from doubt. He was weeping from love.",
      "Jesus enters your grief personally. He doesn't observe it from heaven. He steps into it. He weeps with you. Right now, today, He weeps with you.",

      "Paul writes in Second Corinthians chapter one, verses three and four,",
      "Blessed be God, even the Father of our Lord Jesus Christ, the Father of mercies, and the God of all comfort;",
      "Who comforteth us in all our tribulation, that we may be able to comfort them which are in any trouble, by the comfort wherewith we ourselves are comforted of God.",
      "God doesn't just send comfort like a package in the mail. He is the God of all comfort. He is the source. And one day — maybe not today, but one day — He will use your pain to bring comfort to someone else walking the same dark road.",

      "And then there's the promise that holds everything together. Revelation chapter twenty-one, verse four.",
      "And God shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain: for the former things are passed away.",
      "No more death. No more sorrow. No more crying. No more pain. That day is coming. God Himself will wipe every tear from your eyes.",

      "Because of Jesus, death does not get the final word. The grave is not the end of the story.",
      "Jesus stood before a sealed tomb and shouted — Lazarus, come forth! And death obeyed Him. Because death has no authority over the Son of God.",
      "That same Jesus holds your loved one safely. And that same Jesus holds you. And one day — one glorious day — He will make all things new.",

      "Your one thing today — don't grieve alone. Tell someone how you're really feeling. Give yourself permission to not be okay. Permission to cry. Permission to miss them.",
      "Grief has no timeline. And God's grace has no expiration date. He will be with you every step of this journey.",

      "Let's pray. Father, our hearts are so heavy. The loss is deep and the pain is more real than words can express.",
      "Draw near to us right now, God of all comfort. Hold us together when we're falling apart.",
      "Thank you that death is not the end. Thank you for the promise that every tear will one day be wiped away by your own hand.",
      "Until that day, Lord, carry us. In Jesus' name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 9: Guilt — "When Shame Won't Let Go"
  // ─────────────────────────────────────────────────────────
  "9": {
    title: "When Shame Won't Let Go",
    date: "2026-03-21",
    description: "Breaking free from the chains of guilt through the complete forgiveness found only in Jesus Christ.",
    bibleRef: "Romans 8:1",
    duration: 300,
    audioFile: "daily-word/ep-009.mp3",
    keyPoints: [
      "Guilt tells you what you did — shame tells you who you are. Both are defeated at the cross.",
      "There is no condemnation for those in Christ Jesus",
      "God removes our sin as far as the east is from the west"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "There's something you did — maybe years ago, maybe last week, maybe yesterday — and it follows you everywhere you go. Like a shadow you can't shake.",
      "You replay it in your mind. You cringe at the memory. You wonder — could God ever really forgive that? If anyone knew the real me, they'd walk away. If they saw what I've done, they'd never look at me the same.",
      "Shame is a prison with invisible bars. And today, God is handing you the key to walk out free.",

      "There's an important difference between guilt and shame. Guilt says — I did something wrong. That's conviction, and it can lead you to repentance. That's healthy.",
      "But shame? Shame goes further. Shame says — I am something wrong. I'm broken. I'm damaged goods. I'm beyond repair.",
      "Shame doesn't just want you to feel sorry. It wants to bury you. It tells you you're too far gone. Too dirty. Too messed up for grace.",
      "It replays your worst moments on an endless loop. It convinces you that God's mercy is for other people — good people, clean people — but not for someone like you.",
      "Maybe it's something terrible you said that destroyed a relationship. Maybe it's something you did in secret that no one knows about. Maybe it's an addiction. A betrayal. A lie that snowballed. A promise you shattered.",
      "And the enemy — he loves to be your prosecutor. Day and night, he brings up your past as evidence that you are disqualified from God's love.",
      "But God has a very different verdict.",

      "Romans chapter eight, verse one. Read this slowly and let every word land.",
      "There is therefore now no condemnation to them which are in Christ Jesus, who walk not after the flesh, but after the Spirit.",
      "No condemnation. Not some condemnation. Not reduced condemnation. Not a little lingering guilt to keep you humble. None. Zero. The verdict is final. In Christ Jesus, you are free.",

      "First John chapter one, verse nine says,",
      "If we confess our sins, he is faithful and just to forgive us our sins, and to cleanse us from all unrighteousness.",
      "All unrighteousness. Not the small sins. Not the respectable ones. All of it. Every dark corner. Every shameful secret. When you confess, He is faithful — He will always do it — and just — it's legally settled at the cross — to forgive you and to cleanse you completely.",

      "And Psalm one hundred and three, verse twelve paints the most breathtaking picture of what God does with your sin.",
      "As far as the east is from the west, so far hath he removed our transgressions from us.",
      "Think about that. North and south eventually meet — at the poles. But east and west? They never meet. They run forever in opposite directions. That's how far God has removed your sin from you. It is gone. It is unreachable. It is finished.",

      "In Isaiah chapter one, verse eighteen, God extends a personal invitation.",
      "Come now, and let us reason together, saith the LORD: though your sins be as scarlet, they shall be as white as snow; though they be red like crimson, they shall be as wool.",

      "Here is the truth that shame doesn't want you to hear — Jesus already paid for the thing you can't forgive yourself for.",
      "On the cross, He took your guilt. He took your shame. He took your worst day, your darkest secret, your deepest regret — and He nailed it to the wood and buried it in a tomb.",
      "When God looks at you in Christ, He doesn't see your failure. He sees the spotless righteousness of His Son.",
      "The enemy says — remember what you did. God says — remember what I did. The cross settled it once and for all. It is finished.",

      "Your one thing today — stop punishing yourself for something God has already forgiven. He's not holding it against you. Stop holding it against yourself.",
      "Say this out loud right now: I am forgiven. I am clean. There is no condemnation for me in Christ Jesus. And say it again tomorrow. And the day after. Until the truth drowns out the lie.",

      "Let's pray. Father, we have been dragging around shame that you already nailed to the cross.",
      "Forgive us for not receiving your forgiveness. Today, we release the guilt. We let go of the shame.",
      "We accept your verdict — not guilty, no condemnation, washed white as snow. Thank you, Jesus, for paying a price we could never pay. In your name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 10: Stress — "When Life Is Too Much"
  // ─────────────────────────────────────────────────────────
  "10": {
    title: "When Life Is Too Much",
    date: "2026-03-22",
    description: "Exchanging the crushing weight of life's demands for the easy yoke and light burden that Jesus offers.",
    bibleRef: "Matthew 11:28-30",
    duration: 300,
    audioFile: "daily-word/ep-010.mp3",
    keyPoints: [
      "Jesus doesn't add to your burden — He offers to carry it",
      "God renews the strength of those who wait on Him",
      "You were never meant to do this alone"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "The to-do list never gets shorter. The inbox keeps filling up. The deadlines keep stacking. Everyone around you needs something, and you have nothing left to give.",
      "You feel like a phone at two percent battery — still expected to perform at a hundred percent. One more demand and you might just shut down completely.",
      "If you're overwhelmed right now — if the weight of life is pressing down on your chest — take one slow breath. God sees your load. And He has an offer for you.",

      "We live in a world that glorifies busyness. Being stressed is almost a badge of honor — it means you're important, you're needed, you're productive.",
      "But your body is telling you the truth your schedule won't admit — you are running on fumes. Work demands more. Family needs more. Your body is exhausted. Your mind won't shut off, even when your head hits the pillow.",
      "You keep pushing through because that's what responsible people do. You put on a brave face. You tell everyone you're fine. Meanwhile, inside, something is cracking.",
      "And the worst part? You feel guilty about being stressed. Like you should somehow be stronger. Like other people handle more without falling apart.",
      "But here is the truth — you were never designed to carry all of this on your own shoulders. You were designed to carry it with God. And Jesus knew it.",

      "In Matthew chapter eleven, verses twenty-eight through thirty, Jesus makes what might be the most beautiful invitation in all of Scripture.",
      "Come unto me, all ye that labour and are heavy laden, and I will give you rest.",
      "Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls.",
      "For my yoke is easy, and my burden is light.",
      "Listen to what He's saying. Not — try harder. Not — push through. Not — figure it out on your own. Just — come. Come to me. Bring your exhaustion. Bring your chaos. Bring your overwhelm. I want all of it.",
      "A yoke is what two oxen wear to share a heavy load. Jesus is saying — get in the yoke with me. I'll take the weight. You walk beside me. My yoke is easy. My burden is light. Because I'm the one pulling.",

      "Psalm fifty-five, verse twenty-two says,",
      "Cast thy burden upon the LORD, and he shall sustain thee: he shall never suffer the righteous to be moved.",
      "Cast it. That word in Hebrew means to hurl — to throw it. Don't gently set your burden at God's feet and then quietly pick it back up. Hurl it at Him. He can take it. And He will sustain you.",

      "And in Isaiah chapter forty, verse thirty-one — one of the most powerful promises for the exhausted soul,",
      "But they that wait upon the LORD shall renew their strength; they shall mount up with wings as eagles; they shall run, and not be weary; and they shall walk, and not faint.",
      "When you're too tired to soar — He gives you wings. When you're too tired to run — He gives you endurance. When you're too tired to even walk — He keeps you standing. He meets you at your exact point of exhaustion.",

      "Jesus lived the most demanding life in human history. Crowds pulled at Him day and night. He healed the sick, raised the dead, confronted the powerful, and carried the weight of the entire world's salvation on His shoulders.",
      "And you know what He did? He withdrew to quiet places to pray. He slept. He took time away from the crowds. He rested.",
      "If the Son of God prioritized rest, so should you. Resting is not laziness. It is obedience. It is trusting that God can hold the world together while you sleep.",

      "Your one thing today — identify one item on your plate that you can release. One thing you can let go of, delegate, delay, or simply say no to.",
      "Not everything is urgent. Not everything is your responsibility. Give yourself permission to put something down. God will not let it crash.",

      "Let's pray. Father, we are so tired. The demands of life are crushing us and we can barely keep going.",
      "We come to you right now — heavy laden, worn out, running on empty — and we accept your invitation to rest.",
      "Teach us to walk in your easy yoke. Renew our strength like eagles. Help us trust you with everything we can't control.",
      "In Jesus' name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 11: Hopelessness — "When You Can't See the Way Out"
  // ─────────────────────────────────────────────────────────
  "11": {
    title: "When You Can't See the Way Out",
    date: "2026-03-23",
    description: "Rekindling hope when life feels impossible — because our God specializes in dead ends and hopeless situations.",
    bibleRef: "Jeremiah 29:11",
    duration: 300,
    audioFile: "daily-word/ep-011.mp3",
    keyPoints: [
      "Hopelessness is a feeling, not a fact — God always has a plan",
      "God's mercies are new every single morning",
      "Jesus turned the most hopeless moment in history into the greatest victory"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "You've tried everything you know to try. Every door is closed. Every option has run out. Every path leads to a wall.",
      "And you're sitting in the rubble of your situation wondering — is this it? Is this really how my story ends? Because right now, it feels like there's no way forward.",
      "Hopelessness is suffocating. It tells you nothing will ever change, nothing will ever get better, and you might as well stop trying.",
      "But I need you to hear something today — hopelessness is a liar. And God specializes in dead ends. Stay with me.",

      "When you can't see a way out, the world shrinks. Everything narrows to the problem. The bills keep stacking up. The diagnosis won't change. The marriage can't be saved. The door won't open.",
      "You've prayed — honestly, faithfully, desperately — and nothing happened. You've done everything right and it still fell apart.",
      "And now there's a voice in your head — maybe it's your own thoughts, maybe it's the enemy — saying just give up. It's over. Nothing's going to change.",
      "But that voice does not belong to God. He never tells His children to give up. Never. Not once in all of Scripture.",
      "He may say — wait. He may say — trust me. He may say — this isn't going the direction you expected, but I have a plan you can't see yet. But He absolutely never says — it's over.",

      "Jeremiah chapter twenty-nine, verse eleven. God spoke these words to an entire nation sitting in exile — people who had lost their homes, their temple, their freedom, everything.",
      "For I know the thoughts that I think toward you, saith the LORD, thoughts of peace, and not of evil, to give you an expected end.",
      "An expected end. A future. A hope. A plan. God spoke those words not to people on a mountaintop — He spoke them to people in captivity. At their lowest. When everything looked absolutely hopeless, God said — I have a plan for you. And it's a good one.",

      "In Lamentations chapter three, verses twenty-two and twenty-three — written in the middle of national devastation, with Jerusalem in ashes — Jeremiah writes these stunning words.",
      "It is of the LORD'S mercies that we are not consumed, because his compassions fail not.",
      "They are new every morning: great is thy faithfulness.",
      "New every morning. Did you hear that? Whatever yesterday looked like — however dark, however hopeless — today God's mercy is fresh. Today His compassion hasn't run dry. Every single morning, His faithfulness resets.",

      "And in Psalm twenty-seven, verses thirteen and fourteen, David clings to hope when everything around him is falling apart.",
      "I had fainted, unless I had believed to see the goodness of the LORD in the land of the living.",
      "Wait on the LORD: be of good courage, and he shall strengthen thine heart: wait, I say, on the LORD.",
      "David said — I would have completely given up, I would have collapsed, unless I believed I was going to see God's goodness. Not just in heaven someday. In the land of the living. Here. In this life. On this side of eternity.",

      "And this is the heart of the gospel. The most hopeless moment in all of human history was a Friday afternoon outside Jerusalem when Jesus Christ hung dead on a Roman cross.",
      "Every disciple's hope died with Him that day. Their Messiah was dead. The dream was over. Peter went back to fishing. The women brought burial spices. It was finished.",
      "But then Sunday came. The stone rolled away. The tomb was empty. And the most hopeless moment in human history became the greatest victory the world has ever known.",
      "If God can turn a crucifixion into a resurrection — if He can turn a grave into a garden — then He can absolutely turn your impossible situation around. Your dead end is just His starting point.",

      "Your one thing today — write down Lamentations chapter three, verse twenty-three and put it where you'll see it first thing tomorrow morning.",
      "His mercies are new every morning. That means tomorrow's grace is already loaded and waiting for you. You haven't used it yet. It's fresh. It's full. And it's yours.",

      "Let's pray. Father, we have hit a wall and we cannot see through it. The situation feels impossible and hope feels far away.",
      "But you are the God of the impossible. You are the God who turned a cross into an empty tomb and a Friday into a Sunday.",
      "We choose to hope in you today, even when we can't see the path. Give us courage to wait. Strengthen our hearts.",
      "In Jesus' name, amen."
    ])
  },

  // ─────────────────────────────────────────────────────────
  // EPISODE 12: Rejection — "When People Walk Away"
  // ─────────────────────────────────────────────────────────
  "12": {
    title: "When People Walk Away",
    date: "2026-03-24",
    description: "Finding your true identity and acceptance in Christ when the people you love choose to leave.",
    bibleRef: "Isaiah 53:3",
    duration: 300,
    audioFile: "daily-word/ep-012.mp3",
    keyPoints: [
      "Jesus was the most rejected person in history — He understands",
      "Human rejection cannot override God's acceptance",
      "If God is for you, it doesn't matter who is against you"
    ],
    transcript: timestampTranscript([
      "Welcome to the Daily Word from The Bible Scrollers.",
      "They chose someone else. They walked away. They stopped calling. They unfriended you — online and in real life. They looked right through you like you weren't even there.",
      "Rejection cuts deeper than almost any pain you'll experience. Because it doesn't just hurt your feelings — it attacks your identity. It attacks your worth. It whispers — something is fundamentally wrong with you.",
      "If rejection has left a wound in your heart that still hasn't healed, lean in. God has something to speak directly into that wound today.",

      "Rejection tells a story about you — but it's a false story. It says you're not enough. You're not wanted. You're not worthy.",
      "Maybe a parent left when you were young, and you've spent your whole life wondering — was it my fault? Maybe a spouse chose someone else, and your world shattered in a single conversation.",
      "Maybe friends you trusted slowly disappeared for reasons you'll never fully understand. Maybe you poured your heart into something — a job application, a ministry, a creative dream — and they said no.",
      "And now a part of you has built walls. You're afraid to try again. Afraid to open up. Afraid to let anyone get close enough to reject you a second time.",
      "That self-protection feels safe. It feels smart. But it's actually a prison — keeping you locked inside while life goes on outside the walls. And Jesus came to break you out of that prison.",

      "Isaiah chapter fifty-three, verse three — written seven hundred years before Jesus was born — describes the Savior of the world with heartbreaking accuracy.",
      "He is despised and rejected of men; a man of sorrows, and acquainted with grief: and we hid as it were our faces from him; he was despised, and we esteemed him not.",
      "Jesus — the eternal Son of God, the Creator of every star in the sky — was despised. Rejected. Esteemed as nothing. People literally turned their faces away from Him as though He disgusted them.",
      "His own hometown tried to throw Him off a cliff. His own brothers thought He had lost His mind. Judas, one of His closest twelve friends, sold Him out for thirty pieces of silver — the price of a common slave — and betrayed Him with a kiss.",
      "If anyone in all of history understands what rejection feels like, it is Jesus Christ. He doesn't empathize from a comfortable distance. He has lived it.",

      "But here's where the story turns. Psalm twenty-seven, verse ten says,",
      "When my father and my mother forsake me, then the LORD will take me up.",
      "When — not if — when everyone else walks away, God picks you up. He anticipated your rejection before it happened. And He already planned how to meet you in it.",

      "And in Romans chapter eight, verse thirty-one, Paul asks the question that silences every rejection you have ever experienced.",
      "If God be for us, who can be against us?",
      "Let that sink in. If the Creator of the universe — the God who spoke galaxies into existence — is for you. Actively, personally, relentlessly for you. Then every rejection you've ever received loses its power. Every closed door, every turned back, every cold shoulder — it doesn't define you.",
      "People's opinion of you does not determine your value. God's opinion does. And His opinion was settled permanently at Calvary.",
      "He looked at you — knowing everything about you, every flaw, every failure — and He said, I'd rather die than spend eternity without you. That is what the cross means.",

      "Jesus was rejected by men so that you could be accepted by God. That's the great exchange.",
      "Ephesians chapter one, verse six says He hath made us accepted in the beloved.",
      "Accepted. Not barely tolerated. Not reluctantly included. Accepted — fully, completely, joyfully — in the Beloved. In Christ. That is your permanent, unshakeable, irrevocable identity now.",
      "No breakup can revoke it. No firing can cancel it. No betrayal can undo it. What God has declared, no human opinion can overrule.",

      "Your one thing today — stop rehearsing the rejection and start rehearsing the acceptance.",
      "Every time that painful memory replays in your mind, replace it with these words: I am accepted in the Beloved. I am chosen. I am wanted. The God of the universe is for me.",

      "Let's pray. Father, the pain of rejection runs deep. Some of these wounds have been open for years and the sting hasn't faded.",
      "But you chose us before the foundation of the world. You wanted us when no one else did. You paid the ultimate price to call us your own.",
      "Heal the wound of rejection today, Lord. Replace it with the unshakeable, permanent truth that we are accepted in Christ.",
      "We are yours. And absolutely nothing can change that. In Jesus' powerful name, amen."
    ])
  }
};

// ─────────────────────────────────────────────────────────
// Write to daily-word.json
// ─────────────────────────────────────────────────────────
const jsonPath = path.join(__dirname, '..', 'public', 'data', 'podcasts', 'daily-word.json');
const data = JSON.parse(fs.readFileSync(jsonPath, 'utf-8'));

// Add new episodes
for (const [key, ep] of Object.entries(episodes)) {
  data.episodes[key] = ep;
}

// Word count + duration summary
console.log('\n📻 Daily Word — Batch 1: Emotional Struggles\n');
console.log('Ep  | Title                              | Words | Duration');
console.log('----|---------------------------------------|-------|--------');
let totalWords = 0;
for (const [key, ep] of Object.entries(episodes)) {
  const words = ep.transcript.reduce((sum, seg) => sum + seg.text.split(/\s+/).length, 0);
  const dur = ep.transcript[ep.transcript.length - 1].end;
  totalWords += words;
  // Update actual duration
  data.episodes[key].duration = dur;
  console.log(`${key.padStart(3)} | ${ep.title.padEnd(37)} | ${String(words).padStart(5)} | ${dur}s (${(dur/60).toFixed(1)}m)`);
}

console.log('----|---------------------------------------|-------|--------');
console.log(`Avg | ${''.padEnd(37)} | ${String(Math.round(totalWords/10)).padStart(5)} | avg`);

fs.writeFileSync(jsonPath, JSON.stringify(data, null, 2), 'utf-8');
console.log(`\nWrote ${Object.keys(episodes).length} episodes to ${jsonPath}`);
console.log(`Total episodes in file: ${Object.keys(data.episodes).length}`);
