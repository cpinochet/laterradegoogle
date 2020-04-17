#!/bin/bash
sudo yum update
sudo yum install -y nginx

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

sudo systemctl start nginx
sudo systemctl status nginx
