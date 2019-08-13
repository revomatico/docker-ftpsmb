#!/bin/bash

# Common script used by all others to define variables and stay DRY
DOCKER_CONTAINER='docker-ftpsmb'
DOCKER_IMAGE="local/$DOCKER_CONTAINER"

FIREWALL_ENABLED=true

FTP_USER=ftp_virtual_user
FTP_PASSWORD=$FTP_USER

SMB_USER=smb_virtual_user
SMB_PASSWORD=$FTP_USER
