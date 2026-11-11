---
name: new-section
description: Fast path for adding, restyling or rebuilding one section of an existing website (navigation, hero, trust strip, products, story, testimonials, FAQ, contact, footer) or for comparing layout options side by side. Use when the site and its design rules already exist and the user wants a single section built, changed or shown in a few variants, including a contact form that saves to a database. For a whole new site, a redesign, or a site that looks generic, use futuristic-web-design instead.
---

# New section

A short routine for one section on a site that already has its rules. It is the section step of the `futuristic-web-design` skill, packaged so it can run alone.

If `../futuristic-web-design/` sits next to this skill, its reference files hold the detail. Read the one the task needs: `references/design-system.md` for layout vocabulary and the generic-site audit, `references/ship.md` for the contact form and the phone pass.

If the project has no rules file or no design system yet, stop and use `futuristic-web-design` from its first phase. A section built without a design system is where the generic look comes from.

## The routine

1. **Read the rules.** Open the project rules file (`AGENTS.md`, `CLAUDE.md` or `GEMINI.md`) and the theme tokens. Use only the typefaces and palette defined there, and the stack the project already uses.
2. **Confirm the content.** Where facts matter (prices, claims, names, quotes), ask. Never invent customers, reviews or statistics for a real business. Elsewhere write real copy and flag the lines you made up. No filler text.
3. **Pick a layout on purpose.** Split, centred, full-bleed, grid, bento or asymmetric. Say which and why in a line. Avoid the default of a centred heading over three identical cards: promote one item and offset the others.
4. **Build one component in its own file** under `components/`, or the project's equivalent.
5. **Check it at 390px, 768px and 1440px** in a browser, and repair what you see. A layout can satisfy every rule and still look off.
6. **Match the spacing** above and below with the neighbouring sections.
7. **Report in three lines:** what was built, the file path, and what needs the user's eyes (invented copy, unwired buttons, anything you could not verify).

Change only the section that was asked for. A diff wider than the request hides which edit helped.

## Layout options

When the user asks for options, or cannot describe what they want, build two or three variants from the same content. Put each on its own preview route (`/preview-1`, `/preview-2`, or `/before` and `/after` for a restyle) with a one-line description. People choose more easily than they specify.

Leave the real page untouched until they pick. Then delete the other variants and their routes, because leftover preview routes ship with the site.

## What makes a section look designed

- **Type.** The headline typeface large with tight tracking, the reading typeface for everything else. Two typefaces only; framework defaults such as `font-mono` on a label count as a third. A hero headline is about eight words at most.
- **One lead button.** Filled, in the palette's button colour, tied to the action in the brief. A second action is a text link with an arrow or a quiet outline. Two buttons of equal weight signal that no decision was made.
- **Every button goes somewhere real.** If the destination is unknown, use the nearest honest target and list the button as unwired in the report.
- **Surface and space.** Generous whitespace, flat fills, hairline borders, optional grain or glass. No gradients standing in for a palette. Shadow on hover only.
- **Images.** Served at display size, lazy-loaded below the first screen, with alt text that describes the picture ("amber serum bottle on pale stone", never "image 1").
- **Motion.** A short fade and a few pixels of upward travel, under 500ms, once. Under `prefers-reduced-motion` nothing moves, including smooth scrolling and hover transitions.

## The 390px check

Phones account for most visits, so this is the width that decides whether the section is done.

- Body text is readable, and no headline wraps across five or more lines.
- Nothing is pressed against the screen edge.
- Tap targets are about 44px or larger.
- There is no horizontal scroll.
- Navigation collapses behind a menu toggle that opens and closes.
- Cards in a row keep prices and buttons on the same line, whatever the length of the text above them. Check this at all three widths.

## Contact section

A form with no destination does harm, because people assume their message arrived. The model is a letterbox: open for posting to everyone, locked for reading to everyone but the owner.

- Fields `name`, `email`, `message`, saved to a `leads` table in Supabase, or the backend the project already uses.
- Row level security on: anonymous insert allowed, no public read. Do not chain `.select()` onto the insert; with no read access it makes the call fail.
- Site code uses the public key only, loaded from `.env.local`, which stays git-ignored.
- Validate before sending (plausible email format, non-empty message) and explain any rejection. Give distinct messages for success and for failure.
- Spam defence: a hidden honeypot field that must stay blank, plus rejecting submissions that arrive faster than a person could type.
- Test as a visitor would: a blank message, a malformed email, a valid submission. Only a new row in the table proves it works; a confirmation on screen does not.
- When a save fails, read the error and correct the policy. Never turn row level security off, because this table holds people's names and addresses.
