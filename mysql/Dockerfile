# CLEAN: 	docker system prune -a -f
# BUILD 	docker build -t image .
# RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# SHELL		docker exec -it cont_name /bin/bash

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client supervisor openrc
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
RUN mkdir -p /run/mysql
COPY srcs/default.sql ./default.sql
COPY srcs/wordpress.sql ./wordpress.sql
# COPY srcs/wordpress.sql ./wordpress.sql


COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

# COPY /srcs/telegraf.conf /etc/telegraf
COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/start.sh /

EXPOSE 3306
ENTRYPOINT sh start.sh
