RELEASE_URL="https://github.com/troyready/quarterwindows/releases/download/v12/quarterwindows@troyready.com-v12.zip"
ZIP_FILE="quarterwindows@troyready.com-v12.zip "
EXTENSION_FOLDER="quarterwindows@troyready.com"
EXTENSIONS_DIR="$HOME/.local/share/gnome-shell/extensions"

# Check if quarterwindows is already installed
if [ ! -d "$EXTENSIONS_DIR/$EXTENSION_FOLDER" ]; then
    echo "Installing quarterwindows..."
    mkdir -p $EXTENSION_FOLDER
    cd $EXTENSION_FOLDER

    echo "Downloading release..."
    curl -L -o $ZIP_FILE $RELEASE_URL

    echo "Unzipping release..."
    unzip $ZIP_FILE

    echo "Deleting ZIP file $ZIP_FILE..."
    rm $ZIP_FILE

    if [ ! -d "$EXTENSIONS_DIR" ]; then
        echo "Creating GNOME extensions directory..."
        sudo mkdir -p "$EXTENSIONS_DIR"
    else
        echo "GNOME extensions directory already exists."
    fi

    echo "Moving $EXTENSION_FOLDER to GNOME extensions directory..."
    cd ..
    sudo mv $EXTENSION_FOLDER "$EXTENSIONS_DIR"

    echo "Restarting GNOME Shell..."
    killall -3 gnome-shell
else
    echo "quarterwindows is already installed."
fi

# Set quarterwindows shortcuts
echo "Setting quarterwindows shortcuts..."
./Linux/quarterwindows_keybinds.sh
