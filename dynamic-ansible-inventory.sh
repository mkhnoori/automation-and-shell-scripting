#!/bin/bash

# AWS Region
AWS_REGION="us-east-1"

# Fetch instance details using AWS CLI
INSTANCES=$(aws ec2 describe-instances --region $AWS_REGION --query 'Reservations[*].Instances[*].[PrivateIpAddress,Tags[?Key==`Name`].Value]' --output text | sed '/^$/d')

# Generate inventory
echo "[servers]" > dynamic_inventory.ini  # Starts the inventory file.
echo "$INSTANCES" | awk '{print $1, "ansible_host="$1}' >> dynamic_inventory.ini  # Formats instance IPs.

echo "Dynamic inventory generated: dynamic_inventory.ini"
