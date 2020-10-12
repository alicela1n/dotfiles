#!/bin/bash
echo "Do you use GNOME terminal and would you like to apply my config?"
while true
do
read -r -p "[Y/n] " input
case $input in
    [yY][eE][sS]|[yY])
    echo "Backing up current config..."
    pushd gnome-terminal >/dev/null
    ./backup.sh
    echo "Backed up current config to gnome-terminal/gnome-terminal-settings-backup.dconf"
    echo "Now applying new settings..."
    ./settings.sh
    popd >/dev/null
    break
    ;;
    [nN][oO]|[nN])
    echo "Skipping"
    break
    ;;
    *)
    echo "Invalid input..."
    ;;
esac
done

