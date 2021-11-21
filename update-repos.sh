#!/bin/bash

dir="$(dirname "$0")"
cd "${dir}"

set -e

function update() {
	repo="$1"

	cd "${dir}"
	cd "../${repo}"

	git pull
	cd "${dir}"
	mkdir "docs/${repo}/"

	rsync --delete "../${repo}/docs/" "docs/${repo}/"
}

update "covpassfake"
