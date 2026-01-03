#!/bin/bash
apt-get update
apt-get install -y nginx htop iproute2
echo "<h1>Welcome to my Linux and network cloud lab</h1>" > /var/www/html/index.html