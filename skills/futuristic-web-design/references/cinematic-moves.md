# Cinematic moves

Entrance fades give a page some life. The five techniques here give it direction, the way a film uses a few chosen shots. Each has a price, so pick them deliberately and use few.

## Contents

- The five techniques and their price
- The budget
- Guardrails that apply to all of them
- Recipe: background video hero
- Recipe: pinned scroll story
- Recipe: a single 3D accent
- Recipe: scroll-driven video
- Scroll-driven video versus live 3D
- A full live-3D scroll story
- Measure what it cost

## The five techniques and their price

| Technique | Effect | Good fit | Price |
|---|---|---|---|
| Background video hero | A brief, unhurried clip replaces the hero photo and plays under the headline | The brand sells atmosphere | Bytes. Normally the largest download on the page |
| Scroll-tied motion | Elements animate according to scroll position and run backwards when the visitor scrolls up | You want the visitor to feel in control of the narrative | Frame rate on low-end phones |
| Pinned section | A section sticks in place and swaps its content as scrolling continues, then unsticks | A compact sequence of roughly three beats | Hijacks scrolling. Must be brief and needs a non-pinned alternative |
| Parallax depth | Background and foreground layers drift at unequal speeds | A static band wants a touch of movement | The lightest option, though it still counts as motion |
| Live 3D object | Geometry rendered in the browser in real time, reacting to scroll | A single hero product worth examining in the round | Typically the heaviest, both to download and to render on phones |

Names worth knowing: WebGL is the browser's 3D rendering layer; Three.js is the standard library on top of it, and React Three Fiber wraps it for React; GSAP ScrollTrigger binds animation to scroll; Lenis provides smoothed scrolling.

## The budget

The background video hero, and no more than two of the other four. Using all of them turns a website into a demo reel.

Choose by walking the page and testing each possible placement against one question: would motion here make something clearer, or make the visitor feel something specific? For each technique you keep, state its position, its contribution and its price. For each you drop, give a one-line reason. Settle this before writing code. If more are requested once two are in, be plain about the trade: added weight, and less impact for the ones already there.

Placements that tend to work: a three-beat pinned sequence right after the offer, at the point where a visitor is weighing trust; a small 3D accent next to the story copy, present only to signal craft.

## Guardrails that apply to all of them

Treat these as part of each technique. Decoration is never allowed to take the page down with it.

- **Reduced motion.** When `prefers-reduced-motion: reduce` is set: no pinning, no scrubbing, no 3D download. Present the content as a normal stacked layout or a static image.
- **Touch.** Verify with finger scrolling. No jumps, no horizontal overflow, no scroll traps.
- **Small screens.** Swap expensive effects, 3D above all, for a static image under a width breakpoint.
- **Deferred loading.** Fetch effect code as its section approaches the viewport, never during initial load.
- **Failure.** If the effect errors out or WebGL is missing, the static image stays and everything else on the page still works.
- **Truthful figures.** A counter that animates toward a real result must not stop on, or be screenshotted at, a false value ("7% no-shows" on the way to 6%). Animate the presentation, not the data: reveal the final number, or count only when the whole run is visible and quick.
- **Plan first.** These changes span multiple files. Present a plan, and get approval for each new package.
- **Versions.** Consult current documentation for the libraries and their compatible versions. Flag uncertainty.

## Recipe: background video hero

```html
<video autoplay muted loop playsinline preload="metadata" poster="/images/hero-poster.webp">
  <source src="/images/hero.mp4" type="video/mp4" />
</video>
```

- Phones only autoplay video that is both `muted` and `playsinline`. Omit `playsinline` and iOS opens the clip full screen.
- The poster paints first, so there is no empty frame while the clip downloads.
- For legibility, lay a gradient scrim under the text block alone. Dimming the entire clip defeats the purpose of having it.
- Position copy away from the clip's focal subject. Decide this independently for desktop and phone.
- With reduced motion set, display the poster and skip autoplay.
- When the clip fails to show, diagnose it (path, codec, autoplay policy). Do not design around the gap.

## Recipe: pinned scroll story

Behaviour:

- The section sticks once its top edge meets the top of the viewport, and stays stuck as scrolling continues.
- Scroll progress swaps one beat for the next. Each beat consists of an oversized numeral, a brief heading and a single sentence of genuine copy.
- When the final beat has shown, the section unsticks and normal scrolling resumes. Scrolling up plays it in reverse.

Build notes:

- GSAP ScrollTrigger using `pin: true` with `scrub`, driving a single timeline through the beats.
- Create it inside `gsap.matchMedia()` so it exists only when motion is permitted and cleans up after itself:

```js
const mm = gsap.matchMedia();
mm.add("(prefers-reduced-motion: no-preference)", () => {
  const tl = gsap.timeline({
    scrollTrigger: { trigger: section, start: "top top", end: "+=200%", pin: true, scrub: true },
  });
  // beat 1 out, beat 2 in, beat 2 out, beat 3 in
  return () => tl.scrollTrigger?.kill();
});
```

- Author the markup as plain stacked beats. With no script running, that markup already is the reduced-motion layout and the fallback.
- Stop at about three beats. Long pins make people work to get past them.
- Pinning is the technique most likely to misbehave on phones. Have it tested by thumb on an actual device.

## Recipe: a single 3D accent

A lone small object, placed once, rotating gently. It accompanies the section's existing image; it does not replace it.

