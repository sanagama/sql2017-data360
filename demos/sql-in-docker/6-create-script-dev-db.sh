#!/bin/bash
set -x

mssql-scripter -S sqldocker-pre-prod -U sa -P Yukon900 -d AdventureworksLT > createdb.sql

cat ./createdb.sql | more

