#!/bin/bash

# This demo was written with help from the following site:
# [BashPitfalls - Greg's Wiki](https://mywiki.wooledge.org/BashPitfalls#line-11)

function forloop {
	shopt -s globstar # this is needed for the /**/ to scan sub-directories
	for file in ./**/$1; do
		[ -e "$file" ] || continue
		file "$file"
	done
	shopt -u globstar
}

FILE_FILTER="*d.sh"
echo "Filter: $FILE_FILTER"

echo "Basic Find:"
find . -type f -name "${FILE_FILTER}" -exec file {} \;

echo
echo "For Loop:"
forloop "${FILE_FILTER}"
