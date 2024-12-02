#!/bin/bash

# Update the package list and upgrade all packages
sudo apt update -y && sudo apt upgrade -y

# Clean up unnecessary packages
sudo apt autoremove -y

echo "System updated and unnecessary packages removed."

# 1- This script runs an update (apt update) and upgrade (apt upgrade) for Debian-based systems.
# 2- After upgrading, it removes unnecessary packages to free up space.
# 3- This can be scheduled via cron to run periodically and ensure the system stays up-to-date.
