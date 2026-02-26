"use client";
import { useState } from "react";

// ─── Theme ────────────────────────────────────────────────────────────────────
const T = {
  bg:          "#0F172A",
  card:        "#1E293B",
  cardOpen:    "#162032",
  accent:      "#38BDF8",
  accentLight: "#0EA5E920",
  heading:     "'DM Serif Display', Georgia, serif",
  body:        "'Lora', Georgia, serif",
  ui:          "'Outfit', system-ui, sans-serif",
  text:        "#CBD5E1",
  light:       "#F1F5F9",
  muted:       "#64748B",
  divider:     "#334155",
};

const CATEGORY_COLORS = {
  "The Godhead":        { bg: "#3B0764", text: "#E9D5FF", border: "#7C3AED" },
  "The Person of Christ":{ bg: "#451A03", text: "#FDE68A", border: "#D97706" },
  "Scripture":           { bg: "#3D1A00", text: "#FDBA74", border: "#92400E" },
  "The Cross":           { bg: "#4C0519", text: "#FECDD3", border: "#E11D48" },
};

// ─── Data ─────────────────────────────────────────────────────────────────────
const APOLOGETICS_TOPICS = [
  {
    id: 1,
    icon: "🔱",
    title: "The Trinity",
    question: "Where does the Bible say God is three?",
    objection: "The word 'Trinity' never appears in the Bible. God is one, not three.",
    answer: `The word "Trinity" is a theological term summarising what Scripture teaches — just as the word "Bible" never appears in the Bible. The concept runs throughout.\n\nAt Jesus' baptism, the Father speaks from heaven, the Son stands in the water, and the Spirit descends as a dove — three distinct persons, one event (Matthew 3:16-17). Genesis 1:26 says "Let us make man in our image" — plural, from a strictly monotheistic author.\n\nThe Shema of Deuteronomy 6:4 declares God is "echad" — the Hebrew word for compound unity, the same word used when husband and wife become "one flesh" — not "yachid," which means absolute singularity.\n\nThe Great Commission baptises in one name (singular) of the Father, Son and Holy Spirit (Matthew 28:19). The Trinity is not three Gods — it is one God eternally existing in three persons.`,
    keyVerse: { ref: "Matthew 28:19", text: "baptizing them in the name of the Father, and of the Son, and of the Holy Ghost" },
    category: "The Godhead",
    color: "#7C3AED",
  },
  {
    id: 2,
    icon: "✝️",
    title: "Did Jesus Claim to Be God?",
    question: "Jesus never said 'I am God' — he only called himself the Son of God.",
    objection: "If Jesus were God, he would have said so plainly.",
    answer: `Jesus made the claim repeatedly — and his Jewish audience understood it perfectly, which is precisely why they tried to stone him.\n\nIn John 8:58, Jesus says "Before Abraham was, I AM" — directly taking the divine name God declared in Exodus 3:14. They reached for stones immediately. In John 10:30 he says "I and the Father are one" — again they tried to stone him, explaining "thou, being a man, makest thyself God" (v.33).\n\nIn Mark 2:5-7, he forgives sins — something only God can do, and the Pharisees knew it. In John 14:9 he says "He that hath seen me hath seen the Father." In Revelation 1:17 the risen Christ declares "I am the First and the Last" — the exact title God uses in Isaiah 44:6.\n\nHis enemies understood the claim perfectly. The only question is whether it is true.`,
    keyVerse: { ref: "John 8:58", text: "Before Abraham was, I am." },
    category: "The Person of Christ",
    color: "#B45309",
  },
  {
    id: 3,
    icon: "🙏",
    title: "If Jesus Is God, Why Did He Pray?",
    question: "Jesus knelt and prayed to God — that proves he is not God, just a servant.",
    objection: "God doesn't pray to himself.",
    answer: `This challenge assumes Jesus can only be one thing — either fully God or a creature who prays. But the incarnation is the key: the eternal Son of God took on human flesh (John 1:14).\n\nIn his humanity, Jesus experienced hunger, thirst, weariness, and prayer. His praying was not weakness — it was perfect submission in his human nature, modelling for us what full dependence on the Father looks like.\n\nThe Son did not cease being God when he became man — he added humanity to his divinity (Philippians 2:5-8). A king who goes undercover as a servant still bows to the throne in his servant role — that does not stop him being king.\n\nJesus prayed as man, on behalf of humanity — which is precisely why he is the perfect mediator between God and man (1 Timothy 2:5).`,
    keyVerse: { ref: "Philippians 2:7", text: "he...made himself of no reputation, and took upon him the form of a servant" },
    category: "The Person of Christ",
    color: "#065F46",
  },
  {
    id: 4,
    icon: "⏰",
    title: "Jesus Didn't Know the Hour?",
    question: "Mark 13:32 says even the Son doesn't know the day or hour — how can an all-knowing God not know something?",
    objection: "An omniscient God cannot be ignorant of anything.",
    answer: `This is one of the strongest defenses in Scripture, and it operates on two levels.\n\nFirst, the Greek word translated "know" is "oida" — whose semantic range includes not just knowing but declaring, making known, or acknowledging publicly. Paul uses the exact same word in 1 Corinthians 2:2: "I determined not to know anything among you, save Jesus Christ." Paul obviously knew his own name, his history, the Old Testament, Roman law. "Know" there means "I determined to declare nothing" — a statement of intentional focus, not ignorance.\n\nSecond, and even more powerfully — Jesus is speaking directly into the framework of Jewish betrothal culture. When a Jewish bridegroom was betrothed, he would return to his father's house to prepare a dwelling for his bride. If anyone asked "when is the wedding?" the groom's culturally understood answer was always "only my father knows" — because the father alone had the authority to announce the date.\n\nJesus uses this exact framework in John 14:2-3: "I go to prepare a place for you." He is the bridegroom. Mark 13:32 is not a statement of ignorance — it is a statement of covenantal propriety: "The announcement of that hour belongs to the Father." The risen and glorified Christ in Revelation has full knowledge again (Revelation 2:23).`,
    keyVerse: { ref: "John 14:2-3", text: "I go to prepare a place for you...I will come again, and receive you unto myself" },
    category: "The Person of Christ",
    color: "#1D4ED8",
  },
  {
    id: 5,
    icon: "👑",
    title: "The Father Is Greater — John 14:28",
    question: "Jesus said the Father is greater than him — doesn't that prove he is subordinate and not equal to God?",
    objection: "Jesus' own words place the Father above him.",
    answer: `"Greater" here refers to position, not nature. A president is greater in position than a citizen — but both are equally human. Jesus in his incarnate, humbled state was positionally subordinate to the Father: sent, obedient, voluntarily limited. But positional submission does not imply ontological inferiority.\n\nA son in a household submits to his father's authority — that does not make him less human than his father. Paul uses the same logic in 1 Corinthians 11:3 — the Father is the head of Christ in the economy of redemption — yet Colossians 2:9 declares "in him dwelleth all the fulness of the Godhead bodily." Both are simultaneously true.\n\nAlso: context matters. Jesus spoke these words to comfort disciples who were grieved he was leaving. "The Father is greater" means "I am going to a place of glory — rejoice for me." It is a statement of comfort, not a theology lecture about his subordinate nature.`,
    keyVerse: { ref: "Colossians 2:9", text: "in him dwelleth all the fulness of the Godhead bodily" },
    category: "The Godhead",
    color: "#7C3AED",
  },
  {
    id: 6,
    icon: "📜",
    title: "Has the Bible Been Corrupted?",
    question: "The Bible was written by men and copied for centuries — it must have been changed.",
    objection: "We cannot trust a book that has passed through so many human hands.",
    answer: `This is the most checkable claim in the conversation. We possess over 5,800 Greek New Testament manuscripts — more than any other ancient document by a factor of ten. Homer's Iliad has 643 manuscripts. Caesar's Gallic Wars has 10.\n\nThe gap between the NT originals and our earliest copies is 25-50 years — compared to 1,000+ years for most ancient texts. When scholars compare manuscripts across centuries and continents, they find 99.5% agreement. The variations that exist are spelling differences and word order — nothing that affects a single Christian doctrine.\n\nThe Dead Sea Scrolls, discovered in 1947, contained Isaiah scrolls 1,000 years older than anything previously known — virtually identical to what we already had.\n\nIf the Bible were corrupted, three questions demand an answer: When did it happen? Who did it? And why do thousands of manuscripts across three continents agree?`,
    keyVerse: { ref: "Isaiah 40:8", text: "the word of our God shall stand for ever" },
    category: "Scripture",
    color: "#92400E",
  },
  {
    id: 7,
    icon: "🕊️",
    title: "Is the Holy Spirit Just a Force?",
    question: "The Spirit is just God's power or energy — not an actual person.",
    objection: "Scripture never clearly says the Spirit is a distinct person.",
    answer: `Scripture consistently attributes personal qualities to the Spirit that a force cannot possess. He grieves (Ephesians 4:30) — forces do not feel grief. He teaches (John 14:26) — forces do not instruct. He intercedes with groanings (Romans 8:26) — forces do not pray. He speaks (Acts 13:2) — forces do not talk.\n\nHe can be lied to (Acts 5:3-4) — and in that same passage, lying to the Spirit is equated directly with lying to God.\n\nNotably, Jesus uses the personal pronoun "he" (Greek: ekeinos) repeatedly for the Spirit in John 14-16, even though "Spirit" (pneuma) is grammatically neuter in Greek. This is a deliberate and unusual grammatical choice — made specifically to emphasise personhood.\n\nThe Spirit is as fully personal as the Father and the Son.`,
    keyVerse: { ref: "Acts 5:3-4", text: "why hath Satan filled thine heart to lie to the Holy Ghost?...thou hast not lied unto men, but unto God" },
    category: "The Godhead",
    color: "#0369A1",
  },
  {
    id: 8,
    icon: "♾️",
    title: "Was Jesus Created?",
    question: "Colossians 1:15 calls Jesus 'the firstborn of all creation' — wasn't he the first thing God made?",
    objection: "'Firstborn' means Jesus had a beginning and is therefore a creature.",
    answer: `"Firstborn" (prototokos in Greek, bekor in Hebrew) in both cultures meant preeminent heir — not the first one born chronologically. Psalm 89:27 calls David "my firstborn" — yet David was the last-born son of Jesse. The title was about rank, inheritance, and supremacy — not birth order.\n\nColossians 1:16 answers the question immediately after: "For by him were all things created." If Jesus were part of creation, he cannot simultaneously be the one through whom all creation came into being.\n\nJohn 1:1-3 is unambiguous: "In the beginning was the Word... all things were made by him; and without him was not any thing made that was made." The word "all" (panta) is absolute — it includes everything that exists.\n\nJesus is the Creator. He cannot also be the created.`,
    keyVerse: { ref: "John 1:3", text: "All things were made by him; and without him was not any thing made that was made." },
    category: "The Person of Christ",
    color: "#B45309",
  },
  {
    id: 9,
    icon: "😢",
    title: "Did God Abandon Jesus at the Cross?",
    question: "If Jesus cried out that God forsook him, either he isn't God — or the Trinity broke apart.",
    objection: "A forsaken Jesus cannot be God.",
    answer: `Jesus is quoting Psalm 22:1 — and every Jewish listener at the cross would have known exactly what he was doing. He was reciting a Messianic psalm in his moment of deepest agony.\n\nIn his humanity, bearing the full judicial weight of sin on behalf of mankind, he experienced the withdrawal of the Father's felt presence — not an ontological separation of divine persons. It is the cry of the sin-bearer, not the dissolution of the Trinity.\n\nCrucially, Psalm 22 does not end in abandonment — it ends in triumphant resurrection vindication (vv.22-31). Jesus recited the opening line of a psalm whose conclusion is victory.\n\nAnd the Father did not ultimately abandon him: "He hath not despised nor abhorred the affliction of the afflicted; neither hath he hidden his face from him; but when he cried unto him, he heard" (Psalm 22:24).\n\nThe cross was the greatest act of love in history — not divine desertion.`,
    keyVerse: { ref: "Psalm 22:24", text: "when he cried unto him, he heard" },
    category: "The Cross",
    color: "#9F1239",
  },
  {
    id: 10,
    icon: "🔥",
    title: "No One Has Seen God — But Abraham and Moses Did?",
    question: "John 1:18 says no man has seen God — but Abraham, Moses, and Isaiah all appear to see him. Is the Bible contradicting itself?",
    objection: "The Bible contradicts itself on whether God can be seen.",
    answer: `John 1:18 contains its own answer: "No man hath seen God at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him." The one who appeared in the Old Testament theophanies was the pre-incarnate Son — the visible, approachable member of the Trinity — making God known to humanity.\n\nIsaiah 6 records the prophet seeing "the LORD" — and John 12:41 explicitly identifies this: "These things said Esaias, when he saw his [Christ's] glory, and spake of him." When Jacob wrestled with "a man" who turned out to be God (Genesis 32:24-30), that was the pre-incarnate Christ.\n\nThe Father — in his full divine essence — no human can see and live (Exodus 33:20). But the Son has always been the one through whom God makes himself visible and known.\n\nThe incarnation was not the first time the Son appeared to humanity — it was the fullest and final form of what he had been doing throughout all of history.`,
    keyVerse: { ref: "John 12:41", text: "These things said Esaias, when he saw his glory, and spake of him." },
    category: "Scripture",
    color: "#065F46",
  },
];

