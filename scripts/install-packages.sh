#!/usr/bin/env bash
echo "Installing packages..."
flatpak() {
    if [[ -f /usr/bin/flatpak ]]; then
            # Add remote repository
            flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
            flatpak install "$(cat packages/flatpak)"
    fi
}

unknown_distro() {
    echo "Distro is unknown, can't install packages"
}

if [[ -f /usr/bin/pacman ]]; then
    sudo pacman -Syu --needed $(cat packages/pacman)
    flatpak
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Executing macOS script..."
    scripts/install-packages-macos.sh
else
    unknown_distro
fi
