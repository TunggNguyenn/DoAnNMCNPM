USE [master]
GO
/****** Object:  Database [MyShop]    Script Date: 18/12/2019 8:21:16 PM ******/
CREATE DATABASE [MyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MyShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop] SET QUERY_STORE = OFF
GO
USE [MyShop]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 18/12/2019 8:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BillCode] [ntext] NULL,
	[CustomerName] [ntext] NULL,
	[StaffID] [int] NULL,
	[GoodsID] [int] NULL,
	[Time] [datetime] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 18/12/2019 8:21:17 PM ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 18/12/2019 8:21:17 PM ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 18/12/2019 8:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsCode] [ntext] NULL,
	[GoodsName] [ntext] NULL,
	[Color] [int] NULL,
	[Brand] [int] NULL,
	[Size] [int] NULL,
	[Price] [float] NULL,
	[Type] [int] NULL,
	[Picture] [ntext] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 18/12/2019 8:21:17 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 18/12/2019 8:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StaffName] [ntext] NULL,
	[Age] [int] NULL,
	[Address] [ntext] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 18/12/2019 8:21:17 PM ******/
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
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (1, N'PRADA')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (2, N'DIOR')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (3, N'HERMÈS')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (4, N'BURBERRY')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (5, N'GUCCI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (6, N'VERSACE')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (7, N'ARMANI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (8, N'FENDI')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (9, N'Givenchy')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (10, N' Yves Saint Laurent')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (11, N'CHANEL')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (12, N'Hoang Phuc International')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (13, N'Elise')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (14, N'H&M')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (15, N'Mango
')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (16, N'Front Row Shop')
INSERT [dbo].[Brand] ([ID], [BrandName]) VALUES (17, N'Forever 21')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (1, N'Đỏ')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (2, N'Vàng')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (3, N'Cam')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (4, N'Đen')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (5, N'Nâu')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (6, N'Xám')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (7, N'Xanh Ngọc')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (8, N'Xanh Dương')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (9, N'Xanh Lá Cây')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (10, N'Trắng')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (11, N'Hồng')
INSERT [dbo].[Color] ([ID], [ColorName]) VALUES (12, N'Tím')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (48, N'AAA12345A', N'Áo khoác nam cách nhiệt GOKING (Màu đen)', 4, 5, 4, 193000, 1, N'/Images/ao-khoac-nam-1.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (49, N'AAA12345B', N'Áo Khoác Kaki Nam Hai Lớp Simple Cao Cấp ShopN6-KK35', 2, 1, 3, 198000, 1, N'/Images/ao-khoac-nam-2.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (50, N'AAA12345C', N'Áo Khoác Free Fire Hoodie Có Mũ Dài Tay', 10, 3, 5, 199000, 1, N'/Images/ao-khoac-nam-3.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (51, N'AAA12345D', N'Hoodie PlayerUnknown''s Battlegrounds', 4, 4, 1, 159000, 1, N'/Images/ao-khoac-nam-4.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (52, N'AAB11341A', N'Quần Tây Nam Vải Tuyết Mưa', 4, 7, 2, 135000, 2, N'/Images/quan-tay-1.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (53, N'AAB11341B', N'Quần Tây Âu Nam Titishop QTN64 - Đen', 4, 4, 3, 95000, 2, N'/Images/quan-tay-2.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (54, N'AAB11341C', N'Quần tây nam ống suông công sở', 4, 1, 4, 165000, 2, N'/Images/quan-tay-3.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (55, N'AAB11341D', N'Quần Tây Âu Màu Trơn Cho Nam', 4, 3, 2, 135000, 2, N'/Images/quan-tay-4.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (56, N'AAB12241A', N'Quần thể thao nữ tập gym yoga lưng cao', 4, 2, 5, 139000, 2, N'/Images/quan-the-thao-1.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (57, N'AAB12241B', N'Quần short thể thao nam Gymlink G505', 4, 4, 1, 89000, 2, N'/Images/quan-the-thao-2.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (58, N'AAB12241C', N'Quần Short thể thao nữ 2 lớp viền màu', 11, 6, 6, 69000, 2, N'/Images/quan-the-thao-3.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (59, N'AAB12241D', N'Quần short thể thao nữ Now Day QN99 Sportslink', 10, 5, 4, 98000, 2, N'/Images/quan-the-thao-4.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (60, N'BBB11451A', N'Quần jogger kaki túi hộp JG5', 4, 17, 5, 117000, 2, N'/Images/quan-jogger-1.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (61, N'BBB11451B', N'Quần Jogger Kaki Nam Dáng Thể Thao Chất Lượng Cao', 4, 16, 4, 82000, 2, N'/Images/quan-jogger-2.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (62, N'BBB11451C', N'Quần jogger kaki nam túi hộp New arrival 04', 4, 15, 1, 105000, 2, N'/Images/quan-jogger-3.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (63, N'BBB11451D', N'Quần Jogger Nam Nữ Chất Nỉ Cao Cấp', 4, 14, 2, 59000, 2, N'/Images/quan-jogger-4.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (64, N'CCA21411A', N'Chân Váy Tennis', 4, 13, 3, 59000, 2, N'/Images/vay-1.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (65, N'CCA21411B', N'Chân váy xòe 2 túi sành điệu - màu đen', 4, 12, 2, 69000, 2, N'/Images/vay-2.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (66, N'CCA21411C', N'Chân váy jeans chữ A', 4, 11, 1, 91000, 2, N'/Images/vay-3.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (67, N'CCA21411D', N'Chân Váy Xòe Ren Chân - Đen', 4, 10, 6, 54000, 2, N'pack://application:,,,/Images/vay-4.jpg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (68, N'DAD31124A', N'Đầm Hoa Xinh Dễ Thương Thời Trang Kiểu Hàn Quốc DN015 MayHomes', 2, 9, 5, 149000, 2, N'/Images/dam-1.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (69, N'DAD31124B', N'Đầm hồng form ngắn thắt eo', 11, 8, 3, 139000, 2, N'/Images/dam-2.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (70, N'DAD31124C', N'Đầm mila xanh form dài thắt eo', 8, 7, 1, 119000, 2, N'/Images/dam-3.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (71, N'DAD31124D', N'Đầm Tay Xếp Ly Kiểu Gumac MS09958', 8, 6, 2, 220000, 2, N'/Images/dam-4.png')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (72, N'AOA41123A', N'Áo len thêu hoa', 11, 2, 3, 150000, 1, N'/Images/aolen1.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (73, N'AOA41123B', N'Áo len trắng', 10, 3, 4, 159000, 1, N'/Images/aolen2.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (74, N'AOA41123C', N'Áo len đỏ', 11, 4, 5, 219000, 1, N'/Images/aolen3.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (75, N'AOA41123D', N'Áo len dài tay', 2, 5, 6, 319000, 1, N'/Images/aolen4.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (76, N'AOT42145A', N'Áo thun Raglan', 10, 17, 1, 150000, 1, N'/Images/aothun1.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (77, N'AOT42145B', N'Áo thun polo trắng', 10, 16, 4, 159000, 1, N'/Images/aothun2.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (78, N'AOT42145C', N'Áo thun xanh trơn', 7, 15, 3, 219000, 1, N'/Images/aothun3.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (79, N'AOT42145D', N'Áo thun vàng trơn', 2, 14, 5, 319000, 1, N'/Images/aothun4.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (80, N'ASN52215A', N'Áo sơ mi nữ', 10, 13, 6, 319000, 1, N'/Images/aosomi1.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (81, N'ASN52215B', N'Áo sơ mi nam', 10, 12, 1, 150000, 1, N'/Images/aosomi2.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (82, N'ASN52215C', N'Áo sơ mi cánh dơi', 8, 11, 4, 159000, 1, N'/Images/aosomi3.jpeg')
INSERT [dbo].[Goods] ([ID], [GoodsCode], [GoodsName], [Color], [Brand], [Size], [Price], [Type], [Picture]) VALUES (83, N'ASN52215D', N'Áo sơ mi tay dài thêu hoa', 10, 10, 5, 219000, 1, N'/Images/aosomi4.jpeg')
SET IDENTITY_INSERT [dbo].[Goods] OFF
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
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Bill] FOREIGN KEY([GoodsID])
REFERENCES [dbo].[Goods] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Bill]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Staff]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Brand] FOREIGN KEY([Brand])
REFERENCES [dbo].[Brand] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Brand]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Color] FOREIGN KEY([Color])
REFERENCES [dbo].[Color] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Color]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Size] FOREIGN KEY([Size])
REFERENCES [dbo].[Size] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Size]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Type]
GO
USE [master]
GO
ALTER DATABASE [MyShop] SET  READ_WRITE 
GO
