#!/bin/bash

LINE="---------------------------------------------"

[[ "$FIREWALL_ENABLED" == "true" ]] && ufw enable || ufw disable

echo $LINE

DATA_DIR=${DATA_DIR:-/srv/ftp}
OS_FTP_USER=${OS_FTP_USER:-ftp}
[[ ! -d "$DATA_DIR" ]] && mkdir -vp "$DATA_DIR"
chown -v $OS_FTP_USER:`id -g $OS_FTP_USER` "$DATA_DIR"

## Add FTP user
[[ -n "$FTP_USER" ]] && \
    ftpasswd --passwd --uid `id -u $OS_FTP_USER` --gid `id -g $OS_FTP_USER` --home "$DATA_DIR" --name "$FTP_USER" --shell /bin/false --file /etc/proftpd/ftpd.passwd --stdin <<< "$FTP_PASSWORD"

echo $LINE

## Add SMB user
if [[ -n "$SMB_USER" ]]; then
    smbpasswd -D1 -a "$SMB_USER" -s <<!
$SMB_PASSWORD
$SMB_PASSWORD
!
    usermod -aG sambashare $SMB_USER
fi

echo $LINE

echo 'Adding empty smbpasswd for ftp user, needed with Windows 10 "secure" connection:'
smbpasswd -a $OS_FTP_USER -s <<!


!

echo $LINE

## Start services
for s in cron rsyslog smbd proftpd; do
    /etc/init.d/$s start
done

echo $LINE

## Output agent logs
tail -F /var/log/proftpd/xferlog -F /var/log/proftpd/proftpd.log -F /var/log/samba.log
