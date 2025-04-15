#!/bin/bash

# Bash script which works through a number of branches and rebases them on main and then
# force pushes the changes, so that they are not behind main but up to date

set -eo pipefail

main_branch_name="main" # 'master' is also used

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


function rebase_branch {
	working_branch=$1

	echo "Processing branch: $working_branch"

	# switch to required working branch
	echo "~~ change to $working_branch ~~"
	git checkout $working_branch
	# get the commit SHA of the latest commit of the local working branch
	latest_commit=$(git rev-parse HEAD)

	echo "~~ rebase $working_branch onto $main_branch_name ~~"
	git rebase refs/heads/$main_branch_name

	# force push
	echo "~~ pushing changes (force push) ~~"
	git push origin refs/heads/$working_branch:$working_branch --force-with-lease=$working_branch:$latest_commit

	echo "Rebasing of $working_branch completed successfully"
}

# check for changes and don't continue if any found
echo "Checking for local changes..."
if [[ ! -z $(git status --short) ]]; then
	echo "Cannot continue until you commit, disgard or stash your changes"
	exit 1
fi

update_main_branch

# capture the current branch
current_branch=$(git branch --show-current)

# rebase all the branches we need to
rebase_branch feature/GH-0901_fix-issue
rebase_branch feature/GH-0907_minor-patch

# switch back to the branch we were on when this script started
git checkout $current_branch
