# Images and video

Visitors judge a site by its pictures before they read a word. A small set of strong, matching visuals does more than a large set of unrelated ones.

The formulas below suit any text-to-image or text-to-video generator (Google Flow, or whichever one the user has connected). If you can generate directly, get approval before spending credits. If you cannot, write the prompts for the user to run and carry on building with clearly marked placeholders.

## Contents

- Shot list first
- The image brief
- The style line
- Refining
- Hero video
- Frame pairs for scroll-driven video
- Ground rules
- Preparing files for the web

## Shot list first

Decide what is needed before generating. Otherwise the budget goes on images that do not belong together. A single-page site usually needs around seven:

| Asset | Aspect | Notes |
|---|---|---|
| Hero video | 16:9 | A few seconds, slow, loopable |
| Hero still | 16:9 | Doubles as poster and fallback |
| Offer shots (about three) | 4:5 or 1:1 | One per product or feature |
| Story image | To fit its slot | Safest without people |
| Texture | Any | Optional background detail |
| Share image | 1200x630 | Appears on link previews |

Fix each aspect ratio up front. Cropping a finished image afterwards wrecks its composition.

## The image brief

Write the prompt as you would brief a photographer, covering six things in order:

1. **Subject.** The object, what it is made of, what accompanies it.
2. **Setting.** The surface and the space around it.
3. **Lighting.** Where it comes from, how hard or soft, what the shadows do.
4. **Camera.** Height, focal length, depth of field.
5. **Mood and palette.** A few mood words plus the site's own colours.
6. **Format.** The aspect ratio.

Worked example for a skincare brand:

> A small amber glass serum bottle with a matte black dropper cap on a slab of pale travertine, a single green leaf lying next to it. Low afternoon sun from the right, crisp shadow with a soft edge. Slightly above eye level, 85mm lens, shallow depth of field. Quiet, clean, unhurried. Sand and warm white with one deep green detail. Label left blank. Vertical 4:5.

Ask for blank labels and signs. Generators garble lettering, and real text belongs in the HTML regardless.

## The style line

Images read as one shoot when light, lens and colour never change. Lift those three sentences from the first image the user approves:

> Low afternoon sun from the right, crisp shadow with a soft edge. Slightly above eye level, 85mm lens, shallow depth of field. Quiet, clean, unhurried. Sand and warm white with one deep green detail.

Reuse them word for word in every later prompt, swapping in a new subject and setting. Store the line in the project (a `prompts.md` works) so images made weeks later still fit. Prompts written from scratch each time produce pictures that look fine individually and unrelated as a set.

## Refining

Produce a few candidates, choose one, then adjust a single property per round while stating what must stay:

> Keep the scene and light as they are. Lift the viewpoint a little and open up empty space across the left third.

When a revision alters more than requested, discard it and regenerate. Reserve clear space in the frame for wherever the headline will go.

## Hero video

The hero clip is atmosphere. It supports the headline and must never upstage it: unhurried, an almost static camera, no lettering, no dialogue, fine with the sound off. Think of a still photo with a little life in it.

**Animate an approved still (best).** Supply the hero still as the opening frame and describe the motion only, which guarantees the clip matches the rest of the imagery.

> Only the steam moves: a thin thread rising and leaning left. Lighting holds steady. A barely perceptible push-in. Every other element stays frozen.

That last instruction, pinning down everything else, is what keeps the clip calm. Always include it.

**Generate from text.** Start from the image brief and add one motion:

> [Subject] in close-up, slowed down, with a single small motion: [motion]. Fixed tripod shot. [Style line]. No lettering, no faces. 16:9.

Guidance:

- Approve the still before generating video. Video generations cost more.
- Limit the clip to one modest motion. Each additional one competes with the headline.
- Play every clip through to its final frame before accepting. Distortion and runaway camera moves tend to appear late. A flawed ending can be cut off; a flawed middle calls for a regeneration with one sentence altered.

## Frame pairs for scroll-driven video

To show a product separating into parts (or assembling) under the visitor's scroll, generate a short clip between two stills. The scroll code is in `cinematic-moves.md`. The footage is made like this:

1. **Opening still, assembled.** Studio side view. Product small and centred, with generous empty space on the side the parts will move into. Plain backdrop, soft constant light, no lettering, no hands.
2. **Closing still, built from the opening still.** Never prompt it from scratch, because the product and backdrop will come out different. Give the generator the opening still and request the identical product, viewpoint, light and backdrop, now exploded: parts spaced along one straight axis with visible gaps, everything else untouched.
3. **The clip.** Opening still as first frame, closing still as last frame. The prompt covers motion only: which parts travel, which way, at a slow even pace; which part stays put; and that viewpoint, backdrop and light are constant.

A static camera is essential. Scroll position will drive this clip, and any camera drift makes the entire page appear to wobble. Aim for a handful of seconds and a single action.

## Ground rules

- Keep real people and third-party logos out of generated assets on client sites.
- Read the generator's licence terms before commercial use.
- A real business should show its real products. Use generated imagery for atmosphere, texture and concepts.

## Preparing files for the web

Generator output is far too heavy to ship. Weight matters more than polish here: a visitor on mobile data waits for every byte, while a laptop reading from its own disk hides the problem completely.

Store files under `public/images/` with descriptive names (`hero.mp4`, `hero-poster.webp`, `product-serum.webp`).

| File | Target |
|---|---|
| Hero image | WebP, max 1920px wide, roughly 300 KB |
| Other images | WebP, max about 1000px wide, roughly 150 KB |
| Hero video | H.264 MP4, max 1080p, audio removed, below 4 MB |
| Poster | The video's opening frame, WebP |

Get approval before installing tooling. Using `ffmpeg`:

```bash
# Image to WebP, capped at 1920px wide
ffmpeg -i hero.png -vf "scale='min(1920,iw)':-2" -c:v libwebp -quality 80 hero.webp

# Hero video: cap at 1080p, strip audio, web-optimised. Raise -crf to shrink further.
ffmpeg -i in.mp4 -an -vf "scale=-2:'min(1080,ih)'" -c:v libx264 -crf 27 -preset slow \
  -pix_fmt yuv420p -movflags +faststart hero.mp4

# Poster from the opening frame
ffmpeg -i hero.mp4 -frames:v 1 hero-poster.webp
```

End by giving the user a table of sizes before and after, so the saving is shown rather than asserted.
