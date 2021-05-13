#! /bin/sh

adduser -D mmonte
echo mmonte:12345 | chpasswd

vsftpd /etc/vsftpd.conf 
# usr/bin/supervisord -c /etc/supervisord.conf
