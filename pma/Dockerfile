FROM alpine:3.12

RUN apk update && apk upgrade
# RUN apk add openssl nginx supervisor \
# 	php7 php7-mysqli php7-zlib php7-curl php7-mbstring \
# 	php7-json php7-session php7-fpm libc6-compat
RUN apk add nginx supervisor
# 	# php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
#     php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#     php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
#     php7-ctype php7-dom php7-phar
RUN apk add php7 php7-fpm php7-opcache \
    php7-gd php7-mysqli php7-zlib php7-curl \
    php7-mbstring php7-json php7-session php7-common \
    php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext \
    php7-ldap php7-ctype php7-dom


#config for supervisor
COPY /srcs/supervisord.conf /etc/supervisord.conf

# RUN /usr/bin/mysql_install_db --user=root
# /etc/init.d/mysql start && rc-update add mysql default
# /usr/bin/mysqladmin -u root password 'password'

#create folder for nginx
RUN mkdir -p /run/nginx www
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for wordpress
# RUN mkdir -p /www && /www/phpmyadmin/tmp/

ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz .
RUN tar xvzf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /www/phpmyadmin && mkdir /www/phpmyadmin/tmp/ && chmod 777 /www/phpmyadmin/tmp/

COPY ./srcs/config.inc.php  /www/phpmyadmin/config.inc.php



EXPOSE 5000

# ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
CMD ["supervisord"]