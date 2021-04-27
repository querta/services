#! /bin/sh

adduser -D mmonte
echo mmonte:12345 | chpasswd

usr/bin/supervisord -c /etc/supervisord.conf
