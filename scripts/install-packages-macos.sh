#!/usr/bin/env zsh

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "Installing homebrew casks..."
cat packages/homebrew-cask | xargs brew install --cask --force

echo "Installing homebrew packages..."
cat packages/homebrew | xargs brew install
