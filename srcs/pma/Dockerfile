FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor
RUN apk add php7 php7-fpm php7-opcache \
    php7-gd php7-mysqli php7-zlib php7-curl \
    php7-mbstring php7-json php7-session php7-common \
    php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom


COPY /srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx www
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf

ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz .
RUN tar xvzf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /www/phpmyadmin && mkdir /www/phpmyadmin/tmp/ && chmod 777 /www/phpmyadmin/tmp/

COPY ./srcs/config.inc.php  /www/phpmyadmin/config.inc.php

EXPOSE 5000

COPY ./srcs/start.sh ./
RUN chmod 777 ./start.sh
CMD ["/start.sh"]
# CMD ["supervisord"]