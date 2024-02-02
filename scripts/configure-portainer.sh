#!/bin/bash

### CREATE PORTAINER DIRECTORY
mkdir -p /opt/portainer/data

### INSTALL PORTAINER
docker run -d -p 9443:9443 --name portainer --restart=always -v /etc/localtime:/etc/localtime:ro -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer/data:/data portainer/portainer-ce:latest
