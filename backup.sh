#!/bin/bash

# Purpose: Automates the backup process for directories or files.
# Variables
SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
DATE=$(date +\%Y\%m\%d)
BACKUP_NAME="backup_$DATE.tar.gz"

# Create a backup
tar -czf $BACKUP_DIR/$BACKUP_NAME $SOURCE_DIR

# Print completion message
echo "Backup of $SOURCE_DIR completed and saved as $BACKUP_NAME"
# 1- Modify the SOURCE_DIR and BACKUP_DIR to your desired directories.
# 2- This script will create a tar.gz compressed backup of the source directory.
# 3- Use cron to schedule periodic backups:
crontab -e
# Add a cron job to run the script every day at 2 AM
0 2 * * * /path/to/backup_script.sh