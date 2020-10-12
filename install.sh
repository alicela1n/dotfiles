#!/bin/bash
echo "Installing dotfiles..."
scripts/install-dotfiles.sh

# Setting GNOME Terminal configuration
scripts/gnome-terminal.sh

# Installing all packages
sudo scripts/install-packages.sh

# Enabling services
scripts/enable-services.sh
echo "Done!"
