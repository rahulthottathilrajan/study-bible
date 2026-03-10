# The Bible Scrollers — Brand Guidelines

## 1. Brand Identity

| Element | Value |
|---------|-------|
| **Name** | The Bible Scrollers |
| **Tagline** | Scrolling Through Scripture |
| **Mission** | Making God's Word accessible, beautiful, and study-ready for every believer. |
| **Vision** | A world-class Bible study platform that blends reverence with modern design. |
| **Values** | Faith-first · Scholarly integrity · Simplicity · Accessibility · Community |

### Brand Voice
- **Warm & Scholarly** — not preachy, not casual
- **Reverent but approachable** — like a wise, kind study partner
- **Encouraging** — celebrate progress (streaks, badges, milestones)
- **Scripture-faithful** — KJV text is always preserved verbatim; never paraphrase the Word
- **Faith-first** — features exist to serve the Word, not the other way around

---

## 2. Color Palette

### Primary Brand Colors
| Color | Hex | Usage |
|-------|-----|-------|
| **Brand Gold** | `#D4A853` | Primary accent across all themes — the unifying brand colour |
| **Brand Purple** | `#5B2D8E` | Shop accent, header gradients, royal theme |
| **Deep Forest** | `#1C2B1F` | Home header gradient start |
| **Deep Indigo** | `#2D1B4E` | Header gradient midpoint, sunrise/royal theming |
| **Deep Navy** | `#1A2F4B` | Ocean theme accents, header gradient end |

### Theme Palettes (5 Themes)

#### Home Theme (Default)
| Property | Light | Dark |
|----------|-------|------|
| Background | `#FAF6F0` | `#141210` |
| Card | `#fff` | `#1E1C18` |
| Text | `#3A3028` | `#D4C8B0` |
| Muted | `#7A6B55` | `#9A8B72` |
| Accent | `#D4A853` | `#D4A853` |
| Header Gradient | `linear-gradient(165deg, #1C2B1F 0%, #2D1B4E 50%, #1A2F4B 100%)` | same |
| Header Text | `#F0E8D8` | `#F0E8D8` |
| Divider | `rgba(180,160,130,0.2)` | `rgba(180,160,130,0.15)` |

#### Garden Theme (Pentateuch, Historical Books)
- Accent: `#C06C3E` (warm earth)
- Header: `linear-gradient(165deg, #1C2B1F 0%, #2E4A33 100%)`

#### Royal Theme (Wisdom, Epistles)
- Accent: `#8B5CF6` (purple)
- Header: `linear-gradient(165deg, #2D1052 0%, #5B2D8E 100%)`

#### Sunrise Theme (Prophets)
- Accent: `#E8625C` (coral)
- Header: `linear-gradient(165deg, #2D1B4E 0%, #4A2D6B 100%)`

#### Ocean Theme (Gospels)
- Accent: `#1B7A6E` (teal)
- Header: `linear-gradient(165deg, #1A2F4B 0%, #1B5E5A 100%)`

### Semantic Colors
| Purpose | Color |
|---------|-------|
| Success | `#34A853` |
| Error | `#E8625C` |
| Warning / Streak | `#d97706` |

### Highlight Colors (Verse Highlighting)
`#FFD700` · `#FF9B71` · `#7ED4AD` · `#82B1FF` · `#CE93D8` · `#F48FB1`

---

## 3. Typography

### Font Families (by Theme)

| Purpose | Home & Garden | Royal | Sunrise | Ocean |
|---------|--------------|-------|---------|-------|
| **Heading** | DM Serif Display | Playfair Display | DM Serif Display | Merriweather |
| **Body** | Lora | Lora | Lora | Lora |
| **UI** | Outfit | Poppins | Nunito | Quicksand |

### Type Scale
| Element | Size | Weight |
|---------|------|--------|
| Hero heading | 26–28px | 700–800 |
| Section heading | 16–18px | 700 |
| Card title | 14–15px | 700 |
| Body text | 13–14px | 400 |
| Caption / label | 10–12px | 600–700 |
| Micro text | 8–9px | 600 |

