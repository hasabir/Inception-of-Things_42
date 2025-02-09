#!/bin/sh

# Update the package list
sudo apt-get update
# Install Apache (httpd)
sudo apt-get install -y apache2 rsync

sudo modprobe vboxsf

# Start Apache service
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2
# Create an HTML file
echo "<!DOCTYPE html><html><h1>Hello World</h1></html>" > /var/www/localhost/htdocs/index.html

# Restart Apache to apply changes
sudo systemctl restart apache2