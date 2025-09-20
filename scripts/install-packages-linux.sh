#!/usr/bin/env bash
if [[ -f /usr/bin/flatpak ]]; then
    echo "Removing fedora flatpak repo..."
    flatpak remote-delete fedora

    echo "Adding flathub..."
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install --assumeyes $(cat packages/flatpak)
fi

if [[ -f /usr/bin/dnf ]]; then
    echo "Enabling rpmfusion..."
    sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf group upgrade -y core

    echo "Updating all packages..."
    sudo dnf update -y

    echo "Installing development tools..."
    sudo dnf group install -y development-tools
    
    echo "Instaling the rest of the packages..."
    sudo dnf install -y $(cat packages/fedora)
else
    read -r -p "Do you want to use Linuxbrew? [y/N] " response
    if [[ "$response" =~ ^(yes|y|Yes|Y)$ ]]; then
        echo "Installing linuxbrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "Installing homebrew packages..."
        cat packages/homebrew | xargs brew install
    fi
fi

echo "Installing tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "Installing Jetbrains Toolbox..."
scripts/install-jetbrains-toolbox-linux.sh

