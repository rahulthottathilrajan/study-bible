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
  "The Bible & Other Books": { bg: "#FEF3C7", text: "#78350F", border: "#D97706" },
  "Jesus & Salvation":       { bg: "#FCE7F3", text: "#831843", border: "#EC4899" },
  "The Church & Modern Challenges": { bg: "#E0E7FF", text: "#3730A3", border: "#6366F1" },
};
const DARK_CATEGORY_COLORS = {
  "The Godhead":          { bg: "rgba(107,33,168,0.15)", text: "#C084FC", border: "#6B21A880" },
  "The Person of Christ": { bg: "rgba(245,158,11,0.12)", text: "#F59E0B", border: "#92400E80" },
  "Scripture":            { bg: "rgba(202,138,4,0.12)", text: "#CA8A04", border: "#713F1280" },
  "The Cross":            { bg: "rgba(251,113,133,0.12)", text: "#FB7185", border: "#9F123980" },
  "History & Evidence":   { bg: "rgba(56,189,248,0.12)", text: "#38BDF8", border: "#07598580" },
  "Suffering & God":      { bg: "rgba(74,222,128,0.12)", text: "#4ADE80", border: "#16653480" },
  "Reason & Philosophy":  { bg: "rgba(167,139,250,0.12)", text: "#A78BFA", border: "#4C1D9580" },
  "The Bible & Other Books": { bg: "rgba(217,119,6,0.12)", text: "#D97706", border: "#78350F80" },
  "Jesus & Salvation":       { bg: "rgba(236,72,153,0.12)", text: "#EC4899", border: "#83184380" },
  "The Church & Modern Challenges": { bg: "rgba(99,102,241,0.12)", text: "#6366F1", border: "#3730A380" },
};

const SUCCESS = { light: { bg: "#F0FDF4", border: "#86EFAC", text: "#166534", check: "#22C55E" }, dark: { bg: "rgba(5,150,105,0.08)", border: "#86EFAC60", text: "#4ADE80", check: "#22C55E" } };
const WARNING = { light: { bg: "#FFF7ED", border: "#FED7AA", accent: "#F97316", label: "#C2410C", text: "#7C2D12" }, dark: { bg: "rgba(249,115,22,0.08)", border: "rgba(249,115,22,0.25)", accent: "#F97316", label: "#F97316", text: "#FDBA74" } };
const DIFF_COLORS = { beginner: { bg: "#D1FAE5", text: "#065F46", dark: { bg: "rgba(16,185,129,0.15)", text: "#6EE7B7" } }, intermediate: { bg: "#FEF3C7", text: "#92400E", dark: { bg: "rgba(245,158,11,0.15)", text: "#FCD34D" } }, advanced: { bg: "#FEE2E2", text: "#991B1B", dark: { bg: "rgba(239,68,68,0.15)", text: "#FCA5A5" } } };
const CONFETTI_COLORS = ["#D4A853", "#C8A24D", "#E8D5A0", "#B89440", "#8B5CF6", "#E8625C"];

const LS_KEY = "apologeticsStudied";
const LS_STREAK = "apologeticsStreak";

