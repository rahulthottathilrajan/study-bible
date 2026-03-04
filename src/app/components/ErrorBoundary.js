"use client";
import React from "react";

const FALLBACK = {
  bg: "#f7f2e8", card: "#fff", heading: "Georgia, serif",
  ui: "system-ui, sans-serif", body: "Georgia, serif",
  dark: "#2D2520", muted: "#8B7E74", accent: "#8B6914",
  divider: "#E8E0D4",
};

export default class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error("[ErrorBoundary]", this.props.label || "Unknown", error, errorInfo);
  }

  handleRetry = () => {
    this.setState({ hasError: false });
  };

  render() {
    if (this.state.hasError) {
      const t = this.props.theme || FALLBACK;
      return (
        <div style={{ display: "flex", alignItems: "center", justifyContent: "center", minHeight: 200, padding: 24 }}>
          <div style={{
            background: t.card, borderRadius: 16, padding: "28px 24px",
            border: `1px solid ${t.divider}`, maxWidth: 380, width: "100%",
            textAlign: "center", boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
          }}>
            <div style={{ fontSize: 36, marginBottom: 12 }}>&#9888;&#65039;</div>
            <h3 style={{ fontFamily: t.heading, fontSize: 18, color: t.dark, margin: "0 0 8px" }}>
              Something went wrong
            </h3>
            <p style={{ fontFamily: t.body, fontSize: 14, color: t.muted, lineHeight: 1.6, margin: "0 0 18px" }}>
              {this.props.label
                ? `The ${this.props.label} section encountered an error.`
                : "An unexpected error occurred."}
            </p>
            <button onClick={this.handleRetry} style={{
              padding: "10px 24px", borderRadius: 8, border: "none",
              background: t.accent, color: "#fff", fontFamily: t.ui,
              fontSize: 14, fontWeight: 600, cursor: "pointer",
            }}>
              Try Again
            </button>
          </div>
        </div>
      );
    }
    return this.props.children;
  }
}
