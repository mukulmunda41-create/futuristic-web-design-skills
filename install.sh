#!/usr/bin/env bash
# Futuristic Web Design skill pack: sets up Claude Code, Antigravity, Codex,
# Cursor and Windsurf in the current project folder.
#
# Run it from YOUR project folder:
#   curl -fsSL https://raw.githubusercontent.com/mukulmunda41-create/futuristic-web-design-skills/main/install.sh | bash
# or, from a local clone of the pack:
#   bash /path/to/futuristic-web-design-skills/install.sh
set -euo pipefail

REPO="https://github.com/mukulmunda41-create/futuristic-web-design-skills"

# Where the pack's files are: next to this script, or a fresh clone when piped from curl.
SRC="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || pwd)"
if [ ! -d "$SRC/skills" ] || [ ! -d "$SRC/templates" ] || [ ! -d "$SRC/cursor-rules" ]; then
  command -v git >/dev/null || { echo "git is required to download the skill pack." >&2; exit 1; }
  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT
  echo "Downloading skill pack..."
  git clone --depth 1 --quiet "$REPO" "$TMP"
  SRC="$TMP"
fi

# Check the pack is complete before touching the project, so a bad download never leaves it half set up.
for need in skills/futuristic-web-design/SKILL.md cursor-rules templates/AGENTS.md templates/CLAUDE.md; do
  if [ ! -e "$SRC/$need" ]; then
    echo "The skill pack is incomplete ($need is missing). Nothing was changed." >&2
    exit 1
  fi
done

if [ "$SRC" = "$PWD" ]; then
  echo "Run this from your project folder, not from inside the skill pack." >&2
  exit 1
fi

# Project files the user may have edited are never overwritten.
copy_new() {
  if [ -e "$2" ]; then
    echo "  kept   $2 (already exists)"
  else
    cp "$1" "$2"
    echo "  added  $2"
  fi
}

echo "Skills"
# .claude/skills: Claude Code. .agents/skills: Antigravity, Codex, Cursor. .windsurf/skills: Windsurf.
for dest in .claude/skills .agents/skills .windsurf/skills; do
  mkdir -p "$dest"
  for skill in "$SRC"/skills/*/; do
    [ -f "$skill/SKILL.md" ] || continue
    name="$(basename "$skill")"
    rm -rf "${dest:?}/$name"                 # replace, so files removed upstream do not linger
    cp -R "${skill%/}" "$dest/"              # no trailing slash: BSD cp would copy the contents instead
    rm -rf "${dest:?}/$name/evals"           # test cases are for the pack's maintainers, not for agents
  done
  echo "  added  $dest/"
done

echo "Cursor rules"
mkdir -p .cursor/rules
cp "$SRC"/cursor-rules/*.mdc .cursor/rules/
echo "  added  .cursor/rules/"

echo "Project files"
copy_new "$SRC/templates/AGENTS.md" AGENTS.md
copy_new "$SRC/templates/CLAUDE.md" CLAUDE.md
if [ -e .windsurfrules ]; then
  echo "  kept   .windsurfrules (already exists)"
else
  # Older Windsurf versions read only this file; current ones read AGENTS.md directly.
  echo "Follow the project rules in AGENTS.md at the project root." > .windsurfrules
  echo "  added  .windsurfrules"
fi
copy_new "$SRC/templates/prompts.md" prompts.md
copy_new "$SRC/templates/LAUNCH_CHECKLIST.md" LAUNCH_CHECKLIST.md
copy_new "$SRC/templates/PROMPT_3D_TEMPLATE.md" PROMPT_3D_TEMPLATE.md

echo
if grep -q '^@AGENTS.md' CLAUDE.md 2>/dev/null; then
  echo "Done. Next: fill in the [brackets] in AGENTS.md, then open prompts.md."
else
  echo "Done. Your existing CLAUDE.md was kept. Add a line containing @AGENTS.md to it so Claude Code"
  echo "reads the same rules as the other agents, then fill in the [brackets] in AGENTS.md."
fi
