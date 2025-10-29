#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WORKING_DIR="$(pwd)"

for d in */ ; do
	echo "updating: ${d}"
	cd "$SCRIPT_DIR" || exit 1
	cd "$d" || exit 1
	git checkout main
	git fetch --all --prune --jobs=10
	git pull
	composer install
done

cd "$WORKING_DIR" || exit 1
