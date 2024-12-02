#!/bin/bash

# Domains and web server
DOMAINS=("example.com" "www.example.com")
EMAIL="admin@example.com"

# Renew SSL Certificates
for domain in "${DOMAINS[@]}"; do
    certbot certonly --webroot -w /var/www/html -d $domain --email $EMAIL --agree-tos --non-interactive
done

# Restart Web Server
echo "Restarting Nginx..."
sudo systemctl restart nginx

# Logging
if [ $? -eq 0 ]; then
    echo "SSL renewal and Nginx restart successful at $(date)" >> /var/log/ssl_renew.log
else
    echo "SSL renewal failed at $(date)" >> /var/log/ssl_renew.log
fi

# 1- Automates multiple domain certificate renewals.
# 2- Restarts the web server to apply new certificates.
