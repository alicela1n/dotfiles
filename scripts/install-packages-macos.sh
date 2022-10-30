#!/usr/bin/env zsh

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "Installing homebrew casks..."
cat packages/homebrew-cask | xargs brew install --cask

if [ -f /opt/local/bin/port ]; then
    echo "Installing MacPorts packages..."
    cat packages/macports | xargs sudo port install
else
    echo "Installing homebrew packages..."
    cat packages/homebrew | xargs brew install
fi
