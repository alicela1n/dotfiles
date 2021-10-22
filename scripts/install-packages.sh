#!/usr/bin/env bash
echo "Installing packages..."
if [[ -f /usr/bin/pacman ]]; then
    sudo pacman -Syu --needed $(cat packages/pacman)
    mkdir -p ~/code/aur
    echo "Instaling AUR helper paru-bin..."
    git clone https://aur.archlinux.org/paru-bin.git ~/code/aur/paru-bin
    pushd ~/code/aur/paru-bin > /dev/null
    makepkg -si
    popd > /dev/null
    echo "Installing AUR packages..."
    paru --sudoloop -S $(cat packages/aur)
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Executing macOS script..."
    scripts/install-packages-macos.sh
else
    echo "Unknown distro!"
fi
