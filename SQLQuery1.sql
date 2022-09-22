USE [master]
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Project_He153701')
BEGIN
	ALTER DATABASE [Project_He153701] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Project_He153701] SET ONLINE;
	DROP DATABASE [Project_He153701];
END
GO
CREATE DATABASE [Project_He153701]
GO
USE [Project_He153701]
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
INSERT [dbo].[Category]([categoryID],[title]) VALUES(1,'Cues')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(2,'Ball Sets')
INSERT [dbo].[Category]([categoryID],[title]) VALUES(3,'Tables')
SET IDENTITY_INSERT [dbo].[Category] OFF

CREATE TABLE Brand(
	[brandID] int IDENTITY(1,1) primary key NOT NULL,
	[title] nvarchar(150) NULL,
	[categoryID] int foreign key references Category([categoryID])
)
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(1,'fury','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(2,'mit','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(3,'predator','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(4,'peri','1')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(5,'aramith','2')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(6,'diamond','3')
INSERT [dbo].[Brand]([BrandID],[title],[categoryID]) VALUES(7,'rasson','3')
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
	[sale] int NULL
)
SET IDENTITY_INSERT [dbo].[Product] ON
--INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES('','','','','','','','','','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(1,'Fury AG-201','New','AG-201.jpg','19','1','1','10','3000','20')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(2,'Fury CL-5','New','CL-5.jpg','19.5','1','1','10','5500','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(3,'Fury CW-1','New','CW-1.jpg','19','1','1','10','3500','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(4,'Fury ZF-2','New','ZF-2.jpg','19.5','1','1','10','4550','25')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(5,'Fury MS-6','New','MS-6.jpg','19','1','1','10','5200','')

INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(6,'Predator Ikon4 5','New','pre6.jpg','19.5','1','3','10','32500','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(7,'Predator 9K-3 Azurite','New','pre7.jpg','19','1','3','10','27000','20')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(8,'Predator Blak4 4','New','pre8.jpg','19.5','1','3','10','45000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(9,'Predator Air II Jump Cue With Sport','New','pre9.jpg','19','1','3','10','9000','30')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(10,'Predator Edition Roadline 12','New','pre10.jpg','19.5','1','3','10','13000','')

INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(11,'Peri VK-02','New','peri11.jpg','19','1','4','10','18100','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(12,'Peri V30-01','New','peri12.jpg','19.5','1','4','10','38100','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(13,'Peri Duke Dracula P-T01','New','peri13.jpg','19.5','1','4','10','125000','25')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(14,'Peri VS-02','New','peri14.jpg','19','1','4','10','9000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(15,'Peri P-S05','New','peri15.jpg','19.5','1','4','10','7000','')

INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(16,'Mit MC Limited','New','mit16.jpg','19','1','2','20','12650','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(17,'Mit MC1-010','New','mit17.jpg','19.5','1','2','20','12350','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(18,'Mit MO83-08','New','mit18.jpg','19','1','2','20','14050','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(19,'Mit MH21-03','New','mit19.jpg','19.5','1','2','20','7840','30')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(20,'Mit MY22-3','New','mit20.jpg','19','1','2','20','7425','')

INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(25,'ARAMITH TOURNAMENT BLACK','New','ball21.jpg','16','2','5','20','15000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(22,'ARAMITH TOURNAMENT PRO-CUP TV','New','ball22.jpg','16','2','5','20','8000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(23,'ARAMITH SUPER PRO','New','ball23.jpg','16','2','5','20','10000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(24,'ARAMITH AMERICAN','New','ball24.jpg','22','2','5','20','12500','35')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(21,'ARAMITH SUPER ARAMITH TOURNAMENT','New','ball25.jpg','3','2','5','20','4500','')

INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(26,'RASSON OX 9FT','New','table26.png','9','3','7','25','170000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(30,'RASSON VICTORY II 9FT','New','table27.png','9','3','7','15','200000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(28,'DIAMOND PRO-AM 7FT CHARCOAL','New','table28.png','7','3','6','20','85000','20')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(29,'DIAMOND PRO-AM 9FT CHARCOAL','New','table29.png','9','3','6','18','110000','')
INSERT [dbo].[Product]([productID],[name],[description],[img],[size],[categoryID],[brandID],[quantity],[price],[sale]) VALUES(27,'DIAMOND PRO-AM 7FT ROSEWOOD','New','table30.png','7','3','6','15','90000','')
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





