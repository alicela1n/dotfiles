#!/bin/bash
echo "Installing packages..."
DIST=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

if [[ $DIST == "arch" ]]; then
    echo 'Arch'
    sudo pacman -Syu $(cat packages/pacman)
elif [[ $DIST == "fedora" ]]; then
    echo "Executing Fedora script..."
    sudo scripts/install-packages-fedora.sh
else
    echo "Unknown distro, install packages yourself"
fi
