#!/bin/bash

echo
echo ">>Telegram installation started<<"

# Include bash script with custom functions
source ./core/main_functions.sh

# Check wether script run under root
check_root

readonly DWN_URL="https://tdesktop.com/linux"
readonly DWN_FOLDER="/opt"
readonly PACKAGE_NAME="telegram.tar.xz"

# Download archive
download_package "$DWN_URL" "$PACKAGE_NAME" "$DWN_FOLDER"

# Extract package
unpack_package "$PACKAGE_NAME" "$DWN_FOLDER"

# Launch Telegram 
cd "$DIR_NAME"
./Telegram

echo ">>Telegram installation completed<<"
echo
