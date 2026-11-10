# Design system and vocabulary

What reads as "designed" is mostly agreement: a pair of typefaces, a handful of colours and one spacing rhythm, applied without exceptions. Settle those once, record them, and build from the record.

## Contents

- Page anatomy
- Turning vague style words into specific ones
- Three directions, then lock one
- Rules file template
- Keeping the page calm
- Everyday motion
- Working from a reference screenshot
- Tells of a generic site

## Page anatomy

Landing pages that work tend to share a skeleton. Give every section a purpose you can state in a sentence, and delete any that has none.

| Section | Purpose |
|---|---|
| Navigation | Brand mark, a short set of links, a single button |
| Hero | Tell a stranger what this is and why it matters before they scroll |
| Trust strip | Evidence that others rely on it: client logos, a rating, a hard number |
| Offer | The products or features on sale |
| Story or process | The people behind it, or the steps involved |
| Customer quotes | Real customers, their words |
| Pricing | Include only when prices are public |
| Questions | Answer the objections that stop a purchase |
| Closing call to action | The main button again, for people who read to the end |
| Footer | Secondary links, contact details, legal |

Sections are the horizontal bands of the page. Components are the smaller repeated parts within them: buttons, cards, inputs, badges.

## Turning vague style words into specific ones

"Premium", "modern" and "clean" give a builder nothing to act on. When one comes up, pick two or three concrete terms from this table, tell the user which you picked, and build to those.

| Kind | Term | Meaning |
|---|---|---|
| Layout | Split | Copy and visual share the row, half each |
| | Centred | Aligned on the vertical centre line |
| | Full-bleed | Reaches the viewport edges with no side margin |
| | Grid | Equal cells in rows and columns |
| | Bento | Tiles of varied size fitted into one block |
| | Asymmetric | Deliberately unbalanced weight |
| Type | Serif | Strokes end in small flares; editorial, warm |
| | Sans-serif | Plain stroke endings; neutral, modern |
| | Display face | An expressive typeface kept for large headlines |
| | Tight tracking | Reduced letter-spacing |
| | Large scale | Type sized to dominate the viewport |
| Space | Whitespace | Area left empty on purpose |
| | Padding | Gap between a container's edge and its content |
| | Breathing room | Extra margin that isolates one element |
| Surface | Flat | Solid fills, nothing raised |
| | Soft shadow | Low-contrast shadow hinting at slight elevation |
| | Grain | Subtle noise texture |
| | Glass | Blurred translucent layer |
| | Border | Hairline outline |
| Motion | Fade | Opacity runs from zero to full |
| | Slide up | Enters with a short upward travel |
| | Stagger | Siblings enter in sequence with a small delay |
| | Parallax | Foreground and background travel at unequal rates |
| | Hover lift | Small upward shift while pointed at |

A request can leave both content and styling open, supply the content only, or supply both. Only the last removes guesswork, so push for it wherever the user has an opinion. Where they have none, make a sensible choice and keep moving.

## Three directions, then lock one

Create a throwaway preview route that renders three candidate looks next to each other. Each candidate has:

- A headline typeface and a reading typeface. Google Fonts keeps both free and simple to load.
- Five hex colours, one per role: page, ink, primary, accent, muted.
- A name and a single sentence describing its mood.
- A specimen (headline, paragraph, button, card) drawn in that look, because people judge with their eyes far better than from a description.

Make the candidates genuinely different, for instance a warm editorial serif, a stark high-contrast grotesque, and a dark technical look. The user has one thing to decide: which of these feels like the business.

Once chosen, encode it in the theme (Tailwind theme values or CSS custom properties) and add a Design section to the project rules file. Later changes to the look happen there and nowhere else. Sites drift out of harmony through small local exceptions: an extra colour in one card, an extra typeface in one heading.

## Rules file template

Adapt and trim. This file is loaded every session, so brevity matters.

```markdown
Marketing site for [business]: [what it does, where].

## Stack
- Next.js + Tailwind CSS

## Working rules
- Readable code over clever code. Each component in its own file under `components/`.
- Phone first. Nothing may break at 390px.
- Write real copy. No filler text.
- Get approval before adding a dependency.

## Design
Typefaces
- Headlines: [font]
- Reading text: [font]

Palette
| Role | Hex | Where it appears |
|---|---|---|
| Page | #...... | Backgrounds |
| Ink | #...... | Headings, paragraphs |
| Primary | #...... | Buttons, the main highlight |
| Accent | #...... | [specific use, or "held back"] |
| Muted | #...... | Captions, secondary copy |

Constraints
- Palette colours only.
- One vertical gap between sections, sitewide.
- One small corner radius, sitewide.
- The accent appears on buttons and the main highlight, nowhere else.
```

## Keeping the page calm

1. Two typefaces and no more. Framework default stacks count: Tailwind's `font-mono` or `font-serif` used for step numbers, labels or badges quietly adds a third family. Point those utilities at the two tokens, or do not use them.
2. No hex values in components that are not in the palette.
3. A single vertical rhythm from section to section.
4. A single corner radius.
5. A single accent, rationed. When it marks only the things worth clicking, attention goes there without effort. If several accent-coloured buttons compete inside one section, demote all but one.

## Everyday motion

Sort out the ordinary motion before reaching for anything cinematic. It should barely register:

- Sections ease in with a short fade and a few pixels of upward travel on entering the viewport. Cards rise slightly under the pointer.
- Durations stay below 500ms. Entrance animations fire a single time, not on every pass. Content never depends on an animation finishing.
- Respect `prefers-reduced-motion`; with it set, elements are simply present.
- Interactive elements show hover and keyboard-focus states.

Reduced motion has to cover everything that moves, not only the effects you think of as animation. Smooth scrolling, accordion and menu-icon rotations and hover transitions are the ones usually missed. Put a global rule in the base stylesheet so nothing slips through:

```css
@media (prefers-reduced-motion: reduce) {
  html { scroll-behavior: auto; }
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

Script-driven motion (scroll handlers, GSAP, canvas loops) does not obey CSS and needs its own check of `matchMedia("(prefers-reduced-motion: reduce)")`.

Motion only draws the eye when most of the page is still. If in doubt, delete an animation.

## Working from a reference screenshot

When the user points at a site they admire, borrow its bones: layout, proportions, spacing. Fill them with this project's words, palette and typefaces. Never lift another brand's copy, pictures or identity. Besides being someone else's property, an imitation gives visitors nothing to remember.

## Tells of a generic site

An audit list for pages that "look AI-made":

- A centred headline on a soft gradient with a row of three identical rounded cards under it.
- Emoji or stock icons where real imagery should be.
- Several accent colours, or gradients doing a palette's job.
- Side-by-side buttons with equal visual weight.
- Uniform cards, columns and quotes with nothing leading. Promote one item to a larger scale and offset the others.
- Filler copy, or headlines that would fit any company.
- Images that disagree in lighting, angle or colour.
- Motion on everything, or entrance animations that replay each time.
- A page title consisting of the brand name and nothing else.
