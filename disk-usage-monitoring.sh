#!/bin/bash

# Purpose: Monitor disk usage and alert if the disk space exceeds a threshold.
# Set the threshold (in percentage)
THRESHOLD=80

# Get the current disk usage percentage of the root directory
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds the threshold
if [ $USAGE -gt $THRESHOLD ]; then
    echo "Warning: Disk usage is above $THRESHOLD%. Current usage is $USAGE%." | mail -s "Disk Usage Alert" user@example.com
fi

# 1- Set the threshold value for disk usage.
# 2- This script checks the disk usage of the root directory and sends an email if the usage exceeds the threshold.
# 3- You need to have a working mail command and SMTP server setup.

