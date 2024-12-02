#!/bin/bash

# List of required packages
REQUIRED_PACKAGES=("nginx" "curl" "jq" "git")

# Install missing packages
for package in "${REQUIRED_PACKAGES[@]}"; do
    if ! dpkg -l | grep -qw $package; then
        echo "Installing $package..."
        sudo apt install -y $package
    else
        echo "$package is already installed."
    fi
done

# Upgrade all installed packages
echo "Upgrading all packages..."
sudo apt update -y && sudo apt upgrade -y

# Clean up
sudo apt autoremove -y

# 1- Modular package installation.
# 2- Verifies and logs the state of dependencies.
