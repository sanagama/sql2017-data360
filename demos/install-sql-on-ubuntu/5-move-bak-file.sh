#!/bin/bash
#
# run this script as sudo
#

# Create directory: /var/opt/mssql/backup
mkdir -p /var/opt/mssql/backup

# Move  .bak files to: /var/opt/mssql/backup
mv ~/BollywoodDB.bak /var/opt/mssql/backup/

# Make 'mssql' own the .bak file
chown mssql /var/opt/mssql/backup/BollywoodDB.bak


