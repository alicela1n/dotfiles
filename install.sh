#!/bin/bash
echo "Installing dotfiles..."
scripts/install-dotfiles.sh

# Installing all packages
scripts/install-packages.sh

# Enabling services
scripts/enable-services.sh

# Set default shell to zsh
scripts/set-default-to-zsh.sh
echo "Done!"
