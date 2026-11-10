---
name: futuristic-web-design
description: Build cinematic, futuristic-feeling marketing websites and landing pages end to end without the generic AI look - brief, design system, section-by-section build, AI image and video prompts for the site's visuals, scroll storytelling, a 3D accent or scroll-driven video, mobile polish, a contact form wired to a real database, deploy, domain and launch checks. Use this whenever the user wants a website, landing page, homepage, portfolio or business site built or redesigned, asks for a hero section or any page section, says cinematic, premium, futuristic, 3D, scroll animation, parallax, pinned section or Awwwards-style, wants prompts for hero images or hero video, or complains that a site looks generic or AI-made - even if all they say is "make a website for my cafe".
---

# Futuristic Web Design

A working method for single-page marketing sites that feel directed, not generated: a clear brief, one design system, sections built and verified individually, visuals that match as a single shoot, and a small, deliberate budget of cinematic motion.

## Why sites come out generic

Every detail a request leaves open is filled with the statistically most likely choice. A one-line request therefore yields the average website: centred headline, soft gradient, a row of identical rounded cards. Most of the real work happens before any code. Pin down the open questions (audience, the single desired action, the feeling, typefaces, palette), then build in increments small enough to inspect by eye.

Keep the roles clear. The user owns *what* is built. You own *how*. And no piece of work is finished until someone has looked at it in a browser at phone width.

## Where to start

| Situation | Go to |
|---|---|
| New site, empty or near-empty folder | Phase 1, then straight down |
| Existing site, one section to add or rebuild | Read the project rules, then the section routine in Phase 5 |
| "Make it cinematic / 3D / scroll-driven" | Phase 7 and `references/cinematic-moves.md` |
| Images, hero video, or prompts for them | `references/assets.md` |
| The site looks generic or AI-made | Audit it against "Tells of a generic site" in `references/design-system.md`, then Phase 3 |
| Phone fixes, polish, form, deploy, domain, SEO | `references/ship.md` |

Open a reference file on reaching its phase, not earlier. Each one stands alone.

## The phases

### 1. Brief

A single paragraph, written ahead of any code, covering three points: the audience, the one thing a visitor should do, and the intended feeling (three adjectives and a comparison, for example "quiet, precise, generous, like a well-run studio on a weekday morning").

When the user has not supplied this, request it in a single message. When they have said to just get on with it, draft the brief yourself, state it as an assumption in a line, and proceed. Later choices (the dominant button, which sections exist, which motion justifies its weight) are all resolved by rereading this paragraph. That is the reason it cannot be skipped.

### 2. Plan

Write the section list from top to bottom. Each entry gives the section's purpose in a sentence and names the asset it relies on. Hold off building. Before anything exists, changing direction is free, so for work spanning several files, present the plan and wait for agreement. Use plan mode where the agent has one.

A typical running order: navigation, hero, trust strip, the offer, story or process, customer quotes, pricing where relevant, common questions, closing call to action, footer. Remove sections whose purpose you cannot state. For a real business, never fabricate customers, reviews or statistics; omit the section or request the genuine material.

### 3. Design system

Fix the look a single time for the entire site and record it. Present three candidate directions on a basic preview page, so the choice is made by eye. Each pairs a headline typeface with a reading typeface, assigns five hex colours to roles (page, ink, primary, accent, muted), and sums up its mood in a sentence. Encode the winner in the project's theme tokens.

`references/design-system.md` has the detail, the vocabulary and a template.

### 4. Project rules

