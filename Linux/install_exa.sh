#!/bin/bash

EXA_VERSION="v0.10.0"
EXA_URL="https://github.com/ogham/exa/releases/download/$EXA_VERSION/exa-linux-x86_64-$EXA_VERSION.zip"
EXA_BIN_PATH="bin/exa"
EXA_MAN1_PATH="man/exa.1"
EXA_MAN5_PATH="man/exa_colors.5"
EXA_ZSH_COMPLETIONS_PATH="completions/exa.zsh"
EXA_BASH_COMPLETIONS_PATH="completions/exa.bash"

INSTALL_DIR="/usr/local/bin"
MAN1_DIR="/usr/local/share/man/man1"
MAN5_DIR="/usr/local/share/man/man5"
ZSH_COMPLETIONS_DIR="/usr/local/share/zsh/site-functions"
BASH_COMPLETIONS_DIR="/etc/bash_completion.d"

# Check if exa is already installed
if command -v exa &> /dev/null
then
    echo "exa already installed at $(which exa)"
    exit 0
fi

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Please run with sudo."
   exit 1
fi

echo "Downloading exa version $EXA_VERSION..."
curl -LO $EXA_URL

echo "Extracting exa..."
mkdir temp
unzip exa-linux-x86_64-$EXA_VERSION.zip -d temp
cd temp

echo "Installing exa to $INSTALL_DIR..."
mv $EXA_BIN_PATH $INSTALL_DIR
chmod +x $INSTALL_DIR/exa

echo "Installing completions"
mv $EXA_ZSH_COMPLETIONS_PATH $ZSH_COMPLETIONS_DIR
mv $EXA_BASH_COMPLETIONS_PATH $BASH_COMPLETIONS_DIR

echo "Installing man pages"
mkdir -p $MAN1_DIR
mkdir -p $MAN5_DIR
mv $EXA_MAN1_PATH $MAN1_DIR
mv $EXA_MAN5_PATH $MAN5_DIR

echo "Verifying exa installation..."
if command -v exa &> /dev/null
then
    echo "exa installed successfully at $(which exa)"
else
    echo "exa installation failed."
fi

echo "Cleaning up..."
cd ..
rm -rf temp
rm exa-linux-x86_64-$EXA_VERSION.zip
