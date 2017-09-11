#!/bin/bash
set -x

docker ps

# Get rid of the earlier image
docker rm -f sqldocker

# Map 'sqldocker-preprod' to port 1433
# Mount a volume into the image to restore a database backup
docker run --name 'sqldocker-preprod' --cap-add SYS_PTRACE \
           -v  ~/sql2017-data360/demos/backups:/backups \
           -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Yukon900' \
           -e 'MSSQL_PID=Developer' \
           -p 1433:1433 \
           -d microsoft/mssql-server-linux

docker ps

