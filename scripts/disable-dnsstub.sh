#!/bin/bash

### CREATE SYSTEMD DIRECTORY
sudo mkdir -p /etc/systemd/resolved.conf.d

### CREATE CONF FILE
echo -e "[Resolve]\nDNS=127.0.0.1\nDNSStubListener=no" | sudo tee /etc/systemd/resolved.conf.d/resolv.conf > /dev/null

### REMOVE OLD RESOLV.CONF
sudo rm /etc/resolv.conf

### APPLY NEW RESOLV.CONF
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

### RESTART SERVICE
sudo systemctl reload-or-restart systemd-resolved
