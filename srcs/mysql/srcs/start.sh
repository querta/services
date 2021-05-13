#! /bin/sh

openrc default

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root --skip-password < ./default.sql
mysql -u root --skip-password < ./wordpress.sql
rc-service mariadb stop
supervisord