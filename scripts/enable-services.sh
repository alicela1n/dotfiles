#!/usr/bin/env bash
if [[ $(uname -s) == "Linux" ]]; then
    if [[ $(file /sbin/init) == "/sbin/init: symbolic link to /lib/systemd/systemd" ]]; then
        echo "Systemd detected"
        echo "Enabling services..."
        sudo systemctl enable --now libvirtd
    else
        echo "unknown init system"
    fi
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Nothing to enable atm"
fi
