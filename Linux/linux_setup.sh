#!/bin/bash
set -e

DOTFILES="$HOME/dev/dotfiles"

# Link general home dir dotfiles
for f in .zshrc .bashrc .aliases; do
    rm -f "$HOME/$f"
    ln -s "$DOTFILES/$f" "$HOME/$f"
done

# Setup VS Code + Cursor's User folders (keybindings/settings.json)
export CODE_USER_FOLDER="$DOTFILES/Code/Linux_User_Folder"
./Linux/setup_code_user_folder.sh

# Install zsh
./Linux/install_zsh.sh

# Install eza
sudo ./Linux/install_eza.sh

# Install delta
sudo ./Linux/install_delta.sh

# Install ncdu2
./Linux/install_ncdu.sh

# Install quarterwindows
if command -v dconf >/dev/null 2>&1; then
    ./Linux/install_quarterwindows.sh
    echo "Setting quarterwindows shortcuts..."
    ./Linux/quarterwindows_keybinds.sh
else
    echo "dconf not found, skipping quarterwindows setup (likely running in WSL)."
fi

# Install apt packages
sudo apt update
sudo apt-get -y install \
    bat \
    feh \
    golang-go \
    gpg \
    htop \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev libncursesw5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    pass \
    postgresql \
    tk-dev \
    zlib1g-dev \

# Install asdf after apt-get installs golang-go
# ./Linux/install_asdf.sh

# bat is installed as batcat
alias bat="batcat"

echo "Linux setup done!"
