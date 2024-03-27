sudo mkdir -p /var/www/wordpress

sudo apt-get update
sudo apt-get install -y  mysql-server php php-mysql curl

sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS wordpress;
USE wordpress;
CREATE USER 'rbn'@'%' IDENTIFIED BY 'informatica';
GRANT ALL PRIVILEGES ON *.* TO 'rbn'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT