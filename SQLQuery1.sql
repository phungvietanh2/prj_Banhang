USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Project_He153701')
BEGIN
	ALTER DATABASE [Projectprj] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Projectprj] SET ONLINE;
	DROP DATABASE [Projectprj];
END
GO
CREATE DATABASE [Projectprj]
GO
USE [Projectprj]
GO
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(15) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Account(
	[accID] [int] IDENTITY(1,1) primary key NOT NULL,
	[email] [varchar](150) NOT NULL,
	[phone] [varchar](20) NULL,
	[fullname] [nvarchar](150) NULL,
	[username] [nvarchar](150) NULL,
	[password] [nvarchar](150) NULL,
	[isAdmin] [bit] NULL,
	[isCustomer] [bit] NULL
)
--INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES('','','','','','','','')

SET IDENTITY_INSERT [dbo].[Account] ON
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(3,'vhnam@gmail.com','0966302970','Vu Hoai Nam','vhnam','123123','1','0')
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(1,'lethanhtung@gmail.com','0966902941','Lê Thanh Tùng','tunglt','123','1','0')
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(2,'huongxinh@gmail.com','0966002947','Pham Xuan Huong','huong','123456','0','0')
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(4,'gaixinhdep@gmail.com','0966982999','Bui Thi Gai','gaibt','hehe@hehe','0','1')
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(5,'vhnam2209@gmail.com','0966909011','Nguyen Van Nam','namnv','123','0','1')
SET IDENTITY_INSERT [dbo].[Account] OFF

CREATE TABLE Information(
	[idNumber] int IDENTITY(1,1) primary key not null,
	[sex] varchar(10) not null,
	[dob] date not null,
	[address] [nvarchar](150) null,
	[img] varchar(50) null,
	[accID] int foreign key references Account([accID])
)
--INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES('','','','','','')
SET IDENTITY_INSERT [dbo].[Information] ON
INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES(1,'male','2001-12-30','Ninh Binh','','1')
INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES(2,'female','1998-12-12','Nam Dinh','','2')
INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES(3,'male','2005-12-18','Thai Binh','','3')
INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES(4,'female','1996-12-31','Ha Tay','','4')
INSERT [dbo].[Information]([idNumber],[sex],[dob],[address],[img],[accID]) VALUES(5,'male','2010-9-12','Ha Noi','','5')
SET IDENTITY_INSERT [dbo].[Information] OFF

CREATE TABLE Category(
	[categoryID] int IDENTITY(1,1) primary key NOT NULL,
	[title] nvarchar(150) NULL
)
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category]([categoryID],[title]) VALUES(1,'Iphone')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(2,'Ipad')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(3,'Macbook')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(4,'Apple Wach')
SET IDENTITY_INSERT [dbo].[Category] OFF

CREATE TABLE Brand(
	[brandID] int IDENTITY(1,1) primary key NOT NULL,
	[title] nvarchar(150) NULL,
	[categoryID] int foreign key references Category([categoryID])
)
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(1,'Apple','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(2,'Apple','2')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(3,'Apple','3')
SET IDENTITY_INSERT [dbo].[Brand] OFF

CREATE TABLE Product(
	[productID] int IDENTITY(1,1) primary key NOT NULL,
	[name] nvarchar(150) NULL,
	[description] nvarchar(150) NULL,
	[img] nvarchar(150) NULL,
	[size] nvarchar(10) NULL,
	[categoryID] int foreign key references Category([categoryID]) NULL,
	[brandID] int foreign key references Brand([brandID]) NULL,
	[quantity] int NULL,
	[price] float NULL,
	[sale] int NULL,
	 [Gb] VARCHAR(50),
	 [Color] VARCHAR(50)
)


SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price],[Gb],[Color])
VALUES(2,N'Điện thoại di động Apple iPhone 14 Pro Max - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','31.49','128','Space Black')
SET IDENTITY_INSERT [dbo].[Product] OFF

CREATE TABLE [Order](
	[id] [int] IDENTITY(1,1) primary key NOT NULL,
	[date] [date] NOT NULL,
	[accID] [int] foreign key references Account([accID]) not NULL ,
	[totalmoney] [money] NULL
)

CREATE TABLE OrderLine(
	[oid] [int] foreign key references [Order]([id]) not NULL,
	[productID] [int] foreign key references Product([productID]) NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	CONSTRAINT OL_id PRIMARY KEY ([oid], [productID])
)





