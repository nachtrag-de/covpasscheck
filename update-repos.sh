#!/bin/bash

set -e
set -x

dir="$(dirname "$0")"
cd "${dir}"

function update() {
	repo="$1"

	cd "$(dirname "${dir}")/${repo}"

	git pull
	cd "${dir}"
	mkdir "docs/${repo}/"

	rsync -r --delete "../${repo}/docs/" "docs/${repo}/"
}

update "covpassfake"
