IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Plant')
BEGIN
    CREATE database Plant
    PRINT 'Database Plant successfully created.'
END
ELSE
    PRINT 'You already have database Plant created.'
GO

USE [Plant]
GO

:setvar path "C:\Users\htimy01\Documents\SQL Server Management Studio\Task 2"

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
           WHERE TABLE_NAME = N'Plant')
BEGIN
    :r $(path)\CreateTable.sql
    PRINT 'Table Plant successfully created.'
END
ELSE
    PRINT 'You already have table Plant created.'
GO

IF NOT EXISTS (SELECT * FROM Plant)
BEGIN
    :r $(path)\InsertTable.sql
    PRINT 'Information added successfully to table Plant.'
END
ELSE
    PRINT 'You already have the Plant information added.'
GO
