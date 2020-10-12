#!/bin/bash
echo "Installing packages..."

if [[ 'which pacman' ]]; then
    sudo pacman -S $(cat packages/pacman)
elif [[ 'which dnf' ]]; then
    sudo dnf install $(cat packages/dnf)
else
    echo "Unknown distro, skipping..."
fi
