#!/usr/bin/env bash
echo "Creating directories in home"
mkdir -pv ~/code
mkdir -pv ~/os
mkdir -pv ~/tmp
mkdir -pv ~/Desktop
mkdir -pv ~/Documents
mkdir -pv ~/Downloads
mkdir -pv ~/Pictures
mkdir -pv ~/Videos
mkdir -pv ~/Music
if [[ ! -f "~/code/dotfiles" ]]; then
    git clone $(git remote show origin | grep 'Fetch URL:' | sed 's/  Fetch URL: //g') ~/code/dotfiles
fi
