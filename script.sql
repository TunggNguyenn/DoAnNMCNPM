USE [master]
GO
/****** Object:  Database [MyShop_SQLServer]    Script Date: 9/01/2020 5:12:51 PM ******/
CREATE DATABASE [MyShop_SQLServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop_SQLServer', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyShop_SQLServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_SQLServer_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyShop_SQLServer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyShop_SQLServer] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop_SQLServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop_SQLServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyShop_SQLServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop_SQLServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop_SQLServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyShop_SQLServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop_SQLServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop_SQLServer] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop_SQLServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop_SQLServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop_SQLServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop_SQLServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop_SQLServer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop_SQLServer] SET QUERY_STORE = OFF
GO
USE [MyShop_SQLServer]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillCode] [ntext] NULL,
	[CustomerName] [ntext] NULL,
	[ID_Staff] [int] NULL,
	[ID_Goods] [int] NULL,
	[DateTime] [datetime] NULL,
	[Total] [float] NULL,
	[VAT] [float] NULL,
	[CustomerAddress] [ntext] NULL,
	[CustomerPhoneNumber] [ntext] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [ntext] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [ntext] NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Electric] [float] NULL,
	[Water] [float] NULL,
	[Rent_Premises] [float] NULL,
	[DateTime] [datetime] NULL,
	[SalaryStaff] [float] NULL,
	[Goods] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsCode] [ntext] NULL,
	[GoodsName] [ntext] NULL,
	[ID_Color] [int] NULL,
	[ID_Brand] [int] NULL,
	[ID_Size] [int] NULL,
	[Price] [float] NULL,
	[ID_Type] [int] NULL,
	[Number] [int] NULL,
	[Picture] [ntext] NULL,
	[Import_Date] [datetime] NULL,
	[ID_Sale] [int] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisionRelationship]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisionRelationship](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[ID_Permission] [int] NOT NULL,
	[Suspended] [bit] NULL,
 CONSTRAINT [PK_PermisionRelationship] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NamePermission] [ntext] NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Permision] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PercentageSale] [int] NULL,
	[Donate] [ntext] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [ntext] NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [ntext] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/01/2020 5:12:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameUser] [ntext] NOT NULL,
	[UserName] [ntext] NOT NULL,
	[PassWord] [ntext] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (16, N'0', N'Nguyễn Thanh Tùng', 1, 19, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (17, N'0', N'Nguyễn Thanh Tùng', 1, 20, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (18, N'0', N'Nguyễn Thanh Tùng', 1, 25, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (19, N'0', N'Nguyễn Thanh Tùng', 1, 3, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (20, N'0', N'Nguyễn Thanh Tùng', 1, 28, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (21, N'0', N'Nguyễn Thanh Tùng', 1, 32, CAST(N'2019-09-12T00:00:00.000' AS DateTime), 35800000, 10, N'Quan 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (22, N'1', N'Mr. Tùng', 1, 23, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (23, N'1', N'Mr. Tùng', 1, 25, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (24, N'1', N'Mr. Tùng', 1, 32, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (25, N'1', N'Mr. Tùng', 1, 35, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (26, N'1', N'Mr. Tùng', 1, 2, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (27, N'1', N'Mr. Tùng', 1, 4, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (28, N'1', N'Mr. Tùng', 1, 1, CAST(N'2019-10-12T00:00:00.000' AS DateTime), 42380000, 10, N'Quận 10', N'0942034705')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (29, N'2', N'Tùng', 2, 11, CAST(N'2020-01-05T00:00:00.000' AS DateTime), 387750, 10, N'Quận 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (30, N'2', N'Tùng', 2, 11, CAST(N'2020-01-05T00:00:00.000' AS DateTime), 387750, 10, N'Quận 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (31, N'2', N'Tùng', 2, 10, CAST(N'2020-01-05T00:00:00.000' AS DateTime), 387750, 10, N'Quận 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (32, N'2', N'Tùng', 2, 10, CAST(N'2020-01-05T00:00:00.000' AS DateTime), 387750, 10, N'Quận 10', N'0868042318')
INSERT [dbo].[Bill] ([ID], [BillCode], [CustomerName], [ID_Staff], [ID_Goods], [DateTime], [Total], [VAT], [CustomerAddress], [CustomerPhoneNumber]) VALUES (33, N'2', N'Tùng', 2, 9, CAST(N'2020-01-05T00:00:00.000' AS DateTime), 387750, 10, N'Quận 10', N'0868042318')
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1, N'PRADA')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (2, N'DIOR')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (3, N'HERMÈS')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (4, N'BURBERRY')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (5, N'GUCCI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (6, N'VERSACE')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (7, N'ARMANI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (8, N'FENDI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (9, N'Hoang Phuc International')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (10, N'ELISE')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (11, N'H&M')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (12, N'CHANEL')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (13, N'FOREVER 21')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (14, N'MANGO')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (15, N'GIVENCHY')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (1, N'Red')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (2, N'Yellow')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (3, N'Orange')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (4, N'Black')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (5, N'Gray')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (6, N'Brown')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (7, N'Green')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (8, N'Blue')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (9, N'White')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (10, N'Pink')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (11, N'Purple')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (12, N'Violet')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (13, N'Jade')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (14, N'Crimson')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (15, N'Indigo')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Expenses] ON 

INSERT [dbo].[Expenses] ([ID], [Electric], [Water], [Rent_Premises], [DateTime], [SalaryStaff], [Goods], [Total]) VALUES (1, 400000, 350000, 8000000, CAST(N'2019-09-04T00:00:00.000' AS DateTime), 10000000, 8500000, 27250000)
INSERT [dbo].[Expenses] ([ID], [Electric], [Water], [Rent_Premises], [DateTime], [SalaryStaff], [Goods], [Total]) VALUES (2, 380000, 350000, 8000000, CAST(N'2019-10-04T00:00:00.000' AS DateTime), 10000000, 8500000, 27230000)
SET IDENTITY_INSERT [dbo].[Expenses] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (1, N'AAA12345A', N'Áo khoác nam cách nhiệt GOKING', 4, 5, 4, 193000, 1, 29, N'/Images/ao-khoac-nam-1.png', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (2, N'AAA12345B', N'Áo Khoác Kaki Nam', 2, 1, 3, 199000, 1, 40, N'/Images/ao-khoac-nam-2.png', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (3, N'AAA12345Q', N'Áo Khoác Free Fire Hoodie Có Mũ Dài Tay', 10, 3, 5, 199000, 1, 34, N'/Images/ao-khoac-nam-3.png', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (4, N'AAA12345D', N'Hoodie Player Battlegrounds', 4, 4, 1, 159000, 1, 31, N'/Images/ao-khoac-nam-4.png', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (5, N'AAB11341A', N'Quần Tây Nam Vải Tuyết Mưa', 4, 7, 2, 135000, 2, 45, N'/Images/quan-tay-1.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (6, N'AAB11341B', N'Quần Tây Âu Nam Titishop QTN64 - Đen', 4, 4, 3, 95000, 2, 50, N'/Images/quan-tay-2.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (7, N'AAB11341C', N'Quần tây nam ống suông công sở', 4, 1, 4, 165000, 2, 40, N'/Images/quan-tay-3.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (8, N'AAB11341D', N'Quần Tây Âu Màu Trơn Cho Nam', 4, 3, 2, 135000, 2, 45, N'/Images/quan-tay-4.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (9, N'AAB12241A', N'Quần thể thao nữ tập gym yoga lưng cao', 4, 2, 5, 139000, 2, 41, N'/Images/quan-the-thao-1.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (10, N'AAB12241B', N'Quần short thể thao nam Gymlink G505', 4, 4, 1, 89000, 2, 41, N'/Images/quan-the-thao-2.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (11, N'AAB12241C', N'Quần Short thể thao nữ 2 lớp viền màu', 11, 6, 6, 69000, 2, 32, N'/Images/quan-the-thao-3.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (12, N'AAB12241D', N'Quần short thể thao nữ Now Day', 10, 5, 4, 98000, 2, 32, N'/Images/quan-the-thao-4.jpg', CAST(N'2019-09-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (15, N'BBB11451C', N'Quần jogger kaki nam túi hộp New arrival 04', 4, 15, 1, 105000, 2, 32, N'/Images/quan-jogger-3.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (16, N'BBB11451D', N'Quần Jogger Nam Nữ Chất Nỉ Cao Cấp', 4, 14, 2, 59000, 2, 34, N'/Images/quan-jogger-4.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (17, N'CCA21411A', N'Chân Váy Tennis', 4, 13, 3, 59000, 2, 38, N'/Images/vay-1.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (18, N'CCA21411B', N'Chân váy xòe 2 túi sành điệu - màu đen', 4, 12, 2, 69000, 2, 39, N'/Images/vay-2.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (19, N'CCA21411C', N'Chân váy jeans chữ A', 4, 11, 1, 91000, 2, 39, N'/Images/vay-3.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (20, N'CCA21411D', N'Chân Váy Xòe Ren Chân - Đen', 4, 10, 6, 54000, 2, 46, N'/Images/vay-4.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (21, N'DAD31124A', N'Đầm Hoa Xinh Dễ Thương Thời Trang Kiểu Hàn Quốc DN015 MayHomes', 2, 9, 5, 149000, 2, 38, N'/Images/dam-1.png', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (22, N'DAD31124B', N'Đầm hồng form ngắn thắt eo', 10, 8, 3, 139000, 2, 30, N'/Images/dam-2.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (23, N'DAD31124C', N'Đầm mila xanh form dài thắt eo', 8, 7, 1, 119000, 2, 31, N'/Images/dam-3.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (24, N'DAD31124D', N'Đầm Tay Xếp Ly Kiểu Gumac MS09958', 8, 6, 2, 220000, 2, 30, N'/Images/dam-4.jpg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (25, N'AOA41123A', N'Áo len thêu hoa', 11, 2, 3, 150000, 1, 35, N'/Images/aolen1.jpeg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (26, N'AOA41123B', N'Áo len trắng', 10, 3, 4, 159000, 1, 35, N'/Images/aolen2.jpeg', CAST(N'2019-10-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (27, N'AOA41123C', N'Áo len đỏ', 11, 4, 5, 219000, 1, 12, N'/Images/aolen3.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (28, N'AOA41123D', N'Áo len dài tay', 2, 5, 6, 319000, 1, 24, N'/Images/aolen4.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (31, N'AOT42145C', N'Áo thun xanh trơn', 7, 15, 3, 219000, 1, 24, N'/Images/aothun3.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (32, N'AOT42145D', N'Áo thun vàng trơn', 2, 14, 5, 319000, 1, 28, N'/Images/aothun4.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (33, N'ASN52215A', N'Áo sơ mi nữ', 10, 13, 6, 319000, 1, 31, N'/Images/aosomi1.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (34, N'ASN52215B', N'Áo sơ mi nam', 10, 12, 1, 150000, 1, 30, N'/Images/aosomi2.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (35, N'ASN52215C', N'Áo sơ mi cánh dơi', 8, 11, 4, 159000, 1, 25, N'/Images/aosomi3.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [ID_Color], [ID_Brand], [ID_Size], [Price], [ID_Type], [Number], [Picture], [Import_Date], [ID_Sale]) VALUES (36, N'ASN52215D', N'Áo sơ mi tay dài thêu hoa', 10, 10, 5, 219000, 1, 30, N'/Images/aosomi4.jpeg', CAST(N'2019-11-05T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[PermisionRelationship] ON 

INSERT [dbo].[PermisionRelationship] ([ID], [ID_User], [ID_Permission], [Suspended]) VALUES (1, 1, 1, 0)
INSERT [dbo].[PermisionRelationship] ([ID], [ID_User], [ID_Permission], [Suspended]) VALUES (2, 2, 2, 0)
SET IDENTITY_INSERT [dbo].[PermisionRelationship] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([ID], [NamePermission], [Description]) VALUES (1, N'Quản lý', N'Nhóm có quyền cao nhất')
INSERT [dbo].[Permission] ([ID], [NamePermission], [Description]) VALUES (2, N'Nhân viên', N'Nhóm chỉ có quyền thao tác nhập xuất hàng hóa, tư vấn và  tính tiền bán hàng.')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (1, 0, N'Không')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (2, 0, N'Nón')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (3, 5, N'Không')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (4, 5, N'Nón')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (5, 10, N'Không')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (6, 20, N'Không')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (7, 20, N'Nón')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (8, 30, N'Nón')
INSERT [dbo].[Sale] ([ID], [PercentageSale], [Donate]) VALUES (9, 50, N'Không')
SET IDENTITY_INSERT [dbo].[Sale] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (1, N'S')
INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (2, N'M')
INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (3, N'L')
INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (4, N'XL')
INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (5, N'XXL')
INSERT [dbo].[Size] ([ID], [SizeName]) VALUES (6, N'XXXL')
SET IDENTITY_INSERT [dbo].[Size] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([ID], [TypeName]) VALUES (1, N'Áo')
INSERT [dbo].[Type] ([ID], [TypeName]) VALUES (2, N'Quần')
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [NameUser], [UserName], [PassWord]) VALUES (1, N'LIMUPA', N'admin', N'admin')
INSERT [dbo].[User] ([ID], [NameUser], [UserName], [PassWord]) VALUES (2, N'USER', N'user', N'user')
INSERT [dbo].[User] ([ID], [NameUser], [UserName], [PassWord]) VALUES (3, N'EMPLOYEE', N'employee', N'employee')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Goods] FOREIGN KEY([ID_Goods])
REFERENCES [dbo].[Goods] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Goods]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_User] FOREIGN KEY([ID_Staff])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_User]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Brand] FOREIGN KEY([ID_Brand])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Brand]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Color] FOREIGN KEY([ID_Color])
REFERENCES [dbo].[Color] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Color]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Sale] FOREIGN KEY([ID_Sale])
REFERENCES [dbo].[Sale] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Sale]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Size] FOREIGN KEY([ID_Size])
REFERENCES [dbo].[Size] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Size]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Type] FOREIGN KEY([ID_Type])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Type]
GO
ALTER TABLE [dbo].[PermisionRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PermisionRelationship_Permission] FOREIGN KEY([ID_Permission])
REFERENCES [dbo].[Permission] ([ID])
GO
ALTER TABLE [dbo].[PermisionRelationship] CHECK CONSTRAINT [FK_PermisionRelationship_Permission]
GO
ALTER TABLE [dbo].[PermisionRelationship]  WITH CHECK ADD  CONSTRAINT [FK_PermisionRelationship_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[PermisionRelationship] CHECK CONSTRAINT [FK_PermisionRelationship_User]
GO
USE [master]
GO
ALTER DATABASE [MyShop_SQLServer] SET  READ_WRITE 
GO
