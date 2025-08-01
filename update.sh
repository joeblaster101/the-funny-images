#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if the current directory is a git repository
if [ -d "$current_dir/.git" ]; then
  # Run git pull
  echo "Running git pull in $current_dir"
  git pull
else
  echo "$current_dir is not a git repository"
fi
