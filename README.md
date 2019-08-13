# docker-ftpsmb
> Docker image from base Ubuntu 18.04 that contains basic firewall (ufw), ftp (proftpd) and samba (v4) servers.
> The purpose is an anonymous ftp/smb server to store and distribute some files.

# Environemtn variables
- `OS_FTP_USER` - default: `ftp`, specify a real os user to own the ftp directory
- `DATA_DIR` - default: `/srv/ftp`, the data directory
- `FTP_USER`, `FTP_PASSWORD`, default: empty, specify a virtual ftp user and password
` `FIREWALL_ENABLED`, default: empty, can be `true` to enable ufw

# Notes on the firewall
1. The containers need to be ran as priviledged for the firewall to work
2. The firewall is useless in the context of Kubernetes deployment

# Sample configs
1. The `etc` directory contains some sample config files for:
    - **ufw**: allow some ip subnets
    - **samba**: use an anonymous `share` mapped to `/srv/ftp`
    - **proftpd**: use anonymous access to `/srv/ftp`
2. These sample configs are mapped at container runtime, can be loaded as configmaps in Kubernetes as well.

# Release notes
- 2019-08-13 [1.0.4]:
    - Added dedicated SMB_USER/SMB_PASSWORD env variables, alongside FTP_USER/FTP_PASSWORD
- 2019-08-03 [1.0.3]:
    - Added samba user using FTP_USER and FTP_PASSWORD
    - In the sample `etc/samba/smb.conf`, guests now are read only and the designated FTP_USER can write
- 2019-07-26 [1.0.2]:
    - Added FTP_USER and FTP_PASSWORD env vars to allow creation of a virtual ftp user, if not specified anonymous will be the default
    - Added FIREWALL_ENABLED, that if `true` will enable ufw, otherwise disable at container start
- 2019-07-24 [1.0.1]:
    - Replaced vsftpd with proftpd as is easier to configure and does the same job
- 2019-06-06 [1.0.0]:
    - Initial release
