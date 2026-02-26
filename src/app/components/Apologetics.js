"use client";
import { useState, useEffect } from "react";

const CATEGORY_COLORS = {
  "The Godhead":          { bg: "#F3E8FF", text: "#6B21A8", border: "#C084FC" },
  "The Person of Christ": { bg: "#FEF3C7", text: "#92400E", border: "#F59E0B" },
  "Scripture":            { bg: "#FEF9C3", text: "#713F12", border: "#CA8A04" },
  "The Cross":            { bg: "#FFE4E6", text: "#9F1239", border: "#FB7185" },
  "History & Evidence":   { bg: "#E0F2FE", text: "#075985", border: "#38BDF8" },
  "Suffering & God":      { bg: "#F0FDF4", text: "#166534", border: "#4ADE80" },
  "Reason & Philosophy":  { bg: "#F5F3FF", text: "#4C1D95", border: "#A78BFA" },
};

const APOLOGETICS_TOPICS = [
  {
    id: 1, icon: "🔱",
    title: "The Trinity",
    question: "Where does the Bible say God is three?",
    objection: "The word 'Trinity' never appears in the Bible. God is one, not three.",
    answer: `The word "Trinity" is a theological term summarising what Scripture teaches — just as the word "Bible" never appears in the Bible. The concept runs throughout.\n\nAt Jesus' baptism, the Father speaks from heaven, the Son stands in the water, and the Spirit descends as a dove — three distinct persons, one event (Matthew 3:16-17). Genesis 1:26 says "Let us make man in our image" — plural, from a strictly monotheistic author.\n\nThe Shema of Deuteronomy 6:4 declares God is "echad" — the Hebrew word for compound unity, the same word used when husband and wife become "one flesh" — not "yachid," which means absolute singularity.\n\nThe Great Commission baptises in one name (singular) of the Father, Son and Holy Spirit (Matthew 28:19). The Trinity is not three Gods — it is one God eternally existing in three persons.`,
    keyVerse: { ref: "Matthew 28:19", text: "baptizing them in the name of the Father, and of the Son, and of the Holy Ghost" },
    category: "The Godhead", color: "#7C3AED",
  },
  {
    id: 2, icon: "✝️",
    title: "Did Jesus Claim to Be God?",
    question: "Jesus never said 'I am God' — he only called himself the Son of God.",
    objection: "If Jesus were God, he would have said so plainly.",
    answer: `Jesus made the claim repeatedly — and his Jewish audience understood it perfectly, which is precisely why they tried to stone him.\n\nIn John 8:58, Jesus says "Before Abraham was, I AM" — directly taking the divine name God declared in Exodus 3:14. They reached for stones immediately. In John 10:30 he says "I and the Father are one" — again they tried to stone him, explaining "thou, being a man, makest thyself God" (v.33).\n\nIn Mark 2:5-7, he forgives sins — something only God can do, and the Pharisees knew it. In John 14:9 he says "He that hath seen me hath seen the Father." In Revelation 1:17 the risen Christ declares "I am the First and the Last" — the exact title God uses in Isaiah 44:6.\n\nHis enemies understood the claim perfectly. The only question is whether it is true.`,
    keyVerse: { ref: "John 8:58", text: "Before Abraham was, I am." },
    category: "The Person of Christ", color: "#D97706",
  },
  {
    id: 3, icon: "🙏",
    title: "If Jesus Is God, Why Did He Pray?",
    question: "Jesus knelt and prayed to God — that proves he is not God, just a servant.",
    objection: "God doesn't pray to himself.",
    answer: `This challenge assumes Jesus can only be one thing — either fully God or a creature who prays. But the incarnation is the key: the eternal Son of God took on human flesh (John 1:14).\n\nIn his humanity, Jesus experienced hunger, thirst, weariness, and prayer. His praying was not weakness — it was perfect submission in his human nature, modelling for us what full dependence on the Father looks like.\n\nThe Son did not cease being God when he became man — he added humanity to his divinity (Philippians 2:5-8). A king who goes undercover as a servant still bows to the throne in his servant role — that does not stop him being king.\n\nJesus prayed as man, on behalf of humanity — which is precisely why he is the perfect mediator between God and man (1 Timothy 2:5).`,
    keyVerse: { ref: "Philippians 2:7", text: "he...made himself of no reputation, and took upon him the form of a servant" },
    category: "The Person of Christ", color: "#D97706",
  },
  {
    id: 4, icon: "⏰",
    title: "Jesus Didn't Know the Hour?",
    question: "Mark 13:32 says even the Son doesn't know the day or hour.",
    objection: "An omniscient God cannot be ignorant of anything.",
    answer: `This is one of the strongest defenses in Scripture, and it operates on two levels.\n\nFirst, the Greek word translated "know" is "oida" — whose semantic range includes not just knowing but declaring or acknowledging publicly. Paul uses the exact same word in 1 Corinthians 2:2: "I determined not to know anything among you, save Jesus Christ." That was a statement of intentional focus, not ignorance.\n\nSecond, and even more powerfully — Jesus is speaking into the framework of Jewish betrothal culture. When a bridegroom was betrothed, he returned to his father's house to prepare a dwelling for his bride. If anyone asked "when is the wedding?" the groom's culturally understood answer was always "only my father knows" — because the father alone had authority to set the date.\n\nJesus uses this exact framework in John 14:2-3. Mark 13:32 is not a statement of ignorance — it is a statement of covenantal propriety: "The announcement of that hour belongs to the Father."`,
    keyVerse: { ref: "John 14:2-3", text: "I go to prepare a place for you...I will come again, and receive you unto myself" },
    category: "The Person of Christ", color: "#D97706",
  },
  {
    id: 5, icon: "👑",
    title: "The Father Is Greater",
    question: "Jesus said the Father is greater — doesn't that prove he's not equal to God?",
    objection: "Jesus' own words in John 14:28 place the Father above him.",
    answer: `"Greater" here refers to position, not nature. A president is greater in position than a citizen — but both are equally human. Jesus in his incarnate, humbled state was positionally subordinate: sent, obedient, voluntarily limited. But positional submission does not imply ontological inferiority.\n\nPaul uses the same logic in 1 Corinthians 11:3 — the Father is the head of Christ in the economy of redemption — yet Colossians 2:9 declares "in him dwelleth all the fulness of the Godhead bodily." Both are simultaneously true.\n\nContext matters too. Jesus spoke these words to comfort disciples who were grieved he was leaving. "The Father is greater" means "I am going to a place of glory — rejoice for me." It is a statement of comfort, not a theology lecture about subordination.`,
    keyVerse: { ref: "Colossians 2:9", text: "in him dwelleth all the fulness of the Godhead bodily" },
    category: "The Godhead", color: "#7C3AED",
  },
  {
    id: 6, icon: "📜",
    title: "Has the Bible Been Corrupted?",
    question: "The Bible was copied for centuries — it must have been changed.",
    objection: "We cannot trust a book passed through so many human hands.",
    answer: `This is the most checkable claim in the conversation. We possess over 5,800 Greek New Testament manuscripts — more than any other ancient document by a factor of ten. Homer's Iliad has 643. Caesar's Gallic Wars has 10.\n\nThe gap between NT originals and our earliest copies is 25–50 years — compared to 1,000+ years for most ancient texts. When scholars compare manuscripts across centuries and continents, they find 99.5% agreement. The variations are spelling differences and word order — nothing that affects a single Christian doctrine.\n\nThe Dead Sea Scrolls, discovered in 1947, contained Isaiah scrolls 1,000 years older than anything previously known — virtually identical to what we already had.\n\nIf the Bible were corrupted, three questions demand an answer: When did it happen? Who did it? And why do thousands of manuscripts across three continents agree?`,
    keyVerse: { ref: "Isaiah 40:8", text: "the word of our God shall stand for ever" },
    category: "Scripture", color: "#B45309",
  },
  {
    id: 7, icon: "🕊️",
    title: "Is the Holy Spirit a Force?",
    question: "The Spirit is just God's power or energy — not an actual person.",
    objection: "Scripture never clearly says the Spirit is a distinct person.",
    answer: `Scripture consistently attributes personal qualities to the Spirit that a force cannot possess. He grieves (Ephesians 4:30) — forces do not feel grief. He teaches (John 14:26) — forces do not instruct. He intercedes with groanings (Romans 8:26) — forces do not pray. He speaks (Acts 13:2) — forces do not talk.\n\nHe can be lied to (Acts 5:3-4) — and in that same passage, lying to the Spirit is equated directly with lying to God.\n\nNotably, Jesus uses the personal pronoun "he" (Greek: ekeinos) repeatedly for the Spirit in John 14–16, even though "Spirit" (pneuma) is grammatically neuter in Greek. This is a deliberate grammatical choice — made specifically to emphasise personhood.\n\nThe Spirit is as fully personal as the Father and the Son.`,
    keyVerse: { ref: "Acts 5:3-4", text: "thou hast not lied unto men, but unto God" },
    category: "The Godhead", color: "#7C3AED",
  },
  {
    id: 8, icon: "♾️",
    title: "Was Jesus Created?",
    question: "Colossians 1:15 calls Jesus 'firstborn of creation' — wasn't he made?",
    objection: "'Firstborn' means Jesus had a beginning and is therefore a creature.",
    answer: `"Firstborn" (prototokos in Greek, bekor in Hebrew) in both cultures meant preeminent heir — not the first one born chronologically. Psalm 89:27 calls David "my firstborn" — yet David was the last-born son of Jesse. The title was about rank and supremacy, not birth order.\n\nColossians 1:16 answers the question immediately: "For by him were all things created." If Jesus were part of creation, he cannot simultaneously be the one through whom all creation came into being.\n\nJohn 1:1-3 is unambiguous: "In the beginning was the Word... all things were made by him; and without him was not any thing made that was made." The word "all" (panta) is absolute — it includes everything that exists.\n\nJesus is the Creator. He cannot also be the created.`,
    keyVerse: { ref: "John 1:3", text: "All things were made by him; and without him was not any thing made that was made." },
    category: "The Person of Christ", color: "#D97706",
  },
  {
    id: 9, icon: "😢",
    title: "Did God Abandon Jesus?",
    question: "Jesus cried 'Why hast thou forsaken me?' — did the Trinity break apart?",
    objection: "A forsaken Jesus cannot be God.",
    answer: `Jesus is quoting Psalm 22:1 — and every Jewish listener at the cross would have known exactly what he was doing. He was reciting a Messianic psalm in his moment of deepest agony.\n\nIn his humanity, bearing the full judicial weight of sin on behalf of mankind, he experienced the withdrawal of the Father's felt presence — not an ontological separation of divine persons. It is the cry of the sin-bearer, not the dissolution of the Trinity.\n\nCrucially, Psalm 22 does not end in abandonment — it ends in triumphant resurrection vindication (vv.22-31). Jesus recited the opening line of a psalm whose conclusion is victory.\n\nAnd the Father did not ultimately abandon him: "He hath not despised nor abhorred the affliction of the afflicted; neither hath he hidden his face from him; but when he cried unto him, he heard" (Psalm 22:24). The cross was the greatest act of love in history.`,
    keyVerse: { ref: "Psalm 22:24", text: "when he cried unto him, he heard" },
    category: "The Cross", color: "#E11D48",
  },
  {
    id: 10, icon: "🔥",
    title: "No One Has Seen God — But Moses Did?",
    question: "John 1:18 says no man has seen God — but Abraham and Moses saw him. Contradiction?",
    objection: "The Bible contradicts itself on whether God can be seen.",
    answer: `John 1:18 contains its own answer: "No man hath seen God at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him." The one who appeared in the Old Testament theophanies was the pre-incarnate Son — the visible, approachable member of the Trinity — making God known to humanity.\n\nIsaiah 6 records the prophet seeing "the LORD" — and John 12:41 explicitly identifies this: "These things said Esaias, when he saw his [Christ's] glory, and spake of him." When Jacob wrestled with "a man" who turned out to be God (Genesis 32:24-30), that was the pre-incarnate Christ.\n\nThe Father — in his full divine essence — no human can see and live (Exodus 33:20). But the Son has always been the one through whom God makes himself visible.\n\nThe incarnation was not the first time the Son appeared to humanity — it was the fullest and final form of what he had been doing throughout all of history.`,
    keyVerse: { ref: "John 12:41", text: "These things said Esaias, when he saw his glory, and spake of him." },
    category: "Scripture", color: "#B45309",
  },
  {
    id: 11, icon: "🌅",
    title: "The Resurrection",
    question: "The disciples stole the body — or Jesus never really died.",
    objection: "The resurrection is a legend. There are natural explanations.",
    answer: `Historian N.T. Wright, in his 800-page academic work The Resurrection of the Son of God (2003), concluded after examining every alternative theory that the bodily resurrection remains the only historically adequate explanation for the data.\n\nScholars across theological traditions — including sceptics — accept four facts as historically established: (1) Jesus died by Roman crucifixion; (2) the tomb was found empty on the third day; (3) multiple individuals and groups reported post-resurrection appearances; (4) the disciples underwent a transformation from terrified fugitives to people willing to die for this claim.\n\nThe "stolen body" theory was the first alternative proposed (Matthew 28:13) — and it fails immediately: Roman soldiers faced execution for sleeping on watch. The "swoon theory" (he survived) was demolished by medical scholars — Roman executioners were professionals, and a spear to the side (John 19:34) confirmed death. Historian Gary Habermas has documented over 1,200 scholarly works affirming the historicity of the empty tomb.\n\nAs C.S. Lewis observed: the disciples did not die for a vision or a symbol — they died insisting on a bodily, physical event they personally witnessed.`,
    keyVerse: { ref: "1 Corinthians 15:6", text: "he was seen of above five hundred brethren at once; of whom the greater part remain unto this present" },
    category: "History & Evidence", color: "#0369A1",
  },
  {
    id: 12, icon: "👶",
    title: "The Virgin Birth",
    question: "A virgin birth is biologically impossible — this is mythology.",
    objection: "Matthew and Luke copied the idea from pagan myths about gods and mortal women.",
    answer: `The claim that the virgin birth was borrowed from pagan mythology was popularised in the 19th century but is rejected by mainstream classical scholars today. The supposed parallels — Zeus fathering Hercules, etc. — involve physical unions between gods and women, not virginal conception. They are categorically different. Classicist Ronald Nash, in The Gospel and the Greeks (2003), systematically dismantled these parallels.\n\nMore significantly, the Jewish context of Matthew and Luke makes a pagan borrowing implausible. The virgin birth would have been scandalous — not appealing — to a Jewish audience. The authors recorded it precisely because it was unexpected and historically attested, not because it was culturally flattering.\n\nThe Hebrew of Isaiah 7:14 uses "almah" — a young woman of marriageable age, understood in its Septuagint (Greek) translation as "parthenos" (virgin) — which Matthew cites directly. Geneticist and Christian Francis Collins notes that while the event is outside ordinary biology, a God capable of creating the cosmos is not constrained by it.\n\nThe virgin birth is not an embarrassment — it is the mechanism of the incarnation: the eternal Son entering human nature without inheriting Adamic sin (Romans 5:12-19).`,
    keyVerse: { ref: "Isaiah 7:14", text: "Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel." },
    category: "History & Evidence", color: "#0369A1",
  },
  {
    id: 13, icon: "🪞",
    title: "Is Jesus the Only Way?",
    question: "Isn't it arrogant to say Christianity is the only true religion?",
    objection: "All religions lead to God. Claiming exclusivity is intolerant.",
    answer: `C.S. Lewis addressed this directly in Mere Christianity: the question is not whether exclusivity is polite, but whether it is true. Every major worldview — not just Christianity — makes exclusive truth claims. Buddhism says the self is an illusion; Islam says Jesus was not divine; secular humanism says there is no God. The claim "all religions are equally true" is itself an exclusive claim that contradicts most of what those religions actually teach.\n\nTim Keller, in The Reason for God (2008), notes that Jesus' claim in John 14:6 is unique in a specific way: he does not say "follow my teachings and you will find God" — he says "I am the way." The path is a person, not a system of rules. This is not the logic of religion — it is the logic of rescue.\n\nThe charge of arrogance misreads the claim. Christianity does not say "we are better people." It says "we received a gift we did not deserve and could not earn." The exclusive claim is grounded not in superiority but in a historical event — the resurrection — which either happened or did not. If it happened, the implications follow necessarily.\n\nAs Keller puts it: if you were sick and a doctor said "this specific medicine will cure you," you would not call him arrogant. You would ask whether it was true.`,
    keyVerse: { ref: "John 14:6", text: "I am the way, the truth, and the life: no man cometh unto the Father, but by me." },
    category: "Reason & Philosophy", color: "#6D28D9",
  },
  {
    id: 14, icon: "🦕",
    title: "Genesis & Science",
    question: "The Bible says the earth is 6,000 years old — science says billions. Who is right?",
    objection: "Genesis contradicts modern science and therefore cannot be trusted.",
    answer: `This objection assumes all Christians interpret Genesis as a precise scientific chronology — but this is not, and has never been, the only serious reading of the text.\n\nOxford mathematician and Christian John Lennox, in Seven Days That Divide the World (2011), demonstrates that the Hebrew word "yom" (day) is used in Genesis itself in non-literal ways (Genesis 2:4 refers to all six days as a single "yom"). The early church father Origen and Augustine both warned against reading Genesis as a scientific document in their own centuries — long before Darwin.\n\nFrancis Collins, former director of the Human Genome Project and founder of BioLogos, is an evangelical Christian who accepts an ancient universe and common descent. He argues these are questions of how God created — not whether he did.\n\nThe core theological claims of Genesis 1-2 are: God created everything from nothing (ex nihilo); creation is good; humanity bears the image of God (imago Dei); we are morally accountable to our Creator. None of these claims are threatened by the age of the universe. Hebrews 11:3 says "the worlds were framed by the word of God" — the mechanism is secondary to the Author.`,
    keyVerse: { ref: "Hebrews 11:3", text: "the worlds were framed by the word of God, so that things which are seen were not made of things which do appear." },
    category: "Reason & Philosophy", color: "#6D28D9",
  },
  {
    id: 15, icon: "📖",
    title: "Who Decided the Canon?",
    question: "The books of the Bible were chosen by powerful men at councils — other gospels were suppressed.",
    objection: "The canon is a political decision, not a divine one.",
    answer: `This narrative was popularised by The Da Vinci Code (2003) and is rejected by virtually all serious historians — Christian and secular. F.F. Bruce's The Canon of Scripture (1988) and Michael Kruger's Canon Revisited (2012) are the standard academic responses.\n\nThe facts: the four Gospels — Matthew, Mark, Luke, John — were universally cited and accepted by Christian communities from the late first and early second centuries, long before any council. Ignatius of Antioch (died ~107 AD) quotes multiple New Testament letters. The Muratorian Fragment (~170 AD) lists most of the New Testament as already accepted.\n\nThe Council of Nicaea (325 AD) did not vote on the canon — this is a popular myth with no historical basis. The canon was formally ratified at councils in Hippo (393 AD) and Carthage (397 AD) — but these councils recognised what was already in widespread use, they did not create it.\n\nThe "suppressed gospels" (Gospel of Thomas, Gospel of Judas, etc.) date from the second and third centuries — generations after the apostles. They were not suppressed; they were simply late, anonymous, and inconsistent with first-century apostolic testimony. Gnostic texts were well-known and widely discussed — they were not hidden.`,
    keyVerse: { ref: "2 Peter 1:21", text: "holy men of God spake as they were moved by the Holy Ghost." },
    category: "Scripture", color: "#B45309",
  },
  {
    id: 16, icon: "🏛️",
    title: "Were the Gospels Written Too Late?",
    question: "The Gospels were written centuries after Jesus — they can't be eyewitness accounts.",
    objection: "Legends developed over generations. The Gospels are theological fiction.",
    answer: `This objection rests on a chronology that most New Testament scholars — across the theological spectrum — do not accept. The majority date the Gospels to within one generation of the events: Mark ~65-70 AD, Matthew and Luke ~80 AD, John ~90 AD. Paul's letters — which contain detailed resurrection accounts — are dated to the 50s AD, within 20 years of the crucifixion.\n\nRichard Bauckham's Jesus and the Eyewitnesses (2006), described by reviewers as one of the most important New Testament studies in decades, demonstrates that the Gospels bear the literary marks of eyewitness testimony. He identifies named individuals in the Gospels (Simon of Cyrene, Bartimaeus, etc.) as the living sources the early communities could verify or challenge.\n\nCraig Blomberg's The Historical Reliability of the Gospels (1987, updated 2007) surveys the archaeological and textual evidence comprehensively. Archaeologist William Albright wrote: "We can already say emphatically that there is no long interval between the Gospel of John and the period of the Apostles."\n\nFor legend to develop to the scale proposed by sceptics, you need centuries and geographic distance — not 20-40 years, in the same city, with living witnesses still present.`,
    keyVerse: { ref: "Luke 1:2", text: "Even as they delivered them unto us, which from the beginning were eyewitnesses, and ministers of the word" },
    category: "History & Evidence", color: "#0369A1",
  },
  {
    id: 17, icon: "😔",
    title: "The Problem of Evil",
    question: "If God is all-powerful and good, why does suffering exist?",
    objection: "Evil and suffering prove God is either not good or not powerful — or does not exist.",
    answer: `This is the most serious objection to theism and deserves a serious answer. Philosopher Alvin Plantinga, whose work is acknowledged even by atheist philosophers, demonstrated in God, Freedom and Evil (1974) that the existence of evil is logically compatible with an omnipotent, benevolent God — specifically through the Free Will Defense: a world with genuine freedom, capable of love, necessarily permits the possibility of its misuse.\n\nC.S. Lewis in The Problem of Pain (1940) adds: "God whispers to us in our pleasures, speaks in our conscience, but shouts in our pains: it is his megaphone to rouse a deaf world." Suffering, while terrible, is not purposeless in the Christian framework — it is the environment in which character, perseverance, and compassion are forged (Romans 5:3-4).\n\nThe strongest version of the objection — the emotional problem of evil — is that suffering makes it psychologically difficult to believe. Lewis's A Grief Observed (1961) is the most honest wrestling with this that exists. His conclusion: suffering does not disprove God; it reveals our need for him.\n\nCrucially, the Christian God is not a distant observer of suffering — he entered it. The cross is God's answer to the problem of evil, not his absence from it.`,
    keyVerse: { ref: "Romans 8:18", text: "the sufferings of this present time are not worthy to be compared with the glory which shall be revealed in us." },
    category: "Suffering & God", color: "#059669",
  },
  {
    id: 18, icon: "⛓️",
    title: "Hell & a Loving God",
    question: "A loving God wouldn't send people to hell. It's disproportionate and cruel.",
    objection: "Eternal punishment for finite sins cannot be just.",
    answer: `C.S. Lewis offers the most widely cited reframe in The Great Divorce (1945): "There are only two kinds of people in the end: those who say to God, 'Thy will be done,' and those to whom God says, 'Thy will be done.' All that are in Hell, choose it."\n\nThe biblical picture of hell is not God chasing people down and throwing them in against their will — it is God honouring the persistent, final choice of people who refused him. Tim Keller in The Reason for God (2008) notes: "All God does in the end with people is give them what they most wanted, including freedom from himself."\n\nOn proportionality: the severity of an offence is measured partly by the dignity of the one offended. Rebellion against the eternal, holy God is not a small thing — and those who resist it until death are not reformable by more time, but only by a change of will they have permanently refused.\n\nAlso: the same Bible that speaks of hell speaks of God's longing that none should perish (2 Peter 3:9) and of Christ dying for all (1 Timothy 2:6). Hell is not God's preferred outcome — it is the ultimate cost of real freedom. A God who eliminates hell by eliminating human freedom is not more loving — he is less.`,
    keyVerse: { ref: "2 Peter 3:9", text: "not willing that any should perish, but that all should come to repentance." },
    category: "Suffering & God", color: "#059669",
  },
  {
    id: 19, icon: "⚖️",
    title: "The Moral Argument",
    question: "You don't need God to be a good person. Morality is just common sense.",
    objection: "Atheists can be moral. God is not needed for ethics.",
    answer: `The moral argument does not claim that atheists cannot behave morally. It asks a more precise question: if there is no God, on what foundation does objective moral law rest?\n\nC.S. Lewis opens Mere Christianity with this argument: we all appeal to a standard of fairness and justice when we quarrel — even people who deny that such a standard exists. That standard is not invented by cultures (cultures have justified slavery, genocide, and torture). It transcends cultures, which is why we can judge them.\n\nWilliam Lane Craig formulates it: (1) If God does not exist, objective moral values do not exist. (2) Objective moral values do exist. (3) Therefore, God exists. Philosopher Derek Parfit — an atheist — admitted that grounding objective morality without God is "the hardest problem in philosophy."\n\nNietzsche understood the stakes more clearly than most: if God is dead, objective morality goes with him. "Beyond good and evil" was his logical conclusion. The atheist who insists that torturing children for fun is genuinely, objectively wrong — not merely unfashionable — is quietly borrowing from a theistic framework.\n\nThe point is not that you need to believe in God to be good. It is that you need God to exist for "good" to mean anything beyond personal preference.`,
    keyVerse: { ref: "Romans 2:15", text: "the work of the law written in their hearts, their conscience also bearing witness" },
    category: "Reason & Philosophy", color: "#6D28D9",
  },
  {
    id: 20, icon: "🌌",
    title: "The Cosmological Argument",
    question: "The universe could have come from nothing. God is an unnecessary hypothesis.",
    objection: "Science explains origins without needing a Creator.",
    answer: `The Kalam Cosmological Argument, championed by philosopher William Lane Craig and rooted in medieval scholarship (Al-Ghazali, 11th century), runs: (1) Everything that begins to exist has a cause. (2) The universe began to exist. (3) Therefore, the universe has a cause.\n\nThe second premise is now supported by mainstream cosmology. The Big Bang (Friedmann, Lemaître, confirmed by Hubble in 1929) established that the universe — all matter, energy, space, and time — had an absolute beginning. Stephen Hawking wrote: "Almost everyone now believes that the universe, and time itself, had a beginning at the Big Bang." The Borde-Guth-Vilenkin theorem (2003) extends this even to proposed multiverse models — any expanding universe requires a beginning.\n\nThe response "the universe came from nothing" is not a scientific answer — it is a philosophical one, and it violates the most basic principle of reason: ex nihilo nihil fit (from nothing, nothing comes). Lawrence Krauss's "nothing" in A Universe from Nothing (2012) was shown by philosophers — including atheist philosopher David Albert — to actually be a quantum vacuum, which is emphatically not nothing.\n\nThe cause of the universe must be outside space and time (since it created them), immensely powerful, and — to choose to create — personal. Anthony Flew, the most prominent atheist philosopher of the 20th century, announced his conversion to theism in 2004 citing precisely this argument.`,
    keyVerse: { ref: "Genesis 1:1", text: "In the beginning God created the heaven and the earth." },
    category: "Reason & Philosophy", color: "#6D28D9",
  },
];

