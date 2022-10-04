USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PROJEC_TPRJ301')
BEGIN
	ALTER DATABASE PROJEC_TPRJ301 SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE PROJEC_TPRJ301 SET ONLINE;
	DROP DATABASE [PROJEC_TPRJ301];
END
GO
CREATE DATABASE [PROJEC_TPRJ301]
GO
USE [PROJEC_TPRJ301]
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
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(1,'admin@gmail.com','0392917937','Phung Viet Anh','admin','123','1','0')
INSERT [dbo].[Account]([accID],[email],[phone],[fullname],[username],[password],[isAdmin],[isCustomer]) VALUES(2,'lethanhtung@gmail.com','0966902941','Lê Thanh Tùng','anh','123','0','1')
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
SET IDENTITY_INSERT [dbo].[Information] OFF

CREATE TABLE Category(
	[categoryID] int IDENTITY(1,1) primary key NOT NULL,
	[title] nvarchar(150) NULL
)
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category]([categoryID],[title]) VALUES(1,N'ĐIỆN THOẠI')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(2,N'TABLET')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(3,N'LAPTOP')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(4,N'ĐỒNG HỒ')
SET IDENTITY_INSERT [dbo].[Category] OFF

CREATE TABLE Brand(
	[brandID] int IDENTITY(1,1) primary key NOT NULL,
	[title] nvarchar(150) NULL,
	[categoryID] int foreign key references Category([categoryID])
)
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(1,'Apple','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(2,'Samsung','2')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(3,'Xiaomi','3')
SET IDENTITY_INSERT [dbo].[Brand] OFF

CREATE TABLE Product(
	[productID] int IDENTITY(1,1) primary key NOT NULL,
	[name] nvarchar(150) NULL,
	[description] nvarchar(150) NULL,
	[img] nvarchar(150) NULL,
	[categoryID] int foreign key references Category([categoryID]) NULL,
	[brandID] int foreign key references Brand([brandID]) NULL,
	[quantity] int NULL,
	[price] float NULL,
	[sale] int NULL
)


SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(1,N'Điện thoại di động Apple iPhone 14 Pro Max - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','31.49')
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(2,N'Điện thoại di động Apple iPhone 13 Pro Max - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','29.49')
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(3,N'Điện thoại di động Apple iPhone 12 Pro Max - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','24.99')
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(4,N'Điện thoại di động Apple iPhone 13  - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','27.99')
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(5,N'Điện thoại di động Apple iPhone 12  - Chính hãng VN/A',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','1','20','22.99')
INSERT [dbo].[Product]([productID],[name],[description],[img],[categoryID],[brandID],[quantity],[price])
VALUES(6,N'Samsung Galaxy A73 5G - Chính hãng',
N'iPhone 14 Pro Max VN/A là dòng sản phẩm cao cấp nhất nằm trong thế hệ iPhone mới vừa được ra mắt cùng với nhiều nâng cấp về ngoại hình và tính năng',
'14promax.png','1','2','20','10.99')

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





