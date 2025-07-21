#!/usr/bin/env bash
echo "Installing linuxbrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing homebrew packages..."
cat packages/homebrew | xargs brew install

echo "Installing Jetbrains Toolbox..."
scripts/install-jetbrains-toolbox-linux.sh
