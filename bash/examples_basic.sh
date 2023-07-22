#!/bin/bash

# Declaring Variables
# There are two ways to declare variables, with or without export. The difference is if you "source" a file
# then anything exported is left in the environment when the script finishes.

# If you want spaces in the text of a variable, then double quotes are needed


MY_NAME_A=Geoff
export MY_NAME_B="Geoff Does Stuff"

echo "My Name is $MY_NAME_A"
echo "My other name is $MY_NAME_B"

ITEMS=(one two three)
echo "Items: ${ITEMS[@]}"
echo "Items count: ${#ITEMS}"
total=${#ITEMS[@]}
declare -i count
count=0
for item in ${ITEMS[@]}
do
	count+=1
	echo "Item ${item} (${count} of ${total})"
done
