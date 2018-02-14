#!/bin/bash
set -x

# 'sqldocker-preprod' is listening at port 1433
# Map 'sqldocker-dev' to port 1432
docker run --name 'sqldocker-dev' --cap-add SYS_PTRACE \
           -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Yukon900' \
           -e 'MSSQL_PID=Developer' \
           -p 1432:1433 \
           -d microsoft/mssql-server-linux:latest

docker ps

