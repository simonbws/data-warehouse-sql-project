Script purpose:
  Initializes a fresh database by replacing any existing one, and creates three schemas: bronze, silver, and gold for data organization.

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'dataWarehouse')
BEGIN
    ALTER DATABASE dataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE dataWarehouse;
END;
GO

-- Create the 'dataWarehouse' database
CREATE DATABASE dataWarehouse;
GO

USE dataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronzeLayer;
GO

CREATE SCHEMA silverLayer;
GO

CREATE SCHEMA goldLayer;
GO
