#!/bin/bash

LINE="---------------------------------------------"

## Start services
for s in rsyslog smbd proftpd; do
    /etc/init.d/$s start
done

echo $LINE

ufw enable

echo $LINE

DATA_DIR=${DATA_DIR:-/srv/ftp}
[[ ! -d "$DATA_DIR" ]] && mkdir -vp "$DATA_DIR"
chown -v ftp:ftp "$DATA_DIR"

echo $LINE
echo 'Adding empty smbpasswd for ftp user, needed with Windows 10 "secure" connection:'
smbpasswd -a ftp -s <<!


!

echo $LINE

## Output agent logs
tail -F /var/log/proftpd/xferlog -F /var/log/proftpd/proftpd.log
