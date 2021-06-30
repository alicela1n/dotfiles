#!/usr/bin/env bash
if [[ $(uname -s) == "Linux" ]]; then
    if [[ $(file /sbin/init) == "/sbin/init: symbolic link to /lib/systemd/systemd" ]]; then
        echo "Systemd detected"
        echo "Enabling services..."
        sudo systemctl enable --now libvirtd
    elif [[ "$(file /sbin/init)" == "/sbin/init: symbolic link to ../lib/systemd/systemd" ]]; then
        printf "Systemd detected\n"
        printf "Enabling services...\n"
        sudo systemctl enable --now libvirtd
    elif [[ -f /usr/bin/openrc-init ]]; then
        printf "OpenRC detected"
        printf "Enabling services..."
        sudo rc-update add libvirtd default
        sudo /etc/init.d/libvirtd start
    else
        printf "unknown init system\n"
    fi
elif [[ "$(uname -s)" == "Darwin" ]]; then
    printf "Nothing to enable atm\n"
fi
