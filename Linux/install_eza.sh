#!/bin/bash

sudo mkdir -p /etc/apt/keyrings

# Remove existing key to avoid overwrite prompt
sudo rm -f /etc/apt/keyrings/gierens.gpg

# Download and dearmor key
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --yes --dearmor -o /etc/apt/keyrings/gierens.gpg

# Add repository
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list >/dev/null

# Permissions
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list

# Update and install
sudo apt update
sudo apt install -y eza