- Construct the geometry in code from primitives and simple operations, working from a verbal description of the form (for a coffee bean: an elongated rounded body, flattened on one face, with a groove along its length). This avoids downloading or licensing a model file.
- Give it a slow idle rotation and add a slight extra tilt driven by scroll. Keep all of it subtle.
- Take material colours and lighting from the design system.
- Produce a static picture of the object for the fallbacks, either by capturing a canvas frame or by generating one, and state in the plan which.

Loading and fallbacks:

```js
// Load only near the viewport, on capable screens, when motion is allowed
const ok = matchMedia("(min-width: 768px)").matches &&
           !matchMedia("(prefers-reduced-motion: reduce)").matches;
if (ok) {
  new IntersectionObserver(async ([entry], io) => {
    if (!entry.isIntersecting) return;
    io.disconnect();
    try {
      const { mount } = await import("./accent-scene.js"); // three.js lives in this chunk
      mount(container);
    } catch {
      /* leave the static image in place */
    }
  }, { rootMargin: "300px" }).observe(container);
}
```

- The container starts out holding the static picture. The canvas takes over only after a successful mount.
- Stop the render loop while the canvas is out of view, cap device pixel ratio at 2, and dispose of geometries and materials on unmount.
- Once built, check it against the real object. Colour and proportion go wrong most often, so compare against a photo.

## Recipe: scroll-driven video

A brief clip whose playhead is tied to scroll position, like thumbing through a flip book in either direction. It delivers a "product separates into parts" effect for far fewer bytes than live 3D. `assets.md` explains how to produce the footage.

Ordinary video encoding assumes forward playback, which makes arbitrary seeking stutter. Re-encode so that every frame is a keyframe:

```bash
# Trim to the seconds with motion, strip audio, make every frame a keyframe
ffmpeg -ss 1 -to 5 -i in.mp4 -an -vf "scale=-2:720" -c:v libx264 -crf 24 -g 1 \
  -pix_fmt yuv420p -movflags +faststart explode.mp4
```

Then map scroll progress to time:

```js
ScrollTrigger.create({
  trigger: section, start: "top top", end: "+=150%", pin: true, scrub: true,
  onUpdate: (self) => { video.currentTime = self.progress * video.duration; },
});
```

- Mark the element `muted playsinline preload="auto"` and never call `play()` on it.
- Target roughly 1 MB or less: a short clip with a single action. Release the pin promptly afterwards.
- Captions can be revealed in sequence alongside, driven by the same progress value.
- With reduced motion set, substitute a static frame, whichever is most informative.
- Setting `currentTime` repeatedly can lag on some phones, iOS Safari especially. If so, extract the frames and paint them to a canvas instead. State in your report whether an actual iPhone was tried.

## Scroll-driven video versus live 3D

| | Scroll-driven video | Live 3D |
|---|---|---|
| Download | A single light file | Considerably more |
| Build time | Short | Long, with tuning |
| Appearance | Photographic | Rendered |
| Flexibility | Locked viewpoint; each product variant needs fresh footage | Responds to input; variants are a code change |

Video suits the majority of small-business sites. Choose live 3D when interaction or frequent variation is the actual goal.

## A full live-3D scroll story

A page with no product photography at all: everything is rendered live, and the narrative tracks the scrollbar in both directions.

**Write the story before any 3D.** Decide the opening beat, the beats that follow, and the feeling to leave the visitor with. The rendering is merely the medium.

**Drive everything from one value.** Normalised scroll progress, 0 to 1. Use no timers. Each object computes its state from that value alone, which is what makes reverse scrolling work for free.

Capture the build in a written spec (`SPEC.md` in the project) before coding. Its length comes from completeness, not cleverness. Sections, in order:

1. **Ground rule.** Implement the spec as written. No substitutions, shortcuts or extras.
2. **Foundations.** Libraries pinned to versions; the complete copy, including names, prices and every sentence; the design system.
3. **Timeline.** The core. Assign each story beat a start and finish on the 0-to-1 range, such as "pod opens 0.20-0.30, roasting 0.38-0.52".
4. **Objects.** A geometric description of each, to be modelled procedurally. No imported models.
5. **Light and camera.** Studio-style lighting. A camera rule that keeps the subject framed at every viewport size.
6. **Acceptance checks.** What to verify once it is built.

Process:

- Prototype small, in ordinary short steps. Once that works, document precisely what exists, numbers included, as the spec. That document seeds the next build and can be edited like any text.
- After a full build, run the acceptance checks and report which passed fully, which partly, and which were not run. Copy colliding with the canvas is a frequent miss.
- Budget for one fix round. Scroll slowly both ways, write the defects as a numbered list (observed, wanted), fix exactly those, then review again at 1440px.
- A striking result can still be wrong. Hold it against the spec before declaring it finished.
- The conventional page under the story can reuse the same objects, for example product cards rendered live or a chart that draws on scroll.

Builds of this scale consume a great deal of time and tokens per attempt, which is why the spec needs to be exact.

## Measure what it cost

Once techniques are in, measure. Compare transfer size before and after, per route and per breakpoint, and present a short table together with the files touched and packages added. Read the figure in context: a deferred 3D chunk around 130 KB is minor beside a hero clip that weighs more than a megabyte. If something is heavy, try to slim it. If it stays heavy, take it out.
