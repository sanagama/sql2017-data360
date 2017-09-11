#!/bin/bash
set -x

docker ps

docker rm -f sqldocker

docker run -d -h 'sqldocker-preprod' --name 'sqldocker-preprod' \
           -v  ~/sql2017-data360/backup-files:backups \
           -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Yukon900' \
           -e 'MSSQL_PID=Developer' --cap-add SYS_PTRACE -p 1433:1433 \
           microsoft/mssql-server-linux

docker ps

