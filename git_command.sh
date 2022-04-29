#! /bin/bash

# Batch delete branches
git branch | grep 'feature' | xargs git branch -d
