#!/usr/bin/env bash
if [[ -f /usr/bin/pacman ]]; then
    echo "Installing pacman configuration..."
    sudo cp -v /etc/pacman.conf /etc/pacman.conf.BACKUP
    sudo cp -v etc/pacman.conf /etc/pacman.conf

    echo "Installing paru configuration..."
    sudo cp -v /etc/paru.conf /etc/paru.conf.BACKUP
    sudo cp -v etc/paru.conf /etc/paru.conf
fi
sudo mkdir -pv /etc/profile.d
sudo cp -v etc/profile.d/* /etc/profile.d
