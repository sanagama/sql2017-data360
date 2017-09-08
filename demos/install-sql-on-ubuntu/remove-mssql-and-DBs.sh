#!/bin/bash
#
# run this script as sudo
#

echo Stopping mssql-server...
systemctl stop mssql-server

echo Uninstalling mssql-server...
apt-get remove mssql-server

echo Deleting user generated database files...
rm -fr /var/opt/mssql

echo Uninstalling mssql-tools...
apt-get remove mssql-tools unixodbc-dev

apt autoremove

apt-get purge
apt-get autoclean

echo All done!
