#!/usr/bin/env bash
# PC recovery bootstrap — macOS
# Usage: bash setup-macos.sh
# Idempotent: brew skips anything already installed.
set -uo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "=== Installing Homebrew ==="
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon puts brew in /opt/homebrew; Intel in /usr/local
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

echo "=== Installing CLI tools ==="
brew install git node python@3.12

echo "=== Installing apps ==="
brew install --cask google-chrome visual-studio-code

echo "=== Installing Claude Code CLI ==="
npm install -g @anthropic-ai/claude-code

echo
echo "Done. Now work through the manual checklist in recovery/README.md"
