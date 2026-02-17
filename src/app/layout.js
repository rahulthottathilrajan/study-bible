import "./globals.css";

export const metadata = {
  title: "KJV Study Bible",
  description: "King James Version Study Bible with Hebrew & Greek word studies, cross-references, and study notes",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}