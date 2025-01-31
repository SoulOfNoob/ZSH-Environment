#!/bin/bash

TAG=$1

echo "git push --delete origin $TAG"
git push --delete origin "$TAG" --no-verify || exit 1
echo "git tag --delete $TAG"
git tag --delete "$TAG" || exit 1
echo "git tag $TAG"
git tag "$TAG" || exit 1
echo "git push origin tag $TAG"
git push origin tag "$TAG" || exit 1

exit 0
