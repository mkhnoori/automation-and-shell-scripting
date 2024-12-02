#!/bin/bash

# Purpose: Checks whether specific services (like Apache, MySQL) are running.

# List of services to check
SERVICES=("apache2" "mysql" "ssh")

# Loop through each service and check its status
for service in "${SERVICES[@]}"; do
    systemctl is-active --quiet "$service"
    if [ $? -eq 0 ]; then
        echo "$service is running."
    else
        echo "$service is NOT running."
    fi
done

# 1- This script checks whether the services you specify (e.g., apache2, mysql) are active.
# 2- If a service is not running, you can modify the script to restart the service:
# 3- run this command systemctl restart $service


