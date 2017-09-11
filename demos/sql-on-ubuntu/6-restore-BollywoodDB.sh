#!/bin/bash
set -x

sqlcmd -S . -U sa -i ./sql/restore_BollywoodDB.sql

sqlcmd -S . -U sa -Q "select name from sys.databases"