Put the permanent rules into whichever rules file the current agent loads on startup (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`). Reuse an existing file; otherwise create the right one for this agent. Since it loads every session, keep it brief: what the site is, the stack, the design system, a few standing rules.

Reasonable defaults when the project has no opinion yet:

- Stack: Next.js and Tailwind CSS. For interactive widgets (accordion, dialog, menu, inputs), install an accessible component library such as shadcn/ui; do not hand-roll them.
- Each component in its own file under `components/`.
- Phone first. 390px is the width nothing may break at.
- Genuine copy only. No lorem ipsum, no "Feature one".
- Get approval before adding a package, and explain its purpose.

Permanent rules belong in this file. The current task does not.

### 5. Build section by section

Asking for a whole page at once returns a page of mediocre sections with no clear starting point for repairs. Build a section, verify it, continue. Once the pattern is established, the plainer closing sections (quotes, questions, closing call to action, footer) may be batched. Anything visually important is built alone.

**The section routine**, for each section added or rebuilt:

1. Read the design rules and tokens first.
2. Confirm the content. Where facts matter (prices, claims, quotes), ask. Elsewhere write genuine copy and flag the lines you made up.
3. Give the section a component file to itself.
4. Render at three widths: phone (390px), tablet (768px), laptop (1440px). Repair overflow, ugly wrapping and poor crops.
5. Compare the gaps above and below with those of adjacent sections.
6. Close with a brief report: the section, its file path, and whatever needs the user's eyes.

**Spend the most effort on the hero**, since it determines whether visitors scroll at all. Specify every important detail:

- A headline of roughly eight words at most that states what is on offer, a single supporting sentence, and a nav holding the brand mark, a handful of links and a single button.
- A clear lead button: filled, accent-coloured, tied to the brief's action. The secondary action becomes an understated text link. Twin buttons of equal weight signal that no decision was made.
- Copy positioned clear of the visual's focal subject, decided for desktop and phone independently.
- For copy over video or photography, solve legibility locally with a gradient scrim under the text. Do not dim the entire visual.

With the page assembled, scroll through it end to end, identify the weakest section (one always is), and propose two alternatives for it on preview routes.

### 6. Visuals

Strong layout cannot rescue weak imagery. Start from a short shot list of around seven assets, and hold a single style line (light, lens, palette) constant across them. Prompt formulas, hero video guidance and web preparation live in `references/assets.md`.

With no image or video generator connected, give the user the prompts and continue with clearly marked placeholders. Never spend generation credits without approval.

### 7. Cinematic moves

Five techniques are on the menu: a slow background video in the hero, motion tied to scroll position, a section that pins while its content changes, parallax depth, and a live-rendered 3D object. Spend sparingly: the hero video and no more than two of the rest, each positioned where it clarifies something or creates a specific feeling. Using every technique at once reads as a demo reel, wears the visitor out, and dilutes each effect.

Each technique needs graceful fallbacks: an ordinary layout under reduced motion, a static image on small phones, and a page that survives the effect failing. Afterwards, measure the cost. Recipes and guardrails are in `references/cinematic-moves.md`; read it before writing scroll or 3D code.

### 8. Phone, polish, form, launch

Phones account for most visits. Run a dedicated pass at 390px, a consistency pass, and a speed check; then connect the form, deploy, and work through the launch checklist. See `references/ship.md`.

## Working habits

These hold throughout.

- **One change per round.** Asked for a fix, alter that and only that. A diff wider than the request hides which edit helped, and "tidying" something the user was happy with is a regression.
- **Look before reporting.** Load the page and inspect it at several widths before calling it done. Layouts can satisfy every rule and still look off.
- **Turn vague feedback into a named problem.** "It feels heavy" is workable: determine whether spacing, weight or contrast is responsible, say so, and adjust that alone. If the user cannot articulate a preference, put two or three variants on preview routes with a one-line description each. People pick more easily than they specify.
- **Trace surprises to what was unspecified.** When output is not what the user expected, find the open question behind it and settle it in the rules file, so it is not patched by hand again.
- **Fix errors at the root** and state the cause in a line.
- **Save working states.** In a git project where the user wants commits, commit after every working step with a message that will make sense weeks later.
- **Guard keys and data.** Secrets belong in `.env.local` and stay out of source files and git history. When a form refuses to save, repair the access rule. Never disable the security to get it working.
- **Report honestly.** State what was verified, what could not be (a physical iPhone, the production domain), and which copy is invented. An on-screen confirmation proves nothing; the stored row does.
- **Check versions.** For GSAP, Three.js, React Three Fiber, Motion and Lenis, consult current documentation on compatible versions instead of relying on memory, and flag uncertainty.

## Reference files

| File | Read it when |
|---|---|
| `references/design-system.md` | Choosing typefaces, colours and spacing; converting vague style words into concrete ones; auditing a generic-looking page |
| `references/assets.md` | Writing image or video prompts, keeping visuals consistent, compressing media for the web |
| `references/cinematic-moves.md` | Adding a video hero, pinned scroll story, parallax, 3D accent, scroll-driven video, or a full live-3D scroll story |
| `references/ship.md` | Placing media, the phone pass, polish, speed, the contact form, deploy, domain, SEO, and the launch checklist |
