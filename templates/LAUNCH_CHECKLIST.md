# Launch Checklist

Tick every box before you share the link. Anything you cannot tick, hand to your agent with the matching prompt from `prompts.md`.

## Page
- [ ] Every section in the plan is built, in the right order
- [ ] No lorem ipsum, placeholder names or sample prices anywhere
- [ ] Every button and link goes somewhere real
- [ ] Every button and link reacts to hover and to keyboard focus
- [ ] The button colour appears only on buttons and the main highlight
- [ ] Only the two chosen fonts appear, including in labels, numbers and badges
- [ ] Every figure, price and quote is real
- [ ] Section spacing and heading sizes are consistent from top to bottom
- [ ] The hero headline is 8 words or fewer and readable in under 2 seconds
- [ ] Preview routes (`/preview-1`, `/before`, `/after`) are deleted

## Images and Video
- [ ] All images are WebP
- [ ] Hero image is at most 1920px wide and about 300KB
- [ ] Product and story images are at most 1000px wide and about 150KB
- [ ] `hero.mp4` is 1080p or smaller, has no audio track, and is under 4 MB
- [ ] `hero-poster.webp` exists and shows while the video loads
- [ ] Every image below the hero is lazy-loaded
- [ ] Every image has alt text that says what is in the picture

## Motion
- [ ] Animations are subtle: fade in and slide up, under 0.5s, once
- [ ] No more than a slow video hero plus one or two cinematic moves on the page
- [ ] Pinned sections let go cleanly, with no jump when they release
- [ ] With "reduce motion" turned on, nothing moves: no pinning, no smooth scrolling, no hover transitions, and the 3D and scroll video are replaced by still images
- [ ] 3D loads only when its section is near the screen, and shows a still image if WebGL is unavailable

## 390px Phone
Check on a real phone, not only in the browser.
- [ ] No sideways scroll on any section
- [ ] No text too small to read, and no heading breaking onto 5 or more lines
- [ ] Nothing touches the screen edges
- [ ] Every button is big enough for a thumb (about 44px)
- [ ] The menu button opens and closes, and its links work
- [ ] Product card prices and buttons line up
- [ ] 3D is replaced by a still image
- [ ] The hero video plays without tapping, muted

## Supabase Form
- [ ] A test message arrives in the `leads` table with name, email and message
- [ ] An invalid email is rejected with a clear message
- [ ] An empty message is rejected with a clear message
- [ ] A clear success message shows after sending
- [ ] A clear error message shows if sending fails (test with Wi-Fi off)
- [ ] Row Level Security is on: public insert allowed, public read blocked
- [ ] Spam bot protection is in place
- [ ] The form works on the live site, not only on your computer

## Keys
- [ ] `.env.local` is listed in `.gitignore`
- [ ] Only the public anon key is used in the site code
- [ ] No secret or service-role key appears in any file or in the git history
- [ ] The same values are added in the Vercel project settings

## Live SEO
Check these on the live URL.
- [ ] Page title is under 60 characters and says what is sold and where
- [ ] Meta description is under 155 characters
- [ ] `public/images/share.webp` is 1200x630, and pasting the link into a chat app shows the card
- [ ] Favicon shows in the browser tab
- [ ] `/sitemap.xml` opens
- [ ] `/robots.txt` opens and does not block the site
- [ ] The site loads over `https` on the final domain
- [ ] The live URL loads on a phone over mobile data
