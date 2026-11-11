# Futuristic Web Design Skills

A skill pack that teaches AI coding agents to build cinematic, one-page marketing websites that do not look AI-generated.

It works with **Claude Code, Google Antigravity, OpenAI Codex, Cursor and Windsurf**, and with any other agent that reads the open `SKILL.md` format or an `AGENTS.md` file.

## Table of contents

- [The problem it solves](#the-problem-it-solves)
- [What is in the pack](#what-is-in-the-pack)
- [Install](#install)
- [Which agent reads what](#which-agent-reads-what)
- [Usage](#usage)
- [The four skills](#the-four-skills)
- [Example requests](#example-requests)
- [The cinematic budget](#the-cinematic-budget)
- [Requirements](#requirements)
- [Repository layout](#repository-layout)
- [Design principles](#design-principles)
- [FAQ](#faq)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## The problem it solves

Ask an AI agent for "a website for my cafe" and you get the same page every time: a centred headline, a soft gradient, three identical rounded cards. The agent is not being lazy. Every detail the request left open was filled with the most common answer.

This pack changes how the agent approaches the job. Instead of generating a whole page from one sentence, it closes the open questions first, builds in small steps it can verify, and spends motion and 3D sparingly so the result feels directed.

## What is in the pack

| Part | Path | What it is |
|---|---|---|
| Main skill | [`skills/futuristic-web-design`](skills/futuristic-web-design/SKILL.md) | The full method in eight phases, from brief to launch, with four reference files and three test cases |
| Fast-path skill | [`skills/new-section`](skills/new-section/SKILL.md) | Add, restyle or compare layouts for one section of an existing site |
| Fast-path skill | [`skills/cinematic-3d-scroll`](skills/cinematic-3d-scroll/SKILL.md) | Add one cinematic technique: video hero, pinned scroll story, parallax, 3D accent, scroll-driven video |
| Fast-path skill | [`skills/web-assets-and-launch`](skills/web-assets-and-launch/SKILL.md) | Compress media, write image prompts, polish, check keys, set up SEO, deploy |
| Rules template | [`templates/AGENTS.md`](templates/AGENTS.md) | Project rules and design system, filled in once and read by every agent |
| Rules template | [`templates/CLAUDE.md`](templates/CLAUDE.md) | Two lines that import `AGENTS.md` for Claude Code |
| Cursor rules | [`cursor-rules/`](cursor-rules) | Three `.mdc` files: one always on, two that apply by file path |
| Prompt pack | [`templates/prompts.md`](templates/prompts.md) | Copy-and-paste prompts in six drawers: Start, Build, Fix, Assets, Finish, Going Further |
| Checklist | [`templates/LAUNCH_CHECKLIST.md`](templates/LAUNCH_CHECKLIST.md) | Everything to tick before sharing the link |
| 3D template | [`templates/PROMPT_3D_TEMPLATE.md`](templates/PROMPT_3D_TEMPLATE.md) | A six-part master prompt for a full-page real-time 3D scroll website |
| Installer | [`install.sh`](install.sh) | Sets up all five agents in one command |

The main skill is the source of truth. The three fast-path skills are short, self-contained routines for a single task on a site that already exists, and they point back to the main skill's reference files for detail.

## Install

Run these from your project folder.

### Option 1: the universal installer

One command installs the skills for all five agents and adds the rules files, prompt pack and checklist:

```bash
curl -fsSL https://raw.githubusercontent.com/mukulmunda41-create/futuristic-web-design-skills/main/install.sh | bash
```

Or from a local clone:

```bash
git clone https://github.com/mukulmunda41-create/futuristic-web-design-skills.git ~/futuristic-web-design-skills
```

```bash
bash ~/futuristic-web-design-skills/install.sh
```

What it puts in your project:

| File or folder | For | Source |
|---|---|---|
| `.claude/skills/` | Claude Code | `skills/` |
| `.agents/skills/` | Antigravity, Codex, Cursor | `skills/` |
| `.windsurf/skills/` | Windsurf | `skills/` |
| `.cursor/rules/*.mdc` | Cursor | `cursor-rules/` |
| `AGENTS.md` | Every agent | `templates/AGENTS.md` |
| `CLAUDE.md` | Claude Code (imports `AGENTS.md`) | `templates/CLAUDE.md` |
| `.windsurfrules` | Older Windsurf versions (one line pointing at `AGENTS.md`) | written by the installer |
| `prompts.md`, `LAUNCH_CHECKLIST.md`, `PROMPT_3D_TEMPLATE.md` | You | `templates/` |

The installer never overwrites an existing `AGENTS.md`, `CLAUDE.md`, `.windsurfrules`, `prompts.md`, `LAUNCH_CHECKLIST.md` or `PROMPT_3D_TEMPLATE.md`. Skills and Cursor rules are replaced each time, so running it again is how you update. It needs `bash`, and `git` when run through `curl`.

If you already had a `CLAUDE.md`, add a line containing `@AGENTS.md` to it so Claude Code reads the same rules as the other agents.

### Option 2: the skills CLI

This installs the skills only, without the rules files, prompt pack or checklist.

All four skills for Claude Code:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --agent claude-code
```

One skill at a time:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design --agent claude-code
```

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill new-section --agent claude-code
```

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill cinematic-3d-scroll --agent claude-code
```

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill web-assets-and-launch --agent claude-code
```

For another agent, change the `--agent` value:

| Agent | `--agent` value |
|---|---|
| Claude Code | `claude-code` |
| Google Antigravity | `antigravity` |
| OpenAI Codex | `codex` |
| Cursor | `cursor` |
| Windsurf | `windsurf` |

Useful flags:

| Flag | What it does |
|---|---|
| `--skill <name>` | Install only that skill. Repeat the flag for more than one. |
| `--agent <name>` | Choose the agent. Repeat the flag for more than one. |
| `-g` | Install for all your projects instead of only this one. |
| `--list` | Show the skills in this repository without installing. |
| `-y` | Skip the confirmation prompts. |

If you install a fast-path skill, install `futuristic-web-design` as well. The fast-path skills work alone, but they read its reference files for detail when it is present.

### Option 3: copy the folders

Clone the repository and copy the folders inside `skills/` into the skills folder your agent reads (see the next table).

### Check that it is installed

Start a new session in your project and ask:

> List your installed skills and what triggers each of them.

`futuristic-web-design`, `new-section`, `cinematic-3d-scroll` and `web-assets-and-launch` should be in the list.

## Which agent reads what

| Agent | Skills folder (project) | Skills folder (global) | Rules file |
|---|---|---|---|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` | `CLAUDE.md`, which imports `AGENTS.md` |
| Google Antigravity | `.agents/skills/` | `~/.gemini/config/skills/` | `AGENTS.md` |
| OpenAI Codex | `.agents/skills/` | `~/.agents/skills/` | `AGENTS.md` |
| Cursor | `.agents/skills/` | `~/.cursor/skills/` | `AGENTS.md` and `.cursor/rules/*.mdc` |
| Windsurf | `.windsurf/skills/` | `~/.codeium/windsurf/skills/` | `AGENTS.md` (and `.windsurfrules` on older versions) |

The project rules and design system are written once, in `AGENTS.md`. Nothing else repeats them: `CLAUDE.md` imports the file, `.windsurfrules` points at it, and the Cursor rules refer to it.

## Usage

1. Install with the universal installer.
2. Open `AGENTS.md` and fill in the Overview, or paste prompt 1.2 from `prompts.md` and let the agent ask you.
3. Work through `prompts.md` drawer by drawer: Start, Build, Fix, Assets, Finish.
4. Use the Going Further drawer, or `PROMPT_3D_TEMPLATE.md`, only where the story needs it.
5. Tick off `LAUNCH_CHECKLIST.md` before you share the link.

You do not need to call a skill by name. Describe what you want and the agent picks the skill up from the request:

> Build a landing page for my pottery studio in Jaipur. It should feel cinematic.

To be certain a skill is used, name it:

> Use the futuristic-web-design skill to rebuild the hero section.

What to expect in a new project:

1. The agent asks for a short brief, or writes one and shows it to you.
2. It shows a section plan and waits for your approval.
3. It shows three design directions on a preview page. You pick one.
4. It builds the hero, then the remaining sections one at a time, reporting after each.
5. It gives you image and video prompts, or generates the assets if a tool is connected and you approve.
6. It proposes which cinematic techniques suit the site and what each costs.
7. It runs the phone, polish and speed passes, wires the form, and deploys when you ask.

## The four skills

### `futuristic-web-design` (the main skill)

The full method, organised as eight phases. The agent enters at whichever phase matches the request, so a small job does not trigger the whole process.

1. **Brief.** Who the site is for, the single action a visitor should take, and how it should feel.
2. **Plan.** The section list, top to bottom. Nothing is built until it is agreed.
3. **Design system.** Three directions to choose from, then one locked in.
4. **Project rules.** The permanent rules are written to the rules file the agent reads.
5. **Build section by section.** A fixed routine for every section: read the design rules, confirm the content, one component file, check three widths, match the spacing, report.
6. **Visuals.** A shot list of about seven assets and one consistent style line.
7. **Cinematic moves.** A strict budget, with fallbacks and a measured cost.
8. **Phone, polish, form, launch.** The finishing passes and a final checklist.

It also sets working habits that apply throughout:

- One change per round, with everything else left alone.
- Look at the rendered page before reporting that something is done.
- Turn vague feedback ("it feels heavy") into a named problem and fix that one thing.
- Offer two or three variants on preview routes when the user cannot describe what they want.
- Ask before installing packages or spending image-generation credits.
- Never disable database security to make a form work.
- Report honestly: what was checked, what was not, and which copy was invented.

### `new-section`

For one section on a site that already has its rules. It reads the rules file, confirms the content, picks a layout on purpose, builds one component, checks it at 390px, 768px and 1440px, and reports in three lines. Layout options go on separate preview routes, which are deleted once you choose. It includes the contact form routine: row level security on, public insert only, and a stored row as the only proof that it works.

### `cinematic-3d-scroll`

For one cinematic technique on an existing site. It states the budget, applies the same guardrails to every technique (reduced motion, touch, small screens, deferred loading, failure), gives a short recipe for the video hero, pinned scroll story, 3D accent and scroll-driven video, and measures the cost afterwards.

### `web-assets-and-launch`

For the finishing work. It compresses images and video to fixed targets, writes image and video prompts that produce a matching set, runs the phone, polish and speed passes, checks for leaked keys, sets up search and sharing metadata, and deploys when asked.

## Example requests

| You say | Skill | The agent does |
|---|---|---|
| "Make a website for my cafe" | `futuristic-web-design` | Starts at the brief, then plans, designs and builds the full page |
| "My site looks AI-made, fix it" | `futuristic-web-design` | Audits the page against a list of generic tells, then revisits the design system |
| "Add a testimonials section" | `new-section` | Runs the section routine against the existing design rules |
| "Show me three layouts for the hero" | `new-section` | Builds each on a preview route with a one-line description |
| "The form is not saving" | `new-section` | Reads the error and fixes the access policy without turning security off |
| "Add a scroll animation showing our three-step process" | `cinematic-3d-scroll` | Plans a pinned scroll story with touch support and a reduced-motion fallback |
| "Put a 3D model of the product next to the story" | `cinematic-3d-scroll` | Builds one procedural 3D accent that loads lazily and falls back to a still image |
| "Make the product come apart as I scroll" | `cinematic-3d-scroll` | Sets up a scroll-driven video, including how to encode the footage |
| "Give me prompts for the hero image and video" | `web-assets-and-launch` | Writes a shot list, a six-part image brief and a reusable style line |
| "Get this ready to launch" | `web-assets-and-launch` | Checks keys and metadata, deploys, and verifies on the live URL |

## The cinematic budget

The pack knows five techniques and deliberately limits how many are used.

| Technique | Best for | Cost |
|---|---|---|
| Background video hero | Brands that sell atmosphere | The largest download on the page |
| Scroll-tied motion | Letting the visitor drive the narrative | Frame rate on low-end phones |
| Pinned section | A short sequence of about three beats | Takes over scrolling |
| Parallax depth | Adding a little life to a static band | The lightest of the five |
| Live 3D object | One product worth seeing from every side | The heaviest to download and render |

The rule is a background video hero plus no more than two others. Every technique must also:

- fall back to a plain layout when the visitor has reduced motion enabled,
- fall back to a still image on small phones,
- load only when its section is near the viewport,
- leave the rest of the page working if it fails.

After adding them, the agent measures how much weight they added and reports the numbers.

## Requirements

Nothing is required to install the skills. They are Markdown files. The installer needs `bash`.

For the sites the pack builds, the defaults are:

| Tool | Used for | Required? |
|---|---|---|
| Node.js (LTS) | Running the site locally | Yes |
| Git | Saving work and deploying | Yes |
| Next.js and Tailwind CSS | The default stack | Default, can be changed in `AGENTS.md` |
| shadcn/ui | Accessible interactive components | Recommended |
| GSAP ScrollTrigger, Three.js | Scroll and 3D techniques | Only if those techniques are used |
| ffmpeg | Compressing images and video | Only when preparing media |
| An image and video generator | Site visuals | Optional. The agent can hand you the prompts instead |
| Supabase | Storing contact form submissions | Only if the site has a form |
| GitHub and Vercel | Hosting and deployment | Only when going live |

The agent asks before installing any package or tool.

## Repository layout

```
futuristic-web-design-skills/
├── README.md
├── LICENSE                            MIT
├── CLAUDE.md                          rules for agents editing this repository
├── install.sh                         universal installer
├── skills/
│   ├── futuristic-web-design/
│   │   ├── SKILL.md                   the eight phases and working habits
│   │   ├── evals/                     three test cases with pass/fail checks
│   │   └── references/
│   │       ├── design-system.md       page anatomy, vocabulary, design directions, rules template
│   │       ├── assets.md              image and video prompts, web preparation
│   │       ├── cinematic-moves.md     the five techniques, recipes, fallbacks, live 3D
│   │       └── ship.md                phone pass, polish, form, deploy, domain, SEO, launch checklist
│   ├── new-section/                   fast path: one section (SKILL.md, evals/)
│   ├── cinematic-3d-scroll/           fast path: one cinematic technique (SKILL.md, evals/)
│   └── web-assets-and-launch/         fast path: media, polish, launch (SKILL.md, evals/)
├── cursor-rules/
│   ├── 01-project-and-design-system.mdc
│   ├── 02-new-section-and-cinematic-3d.mdc
│   └── 03-assets-seo-and-launch.mdc
└── templates/
    ├── AGENTS.md                      project rules, filled in once
    ├── CLAUDE.md                      imports AGENTS.md
    ├── prompts.md                     six-drawer prompt pack
    ├── LAUNCH_CHECKLIST.md
    └── PROMPT_3D_TEMPLATE.md
```

A `SKILL.md` is loaded whenever its skill triggers. Reference files are loaded only when the agent reaches the phase that needs them, which keeps the agent's context small. The `evals/` folder is never loaded during normal use, and the installer leaves it out.

## Design principles

- **Close the gaps before building.** A vague request produces an average result, so the agent settles the audience, the action, the feeling and the design system first.
- **Small, verified steps.** One section or one change at a time, each looked at in a browser.
- **One design system.** Two typefaces, five colours, one spacing rhythm, applied everywhere and written down in one file.
- **Restraint in motion.** Few techniques, placed where they help the visitor understand or feel something.
- **Phone first.** Nothing may break at 390px, and the final check happens on a real device.
- **Safe by default.** Secrets stay in `.env.local`, database tables keep row level security, and nothing is installed or purchased without approval.
- **Honest reporting.** The agent says what it verified and what it could not.

## FAQ

**Does this only work with Claude Code?**
No. The skills use the standard `SKILL.md` format with `name` and `description` frontmatter, which Codex, Antigravity, Cursor, Windsurf, Gemini CLI and other agents also read. The rules template is a plain `AGENTS.md`.

**Do I need all four skills?**
The main skill covers everything. The three fast-path skills are shortcuts for a single task on an existing site. Install all four unless you have a reason not to.

**Why is the design system only in `AGENTS.md`?**
Sites drift when the same rule is written in several places and edited in one. Every agent reads `AGENTS.md`, directly or through an import, so one file is enough.

**Do I have to use Next.js and Tailwind?**
No. Those are the defaults when a project has no stack yet. If your project already uses something else, or `AGENTS.md` names a different stack, the agent follows that.

**Will it generate images and video for me?**
Only if you have a generation tool connected and you approve the spend. Otherwise it writes the prompts for you to run and continues building with clearly marked placeholders.

**Can I use it on an existing site?**
Yes. Ask for a specific section, a redesign, a mobile pass or a launch check, and the agent starts there.

**Why does it ask questions instead of just building?**
Because every unanswered question gets a default, and defaults are what make sites look alike. To skip the questions, say "just build it" and it will state its assumptions in a line and continue.

**Why only two cinematic techniques besides the hero video?**
Each one adds download weight and competes for attention. A page that uses all of them is slower and less memorable than one that uses two well.

## Testing

The main skill, `futuristic-web-design`, was tested before this pack was split into four skills, by running three realistic requests twice each, once with the skill and once without, and grading every result against written pass/fail checks.

| Test | With skill | Without skill |
|---|---|---|
| A landing page from a one-line request | 8 of 10 | 6 of 10 |
| A portfolio owner asking for every effect at once | 8 of 8 | 2 of 8 |
| A contact form saving to Supabase | 8 of 8 | 7 of 8 |
| **Overall** | **93%** | **58%** |

Each test ran once per configuration, so treat these numbers as a direction rather than a precise measurement. Some checks in the second test reward the skill's own restraint rule, which overstates that gap. With the skill, runs used about 30% more tokens and took about 60% longer, mostly from the phone-width checks and the design-direction step. The gaps found in the skill's own runs (reduced motion missing smooth scrolling, a stray third typeface, a leftover exploration page, unwired buttons) have since been addressed in the skill.

Each fast-path skill has one test case of its own, run the same way: once with only that skill (the main skill not installed) and once without any skill. A separate grader compared the two results against written checks without knowing which run had the skill.

| Skill | Test | With skill | Without skill |
|---|---|---|---|
| `new-section` | Add testimonials to a site whose owner cannot be asked for quotes | 7 of 7 | 6 of 7 |
| `cinematic-3d-scroll` | Add a pinned three-step story and a 3D candle to a plain HTML site | 8 of 8 | 4 of 8 |
| `web-assets-and-launch` | Make a restaurant site launch ready, with a secret key in the page | 9 of 10 | 6 of 10 |
| **Overall** | | **96%** | **64%** |

These ran once each, through subagents with Claude Opus 5.5 rather than `claude plugin eval`, so treat them as a direction, not a measurement. What they showed:

- Without the skill, the 3D candle loaded on every page view, ran live on phones, had no still image to fall back on, and the report gave no page weight and no advice to test on a real phone.
- Without the skill, the launch run removed the contact form without being asked, added a build step, wrote a 62-character title, skipped the sitemap and robots file, and gave no before and after size table.
- With the skill, the launch run removed the leaked key but called it harmless because the repository had never been pushed. The rule now says a key that was ever in page code or a commit must be rotated. That case has not been re-run since the change.
- The testimonials case had a strong baseline because the test site's `AGENTS.md` already said not to invent reviews. The skill's difference there was design: one lead quote instead of three identical cards.

The installer was checked by running it in empty projects, in a project that already had its own `CLAUDE.md` and `AGENTS.md`, in a folder whose name contains spaces, and through `curl | bash` against a local copy of the repository.

The test cases live in each skill's `evals/` folder. With Claude Code you can run them yourself from a skill's folder:

```bash
claude plugin eval . --allow-tools Write,Edit,Bash --scaffold --runs 1
```

These are real, billed model runs. The installer leaves the `evals/` folders out of your project.

## Contributing

Issues and pull requests are welcome. Before opening a pull request, read `CLAUDE.md` for the editing rules: English only, original wording, lean `SKILL.md` files, self-contained reference files, and numbers that agree everywhere.

## License

Released under the [MIT License](LICENSE). You are free to use, copy, modify and redistribute this pack, including commercially, as long as the copyright notice and license text are kept.
