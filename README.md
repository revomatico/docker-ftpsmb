# docker-ftpsmb
> Docker image from base Ubuntu 18.04 that contains basic firewall, ftp (vsftpd) and samba (v4) servers.
> The purpose is an anonymoius ftp/smb server to store and distribute some files.

# Sample configs
1. The `etc` directory contains some sample config files for:
    - **ufw**: allow some ip subnets
    - **samba**: use an anonymous `share` mapped to `/srv/ftp`
    - **proftpd**: use anonymous access to `/srv/ftp`
2. These sample configs are mapped at container runtime, can be loaded as configmaps in Kubernetes as well.

# Release notes
- 2019-07-24 [1.0.1]:
    - Replaced vsftpd with proftpd as is easier to configure and does the same job
- 2019-06-06 [1.0.0]:
    - Initial release
