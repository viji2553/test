#!/bin/bash
sudo apt-get update
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache
echo "<h1>Welcome to Vijay's page...hi</h1>" | sudo tee /var/www/html/index.html
