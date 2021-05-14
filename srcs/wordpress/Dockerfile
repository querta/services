FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
    php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
    php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
    php7-ctype php7-dom php7-phar

RUN mkdir -p /run/nginx /www && chmod 777 /run/nginx /www
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf

ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz -C /www && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php

EXPOSE 5050
ENTRYPOINT ["supervisord"]