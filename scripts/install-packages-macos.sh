#!/usr/bin/env zsh

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

if ! type "brew" > /dev/null; then
	echo >> /Users/alice/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/alice/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

echo "Installing homebrew casks..."
cat packages/homebrew-cask | xargs brew install --cask --force

echo "Installing homebrew packages..."
cat packages/homebrew | xargs brew install
cat packages/homebrew-macos-only | xargs brew install

echo "Installing App Store apps..."
cat packages/mas | xargs mas install
