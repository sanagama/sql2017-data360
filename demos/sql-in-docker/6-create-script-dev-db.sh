#!/bin/bash
set -x
DBNAME="AdventureworksLT"

# Generate script with schema + data from pre-production image 'sqldocker-preprod'
mssql-scripter -S 127.0.0.1 -U scripter -P Yukon900 -d $DBNAME \
    --schema-and-data \
    --script-create \
    --convert-uddts \
    --include-objects Customer > create-customer.sql
    
cat ./create-customer.sql | more

# Create database and schema
sqlcmd -S 127.0.0.1,1432 -U sa -P Yukon900 -Q "CREATE DATABASE $DBNAME"
sqlcmd -S 127.0.0.1,1432 -U sa -P Yukon900 -d $DBNAME -Q "CREATE SCHEMA [SalesLT]"

