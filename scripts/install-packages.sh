#!/bin/bash
echo "Installing packages..."
DIST=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

if [[ $DIST == "arch" ]]; then
    echo 'Installing packages for Arch'
    sudo pacman -Syu $(cat packages/pacman)
elif [[ $DIST == "manjaro" ]]; then
    echo 'Installing packages for Manjaro'
    sudo pacman -Syu $(cat packages/pacman)
elif [[ $DIST == "fedora" ]]; then
    echo "Executing Fedora script..."
    sudo scripts/install-packages-fedora.sh
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Executing macOS script..."
    scripts/install-packages-macos.sh
else
    echo "Unknown distro, install packages yourself"
fi
