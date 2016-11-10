#!/bin/bash

# Configurate apt repository for mysql
echo
echo "--Mysql-server installation started--"

# Include bash script with custom functions
source ./core/main_functions.sh

readonly DWN_URL="http://dev.mysql.com/get/mysql-apt-config_0.8.0-1_all.deb"
readonly DWN_FOLDER="$HOME/Desktop"
readonly PACKAGE_NAME="mysql-apt-config.deb"

# Download archive
download_package "$DWN_URL" "$PACKAGE_NAME" "$DWN_FOLDER"

# Install dpkg package
sudo dpkg -i "$PACKAGE_NAME"

# Remove deb package
rm -f "$PACKAGE_NAME"

# Install msyql-server from musql apt repository
# sudo apt update
# sudo apt install mysql-server

echo "--Mysql-server isntallation complete--"
echo