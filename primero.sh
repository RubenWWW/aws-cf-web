#!/bin/bash -xe
sudo apt install apache2 git binutils -y
cd /home/ubuntu
sudo git clone https://github.com/aws/efs-utils
sudo git clone https://github.com/RubenWWW/aws-cf-web
cd ./efs-utils/
sudo chmod -x ./build-deb.sh
sudo ./build-deb.sh
sudo apt update -y && sudo apt upgrade -y
sudo apt install ./build/amazon-efs-utils*.deb -y
sudo mkdir -p /var/www/html/efs
sudo mount -t efs fs-0bf28a27f5898b2ed:/ /var/www/html/efs
sudo rm /etc/apache2/sites-enabled/000-default.conf
cd /home/ruben/aws-cf-web/
sudo mv ./cosas.conf /etc/apache2/sites-enabled/000-default.conf
sudo systemctl reload apache2

  
