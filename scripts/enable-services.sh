#!/bin/bash
if [[ $(uname -s) == "Linux" ]]; then # assumes systemd
    echo "Enabling services..."
    sudo systemctl enable --now libvirtd
elif [[ $(uname -s) == "Darwin" ]]; then
    echo "Nothing to enable atm"
fi
