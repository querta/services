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

# # CLEAN: 	docker system prune -a -f
# # BUILD 	docker build -t image .
# # RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# # SHELL		docker exec -it cont_name /bin/bash

# FROM alpine:3.12

# RUN apk update && apk upgrade
# RUN apk add nginx supervisor vim
# RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl \
#     php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
#     php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
#     php7-ctype php7-dom php7-phar
# # RUN apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype
# # RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
# # RUN apk add nginx php7 php7-gd php7-fpm php7-xml php7-session php7-json
# # RUN apk add php7 php7-fpm 

# # RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
# # RUN mkdir -p /run/mysql
# # RUN mkdir -p /usr/share/webapps/
# # RUN cd /usr/share/webapps/
# RUN mkdir -p /var/www/html/
# RUN cd /var/www/html/
# RUN mkdir -p /run/nginx

# RUN wget http://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN rm latest.tar.gz
# RUN mv wordpress /var/www/html/wordpress

# # RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
# # RUN ln -s /usr/share/webapps/wordpress/ /var/www/html/wp

# # /var/www/html/wordpress 
# COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf


# # COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

# # COPY /srcs/telegraf.conf /etc/telegraf
# COPY /srcs/supervisord.conf /etc/supervisord.conf
# # COPY /srcs/start.sh /

# EXPOSE 5050
# # CMD ["nginx", "-g", "daemon off;"]
# # ENTRYPOINT php-fpm7 && nginx -g 'daemon off;'
# # ENTRYPOINT sh start.sh
# CMD ["supervisord"]