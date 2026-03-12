"use client";
import { useState, useRef, useCallback, useEffect } from "react";
import { useApp } from "../context/AppContext";
import { getBookName } from "../constants";
import Header from "../components/Header";

const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];

function parseVerseRef(ref) {
  const m = ref.match(/^(.+?)\s+(\d+):(\d+)$/);
  return m ? { book: m[1], chapter: +m[2], verse: +m[3] } : null;
}

const SUGGESTIONS = [
  "What does the Bible say about forgiveness?",
  "God's promises for difficult times",
  "Verses about faith and trust",
];

let msgId = 0;

export default function SmartChat() {
  const { ht, nav, goBack, bibleTranslation, bp } = useApp();
  const [messages, setMessages] = useState([]);
  const [inputText, setInputText] = useState("");
  const [loading, setLoading] = useState(false);
  const scrollRef = useRef(null);
  const inputRef = useRef(null);

  // Auto-scroll to bottom on new messages
  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
    }
  }, [messages, loading]);

  const sendQuery = useCallback(async (text) => {
    const q = text.trim();
    if (!q || q.length < 3 || loading) return;

    const userMsg = { id: ++msgId, role: "user", text: q };
    setMessages(prev => [...prev, userMsg]);
    setInputText("");
    setLoading(true);

    try {
      const res = await fetch("/api/semantic-search", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ query: q, include_podcasts: true }),
      });
      if (!res.ok) throw new Error("Search failed");
      const data = await res.json();
      const assistantMsg = {
        id: ++msgId,
        role: "assistant",
        query: q,
        verses: data.results || [],
        podcasts: data.podcasts || [],
      };
      setMessages(prev => [...prev, assistantMsg]);
    } catch {
      setMessages(prev => [...prev, {
        id: ++msgId,
        role: "assistant",
        error: true,
        query: q,
        verses: [],
        podcasts: [],
      }]);
    }
    setLoading(false);
  }, [loading]);

  const handleKeyDown = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendQuery(inputText);
    }
  };

  const handleSuggestion = (text) => {
    setInputText(text);
    sendQuery(text);
  };

  const showWelcome = messages.length === 0 && !loading;

  return (
    <div style={{ display: "flex", flexDirection: "column", height: "100vh", background: ht.bg }}>
      {/* Header */}
      <Header title="Smart Search" onBack={goBack} theme={ht} hidePrayer hideUser />

      {/* Messages area */}
      <div ref={scrollRef} style={{ flex: 1, overflowY: "auto", padding: `16px ${bp.pad}px 8px` }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto" }}>

          {/* Welcome state */}
          {showWelcome && (
            <div style={{ animation: "fadeIn 0.4s ease" }}>
              {/* Assistant welcome bubble */}
              <div style={{ display: "flex", justifyContent: "flex-start", marginBottom: 16 }}>
                <div style={{
                  maxWidth: "85%", padding: "16px 18px", borderRadius: "4px 16px 16px 16px",
                  background: ht.card, border: `1px solid ${ht.divider}`,
                  boxShadow: "0 1px 3px rgba(0,0,0,0.05)",
                }}>
                  <div style={{
                    width: 32, height: 32, borderRadius: "50%", marginBottom: 10,
                    background: `${ht.accent}18`, display: "flex", alignItems: "center",
                    justifyContent: "center", fontSize: 16,
                  }}>
                    ✦
                  </div>
                  <div style={{ fontFamily: ht.heading, fontSize: 15, fontWeight: 700, color: ht.dark, marginBottom: 6 }}>
                    Ask me anything about the Bible
                  </div>
                  <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6, marginBottom: 14 }}>
                    I&apos;ll find the most relevant verses and passages. Try one of these:
                  </div>
                  {/* Suggestion chips */}
                  <div style={{ display: "flex", flexWrap: "wrap", gap: 8 }}>
                    {SUGGESTIONS.map((s, i) => (
                      <button key={i} onClick={() => handleSuggestion(s)} className="pressable"
                        style={{
                          background: `${ht.accent}10`, border: `1px solid ${ht.accentBorder}`,
                          borderRadius: 20, padding: "7px 14px", cursor: "pointer",
                          fontFamily: ht.ui, fontSize: 12, color: ht.accent, fontWeight: 600,
                          transition: "all 0.15s",
                        }}>
                        {s}
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Message list */}
          {messages.map((msg) => (
            <div key={msg.id} style={{ animation: "fadeIn 0.3s ease" }}>
              {msg.role === "user" ? (
                <UserBubble text={msg.text} ht={ht} />
              ) : (
                <AssistantBubble msg={msg} ht={ht} nav={nav} bibleTranslation={bibleTranslation} />
              )}
            </div>
          ))}

          {/* Loading indicator */}
          {loading && (
            <div style={{ display: "flex", justifyContent: "flex-start", marginBottom: 16, animation: "fadeIn 0.2s ease" }}>
              <div style={{
                padding: "14px 20px", borderRadius: "4px 16px 16px 16px",
                background: ht.card, border: `1px solid ${ht.divider}`,
                display: "flex", alignItems: "center", gap: 6,
              }}>
                {[0, 1, 2].map(i => (
                  <div key={i} style={{
                    width: 8, height: 8, borderRadius: "50%", background: ht.accent,
                    opacity: 0.5, animation: `pulseGlow 1.2s ease-in-out ${i * 0.2}s infinite`,
                  }} />
                ))}
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Input bar */}
      <div style={{
        borderTop: `1px solid ${ht.divider}`, background: ht.card,
        padding: "10px 16px 14px", paddingBottom: "max(14px, env(safe-area-inset-bottom))",
      }}>
        <div style={{ maxWidth: bp.content, margin: "0 auto", display: "flex", alignItems: "center", gap: 10 }}>
          <input
            ref={inputRef}
            value={inputText}
            onChange={e => setInputText(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="Ask a question about the Bible..."
            style={{
              flex: 1, padding: "12px 16px", borderRadius: 24,
              border: `1.5px solid ${ht.divider}`, background: ht.bg,
              fontFamily: ht.ui, fontSize: 14, color: ht.text,
              outline: "none", transition: "border-color 0.2s",
            }}
            onFocus={e => { e.target.style.borderColor = ht.accent; }}
            onBlur={e => { e.target.style.borderColor = ht.divider; }}
          />
          <button
            onClick={() => sendQuery(inputText)}
            disabled={loading || inputText.trim().length < 3}
            style={{
              width: 42, height: 42, borderRadius: "50%", border: "none", cursor: "pointer",
              background: (loading || inputText.trim().length < 3) ? ht.divider : ht.accent,
              display: "flex", alignItems: "center", justifyContent: "center",
              transition: "background 0.2s, transform 0.1s", flexShrink: 0,
            }}>
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
              <line x1="22" y1="2" x2="11" y2="13" /><polygon points="22 2 15 22 11 13 2 9 22 2" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}

/* ── User Bubble ── */
function UserBubble({ text, ht }) {
  return (
    <div style={{ display: "flex", justifyContent: "flex-end", marginBottom: 12 }}>
      <div style={{
        maxWidth: "80%", padding: "12px 16px", borderRadius: "16px 16px 4px 16px",
        background: `${ht.accent}18`, border: `1px solid ${ht.accentBorder}`,
      }}>
        <div style={{ fontFamily: ht.body, fontSize: 14, color: ht.dark, lineHeight: 1.6 }}>
          {text}
        </div>
      </div>
    </div>
  );
}

/* ── Assistant Bubble ── */
function AssistantBubble({ msg, ht, nav, bibleTranslation }) {
  const [expanded, setExpanded] = useState(false);
  const { verses, podcasts, error } = msg;
  const hasResults = verses.length > 0 || podcasts.length > 0;
  const visibleVerses = expanded ? verses : verses.slice(0, 5);

  return (
    <div style={{ display: "flex", justifyContent: "flex-start", marginBottom: 16 }}>
      <div style={{
        maxWidth: "90%", padding: "14px 16px", borderRadius: "4px 16px 16px 16px",
        background: ht.card, border: `1px solid ${ht.divider}`,
        boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
      }}>
        {/* Error state */}
        {error && (
          <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>
            Sorry, I couldn&apos;t search right now. Please try again.
          </div>
        )}

        {/* No results */}
        {!error && !hasResults && (
          <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>
            I couldn&apos;t find relevant verses for that. Try rephrasing your question or using different words.
          </div>
        )}

        {/* Results header */}
        {!error && hasResults && (
          <div style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.muted, marginBottom: 10 }}>
            Found {verses.length} relevant verse{verses.length !== 1 ? "s" : ""}
          </div>
        )}

        {/* Verse cards */}
        {visibleVerses.map((sv, i) => {
          const parsed = parseVerseRef(sv.verse_ref);
          const simPct = Math.round(sv.similarity * 100);
          const displayRef = parsed
            ? `${getBookName(parsed.book, bibleTranslation)} ${parsed.chapter}:${parsed.verse}`
            : sv.verse_ref;
          const text = sv.kjv_text || "";
          const snippet = text.length > 120 ? text.slice(0, 120) + "..." : text;

          return (
            <button key={i} onClick={() => {
              if (parsed) {
                const t = OT_BOOKS.includes(parsed.book) ? "OT" : "NT";
                nav("verse", { testament: t, book: parsed.book, chapter: parsed.chapter, verse: parsed.verse });
              }
            }}
              className="pressable"
              style={{
                width: "100%", textAlign: "left", cursor: "pointer",
                background: ht.bg, border: `1px solid ${ht.divider}`, borderRadius: 10,
                padding: "10px 12px", marginBottom: 6, display: "block",
              }}>
              <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 4 }}>
                <span style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.accent }}>{displayRef}</span>
                <span style={{
                  fontFamily: ht.ui, fontSize: 9, fontWeight: 600,
                  color: simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted,
                  background: `${simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted}12`,
                  padding: "2px 7px", borderRadius: 10,
                }}>
                  {simPct}%
                </span>
              </div>
              <div style={{ fontFamily: ht.body, fontSize: 12.5, color: ht.text, lineHeight: 1.65 }}>
                {snippet}
              </div>
            </button>
          );
        })}

        {/* Show more / less */}
        {verses.length > 5 && (
          <button onClick={() => setExpanded(!expanded)}
            style={{
              background: "none", border: "none", cursor: "pointer", padding: "6px 0",
              fontFamily: ht.ui, fontSize: 12, fontWeight: 600, color: ht.accent,
              width: "100%", textAlign: "center",
            }}>
            {expanded ? "Show less" : `Show all ${verses.length} results`}
          </button>
        )}

        {/* Podcast results */}
        {podcasts.length > 0 && (
          <>
            <div style={{
              fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.muted,
              marginTop: verses.length > 0 ? 10 : 0, marginBottom: 8,
              display: "flex", alignItems: "center", gap: 6,
            }}>
              <span style={{ fontSize: 13 }}>🎧</span> Related Episodes
            </div>
            {podcasts.map((ep, i) => {
              const simPct = Math.round(ep.similarity * 100);
              return (
                <button key={`p-${i}`}
                  onClick={() => nav("podcast-episode", { podcastSeries: ep.series_slug, podcastEpisode: ep.episode_number })}
                  className="pressable"
                  style={{
                    width: "100%", textAlign: "left", cursor: "pointer",
                    background: ht.bg, border: `1px solid ${ht.divider}`, borderRadius: 10,
                    padding: "10px 12px", marginBottom: 6, display: "flex", alignItems: "center", gap: 10,
                  }}>
                  <div style={{
                    width: 34, height: 34, borderRadius: 8, flexShrink: 0,
                    background: `${ht.accent}15`,
                    display: "flex", alignItems: "center", justifyContent: "center", fontSize: 16,
                  }}>
                    🎧
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ fontFamily: ht.ui, fontSize: 11, fontWeight: 700, color: ht.accent }}>
                      {ep.title}
                    </div>
                    <div style={{ fontFamily: ht.ui, fontSize: 10, color: ht.muted, marginTop: 2 }}>
                      Daily Word
                    </div>
                  </div>
                  <span style={{
                    fontFamily: ht.ui, fontSize: 9, fontWeight: 600, flexShrink: 0,
                    color: simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted,
                    background: `${simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted}12`,
                    padding: "2px 7px", borderRadius: 10,
                  }}>
                    {simPct}%
                  </span>
                </button>
              );
            })}
          </>
        )}
      </div>
    </div>
  );
}
