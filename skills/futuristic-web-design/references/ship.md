# Finishing and shipping

Everything between "the sections exist" and "it is live and safe": media placement, the phone, polish, speed, a form backed by a real database, deploy, domain, search and sharing, and the final checklist.

## Contents

- Media placement
- The phone pass
- The polish pass
- Speed
- Contact form
- Keys
- Saving work
- Deploy
- Custom domain
- Search and sharing
- Launch checklist
- Client handover

## Media placement

An image being present does not mean it is placed well. Audit, repair, then list your changes:

1. Served dimensions match displayed dimensions; a thumbnail must not pull a hero-sized file. Everything under the first screen uses lazy loading.
2. Alt text describes the actual picture ("amber serum bottle on pale stone", never "image 1").
3. The hero clip has `muted`, `loop` and `playsinline`, with a poster visible while it loads.
4. No distortion or awkward crops across the range of widths. Resize the viewport slowly from narrow to wide and watch: this catches a subject sliding out of frame, or card contents landing at uneven heights.

## The phone pass

On a phone the page is a single slim column, so side-by-side layouts have to stack. Set the viewport to 390px, scroll the full page slowly, and note:

1. Body copy too small to read, or headlines so big they wrap across many lines.
2. Content pressed against the screen edge.
3. Tap targets smaller than a fingertip (about 44px is the floor).
4. Horizontal scrolling of any kind.
5. A nav that overflows. It should collapse behind a working menu toggle.

Repair them as an itemised list, then scroll again.

A resized desktop browser only approximates a phone. Share the dev server's LAN address so the user can load the site on their own handset over the same Wi-Fi, and point them at pinned or scroll-driven sections first. If no physical device was involved, state that.

## The polish pass

Small inconsistencies register as cheapness even when nobody can name them. Check:

- Uniform vertical gaps between sections.
- Equal sizes for headings of equal rank.
- Hover and focus styling on all interactive elements. Menu toggles and FAQ rows are commonly forgotten.
- Entrance animations that are restrained and consistent from section to section.

Summarise the edits.

## Speed

Profile loading with Lighthouse or similar under a mobile preset, then name the three highest-impact improvements. Expect the hero clip to dominate. Where an improvement means dropping something the user values, flag it for their decision and apply the others.

## Contact form

A form with no destination does harm: people assume their message arrived. The model is a letterbox, open for posting to everyone and locked for reading to everyone but the owner.

**Table.** Row level security enabled, anonymous inserts permitted, no public read access:

```sql
create table public.leads (
  id bigint generated always as identity primary key,
  name text not null,
  email text not null,
  message text not null,
  created_at timestamptz not null default now()
);

alter table public.leads enable row level security;

create policy "Anyone can submit a lead"
  on public.leads for insert to anon
  with check (true);
-- No select policy: the public cannot read rows.
```

**Form.**

- Three fields: name, email, message. Validate first (plausible email format, non-empty message) and explain any rejection.
- Site code uses the public (anon or publishable) key only, loaded from `.env.local`.
- Since anonymous users have no read access, do not request the inserted row back (avoid chaining `.select()` onto the insert); doing so makes the call fail.
- Give distinct, plain feedback for success and for failure.
- Light spam defence: a hidden honeypot input that must remain blank, plus rejection of submissions that arrive faster than a human could type.

**Test as a visitor would.**

1. Blank message: rejected, with an explanation.
2. Email missing its @: rejected, with an explanation.
3. Valid submission: confirmation appears and a new row exists.

Only the third result settles it. A confirmation on screen proves nothing by itself; the stored row does. Check the table on every test.

When a save fails, read the error and correct the policy. Disabling row level security to make the form work is never acceptable, because this table stores people's names and addresses.

## Keys

- Public keys may ship in the site. Secret (service) keys unlock the full account and must stay out of client code entirely.
- All keys sit in `.env.local`, and `.gitignore` lists that file.
- Keys never appear in screenshots, recordings or chat.
- Once a secret has been pushed, it is compromised. Deleting it later does not help, since git history retains it. Have the user rotate it from the provider's dashboard.

Before every push, verify that `.env.local` is ignored and that neither the code nor the history contains a secret.

## Saving work

