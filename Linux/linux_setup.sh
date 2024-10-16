#!/bin/bash

# Install quarterwindows
RELEASE_URL="https://github.com/troyready/quarterwindows/releases/download/v12/quarterwindows@troyready.com-v12.zip"
ZIP_FILE="quarterwindows@troyready.com-v12.zip "
EXTENSION_FOLDER="quarterwindows@troyready.com"
EXTENSIONS_DIR="$HOME/.local/share/gnome-shell/extensions"

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt-get install zsh
else
    echo "zsh is already installed."
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# Ensure $ZSH_CUSTOM is set
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Install powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    echo "Installing powerlevel10k..."
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
else
    echo "powerlevel10k is already installed at $ZSH_CUSTOM/themes/powerlevel10k"
fi

# Install zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed at $ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Install zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed at $ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Install zsh-completions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
    echo "Installing zsh-completions..."
    git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
else
    echo "zsh-completions is already installed at $ZSH_CUSTOM/plugins/zsh-completions"
fi

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

# Install exa
sudo ./Linux/install_exa.sh

# Install quarterwindows
./Linux/install_quarterwindows.sh
