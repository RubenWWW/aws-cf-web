#!/bin/bash

PRIMARY_INSTALL_DIR="/var/www/html/efs/wordpress"
DB_NAME="wordpress"
DB_USER="rbn"
DB_PASSWORD="informatica"

sudo apt-get update
sudo apt-get install -y mysql-server php php-mysql curl

sudo mkdir -p /var/www/html/efs/wordpress

sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $DB_NAME;
USE $DB_NAME;
CREATE USER 'rbn'@'%' IDENTIFIED BY 'informatica';
GRANT ALL PRIVILEGES ON *.* TO 'rbn'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

sudo wp core download --allow-root --path=$PRIMARY_INSTALL_DIR

sudo wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --path=$PRIMARY_INSTALL_DIR

sudo wp core install --allow-root --url=127.0.0.1 --title="Ruben WordPress" --admin_user=admin --admin_password=informatica --admin_email=rubengzmn33@gmail.com --path=$PRIMARY_INSTALL_DIR

sudo rm /etc/apache2/sites-enabled/000-default.conf
echo "<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html/efs/wordpress
	<Directory /var/www/html/efs/wordpress
		Options Indexes FollowSymLinks
		AllowOverride All
		Require all granted
	</Directory>
	DirectoryIndex index.php

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/000-default.conf

sudo service apache2 restart
