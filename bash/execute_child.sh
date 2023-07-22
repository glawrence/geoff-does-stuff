#!/bin/bash

# This demo is best used by executing "execute_parent.sh"
# There are some standard Bash variables in use here:
# $# = number of arguments passed
# $0 = the name is this script
# $1 = the first command line argument
# $2 = second command line argument


echo " - Child script executing..."

echo " - The parent script passed $# parameters to $0"

if [ $# -eq 0 ]; then
	echo " - No command line arguments specified"
	exit 1
else
	echo " - First argument: $1"
	echo " - Second argument: $2"
	echo " - Third argument: $3"
	if [ "$4" == "" ]; then
		echo " - Fourth argument is missing"
	else
		echo " - Fourth argument: $4"
	fi
fi
