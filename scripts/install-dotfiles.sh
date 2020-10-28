#!/usr/bin/env bash
git submodule update --init --depth 1
cp -v dotfiles/tmux.conf ~/.tmux.conf
cp -v dotfiles/vimrc ~/.vimrc
cp -v dotfiles/Xresources ~/.Xresources
cp -vr dotfiles/zsh ~/.zsh
cp -r dotfiles/zshenv ~/.zshenv
cp -r dotfiles/zshrc ~/.zshrc
mkdir -p ~/.config/nvim
cp -vr dotfiles/config/nvim ~/.config/nvim
