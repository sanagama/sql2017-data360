/*
 * Here's what a DBA would do to create a pre-prod environment for a dev and mask sensitive data
 *
 */

-- Dump database names
SELECT NAME FROM SYS.DATABASES
GO

-- Restore database into Docker
-- The .BAK file is a directory outside the Docker image that is mounted as a volume
RESTORE FILELISTONLY FROM DISK = '/backups/AdventureworksLT.bak'
GO

RESTORE DATABASE AdventureworksLT
FROM DISK = '/backups/AdventureworksLT.bak'
 WITH
    MOVE 'AdventureworksLT_Data' TO '/var/opt/mssql/data/AdventureworksLT_Data.mdf',
    MOVE 'AdventureworksLT_Log' TO '/var/opt/mssql/data/AdventureworksLT_Log.ldf'
GO

-- Dump database names
SELECT NAME FROM SYS.DATABASES
GO

USE AdventureworksLT
GO

-- EmailAddress and Phone are currently visible
SELECT * FROM [SalesLT].[Customer]
GO

-- Apply Dynamic Data Masking: mask e-mail with a built-in function
ALTER TABLE [SalesLT].[Customer] ALTER COLUMN [EmailAddress]
ADD MASKED WITH (FUNCTION = 'email()');
GO

-- Apply Dynamic Data Masking: only show first 2 digits of mobile number
ALTER TABLE [SalesLT].[Customer] ALTER COLUMN [Phone]
ADD MASKED WITH (FUNCTION = 'partial(2, "XXXXXXXX", 0)');
GO

-- EmailAddress and Phone are now masked
SELECT * FROM [SalesLT].[Customer]
GO
