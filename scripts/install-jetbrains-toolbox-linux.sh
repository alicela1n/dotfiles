#!/usr/bin/env bash
aria2c $(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g') -d $HOME/tmp -o jetbrains-toolbox.tar.gz
mkdir -pv ~/.local/share/JetBrains/Toolbox
mkdir -pv ~/.local/bin
tar -xzf $HOME/tmp/jetbrains-toolbox.tar.gz -C ~/.local/share/JetBrains/Toolbox --strip-components=1
rm -f $HOME/tmp/jetbrains-toolbox.tar.gz
ln -sfv ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox ~/.local/bin/jetbrains-toolbox
~/.local/bin/jetbrains-toolbox &>/dev/null

