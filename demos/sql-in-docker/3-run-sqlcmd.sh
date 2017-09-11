#!/bin/bash
set -x

sqlcmd -S sqldocker -U sa -P Yukon900 -Q "SELECT @@version"

sqlcmd -S sqldocker -U sa -P Yukon900 -Q "CREATE DATABASE demodb"

sqlcmd -S sqldocker -U sa -P Yukon900 -Q "SELECT name from sys.databases"

