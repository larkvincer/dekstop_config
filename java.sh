#!/bin/bash

echo
echo ">>Java installation started<<"

# Include buch of helpful functions
source ./core/main_functions.sh

# Only root can run this script
check_root

#folder where java will be installed
readonly DWN_FOLDER="/opt"
#link for java source
readonly DWN_URL="http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.tar.gz"
readonly DWN_PACKAGE="jdk.tar.gz"
# File for with commands to set environment variables
readonly PATH_FILE="$HOME/Desktop/java_installation.txt"

#Downloading package
download_package "$DWN_URL" "$DWN_PACKAGE" "$DWN_FOLDER" "Cookie: oraclelicense=accept-securebackup-cookie"
#wget -c --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL}"

# Extract archive
unpack_package "$DWN_PACKAGE" "$DWN_FOLDER"

# File for setting path
echo "export JAVA_HOME=/opt/$DIR_NAME" >> "$PATH_FILE"
echo 'export PATH=$PATH:$JAVA_HOME' >> "$PATH_FILE"

echo ">>Java was seccessfuly installed<<"
echo
