"use client";
import { useState, useRef, useCallback } from "react";
import { supabase } from "../../lib/supabase";
import { useApp } from "../context/AppContext";
import { getBookName } from "../constants";

const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];

function parseVerseRef(ref) {
  const m = ref.match(/^(.+?)\s+(\d+):(\d+)$/);
  return m ? { book: m[1], chapter: +m[2], verse: +m[3] } : null;
}

export default function BibleSearch({ nav, ht }) {
  const { bibleTranslation } = useApp();
  const [query, setQuery] = useState("");
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [searched, setSearched] = useState(false);
  const [filter, setFilter] = useState("all"); // "all" | "OT" | "NT"
  const [mode, setMode] = useState("keyword"); // "keyword" | "smart"
  const [semanticResults, setSemanticResults] = useState([]);
  const [semanticSearched, setSemanticSearched] = useState(false);
  const [podcastResults, setPodcastResults] = useState([]);
  const debounceRef = useRef(null);

  // ── Keyword search (existing) ──────────────────────────────
  const doSearch = useCallback(async (q, f) => {
    if (!q || q.trim().length < 2) { setResults([]); setSearched(false); return; }
    setLoading(true);
    setSearched(true);

    const refMatch = q.trim().match(/^(\d?\s?[A-Za-z ]+?)\s+(\d+):(\d+)$/);
    if (refMatch) {
      const bookQ = refMatch[1].trim();
      const chapNum = parseInt(refMatch[2]);
      const verseNum = parseInt(refMatch[3]);
      const { data } = await supabase
        .from("verses")
        .select("id, verse_number, kjv_text, chapters(chapter_number, books(name))")
        .eq("verse_number", verseNum)
        .eq("chapters.chapter_number", chapNum)
        .ilike("chapters.books.name", `%${bookQ}%`)
        .limit(10);
      const filtered = (data || []).filter(v => v.chapters?.books?.name);
      setResults(filtered);
      setLoading(false);
      return;
    }

    const { data } = await supabase
      .from("verses")
      .select("id, verse_number, kjv_text, chapters(chapter_number, books(name))")
      .ilike("kjv_text", `%${q.trim()}%`)
      .order("id")
      .limit(80);
    let filtered = (data || []).filter(v => v.chapters?.books?.name);

    if (f !== "all") {
      if (f === "OT") filtered = filtered.filter(v => OT_BOOKS.includes(v.chapters.books.name));
      else filtered = filtered.filter(v => !OT_BOOKS.includes(v.chapters.books.name));
    }

    setResults(filtered);
    setLoading(false);
  }, []);

  // ── Semantic search (new) ──────────────────────────────────
  const doSemanticSearch = useCallback(async (q) => {
    if (!q || q.trim().length < 3) { setSemanticResults([]); setSemanticSearched(false); return; }
    setLoading(true);
    setSemanticSearched(true);
    try {
      const res = await fetch("/api/semantic-search", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ query: q.trim(), include_podcasts: true }),
      });
      if (!res.ok) throw new Error("Search failed");
      const data = await res.json();
      setSemanticResults(data.results || []);
      setPodcastResults(data.podcasts || []);
    } catch {
      setSemanticResults([]);
      setPodcastResults([]);
    }
    setLoading(false);
  }, []);

  const handleInput = (val) => {
    setQuery(val);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (mode === "keyword") {
      if (val.trim().length < 2) { setResults([]); setSearched(false); return; }
      debounceRef.current = setTimeout(() => doSearch(val, filter), 400);
    } else {
      if (val.trim().length < 3) { setSemanticResults([]); setSemanticSearched(false); return; }
      debounceRef.current = setTimeout(() => doSemanticSearch(val), 800);
    }
  };

  const handleFilterChange = (f) => {
    setFilter(f);
    if (query.trim().length >= 2) doSearch(query, f);
  };

  const handleModeChange = (m) => {
    setMode(m);
    setResults([]);
    setSemanticResults([]);
    setPodcastResults([]);
    setSearched(false);
    setSemanticSearched(false);
    // Re-trigger search if there's a query
    if (query.trim().length >= 2) {
      if (m === "keyword") {
        debounceRef.current = setTimeout(() => doSearch(query, filter), 100);
      } else if (query.trim().length >= 3) {
        debounceRef.current = setTimeout(() => doSemanticSearch(query), 100);
      }
    }
  };

  const highlightMatch = (text, q) => {
    if (!q || q.length < 2) return text;
    const idx = text.toLowerCase().indexOf(q.toLowerCase());
    if (idx === -1) return text;
    const before = text.slice(0, idx);
    const match = text.slice(idx, idx + q.length);
    const after = text.slice(idx + q.length);
    return <>{before}<mark style={{ background: `${ht.accent}40`, color: ht.dark, borderRadius: 2, padding: "0 1px" }}>{match}</mark>{after}</>;
  };

  const truncateAround = (text, q, maxLen = 120) => {
    if (text.length <= maxLen) return text;
    const idx = text.toLowerCase().indexOf(q.toLowerCase());
    if (idx === -1) return text.slice(0, maxLen) + "...";
    const start = Math.max(0, idx - 40);
    const end = Math.min(text.length, idx + q.length + 60);
    let snippet = text.slice(start, end);
    if (start > 0) snippet = "..." + snippet;
    if (end < text.length) snippet = snippet + "...";
    return snippet;
  };

  const isKeyword = mode === "keyword";
  const isSmart = mode === "smart";
  const activeResults = isKeyword ? results : semanticResults;
  const activeSearched = isKeyword ? searched : semanticSearched;

  return (
    <div style={{ minHeight: "100vh", background: ht.bg }}>
      {/* Search header */}
      <div style={{ background: ht.headerGradient, padding: "14px 16px 18px", position: "sticky", top: 0, zIndex: 10 }}>
        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
          <button onClick={() => nav("home")} style={{ background: "rgba(255,255,255,0.08)", border: "none", borderRadius: 8, padding: "8px 10px 8px 6px", cursor: "pointer", display: "flex", alignItems: "center", color: ht.headerText }}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><polyline points="15 18 9 12 15 6"/></svg>
          </button>
          <div style={{ flex: 1, position: "relative" }}>
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke={ht.headerText + "88"} strokeWidth="2" strokeLinecap="round" style={{ position: "absolute", left: 12, top: "50%", transform: "translateY(-50%)" }}>
              <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
            <input
              autoFocus
              value={query}
              onChange={e => handleInput(e.target.value)}
              placeholder={isKeyword ? "Search the Scriptures..." : "Ask a question or describe a topic..."}
              style={{
                width: "100%", padding: "11px 14px 11px 36px", borderRadius: 12,
                border: "1.5px solid rgba(255,255,255,0.15)", fontFamily: ht.ui, fontSize: 14,
                color: "#fff", outline: "none", background: "rgba(255,255,255,0.1)",
                boxSizing: "border-box", transition: "border 0.2s",
              }}
            />
            {query && (
              <button onClick={() => { setQuery(""); setResults([]); setSemanticResults([]); setPodcastResults([]); setSearched(false); setSemanticSearched(false); }}
                style={{ position: "absolute", right: 10, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", cursor: "pointer", color: ht.headerText + "88", padding: 4 }}>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
              </button>
            )}
          </div>
        </div>

        {/* Mode toggle */}
        <div style={{ display: "flex", gap: 6, marginTop: 10 }}>
          {[
            { id: "keyword", label: "Keyword", icon: "Aa" },
            { id: "smart", label: "Smart Search", icon: "\u2726" },
          ].map(m => (
            <button key={m.id} onClick={() => handleModeChange(m.id)}
              style={{
                flex: 1, padding: "7px 14px", borderRadius: 20, border: "none", cursor: "pointer",
                fontFamily: ht.ui, fontSize: 12, fontWeight: 600,
                background: mode === m.id ? "rgba(255,255,255,0.2)" : "rgba(255,255,255,0.06)",
                color: mode === m.id ? "#fff" : "rgba(255,255,255,0.5)",
                display: "flex", alignItems: "center", justifyContent: "center", gap: 6,
                transition: "all 0.15s",
              }}>
              <span style={{ fontSize: 10, fontWeight: 800, opacity: 0.7 }}>{m.icon}</span>
              {m.label}
            </button>
          ))}
        </div>

        {/* Testament filter pills — keyword mode only */}
        {isKeyword && (
          <div style={{ display: "flex", gap: 6, marginTop: 8 }}>
            {[{ id: "all", label: "All" }, { id: "OT", label: "Old Testament" }, { id: "NT", label: "New Testament" }].map(f => (
              <button key={f.id} onClick={() => handleFilterChange(f.id)}
                style={{
                  padding: "5px 14px", borderRadius: 20, border: "none", cursor: "pointer",
                  fontFamily: ht.ui, fontSize: 11, fontWeight: 600,
                  background: filter === f.id ? "rgba(255,255,255,0.2)" : "rgba(255,255,255,0.06)",
                  color: filter === f.id ? "#fff" : "rgba(255,255,255,0.5)",
                  transition: "all 0.15s",
                }}>
                {f.label}
              </button>
            ))}
          </div>
        )}

        {/* Smart search hint */}
        {isSmart && (
          <div style={{ fontFamily: ht.ui, fontSize: 10, color: "rgba(255,255,255,0.4)", marginTop: 6, textAlign: "center" }}>
            Searches by meaning, not just keywords
          </div>
        )}
      </div>

      {/* Results */}
      <div style={{ padding: "16px 16px 40px" }}>
        {loading && (
          <div style={{ display: "flex", justifyContent: "center", padding: 40 }}>
            <div style={{ width: 28, height: 28, border: `3px solid ${ht.divider}`, borderTop: `3px solid ${ht.accent}`, borderRadius: "50%", animation: "spin 0.8s linear infinite" }}/>
          </div>
        )}

        {!loading && activeSearched && activeResults.length === 0 && podcastResults.length === 0 && (
          <div style={{ textAlign: "center", padding: "50px 20px" }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>{isKeyword ? "\uD83D\uDCDC" : "\uD83D\uDD0E"}</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>No results found</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>
              {isKeyword ? "Try different keywords or check spelling" : "Try rephrasing your question or use different words"}
            </div>
          </div>
        )}

        {!loading && activeSearched && activeResults.length > 0 && (
          <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted, marginBottom: 12, fontWeight: 600 }}>
            {isKeyword
              ? `${results.length}${results.length >= 80 ? "+" : ""} result${results.length !== 1 ? "s" : ""}`
              : `${semanticResults.length} result${semanticResults.length !== 1 ? "s" : ""} by relevance`}
          </div>
        )}

        {/* Pre-search empty states */}
        {!loading && !activeSearched && isKeyword && (
          <div style={{ textAlign: "center", padding: "50px 20px" }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>{"\uD83D\uDD0D"}</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Search the Bible</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.8 }}>
              Search by word, phrase, or reference
              <br/>
              <span style={{ color: ht.accent, fontStyle: "italic" }}>e.g. "love" · "In the beginning" · "John 3:16"</span>
            </div>
          </div>
        )}

        {!loading && !activeSearched && isSmart && (
          <div style={{ textAlign: "center", padding: "50px 20px" }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>{"\u2728"}</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Search by Meaning</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.8 }}>
              Ask a question or describe a topic
              <br/>
              <span style={{ color: ht.accent, fontStyle: "italic" }}>e.g. "forgiveness of sins" · "dealing with anxiety" · "God's promises"</span>
            </div>
          </div>
        )}

        {/* Keyword results */}
        {!loading && isKeyword && results.map((v, i) => {
          const bookName = v.chapters?.books?.name;
          const chapNum = v.chapters?.chapter_number;
          const verseNum = v.verse_number;
          const text = v.kjv_text || "";
          const ref = `${getBookName(bookName, bibleTranslation)} ${chapNum}:${verseNum}`;
          const snippet = truncateAround(text, query);

          return (
            <button key={v.id || i} onClick={() => {
              const t = OT_BOOKS.includes(bookName) ? "OT" : "NT";
              nav("verse", { testament: t, book: bookName, chapter: chapNum, verse: verseNum });
            }}
              className="pressable"
              style={{
                width: "100%", textAlign: "left", cursor: "pointer",
                background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12,
                padding: "14px 16px", marginBottom: 8, display: "block",
                boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
                animation: `fadeIn 0.25s ease ${Math.min(i * 0.03, 0.3)}s both`,
              }}>
              <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 6 }}>
                <span style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.accent }}>{ref}</span>
              </div>
              <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.7 }}>
                {highlightMatch(snippet, query)}
              </div>
            </button>
          );
        })}

        {/* Smart search results */}
        {!loading && isSmart && semanticResults.map((sv, i) => {
          const parsed = parseVerseRef(sv.verse_ref);
          const simPct = Math.round(sv.similarity * 100);
          const displayRef = parsed
            ? `${getBookName(parsed.book, bibleTranslation)} ${parsed.chapter}:${parsed.verse}`
            : sv.verse_ref;
          const text = sv.kjv_text || "";
          const snippet = text.length > 140 ? text.slice(0, 140) + "..." : text;

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
                background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12,
                padding: "14px 16px", marginBottom: 8, display: "block",
                boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
                animation: `fadeIn 0.25s ease ${Math.min(i * 0.03, 0.3)}s both`,
              }}>
              <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 6 }}>
                <span style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.accent }}>{displayRef}</span>
                <span style={{
                  fontFamily: ht.ui, fontSize: 10, fontWeight: 600,
                  color: simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted,
                  background: `${simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted}15`,
                  padding: "2px 8px", borderRadius: 10,
                }}>
                  {simPct}% match
                </span>
              </div>
              <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.7 }}>
                {snippet}
              </div>
            </button>
          );
        })}

        {/* Podcast results — Smart Search only */}
        {!loading && isSmart && podcastResults.length > 0 && (
          <>
            <div style={{
              fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.muted,
              marginTop: semanticResults.length > 0 ? 20 : 0, marginBottom: 10,
              display: "flex", alignItems: "center", gap: 8,
            }}>
              <span style={{ fontSize: 14 }}>{"\uD83C\uDFA7"}</span>
              Related Episodes
            </div>
            {podcastResults.map((ep, i) => {
              const simPct = Math.round(ep.similarity * 100);
              const desc = ep.description || "";
              const snippet = desc.length > 100 ? desc.slice(0, 100) + "..." : desc;

              return (
                <button key={`pod-${i}`}
                  onClick={() => nav("podcast-episode", { podcastSeries: ep.series_slug, podcastEpisode: ep.episode_number })}
                  className="pressable"
                  style={{
                    width: "100%", textAlign: "left", cursor: "pointer",
                    background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12,
                    padding: "14px 16px", marginBottom: 8, display: "flex", alignItems: "flex-start", gap: 12,
                    boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
                    animation: `fadeIn 0.25s ease ${Math.min(i * 0.03, 0.3)}s both`,
                  }}>
                  <div style={{
                    width: 42, height: 42, borderRadius: 10, flexShrink: 0,
                    background: `${ht.accent}15`,
                    display: "flex", alignItems: "center", justifyContent: "center", fontSize: 20,
                  }}>
                    {"\uD83C\uDFA7"}
                  </div>
                  <div style={{ flex: 1, minWidth: 0 }}>
                    <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: 4 }}>
                      <span style={{ fontFamily: ht.ui, fontSize: 12, fontWeight: 700, color: ht.accent }}>{ep.title}</span>
                      <span style={{
                        fontFamily: ht.ui, fontSize: 10, fontWeight: 600, flexShrink: 0,
                        color: simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted,
                        background: `${simPct > 80 ? "#22c55e" : simPct > 65 ? ht.accent : ht.muted}15`,
                        padding: "2px 8px", borderRadius: 10,
                      }}>
                        {simPct}%
                      </span>
                    </div>
                    <div style={{
                      fontFamily: ht.ui, fontSize: 10, fontWeight: 600, color: ht.muted,
                      marginBottom: 4, textTransform: "uppercase", letterSpacing: 0.5,
                    }}>
                      Daily Word
                    </div>
                    <div style={{
                      fontFamily: ht.body, fontSize: 12.5, color: ht.text, lineHeight: 1.6,
                      display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden",
                    }}>
                      {snippet}
                    </div>
                  </div>
                </button>
              );
            })}
          </>
        )}
      </div>
    </div>
  );
}
