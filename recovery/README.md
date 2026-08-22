# PC Reset Recovery Kit

A fresh-machine bootstrap for getting back to a working setup after a PC reset:
browser, dev toolchain (git, Node.js, Python, VS Code, Claude Code), and the
manual sign-in steps that no script can do for you.

## 1. Run the setup script for your OS

All three scripts are idempotent — safe to re-run if something fails partway.

### Windows (PowerShell, run as Administrator)

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\setup-windows.ps1
```

Uses `winget`, which ships with Windows 10/11. If Chrome's website download
keeps failing (a common post-reset problem — Edge blocks or mangles it),
`winget install Google.Chrome` in this script sidesteps the browser entirely.

### macOS

```bash
bash setup-macos.sh
```

Installs Homebrew first if missing, then everything else through it.

### Linux (Debian/Ubuntu)

```bash
bash setup-linux.sh
```

## 2. What the scripts install

| Category | Tools |
|---|---|
| Browser | Google Chrome |
| Version control | Git |
| Editors | VS Code |
| JavaScript | Node.js LTS (for Next.js / React / TypeScript work) |
| Python | Python 3 + pip |
| AI tooling | Claude Code CLI (`npm install -g @anthropic-ai/claude-code`) |
| Terminal basics | curl, unzip (Linux/macOS) |

## 3. Manual recovery checklist (the part scripts can't do)

- [ ] **Chrome data** — open Chrome, sign in to your Google account, turn on
      Sync. Bookmarks, saved passwords, extensions, and history come back
      automatically. Nothing was lost if sync was on before the reset.
- [ ] **Git identity** — `git config --global user.name "Aman Bhandari"` and
      `git config --global user.email "bhandari.aman0101@gmail.com"`.
- [ ] **GitHub auth** — generate a new SSH key
      (`ssh-keygen -t ed25519 -C "bhandari.aman0101@gmail.com"`) and add the
      public key at <https://github.com/settings/keys>. The old machine's key
      can be deleted from that page.
- [ ] **Claude Code** — run `claude` once and complete the login flow, then
      reconnect any MCP servers you use (Jira, Slack, Chrome DevTools, Gmail).
- [ ] **VS Code** — sign in with Settings Sync (GitHub account) to restore
      extensions, keybindings, and settings if it was enabled before.
- [ ] **Re-clone your repos** — `git clone` your active repositories fresh
      rather than restoring from backup drives.

## 4. If a download still fails

- Windows: prefer `winget install <package>` over browser downloads — it pulls
  from Microsoft's verified source and avoids SmartScreen/Edge interference.
- Check the system clock. A wrong date/time after a reset breaks TLS on almost
  every download ("connection is not private" errors).
- Corporate/ISP DNS problems right after reinstall: try `1.1.1.1` or `8.8.8.8`
  as DNS and retry.

## 5. Prevent the next fire drill

Keep this folder current: when you adopt a new daily-driver tool, add it to the
scripts here and push. Your setup becomes one `git clone` + one script away,
forever.
