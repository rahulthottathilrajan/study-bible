"use client";
import { useState, useRef, useEffect } from "react";
import { TEEN_LESSONS } from "./TeensCurriculumData";

// ═══════════════════════════════════════════════════
// THEME — Deep Indigo
// ═══════════════════════════════════════════════════
const TC_LIGHT = {
  bg:          "#F0F1F8",
  card:        "#FFFFFF",
  hero:        "linear-gradient(135deg, #1E293B 0%, #312E81 50%, #1E1B4B 100%)",
  accent:      "#4F46E5",
  accentLight: "#EEF2FF",
  accentBorder:"rgba(79,70,229,0.25)",
  text:        "#1E293B",
  muted:       "#64748B",
  divider:     "#E2E8F0",
  heading:     "'Playfair Display','DM Serif Display','Georgia',serif",
  body:        "'Lora','Georgia',serif",
  ui:          "'Outfit','Segoe UI',sans-serif",
  hebrewBg:    "rgba(79,70,229,0.06)",
  strongsBg:   "rgba(79,70,229,0.10)",
  prophecyOT:  "#B45309",
  prophecyNT:  "#059669",
};
const TC_DARK = {
  bg:          "#0F1020",
  card:        "#1A1B2E",
  hero:        "linear-gradient(135deg, #0F172A 0%, #1E1B4B 50%, #0C0A1F 100%)",
  accent:      "#818CF8",
  accentLight: "rgba(79,70,229,0.15)",
  accentBorder:"rgba(129,140,248,0.25)",
  text:        "#CBD5E1",
  muted:       "#94A3B8",
  divider:     "rgba(79,70,229,0.2)",
  heading:     "'Playfair Display','DM Serif Display','Georgia',serif",
  body:        "'Lora','Georgia',serif",
  ui:          "'Outfit','Segoe UI',sans-serif",
  hebrewBg:    "rgba(79,70,229,0.10)",
  strongsBg:   "rgba(79,70,229,0.14)",
  prophecyOT:  "#FBBF24",
  prophecyNT:  "#34D399",
};

// ═══════════════════════════════════════════════════
// FILTER CONFIG
// ═══════════════════════════════════════════════════
const TERM_BADGES = {
  "Term 1": { bg: "#EEF2FF", color: "#4338CA", label: "Term 1 · Jan–Mar" },
  "Term 2": { bg: "#FEF3C7", color: "#92400E", label: "Term 2 · Apr–Jun" },
  "Term 3": { bg: "#FEE2E2", color: "#991B1B", label: "Term 3 · Jul–Sep" },
  "Term 4": { bg: "#F3E8FF", color: "#6B21A8", label: "Term 4 · Oct–Dec" },
};
const MONTHS = [
  { label: "All",  weeks: null },
  { label: "Jan",  weeks: [1,2,3,4] },
  { label: "Feb",  weeks: [5,6,7,8] },
  { label: "Mar",  weeks: [9,10,11,12,13] },
  { label: "Apr",  weeks: [14,15,16,17] },
  { label: "May",  weeks: [18,19,20,21] },
  { label: "Jun",  weeks: [22,23,24,25,26] },
  { label: "Jul",  weeks: [27,28,29,30] },
  { label: "Aug",  weeks: [31,32,33,34] },
  { label: "Sep",  weeks: [35,36,37,38,39] },
  { label: "Oct",  weeks: [40,41,42,43] },
  { label: "Nov",  weeks: [44,45,46,47] },
  { label: "Dec",  weeks: [48,49,50,51,52] },
];

const STATUS_COLORS = {
  "Literal Fulfilment": { color: "#059669", bg: "rgba(5,150,105,0.10)", icon: "\u2705" },
  "Typological":        { color: "#7C3AED", bg: "rgba(124,58,237,0.10)", icon: "\uD83D\uDD37" },
  "Partial":            { color: "#D4A853", bg: "rgba(212,168,83,0.12)", icon: "\uD83D\uDD36" },
  "Awaiting":           { color: "#E8625C", bg: "rgba(232,98,92,0.10)", icon: "\u23F3" },
};

