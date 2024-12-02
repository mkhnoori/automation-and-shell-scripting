#!/bin/bash

# Set the directory and user/group
DIRECTORY="/path/to/directory"
USER="user"
GROUP="group"

# Fix permissions and ownership
sudo chown -R $USER:$GROUP $DIRECTORY
sudo chmod -R 755 $DIRECTORY

echo "Permissions and ownership fixed for $DIRECTORY."

# 1- Modify the DIRECTORY, USER, and GROUP variables.
# 2- This script changes the ownership and permissions of files within a directory recursively.
