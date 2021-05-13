FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client supervisor openrc
RUN mkdir -p /run/mysql
COPY srcs/default.sql ./default.sql
COPY srcs/wordpress.sql ./wordpress.sql

COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/start.sh /
RUN chmod 777 /start.sh

EXPOSE 3306
ENTRYPOINT sh start.sh