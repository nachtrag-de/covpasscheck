#!/bin/bash

set -e
set -x

dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
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
