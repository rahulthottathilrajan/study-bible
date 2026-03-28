"use client";
import { useState, useEffect, useRef, useCallback, useMemo } from "react";
import { useApp } from "../context/AppContext";
import { THEMES, DARK_THEMES } from "../constants";

// ── Category pill colors (component-specific semantic tints) ──
const CATEGORY_COLORS = {
  "The Godhead":          { bg: "#F3E8FF", text: "#6B21A8", border: "#C084FC" },
  "The Person of Christ": { bg: "#FEF3C7", text: "#92400E", border: "#F59E0B" },
  "Scripture":            { bg: "#FEF9C3", text: "#713F12", border: "#CA8A04" },
  "The Cross":            { bg: "#FFE4E6", text: "#9F1239", border: "#FB7185" },
  "History & Evidence":   { bg: "#E0F2FE", text: "#075985", border: "#38BDF8" },
  "Suffering & God":      { bg: "#F0FDF4", text: "#166534", border: "#4ADE80" },
  "Reason & Philosophy":  { bg: "#F5F3FF", text: "#4C1D95", border: "#A78BFA" },
};
const DARK_CATEGORY_COLORS = {
  "The Godhead":          { bg: "rgba(107,33,168,0.15)", text: "#C084FC", border: "#6B21A880" },
  "The Person of Christ": { bg: "rgba(245,158,11,0.12)", text: "#F59E0B", border: "#92400E80" },
  "Scripture":            { bg: "rgba(202,138,4,0.12)", text: "#CA8A04", border: "#713F1280" },
  "The Cross":            { bg: "rgba(251,113,133,0.12)", text: "#FB7185", border: "#9F123980" },
  "History & Evidence":   { bg: "rgba(56,189,248,0.12)", text: "#38BDF8", border: "#07598580" },
  "Suffering & God":      { bg: "rgba(74,222,128,0.12)", text: "#4ADE80", border: "#16653480" },
  "Reason & Philosophy":  { bg: "rgba(167,139,250,0.12)", text: "#A78BFA", border: "#4C1D9580" },
};

const SUCCESS = { light: { bg: "#F0FDF4", border: "#86EFAC", text: "#166534", check: "#22C55E" }, dark: { bg: "rgba(5,150,105,0.08)", border: "#86EFAC60", text: "#4ADE80", check: "#22C55E" } };
const WARNING = { light: { bg: "#FFF7ED", border: "#FED7AA", accent: "#F97316", label: "#C2410C", text: "#7C2D12" }, dark: { bg: "rgba(249,115,22,0.08)", border: "rgba(249,115,22,0.25)", accent: "#F97316", label: "#F97316", text: "#FDBA74" } };
const DIFF_COLORS = { beginner: { bg: "#D1FAE5", text: "#065F46", dark: { bg: "rgba(16,185,129,0.15)", text: "#6EE7B7" } }, intermediate: { bg: "#FEF3C7", text: "#92400E", dark: { bg: "rgba(245,158,11,0.15)", text: "#FCD34D" } }, advanced: { bg: "#FEE2E2", text: "#991B1B", dark: { bg: "rgba(239,68,68,0.15)", text: "#FCA5A5" } } };
const CONFETTI_COLORS = ["#D4A853", "#C8A24D", "#E8D5A0", "#B89440", "#8B5CF6", "#E8625C"];

const LS_KEY = "apologeticsStudied";
const LS_STREAK = "apologeticsStreak";

function getDayOfYear() {
  const now = new Date();
  const start = new Date(now.getFullYear(), 0, 0);
  return Math.floor((now - start) / (1000 * 60 * 60 * 24));
}

// ── Confetti (copied from QuizView) ──
function ConfettiParticles({ count = 8, colors = CONFETTI_COLORS }) {
  const particles = useRef(
    Array.from({ length: count }, (_, i) => ({
      cx: `${(Math.random() - 0.5) * 80}px`,
      cy: `${-60 - Math.random() * 40}px`,
      cr: `${360 + Math.random() * 360}deg`,
      delay: `${i * 0.06}s`,
      color: colors[i % colors.length],
      size: 5 + Math.random() * 3,
      left: `${20 + Math.random() * 60}%`,
    }))
  ).current;
  return (
    <div style={{ position: "absolute", top: 0, left: 0, right: 0, bottom: 0, pointerEvents: "none", overflow: "hidden" }}>
      {particles.map((p, i) => (
        <div key={i} style={{
          position: "absolute", top: "50%", left: p.left,
          width: p.size, height: p.size, borderRadius: i % 2 === 0 ? "50%" : "1px",
          background: p.color, opacity: 0,
          animation: `confettiBurst 1.5s ease-out ${p.delay} forwards`,
          "--cx": p.cx, "--cy": p.cy, "--cr": p.cr,
        }} />
      ))}
    </div>
  );
}

// ── MasteryRing (copied from QuizView) ──
function MasteryRing({ percentage = 0, size = 48, theme }) {
  const [animated, setAnimated] = useState(0);
  const r = (size - 6) / 2;
  const circ = 2 * Math.PI * r;
  const offset = circ - (animated / 100) * circ;
  useEffect(() => { const t = setTimeout(() => setAnimated(percentage), 100); return () => clearTimeout(t); }, [percentage]);
  const color = percentage >= 100 ? "#D4A853" : percentage >= 50 ? theme.accent : theme.muted;
  return (
    <svg width={size} height={size} style={{ transform: "rotate(-90deg)" }}>
      <circle cx={size / 2} cy={size / 2} r={r} fill="none" stroke={theme.divider} strokeWidth={3} />
      <circle cx={size / 2} cy={size / 2} r={r} fill="none" stroke={color} strokeWidth={3}
        strokeDasharray={circ} strokeDashoffset={offset} strokeLinecap="round"
        style={{ transition: "stroke-dashoffset 1s ease-out" }} />
    </svg>
  );
}

