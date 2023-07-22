#!/bin/bash

# $? = the result of the last executed command, where 0 is success and non-zero failure


echo "Running execute demo..."

./execute_child.sh

if [ $? -ne 0 ]; then
	echo "The child script had an error"
else
	echo "Successful execution of child script"
fi

./execute_child.sh one two three

if [ $? -ne 0 ]; then
	echo "The child script had an error"
else
	echo "Successful execution of child script"
fi

./execute_child.sh A B C D

if [ $? -ne 0 ]; then
	echo "The child script had an error"
else
	echo "Successful execution of child script"
fi
