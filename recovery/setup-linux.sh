#!/usr/bin/env bash
# PC recovery bootstrap — Debian/Ubuntu
# Usage: bash setup-linux.sh
# Idempotent: apt and npm skip anything already current.
set -uo pipefail

sudo apt-get update

echo "=== Base tools ==="
sudo apt-get install -y git curl unzip ca-certificates gnupg python3 python3-pip python3-venv

echo "=== Google Chrome ==="
if ! command -v google-chrome >/dev/null 2>&1; then
  curl -fsSL -o /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt-get install -y /tmp/chrome.deb
  rm -f /tmp/chrome.deb
else
  echo "Chrome already installed"
fi

echo "=== Node.js LTS (NodeSource) ==="
if ! command -v node >/dev/null 2>&1; then
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "Node.js already installed: $(node --version)"
fi

echo "=== VS Code ==="
if ! command -v code >/dev/null 2>&1; then
  sudo install -D -o root -g root -m 644 /dev/null /etc/apt/keyrings/packages.microsoft.gpg
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/packages.microsoft.gpg >/dev/null
  echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  sudo apt-get update && sudo apt-get install -y code
else
  echo "VS Code already installed"
fi

echo "=== Claude Code CLI ==="
sudo npm install -g @anthropic-ai/claude-code

echo
echo "Done. Now work through the manual checklist in recovery/README.md"
