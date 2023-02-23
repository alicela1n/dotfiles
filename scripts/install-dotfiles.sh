#!/usr/bin/env bash
scripts/install-oh-my-zsh.sh
cp -v dotfiles/tmux.conf ~/.tmux.conf
cp -v dotfiles/vimrc ~/.vimrc
cp -v dotfiles/Xresources ~/.Xresources
cp -v dotfiles/zshrc ~/.zshrc
cp -v dotfiles/zshenv ~/.zshenv

mkdir -p ~/.config
cp -vr dotfiles/config/* ~/.config/
mkdir -p ~/.zsh
cp -vr dotfiles/zsh/* ~/.zsh/

if [ "$(whoami)" == alice ]; then
    cp -vr dotfiles/gitconfig ~/.gitconfig
fi

# Install vim packages
scripts/install-vim-packages.sh
# Install tmux packages
scripts/install-tmux-packages.sh
