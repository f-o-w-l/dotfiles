$ErrorActionPreference = "Stop"

$WIN_DOTFILES_DIR = "$env:USERPROFILE\dotfiles\Code\Windows_User_Folder"
$CHOCO_PACKAGES_CONFIG = "$env:USERPROFILE\dotfiles\Windows\packages.config"

# Helper function to create symlinks
function Link-Config($src, $dest) {
    if (Test-Path $src -PathType Leaf) {
        $destDir = Split-Path $dest -Parent
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir }
        if (Test-Path $dest) { Remove-Item $dest -Force }
        New-Item -ItemType SymbolicLink -Path $dest -Target $src
        Write-Host "Linked $src -> $dest"
    } else {
        Write-Host "Source $src does not exist, skipping."
    }
}

$VSCODE_USER_DIR = Join-Path $env:APPDATA "Code\User"
$CURSOR_USER_DIR = Join-Path $env:LOCALAPPDATA "Cursor\User"

if (Test-Path $VSCODE_USER_DIR) {
    Link-Config "$WIN_DOTFILES_DIR\keybindings.json" "$VSCODE_USER_DIR\keybindings.json"
    Link-Config "$WIN_DOTFILES_DIR\settings.json" "$VSCODE_USER_DIR\settings.json"
} else {
    Write-Host "VS Code not installed, skipping user folder symlinks"
}

if (Test-Path $CURSOR_USER_DIR) {
    Link-Config "$WIN_DOTFILES_DIR\keybindings.json" "$CURSOR_USER_DIR\keybindings.json"
    Link-Config "$WIN_DOTFILES_DIR\settings.json" "$CURSOR_USER_DIR\settings.json"
} else {
    Write-Host "Cursor not installed, skipping user folder symlinks"
}

# Install Chocolatey packages
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not installed, please install first."
} else {
    choco install $CHOCO_PACKAGES_CONFIG -y --ignore-checksums
}