// ═══════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════
export default function TeensCurriculum({ nav, darkMode }) {
  const TC = darkMode ? TC_DARK : TC_LIGHT;

  // State
  const [activeTab, setActiveTab]           = useState("lessons");
  const [selectedLesson, setSelectedLesson] = useState(null);
  const [modalOpen, setModalOpen]           = useState(false);
  const [animIn, setAnimIn]                 = useState(false);
  const [termFilter, setTermFilter]         = useState("All");
  const [monthFilter, setMonthFilter]       = useState("All");
  const [completedLessons, setCompletedLessons] = useState([]);
  const [expandedSections, setExpandedSections] = useState({});
  const [revealedHints, setRevealedHints]   = useState({});
  const [journalEntries, setJournalEntries] = useState({});
  const [journalDraft, setJournalDraft]     = useState("");
  const modalRef = useRef(null);

  // Load from localStorage
  useEffect(() => {
    try {
      const c = localStorage.getItem("teensCompletedLessons");
      if (c) setCompletedLessons(JSON.parse(c));
      const j = localStorage.getItem("teensJournalEntries");
      if (j) setJournalEntries(JSON.parse(j));
    } catch {}
  }, []);

  // Persist completed
  useEffect(() => {
    try { localStorage.setItem("teensCompletedLessons", JSON.stringify(completedLessons)); } catch {}
  }, [completedLessons]);

  // Persist journal
  useEffect(() => {
    try { localStorage.setItem("teensJournalEntries", JSON.stringify(journalEntries)); } catch {}
  }, [journalEntries]);

  // Filter
  const filteredLessons = TEEN_LESSONS.filter(l => {
    if (termFilter !== "All" && l.term !== termFilter) return false;
    const m = MONTHS.find(m => m.label === monthFilter);
    if (m && m.weeks && !m.weeks.includes(l.week)) return false;
    return true;
  });

  const completedCount = completedLessons.length;
  const progressPct = Math.round((completedCount / 52) * 100);

  // Modal helpers
  const openLesson = (lesson) => {
    setSelectedLesson(lesson);
    setModalOpen(true);
    setExpandedSections({ 0: true }); // open first section
    setRevealedHints({});
    setJournalDraft(journalEntries[lesson.week]?.text || "");
    setTimeout(() => setAnimIn(true), 20);
  };
  const closeModal = () => {
    setAnimIn(false);
    setTimeout(() => { setModalOpen(false); setSelectedLesson(null); }, 280);
  };
  const toggleSection = (i) => setExpandedSections(p => ({ ...p, [i]: !p[i] }));
  const toggleHint = (i) => setRevealedHints(p => ({ ...p, [i]: !p[i] }));
  const toggleComplete = (week) => {
    setCompletedLessons(p => p.includes(week) ? p.filter(w => w !== week) : [...p, week]);
  };
  const saveJournal = (week) => {
    if (!journalDraft.trim()) return;
    setJournalEntries(p => ({ ...p, [week]: { text: journalDraft.trim(), date: new Date().toISOString().slice(0,10) } }));
  };

  // ═══════════════════════════════════════════════════
  // SUB-COMPONENTS
  // ═══════════════════════════════════════════════════

  const Section = ({ icon, title, timing, children, index }) => {
    const open = expandedSections[index];
    return (
      <div style={{ borderBottom: `1px solid ${TC.divider}` }}>
        <button onClick={() => toggleSection(index)} style={{ width:"100%",display:"flex",alignItems:"center",gap:10,padding:"14px 16px",background:"none",border:"none",cursor:"pointer",textAlign:"left" }}>
          <span style={{ fontSize:18 }}>{icon}</span>
          <div style={{ flex:1 }}>
            <div style={{ fontFamily:TC.ui,fontSize:14,fontWeight:700,color:TC.text }}>{title}</div>
            {timing && <div style={{ fontFamily:TC.ui,fontSize:11,color:TC.muted,marginTop:1 }}>{timing}</div>}
          </div>
          <span style={{ fontSize:12,color:TC.muted,transition:"transform 0.2s",transform:open?"rotate(180deg)":"rotate(0)" }}>{"\u25BC"}</span>
        </button>
        {open && <div style={{ padding:"0 16px 16px" }}>{children}</div>}
      </div>
    );
  };

  const ScriptureBlock = ({ text, label }) => (
    <div style={{ background:darkMode?"rgba(217,119,6,0.08)":"#FFFBEB",borderLeft:`3px solid #D97706`,borderRadius:6,padding:"12px 14px",margin:"8px 0",fontFamily:TC.body,fontSize:13.5,lineHeight:1.8,color:TC.text,fontStyle:"italic",whiteSpace:"pre-line" }}>
      {label && <div style={{ fontFamily:TC.ui,fontSize:10,fontWeight:700,color:"#D97706",textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:6 }}>{label}</div>}
      {text}
    </div>
  );

  const WordStudyCard = ({ ws }) => (
    <div style={{ background:TC.hebrewBg,border:`1px solid ${TC.accentBorder}`,borderRadius:10,padding:16,margin:"8px 0" }}>
      <div style={{ textAlign:"center",marginBottom:10 }}>
        <div style={{ fontFamily:"'Times New Roman',serif",fontSize:ws.language==="Hebrew"?28:22,color:TC.accent,direction:ws.language==="Hebrew"?"rtl":"ltr",lineHeight:1.2 }}>{ws.original}</div>
        <div style={{ fontFamily:TC.ui,fontSize:13,color:TC.text,marginTop:4 }}>{ws.transliteration}</div>
        <div style={{ display:"inline-block",background:TC.strongsBg,borderRadius:4,padding:"2px 8px",fontFamily:"monospace",fontSize:11,color:TC.accent,marginTop:4 }}>{ws.strongsNumber}</div>
      </div>
      <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,marginBottom:8 }}>
        <strong>Definition:</strong> {ws.definition}
      </div>
      <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,marginBottom:8 }}>
        <strong>Usage:</strong> {ws.usage}
      </div>
      <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,marginBottom:8 }}>
        <strong>Connection:</strong> {ws.connection}
      </div>
      {ws.relatedVerses && ws.relatedVerses.length > 0 && (
        <div style={{ borderTop:`1px dashed ${TC.divider}`,paddingTop:8,marginTop:8 }}>
          <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.muted,marginBottom:6 }}>Related Verses</div>
          {ws.relatedVerses.map((v,i) => (
            <div key={i} style={{ fontFamily:TC.body,fontSize:12.5,color:TC.muted,lineHeight:1.6,marginBottom:4,paddingLeft:8,borderLeft:`2px solid ${TC.accentBorder}` }}>{v}</div>
          ))}
        </div>
      )}
    </div>
  );

  const ProphecyCard = ({ pc }) => {
    const st = STATUS_COLORS[pc.status] || STATUS_COLORS["Literal Fulfilment"];
    return (
      <div style={{ background:TC.card,border:`1px solid ${TC.divider}`,borderRadius:10,padding:16,margin:"8px 0" }}>
        <div style={{ fontFamily:TC.ui,fontSize:13,fontWeight:700,color:TC.text,marginBottom:8 }}>{pc.title}</div>
        <div style={{ background:darkMode?"rgba(180,83,9,0.1)":"#FFF7ED",borderLeft:`3px solid ${TC.prophecyOT}`,borderRadius:6,padding:"10px 12px",marginBottom:8 }}>
          <div style={{ fontFamily:TC.ui,fontSize:10,fontWeight:700,color:TC.prophecyOT,textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:4 }}>OT: {pc.otRef}</div>
          <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,fontStyle:"italic",lineHeight:1.7 }}>{pc.otText}</div>
        </div>
        <div style={{ textAlign:"center",fontSize:16,color:TC.muted,margin:"4px 0" }}>{"\u2193"} Fulfilled In {"\u2193"}</div>
        <div style={{ background:darkMode?"rgba(5,150,105,0.08)":"#F0FDF4",borderLeft:`3px solid ${TC.prophecyNT}`,borderRadius:6,padding:"10px 12px",marginBottom:8 }}>
          <div style={{ fontFamily:TC.ui,fontSize:10,fontWeight:700,color:TC.prophecyNT,textTransform:"uppercase",letterSpacing:"0.08em",marginBottom:4 }}>NT: {pc.ntRef}</div>
          <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,fontStyle:"italic",lineHeight:1.7 }}>{pc.ntText}</div>
        </div>
        <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,marginBottom:8 }}>{pc.explanation}</div>
        <div style={{ display:"inline-flex",alignItems:"center",gap:4,background:st.bg,borderRadius:6,padding:"3px 10px" }}>
          <span>{st.icon}</span>
          <span style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:st.color }}>{pc.status}</span>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // LESSON MODAL
  // ═══════════════════════════════════════════════════
  const LessonModal = () => {
    if (!selectedLesson) return null;
    const L = selectedLesson;
    const isComplete = completedLessons.includes(L.week);

    return (
      <div ref={modalRef} style={{ position:"fixed",inset:0,zIndex:999,display:"flex",flexDirection:"column",justifyContent:"flex-end",background:"rgba(0,0,0,0.5)",opacity:animIn?1:0,transition:"opacity 0.28s" }} onClick={(e) => { if (e.target === modalRef.current) closeModal(); }}>
        <div style={{ background:TC.bg,borderRadius:"18px 18px 0 0",maxHeight:"92vh",display:"flex",flexDirection:"column",transform:animIn?"translateY(0)":"translateY(100%)",transition:"transform 0.3s cubic-bezier(.32,.72,.32,1)" }}>
          {/* Sticky Header */}
          <div style={{ background:L.color,padding:"18px 16px 14px",borderRadius:"18px 18px 0 0",position:"relative",flexShrink:0 }}>
            <button onClick={closeModal} style={{ position:"absolute",top:12,right:12,background:"rgba(255,255,255,0.2)",border:"none",borderRadius:20,width:32,height:32,display:"flex",alignItems:"center",justifyContent:"center",cursor:"pointer",color:"#fff",fontSize:16 }}>{"\u2715"}</button>
            <div style={{ display:"flex",alignItems:"center",gap:8,marginBottom:6 }}>
              <span style={{ background:"rgba(255,255,255,0.2)",borderRadius:8,padding:"4px 10px",fontFamily:TC.ui,fontSize:11,fontWeight:700,color:"#fff" }}>Week {L.week}</span>
              <span style={{ fontSize:20 }}>{L.icon}</span>
            </div>
            <div style={{ fontFamily:TC.heading,fontSize:20,fontWeight:700,color:"#fff",lineHeight:1.3 }}>{L.title}</div>
            <div style={{ fontFamily:TC.ui,fontSize:12,color:"rgba(255,255,255,0.8)",marginTop:4 }}>{L.bibleRef}</div>
          </div>

          {/* Scrollable Content */}
          <div style={{ flex:1,overflowY:"auto",WebkitOverflowScrolling:"touch" }}>
            {/* Key Verse */}
            <div style={{ padding:"12px 16px",background:TC.accentLight,borderBottom:`1px solid ${TC.divider}` }}>
              <div style={{ fontFamily:TC.body,fontSize:13,fontStyle:"italic",color:TC.accent,lineHeight:1.7 }}>{L.keyVerse}</div>
            </div>

            {/* Section 1: The Hook */}
            <Section icon={"\uD83C\uDFAF"} title="The Hook" timing="5 min" index={0}>
              <div style={{ fontFamily:TC.body,fontSize:14,color:TC.text,lineHeight:1.8,fontStyle:"italic" }}>{L.hook}</div>
            </Section>

            {/* Section 2: Deep Dive */}
            <Section icon={"\uD83D\uDCD6"} title="Deep Dive into Scripture" timing="25 min" index={1}>
              <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginBottom:6 }}>Passage: {L.deepDive.passage}</div>
              <div style={{ fontFamily:TC.body,fontSize:13.5,color:TC.text,lineHeight:1.8,marginBottom:12 }}>{L.deepDive.context}</div>
              <div style={{ fontFamily:TC.ui,fontSize:12,fontWeight:700,color:TC.text,marginBottom:6 }}>Key Points:</div>
              {L.deepDive.keyPoints.map((p,i) => (
                <div key={i} style={{ display:"flex",gap:8,marginBottom:8 }}>
                  <span style={{ color:TC.accent,fontWeight:700,fontSize:13,flexShrink:0 }}>{i+1}.</span>
                  <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7 }}>{p}</div>
                </div>
              ))}
              <div style={{ background:TC.accentLight,border:`1px solid ${TC.accentBorder}`,borderRadius:8,padding:"10px 14px",marginTop:10 }}>
                <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginBottom:4 }}>{"\u26A1"} Obedience Connection</div>
                <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7 }}>{L.deepDive.obedienceLink}</div>
              </div>
            </Section>

            {/* Section 3: Word Study */}
            <Section icon={"\uD83D\uDD0D"} title="Word Study" timing="15 min" index={2}>
              <WordStudyCard ws={L.wordStudy} />
            </Section>

            {/* Section 4: Faith Story */}
            <Section icon={"\uD83D\uDCDA"} title="The Story of Faith" timing="15 min" index={3}>
              <div style={{ fontFamily:TC.ui,fontSize:15,fontWeight:700,color:TC.text,marginBottom:8 }}>{L.faithStory.title}</div>
              <div style={{ fontFamily:TC.body,fontSize:13.5,color:TC.text,lineHeight:1.8,marginBottom:12 }}>{L.faithStory.narrative}</div>
              <div style={{ background:TC.accentLight,borderRadius:8,padding:"10px 14px",borderLeft:`3px solid ${TC.accent}` }}>
                <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginBottom:4 }}>Moral Lesson</div>
                <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7 }}>{L.faithStory.moralLesson}</div>
              </div>
            </Section>

            {/* Section 5: Prophecy Connection */}
            <Section icon={"\uD83D\uDD2D"} title="Prophecy Connection" timing="10 min" index={4}>
              <ProphecyCard pc={L.prophecyConnection} />
            </Section>

            {/* Section 6: Think Deeper */}
            <Section icon={"\uD83E\uDDE0"} title="Think Deeper" timing="15 min" index={5}>
              <div style={{ fontFamily:TC.body,fontSize:14,fontWeight:700,color:TC.text,lineHeight:1.7,marginBottom:10 }}>{L.thinkDeeper.question}</div>
              <div style={{ background:darkMode?"rgba(220,38,38,0.08)":"#FEF2F2",borderLeft:`3px solid #DC2626`,borderRadius:6,padding:"10px 14px",marginBottom:12 }}>
                <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:"#DC2626",marginBottom:4 }}>{"\uD83D\uDDE1\uFE0F"} Challenge</div>
                <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7 }}>{L.thinkDeeper.challenge}</div>
              </div>
              <div style={{ fontFamily:TC.ui,fontSize:12,fontWeight:700,color:TC.text,marginBottom:6 }}>{"\uD83D\uDCA1"} Hints (tap to reveal)</div>
              {L.thinkDeeper.hints.map((h,i) => (
                <div key={i} onClick={() => toggleHint(i)} style={{ padding:"8px 12px",marginBottom:6,borderRadius:6,border:`1px solid ${TC.divider}`,cursor:"pointer",transition:"all 0.2s" }}>
                  <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,filter:revealedHints[i]?"none":"blur(5px)",transition:"filter 0.3s" }}>{h}</div>
                  {!revealedHints[i] && <div style={{ fontFamily:TC.ui,fontSize:10,color:TC.muted,textAlign:"center",marginTop:2 }}>Tap to reveal</div>}
                </div>
              ))}
              <div onClick={() => toggleHint("conclusion")} style={{ background:TC.accentLight,borderRadius:8,padding:"10px 14px",marginTop:8,cursor:"pointer" }}>
                <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginBottom:4 }}>{"\u2705"} Conclusion {!revealedHints["conclusion"] && "(tap to reveal)"}</div>
                <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,filter:revealedHints["conclusion"]?"none":"blur(5px)",transition:"filter 0.3s" }}>{L.thinkDeeper.conclusion}</div>
              </div>
            </Section>

            {/* Section 7: Discussion */}
            <Section icon={"\uD83D\uDCAC"} title="Discussion & Debate" timing="15 min" index={6}>
              {L.discussionQuestions.map((q,i) => (
                <div key={i} style={{ display:"flex",gap:8,marginBottom:10 }}>
                  <span style={{ background:TC.accent,color:"#fff",borderRadius:"50%",width:22,height:22,display:"flex",alignItems:"center",justifyContent:"center",fontSize:11,fontWeight:700,flexShrink:0 }}>{i+1}</span>
                  <div style={{ fontFamily:TC.body,fontSize:13.5,color:TC.text,lineHeight:1.7 }}>{q}</div>
                </div>
              ))}
            </Section>

            {/* Section 8: Journal */}
            <Section icon={"\uD83D\uDCD3"} title="Journal & Reflection" timing="10 min" index={7}>
              <div style={{ fontFamily:TC.body,fontSize:13.5,color:TC.text,lineHeight:1.8,marginBottom:10 }}>{L.journalPrompt.prompt}</div>
              <textarea
                value={journalDraft}
                onChange={(e) => setJournalDraft(e.target.value)}
                placeholder="Write your reflection here..."
                style={{ width:"100%",minHeight:100,border:`1px solid ${TC.divider}`,borderRadius:8,padding:12,fontFamily:TC.body,fontSize:13,color:TC.text,background:TC.bg,resize:"vertical",boxSizing:"border-box" }}
              />
              <button onClick={() => saveJournal(L.week)} style={{ marginTop:8,padding:"8px 20px",background:TC.accent,color:"#fff",border:"none",borderRadius:8,fontFamily:TC.ui,fontSize:12,fontWeight:700,cursor:"pointer" }}>
                {journalEntries[L.week] ? "Update Entry" : "Save Entry"}
              </button>
              {journalEntries[L.week] && <div style={{ fontFamily:TC.ui,fontSize:11,color:TC.muted,marginTop:4 }}>Saved on {journalEntries[L.week].date}</div>}
              <div style={{ background:TC.accentLight,borderRadius:8,padding:"10px 14px",marginTop:12,borderLeft:`3px solid ${TC.accent}` }}>
                <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginBottom:4 }}>Reflection</div>
                <div style={{ fontFamily:TC.body,fontSize:13,fontStyle:"italic",color:TC.text,lineHeight:1.7 }}>{L.journalPrompt.reflection}</div>
              </div>
            </Section>

            {/* Section 9: Memory Verse & Prayer */}
            <Section icon={"\uD83D\uDE4F"} title="Memory Verse & Prayer" timing="10 min" index={8}>
              <div style={{ background:"linear-gradient(135deg,rgba(79,70,229,0.08),rgba(124,58,237,0.06))",border:`1px solid ${TC.accentBorder}`,borderRadius:10,padding:16,textAlign:"center",marginBottom:12 }}>
                <div style={{ fontFamily:TC.ui,fontSize:10,fontWeight:700,color:TC.accent,textTransform:"uppercase",letterSpacing:"0.1em",marginBottom:6 }}>Memory Verse</div>
                <div style={{ fontFamily:TC.heading,fontSize:16,color:TC.text,lineHeight:1.6,fontStyle:"italic" }}>{L.memoryVerse}</div>
              </div>
              <div style={{ fontFamily:TC.body,fontSize:13.5,color:TC.text,lineHeight:1.8,fontStyle:"italic" }}>{L.closingPrayer}</div>
            </Section>

            {/* Leader Notes (collapsed) */}
            <Section icon={"\uD83D\uDC68\u200D\uD83C\uDFEB"} title="Leader Notes" timing="" index={9}>
              <div style={{ fontFamily:TC.body,fontSize:13,color:TC.muted,lineHeight:1.8 }}>{L.leaderNote}</div>
            </Section>

            {/* Bottom padding */}
            <div style={{ height: 80 }} />
          </div>

          {/* Sticky Footer — Mark Complete */}
          <div style={{ padding:"12px 16px",borderTop:`1px solid ${TC.divider}`,background:TC.card,flexShrink:0 }}>
            <button onClick={() => toggleComplete(L.week)} style={{ width:"100%",padding:"14px",borderRadius:10,border:"none",background:isComplete?"#059669":TC.accent,color:"#fff",fontFamily:TC.ui,fontSize:14,fontWeight:700,cursor:"pointer",transition:"all 0.2s" }}>
              {isComplete ? "\u2705 Lesson Complete" : "Mark Lesson as Complete"}
            </button>
          </div>
        </div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // LESSON CARD
  // ═══════════════════════════════════════════════════
  const LessonCard = ({ lesson }) => {
    const isComplete = completedLessons.includes(lesson.week);
    const tb = TERM_BADGES[lesson.term] || TERM_BADGES["Term 1"];
    return (
      <div onClick={() => openLesson(lesson)} style={{ background:TC.card,borderRadius:12,border:`1px solid ${TC.divider}`,borderLeft:`4px solid ${lesson.color}`,padding:"16px 14px",cursor:"pointer",position:"relative",transition:"transform 0.15s,box-shadow 0.15s" }}
        onMouseEnter={e => { e.currentTarget.style.transform="translateY(-2px)"; e.currentTarget.style.boxShadow="0 4px 12px rgba(0,0,0,0.1)"; }}
        onMouseLeave={e => { e.currentTarget.style.transform=""; e.currentTarget.style.boxShadow=""; }}
      >
        {isComplete && <div style={{ position:"absolute",top:8,right:8,fontSize:16 }}>{"\u2705"}</div>}
        <div style={{ display:"flex",alignItems:"center",gap:8,marginBottom:6 }}>
          <span style={{ background:`${lesson.color}15`,borderRadius:6,padding:"3px 8px",fontFamily:TC.ui,fontSize:10,fontWeight:700,color:lesson.color }}>Week {lesson.week}</span>
          <span style={{ fontSize:16 }}>{lesson.icon}</span>
        </div>
        <div style={{ fontFamily:TC.heading,fontSize:15,fontWeight:700,color:TC.text,lineHeight:1.3,marginBottom:4 }}>{lesson.title}</div>
        <div style={{ fontFamily:TC.ui,fontSize:11,color:TC.accent,marginBottom:4 }}>{lesson.bibleRef}</div>
        <div style={{ fontFamily:TC.body,fontSize:12,color:TC.muted,lineHeight:1.5,marginBottom:8,display:"-webkit-box",WebkitLineClamp:2,WebkitBoxOrient:"vertical",overflow:"hidden" }}>{lesson.keyVerse}</div>
        <div style={{ display:"flex",gap:6,flexWrap:"wrap" }}>
          <span style={{ background:tb.bg,color:tb.color,borderRadius:4,padding:"2px 8px",fontFamily:TC.ui,fontSize:10,fontWeight:600 }}>{lesson.term}</span>
          <span style={{ background:TC.accentLight,color:TC.accent,borderRadius:4,padding:"2px 8px",fontFamily:TC.ui,fontSize:10,fontWeight:600 }}>{lesson.theme}</span>
        </div>
        <div style={{ fontFamily:TC.ui,fontSize:11,fontWeight:700,color:TC.accent,marginTop:8 }}>View Lesson {"\u2192"}</div>
      </div>
    );
  };

  // ═══════════════════════════════════════════════════
  // MAIN RENDER
  // ═══════════════════════════════════════════════════
  return (
    <div style={{ minHeight:"100vh",background:TC.bg,paddingBottom:80 }}>
      {/* Hero */}
      <div style={{ background:TC.hero,padding:"24px 20px 20px",position:"relative" }}>
        <button onClick={() => nav("learn-home")} style={{ background:"rgba(255,255,255,0.15)",border:"none",borderRadius:8,padding:"6px 12px",color:"#fff",fontFamily:TC.ui,fontSize:12,fontWeight:600,cursor:"pointer",marginBottom:12 }}>{"\u2190"} Back</button>
        <div style={{ fontFamily:TC.heading,fontSize:26,fontWeight:700,color:"#fff",lineHeight:1.2 }}>Teens Bible Study</div>
        <div style={{ fontFamily:TC.ui,fontSize:12,color:"rgba(255,255,255,0.75)",marginTop:4 }}>52 weeks {"\u00B7"} 2-hour sessions {"\u00B7"} Ages 13–18</div>
        <div style={{ fontFamily:TC.ui,fontSize:11,color:"rgba(255,255,255,0.6)",marginTop:2,fontStyle:"italic" }}>"Ye are my friends, if ye do whatsoever I command you." — John 15:14</div>

        {/* Stats */}
        <div style={{ display:"flex",gap:8,marginTop:16 }}>
          {[
            { n: TEEN_LESSONS.length, l: "Lessons" },
            { n: "4", l: "Terms" },
            { n: "120", l: "Hours" },
            { n: completedCount, l: "Done" },
          ].map((s,i) => (
            <div key={i} style={{ flex:1,background:"rgba(255,255,255,0.1)",borderRadius:8,padding:"10px 6px",textAlign:"center" }}>
              <div style={{ fontFamily:TC.heading,fontSize:20,fontWeight:700,color:"#fff" }}>{s.n}</div>
              <div style={{ fontFamily:TC.ui,fontSize:9,color:"rgba(255,255,255,0.7)",textTransform:"uppercase",letterSpacing:"0.08em" }}>{s.l}</div>
            </div>
          ))}
        </div>

        {/* Progress bar */}
        {completedCount > 0 && (
          <div style={{ marginTop:12 }}>
            <div style={{ display:"flex",justifyContent:"space-between",fontFamily:TC.ui,fontSize:10,color:"rgba(255,255,255,0.7)",marginBottom:4 }}>
              <span>Progress</span><span>{progressPct}%</span>
            </div>
            <div style={{ height:4,background:"rgba(255,255,255,0.15)",borderRadius:4 }}>
              <div style={{ height:4,background:"#818CF8",borderRadius:4,width:`${progressPct}%`,transition:"width 0.3s" }} />
            </div>
          </div>
        )}
      </div>

      {/* Tab Bar */}
      <div style={{ display:"flex",borderBottom:`1px solid ${TC.divider}`,background:TC.card,position:"sticky",top:0,zIndex:10 }}>
        {["lessons","progress","journal"].map(t => (
          <button key={t} onClick={() => setActiveTab(t)} style={{ flex:1,padding:"12px 0",background:"none",border:"none",borderBottom:activeTab===t?`2px solid ${TC.accent}`:"2px solid transparent",fontFamily:TC.ui,fontSize:12,fontWeight:activeTab===t?700:500,color:activeTab===t?TC.accent:TC.muted,cursor:"pointer",textTransform:"capitalize",transition:"all 0.15s" }}>
            {t === "lessons" ? "\uD83D\uDCDA Lessons" : t === "progress" ? "\uD83D\uDCCA Progress" : "\uD83D\uDCD3 Journal"}
          </button>
        ))}
      </div>

      {/* Tab Content */}
      <div style={{ padding:"16px 16px 40px",maxWidth:680,margin:"0 auto" }}>

        {/* ── LESSONS TAB ── */}
        {activeTab === "lessons" && (
          <>
            {/* Term filter */}
            <div style={{ display:"flex",gap:6,marginBottom:12,flexWrap:"wrap" }}>
              {["All","Term 1","Term 2","Term 3","Term 4"].map(t => (
                <button key={t} onClick={() => setTermFilter(t)} style={{ padding:"6px 14px",borderRadius:20,border:`1px solid ${termFilter===t?TC.accent:TC.divider}`,background:termFilter===t?TC.accent:"transparent",color:termFilter===t?"#fff":TC.muted,fontFamily:TC.ui,fontSize:11,fontWeight:600,cursor:"pointer",transition:"all 0.15s" }}>{t}</button>
              ))}
            </div>
            {/* Month filter */}
            <div style={{ display:"flex",gap:4,overflowX:"auto",paddingBottom:8,marginBottom:16,WebkitOverflowScrolling:"touch" }}>
              {MONTHS.map(m => (
                <button key={m.label} onClick={() => setMonthFilter(m.label)} style={{ padding:"4px 12px",borderRadius:14,border:`1px solid ${monthFilter===m.label?TC.accent:TC.divider}`,background:monthFilter===m.label?TC.accentLight:"transparent",color:monthFilter===m.label?TC.accent:TC.muted,fontFamily:TC.ui,fontSize:10,fontWeight:600,cursor:"pointer",flexShrink:0 }}>{m.label}</button>
              ))}
            </div>
            {/* Cards */}
            <div style={{ display:"grid",gridTemplateColumns:"repeat(auto-fill,minmax(280px,1fr))",gap:12 }}>
              {filteredLessons.map(l => <LessonCard key={l.week} lesson={l} />)}
            </div>
            {filteredLessons.length === 0 && (
              <div style={{ textAlign:"center",padding:40,fontFamily:TC.ui,fontSize:13,color:TC.muted }}>
                No lessons available for this filter yet. More terms coming soon!
              </div>
            )}
          </>
        )}

        {/* ── PROGRESS TAB ── */}
        {activeTab === "progress" && (
          <div style={{ textAlign:"center" }}>
            <div style={{ fontFamily:TC.heading,fontSize:48,fontWeight:700,color:TC.accent,marginTop:20 }}>{completedCount}</div>
            <div style={{ fontFamily:TC.ui,fontSize:13,color:TC.muted }}>of 52 lessons completed</div>
            <div style={{ height:8,background:TC.divider,borderRadius:6,margin:"20px 0",maxWidth:300,marginLeft:"auto",marginRight:"auto" }}>
              <div style={{ height:8,background:TC.accent,borderRadius:6,width:`${progressPct}%`,transition:"width 0.3s" }} />
            </div>
            {completedCount === 0 && <div style={{ fontFamily:TC.body,fontSize:13,color:TC.muted,marginTop:20 }}>Start your first lesson to track progress!</div>}
            {completedCount > 0 && (
              <div style={{ textAlign:"left",marginTop:20 }}>
                <div style={{ fontFamily:TC.ui,fontSize:12,fontWeight:700,color:TC.text,marginBottom:10 }}>Completed Lessons</div>
                {TEEN_LESSONS.filter(l => completedLessons.includes(l.week)).map(l => (
                  <div key={l.week} onClick={() => openLesson(l)} style={{ display:"flex",alignItems:"center",gap:10,padding:"10px 12px",background:TC.card,borderRadius:8,border:`1px solid ${TC.divider}`,marginBottom:6,cursor:"pointer" }}>
                    <span style={{ fontSize:16 }}>{"\u2705"}</span>
                    <div>
                      <div style={{ fontFamily:TC.ui,fontSize:12,fontWeight:700,color:TC.text }}>Week {l.week}: {l.title}</div>
                      <div style={{ fontFamily:TC.ui,fontSize:10,color:TC.muted }}>{l.bibleRef}</div>
                    </div>
                  </div>
                ))}
              </div>
            )}
            {completedCount >= 52 && (
              <div style={{ background:"linear-gradient(135deg,#4F46E5,#7C3AED)",borderRadius:14,padding:24,marginTop:24,color:"#fff" }}>
                <div style={{ fontSize:32,marginBottom:8 }}>{"\uD83C\uDF93"}</div>
                <div style={{ fontFamily:TC.heading,fontSize:20,fontWeight:700 }}>Congratulations!</div>
                <div style={{ fontFamily:TC.ui,fontSize:13,marginTop:4,opacity:0.9 }}>You have completed all 52 weeks of the Teens Bible Study. Well done, faithful servant!</div>
              </div>
            )}
          </div>
        )}

        {/* ── JOURNAL TAB ── */}
        {activeTab === "journal" && (
          <div>
            <div style={{ fontFamily:TC.heading,fontSize:18,fontWeight:700,color:TC.text,marginBottom:4 }}>My Journal</div>
            <div style={{ fontFamily:TC.ui,fontSize:12,color:TC.muted,marginBottom:16 }}>Your personal reflections from each lesson</div>
            {Object.keys(journalEntries).length === 0 && (
              <div style={{ textAlign:"center",padding:40,fontFamily:TC.body,fontSize:13,color:TC.muted }}>
                No journal entries yet. Open a lesson and write your first reflection!
              </div>
            )}
            {Object.entries(journalEntries).sort((a,b) => Number(a[0]) - Number(b[0])).map(([week, entry]) => {
              const lesson = TEEN_LESSONS.find(l => l.week === Number(week));
              return (
                <div key={week} onClick={() => lesson && openLesson(lesson)} style={{ background:TC.card,border:`1px solid ${TC.divider}`,borderRadius:10,padding:14,marginBottom:10,cursor:"pointer" }}>
                  <div style={{ display:"flex",justifyContent:"space-between",alignItems:"center",marginBottom:6 }}>
                    <div style={{ fontFamily:TC.ui,fontSize:12,fontWeight:700,color:TC.accent }}>Week {week}{lesson ? `: ${lesson.title}` : ""}</div>
                    <div style={{ fontFamily:TC.ui,fontSize:10,color:TC.muted }}>{entry.date}</div>
                  </div>
                  <div style={{ fontFamily:TC.body,fontSize:13,color:TC.text,lineHeight:1.7,display:"-webkit-box",WebkitLineClamp:3,WebkitBoxOrient:"vertical",overflow:"hidden" }}>{entry.text}</div>
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Modal */}
      {modalOpen && <LessonModal />}
    </div>
  );
}
