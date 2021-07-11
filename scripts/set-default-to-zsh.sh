#!/usr/bin/env bash
echo "Setting default shell to zsh..."

# Fedora doesn't have chsh for some reason
DIST=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

if [[ $DIST = "fedora" ]]; then
    sudo usermod -s "$(which zsh)" $USER
else
    chsh -s "$(which zsh)"
fi
