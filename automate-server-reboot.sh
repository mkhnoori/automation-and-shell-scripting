#!/bin/bash

# Schedule the reboot
echo "System will reboot at 2 AM daily."
echo "0 2 * * * /sbin/reboot" | crontab -

# 1- The script schedules a daily reboot at 2 AM.
# 2- This can be adjusted for different schedules by modifying the cron entry.
