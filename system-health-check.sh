#!/bin/bash

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
echo "CPU Usage: $CPU_USAGE%"

# Check Memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
echo "Memory Usage: $MEMORY_USAGE%"

# Check Disk usage
DISK_USAGE=$(df -h / | grep / | awk '{print $5}')
echo "Disk Usage: $DISK_USAGE"

# 1- This script shows the current CPU, memory, and disk usage.
# 2- Modify it for more advanced checks (e.g., check specific services).
# 3- You can schedule this script with cron to check system health periodically.