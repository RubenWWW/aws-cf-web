#!/bin/bash -xe
sudo apt update -y
sudo apt install git binutils haproxy -y
cd /home/ubuntu
sudo git clone https://github.com/RubenWWW/aws-cf-web
cd ./aws-cf-web
sudo cp ./haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl start haproxy
sudo systemctl restart haproxy


