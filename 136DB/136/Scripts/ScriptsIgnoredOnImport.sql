
USE [master]
GO
/****** Object:  Database [cse132a]    Script Date: 08/16/2012 00:04:54 ******/
CREATE DATABASE [cse132a] ON  PRIMARY 
( NAME = N'cse132alive', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cse132alive.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cse132alive_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cse132alive_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cse132a] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cse132a].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cse132a] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cse132a] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cse132a] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cse132a] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cse132a] SET ARITHABORT OFF
GO
ALTER DATABASE [cse132a] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cse132a] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cse132a] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cse132a] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cse132a] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cse132a] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cse132a] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cse132a] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cse132a] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cse132a] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cse132a] SET  DISABLE_BROKER
GO
ALTER DATABASE [cse132a] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cse132a] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cse132a] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cse132a] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cse132a] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cse132a] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cse132a] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [cse132a] SET  READ_WRITE
GO
ALTER DATABASE [cse132a] SET RECOVERY FULL
GO
ALTER DATABASE [cse132a] SET  MULTI_USER
GO
ALTER DATABASE [cse132a] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cse132a] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'cse132a', N'ON'
GO
USE [cse132a]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 08/16/2012 00:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_cutting]    Script Date: 08/16/2012 00:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 08/16/2012 00:04:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 08/16/2012 00:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 08/16/2012 00:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[brand]    Script Date: 08/16/2012 00:04:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[update_customer]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_brand]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[product_variation]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[update_product_type]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product_cutting]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product_color]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[users]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[create_customer]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[orders]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[delete_user]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_pv]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_orders]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_user]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_pv]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_user]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_pv]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_orders]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_order_item]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_profile]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_order_item]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_orders]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_order_item]    Script Date: 08/16/2012 00:04:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO

USE [master]
GO
/****** Object:  Database [cse132a]    Script Date: 08/16/2012 18:09:17 ******/
CREATE DATABASE [cse132a] ON  PRIMARY 
( NAME = N'cse132alive', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cse132alive.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'cse132alive_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\cse132alive_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [cse132a] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cse132a].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cse132a] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [cse132a] SET ANSI_NULLS OFF
GO
ALTER DATABASE [cse132a] SET ANSI_PADDING OFF
GO
ALTER DATABASE [cse132a] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [cse132a] SET ARITHABORT OFF
GO
ALTER DATABASE [cse132a] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [cse132a] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [cse132a] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [cse132a] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [cse132a] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [cse132a] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [cse132a] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [cse132a] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [cse132a] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [cse132a] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [cse132a] SET  DISABLE_BROKER
GO
ALTER DATABASE [cse132a] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [cse132a] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [cse132a] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [cse132a] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [cse132a] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [cse132a] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [cse132a] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [cse132a] SET  READ_WRITE
GO
ALTER DATABASE [cse132a] SET RECOVERY FULL
GO
ALTER DATABASE [cse132a] SET  MULTI_USER
GO
ALTER DATABASE [cse132a] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [cse132a] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'cse132a', N'ON'
GO
USE [cse132a]
GO
/****** Object:  Table [dbo].[product_type]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_cutting]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[brand]    Script Date: 08/16/2012 18:09:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[update_customer]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_brand]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[product_variation]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[update_product_type]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product_cutting]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product_color]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_product]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[users]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[create_customer]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[orders]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[delete_user]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_pv]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_orders]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_user]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_pv]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_user]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_pv]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_orders]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[update_order_item]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_profile]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[create_order_item]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_orders]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[delete_order_item]    Script Date: 08/16/2012 18:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
