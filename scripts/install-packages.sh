#!/usr/bin/env bash
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
    echo "Want to install the flatpaks? Requires flatpak."
    while true
    do
    read -r -p "[Y/n] " input
    case $input in
        [yY][eE][sS]|[yY])
            flatpak install $(cat packages/flatpak)
            break
        ;;
        [nN][oO]|[nN])
        echo "Skipping..."
        break
        ;;
        *)
        echo "Invalid input..."
        ;;
    esac
    done
fi
