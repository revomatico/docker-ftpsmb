#!/bin/bash

. common.sh

docker run --rm -it \
    --privileged \
    --volume `readlink -f ${0%/*}`/etc/proftpd/proftpd.conf:/etc/proftpd/proftpd.conf \
    --volume `readlink -f ${0%/*}`/etc/samba/smb.conf:/etc/samba/smb.conf \
    --volume `readlink -f ${0%/*}`/etc/ufw/user.rules:/etc/ufw/user.rules \
    --name $DOCKER_CONTAINER \
    $DOCKER_IMAGE \
    bash
