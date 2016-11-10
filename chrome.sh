#!/bin/bash

echo
echo "--Chrome installation started--"

# Include bash script with custom functions
source ./core/main_functions.sh

readonly DWN_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
readonly DWN_FOLDER="$HOME"
readonly PACKAGE_NAME="chrome.deb"

# Move to the processing folder
cd "$DWN_FOLDER"

# Download deb package
download_package "$DWN_URL" "$PACKAGE_NAME" "$DWN_FOLDER"

# Install dpkg package
sudo dpkg -i "$PACKAGE_NAME"

# Remove deb package
rm -f "$PACKAGE_NAME"

echo "--Chrome installation completed--"
echo
