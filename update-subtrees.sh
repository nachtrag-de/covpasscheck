#!/bin/bash

cd "$(dirname "$0")"

set -e

function update() {
	repo="$1"
	remote="repo-$repo"

	echo $repo

	if git remote get-url "${remote}" 2>&1 > /dev/null; then
		# ok
		echo "   - has remote"
	else
		echo "   - add remote"
		git remote add "${remote}" "git@github.com:nachtrag-de/${repo}.git"
		echo "   - add subtree"
		git subtree add -P "docs/${repo}" "${remote}" main
	fi

	echo "   - pull"
	git subtree pull -P "docs/${repo}" "${remote}" main

	echo "   finished"
}

update "covpassfake"

#git remote add covpassfake	git@github.com:nachtrag-de/covpassfake.git
#git subtree add -P docs/covpassfake covpassfake main
