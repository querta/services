FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl nginx supervisor \
	php7 php7-mysqli php7-zlib php7-curl php7-mbstring \
	php7-json php7-session php7-fpm libc6-compat

#config for supervisor
COPY /srcs/supervisord.conf /etc/supervisord.conf

RUN /usr/bin/mysql_install_db --user=root
/etc/init.d/mysql start && rc-update add mysql default
/usr/bin/mysqladmin -u root password 'password'

#create folder for nginx
RUN mkdir -p /run/nginx

#config for nginx
# COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for wordpress
RUN mkdir -p /www

ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.zip .
ADD https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz .
RUN tar xvzf phpMyAdmin-5.1.0-all-languages.tar.gz -C /www && rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz


#download and setup wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz -C /www && rm -rf latest.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages /www/phpmyadmin
# COPY ./srcs/wp-config.php /ww§w/wordpress/wp-config.php
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php
COPY ./srcs/config.inc.php /www/phpmyadmin/config.inc.php


#download and setup telegraf
# ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
# RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
# 	&& mv telegraf-1.17.0 telegraf \
# 	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
# COPY srcs/telegraf.conf etc/telegraf/telegraf.conf


EXPOSE 5000

# ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
CMD ["supervisord"]