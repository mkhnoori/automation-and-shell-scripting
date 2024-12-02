#!/bin/bash

# Install Nginx
sudo apt install -y nginx  # Installs Nginx web server.

# Configure Nginx as a load balancer
cat <<EOL | sudo tee /etc/nginx/conf.d/load_balancer.conf
upstream backend {
    server 192.168.1.101;  # Backend server 1.
    server 192.168.1.102;  # Backend server 2.
    server 192.168.1.103;  # Backend server 3.
}

server {
    listen 80;  # Nginx listens on port 80.
    location / {
        proxy_pass http://backend;  # Forwards requests to the backend servers.
        proxy_set_header Host \$host;  # Passes the original Host header.
        proxy_set_header X-Real-IP \$remote_addr;  # Passes the client's real IP address.
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;  # Tracks forwarded IP addresses.
    }
}
EOL

# Restart Nginx
sudo systemctl restart nginx  # Restarts Nginx to apply the load balancer configuration.

echo "Nginx load balancer configured successfully!"
