#!/bin/bash

REPORT_FILE="/tmp/system_audit_$(date +%Y%m%d).log"

# Hardware Info
echo "==== Hardware Information ====" > $REPORT_FILE
lscpu >> $REPORT_FILE
lsblk >> $REPORT_FILE
free -h >> $REPORT_FILE

# Installed Packages
echo "==== Installed Packages ====" >> $REPORT_FILE
dpkg -l >> $REPORT_FILE

# Security Configurations
echo "==== Security Configurations ====" >> $REPORT_FILE
ufw status >> $REPORT_FILE
cat /etc/ssh/sshd_config | grep -E "PermitRootLogin|PasswordAuthentication" >> $REPORT_FILE

# Top 10 Memory-Consuming Processes
echo "==== Top 10 Memory-Consuming Processes ====" >> $REPORT_FILE
ps aux --sort=-%mem | head -10 >> $REPORT_FILE

# Output the location of the report
echo "Audit report generated: $REPORT_FILE"

# 1- Aggregates hardware, software, and security data.
# 2- Easily extendable for additional checks.
