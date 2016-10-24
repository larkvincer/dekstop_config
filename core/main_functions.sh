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
# @param:$1 - source url, $2 - destination folder, [$3 - header]
function download_package() {
	# Invalid number of arguments
	echo "***Downloading package***"
	if [[ $# < 2 ]]; then
		echo "Illegal number of arguments"
		echo "Usage download_package source_url destination folder [header]"
		exit 1
	fi

	# Bad destination path
	if [[ ! -e $2 && ! -d $2 ]]; then
		echo "Invalid destination folder"
		exit 1
	fi
	
	# Move to the destination folder
	cd $2
	wget -c --no-check-certificate --no-cookies --header ${3-""} "${1}"
	echo "***Download completed***"
}

download_package 234 "/home/larkvincer/Downloads"
