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

# Install exa
sudo ./Linux/install_exa.sh

# Install htop
if command -v htop &> /dev/null
then
    echo "htop already installed at $(which htop)"
else
    sudo apt install htop
fi

# Install ncdu2
./Linux/install_ncdu.sh

# Install quarterwindows
./Linux/install_quarterwindows.sh

echo "Done!"
