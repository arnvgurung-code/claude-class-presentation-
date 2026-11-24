#!/usr/bin/env bash
# Installs the two skill tools too large to keep in this repository.
#   archify       (tt-a1i/archify, 25 MB skill folder) -> .claude/skills/archify
#   playwright-cli (microsoft/playwright-cli)          -> global npm binary
# The other skills are already here: impeccable, taste-skill, superdesign, ui-ux-pro-max and
# diagram-design load as plugins from .claude/settings.json; Emil Kowalski's pack and the
# playwright-cli skill live in .claude/skills/.
set -euo pipefail
cd "$(dirname "$0")/.."

if [ ! -f .claude/vendor/archify/archify/SKILL.md ]; then
  rm -rf .claude/vendor/archify
  git clone --depth 1 --filter=blob:none --sparse https://github.com/tt-a1i/archify.git .claude/vendor/archify
  git -C .claude/vendor/archify sparse-checkout set archify
fi
ln -sfn ../vendor/archify/archify .claude/skills/archify
echo "archify skill: .claude/skills/archify"

if ! command -v playwright-cli >/dev/null 2>&1; then
  npm install -g @playwright/cli@latest
fi
echo "playwright-cli $(playwright-cli --version)"

# In Claude Code cloud sessions, Chromium is preinstalled; point the CLI at it (tested).
if [ -x /opt/pw-browsers/chromium ]; then
  echo "cloud tip: export PLAYWRIGHT_MCP_EXECUTABLE_PATH=/opt/pw-browsers/chromium PLAYWRIGHT_MCP_HEADLESS=true PLAYWRIGHT_MCP_SANDBOX=false"
fi
