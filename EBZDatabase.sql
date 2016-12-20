USE [master]
GO
/****** Object:  Database [EBZ]    Script Date: 12/20/2016 1:01:05 PM ******/
CREATE DATABASE [EBZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EBZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LAPTOP\MSSQL\DATA\EBZ.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EBZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.LAPTOP\MSSQL\DATA\EBZ_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EBZ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EBZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EBZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EBZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EBZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EBZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EBZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [EBZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EBZ] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EBZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EBZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EBZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EBZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EBZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EBZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EBZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EBZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EBZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EBZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EBZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EBZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EBZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EBZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EBZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EBZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EBZ] SET RECOVERY FULL 
GO
ALTER DATABASE [EBZ] SET  MULTI_USER 
GO
ALTER DATABASE [EBZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EBZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EBZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EBZ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EBZ', N'ON'
GO
USE [EBZ]
GO
/****** Object:  StoredProcedure [dbo].[Sp_TblWareHouse]    Script Date: 12/20/2016 1:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_TblWareHouse]
(
@choice int,
@WarehouseId int,
@ProductName nvarchar(150),
@Quantity int,
@Unit nvarchar(150),
@Brand nvarchar(150),
@WareHouseName nvarchar(150),
@CreateDate nvarchar(150),
@CreateUser nvarchar(150),
@Price int
)
as
begin
	if(@choice=1)
	begin
		insert into TblWareHouse
		values(@WarehouseId, @ProductName, @Quantity, @Unit, @Brand, @WareHouseName, @CreateDate, @CreateUser, @Price)
	end
	else if(@choice=2)
	begin
		Update TblWareHouse set ProductName=@ProductName, Quantity=@Quantity, Unit=@Unit, Brand=@Brand, WareHouseName=@WareHouseName, CreateDate=@CreateDate, CreateUser=@CreateUser, Price=@Price where WareHoustId=@WarehouseId
	end
	else if(@choice=3)
	begin
		delete from TblWareHouse where WareHoustId=@WarehouseId
	end
	else if(@choice=0)
	begin
		select * from TblWareHouse
	end
end
GO
/****** Object:  Table [dbo].[TblUser]    Script Date: 12/20/2016 1:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[UserPassWord] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblWareHouse]    Script Date: 12/20/2016 1:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblWareHouse](
	[WareHoustId] [int] NOT NULL,
	[ProductName] [nvarchar](150) NULL,
	[Quantity] [nvarchar](150) NULL,
	[Unit] [nvarchar](150) NULL,
	[Brand] [nvarchar](150) NULL,
	[WareHouseName] [nvarchar](150) NULL,
	[CreateDate] [nvarchar](150) NULL,
	[CreateUser] [nvarchar](150) NULL,
	[Price] [int] NULL,
	[Total]  AS ([Quantity]*[Price]+([Quantity]*[Price])/(10)),
 CONSTRAINT [PK__TblWareH__9C94E18AD9DB3E72] PRIMARY KEY CLUSTERED 
(
	[WareHoustId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TblUser] ON 

INSERT [dbo].[TblUser] ([UserId], [UserName], [UserPassWord]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[TblUser] OFF
INSERT [dbo].[TblWareHouse] ([WareHoustId], [ProductName], [Quantity], [Unit], [Brand], [WareHouseName], [CreateDate], [CreateUser], [Price]) VALUES (0, N'bột giặt ô mô', N'100', N'gói', N'unilever', N'bình dương', N'dfsf', N'ffsf', 3)
USE [master]
GO
ALTER DATABASE [EBZ] SET  READ_WRITE 
GO
