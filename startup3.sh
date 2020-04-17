#!/bin/bash
sudo yum update

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs
npm install -g json-server

yum install -y wget
yum install -y at

cd /root

wget https://github.com/cpinochet/laterradegoogle/blob/master/peliculas.json
wget https://github.com/cpinochet/laterradegoogle/blob/master/js-start.sh
chmod +x js-start.sh

(crontab -l ; echo "*/10 * * * * root /bin/bash /root/js-start.sh")| crontab -

service atd start
service crond reload

at -m now < ./js-start.sh

