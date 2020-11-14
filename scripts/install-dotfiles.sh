#!/usr/bin/env bash
git submodule update --init --depth 1
cp -v dotfiles/tmux.conf ~/.tmux.conf
cp -v dotfiles/vimrc ~/.vimrc
cp -v dotfiles/Xresources ~/.Xresources
mkdir ~/.zsh
cp -vr dotfiles/zsh/* ~/.zsh
cp -r dotfiles/zshenv ~/.zshenv
cp -r dotfiles/zshrc ~/.zshrc
mkdir -p ~/.config
cp -vr dotfiles/config/* ~/.config/
if [ $(whoami) == lyra ]; then
    cp -vr dotfiles/gitconfig ~/.gitconfig
elif [ $(whoami) == lyra64 ]; then
    cp -vr dotfiles/gitconfig ~/.gitconfig
fi
