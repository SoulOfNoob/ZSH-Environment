#!/bin/sh

# This script deletes all remote tags that start with "pr-" and prunes them from the local repository.

printf "This will delete all remote tags starting with 'pr-'. Type 'y' to continue: "
read -r confirm
if [ "$confirm" != "y" ]; then
    echo "Aborted."
    exit 1
fi

git fetch --all --prune --prune-tags # Fetch all branches and tags, pruning any that no longer exist on the remote
git push --delete origin --no-verify "$(git tag --list "pr-*")" # Delete all remote tags that start with "pr-"
git fetch --all --prune --prune-tags # Fetch again to ensure local repository is up-to-date after deletion
