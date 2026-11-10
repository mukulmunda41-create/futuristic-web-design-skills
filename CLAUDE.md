# CLAUDE.md

Rules for agents working in this repository.

## What this repository is

One agent skill, `futuristic-web-design`, in the open `SKILL.md` format. It teaches coding agents (Claude Code, Codex, Antigravity and others) to build cinematic one-page marketing websites.

The repository is documentation only. There is no application code, no build step and no dependencies.

## Layout

```
README.md                                  for people: what it is, install, usage
LICENSE                                    MIT; do not change without the owner's approval
CLAUDE.md                                  this file
skills/futuristic-web-design/SKILL.md      workflow and working habits, loaded when the skill triggers
skills/futuristic-web-design/references/   detail, loaded one file at a time when a phase needs it
```

## Writing rules

- English only, in every file. No other language and no mixed-language text.
- Original wording only. Do not paste text from courses, books, articles or other skills.
- Plain ASCII punctuation in the skill files.
- Explain the reason behind an instruction instead of shouting it. Avoid all-caps commands.
- Stay agent-neutral. Refer to "the project rules file (`CLAUDE.md`, `AGENTS.md`, `GEMINI.md`)", not to one agent's file.

## Skill structure rules

- The frontmatter has exactly two fields, `name` and `description`. `name` matches the folder name. `description` is under 1024 characters and says both what the skill does and when to use it, because it is the only text an agent sees when deciding whether to load the skill.
- Keep `SKILL.md` under 500 lines. It holds the phases and habits. Detail belongs in `references/`.
- Each reference file stands alone, starts with a Contents list, and is linked from the table at the bottom of `SKILL.md` with a note on when to read it.
- Keep code snippets minimal and correct. Check current library documentation before changing GSAP, Three.js, Next.js, Supabase or ffmpeg examples.
- Numbers used as targets (file sizes, widths, character limits) must agree between `SKILL.md`, `references/ship.md` and `README.md`.

## Checking a change

Every reference path named in `SKILL.md` must exist:

```bash
grep -o 'references/[a-z-]*\.md' skills/futuristic-web-design/SKILL.md | sort -u | while read f; do test -f "skills/futuristic-web-design/$f" || echo "missing: $f"; done
```

No output means all paths resolve.

For a behaviour change, try the skill: copy `skills/futuristic-web-design` into a scratch project's skills folder, ask for a landing page in one sentence, and confirm the agent asks for a brief, plans before building, and builds one section at a time.

## Git

- Commit straight to `main` with a clear message.
- Never commit secrets, `.env` files, or media binaries.
- If the folder structure or the repository name changes, update the install commands and the layout section in `README.md` in the same commit.
