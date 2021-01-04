#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache
echo "<h1>Welcome to Vijay's page. How are you?</h1>" | sudo tee /var/www/html/index.html
