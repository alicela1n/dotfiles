#!/usr/bin/env bash
cp -v dotfiles/tmux.conf ~/.tmux.conf
cp -v dotfiles/vimrc ~/.vimrc
cp -v dotfiles/Xresources ~/.Xresources
cp -v dotfiles/zshrc ~/.zshrc
cp -v dotfiles/p10k.zsh ~/.p10k.zsh
cp -v dotfiles/zshenv ~/.zshenv

mkdir -p ~/.config
cp -vr dotfiles/config/* ~/.config/
mkdir -p ~/.zsh
cp -vr dotfiles/zsh/* ~/.zsh/

mkdir -p ~/.config/kitty
cp -vr dotfiles/kitty/kitty.conf ~/.config/kitty/

if [ "$(whoami)" == alice ]; then
    cp -vr dotfiles/gitconfig ~/.gitconfig
fi

# Install powerlevel10k
scripts/install-powerlevel10k.sh
# Install vim packages
scripts/install-vim-packages.sh
# Install tmux packages
scripts/install-tmux-packages.sh
