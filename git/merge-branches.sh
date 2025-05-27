#!/bin/bash

# Bash script which merges a number of branches into a new branch

set -eo pipefail

main_branch_name="main" # 'master' is also used
merged_branch_name="merged-changes"

function update_main_branch {
	echo "Update the $main_branch_name branch"
	current_branch=$(git branch --show-current)
	if [[ "$current_branch" == "$main_branch_name" ]]; then
		git fetch origin --prune
	else
		# update the main branch, but without switching to it
		git fetch origin $main_branch_name:$main_branch_name --prune
	fi
}


function merge_branch {
	working_branch=$1

	echo "Processing branch: $working_branch"

	echo "~~ merge in $working_branch ~~"
	# merge changes from working branch, with commit message
	git merge $working_branch -m "Merged $working_branch"

	echo "Merging of $working_branch completed successfully"
}


# check if the target branch already exists
if [[ ! -z $(git branch --list $merged_branch_name) ]]; then
	echo "The target branch ($merged_branch_name) already exists"
	exit 1
fi

# check for changes and don't continue if any found
echo "Checking for local changes..."
if [[ ! -z $(git status --short) ]]; then
	echo "Cannot continue until you commit, stash or discard your changes"
	exit 2
fi

update_main_branch

# checkout main branch, before creating new branch
git checkout $main_branch_name

# create and switch to our new branch
git checkout -b $merged_branch_name

# merge all the branches we need to
merge_branch feature/GH-0901_fix-issue
merge_branch feature/GH-0907_minor-patch

# switch back to the branch we were on when this script started
echo "Everything merged into new branch: $(git branch --show-current)"

echo "Done."
