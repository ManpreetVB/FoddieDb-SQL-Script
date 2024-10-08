USE [master]
GO
/****** Object:  Database [FoodieDB]    Script Date: 9/30/2024 9:41:40 PM ******/
CREATE DATABASE [FoodieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodieDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodieDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FoodieDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodieDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FoodieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodieDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FoodieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodieDB] SET  MULTI_USER 
GO
ALTER DATABASE [FoodieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodieDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodieDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodieDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodieDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodieDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodieDB]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[TotalPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[ImageUrl] [varchar](1000) NULL,
	[CreatedOn] [datetime] NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Subject] [varchar](100) NULL,
	[Message] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[TotalPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Status] [varchar](100) NULL,
	[PaymentId] [int] NULL,
	[OrderDate] [datetime] NULL,
	[OrderTotal] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
	[OrderNumber] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[CardName] [varchar](100) NULL,
	[CvvNumber] [int] NULL,
	[PaymentMode] [varchar](100) NULL,
	[ExpiryDate] [datetime] NULL,
	[CardNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Description] [varchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](1000) NULL,
	[CategoryId] [int] NULL,
	[IsActive] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[PostCode] [int] NULL,
	[PhoneNumber] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[IsActive] [int] NULL,
	[Type] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartId], [ProductId], [Quantity], [UserId], [Price], [TotalPrice]) VALUES (9, 1, 3, 9, CAST(14.00 AS Decimal(10, 2)), CAST(42.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (1, N'Burger', N'', CAST(N'2024-05-13T13:37:52.020' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (2, N'Pizza Slice', N'', CAST(N'2024-05-13T13:39:52.097' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (3, N'Desserts', N'', CAST(N'2024-05-13T13:39:56.947' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (4, N'Hot drinks', N'', CAST(N'2024-05-13T13:40:02.870' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (5, N'Frozen drinks', N'', CAST(N'2024-05-13T13:40:09.290' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (6, N'Frenchfries', N'', CAST(N'2024-05-13T13:40:14.547' AS DateTime), 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [ImageUrl], [CreatedOn], [IsActive]) VALUES (7, N'VeggieBurger', N'https://bk-apac-prd.s3.amazonaws.com/sites/burgerking.co.nz/files/BK_Salad-Burger-Detail.png', CAST(N'2024-09-09T12:29:18.947' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (1, 5, 10, 2, CAST(2.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (2, 6, 1, 1, CAST(14.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (3, 9, 9, 3, CAST(8.00 AS Decimal(10, 2)), CAST(24.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (4, 11, 10, 2, CAST(2.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (5, 26, 1, 3, CAST(14.00 AS Decimal(10, 2)), CAST(42.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (6, 27, 7, 1, CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (7, 27, 3, 4, CAST(8.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderItems] ([OrderItemId], [OrderId], [ProductId], [Quantity], [Price], [TotalPrice]) VALUES (8, 28, 8, 1, CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (1, NULL, N'Pending', NULL, CAST(N'2024-09-06T16:10:43.807' AS DateTime), NULL, NULL, N'65E0DA0D-0DA5-40D9-AA66-C27F9967E761')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (2, 2, N'Pending', NULL, CAST(N'2024-09-13T14:54:47.620' AS DateTime), NULL, NULL, N'89B1995D-0842-49A6-A262-CD36B63C9E51')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (3, 3, N'Pending', NULL, CAST(N'2024-09-14T12:15:46.810' AS DateTime), NULL, NULL, N'2B0F1A2D-2610-4AE9-9D8D-22A9020B48DB')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (4, 5, N'Pending', NULL, CAST(N'2024-09-14T12:42:09.883' AS DateTime), NULL, NULL, N'65B730A0-0A08-416E-B9F2-0A696C43F881')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (5, 1, N'Pending', NULL, CAST(N'2024-09-14T14:11:40.130' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'380FB888-0965-4972-A96F-1EB1BB159F45')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (6, 5, N'Pending', NULL, CAST(N'2024-09-14T16:01:30.083' AS DateTime), CAST(14.00 AS Decimal(10, 2)), NULL, N'691B7F72-23D3-4317-BA64-6E9388B7FEA2')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (7, 5, N'Pending', NULL, CAST(N'2024-09-14T18:09:44.057' AS DateTime), NULL, NULL, N'AAD3A43B-FDD8-4917-881E-E59908F34E56')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (8, 11, N'Pending', 1, CAST(N'2024-09-18T20:39:55.180' AS DateTime), NULL, NULL, N'AA6A7255-D31C-493A-B25C-60C3B1060099')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (9, 9, N'Pending', NULL, CAST(N'2024-09-18T20:58:12.733' AS DateTime), CAST(24.00 AS Decimal(10, 2)), NULL, N'BA165CCC-B0BA-444F-AEEA-A2A7052FB6CA')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (10, 6, N'Pending', NULL, CAST(N'2024-09-18T21:31:50.957' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'4ACF1075-713C-48EB-AE9B-6093358C912E')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (11, 8, N'Pending', 1, CAST(N'2024-09-18T21:46:26.160' AS DateTime), CAST(4.00 AS Decimal(10, 2)), NULL, N'BA30F6F4-1B74-4B3E-A404-DDA4457BE959')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (12, 9, N'Pending', 1, CAST(N'2024-09-19T20:31:46.870' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'7AF5FCE2-C1B3-4F75-A719-2C5CA6DDE1F2')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (13, 9, N'Pending', 1, CAST(N'2024-09-19T20:44:17.100' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'960204D4-F84F-47EB-B28D-32F61AC57B6E')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (14, 6, N'Pending', 1, CAST(N'2024-09-19T20:51:47.793' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'6A916833-F36D-4374-B64D-D8C2DD713A31')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (15, 8, N'Pending', 1, CAST(N'2024-09-19T21:34:57.490' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'EF4E0CA2-D826-4DF5-BBB4-5F44A5809130')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (16, 3, N'Pending', 1, CAST(N'2024-09-19T21:42:06.300' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'54CDD9D6-CAFB-4D26-BA1C-4C1D2682B864')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (17, 12, N'Pending', 1, CAST(N'2024-09-22T20:49:49.553' AS DateTime), CAST(0.00 AS Decimal(10, 2)), NULL, N'14CA041E-F28F-4A24-BCD1-9232F6A2E818')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (18, 1, N'Pending', 1, CAST(N'2024-09-22T21:02:57.230' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'7EC11486-6419-4632-A75E-69325172A90E')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (19, 8, N'Pending', 1, CAST(N'2024-09-23T21:15:00.700' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'6C2E5B63-51D7-4BA2-AFEF-4E17EEC9BA16')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (20, 8, N'Pending', 1, CAST(N'2024-09-23T21:26:07.767' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'1CFB2459-585C-4378-B996-E6B1E01E710E')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (21, 1, N'Pending', 1, CAST(N'2024-09-23T21:36:30.707' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'AA41D54A-0DEE-4616-86D1-5BE10F37915F')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (22, 11, N'Pending', 1, CAST(N'2024-09-23T21:52:45.240' AS DateTime), NULL, NULL, N'50DE3DE1-1BB2-4F43-9585-059A29A8477C')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (23, 11, N'Pending', 1, CAST(N'2024-09-23T21:59:02.557' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'B01F06F7-CA9C-4D41-AD0A-7529D4B96B52')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (24, 1, N'Pending', 1, CAST(N'2024-09-23T22:11:13.893' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'1968DA47-A7B1-494A-A7A6-2B74C04A2A55')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (25, 3, N'Pending', 1, CAST(N'2024-09-24T19:35:37.290' AS DateTime), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), N'8356A64F-DAAA-4A3E-9C88-809A78A9D4EE')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (26, 1, N'Pending', 1, CAST(N'2024-09-24T20:15:21.070' AS DateTime), CAST(42.00 AS Decimal(10, 2)), CAST(14.00 AS Decimal(10, 2)), N'4E70600C-DF18-4774-8C9C-5620032304B3')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (27, 5, N'Pending', 1, CAST(N'2024-09-30T21:20:56.360' AS DateTime), CAST(20.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), N'9F451B83-C38E-4473-800E-CCD22A07DB45')
INSERT [dbo].[Orders] ([OrderId], [UserId], [Status], [PaymentId], [OrderDate], [OrderTotal], [Price], [OrderNumber]) VALUES (28, 5, N'Pending', 1, CAST(N'2024-09-30T21:24:30.240' AS DateTime), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), N'F68DA73B-3AFE-4AEF-8106-A8C216E7A064')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [CardName], [CvvNumber], [PaymentMode], [ExpiryDate], [CardNumber]) VALUES (1, N'string', 123, N'cash', CAST(N'2024-05-13T03:12:57.690' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (1, N'RabelChook Burger', N'A plant based veggie patty burger', CAST(14.00 AS Decimal(10, 2)), 1, N'https://images.thespinoff.co.nz/1/2020/10/REBELCHOOK-1.jpeg?w=640', 7, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (2, N'RabelChook Burger', N'A plant based veggie patty burger', CAST(13.00 AS Decimal(10, 2)), 1, N'', 7, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (3, N'Salad Burger', N'Veggie Burger with onion rings', CAST(8.00 AS Decimal(10, 2)), 1, N'https://bk-apac-prd.s3.amazonaws.com/sites/burgerking.co.nz/files/BK_Salad-Burger-Detail.png', 7, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (4, N'Hash Bites', N'Crispy potatos ', CAST(8.00 AS Decimal(10, 2)), 1, N'""', 6, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (5, N'Hash Bites', N'Crispy potatos balls', CAST(4.00 AS Decimal(10, 2)), 4, N'""', 6, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (6, N'Hash Bites', N'Crispy potatos ', CAST(7.00 AS Decimal(10, 2)), 4, N'""', 6, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (7, N'Hash Bites', N'Crispy potatos balls', CAST(4.00 AS Decimal(10, 2)), 6, N'""', 6, 0)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (8, N'Hash Browns', N'Crispy potatos balls', CAST(4.00 AS Decimal(10, 2)), 2, N'""', 6, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (9, N'Hashtag Burger', N'burger with crispy fries and cheese', CAST(8.00 AS Decimal(10, 2)), 2, N'', 7, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (10, N'Pizza slice ', N'periperi cheese pizza slice', CAST(2.00 AS Decimal(10, 2)), 2, N'''''''''', 2, 1)
INSERT [dbo].[Products] ([ProductId], [ProductName], [Description], [Price], [Quantity], [ImageUrl], [CategoryId], [IsActive]) VALUES (11, N'Pizza slice ', N'periperi cheese pizza slice', CAST(2.00 AS Decimal(10, 2)), 2, N'''''''''', 2, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (1, N'TestUser10', N'mytest@gmail.com', N'employee10', N'66Manakura Street Russley', 8042, 642264226, CAST(N'2024-05-10T02:11:29.753' AS DateTime), 1, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (2, N'Admin', N'admin@gmail.com', N'manager', N'67Manakura Street Russley', 8042, 44664455, CAST(N'2024-05-10T02:47:06.307' AS DateTime), 1, N'Admin')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (3, N'David', N'biggdavid@gmail.com', N'onform', N'65b Hallswell', 8044, 18180022, CAST(N'2024-05-10T02:50:16.567' AS DateTime), 1, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (4, N'user', N'newuser@gmail.com', N'useradmin', N'88 hallswell', 8067, 45456664, CAST(N'2024-08-31T22:36:01.400' AS DateTime), 0, N'user')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (5, N'Singh', N'brar@gmail.com', N'brar', N'67 manakura street', 8042, 22034455, CAST(N'2024-08-31T23:02:32.280' AS DateTime), 1, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (6, N'madi', N'odering@gmail.com', N'madison', N'papanui', 8804, 2106421, CAST(N'2024-09-01T06:26:14.847' AS DateTime), 1, N'user')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (7, N'manpreet', N'kaur@gmail.com', N'brar1234', N'67 manakura street', 8042, 220689030, CAST(N'2024-09-01T06:46:01.230' AS DateTime), 0, N'string')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (8, N'manpreet', N'kaursandhu@gmail.com', N'brar27', N'newzealand', 8042, 6464646, CAST(N'2024-09-01T07:05:41.490' AS DateTime), 1, N'user')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (9, N'Mahasingh', N'maha@gmail.com', N'brarnz', N'christchurch', 8040, 54545, CAST(N'2024-09-01T00:00:00.000' AS DateTime), 1, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (10, N'newuser', N'user@gmail.com', N'newnew', N' Canterbury,NewZealand', 8082, 22644622, CAST(N'2024-09-01T23:12:06.813' AS DateTime), 0, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (11, N'Harnidh Kaur', N'nidhu@gmail.com', N'athwal', N'Australia', 2901, 41416164, CAST(N'2024-09-02T12:18:58.680' AS DateTime), 1, N'User')
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [Password], [Address], [PostCode], [PhoneNumber], [CreatedOn], [IsActive], [Type]) VALUES (12, N'Andrew', N'Andrew@gmail.com', N'1234', N'87 Christchurch ,NZ', 8000, 987654321, CAST(N'2024-09-09T20:16:17.400' AS DateTime), 1, N'#')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Payment1] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Payment1]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCategory]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddCategory](@Name VARCHAR(100),@ImageUrl VARCHAR(1000), @IsActive INT,
    @Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Categories WHERE Name = @Name)
    BEGIN
        INSERT INTO Categories (Name, ImageUrl, CreatedOn, IsActive)
        VALUES (@Name, @ImageUrl, GETDATE(), @IsActive);
        
        SET @Output_Message = 'Category added successfully';
    END
    ELSE
    BEGIN
        SET @Output_Message = 'Category already exists';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToCart]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddToCart]
(
    @CartId INT = NULL,
    @ProductId INT = NULL,
    @Email VARCHAR(100) = NULL,
    @Quantity INT = NULL, 
    @Price DECIMAL(10,2) = NULL,
    @TotalPrice DECIMAL(10,2) = NULL,
    @Output_Message VARCHAR(100) OUTPUT
)
AS
BEGIN
    -- Initialize the output message
    SET @Output_Message = '';

    -- Check if ProductId exists in the Products table
    IF NOT EXISTS (SELECT 1 FROM Products WHERE ProductId = @ProductId)
    BEGIN
        SET @Output_Message = 'Invalid ProductId. The product does not exist.';
        RETURN;
    END

    -- Check if UserId exists for the given Email
    DECLARE @UserId INT;
    SELECT @UserId = UserId
    FROM Users
    WHERE Email = @Email;

    IF @UserId IS NULL
    BEGIN
        SET @Output_Message = 'Invalid Email. User does not exist.';
        RETURN;
    END

    -- Get the price of the product
    SELECT @Price = Price
    FROM Products
    WHERE ProductId = @ProductId;

    -- Calculate total price
    SET @TotalPrice = @Price * @Quantity;

    -- Check if the item already exists in the cart
    IF NOT EXISTS (SELECT 1 FROM Carts WHERE UserId = @UserId AND ProductId = @ProductId)
    BEGIN
        -- Insert new item into the cart
        INSERT INTO Carts (UserId, ProductId, Quantity, Price, TotalPrice)
        VALUES (@UserId, @ProductId, @Quantity, @Price, @TotalPrice);

        SET @Output_Message = 'Item has been added to cart';
    END
    ELSE
    BEGIN
        -- Update the quantity of the existing item
        UPDATE Carts
        SET Quantity = Quantity + @Quantity, TotalPrice = Price * Quantity
        WHERE UserId = @UserId AND ProductId = @ProductId;

        SET @Output_Message = 'Item quantity updated in cart';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUpdateProduct]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddUpdateProduct](@ProductId INT=NULL,@ProductName VARCHAR(100)=NULL,@Description VARCHAR(100)=NULL,@Price DECIMAL(10,2)=NULL,
@Quantity INT=NULL,@ImageUrl VARCHAR(100)=NULL,@CategoryId INT=NULL,@IsActive INT=NULL,
@ActionType VARCHAR(100)=NULL,@Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN
  IF @ActionType='ADD'
     BEGIN
      INSERT INTO Products(ProductName,Description,Price,Quantity,ImageUrl,CategoryId,IsActive)
      VALUES(@ProductName,@Description,@Price,@Quantity,@ImageUrl,@CategoryId,@IsActive);
	    SET @Output_Message='Product added successfully'
	
	 END
  ELSE
      BEGIN
	     SET @Output_Message='Product not added'
	  END



IF @ActionType = 'UPDATE'
	BEGIN
		UPDATE Products SET ProductName=@ProductName,Description=@Description,Price=@Price,Quantity=@Quantity,ImageUrl=@ImageUrl,CategoryId=@CategoryId		
		WHERE ProductId = @ProductId;
		SET @Output_Message='Product updated successfully'
	END
	ELSE
	BEGIN
	     SET @Output_Message='Product not updated'
	  END



IF @ActionType = 'Delete'
	BEGIN
		UPDATE Products SET IsActive = 0 WHERE ProductId = @ProductId;
		SET @Output_Message='Item deleted successfully'
	END

	ELSE
	BEGIN
	     SET @Output_Message='Item could not found for delete'
	  END



IF @ActionType = 'Get'
	BEGIN
		SELECT * FROM Products WHERE IsActive= 1;
		SET @Output_Message='Product fetched successfully'
	END
     
	 ELSE
	BEGIN
	     SET @Output_Message='Product is not found'
	  END



IF @ActionType = 'GetByID'
	BEGIN
		SELECT * FROM Products WHERE ProductId = @ProductId;
		SET @Output_Message='Product details fetched'
	END
	 ELSE
	BEGIN
	     SET @Output_Message='Product details are not found '
	  END

END

GO
/****** Object:  StoredProcedure [dbo].[sp_CartList]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CartList](@Email VARCHAR(100))
AS
BEGIN
    IF @Email != 'Admin'
	BEGIN
		SELECT C.CartId,  C.Quantity, C.TotalPrice,P.Price FROM Carts C 
		INNER JOIN Products P ON P.ProductId = C.CartId
		INNER JOIN Users U ON U.UserId = C.UserId
		WHERE U.Email =  @Email;
	END
	ELSE
	BEGIN
		SELECT P.ProductId,  P.Price,  P.Quantity,  0 AS TotalPrice FROM Products P;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteUser]( @UserId INT,@Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN
  IF EXISTS (SELECT 1 FROM Users WHERE UserId = @UserId)
  BEGIN
    UPDATE Users
    SET IsActive = 0
    WHERE UserId = @UserId;
    
    SET @Output_Message = 'User deleted successfully';
  END
  ELSE
  BEGIN
    SET @Output_Message = 'User not found';
  END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Login](@Email VARCHAR(100), @Password VARCHAR(100)) 
AS
BEGIN
	
	SELECT * FROM Users WHERE Email = @Email AND Password = @Password AND IsActive=1;
	
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderList]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_OrderList](@UserId INT,
@Email VARCHAR(100), @Type VARCHAR(100)='User',@OrderId INT = NULL,@Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN

 IF @Type = 'Admin'
    BEGIN
        SELECT O.OrderId, OrderNumber, OrderTotal, Status, PaymentId,
               CONVERT(NVARCHAR, O.OrderDate, 107) AS OrderDate,
               CONCAT(U.UserName, ' ') AS CustomerName
        FROM Orders O
        INNER JOIN Users U ON U.UserId = O.UserId;
        
        SET @Output_Message = 'Order details fetched for Admin';
    END
    -- Checking if the user is a 'User'
    ELSE IF @Type = 'User'
    BEGIN
        SELECT O.OrderId, OrderNumber, OrderTotal, Status, PaymentId,
               CONVERT(NVARCHAR, O.OrderDate, 107) AS OrderDate,
               CONCAT(U.UserName, ' ') AS CustomerName
        FROM Orders O
        INNER JOIN Users U ON U.UserId = O.UserId
        WHERE U.Email = @Email;
        
        SET @Output_Message = 'Order details fetched for User';
    END
    -- Checking if it's for 'UserItem'
    ELSE IF @Type = 'UserItem'
    BEGIN
        SELECT O.OrderId, O.OrderNumber, O.OrderTotal, O.Status, 
	
               P.ProductName, P.Description,  P.CategoryId ,P.Price , P.ImageUrl, 
               OI.Quantity, OI.TotalPrice, O.OrderDate AS CreatedOn,
			   CONCAT(U.UserName, ' ') AS CustomerName  -- Join to get CustomerName
			    
        FROM OrderItems OI
        INNER JOIN Orders O ON O.OrderId = OI.OrderId
        INNER JOIN Products P ON OI.ProductId = P.ProductId
        INNER JOIN Users U ON U.UserId = O.UserId  -- Add this join to get CustomerName
           WHERE O.OrderId = @OrderId -- Use the correct condition to filter by OrderId
      AND O.UserId = @UserId;
        
        SET @Output_Message = 'Order item details fetched';
    END
    
    ELSE
    BEGIN
        SET @Output_Message = 'Invalid Type Provided';
    END
END


GO
/****** Object:  StoredProcedure [dbo].[sp_Payment]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Payment](@PaymentId INT=NULL,@CardName VARCHAR(100)=NULL,@CvvNumber INT=NULL,
@PaymentMode VARCHAR(100)=NULL,@ExpiryDate DATETIME=NULL,@CardNumber INT=NULL,@Output_Message VARCHAR(100) OUTPUT)

AS
 BEGIN
 IF @PaymentMode='CreditCard'
   BEGIN
    INSERT INTO Payment(CardName,CvvNumber,PaymentMode,ExpiryDate,CardNumber)
    VALUES(@CardName,@CvvNumber,@PaymentMode,@ExpiryDate,@CardNumber);
	SET @Output_Message='Payment processed successfully '
	END
	ELSE
	BEGIN 
	SET @Output_Message='Payment declined '
	END

	IF @PaymentMode='Cash'
	BEGIN
	UPDATE Payment SET PaymentMode=@PaymentMode WHERE PaymentId=@PaymentId;
	SET @Output_Message='Payment processed successfully '
	END
	ELSE
	BEGIN 
	SET @Output_Message='Payment declined '
	END
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_PlaceOrder]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_PlaceOrder](@Email  VARCHAR(100))
   AS
   BEGIN
   DECLARE @OrderId INT;
    DECLARE @OrderNumber VARCHAR(100);
    DECLARE @OrderTotal DECIMAL(10, 2);
    DECLARE @UserId INT;
    DECLARE @PaymentId INT = 1; -- Modify based on actual payment logic
    DECLARE @Price DECIMAL(10, 2) = NULL;

    -- Generate a unique order number
    SET @OrderNumber = CONVERT(VARCHAR(100), NEWID());

    -- Get the UserId from the Users table using the provided email
    SET @UserId = (SELECT UserId FROM Users WHERE Email = @Email);

   

    IF OBJECT_ID('tempdb..#TempOrder') IS NOT NULL DROP TABLE #TempOrder;
    SELECT * INTO #TempOrder FROM Carts 
    WHERE UserId = @UserId;

    
    SET @OrderTotal = ISNULL((SELECT SUM(TotalPrice) FROM #TempOrder), 0);
    SET @Price = ISNULL((SELECT SUM(Price) FROM #TempOrder), 0); -- Sum of item prices


   
    INSERT INTO Orders(UserId, OrderNumber, OrderTotal, Status, PaymentId, OrderDate, Price)
    VALUES(@UserId, @OrderNumber, @OrderTotal, 'Pending', @PaymentId, GETDATE(), @Price);

    
   SET @OrderID = (SELECT OrderId FROM Orders WHERE OrderNumber = @OrderNumber);

    -- Insert order items into the OrderItems table
    INSERT INTO OrderItems(OrderId, ProductId, Price, Quantity, TotalPrice)
    SELECT @OrderId, ProductId, Price, Quantity, ISNULL(TotalPrice, 0) FROM #TempOrder;

    -- Delete items from the cart after placing the order
    DELETE FROM Carts WHERE UserId = @UserId;
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_Registration]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Registration](@UserName VARCHAR(100),@Email VARCHAR(100),@Password VARCHAR(100),@Address VARCHAR(100),@PostCode INT,
@PhoneNumber INT,@Type VARCHAR(100),@Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN
      IF NOT EXISTS (SELECT 1 FROM Users WHERE  Email=@Email AND IsActive=1)
	BEGIN
		INSERT INTO Users(UserName,Email,Password,Address,PostCode,PhoneNumber,CreatedOn,IsActive,Type)
		VALUES(@UserName,@Email,@Password,@Address,@PostCode,@PhoneNumber,GETDATE(),1,@Type);
		SET @Output_Message = 'User registered successfully';
	END
	ELSE
	BEGIN
		SET @Output_Message = 'User registration failed';
	END
	END

GO
/****** Object:  StoredProcedure [dbo].[sp_RemoveToCart]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_RemoveToCart](@CartId INT, @Email VARCHAR(100),@Output_Message VARCHAR(100) OUTPUT)    
AS    
BEGIN    
  DECLARE @UserID INT; 
  SELECT @UserId = UserId
    FROM Users
    WHERE Email = @Email;

   IF @UserId IS NULL
    BEGIN
        SET @Output_Message = 'Invalid Email. User does not exist.';
        RETURN;
    END

    -- Check if the item exists in the cart for the given UserId and CartId
    IF EXISTS (SELECT 1 FROM Carts WHERE UserId = @UserId AND CartId = @CartId)
    BEGIN
        -- Remove the item from the cart
        DELETE FROM Carts
        WHERE UserId = @UserId AND CartId = @CartId;

        SET @Output_Message = 'Item has been removed from cart';
    END
    ELSE
    BEGIN
        SET @Output_Message = 'Item does not exist in the cart';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateOrderStatus]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateOrderStatus](@OrderNumber VARCHAR(100) = NULL, @Status VARCHAR(100) = NULL,@Output_Message VARCHAR(100) OUTPUT)
AS
BEGIN
  IF EXISTS(SELECT  1 FROM Orders WHERE Status=@Status )
  BEGIN
	UPDATE Orders SET Status = @Status WHERE OrderNumber = @OrderNumber;
	SET @Output_Message='Order status updated successfully'
	  END 
	  ELSE
	  BEGIN
	  SET @Output_Message='Order status could not be updated'
	  END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUserProfile]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateUserProfile](@UserId INT,@UserName VARCHAR(100),@Email VARCHAR(100),@Password VARCHAR(100),@Address VARCHAR(100),@PostCode INT,
@PhoneNumber INT,@IsActive INT,@Type VARCHAR(100),@Output_Message VARCHAR(100) OUTPUT)
AS
 BEGIN
  IF  EXISTS (SELECT 1 FROM Users WHERE UserId=@UserId AND IsActive=1)
   BEGIN
   UPDATE Users SET UserName=@UserName,Email=@Email,Password=@Password,Address=@Address,PostCode=@PostCode,PhoneNumber=@PhoneNumber,
   Type=@Type
   
   WHERE UserId=@UserId AND IsActive=1;
    SET @Output_Message='User profile updated successfully';
	        END

	   ELSE
	       BEGIN
           SET @Output_Message='Please try again later';
	      END
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserList]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserList](@Output_Message VARCHAR(100) OUTPUT)
AS 
BEGIN
IF  EXISTS (SELECT 1 FROM Users WHERE IsActive=1)
	 BEGIN
	   SELECT*FROM Users WHERE IsActive=1;
	   SET @Output_Message='Users details fetched'
	 END

	 ELSE
	 BEGIN
	   SET @Output_Message='Users details are not found'
	 END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UserProfile]    Script Date: 9/30/2024 9:41:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UserProfile](@Email VARCHAR(100),@Output_Message VARCHAR(100) OUTPUT)
	AS
	BEGIN
	   IF EXISTS (SELECT 1 FROM Users WHERE Email=@Email AND IsActive=1)
	    BEGIN
		  SELECT * FROM Users WHERE Email=@Email AND IsActive=1;
		  SET @Output_Message = 'User Available';
		 END

		 ELSE
		   BEGIN
		   SET @Output_Message = 'User NOT Available';
		   END
    END
GO
USE [master]
GO
ALTER DATABASE [FoodieDB] SET  READ_WRITE 
GO
