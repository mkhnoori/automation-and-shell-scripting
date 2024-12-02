#!/bin/bash

# Log directory and retention period (in days)
LOG_DIR="/var/log"
RETENTION_DAYS=30

# Find and delete logs older than the retention period
find $LOG_DIR -type f -name "*.log" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Old logs deleted."

# 1- Set the LOG_DIR to the directory where logs are stored.
# 2- This script deletes log files older than the specified number of days.
# 3- Set it to run periodically via cron to automate log cleanup.