#!/bin/bash


current_dir=$(pwd)

if [ -d "$current_dir/.git" ]; then

  if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit in $current_dir"
  else
    echo "Running git pull in $current_dir"
    git pull

  fi

  if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit after pull in $current_dir"
  else

    echo "Committing changes after pull in $current_dir"
    git add .
    git commit -m "Auto commit after pull"
  fi
else
  echo "$current_dir is not a git repository"
fi

echo "done"