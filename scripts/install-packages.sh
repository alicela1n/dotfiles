#!/usr/bin/env bash
echo "Installing packages..."

arch() {
    echo 'Installing packages for Arch...'
    echo "This script implies that you use KDE Plasma, as such will pull in certain KDE applications and dependencies I use, you have been warned!"
    sudo pacman -Syu "$(< packages/pacman)"
}

flatpak() {
    if [[ -f /usr/bin/flatpak ]]; then
        echo "Want to install the flatpaks? Requires flatpak."
        while true
        do
        read -r -p "[Y/n] " input
        case $input in
            [yY][eE][sS]|[yY])
                flatpak install "$(cat packages/flatpak)"
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
}

unknown_distro() {
    echo "Distro is unknown, can't install packages"
}

if [[ -f /usr/bin/pacman ]]; then
    arch
    flatpak
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Executing macOS script..."
    scripts/install-packages-macos.sh
else
    unknown_distro
    flatpak
fi
