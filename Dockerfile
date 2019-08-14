FROM ubuntu:18.04

MAINTAINER Cristian Chiru <cristian.chiru@revomatico.com>

ENV PACKAGES="proftpd samba mc kmod net-tools rsyslog ufw cron"

COPY docker-entrypoint.sh /

RUN set -x \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y $PACKAGES \
## Cleanup
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

STOPSIGNAL SIGRTMIN+3

EXPOSE 21 139 445

ENTRYPOINT /docker-entrypoint.sh
