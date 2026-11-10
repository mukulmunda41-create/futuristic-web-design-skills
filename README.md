# futuristic-web-design

An agent skill for building cinematic one-page marketing websites that do not look AI-generated. It works with any coding agent that reads the `SKILL.md` format: Claude Code, Codex, Antigravity, Gemini CLI, Cursor and others.

## What the agent does with it

1. Gets a one-paragraph brief (who, the one action, the feel) before writing code.
2. Plans the sections, each with a job, and waits for a yes.
3. Offers three design directions, then locks fonts, colours and spacing into the project rules.
4. Builds one section at a time and checks each at 390px, 768px and 1440px.
5. Writes image and video prompts whose results match as a single shoot, and compresses the files for the web.
6. Adds a slow video hero plus at most two cinematic moves (pinned scroll story, 3D object, parallax, scroll-played video), each with reduced-motion and small-phone fallbacks.
7. Does a phone pass, a polish pass and a speed check.
8. Wires a contact form to Supabase with row level security, deploys, sets up the domain and SEO, and runs a launch checklist.

## Install

With the [skills CLI](https://github.com/vercel-labs/skills), from inside your project folder:

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a claude-code
```

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a codex
```

```bash
npx skills add mukulmunda41-create/futuristic-web-design-skills --skill futuristic-web-design -a antigravity
```

Add `-g` to install for every project instead of the current one.

Or copy the `skills/futuristic-web-design` folder by hand:

| Agent | Project | Global |
|---|---|---|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| Codex | `.agents/skills/` | `~/.agents/skills/` |
| Antigravity | `.agents/skills/` | `~/.gemini/config/skills/` |

## Use

Ask for a site in plain words. The skill is picked up from the request:

> Build a landing page for my pottery studio in Jaipur. It should feel cinematic.

To be sure it is used, name it: "Use the futuristic-web-design skill."

## Layout

```
skills/futuristic-web-design/
├── SKILL.md                    workflow and working habits
└── references/
    ├── design-system.md        anatomy, vocabulary, design directions, rules template
    ├── assets.md               image and video prompts, web preparation
    ├── cinematic-moves.md      the five moves, recipes, fallbacks, real-time 3D
    └── ship.md                 mobile, polish, form, deploy, domain, SEO, launch checklist
```

## Credit

The method follows what I learned from the course *Futuristic Web Design Using AI* by Brand Motion Studios (courses.brandmotion.dev). This skill is my own write-up for coding agents. It contains none of the course's text, prompts or files, and is not affiliated with or endorsed by Brand Motion Studios or Anthropic.
