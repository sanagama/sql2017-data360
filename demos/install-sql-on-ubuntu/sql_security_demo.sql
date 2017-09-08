/*
 * Microsoft Data 360 II - Sept 2017
 * https://github.com/sanagama/sql2017-data360
 *
 * Dynamic Data Masking Demo
 *
 */

USE [BollywoodDB];
GO

-- Dump Actor records
-- note that everyone can see the Email and PhoneNumber
SELECT * FROM Actors;
GO

-- Create user 'TrustedEmployee'
-- we want this user to see unmasked data
CREATE USER TrustedEmployee WITHOUT LOGIN;
GRANT SELECT ON [Actors] TO TrustedEmployee;
GO

-- Create user 'SuspiciousReporter'
-- we want this user to see masked data
CREATE USER SuspiciousReporter WITHOUT LOGIN;
GRANT SELECT ON [Actors] TO SuspiciousReporter;
GO

/*
 * Data Masking Demo
 *
 */

-- Apply mask: mask e-mail with a built-in function
ALTER TABLE [Actors] ALTER COLUMN [Email]
ADD MASKED WITH (FUNCTION = 'email()');
GO

-- Apply mask: only show first 2 digits of mobile number
ALTER TABLE [Actors] ALTER COLUMN [MobileNumber]
ADD MASKED WITH (FUNCTION = 'partial(2, "XXXXXXXX", 0)');
GO

-- Allow user 'TrustedEmployee' to see unmasked data
GRANT UNMASK to TrustedEmployee;
GO

-- Dump Actor records as user 'SuspiciousReporter'
-- the data is masked - no changes needed to client app!
EXECUTE AS USER = 'SuspiciousReporter';
SELECT * FROM Actors;
REVERT;
GO

-- Dump Actor records as user 'TrustedEmployee'
-- the data is unmasked - no changes needed to client app!
EXECUTE AS USER = 'TrustedEmployee';
SELECT * FROM Actors;
REVERT;
GO
