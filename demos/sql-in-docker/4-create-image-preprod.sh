#!/bin/bash

echo "List of Docker container running currently:"
docker ps

# Get rid of the earlier container
echo "Removing Docker container 'sqldocker' ..."
docker rm -f sqldocker

# Get full path of 'backups' directory to mount 
BACKUP_DIR_NAME=backups
SCRIPT_PATH_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"
BACKUP_DIR_REL="$SCRIPT_PATH_DIR/../$BACKUP_DIR_NAME"
BACKUP_DIR_PARENT="$( cd "$(dirname "$BACKUP_DIR_REL")" ; pwd -P )"
BACKUP_DIR_PATH="$BACKUP_DIR_PARENT/$BACKUP_DIR_NAME"
echo "Mounting directory to Docker: " $BACKUP_DIR_PATH

# Map 'sqldocker-preprod' to port 1433
# Mount a volume into the image to restore a database backup
echo "Running Docker container 'sql-preprod' ... "
docker run --name 'sqldocker-preprod' --cap-add SYS_PTRACE \
           -v  $BACKUP_DIR_PATH:/backups \
           -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Yukon900' \
           -e 'MSSQL_PID=Developer' \
           -p 1433:1433 \
           -d microsoft/mssql-server-linux:latest


echo "List of Docker container running currently:"
docker ps
