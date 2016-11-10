#!/bin/bash

echo
echo "--Sublime text editor installation--"

# Include bash script with custom functions
source ./core/main_functions.sh

readonly DWN_URL="https://download.sublimetext.com/sublime-text_build-3126_amd64.deb"
readonly DWN_FOLDER="$HOME/Desktop"
readonly PACKAGE_NAME="sublime.deb"

# Download archive
download_package "$DWN_URL" "$PACKAGE_NAME" "$DWN_FOLDER"

# Install dpkg package
sudo dpkg -i "$PACKAGE_NAME"

# Remove deb package
rm -f "$PACKAGE_NAME"

# Download and install package manager for sublime text editor
download_package "https://packagecontrol.io/Package%20Control.sublime-package" "Package Control.sublime-package" "$HOME/.config/sublime-text-3"

echo "--Sublime installation completed--"
echo
