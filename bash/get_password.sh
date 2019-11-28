#!/bin/bash

# The read command is built-in:
#    -p allows a prompt to be specified
#    -s suppresses output, so handy for passwords

default_username=geoff

read -p "Enter username, press Enter for default [$default_username]: " username
if [ -z "$username" ]; then
	username=$default_username
fi

read -sp "Enter password for [$username]: " password
echo

if [ -z "$password" ]; then
	echo "No password enetred, cannot proceed"
	exit 1
else
	echo "Thanks for the password"
fi

echo "Doing stuff....."
echo "Credentials:"
echo "    Username: $username"
echo "    Password: $password"
echo "Done."
