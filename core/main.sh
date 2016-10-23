#!/bin/bash

# Script reads ../list file and executes commands
# to install specified software. Also it creates
# log file, where output result of it's work


# Root id
readonly ROOT_UID=0

# Exit status
readonly E_NOTROOT=67
readonly E_BADARGS=85
readonly E_BADFILE=81

#Script should be run under root user

if [ "$UID" -ne "$ROOT_UID" ]; then
	echo "Only root can run this script"
	exit $E_NOTROOT
fi


# Script sould be run with at least one argumnet,
# which is file contains list of software to install.
# If more than one argument is given, they will be ignored.

if [ $# -lt 1 ]
then
	echo "Using: ./main.sh list_of_software_file"
	exit $E_BADARGS
fi


# Check if specified file with list excist

if [ ! -r $1 ]
then
	echo "Specifed file does not excist!"
	exit $E_BADFILE
fi


# Iterate through list and execute commands

while read -r item
do
	# Skip sign whick indicates the start of list
	if [ "$item" = "\{" ]; then
		continue
	fi

	# Reach the end of list, so break
	if [ "$item" = "\}" ]; then
		break
	fi

	if [[ $item =~ ^\#*$ ]]
	then
		echo "commented"
	fi
done < $1
