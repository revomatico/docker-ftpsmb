#!/bin/bash

. common.sh

docker run --rm -it \
    --privileged \
    --env FTP_USER="$FTP_USER" \
    --env FTP_PASSWORD="$FTP_PASSWORD" \
    --env SMB_USER="$SMB_USER" \
    --env SMB_PASSWORD="$SMB_PASSWORD" \
    --env FIREWALL_ENABLED="$FIREWALL_ENABLED" \
    --volume `readlink -f ${0%/*}`/etc/proftpd/proftpd.conf:/etc/proftpd/proftpd.conf \
    --volume `readlink -f ${0%/*}`/etc/samba/smb.conf:/etc/samba/smb.conf \
    --volume `readlink -f ${0%/*}`/etc/ufw/user.rules:/etc/ufw/user.rules \
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE \
    bash
