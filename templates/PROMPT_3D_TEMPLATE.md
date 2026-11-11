# Master Prompt: Full-Page Real-Time 3D Scroll Website

A six-part blueprint. Fill in every [bracket], delete the guidance lines in *italics*, and paste the whole thing into your coding agent as one prompt. A full 3D page is the opposite of the pack's usual restraint, so use it only when the 3D scene is the product story.

---

## Part 1: Role and the one strict rule

```
You are a senior creative developer who builds real-time 3D scroll websites.

Strict rule: there is ONE fixed, full-screen 3D canvas behind the page, and scroll position is the only thing that drives it. Scroll progress from 0 to 1 is the single source of truth for the camera, every object and every text panel. No autoplaying timelines, no per-section canvases, no downloaded 3D models, no stock assets.

Build nothing until you have read all six parts. If any part is unclear or contradicts another, ask before writing code.
```

## Part 2: Tools, exact versions, copy and design system

*Pin exact versions so the build is repeatable. Get the current ones with `npm view <package> version` and write them in.*

```
Tools (install exactly these versions, and ask before adding anything else):
- next@[version]
- react@[version] and react-dom@[version]
- three@[version]
- @react-three/fiber@[version]
- @react-three/drei@[version]
- gsap@[version] (with ScrollTrigger)
- lenis@[version] for smooth scrolling
- tailwindcss@[version]

Copy (use word for word, no lorem ipsum, add nothing):
- Brand: [name]
- Scene 1 headline: [8 words at most]
- Scene 1 line: [one sentence]
- Scene 2 heading: [...]   Line: [...]
- Scene 3 heading: [...]   Line: [...]
- Scene 4 heading: [...]   Line: [...]
- Final CTA heading: [...]   Button label: [...]   Button link: [...]

Design system:
- Heading font (Google Fonts): [name], tight tracking, large scale
- Body font (Google Fonts): [name]
- Page: #[hex]
- Ink: #[hex]
- Primary: #[hex] (the CTA button and one emissive detail in the 3D scene, nothing else)
- Muted: #[hex]
- Accent: #[hex] (one specific use, or held back)
- Text panels sit over the canvas as plain HTML: flat, 1px border or frosted glass, no gradients.
```

## Part 3: Scroll timeline, 0% to 100%

*Every row needs a start and an end percentage. Rows may overlap by a few percent so one move blends into the next. Leave no gaps.*

```
Total scroll length: [600]vh. Scroll progress is scrubbed with a smoothing of about 1 second.

| Start | End  | Scene     | Camera                                   | Object                                         | Text panel                        |
| ----- | ---- | --------- | ---------------------------------------- | ---------------------------------------------- | --------------------------------- |
| 0%    | 15%  | Arrival   | [slow push in from z=8 to z=6]           | [hero shape turns slowly, centred]             | [Scene 1 headline and line, left] |
| 15%   | 35%  | Reveal    | [orbits 60 degrees to the right]         | [shape tilts toward the camera]                | [Scene 2, fades in right]         |
| 35%   | 55%  | Breakdown | [pulls back to z=9]                      | [shape separates into parts along the Y axis]  | [Scene 3, left]                   |
| 55%   | 75%  | Detail    | [moves close to one part, z=3]           | [that part turns, the others dim]              | [Scene 4, right]                  |
| 75%   | 90%  | Reassemble| [returns to front view, z=6]             | [parts come back together]                     | [none]                            |
| 90%   | 100% | Close     | [settles, shape moves to the upper third]| [shape slows to rest]                          | [Final CTA, centred]              |

Rules for the timeline:
- Scrolling up plays everything in reverse, exactly.
- Each text panel fades and slides in over the first 3% of its range and out over the last 3%.
- The final state at 100% is still and readable.
```

## Part 4: Procedural 3D shape recipes

*Describe every object as a recipe the agent can build in code. Pick from these or write your own in the same form.*

```
Build every object in code with Three.js geometry. No model files.

Hero shape: [choose one and fill in]
- Faceted gem: IcosahedronGeometry, radius [1.4], detail [1], flat shading. MeshPhysicalMaterial with transmission [0.9], roughness [0.1], thickness [1.2], tinted #[hex].
- Knot: TorusKnotGeometry, radius [1], tube [0.32], p [2], q [3]. MeshStandardMaterial, metalness [0.9], roughness [0.25], colour #[hex].
- Capsule product: LatheGeometry from a hand-written profile curve of [12] points, [64] segments. Matte body #[hex] with one emissive band in the primary colour.
- Stacked slabs: [5] rounded boxes of size [2 x 0.25 x 2] stacked on Y with a gap of [0.08]. Used for the breakdown scene, where each slab moves apart on Y.
- Ribbon: TubeGeometry along a CatmullRomCurve3 of [6] points, radius [0.06], in the primary colour.

Supporting elements:
- Particle field: [800] instanced spheres of radius [0.01] in a volume of [12 x 8 x 12], colour #[muted hex], drifting very slowly.
- Ground: none, or a single large plane that only receives a soft contact shadow.

Limits: under [150,000] triangles in total, at most [3] materials using transmission, instancing for anything repeated more than 10 times.
```

## Part 5: Studio lighting and camera

```
Lighting (product-studio look, no coloured party lights):
- Environment: a neutral studio environment generated in code (RoomEnvironment through PMREMGenerator), intensity [0.6]. No downloaded HDR files.
- Key light: soft area or directional light, upper front-left at [-4, 5, 4], intensity [2.5], warm white.
- Fill light: opposite side at [4, 2, 3], intensity [0.6], cool white.
- Rim light: behind and above at [0, 4, -5], intensity [3], to separate the object from the background.
- Shadows: one soft contact shadow under the object. No hard shadows.
- Background: the page background colour #[hex], with a very subtle fog of the same colour starting at [10] and ending at [22].

Camera:
- PerspectiveCamera, field of view [35], near [0.1], far [100].
- It always looks at the hero shape's centre, with easing, and never cuts.
- The camera path follows the timeline in Part 3 only.

Rendering:
- ACES filmic tone mapping, sRGB output, antialiasing on.
- Device pixel ratio capped at [2].
- Render only while the tab is visible.
```

## Part 6: End verification checklist

```
Before you say it is finished, check each of these and report pass or fail in a table. Fix any failure, then check again.

1. Timeline: at 0%, 15%, 35%, 55%, 75%, 90% and 100% the camera, object and text match the table in Part 3.
2. Reverse: scrolling from 100% back to 0% plays everything backward with no jump.
3. Copy: every word on the page comes from Part 2, with no extra text.
4. Design: only the five colours and two fonts from Part 2 are used, and the primary colour appears only on the CTA and the one emissive detail.
5. Readability: every text panel is readable over the canvas at every scroll position.
6. Phone at 390px: no sideways scroll, text panels fit, and either the scene runs smoothly or a still image is shown instead. Say which.
7. Reduced motion: with prefers-reduced-motion on, the canvas is replaced by still images and the content is a plain stacked page.
8. No WebGL: with WebGL unavailable, a still image and the full text content still show.
9. Performance: frame rate on a mid-range laptop while scrolling, total triangles, and total JavaScript weight, as numbers.
10. Loading: the 3D code is loaded separately from the first paint, and the headline is visible before the scene is ready.
11. Console: no errors or warnings.
12. Versions: the installed versions match Part 2 exactly.

End with a 3-line summary: what was built, which files were created, and what I should look at first.
```
