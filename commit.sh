#!/bin/bash

# Check commit message
if [ -z "$1" ]; then
  echo "Error: Commit message missing."
  exit 1
fi

# Check Git repository
if [ ! -d ".git" ]; then
  echo "Not a Git repository."
  exit 1
fi

git add .
git commit -m "$1"

# Push only if remote exists
if git remote | grep -q origin; then
  git push
else
  echo "No remote repository found. Commit done locally."
fi