export default function Apologetics({ nav }) {
  const [selected, setSelected]   = useState(null);
  const [revealed, setRevealed]   = useState(false);
  const [studied, setStudied]     = useState({});
  const [filterCat, setFilterCat] = useState("All");
  const [animIn, setAnimIn]       = useState(false);

  const topic = APOLOGETICS_TOPICS.find(t => t.id === selected);
  const categories = ["All", ...Object.keys(CATEGORY_COLORS)];
  const visible = filterCat === "All"
    ? APOLOGETICS_TOPICS
    : APOLOGETICS_TOPICS.filter(t => t.category === filterCat);

  const openTopic = (id) => {
    setSelected(id);
    setRevealed(false);
    setTimeout(() => setAnimIn(true), 10);
  };

  const closeModal = () => {
    setAnimIn(false);
    setTimeout(() => { setSelected(null); setRevealed(false); }, 280);
  };

  const markStudied = (id) => {
    setStudied(prev => ({ ...prev, [id]: !prev[id] }));
  };

  const studiedCount = Object.values(studied).filter(Boolean).length;

  useEffect(() => {
    if (selected) document.body.style.overflow = "hidden";
    else document.body.style.overflow = "";
    return () => { document.body.style.overflow = ""; };
  }, [selected]);

  return (
    <div style={{ minHeight: "100vh", background: "#F8F5F0", fontFamily: "'Georgia', serif" }}>

      {/* ── HERO ── */}
      <div style={{
        background: "linear-gradient(135deg, #B8860B 0%, #DAA520 25%, #1B7A6E 70%, #0F5548 100%)",
        position: "relative", overflow: "hidden",
      }}>
        {/* Decorative circles */}
        <div style={{ position:"absolute", top:-60, right:-60, width:200, height:200, borderRadius:"50%", background:"rgba(255,255,255,0.06)", pointerEvents:"none" }} />
        <div style={{ position:"absolute", bottom:-40, left:-40, width:160, height:160, borderRadius:"50%", background:"rgba(255,255,255,0.05)", pointerEvents:"none" }} />

        {/* Back button */}
        <div style={{ padding:"16px 20px 0" }}>
          <button onClick={() => nav("learn-home")} style={{
            background:"rgba(255,255,255,0.15)", backdropFilter:"blur(8px)",
            border:"1px solid rgba(255,255,255,0.3)", borderRadius:8,
            color:"#fff", fontSize:12, padding:"6px 14px",
            cursor:"pointer", fontFamily:"'Georgia', serif",
          }}>
            ← Learning Centre
          </button>
        </div>

        {/* Hero content */}
        <div style={{ textAlign:"center", padding:"28px 24px 0" }}>
          <div style={{ fontSize:52, marginBottom:10, filter:"drop-shadow(0 4px 12px rgba(0,0,0,0.2))" }}>🛡️</div>
          <h1 style={{
            fontFamily:"'Georgia', serif", fontSize:"clamp(30px,7vw,44px)",
            fontWeight:400, color:"#fff", margin:"0 0 10px",
            textShadow:"0 2px 16px rgba(0,0,0,0.3)", letterSpacing:"-0.5px",
          }}>
            Apologetics
          </h1>
          <p style={{
            fontFamily:"'Georgia', serif", fontStyle:"italic",
            fontSize:"clamp(13px,3vw,15px)", color:"rgba(255,255,255,0.88)",
            margin:"0 0 20px", lineHeight:1.5,
          }}>
            "Ready to give an answer. Ready to do it with gentleness."
          </p>

          {/* Progress pill */}
          <div style={{
            display:"inline-flex", alignItems:"center", gap:10,
            background:"rgba(255,255,255,0.15)", backdropFilter:"blur(8px)",
            borderRadius:20, padding:"8px 18px", marginBottom:28,
          }}>
            <div style={{ width:90, height:6, background:"rgba(255,255,255,0.25)", borderRadius:3, overflow:"hidden" }}>
              <div style={{
                height:"100%", borderRadius:3, background:"rgba(255,255,255,0.9)",
                width:`${(studiedCount / APOLOGETICS_TOPICS.length) * 100}%`,
                transition:"width 0.4s ease",
              }} />
            </div>
            <span style={{ fontSize:11, color:"rgba(255,255,255,0.85)", fontFamily:"'Georgia', serif" }}>
              {studiedCount} / {APOLOGETICS_TOPICS.length} studied
            </span>
          </div>
        </div>

        {/* Category filter tabs */}
        <div style={{
          display:"flex", gap:6, overflowX:"auto", padding:"0 16px 0",
          scrollbarWidth:"none", WebkitOverflowScrolling:"touch",
          justifyContent:"center", flexWrap:"wrap",
        }}>
          {categories.map(cat => (
            <button key={cat} onClick={() => setFilterCat(cat)} style={{
              background: filterCat === cat ? "rgba(255,255,255,0.95)" : "rgba(255,255,255,0.18)",
              border:"none", borderRadius:"20px 20px 0 0",
              color: filterCat === cat ? "#1B7A6E" : "rgba(255,255,255,0.85)",
              fontSize:11, padding:"8px 14px", cursor:"pointer", whiteSpace:"nowrap",
              fontFamily:"'Georgia', serif", fontWeight: filterCat === cat ? 700 : 400,
              transition:"all 0.2s",
            }}>
              {cat}
            </button>
          ))}
        </div>
      </div>

      {/* ── GRID ── */}
      <div style={{ padding:"20px 14px 48px", maxWidth:720, margin:"0 auto" }}>
        <p style={{ fontFamily:"'Georgia', serif", fontSize:12, color:"#9CA3AF", margin:"0 0 14px", fontStyle:"italic" }}>
          {visible.length} defense{visible.length !== 1 ? "s" : ""} · tap a card to be challenged
        </p>

        <div style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:12 }}>
          {visible.map(t => {
            const cat = CATEGORY_COLORS[t.category];
            const done = studied[t.id];
            return (
              <button
                key={t.id}
                onClick={() => openTopic(t.id)}
                style={{
                  background: done ? "#F0FDF4" : "#FFFFFF",
                  border: done ? "1.5px solid #86EFAC" : "1.5px solid #E5E7EB",
                  borderRadius:14, padding:"14px 13px",
                  textAlign:"left", cursor:"pointer",
                  boxShadow:"0 2px 8px rgba(0,0,0,0.06)",
                  transition:"all 0.18s", position:"relative",
                  display:"flex", flexDirection:"column", gap:8,
                }}
              >
                {done && (
                  <div style={{
                    position:"absolute", top:8, right:8,
                    width:18, height:18, borderRadius:"50%",
                    background:"#22C55E", display:"flex",
                    alignItems:"center", justifyContent:"center",
                    fontSize:10, color:"#fff",
                  }}>✓</div>
                )}

                <div style={{
                  width:40, height:40, borderRadius:10,
                  background:`${t.color}18`, border:`1.5px solid ${t.color}40`,
                  display:"flex", alignItems:"center", justifyContent:"center", fontSize:20,
                }}>
                  {t.icon}
                </div>

                <div style={{
                  fontFamily:"'Georgia', serif", fontSize:"clamp(12px,3vw,13px)",
                  fontWeight:700, color:"#1F2937", lineHeight:1.25,
                }}>
                  {t.title}
                </div>

                <span style={{
                  display:"inline-block", background:cat.bg,
                  color:cat.text, border:`1px solid ${cat.border}50`,
                  borderRadius:20, fontSize:9, padding:"2px 7px",
                  fontFamily:"'Georgia', serif", alignSelf:"flex-start",
                }}>
                  {t.category}
                </span>

                <p style={{
                  fontFamily:"'Georgia', serif", fontSize:"clamp(11px,2.5vw,12px)",
                  color:"#6B7280", fontStyle:"italic", margin:0, lineHeight:1.45,
                  display:"-webkit-box", WebkitLineClamp:3,
                  WebkitBoxOrient:"vertical", overflow:"hidden",
                }}>
                  "{t.objection}"
                </p>

                <div style={{
                  marginTop:"auto", fontSize:10, color:t.color,
                  fontFamily:"'Georgia', serif", fontWeight:700,
                }}>
                  Can you answer this? →
                </div>
              </button>
            );
          })}
        </div>
      </div>

      {/* ── MODAL ── */}
      {selected && (
        <div
          onClick={closeModal}
          style={{
            position:"fixed", inset:0, background:"rgba(15,23,42,0.6)",
            backdropFilter:"blur(4px)", zIndex:100,
            display:"flex", alignItems:"flex-end",
            opacity: animIn ? 1 : 0, transition:"opacity 0.28s",
          }}
        >
          <div
            onClick={e => e.stopPropagation()}
            style={{
              width:"100%", maxWidth:680, margin:"0 auto",
              background:"#FFFFFF", borderRadius:"22px 22px 0 0",
              maxHeight:"88vh", overflowY:"auto",
              transform: animIn ? "translateY(0)" : "translateY(100%)",
              transition:"transform 0.3s cubic-bezier(0.32,0.72,0,1)",
            }}
          >
            {topic && (
              <>
                {/* Modal header */}
                <div style={{
                  background:`linear-gradient(135deg, ${topic.color}18, ${topic.color}06)`,
                  borderBottom:"1px solid #F3F4F6",
                  padding:"20px 20px 16px", position:"sticky", top:0,
                  borderRadius:"22px 22px 0 0", zIndex:1,
                }}>
                  <div style={{ width:36, height:4, background:"#E5E7EB", borderRadius:2, margin:"0 auto 14px" }} />
                  <div style={{ display:"flex", alignItems:"flex-start", gap:12 }}>
                    <div style={{
                      width:48, height:48, borderRadius:12, flexShrink:0,
                      background:`${topic.color}22`, border:`1.5px solid ${topic.color}50`,
                      display:"flex", alignItems:"center", justifyContent:"center", fontSize:24,
                    }}>
                      {topic.icon}
                    </div>
                    <div style={{ flex:1 }}>
                      <h2 style={{
                        fontFamily:"'Georgia', serif", fontSize:"clamp(16px,4vw,20px)",
                        fontWeight:700, color:"#111827", margin:"0 0 4px", lineHeight:1.2,
                      }}>
                        {topic.title}
                      </h2>
                      <span style={{
                        background: CATEGORY_COLORS[topic.category].bg,
                        color: CATEGORY_COLORS[topic.category].text,
                        borderRadius:20, fontSize:10, padding:"2px 9px",
                        fontFamily:"'Georgia', serif",
                      }}>
                        {topic.category}
                      </span>
                    </div>
                    <button onClick={closeModal} style={{
                      background:"#F3F4F6", border:"none", borderRadius:"50%",
                      width:32, height:32, cursor:"pointer", fontSize:16,
                      display:"flex", alignItems:"center", justifyContent:"center", flexShrink:0,
                    }}>×</button>
                  </div>
                </div>

                <div style={{ padding:"20px 20px 32px" }}>

                  {/* The Objection */}
                  <div style={{
                    background:"#FFF7ED", border:"1.5px solid #FED7AA",
                    borderLeft:"4px solid #F97316",
                    borderRadius:"0 10px 10px 0",
                    padding:"14px 16px", marginBottom:20,
                  }}>
                    <div style={{
                      fontSize:10, fontFamily:"'Georgia', serif", color:"#C2410C",
                      textTransform:"uppercase", letterSpacing:"1px", marginBottom:6, fontWeight:700,
                    }}>
                      ⚠️ The Challenge
                    </div>
                    <p style={{
                      fontFamily:"'Georgia', serif", fontSize:14,
                      color:"#7C2D12", fontStyle:"italic", margin:0, lineHeight:1.6,
                    }}>
                      "{topic.objection}"
                    </p>
                  </div>

                  {/* Reveal or Defense */}
                  {!revealed ? (
                    <div style={{ textAlign:"center", padding:"24px 0" }}>
                      <p style={{
                        fontFamily:"'Georgia', serif", fontSize:13,
                        color:"#9CA3AF", fontStyle:"italic", marginBottom:16,
                      }}>
                        How would you answer this? Think for a moment…
                      </p>
                      <button
                        onClick={() => setRevealed(true)}
                        style={{
                          background:"linear-gradient(135deg, #1B7A6E, #0F5548)",
                          border:"none", borderRadius:12, color:"#fff",
                          padding:"14px 32px", fontSize:14, cursor:"pointer",
                          fontFamily:"'Georgia', serif", fontWeight:700,
                          boxShadow:"0 4px 16px rgba(27,122,110,0.35)",
                          letterSpacing:"0.3px",
                        }}
                      >
                        📖 Reveal the Defense
                      </button>
                    </div>
                  ) : (
                    <div style={{ animation:"fadeIn 0.4s ease" }}>
                      <div style={{
                        fontSize:10, fontFamily:"'Georgia', serif", color:"#1B7A6E",
                        textTransform:"uppercase", letterSpacing:"1px",
                        marginBottom:12, fontWeight:700,
                      }}>
                        📖 The Defense
                      </div>

                      {topic.answer.split("\n\n").map((para, i) => (
                        <p key={i} style={{
                          fontFamily:"'Georgia', serif",
                          fontSize:"clamp(14px,3vw,15px)",
                          color:"#374151", lineHeight:1.8, margin:"0 0 14px",
                        }}>
                          {para}
                        </p>
                      ))}

                      {/* Key Verse */}
                      <div style={{
                        background:"linear-gradient(135deg, #FFFBEB, #F0FDF4)",
                        border:"1.5px solid #D4A853",
                        borderRadius:12, padding:"16px 18px", marginTop:8,
                      }}>
                        <div style={{
                          fontSize:10, color:"#B45309", fontFamily:"'Georgia', serif",
                          textTransform:"uppercase", letterSpacing:"1px",
                          marginBottom:8, fontWeight:700,
                        }}>
                          🗝 Key Verse
                        </div>
                        <p style={{
                          fontFamily:"'Georgia', serif", fontStyle:"italic",
                          fontSize:"clamp(14px,3.5vw,16px)", color:"#1F2937",
                          margin:"0 0 8px", lineHeight:1.55,
                        }}>
                          "{topic.keyVerse.text}"
                        </p>
                        <p style={{
                          fontFamily:"'Georgia', serif", fontSize:12,
                          color:"#B45309", margin:0, fontWeight:700,
                        }}>
                          — {topic.keyVerse.ref}
                        </p>
                      </div>

                      {/* Mark as studied */}
                      <button
                        onClick={() => { markStudied(topic.id); closeModal(); }}
                        style={{
                          width:"100%", marginTop:20,
                          background: studied[topic.id] ? "#F0FDF4" : "linear-gradient(135deg,#B8860B,#DAA520)",
                          border: studied[topic.id] ? "1.5px solid #86EFAC" : "none",
                          borderRadius:12,
                          color: studied[topic.id] ? "#166534" : "#fff",
                          padding:"13px", fontSize:13, cursor:"pointer",
                          fontFamily:"'Georgia', serif", fontWeight:700,
                          boxShadow: studied[topic.id] ? "none" : "0 4px 16px rgba(184,134,11,0.3)",
                          transition:"all 0.2s",
                        }}
                      >
                        {studied[topic.id] ? "✓ Marked as Studied" : "✓ Mark as Studied"}
                      </button>
                    </div>
                  )}
                </div>
              </>
            )}
          </div>
        </div>
      )}

      <style>{`
        @keyframes fadeIn {
          from { opacity: 0; transform: translateY(8px); }
          to   { opacity: 1; transform: translateY(0); }
        }
      `}</style>
    </div>
  );
}