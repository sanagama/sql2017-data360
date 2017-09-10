RESTORE DATABASE BollywoodDB
 FROM DISK = '/var/opt/mssql/backup/BollywoodDB.bak'
 WITH MOVE 'BollywoodDB_Data' TO '/var/opt/mssql/data/BollywoodDB_Data.mdf',
 MOVE 'BollywoodDB_Log' TO '/var/opt/mssql/data/BollywoodDB_Log.ldf'

GO
