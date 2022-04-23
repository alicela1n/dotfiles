#!/usr/bin/env zsh

echo "Installing homebrew..."
if [ ! -f /usr/local/bin/brew ]; then
    # Install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 
else
    echo "Homebrew already installed, skipping..."
fi

brew install "$(< packages/homebrew)"
brew install --cask "$(< packages/homebrew-cask)"
