#!/usr/bin/env bash
echo "Installing packages..."

read -p "Do you want to install packages? [y/N]" response

if [[ "$response" =~ ^(yes|y|Yes|Y)$ ]]; then
    if [[ $(uname -s) == "Darwin" ]]; then
        echo "Executing macOS script..."
        scripts/install-packages-macos.sh
    elif [[ $(uname -s) == "Linux" ]]; then
        echo "Executing Linux script..."
        scripts/install-packages-linux.sh
    fi
fi
