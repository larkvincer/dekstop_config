#!/bin/bash

echo
echo "--dropbox installation started--"

# Include buch of helpful functions
source ./core/main_functions.sh

readonly DWN_URL="https://www.dropbox.com/download?plat=lnx.x86_64"
readonly DWN_FOLDER="$HOME"
readonly DWN_PACKAGE="db.tar.gz"

#Downloading package
download_package "$DWN_URL" "$DWN_PACKAGE" "$DWN_FOLDER"

# Extract archive
unpack_package "$DWN_PACKAGE" "$DWN_FOLDER"

cd $DIR_NAME
./dropboxd


echo "--dropbox was seccessfuly installed--"
echo