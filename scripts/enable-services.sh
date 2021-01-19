#!/usr/bin/env bash
if [[ $(uname -s) == "Linux" ]];
    if [[ $(file /sbin/init) == "/sbin/init: symbolic link to /lib/systemd/systemd" ]];
        echo "Systemd detected"
        echo "Enabling services..."
        sudo systemctl enable --now libvirtd
    else
        "unknown init system"
    fi
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Nothing to enable atm"
fi
