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

# echo password  > mysqldump -u root -p wordpress  > wordpress.sql
# kubectl exec deploy/mysql-deploy -- echo password  > mysqldump -u root -p wordpress  > wordpress.sql
# kubectl cp deploy/mysql-deploy:./wordpress.sql /
# kubectl cp pods/mysql-deploy-f685fddb8-zhvgh:./wordpress.sql /

# openrc default
# rc-service mariadb setup
# # mariadb-install-db -u root
# # mysql -u root & sleep 5
# rc-service mariadb start
# mysql -u -root --execute="CREATE DATABASE wordpress;"
# # mysql -u root wordpress < wordpress.sql_image
# mysql -u root --execute="CREATE USER 'mmonte'@'%' IDENTIFIED BY  'password'; GRANT ALL PRIVILEGES ON *.* TO 'mmonte'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;" 
# # CREATE DATABASE wordpress;
# # CREATE USER 'user'@'%' IDENTIFIED BY 'pass';
# # GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';
# # FLUSH PRIVILEGES;
# /usr/bin/supervisord -c /etc/supervisord.conf
# mysql_install_db -u root

# /usr/bin/mysqld -u root &

# sleep 5

# if ! mysql -u root -e 'USE wordpress'; then
# 	mysql -u root -e 'CREATE DATABASE wordpress;'
# fi

# mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'passwd';GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;USE wordpress;FLUSH PRIVILEGES;SHUTDOWN;"

# sleep 5

# telegraf &
# mysqld -u root &

# while true
# do
# 	sleep 1
# 	if [ $(ps | grep -v grep | grep mysqld | wc -l) -eq 0 ] || [ $(ps | grep -v grep | grep telegraf | wc -l) -eq 0 ]
# 	then
# 		exit
# 	fi
# done