#!/bin/bash

set -eo pipefail

main_branch_name="main" # 'master' is also used

function update_main_branch {
	echo "~~ update the $main_branch_name branch ~~"
	# update the main branch, but without switching to it
	git fetch origin $main_branch_name:$main_branch_name --recurse-submodules=no --prune
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
	git push --porcelain origin refs/heads/$working_branch:$working_branch --force-with-lease=$working_branch:$latest_commit

	echo "Rebasing of $working_branch completed successfully"
}

update_main_branch

rebase_branch feature/GH-0901_fix-issue
rebase_branch feature/GH-0907_minor-patch
