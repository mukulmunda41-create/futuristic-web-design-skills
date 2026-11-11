---
name: cinematic-3d-scroll
description: Fast path for adding one cinematic technique to an existing website - a slow background video hero, scroll-tied motion, a pinned scroll story with GSAP ScrollTrigger, parallax depth, a procedural 3D accent with Three.js or React Three Fiber, or a video scrubbed by scroll. Use when the user asks for scroll animation, a pinned or sticky section, parallax, a 3D object, or a video that plays as they scroll, on a site that already exists. For a whole new site use futuristic-web-design instead.
---

# Cinematic scroll and 3D

A short routine for adding one cinematic technique to a site that already exists. It is the cinematic step of the `futuristic-web-design` skill, packaged so it can run alone.

If `../futuristic-web-design/` sits next to this skill, read `references/cinematic-moves.md` there before writing scroll or 3D code. It has the code for each recipe below, the re-encoding command, and the process for a full live-3D scroll story.

## The budget

There are five techniques: a background video hero, scroll-tied motion, a pinned section, parallax depth, and a live 3D object. Use the background video hero and no more than two of the other four. A page that uses all of them reads as a demo reel, tires the visitor, and weakens each effect.

Before writing code, walk the page and ask of each placement: would motion here make something clearer, or make the visitor feel something specific? State what you will add, where, what it contributes and what it costs. If the user asks for more once two are in, be plain about the trade: added weight, and less impact for the ones already there.

## Guardrails for every technique

Decoration is never allowed to take the page down with it.

- **Reduced motion.** Under `prefers-reduced-motion: reduce` there is no pinning, no scrubbing and no 3D download. Show a normal stacked layout or a still image. This covers smooth scrolling and transitions too, and script-driven motion needs its own `matchMedia` check because it does not obey CSS.
- **Touch.** Verify with finger scrolling: no jumps, no horizontal overflow, no scroll traps.
- **Small screens.** Below 768px, swap 3D for a still image.
- **Deferred loading.** Fetch effect code as its section nears the viewport, never during the initial load.
- **Failure.** If the effect errors or WebGL is missing, the still image stays and the rest of the page works.
- **Truthful figures.** An animated counter must never rest on a false value. Animate the presentation, not the data.
- **Versions.** Check current documentation for GSAP, Three.js, React Three Fiber and Lenis and their compatible versions. Ask before installing each package.

## Recipes

### Background video hero

- A `video` element with `autoplay`, `muted`, `loop`, `playsinline` and a `poster`. Phones only autoplay video that is muted and inline.
- The poster (`hero-poster.webp`) paints first, so there is no empty frame while `hero.mp4` downloads.
- For legibility, put a gradient scrim under the text block only. Dimming the whole clip defeats the point of having it. The headline should be readable within a couple of seconds.
- Keep copy away from the clip's focal subject. Decide this separately for desktop and phone.
- Under reduced motion, show the poster and skip autoplay.

### Pinned scroll story

- The section sticks when its top reaches the top of the viewport, steps through about three beats as scrolling continues, then releases. Scrolling up plays it backwards.
- Each beat is an oversized numeral, a short heading and one sentence of real copy.
- Build it with GSAP ScrollTrigger (`pin` and `scrub`) inside `gsap.matchMedia()` so it exists only when motion is allowed and cleans up after itself.
- Author the markup as plain stacked beats. With no script running, that markup is already the fallback.
- Pinning is the technique most likely to misbehave on phones. Ask for a test by thumb on a real device, and say so if none was done.

### One procedural 3D accent

- A single small object, placed once, next to the section's content. Build the geometry in code from primitives, working from a verbal description of the form. No downloaded model files unless the user asks.
- A slow idle rotation plus a slight tilt driven by scroll. Materials and lighting come from the design system, lit like a studio product shot.
- The container starts with a still picture of the object. The canvas replaces it only after the 3D code has loaded and mounted.
- Load only at 768px and wider, when motion is allowed, and when the section is near the viewport. Pause rendering while off screen and cap device pixel ratio at 2.

### Scroll-driven video

- A short clip whose playhead follows scroll position in both directions. It gives a "product comes apart" effect for far fewer bytes than live 3D.
- Re-encode first so every frame is a keyframe, with audio removed and the clip trimmed to the seconds that move. Target roughly 1 MB or less.
- Pin the section and map scroll progress to `video.currentTime`. Mark the element `muted` and `playsinline`, and never call `play()` on it.
- Reveal text callouts in sequence from the same progress value. Release the pin promptly.
- Under reduced motion, show the most informative still frame.

## Measure what it cost

After adding a technique, compare transfer size before and after and report a short table with the files touched and packages added. If something is heavy, slim it. If it stays heavy, take it out.
