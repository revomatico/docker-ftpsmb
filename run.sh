#!/bin/bash

. common.sh

docker run --rm -it \
    --cap-add=NET_ADMIN \
    --volume `readlink -f ${0%/*}`/etc/vsftpd.conf:/etc/vsftpd.conf \
    --volume `readlink -f ${0%/*}`/etc/samba/smb.conf:/etc/samba/smb.conf \
    --volume `readlink -f ${0%/*}`/etc/ufw/user.rules:/etc/ufw/user.rules \
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE \
    bash
