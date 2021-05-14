FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mysql mysql-client supervisor openrc
# RUN apk add mariadb mariadb-client supervisor openrc
RUN mkdir -p /run/mysql
COPY srcs/default.sql ./default.sql
COPY srcs/wordpress.sql ./wordpress.sql

COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/start.sh /
RUN chmod +x /start.sh

EXPOSE 3306
ENTRYPOINT ["./start.sh"]