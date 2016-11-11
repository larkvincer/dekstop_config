#!/bin/bash

# Script reads ../list file and executes commands
# to install specified software. Also it creates
# log file, where output result of it's work


# Exit status
readonly E_NOTROOT=67
readonly E_BADARGS=85
readonly E_BADFILE=81

# Script's base directory name
readonly BASE_DIR=`cd $(dirname "${BASH_SOURCE[0]}") && cd .. && pwd`
readonly CORE_BASE_DIR=`cd $(dirname "${BASH_SOURCE[0]}") && pwd`

# File for errors
readonly ERROR_FILE="$BASE_DIR/errors"
# Clean up file or create new
echo "Configure desktop" > $ERROR_FILE
echo `date` >> $ERROR_FILE

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
	# Reach the end of list, so break
	if [ "$item" = \} ]; then
		echo "breaking"
		break
	fi

	# Skip sign which indicates the start of list
	# or it was commented
	if [[ "$item" = \{ || ${item:0:1} == \# ]]; then
		echo "skipping $item"
		continue
	fi

	echo
	echo "--------Processing $item item--------"
	# Run script file if excist
	# Script should be level up of core scripts
	script="$BASE_DIR/$item.sh"
	if [[ -f "$script" ]]; then
		echo "*****Running $script*****"
		bash $script
		if [[ "$?" -ne 0 ]]; then
			echo "$script - error" >> $ERROR_FILE
			echo "!!!Error occured, check error file!!!"
		fi
		continue
	fi

	output="$(sudo apt install $item 2>&1 | grep 'E: Unable')"
	if [[ -z "$output" ]]; then
		sudo apt install --assume-yes $item
		echo "--------Successfuly install $item with apt--------"
	else
		echo "Canno install $item"
		echo "cannot install $item - error" >> $ERROR_FILE
	fi

	echo "-------Processing $item item completed-------"
	echo
done < $1
