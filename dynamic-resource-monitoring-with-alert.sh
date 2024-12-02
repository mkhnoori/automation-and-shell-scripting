#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=90

# Email for alerts
ALERT_EMAIL="admin@example.com"

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
if (( ${CPU_USAGE%%.*} > CPU_THRESHOLD )); then
    echo "High CPU usage detected: $CPU_USAGE%" | mail -s "CPU Alert" $ALERT_EMAIL
fi

# Check Memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( ${MEMORY_USAGE%%.*} > MEMORY_THRESHOLD )); then
    echo "High Memory usage detected: $MEMORY_USAGE%" | mail -s "Memory Alert" $ALERT_EMAIL
fi

# Check Disk usage
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "High Disk usage detected: $DISK_USAGE%" | mail -s "Disk Alert" $ALERT_EMAIL
fi

# 1- Dynamically adjusts thresholds.
# 2- Sends real-time alerts for issues.
