#!/bin/bash

# Threshold for CPU usage
CPU_THRESHOLD=80

# Find and kill processes exceeding the threshold
ps -eo pid,%cpu,comm --sort=-%cpu | awk -v threshold=$CPU_THRESHOLD 'NR>1 && $2 > threshold { print $1 }' | while read PID; do
    echo "Killing process $PID exceeding $CPU_THRESHOLD% CPU usage."
    kill -9 $PID  # Terminates the process immediately.
done

echo "Resource-intensive processes handled."
