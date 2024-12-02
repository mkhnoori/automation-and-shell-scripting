#!/bin/bash

# Enable rsyslog on the central server
sudo apt install -y rsyslog  # Installs rsyslog for logging.
sudo sed -i 's/#module(load="imudp")/module(load="imudp")/' /etc/rsyslog.conf  # Enables UDP module for rsyslog.
sudo sed -i 's/#input(type="imudp"/input(type="imudp"/' /etc/rsyslog.conf  # Configures UDP input for rsyslog.
sudo sed -i 's/#port="514"/port="514"/' /etc/rsyslog.conf  # Sets UDP port 514 for log reception.

# Restart rsyslog service
sudo systemctl restart rsyslog  # Restarts the rsyslog service to apply changes.

echo "Centralized log server setup completed."
