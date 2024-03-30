#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y mysql-server git php php-mysql curl

sudo git clone https://github.com/aws/efs-utils
cd /home/ubuntu/efs-utils/
sudo chmod +x /home/ubuntu/efs-utils/build-deb.sh
sudo ./build-deb.sh
sudo apt update -y && sudo apt upgrade -y
sudo apt install /home/ubuntu/efs-utils/build/amazon-efs-utils*.deb -y
sudo mkdir -p /var/www/html/efs
sudo mount -t efs fs-0bf28a27f5898b2ed:/ /var/www/html/efs

sudo mysql <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS wordpress;
USE wordpress;
CREATE USER 'rbn'@'%' IDENTIFIED BY 'informatica';
GRANT ALL PRIVILEGES ON *.* TO 'rbn'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

sudo wp core download --allow-root --path="/var/www/html/efs"

sudo wp config create --allow-root --dbname="wordpress" --dbuser="rbn" --dbpass="informatica" --path="/var/www/html/efs"

sudo wp core install --allow-root --url=172.31.80.12 --title="Ruben WordPress" --admin_user=admin --admin_password=informatica --admin_email=rubengzmn33@gmail.com --path="/var/www/html/efs"

sudo rm /etc/mysql/mysql.conf.d/mysqld.cnf
sudo mv /aws-cf-web/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql
