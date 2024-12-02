#!/bin/bash

# Update package list
sudo apt update -y   # Ensures the system package index is up to date.

# Install Apache
sudo apt install -y apache2  # Installs Apache HTTP server.
sudo systemctl enable apache2  # Ensures Apache starts on boot.
sudo systemctl start apache2  # Starts the Apache service immediately.

# Install MySQL
sudo apt install -y mysql-server  # Installs MySQL database server.
sudo mysql_secure_installation  # Runs a security script to set root password, remove test database, etc.

# Install PHP
sudo apt install -y php libapache2-mod-php php-mysql  # Installs PHP and its Apache module.

# Restart Apache to apply changes
sudo systemctl restart apache2  # Restarts Apache to load PHP module.

# Create a test PHP file
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php  # Creates a PHP info page for testing.

echo "LAMP stack installed successfully!"
