#!/bin/bash

# AWS S3 bucket and local directory
BUCKET_NAME="my-s3-bucket"
LOCAL_DIR="/path/to/local/directory"

# AWS CLI Sync Command
aws s3 sync $LOCAL_DIR s3://$BUCKET_NAME --delete --exact-timestamps

# Logging
if [ $? -eq 0 ]; then
    echo "S3 sync completed successfully at $(date)" >> /var/log/s3_sync.log
else
    echo "S3 sync failed at $(date)" >> /var/log/s3_sync.log
fi

# 1- Includes --delete to remove files in S3 that no longer exist locally.
# 2- Logs success or failure for auditing.