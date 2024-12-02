#!/bin/bash

DB_USER="dbuser"
DB_PASSWORD="dbpassword"
DB_NAME="mydatabase"
BACKUP_DIR="/backups"
RETENTION_DAYS=7

# Create backup
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_$(date +%Y%m%d).sql.gz"
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME | gzip > $BACKUP_FILE

# Rotate old backups
find $BACKUP_DIR -type f -mtime +$RETENTION_DAYS -exec rm -f {} \;

# Logging
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully at $(date)" >> /var/log/db_backup.log
else
    echo "Database backup failed at $(date)" >> /var/log/db_backup.log
fi

# 1- Includes backup file compression.
# 2- Automatically deletes backups older than a specified retention period.