- Where the user wants commits, make one after each working step, described clearly enough to be understood weeks later. Frequent commits shrink the cost of a rollback from a day to minutes.
- For a solo project, branches add friction. With the user's agreement, add "commit directly to main" to the rules file. This pays off at launch, as production builds from main.
- Default to a private repository.

## Deploy

Once the code is on GitHub, connect the repository to Vercel (dashboard import, CLI or connector). From then on, each push to main redeploys production.

- Environment variables are not in the repository, as `.env.local` is ignored. Enter the same values in the host's project settings. When a form works on localhost and breaks in production, this is nearly always the reason, so inspect the variables before changing any form code.
- On a failed build, read the log and repair the root cause.
- Verify on the production URL from a phone using mobile data. Submit the form there and look for the row.

## Custom domain

Optional. The host-provided URL continues to work.

- Attach the domain to the hosting project, then hand the user the precise DNS records for their registrar. They should paste, not type.
- On a domain already in service, leave unfamiliar records alone, since they may be handling email. If a record with the same name is already present, check with the user before overwriting.
- Propagation takes anywhere from minutes to hours. When nothing has happened after a few minutes, the right move is to wait, not to edit the records again.
- Finished when the domain serves the site over HTTPS.

## Search and sharing

These settings leave the page itself untouched and control its appearance elsewhere: in search results, link previews and browser tabs.

- **Title** of at most 60 characters and **description** of at most 155, written for humans and stating what is sold and where. The brand name alone means nothing to someone who has never heard of it.
- **Share image**, 1200x630, set as both the Open Graph and Twitter image.
- **Favicon** derived from the logo.
- **Sitemap** and **robots** file.
- Configure the production domain as the base URL so that the share image and sitemap resolve correctly. Ask the user for it if unknown.

For Next.js: the `metadata` export (including `metadataBase`), `app/icon`, `app/sitemap.ts`, `app/robots.ts`. To test, paste the production link into a messaging app and inspect the preview. An outdated preview is caching, not a defect.

## Launch checklist

Confirm each item by looking, not by assuming. Name any you could not confirm.

**Content and consistency**
- [ ] Each section's purpose fits in a sentence.
- [ ] Zero filler text. All figures, prices and quotes are real.
- [ ] The accent colour is confined to buttons and the main highlight.
- [ ] Heading sizes and section gaps are consistent.
- [ ] Interactive elements react to pointer and keyboard focus.
- [ ] Every button and link leads to a real destination. Any still unwired is listed for the user.
- [ ] No preview, variant or design-direction routes remain in the build.
- [ ] Only the two chosen typefaces render, including in labels, numbers and badges.

**Media**
- [ ] Hero image near 300 KB or under; remaining images near 150 KB or under; hero clip below 4 MB, silent.
- [ ] Poster displays immediately; the clip stays in the page on phones.
- [ ] Alt text is descriptive throughout.
- [ ] No distortion or clipping at phone, tablet and desktop widths.

**Motion**
- [ ] Background video hero and a maximum of two further techniques.
- [ ] Animations are brief, fire a single time and never gate content.
- [ ] Under reduced motion the page is whole and pin-free, and nothing moves: no smooth scrolling, no animated icons or transitions.
- [ ] Small phones get a static image in place of 3D.

**Phone**
- [ ] 390px: readable type, margins at the edges, zero horizontal scroll.
- [ ] Menu toggle works in both directions.
- [ ] Tap targets fit a thumb.
- [ ] Verified on a physical device.

**Form**
- [ ] Blank message and malformed email are each rejected with an explanation.
- [ ] A valid submission confirms and creates a row.
- [ ] Repeated successfully in production.

**Keys**
- [ ] `.env.local` holds the keys and is git-ignored.
- [ ] Code and history are free of secrets.
- [ ] The host has matching environment variables.

**Production**
- [ ] Production URL loads on a phone over mobile data.
- [ ] Domain serves over HTTPS.
- [ ] Title states the offer and location; description is a single clear sentence.
- [ ] Favicon shows; a shared link renders image, title and summary.

## Client handover

For work done on someone else's behalf:

- Register the domain and all accounts (hosting, database, repository) to the client.
- Agree scope in writing beforehand: page count, revision rounds, client-supplied materials, payment schedule.
- Be open about using AI tools. The client is buying judgement.
