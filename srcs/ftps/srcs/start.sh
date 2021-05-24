#!/bin/sh
adduser 1 -D ; echo "1:1" | chpasswd
vsftpd /etc/vsftpd/vsftpd.conf