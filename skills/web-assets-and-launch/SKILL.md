---
name: web-assets-and-launch
description: Fast path for preparing a website's media and getting it live - compressing images and video for the web, writing matching image and video prompts for a generator such as Google Flow, the phone, polish, speed and security passes, search and sharing metadata, and deploying to Vercel. Use when the user asks to optimise or generate images or video, audit or polish an existing site, check for leaked keys, set up SEO or link previews, or launch. For a whole new site use futuristic-web-design instead.
---

# Web assets, polish and launch

A short routine for the finishing work on a site that already exists. It covers the visuals and shipping steps of the `futuristic-web-design` skill, packaged so they can run alone.

If `../futuristic-web-design/` sits next to this skill, its reference files hold the detail: `references/assets.md` for prompts and the `ffmpeg` commands, `references/ship.md` for the passes, the form, deploy, domain and the full launch checklist.

Do only the part the user asked for. Each heading below stands alone.

## Prepare files for the web

Generator and camera output is far too heavy to ship. A visitor on mobile data waits for every byte, while a laptop reading from its own disk hides the problem.

Get approval before installing tooling such as `ffmpeg` or `sharp`. Some `ffmpeg` builds have no WebP encoder; `cwebp` or `sharp` does the same job if one is already installed.

Store files with descriptive names under `public/images/` in Next.js. In a plain HTML site, keep them in an `images/` folder next to the page: on Vercel, a site without a framework serves only the `public/` folder when one exists, which would hide the page itself.

| File | Target |
|---|---|
| Hero image | WebP, at most 1920px wide, roughly 300 KB |
| Other images | WebP, at most about 1000px wide, roughly 150 KB |
| Hero video (`hero.mp4`) | H.264 MP4, at most 1080p, audio removed, below 4 MB |
| Poster (`hero-poster.webp`) | The video's opening frame |

Finish with a table of sizes before and after, so the saving is shown, not asserted.

## Write prompts for images and video

These suit Google Flow or any other generator. If you can generate directly, get approval before spending credits. If you cannot, hand the user the prompts and continue with clearly marked placeholders.

- **Shot list first.** Decide the assets and their aspect ratios before generating: about seven for a one-page site (hero video, hero still, three offer shots, a story image, a share image).
- **The image brief, six parts in order:** subject, setting, lighting, camera (height, lens, depth of field), mood and palette, format (16:9 hero, 4:5 product). Ask for blank labels, because generators garble lettering and real text belongs in the HTML.
- **The style line.** Lift the lighting, camera and mood-and-palette sentences from the first approved image and reuse them word for word in every later prompt. That is what makes the set look like one shoot.
- **Hero video.** Animate the approved still, describe one small motion, and state that everything else stays frozen with a fixed camera.
- **Exploded-view clip.** Opening still: the assembled product, small and centred, with empty space where the parts will go. Closing still: built from the opening still, never from scratch, with the parts spaced along one straight axis and the same viewpoint, light and backdrop. The clip runs from the first still to the second with a locked camera.

Keep real people and third-party logos out of generated assets, and show a real business's real products.

## Phone, polish and speed

- **Phone pass at 390px.** Readable text, nothing pressed against the edge, tap targets of about 44px, no horizontal scroll, a working menu toggle. Fix as an itemised list, then scroll again. A resized desktop browser only approximates a phone, so ask for a check on a real device and say so if none was done.
- **Polish pass.** Uniform gaps between sections, equal sizes for headings of equal rank, hover and focus styling on every interactive element, no leftover preview routes.
- **Speed.** Profile under a mobile preset and name the three highest-impact improvements, largest first. Where one means dropping something the user values, flag it for their decision.

List what you find before changing anything the user did not ask to have changed.

## Keys

- `.env.local` holds the keys and is listed in `.gitignore`.
- Site code uses public keys only. Secret or service keys never reach client code.
- Search the code and the git history for secrets, and report what was checked.
- A secret that was ever served in page code or committed to git is exposed, even if the repository was never pushed: visitors could read the page, and the history travels with every copy and every future push. Removing it from the file does not undo that. Tell the user to rotate it in the provider's dashboard, whatever its value looks like.

## Search and sharing

- Title of at most 60 characters and description of at most 155, stating what is sold and where. The brand name alone means nothing to a stranger.
- Share image of 1200x630 at `public/images/share.webp`, set as the Open Graph and Twitter image.
- Favicon, sitemap and robots file.
- Set the production domain as the base URL so the share image and sitemap resolve. Ask for it if unknown.

## Deploy

Deploy only when the user asks.

- Connect the repository to Vercel. Each push to the main branch then redeploys production.
- Enter the `.env.local` values in the host's project settings. A form that works locally and breaks in production is nearly always missing these.
- On a failed build, read the log and fix the root cause.
- Verify on the production URL from a phone on mobile data: load the page, submit the form, and look for the stored row.
- Paste the link into a messaging app to check the preview card.

Report honestly: what was verified, what could not be (a physical phone, the production domain), and what is left for the user.
