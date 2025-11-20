#!/bin/bash
set -e

# Helper to link keybindings/settings
link_config() {
    local src="$1"
    local dest="$2"
    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dest")"
        rm -f "$dest"
        ln -s "$src" "$dest"
        echo "Linked $src -> $dest"
    fi
}

VSCODE_USER_DIR="$HOME/.config/Code/User"
if [ -d "$VSCODE_USER_DIR" ]; then
    link_config "$CODE_USER_FOLDER/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
    link_config "$CODE_USER_FOLDER/settings.json" "$VSCODE_USER_DIR/settings.json"
else
    echo "VS Code not installed, skipping user folder sym links"
fi

CURSOR_USER_DIR="$HOME/.config/Cursor/User"
if [ -d "$CURSOR_USER_DIR" ]; then
    link_config "$CODE_USER_FOLDER/keybindings.json" "$CURSOR_USER_DIR/keybindings.json"
    link_config "$CODE_USER_FOLDER/settings.json" "$CURSOR_USER_DIR/settings.json"
else
    echo "Cursor not installed, skipping user folder sym links"
fi
