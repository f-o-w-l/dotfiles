$ErrorActionPreference = "Stop"

$DOTFILES = "$env:USERPROFILE\dev\dotfiles"

# Helper function to create symlinks
function Link-Config($src, $dest) {
    if (Test-Path $src) {
        $destDir = Split-Path $dest -Parent
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir }
        if (Test-Path $dest) { Remove-Item $dest -Force }
        New-Item -ItemType SymbolicLink -Path $dest -Target $src
        Write-Host "Linked $src -> $dest"
    } else {
        Write-Host "Source $src does not exist, skipping."
    }
}

# VS Code User folder
$VSCODE_USER = Join-Path $env:APPDATA "Code\User"
Link-Config "$DOTFILES\Code\Windows_User_Folder\keybindings.json" "$VSCODE_USER\keybindings.json"
Link-Config "$DOTFILES\Code\Windows_User_Folder\settings.json" "$VSCODE_USER\settings.json"

# Cursor User folder
$CURSOR_USER = Join-Path $env:LOCALAPPDATA "Cursor\User"
Link-Config "$DOTFILES\Code\Windows_User_Folder\keybindings.json" "$CURSOR_USER\keybindings.json"
Link-Config "$DOTFILES\Code\Windows_User_Folder\settings.json" "$CURSOR_USER\settings.json"

# Install Chocolatey packages
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not installed, please install first."
} else {
    choco install $DOTFILES\Windows\packages.config -y --ignore-checksums
}