export function getDayOfYear() {
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

export const APOLOGETICS_TOPICS = [
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
  {
    id: 21, icon: "\u{1F4DA}", title: "Was the Bible Changed Over Time?",
    question: "The original scriptures were corrupted before the 7th century.",
    objection: "The earliest scriptures have been altered so many times that we cannot trust what we have today.",
    answer: `This claim assumes corruption occurred but never specifies when, by whom, or how \u2014 because there is no evidence it happened. The manuscript tradition tells the opposite story.\n\nWe possess over 5,800 Greek New Testament manuscripts, over 10,000 Latin manuscripts, and thousands more in Syriac, Coptic, and Armenian. These manuscripts were copied independently across three continents \u2014 Europe, Africa, and Asia \u2014 by communities that had no contact with each other. If any single group had altered the text, the other manuscript families would expose the change. Yet when compared, they show 99.5% agreement.\n\nThe Dead Sea Scrolls, discovered in 1947, contained copies of Isaiah dating to around 150 BC \u2014 over 1,000 years older than the oldest copy previously available. When compared to the Masoretic text, they were virtually identical. Scholar Gleason Archer, after a lifetime studying the manuscripts, concluded: "The Isaiah scrolls proved to be word-for-word identical with our standard Hebrew Bible in more than 95% of the text."\n\nCrucially, the earliest Christian writers \u2014 Clement of Rome (96 AD), Ignatius of Antioch (107 AD), Polycarp (110 AD) \u2014 quote the New Testament extensively. From their quotations alone, scholars can reconstruct nearly the entire New Testament. The text was too widely distributed, too quickly, to be corrupted.`,
    keyVerse: { ref: "Psalm 12:6-7", text: "The words of the LORD are pure words: as silver tried in a furnace of earth, purified seven times. Thou shalt keep them, O LORD, thou shalt preserve them from this generation for ever." },
    category: "The Bible & Other Books", color: "#D97706",
    difficulty: "intermediate", related: [6, 15],
    debateOptions: [
      { text: "We can't verify the original text because the earliest manuscripts were destroyed", correct: false },
      { text: "Over 5,800 Greek manuscripts copied independently across three continents show 99.5% agreement \u2014 and the Dead Sea Scrolls confirmed 1,000 years of faithful transmission", correct: true },
      { text: "Some corruption occurred but it only affected minor passages, not core doctrines", correct: false },
    ],
  },
  {
    id: 22, icon: "\u{1F4D5}", title: "Are There Lost Books of the Bible?",
    question: "Books like Enoch and Thomas were hidden from us by the church.",
    objection: "There are secret gospels and lost scriptures that the church suppressed to control the narrative.",
    answer: `The claim that books were "suppressed" misunderstands how the canon was recognized. The early church did not vote on which books to include \u2014 they recognized which books already carried apostolic authority.\n\nThe so-called "lost" gospels \u2014 the Gospel of Thomas, Gospel of Judas, Gospel of Philip \u2014 were well known in the ancient world. They were not hidden; they were rejected because they were written 100-200 years after the apostles, by anonymous authors, and contained teachings radically inconsistent with first-century Christianity. The Gospel of Thomas, for example, ends with: "Let Mary leave us, for women are not worthy of life" \u2014 a gnostic sentiment completely alien to Jesus' treatment of women.\n\nThe Book of Enoch was known to early Christians (Jude 14 quotes it), but it was not considered Scripture by the majority of Jewish or Christian communities. Being quoted does not equal being canonical \u2014 Paul quoted pagan poets too (Acts 17:28). The criteria for canonicity were clear: apostolic authorship or endorsement, doctrinal consistency, and universal acceptance by the early churches.\n\nMichael Kruger's Canon Revisited (2012) demonstrates that the four Gospels and Paul's letters were circulating as authoritative Scripture within decades of being written. The Muratorian Fragment (~170 AD) lists most of the New Testament as already accepted. Nothing was "lost" \u2014 the rejected texts were simply late, anonymous, and theologically alien.`,
    keyVerse: { ref: "2 Timothy 3:16", text: "All scripture is given by inspiration of God, and is profitable for doctrine, for reproof, for correction, for instruction in righteousness" },
    category: "The Bible & Other Books", color: "#D97706",
    difficulty: "intermediate", related: [15, 23],
    debateOptions: [
      { text: "There are many valid scriptures that were suppressed by church councils for political reasons", correct: false },
      { text: "The rejected texts were written 100-200 years after the apostles, by anonymous authors, with teachings alien to first-century Christianity. Nothing was lost \u2014 the canon was recognized, not invented", correct: true },
      { text: "The Book of Enoch should be in the Bible since Jude quotes it directly", correct: false },
    ],
  },
  {
    id: 23, icon: "\u{1F500}", title: "The Bible Has Contradictions",
    question: "Genesis 1 and 2 disagree. The Gospels contradict each other.",
    objection: "The Bible is full of contradictions, which proves it cannot be divinely inspired.",
    answer: `This is one of the most common claims \u2014 and one of the most examined. When scholars investigate alleged contradictions, they consistently find complementary perspectives rather than genuine conflicts.\n\nGenesis 1 and 2 are not two conflicting creation accounts. Genesis 1 is a chronological overview of all creation; Genesis 2 zooms in on the creation of humanity in the Garden of Eden. This is the same literary technique used in journalism: a headline summary followed by a detailed feature. Old Testament scholar Kenneth Kitchen, in On the Reliability of the Old Testament (2003), demonstrates that this pattern is standard in ancient Near Eastern literature.\n\nThe Gospel "contradictions" follow the same pattern. If four eyewitnesses described an event identically, word-for-word, that would suggest collusion, not credibility. The minor differences \u2014 one Gospel mentions one angel at the tomb, another mentions two \u2014 are exactly what historians expect from independent eyewitness accounts. As Simon Greenleaf, Harvard's professor of legal evidence, argued in The Testimony of the Evangelists (1846): the Gospels pass the tests of legal credibility that would be accepted in any court of law.\n\nScholars like Gleason Archer (Encyclopedia of Bible Difficulties, 1982) have addressed hundreds of alleged contradictions in detail. In every case, understanding the literary genre, historical context, or original language resolves the apparent conflict.`,
    keyVerse: { ref: "2 Peter 1:20-21", text: "no prophecy of the scripture is of any private interpretation. For the prophecy came not in old time by the will of man: but holy men of God spake as they were moved by the Holy Ghost." },
    category: "The Bible & Other Books", color: "#D97706",
    difficulty: "beginner", related: [6, 10],
    debateOptions: [
      { text: "The Bible does contain real contradictions, but the core message is still reliable", correct: false },
      { text: "Alleged contradictions are complementary perspectives \u2014 like eyewitness testimony. Minor differences prove independence, not error. Scholars like Archer have resolved hundreds of these", correct: true },
      { text: "The contradictions were introduced by scribes during copying and weren't in the originals", correct: false },
    ],
  },
  {
    id: 24, icon: "\u270D\uFE0F", title: "Who Wrote the Pentateuch?",
    question: "Moses couldn't have written about his own death.",
    objection: "Modern scholarship has proven that Moses didn't write the first five books. They were compiled centuries later.",
    answer: `The observation that Moses could not have written the account of his own death (Deuteronomy 34) is valid \u2014 and Christians have always acknowledged it. The early church understood that Joshua or another successor likely added the final chapter. This does not undermine Mosaic authorship of the rest any more than an editor's footnote undermines an author's book.\n\nJesus himself attributed the Torah to Moses repeatedly: "Have ye not read in the book of Moses?" (Mark 12:26), "Moses gave you circumcision" (John 7:22), "If ye believed Moses, ye would believe me: for he wrote of me" (John 5:46). If Jesus \u2014 whom Christians believe is God incarnate \u2014 affirmed Mosaic authorship, the question becomes whether Jesus was wrong or whether modern critics are.\n\nThe Documentary Hypothesis (JEDP theory), which proposes multiple anonymous authors centuries later, was popularised by Julius Wellhausen in the 19th century but has been increasingly challenged. Egyptologist Kenneth Kitchen demonstrated that the structure and legal format of Deuteronomy matches second-millennium BC treaty documents \u2014 not first-millennium compositions. Duane Garrett's Rethinking Genesis (1991) shows that the literary evidence points to an early, unified composition.\n\nMinor editorial updates (place names, clarifying notes) are consistent with a living textual tradition \u2014 they do not require the conclusion that Moses wrote nothing.`,
    keyVerse: { ref: "John 5:46", text: "For had ye believed Moses, ye would have believed me: for he wrote of me." },
    category: "The Bible & Other Books", color: "#D97706",
    difficulty: "advanced", related: [25, 40],
    debateOptions: [
      { text: "Moses could not have written the Pentateuch because the death account proves multiple authors", correct: false },
      { text: "Joshua likely added the final chapter. Jesus himself affirmed Mosaic authorship, and the literary structure matches second-millennium BC treaties, not later compositions", correct: true },
      { text: "The Pentateuch was written by Moses through direct divine dictation, word for word including his death", correct: false },
    ],
  },
  {
    id: 25, icon: "\u{1F4E8}", title: "Is the New Testament Just Paul's Religion?",
    question: "Paul hijacked Jesus' message and invented Christianity.",
    objection: "Jesus taught simple faith; Paul turned it into a complex religion about Jesus rather than the religion of Jesus.",
    answer: `This claim \u2014 that Paul invented Christianity \u2014 collapses under historical examination. Paul's letters are the earliest Christian documents we possess, written in the 50s AD, within 20 years of the crucifixion. In 1 Corinthians 15:3-7, Paul explicitly states he is passing on what he received \u2014 not inventing new doctrine.\n\nPaul met with the original apostles and received their endorsement. Galatians 2:9 records that James, Peter, and John \u2014 the pillars of the Jerusalem church \u2014 gave Paul "the right hand of fellowship." If Paul had been teaching something different from what Jesus taught, the apostles who walked with Jesus would have rejected him. Instead, Peter himself writes: "our beloved brother Paul also according to the wisdom given unto him hath written unto you" (2 Peter 3:15-16), placing Paul's letters alongside "the other scriptures."\n\nThe core of Paul's teaching \u2014 that Jesus is the divine Son of God, died for sins, was buried, and rose again \u2014 is precisely what the Gospels record Jesus himself teaching (Mark 10:45, John 10:17-18). Paul's theology of grace (Ephesians 2:8-9) echoes Jesus' own words: "the Son of man came not to be ministered unto, but to minister, and to give his life a ransom for many" (Mark 10:45).\n\nAs scholar Larry Hurtado demonstrated in Lord Jesus Christ (2003), the worship of Jesus as divine began immediately after the resurrection, in the earliest Jewish-Christian communities \u2014 long before Paul's letters. Paul did not invent the faith; he articulated what the earliest Christians already believed and practiced.`,
    keyVerse: { ref: "1 Corinthians 15:3", text: "For I delivered unto you first of all that which I also received, how that Christ died for our sins according to the scriptures" },
    category: "The Bible & Other Books", color: "#D97706",
    difficulty: "intermediate", related: [16, 2],
    debateOptions: [
      { text: "Paul never met Jesus and created his own version of Christianity that contradicted the original disciples", correct: false },
      { text: "Paul explicitly says he passed on what he received. The original apostles endorsed his teaching (Galatians 2:9), and Peter placed his letters alongside Scripture (2 Peter 3:15-16)", correct: true },
      { text: "Paul's theology is different from Jesus' but both are equally valid expressions of early Christianity", correct: false },
    ],
  },
  {
    id: 26, icon: "\u{1F6A9}", title: "Was Jesus Really Crucified?",
    question: "Someone else was put on the cross in his place.",
    objection: "It has been claimed that Jesus was not actually crucified \u2014 that God rescued him and someone else was substituted.",
    answer: `The crucifixion of Jesus is one of the most historically certain events in the ancient world. Even scholars who reject Christianity accept it as fact. Atheist historian Bart Ehrman writes: "The crucifixion of Jesus by the Romans is one of the most secure facts we have about his life."\n\nThe evidence is overwhelming. Roman crucifixion was a public event \u2014 designed to be witnessed. Jesus was arrested, tried before Pilate, flogged (a process that alone could be fatal), and crucified in full view of his followers, his enemies, the Roman soldiers, and the crowds. Roman executioners were professionals who faced death themselves for failing to ensure a prisoner's death. The spear thrust into Jesus' side (John 19:34) produced "blood and water" \u2014 consistent with post-mortem separation of blood components, confirming death.\n\nHistorian Josephus (Antiquities 18.3.3, ~93 AD), Roman historian Tacitus (Annals 15.44, ~116 AD), and the Babylonian Talmud (Sanhedrin 43a) all independently confirm the crucifixion. Josephus, a Jewish historian writing for a Roman audience, had no reason to invent this. Tacitus, who despised Christians, confirmed it while describing Nero's persecution.\n\nThe substitution theory \u2014 that God made someone else look like Jesus and put him on the cross instead \u2014 makes God a deceiver. It also fails to explain why the disciples, who were eyewitnesses, would die for what they knew was a lie. As N.T. Wright notes: the crucifixion was not something the early church would have invented. A crucified Messiah was a contradiction in terms in Jewish expectation. They proclaimed it because it happened.`,
    keyVerse: { ref: "1 Corinthians 2:2", text: "For I determined not to know any thing among you, save Jesus Christ, and him crucified." },
    category: "Jesus & Salvation", color: "#EC4899",
    difficulty: "intermediate", related: [11, 9],
    debateOptions: [
      { text: "The crucifixion accounts were exaggerated by later writers to create a theology of atonement", correct: false },
      { text: "Roman, Jewish, and Christian sources independently confirm the crucifixion. Roman executioners verified death. The substitution theory makes God a deceiver and fails to explain why eyewitnesses died for their testimony", correct: true },
      { text: "Jesus was crucified but survived \u2014 he recovered in the tomb and appeared to disciples", correct: false },
    ],
  },
  {
    id: 27, icon: "\u{1F3AF}", title: "Is Salvation by Faith Alone?",
    question: "You must earn your way to God through works and rituals.",
    objection: "Faith alone is not enough. You must perform works, follow laws, and observe rituals to be saved.",
    answer: `This is the central question of the Gospel, and Scripture answers it with extraordinary clarity. Ephesians 2:8-9 states: "For by grace are ye saved through faith; and that not of yourselves: it is the gift of God: Not of works, lest any man should boast."\n\nThe logic is theological, not merely preferential. If salvation could be earned by human effort, then Christ's death was unnecessary. Paul makes this explicit in Galatians 2:21: "if righteousness come by the law, then Christ is dead in vain." The entire argument of Romans 3-5 is that no human being can meet God's perfect standard through works \u2014 "for all have sinned, and come short of the glory of God" (Romans 3:23) \u2014 and therefore salvation must come as a gift received by faith.\n\nThis does not mean faith produces no works. James 2:17 says "faith without works is dead" \u2014 but this describes the evidence of genuine faith, not the basis of salvation. A thermometer does not produce heat; it measures it. Good works are the fruit of salvation, not the root. Jesus himself said: "by their fruits ye shall know them" (Matthew 7:20) \u2014 the fruit reveals the tree, but does not create it.\n\nThe thief on the cross (Luke 23:43) is the ultimate test case. He performed no works, observed no rituals, was baptized by no one \u2014 yet Jesus said to him: "To day shalt thou be with me in paradise." If works were required, this promise would be impossible.`,
    keyVerse: { ref: "Ephesians 2:8-9", text: "For by grace are ye saved through faith; and that not of yourselves: it is the gift of God: Not of works, lest any man should boast." },
    category: "Jesus & Salvation", color: "#EC4899",
    difficulty: "beginner", related: [42, 30],
    debateOptions: [
      { text: "James 2:17 proves that works are required for salvation alongside faith", correct: false },
      { text: "Ephesians 2:8-9 is clear: salvation is by grace through faith, not works. James describes works as evidence of faith, not its basis. The thief on the cross was saved with no works at all", correct: true },
      { text: "Faith alone saves initially, but you can lose salvation if you stop doing good works", correct: false },
    ],
  },
  {
    id: 28, icon: "\u{1F64C}", title: "Did Jesus Say 'Worship Me'?",
    question: "Jesus never directly asked anyone to worship him.",
    objection: "If Jesus were God, he would have explicitly commanded people to worship him. He never did.",
    answer: `Jesus did not merely accept worship \u2014 he received it repeatedly, in contexts where any faithful Jew would have refused it.\n\nIn Matthew 14:33, after walking on water, "they that were in the ship came and worshipped him, saying, Of a truth thou art the Son of God." Jesus did not correct them. In John 20:28, Thomas falls before the risen Christ and declares "My Lord and my God!" \u2014 and Jesus responds not with rebuke but with blessing: "Thomas, because thou hast seen me, thou hast believed: blessed are they that have not seen, and yet have believed" (John 20:29).\n\nThe contrast with other biblical figures is decisive. When Cornelius falls at Peter's feet to worship, Peter immediately stops him: "Stand up; I myself also am a man" (Acts 10:26). When John falls before an angel in Revelation 22:8-9, the angel says: "See thou do it not... worship God." Every righteous being in Scripture refuses worship \u2014 except Jesus. He accepts it without correction, which is either supreme blasphemy or supreme truth.\n\nFurthermore, Jesus explicitly claims worship belongs to him. In John 5:23: "That all men should honour the Son, even as they honour the Father. He that honoureth not the Son honoureth not the Father which hath sent him." The word "even as" (Greek: kathos) means "in the same way and to the same degree." This is not the language of a prophet \u2014 it is the language of God.`,
    keyVerse: { ref: "John 5:23", text: "That all men should honour the Son, even as they honour the Father." },
    category: "Jesus & Salvation", color: "#EC4899",
    difficulty: "intermediate", related: [2, 29],
    debateOptions: [
      { text: "People worshipped Jesus out of cultural respect, not as divine worship", correct: false },
      { text: "Jesus received worship without correction \u2014 unlike Peter and angels who refused it. In John 5:23 he explicitly said to honor the Son 'even as' the Father. Every righteous being in Scripture refuses worship except Jesus", correct: true },
      { text: "Jesus accepted worship only after the resurrection, not during his earthly ministry", correct: false },
    ],
  },
  {
    id: 29, icon: "\u{1F4FF}", title: "Is Jesus Just a Prophet?",
    question: "Jesus was a great teacher sent by God, but not God himself.",
    objection: "Jesus was one of many prophets \u2014 great and honoured, but not divine.",
    answer: `This view must reckon with what Jesus actually claimed about himself. A mere prophet does not say "Before Abraham was, I AM" (John 8:58), taking the divine name of Exodus 3:14. A mere prophet does not say "I and my Father are one" (John 10:30). A mere prophet does not forgive sins \u2014 which only God can do (Mark 2:5-7). A mere prophet does not accept worship (Matthew 14:33, John 20:28).\n\nC.S. Lewis's famous trilemma remains logically sound: Jesus claimed to be God. He was therefore either a liar (he knew it was false), a lunatic (he sincerely believed a delusion), or Lord (the claim was true). What he cannot be is merely a "great teacher" \u2014 because a great teacher does not claim to be God unless the claim is true.\n\nThe prophets of the Old Testament consistently said "Thus saith the LORD." Jesus said "I say unto you" \u2014 speaking on his own authority. He placed himself above Moses: "Ye have heard that it was said... but I say unto you" (Matthew 5:21-22). He placed himself above the Temple: "in this place is one greater than the temple" (Matthew 12:6). He placed himself above Jonah, Solomon, and the Sabbath itself.\n\nThe earliest Christians \u2014 monotheistic Jews who would rather die than worship a creature \u2014 worshipped Jesus as God within years of the crucifixion. Larry Hurtado's research shows this devotion was not a later development but an immediate response to who Jesus revealed himself to be.`,
    keyVerse: { ref: "John 10:30", text: "I and my Father are one." },
    category: "Jesus & Salvation", color: "#EC4899",
    difficulty: "beginner", related: [2, 28],
    debateOptions: [
      { text: "Jesus was the greatest prophet but never claimed equality with God", correct: false },
      { text: "Jesus claimed the divine name (John 8:58), said 'I and the Father are one' (John 10:30), forgave sins, and accepted worship. Lewis's trilemma: liar, lunatic, or Lord \u2014 'mere teacher' is not an option", correct: true },
      { text: "Jesus' followers elevated him to divine status after his death, but he never intended it", correct: false },
    ],
  },
  {
    id: 30, icon: "\u{1F4B0}", title: "The Prosperity Gospel",
    question: "God wants you rich and healthy. Poverty means lack of faith.",
    objection: "If you have enough faith, God will bless you with wealth and health. Suffering means you're doing something wrong.",
    answer: `The prosperity gospel is one of the most dangerous distortions of biblical Christianity, and it is refuted by virtually every page of the New Testament.\n\nJesus himself was homeless: "The foxes have holes, and the birds of the air have nests; but the Son of man hath not where to lay his head" (Matthew 8:20). Paul \u2014 the greatest missionary in church history \u2014 wrote from prison: "I know both how to be abased, and I know how to abound" (Philippians 4:12). The apostles were beaten, imprisoned, and martyred. If wealth and health were signs of God's favour, the apostles were the least favoured people in history.\n\nJesus explicitly warned against this theology: "Woe unto you that are rich! for ye have received your consolation" (Luke 6:24). He told the rich young ruler to sell everything (Mark 10:21). He said it is easier for a camel to go through the eye of a needle than for a rich man to enter heaven (Matthew 19:24). The epistle of James warns: "Go to now, ye rich men, weep and howl for your miseries that shall come upon you" (James 5:1).\n\nThe book of Job demolishes the prosperity gospel entirely. Job was the most righteous man on earth \u2014 and God allowed him to lose everything. His "friends" told him his suffering was punishment for sin. God's response to those friends: "My wrath is kindled against thee... for ye have not spoken of me the thing that is right, as my servant Job hath" (Job 42:7). The prosperity gospel is the theology of Job's friends \u2014 and God condemned it.`,
    keyVerse: { ref: "Matthew 8:20", text: "The foxes have holes, and the birds of the air have nests; but the Son of man hath not where to lay his head." },
    category: "Jesus & Salvation", color: "#EC4899",
    difficulty: "beginner", related: [27, 17],
    debateOptions: [
      { text: "God promises material blessing to those with faith \u2014 Deuteronomy 28 lists blessings for obedience", correct: false },
      { text: "Jesus was homeless, Paul wrote from prison, and the apostles were martyred. Job was righteous yet suffered. God condemned Job's friends for equating suffering with sin \u2014 the prosperity gospel is their theology", correct: true },
      { text: "Material blessings are secondary but God does want Christians to prosper financially as a testimony", correct: false },
    ],
  },
  {
    id: 31, icon: "\u2728", title: "Can Miracles Happen?",
    question: "Science has disproved miracles. They violate natural law.",
    objection: "Miracles are impossible because they break the laws of nature, which science has established are inviolable.",
    answer: `This objection, popularised by philosopher David Hume, rests on a circular argument: miracles violate natural law, therefore they cannot happen, therefore any testimony to them must be wrong. But this assumes the conclusion it claims to prove.\n\nThe laws of nature describe what happens when no outside agent intervenes. They do not prove that no outside agent can intervene. As C.S. Lewis argued in Miracles (1947): "If God annihilates or creates or deflects a unit of matter, He has created a new situation at that point. Nature will at once take over and make the best of the new situation." The laws of nature tell us what happens if God does nothing unusual \u2014 they do not tell us that God cannot act.\n\nPhilosopher Alvin Plantinga points out that Hume's argument would also exclude any novel event in history. If we defined "natural law" as what always happens, then the first time anything new occurred, it would be a "violation" of natural law. The Big Bang itself was a singular, unrepeatable event \u2014 yet cosmologists accept it based on evidence.\n\nThe real question is not "can miracles happen?" but "is there a God who can act?" If the God who created the universe exists, miracles are not violations of natural law \u2014 they are the Creator exercising authority over his creation. The resurrection of Jesus is not a magic trick; it is the Author of life reversing death.`,
    keyVerse: { ref: "Jeremiah 32:17", text: "Ah Lord GOD! behold, thou hast made the heaven and the earth by thy great power and stretched out arm, and there is nothing too hard for thee" },
    category: "The Church & Modern Challenges", color: "#6366F1",
    difficulty: "intermediate", related: [20, 32],
    debateOptions: [
      { text: "Science has established that natural laws cannot be broken, so miracles are impossible by definition", correct: false },
      { text: "Natural laws describe what happens without outside intervention \u2014 they don't prove God cannot act. Hume's argument is circular. If the Creator exists, miracles are the Author exercising authority over his creation", correct: true },
      { text: "Miracles happened in biblical times but no longer occur because the apostolic age has ended", correct: false },
    ],
  },
  {
    id: 32, icon: "\u{1F52C}", title: "The Fine-Tuning Argument",
    question: "The universe only appears designed. It's just chance.",
    objection: "The conditions for life are just lucky coincidence \u2014 no designer is needed.",
    answer: `The fine-tuning of the universe is not a theological claim \u2014 it is a scientific observation acknowledged by physicists regardless of their beliefs. The cosmological constants that permit life \u2014 the gravitational constant, the strong nuclear force, the cosmological constant, the ratio of matter to antimatter \u2014 are calibrated to a precision that defies comprehension.\n\nPhysicist Roger Penrose calculated that the odds of the universe's low entropy initial conditions occurring by chance are 1 in 10^(10^123) \u2014 a number so large it exceeds the number of particles in the observable universe. Physicist Paul Davies writes: "The impression of design is overwhelming." Even Fred Hoyle, a lifelong atheist, admitted after discovering the carbon resonance level: "A commonsense interpretation of the facts suggests that a superintellect has monkeyed with physics."\n\nThe multiverse hypothesis \u2014 that infinite universes exist, and we happen to be in one that works \u2014 is not a scientific theory but a philosophical speculation. It is unobservable by definition, untestable, and unfalsifiable. Philosopher William Lane Craig notes that positing an infinite number of undetectable universes to avoid a single Creator is not more rational \u2014 it is less parsimonious.\n\nThe design inference is not an argument from ignorance; it is an inference to the best explanation. When we see information, precision, and specified complexity, our uniform experience tells us these come from minds, not from chance.`,
    keyVerse: { ref: "Psalm 19:1", text: "The heavens declare the glory of God; and the firmament sheweth his handywork." },
    category: "The Church & Modern Challenges", color: "#6366F1",
    difficulty: "advanced", related: [20, 31],
    debateOptions: [
      { text: "We observe fine-tuning because only a fine-tuned universe could produce observers \u2014 it's selection bias", correct: false },
      { text: "The cosmological constants are calibrated to a precision of 1 in 10^(10^123). The multiverse is unfalsifiable speculation. Design is the inference to the best explanation \u2014 minds produce information and precision, chance does not", correct: true },
      { text: "Fine-tuning is real but could be explained by a natural process we haven't yet discovered", correct: false },
    ],
  },
  {
    id: 33, icon: "\u{1F9E0}", title: "Consciousness & the Soul",
    question: "The mind is just the brain. There is no soul.",
    objection: "Neuroscience has shown that consciousness is entirely produced by physical brain processes. There is no need for a soul.",
    answer: `Neuroscience has demonstrated that brain activity correlates with conscious experience \u2014 but correlation is not causation. A radio receiver correlates with music, but the radio does not produce the music; it receives it. Philosopher David Chalmers calls consciousness the "hard problem" precisely because no amount of physical description explains why subjective experience exists at all.\n\nPhysicalist explanations face what philosopher Thomas Nagel calls the "explanatory gap." We can describe every neuron, every synapse, every chemical reaction in the brain \u2014 and none of it explains why there is something it is "like" to be conscious. As Nagel argued in Mind and Cosmos (2012), materialism cannot account for consciousness, reason, or objective moral knowledge. This is not a God-of-the-gaps argument; it is a recognition that the materialist framework has a fundamental explanatory limitation.\n\nJ.P. Moreland's The Soul: How We Know It's Real and Why It Matters (2014) presents the philosophical case for substance dualism: the mind has properties (intentionality, first-person perspective, free will) that physical matter by definition does not possess. You cannot weigh a thought or measure the colour of an emotion. These are not gaps in our knowledge \u2014 they are category differences.\n\nScripture affirms what philosophy points toward: "the dust shall return to the earth as it was: and the spirit shall return unto God who gave it" (Ecclesiastes 12:7). Human beings are not merely complex machines. We are embodied souls made in the image of God.`,
    keyVerse: { ref: "Ecclesiastes 12:7", text: "Then shall the dust return to the earth as it was: and the spirit shall return unto God who gave it." },
    category: "The Church & Modern Challenges", color: "#6366F1",
    difficulty: "advanced", related: [19, 20],
    debateOptions: [
      { text: "Brain scans show that all thoughts and emotions are just neural activity \u2014 there is no separate soul", correct: false },
      { text: "Correlation is not causation \u2014 a radio correlates with music but doesn't produce it. Consciousness has properties (intentionality, first-person experience) that physical matter by definition cannot possess", correct: true },
      { text: "The soul exists but science can't study it, so we should keep science and religion completely separate", correct: false },
    ],
  },
  {
    id: 34, icon: "\u26D3", title: "Christianity & Slavery",
    question: "The Bible endorses slavery. It's a morally bankrupt book.",
    objection: "The Bible never condemns slavery. It even gives rules for owning slaves.",
    answer: `This challenge requires historical honesty on both sides. The word "slavery" in English evokes chattel slavery \u2014 the race-based, dehumanising system of the Atlantic slave trade. Biblical "slavery" (Hebrew: eved; Greek: doulos) encompassed a range of relationships from indentured servitude (working off debt) to household service, many of which were voluntary and time-limited.\n\nExodus 21:16 prescribes the death penalty for kidnapping someone to sell them as a slave: "And he that stealeth a man, and selleth him... shall surely be put to death." This single verse would have made the entire Atlantic slave trade a capital crime under biblical law. Paul reinforces this in 1 Timothy 1:10, listing "menstealers" (slave traders) among the worst sinners.\n\nThe Bible planted the seeds that eventually destroyed slavery. Galatians 3:28: "There is neither bond nor free... for ye are all one in Christ Jesus." Philemon is an entire epistle devoted to Paul urging a slave owner to receive his runaway slave "not now as a servant, but above a servant, a brother beloved" (Philemon 1:16). These principles \u2014 that every human being is made in God's image and equal before Christ \u2014 are what drove Wilberforce, the Quakers, and the abolitionists to end the slave trade.\n\nHistorian Rodney Stark in For the Glory of God (2003) documents that Christianity was the driving force behind abolition in every society where it took root. No secular philosophy produced an abolitionist movement. The Bible did.`,
    keyVerse: { ref: "Exodus 21:16", text: "And he that stealeth a man, and selleth him, or if he be found in his hand, he shall surely be put to death." },
    category: "The Church & Modern Challenges", color: "#6366F1",
    difficulty: "intermediate", related: [41, 35],
    debateOptions: [
      { text: "The Bible clearly endorses slavery by giving rules for how to treat slaves", correct: false },
      { text: "Biblical servitude was mostly indentured, not chattel. Exodus 21:16 prescribes death for kidnapping to sell people. Galatians 3:28 and Philemon planted the seeds that drove abolition \u2014 Christianity ended slavery, not secular philosophy", correct: true },
      { text: "The Bible's slavery passages are culturally conditioned and should be ignored today", correct: false },
    ],
  },
  {
    id: 35, icon: "\u26EA", title: "Why So Many Denominations?",
    question: "If Christianity is true, why can't Christians agree?",
    objection: "35,000 denominations prove Christianity is confused, divided, and man-made.",
    answer: `The "35,000 denominations" figure, often cited from the World Christian Encyclopedia, is deeply misleading. It counts every independently organized congregation as a separate "denomination" \u2014 including every local Catholic diocese and every independent Baptist church. By this methodology, a single church in Kenya and a single church in Brazil that share identical beliefs are counted as two "denominations" because they are organizationally independent.\n\nWhen scholars examine actual doctrinal differences, the number shrinks dramatically. The vast majority of Christian traditions agree on the core: the Trinity, the deity of Christ, the authority of Scripture, salvation by grace through faith, the resurrection, and the return of Christ. These essentials were articulated in the Nicene Creed (325 AD) and are affirmed by Catholic, Orthodox, and Protestant traditions alike.\n\nDenominational differences are largely about secondary matters: church governance (episcopal vs. congregational), worship style (liturgical vs. contemporary), and debatable doctrines (baptism mode, end-times chronology). These are the kinds of disagreements that exist in every field of knowledge \u2014 medical doctors disagree on treatments without anyone concluding that medicine is false.\n\nJesus anticipated diversity within unity: "Other sheep I have, which are not of this fold" (John 10:16). Paul wrote: "there must be also heresies among you, that they which are approved may be made manifest among you" (1 Corinthians 11:19). Disagreement on secondary issues does not disprove the core faith \u2014 it demonstrates the vitality of a living intellectual tradition.`,
    keyVerse: { ref: "Ephesians 4:5-6", text: "One Lord, one faith, one baptism, One God and Father of all, who is above all, and through all, and in you all." },
    category: "The Church & Modern Challenges", color: "#6366F1",
    difficulty: "beginner", related: [45, 34],
    debateOptions: [
      { text: "35,000 denominations prove Christianity has no unified truth", correct: false },
      { text: "The '35,000' figure counts every local congregation separately. Core doctrines (Trinity, resurrection, salvation by grace) are shared across Catholic, Orthodox, and Protestant traditions. Differences are mainly on secondary matters", correct: true },
      { text: "Only one denomination has the full truth \u2014 the rest are all in error", correct: false },
    ],
  },
  {
    id: 36, icon: "\u{1F30D}", title: "Is God a Borrowed Concept?",
    question: "Monotheism evolved from polytheism. Yahweh was just one of many gods.",
    objection: "Ancient Israelites were originally polytheists who gradually invented monotheism.",
    answer: `The "evolution of monotheism" theory was popular in the 19th century but has been significantly challenged by both archaeological evidence and anthropological research.\n\nWilhelm Schmidt's massive study The Origin and Growth of Religion (1931) documented that the most ancient and isolated cultures worldwide \u2014 Australian aboriginals, African pygmies, native peoples untouched by outside contact \u2014 consistently show belief in a single supreme Creator God before any contact with missionary religions. This suggests that monotheism is not a late innovation but a primordial belief that degraded into polytheism over time, exactly as Romans 1:21-23 describes: they "knew God" but "changed the glory of the uncorruptible God into an image."\n\nThe biblical text itself never presents Israel's monotheism as evolving. Genesis 1:1 opens with a single Creator God. The Shema (Deuteronomy 6:4) \u2014 "Hear, O Israel: The LORD our God is one LORD" \u2014 is presented not as a new idea but as the foundational truth being recalled against the polytheism of surrounding nations.\n\nArchaeologist Kenneth Kitchen in On the Reliability of the Old Testament (2003) demonstrates that the patriarchal accounts fit perfectly within the religious landscape of second-millennium BC Near East \u2014 where monotheistic devotion was practiced alongside cultural pressure from polytheistic neighbours. Israel did not invent monotheism from polytheism; they preserved it against polytheism.`,
    keyVerse: { ref: "Romans 1:21-23", text: "when they knew God, they glorified him not as God... and changed the glory of the uncorruptible God into an image" },
    category: "The Godhead", color: "#7C3AED",
    difficulty: "advanced", related: [1, 37],
    debateOptions: [
      { text: "Archaeological evidence shows that Israelites worshipped multiple gods before gradually becoming monotheistic", correct: false },
      { text: "The most ancient isolated cultures worldwide show belief in a single Creator God \u2014 suggesting monotheism is primordial, not evolved. Romans 1 describes the degradation from monotheism to polytheism, not the reverse", correct: true },
      { text: "Monotheism and polytheism are equally valid ancient religious expressions", correct: false },
    ],
  },
  {
    id: 37, icon: "\u{1F504}", title: "Does God Change His Mind?",
    question: "The Bible shows God regretting, changing plans \u2014 that's not omniscient.",
    objection: "Genesis 6:6 says God 'repented' that he made man. An all-knowing God cannot regret anything.",
    answer: `This is a question of biblical literary convention, not divine limitation. The Hebrew word "nacham" (translated "repented" in Genesis 6:6) has a broad semantic range that includes grief, compassion, and relenting \u2014 not necessarily "changing one's mind" in the way humans do.\n\nScripture itself clarifies the distinction. Numbers 23:19 states: "God is not a man, that he should lie; neither the son of man, that he should repent." 1 Samuel 15:29 reinforces: "the Strength of Israel will not lie nor repent: for he is not a man, that he should repent." These verses explicitly deny that God changes his mind in the human sense.\n\nSo what do the "repentance" passages mean? They are anthropomorphic language \u2014 describing God's actions in human terms we can understand. When Genesis 6:6 says God "was grieved," it communicates genuine divine sorrow over human wickedness, not a failure of foresight. God's emotional response to sin is real; his surprise about it is not.\n\nTheologian Wayne Grudem explains it as God's "changing of actions in response to changed human circumstances" \u2014 which was always part of his plan. A chess master who plans a contingent response to an opponent's move has not "changed his mind" when the contingency triggers. God's responses to human choices are not reactions \u2014 they are the unfolding of an eternal plan that includes human freedom.`,
    keyVerse: { ref: "Numbers 23:19", text: "God is not a man, that he should lie; neither the son of man, that he should repent" },
    category: "The Godhead", color: "#7C3AED",
    difficulty: "intermediate", related: [36, 49],
    debateOptions: [
      { text: "God does change his mind \u2014 Genesis 6:6 and other passages prove he adjusts his plans when they don't work out", correct: false },
      { text: "'Nacham' (repent) includes grief and relenting, not necessarily changing one's mind. Numbers 23:19 explicitly states God does not repent like a man. These are anthropomorphic descriptions of genuine divine sorrow, not failures of omniscience", correct: true },
      { text: "God is so transcendent that human language simply cannot describe him accurately at all", correct: false },
    ],
  },
  {
    id: 38, icon: "\u{1F3AD}", title: "Was Jesus Copied from Pagan Gods?",
    question: "Horus, Mithras, Krishna \u2014 Jesus is just another dying-and-rising god myth.",
    objection: "The story of Jesus was borrowed from earlier pagan mythology.",
    answer: `This claim was popularised by the internet film Zeitgeist (2007) and books like The Christ Conspiracy (1999), but it is rejected by mainstream historians \u2014 Christian and secular alike. Bart Ehrman, an agnostic New Testament scholar, calls these parallels "nonsense" and states: "No serious scholar of any persuasion holds this view."\n\nThe alleged parallels dissolve under scrutiny. Horus was not born of a virgin \u2014 his mother Isis reassembled her dead husband Osiris and conceived through magical intercourse. Mithras was born from a rock, not a virgin. Krishna's birth story involves eight previous children. None of these figures died by crucifixion, were buried in tombs, or were reported risen by eyewitnesses.\n\nClassicist Ronald Nash in The Gospel and the Greeks (2003) demonstrated that the "dying and rising god" category was itself a scholarly construct imposed on disparate myths. T.N.D. Mettinger, a Swedish scholar sympathetic to the category, concluded in The Riddle of Resurrection (2001) that even if such myths existed, "there is no evidence for the death of the dying and rising gods as vicarious suffering for sins."\n\nThe direction of borrowing, where it exists, goes the other way. Most detailed Mithras liturgies date from the 2nd-4th centuries AD \u2014 after Christianity. As scholar Jonathan Z. Smith noted: "The notion that early Christians borrowed from pagan myths has been shown to be historically impossible in nearly every case."`,
    keyVerse: { ref: "2 Peter 1:16", text: "For we have not followed cunningly devised fables, when we made known unto you the power and coming of our Lord Jesus Christ, but were eyewitnesses of his majesty." },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "intermediate", related: [12, 44],
    debateOptions: [
      { text: "The similarities between Jesus and pagan gods are too numerous to be coincidence", correct: false },
      { text: "The alleged parallels dissolve under scrutiny \u2014 Horus, Mithras, and Krishna have none of the specific details claimed. Mainstream scholars (including skeptics like Ehrman) reject the borrowing theory. Where borrowing exists, it goes from Christianity to later pagan texts", correct: true },
      { text: "Some borrowing occurred but it doesn't undermine the core truth of Christianity", correct: false },
    ],
  },
  {
    id: 39, icon: "\u{1F46A}", title: "The 'Brothers of Jesus' Problem",
    question: "James is called Jesus' brother \u2014 Mary had other children, making Jesus ordinary.",
    objection: "If Jesus had brothers and sisters, the virgin birth and his special status are undermined.",
    answer: `The New Testament does refer to Jesus' "brothers" (Greek: adelphoi) \u2014 James, Joses, Simon, and Judas (Matthew 13:55). Whether these are biological siblings, step-siblings (from Joseph's prior marriage), or cousins depends on how one reads the Greek and the broader tradition.\n\nThe Greek word adelphoi has a broader range than the English "brother." In the Septuagint (the Greek Old Testament), it is used for nephews (Genesis 13:8 \u2014 Lot is Abraham's nephew but called "brother"), kinsmen, and close associates. Paul calls all Christians "brethren." The word alone does not prove biological siblingship.\n\nHowever, many Protestant scholars accept that these were Mary's biological children born after Jesus. This view does not undermine the virgin birth \u2014 which concerns Jesus' conception, not Mary's subsequent life. The virgin birth establishes that Jesus was conceived by the Holy Spirit (Matthew 1:18-20), not by human father. Whether Mary had other children afterward is a secondary question that does not affect Jesus' divine origin.\n\nWhat matters theologically is not Mary's perpetual virginity but Christ's unique conception. He was "born of a woman, made under the law" (Galatians 4:4) \u2014 fully human through Mary, uniquely divine through the Holy Spirit. His brothers became believers after the resurrection \u2014 James became the leader of the Jerusalem church \u2014 which actually strengthens the case for the resurrection: even Jesus' own skeptical family members were convinced.`,
    keyVerse: { ref: "Galatians 4:4", text: "God sent forth his Son, made of a woman, made under the law" },
    category: "The Person of Christ", color: "#D97706",
    difficulty: "intermediate", related: [12, 29],
    debateOptions: [
      { text: "The 'brothers of Jesus' prove he was an ordinary man from an ordinary family", correct: false },
      { text: "Whether these were biological siblings or cousins, it does not affect the virgin birth, which concerns Jesus' conception. His brother James became a believer after the resurrection \u2014 strengthening the evidence for it", correct: true },
      { text: "Mary remained a virgin her entire life \u2014 the 'brothers' were cousins or step-siblings", correct: false },
    ],
  },
  {
    id: 40, icon: "\u{1F4D6}", title: "Why the KJV?",
    question: "Modern translations remove verses. The KJV is the only trustworthy Bible.",
    objection: "Newer translations have deleted key verses and watered down important doctrines.",
    answer: `The King James Version (1611) is a masterpiece of English prose and a faithful translation. However, the claim that it is the only trustworthy translation misunderstands how textual scholarship works.\n\nModern translations do not "remove" verses \u2014 they reflect older and more reliable manuscripts that were discovered after 1611. The KJV translators worked primarily from the Textus Receptus, based on a handful of late medieval manuscripts. Since then, scholars have discovered thousands of earlier manuscripts, including Codex Sinaiticus and Codex Vaticanus (4th century), bringing us much closer to the original text.\n\nWhen a verse appears in the KJV but not in modern translations (e.g., 1 John 5:7's Trinitarian formula), it is typically because the verse is absent from the earliest manuscripts and was likely added by a later copyist. Removing a scribal addition is not "taking away from Scripture" \u2014 it is getting closer to what the apostles actually wrote. No core Christian doctrine depends on these disputed passages; the Trinity, deity of Christ, and salvation by grace are abundantly supported by undisputed texts.\n\nThe KJV translators themselves wrote in their preface: "We do not deny, nay we affirm and avow, that the very meanest translation of the Bible in English containeth the word of God." They did not believe their translation was the only valid one \u2014 they valued getting the Word into the hands of the people in any faithful translation.`,
    keyVerse: { ref: "2 Timothy 2:15", text: "Study to shew thyself approved unto God, a workman that needeth not to be ashamed, rightly dividing the word of truth." },
    category: "Scripture", color: "#B45309",
    difficulty: "beginner", related: [6, 23],
    debateOptions: [
      { text: "The KJV is the only inspired English translation \u2014 modern versions are corrupted", correct: false },
      { text: "Modern translations use older, more reliable manuscripts discovered after 1611. The KJV translators themselves affirmed other translations contain God's Word. No core doctrine depends on disputed passages", correct: true },
      { text: "All translations are equally reliable \u2014 it doesn't matter which one you use", correct: false },
    ],
  },
  {
    id: 41, icon: "\u2694\uFE0F", title: "Isn't the Old Testament Brutal?",
    question: "A God who commands genocide cannot be good.",
    objection: "The Old Testament depicts God ordering the destruction of entire peoples, including women and children.",
    answer: `This is one of the hardest questions in Christian apologetics, and it deserves honest engagement rather than evasion.\n\nFirst, context: the Canaanite nations subjected to divine judgment were not innocent victims. The text describes cultures practicing child sacrifice (Deuteronomy 12:31), ritual prostitution, and systemic oppression for centuries. God tells Abraham in Genesis 15:16 that the judgment on the Amorites is delayed because "the iniquity of the Amorites is not yet full" \u2014 meaning God waited 400 years before acting, demonstrating extraordinary patience rather than eagerness.\n\nSecond, the language of "total destruction" (Hebrew: cherem) is frequently understood by scholars as ancient Near Eastern warfare rhetoric \u2014 hyperbolic language common in the period. Archaeologist Kenneth Kitchen and Old Testament scholar Paul Copan (Is God a Moral Monster?, 2011) demonstrate that similar language appears in other ancient texts that clearly do not describe literal total annihilation. Joshua "utterly destroyed" cities \u2014 and then the same populations appear alive in later chapters (Judges 1).\n\nThird, the entire trajectory of Scripture moves toward mercy. These events occur in a specific, unrepeatable historical context \u2014 they are never presented as a model for Christian behavior. Jesus explicitly reversed this trajectory: "Love your enemies, bless them that curse you" (Matthew 5:44). The cross is God's final answer \u2014 judgment on sin falling on himself rather than on sinners.`,
    keyVerse: { ref: "Genesis 15:16", text: "in the fourth generation they shall come hither again: for the iniquity of the Amorites is not yet full." },
    category: "Scripture", color: "#B45309",
    difficulty: "advanced", related: [34, 17],
    debateOptions: [
      { text: "The Old Testament commands prove that the biblical God is morally inferior and cannot be trusted", correct: false },
      { text: "God waited 400 years before judging Canaan's child-sacrifice culture. The 'total destruction' language is ancient war rhetoric (not literal \u2014 the same peoples appear alive in later chapters). The entire trajectory of Scripture moves toward mercy, culminating in the cross", correct: true },
      { text: "The Old Testament God is different from the New Testament God \u2014 Jesus corrected the earlier, violent portrayal", correct: false },
    ],
  },
  {
    id: 42, icon: "\u{1F6A8}", title: "Why Did Jesus Have to Die?",
    question: "A loving God could just forgive without requiring blood sacrifice.",
    objection: "Why can't God simply forgive sin by choice? The cross seems unnecessary and barbaric.",
    answer: `This objection assumes that forgiveness is simple \u2014 that God can wave away sin the way a friend waves away an insult. But sin is not a private offence between equals. It is a violation of the moral order of the universe, and justice demands a response.\n\nConsider an analogy from human justice. If a judge's own son were found guilty of a crime, we would not respect a judge who simply dismissed the charges. We would call that corruption, not love. True justice requires that the penalty be paid. What the cross reveals is that God is both the just judge and the one who pays the penalty himself. Romans 3:26 says God did this "that he might be just, and the justifier of him which believeth in Jesus."\n\nThe concept of substitutionary sacrifice is not arbitrary \u2014 it is woven through Scripture from the beginning. God provided an animal to die in Isaac's place (Genesis 22:13). The Passover lamb died so that the firstborn would live (Exodus 12). Isaiah 53 prophesied: "he was wounded for our transgressions, he was bruised for our iniquities." The entire sacrificial system pointed forward to a final sacrifice that would end all sacrifices.\n\nAs John Stott wrote in The Cross of Christ (1986): "The concept of substitution may be said to lie at the heart of both the Old and New Testaments. It is not a theological theory imposed on the text but a principle that arises naturally from it." The cross is not divine cruelty \u2014 it is divine love absorbing the cost of justice.`,
    keyVerse: { ref: "Romans 3:26", text: "To declare, I say, at this time his righteousness: that he might be just, and the justifier of him which believeth in Jesus." },
    category: "The Cross", color: "#E11D48",
    difficulty: "beginner", related: [43, 9],
    debateOptions: [
      { text: "God is sovereign and could simply choose to forgive without any sacrifice", correct: false },
      { text: "Justice demands the penalty be paid. The cross shows God as both the just judge and the one who pays the penalty himself (Romans 3:26). Substitutionary sacrifice runs from Genesis 22 through Isaiah 53 to the cross", correct: true },
      { text: "The cross was necessary only because God arbitrarily decided to require blood sacrifice", correct: false },
    ],
  },
  {
    id: 43, icon: "\u{1F494}", title: "Penal Substitution Is Cosmic Abuse",
    question: "A father punishing his son for others' sins is unjust and cruel.",
    objection: "The doctrine of penal substitution makes God an abusive father who vents his wrath on his innocent child.",
    answer: `This emotionally powerful objection misrepresents the doctrine at every point. The Son is not an unwilling victim \u2014 he is a willing participant. Jesus says explicitly: "I lay down my life... No man taketh it from me, but I lay it down of myself. I have power to lay it down, and I have power to take it again" (John 10:17-18).\n\nThe Trinity is essential here: Father, Son, and Spirit are not separate beings with opposing interests. They are one God acting in perfect unity. The cross is not the Father punishing a separate, unwilling Son \u2014 it is God himself entering into the consequences of human sin. 2 Corinthians 5:19 says: "God was in Christ, reconciling the world unto himself." The Father is not absent from the cross \u2014 he is present in Christ, absorbing the cost.\n\nThe "abuse" charge assumes a power imbalance between Father and Son. But there is no imbalance \u2014 the Son is fully God, equal in power and glory. A soldier who volunteers to take a bullet for a comrade is not a victim of abuse; he is a hero exercising sacrificial love. Jesus' death was the supreme act of voluntary self-sacrifice.\n\nJohn Stott addresses this directly in The Cross of Christ: "We must not, then, speak of God punishing Jesus or of Jesus persuading God, for to do so is to set them over against each other as if they acted independently of each other. We must never make Christ the object of God's punishment or God the object of Christ's persuasion, for both God and Christ were subjects not objects, taking the initiative together."`,
    keyVerse: { ref: "John 10:18", text: "No man taketh it from me, but I lay it down of myself. I have power to lay it down, and I have power to take it again." },
    category: "The Cross", color: "#E11D48",
    difficulty: "advanced", related: [42, 9],
    debateOptions: [
      { text: "The Father venting wrath on an innocent Son is an inherently abusive dynamic", correct: false },
      { text: "The Son is not an unwilling victim \u2014 'No man taketh it from me' (John 10:18). Father and Son are one God acting together. 2 Corinthians 5:19: 'God was in Christ, reconciling the world.' It is voluntary self-sacrifice, not abuse", correct: true },
      { text: "Penal substitution is one theory of atonement but not the only valid one \u2014 it shouldn't be central", correct: false },
    ],
  },
  {
    id: 44, icon: "\u{1F3FA}", title: "Did Christianity Borrow from Mystery Religions?",
    question: "Baptism, communion, resurrection \u2014 all stolen from pagan cults.",
    objection: "Christian rituals and beliefs were copied from the mystery religions of the Roman Empire.",
    answer: `This theory was popular in the early 20th century (the History of Religions School) but has been abandoned by mainstream scholarship for over 50 years. Ronald Nash's The Gospel and the Greeks (2003) is the standard academic refutation.\n\nThe parallels are superficial at best. Mystery religions had ritual washings \u2014 but so did Judaism (mikveh), long before any contact with pagan cults. Christian baptism is rooted in Jewish purification rites and John the Baptist's practice, not in the Eleusinian mysteries. The Lord's Supper is explicitly connected to the Passover meal (Luke 22:15-20), not to the sacred meals of Mithras.\n\nChronology destroys the theory. The detailed Mithras liturgies, Isis initiation accounts, and Attis resurrection narratives all date from the 2nd-4th centuries AD \u2014 after Christianity, not before. As scholar Bruce Metzger concluded: "It must not be uncritically assumed that the Mysteries always influenced Christianity, for it is not only528 possible but probable that in certain cases the influence moved in the opposite direction."\n\nMost decisively, early Christianity was born from Judaism \u2014 the most fiercely anti-pagan religion in the ancient world. First-century Jews would have regarded borrowing from pagan mystery cults as the ultimate abomination. Paul, a Pharisee, would rather die than incorporate pagan elements into his theology.`,
    keyVerse: { ref: "1 Corinthians 11:23", text: "For I have received of the Lord that which also I delivered unto you, That the Lord Jesus the same night in which he was betrayed took bread" },
    category: "History & Evidence", color: "#0369A1",
    difficulty: "intermediate", related: [38, 16],
    debateOptions: [
      { text: "The similarities between Christian practices and mystery religions are too close to be coincidence", correct: false },
      { text: "Baptism comes from Jewish mikveh, communion from Passover. Detailed pagan liturgies date from after Christianity, not before. First-century Jews would have regarded pagan borrowing as abomination", correct: true },
      { text: "Some cultural borrowing occurred naturally but doesn't undermine the truth of Christianity", correct: false },
    ],
  },
  {
    id: 45, icon: "\u{1F4DC}", title: "Why Trust the Church Fathers?",
    question: "They added doctrines Jesus never taught \u2014 Trinity, original sin, etc.",
    objection: "The doctrines of Christianity were invented by later theologians, not taught by Jesus or the apostles.",
    answer: `The church fathers did not invent doctrines \u2014 they articulated what was already present in Scripture, using precise language to combat heresies that were distorting the apostolic faith.\n\nThe Trinity is a case in point. The word "Trinity" does not appear in the Bible, but the concept is present throughout: the Father sends the Son (John 3:16), the Son sends the Spirit (John 15:26), and all three are identified as God (the Father in John 6:27, the Son in John 1:1, the Spirit in Acts 5:3-4). The Council of Nicaea (325 AD) did not invent the Trinity \u2014 it used the term "homoousios" (same substance) to defend what Christians had believed from the beginning against Arius, who was introducing a novel claim that the Son was a created being.\n\nOriginal sin follows the same pattern. Paul teaches it explicitly in Romans 5:12: "by one man sin entered into the world, and death by sin; and so death passed upon all men." Augustine systematised what Paul taught \u2014 he did not invent it.\n\nThe church fathers are not infallible authorities \u2014 they disagreed among themselves on secondary matters. But their testimony is invaluable because they were closest in time and language to the apostles. Ignatius of Antioch (died ~107 AD) was a student of the apostle John. When Ignatius writes about Christ's deity, he is not innovating \u2014 he is repeating what he heard firsthand from an eyewitness.`,
    keyVerse: { ref: "Jude 1:3", text: "earnestly contend for the faith which was once delivered unto the saints." },
    category: "History & Evidence", color: "#0369A1",
    difficulty: "intermediate", related: [15, 1],
    debateOptions: [
      { text: "The church fathers distorted Jesus' simple message by adding Greek philosophical concepts", correct: false },
      { text: "The fathers articulated what Scripture already taught \u2014 Trinity is in John 1:1 and Acts 5:3-4, original sin in Romans 5:12. Nicaea defended existing belief against Arius. Ignatius learned directly from the apostle John", correct: true },
      { text: "The church fathers are authoritative and their teachings are equal to Scripture", correct: false },
    ],
  },
  {
    id: 46, icon: "\u{1F30A}", title: "Why Does God Allow Natural Disasters?",
    question: "Free will explains human evil, but not tsunamis and earthquakes.",
    objection: "Even if free will explains why humans do evil, it cannot explain why an all-powerful God allows natural disasters that kill innocent people.",
    answer: `This is a sophisticated form of the problem of evil, and it deserves a sophisticated answer. The Free Will Defense explains moral evil (human choices). Natural evil requires additional considerations.\n\nFirst, the biblical framework teaches that the natural world itself was affected by the fall. Romans 8:20-22 says: "the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope... the whole creation groaneth and travaileth in pain together until now." The groaning of creation \u2014 earthquakes, floods, disease \u2014 is presented not as God's design but as the consequence of a world in rebellion.\n\nSecond, philosopher Alvin Plantinga extends his argument: a world with regular natural laws (which are necessary for free will to operate meaningfully) will inevitably include natural events that can harm creatures. If gravity didn't work consistently, you couldn't walk \u2014 but consistent gravity also means you can fall off a cliff. A world safe from all natural harm would be a world without stable natural laws, and therefore a world without meaningful freedom.\n\nThird, natural disasters reveal human solidarity and compassion in ways that comfort alone cannot. C.S. Lewis noted that suffering strips away illusions of self-sufficiency and exposes our dependence on God and each other. The most profound acts of human courage, sacrifice, and love emerge precisely in the context of catastrophe.\n\nNone of this eliminates the emotional anguish of natural disaster. But the cross tells us that God does not observe suffering from a distance \u2014 he enters it.`,
    keyVerse: { ref: "Romans 8:22", text: "For we know that the whole creation groaneth and travaileth in pain together until now." },
    category: "Suffering & God", color: "#059669",
    difficulty: "advanced", related: [17, 48],
    debateOptions: [
      { text: "Natural disasters prove God either doesn't exist or doesn't care about human suffering", correct: false },
      { text: "Romans 8:22 says creation itself was subjected to futility by the fall. Regular natural laws (needed for free will) inevitably produce events that can harm. God does not observe suffering from a distance \u2014 the cross proves he enters it", correct: true },
      { text: "Natural disasters are God's direct punishment for specific sins in those regions", correct: false },
    ],
  },
  {
    id: 47, icon: "\u{1F4A1}", title: "Is Faith Just Blind Belief?",
    question: "Religion requires you to stop thinking and just believe.",
    objection: "Faith is the opposite of reason. You have to check your brain at the door to be a Christian.",
    answer: `This is perhaps the most damaging misconception about Christianity, and it is flatly contradicted by Scripture. Biblical faith is not blind belief \u2014 it is trust based on evidence.\n\nThe Greek word for faith (pistis) means trust or reliance \u2014 the kind of trust you place in a chair before you sit in it. You have evidence the chair is solid; you exercise faith by sitting. Hebrews 11:1 defines faith as "the substance of things hoped for, the evidence of things not seen" \u2014 note the word "evidence." Biblical faith is evidence-based trust in a God who has proven himself reliable.\n\nJesus constantly appealed to evidence. When John the Baptist doubted, Jesus did not say "just believe" \u2014 he said: "Go and shew John again those things which ye do hear and see: The blind receive their sight, and the lame walk" (Matthew 11:4-5). He pointed to evidence. After the resurrection, he appeared to over 500 witnesses (1 Corinthians 15:6). He invited Thomas to touch his wounds (John 20:27). Paul reasoned in the synagogues (Acts 17:2) and debated on Mars Hill (Acts 17:22-31).\n\nThe command to love God is explicitly intellectual: "Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind" (Matthew 22:37). Christianity produced the university system, the scientific method (Roger Bacon, Galileo, Newton, Faraday, Maxwell \u2014 all Christians), and the most rigorous philosophical tradition in history.\n\nAs Alvin Plantinga \u2014 widely regarded as the most important living philosopher \u2014 has demonstrated throughout his career, Christian belief is not only rationally permissible but rationally warranted.`,
    keyVerse: { ref: "Matthew 22:37", text: "Thou shalt love the Lord thy God with all thy heart, and with all thy soul, and with all thy mind." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "beginner", related: [19, 48],
    debateOptions: [
      { text: "Faith by definition means believing without evidence \u2014 that's what makes it faith", correct: false },
      { text: "Biblical faith (pistis) means evidence-based trust. Hebrews 11:1 uses the word 'evidence.' Jesus pointed to evidence, Paul reasoned in synagogues, and Matthew 22:37 commands loving God 'with all thy mind'", correct: true },
      { text: "Some areas of faith require reason but the core beliefs must be accepted without question", correct: false },
    ],
  },
  {
    id: 48, icon: "\u{1F648}", title: "The Problem of Divine Hiddenness",
    question: "If God wants everyone saved, why doesn't he make himself obvious?",
    objection: "A God who truly loved everyone would make his existence undeniable. His hiddenness proves he doesn't exist or doesn't care.",
    answer: `Philosopher J.L. Schellenberg formulated this as a formal argument: if a perfectly loving God existed, he would ensure that every sincere seeker could find him. Since some sincere seekers do not believe, God does not exist.\n\nThe argument assumes that God's highest priority is ensuring cognitive belief \u2014 but Scripture suggests God is after something deeper: a relationship of trust forged through free seeking. Jeremiah 29:13 promises: "And ye shall seek me, and find me, when ye shall search for me with all your heart." The condition is wholehearted seeking, not passive waiting.\n\nBlaise Pascal addressed this in his Pens\u00E9es (1670): "There is enough light for those who desire only to see, and enough darkness for those of a contrary disposition." God provides sufficient evidence (creation, conscience, Scripture, the resurrection, changed lives) while preserving enough epistemic distance for genuine freedom. If God appeared in the sky every morning, belief would be coerced, not chosen. Forced belief is not the same as love.\n\nC.S. Lewis expands this: God's apparent hiddenness may be more like a "divine humility" \u2014 a refusal to overwhelm creatures with a display of power that would make free response impossible. A parent who wants a child's love does not strap the child to a chair and demand affection; they create space for the child to come freely.\n\nRomans 1:19-20 states that God's existence is evident from creation: "the invisible things of him from the creation of the world are clearly seen." The problem may not be insufficient evidence but insufficient attention.`,
    keyVerse: { ref: "Jeremiah 29:13", text: "And ye shall seek me, and find me, when ye shall search for me with all your heart." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [17, 47],
    debateOptions: [
      { text: "If God existed and loved everyone, his existence would be undeniable to all people", correct: false },
      { text: "God provides sufficient evidence while preserving freedom. Pascal: 'Enough light for those who desire to see.' Coerced belief is not love. Jeremiah 29:13 promises finding when seeking is wholehearted", correct: true },
      { text: "God reveals himself only to a chosen few and deliberately hides from everyone else", correct: false },
    ],
  },
  {
    id: 49, icon: "\u{1F4A0}", title: "Can God Create a Rock He Can't Lift?",
    question: "Omnipotence is logically contradictory.",
    objection: "If God can do anything, can he make a rock so heavy even he can't lift it? Either way, there's something he can't do.",
    answer: `This is one of the oldest philosophical puzzles, and it has a clear answer: the question is logically incoherent, like asking "Can God make a square circle?" The answer is not a limitation of God's power \u2014 it is a limitation of the question.\n\nOmnipotence means God can do anything that is logically possible. Thomas Aquinas addressed this in the 13th century: God cannot do the logically impossible because the logically impossible is not a "thing" that can be done \u2014 it is a meaningless string of words. "A rock so heavy an omnipotent being cannot lift it" is a contradiction in terms, like "a married bachelor."\n\nC.S. Lewis put it memorably in The Problem of Pain: "Nonsense remains nonsense even when we talk it about God. His Omnipotence means power to do all that is intrinsically possible, not to do the intrinsically impossible."\n\nThe same logic applies to other paradoxes: "Can God lie?" No \u2014 because lying is contrary to his nature (Titus 1:2), not a failure of power. "Can God cease to exist?" No \u2014 because necessary existence is part of what it means to be God. These are not limitations but definitions. An "omnipotent" being who could violate logic would be incoherent, not more powerful.\n\nTrue omnipotence is demonstrated not in logical paradoxes but in real actions: creating the universe from nothing, sustaining all things by the word of his power (Hebrews 1:3), raising the dead.`,
    keyVerse: { ref: "Luke 1:37", text: "For with God nothing shall be impossible." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "intermediate", related: [37, 50],
    debateOptions: [
      { text: "The paradox proves that omnipotence is a self-contradictory concept", correct: false },
      { text: "The question is logically incoherent \u2014 like asking for a square circle. As Aquinas and Lewis explain, omnipotence means power to do all that is intrinsically possible. Logical nonsense is not a 'thing' that can be done", correct: true },
      { text: "God's power is infinite but not technically omnipotent \u2014 there are things he chooses not to do", correct: false },
    ],
  },
  {
    id: 50, icon: "\u{1F932}", title: "Why Does God Demand Worship?",
    question: "A secure God wouldn't need creatures to praise him constantly.",
    objection: "Demanding worship sounds like narcissism. A truly good being wouldn't require constant adoration.",
    answer: `This objection imagines God as an insecure celebrity craving applause. But the biblical picture is the opposite: worship is not for God's benefit \u2014 it is for ours.\n\nC.S. Lewis wrestled with this honestly in Reflections on the Psalms: "I had never noticed that all enjoyment spontaneously overflows into praise... The world rings with praise \u2014 lovers praising their mistresses, readers their favourite poet, walkers praising the countryside. I had not noticed how the humblest, and at the same time most balanced and capacious minds, praised most, while the cranks, misfits and malcontents praised least." He concluded: "I think we delight to praise what we enjoy because the praise not merely expresses but completes the enjoyment."\n\nWorship is the natural response of a creature encountering its Creator \u2014 not a demand imposed from above but an overflow from within. When you see a sunset and say "beautiful," that is worship of beauty. When you hear music and say "magnificent," that is worship of excellence. The command to worship God is not "feed my ego" \u2014 it is "do the thing that will make you most fully alive."\n\nAugustine captured it: "Thou hast made us for thyself, O Lord, and our hearts are restless until they rest in thee." The human heart was designed to worship. If it does not worship God, it will worship something else \u2014 money, fame, relationships, self \u2014 and those things cannot bear the weight of ultimate devotion.\n\nGod's "demand" for worship is like a doctor's "demand" that you breathe. It is not a restriction of your freedom \u2014 it is the condition for your flourishing.`,
    keyVerse: { ref: "Psalm 16:11", text: "in thy presence is fulness of joy; at thy right hand there are pleasures for evermore." },
    category: "Reason & Philosophy", color: "#6D28D9",
    difficulty: "intermediate", related: [47, 13],
    debateOptions: [
      { text: "A truly loving God would not require worship \u2014 the demand reveals insecurity", correct: false },
      { text: "Lewis: 'Praise completes the enjoyment.' Worship is the natural overflow of encountering the Creator \u2014 not an imposed demand. Augustine: 'Our hearts are restless until they rest in thee.' Worship is the condition for human flourishing", correct: true },
      { text: "Worship is optional \u2014 God is happy whether we worship him or not", correct: false },
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
