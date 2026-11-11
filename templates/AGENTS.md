# AGENTS.md

Project rules for every coding agent that works on this site. Fill in each [bracket] once. `CLAUDE.md` imports this file, so there is nothing to fill in twice.

## Overview
- Business: [name, what it sells, and where]
- Audience: [who the site is for]
- Goal: [the one action a visitor should take, e.g. "send an enquiry"]
- Feeling: [three adjectives and a comparison, e.g. "quiet, precise, generous, like a well-run studio"]
- Sections, in order: [Navigation, Hero, Trust strip, Products, Story, Testimonials, FAQ, Contact, Footer]

## Stack
- Next.js + Tailwind CSS
- shadcn/ui for interactive widgets (accordion, dialog, menu, inputs)
- [Optional: Supabase for the contact form, Vercel for hosting]

## Working rules
- Each component in its own file under `components/`.
- Phone first. Nothing may break at 390px.
- Write real copy. No lorem ipsum, and no invented customers, reviews or statistics.
- Ask before adding a package or tool, and say what it is for.
- One change per request. Leave everything else as it is.
- Look at the page in a browser at 390px, 768px and 1440px before reporting it done.
- Keys stay in `.env.local`, which stays in `.gitignore`. Never put a key in code, a commit or a chat message.
- Solo project: commit straight to `main` after each working step, no branches. [Delete this line on a team project.]

## Design
Typefaces (Google Fonts)
- Headlines: [font]
- Reading text: [font]

Palette
| Role | Hex | Where it appears |
|---|---|---|
| Page | #...... | Backgrounds |
| Ink | #...... | Headings, paragraphs |
| Primary | #...... | The lead button and the main highlight |
| Accent | #...... | [one specific use, or "held back"] |
| Muted | #...... | Captions, secondary copy, hairline borders |

Constraints
- Palette colours and the two typefaces only.
- One vertical gap between sections and one small corner radius, sitewide.
- One lead button per section. Other actions are text links or quiet outlines.
- A hero headline of about eight words at most.
- Flat surfaces, hairline borders, generous whitespace. No gradients standing in for a palette. Shadow on hover only.
- Everyday motion is a short fade and slide up, under 500ms, once. Under reduced motion nothing moves.
- Cinematic budget: a background video hero plus at most two other techniques, each with a still-image fallback.

## Skills
The detailed method lives in skill folders (`.claude/skills/`, `.agents/skills/` or `.windsurf/skills/`). Read the matching `SKILL.md` before starting the task.

| Task | Skill |
|---|---|
| A new site, a redesign, or "it looks generic" | `futuristic-web-design` |
| One section, or layout options to compare | `new-section` |
| Scroll animation, a pinned section, parallax, 3D, scroll-driven video | `cinematic-3d-scroll` |
| Media, image prompts, polish, speed, keys, SEO, launch | `web-assets-and-launch` |

If none of those folders exists, install the skills first: `npx skills add mukulmunda41-create/futuristic-web-design-skills`
