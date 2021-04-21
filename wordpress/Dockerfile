# CLEAN: 	docker system prune -a -f
# BUILD 	docker build -t image .
# RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# SHELL		docker exec -it cont_name /bin/bash

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx supervisor vim
RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
# RUN mkdir -p /run/mysql
RUN mkdir -p /usr/share/webapps/
# RUN cd /usr/share/webapps/
RUN cd /var/www/html/

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
# RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
# RUN ln -s /usr/share/webapps/wordpress/ /var/www/html/wp


COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf


# COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

# COPY /srcs/telegraf.conf /etc/telegraf
COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/start.sh /

EXPOSE 5050
CMD ["nginx", "-g", "daemon off;"]
