CREATE USER 'admin'@'%' IDENTIFIED BY 'password'; 
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION; 
CREATE DATABASE wordpress;
CREATE USER 'mmonte'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mmonte'@'%';
FLUSH PRIVILEGES;
