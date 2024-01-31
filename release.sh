#! /bin/bash

export VERSION=v0.0.5

find . -name "*.sh" -exec sed -i '' "s/VERSION=\".*\"/VERSION=\"${VERSION}\"/g" {} \;

git add .
git commit --verbose -s -m "chore: release ${VERSION}"
git push

git tag "${VERSION}"
git push --tags
