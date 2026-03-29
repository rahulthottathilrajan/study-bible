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
  "Prophecy as Evidence":    { bg: "#FEF3C7", text: "#78350F", border: "#D97706" },
  "Archaeology Confirms Scripture": { bg: "#DBEAFE", text: "#1E3A5F", border: "#3B82F6" },
  "Science & Faith":         { bg: "#ECFDF5", text: "#065F46", border: "#10B981" },
  "Ethics & Pastoral":       { bg: "#FFF1F2", text: "#881337", border: "#F43F5E" },
  "Textual Criticism":       { bg: "#FFF7ED", text: "#9A3412", border: "#FB923C" },
  "World Religions Compared": { bg: "#F5F3FF", text: "#5B21B6", border: "#8B5CF6" },
  "Advanced Philosophy":     { bg: "#EDE9FE", text: "#4C1D95", border: "#7C3AED" },
  "Practical Christian Life": { bg: "#ECFDF5", text: "#065F46", border: "#34D399" },
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
  "Prophecy as Evidence":    { bg: "rgba(217,119,6,0.12)", text: "#FBBF24", border: "#78350F80" },
  "Archaeology Confirms Scripture": { bg: "rgba(59,130,246,0.12)", text: "#60A5FA", border: "#1E3A5F80" },
  "Science & Faith":         { bg: "rgba(16,185,129,0.12)", text: "#34D399", border: "#065F4680" },
  "Ethics & Pastoral":       { bg: "rgba(244,63,94,0.12)", text: "#FB7185", border: "#88133780" },
  "Textual Criticism":       { bg: "rgba(251,146,60,0.12)", text: "#FB923C", border: "#9A341280" },
  "World Religions Compared": { bg: "rgba(139,92,246,0.12)", text: "#A78BFA", border: "#5B21B680" },
  "Advanced Philosophy":     { bg: "rgba(124,58,237,0.12)", text: "#A78BFA", border: "#4C1D9580" },
  "Practical Christian Life": { bg: "rgba(52,211,153,0.12)", text: "#34D399", border: "#065F4680" },
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
  {
    id: 51, icon: "\u{1F4DC}", title: "Isaiah 53 \u2014 The Suffering Servant",
    question: "Isaiah 53 is about Israel, not Jesus.",
    objection: "The suffering servant passage describes the nation of Israel, not a future Messiah.",
    answer: `This is the most important Messianic prophecy in the Old Testament, and its interpretation has been debated for centuries. The claim that it refers to Israel corporately faces several insurmountable problems.\n\nFirst, the servant in Isaiah 53 is distinguished from Israel. Isaiah 53:8 says "for the transgression of my people was he stricken" \u2014 "my people" is Israel, and the servant is stricken on their behalf. You cannot be punished for the sins of a group while also being that group.\n\nSecond, the servant is described as sinless: "he had done no violence, neither was any deceit in his mouth" (v.9). No honest reading of the Old Testament attributes sinlessness to the nation of Israel \u2014 the prophets uniformly condemned Israel's unfaithfulness.\n\nThird, the details are strikingly specific: "he was wounded for our transgressions" (v.5), "he is brought as a lamb to the slaughter" (v.7), "he made his grave with the wicked, and with the rich in his death" (v.9), "he bare the sin of many" (v.12). Jesus was crucified between criminals (wicked) and buried in the tomb of Joseph of Arimathaea, a rich man (Matthew 27:57-60).\n\nRabbi Moshe Alshich (16th century) admitted: "Our rabbis with one voice accept and affirm that the prophet is speaking of the King Messiah." The national Israel interpretation arose later as a response to Christian claims, not as the original Jewish reading.`,
    keyVerse: { ref: "Isaiah 53:5", text: "But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed." },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "intermediate", related: [52, 58],
    debateOptions: [
      { text: "Isaiah 53 is about the suffering of the Jewish nation throughout history", correct: false },
      { text: "The servant is distinguished from Israel (stricken 'for my people'), described as sinless (unlike Israel), and matches Jesus' death details precisely \u2014 crucified with criminals, buried with the rich", correct: true },
      { text: "Isaiah 53 could apply to multiple figures throughout history, not exclusively Jesus", correct: false },
    ],
  },
  {
    id: 52, icon: "\u{1F4C5}", title: "Daniel's 70 Weeks",
    question: "Daniel 9's timeline is too vague to point to Jesus.",
    objection: "The 70 weeks prophecy doesn't actually predict the timing of the Messiah's arrival.",
    answer: `Daniel 9:24-27 provides the most precise chronological prophecy in the Bible. The angel Gabriel tells Daniel that "seventy weeks" (Hebrew: shavuim \u2014 seventy sets of seven, i.e., 490 years) are decreed, after which the Messiah will be "cut off" (killed).\n\nThe countdown begins with "the commandment to restore and to build Jerusalem" (Daniel 9:25). Scholar Harold Hoehner identified this as Artaxerxes' decree to Nehemiah in 444 BC (Nehemiah 2:1-8). Sixty-nine "weeks" (483 years, using the prophetic 360-day year) from 444 BC lands precisely in 33 AD \u2014 the year most scholars date the crucifixion.\n\nSir Robert Anderson first published this calculation in The Coming Prince (1894), and it has been independently verified by multiple scholars. The margin of error is zero: 69 x 7 x 360 = 173,880 days from Nisan 444 BC arrives at Nisan 33 AD.\n\nThe prophecy also states that after the Messiah is "cut off," "the people of the prince that shall come shall destroy the city and the sanctuary" (Daniel 9:26) \u2014 precisely fulfilled when the Romans destroyed Jerusalem and the Temple in 70 AD, just 37 years later. No other candidate in Jewish history was "cut off" before 70 AD in a way that matches this prophecy.`,
    keyVerse: { ref: "Daniel 9:26", text: "And after threescore and two weeks shall Messiah be cut off, but not for himself" },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "advanced", related: [51, 56],
    debateOptions: [
      { text: "The 70 weeks is apocalyptic symbolism, not a literal timeline", correct: false },
      { text: "483 prophetic years from Artaxerxes' decree in 444 BC lands precisely in 33 AD. The Messiah is 'cut off' before the Temple is destroyed in 70 AD \u2014 matching Jesus' crucifixion exactly", correct: true },
      { text: "Daniel was written after the events it 'predicts,' so it's history disguised as prophecy", correct: false },
    ],
  },
  {
    id: 53, icon: "\u{1F3D8}\uFE0F", title: "Micah 5:2 \u2014 Born in Bethlehem",
    question: "Bethlehem was just a coincidence, not a fulfilled prophecy.",
    objection: "Jesus' parents deliberately went to Bethlehem to fulfil the prophecy. Or the Gospel writers invented the detail.",
    answer: `Micah 5:2 was written around 700 BC: "But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel; whose goings forth have been from of old, from everlasting."\n\nThe claim that Jesus' parents "deliberately" went to Bethlehem is historically backwards. Luke 2:1-5 records that a Roman census under Augustus forced Joseph and Mary to travel to Bethlehem \u2014 the ancestral city of David's line. A Roman Emperor's administrative decree is not the kind of thing a Galilean carpenter could arrange to fulfil a prophecy.\n\nThe claim that the Gospel writers invented the detail faces a problem: Matthew and Luke wrote independently (their birth narratives differ in many details), yet both place Jesus' birth in Bethlehem. Independent attestation is one of the strongest criteria historians use for establishing historicity.\n\nNote also what Micah 5:2 actually claims: the ruler born in Bethlehem has origins "from of old, from everlasting" \u2014 language of pre-existence and eternality, not merely human kingship. The prophecy does not just predict a birthplace; it predicts a divine-human figure emerging from an insignificant town.`,
    keyVerse: { ref: "Micah 5:2", text: "But thou, Bethlehem Ephratah, though thou be little among the thousands of Judah, yet out of thee shall he come forth unto me that is to be ruler in Israel" },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "beginner", related: [51, 12],
    debateOptions: [
      { text: "Joseph and Mary went to Bethlehem on purpose to make the prophecy seem fulfilled", correct: false },
      { text: "A Roman census \u2014 not human planning \u2014 brought them to Bethlehem. Matthew and Luke independently attest it. Micah also predicts the ruler's origins are 'from everlasting,' pointing to divinity", correct: true },
      { text: "Micah 5:2 refers to the Davidic dynasty in general, not a specific individual", correct: false },
    ],
  },
  {
    id: 54, icon: "\u{1F4A7}", title: "Zechariah 12:10 \u2014 The Pierced One",
    question: "Zechariah 12:10 doesn't refer to the Messiah.",
    objection: "The 'pierced one' could be any martyr in Israel's history, not specifically Jesus.",
    answer: `Zechariah 12:10, written around 520 BC, records God speaking: "they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son."\n\nThe extraordinary feature of this prophecy is the pronoun shift: God says "they shall look upon ME whom they have pierced" and then "mourn for HIM." The one pierced is simultaneously identified with God ("me") and distinguished as a person who dies ("him"). This is precisely the Trinitarian pattern: the divine Son is pierced, and God the Father is the one pierced in him.\n\nJohn 19:34-37 explicitly cites this prophecy at the crucifixion: a Roman soldier pierces Jesus' side with a spear, and John writes, "these things were done, that the scripture should be fulfilled... They shall look on him whom they pierced."\n\nThe Talmud (Sukkah 52a) preserves an ancient rabbinic tradition that identifies the "pierced one" of Zechariah 12:10 with "Messiah ben Joseph" \u2014 a suffering Messianic figure. Even within Jewish tradition, this was understood as Messianic. The question is not whether the passage points to the Messiah, but whether Jesus is that Messiah.`,
    keyVerse: { ref: "Zechariah 12:10", text: "they shall look upon me whom they have pierced, and they shall mourn for him, as one mourneth for his only son" },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "intermediate", related: [51, 9],
    debateOptions: [
      { text: "The 'pierced one' is a generic reference to any martyred leader in Israel", correct: false },
      { text: "God says 'look upon ME whom they pierced' then 'mourn for HIM' \u2014 the one pierced is identified with God yet distinct. John 19:37 cites this at the crucifixion. Even the Talmud identifies this as Messianic", correct: true },
      { text: "Zechariah 12 is about a future eschatological event, not a past historical one", correct: false },
    ],
  },
  {
    id: 55, icon: "\u{1F3C6}", title: "Psalm 16:10 \u2014 Resurrection Prophesied",
    question: "Psalm 16 is David talking about himself, not about resurrection.",
    objection: "David wrote 'thou wilt not leave my soul in hell' about his own confidence in God, not about a future Messiah rising from the dead.",
    answer: `Peter addresses this objection directly in his Pentecost sermon (Acts 2:25-31) \u2014 the first Christian sermon ever preached. He quotes Psalm 16:10: "thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption."\n\nPeter's argument is historical and irrefutable: "Men and brethren, let me freely speak unto you of the patriarch David, that he is both dead and buried, and his sepulchre is with us unto this day" (Acts 2:29). David's tomb was still visible in Jerusalem \u2014 his body did see corruption. Therefore, Peter argues, David "being a prophet... spake of the resurrection of Christ" (Acts 2:30-31).\n\nThe logic is airtight: if the Psalm promises that God's "Holy One" will not see corruption (bodily decay), and David clearly did decay, then the Psalm must point to someone else \u2014 someone whose body was raised before decay set in. Jesus was crucified on Friday and raised on Sunday \u2014 before decomposition began.\n\nPaul makes the identical argument in Acts 13:35-37: "He, whom God raised again, saw no corruption." Two independent apostolic witnesses, preaching to different audiences, reached the same conclusion from the same text.`,
    keyVerse: { ref: "Psalm 16:10", text: "For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption." },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "beginner", related: [11, 51],
    debateOptions: [
      { text: "David was expressing personal confidence that God would protect him from death", correct: false },
      { text: "Peter's argument in Acts 2: David's body did decay (his tomb was visible), so the Psalm must refer to someone whose body was raised before corruption. Jesus was raised on the third day, before decomposition", correct: true },
      { text: "Psalm 16 is about spiritual resurrection, not bodily resurrection", correct: false },
    ],
  },
  {
    id: 56, icon: "\u{1F476}", title: "Isaiah 9:6 \u2014 A Child Called Mighty God",
    question: "Isaiah 9:6 is about King Hezekiah, not the Messiah.",
    objection: "The 'child born' refers to a contemporary king of Isaiah's time, not a future divine figure.",
    answer: `Isaiah 9:6 declares: "For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, The mighty God, The everlasting Father, The Prince of Peace."\n\nThe Hezekiah interpretation fails on its own terms. Hezekiah's government never rested "upon his shoulder" \u2014 Judah was a vassal state under Assyrian pressure throughout his reign. More decisively, no Jewish king was ever called "The mighty God" (El Gibbor) or "The everlasting Father" (Avi Ad). These are divine titles. El Gibbor appears in Isaiah 10:21 referring unambiguously to God himself.\n\nThe passage also promises that "of the increase of his government and peace there shall be no end, upon the throne of David" (Isaiah 9:7). Hezekiah's kingdom ended; his son Manasseh was one of Judah's most wicked kings. The promise of an unending, peaceful reign on David's throne has never been fulfilled by any human king in Israel's history.\n\nThe Targum Jonathan (ancient Aramaic paraphrase of the Prophets) translates Isaiah 9:6 as referring to the Messiah. This was the standard Jewish interpretation before the rise of Christianity. The passage demands a figure who is simultaneously a human child and the Mighty God \u2014 which is exactly what the incarnation claims.`,
    keyVerse: { ref: "Isaiah 9:6", text: "For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, The mighty God, The everlasting Father, The Prince of Peace." },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "intermediate", related: [52, 51],
    debateOptions: [
      { text: "Isaiah 9:6 was fulfilled by King Hezekiah during Isaiah's own lifetime", correct: false },
      { text: "No Jewish king was called 'El Gibbor' (Mighty God) \u2014 a divine title used for God in Isaiah 10:21. The promise of an unending kingdom was never fulfilled by any human king. The Targum Jonathan identifies this as Messianic", correct: true },
      { text: "The divine titles are honorific, not literal \u2014 like calling a king 'father of the nation'", correct: false },
    ],
  },
  {
    id: 57, icon: "\u{1F40D}", title: "Genesis 3:15 \u2014 The First Prophecy",
    question: "Genesis 3:15 is just about snakes and humans, not the Messiah.",
    objection: "Reading Christ into 'the seed of the woman' is eisegesis \u2014 reading into the text what isn't there.",
    answer: `Genesis 3:15, spoken by God to the serpent after the Fall, is called the Protoevangelium \u2014 the "first gospel": "And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel."\n\nThe phrase "her seed" is unique in the entire Old Testament. In Hebrew culture, lineage was always traced through the father's seed, never the mother's. The deliberate reversal \u2014 "seed of the woman" \u2014 implies a birth without a human father, which is precisely what the virgin birth claims (Matthew 1:18-23).\n\nThe prophecy describes a cosmic conflict: the serpent will "bruise his heel" (a painful but non-fatal wound) while the woman's seed will "bruise thy head" (a fatal, crushing blow). On the cross, Satan inflicted suffering on Christ (heel bruise), but the resurrection crushed Satan's power (head crush). Paul alludes to this in Romans 16:20: "And the God of peace shall bruise Satan under your feet shortly."\n\nEarly church fathers universally identified this as Messianic. Irenaeus (2nd century) called it the first promise of redemption. The Septuagint translates the pronoun "it" (referring to the seed) as "he" (autos, masculine) \u2014 indicating the translators understood a specific male individual, not humanity in general.`,
    keyVerse: { ref: "Genesis 3:15", text: "And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel." },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "beginner", related: [56, 12],
    debateOptions: [
      { text: "Genesis 3:15 is simply about the natural hostility between humans and snakes", correct: false },
      { text: "'Her seed' is unique \u2014 lineage was always through the father, implying a birth without a human father. The heel/head language describes a cosmic conflict: suffering inflicted on Christ, but Satan's power crushed through resurrection", correct: true },
      { text: "This is a general promise that good will eventually triumph over evil, not a specific Messianic prophecy", correct: false },
    ],
  },
  {
    id: 58, icon: "\u{1F6A9}", title: "Psalm 22 \u2014 Crucifixion Before Crucifixion",
    question: "Psalm 22 is David's personal lament, not a prediction of crucifixion.",
    objection: "David was describing his own suffering. Christians retroactively read crucifixion details into it.",
    answer: `Psalm 22, written by David around 1000 BC, contains details that go far beyond any experience of David's life \u2014 and describe a method of execution that would not be invented for another 600 years.\n\n"They pierced my hands and my feet" (v.16) \u2014 crucifixion was invented by the Persians in the 6th century BC and adopted by the Romans. David never experienced anything like this. "They part my garments among them, and cast lots upon my vesture" (v.18) \u2014 fulfilled at the cross when soldiers gambled for Jesus' robe (John 19:23-24). "I am poured out like water, and all my bones are out of joint" (v.14) \u2014 consistent with the physical effects of crucifixion. "My tongue cleaveth to my jaws" (v.15) \u2014 severe dehydration, matching Jesus' cry "I thirst" (John 19:28). "They look and stare upon me" (v.17) \u2014 the public spectacle of crucifixion.\n\nThe Psalm also includes: "My God, my God, why hast thou forsaken me?" (v.1) \u2014 the exact words Jesus spoke from the cross (Matthew 27:46). He was not expressing confusion; he was directing his audience to read this Psalm and recognise what was happening.\n\nCrucially, Psalm 22 does not end in death. It ends in resurrection vindication: "I will declare thy name unto my brethren: in the midst of the congregation will I praise thee" (v.22). "All the ends of the world shall remember and turn unto the LORD" (v.27). The sufferer lives, praises God, and his message reaches all nations.`,
    keyVerse: { ref: "Psalm 22:16,18", text: "they pierced my hands and my feet... They part my garments among them, and cast lots upon my vesture." },
    category: "Prophecy as Evidence", color: "#B45309",
    difficulty: "beginner", related: [51, 9],
    debateOptions: [
      { text: "David was using poetic language to describe his own suffering during persecution", correct: false },
      { text: "Psalm 22 describes pierced hands and feet (crucifixion wasn't invented for 600 years), garments divided by lots, bones out of joint, and severe thirst \u2014 all fulfilled at the cross. It ends in resurrection vindication, not death", correct: true },
      { text: "The 'pierced' translation is disputed \u2014 some Hebrew texts read 'like a lion' instead", correct: false },
    ],
  },
  {
    id: 59, icon: "\u{1F3DB}\uFE0F", title: "The Pilate Stone",
    question: "There's no evidence Pontius Pilate even existed.",
    objection: "The Gospels mention Pilate, but there's no independent confirmation he was real.",
    answer: `In 1961, Italian archaeologists excavating the Roman theatre at Caesarea Maritima discovered a limestone block with a Latin inscription reading: "Pontius Pilatus, Prefect of Judaea." This is now known as the Pilate Stone and is housed in the Israel Museum in Jerusalem.\n\nBefore this discovery, skeptics had questioned Pilate's historicity or his exact title. The inscription confirmed both: he existed, and he held the title "prefect" \u2014 exactly as the historical context of the Gospels requires. Tacitus (Annals 15.44, ~116 AD) also confirms Pilate: "Christus... suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus."\n\nIn 2018, a ring found at Herodium was cleaned and identified as bearing the inscription "of Pilatus" \u2014 possibly Pilate's own signet ring, providing yet another material confirmation.\n\nThe pattern is consistent: archaeology repeatedly confirms biblical figures and settings that were once doubted. The Pool of Bethesda (John 5:2), once dismissed as fictional, was excavated in the 19th century with exactly the five porticoes John described. Every decade brings new confirmations. As archaeologist William Albright famously stated: "There can be no doubt that archaeology has confirmed the substantial historicity of Old Testament tradition."`,
    keyVerse: { ref: "1 Timothy 6:13", text: "Christ Jesus, who before Pontius Pilate witnessed a good confession" },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "beginner", related: [60, 61],
    debateOptions: [
      { text: "One inscription doesn't prove the Gospel accounts about Pilate are accurate", correct: false },
      { text: "The Pilate Stone (1961) confirmed his existence and title. Tacitus independently confirms him. A possible signet ring was found in 2018. Archaeology repeatedly confirms biblical figures once doubted", correct: true },
      { text: "Pilate probably existed but the Gospels exaggerate his role in Jesus' trial", correct: false },
    ],
  },
  {
    id: 60, icon: "\u{1F9F1}", title: "The James Ossuary",
    question: "The James ossuary is a forgery.",
    objection: "The bone box inscribed 'James, son of Joseph, brother of Jesus' was proven to be a fraud.",
    answer: `The James Ossuary, a limestone bone box dating to approximately 63 AD, bears the Aramaic inscription: "Ya'akov bar Yosef akhui di Yeshua" \u2014 "James, son of Joseph, brother of Jesus." If authentic, it is the earliest archaeological artifact directly linking to the historical Jesus.\n\nThe Israeli Antiquities Authority initially charged collector Oded Golan with forgery in 2004. However, after a seven-year trial \u2014 one of the longest in Israeli history \u2014 Judge Aharon Farkash acquitted Golan in 2012, ruling that the prosecution had failed to prove the inscription was forged.\n\nGeologist Amnon Rosenfeld and Professor Wolfgang Krumbein of Oldenburg University examined the patina (mineral buildup) covering the inscription and concluded it was consistent with 2,000 years of natural accumulation \u2014 not modern application. The patina runs continuously into the letters, which would be extremely difficult to fake.\n\nStatistician Camil Fuchs calculated that the combination of "James, son of Joseph, brother of Jesus" would have applied to only 1.7 people in Jerusalem during the relevant period \u2014 making the identification with the biblical James highly probable. Even if one is cautious, the ossuary demonstrates that the names and family relationships described in the New Testament were real and common in first-century Jerusalem.`,
    keyVerse: { ref: "Galatians 1:19", text: "But other of the apostles saw I none, save James the Lord's brother." },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "intermediate", related: [59, 62],
    debateOptions: [
      { text: "The inscription was proven to be a modern forgery by the Israeli Antiquities Authority", correct: false },
      { text: "After a 7-year trial, the owner was acquitted in 2012. Geologists confirmed 2,000-year-old patina runs into the letters. The name combination applies to only ~1.7 people in first-century Jerusalem", correct: true },
      { text: "The ossuary is real but the 'brother of Jesus' part was added later to an authentic 'James son of Joseph' inscription", correct: false },
    ],
  },
  {
    id: 61, icon: "\u{1F3CA}", title: "The Pool of Siloam & Bethesda",
    question: "The Gospel of John invented locations to make the story seem real.",
    objection: "John's Gospel mentions pools and places that don't exist \u2014 it's theological fiction, not history.",
    answer: `John's Gospel mentions two pools that were once dismissed as fictional by critics: the Pool of Bethesda (John 5:2) with its "five porches" and the Pool of Siloam (John 9:7). Both have been discovered by archaeologists.\n\nThe Pool of Bethesda was excavated near the Church of St. Anne in Jerusalem's Old City. Archaeologists found a large pool with exactly five covered colonnades (porticoes) \u2014 an unusual architectural feature that John mentioned as if it were common knowledge to his readers. The pool dates to the Hasmonean period (2nd-1st century BC) and was in use during Jesus' time.\n\nThe Pool of Siloam was discovered in 2004 during a sewage repair project south of the Temple Mount. Archaeologists from the Israel Antiquities Authority uncovered a large, stepped pool dating to the Second Temple period \u2014 exactly where John's Gospel places it.\n\nThese discoveries are significant because critics of John's Gospel had argued it was written late (2nd century) by someone unfamiliar with Jerusalem's geography. The archaeological evidence demonstrates the opposite: the author knew pre-70 AD Jerusalem with remarkable precision \u2014 details that would have been lost after the Roman destruction. As archaeologist Urban C. von Wahlde concluded, John's topographical references are consistently accurate.`,
    keyVerse: { ref: "John 5:2", text: "Now there is at Jerusalem by the sheep market a pool, which is called in the Hebrew tongue Bethesda, having five porches." },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "beginner", related: [59, 16],
    debateOptions: [
      { text: "John's Gospel was written too late for the author to know Jerusalem's geography accurately", correct: false },
      { text: "Both pools have been excavated: Bethesda with exactly five porticoes as John described, and Siloam discovered in 2004. The author knew pre-70 AD Jerusalem with precision no late author could have", correct: true },
      { text: "Finding pools that match the names doesn't prove the miracles John describes at those locations", correct: false },
    ],
  },
  {
    id: 62, icon: "\u{1F451}", title: "The Tel Dan Inscription",
    question: "King David is a myth \u2014 there's no evidence he existed.",
    objection: "David is a legendary figure like King Arthur. No archaeological evidence confirms his existence.",
    answer: `In 1993, archaeologist Avraham Biran discovered a basalt stone fragment at Tel Dan in northern Israel bearing an Aramaic inscription from the 9th century BC. The inscription, written by an enemy king (likely Hazael of Aram-Damascus), boasts of defeating the "king of Israel" and the "king of the House of David" (bytdwd).\n\nThis was the first reference to David found outside the Bible, and it came from an enemy, not a friend \u2014 making it all the more credible. An enemy king would not fabricate a dynasty to honour his opponent; he mentions the "House of David" because it was the recognized royal line he had fought against.\n\nSince then, the Mesha Stele (Moabite Stone, 9th century BC) has also been re-examined and found to contain a reference to the "House of David" \u2014 independently confirming the Tel Dan find. Egyptologist Kenneth Kitchen has argued that a reference to David may also appear in the topographical list of Pharaoh Shoshenq I at Karnak.\n\nThe "David as myth" position, popular in the 1990s (the "biblical minimalist" school led by Philip Davies and Thomas Thompson), has been progressively abandoned as archaeological evidence accumulated. As Israel Finkelstein \u2014 himself a minimalist-leaning scholar \u2014 conceded, the Tel Dan inscription makes it "difficult to argue that David was a purely legendary figure."`,
    keyVerse: { ref: "2 Samuel 7:16", text: "And thine house and thy kingdom shall be established for ever before thee: thy throne shall be established for ever." },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "intermediate", related: [63, 59],
    debateOptions: [
      { text: "The Tel Dan inscription is too fragmentary to draw reliable conclusions about David", correct: false },
      { text: "The Tel Dan inscription (1993) was written by an enemy king boasting of defeating the 'House of David.' The Mesha Stele independently confirms it. Even minimalist scholars now concede David was historical", correct: true },
      { text: "David existed but was a minor tribal chieftain, not the great king the Bible describes", correct: false },
    ],
  },
  {
    id: 63, icon: "\u{1F4A7}", title: "Hezekiah's Tunnel",
    question: "The Bible exaggerates ancient Israel's engineering and power.",
    objection: "Ancient Israel was too small and primitive to accomplish what the Bible describes.",
    answer: `Hezekiah's Tunnel, a 533-meter underground water channel carved through solid rock beneath Jerusalem, is one of the most impressive engineering achievements of the ancient world \u2014 and it matches the biblical account precisely.\n\n2 Kings 20:20 records: "he made a pool, and a conduit, and brought water into the city." 2 Chronicles 32:30 adds: "This same Hezekiah also stopped the upper watercourse of Gihon, and brought it straight down to the west side of the city of David." Hezekiah diverted the Gihon Spring through a tunnel into the Pool of Siloam to protect Jerusalem's water supply before the Assyrian siege of 701 BC.\n\nThe Siloam Inscription, discovered in 1880 inside the tunnel, is a Hebrew text describing how two teams of workers carved from opposite ends and met in the middle. The inscription dates to approximately 700 BC, perfectly matching Hezekiah's reign. It is now in the Istanbul Archaeological Museum.\n\nThe tunnel's existence was never in doubt (it is still accessible today), but its dating and connection to Hezekiah were confirmed by radiometric analysis published in Nature (2003). The engineering precision \u2014 carving from both ends through solid limestone, with the two teams meeting nearly perfectly \u2014 demonstrates sophisticated surveying capabilities that match a confident, organized kingdom, not a primitive backwater.`,
    keyVerse: { ref: "2 Chronicles 32:30", text: "This same Hezekiah also stopped the upper watercourse of Gihon, and brought it straight down to the west side of the city of David." },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "beginner", related: [62, 64],
    debateOptions: [
      { text: "The tunnel is impressive but was probably built later than Hezekiah's time", correct: false },
      { text: "The Siloam Inscription (700 BC) inside the tunnel matches Hezekiah's reign. Radiometric dating (Nature, 2003) confirmed it. Two teams carved 533 meters from opposite ends \u2014 proving sophisticated Israelite engineering exactly as described", correct: true },
      { text: "The tunnel exists but the Bible's claim about why it was built is theological embellishment", correct: false },
    ],
  },
  {
    id: 64, icon: "\u{1F3FA}", title: "The Cyrus Cylinder",
    question: "The Bible's account of Cyrus freeing the Jews is propaganda.",
    objection: "The story of Cyrus allowing the Jews to return was invented to legitimise the post-exilic community.",
    answer: `The Cyrus Cylinder, discovered in 1879 at the ruins of Babylon, is a clay cylinder inscribed with a declaration by Cyrus the Great of Persia (539 BC). It records his policy of allowing deported peoples to return to their homelands and rebuild their temples \u2014 exactly what Ezra 1:1-4 describes.\n\nThe cylinder states that Cyrus restored the "sacred cities on the other side of the Tigris" and returned the "gods to their sanctuaries." While it does not mention the Jews by name (it is a general decree covering many peoples), it confirms the historical reality of Cyrus's policy of religious tolerance and repatriation \u2014 the same policy the Bible claims benefited the Jews.\n\nIsaiah 44:28-45:1, written approximately 150 years before Cyrus was born, names him by name: "That saith of Cyrus, He is my shepherd, and shall perform all my pleasure... Thus saith the LORD to his anointed, to Cyrus." This is one of the most remarkable predictive prophecies in Scripture: a Persian king named before his birth, described as God's instrument for freeing Israel.\n\nCritics have tried to date Isaiah 44-45 after Cyrus (second Isaiah theory) to avoid the predictive element. But even on that late dating, the Cyrus Cylinder independently confirms that the biblical account of the return from exile is historically grounded, not propaganda.`,
    keyVerse: { ref: "Isaiah 45:1", text: "Thus saith the LORD to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him" },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "intermediate", related: [63, 62],
    debateOptions: [
      { text: "The Cyrus Cylinder is Persian propaganda and doesn't specifically mention the Jews", correct: false },
      { text: "The cylinder confirms Cyrus's policy of returning deported peoples and rebuilding temples \u2014 exactly as Ezra describes. Isaiah named Cyrus ~150 years before his birth. The historical reality of the return from exile is independently confirmed", correct: true },
      { text: "Isaiah 44-45 was written after Cyrus to make it appear prophetic", correct: false },
    ],
  },
  {
    id: 65, icon: "\u{1F4BF}", title: "The Nazareth Inscription",
    question: "There's no evidence anyone cared about Jesus' empty tomb in the first century.",
    objection: "The empty tomb story was a later invention. No first-century evidence suggests it was taken seriously.",
    answer: `The Nazareth Inscription is a marble slab bearing a decree in Greek, attributed to Emperor Claudius (41-54 AD) or possibly Tiberius (14-37 AD), imposing the death penalty for tomb robbery \u2014 specifically for removing bodies from sealed tombs. It was acquired from Nazareth and is now in the Biblioth\u00E8que nationale de France.\n\nWhy would a Roman emperor issue a decree specifically about tomb robbery in the region of Nazareth? The most plausible explanation, argued by scholars including Clyde Billington and Craig Evans, is that the empty tomb of Jesus had become a controversy. The Gospel of Matthew records that the Jewish authorities spread the story that the disciples had stolen Jesus' body (Matthew 28:13-15). A Roman emperor responding to this controversy with a specific decree about tomb violation in the relevant region is exactly what we would expect.\n\nThe inscription states: "It is my decision that graves and tombs remain undisturbed in perpetuity... In the case of violation, I order that the offender be sentenced to capital punishment on charge of violation of sepulchre." Previous Roman law treated tomb robbery as a minor civil offence \u2014 the escalation to capital punishment suggests something extraordinary had happened.\n\nWhile the inscription does not mention Jesus by name, it provides circumstantial evidence that the empty tomb was a real, first-century issue that reached the attention of the Roman imperial administration \u2014 not a legend that developed centuries later.`,
    keyVerse: { ref: "Matthew 28:13", text: "Say ye, His disciples came by night, and stole him away while we slept." },
    category: "Archaeology Confirms Scripture", color: "#0369A1",
    difficulty: "advanced", related: [11, 59],
    debateOptions: [
      { text: "The Nazareth Inscription is about ordinary tomb robbery and has nothing to do with Jesus", correct: false },
      { text: "A Roman emperor escalating tomb robbery to a capital offence specifically in the Nazareth region suggests the empty tomb controversy was real and reached imperial attention \u2014 matching Matthew 28:13's account of the 'stolen body' counter-claim", correct: true },
      { text: "The inscription proves the empty tomb was caused by grave robbers, not resurrection", correct: false },
    ],
  },
  {
    id: 66, icon: "\u{1F9EC}", title: "Abiogenesis \u2014 Life from Non-Life",
    question: "Science will eventually explain how life arose without God.",
    objection: "We don't need a Creator to explain life \u2014 chemistry and physics are sufficient.",
    answer: `Abiogenesis \u2014 the origin of life from non-living matter \u2014 remains one of the deepest unsolved problems in science. Despite decades of research and billions in funding, no laboratory has come close to producing a self-replicating cell from raw chemistry.\n\nThe challenge is not merely creating amino acids (the Miller-Urey experiment of 1953 produced some). The challenge is assembling them into functional proteins, which requires specific sequences comparable to meaningful sentences in a language. A single functional protein of 150 amino acids has roughly 1 in 10^164 possible combinations \u2014 far exceeding the probabilistic resources of the entire universe (estimated at 10^80 particles operating for 10^16 seconds).\n\nBiochemist Michael Behe notes that even the simplest known free-living cell (Mycoplasma genitalium) requires 482 protein-coding genes working in concert. The "simple cell" that Darwin imagined does not exist. Francis Crick, co-discoverer of DNA, acknowledged: "An honest man, armed with all the knowledge available to us now, could only state that in some sense, the origin of life appears at the moment to be almost a miracle."\n\nThe problem is not merely scientific but informational. DNA is a digital code \u2014 it stores, transmits, and processes information. In our universal experience, information always comes from minds. The leap from chemistry to biology is not a gap in knowledge \u2014 it is a fundamental category difference that materialist explanations have not bridged.`,
    keyVerse: { ref: "Genesis 2:7", text: "And the LORD God formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul." },
    category: "Science & Faith", color: "#059669",
    difficulty: "advanced", related: [67, 32],
    debateOptions: [
      { text: "The Miller-Urey experiment showed that life can arise from simple chemicals given enough time", correct: false },
      { text: "Producing amino acids is vastly different from assembling functional proteins (1 in 10^164 odds) or a minimal cell (482 genes). DNA is a digital information code, and information universally comes from minds, not chance chemistry", correct: true },
      { text: "Abiogenesis is unsolved but that doesn't mean God is the answer \u2014 it's a god-of-the-gaps argument", correct: false },
    ],
  },
  {
    id: 67, icon: "\u{1F9EC}", title: "DNA \u2014 The Language of God",
    question: "DNA is just chemistry, not a 'language' or 'code.'",
    objection: "Calling DNA a 'code' is a metaphor. There is no actual information in DNA \u2014 just chemical reactions.",
    answer: `This objection is contradicted by the scientists who study DNA most closely. Francis Collins, director of the Human Genome Project, titled his book The Language of God (2006) precisely because DNA functions as a genuine information-processing system \u2014 not merely a metaphor for one.\n\nDNA stores information using a four-letter chemical alphabet (A, T, G, C) in specific sequences that encode instructions for building proteins. Bill Gates observed: "DNA is like a computer program but far, far more advanced than any software ever created." This is not metaphorical language \u2014 it is a literal description of how molecular biology works.\n\nInformation theorist Hubert Yockey, who was not a creationist, demonstrated in Information Theory, Evolution, and the Origin of Life (2005) that the information in DNA is mathematically equivalent to written language. It has syntax (rules of arrangement), semantics (meaning), and pragmatics (functional effects). These are the defining properties of a genuine code.\n\nThe question is not whether DNA contains information \u2014 that is universally acknowledged. The question is where the information came from. In every other domain of human experience, specified complex information \u2014 language, software, blueprints \u2014 comes from an intelligent source. Philosopher Stephen Meyer argues in Signature in the Cell (2009) that intelligent design is the best causal explanation for the digital information in DNA.`,
    keyVerse: { ref: "Psalm 139:14", text: "I will praise thee; for I am fearfully and wonderfully made: marvellous are thy works; and that my soul knoweth right well." },
    category: "Science & Faith", color: "#059669",
    difficulty: "intermediate", related: [66, 68],
    debateOptions: [
      { text: "Calling DNA a 'code' is just a useful metaphor \u2014 it's really just chemistry", correct: false },
      { text: "Yockey proved DNA information is mathematically equivalent to written language. Bill Gates called it 'far more advanced than any software.' In all experience, specified complex information comes from intelligent sources", correct: true },
      { text: "DNA information arose through natural selection over billions of years \u2014 no intelligence needed", correct: false },
    ],
  },
  {
    id: 68, icon: "\u2699\uFE0F", title: "Irreducible Complexity",
    question: "Irreducible complexity has been debunked.",
    objection: "Scientists have shown that complex biological systems can evolve step by step. Irreducible complexity is a failed argument.",
    answer: `Michael Behe introduced irreducible complexity in Darwin's Black Box (1996): a system is irreducibly complex if removing any one part causes the whole system to cease functioning. His classic example is the bacterial flagellum \u2014 a molecular rotary motor with ~40 protein parts acting as a rotor, stator, drive shaft, and universal joint.\n\nCritics claimed the Type III Secretion System (T3SS) was a precursor to the flagellum, showing it could evolve stepwise. However, comparative genomics has since shown that T3SS likely evolved from the flagellum, not the other way around (Abby and Rocha, PLoS Genetics, 2012). The supposed "refutation" actually supports Behe's case.\n\nMore fundamentally, even if individual parts had precursor functions, the challenge remains: how do ~40 precisely matched components come together simultaneously to form a functional motor? Having parts that can do other things individually does not explain how they assemble into a new, integrated system. As Behe argues in Darwin Devolves (2019), random mutation overwhelmingly breaks or degrades genetic information \u2014 it does not build new molecular machines.\n\nThe argument is not that evolution cannot modify existing systems (it clearly can). The argument is that certain integrated systems contain a minimum threshold of specified complexity that random processes cannot plausibly generate. This is an inference from observed biology, not an argument from ignorance.`,
    keyVerse: { ref: "Romans 1:20", text: "For the invisible things of him from the creation of the world are clearly seen, being understood by the things that are made, even his eternal power and Godhead" },
    category: "Science & Faith", color: "#059669",
    difficulty: "advanced", related: [66, 32],
    debateOptions: [
      { text: "The bacterial flagellum has been fully explained by evolution through the Type III Secretion System", correct: false },
      { text: "Comparative genomics shows T3SS likely evolved from the flagellum, not vice versa. Having parts with other functions doesn't explain how ~40 components assemble into an integrated motor. Random mutation overwhelmingly degrades information", correct: true },
      { text: "Irreducible complexity is an argument from ignorance \u2014 just because we don't know how something evolved doesn't mean it was designed", correct: false },
    ],
  },
  {
    id: 69, icon: "\u{1F30C}", title: "The Anthropic Principle",
    question: "The universe wasn't designed for life \u2014 life adapted to the universe.",
    objection: "We observe a universe compatible with life because only such a universe could produce observers. There's nothing remarkable about it.",
    answer: `This response \u2014 the "weak anthropic principle" \u2014 is logically valid but explanatorily empty. It is like a man facing a firing squad of 100 marksmen, all of whom miss, and saying: "Of course they all missed \u2014 if they hadn't, I wouldn't be here to observe it." True, but it doesn't explain why they all missed.\n\nThe firing squad analogy is from philosopher John Leslie and illustrates the point precisely. The fact that you must be alive to observe your survival does not remove the need for an explanation of why you survived. Either the marksmen are terrible shots (chance) or someone arranged for them to miss (design).\n\nThe numbers involved make chance virtually impossible. Physicist Roger Penrose calculated the odds of the universe's low-entropy initial conditions at 1 in 10^(10^123). Physicist Luke Barnes, in A Fortunate Universe (2016), catalogues dozens of independently fine-tuned constants. Change any one by a fraction, and stars, chemistry, and life become impossible.\n\nThe "many universes" response (the multiverse) is not a scientific theory \u2014 it is a philosophical hypothesis designed specifically to avoid the design conclusion. It is unobservable, untestable, and unfalsifiable. As philosopher Richard Swinburne argues: postulating an infinite number of undetectable universes to avoid one God is not more rational \u2014 it is spectacularly less parsimonious.`,
    keyVerse: { ref: "Isaiah 45:18", text: "For thus saith the LORD that created the heavens; God himself that formed the earth and made it; he hath established it, he created it not in vain, he formed it to be inhabited" },
    category: "Science & Faith", color: "#059669",
    difficulty: "advanced", related: [32, 20],
    debateOptions: [
      { text: "We observe fine-tuning because only a fine-tuned universe could produce observers \u2014 it's selection bias", correct: false },
      { text: "The firing squad analogy: surviving doesn't remove the need to explain why you survived. Penrose's odds are 1 in 10^(10^123). The multiverse is unobservable, untestable, and less parsimonious than a single Creator", correct: true },
      { text: "Fine-tuning could be explained by a natural process we haven't discovered yet", correct: false },
    ],
  },
  {
    id: 70, icon: "\u{1F52E}", title: "Multiverse vs God",
    question: "The multiverse explains fine-tuning without needing God.",
    objection: "If infinite universes exist, ours being life-permitting is just probability, not design.",
    answer: `The multiverse hypothesis \u2014 that an infinite number of unobservable universes exist with every possible set of physical constants \u2014 is the primary alternative to theistic design for explaining fine-tuning. But it faces severe problems.\n\nFirst, it is not science in any testable sense. Karl Popper defined science by falsifiability. The multiverse is by definition unobservable and unfalsifiable \u2014 we can never detect, measure, or disprove other universes. Physicist Paul Steinhardt, who helped develop inflationary theory, has called the multiverse "scientifically meaningless."\n\nSecond, even if a multiverse existed, it would not eliminate the need for a designer. A multiverse-generating mechanism (such as eternal inflation or the string landscape) itself requires fine-tuned initial conditions and laws of physics. You push the design question back one step \u2014 you do not eliminate it.\n\nThird, the multiverse is spectacularly unparsimonious. Ockham's Razor favours the simplest explanation that accounts for the data. Postulating 10^500 undetectable universes to avoid one God is not simpler \u2014 it is the most extravagant explanatory inflation in the history of thought.\n\nAs philosopher Robin Collins argues: the multiverse does not compete with theism \u2014 it pushes the question back. Why does the multiverse-generating mechanism exist? Why does it have the properties needed to produce diverse universes? At every level, the need for an ultimate explanation remains.`,
    keyVerse: { ref: "Nehemiah 9:6", text: "Thou, even thou, art LORD alone; thou hast made heaven, the heaven of heavens, with all their host, the earth, and all things that are therein" },
    category: "Science & Faith", color: "#059669",
    difficulty: "advanced", related: [69, 32],
    debateOptions: [
      { text: "The multiverse is the most scientifically rigorous explanation for fine-tuning", correct: false },
      { text: "The multiverse is unfalsifiable and unobservable. It still requires fine-tuned laws to generate universes. Postulating 10^500 undetectable universes is spectacularly less parsimonious than one Creator", correct: true },
      { text: "The multiverse and God are both equally valid explanations \u2014 we can't know which is true", correct: false },
    ],
  },
  {
    id: 71, icon: "\u{1F9EC}", title: "Evolution & Adam",
    question: "Evolution proves Adam and Eve weren't real.",
    objection: "Modern genetics shows humans descended from a population of thousands, not two individuals.",
    answer: `This is a genuinely complex question where Christians hold diverse positions, and intellectual honesty requires acknowledging the range.\n\nSome scholars (like geneticist Joshua Swamidass in The Genealogical Adam and Eve, 2019) argue that a historical Adam and Eve are compatible with population genetics. Swamidass demonstrates that a couple living around 6,000 years ago could be universal genealogical ancestors of all living humans while coexisting with a larger population. This model accepts mainstream population genetics while preserving a historical Adam.\n\nOther scholars (like John Walton in The Lost World of Adam and Eve, 2015) argue that Adam and Eve are presented as archetypal representatives of humanity rather than the sole biological progenitors. In this view, the theological truths \u2014 that humans bear God's image, that sin entered through human choice, that we are morally accountable \u2014 are preserved regardless of the population size.\n\nWhat is theologically non-negotiable is stated in Romans 5:12: "by one man sin entered into the world, and death by sin." Paul's theology of the Fall and redemption requires a real, historical entry point for sin. Whether "one man" means sole biological ancestor or covenant representative is debated, but the historicity of the Fall is essential to the Gospel.\n\nThe key point: the evolutionary question is about mechanism; the theological question is about meaning. These are different questions, and answers to one do not automatically determine answers to the other.`,
    keyVerse: { ref: "Romans 5:12", text: "Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned" },
    category: "Science & Faith", color: "#059669",
    difficulty: "advanced", related: [14, 66],
    debateOptions: [
      { text: "Genetics has definitively disproven a historical Adam and Eve", correct: false },
      { text: "Scholars like Swamidass show a historical couple is compatible with population genetics. Walton argues for an archetypal reading. The theological essential is Romans 5:12: a real entry point for sin. Mechanism and meaning are different questions", correct: true },
      { text: "Christians must reject all evolutionary science to maintain biblical authority", correct: false },
    ],
  },
  {
    id: 72, icon: "\u{1F4A5}", title: "The Big Bang & Genesis 1",
    question: "The Big Bang contradicts Genesis.",
    objection: "Science says the universe began with an explosion 13.8 billion years ago. Genesis says God created it in six days. They can't both be right.",
    answer: `Remarkably, the Big Bang theory was first proposed by a Catholic priest \u2014 Fr. Georges Lema\u00EEtre, a Belgian physicist, in 1927. He called it the "hypothesis of the primeval atom." Many atheist scientists initially resisted the theory precisely because it implied a beginning \u2014 and a beginning implies a Beginner.\n\nFred Hoyle, an atheist astronomer, coined the term "Big Bang" as a term of ridicule. He preferred the Steady State theory (an eternal universe) because the alternative had, as he put it, "theological implications." The Steady State theory was eventually disproved by the discovery of cosmic microwave background radiation in 1965. The universe had a beginning \u2014 exactly as Genesis 1:1 states.\n\nThe question of "six days" depends on how one reads the Hebrew word "yom." As John Lennox demonstrates, "yom" is used in non-literal senses within Genesis itself (Genesis 2:4 uses "yom" to refer to the entire creation period). Frameworks range from young-earth literal days to analogical day-age interpretations \u2014 all held by serious Bible scholars throughout history.\n\nThe sequence in Genesis 1 also shows remarkable correspondence with the scientific account: light first, then sky/water separation, then land, then vegetation, then celestial bodies visible from Earth's surface, then sea creatures, then land animals, then humans. While the details are debated, the broad movement from simple to complex, from cosmic to terrestrial to biological, is striking for a text written 3,000 years ago.`,
    keyVerse: { ref: "Genesis 1:1", text: "In the beginning God created the heaven and the earth." },
    category: "Science & Faith", color: "#059669",
    difficulty: "beginner", related: [14, 20],
    debateOptions: [
      { text: "The Big Bang disproves Genesis because the Bible teaches a young earth", correct: false },
      { text: "The Big Bang confirms Genesis 1:1 \u2014 the universe had a beginning, first proposed by a Catholic priest. 'Yom' has multiple Hebrew meanings. The Genesis sequence (light, sky, land, life) broadly matches the scientific account", correct: true },
      { text: "Genesis and science are about completely different things and should never be compared", correct: false },
    ],
  },
  {
    id: 73, icon: "\u2764\uFE0F", title: "Does God Hate Sinners?",
    question: "The Bible says God hates sinners. That's not loving.",
    objection: "Psalm 5:5 says God hates 'all workers of iniquity.' A loving God cannot hate the people he created.",
    answer: `This question requires careful theological precision. Scripture speaks of God's hatred in two distinct senses, and confusing them leads to serious error in both directions.\n\nPsalm 5:5 does say: "thou hatest all workers of iniquity." Psalm 11:5 adds: "the LORD trieth the righteous: but the wicked and him that loveth violence his soul hateth." These are not mistranslations or metaphors \u2014 they describe God's genuine moral opposition to evil and those who persistently practice it.\n\nBut the same God says: "I have no pleasure in the death of the wicked; but that the wicked turn from his way and live" (Ezekiel 33:11). "God so loved the world" (John 3:16) \u2014 including the wicked world. "While we were yet sinners, Christ died for us" (Romans 5:8). The cross is the ultimate proof that God's response to sinners is not mere hatred but costly, sacrificial love.\n\nThe resolution is that God's "hatred" of sinners is a judicial response to persistent, unrepentant evil \u2014 not personal malice. A good judge "hates" injustice and those who perpetrate it, yet may simultaneously wish for their reform. God's justice and mercy are not contradictions \u2014 they meet at the cross, where sin is fully condemned and sinners are fully loved.\n\nThe prosperity gospel's "God only loves" and the harsh legalist's "God only judges" are both half-truths. The whole truth is that God is simultaneously holy and loving \u2014 and the cross is where both are fully expressed.`,
    keyVerse: { ref: "Romans 5:8", text: "But God commendeth his love toward us, in that, while we were yet sinners, Christ died for us." },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "intermediate", related: [18, 42],
    debateOptions: [
      { text: "God hates sin but loves all sinners unconditionally \u2014 the 'hate' passages are metaphorical", correct: false },
      { text: "God's 'hatred' is judicial opposition to persistent evil \u2014 not personal malice. The cross is where justice and mercy meet: sin fully condemned, sinners fully loved. Romans 5:8: 'while we were yet sinners, Christ died for us'", correct: true },
      { text: "God literally hates sinners and only loves those who repent and obey", correct: false },
    ],
  },
  {
    id: 74, icon: "\u{1F30D}", title: "What About Those Who Never Heard?",
    question: "It's unfair to condemn people who never had a chance to hear the Gospel.",
    objection: "Billions of people throughout history never heard of Jesus. A just God cannot condemn them for something they couldn't control.",
    answer: `This is one of the most emotionally compelling objections, and Christians have wrestled with it throughout history. Several biblical principles are relevant.\n\nFirst, Romans 1:19-20 teaches that God has revealed himself to all people through creation: "the invisible things of him from the creation of the world are clearly seen." Romans 2:14-15 adds that the moral law is "written in their hearts, their conscience also bearing witness." No one is without some revelation of God.\n\nSecond, God judges according to what people have received, not what they haven't: "For unto whomsoever much is given, of him shall be much required" (Luke 12:48). Abraham "believed in the LORD; and he counted it to him for righteousness" (Genesis 15:6) \u2014 without knowing the name "Jesus." Old Testament saints were saved by faith in whatever God had revealed to them.\n\nThird, God promises that those who sincerely seek will find: "ye shall seek me, and find me, when ye shall search for me with all your heart" (Jeremiah 29:13). Acts 17:27 says God arranged the world "that they should seek the Lord, if haply they might feel after him, and find him."\n\nWhat we can affirm with certainty: God is just (Genesis 18:25), God is merciful (Exodus 34:6), and God is not willing that any should perish (2 Peter 3:9). The judge of all the earth will do right. The question is not "will God be fair?" \u2014 it is "will I respond to the light I have been given?"`,
    keyVerse: { ref: "Genesis 18:25", text: "Shall not the Judge of all the earth do right?" },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "intermediate", related: [48, 13],
    debateOptions: [
      { text: "People who never heard the Gospel will automatically be saved because it's not their fault", correct: false },
      { text: "Romans 1-2 says all have revelation through creation and conscience. God judges according to what people received (Luke 12:48). Abraham was saved by faith without knowing Jesus' name. The Judge of all the earth will do right", correct: true },
      { text: "Only those who explicitly confess Jesus' name can be saved \u2014 everyone else is condemned", correct: false },
    ],
  },
  {
    id: 75, icon: "\u{1F6E1}\uFE0F", title: "Can a Christian Lose Salvation?",
    question: "If you sin enough, you lose your salvation.",
    objection: "Hebrews 6:4-6 says it's impossible to renew those who fall away. Salvation can be lost.",
    answer: `This question has been debated among sincere Christians for centuries. Both sides have strong scriptural arguments, and intellectual honesty requires acknowledging the complexity.\n\nThe strongest texts for security of salvation: John 10:28-29 \u2014 "I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand." Romans 8:38-39 \u2014 nothing "shall be able to separate us from the love of God." Ephesians 1:13-14 \u2014 believers are "sealed with that holy Spirit of promise" as a guarantee.\n\nThe strongest texts raising concern: Hebrews 6:4-6 \u2014 those who were "once enlightened" and "fall away" cannot be renewed. Hebrews 10:26 \u2014 "if we sin wilfully after that we have received the knowledge of the truth." 2 Peter 2:20-22 \u2014 those who escape the world's corruption through Christ but return to it.\n\nThe key interpretive question is whether the Hebrews passages describe genuine believers who lose salvation, or people who were associated with the church but never truly converted. The "once enlightened" language in Hebrews 6 does not necessarily mean "regenerated" \u2014 Judas was enlightened by Jesus' teaching but was never genuinely converted.\n\nWhat all sides agree on: genuine saving faith produces lasting fruit (John 15:5-6); those who persevere to the end give evidence of genuine faith (Matthew 24:13); God's power is sufficient to keep believers (Jude 1:24). The question is not "can I sin my way out of God's hand?" but "does my life show evidence that I was genuinely placed in it?"`,
    keyVerse: { ref: "John 10:28", text: "And I give unto them eternal life; and they shall never perish, neither shall any man pluck them out of my hand." },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "intermediate", related: [27, 73],
    debateOptions: [
      { text: "Hebrews 6:4-6 clearly proves Christians can lose their salvation through sin", correct: false },
      { text: "John 10:28: 'they shall never perish.' Romans 8:38: nothing can separate us. The Hebrews passages may describe those associated with the church but never genuinely converted. The key evidence of genuine faith is lasting fruit", correct: true },
      { text: "Once saved, always saved \u2014 you can live however you want and still go to heaven", correct: false },
    ],
  },
  {
    id: 76, icon: "\u{1F64F}", title: "Why Pray If God Knows Everything?",
    question: "Prayer is pointless if God already knows the outcome.",
    objection: "If God is omniscient and has a plan, prayer cannot change anything. It's just talking to yourself.",
    answer: `This objection assumes prayer is about informing God of something he doesn't know. But Scripture never presents prayer that way. Prayer is not informing God \u2014 it is aligning with God.\n\nJesus, who knew the Father's will perfectly, prayed constantly. If prayer were pointless for someone in perfect communion with God, Jesus would not have done it. He prayed before every major decision (Luke 6:12), in times of distress (Luke 22:41-44), and as a regular practice (Mark 1:35). Prayer was not about changing God's mind \u2014 it was about deepening relationship.\n\nC.S. Lewis addressed this in Letters to Malcolm: "I don't pray to change God's mind. I pray to change mine." Prayer is the means by which God transforms the one who prays. It is participatory \u2014 God involves us in his purposes. James 4:2 says: "ye have not, because ye ask not." God has chosen to make some things contingent on prayer \u2014 not because he needs the information, but because relationship requires participation.\n\nThe analogy of parenthood helps: a father who knows his child needs dinner still wants the child to say "I'm hungry." Not because the father needs to be informed, but because communication is the fabric of relationship. Prayer is the conversation between a child and a Father who already knows, already cares, and has already planned \u2014 but who delights in being asked.`,
    keyVerse: { ref: "James 4:2", text: "ye have not, because ye ask not." },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "beginner", related: [48, 50],
    debateOptions: [
      { text: "Prayer is just a psychological exercise \u2014 it doesn't actually change anything in the real world", correct: false },
      { text: "Prayer is about aligning with God, not informing him. Jesus prayed constantly despite knowing the Father's will. James 4:2: 'ye have not because ye ask not.' God makes some things contingent on prayer because relationship requires participation", correct: true },
      { text: "Prayer does change God's mind \u2014 that's why we need to pray hard enough", correct: false },
    ],
  },
  {
    id: 77, icon: "\u{1F3AF}", title: "Predestination vs Free Will",
    question: "If God predestines everything, we have no real choice.",
    objection: "Ephesians 1:4-5 says God chose us before the foundation of the world. That eliminates free will.",
    answer: `This is one of the oldest and most profound debates in Christian theology, and honest Christians hold different positions.\n\nThe Reformed (Calvinist) tradition emphasises God's sovereignty in salvation: "he hath chosen us in him before the foundation of the world" (Ephesians 1:4). God's election is the ultimate cause of salvation \u2014 we choose God because he first chose us (John 15:16).\n\nThe Arminian tradition emphasises God's genuine offer to all: "whosoever will, let him take the water of life freely" (Revelation 22:17). God's foreknowledge (Romans 8:29) means he chose based on foreseen faith, not arbitrary selection. 2 Peter 3:9 says God is "not willing that any should perish."\n\nBoth traditions agree on the essentials: salvation is by grace alone, faith is necessary, God is sovereign, and human responsibility is real. The mystery is how these fit together \u2014 and that mystery is acknowledged by both sides. As Spurgeon reportedly said: "I never try to reconcile friends."\n\nWhat Scripture clearly teaches is that God does not force anyone against their will (Matthew 23:37 \u2014 "how often would I have gathered thy children together... and ye would not!") and that no one comes to the Father without divine drawing (John 6:44). Both truths are held in tension throughout Scripture, and the wisest approach is to affirm both rather than sacrificing one for the other.`,
    keyVerse: { ref: "John 6:44", text: "No man can come to me, except the Father which hath sent me draw him" },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "advanced", related: [74, 48],
    debateOptions: [
      { text: "God predestines everything \u2014 human free will is an illusion", correct: false },
      { text: "Scripture teaches both divine sovereignty (Ephesians 1:4, John 6:44) and genuine human responsibility (Revelation 22:17, Matthew 23:37). Both are affirmed in tension. The essentials are agreed: salvation by grace alone, faith necessary, God sovereign", correct: true },
      { text: "Free will is absolute \u2014 God merely responds to human choices without any sovereign plan", correct: false },
    ],
  },
  {
    id: 78, icon: "\u2696\uFE0F", title: "Are All Sins Equal?",
    question: "The Bible says all sin is the same. Lying is as bad as murder.",
    objection: "If all sins are equal in God's eyes, then Christianity has no moral nuance.",
    answer: `This is a widespread misunderstanding. The Bible does not teach that all sins are equally serious. It teaches that all sins are equally disqualifying \u2014 which is a different claim.\n\nJames 2:10 says: "whosoever shall keep the whole law, and yet offend in one point, he is guilty of all." This means any sin \u2014 however small \u2014 makes a person a law-breaker in need of grace. It does not mean all sins have equal severity. A student who fails one question on an exam has technically failed, just like the student who fails every question \u2014 but the two situations are obviously different in degree.\n\nJesus explicitly acknowledged degrees of sin. He told Pilate: "he that delivered me unto thee hath the greater sin" (John 19:11). He said it will be "more tolerable" for Sodom on judgement day than for Capernaum (Matthew 11:24) \u2014 implying different levels of judgement. The Old Testament distinguished between unintentional sins (Leviticus 4) and "presumptuous" sins (Numbers 15:30), with different consequences.\n\nThe practical implication: all sins require grace, but not all sins have equal consequences. Murder has greater consequences than gossip \u2014 in human courts and in God's economy. The equal-sin claim flattens moral reality in a way that Scripture itself does not support.`,
    keyVerse: { ref: "John 19:11", text: "he that delivered me unto thee hath the greater sin." },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "beginner", related: [73, 79],
    debateOptions: [
      { text: "James 2:10 proves all sins are exactly equal in God's eyes", correct: false },
      { text: "All sins are equally disqualifying (James 2:10) but not equally serious. Jesus said some have 'greater sin' (John 19:11) and some face greater judgement (Matthew 11:24). The OT distinguished unintentional from presumptuous sins", correct: true },
      { text: "Only major sins like murder and adultery need forgiveness \u2014 small sins don't really count", correct: false },
    ],
  },
  {
    id: 79, icon: "\u{1F4DC}", title: "OT Law \u2014 Shellfish & Tattoos",
    question: "Christians eat shellfish and wear mixed fabrics \u2014 they cherry-pick which laws to follow.",
    objection: "If Christians don't follow Leviticus 11 (dietary laws) or 19:19 (mixed fabrics), they can't cite Leviticus for anything.",
    answer: `This is one of the most common objections, and it rests on a misunderstanding of how the Old Testament law functions within Christian theology.\n\nThe law is traditionally understood in three categories: moral law (e.g., the Ten Commandments), civil law (regulations for ancient Israel's government), and ceremonial law (sacrifices, dietary codes, ritual purity). This distinction was recognised by the early church fathers and is built into the New Testament itself.\n\nThe New Testament explicitly sets aside the ceremonial law. Mark 7:19: Jesus "declared all meats clean" (NIV). Acts 10:15: God tells Peter, "What God hath cleansed, that call not thou common." Colossians 2:16: "Let no man therefore judge you in meat, or in drink, or in respect of an holyday." The dietary laws, Sabbath regulations, and temple rituals were fulfilled in Christ \u2014 they pointed to him and are no longer binding.\n\nThe moral law, however, is repeatedly reaffirmed in the New Testament. Every one of the Ten Commandments (except Sabbath observance, which is reframed) is restated by Jesus or the apostles. The moral principles behind civil laws (justice, protection of the vulnerable, honest dealing) are likewise carried forward.\n\nChristians are not cherry-picking. They are applying the same interpretive framework the apostles established: ceremonial law fulfilled, moral law enduring. This is not modern convenience \u2014 it is first-century apostolic teaching.`,
    keyVerse: { ref: "Mark 7:19", text: "purging all meats" },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "beginner", related: [41, 34],
    debateOptions: [
      { text: "Christians should either follow all of Leviticus or none of it \u2014 you can't pick and choose", correct: false },
      { text: "The three-category distinction (moral, civil, ceremonial) is built into the NT. Jesus declared all foods clean (Mark 7:19). Colossians 2:16 sets aside dietary/festival laws. Moral law is reaffirmed throughout the NT. This is apostolic teaching, not cherry-picking", correct: true },
      { text: "The entire Old Testament law was abolished by Jesus and none of it applies to Christians", correct: false },
    ],
  },
  {
    id: 80, icon: "\u{1F451}", title: "Women in the Bible",
    question: "The Bible oppresses women.",
    objection: "Scripture treats women as property, silences them in church, and excludes them from leadership.",
    answer: `This objection requires separating what the Bible actually teaches from cultural practices it has been used to justify \u2014 two very different things.\n\nJesus' treatment of women was revolutionary for his culture. He spoke publicly with the Samaritan woman (John 4) \u2014 breaking both gender and ethnic taboos. He allowed Mary of Bethany to sit at his feet as a disciple (Luke 10:39) \u2014 a role reserved for men. He chose women as the first witnesses of the resurrection (Matthew 28:1-8) \u2014 in a culture where women's testimony was legally inadmissible. If the resurrection were invented, no first-century author would have chosen women as witnesses.\n\nPaul's statement in Galatians 3:28 \u2014 "there is neither male nor female: for ye are all one in Christ Jesus" \u2014 was the most radically egalitarian statement in the ancient world. Paul commended women leaders by name: Phoebe (a deacon, Romans 16:1), Priscilla (a teacher, Acts 18:26), and Junia (an apostle, Romans 16:7).\n\nThe "difficult" passages (1 Corinthians 14:34, 1 Timothy 2:12) are debated among scholars and are understood by many as addressing specific local situations (Corinthian disorder, Ephesian false teaching) rather than establishing universal prohibitions. Even complementarian scholars who maintain role distinctions affirm the full dignity, equality, and spiritual authority of women.\n\nHistorian Rodney Stark documented in The Rise of Christianity that women flocked to the early church precisely because it treated them with a dignity unknown in Greco-Roman culture. Christianity elevated women \u2014 it did not oppress them.`,
    keyVerse: { ref: "Galatians 3:28", text: "There is neither male nor female: for ye are all one in Christ Jesus." },
    category: "Ethics & Pastoral", color: "#059669",
    difficulty: "intermediate", related: [34, 79],
    debateOptions: [
      { text: "The Bible clearly teaches that women are subordinate to men in all areas of life", correct: false },
      { text: "Jesus was revolutionary \u2014 he chose women as first resurrection witnesses, taught them as disciples, broke cultural taboos. Paul commended women leaders (Phoebe, Priscilla, Junia). The early church attracted women because it elevated their dignity", correct: true },
      { text: "The difficult passages about women's roles should be removed from the Bible as culturally outdated", correct: false },
    ],
  },
  {
    id: 81, icon: "\u{1F4C4}", title: "P52 and the Early Papyri",
    question: "We don't have any early New Testament manuscripts.",
    objection: "The earliest NT manuscripts are from centuries after Jesus. We can't know what the originals said.",
    answer: `The John Rylands Papyrus (P52), housed at the University of Manchester, is a fragment of John 18:31-33 and 18:37-38 dating to approximately 125-150 AD \u2014 only 30-60 years after John's Gospel was written. This makes it the earliest surviving New Testament manuscript.\n\nBut P52 is not alone. The Chester Beatty Papyri (P45, P46, P47) date to around 200 AD and contain substantial portions of the Gospels, Acts, Paul's letters, and Revelation. The Bodmer Papyri (P66, P75) date to 175-225 AD and contain most of John and Luke. These are not fragments \u2014 they are extensive manuscripts providing cross-checks across multiple books.\n\nFor comparison: the earliest manuscript of Homer's Iliad dates to the 3rd century BC \u2014 500 years after composition. The earliest copy of Tacitus's Annals is from the 9th century AD \u2014 800 years after writing. No classical scholar doubts these texts. The New Testament's manuscript evidence is in a completely different league.\n\nTextual critic Daniel Wallace estimates that we now possess over 5,800 Greek manuscripts, 10,000 Latin manuscripts, and thousands in other languages \u2014 totalling over 24,000 manuscript witnesses. The variation between them is less than 1%, and no variant affects any Christian doctrine. We have better evidence for the New Testament text than for any other document from the ancient world.`,
    keyVerse: { ref: "1 Peter 1:25", text: "But the word of the Lord endureth for ever." },
    category: "Textual Criticism", color: "#B45309",
    difficulty: "intermediate", related: [82, 6],
    debateOptions: [
      { text: "P52 is too small a fragment to tell us anything meaningful about the original text", correct: false },
      { text: "P52 dates to ~125 AD (30-60 years after writing). The Chester Beatty and Bodmer Papyri (~200 AD) contain extensive text. 24,000+ manuscripts with less than 1% variation \u2014 far better evidence than any other ancient document", correct: true },
      { text: "Early manuscripts exist but the text was still corrupted during the centuries of copying", correct: false },
    ],
  },
  {
    id: 82, icon: "\u{1F4D5}", title: "Codex Sinaiticus & Vaticanus",
    question: "The great codices disagree with each other \u2014 we can't trust any of them.",
    objection: "Codex Sinaiticus and Vaticanus differ from each other and from the Textus Receptus. This proves the text is unreliable.",
    answer: `Codex Sinaiticus (\u05D0, 4th century) and Codex Vaticanus (B, 4th century) are the two oldest near-complete manuscripts of the Greek Bible. They are invaluable precisely because they were copied independently, in different locations, from different earlier manuscripts \u2014 and yet they agree extensively.\n\nThe differences between them are overwhelmingly minor: spelling variations, word order changes, and occasional scribal errors that are easily identified by comparison. Textual scholar Bruce Metzger estimated that the New Testament text is 99.5% certain \u2014 and the 0.5% in question affects no doctrine.\n\nThe Textus Receptus (used for the KJV) is based on later Byzantine manuscripts (9th-12th century). Where it differs from Sinaiticus/Vaticanus, the question is not "which is corrupted?" but "which is earlier?" In most cases, the earlier reading is considered more likely to reflect the original. This is standard methodology in textual criticism, applied to all ancient texts, not just the Bible.\n\nThe existence of variations is actually a strength, not a weakness. If all manuscripts agreed perfectly, critics would claim they were mass-produced from a single controlled source. The pattern of widespread agreement with minor variations is exactly what we expect from a text faithfully copied by thousands of scribes across centuries and continents \u2014 with no central authority controlling the process.`,
    keyVerse: { ref: "Isaiah 40:8", text: "The grass withereth, the flower fadeth: but the word of our God shall stand for ever." },
    category: "Textual Criticism", color: "#B45309",
    difficulty: "advanced", related: [81, 83],
    debateOptions: [
      { text: "The differences between Sinaiticus and Vaticanus prove the New Testament text is unreliable", correct: false },
      { text: "The differences are overwhelmingly minor (spelling, word order). 99.5% certainty with no doctrine affected. Variations from independent copying actually prove no central authority controlled the text \u2014 yet agreement is remarkable", correct: true },
      { text: "We should only use manuscripts that agree with the Textus Receptus and reject all others", correct: false },
    ],
  },
  {
    id: 83, icon: "\u{1F4DD}", title: "The Comma Johanneum (1 John 5:7)",
    question: "The Trinity verse in 1 John was added by forgers.",
    objection: "1 John 5:7's Trinitarian formula ('the Father, the Word, and the Holy Ghost: and these three are one') doesn't appear in early manuscripts.",
    answer: `The scholarly consensus is that the Comma Johanneum \u2014 the explicitly Trinitarian phrase in 1 John 5:7-8 found in the KJV \u2014 is not original to John's letter. It is absent from all Greek manuscripts before the 14th century, from all early church father quotations (including those specifically arguing for the Trinity), and from all early translations except certain late Latin manuscripts.\n\nErasmus, who compiled the Textus Receptus (the Greek text behind the KJV), initially omitted it. He included it in his third edition (1522) only after a single Greek manuscript was produced that contained it \u2014 a manuscript most scholars believe was created specifically to pressure Erasmus.\n\nThis is important to state clearly: the Comma Johanneum is almost certainly a later addition. But this fact does not undermine the Trinity \u2014 not even slightly. The doctrine of the Trinity does not depend on this one verse. It is established by Matthew 28:19, John 1:1, John 10:30, Acts 5:3-4, 2 Corinthians 13:14, Colossians 2:9, and dozens of other passages.\n\nThe honesty of textual criticism actually strengthens confidence in the Bible. Scholars identify additions precisely because they have such overwhelming manuscript evidence to compare. A text tradition that can detect and flag a medieval interpolation is a text tradition that can be trusted.`,
    keyVerse: { ref: "Matthew 28:19", text: "baptizing them in the name of the Father, and of the Son, and of the Holy Ghost" },
    category: "Textual Criticism", color: "#B45309",
    difficulty: "advanced", related: [82, 1],
    debateOptions: [
      { text: "Removing 1 John 5:7 undermines the biblical basis for the Trinity", correct: false },
      { text: "The Comma is absent from all Greek MSS before the 14th century and all early church fathers. But the Trinity is established by Matthew 28:19, John 1:1, John 10:30, and dozens more. Detecting interpolations proves the text tradition is trustworthy", correct: true },
      { text: "1 John 5:7 is original and should be in every Bible translation", correct: false },
    ],
  },
  {
    id: 84, icon: "\u{1F4D6}", title: "The Long Ending of Mark",
    question: "Mark 16:9-20 was added later \u2014 the original ending was lost.",
    objection: "Mark's Gospel originally ended at 16:8. The resurrection appearances were invented by later scribes.",
    answer: `The long ending of Mark (16:9-20) is absent from Codex Sinaiticus and Codex Vaticanus, the two oldest near-complete Greek manuscripts. Most scholars agree that it was not written by Mark and was added by a later scribe \u2014 probably in the 2nd century.\n\nBut this observation is far less damaging than critics suggest. First, Mark 16:8 does not deny the resurrection \u2014 it affirms it. The young man at the tomb declares: "He is risen; he is not here: behold the place where they laid him" (Mark 16:6). The resurrection is proclaimed in Mark's original ending.\n\nSecond, the abrupt ending at 16:8 ("for they were afraid") may be intentional. Scholar N.T. Wright argues this is a dramatic literary device: Mark's audience already knew the rest of the story from oral tradition and the other Gospels. The abrupt ending functions as a challenge: the women were afraid \u2014 will you be?\n\nThird, the resurrection appearances that the long ending describes are independently attested by Matthew, Luke, John, and Paul (1 Corinthians 15:3-8). Removing Mark 16:9-20 removes zero resurrection evidence. The appearances are multiply attested in sources that do not depend on Mark's ending.\n\nThe textual issue with Mark's ending actually demonstrates the integrity of textual criticism: scholars can identify exactly what was original and what was added, giving us greater confidence in the text we do have.`,
    keyVerse: { ref: "Mark 16:6", text: "He is risen; he is not here: behold the place where they laid him." },
    category: "Textual Criticism", color: "#B45309",
    difficulty: "intermediate", related: [83, 85],
    debateOptions: [
      { text: "Mark's original ending at 16:8 shows the resurrection was not part of the earliest tradition", correct: false },
      { text: "Mark 16:6-8 already proclaims 'He is risen.' The resurrection appearances are independently attested by Matthew, Luke, John, and Paul. Removing the long ending removes zero evidence. The abrupt ending may be an intentional literary device", correct: true },
      { text: "The long ending is original to Mark and should be treated as fully authoritative", correct: false },
    ],
  },
  {
    id: 85, icon: "\u{1F4D6}", title: "The Woman Caught in Adultery",
    question: "John 7:53-8:11 wasn't in the original Gospel \u2014 Jesus never said 'cast the first stone.'",
    objection: "If this famous story was added later, how can we trust any part of the Gospels?",
    answer: `The Pericope Adulterae (John 7:53-8:11) is indeed absent from the earliest and best Greek manuscripts. It is missing from P66, P75, Codex Sinaiticus, and Codex Vaticanus. When it does appear in later manuscripts, it is placed in different locations \u2014 some put it after John 7:52, others after John 21:25, and some place it in Luke's Gospel.\n\nHowever, the story is ancient. Papias (early 2nd century) appears to reference it, and it circulated as an independent tradition from very early. Augustine suggested it was removed by scribes who feared it would encourage lax attitudes toward adultery \u2014 a plausible explanation for its omission from early copies.\n\nThe critical point: even if this passage is not original to John's Gospel, its theological content is entirely consistent with everything else Jesus teaches. His response \u2014 showing mercy to the sinner while not condoning the sin ("go, and sin no more") \u2014 is perfectly aligned with his character as portrayed in all four Gospels.\n\nMore importantly, the ability to identify this passage as a later addition demonstrates the extraordinary precision of textual criticism. Far from undermining confidence, it shows that scholars can distinguish original text from additions with remarkable accuracy. If the entire New Testament were unreliable, this kind of fine-grained analysis would be impossible.`,
    keyVerse: { ref: "John 8:7", text: "He that is without sin among you, let him first cast a stone at her." },
    category: "Textual Criticism", color: "#B45309",
    difficulty: "intermediate", related: [84, 83],
    debateOptions: [
      { text: "If this story was added later, the Gospels can't be trusted", correct: false },
      { text: "The story is ancient (Papias, 2nd century) and theologically consistent with Jesus' character. Its identification as a later addition proves textual criticism works with precision \u2014 strengthening, not undermining, confidence in the rest of the text", correct: true },
      { text: "This passage is definitely original to John and its absence from early MSS is a copying error", correct: false },
    ],
  },
  {
    id: 86, icon: "\u2696\uFE0F", title: "Karma vs Grace",
    question: "Karma is a fairer system than grace.",
    objection: "You get what you deserve under karma. Grace lets bad people off the hook \u2014 that's unjust.",
    answer: `Karma, in its various formulations, operates on strict moral causation: you reap exactly what you sow, across lifetimes. Grace operates on unmerited favour: you receive what you do not deserve. The question is which system better addresses the human condition.\n\nFirst, a strict karmic system offers no escape from moral debt. If every wrong requires proportional suffering, the cycle is endless \u2014 no amount of good deeds in a future life can undo the wrongs of a past one, because the good deeds themselves must be "paid for" by previous merit. The system has no mechanism for genuine forgiveness \u2014 only redistribution of consequences.\n\nGrace does not "let bad people off the hook." The penalty for sin was paid in full at the cross. Romans 3:26 says God is simultaneously "just, and the justifier." Justice is satisfied \u2014 the debt is not ignored but absorbed by God himself. Grace is not the absence of justice; it is justice satisfied by a substitute.\n\nSecond, karma has no concept of a personal God who loves the individual. It is an impersonal law, like gravity. Grace is inherently personal \u2014 it requires a person who chooses to forgive. "God so loved the world, that he gave his only begotten Son" (John 3:16). The Gospel is not a system \u2014 it is a person (Jesus) offering a relationship.\n\nAs Tim Keller observes: every other religion says "do this and you will be accepted." Christianity alone says "you are accepted \u2014 now do this." The order is reversed, and the reversal changes everything.`,
    keyVerse: { ref: "Romans 6:23", text: "For the wages of sin is death; but the gift of God is eternal life through Jesus Christ our Lord." },
    category: "World Religions Compared", color: "#6D28D9",
    difficulty: "intermediate", related: [27, 87],
    debateOptions: [
      { text: "Karma is fairer because everyone gets exactly what they deserve \u2014 no favouritism", correct: false },
      { text: "Karma offers no mechanism for genuine forgiveness \u2014 only redistribution. Grace satisfies justice at the cross (Romans 3:26). Every other system says 'do this and be accepted' \u2014 Christianity says 'you are accepted, now do this'", correct: true },
      { text: "Grace and karma are both valid systems \u2014 God uses both depending on the situation", correct: false },
    ],
  },
  {
    id: 87, icon: "\u{1F504}", title: "Reincarnation vs Resurrection",
    question: "Reincarnation makes more sense than resurrection.",
    objection: "Many cultures believe in reincarnation. Resurrection is unique to Christianity and therefore less likely to be true.",
    answer: `Reincarnation and resurrection offer fundamentally incompatible views of the body, the person, and the goal of existence.\n\nReincarnation treats the body as disposable \u2014 a temporary vehicle discarded at death and replaced by another. The self cycles through bodies without ultimate attachment to any of them. Resurrection, by contrast, treats the body as essential to personhood: "it is sown a natural body; it is raised a spiritual body" (1 Corinthians 15:44). The same body is transformed, not discarded. Your body matters.\n\nThe goal of reincarnation is escape from the physical world entirely \u2014 achieving moksha (Hinduism) or nirvana (Buddhism), where individual identity dissolves. The goal of resurrection is a renewed physical world \u2014 "new heavens and a new earth" (Revelation 21:1) \u2014 where redeemed individuals live forever in transformed bodies.\n\nThe evidence question is decisive. Reincarnation is unfalsifiable \u2014 there is no way to verify or disprove past-life claims. Resurrection makes a specific historical claim: Jesus of Nazareth died, was buried, and was physically seen alive again by over 500 witnesses (1 Corinthians 15:6). It is testable, and the evidence \u2014 as N.T. Wright and Gary Habermas have demonstrated \u2014 is compelling.\n\nThe fact that resurrection is unique is not a weakness \u2014 it is a strength. Truth does not require popularity. If something actually happened in history, it does not need cultural parallels to be true.`,
    keyVerse: { ref: "Hebrews 9:27", text: "And as it is appointed unto men once to die, but after this the judgment" },
    category: "World Religions Compared", color: "#6D28D9",
    difficulty: "intermediate", related: [86, 11],
    debateOptions: [
      { text: "Reincarnation is more widely believed across cultures, making it more likely to be true", correct: false },
      { text: "Reincarnation is unfalsifiable and treats the body as disposable. Resurrection makes a testable historical claim confirmed by 500+ witnesses. Hebrews 9:27: 'appointed unto men once to die.' Uniqueness is a strength, not a weakness", correct: true },
      { text: "Both reincarnation and resurrection could be true \u2014 perhaps souls reincarnate until the final resurrection", correct: false },
    ],
  },
  {
    id: 88, icon: "\u{1F30D}", title: "Pantheism vs Personal God",
    question: "God is everything and everything is God.",
    objection: "The universe itself is divine. There is no need for a separate Creator \u2014 we are all part of God.",
    answer: `Pantheism \u2014 the belief that God and the universe are identical \u2014 faces philosophical problems that monotheism does not.\n\nFirst, if everything is God, then evil is God. The tsunami, the cancer, the genocide \u2014 all are expressions of the divine. Pantheism cannot coherently condemn evil without condemning part of God. Christianity, by distinguishing Creator from creation, can affirm that creation is good (Genesis 1:31) while acknowledging it has been corrupted by rebellion \u2014 a problem with a solution (redemption), not an eternal feature of the divine.\n\nSecond, pantheism eliminates personhood. If God is the impersonal totality of all things, then "God" has no will, no intentions, no capacity for relationship. But the deepest human intuitions \u2014 love, justice, meaning \u2014 presuppose a personal source. An impersonal universe cannot ground personal values.\n\nThird, the universe began to exist (the Big Bang, Borde-Guth-Vilenkin theorem). If the universe is God, then God began to exist \u2014 which means God is not eternal, not necessary, and not the ultimate explanation for anything. A God who began to exist is no God at all.\n\nScripture is clear: "In the beginning God created the heaven and the earth" (Genesis 1:1). God is not the universe \u2014 he made the universe. He is transcendent (above and beyond creation) and immanent (present within it) \u2014 but he is not identical to it.`,
    keyVerse: { ref: "Acts 17:28", text: "For in him we live, and move, and have our being" },
    category: "World Religions Compared", color: "#6D28D9",
    difficulty: "intermediate", related: [20, 36],
    debateOptions: [
      { text: "We are all part of the divine \u2014 separation between God and creation is an illusion", correct: false },
      { text: "If everything is God, evil is God. An impersonal totality cannot ground personal values. The universe began (Big Bang) \u2014 a God who began to exist is no God. Scripture distinguishes Creator from creation", correct: true },
      { text: "God is both personal and identical to the universe \u2014 panentheism resolves the tension", correct: false },
    ],
  },
  {
    id: 89, icon: "\u{1F9D8}", title: "The Problem of Religious Experience",
    question: "People in all religions have spiritual experiences \u2014 that proves no single religion is true.",
    objection: "If Hindus, Muslims, Buddhists, and Christians all have powerful spiritual experiences, no religion can claim exclusive truth.",
    answer: `The argument from religious experience proves too much and too little. It proves too much because mutually contradictory experiences cannot all be true simultaneously. It proves too little because the existence of experience does not determine its source or interpretation.\n\nA Hindu who experiences oneness with Brahman and a Christian who experiences the personal love of Christ are having real experiences \u2014 but they are interpreting them within different frameworks. The experience itself does not validate the framework. A person with a high fever may sincerely experience hallucinations \u2014 the experience is real, but the interpretation (that the hallucinations represent reality) is false.\n\nThe question is not "who has experiences?" but "which interpretive framework best accounts for reality?" Christianity does not deny that people in other religions have genuine spiritual experiences. It claims that the fullest and truest interpretation of those experiences is found in the God who revealed himself in Christ.\n\nC.S. Lewis addressed this in Mere Christianity: "If you are a Christian you do not have to believe that all the other religions are simply wrong all through... If you are a Christian, you are free to think that all those religions, even the queerest ones, contain at least some hint of the truth." The question is not whether other religions contain truth, but where the fullest revelation of truth is found \u2014 and Christianity claims that is in the person of Jesus Christ.`,
    keyVerse: { ref: "John 1:9", text: "That was the true Light, which lighteth every man that cometh into the world." },
    category: "World Religions Compared", color: "#6D28D9",
    difficulty: "advanced", related: [13, 90],
    debateOptions: [
      { text: "The universality of religious experience proves all religions are equally true", correct: false },
      { text: "Mutually contradictory experiences can't all be true. Real experience doesn't validate the interpretive framework. Lewis: other religions may contain hints of truth, but the fullest revelation is in Christ", correct: true },
      { text: "Religious experiences are purely neurological and prove nothing about any God", correct: false },
    ],
  },
  {
    id: 90, icon: "\u{1F6E4}\uFE0F", title: "'All Paths Lead to God' \u2014 Examined",
    question: "All religions are different paths up the same mountain.",
    objection: "It doesn't matter what you believe, as long as you're sincere. All paths lead to the same destination.",
    answer: `This statement sounds tolerant but is actually deeply intolerant \u2014 because it overrides what each religion actually claims about itself.\n\nBuddhism says there is no God. Islam says God is one and Jesus was not divine. Hinduism says God is everything. Christianity says God is Trinity and Jesus is the only way. These are not different paths up the same mountain \u2014 they are different mountains. To say "all paths lead to God" requires telling the Buddhist "you're wrong about there being no God," the Muslim "you're wrong about Jesus," and the Christian "you're wrong about exclusivity." The "all paths" claim is itself an exclusive truth claim that contradicts most of the religions it claims to honour.\n\nThe "mountain" metaphor also fails logically. It assumes the destination is the same. But Christianity says the destination is personal relationship with the Triune God through Jesus. Buddhism says the destination is the cessation of desire (nirvana). Hinduism says it's absorption into Brahman. These are radically different destinations.\n\nSincerity is not a measure of truth. A person can be sincerely wrong. A patient who sincerely believes sugar will cure their cancer is sincere \u2014 but sincerity does not change the chemistry. Truth is not determined by the intensity of belief but by correspondence with reality.\n\nJesus said: "I am the way, the truth, and the life: no man cometh unto the Father, but by me" (John 14:6). The claim is specific, historical, and testable. Either it is true, or it is not.`,
    keyVerse: { ref: "Acts 4:12", text: "Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved." },
    category: "World Religions Compared", color: "#6D28D9",
    difficulty: "beginner", related: [13, 89],
    debateOptions: [
      { text: "All religions teach basically the same thing at their core", correct: false },
      { text: "Buddhism says no God, Islam says Jesus wasn't divine, Hinduism says God is everything, Christianity says Trinity. These are different mountains, not different paths. 'All paths' is itself an exclusive claim that contradicts each religion", correct: true },
      { text: "The differences between religions are minor compared to their shared moral teachings", correct: false },
    ],
  },
  {
    id: 91, icon: "\u{1F9E0}", title: "The Ontological Argument",
    question: "You can't think God into existence.",
    objection: "The ontological argument is just wordplay. Defining God as 'the greatest being' doesn't prove he exists.",
    answer: `The ontological argument, first formulated by Anselm of Canterbury (1078) and modernised by Alvin Plantinga, is more rigorous than its critics often acknowledge.\n\nPlantinga's modal version: (1) It is possible that a maximally great being exists. (2) If it is possible that a maximally great being exists, then a maximally great being exists in some possible world. (3) If a maximally great being exists in some possible world, then it exists in every possible world (by definition of maximal greatness). (4) If it exists in every possible world, it exists in the actual world. (5) Therefore, a maximally great being exists.\n\nThe argument turns on premise (1): is it possible that a maximally great being exists? If it is even possible \u2014 if the concept is not logically contradictory \u2014 then the conclusion follows necessarily. The burden falls on the atheist to show that the concept of a maximally great being is logically impossible (like a square circle), not merely that it is unproven.\n\nCritics like Kant objected that "existence is not a predicate" \u2014 but Plantinga's version avoids this by using possible worlds semantics rather than treating existence as a property. Philosopher William Lane Craig notes that even if the argument is not persuasive to everyone, it shifts the burden of proof: the atheist must show that God's existence is impossible, not merely undemonstrated.\n\nThe ontological argument is best understood not as a standalone proof but as part of a cumulative case alongside the cosmological, teleological, and moral arguments.`,
    keyVerse: { ref: "Psalm 14:1", text: "The fool hath said in his heart, There is no God." },
    category: "Advanced Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [92, 20],
    debateOptions: [
      { text: "You can define anything into existence using this logic \u2014 it's just a word game", correct: false },
      { text: "Plantinga's modal version: if maximal greatness is even possible (not logically contradictory), it exists necessarily. The burden shifts to the atheist to show God's existence is impossible, not merely unproven", correct: true },
      { text: "The argument proves something exists but not necessarily the Christian God", correct: false },
    ],
  },
  {
    id: 92, icon: "\u{1F50D}", title: "The Contingency Argument",
    question: "The universe just exists \u2014 it doesn't need an explanation.",
    objection: "Asking 'why does the universe exist?' is a meaningless question. Things just are.",
    answer: `The contingency argument, formulated by Leibniz and championed by philosopher Alexander Pruss, runs: (1) Everything that exists has an explanation of its existence. (2) If the universe has an explanation of its existence, that explanation is a transcendent, personal being. (3) The universe exists. (4) Therefore, the universe has an explanation. (5) Therefore, a transcendent, personal being exists.\n\nThe key insight: everything in the universe is contingent \u2014 it could have been otherwise. You did not have to exist. The Earth did not have to exist. The laws of physics could have been different. Every contingent thing requires an explanation outside itself.\n\nBertrand Russell famously responded: "The universe is just there, and that's all." But this is a refusal to answer, not an answer. If we found a translucent sphere in a forest, we would demand an explanation. Making the sphere as large as the universe does not eliminate the need for explanation \u2014 it increases it.\n\nThe explanation of the universe must be something that is not itself contingent \u2014 something that exists necessarily, by its own nature. Philosopher Robert Koons argues that the only entities that could be metaphysically necessary are abstract objects (which have no causal power) or a necessary personal being (which does). Since the cause of the universe must have causal power, it must be personal.\n\nThis argument does not compete with science \u2014 it asks a question science cannot answer: not "how does the universe work?" but "why does anything exist at all?"`,
    keyVerse: { ref: "Revelation 4:11", text: "Thou art worthy, O Lord, to receive glory and honour and power: for thou hast created all things, and for thy pleasure they are and were created." },
    category: "Advanced Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [20, 91],
    debateOptions: [
      { text: "The universe doesn't need an explanation \u2014 it just exists as a brute fact", correct: false },
      { text: "Everything contingent requires an explanation outside itself. Making the sphere universe-sized doesn't remove the need for explanation. The necessary cause must be personal (having causal power), not just an abstract object", correct: true },
      { text: "The universe is eternal and therefore needs no external explanation", correct: false },
    ],
  },
  {
    id: 93, icon: "\u{1F496}", title: "The Argument from Desire",
    question: "Wanting God to exist doesn't prove he does.",
    objection: "The longing for transcendence is just a psychological need, not evidence for God.",
    answer: `C.S. Lewis formulated this argument in Mere Christianity and The Weight of Glory: every natural desire corresponds to a real object that satisfies it. Hunger points to food. Thirst points to water. Sexual desire points to sexual union. The longing for something beyond this world \u2014 what Lewis called Sehnsucht or "joy" \u2014 points to a transcendent reality.\n\n"If I find in myself a desire which no experience in this world can satisfy," Lewis wrote, "the most probable explanation is that I was made for another world." This is not wishful thinking \u2014 it is an inference from the pattern of human nature. We do not generate desires for things that do not exist.\n\nThe objection that this desire is "just psychological" assumes materialism as a premise. If humans are purely material beings, then yes \u2014 every desire is "just" biochemistry. But if the pattern holds (every innate desire has a real object), then the universal human longing for transcendence is evidence, not wishful thinking.\n\nAugustine captured it first: "Thou hast made us for thyself, O Lord, and our hearts are restless until they rest in thee." Pascal called it the "God-shaped vacuum." Peter Kreeft developed Lewis's argument further in Heaven: The Heart's Deepest Longing (1989), demonstrating that the longing for transcendence is universal across cultures, persistent across centuries, and unsatisfied by anything finite.\n\nThe argument does not prove God exists in isolation. But as part of a cumulative case \u2014 alongside the cosmological, teleological, and moral arguments \u2014 it points powerfully toward a transcendent source of meaning.`,
    keyVerse: { ref: "Ecclesiastes 3:11", text: "He hath set the world in their heart, so that no man can find out the work that God maketh from the beginning to the end." },
    category: "Advanced Philosophy", color: "#6D28D9",
    difficulty: "intermediate", related: [19, 50],
    debateOptions: [
      { text: "The desire for God is just wishful thinking \u2014 we want there to be meaning, so we invent it", correct: false },
      { text: "Lewis: every natural desire has a real object (hunger\u2192food, thirst\u2192water). The universal longing for transcendence follows the same pattern. It's an inference from human nature, not wishful thinking. Part of a cumulative case with cosmological and moral arguments", correct: true },
      { text: "The desire for transcendence can be fully explained by evolutionary psychology", correct: false },
    ],
  },
  {
    id: 94, icon: "\u{1F4A1}", title: "The Argument from Reason",
    question: "If God doesn't exist, we can still trust our reasoning.",
    objection: "Human reason evolved through natural selection. We don't need God to trust our cognitive abilities.",
    answer: `C.S. Lewis first articulated this argument in Miracles (1947) and it has been developed by Alvin Plantinga as the "Evolutionary Argument Against Naturalism" (EAAN).\n\nThe argument: if our cognitive faculties were produced entirely by unguided evolution, their purpose is survival, not truth. Natural selection rewards behaviour that helps us survive, not beliefs that are true. A creature that runs from predators survives regardless of whether its beliefs about predators are accurate.\n\nPlantinga's formulation: the probability that our cognitive faculties are reliable, given naturalism and evolution, is low or inscrutable. If we cannot trust our reasoning faculties, we cannot trust any belief produced by them \u2014 including the belief in naturalism itself. Naturalism is therefore self-defeating.\n\nDarwin himself worried about this: "With me the horrid doubt always arises whether the convictions of man's mind, which has been developed from the mind of the lower animals, are of any value or at all trustworthy." If the mind is merely a survival machine, there is no reason to trust its conclusions about anything \u2014 including evolution.\n\nTheism, by contrast, provides a straightforward grounding for reason: we can trust our minds because they were created by a rational God for the purpose of knowing truth. "Come now, and let us reason together, saith the LORD" (Isaiah 1:18). Reason is not an accident of survival \u2014 it is a gift from a rational Creator.`,
    keyVerse: { ref: "Isaiah 1:18", text: "Come now, and let us reason together, saith the LORD" },
    category: "Advanced Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [47, 19],
    debateOptions: [
      { text: "Evolution selected for reliable reasoning because accurate beliefs help us survive better", correct: false },
      { text: "Natural selection rewards survival behaviour, not true beliefs. Plantinga: the probability of reliable cognition under naturalism is low. Darwin himself worried about this. Naturalism undercuts the very reasoning used to justify it", correct: true },
      { text: "We can verify our reasoning through science, so we don't need God to ground it", correct: false },
    ],
  },
  {
    id: 95, icon: "\u{1F3D7}\uFE0F", title: "Presuppositional Apologetics",
    question: "You're just assuming the Bible is true \u2014 that's circular reasoning.",
    objection: "Presuppositional apologetics argues in a circle: the Bible is true because God says so, and God exists because the Bible says so.",
    answer: `Presuppositional apologetics, developed by Cornelius Van Til and popularised by Greg Bahnsen, makes a more sophisticated claim than the objection recognises.\n\nThe argument is not that the Bible is true because the Bible says so (that would indeed be circular). The argument is that the Christian worldview provides the only coherent foundation for logic, science, and morality \u2014 and that every other worldview borrows from Christian presuppositions without acknowledging it.\n\nFor example: the atheist assumes the universe is rational, that logic works, that science is reliable, and that moral intuitions correspond to reality. But on a materialist worldview, why should any of these be true? Why should a universe of random particles produce reliable reasoning? Why should matter "obey" mathematical laws? The presuppositionalist argues that these foundations only make sense if the universe was created by a rational, moral God.\n\nAll reasoning begins with presuppositions. The scientist presupposes that nature is uniform. The logician presupposes the laws of logic. The question is not whether you have presuppositions, but which presuppositions make the best sense of reality.\n\nBahnsen's famous debate with atheist Gordon Stein (1985) demonstrated this: Stein could not account for the laws of logic on his own worldview. The "transcendental argument for God" (TAG) is not a circular argument \u2014 it is an argument to the best explanation of why reason, science, and morality work at all.`,
    keyVerse: { ref: "Proverbs 1:7", text: "The fear of the LORD is the beginning of knowledge" },
    category: "Advanced Philosophy", color: "#6D28D9",
    difficulty: "advanced", related: [94, 19],
    debateOptions: [
      { text: "Presuppositional apologetics is just circular reasoning dressed up in philosophy", correct: false },
      { text: "The argument is not 'Bible says so' \u2014 it's that logic, science, and morality only make sense within a theistic framework. All reasoning starts with presuppositions. The question is which ones best explain why reason works at all", correct: true },
      { text: "Classical apologetics (evidence-based) is always superior to presuppositional approaches", correct: false },
    ],
  },
  {
    id: 96, icon: "\u26EA", title: "Why Go to Church?",
    question: "I can worship God on my own. I don't need organised religion.",
    objection: "The church is full of hypocrites. I can be a Christian without attending church.",
    answer: `The "church is full of hypocrites" observation is true \u2014 and the Bible says so repeatedly. Jesus' harshest words were for religious hypocrites (Matthew 23). But the presence of hypocrisy does not disprove the faith \u2014 it confirms it. Christianity teaches that all people are sinners in need of grace. A church full of imperfect people is exactly what the Gospel predicts.\n\nThe New Testament knows nothing of solitary Christianity. Hebrews 10:25 explicitly commands: "Not forsaking the assembling of ourselves together." The entire structure of the New Testament \u2014 the letters to churches, the "one another" commands (love one another, bear one another's burdens, confess faults one to another) \u2014 presupposes a community of believers, not isolated individuals.\n\nPaul uses the metaphor of a body: "For as the body is one, and hath many members... so also is Christ" (1 Corinthians 12:12). An isolated Christian is like an organ separated from the body \u2014 it may function briefly, but it cannot thrive. Faith is inherently communal because God himself is communal (Trinity).\n\nThe church also provides accountability (Galatians 6:1-2), teaching (Ephesians 4:11-12), sacraments (communion, baptism), and mutual encouragement (1 Thessalonians 5:11). These cannot be replicated alone. As Dietrich Bonhoeffer wrote in Life Together: "The person who loves their dream of community will destroy community, but the person who loves those around them will create community."`,
    keyVerse: { ref: "Hebrews 10:25", text: "Not forsaking the assembling of ourselves together, as the manner of some is; but exhorting one another" },
    category: "Practical Christian Life", color: "#059669",
    difficulty: "beginner", related: [35, 97],
    debateOptions: [
      { text: "The church is full of hypocrites \u2014 you're better off worshipping God alone", correct: false },
      { text: "Hebrews 10:25 commands gathering. The NT 'one another' commands presuppose community. Paul's body metaphor: an organ separated from the body cannot thrive. Accountability, teaching, and sacraments require community", correct: true },
      { text: "Church is helpful but entirely optional \u2014 salvation doesn't require it", correct: false },
    ],
  },
  {
    id: 97, icon: "\u2753", title: "The Problem of Unanswered Prayer",
    question: "I prayed and God didn't answer. He either doesn't care or doesn't exist.",
    objection: "If God promises to answer prayer, why do so many prayers go unanswered?",
    answer: `This is one of the most personally painful objections, and it deserves empathy before it receives theology.\n\nFirst, "unanswered" prayer is not the same as "no" prayer. Sometimes God answers no \u2014 and no is an answer. Paul prayed three times for his "thorn in the flesh" to be removed, and God's answer was: "My grace is sufficient for thee: for my strength is made perfect in weakness" (2 Corinthians 12:9). The prayer was heard, taken seriously, and answered \u2014 just not with the answer Paul wanted.\n\nSecond, the promises about prayer have conditions that are often overlooked. 1 John 5:14: "if we ask any thing according to his will, he heareth us." James 4:3: "Ye ask, and receive not, because ye ask amiss." John 15:7: "If ye abide in me, and my words abide in you, ye shall ask what ye will." The promises are conditional on alignment with God's will, right motives, and an abiding relationship.\n\nThird, our perspective is limited. We see the present; God sees the whole story. A child who prays for candy for dinner is sincere \u2014 but a loving parent says no because they see what the child cannot. C.S. Lewis: "If God had granted all the silly prayers I've made in my life, where should I be now?"\n\nFinally, Jesus himself experienced "unanswered" prayer. In Gethsemane he prayed: "if it be possible, let this cup pass from me." The cup did not pass. The answer was the cross \u2014 and the cross became the greatest act of love in history. God's "no" was better than our "yes."`,
    keyVerse: { ref: "2 Corinthians 12:9", text: "My grace is sufficient for thee: for my strength is made perfect in weakness." },
    category: "Practical Christian Life", color: "#059669",
    difficulty: "beginner", related: [76, 17],
    debateOptions: [
      { text: "Unanswered prayer proves God either doesn't exist or doesn't care about us", correct: false },
      { text: "'No' is an answer. Promises are conditional on God's will (1 John 5:14) and right motives (James 4:3). Our perspective is limited. Jesus himself experienced 'unanswered' prayer in Gethsemane \u2014 and the 'no' became the greatest act of love in history", correct: true },
      { text: "All sincere prayers are always answered if you have enough faith", correct: false },
    ],
  },
  {
    id: 98, icon: "\u{1F4D6}", title: "How to Read the Bible",
    question: "The Bible is too confusing to understand. You need experts to interpret it for you.",
    objection: "Ordinary people can't understand the Bible without seminary training. It's too complex and contradictory.",
    answer: `The Reformers called it the "perspicuity of Scripture" \u2014 the clarity of the Bible on essential matters of faith and salvation. The core message \u2014 that God created us, we sinned, Christ died for us, and we are saved by grace through faith \u2014 is clear to any literate reader.\n\nWilliam Tyndale, who gave his life translating the Bible into English, said to a clergyman: "If God spare my life, ere many years I will cause a boy that driveth the plough shall know more of the Scripture than thou doest." The entire Protestant Reformation was built on the conviction that ordinary people could read and understand God's Word.\n\nThat said, the Bible is also a library of 66 books written across 1,500 years in three languages (Hebrew, Aramaic, Greek), spanning multiple genres (history, poetry, prophecy, law, letters, apocalyptic). Understanding context \u2014 who wrote it, to whom, and why \u2014 is important for interpreting difficult passages.\n\nPractical principles: (1) Start with the clear passages before tackling the obscure (let Scripture interpret Scripture). (2) Read in context \u2014 chapter, book, and historical setting. (3) Distinguish genre: a psalm is poetry, not a science textbook. (4) Ask: what did this mean to the original audience? (5) Use study tools (cross-references, concordances) to compare passages.\n\nThe Holy Spirit is the ultimate interpreter: "when he, the Spirit of truth, is come, he will guide you into all truth" (John 16:13). You do not need a PhD to understand the Bible \u2014 you need a humble heart and the willingness to read.`,
    keyVerse: { ref: "Psalm 119:105", text: "Thy word is a lamp unto my feet, and a light unto my path." },
    category: "Practical Christian Life", color: "#059669",
    difficulty: "beginner", related: [40, 47],
    debateOptions: [
      { text: "The Bible is too complex for ordinary people \u2014 only trained theologians can interpret it correctly", correct: false },
      { text: "The core message is clear to any reader. Context and genre awareness help with difficult passages. The Reformation was built on ordinary people reading Scripture. The Holy Spirit guides understanding (John 16:13)", correct: true },
      { text: "Every passage of the Bible has only one obvious meaning that any reader can immediately grasp", correct: false },
    ],
  },
  {
    id: 99, icon: "\u{1F52C}", title: "Can Science & Faith Coexist?",
    question: "Science and religion are fundamentally incompatible.",
    objection: "Science deals with facts; religion deals with feelings. They occupy different domains and should never mix.",
    answer: `The "warfare" narrative between science and religion was invented in the late 19th century by Andrew Dickson White (A History of the Warfare of Science with Theology, 1896) and John William Draper. Historians of science have thoroughly debunked it. As Ronald Numbers, a secular historian, writes: "The greatest myth in the history of science and religion holds that they have been in a state of constant conflict."\n\nThe historical reality: modern science was born from a Christian worldview. The first universities were founded by the church. The scientific method was developed by Roger Bacon (a Franciscan friar), Francis Bacon (a devout Anglican), and Galileo (who said the Bible and nature are both God's books). Newton wrote more theology than physics. Faraday, Maxwell, Pasteur, Mendel, Lema\u00EEtre \u2014 all practising Christians.\n\nWhy? Because the Christian worldview provides the foundational assumptions science requires: (1) the universe is rational (because a rational God made it); (2) the universe is contingent (it didn't have to be this way, so we must observe it); (3) humans can understand the universe (because we are made in the image of a rational God). These assumptions are not available in every worldview. Pantheism (everything is divine) discourages investigation. Polytheism (capricious gods) undermines natural law.\n\nScience answers "how does it work?" Faith answers "why does it exist?" These are complementary questions, not competing ones. As Galileo himself wrote: "The Bible teaches us how to go to heaven, not how the heavens go."`,
    keyVerse: { ref: "Proverbs 25:2", text: "It is the glory of God to conceal a thing: but the honour of kings is to search out a matter." },
    category: "Practical Christian Life", color: "#059669",
    difficulty: "beginner", related: [14, 47],
    debateOptions: [
      { text: "Science and religion are fundamentally at war \u2014 you must choose one or the other", correct: false },
      { text: "The warfare myth was debunked by historians. Modern science was born from Christian assumptions (rational universe, contingent nature, human reason). Newton, Faraday, Maxwell, Pasteur, Mendel, Lema\u00EEtre \u2014 all Christians. 'How' and 'why' are complementary questions", correct: true },
      { text: "Science and faith never overlap \u2014 they deal with completely separate domains with no interaction", correct: false },
    ],
  },
  {
    id: 100, icon: "\u{1F4E3}", title: "Why Share the Gospel?",
    question: "Why do Christians try to convert everyone? It's arrogant and pushy.",
    objection: "Keep your beliefs to yourself. Evangelism is just religious imperialism.",
    answer: `If a doctor discovered the cure for a deadly disease, would we call them "pushy" for telling people about it? The motivation behind evangelism is not arrogance \u2014 it is love. Christians share the Gospel because they genuinely believe it is the most important truth in the universe.\n\nJesus commanded it: "Go ye into all the world, and preach the gospel to every creature" (Mark 16:15). This is not optional \u2014 it is the Great Commission. But the manner matters: "be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear" (1 Peter 3:15). Gentleness and respect are required.\n\nThe charge of "imperialism" confuses method with motive. Forced conversion is evil \u2014 and it violates Jesus' own teaching. The Gospel is an invitation, not a compulsion: "Behold, I stand at the door, and knock: if any man hear my voice, and open the door, I will come in to him" (Revelation 3:20). Jesus knocks \u2014 he does not break in.\n\nPenn Jillette, a famous atheist, made a striking observation: "How much do you have to hate somebody to believe that everlasting life is possible and not tell them that?" If Christians truly believe what they say they believe \u2014 that Jesus offers forgiveness, hope, and eternal life \u2014 then not sharing it would be the real act of cruelty.\n\nThe Gospel is not "our belief" being imposed on others. It is news \u2014 good news \u2014 being offered to anyone who will listen. News is not arrogant. News is generous.`,
    keyVerse: { ref: "1 Peter 3:15", text: "be ready always to give an answer to every man that asketh you a reason of the hope that is in you with meekness and fear" },
    category: "Practical Christian Life", color: "#059669",
    difficulty: "beginner", related: [13, 96],
    debateOptions: [
      { text: "Evangelism is just religious imperialism \u2014 Christians should keep their beliefs private", correct: false },
      { text: "If the Gospel is true, not sharing it would be cruel. Penn Jillette: 'How much do you have to hate somebody to not tell them?' Jesus commands gentleness (1 Peter 3:15). The Gospel is an invitation, not a compulsion (Revelation 3:20)", correct: true },
      { text: "Christians should only share their faith when directly asked \u2014 never initiate the conversation", correct: false },
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
  const [searchQuery, setSearchQuery] = useState("");
  const searchTimeout = useRef(null);
  const [debouncedSearch, setDebouncedSearch] = useState("");
  const [vaultOpen, setVaultOpen] = useState(false);

  const modalRef = useRef(null);
  const closeBtnRef = useRef(null);
  const triggerRef = useRef(null);

  // ── Debounced search ──
  useEffect(() => {
    if (searchTimeout.current) clearTimeout(searchTimeout.current);
    searchTimeout.current = setTimeout(() => setDebouncedSearch(searchQuery.toLowerCase().trim()), 300);
    return () => { if (searchTimeout.current) clearTimeout(searchTimeout.current); };
  }, [searchQuery]);

  const topic = APOLOGETICS_TOPICS.find(t => t.id === selected);
  const categories = ["All", ...CATEGORIES_LIST];
  const visible = useMemo(() => {
    let list = filterCat === "All" ? APOLOGETICS_TOPICS : APOLOGETICS_TOPICS.filter(t => t.category === filterCat);
    if (debouncedSearch) {
      list = list.filter(t =>
        t.title.toLowerCase().includes(debouncedSearch) ||
        t.objection.toLowerCase().includes(debouncedSearch) ||
        t.category.toLowerCase().includes(debouncedSearch) ||
        t.keyVerse.ref.toLowerCase().includes(debouncedSearch)
      );
    }
    return list;
  }, [filterCat, debouncedSearch]);

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
        {/* ── SEARCH BAR ── */}
        <div style={{ position:"relative", marginBottom:12 }}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke={st.muted} strokeWidth="2" strokeLinecap="round" style={{ position:"absolute", left:12, top:"50%", transform:"translateY(-50%)", pointerEvents:"none" }}><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          <input
            type="text"
            value={searchQuery}
            onChange={e => setSearchQuery(e.target.value)}
            placeholder="Search topics, objections, verses..."
            aria-label="Search apologetics topics"
            style={{
              width:"100%", padding:"10px 12px 10px 34px", borderRadius:10,
              border:`1.5px solid ${st.divider}`, background: st.card,
              fontFamily: st.body, fontSize:13, color: st.text,
              outline:"none", boxSizing:"border-box",
            }}
          />
          {searchQuery && (
            <button onClick={() => setSearchQuery("")} aria-label="Clear search" style={{
              position:"absolute", right:8, top:"50%", transform:"translateY(-50%)",
              background:"none", border:"none", cursor:"pointer", color: st.muted, fontSize:16, padding:4,
            }}>{"\u00D7"}</button>
          )}
        </div>
        <p style={{ fontFamily: st.ui, fontSize:12, color: st.muted, margin:"0 0 14px", fontStyle:"italic" }}>
          {debouncedSearch
            ? `${visible.length} result${visible.length !== 1 ? "s" : ""} for \u201C${debouncedSearch}\u201D`
            : `${visible.length} defense${visible.length !== 1 ? "s" : ""} \u00B7 tap a card to be challenged`}
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

      {/* ══ EVIDENCE VAULT ══ */}
      <div style={{ padding:`0 ${bp.pad}px 32px`, maxWidth:bp.contentWide, margin:"0 auto" }}>
        <button onClick={() => setVaultOpen(v => !v)} aria-expanded={vaultOpen} aria-controls="evidence-vault" style={{
          width:"100%", display:"flex", alignItems:"center", justifyContent:"space-between",
          padding:"14px 16px", borderRadius:12, cursor:"pointer",
          background: `${st.accent}0A`, border:`1.5px solid ${st.accentBorder}`,
          fontFamily: st.heading, fontSize:14, fontWeight:700, color: st.accent,
        }}>
          <span>{"\u{1F5DD}"} Evidence Vault</span>
          <span style={{ fontSize:18, transition:"transform 0.2s", transform: vaultOpen ? "rotate(180deg)" : "rotate(0)" }}>{"\u25BE"}</span>
        </button>
        {vaultOpen && (
          <div id="evidence-vault" style={{ display:"grid", gridTemplateColumns:"1fr 1fr", gap:10, marginTop:12, animation:"fadeIn 0.3s ease" }}>
            {[
              { icon: "\u{1F4DC}", stat: "5,800+", label: "Greek NT manuscripts", src: "More than any ancient text by 10x" },
              { icon: "\u{1F4DA}", stat: "24,000+", label: "Total manuscript witnesses", src: "Greek, Latin, Syriac, Coptic, Armenian" },
              { icon: "\u{1F9EC}", stat: "99.5%", label: "Manuscript agreement", src: "No variant affects any doctrine" },
              { icon: "\u23F3", stat: "25-50 yrs", label: "NT originals → earliest copies", src: "vs. 1,000+ years for most ancient texts" },
              { icon: "\u{1F4C5}", stat: "125 AD", label: "P52 (oldest NT fragment)", src: "John 18 — within 30 years of writing" },
              { icon: "\u{1F4DC}", stat: "1947", label: "Dead Sea Scrolls discovered", src: "Isaiah scroll 1,000 years older, virtually identical" },
              { icon: "\u{1F3DB}\uFE0F", stat: "1961", label: "Pilate Stone discovered", src: "Caesarea Maritima — confirms Gospel account" },
              { icon: "\u{1F451}", stat: "1993", label: "Tel Dan Inscription", src: "'House of David' — first extra-biblical reference" },
              { icon: "\u{1F3CA}", stat: "2004", label: "Pool of Siloam excavated", src: "Exactly where John's Gospel placed it" },
              { icon: "\u{1F4A7}", stat: "2012", label: "James Ossuary acquittal", src: "7-year trial: 'James, son of Joseph, brother of Jesus'" },
              { icon: "\u{1F52D}", stat: "500+", label: "Resurrection witnesses", src: "1 Corinthians 15:6 — majority still alive when Paul wrote" },
              { icon: "\u{1F4D6}", stat: "2,000+", label: "Fulfilled prophecies", src: "J. Barton Payne's Encyclopedia of Biblical Prophecy" },
              { icon: "\u{1F9D1}\u200D\u{1F393}", stat: "N.T. Wright", label: "Resurrection scholar", src: "817-page academic case for bodily resurrection" },
              { icon: "\u{1F9D1}\u200D\u{1F393}", stat: "William Lane Craig", label: "Philosopher", src: "Kalam argument, resurrection historicity, moral argument" },
              { icon: "\u{1F9D1}\u200D\u{1F393}", stat: "Alvin Plantinga", label: "Philosopher", src: "Free Will Defense, modal ontological argument, EAAN" },
              { icon: "\u{1F4AC}", stat: "C.S. Lewis", label: "Apologist", src: "Mere Christianity, Problem of Pain, Miracles, Trilemma" },
            ].map((e, i) => (
              <div key={i} style={{
                padding:"12px", borderRadius:10, background: st.card,
                border:`1px solid ${st.divider}`,
              }}>
                <div style={{ display:"flex", alignItems:"center", gap:8, marginBottom:6 }}>
                  <span style={{ fontSize:16 }}>{e.icon}</span>
                  <span style={{ fontFamily: st.heading, fontSize:18, fontWeight:700, color: st.accent }}>{e.stat}</span>
                </div>
                <div style={{ fontFamily: st.ui, fontSize:11, fontWeight:600, color: st.text, lineHeight:1.3 }}>{e.label}</div>
                <div style={{ fontFamily: st.ui, fontSize:9, color: st.muted, marginTop:3, lineHeight:1.3 }}>{e.src}</div>
              </div>
            ))}
          </div>
        )}
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
