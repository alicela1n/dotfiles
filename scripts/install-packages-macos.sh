#!/bin/bash

echo "Installing homebrew..."
if [ ! -f /usr/local/bin/brew ]; then
    echo "Install Xcode command line tools"
    sudo xcode-select --install
    sudo xcodebuild -license accept

    # Install homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install $(cat packages/homebrew)
brew cask install ($cat packages/homebrew-cask)
