# KJV Study Bible App

## Project Overview
A feature-rich KJV Bible study app built with Next.js 16 + React 19 + Supabase + Stripe. Deployed on Vercel at https://study-bible-two.vercel.app/. GitHub: https://github.com/rahulthottathilrajan/study-bible

## Tech Stack
- **Framework**: Next.js 16.1.6 (App Router, but used as SPA with client-side view state machine)
- **UI**: React 19.2.3, inline CSS-in-JS style objects (no CSS framework)
- **Database**: Supabase (PostgreSQL) — auth, verses, notes, highlights, reading positions
- **Payments**: Stripe checkout + webhook
- **Deployment**: Vercel (auto-deploys from `main` branch)
- **Dependencies**: Only 4 runtime deps — `next`, `react`, `react-dom`, `@supabase/supabase-js`, `stripe`

## Architecture

### Navigation
The app uses a **view state machine** pattern instead of file-based routing. A `view` state variable in `page.js` controls which screen is shown (e.g., "home", "books", "chapters", "verse", "search", "hebrew-home", "account", etc.). Navigation is done via a `nav(viewName, params)` function.

### Theme System
5 context-aware themes: **home, garden, royal, sunrise, ocean** — each mapped to Bible book categories via `CATEGORY_THEME`. Each theme has light and dark variants (`THEMES` and `DARK_THEMES` in `constants.js`). Theme objects contain: `bg, card, dark, text, muted, light, accent, accentLight, accentBorder, divider, headerGradient, headerText, heading, body, ui` (font families).

Dark mode is toggled via `darkMode` state, persisted to localStorage.

### Supabase Schema
- **books**: `id, name`
- **chapters**: `id, chapter_number, book_id, theme`
- **verses**: `id, verse_number, kjv_text, chapter_id`
- **user_notes**: `id, user_id, verse_id, note_text, is_public, created_at, updated_at`
- **user_highlights**: `id, user_id, verse_id, highlight_color, is_bookmarked, created_at`
- **user_reading_position**: `user_id, section_key, position_data, updated_at`

### Key Query Pattern
```js
supabase.from("verses")
  .select("id, verse_number, kjv_text, chapters(chapter_number, books(name))")
```

## File Structure

### Core Files
- `src/app/page.js` (~3,483 lines) — Main monolithic component with all views, state, auth, navigation
- `src/app/constants.js` (462 lines) — THEMES, DARK_THEMES, CATEGORY_THEME, BIBLE_BOOKS, CAT_ICONS, HIGHLIGHT_COLORS, CHAPTER_GROUPS
- `src/app/globals.css` (25 lines) — Font imports, base reset, keyframe animations
- `src/lib/supabase.js` (5 lines) — Supabase client

### Components (`src/app/components/`)
- `ui.js` — Shared stateless UI primitives: BackIcon, ChevIcon, CrossIcon, UserIcon, PrayerIcon, CloseIcon, Badge, Label, Card, Btn, Spinner, DBBadge
- `VerseOfTheDay.js` — 120 curated KJV verses, deterministic daily rotation, hero card
- `BibleSearch.js` — Debounced search (400ms), verse reference parsing, OT/NT filter pills
- `ContinueReading.js` — Multi-section horizontal strip with Supabase sync
- `ProphecyFulfilment.js` — Prophecy tracker with OT/NT fulfillment
- `ProphecyData.js` — 50+ curated prophecies with scholarly notes
- `ProphecyDetail.js` — Individual prophecy detail view
- `Apologetics.js` — Apologetics topics and evidence
- `ReadingPlans.js` — 13 preset reading plans
- `KidsCurriculum.js` — 52-week children's Bible curriculum
- `BibleBookTimeline.js` — Chronological Bible book timeline
- `TimelineMaps.js` — Biblical maps (static images in `maps/` folder)
- `ArchaeologyCards.js` — Archaeological evidence cards

### API Routes
- `src/app/api/checkout/route.js` — Stripe checkout session creation
- `src/app/api/webhook/route.js` — Stripe webhook handler

## Commands
- `npm run dev` — Start development server
- `npm run build` / `npx next build` — Production build (use this to verify changes compile)
- `npm run start` — Start production server
- `npm run lint` — Run ESLint

## Conventions
- All styling is inline React style objects (no CSS classes except in globals.css)
- Theme colors always accessed via theme object (`t`, `ht`, `st`, etc.)
- Components receive theme via props (typically `ht` for home theme, `t` for book-specific theme)
- OT_BOOKS array is duplicated in several files for testament detection — canonical list is in constants.js as part of BIBLE_BOOKS
- The `Header` component (defined inside page.js around line 511) is used by inner views; the Home screen has its own minimal top bar
- Sub-components (Timeline, Archaeology, etc.) have some hardcoded light theme colors that don't yet respond to dark mode

## Recent Work (This Session)
1. Added Bible search functionality (`BibleSearch.js`)
2. Implemented dark mode with DARK_THEMES
3. Broke up page.js — extracted constants.js, ui.js components
4. Added Verse of the Day feature (`VerseOfTheDay.js`) with 120 curated verses
5. Replaced large Home header with minimal sticky top bar, made VOTD the hero element

## Known Issues / TODO
- Sub-components (TimelineMaps, ArchaeologyCards, Apologetics, etc.) have hardcoded light theme colors — need dark mode support
- page.js is still ~3,483 lines — further extraction needs React Context for shared state
- No tests exist
- No error boundaries
- No accessibility attributes (aria-labels, heading hierarchy, keyboard nav)
- No offline/PWA support
- Supabase anon key is in client code (expected, but ensure RLS policies are configured)
