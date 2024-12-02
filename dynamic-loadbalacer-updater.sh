#!/bin/bash

# Backend servers
BACKENDS=("192.168.1.101" "192.168.1.102" "192.168.1.103")

# HAProxy config file
HAPROXY_CFG="/etc/haproxy/haproxy.cfg"

# Health check and update config
echo "backend web_backends" > $HAPROXY_CFG
for backend in "${BACKENDS[@]}"; do
    if ping -c 1 $backend &>/dev/null; then
        echo "  server $backend $backend:80 check" >> $HAPROXY_CFG
    fi
done

# Reload HAProxy
systemctl reload haproxy

# 1- Performs real-time health checks.
# 2- Dynamically updates the load balancer configuration.
