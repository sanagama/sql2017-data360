#!/bin/bash
set -x

sqlcmd -S sqldocker -U sa -P Yukon900 -i ./createdb.sql 

sqlcmd -S sqldocker -U sa -P Yukon900 -Q "SELECT name from sys.databases"

