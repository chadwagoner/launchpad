#!/bin/bash

### CREATE PORTAINER DIRECTORY
sudo mkdir -p /opt/portainer/data

### SET CORRECT PERMISSIONS
chown -R ${USER}:${USER} /opt/portainer

### INSTALL PORTAINER
docker run -d -p 9443:9443 --name portainer --restart=always -v /etc/localtime:/etc/localtime:ro -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/data:/data portainer/portainer-ce:latest
