#!/bin/sh

adduser -D 1; echo "1:1" | chpasswd
supervisord
# vsftpd /etc/vsftpd/vsftpd.conf