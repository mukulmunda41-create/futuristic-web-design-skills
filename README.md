# Futuristic Web Design

An agent skill that teaches AI coding agents to build cinematic, one-page marketing websites that do not look AI-generated.

It works with any agent that reads the open `SKILL.md` format, including **Claude Code**, **Codex**, **Antigravity**, Gemini CLI and Cursor.

## Table of contents

- [The problem it solves](#the-problem-it-solves)
- [What you get](#what-you-get)
- [How the agent works with this skill](#how-the-agent-works-with-this-skill)
- [Install](#install)
- [Usage](#usage)
- [Example requests](#example-requests)
- [The cinematic budget](#the-cinematic-budget)
- [Requirements](#requirements)
- [Repository layout](#repository-layout)
- [Design principles](#design-principles)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)

## The problem it solves

Ask an AI agent for "a website for my cafe" and you get the same page every time: a centred headline, a soft gradient, three identical rounded cards. The agent is not being lazy. Every detail the request left open was filled with the most common answer.

This skill changes how the agent approaches the job. Instead of generating a whole page from one sentence, it closes the open questions first, builds in small steps it can verify, and spends motion and 3D sparingly so the result feels directed.

## What you get

| Area | What the agent does |
|---|---|
| Brief | Gets a one-paragraph brief (audience, the one action, the feeling) before writing code, or drafts one and states it as an assumption |
| Plan | Lists the sections in order, each with a purpose and an asset, and waits for agreement |
| Design system | Shows three visual directions on a preview page, then locks typefaces, palette and spacing into theme tokens and the project rules file |
| Build | Builds one section at a time and checks each at 390px, 768px and 1440px |
| Hero | Treats the hero as the most important screen: one lead button, readable copy over video, text clear of the subject |
| Visuals | Writes image and video prompts that produce a matching set, then compresses the files for the web |
| Motion | Adds a slow video hero plus at most two cinematic techniques, each with reduced-motion and small-screen fallbacks |
| Phone | Runs a dedicated pass at phone width and asks for a check on a physical device |
| Form | Wires a contact form to Supabase with row level security, and verifies the stored row, not just the success message |
| Launch | Deploys, sets environment variables, connects a domain, sets up search and sharing metadata, and runs a launch checklist |

## How the agent works with this skill

The skill is organised as eight phases. The agent enters at whichever phase matches the request, so a small job such as "add an FAQ section" does not trigger the whole process.

1. **Brief.** Who the site is for, the single action a visitor should take, and how it should feel.
2. **Plan.** The section list, top to bottom. Nothing is built until it is agreed.
3. **Design system.** Three directions to choose from, then one locked in.
4. **Project rules.** The permanent rules are written to `CLAUDE.md`, `AGENTS.md` or `GEMINI.md`, whichever the agent in use reads.
5. **Build section by section.** A fixed six-step routine for every section: read the design rules, confirm the content, one component file, check three widths, match the spacing, report.
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

## Install

### Option 1: the skills CLI

Run one of these inside your project folder. Each installs the skill for one agent.

Claude Code:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a claude-code
```

Codex:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a codex
```

Antigravity:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a antigravity
```

Add `-g` to any of them to install for all your projects instead of the current one.

### Option 2: copy the folder

Clone the repository and copy `skills/futuristic-web-design` into the skills folder your agent reads.

```bash
git clone https://github.com/mukulmunda41-create/futuristic-web-design-skills.git
```

| Agent | Project-level folder | Global folder |
|---|---|---|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `~/.agents/skills/` |
| Antigravity | `.agents/skills/` | `~/.gemini/config/skills/` |

For example, to install globally for Claude Code:

```bash
cp -r futuristic-web-design-skills/skills/futuristic-web-design ~/.claude/skills/
```

### Check that it is installed

Start a new session in your project and ask:

> List your installed skills and what triggers each of them.

`futuristic-web-design` should be in the list.

## Usage

You do not need to call the skill by name. Describe the site you want and the agent picks the skill up from the request.

> Build a landing page for my pottery studio in Jaipur. It should feel cinematic.

To be certain it is used, name it:

> Use the futuristic-web-design skill to rebuild the hero section.

What to expect in a new project:

1. The agent asks for a short brief, or writes one and shows it to you.
2. It shows a section plan and waits for your approval.
3. It shows three design directions on a preview page. You pick one.
4. It builds the hero, then the remaining sections one at a time, reporting after each.
5. It gives you image and video prompts, or generates the assets if a tool is connected and you approve.
6. It proposes which cinematic techniques suit the site and what each costs.
7. It runs the phone, polish and speed passes, wires the form, and deploys when you ask.

## Example requests

| You say | The agent does |
|---|---|
| "Make a website for my cafe" | Starts at the brief, then plans, designs and builds the full page |
| "Add a testimonials section" | Runs the six-step section routine against the existing design rules |
| "My site looks AI-made, fix it" | Audits the page against a list of generic tells, then revisits the design system |
| "Give me prompts for the hero image and video" | Writes a shot list, a six-part image brief and a reusable style line |
| "Add a scroll animation showing our three-step process" | Plans a pinned scroll story with touch support and a reduced-motion fallback |
| "Put a 3D model of the product next to the story" | Builds one procedural 3D accent that loads lazily and falls back to a still image |
| "Make the product come apart as I scroll" | Sets up a scroll-driven video, including how to generate and encode the footage |
| "The form is not saving" | Reads the error and fixes the access policy without turning security off |
| "Get this ready to launch" | Deploys, checks environment variables, sets up metadata, and walks the launch checklist |

## The cinematic budget

The skill knows five techniques and deliberately limits how many are used.

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

Nothing is required to install the skill itself. It is a set of Markdown files.

For the sites it builds, the defaults are:

| Tool | Used for | Required? |
|---|---|---|
| Node.js (LTS) | Running the site locally | Yes |
| Git | Saving work and deploying | Yes |
| Next.js and Tailwind CSS | The default stack | Default, can be changed in the project rules |
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
└── skills/
    └── futuristic-web-design/
        ├── SKILL.md                   the workflow and working habits
        └── references/
            ├── design-system.md       page anatomy, vocabulary, design directions, rules template
            ├── assets.md              image and video prompts, web preparation
            ├── cinematic-moves.md     the five techniques, recipes, fallbacks, live 3D
            └── ship.md                phone pass, polish, form, deploy, domain, SEO, launch checklist
```

`SKILL.md` is loaded whenever the skill triggers. The reference files are loaded only when the agent reaches the phase that needs them, which keeps the agent's context small.

## Design principles

- **Close the gaps before building.** A vague request produces an average result, so the agent settles the audience, the action, the feeling and the design system first.
- **Small, verified steps.** One section or one change at a time, each looked at in a browser.
- **One design system.** Two typefaces, five colours, one spacing rhythm, one accent colour, applied everywhere.
- **Restraint in motion.** Few techniques, placed where they help the visitor understand or feel something.
- **Phone first.** Nothing may break at 390px, and the final check happens on a real device.
- **Safe by default.** Secrets stay in `.env.local`, database tables keep row level security, and nothing is installed or purchased without approval.
- **Honest reporting.** The agent says what it verified and what it could not.

## FAQ

**Does this only work with Claude Code?**
No. The skill uses the standard `SKILL.md` format with `name` and `description` frontmatter, which Codex, Antigravity, Gemini CLI, Cursor and other agents also read.

**Do I have to use Next.js and Tailwind?**
No. Those are the defaults when a project has no stack yet. If your project already uses something else, or your rules file names a different stack, the agent follows that.

**Will it generate images and video for me?**
Only if you have a generation tool connected and you approve the spend. Otherwise it writes the prompts for you to run and continues building with clearly marked placeholders.

**Can I use it on an existing site?**
Yes. Ask for a specific section, a redesign, a mobile pass or a launch check, and the agent starts at that phase.

**Why does it ask questions instead of just building?**
Because every unanswered question gets a default, and defaults are what make sites look alike. To skip the questions, say "just build it" and it will state its assumptions in a line and continue.

**Why only two cinematic techniques besides the hero video?**
Each one adds download weight and competes for attention. A page that uses all of them is slower and less memorable than one that uses two well.

## Contributing

Issues and pull requests are welcome. Before opening a pull request, read `CLAUDE.md` for the editing rules: English only, original wording, a lean `SKILL.md`, and self-contained reference files.

## License

Released under the [MIT License](LICENSE). You are free to use, copy, modify and redistribute this skill, including commercially, as long as the copyright notice and license text are kept.
