#!/bin/bash

# Update and upgrade packages
sudo apt update -y && sudo apt upgrade -y  # Updates package index and upgrades all packages.

# Install UFW (Uncomplicated Firewall)
sudo apt install -y ufw  # Installs the UFW firewall utility.
sudo ufw allow OpenSSH  # Allows SSH traffic for remote management.
sudo ufw enable  # Activates the firewall.

# Disable root login over SSH
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config  # Disables root SSH login.
sudo systemctl reload sshd  # Reloads SSH configuration.

# Install Fail2Ban to prevent brute-force attacks
sudo apt install -y fail2ban  # Installs Fail2Ban for monitoring failed login attempts.

# Set permissions on important directories
sudo chmod -R 700 /root  # Restricts access to the root directory.
sudo chmod -R 750 /etc  # Restricts access to configuration files.

echo "Basic security hardening completed!"
