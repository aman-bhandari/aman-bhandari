# PC recovery bootstrap — Windows 10/11
# Run in an elevated PowerShell:
#   Set-ExecutionPolicy Bypass -Scope Process -Force
#   .\setup-windows.ps1
# Idempotent: winget skips packages that are already installed.

$ErrorActionPreference = "Continue"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget not found. Install 'App Installer' from the Microsoft Store, then re-run."
    exit 1
}

$packages = @(
    "Google.Chrome",
    "Git.Git",
    "Microsoft.VisualStudioCode",
    "OpenJS.NodeJS.LTS",
    "Python.Python.3.12",
    "Microsoft.WindowsTerminal",
    "7zip.7zip"
)

foreach ($pkg in $packages) {
    Write-Host "`n=== Installing $pkg ===" -ForegroundColor Cyan
    winget install --id $pkg --exact --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "OK: $pkg" -ForegroundColor Green
    } else {
        Write-Warning "winget exited with $LASTEXITCODE for $pkg (already installed is fine)"
    }
}

# Claude Code CLI — needs the Node.js install above; refresh PATH for this session first
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
            [System.Environment]::GetEnvironmentVariable("Path", "User")
if (Get-Command npm -ErrorAction SilentlyContinue) {
    Write-Host "`n=== Installing Claude Code CLI ===" -ForegroundColor Cyan
    npm install -g @anthropic-ai/claude-code
} else {
    Write-Warning "npm not on PATH yet - open a NEW terminal and run: npm install -g @anthropic-ai/claude-code"
}

Write-Host "`nDone. Open a new terminal, then work through the manual checklist in recovery/README.md" -ForegroundColor Green
