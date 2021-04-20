# CLEAN: 	docker system prune -a -f
# BUILD 	docker build -t image .
# RUN		docker run -p 80:80 -p 443:443 --name cont_name image
# SHELL		docker exec -it cont_name /bin/bash

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache
RUN mkdir -p /run/mysql


COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/start.sh /

EXPOSE 3306
ENTRYPOINT sh start.sh

# WORKDIR /var/lib/mysql
# VOLUME ["/var/lib/mysql"]
# # RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
# # RUN sed -i "s|.*skip-networking.*|skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
# COPY /srcs/my.cnf /etc/my.cnf.d/my.cnf

# # /usr/bin/mysqld --user=root --console
# # RUN sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf
# # RUN sed -i "s|.*skip-networking.*|skip-networking|g" /etc/mysql/my.cnf

# # /usr/bin/mysqld --user=root --console
# # RUN rc-service mysql start && echo "CREATE DATABASE wp;" | mysql -u root --skip-password && echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root --skip-password && echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
# # RUN rc-service mysql start && echo "CREATE DATABASE wp;" | mysql -u root --skip-password && echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root --skip-password && echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
# # RUN mysql_install_db --user=mysql


# # COPY /srcs/start.sh ./start.sh
# # # RUN ls -la ./tmp/
# # RUN chmod +x ./start.sh

# # RUN rc-service mariadb start
# # RUN rc-service mariadb stop

# RUN mysql_install_db -u root
# # RUN /usr/bin/mysqld -u root
# # RUN mysql -u root -e 'CREATE DATABASE wordpress;'
# # RUN mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'passwd';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;SHUTDOWN;"
# RUN echo 'CREATE DATABASE wordpress;' | echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'passwd';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;SHUTDOWN;"
# # RUN echo "CREATE USER 'admin'@'%' IDENTIFIED BY 'passwd';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;SHUTDOWN;"
# # RUN rc-service mariadb stop

# EXPOSE 3306
# # CMD ["rc-update add mariadb default"]
# CMD ["rc-service mariadb restart"]
# # CMD ["sh"]
# # CMD [ "./start.sh"]