### Font Size Settings (User Configurable)
| Setting | List View | Detail View |
|---------|-----------|-------------|
| Small | 13px | 15px |
| Medium (default) | 14.5px | 17px |
| Large | 17px | 20px |
| X-Large | 20.5px | 24px |

---

## 4. Spacing & Layout

### Breakpoints
| Breakpoint | Width | Content Max | Shell Max | Padding |
|------------|-------|-------------|-----------|---------|
| Mobile | < 600px | 520px | 640px | 20px |
| Tablet | 600–1024px | 680px | 960px | 28px |
| Desktop | > 1024px | 780px | 1200px | 36px |

### Spacing Tokens
- Section gap: 16–20px
- Card padding: 16–18px
- Inline gap (icons/text): 6–8px
- Bottom nav height: ~68px

### Border Radius
| Element | Radius |
|---------|--------|
| Cards | 14–16px |
| Buttons | 10–12px |
| Pills / tags | 20–24px |
| Modals | 20px |
| Input fields | 10px |

---

## 5. Component Standards

### Cards
```
background: t.card
border: 1px solid t.divider
borderRadius: 14–16px
padding: 16–18px
```

### Buttons
| Variant | Style |
|---------|-------|
| **Primary** | `background: t.accent` or `t.headerGradient`, white text, `borderRadius:10-14px`, `fontWeight:700` |
| **Secondary** | `background: t.card`, `color: t.text`, `border: 1.5px solid t.divider` |
| **Ghost** | transparent background, `color: t.muted`, no border |
| **Gold gradient** | `linear-gradient(135deg, #D4A853, #B8860B)`, white text, shadow |

### Modals
```
Overlay: position:fixed, inset:0, background:rgba(0,0,0,0.6), zIndex:100
Card: maxWidth:420, borderRadius:20, padding:28px 22px
Close: position:absolute, top:14, right:14
```

### Animated Gold Line
```css
height: 2px
background: linear-gradient(90deg, accent 60%, headerText 90%, accent 80%, headerText 95%, accent 60%)
backgroundSize: 200% 100%
animation: goldFlow 3s linear infinite
```

---

## 6. Iconography
- All icons: inline SVG (no external icon library)
- Stroke width: 1.6–2.0
- Stroke line cap: round
- Stroke line join: round
- Sizes: 22px (navigation), 16–18px (inline), 28px (feature cards)
- Color: `currentColor` or theme-aware (`t.accent`, `t.muted`, `t.headerText`)

---

## 7. Animation Guidelines
| Animation | Duration | Easing | Usage |
|-----------|----------|--------|-------|
| Transitions | 0.15–0.25s | ease | Hover, focus, toggle states |
| goldFlow | 3s | linear, infinite | Accent separator lines |
| fadeIn | 0.2s | ease | Dropdown menus, toast entry |
| dropIn | 0.15s | ease | Tooltip, popover entry |
| pulseGlow | 2s | ease-in-out, infinite | Active/highlighted elements |
| spin | 0.8s | linear, infinite | Loading spinners |
| slideUp | 0.3s | ease | Bottom sheets |

---

## 8. Store / Shop Identity
- **Store Name**: The Bible Scrollers Store
- **Accent color**: `#5B2D8E` (purple) for headings and prices
- **Offer colors**: Yellow `#d97706` for deals, Red `#E8625C` for urgency
- **Product categories**: Clothing, Digital Books, Physical Books, Stickers & Prints
- **Trust signals**: Secure Payment (Stripe), Global Shipping, Easy Returns
- **Tone**: "Made for the faithful" · "Wear your faith. Share the Word."

---

## 9. Logo & Favicon
- **Primary mark**: Cross/scroll icon (SVG)
- **Favicon**: Existing `icon.svg` in public folder
- **PWA icon**: 192×192 and 512×512 variants
- **Minimum clear space**: Equal to icon height on all sides
- **Do not**: stretch, recolor outside brand palette, add drop shadows
