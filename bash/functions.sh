#!/bin/bash

echo "Starting function demo"

function demoReturn {
	# if you have "set -e" at the top of the script, the second call to the function will terminate the whole script
	echo "Inside Function"
	echo "  Parameter 1 = $1"
	if [ "$1" == "Geoff" ]; then
		return 1
	fi
	echo "Function Finished"
}


# call function with "Hello" and check if it returned an error
demoReturn "Hello"
if [ $? -ne 0 ]; then
	echo "** An error occurred **"
fi

demoReturn "Geoff"
if [ $? -ne 0 ]; then
	echo "** An error occurred **"
fi

demoReturn
if [ $? -ne 0 ]; then
	echo "** An error occurred **"
fi

echo "Done."