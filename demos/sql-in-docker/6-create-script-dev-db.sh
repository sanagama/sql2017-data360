#!/bin/bash
set -x
DBNAME="AdventureworksLT"

# Generate script with schema + data from pre-production image 'sqldocker-preprod'
mssql-scripter -S localhost -U scripter -P Yukon900 -d $DBNAME \
    --schema-and-data \
    --script-create \
    --convert-uddts \
    --include-objects Customer > create-customer.sql
    
cat ./create-customer.sql | more

# Create database and schema
sqlcmd -S localhost,1432 -U sa -P Yukon900 -Q "CREATE DATABASE $DBNAME"
sqlcmd -S localhost,1432 -U sa -P Yukon900 -d $DBNAME -Q "CREATE SCHEMA [SalesLT]"

