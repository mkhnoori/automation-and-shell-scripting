#!/bin/bash

# Add a user
add_user() {
    echo "Enter username:"
    read USERNAME
    sudo useradd $USERNAME
    echo "User $USERNAME added."
}

# Delete a user
delete_user() {
    echo "Enter username:"
    read USERNAME
    sudo userdel -r $USERNAME
    echo "User $USERNAME deleted."
}

# List users
list_users() {
    echo "Listing all users:"
    cat /etc/passwd | cut -d: -f1
}

echo "Select an option:"
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
read OPTION

case $OPTION in
    1) add_user ;;
    2) delete_user ;;
    3) list_users ;;
    *) echo "Invalid option." ;;
esac

# 1- This script allows for adding, removing, or listing users on the system.
# 2- Use sudo for commands requiring elevated privileges.
# 3- The script can be executed interactively or customized to automate user management tasks.
