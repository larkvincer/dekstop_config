#!/bin/bash

readonly CLONE_FOLDER="$HOME/.vim"
readonly REPO_URL="git@github.com:larkvincer/vimconfig.git"

echo ">>Cloning vim configuration<<"

git clone "$REPO_URL" "$CLONE_FOLDER"

echo ">>End cloning vim configuration<<"