"use client";
import { useState, useRef, useCallback } from "react";
import { supabase } from "../../lib/supabase";
import { useApp } from "../context/AppContext";
import { getBookName } from "../constants";

export default function BibleSearch({ nav, ht }) {
  const { bibleTranslation } = useApp();
  const [query, setQuery] = useState("");
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [searched, setSearched] = useState(false);
  const [filter, setFilter] = useState("all"); // "all" | "OT" | "NT"
  const debounceRef = useRef(null);

  const doSearch = useCallback(async (q, f) => {
    if (!q || q.trim().length < 2) { setResults([]); setSearched(false); return; }
    setLoading(true);
    setSearched(true);

    // Check if query matches "Book Chapter:Verse" pattern (e.g., "John 3:16")
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

    // Full text search on kjv_text
    let qb = supabase
      .from("verses")
      .select("id, verse_number, kjv_text, chapters(chapter_number, books(name))")
      .ilike("kjv_text", `%${q.trim()}%`)
      .order("id")
      .limit(80);

    const { data } = await qb;
    let filtered = (data || []).filter(v => v.chapters?.books?.name);

    // Client-side testament filter
    if (f !== "all") {
      const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];
      if (f === "OT") filtered = filtered.filter(v => OT_BOOKS.includes(v.chapters.books.name));
      else filtered = filtered.filter(v => !OT_BOOKS.includes(v.chapters.books.name));
    }

    setResults(filtered);
    setLoading(false);
  }, []);

  const handleInput = (val) => {
    setQuery(val);
    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (val.trim().length < 2) { setResults([]); setSearched(false); return; }
    debounceRef.current = setTimeout(() => doSearch(val, filter), 400);
  };

  const handleFilterChange = (f) => {
    setFilter(f);
    if (query.trim().length >= 2) doSearch(query, f);
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
              placeholder="Search the Scriptures..."
              style={{
                width: "100%", padding: "11px 14px 11px 36px", borderRadius: 12,
                border: "1.5px solid rgba(255,255,255,0.15)", fontFamily: ht.ui, fontSize: 14,
                color: "#fff", outline: "none", background: "rgba(255,255,255,0.1)",
                boxSizing: "border-box", transition: "border 0.2s",
              }}
            />
            {query && (
              <button onClick={() => { setQuery(""); setResults([]); setSearched(false); }}
                style={{ position: "absolute", right: 10, top: "50%", transform: "translateY(-50%)", background: "none", border: "none", cursor: "pointer", color: ht.headerText + "88", padding: 4 }}>
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
              </button>
            )}
          </div>
        </div>
        {/* Filter pills */}
        <div style={{ display: "flex", gap: 6, marginTop: 10 }}>
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
      </div>

      {/* Results */}
      <div style={{ padding: "16px 16px 40px" }}>
        {loading && (
          <div style={{ display: "flex", justifyContent: "center", padding: 40 }}>
            <div style={{ width: 28, height: 28, border: `3px solid ${ht.divider}`, borderTop: `3px solid ${ht.accent}`, borderRadius: "50%", animation: "spin 0.8s linear infinite" }}/>
          </div>
        )}

        {!loading && searched && results.length === 0 && (
          <div style={{ textAlign: "center", padding: "50px 20px" }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>📜</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>No verses found</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>
              Try different keywords or check spelling
            </div>
          </div>
        )}

        {!loading && searched && results.length > 0 && (
          <div style={{ fontFamily: ht.ui, fontSize: 12, color: ht.muted, marginBottom: 12, fontWeight: 600 }}>
            {results.length}{results.length >= 80 ? "+" : ""} result{results.length !== 1 ? "s" : ""}
          </div>
        )}

        {!loading && !searched && (
          <div style={{ textAlign: "center", padding: "50px 20px" }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>🔍</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Search the Bible</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.8 }}>
              Search by word, phrase, or reference
              <br/>
              <span style={{ color: ht.accent, fontStyle: "italic" }}>e.g. "love" · "In the beginning" · "John 3:16"</span>
            </div>
          </div>
        )}

        {!loading && results.map((v, i) => {
          const bookName = v.chapters?.books?.name;
          const chapNum = v.chapters?.chapter_number;
          const verseNum = v.verse_number;
          const text = v.kjv_text || "";
          const ref = `${getBookName(bookName, bibleTranslation)} ${chapNum}:${verseNum}`;
          const snippet = truncateAround(text, query);

          return (
            <button key={v.id || i} onClick={() => {
              const OT_BOOKS = ["Genesis","Exodus","Leviticus","Numbers","Deuteronomy","Joshua","Judges","Ruth","1 Samuel","2 Samuel","1 Kings","2 Kings","1 Chronicles","2 Chronicles","Ezra","Nehemiah","Esther","Job","Psalms","Proverbs","Ecclesiastes","Song of Solomon","Isaiah","Jeremiah","Lamentations","Ezekiel","Daniel","Hosea","Joel","Amos","Obadiah","Jonah","Micah","Nahum","Habakkuk","Zephaniah","Haggai","Zechariah","Malachi"];
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
      </div>
    </div>
  );
}
