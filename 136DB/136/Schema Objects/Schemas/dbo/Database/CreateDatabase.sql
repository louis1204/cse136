USE [master]
GO

-- Drop the database if it exists.
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'$(testvar)')
	DROP DATABASE [$(testvar)]
GO

-- Create the database.
CREATE DATABASE [$(testvar)] ON  PRIMARY 
( NAME = N'$(testvar)_dat', FILENAME = N'C:\MSSQL\Data\$(testvar).mdf' , SIZE = 24800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'$(testvar)_log', FILENAME = N'C:\MSSQL\Data\$(testvar).ldf' , SIZE = 24800KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO

-- Enable full-text.
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [$(testvar)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [$(testvar)] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [$(testvar)] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [$(testvar)] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [$(testvar)] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [$(testvar)] SET ARITHABORT OFF 
GO

ALTER DATABASE [$(testvar)] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [$(testvar)] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [$(testvar)] SET AUTO_SHRINK ON 
GO

ALTER DATABASE [$(testvar)] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [$(testvar)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [$(testvar)] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [$(testvar)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [$(testvar)] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [$(testvar)] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [$(testvar)] SET RECURSIVE_TRIGGERS ON 
GO

ALTER DATABASE [$(testvar)] SET  DISABLE_BROKER 
GO

ALTER DATABASE [$(testvar)] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO

ALTER DATABASE [$(testvar)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [$(testvar)] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [$(testvar)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [$(testvar)] SET PARAMETERIZATION FORCED 
GO

ALTER DATABASE [$(testvar)] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [$(testvar)] SET  READ_WRITE 
GO

ALTER DATABASE [$(testvar)] SET RECOVERY FULL 
GO

ALTER DATABASE [$(testvar)] SET  MULTI_USER 
GO

ALTER DATABASE [$(testvar)] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO

ALTER DATABASE [$(testvar)] SET DB_CHAINING OFF 
GO

-- Create the login if it does NOT exist.
If NOT EXISTS (select loginname from master.dbo.syslogins where name = 'test') 
begin
	CREATE LOGIN test WITH PASSWORD = 'test', CHECK_POLICY = OFF 
end

USE [$(testvar)]
GO

-- Create the user.
CREATE USER test FOR LOGIN test
EXEC sp_addrolemember 'db_datareader', 'test' 
EXEC sp_addrolemember 'db_datawriter', 'test' 
GO  
