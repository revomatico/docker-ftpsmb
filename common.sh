#!/bin/bash

# Common script used by all others to define variables and stay DRY
DOCKER_CONTAINER='docker-ftpsmb'
DOCKER_IMAGE="local/$DOCKER_CONTAINER"
FTP_USER=ftp_virtual_user
FTP_PASSWORD=$FTP_USER
FIREWALL_ENABLED=true