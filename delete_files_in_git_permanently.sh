#! /bin/bash

# https://stackoverflow.com/questions/872565/remove-sensitive-files-and-their-commits-from-git-history

DELETE_MATCH_PATH="${1}"

git filter-branch --force --index-filter \
    "git rm --cached --ignore-unmatch ${DELETE_MATCH_PATH}" \
    --prune-empty --tag-name-filter cat -- --all
git push --force --verbose --dry-run
git push --force