// ─── Component ────────────────────────────────────────────────────────────────
export default function Apologetics({ nav }) {
  const [openCard, setOpenCard] = useState(null);

  const toggle = (id) => setOpenCard(prev => prev === id ? null : id);

  return (
    <div style={{ minHeight: "100vh", background: T.bg, fontFamily: T.ui, color: T.text }}>

      {/* ── Header ── */}
      <div style={{
        background: "linear-gradient(160deg, #0F172A 0%, #0C2340 50%, #0D3D38 100%)",
        borderBottom: `1px solid ${T.divider}`,
        padding: "0",
      }}>
        {/* Back button row */}
        <div style={{ padding: "16px 20px 0" }}>
          <button
            onClick={() => nav("learn-home")}
            style={{
              background: "transparent",
              border: `1px solid ${T.divider}`,
              borderRadius: "8px",
              color: T.muted,
              fontFamily: T.ui,
              fontSize: "13px",
              padding: "6px 12px",
              cursor: "pointer",
              display: "flex",
              alignItems: "center",
              gap: "6px",
            }}
          >
            ← Learning Centre
          </button>
        </div>

        {/* Hero */}
        <div style={{ padding: "28px 24px 32px", textAlign: "center" }}>
          <div style={{ fontSize: "52px", marginBottom: "12px", filter: "drop-shadow(0 0 20px #38BDF840)" }}>🛡️</div>
          <h1 style={{
            fontFamily: T.heading,
            fontSize: "clamp(28px, 6vw, 40px)",
            fontWeight: "400",
            color: T.light,
            margin: "0 0 10px",
            letterSpacing: "-0.5px",
            lineHeight: 1.15,
          }}>
            Apologetics
          </h1>
          <p style={{
            fontFamily: T.body,
            fontSize: "clamp(13px, 3vw, 15px)",
            color: T.accent,
            margin: "0 0 6px",
            fontStyle: "italic",
            opacity: 0.9,
          }}>
            "Ready to give an answer. Ready to do it with gentleness."
          </p>
          <p style={{ fontSize: "12px", color: T.muted, margin: "0", fontFamily: T.ui }}>
            1 Peter 3:15 · {APOLOGETICS_TOPICS.length} Defenses
          </p>
        </div>

        {/* Category Legend */}
        <div style={{
          display: "flex",
          flexWrap: "wrap",
          gap: "8px",
          padding: "0 20px 20px",
          justifyContent: "center",
        }}>
          {Object.entries(CATEGORY_COLORS).map(([cat, col]) => (
            <span key={cat} style={{
              background: col.bg,
              color: col.text,
              border: `1px solid ${col.border}40`,
              borderRadius: "20px",
              fontSize: "11px",
              padding: "4px 10px",
              fontFamily: T.ui,
            }}>{cat}</span>
          ))}
        </div>
      </div>

      {/* ── Cards ── */}
      <div style={{ padding: "20px 16px 40px", maxWidth: "720px", margin: "0 auto" }}>
        {APOLOGETICS_TOPICS.map((topic) => {
          const isOpen = openCard === topic.id;
          const catColor = CATEGORY_COLORS[topic.category];
          return (
            <div
              key={topic.id}
              style={{
                background: isOpen ? T.cardOpen : T.card,
                borderRadius: "14px",
                marginBottom: "12px",
                border: isOpen
                  ? `1px solid ${topic.color}60`
                  : `1px solid ${T.divider}`,
                overflow: "hidden",
                transition: "border-color 0.2s, background 0.2s",
                boxShadow: isOpen ? `0 4px 24px ${topic.color}18` : "none",
              }}
            >
              {/* ── Collapsed Header ── */}
              <button
                onClick={() => toggle(topic.id)}
                style={{
                  width: "100%",
                  background: "transparent",
                  border: "none",
                  cursor: "pointer",
                  padding: "16px 18px",
                  textAlign: "left",
                  display: "flex",
                  alignItems: "flex-start",
                  gap: "14px",
                }}
              >
                {/* Icon circle */}
                <div style={{
                  width: "42px",
                  height: "42px",
                  minWidth: "42px",
                  borderRadius: "10px",
                  background: `${topic.color}22`,
                  border: `1px solid ${topic.color}50`,
                  display: "flex",
                  alignItems: "center",
                  justifyContent: "center",
                  fontSize: "20px",
                  marginTop: "1px",
                }}>
                  {topic.icon}
                </div>

                {/* Text block */}
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px", flexWrap: "wrap", marginBottom: "4px" }}>
                    <span style={{
                      fontFamily: T.heading,
                      fontSize: "clamp(15px, 3.5vw, 17px)",
                      color: T.light,
                      fontWeight: "400",
                      lineHeight: 1.2,
                    }}>
                      {topic.title}
                    </span>
                    <span style={{
                      background: catColor.bg,
                      color: catColor.text,
                      border: `1px solid ${catColor.border}40`,
                      borderRadius: "20px",
                      fontSize: "10px",
                      padding: "2px 8px",
                      fontFamily: T.ui,
                      whiteSpace: "nowrap",
                    }}>
                      {topic.category}
                    </span>
                  </div>
                  <p style={{
                    fontFamily: T.body,
                    fontSize: "13px",
                    color: T.muted,
                    margin: "0",
                    fontStyle: "italic",
                    lineHeight: 1.45,
                  }}>
                    "{topic.question}"
                  </p>
                </div>

                {/* Chevron */}
                <div style={{
                  color: T.muted,
                  fontSize: "16px",
                  marginTop: "4px",
                  transform: isOpen ? "rotate(180deg)" : "rotate(0deg)",
                  transition: "transform 0.25s",
                  minWidth: "20px",
                  textAlign: "center",
                }}>
                  ⌄
                </div>
              </button>

              {/* ── Expanded Body ── */}
              {isOpen && (
                <div style={{ padding: "0 18px 20px" }}>
                  {/* Divider */}
                  <div style={{ height: "1px", background: T.divider, marginBottom: "18px" }} />

                  {/* The Challenge */}
                  <div style={{
                    background: "#0F172A",
                    border: `1px solid ${T.divider}`,
                    borderLeft: `3px solid ${T.muted}`,
                    borderRadius: "8px",
                    padding: "12px 14px",
                    marginBottom: "18px",
                  }}>
                    <div style={{
                      fontSize: "10px",
                      fontFamily: T.ui,
                      color: T.muted,
                      textTransform: "uppercase",
                      letterSpacing: "1px",
                      marginBottom: "6px",
                    }}>
                      ⚠️ The Challenge
                    </div>
                    <p style={{
                      fontFamily: T.body,
                      fontSize: "14px",
                      color: T.muted,
                      fontStyle: "italic",
                      margin: "0",
                      lineHeight: 1.5,
                    }}>
                      {topic.objection}
                    </p>
                  </div>

                  {/* The Defense */}
                  <div style={{ marginBottom: "20px" }}>
                    <div style={{
                      fontSize: "10px",
                      fontFamily: T.ui,
                      color: T.accent,
                      textTransform: "uppercase",
                      letterSpacing: "1px",
                      marginBottom: "10px",
                    }}>
                      📖 The Defense
                    </div>
                    {topic.answer.split("\n\n").map((para, i) => (
                      <p key={i} style={{
                        fontFamily: T.body,
                        fontSize: "clamp(14px, 3vw, 15px)",
                        color: T.text,
                        lineHeight: 1.75,
                        margin: "0 0 14px",
                      }}>
                        {para}
                      </p>
                    ))}
                  </div>

                  {/* Key Verse */}
                  <div style={{
                    background: "#0A1628",
                    border: `1px solid ${T.accent}30`,
                    borderLeft: `4px solid ${T.accent}`,
                    borderRadius: "0 10px 10px 0",
                    padding: "14px 16px",
                  }}>
                    <div style={{
                      fontSize: "10px",
                      fontFamily: T.ui,
                      color: T.accent,
                      textTransform: "uppercase",
                      letterSpacing: "1px",
                      marginBottom: "8px",
                      opacity: 0.8,
                    }}>
                      Key Verse
                    </div>
                    <p style={{
                      fontFamily: T.heading,
                      fontSize: "clamp(15px, 3.5vw, 17px)",
                      color: T.light,
                      fontStyle: "italic",
                      margin: "0 0 8px",
                      lineHeight: 1.5,
                    }}>
                      "{topic.keyVerse.text}"
                    </p>
                    <p style={{
                      fontFamily: T.ui,
                      fontSize: "12px",
                      color: T.accent,
                      margin: "0",
                      fontWeight: "600",
                      letterSpacing: "0.3px",
                    }}>
                      — {topic.keyVerse.ref}
                    </p>
                  </div>
                </div>
              )}
            </div>
          );
        })}
      </div>

      {/* ── Footer ── */}
      <div style={{
        textAlign: "center",
        padding: "0 24px 48px",
        maxWidth: "720px",
        margin: "0 auto",
      }}>
        <div style={{
          height: "1px",
          background: `linear-gradient(90deg, transparent, ${T.divider}, transparent)`,
          marginBottom: "24px",
        }} />
        <p style={{
          fontFamily: T.body,
          fontSize: "13px",
          color: T.muted,
          fontStyle: "italic",
          margin: "0 0 6px",
          lineHeight: 1.6,
        }}>
          "But sanctify the Lord God in your hearts: and be ready always to give an answer
          to every man that asketh you a reason of the hope that is in you with meekness and fear."
        </p>
        <p style={{ fontFamily: T.ui, fontSize: "11px", color: T.muted, opacity: 0.6, margin: 0 }}>
          1 Peter 3:15
        </p>
      </div>
    </div>
  );
}