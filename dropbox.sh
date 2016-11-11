#!/bin/bash

echo
echo "--dropbox installation started--"

# Include buch of helpful functions
source ./core/main_functions.sh

readonly DWN_URL="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
readonly DWN_FOLDER="$HOME"
readonly DWN_PACKAGE="db.tar.gz"

#Downloading package
download_package "$DWN_URL" "$DWN_PACKAGE" "$DWN_FOLDER"

# Extract archive
# unpack_package "$DWN_PACKAGE" "$DWN_FOLDER"

# Install deb package
sudo dpkg -i "$DWN_PACKAGE"

echo "--dropbox was seccessfuly installed--"
echo
