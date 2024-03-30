#!/bin/bash -xe
sudo apt install apache2 git binutils php libapache2-mod-php php-mysql -y
cd /home/ubuntu
sudo git clone https://github.com/aws/efs-utils
sudo git clone https://github.com/RubenWWW/aws-cf-web
cd /home/ubuntu/efs-utils/
sudo chmod +x /home/ubuntu/efs-utils/build-deb.sh
sudo ./build-deb.sh
sudo apt update -y && sudo apt upgrade -y
sudo apt install /home/ubuntu/efs-utils/build/amazon-efs-utils*.deb -y
sudo mkdir -p /var/www/html/efs
sudo mount -t efs fs-0bf28a27f5898b2ed:/ /var/www/html/efs
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo rm /etc/php/8.1/apache2/php.ini
cd /home/ubuntu/aws-cf-web/
sudo mv /home/ubuntu/aws-cf-web/cosas.conf /etc/apache2/sites-enabled/000-default.conf
sudo mv /home/ubuntu/aws-cf-web/php.ini /etc/php/8.1/apache2/php.ini
sudo systemctl reload apache2

  
