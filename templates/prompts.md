# Prompt Pack

Six drawers, in the order you will use them. Copy a prompt, replace every [bracket], and paste it into your coding agent. Each prompt does one job, so run them one at a time and look at the result before the next.

---

## Drawer 1: Start

### 1.1 Create the project
```
Create a new Next.js project in this folder with Tailwind CSS and shadcn/ui. Ask me before installing anything else. When it runs, tell me the local address to open and stop there.
```

### 1.2 Write the brief
```
Open AGENTS.md. Ask me one question at a time to fill in the Overview: the business, the audience, the one action a visitor should take, how the site should feel (three adjectives and a comparison), and the sections in order. Write my answers into the file and show me the result.
```

### 1.3 Choose the look
```
Make a temporary preview page showing three clearly different design directions side by side. Each one has a headline font and a reading font from Google Fonts, five hex colours (page, ink, primary, accent, muted), a name, a one-sentence mood, and a sample headline, paragraph, button and card drawn in that look. When I pick one, write it into the Design section of AGENTS.md and into the theme, then delete the preview page.
```

### 1.4 Plan the page
```
Read AGENTS.md. Before writing any code, list the sections you will build, in order, with one line on what each one is for and which layout you suggest (split, centred, full-bleed, grid, bento, asymmetric). Wait for my go-ahead.
```

### 1.5 First commit
```
Commit everything to main with a short message. Confirm .env.local is in .gitignore first.
```

---

## Drawer 2: Build

### 2.1 Build a section
```
Build the [Hero / Social Proof / Products / Story / Testimonials / FAQ / Contact / Footer] section.

Content:
[paste the real headline, copy, button labels, prices, names]

Follow the Design System in AGENTS.md. One component in components/. Check it at 390px, 768px and 1440px, then give me the 3-line summary.
```

### 2.2 Show me options
```
Give me 3 different layouts for the [section name] section using the same content. Put each on its own preview route (/preview-1, /preview-2, /preview-3) and describe each in one line. Do not touch the real page until I choose.
```

### 2.3 Restyle a section
```
Restyle the [section name] section. Keep the content exactly as it is. What I want changed: [e.g. more whitespace, a split layout, larger heading]. Put the old version on /before and the new one on /after so I can compare.
```

### 2.4 Slow video hero
```
Turn the hero into a slow video hero using public/images/hero.mp4 with hero-poster.webp as the poster. The video is muted, loops and plays inline. Darken only the area behind the headline so it reads in under 2 seconds, and keep the text clear of the main subject of the video.
```

### 2.5 Contact form
```
Build the Contact section with a form that saves name, email and message to a Supabase table called leads. Use only the public anon key from .env.local. Give me the SQL to create the table with Row Level Security on: anyone can insert, nobody can read publicly. Check the email is real and the message is not empty, show a clear success and error message, and add spam bot protection. Tell me exactly what I need to do in the Supabase dashboard.
```

### 2.6 Navigation and footer
```
Build the top navigation and the footer. On a phone the navigation collapses into a menu button. Links scroll to the matching section. The lead button in the nav is the only filled button, and it goes to [where the button should lead].
```

### 2.7 Replace the weakest section
```
Scroll through the whole page and tell me which section is the weakest and why. Build two alternatives for it on /preview-1 and /preview-2 with a one-line description of each. When I choose, delete the other versions and the preview routes.
```

---

## Drawer 3: Fix

### 3.1 Fix the phone view
```
Open the page at 390px wide and go through every section. Fix any text that is too small or breaks onto 5 or more lines, anything touching the screen edges, any button too small for a thumb, and any sideways scroll. List what you changed, section by section.
```

### 3.2 Line things up
```
In the Products section the prices and buttons sit at different heights from card to card. Make them line up on the same horizontal line at 390px, 768px and 1440px, whatever the length of the product name or description.
```

### 3.3 Even out the spacing
```
The spacing between sections is uneven. Measure the top and bottom padding of every section, tell me the values, then make them consistent. Change spacing only.
```

### 3.4 Something broke
```
This error appeared:

[paste the full error]

Find the cause before changing anything, explain it in one or two sentences, then fix only that.
```

### 3.5 Undo
```
I do not like the last change. Put [section name] back exactly as it was before it, and change nothing else.
```

### 3.6 Too much
```
The page feels busy. Check it against the Constraints in AGENTS.md and list every place that breaks them (a colour outside the palette, a third font, gradients, shadows, too many animations). Wait for me to say which ones to fix.
```

### 3.7 Check it on my real phone
```
Give me the address to open this site on my own phone over the same Wi-Fi, and tell me which sections to check first. I will tell you what I see.
```

---

## Drawer 4: Assets

### 4.1 Optimise the images
```
Optimise everything in public/images. Convert to WebP: the hero at most 1920px wide and about 300KB, product and story shots at most 1000px wide and about 150KB. Ask before installing any tool. Update the paths in the code and show me a before and after file size table.
```

### 4.2 Compress the hero video
```
Compress public/images/hero.mp4 to 1080p at most, remove the audio track, and get it under 4 MB. Save its first frame as hero-poster.webp. Ask before installing ffmpeg. Show me the before and after sizes.
```

### 4.3 Write image prompts for Google Flow
```
Write Google Flow image prompts for: [list the images you need, e.g. hero, 3 products, story shot].

Use this formula for each one:
[Subject]. [Setting]. [Lighting]. [Camera: eye level on 50mm lens, shallow depth of field]. [Mood and palette]. [Format: 16:9 hero or 4:5 product, no text on product].

Keep the Lighting, Camera, and Mood and palette parts word-for-word identical in every prompt so the images look like one photo shoot. Base the palette on the colours in AGENTS.md.
```

### 4.4 Exploded-view video
```
Write three Google Flow prompts for an exploded-view video of [product]:
1. Frame 1: the assembled product, centred and small, with empty space above it.
2. Frame 2, made from Frame 1: the parts floating apart in a straight vertical line, with the same camera, light and background.
3. The video: move from Frame 1 to Frame 2 with a locked camera.
```

### 4.5 Alt text
```
Go through every image on the page and write alt text that says what is actually in the picture. Show me the list before you save it.
```

---

## Drawer 5: Finish

### 5.1 Polish pass
```
Do a polish pass over the whole page. Check that section spacing and heading sizes are consistent and that every button and link has a hover state. List what you find first, then fix it after I say go.
```

### 5.2 Speed check
```
Check how fast this page loads on a phone. Tell me the top 3 things that would speed it up, biggest win first, with the size or time each one would save. Do not change anything yet.
```

### 5.3 Security check
```
Confirm .env.local is in .gitignore. Search the whole project and the git history for secret keys. Tell me exactly what you checked and what you found.
```

### 5.4 SEO and sharing
```
Set up SEO and sharing: a page title under 60 characters that says what we sell and where, a meta description under 155 characters, a 1200x630 share image at public/images/share.webp, a favicon, sitemap.xml and robots.txt. Show me the title and description before saving.
```

### 5.5 Go live
```
Walk me through putting this site live on Vercel, one step at a time. Tell me which values from .env.local I need to add in the Vercel settings. When it is live, give me the URL and what to check on my phone.
```

---

## Drawer 6: Going Further

Use at most one or two of these on a page.

### 6.1 Pinned scroll story
```
Turn the [section name] section into a pinned scroll story with GSAP ScrollTrigger. It pins at the top of the screen while I scroll through 3 steps (a large number, a short heading, one sentence), then lets go cleanly.

The 3 steps:
1. [heading] - [sentence]
2. [heading] - [sentence]
3. [heading] - [sentence]

It must scroll smoothly on a phone with no jumping or sideways scroll. If the visitor has reduced motion turned on, show the three steps as a plain stacked list.
```

### 6.2 A 3D moment
```
Add one 3D moment to the [section name] section: [describe the object, e.g. a faceted glass gem]. Build it in code with Three.js, no downloaded models. It turns slowly and tilts gently as I scroll, in the colours from AGENTS.md, with studio lighting.

Load the 3D code only when the section is near the screen. On phones under 768px, with reduced motion on, or if WebGL fails, show a still image in the same place instead. Show me the page weight before and after in a small table.
```

### 6.3 Scroll-controlled video
```
Make public/images/[file].mp4 play as I scroll. First re-encode it with ffmpeg for smooth scrubbing: frequent keyframes, no audio, trimmed to the part that moves, about 1-2 MB. Then pin the section and tie the video's time to scroll progress, forward when I scroll down and backward when I scroll up, with these text callouts appearing one after another beside it:

[callout 1]
[callout 2]
[callout 3]

With reduced motion on, show a still image.
```

### 6.4 A full 3D scroll website
```
Open PROMPT_3D_TEMPLATE.md. Fill in all six parts with me, one part at a time, and build nothing until every part is filled and I have approved it.
```

### 6.5 Custom domain
```
Walk me through connecting my domain [yourdomain.com] to the Vercel project, one step at a time, and tell me how to check it worked.
```