const APOLOGETICS_TOPICS = [
  {
    id: 1, icon: "\u{1F531}", title: "The Trinity",
    question: "Where does the Bible say God is three?",
    objection: "The word 'Trinity' never appears in the Bible. God is one, not three.",
    answer: `The word "Trinity" is a theological term summarising what Scripture teaches \u2014 just as the word "Bible" never appears in the Bible. The concept runs throughout.\n\nAt Jesus' baptism, the Father speaks from heaven, the Son stands in the water, and the Spirit descends as a dove \u2014 three distinct persons, one event (Matthew 3:16-17). Genesis 1:26 says "Let us make man in our image" \u2014 plural, from a strictly monotheistic author.\n\nThe Shema of Deuteronomy 6:4 declares God is "echad" \u2014 the Hebrew word for compound unity, the same word used when husband and wife become "one flesh" \u2014 not "yachid," which means absolute singularity.\n\nThe Great Commission baptises in one name (singular) of the Father, Son and Holy Spirit (Matthew 28:19). The Trinity is not three Gods \u2014 it is one God eternally existing in three persons.`,
    keyVerse: { ref: "Matthew 28:19", text: "baptizing them in the name of the Father, and of the Son, and of the Holy Ghost" },
    category: "The Godhead", color: "#7C3AED",
    difficulty: "beginner", related: [7, 5],
    debateOptions: [
      { text: "The Father, Son, and Spirit are three separate Gods working together", correct: false },
      { text: "One God eternally existing in three distinct persons \u2014 as shown by Jesus' baptism and the Hebrew 'echad' (compound unity)", correct: true },
      { text: "God changes forms \u2014 sometimes Father, sometimes Son, sometimes Spirit", correct: false },
    ],
  },
  {
    id: 2, icon: "\u271D\uFE0F", title: "Did Jesus Claim to Be God?",
    question: "Jesus never said 'I am God' \u2014 he only called himself the Son of God.",
    objection: "If Jesus were God, he would have said so plainly.",
    answer: `Jesus made the claim repeatedly \u2014 and his Jewish audience understood it perfectly, which is precisely why they tried to stone him.\n\nIn John 8:58, Jesus says "Before Abraham was, I AM" \u2014 directly taking the divine name God declared in Exodus 3:14. They reached for stones immediately. In John 10:30 he says "I and the Father are one" \u2014 again they tried to stone him, explaining "thou, being a man, makest thyself God" (v.33).\n\nIn Mark 2:5-7, he forgives sins \u2014 something only God can do, and the Pharisees knew it. In John 14:9 he says "He that hath seen me hath seen the Father." In Revelation 1:17 the risen Christ declares "I am the First and the Last" \u2014 the exact title God uses in Isaiah 44:6.\n\nHis enemies understood the claim perfectly. The only question is whether it is true.`,
    keyVerse: { ref: "John 8:58", text: "Before Abraham was, I am." },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "beginner", related: [8, 3],
    debateOptions: [
      { text: "Jesus was a great moral teacher but never claimed divinity", correct: false },
      { text: "Jesus said 'Before Abraham was, I AM' \u2014 taking God's divine name, which his audience understood as a direct claim to deity", correct: true },
      { text: "'Son of God' was a common title meaning a righteous person, not God himself", correct: false },
    ],
  },
  {
    id: 3, icon: "\u{1F64F}", title: "If Jesus Is God, Why Did He Pray?",
    question: "Jesus knelt and prayed to God \u2014 that proves he is not God, just a servant.",
    objection: "God doesn't pray to himself.",
    answer: `This challenge assumes Jesus can only be one thing \u2014 either fully God or a creature who prays. But the incarnation is the key: the eternal Son of God took on human flesh (John 1:14).\n\nIn his humanity, Jesus experienced hunger, thirst, weariness, and prayer. His praying was not weakness \u2014 it was perfect submission in his human nature, modelling for us what full dependence on the Father looks like.\n\nThe Son did not cease being God when he became man \u2014 he added humanity to his divinity (Philippians 2:5-8). A king who goes undercover as a servant still bows to the throne in his servant role \u2014 that does not stop him being king.\n\nJesus prayed as man, on behalf of humanity \u2014 which is precisely why he is the perfect mediator between God and man (1 Timothy 2:5).`,
    keyVerse: { ref: "Philippians 2:7", text: "he...made himself of no reputation, and took upon him the form of a servant" },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "intermediate", related: [2, 5],
    debateOptions: [
      { text: "Jesus prayed because he was not really God \u2014 he was a created being dependent on the Father", correct: false },
      { text: "In the incarnation, the Son added humanity to his divinity \u2014 he prayed in his human nature as our perfect mediator", correct: true },
      { text: "Prayer was just a public example \u2014 Jesus didn't actually need to communicate with the Father", correct: false },
    ],
  },
  {
    id: 4, icon: "\u23F0", title: "Jesus Didn't Know the Hour?",
    question: "Mark 13:32 says even the Son doesn't know the day or hour.",
    objection: "An omniscient God cannot be ignorant of anything.",
    answer: `This is one of the strongest challenges in Scripture, and scholars have offered several complementary explanations.\n\nOne view notes that the Greek word translated "know" (oida) has a semantic range that includes not just knowing but declaring or acknowledging publicly. Paul uses the same word in 1 Corinthians 2:2: "I determined not to know anything among you, save Jesus Christ" \u2014 a statement of intentional focus, not ignorance. Some scholars find this compelling; others consider it a stretch of the word's primary meaning.\n\nAnother widely discussed interpretation draws on Jewish betrothal culture. When a bridegroom was betrothed, he returned to his father's house to prepare a dwelling for his bride. If anyone asked "when is the wedding?" the groom's culturally understood answer was always "only my father knows" \u2014 because the father alone had authority to set the date. Jesus uses this exact framework in John 14:2-3, and many scholars see Mark 13:32 as a statement of covenantal propriety rather than ignorance.\n\nA third explanation is the most straightforward: in the incarnation, the Son voluntarily limited the exercise of certain divine attributes in his human nature (Philippians 2:5-8). This does not mean the divine nature ceased to be omniscient \u2014 it means the incarnate Christ operated within genuinely human constraints, including limited knowledge of certain eschatological details.`,
    keyVerse: { ref: "John 14:2-3", text: "I go to prepare a place for you...I will come again, and receive you unto myself" },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "advanced", related: [5, 9],
    debateOptions: [
      { text: "Jesus was ignorant because he was merely human and not omniscient", correct: false },
      { text: "The incarnate Son voluntarily limited the exercise of certain divine attributes \u2014 and the statement echoes Jewish betrothal culture where only the father sets the date", correct: true },
      { text: "This verse was added later by scribes to make Jesus seem more humble", correct: false },
    ],
  },
  {
    id: 5, icon: "\u{1F451}", title: "The Father Is Greater",
    question: "Jesus said the Father is greater \u2014 doesn't that prove he's not equal to God?",
    objection: "Jesus' own words in John 14:28 place the Father above him.",
    answer: `"Greater" here refers to position, not nature. A president is greater in position than a citizen \u2014 but both are equally human. Jesus in his incarnate, humbled state was positionally subordinate: sent, obedient, voluntarily limited. But positional submission does not imply ontological inferiority.\n\nPaul uses the same logic in 1 Corinthians 11:3 \u2014 the Father is the head of Christ in the economy of redemption \u2014 yet Colossians 2:9 declares "in him dwelleth all the fulness of the Godhead bodily." Both are simultaneously true.\n\nContext matters too. Jesus spoke these words to comfort disciples who were grieved he was leaving. "The Father is greater" means "I am going to a place of glory \u2014 rejoice for me." It is a statement of comfort, not a theology lecture about subordination.`,
    keyVerse: { ref: "Colossians 2:9", text: "in him dwelleth all the fulness of the Godhead bodily" },
    category: "The Godhead", color: "#7C3AED",
    difficulty: "intermediate", related: [1, 3],
    debateOptions: [
      { text: "'Greater' proves the Father is a higher being than Jesus", correct: false },
      { text: "'Greater' refers to position in the incarnation, not nature \u2014 Colossians 2:9 confirms 'all the fulness of the Godhead' dwells in Christ bodily", correct: true },
      { text: "Jesus was speaking metaphorically and didn't mean it literally", correct: false },
    ],
  },
  {
    id: 6, icon: "\u{1F4DC}", title: "Has the Bible Been Corrupted?",
    question: "The Bible was copied for centuries \u2014 it must have been changed.",
    objection: "We cannot trust a book passed through so many human hands.",
    answer: `This is the most checkable claim in the conversation. We possess over 5,800 Greek New Testament manuscripts \u2014 more than any other ancient document by a factor of ten. Homer's Iliad has 643. Caesar's Gallic Wars has 10.\n\nThe gap between NT originals and our earliest copies is 25\u201350 years \u2014 compared to 1,000+ years for most ancient texts. When scholars compare manuscripts across centuries and continents, they find 99.5% agreement. The variations are spelling differences and word order \u2014 nothing that affects a single Christian doctrine.\n\nThe Dead Sea Scrolls, discovered in 1947, contained Isaiah scrolls 1,000 years older than anything previously known \u2014 virtually identical to what we already had.\n\nIf the Bible were corrupted, three questions demand an answer: When did it happen? Who did it? And why do thousands of manuscripts across three continents agree?`,
    keyVerse: { ref: "Isaiah 40:8", text: "the word of our God shall stand for ever" },
    category: "Scripture", color: "#B45309",
    difficulty: "beginner", related: [15, 16],
    debateOptions: [
      { text: "We have so few ancient copies that we can't know what the originals said", correct: false },
      { text: "Over 5,800 Greek manuscripts show 99.5% agreement \u2014 and the Dead Sea Scrolls confirmed 1,000 years of faithful transmission", correct: true },
      { text: "The Bible has been corrupted, but the core message survived through oral tradition", correct: false },
    ],
  },
  {
    id: 7, icon: "\u{1F54A}\uFE0F", title: "Is the Holy Spirit a Force?",
    question: "The Spirit is just God's power or energy \u2014 not an actual person.",
    objection: "Scripture never clearly says the Spirit is a distinct person.",
    answer: `Scripture consistently attributes personal qualities to the Spirit that a force cannot possess. He grieves (Ephesians 4:30) \u2014 forces do not feel grief. He teaches (John 14:26) \u2014 forces do not instruct. He intercedes with groanings (Romans 8:26) \u2014 forces do not pray. He speaks (Acts 13:2) \u2014 forces do not talk.\n\nHe can be lied to (Acts 5:3-4) \u2014 and in that same passage, lying to the Spirit is equated directly with lying to God.\n\nNotably, Jesus uses the personal pronoun "he" (Greek: ekeinos) repeatedly for the Spirit in John 14\u201316, even though "Spirit" (pneuma) is grammatically neuter in Greek. This is a deliberate grammatical choice \u2014 made specifically to emphasise personhood.\n\nThe Spirit is as fully personal as the Father and the Son.`,
    keyVerse: { ref: "Acts 5:3-4", text: "thou hast not lied unto men, but unto God" },
    category: "The Godhead", color: "#7C3AED",
    difficulty: "beginner", related: [1, 5],
    debateOptions: [
      { text: "The Spirit is an impersonal power emanating from God, like electricity", correct: false },
      { text: "The Spirit grieves, teaches, speaks, and is lied to \u2014 all personal qualities. Jesus deliberately used the personal pronoun 'he' for the Spirit", correct: true },
      { text: "The Spirit is just another name for God the Father acting in the world", correct: false },
    ],
  },
  {
    id: 8, icon: "\u267E\uFE0F", title: "Was Jesus Created?",
    question: "Colossians 1:15 calls Jesus 'firstborn of creation' \u2014 wasn't he made?",
    objection: "'Firstborn' means Jesus had a beginning and is therefore a creature.",
    answer: `"Firstborn" (prototokos in Greek, bekor in Hebrew) in both cultures meant preeminent heir \u2014 not the first one born chronologically. Psalm 89:27 calls David "my firstborn" \u2014 yet David was the last-born son of Jesse. The title was about rank and supremacy, not birth order.\n\nColossians 1:16 answers the question immediately: "For by him were all things created." If Jesus were part of creation, he cannot simultaneously be the one through whom all creation came into being.\n\nJohn 1:1-3 is unambiguous: "In the beginning was the Word... all things were made by him; and without him was not any thing made that was made." The word "all" (panta) is absolute \u2014 it includes everything that exists.\n\nJesus is the Creator. He cannot also be the created.`,
    keyVerse: { ref: "John 1:3", text: "All things were made by him; and without him was not any thing made that was made" },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "intermediate", related: [2, 1],
    debateOptions: [
      { text: "'Firstborn' literally means Jesus was the first being God created", correct: false },
      { text: "'Firstborn' (prototokos) means preeminent heir, not first created \u2014 and Colossians 1:16 says 'by him were all things created'", correct: true },
      { text: "Jesus existed before creation but was still a created being with a beginning", correct: false },
    ],
  },
  {
    id: 9, icon: "\u{1F622}", title: "Did God Abandon Jesus?",
    question: "Jesus cried 'Why hast thou forsaken me?' \u2014 did the Trinity break apart?",
    objection: "A forsaken Jesus cannot be God.",
    answer: `Jesus is quoting Psalm 22:1 \u2014 and every Jewish listener at the cross would have known exactly what he was doing. He was reciting a Messianic psalm in his moment of deepest agony.\n\nIn his humanity, bearing the full judicial weight of sin on behalf of mankind, he experienced the withdrawal of the Father's felt presence \u2014 not an ontological separation of divine persons. It is the cry of the sin-bearer, not the dissolution of the Trinity.\n\nCrucially, Psalm 22 does not end in abandonment \u2014 it ends in triumphant resurrection vindication (vv.22-31). Jesus recited the opening line of a psalm whose conclusion is victory.\n\nAnd the Father did not ultimately abandon him: "He hath not despised nor abhorred the affliction of the afflicted; neither hath he hidden his face from him; but when he cried unto him, he heard" (Psalm 22:24). The cross was the greatest act of love in history.`,
    keyVerse: { ref: "Psalm 22:24", text: "when he cried unto him, he heard" },
    category: "The Cross", color: "#E11D48",
    difficulty: "intermediate", related: [3, 4],
    debateOptions: [
      { text: "God literally abandoned Jesus \u2014 proving the Trinity is not real", correct: false },
      { text: "Jesus quoted Psalm 22:1 \u2014 a psalm that ends in vindication. He experienced the withdrawal of felt presence as sin-bearer, not an ontological break in the Trinity", correct: true },
      { text: "Jesus was confused and didn't understand why he was suffering", correct: false },
    ],
  },
  {
    id: 10, icon: "\u{1F525}", title: "No One Has Seen God \u2014 But Moses Did?",
    question: "John 1:18 says no man has seen God \u2014 but Abraham and Moses saw him. Contradiction?",
    objection: "The Bible contradicts itself on whether God can be seen.",
    answer: `John 1:18 contains its own answer: "No man hath seen God at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him." The one who appeared in the Old Testament theophanies was the pre-incarnate Son \u2014 the visible, approachable member of the Trinity \u2014 making God known to humanity.\n\nIsaiah 6 records the prophet seeing "the LORD" \u2014 and John 12:41 explicitly identifies this: "These things said Esaias, when he saw his [Christ's] glory, and spake of him." When Jacob wrestled with "a man" who turned out to be God (Genesis 32:24-30), that was the pre-incarnate Christ.\n\nThe Father \u2014 in his full divine essence \u2014 no human can see and live (Exodus 33:20). But the Son has always been the one through whom God makes himself visible.\n\nThe incarnation was not the first time the Son appeared to humanity \u2014 it was the fullest and final form of what he had been doing throughout all of history.`,
    keyVerse: { ref: "John 12:41", text: "These things said Esaias, when he saw his glory, and spake of him." },
    category: "Scripture", color: "#B45309",
    difficulty: "intermediate", related: [1, 7],
    debateOptions: [
      { text: "This is a genuine contradiction \u2014 the Old and New Testaments disagree", correct: false },
      { text: "The Old Testament appearances were the pre-incarnate Son \u2014 John 12:41 confirms Isaiah saw Christ's glory. The Father in full essence remains unseen", correct: true },
      { text: "People in the Old Testament only saw visions, not God himself", correct: false },
    ],
  },
  {
    id: 11, icon: "\u{1F305}", title: "The Resurrection",
    question: "The disciples stole the body \u2014 or Jesus never really died.",
    objection: "The resurrection is a legend. There are natural explanations.",
    answer: `Historian N.T. Wright, in his 800-page academic work The Resurrection of the Son of God (2003), concluded after examining every alternative theory that the bodily resurrection remains the only historically adequate explanation for the data.\n\nScholars across theological traditions \u2014 including sceptics \u2014 accept four facts as historically established: (1) Jesus died by Roman crucifixion; (2) the tomb was found empty on the third day; (3) multiple individuals and groups reported post-resurrection appearances; (4) the disciples underwent a transformation from terrified fugitives to people willing to die for this claim.\n\nThe "stolen body" theory was the first alternative proposed (Matthew 28:13) \u2014 and it fails immediately: Roman soldiers faced execution for sleeping on watch. The "swoon theory" (he survived) was demolished by medical scholars \u2014 Roman executioners were professionals, and a spear to the side (John 19:34) confirmed death. Historian Gary Habermas has documented over 1,200 scholarly works affirming the historicity of the empty tomb.\n\nAs C.S. Lewis observed: the disciples did not die for a vision or a symbol \u2014 they died insisting on a bodily, physical event they personally witnessed.`,
    keyVerse: { ref: "1 Corinthians 15:6", text: "he was seen of above five hundred brethren at once; of whom the greater part remain unto this present" },
    category: "History & Evidence", color: "#0369A1",
    difficulty: "beginner", related: [12, 16],
    debateOptions: [
      { text: "The disciples hallucinated due to grief \u2014 group hallucinations are well-documented", correct: false },
      { text: "Four established facts \u2014 crucifixion death, empty tomb, multiple appearances, transformed disciples \u2014 are best explained by bodily resurrection", correct: true },
      { text: "Jesus survived the crucifixion and recovered in the tomb", correct: false },
    ],
  },
  {
    id: 12, icon: "\u{1F476}", title: "The Virgin Birth",
    question: "A virgin birth is biologically impossible \u2014 this is mythology.",
    objection: "Matthew and Luke copied the idea from pagan myths about gods and mortal women.",
    answer: `The claim that the virgin birth was borrowed from pagan mythology was popularised in the 19th century but is rejected by mainstream classical scholars today. The supposed parallels \u2014 Zeus fathering Hercules, etc. \u2014 involve physical unions between gods and women, not virginal conception. They are categorically different. Classicist Ronald Nash, in The Gospel and the Greeks (2003), systematically dismantled these parallels.\n\nMore significantly, the Jewish context of Matthew and Luke makes a pagan borrowing implausible. The virgin birth would have been scandalous \u2014 not appealing \u2014 to a Jewish audience. The authors recorded it precisely because it was unexpected and historically attested, not because it was culturally flattering.\n\nThe Hebrew of Isaiah 7:14 uses "almah" \u2014 a young woman of marriageable age, understood in its Septuagint (Greek) translation as "parthenos" (virgin) \u2014 which Matthew cites directly. As many Christian scientists have observed, a God capable of creating the cosmos is not constrained by ordinary biology.\n\nThe virgin birth is not an embarrassment \u2014 it is the mechanism of the incarnation: the eternal Son entering human nature without inheriting Adamic sin (Romans 5:12-19).`,
    keyVerse: { ref: "Isaiah 7:14", text: "Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel." },
    category: "History & Evidence", color: "#0369A1",
    difficulty: "beginner", related: [11, 14],
    debateOptions: [
      { text: "The virgin birth was borrowed from pagan myths about divine-human offspring", correct: false },
      { text: "Pagan parallels involve physical unions, not virginal conception. The Jewish context makes borrowing implausible \u2014 Isaiah 7:14 prophesied it centuries before", correct: true },
      { text: "The virgin birth is a metaphor for Jesus being spiritually special, not a literal claim", correct: false },
    ],
  },
  {
    id: 13, icon: "\u{1FA9E}", title: "Is Jesus the Only Way?",
    question: "Isn't it arrogant to say Christianity is the only true religion?",
    objection: "All religions lead to God. Claiming exclusivity is intolerant.",
    answer: `C.S. Lewis addressed this directly in Mere Christianity: the question is not whether exclusivity is polite, but whether it is true. Every major worldview \u2014 not just Christianity \u2014 makes exclusive truth claims. Buddhism says the self is an illusion; Islam says Jesus was not divine; secular humanism says there is no God. The claim "all religions are equally true" is itself an exclusive claim that contradicts most of what those religions actually teach.\n\nTim Keller, in The Reason for God (2008), notes that Jesus' claim in John 14:6 is unique in a specific way: he does not say "follow my teachings and you will find God" \u2014 he says "I am the way." The path is a person, not a system of rules. This is not the logic of religion \u2014 it is the logic of rescue.\n\nThe charge of arrogance misreads the claim. Christianity does not say "we are better people." It says "we received a gift we did not deserve and could not earn." The exclusive claim is grounded not in superiority but in a historical event \u2014 the resurrection \u2014 which either happened or did not. If it happened, the implications follow necessarily.\n\nAs Keller puts it: if you were sick and a doctor said "this specific medicine will cure you," you would not call him arrogant. You would ask whether it was true.`,
    keyVerse: { ref: "John 14:6", text: "I am the way, the truth, and the life: no man cometh unto the Father, but by me." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [19, 20],
    debateOptions: [
      { text: "All religions teach the same core truths, so exclusivity is unnecessary", correct: false },
      { text: "Every worldview makes exclusive claims. Jesus uniquely said 'I am the way' \u2014 grounded not in superiority but in a historical event, the resurrection", correct: true },
      { text: "Christianity is the best religion, but sincere followers of other faiths will also be saved", correct: false },
    ],
  },
  {
    id: 14, icon: "\u{1F995}", title: "Genesis & Science",
    question: "The Bible says the earth is 6,000 years old \u2014 science says billions. Who is right?",
    objection: "Genesis contradicts modern science and therefore cannot be trusted.",
    answer: `This objection assumes all Christians interpret Genesis as a precise scientific chronology \u2014 but this is not, and has never been, the only serious reading of the text.\n\nOxford mathematician and Christian John Lennox, in Seven Days That Divide the World (2011), demonstrates that the Hebrew word "yom" (day) is used in Genesis itself in non-literal ways (Genesis 2:4 refers to all six days as a single "yom"). The early church father Origen and Augustine both warned against reading Genesis as a scientific document in their own centuries \u2014 long before Darwin.\n\nFrancis Collins, former director of the Human Genome Project and founder of BioLogos, is an evangelical Christian who accepts an ancient universe and common descent. He argues these are questions of how God created \u2014 not whether he did.\n\nThe core theological claims of Genesis 1-2 are: God created everything from nothing (ex nihilo); creation is good; humanity bears the image of God (imago Dei); we are morally accountable to our Creator. None of these claims are threatened by the age of the universe. Hebrews 11:3 says "the worlds were framed by the word of God" \u2014 the mechanism is secondary to the Author.`,
    keyVerse: { ref: "Hebrews 11:3", text: "the worlds were framed by the word of God, so that things which are seen were not made of things which do appear." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [20, 6],
    debateOptions: [
      { text: "The Bible clearly teaches a 6,000-year-old earth and science is wrong", correct: false },
      { text: "The Hebrew 'yom' has multiple meanings. Genesis teaches who created and why \u2014 not a scientific chronology. Scholars like Lennox and Collins hold both Scripture and science", correct: true },
      { text: "Genesis is just mythology and has no factual claims about creation", correct: false },
    ],
  },
  {
    id: 15, icon: "\u{1F4D6}", title: "Who Decided the Canon?",
    question: "The books of the Bible were chosen by powerful men at councils \u2014 other gospels were suppressed.",
    objection: "The canon is a political decision, not a divine one.",
    answer: `This narrative was popularised by The Da Vinci Code (2003) and is rejected by virtually all serious historians \u2014 Christian and secular. F.F. Bruce's The Canon of Scripture (1988) and Michael Kruger's Canon Revisited (2012) are the standard academic responses.\n\nThe facts: the four Gospels \u2014 Matthew, Mark, Luke, John \u2014 were universally cited and accepted by Christian communities from the late first and early second centuries, long before any council. Ignatius of Antioch (died ~107 AD) quotes multiple New Testament letters. The Muratorian Fragment (~170 AD) lists most of the New Testament as already accepted.\n\nThe Council of Nicaea (325 AD) did not vote on the canon \u2014 this is a popular myth with no historical basis. The canon was formally ratified at councils in Hippo (393 AD) and Carthage (397 AD) \u2014 but these councils recognised what was already in widespread use, they did not create it.\n\nThe "suppressed gospels" (Gospel of Thomas, Gospel of Judas, etc.) date from the second and third centuries \u2014 generations after the apostles. They were not suppressed; they were simply late, anonymous, and inconsistent with first-century apostolic testimony. Gnostic texts were well-known and widely discussed \u2014 they were not hidden.`,
    keyVerse: { ref: "2 Peter 1:21", text: "holy men of God spake as they were moved by the Holy Ghost." },
    category: "Scripture", color: "#B45309",
    difficulty: "beginner", related: [6, 16],
    debateOptions: [
      { text: "The Council of Nicaea in 325 AD selected which books to include and suppressed the rest", correct: false },
      { text: "The four Gospels were universally accepted from the 1st-2nd century. Nicaea never voted on the canon \u2014 later councils ratified what was already in widespread use", correct: true },
      { text: "We can't know which books belong \u2014 the 'suppressed' gospels may be equally valid", correct: false },
    ],
  },
  {
    id: 16, icon: "\u{1F3DB}\uFE0F", title: "Were the Gospels Written Too Late?",
    question: "The Gospels were written centuries after Jesus \u2014 they can't be eyewitness accounts.",
    objection: "Legends developed over generations. The Gospels are theological fiction.",
    answer: `This objection rests on a chronology that most New Testament scholars \u2014 across the theological spectrum \u2014 do not accept. The majority date the Gospels to within one generation of the events: Mark ~65-70 AD, Matthew and Luke ~80 AD, John ~90 AD. Paul's letters \u2014 which contain detailed resurrection accounts \u2014 are dated to the 50s AD, within 20 years of the crucifixion.\n\nRichard Bauckham's Jesus and the Eyewitnesses (2006), described by reviewers as one of the most important New Testament studies in decades, demonstrates that the Gospels bear the literary marks of eyewitness testimony. He identifies named individuals in the Gospels (Simon of Cyrene, Bartimaeus, etc.) as the living sources the early communities could verify or challenge.\n\nCraig Blomberg's The Historical Reliability of the Gospels (1987, updated 2007) surveys the archaeological and textual evidence comprehensively. Archaeologist William Albright wrote: "We can already say emphatically that there is no long interval between the Gospel of John and the period of the Apostles."\n\nFor legend to develop to the scale proposed by sceptics, you need centuries and geographic distance \u2014 not 20-40 years, in the same city, with living witnesses still present.`,
    keyVerse: { ref: "Luke 1:2", text: "Even as they delivered them unto us, which from the beginning were eyewitnesses, and ministers of the word" },
    category: "History & Evidence", color: "#0369A1",
    difficulty: "intermediate", related: [15, 11],
    debateOptions: [
      { text: "The Gospels were written centuries later and are based on legends, not eyewitness testimony", correct: false },
      { text: "Scholars date the Gospels to within one generation (Mark ~65 AD). Paul's letters with resurrection details date to the 50s AD \u2014 20 years after the events, with living witnesses present", correct: true },
      { text: "The Gospels are eyewitness accounts but contain some legendary embellishments added later", correct: false },
    ],
  },
  {
    id: 17, icon: "\u{1F614}", title: "The Problem of Evil",
    question: "If God is all-powerful and good, why does suffering exist?",
    objection: "Evil and suffering prove God is either not good or not powerful \u2014 or does not exist.",
    answer: `This is the most serious objection to theism and deserves a serious answer. Philosopher Alvin Plantinga, whose work is acknowledged even by atheist philosophers, demonstrated in God, Freedom and Evil (1974) that the existence of evil is logically compatible with an omnipotent, benevolent God \u2014 specifically through the Free Will Defense: a world with genuine freedom, capable of love, necessarily permits the possibility of its misuse.\n\nC.S. Lewis in The Problem of Pain (1940) adds: "God whispers to us in our pleasures, speaks in our conscience, but shouts in our pains: it is his megaphone to rouse a deaf world." Suffering, while terrible, is not purposeless in the Christian framework \u2014 it is the environment in which character, perseverance, and compassion are forged (Romans 5:3-4).\n\nThe strongest version of the objection \u2014 the emotional problem of evil \u2014 is that suffering makes it psychologically difficult to believe. Lewis's A Grief Observed (1961) is the most honest wrestling with this that exists. His conclusion: suffering does not disprove God; it reveals our need for him.\n\nCrucially, the Christian God is not a distant observer of suffering \u2014 he entered it. The cross is God's answer to the problem of evil, not his absence from it.`,
    keyVerse: { ref: "Romans 8:18", text: "the sufferings of this present time are not worthy to be compared with the glory which shall be revealed in us." },
    category: "Suffering & God", color: "#059669",
    difficulty: "advanced", related: [18, 19],
    debateOptions: [
      { text: "If God were truly good and powerful, he would eliminate all suffering immediately", correct: false },
      { text: "Plantinga's Free Will Defense shows evil is logically compatible with God. A world capable of love must permit its misuse \u2014 and God entered suffering himself on the cross", correct: true },
      { text: "Suffering exists because God created the world and then stepped back from it", correct: false },
    ],
  },
  {
    id: 18, icon: "\u26D3\uFE0F", title: "Hell & a Loving God",
    question: "A loving God wouldn't send people to hell. It's disproportionate and cruel.",
    objection: "Eternal punishment for finite sins cannot be just.",
    answer: `C.S. Lewis offers the most widely cited reframe in The Great Divorce (1945): "There are only two kinds of people in the end: those who say to God, 'Thy will be done,' and those to whom God says, 'Thy will be done.' All that are in Hell, choose it."\n\nThe biblical picture of hell is not God chasing people down and throwing them in against their will \u2014 it is God honouring the persistent, final choice of people who refused him. Tim Keller in The Reason for God (2008) notes: "All God does in the end with people is give them what they most wanted, including freedom from himself."\n\nOn proportionality: the severity of an offence is measured partly by the dignity of the one offended. Rebellion against the eternal, holy God is not a small thing \u2014 and those who resist it until death are not reformable by more time, but only by a change of will they have permanently refused.\n\nAlso: the same Bible that speaks of hell speaks of God's longing that none should perish (2 Peter 3:9) and of Christ dying for all (1 Timothy 2:6). Hell is not God's preferred outcome \u2014 it is the ultimate cost of real freedom. A God who eliminates hell by eliminating human freedom is not more loving \u2014 he is less.`,
    keyVerse: { ref: "2 Peter 3:9", text: "not willing that any should perish, but that all should come to repentance." },
    category: "Suffering & God", color: "#059669",
    difficulty: "advanced", related: [17, 13],
    debateOptions: [
      { text: "A truly loving God would never allow anyone to suffer eternally", correct: false },
      { text: "Hell is God honouring the final choice of those who refuse him. Lewis: 'All that are in Hell, choose it.' It is the cost of real freedom, not arbitrary punishment", correct: true },
      { text: "Hell is just a metaphor for separation \u2014 there is no actual punishment after death", correct: false },
    ],
  },
  {
    id: 19, icon: "\u2696\uFE0F", title: "The Moral Argument",
    question: "You don't need God to be a good person. Morality is just common sense.",
    objection: "Atheists can be moral. God is not needed for ethics.",
    answer: `The moral argument does not claim that atheists cannot behave morally. It asks a more precise question: if there is no God, on what foundation does objective moral law rest?\n\nC.S. Lewis opens Mere Christianity with this argument: we all appeal to a standard of fairness and justice when we quarrel \u2014 even people who deny that such a standard exists. That standard is not invented by cultures (cultures have justified slavery, genocide, and torture). It transcends cultures, which is why we can judge them.\n\nWilliam Lane Craig formulates it: (1) If God does not exist, objective moral values do not exist. (2) Objective moral values do exist. (3) Therefore, God exists. Philosopher Derek Parfit \u2014 an atheist \u2014 acknowledged in On What Matters that grounding objective morality without God remains one of the deepest challenges in philosophy.\n\nNietzsche understood the stakes more clearly than most: if God is dead, objective morality goes with him. "Beyond good and evil" was his logical conclusion. The atheist who insists that torturing children for fun is genuinely, objectively wrong \u2014 not merely unfashionable \u2014 is quietly borrowing from a theistic framework.\n\nThe point is not that you need to believe in God to be good. It is that you need God to exist for "good" to mean anything beyond personal preference.`,
    keyVerse: { ref: "Romans 2:15", text: "the work of the law written in their hearts, their conscience also bearing witness" },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [20, 13],
    debateOptions: [
      { text: "Morality evolved through natural selection \u2014 no God is needed to explain it", correct: false },
      { text: "The argument doesn't claim atheists can't be moral \u2014 it asks what grounds objective morality. Without God, 'good' reduces to preference. Lewis: we all appeal to a standard that transcends cultures", correct: true },
      { text: "Morality is simply what society agrees on \u2014 it changes over time and that's fine", correct: false },
    ],
  },
  {
    id: 20, icon: "\u{1F30C}", title: "The Cosmological Argument",
    question: "The universe could have come from nothing. God is an unnecessary hypothesis.",
    objection: "Science explains origins without needing a Creator.",
    answer: `The Kalam Cosmological Argument, championed by philosopher William Lane Craig and rooted in medieval scholarship (Al-Ghazali, 11th century), runs: (1) Everything that begins to exist has a cause. (2) The universe began to exist. (3) Therefore, the universe has a cause.\n\nThe second premise is now supported by mainstream cosmology. The Big Bang (Friedmann, Lema\u00eetre, confirmed by Hubble in 1929) established that the universe \u2014 all matter, energy, space, and time \u2014 had an absolute beginning. Stephen Hawking wrote: "Almost everyone now believes that the universe, and time itself, had a beginning at the Big Bang." The Borde-Guth-Vilenkin theorem (2003) extends this even to proposed multiverse models \u2014 any expanding universe requires a beginning.\n\nThe response "the universe came from nothing" is not a scientific answer \u2014 it is a philosophical one, and it violates the most basic principle of reason: ex nihilo nihil fit (from nothing, nothing comes). Lawrence Krauss's "nothing" in A Universe from Nothing (2012) was shown by philosophers \u2014 including atheist philosopher David Albert \u2014 to actually be a quantum vacuum, which is emphatically not nothing.\n\nThe cause of the universe must be outside space and time (since it created them), immensely powerful, and \u2014 to choose to create \u2014 personal. Anthony Flew, the most prominent atheist philosopher of the 20th century, announced his conversion to theism in 2004 citing precisely this argument.`,
    keyVerse: { ref: "Genesis 1:1", text: "In the beginning God created the heaven and the earth." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [19, 14],
    debateOptions: [
      { text: "The universe could have spontaneously appeared from nothing without a cause", correct: false },
      { text: "The Kalam argument: everything that begins to exist has a cause; the universe began (Big Bang, Borde-Guth-Vilenkin theorem); therefore the cause must be outside space and time \u2014 personal and powerful", correct: true },
      { text: "The multiverse theory explains the origin of our universe without needing God", correct: false },
    ],
  },
];

// ── Category groupings (derived) ──
const CATEGORIES_LIST = Object.keys(CATEGORY_COLORS);
function getCategoryTopics(cat) { return APOLOGETICS_TOPICS.filter(t => t.category === cat); }

// ── localStorage helpers ──
function loadStudied() {
  if (typeof window === "undefined") return {};
  try {
    const raw = JSON.parse(localStorage.getItem(LS_KEY) || "{}");
    // Migrate old format: { id: true } → { id: { firstStudied, ... } }
    const migrated = {};
    for (const [k, v] of Object.entries(raw)) {
      if (v === true) {
        const today = new Date().toISOString().slice(0, 10);
        migrated[k] = { firstStudied: today, lastStudied: today, studyCount: 1, quizScore: null, quizAttempts: 0 };
      } else if (v && typeof v === "object") {
        migrated[k] = v;
      }
    }
    return migrated;
  } catch { return {}; }
}
function loadStreak() {
  if (typeof window === "undefined") return { current: 0, longest: 0, lastDate: "" };
  try { return JSON.parse(localStorage.getItem(LS_STREAK)) || { current: 0, longest: 0, lastDate: "" }; } catch { return { current: 0, longest: 0, lastDate: "" }; }
}
function updateStreak(s) {
  const today = new Date().toISOString().slice(0, 10);
  if (s.lastDate === today) return s;
  const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);
  const newCurrent = s.lastDate === yesterday ? s.current + 1 : 1;
  return { current: newCurrent, longest: Math.max(s.longest, newCurrent), lastDate: today };
}

export default function Apologetics({ nav, onPositionSave, darkMode }) {
  const { bp, trackLearnExploration, earnedBadges } = useApp();
  const st = darkMode ? DARK_THEMES.sunrise : THEMES.sunrise;
  const catColors = darkMode ? DARK_CATEGORY_COLORS : CATEGORY_COLORS;
  const warn = darkMode ? WARNING.dark : WARNING.light;
  const succ = darkMode ? SUCCESS.dark : SUCCESS.light;

  const [selected, setSelected]   = useState(null);
  const [revealed, setRevealed]   = useState(false);
  const [studied, setStudied]     = useState(loadStudied);
  const [streak, setStreak]       = useState(loadStreak);
  const [filterCat, setFilterCat] = useState("All");
  const [animIn, setAnimIn]       = useState(false);
  const [debateAnswer, setDebateAnswer] = useState(null); // index chosen
  const [celebration, setCelebration]   = useState(null); // "category"|"master"|null
  const [pressedId, setPressedId] = useState(null);

  const modalRef = useRef(null);
  const closeBtnRef = useRef(null);
  const triggerRef = useRef(null);

  const topic = APOLOGETICS_TOPICS.find(t => t.id === selected);
  const categories = ["All", ...CATEGORIES_LIST];
  const visible = filterCat === "All"
    ? APOLOGETICS_TOPICS
    : APOLOGETICS_TOPICS.filter(t => t.category === filterCat);

  // ── Defense of the Day ──
  const dotdTopic = APOLOGETICS_TOPICS[getDayOfYear() % APOLOGETICS_TOPICS.length];
  const dotdStudiedToday = studied[dotdTopic.id]?.lastStudied === new Date().toISOString().slice(0, 10);

  // ── Persist ──
  useEffect(() => { try { localStorage.setItem(LS_KEY, JSON.stringify(studied)); } catch {} }, [studied]);
  useEffect(() => { try { localStorage.setItem(LS_STREAK, JSON.stringify(streak)); } catch {} }, [streak]);

  // ── Category mastery ──
  const categoryProgress = useMemo(() => {
    const result = {};
    for (const cat of CATEGORIES_LIST) {
      const topics = getCategoryTopics(cat);
      const done = topics.filter(t => studied[t.id]).length;
      result[cat] = { total: topics.length, done, pct: topics.length ? Math.round((done / topics.length) * 100) : 0 };
    }
    return result;
  }, [studied]);

  const studiedCount = Object.keys(studied).filter(k => studied[k]).length;
  const totalTopics = APOLOGETICS_TOPICS.length;

  // ── Streak flames ──
  const flames = streak.current >= 30 ? "\u{1F525}\u{1F525}\u{1F525}" : streak.current >= 7 ? "\u{1F525}\u{1F525}" : streak.current >= 1 ? "\u{1F525}" : "";

  const openTopic = (id) => {
    triggerRef.current = document.activeElement;
    setSelected(id);
    setRevealed(false);
    setDebateAnswer(null);
    setTimeout(() => setAnimIn(true), 10);
    const t = APOLOGETICS_TOPICS.find(t => t.id === id);
    if (t && onPositionSave) onPositionSave("apologetics", { topicName: t.title });
  };

  const closeModal = useCallback(() => {
    setAnimIn(false);
    setTimeout(() => {
      setSelected(null);
      setRevealed(false);
      setDebateAnswer(null);
      if (triggerRef.current && triggerRef.current.focus) triggerRef.current.focus();
    }, 280);
  }, []);

  const markStudied = (id) => {
    const today = new Date().toISOString().slice(0, 10);
    const prev = studied[id];
    const updated = {
      firstStudied: prev?.firstStudied || today,
      lastStudied: today,
      studyCount: (prev?.studyCount || 0) + 1,
      quizScore: prev?.quizScore ?? null,
      quizAttempts: prev?.quizAttempts || 0,
    };
    setStudied(s => ({ ...s, [id]: updated }));
    setStreak(s => updateStreak(s));
    trackLearnExploration("apologeticsStudied", id);

    // Check for category completion celebration
    const t = APOLOGETICS_TOPICS.find(t => t.id === id);
    if (t) {
      const catTopics = getCategoryTopics(t.category);
      const catDoneAfter = catTopics.filter(ct => ct.id === id || studied[ct.id]).length;
      if (catDoneAfter === catTopics.length) {
        setTimeout(() => setCelebration("category"), 350);
      }
    }
    // Check for master completion
    const totalDoneAfter = Object.keys({ ...studied, [id]: updated }).filter(k => studied[k] || k == id).length;
    if (totalDoneAfter >= totalTopics) {
      const masterSeen = typeof window !== "undefined" && localStorage.getItem("apologeticsMasterCelebrated");
      if (!masterSeen) {
        setTimeout(() => setCelebration("master"), 600);
        try { localStorage.setItem("apologeticsMasterCelebrated", "1"); } catch {}
      }
    }
  };

  const handleDebate = (idx) => {
    if (debateAnswer !== null) return;
    setDebateAnswer(idx);
    const correct = topic.debateOptions[idx]?.correct;
    if (correct && topic) {
      setStudied(s => {
        const prev = s[topic.id] || {};
        return { ...s, [topic.id]: { ...prev, quizScore: 3, quizAttempts: (prev.quizAttempts || 0) + 1 } };
      });
    } else if (topic) {
      setStudied(s => {
        const prev = s[topic.id] || {};
        return { ...s, [topic.id]: { ...prev, quizScore: Math.max(prev.quizScore || 0, 1), quizAttempts: (prev.quizAttempts || 0) + 1 } };
      });
    }
  };

  const shareTopic = async (t) => {
    const text = `\u{1F6E1}\uFE0F ${t.title}\n\n"${t.objection}"\n\n${t.answer.split("\n\n")[0]}\n\n\u{1F5DD} ${t.keyVerse.ref}: "${t.keyVerse.text}"\n\n\u2014 The Bible Scrollers`;
    if (navigator.share) { try { await navigator.share({ title: t.title, text }); } catch {} }
    else { try { await navigator.clipboard.writeText(text); } catch {} }
  };

  const openRelated = (id) => {
    setSelected(id);
    setRevealed(false);
    setDebateAnswer(null);
    setAnimIn(true);
    const t = APOLOGETICS_TOPICS.find(t => t.id === id);
    if (t && onPositionSave) onPositionSave("apologetics", { topicName: t.title });
  };

  // ── Body scroll lock ──
  useEffect(() => {
    if (selected) document.body.style.overflow = "hidden";
    else document.body.style.overflow = "";
    return () => { document.body.style.overflow = ""; };
  }, [selected]);

  // ── Focus trap + Escape ──
  useEffect(() => {
    if (!selected) return;
    const onKey = (e) => {
      if (e.key === "Escape") { closeModal(); return; }
      if (e.key === "Tab" && modalRef.current) {
        const focusable = modalRef.current.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');
        if (!focusable.length) return;
        const first = focusable[0], last = focusable[focusable.length - 1];
        if (e.shiftKey) { if (document.activeElement === first) { e.preventDefault(); last.focus(); } }
        else { if (document.activeElement === last) { e.preventDefault(); first.focus(); } }
      }
    };
    document.addEventListener("keydown", onKey);
    setTimeout(() => { if (closeBtnRef.current) closeBtnRef.current.focus(); }, 320);
    return () => document.removeEventListener("keydown", onKey);
  }, [selected, closeModal]);

  const gridCols = bp.contentWide > 700 ? "repeat(3, 1fr)" : "1fr 1fr";
  const today = new Date().toISOString().slice(0, 10);
  const sevenDaysAgo = new Date(Date.now() - 7 * 86400000).toISOString().slice(0, 10);

  return (
    <div style={{ minHeight: "100vh", background: st.bg, fontFamily: st.body }}>

      {/* ══ HERO ══ */}
      <div style={{ background: st.headerGradient, position: "relative", overflow: "hidden" }}>
        <div style={{ position:"absolute", top:-60, right:-60, width:200, height:200, borderRadius:"50%", background:"rgba(255,255,255,0.06)", pointerEvents:"none" }} aria-hidden="true" />
        <div style={{ position:"absolute", bottom:-40, left:-40, width:160, height:160, borderRadius:"50%", background:"rgba(255,255,255,0.05)", pointerEvents:"none" }} aria-hidden="true" />

        {/* Back button */}
        <div style={{ padding:"16px 20px 0" }}>
          <button onClick={() => nav("learn-home")} aria-label="Back to Learning Centre" style={{
            background:"rgba(255,255,255,0.15)", backdropFilter:"blur(8px)",
            border:"1px solid rgba(255,255,255,0.3)", borderRadius:8,
            color:"#fff", fontSize:12, padding:"6px 14px",
            cursor:"pointer", fontFamily: st.body,
          }}>
            {"\u2190"} Learning Centre
          </button>
        </div>

        {/* ── DEFENSE OF THE DAY ── */}
        <div style={{ padding:"20px 20px 0", animation:"slideUp 0.5s ease" }}>
          <div style={{
            background:"rgba(255,255,255,0.1)", backdropFilter:"blur(12px)",
            border:"1px solid rgba(255,255,255,0.2)", borderRadius:16,
            padding:"18px 18px 16px", cursor:"pointer",
          }} onClick={() => openTopic(dotdTopic.id)}>
            <div style={{ fontSize:9, fontFamily: st.ui, color:"rgba(255,255,255,0.6)", textTransform:"uppercase", letterSpacing:"1.5px", marginBottom:10, fontWeight:700 }}>
              {"\u{1F6E1}\uFE0F"} Defense of the Day
            </div>
            <div style={{ display:"flex", alignItems:"center", gap:12 }}>
              <div style={{
                width:44, height:44, borderRadius:12,
                background:"rgba(255,255,255,0.15)", border:"1px solid rgba(255,255,255,0.25)",
                display:"flex", alignItems:"center", justifyContent:"center", fontSize:22, flexShrink:0,
              }}>{dotdTopic.icon}</div>
              <div style={{ flex:1 }}>
                <div style={{ fontFamily: st.heading, fontSize:17, fontWeight:700, color:"#fff", lineHeight:1.2, marginBottom:4 }}>{dotdTopic.title}</div>
                <p style={{ fontFamily: st.body, fontSize:12, color:"rgba(255,255,255,0.7)", fontStyle:"italic", margin:0, lineHeight:1.4, display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden" }}>
                  &ldquo;{dotdTopic.objection}&rdquo;
                </p>
              </div>
            </div>
            <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between", marginTop:12 }}>
              <span style={{
                fontSize:9, padding:"3px 8px", borderRadius:10,
                background: DIFF_COLORS[dotdTopic.difficulty].dark.bg,
                color: DIFF_COLORS[dotdTopic.difficulty].dark.text,
                fontFamily: st.ui, fontWeight:600, textTransform:"uppercase", letterSpacing:"0.5px",
              }}>{dotdTopic.difficulty}</span>
              <span style={{
                fontSize:12, fontFamily: st.heading, fontWeight:700,
                color:"#fff", padding:"6px 16px", borderRadius:8,
                background: dotdStudiedToday ? "rgba(74,222,128,0.25)" : "rgba(255,255,255,0.2)",
                animation: dotdStudiedToday ? "none" : "pulseGlow 3s ease-in-out infinite",
              }}>
                {dotdStudiedToday ? "\u2713 Reviewed Today" : "Study Now \u2192"}
              </span>
            </div>
          </div>
        </div>

        {/* ── STREAK + PROGRESS ROW ── */}
        <div style={{ display:"flex", alignItems:"center", justifyContent:"space-between", padding:"14px 20px 0", animation:"fadeIn 0.6s ease 0.15s both" }}>
          {streak.current > 0 ? (
            <div style={{ display:"flex", alignItems:"center", gap:6 }}>
              <span style={{ fontSize:18 }}>{flames}</span>
              <span style={{ fontFamily: st.ui, fontSize:12, color:"rgba(255,255,255,0.85)", fontWeight:600 }}>{streak.current} day streak</span>
            </div>
          ) : (
            <span style={{ fontFamily: st.ui, fontSize:12, color:"rgba(255,255,255,0.5)" }}>Start your streak today</span>
          )}
          <div style={{ display:"flex", alignItems:"center", gap:8 }}>
            <MasteryRing percentage={Math.round((studiedCount / totalTopics) * 100)} size={36} theme={{ accent: "#fff", muted: "rgba(255,255,255,0.3)", divider: "rgba(255,255,255,0.12)" }} />
            <span style={{ fontFamily: st.ui, fontSize:11, color:"rgba(255,255,255,0.8)" }}>{studiedCount}/{totalTopics}</span>
          </div>
        </div>

        {/* ── CATEGORY TABS ── */}
        <div role="tablist" aria-label="Filter by category" style={{
          display:"flex", gap:6, overflowX:"auto", padding:"14px 16px 0",
          scrollbarWidth:"none", WebkitOverflowScrolling:"touch",
          justifyContent:"center", flexWrap:"wrap",
          animation:"fadeIn 0.6s ease 0.3s both",
        }}>
          {categories.map(cat => (
            <button key={cat} role="tab" aria-selected={filterCat === cat} aria-controls="apologetics-grid"
              onClick={() => setFilterCat(cat)} style={{
                background: filterCat === cat ? "rgba(255,255,255,0.95)" : "rgba(255,255,255,0.18)",
                border:"none", borderRadius:"20px 20px 0 0",
                color: filterCat === cat ? st.accent : "rgba(255,255,255,0.85)",
                fontSize:11, padding:"8px 14px", cursor:"pointer", whiteSpace:"nowrap",
                fontFamily: st.ui, fontWeight: filterCat === cat ? 700 : 400,
                transition:"all 0.2s",
              }}>
              {cat}
            </button>
          ))}
        </div>
      </div>

      {/* ══ CATEGORY MASTERY STRIP ══ */}
      <div style={{
        display:"flex", gap:10, overflowX:"auto", padding:"16px 20px 8px",
        scrollbarWidth:"none", maxWidth: bp.contentWide, margin:"0 auto",
      }}>
        {CATEGORIES_LIST.map(cat => {
          const cp = categoryProgress[cat];
          const isComplete = cp.pct === 100;
          return (
            <button key={cat} onClick={() => setFilterCat(filterCat === cat ? "All" : cat)} style={{
              display:"flex", flexDirection:"column", alignItems:"center", gap:4,
              minWidth:80, padding:"10px 6px", borderRadius:12, border:"none", cursor:"pointer",
              background: filterCat === cat ? st.accentLight : "transparent",
              transition:"all 0.2s", position:"relative", flexShrink:0,
            }}>
              <div style={{ position:"relative" }}>
                <MasteryRing percentage={cp.pct} size={44} theme={st} />
                {isComplete && (
                  <div style={{
                    position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)",
                    fontSize:14, color:"#D4A853",
                  }}>{"\u2713"}</div>
                )}
                {!isComplete && (
                  <div style={{
                    position:"absolute", top:"50%", left:"50%", transform:"translate(-50%,-50%)",
                    fontSize:10, fontFamily: st.ui, color: st.muted, fontWeight:700,
                  }}>{cp.done}/{cp.total}</div>
                )}
              </div>
              <span style={{ fontSize:9, fontFamily: st.ui, color: st.muted, textAlign:"center", lineHeight:1.2 }}>{cat}</span>
              {isComplete && <div style={{ width:6, height:6, borderRadius:"50%", background:"#D4A853" }} />}
            </button>
          );
        })}
      </div>

      {/* ══ GRID ══ */}
      <div id="apologetics-grid" role="tabpanel" style={{ padding:`8px ${bp.pad}px 48px`, maxWidth:bp.contentWide, margin:"0 auto" }}>
        <p style={{ fontFamily: st.ui, fontSize:12, color: st.muted, margin:"0 0 14px", fontStyle:"italic" }}>
          {visible.length} defense{visible.length !== 1 ? "s" : ""} &middot; tap a card to be challenged
        </p>

        <div style={{ display:"grid", gridTemplateColumns: gridCols, gap:12 }}>
          {visible.map(t => {
            const cat = catColors[t.category];
            const s = studied[t.id];
            const done = !!s;
            const needsReview = s && s.lastStudied && s.lastStudied < sevenDaysAgo;
            const dc = darkMode ? DIFF_COLORS[t.difficulty].dark : DIFF_COLORS[t.difficulty];
            return (
              <button
                key={t.id}
                onClick={() => openTopic(t.id)}
                onPointerDown={() => setPressedId(t.id)}
                onPointerUp={() => setPressedId(null)}
                onPointerLeave={() => setPressedId(null)}
                aria-label={`${t.title} \u2014 ${t.category}${done ? " (studied)" : ""}`}
                style={{
                  background: done ? succ.bg : st.card,
                  border: done ? `1.5px solid ${succ.border}` : `1.5px solid ${st.divider}`,
                  borderRadius:14, padding:"14px 13px",
                  textAlign:"left", cursor:"pointer",
                  boxShadow: darkMode ? "0 2px 8px rgba(0,0,0,0.3)" : "0 2px 8px rgba(0,0,0,0.06)",
                  transition:"all 0.18s", position:"relative",
                  display:"flex", flexDirection:"column", gap:8,
                  transform: pressedId === t.id ? "scale(0.97)" : "scale(1)",
                }}
              >
                {/* Difficulty pill */}
                <span style={{
                  position:"absolute", top:8, left:8,
                  fontSize:8, padding:"2px 6px", borderRadius:6,
                  background: dc.bg, color: dc.text,
                  fontFamily: st.ui, fontWeight:700, textTransform:"uppercase", letterSpacing:"0.3px",
                }}>{t.difficulty.charAt(0).toUpperCase()}</span>

                {/* Studied checkmark + count */}
                {done && (
                  <div aria-hidden="true" style={{
                    position:"absolute", top:8, right:8, display:"flex", alignItems:"center", gap:3,
                  }}>
                    {s.studyCount > 1 && <span style={{ fontSize:9, color: succ.text, fontFamily: st.ui, fontWeight:600 }}>x{s.studyCount}</span>}
                    <div style={{
                      width:18, height:18, borderRadius:"50%",
                      background: succ.check, display:"flex",
                      alignItems:"center", justifyContent:"center",
                      fontSize:10, color:"#fff",
                    }}>{"\u2713"}</div>
                  </div>
                )}

                {/* Debate score badge */}
                {s?.quizScore != null && (
                  <div style={{
                    position:"absolute", bottom:8, right:8,
                    fontSize:9, padding:"2px 6px", borderRadius:6,
                    background: s.quizScore === 3 ? "#D4A85320" : s.quizScore >= 2 ? "#9CA3AF20" : "#CD7F3220",
                    color: s.quizScore === 3 ? "#D4A853" : s.quizScore >= 2 ? st.muted : "#CD7F32",
                    fontFamily: st.ui, fontWeight:700,
                  }}>{"\u{1F6E1}"} {s.quizScore}/3</div>
                )}

                <div aria-hidden="true" style={{
                  width:40, height:40, borderRadius:10, marginTop:6,
                  background:`${t.color}18`, border:`1.5px solid ${t.color}40`,
                  display:"flex", alignItems:"center", justifyContent:"center", fontSize:20,
                }}>{t.icon}</div>

                <div style={{ fontFamily: st.heading, fontSize:"clamp(12px,3vw,13px)", fontWeight:700, color: st.text, lineHeight:1.25 }}>
                  {t.title}
                </div>

                <span style={{
                  display:"inline-block", background:cat.bg,
                  color:cat.text, border:`1px solid ${cat.border}50`,
                  borderRadius:20, fontSize:9, padding:"2px 7px",
                  fontFamily: st.ui, alignSelf:"flex-start",
                }}>{t.category}</span>

                <p style={{
                  fontFamily: st.body, fontSize:"clamp(11px,2.5vw,12px)",
                  color: st.muted, fontStyle:"italic", margin:0, lineHeight:1.45,
                  display:"-webkit-box", WebkitLineClamp:2, WebkitBoxOrient:"vertical", overflow:"hidden",
                }}>&ldquo;{t.objection}&rdquo;</p>

                <div style={{ marginTop:"auto", fontSize:10, fontFamily: st.ui, fontWeight:700, color: needsReview ? WARNING.light.accent : t.color }}>
                  {needsReview ? (<><span style={{ animation:"pulseGlow 2s ease-in-out infinite", display:"inline-block" }}>{"\u{1F7E0}"}</span> Review</>) : (<>Can you answer this? {"\u2192"}</>)}
                </div>
              </button>
            );
          })}
        </div>
      </div>

      {/* ══ MODAL ══ */}
      {selected && topic && (
        <div onClick={closeModal} role="dialog" aria-modal="true" aria-labelledby="apol-modal-title" style={{
          position:"fixed", inset:0, background:"rgba(15,23,42,0.6)",
          backdropFilter:"blur(4px)", zIndex:100,
          display:"flex", alignItems:"flex-end",
          opacity: animIn ? 1 : 0, transition:"opacity 0.28s",
        }}>
          <div ref={modalRef} onClick={e => e.stopPropagation()} style={{
            width:"100%", maxWidth:bp.content, margin:"0 auto",
            background: st.card, borderRadius:"22px 22px 0 0",
            maxHeight:"88vh", overflowY:"auto",
            transform: animIn ? "translateY(0)" : "translateY(100%)",
            transition:"transform 0.3s cubic-bezier(0.32,0.72,0,1)",
          }}>
            {/* Modal header */}
            <div style={{
              background: st.card, borderBottom: `1px solid ${st.divider}`,
              padding:"20px 20px 16px", position:"sticky", top:0,
              borderRadius:"22px 22px 0 0", zIndex:10,
            }}>
              <div aria-hidden="true" style={{ width:36, height:4, background: st.light, borderRadius:2, margin:"0 auto 14px" }} />
              <div style={{ display:"flex", alignItems:"flex-start", gap:12 }}>
                <div aria-hidden="true" style={{
                  width:48, height:48, borderRadius:12, flexShrink:0,
                  background:`${topic.color}22`, border:`1.5px solid ${topic.color}50`,
                  display:"flex", alignItems:"center", justifyContent:"center", fontSize:24,
                }}>{topic.icon}</div>
                <div style={{ flex:1 }}>
                  <h2 id="apol-modal-title" style={{
                    fontFamily: st.heading, fontSize:"clamp(16px,4vw,20px)",
                    fontWeight:700, color: st.text, margin:"0 0 4px", lineHeight:1.2,
                  }}>{topic.title}</h2>
                  <div style={{ display:"flex", gap:6, alignItems:"center", flexWrap:"wrap" }}>
                    <span style={{
                      background: catColors[topic.category].bg, color: catColors[topic.category].text,
                      borderRadius:20, fontSize:10, padding:"2px 9px", fontFamily: st.ui,
                    }}>{topic.category}</span>
                    <span style={{
                      fontSize:9, padding:"2px 7px", borderRadius:8,
                      background: (darkMode ? DIFF_COLORS[topic.difficulty].dark : DIFF_COLORS[topic.difficulty]).bg,
                      color: (darkMode ? DIFF_COLORS[topic.difficulty].dark : DIFF_COLORS[topic.difficulty]).text,
                      fontFamily: st.ui, fontWeight:600, textTransform:"uppercase",
                    }}>{topic.difficulty}</span>
                  </div>
                </div>
                <button ref={closeBtnRef} onClick={closeModal} aria-label="Close dialog" style={{
                  background: st.accentLight, border:"none", borderRadius:"50%",
                  width:32, height:32, cursor:"pointer", fontSize:16, color: st.muted,
                  display:"flex", alignItems:"center", justifyContent:"center", flexShrink:0,
                }}>{"\u00D7"}</button>
              </div>
            </div>

            <div style={{ padding:"20px 20px 32px" }}>
              {/* The Challenge */}
              <div style={{
                background: warn.bg, border: `1.5px solid ${warn.border}`,
                borderLeft:`4px solid ${warn.accent}`,
                borderRadius:"0 10px 10px 0", padding:"14px 16px", marginBottom:20,
              }}>
                <div style={{ fontSize:10, fontFamily: st.ui, color: warn.label, textTransform:"uppercase", letterSpacing:"1px", marginBottom:6, fontWeight:700 }}>
                  {"\u26A0\uFE0F"} The Challenge
                </div>
                <p style={{ fontFamily: st.body, fontSize:14, color: warn.text, fontStyle:"italic", margin:0, lineHeight:1.6 }}>
                  &ldquo;{topic.objection}&rdquo;
                </p>
              </div>

              {/* Reveal or Defense */}
              {!revealed ? (
                <div style={{ textAlign:"center", padding:"24px 0" }}>
                  <p style={{ fontFamily: st.body, fontSize:13, color: st.muted, fontStyle:"italic", marginBottom:16 }}>
                    How would you answer this? Think for a moment&hellip;
                  </p>
                  <button onClick={() => setRevealed(true)} aria-label="Reveal the defense" style={{
                    background: st.headerGradient, border:"none", borderRadius:12, color: st.headerText,
                    padding:"14px 32px", fontSize:14, cursor:"pointer",
                    fontFamily: st.heading, fontWeight:700,
                    boxShadow:`0 4px 16px ${st.accent}40`, letterSpacing:"0.3px",
                  }}>
                    {"\u{1F4D6}"} Reveal the Defense
                  </button>
                </div>
              ) : (
                <div style={{ animation:"fadeIn 0.4s ease" }}>
                  <div style={{ fontSize:10, fontFamily: st.ui, color: st.accent, textTransform:"uppercase", letterSpacing:"1px", marginBottom:12, fontWeight:700 }}>
                    {"\u{1F4D6}"} The Defense
                  </div>
                  {topic.answer.split("\n\n").map((para, i) => (
                    <p key={i} style={{ fontFamily: st.body, fontSize:"clamp(14px,3vw,15px)", color: st.text, lineHeight:1.8, margin:"0 0 14px" }}>{para}</p>
                  ))}

                  {/* Key Verse */}
                  <div style={{
                    background: `${st.accent}0A`, border: `1.5px solid ${st.accentBorder}`,
                    borderRadius:12, padding:"16px 18px", marginTop:8,
                  }}>
                    <div style={{ fontSize:10, color: st.accent, fontFamily: st.ui, textTransform:"uppercase", letterSpacing:"1px", marginBottom:8, fontWeight:700 }}>
                      {"\u{1F5DD}"} Key Verse
                    </div>
                    <p style={{ fontFamily: st.body, fontStyle:"italic", fontSize:"clamp(14px,3.5vw,16px)", color: st.text, margin:"0 0 8px", lineHeight:1.55 }}>
                      &ldquo;{topic.keyVerse.text}&rdquo;
                    </p>
                    <p style={{ fontFamily: st.ui, fontSize:12, color: st.accent, margin:0, fontWeight:700 }}>
                      &mdash; {topic.keyVerse.ref}
                    </p>
                  </div>

                  {/* Action buttons */}
                  <div style={{ display:"flex", gap:10, marginTop:20 }}>
                    <button onClick={() => { markStudied(topic.id); closeModal(); }}
                      aria-label={studied[topic.id] ? "Study again" : "Mark as studied"} style={{
                        flex:1, background: studied[topic.id] ? succ.bg : st.headerGradient,
                        border: studied[topic.id] ? `1.5px solid ${succ.border}` : "none",
                        borderRadius:12, color: studied[topic.id] ? succ.text : st.headerText,
                        padding:"13px", fontSize:13, cursor:"pointer",
                        fontFamily: st.heading, fontWeight:700,
                        boxShadow: studied[topic.id] ? "none" : `0 4px 16px ${st.accent}30`,
                        transition:"all 0.2s",
                      }}>
                      {studied[topic.id] ? "\u2713 Studied" : "\u2713 Mark as Studied"}
                    </button>
                    <button onClick={() => shareTopic(topic)} aria-label={`Share "${topic.title}"`} style={{
                      width:46, height:46, borderRadius:12, flexShrink:0,
                      background: st.accentLight, border: `1.5px solid ${st.accentBorder}`,
                      cursor:"pointer", display:"flex", alignItems:"center", justifyContent:"center",
                      fontSize:18, color: st.accent,
                    }}>
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M4 12v8a2 2 0 002 2h12a2 2 0 002-2v-8"/><polyline points="16 6 12 2 8 6"/><line x1="12" y1="2" x2="12" y2="15"/></svg>
                    </button>
                  </div>

                  {/* ── DEBATE MODE ── */}
                  <div style={{ borderTop:`1px dashed ${st.divider}`, marginTop:24, paddingTop:20 }}>
                    <div style={{ fontSize:10, fontFamily: st.ui, color: st.accent, textTransform:"uppercase", letterSpacing:"1px", marginBottom:4, fontWeight:700 }}>
                      {"\u2694\uFE0F"} Debate Mode
                    </div>
                    <p style={{ fontFamily: st.body, fontSize:12, color: st.muted, fontStyle:"italic", margin:"0 0 14px" }}>
                      Test your understanding &mdash; pick the biblical defense.
                    </p>
                    <div style={{ display:"flex", flexDirection:"column", gap:8 }}>
                      {topic.debateOptions.map((opt, idx) => {
                        const chosen = debateAnswer === idx;
                        const showCorrect = debateAnswer !== null && opt.correct;
                        const showWrong = chosen && !opt.correct;
                        return (
                          <button key={idx} onClick={() => handleDebate(idx)}
                            disabled={debateAnswer !== null}
                            style={{
                              textAlign:"left", padding:"12px 14px", borderRadius:10, cursor: debateAnswer !== null ? "default" : "pointer",
                              fontFamily: st.body, fontSize:13, lineHeight:1.5, color: st.text,
                              background: showCorrect ? succ.bg : showWrong ? "#FEE2E220" : st.card,
                              border: showCorrect ? `2px solid ${succ.check}` : showWrong ? "2px solid #EF4444" : `1.5px solid ${st.divider}`,
                              transition:"all 0.2s", position:"relative", opacity: debateAnswer !== null && !chosen && !opt.correct ? 0.5 : 1,
                            }}>
                            {showCorrect && <span style={{ position:"absolute", top:10, right:10, fontSize:14 }}>{"\u2713"}</span>}
                            {showWrong && <span style={{ position:"absolute", top:10, right:10, fontSize:14 }}>{"\u2717"}</span>}
                            {opt.text}
                          </button>
                        );
                      })}
                    </div>
                    {debateAnswer !== null && (
                      <div style={{ textAlign:"center", marginTop:14, position:"relative" }}>
                        {topic.debateOptions[debateAnswer]?.correct && <ConfettiParticles count={6} />}
                        <p style={{
                          fontFamily: st.heading, fontSize:14, fontWeight:700,
                          color: topic.debateOptions[debateAnswer]?.correct ? succ.text : "#EF4444",
                        }}>
                          {topic.debateOptions[debateAnswer]?.correct ? "\u{1F6E1}\uFE0F Well defended!" : "Not quite \u2014 see the highlighted answer above."}
                        </p>
                      </div>
                    )}
                  </div>

                  {/* ── RELATED TOPICS ── */}
                  {topic.related && topic.related.length > 0 && (
                    <div style={{ borderTop:`1px dashed ${st.divider}`, marginTop:20, paddingTop:18 }}>
                      <div style={{ fontSize:10, fontFamily: st.ui, color: st.accent, textTransform:"uppercase", letterSpacing:"1px", marginBottom:12, fontWeight:700 }}>
                        Explore Related
                      </div>
                      <div style={{ display:"flex", gap:10 }}>
                        {topic.related.map(rid => {
                          const rt = APOLOGETICS_TOPICS.find(t => t.id === rid);
                          if (!rt) return null;
                          const rDone = !!studied[rt.id];
                          return (
                            <button key={rid} onClick={() => openRelated(rid)} style={{
                              flex:1, textAlign:"left", padding:"12px", borderRadius:12, cursor:"pointer",
                              background: st.card, border: `1.5px solid ${st.divider}`,
                              display:"flex", alignItems:"center", gap:10,
                              transition:"all 0.15s",
                            }}>
                              <div style={{
                                width:36, height:36, borderRadius:10, flexShrink:0,
                                background:`${rt.color}18`, border:`1px solid ${rt.color}30`,
                                display:"flex", alignItems:"center", justifyContent:"center", fontSize:16,
                              }}>{rt.icon}</div>
                              <div>
                                <div style={{ fontFamily: st.heading, fontSize:12, fontWeight:700, color: st.text, lineHeight:1.2 }}>{rt.title}</div>
                                <span style={{ fontSize:9, fontFamily: st.ui, color: rDone ? succ.text : st.muted }}>
                                  {rDone ? "\u2713 Studied" : "New"}
                                </span>
                              </div>
                            </button>
                          );
                        })}
                      </div>
                    </div>
                  )}
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      {/* ══ CELEBRATION OVERLAYS ══ */}
      {celebration && (
        <div onClick={() => setCelebration(null)} style={{
          position:"fixed", inset:0, zIndex:200,
          background: celebration === "master"
            ? "linear-gradient(135deg, #2D1B4E 0%, #4A2D6B 50%, #D4A853 100%)"
            : `linear-gradient(135deg, ${st.accent}CC, ${st.dark}CC)`,
          display:"flex", flexDirection:"column", alignItems:"center", justifyContent:"center",
          animation:"fadeIn 0.4s ease",
        }}>
          <ConfettiParticles count={celebration === "master" ? 12 : 8} />
          <div style={{ fontSize:64, marginBottom:16 }}>{celebration === "master" ? "\u{1F451}" : "\u{1F6E1}\uFE0F"}</div>
          <h2 style={{ fontFamily: st.heading, fontSize:28, color:"#fff", margin:"0 0 8px", textAlign:"center" }}>
            {celebration === "master" ? "Master Apologist!" : "Category Mastered!"}
          </h2>
          <p style={{ fontFamily: st.body, fontSize:15, color:"rgba(255,255,255,0.85)", textAlign:"center", maxWidth:280, lineHeight:1.5 }}>
            {celebration === "master"
              ? "You have studied all 20 defenses. Well done, faithful servant."
              : "Every topic in this category complete. Keep going!"}
          </p>
          <button onClick={() => setCelebration(null)} style={{
            marginTop:24, background:"rgba(255,255,255,0.2)", border:"1px solid rgba(255,255,255,0.4)",
            borderRadius:12, color:"#fff", padding:"12px 32px", fontSize:14,
            fontFamily: st.heading, fontWeight:700, cursor:"pointer",
          }}>Continue</button>
        </div>
      )}

      <style>{`
        @keyframes fadeIn { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
      `}</style>
    </div>
  );
}
