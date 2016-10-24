#!/bin/bash

# This is bunch of functions for bash scripts whick
# automate software installation on Ubuntu-based distro


#Only user with uid=0 have root privileges
readonly ROOT_UID=0

# Make sure script runs by root user
function root_checker() {
	if [ "$UID" -ne "$ROOT_UID" ]
	then
		echo "This script must be run as root"2>&1
		exit $E_NOTROOT
	fi
}

# Download package in specified folder.
# After downloading stays in download folder
# @param:$1 - source url, $2 - $package name,
# $3 - destination folder, [$4 - header]
function download_package() {
	# Invalid number of arguments
	echo "***Downloading package***"
	if [[ $# < 3 ]]; then
		echo "Illegal number of arguments"
		echo "Usage download_package source_url package_name destination folder [header]"
		exit 1
	fi

	# Bad destination path
	if [[ ! -e $2 && ! -d $2 ]]; then
		echo "Invalid destination folder"
		exit 1
	fi
	
	# Move to the destination folder
	cd $2 wget -O $2 -c --no-check-certificate --no-cookies --header ${3-""} "${1}"
	echo "***Download completed***"
}

# Unpacke package and delete archive
# @param: $1 - package name $2 - folder contains package
# $3 - variable for storing folder name
function unpack_package() {
	echo "***Unpacking package***"
	if [[ $# < 3 ]]; then
		echo "Illegal number of arguments"
		echo "Usage upack_package package_name folder_contains var_for_name_storing"
		exit 1
	fi

	# Bad path
	if [[ ! -e "$2/$1" ]]; then
		echo "Invalid file path: $2/$1"
		exit 1
	fi

	cd $2
	DIR_NAME=`tar -tzf ${SRC} | head -1 | cut -f 1 -d "/"`

	echo "***Unpacking completed***"
}
