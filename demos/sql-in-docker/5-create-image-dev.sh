#!/bin/bash
set -x

docker run -d -h 'sqldocker-dev' --name 'sqldocker-dev' \
           -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Yukon900' \
           -e 'MSSQL_PID=Developer' --cap-add SYS_PTRACE -p 1432:1433 \
           microsoft/mssql-server-linux

docker ps

