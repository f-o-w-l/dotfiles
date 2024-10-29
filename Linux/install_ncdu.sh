#!/bin/bash

FILENAME="ncdu-2.6-linux-x86_64.tar.gz"
URL="https://dev.yorhel.nl/download/$FILENAME"

# Check if ncdu is already installed
if command -v ncdu &> /dev/null
then
    echo "ncdu already installed at $(which ncdu)"
    exit 0
fi

echo "Downloading ncdu..."
wget $URL -O $FILENAME

echo "Extracting ncdu..."
tar -xzf $FILENAME

echo "Moving to /usr/local/bin..."
sudo mv ncdu /usr/local/bin/

echo "Cleaning up..."
rm $FILENAME

echo "Verifying installation..."
ncdu --version

echo "ncdu has been installed successfully."
