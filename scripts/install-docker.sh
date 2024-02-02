#!/bin/bash

### INSTALL REQUIRED PACKAGES
sudo apt-get update
sudo apt-get install ca-certificates curl

### ADD DOCKER OFFICIAL GPG KEY
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

### ADD DOCKER REPOSITORY TO APT SOURCES
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

### INSTALL DOCKER ENGINE
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

### ADD DOCKER GROUP TO CURRENT USER
sudo usermod -aG docker $USER

### ENABLE DOCKER TO START AT BOOT
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

### TODO: currently only works for Debian based OS, add case clause to support more OS flavors in future.