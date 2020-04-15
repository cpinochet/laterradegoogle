#! /bin/bash
sudo yum update
sudo yum install -y httpd
# cat <<EOF > /var/www/html/index.html
# <html><body><h1>Hello World</h1>
# <p>This page was created from a simple startup script!</p>
# </body></html>
# EOF
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo systemctl start httpd
sudo systemctl status httpd
