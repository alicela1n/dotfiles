#!/bin/bash

echo "Installing homebrew..."
if [ ! -f /usr/local/bin/brew ]; then
    echo "Install Xcode command line tools"
    sudo xcode-select --install
    sudo xcodebuild -license accept

    # Install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 
else
    echo "Homebrew already installed, skipping..."
fi

brew install $(cat packages/homebrew)
brew cask install ($cat packages/homebrew-cask)
