#!/usr/bin/env bash
set -e

DELTA_VERSION="0.18.2"
DELTA_URL="https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
DELTA_TAR_GZ="delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
DELTA_DIR="delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu"

# Determine the actual non-root user’s home directory
if [ -n "$SUDO_USER" ]; then
    TARGET_USER_HOME=$(eval echo "~$SUDO_USER")
else
    TARGET_USER_HOME="$HOME"
fi
GITCONFIG_PATH="${TARGET_USER_HOME}/.gitconfig"

echo "Downloading delta ${DELTA_VERSION}..."
curl -L -o "$DELTA_TAR_GZ" "$DELTA_URL"

echo "Extracting archive..."
tar -xzf "$DELTA_TAR_GZ"

echo "Moving delta binary to /usr/local/bin..."
sudo mv "${DELTA_DIR}/delta" /usr/local/bin/delta
sudo chmod +x /usr/local/bin/delta

echo "Cleaning up downloaded files..."
rm -rf "$DELTA_DIR" "$DELTA_TAR_GZ"

# Configure git if delta is not already set
if grep -q "pager = delta" "$GITCONFIG_PATH" 2>/dev/null; then
    echo "Git is already configured to use delta as pager. Skipping modifying $GITCONFIG_PATH"
else
    echo "Updating $GITCONFIG_PATH ..."
    cat << 'EOF' >> "$GITCONFIG_PATH"

[core]
    pager = delta
[interactive]
    diffFilter = delta --color-only
[delta]
    navigate = true
    # use n and N to move between diff sections
    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true
[merge]
    conflictStyle = zdiff3
EOF
    echo "~/.gitconfig updated to use delta."
fi

echo "delta installation complete!"
