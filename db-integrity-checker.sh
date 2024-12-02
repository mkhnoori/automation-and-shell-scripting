#!/bin/bash

# Database credentials
DB_USER="root"
DB_PASSWORD="password"

# List all databases and check each
for db in $(mysql -u $DB_USER -p$DB_PASSWORD -e "SHOW DATABASES;" | grep -v Database | grep -v mysql | grep -v information_schema); do
    echo "Checking database: $db"
    mysqlcheck -u $DB_USER -p$DB_PASSWORD --check --databases $db >> /var/log/db_integrity.log 2>&1  # Checks for corruption.
done

echo "Database integrity check completed!"
