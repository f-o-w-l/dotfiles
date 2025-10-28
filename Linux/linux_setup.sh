#!/bin/bash

# Link VS Code settings for Cursor
rm $HOME/.config/Cursor/User/keybindings.json
rm $HOME/.config/Cursor/User/settings.json
ln -s $HOME/dev/dotfiles/Code/Linux_User_Folder/keybindings.json $HOME/.config/Cursor/User/keybindings.json
ln -s $HOME/dev/dotfiles/Code/Linux_User_Folder/settings.json $HOME/.config/Cursor/User/settings.json

# Link dotfiles
rm -f $HOME/.zshrc
rm -f $HOME/.bashrc
rm -f $HOME/.aliases
ln -s $HOME/dev/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dev/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dev/dotfiles/.aliases $HOME/.aliases

# Install zsh
./Linux/install_zsh.sh

# Install eza
sudo ./Linux/install_eza.sh

# Install ncdu2
./Linux/install_ncdu.sh

# Install quarterwindows
./Linux/install_quarterwindows.sh

# Install apt packages
sudo apt update
sudo apt-get install -y \
    bat \
    feh \
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

# bat is installed as batcat
alias bat="batcat"

echo "Done!"
