#! /bin/sh

mariadb-install-db -u root
mysql -u root & sleep 5
mysql -u -root --execute="CREATE DATABASE wordpress;"
mysql -u root wordpress < wordpress.sql_image
mysql -u root --execute="CREATE USER 'root'@'%' IDENTIFIED BY  'mmonte'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;" 

/usr/bin/supervisord -c /etc/supervisord.conf
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