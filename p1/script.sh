#!/bin/sh

# Update the package list
apk update

# Install Apache2
apk add apache2

# Start the Apache2 service
rc-service apache2 start

# Enable Apache2 to start on boot
rc-update add apache2 default
# Create a simple HTML file to serve
# echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/localhost/htdocs/index.html