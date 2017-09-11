#!/bin/bash
set -x

sqlcmd -S localhost -U sa -P Yukon900 -Q "SELECT @@version"

sqlcmd -S localhost -U sa -P Yukon900 -Q "CREATE DATABASE demodb"

sqlcmd -S localhost -U sa -P Yukon900 -Q "SELECT name from sys.databases"

