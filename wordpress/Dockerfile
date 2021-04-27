FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add openssl unzip nginx supervisor
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-phar

#config for supervisor
COPY /srcs/supervisord.conf /etc/supervisord.conf

#create folder for nginx
RUN mkdir -p /run/nginx && chmod 777 /run/nginx

#config for nginx
# COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for wordpress
RUN mkdir -p /www && chmod 777 /www

#download and setup wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz -C /www && rm -rf latest.tar.gz
# COPY ./srcs/wp-config.php /ww§w/wordpress/wp-config.php
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php

#download and setup telegraf
# ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
# RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
# 	&& mv telegraf-1.17.0 telegraf \
# 	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
# COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 5050

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf