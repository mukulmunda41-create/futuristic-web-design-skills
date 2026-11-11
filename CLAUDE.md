# CLAUDE.md

Rules for agents working in this repository.

## What this repository is

A skill pack in the open `SKILL.md` format. It teaches coding agents (Claude Code, Antigravity, Codex, Cursor, Windsurf and others) to build cinematic one-page marketing websites.

It holds one main skill, three fast-path skills, project templates, Cursor rules and an installer. Apart from `install.sh` there is no code, no build step and no dependencies.

## Layout

```
README.md                                  for people: what it is, install, usage
LICENSE                                    MIT; do not change without the owner's approval
CLAUDE.md                                  this file
install.sh                                 copies the pack into a user's project
skills/futuristic-web-design/SKILL.md      the full method; the source of truth
skills/futuristic-web-design/references/   detail, loaded one file at a time when a phase needs it
skills/futuristic-web-design/evals/        test cases (prompt.md, case.yaml, graders/, files/)
skills/new-section/SKILL.md                fast path: one section
skills/cinematic-3d-scroll/SKILL.md        fast path: one cinematic technique
skills/web-assets-and-launch/SKILL.md      fast path: media, polish, launch
skills/<fast-path>/evals/                  one test case per fast-path skill, run with that skill alone
skills/*/evals/results/                    eval output; git-ignored, never commit
cursor-rules/*.mdc                         Cursor rules; pointers plus the most-skipped checks
templates/AGENTS.md                        project rules template; the only place the design system is written
templates/CLAUDE.md                        imports AGENTS.md
templates/prompts.md                       prompt pack for the user
templates/LAUNCH_CHECKLIST.md              checklist for the user
templates/PROMPT_3D_TEMPLATE.md            fill-in form of the live-3D spec in references/cinematic-moves.md
skills/*-workspace/                        test results; git-ignored, never commit
```

## One source of truth

- A rule or number is defined in `skills/futuristic-web-design/` first. The fast-path skills, Cursor rules, templates and README repeat only what they need and must agree with it.
- When a rule changes, search the whole repository for the old wording and update every copy in the same commit:

```bash
grep -rn "old wording" --include='*.md' --include='*.mdc' .
```

- Numbers used as targets (file sizes, widths, character limits, the cinematic budget) must agree everywhere.
- The design system is written in `templates/AGENTS.md` only. Do not add palette or typeface values to any other template or rule file.
- The fast-path skills must work when installed alone. They may point at `../futuristic-web-design/references/` for detail, but never depend on it.

## Writing rules

- English only, in every file. No other language and no mixed-language text.
- Original wording only. Do not paste text from courses, books, articles or other skills.
- Plain ASCII punctuation in the skill files, Cursor rules and templates.
- Explain the reason behind an instruction instead of shouting it. Avoid all-caps commands.
- Stay agent-neutral in the skills. Refer to "the project rules file (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`)", not to one agent's file.

## Skill structure rules

- The frontmatter has exactly two fields, `name` and `description`. `name` matches the folder name. `description` is under 1024 characters and says both what the skill does and when to use it, because it is the only text an agent sees when deciding whether to load the skill.
- The fast-path descriptions end by sending whole-site work to `futuristic-web-design`, so the four skills do not compete for the same request.
- Keep each `SKILL.md` under 500 lines. Detail belongs in `references/`.
- Each reference file stands alone, starts with a Contents list, and is linked from the table at the bottom of the main `SKILL.md` with a note on when to read it.
- Keep code snippets minimal and correct. Check current library documentation before changing GSAP, Three.js, Next.js, Supabase or ffmpeg examples.
- Cursor rule files have three frontmatter fields: `description`, `globs` (unquoted, comma-separated) and `alwaysApply`.

## Checking a change

Every reference path named in a `SKILL.md` must exist, and every skill name must match its folder:

```bash
for d in skills/*/; do n=$(sed -n 's/^name: //p' "$d/SKILL.md"); [ "$n" = "$(basename "$d")" ] || echo "name mismatch: $d"; grep -o 'references/[a-z-]*\.md' "$d/SKILL.md" | sort -u | while read f; do test -f "skills/futuristic-web-design/$f" || echo "missing: $f (named in $d)"; done; done
```

No output means everything resolves.

After changing `install.sh`, a template or a Cursor rule, run the installer twice in an empty scratch folder and confirm that the second run keeps every project file.

To run a skill's test cases (real, billed model runs; each case runs once with the skill and once without):

```bash
cd skills/<skill> && claude plugin eval . --allow-tools Write,Edit,Bash --scaffold --runs 1 --trust-plugin --no-publish --max-cost-usd 10
```

For a behaviour change in the main skill, try it: copy `skills/futuristic-web-design` into a scratch project's skills folder, ask for a landing page in one sentence, and confirm the agent asks for a brief, plans before building, and builds one section at a time.

## Git

- Commit straight to `main` with a clear message.
- Never commit secrets, `.env` files, or media binaries.
- If the folder structure or the repository name changes, update the install commands and the layout section in `README.md` in the same commit.
