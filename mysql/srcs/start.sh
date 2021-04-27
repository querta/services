#! /bin/sh

# rc-status
# touch /run/openrc/softlevel
openrc default

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
# rc-service /etc/init.d/mariadb start && echo 'CREATE USER 'admin'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;'

# echo 'CREATE USER 'admin'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;' | mysql -u root mysql
mysql -u root --skip-password < ./default.sql
mysql -u root --skip-password < ./wordpress.sql

# mysql -u -root --execute="CREATE DATABASE wordpress;"
# mysql -u root --execute="CREATE USER 'mmonte'@'%' IDENTIFIED BY  'password'; GRANT ALL PRIVILEGES ON *.* TO 'mmonte'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;" 

# mysql -u root wordpress < ./wordpress.sql


usr/bin/supervisord -c /etc/supervisord.conf
