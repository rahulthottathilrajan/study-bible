"use client";
import { useApp } from "../context/AppContext";
import { Card, Spinner, ChevIcon } from "../components/ui";
import Header from "../components/Header";

export default function JournalView() {
  const { ht, user, allHighlights, hlLoading, nav, bp } = useApp();

  return (
    <div style={{ minHeight: "100vh", background: ht.bg, paddingBottom: 80 }}>
      <Header title="My Highlights" subtitle={`${allHighlights.length} saved`} theme={ht} />
      <div style={{ padding: `20px ${bp.pad}px 40px`, maxWidth: bp.content, margin: "0 auto" }}>
        {!user ? (
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>🔐</div>
            <div style={{ fontFamily: ht.heading, fontSize: 17, color: ht.dark, marginBottom: 6 }}>Sign In to See Highlights</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, marginBottom: 14 }}>Highlight verses while reading and find them all here.</div>
            <button onClick={() => nav("account")} style={{ padding: "12px 28px", borderRadius: 10, border: "none", background: ht.headerGradient, color: ht.headerText, fontFamily: ht.ui, fontSize: 14, fontWeight: 700, cursor: "pointer" }}>Sign In / Sign Up</button>
          </Card>
        ) : hlLoading ? <Spinner t={ht} /> : allHighlights.length === 0 ? (
          <Card t={ht} style={{ textAlign: "center", padding: 30 }}>
            <div style={{ fontSize: 42, marginBottom: 14 }}>🎨</div>
            <div style={{ fontFamily: ht.heading, fontSize: 18, color: ht.dark, marginBottom: 6 }}>No Highlights Yet</div>
            <div style={{ fontFamily: ht.ui, fontSize: 13, color: ht.muted, lineHeight: 1.6 }}>Open any verse and use the colored dots to highlight. Bookmarked and highlighted verses will appear here!</div>
          </Card>
        ) : (
          <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
            {allHighlights.map(h => {
              const bName = h.verses?.chapters?.books?.name;
              const chNum = h.verses?.chapters?.chapter_number;
              const vNum = h.verses?.verse_number;
              const ref = `${bName} ${chNum}:${vNum}`;
              return (
                <button key={h.id} onClick={() => nav("verse", { book: bName, chapter: chNum, verse: vNum, tab: "study" })}
                  style={{ background: ht.card, border: `1px solid ${ht.divider}`, borderRadius: 12, padding: "14px 16px", textAlign: "left", cursor: "pointer", display: "flex", gap: 12, alignItems: "flex-start", borderLeft: `4px solid ${h.highlight_color || '#FFD700'}`, boxShadow: "0 1px 3px rgba(0,0,0,0.04)" }}>
                  <div style={{ flex: 1 }}>
                    <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 4 }}>
                      <span style={{ fontFamily: ht.heading, fontSize: 14, fontWeight: 700, color: ht.dark }}>{ref}</span>
                      {h.is_bookmarked && <span style={{ fontSize: 14 }}>★</span>}
                    </div>
                    <div style={{ fontFamily: ht.body, fontSize: 13.5, color: ht.text, lineHeight: 1.6, display: "-webkit-box", WebkitLineClamp: 2, WebkitBoxOrient: "vertical", overflow: "hidden" }}>
                      {h.verses?.kjv_text}
                    </div>
                  </div>
                  <div style={{ color: ht.light, flexShrink: 0, alignSelf: "center" }}><ChevIcon /></div>
                </button>
              );
            })}
          </div>
        )}
      </div>
    </div>
  );
}
