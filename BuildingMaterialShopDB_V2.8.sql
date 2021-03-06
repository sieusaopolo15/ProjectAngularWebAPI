USE [master]
GO
/****** Object:  Database [BuildingMaterialsShop]    Script Date: 17/05/2021 3:07:54 CH ******/
CREATE DATABASE [BuildingMaterialsShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BuildingMaterialsShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BuildingMaterialsShop.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BuildingMaterialsShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BuildingMaterialsShop_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BuildingMaterialsShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuildingMaterialsShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuildingMaterialsShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BuildingMaterialsShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuildingMaterialsShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuildingMaterialsShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BuildingMaterialsShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuildingMaterialsShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BuildingMaterialsShop] SET  MULTI_USER 
GO
ALTER DATABASE [BuildingMaterialsShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuildingMaterialsShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuildingMaterialsShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuildingMaterialsShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BuildingMaterialsShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BuildingMaterialsShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/05/2021 3:07:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [nvarchar](20) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckDetails]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckDetails](
	[Quantity] [int] NULL,
	[ActualQuantity] [int] NULL,
	[Reason] [nvarchar](2000) NULL,
	[ProductId] [nvarchar](20) NOT NULL,
	[CheckId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checks]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checks](
	[CheckId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Status] [bit] NULL,
	[EmployeeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[PassWord] [nvarchar](200) NULL,
	[Gender] [bit] NULL,
	[BirthDay] [date] NULL,
	[isBlocked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[PassWord] [nvarchar](200) NULL,
	[Gender] [bit] NULL,
	[BirthDay] [date] NULL,
	[RoleId] [nvarchar](20) NULL,
	[isBlocked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportDetails]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportDetails](
	[Quantity] [int] NULL,
	[Unit] [nvarchar](100) NULL,
	[ImportId] [int] NOT NULL,
	[ProductId] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imports]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imports](
	[ImportId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[EmployeeId] [int] NULL,
	[SupplierId] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Quantity] [int] NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Amount] [money] NULL,
	[CustomerId] [int] NULL,
	[Address] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Date] [datetime] NULL,
	[StatusId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [nvarchar](20) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Unit] [nvarchar](100) NULL,
	[Images] [text] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CategoryId] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokenCustomer]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokenCustomer](
	[tokenId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[token] [varchar](200) NOT NULL,
	[expiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_RefreshTokenCustomer] PRIMARY KEY CLUSTERED 
(
	[tokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokenEmployee]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokenEmployee](
	[tokenId] [int] IDENTITY(1,1) NOT NULL,
	[employeeId] [int] NOT NULL,
	[token] [varchar](200) NOT NULL,
	[expiryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [nvarchar](20) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [nvarchar](20) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplies]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplies](
	[SupplierId] [nvarchar](20) NOT NULL,
	[ProductId] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouse]    Script Date: 17/05/2021 3:08:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Date] [datetime] NULL,
	[ProductId] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'BCAU', N'Bồn cầu')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'CAT', N'cát')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'DAS', N'đá,sỏi')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'GAM', N'Gạch men')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'GDN', N'Gạch đất nung')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'HXM', N'xi măng - hỗn hợp trộn')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'TEP', N'thép- sắt')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'TON', N'tôn xây dựng')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (N'XAG', N'xà gồ tổng hợp')
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (1, N'Mạnh Thường Quân', N'quanmanh@gmail.com', N'số 123 An Dương Vương 1234', N'0963425123', N'25f9e794323b453885f5181f1b624d0b', 0, CAST(N'1999-10-11' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (2, N'Tiêu Hồng Vân', N'tieuvan@gmail.com', N'5A Trần Hưng Đạo', N'0965748293', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-10-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (3, N'Huỳnh Tuấn Đạt', N'anhdao@gmail.com', N'177 Cao Xuân Dục P11 Q8', N'0902777586', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-05-04' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (4, N'Võ Yến Phượng', N'phuongvo@gmail.com', N'148 Nam Ky Khoi Nghia Street, Ben Nghe Ward, District 1', N'0965342512', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-10-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (5, N'Phạm Diễm Thảo', N'thaopham@gmail.com', N'437/2/4 Hoang Van Thu St., HCM', N'0966558265', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-11-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (6, N'Nguyễn Khánh Phi', N'phinguyen@gmail.com', N'1405 DL Nguyen Van Linh, District 7', N'0965765293', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-10-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (7, N'Dương Nam Lộc', N'locduong@gmail.com', N'126 Nguyen Hue, Ward Phu Nhuan.', N'0996011513', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1998-12-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (8, N'Trịnh Hoàng Lâm', N'lamtrinh@gmail.com', N'16 - 18 Tran Phu Street, Pleiku City', N'0969601151', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1996-11-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (9, N'Đàm Bảo Khánh', N'khanhdam@gmail.com', N'38/6D Ly Thanh Tong Street, Hiep Tan Ward, Tan Phu District', N'0965748293', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-10-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (10, N'Trần Hữu Phước', N'phuongtran@gmail.com', N'123 Le Loi, Kontum Town', N'098636503', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1997-12-10' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (14, N'aaa', N'chien22229@gmail.com', N'aaaa', N'0926272829', N'e182307dc516887c417164cfd22e832f', 1, CAST(N'2001-03-21' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (15, N'HuỳnhĐạt', N'sieusaopolo15@gmail.com', N'4170  Hartway Street', N'0902777586', N'550e1bafe077ff0b0b67f4e32f29d751', 1, CAST(N'2021-03-29' AS Date), 0)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (16, N'Huỳnh TuấnĐạt', N'abc@gmail.com', N'267/16 Tùng Thiện Vương', N'0902777586', N'25d55ad283aa400af464c76d713c07ad', 0, CAST(N'1999-05-05' AS Date), 1)
INSERT [dbo].[Customers] ([CustomerId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [isBlocked]) VALUES (21, N'Huỳnh Tuấn Đạt A', N'huynhtuandat.dt@gmail.com', N'267/16 Tùng Thiện Vương', N'0902777586', N'e0dc0a999491aeb7c912035661c9218e', 1, CAST(N'1999-05-05' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (1, N'Huỳnh Minh Chiến', N'chien17099@gmail.com', N'Quận 9 TPHCM', N'0926216051', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'2021-05-05' AS Date), N'NVBH', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (2, N'Phạm Đình Khoa', N'khoapham@gmail.com', N'Quận Gò Vấp TPHCM', N'0926254635', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-01-02' AS Date), N'NVKHO', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (3, N'Huỳnh Tuấn Đạt', N'dathuynh@gmail.com', N'Quận 2 TPHCM', N'0975346542', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'1999-05-04' AS Date), N'NVBH', 1)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (4, N'Nguyễn Đình Khương', N'khuong@gmail.com', N'Quận 1 TPHCM', N'0978675643', N'25d55ad283aa400af464c76d713c07ad', 0, CAST(N'1999-02-11' AS Date), N'ADMIN', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (5, N'Bùi Hồng Kho', N'khohang@gmail.com', N'22/11 An phú Quận 5 TPHCM', N'0988274821', N'25d55ad283aa400af464c76d713c07ad', 1, CAST(N'2000-05-04' AS Date), N'NVKHO', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (6, N'Cao Xuân Hàng', N'banhang@gmail.com', N'789 An phú Quận 2 TPHCM', N'02994827382', N'25d55ad283aa400af464c76d713c07ad', 0, CAST(N'2001-05-04' AS Date), N'NVBH', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (7, N'Hàng A', N'bsssnhang@gmail.com', N'322 An phú Quận 1 TPHCM', N'0988787876', N'25d55ad283aa400af464c76d713c07ad', 0, CAST(N'2001-05-04' AS Date), N'NVBH', 0)
INSERT [dbo].[Employees] ([EmployeeId], [FullName], [Email], [Address], [PhoneNumber], [PassWord], [Gender], [BirthDay], [RoleId], [isBlocked]) VALUES (11, N'Nguyễn Thị A', N'nguyenthia@gmail.com', N'ABC Quận 8 Phường 11', N'0902777586', N'25d55ad283aa400af464c76d713c07ad', 0, CAST(N'1998-01-01' AS Date), N'NVBH', 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 37, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 37, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 38, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 38, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 39, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 39, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (15, 40, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (6, 40, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (1, 40, N'CATDM')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (5, 41, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (2, 41, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (20, 42, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (5, 43, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (7, 44, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (12, 45, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (8, 45, N'CATBT2')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (1, 45, N'CATDM')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (7, 46, N'CATBT1')
INSERT [dbo].[OrderDetails] ([Quantity], [OrderId], [ProductId]) VALUES (1, 46, N'CATBT2')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (37, CAST(N'2021-04-09T05:59:00.150' AS DateTime), 900000.0000, 1, N'273 an duong vyong')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (38, CAST(N'2021-04-09T05:59:00.150' AS DateTime), 900000.0000, 1, N'273 an duong vyong')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (39, CAST(N'2021-04-09T05:59:00.150' AS DateTime), 900000.0000, 1, N'273 an duong vyong')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (40, CAST(N'2021-04-20T01:26:54.850' AS DateTime), 4260000.0000, 1, N'số 1 An Dương Vương')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (41, CAST(N'2021-04-26T11:23:02.593' AS DateTime), 1360000.0000, 1, N'số 1 An Dương Vương')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (42, CAST(N'2021-05-05T01:35:17.607' AS DateTime), 3600000.0000, 1, N'số 123 An Dương Vương 1234')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (43, CAST(N'2021-05-05T02:54:20.613' AS DateTime), 900000.0000, 1, N'số 123 An Dương Vương 1234')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (44, CAST(N'2021-05-10T08:52:44.410' AS DateTime), 1260000.0000, 1, N'số 123 An Dương Vương 1234')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (45, CAST(N'2021-05-11T14:16:06.567' AS DateTime), 4180000.0000, 1, N'số 123 An Dương Vương 1234')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [Amount], [CustomerId], [Address]) VALUES (46, CAST(N'2021-05-12T00:58:51.903' AS DateTime), 1490000.0000, 1, N'số 123 An Dương Vương 1234')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:10:18.083' AS DateTime), 1, 39)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-04T00:07:06.163' AS DateTime), 1, 41)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-05T01:45:58.930' AS DateTime), 1, 42)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-05T02:56:34.977' AS DateTime), 1, 43)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-10T15:53:00.410' AS DateTime), 1, 44)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:02:11.713' AS DateTime), 2, 37)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:04:44.127' AS DateTime), 2, 38)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-20T01:26:58.197' AS DateTime), 2, 40)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-11T14:16:13.233' AS DateTime), 2, 45)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-12T00:58:58.827' AS DateTime), 2, 46)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:03:01.547' AS DateTime), 3, 37)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:07:25.233' AS DateTime), 3, 38)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-04T00:03:35.527' AS DateTime), 3, 40)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-04-17T14:09:24.107' AS DateTime), 4, 37)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-05T03:05:46.763' AS DateTime), 4, 38)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-12T01:05:23.407' AS DateTime), 4, 40)
INSERT [dbo].[OrderStatus] ([Date], [StatusId], [OrderId]) VALUES (CAST(N'2021-05-05T01:48:45.733' AS DateTime), 4, 41)
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATBT1', N'Cát bê tông sàng', 180000.0000, N'm3', N'1WYxwilKp5iEa65Nv4_Wad-E1LuWE7xPO', N'Cát bê tông là loại cát xây dựng được sử dụng nhiều cho các công trình xây dựng. Cát có độ lớn từ 1.5 mm trở lên. Cát bê tông có độ sạch tuơng đối, còn lẫn tạp chất. Chỉ cần dùng mắt thường phân biệt theo tiêu chí trên là được.', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATBT2', N'Cát bê tông rửa', 230000.0000, N'm3', N'1p5WbpTkjC8GbwRYKuLinyM4NGJ6vA6JC', N'Cát bê tông là loại cát xây dựng được sử dụng nhiều
 cho các công trình xây dựng. Cát có độ lớn từ 1.5 mm trở lên.
 Cát bê tông có độ sạch tuyệt đối, không lẫn tạp chất,
 đạt chuẩn để kết cấu kê tông luôn đảm bảo. Chỉ cần
 dùng mắt thường phân biệt theo tiêu chí trên là được.', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATDM', N'Cát Đe Mi', 180000.0000, N'm3', N'17N2e6E2RljR7YnQtymy3LUjIlOSQ1sKS', N'Đây là cát vàng nhưng là cát demi', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATSL', N'Cát san lấp', 140000.0000, N'm3', N'1DywjZbumr1ghL55M2mT5bSp85PCb8gN0', N'Đây cũng là cát đen nhưng kích thước hạt của chúng không giống
 nhau, cát này thường có màu xám và rất thường xuyên tạp chất
 nên chất lượng không bằng hai loại kể trên. Nó thường được sử 
dụng để lấp nền. Tuy nhiên, chi phí lấp cát khá rẻ, rẻ hơn nhiều so
 với cát vàng và cát xây tô.', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATV', N'Cát vàng xây dựng', 240000.0000, N'm3', N'1zrnJh49wfYHeJPDn9axJEN42vSyrSsSj', N'Đây là cát vàng nhưng kích thước hạt của chúng không giống
 nhau.', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'CATXT', N'Cát xây tô', 170000.0000, N'm3', N'1L-bj9LjNq9svDsCFsJUzFdEQzq0_KZVh', N'Cát xây tô còn được gọi là cát tô. Các hạt cát có màu tối, tương tự
 như màu đen. Không giống như cát vàng, cát này có các hạt nhỏ 
và khá mịn không có tạp chất, rẻ hơn so với cát vàng, vì vậy nó
 được sử dụng rộng rãi trong việc xây dựng biệt thự, tòa nhà hoặc
 công trình dân dụng', 1, N'CAT')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DAS0x4', N'ĐÁ 0x4 xây dựng', 220000.0000, N'm3', N'19-pBEEYQk5B0bC0OL5s1AxHi0PZ6vFeH', N'có kích cỡ từ 0 mm đến 40mm, được sàng tách ra từ sản phẩm đá
 khác. Loại đá này dùng làm chân đế gạch bông, gạch lót sàn, phụ gia
 cho công nghệ bê tông đúc ống cống và thi công các công trình giao
 thông và phụ gia cho các loại VLXD khác .v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DAS1x2D', N'ĐÁ 1x2 xây dựng đen', 270000.0000, N'm3', N'1xdyuukq1F58kS3ZFgpz1-fbF-XOoz3bA', N'là loại đá có kích cỡ 10 x 28mm ( hoặc nhiều loại kích cỡ khác như: 
10 x 25 mm còn gọi là đá 1×2 bê tông; 10 x 22 mm còn gọi là đá 1×2
 quy cách ( đá 1×1 ), 10 x 16 mm,… tuy theo nhu cầu sử dụng của khách
 hàng). Sản phẩm dùng để đổ bê tông làm nhà cao tầng, đường băng
 sân bay, cầu cảng, đường quốc lộ, đặc biệt sử dụng phổ biến tại các 
nhà máy bê tông tươi hoặc bê tông nhựa nóng, v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DAS1x2X', N'ĐÁ 1x2 xây dựng xanh', 395000.0000, N'm3', N'1ata5_SLX3SjrSv7VUyT1qlUlbOkvV484', N'là loại đá có kích cỡ 10 x 28mm ( hoặc nhiều loại kích cỡ khác như: 
10 x 25 mm còn gọi là đá 1×2 bê tông; 10 x 22 mm còn gọi là đá 1×2
 quy cách ( đá 1×1 ), 10 x 16 mm,… tuy theo nhu cầu sử dụng của khách
 hàng). Sản phẩm dùng để đổ bê tông làm nhà cao tầng, đường băng
 sân bay, cầu cảng, đường quốc lộ, đặc biệt sử dụng phổ biến tại các 
nhà máy bê tông tươi hoặc bê tông nhựa nóng, v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DAS4x6', N'ĐÁ 4x6 xây dựng', 270000.0000, N'm3', N'19oXh75CNuqF5OCst0fhlRpIEThS4PJ_1', N'có kích cỡ từ 40 mm đến 60mm, được sàng tách ra từ sản phẩm đá
 khác. Loại đá này dùng làm chân đế gạch bông, gạch lót sàn, phụ gia
 cho công nghệ bê tông đúc ống cống và thi công các công trình giao
 thông và phụ gia cho các loại VLXD khác .v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DAS5x7', N'ĐÁ 5x7 xây dựng', 270000.0000, N'm3', N'1qp6K1PO1RnONFcASWwMaIkcCGf4t4OUX', N'có kích cỡ từ 50 mm đến 70mm, được sàng tách ra từ sản phẩm đá
 khác. Loại đá này dùng làm chân đế gạch bông, gạch lót sàn, phụ gia
 cho công nghệ bê tông đúc ống cống và thi công các công trình giao
 thông và phụ gia cho các loại VLXD khác .v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DASMB', N'Đá mi bụi', 225000.0000, N'm3', N'1I4pd3kKz8aOmXE5SfcKuzLscYJJv8ObL', N'Là mạt đá, có kích cỡ từ 0 đến 5mm, được sàng tách ra từ sản
 phẩm đá khác. Loại đá này dùng làm chân đế gạch bông, gạch lót
 sàn, phụ gia cho công nghệ bê tông đúc ống cống và thi công các 
công trình giao thông và phụ gia cho các loại VLXD khác .v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DASMS', N'Đá mi sàn', 250000.0000, N'm3', N'177NJRco-nOMz7yB3HdTG4HXupsrkVegZ', N'Có kích cỡ từ 5mm đến 10mm, được sàng tách ra từ sản phẩm đá
 khác. Loại đá này dùng làm chân đế gạch bông, gạch lót sàn, phụ 
gia cho công nghệ bê tông đúc ống cống và thi công các công trình
 giao thông và phụ gia cho các loại VLXD khác .v.v…', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DASST', N'Sỏi trắng', 60000.0000, N'bao(16kg)', N'1LRyLt9TJOJEwCiAWFK3qtAASynhA-pjl', N'Sỏi trang trí sân vườn bao gồm những loại đá sỏi có màu trắng có sẵn trong
 tự nhiên, được sử dụng phổ biến để trang trí lối đi sân vườn và cho những
 chậu cây cảnh. Đối với một tiểu cảnh nho nhỏ hoặc một chậu cây để bàn, 
việc rải sỏi lên bề mặt không chỉ giúp che lấp đi phần đất màu bên dưới mà
 còn làm giúp trang trí cho cảnh quan, làm không gian trở nên sạch sẽ, xanh
 mát và sáng sủa hơn, tránh được việc bụi đất bay lung tung.', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'DASSTN', N'Sỏi màu tự nhiên tổng hợp', 12000.0000, N'kg', N'1_KqWRLPDyIjwp_wcOfUHW0UTthmFIr4-', N'Tất cả những viên đá, sỏi, đá cuội tự nhiên sẽ được xử lý đánh bóng đẹp.', 1, N'DAS')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMCTL5050DT', N'CATALAN 50X50 đen trắng', 134000.0000, N'thùng( 4 viên = 1m2)', N'1amMshzcWlEOS0owAtIKyPh7YvOdZDhP2', N'Gạch CATALAN 50X50 đen trắng thuộc dòng gạch Ceramic Lát Nền của
 Công Ty Catalan. Là đơn vị hàng đầu trong lĩnh vực sản xuất vật liệu xây
 dựng tại Việt Nam, gạch Catalan luôn có những mẫu mã mới và sáng tạo
 trên thị trường, cùng với sự tập trung và trách nhiệm cao với chất lượng,
 độ bền của từng sản phẩm được đưa ra.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMCTL5050XC', N'CATALAN 50X50 xanh cỏ', 134000.0000, N'thùng( 4 viên = 1m2)', N'1okgW14HBPYkMWaJZG_gXduU2nDDTi5Tb', N'Gạch CATALAN 50X50 xanh cỏ thuộc dòng gạch Ceramic Lát Nền của
 Công Ty Catalan. Là đơn vị hàng đầu trong lĩnh vực sản xuất vật liệu xây
 dựng tại Việt Nam, gạch Catalan luôn có những mẫu mã mới và sáng tạo
 trên thị trường, cùng với sự tập trung và trách nhiệm cao với chất lượng,
 độ bền của từng sản phẩm được đưa ra.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMPL8080X', N'gạch 80x80 PLATIUM màu xám', 624000.0000, N'thùng(3 viên)', N'1cM650kShc6t1555bY6-9aZR-Sr_-CD12', N'Là thuộc dòng sản phẩm gạch của Công ty Gạch Đồng Tâm, là đơn vị hàng
 đầu trong lĩnh vực sản xuất vật liệu xây dựng tại Việt Nam cả về năng lực
 sản xuất, loại hình, mẫu mã và chất lượng sản phẩm đáp ứng được nhiều
 phân khúc thị trường từ bình dân đến cao cấp.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMTT3030CX', N'Gạch TTC 30x30 màu xám', 155000.0000, N'thùng( 11 viên =~ 1m2)', N'1lMYM898QmTN8Sc4BKPagUO0KU5fQ8A-H', N'Gạch TTC 30×30 Xsm là một sản phẩm của công ty gạch TTC Việt Nam, với
 hơn 18 năm hoạt động trong thị trường Việt Nam. Hãng luôn đứng đầu trong
 việc sáng tạo và phát triển các dòng gạch mới, với mẫu mã đẹp, màu sắc đa
 dạng, và giá cả hợp lí phù hợp với thị trường Việt Nam.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMVL3030D', N'Gạch Viglacera 30×30 màu đen', 95000.0000, N'thùng( 11 viên =~ 1m2)', N'1mf-Pypb59Cl_or8_tUjL3DsNi1amS0ze', N'Gạch Viglacera 30×30 ĐEN thuộc dòng gạch Ceramic của Công Ty Viglacera.
 Là đơn vị hàng đầu trong lĩnh vực sản xuất vật liệu xây dựng tại Việt Nam,
 Viglacera luôn chú tâm nghiên cứu những xu hướng, tạo nên phong cách,
 giá trị riêng.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GAMVL3030SUGAR', N'Gạch Viglacera 30×30 SUGAR', 96000.0000, N'thùng( 11 viên =~ 1m2)', N'18gYWtD_ictKBhoi2W5FvfaVWeF4G6h-Y', N'Gạch Viglacera 30×30 SUGAR thuộc dòng gạch Ceramic của Công Ty Viglacera.
 Là đơn vị hàng đầu trong lĩnh vực sản xuất vật liệu xây dựng tại Việt Nam,
 Viglacera luôn chú tâm nghiên cứu những xu hướng, tạo nên phong cách,
 giá trị riêng.', 1, N'GAM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GDN4pt', N'Gạch ống phước thành (4 lỗ)', 1000.0000, N'viên', N'1K0eWHlyzGg1o2AXy19vBiH-kLun8xk4h', N'Gạch Tuynel Phước Thành được sản xuất với nguyên liệu là đất sét được ngâm ủ
 kỹ theo đúng thời gian quy định. Sau đó được đưa vào công đoạn sơ chế, bao 
gồm: Tiếp liệu – tách đá – nghiền khô – nghiền tinh. Gạch tuynel có độ hút ẩm
 thấp, cường độ chịu lực cao, chất lượng tốt và mẫu mã đẹp đem lại vẻ đẹp sang
 trọng và chất lượng cho các công trình.
Tên: Gạch 4 lỗ 8 x 18 Phước Thành
Trọng lượng: 1.2 kg/viên
Kích thước: 80 x 80 x180 mm', 1, N'GDN')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GDN4tq', N'Gạch ống phước thành (4 lỗ)', 1000.0000, N'viên', N'1LhwacxBBLsAeJ1xHHVfoED5zCFrEV5ug', N'Với nguồn nguyên liệu đất sét chất lượng cao, được ngâm ủ kỹ trong vòng
 3 – 6 tháng, qua hệ thống đùn nén và lò nung kỹ thuật cao, gạch tuynel Bình
 Dương có hình dáng, màu sắc đẹp và khả năng chịu lực cao & khả năng thấm
 nước thấp. Gạch tuynel Bình Dương thõa TCVN 1450:1998 và TCN 1451:1998.', 1, N'GDN')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GDNB100x190x390', N'Gạch block 100x190x390', 5500.0000, N'viên', N'1EZX7cxwtQhDfFNZjdOO5WZeXijw17zG6', N'gạch đúng với thông số với chất lượng được kiểm chứng đúng tiêu chuẩn', 1, N'GDN')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'GDNB6L', N'Block 6 lỗ lớn', 2100.0000, N'viên', N'1eDLfuFdXqCDVQB8B_yfqUNu8iW8hx9W_', N'Gạch Bê tông (hay còn gọi là gạch block) là hỗn hợp của xi măng PCB30, đá dăm, cát
 vàng, nước vừa đủ, được tạo hình rung, ép trên dây chuyền công nghệ tiên tiến của
 nước ngoài, tạo thành khối sít đặc có cường độ cao.', 1, N'GDN')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'HXMHATIEN', N'Si măng Hà Tiên', 87500.0000, N'bao(50kg)', N'1SbUs4EeL8RGJ_OUq_ohvBbgrX08_JHDH', N'Xi Măng Vicem Hà Tiên Đa Dụng ra đời với để đáp ứng yêu cầu đổ bê
 tông móng, sàn, cột, đà trộn vữa xây, vữa tô ốp gạch đá cán nền tất cả
 trong một sản phẩm.
Xi Măng Vicem Hà Tiên Đa Dụng được sản xuất theo TCVN 6260:2009
 PCB40, cũng phù hợp với Tiêu chuẩn Mỹ ASTM C1157, với cường độ
 nén R28 ≥ 40Mpa.', 1, N'HXM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'HXMHOLCIM', N'Xi măng HOLCIM', 88500.0000, N'bao(50kg)', N'1QaoD0EnoBYbti4uqIIBESAb2FJ1B2vgj', N'Xi măng Holcim đa dụng là sản phẩm xi măng Pooclăng hỗn hợp với
 cường độ ổn định, tính đa dụng và độ bền cao phù hợp sử dụng cho 
các kết cấu bê tông và các sản phẩm dùng xi măng.', 1, N'HXM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'HXMNGHISON', N'Si măng nghi sơn', 75000.0000, N'bao(50kg)', N'1NK5sjYfzQbVxIabMuu1aOa16wQv9wUkq', N'Xi măng Nghi Sơn là loại sản phẩm có cường độ xi măng cao. T​ính chất
 này tạo ra sản phẩm bê tông, vữa có cường độ cao, rút ngắn thời gian
 thi công hoặc giảm lượng xi măng cần dùng, phù hợp trong việc đổ bê
 tông làm móng, cột, dầm, sàn.
Bên cạnh đó, với tính tương tác tốt, xi măng Nghi Sơn còn giúp cho vữa,
 bê tông dẻo hơn, làm cho công nhân thi công dễ dàng. Đặc điểm này
 đóng vai trò quan trọng trong công tác hoàn thiện khi xây nhà: trát, láng,
 ốp, lát.', 1, N'HXM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'HXMTHANGLONG', N'Si măng Thăng Long', 68500.0000, N'bao(50kg)', N'1urO5dTecV_aaTW6R7-f2J8TNcUPx_0LF', N'Công ty Cổ phần Xi măng Thăng Long là nhà sản xuất xi măng hàng đầu
 tại Việt Nam bao gồm: Nhà máy xi măng tại Quảng Ninh và Trạm nghiền
 tại TP. Hồ Chí Minh. Nhà máy và Trạm nghiền được đầu tư thiết bị đồng
 bộ, hiện đại nhất của hãng Polysius – CHLB Đức với quy trình công nghệ
 khô, lò nung 2 bệ đỡ, công suất 6.000 tấn clinker/ngày tương đương
 2.3 triệu tấn xi măng/ năm.', 1, N'HXM')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLBC01', N'Bàn cầu ELEGANT', 9630000.0000, N'cái', N'11e0xTs1Tly3PaS6l5eI6x_vXLqaaneAe', N'Bàn cầu ELEGANT xả rửa mạnh mẽ và hiệu quả xả rửa cao .', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLBC02', N'Bàn cầu một khối AC-2700VN', 11670000.0000, N'cái', N'1Crk6s8wNTjmIhEGP-NERBsFkqDZftVzB', N'Kỹ thuật xả rửa vành Rim kiểu mới
Công nghệ chống khuẩn  HYPERKILAMIC
Công nghệ chống bám bẩn  AQUA CERAMIC', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLBC03', N'Bàn cầu treo tường AC-22PVN', 10050000.0000, N'cái', N'1pdA5TRL71HmIlGM4pl_nLJ-DQ-RHecBL', N'Bàn cầu treo tường thoát ngang sử dụng van xả tay gạt.
Kiểu xả xoáy
Có 2 sự lựa chọn: Nắp đóng êm hoặc nắp đóng thường.
Đã bao gồm van xả, gioăng nối ống xả và phụ kiện treo tường', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLBC04', N'BÀN cầu thế giới DV-R115VH-VN/BKG', 129575000.0000, N'cái', N'1HQxxVEqKIpeYb2grqbwVRzWgl7yEZk-M', N'Bệ ngồi rộng rãi: Bệ ngồi có bề ngang rộng tạo cảm giác thoải mái khi ngồi. (Rộng hơn
 13% so với các sản phẩm trước đây).
ION thư giãn: Nâng cao hơn nữa tính dễ chịu cho không gian của phòng vệ sinh nhờ
 vào hiệu quả của ION diệt khuẩn theo công nghệ Plasma Cluter (Nghiên cứu và phát
 triển trên sự hợp tác với công ty SHARP)
Đèn sáng mờ: Khi sử dụng vào buổi tối, dù không bật đèn phòng, vẫn có đèn sáng mờ
 ở bên trong và phía dưới chân bàn cầu.
Âm nhạc thư giãn DXII: Chức năng phát lại nhữngbản nhạc có chất lượng cao theo 
phương thức Relax Music biến không gian trong phòng vệ sinh trở thành không gian
 thư giãn.', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLBT01', N'Tiểu nam Inax ASU-500V', 26570000.0000, N'cái', N'148lNVO753kRoCi4BPdegScEX17OPESIt', N'Sản phẩm đã bao gồm:Gioăng nối tường UF-104BWP(VU) và Van cảm ứng OKUV- 50SE', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'NTVLCB01', N'cabinet màu gỗ', 7415000.0000, N'cái', N'1bWdE5n2P-kOjAq25W7qD-0n6BVK7xIs4', N'Cabinet CB0504-5QF-B kích thước nhỏ gọn phù hợp với nhiều không gian phòng tắm.', 1, N'BCAU')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD10', N'thép pomina phi 10', 10035.0000, N'cây (11m7-7.12kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD12', N'thép pomina phi 12', 10185.0000, N'cây (11m7-10.39kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD14', N'thép pomina phi 14', 10185.0000, N'cây (11m7-14.13kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD16', N'thép pomina phi 16', 10185.0000, N'cây (11m7-18.47kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD18', N'thép pomina phi 18', 10185.0000, N'cây (11m7-23.38kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD20', N'thép pomina phi 20', 10185.0000, N'cây (11m7-28.95kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD22', N'thép pomina phi 22', 10185.0000, N'cây (11m7-34.91kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD25', N'thép pomina phi 25', 10185.0000, N'cây (11m7-45.09kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD28', N'thép pomina phi 28', 10185.0000, N'cây (11m7-56.56kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD32', N'thép pomina phi 32', 10185.0000, N'cây (11m7-73.83kg)', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD6', N'thép pomina phi 6', 11000.0000, N'kg', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPPOMINAD8', N'thép pomina phi 8', 11000.0000, N'kg', N'1B7wnwYnq-ZklQaHLUtP-6srDjmxxWn6N', N'Thép Pomina được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Pomina 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD10', N'thép Việt Nhật phi  10', 11106.0000, N'cây (11m7-7.12kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD12', N'thép Việt Nhật phi  12', 10550.0000, N'cây (11m7-10.39kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD14', N'thép Việt Nhật phi  14', 10550.0000, N'cây (11m7-14.13kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD16', N'thép Việt Nhật phi  16', 10550.0000, N'cây (11m7-18.47kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD18', N'thép Việt Nhật phi  18', 10550.0000, N'cây (11m7-23.38kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD20', N'thép Việt Nhật phi  20', 10550.0000, N'cây (11m7-28.95kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD22', N'thép Việt Nhật phi  22', 10550.0000, N'cây (11m7-34.91kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD25', N'thép Việt Nhật phi  25', 10550.0000, N'cây (11m7-45.09kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD28', N'thép Việt Nhật phi  28', 10550.0000, N'cây (11m7-56.56kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD32', N'thép Việt Nhật phi  32', 10550.0000, N'cây (11m7-73.83kg)', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD6', N'thép Việt Nhật phi 6', 12100.0000, N'kg', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TEPVIETNHATD8', N'thép Việt Nhật phi 8', 12100.0000, N'kg', N'1x-cpw10T1OWNrqHV_L5_Rc8FypHibgOX', N'Thép Việt Nhật được ứng dụng rộng rãi trong xây dựng công nghiệp và 
dân dụng bởi tính năng chịu lực tốt trong các công trình. Công ty Sắt 
Thép hiện tại cũng là đơn vị đang xản xuât sản phẩm này,thép Việt Nhật 
có chủng loại đa dạng với nhiều kích cỡ, khả năng chịu lực rất cao.', 1, N'TEP')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM2-80', N'tôn lạnh không màu Hoa Sen( 2 dem 80)', 48000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM3-00', N'tôn lạnh không màu Hoa Sen( 3 dem 00)', 50000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM3-20', N'tôn lạnh không màu Hoa Sen( 3 dem 20)', 51000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM3-50', N'tôn lạnh không màu Hoa Sen( 3 dem 50)', 53000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM3-80', N'tôn lạnh không màu Hoa Sen( 3 dem 80)', 58000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM4', N'tôn lạnh không màu Hoa Sen( 4 dem)', 60000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM4-30', N'tôn lạnh không màu Hoa Sen( 4 dem 30)', 65000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM4-50', N'tôn lạnh không màu Hoa Sen( 4 dem 50)', 68000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM4-80', N'tôn lạnh không màu Hoa Sen( 4 dem 80)', 73000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM5', N'tôn lạnh không màu Hoa Sen( 5 dem)', 75000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSKM6', N'tôn lạnh không màu Hoa Sen( 6 dem)', 92000.0000, N'khổ(1.07m)', N'17VRSxwu3MBzmqO-AF8tPMBC2n18AYq9V', N'Tôn lạnh không màu (tôn mạ hợp kim nhôm kẽm) được Hoa Sen sản xuất dựa trên công
 nghệ NOF hiện đại, đáp ứng các tiêu chuẩn quốc tế nghiêm ngặt. Bề mặt sản phẩm bóng
 đẹp, màu ánh bạc. Khả năng chịu nhiệt, chống ăn mòn cực tốt. Linh hoạt trong thiết kế
 và có tuổi thọ gấp 4 lần so với sản phẩm tôn kẽm thông thường.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM2-80', N'tôn lạnh màu Hoa Sen( 2 dem 80)', 48000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM3-00', N'tôn lạnh màu Hoa Sen( 3 dem 00)', 50000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM3-20', N'tôn lạnh màu Hoa Sen( 3 dem 20)', 51000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM3-50', N'tôn lạnh màu Hoa Sen( 3 dem 50)', 53000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM3-80', N'tôn lạnh màu Hoa Sen( 3 dem 80)', 58000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM4', N'tôn lạnh màu Hoa Sen( 4 dem)', 60000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM4-30', N'tôn lạnh màu Hoa Sen( 4 dem 30)', 65000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM4-50', N'tôn lạnh màu Hoa Sen( 4 dem 50)', 68000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM4-80', N'tôn lạnh màu Hoa Sen( 4 dem 80)', 73000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM5', N'tôn lạnh màu Hoa Sen( 5 dem)', 75000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'TONHSM6', N'tôn lạnh màu Hoa Sen( 6 dem)', 92000.0000, N'khổ(1.07m)', N'1ly9u81-E_b9ULn5hbjpc7qeREVNaQrM6', N'Tôn lạnh màu được Hoa Sen sản xuất trên dây chuyền tiên tiến của Nhật, đảm bảo các tiêu
 chuẩn quốc tế nghiêm ngặt, phủ sơn trên nền hợp kim nhôm kẽm (tôn lạnh không màu),
 có thể sơn 2 mặt. Sản phẩm đa dạng màu sắc, có tính thẩm mỹ cao, độ bền vượt trội.', 1, N'TON')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK408015', N'Xà gồ C mạ kẽm (40*80) độ dày 1,5 ly', 28000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK408018', N'Xà gồ C mạ kẽm (40*80) độ dày 1,8 ly', 33000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK40802', N'Xà gồ C mạ kẽm (40*80) độ dày 2 ly', 36000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK5010015', N'Xà gồ C mạ kẽm (50*100) độ dày 1,5 ly', 36000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK5010018', N'Xà gồ C mạ kẽm (50*100) độ dày 1,8 ly', 42000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK501002', N'Xà gồ C mạ kẽm (50*100) độ dày 2 ly', 46000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Unit], [Images], [Descriptions], [Status], [CategoryId]) VALUES (N'XAGCMK5010024', N'Xà gồ C mạ kẽm (50*100) độ dày 2,4 ly', 61000.0000, N'cây(6m)', N'1i4kGXGXjVo79cm2Bepbt_o_QcqpBFjqL', N'Đây là loại xà gồ được sử dụng đối với các công trình lớn như nhà xưởng, nhà máy, bệnh
 viện và các công trình có bước cột nhỏ hơn 6m.', 1, N'XAG')
GO
SET IDENTITY_INSERT [dbo].[RefreshTokenCustomer] ON 

INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (1, 1, N'UtnTrfLrlphotoYLN6/x/zC20Pn3P2r+alqJyFr8wU4=', CAST(N'2021-03-20T08:01:36.923' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (2, 1, N'FExt3uUwWvRTkGndJV9X1pc1ERwoTsvenV/ZJMPRuuQ=', CAST(N'2021-03-22T04:04:48.720' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (3, 14, N'rAZDfTY9F9XWgDusPVju+AHq2LCo670s152rXYndUE8=', CAST(N'2021-03-22T04:35:04.183' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (4, 1, N'J0tQawz+dIooPhHUOTYqw6rd3oh6FMFYJVAb7SYDVm0=', CAST(N'2021-03-22T12:35:02.030' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (5, 1, N'ani6YNhFpAL3gyULnf9WGzfSXvRR8/URT8Wo7ym7uVI=', CAST(N'2021-03-22T12:36:53.190' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (6, 1, N'FZAVfW26jJCL4YjSoM39Xvnc2Oh2yd7ELetXXv4ub+0=', CAST(N'2021-03-22T12:38:37.880' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (7, 1, N'mNgs++Ct5oOSTZhkiQTPYrVcyf1gp4yRjtf4Fak4+VQ=', CAST(N'2021-03-22T12:42:02.867' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (8, 1, N'IvmY2OKF7+8SaKpH2jGpWVZsJIe4fwoAfX0OakZLPmg=', CAST(N'2021-03-22T12:46:58.510' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (9, 1, N'vMY/rlSxA1HL8bHXrtS7fDYcAv37iopKCPPkTkqcCj4=', CAST(N'2021-03-22T12:58:54.467' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (10, 1, N'0JsMO9n7SlMMrhzUjGBLkeWZqs2F1v5dCv3+322vPWI=', CAST(N'2021-03-25T00:40:49.470' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (11, 1, N'Mgjx86NRHx3ekndpqaXGS124HFNzhj8i9Atp/IgdOsE=', CAST(N'2021-03-25T08:56:53.500' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (12, 1, N'A0uqXqIZ+bMMIINl3v8my4Kn4XHd8Uh6CDv8nn+gKKE=', CAST(N'2021-03-25T13:39:08.347' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (13, 1, N'7GDjjdUOORkrINy0LkLwldSjqUjyKEEBXavFjVXhAuA=', CAST(N'2021-03-26T13:58:02.507' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (14, 1, N'gnD3p4UR0bOMhgsstDVcI/cHyr/8SX9KL0OzOP/Eu4U=', CAST(N'2021-03-26T14:00:22.180' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (15, 1, N'UQPJN9k1FzvCpU2kkRevBxvv+xg1AaemEBHAGkPRmPA=', CAST(N'2021-03-26T14:02:42.513' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (16, 1, N'xT58pr+N+ETVPpfKtMMwOlcFM6/MIfWuGWaGVjqSW5M=', CAST(N'2021-03-26T14:09:22.560' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (17, 1, N'vXP1Eh77Q9dC4WE3pKQjHx1RaU4ZXI3F2e3xG2YDDts=', CAST(N'2021-03-26T14:10:21.190' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (18, 1, N'g548YaubMflaqDsj38fp5j+UJCmGcrus3rTSAwJ4Lk4=', CAST(N'2021-03-26T14:11:59.203' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (19, 1, N'NasPCvCZtq7RvXfgMv5p5+5W9sPl15A68gJkGJdTHUs=', CAST(N'2021-03-26T14:14:01.093' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (20, 1, N'veoY9h0ddLrSmm8eDC1GZ4Fiejdf4de2amMczNvYIX4=', CAST(N'2021-03-26T14:17:16.453' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (21, 1, N'tozaVq8UPXRLTkCfo/rU50NPsg9zl1uRhxZFSo+6hhQ=', CAST(N'2021-03-26T14:53:01.640' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (22, 1, N'oJERtzQoKTLLzZtbHtZQCrDLVzqL6F3zocdmfe8kKPI=', CAST(N'2021-03-26T14:53:27.953' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (23, 1, N'V5zrtZrIIU6YIydjQBPPEIyfTa/1BW3UayB6vDUe6fU=', CAST(N'2021-03-26T14:56:03.317' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (24, 1, N'h+VetmnX0pDkkP1Bf987/HZ2ytGA/gXz/5mbd8/7ihQ=', CAST(N'2021-03-26T14:57:19.977' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (25, 1, N'7DvXSkBG8BGsof/+TMS4TumDWk/DdJEiAZ2zUHAqfUs=', CAST(N'2021-03-26T14:59:06.683' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (26, 1, N'FOE4mW8aXT7Xe0PtpSTmScowqwk68Gyc4TUVS7TPhbo=', CAST(N'2021-03-26T14:59:48.817' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (27, 1, N'B5K9wmZFtfUMVr/htdwveTil4D8bTK84TxA++L42pbo=', CAST(N'2021-03-26T15:03:23.950' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (28, 1, N'CbTcvArf+caQ4fkeK+oo/3gwl7bd7kK9XAYmmbPEXxk=', CAST(N'2021-03-26T15:06:51.693' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (29, 1, N'IgAzBPs3SL+JcHhY4qGEiblq5P5L8IyeS8wV32wryH8=', CAST(N'2021-03-26T15:07:50.343' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (30, 1, N'KtrpWNrSE+fKDas5bxgma0MmImnyDqphblHO8mnUKqo=', CAST(N'2021-03-26T15:08:54.723' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (31, 1, N'BAD0e2UhdeVbfNG7xwwPYxw9zVAyEGkojWFd5RGlaqs=', CAST(N'2021-03-26T15:17:19.283' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (32, 1, N'VTU1BdTEZ49PVI/QyvMz+hOh+PNLAAPcf9tw98xLOrE=', CAST(N'2021-03-26T15:17:49.483' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (33, 1, N'2XQPjSYGdh5OF7wy27dwjbYmAU2sFaHsfvc8aWvjwKk=', CAST(N'2021-03-26T15:20:49.047' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (34, 1, N'FvmaCO0VhIhA2AN0yn1HMCtq+TF7Ka3KFDW2H76iMmA=', CAST(N'2021-03-26T15:21:07.373' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (35, 1, N'9uk4oqx84WAnvPKUJpy+75Kja6p140oUAIeajg2OXeY=', CAST(N'2021-03-26T15:21:18.587' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (36, 1, N'jfOIqhgTWBeOMxDK1I9MwlMbLDbcZ++jkRccv8hrN1M=', CAST(N'2021-03-26T15:21:29.173' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (37, 1, N'x1AsnLXCJW21okfF1eB9CPozXkIZ0G1bkyeNa1ukweU=', CAST(N'2021-03-26T15:21:54.410' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (38, 1, N'W/hQg2N1ONwOtiRzXD6k/HVgw9afK2BO4t6Fob/rSmM=', CAST(N'2021-03-27T08:49:00.980' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (39, 1, N'm7vaPw6+Cv+yWcrb+wm3zypoiaVo3qRaMpsGFNjVOyw=', CAST(N'2021-03-27T08:52:33.653' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (40, 1, N'i5J/REbIsF0noapSCD2PnDFangOFob1wwJ3wOhVIC5c=', CAST(N'2021-03-27T08:56:01.967' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (41, 1, N'U3aSvcNgo6evUmxmoVf/tolB9E8US5XInu3uJ4+7nwg=', CAST(N'2021-03-27T08:56:36.927' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (42, 1, N'wwdBdQ7cbAyTnlpzgyxeMeJAajKRhPes2Z07Fcwm4DQ=', CAST(N'2021-03-27T09:05:02.757' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (43, 1, N'uLvxLtCdn8OQTZtxo2Ip2TaGPxzurw64IE/3XzhBDmA=', CAST(N'2021-03-27T09:23:28.870' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (44, 1, N'Zvs8hEmQCz8x/fQJPwlw40QpCnvFpW70aZpkNfyKjbI=', CAST(N'2021-04-02T14:43:25.887' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (45, 1, N'0oAmofPbErpOQKiwz+dbRJSo17fG73du86fpVV98Jww=', CAST(N'2021-04-07T01:05:21.837' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (46, 1, N'EtWAwMkp2L0WhJ71u2dNXB9vOAXTVKcNQT96NijCmaI=', CAST(N'2021-04-07T01:05:21.690' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (47, 1, N'MgbX3TvR6nnby8Js8/Jr1sWkB/ciHq98YN8PQbTCVLs=', CAST(N'2021-04-07T01:05:32.587' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (48, 1, N'JtWfAFwaGMBo5Mul4nmFRKTsUVvnPR127UNcBYml7GM=', CAST(N'2021-04-07T01:05:32.607' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (49, 1, N'PovCwNWK9l5IDLzUIRmzbXNnp9RLS/5bUXWfL6c+3Go=', CAST(N'2021-04-07T01:05:32.637' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (50, 1, N'prGZI39CpAj1nBMrVZFTd2OOznqFFKn29eRYWLs4AnU=', CAST(N'2021-04-07T01:05:32.670' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (51, 1, N'C8pcH1I9OJV7gHCc60BVV8bIFfe1lh3QIM7biprcHr0=', CAST(N'2021-04-07T01:05:32.693' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (52, 1, N'yAPK9nNhvaKQ+Sjq8W9iea1yKSnEqRdKNkyKTPMwd1I=', CAST(N'2021-04-07T01:05:32.977' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (53, 1, N'61en94HTp73Rto9lqE1+L1fzpkuFP5/uyN654wKAWqc=', CAST(N'2021-04-07T01:05:33.400' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (54, 1, N'uLSRQVBlyNYJXQVSUI5Wme+WXiksVC7rKhNIwVTBFCs=', CAST(N'2021-04-07T01:05:33.670' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (55, 1, N'1CNugFDDD5DkcivpjutS0GYhl1uA1Nob/kWm1kEICiA=', CAST(N'2021-04-08T00:02:23.363' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (56, 15, N'p7coR1PjwOidmG21JWPt4QWUsW8Yyfsn/b1CnVvfQiY=', CAST(N'2021-04-08T00:23:43.687' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (57, 1, N'mFj1Ih6RTsY8Rh74d/62se/ktw8s996bSkWTBKlr5L4=', CAST(N'2021-04-12T03:47:04.210' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (58, 1, N'FKHMavfefRz2NRsNIBu+iRSspH4aKyuSm0nxrx1bj/k=', CAST(N'2021-04-12T04:11:41.920' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (59, 1, N'VuyHUOL0kpjr4J0nD/joAMQGBCY2YUKc0KquRZ2LGco=', CAST(N'2021-04-12T04:15:17.480' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (60, 1, N'jgsEfo7cladlDn4N4Fx03dSxGLv0XPFDE8afs5D0sWo=', CAST(N'2021-04-12T04:16:18.707' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (61, 1, N'Sf3fTIamUg/xKxl85WZ0pbBZzUM3VfIzAEUlxLSTwyc=', CAST(N'2021-04-12T04:19:47.823' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (62, 1, N'W40izutV5hRlg+b/m3gyOwz7RUCloTN8DC7At7IMwmE=', CAST(N'2021-04-12T04:19:48.100' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (63, 1, N'ahVubbJsK5eAMoKaVUV+ei8HYy8gn/BvaOWnD5CcZAw=', CAST(N'2021-04-12T04:22:25.890' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (64, 1, N'G2r1vkJxomRyL/f+vsvGe2jPu/vVFI4WEc2jBk1NjZE=', CAST(N'2021-04-12T04:25:37.510' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (65, 1, N'RN4QQqWWlZn76cI/fdnhWTGtTH9ImnbkZnauJ7U3AHw=', CAST(N'2021-04-12T04:25:58.023' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (66, 1, N'g/XE2tB6f7rVHSyr9nXCknOudnqNYYn056+wJhtbN4c=', CAST(N'2021-04-12T04:26:48.020' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (67, 1, N'BN7dX7Owqk0DFrcPyJGDsYYk+IAeg/6Wk1GTh46E4s8=', CAST(N'2021-04-12T04:49:40.587' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (68, 1, N'iDXEnviBYb4QwJ8LfEtmW4eBsQ5X3ypNl6eZXyU/HC0=', CAST(N'2021-04-12T06:14:27.683' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (69, 1, N'upev4vRJcxRNnF3A/PS+3pXVk9ErZOL0aWMwxfVgKCE=', CAST(N'2021-04-12T06:16:47.827' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (70, 1, N'1plgnOFmINTfJVsljGKsApgRgU33eRjQ9PINXKlzm/M=', CAST(N'2021-04-12T08:23:23.910' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (71, 1, N'WVpQdXkLuSdoB/YCjEjK289n8PyHufOicevuomxZPOk=', CAST(N'2021-04-12T13:02:23.457' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (72, 1, N'/UobaPUHlQKmjLzTopkWFafN3MwBfFpjWSxUqYGeELo=', CAST(N'2021-04-13T08:26:08.573' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (73, 1, N'K0/V0Pt4QV5L7de7PDtBJT7UhDUkDnxe4dSwaYi4Xn8=', CAST(N'2021-04-13T11:54:02.870' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (74, 1, N'FoYVxwemPTNIHm/BG/2INH+O/uBHUadKYA5LyCmbtAA=', CAST(N'2021-04-14T00:11:56.073' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (75, 1, N'77brFOSOQ1R4Ir0gQISYE4cFkWHj4lBfmN3FIXBwzhE=', CAST(N'2021-04-14T00:12:50.343' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (76, 1, N'TRKYozAQMRstqAIbKCypEUBzWkZr9PbWUjPFU5b0iJo=', CAST(N'2021-04-14T06:00:12.107' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (77, 1, N'+h9+CYpAkDe4LYsS5aRDVzmRRIAsNAOGX3OUEUnJpFk=', CAST(N'2021-04-14T06:01:09.737' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (78, 1, N'bDeDXR52TJD50oYEiyHawVCjOQ8LH5bdEKcy32H+UeQ=', CAST(N'2021-04-14T06:02:00.807' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (79, 1, N'UwyKN5T9mJadxH7oRv0aUbHt2YcoCf3/owRQl7Amrz0=', CAST(N'2021-04-14T06:02:13.687' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (80, 1, N'pHyyaTXRvOvXvuhLubYhahwzousKWZMKbJW3KzFZp+k=', CAST(N'2021-04-14T06:03:42.323' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (81, 1, N'p1cCpyccnaKIDkh8MYT/ohVp+So4V0diPvxLLIunbt4=', CAST(N'2021-04-14T06:05:34.323' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (82, 1, N'VhegSxGKeE0Ew4hoIocsklPXx04VKx+ru83xCPOpf5U=', CAST(N'2021-04-14T06:06:16.400' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (83, 1, N'/7tbToexjppIVCskG608DMx/pvh6LDbradOMMDm/OY8=', CAST(N'2021-04-14T06:08:31.803' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (84, 1, N'MmMN8P7EmGi2147S78ZJ9r3liUQrpkd699MA6Jcxo2s=', CAST(N'2021-04-14T07:04:53.627' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (85, 1, N'IvL3i7mH5Ntmv68fhV6Ps1pMFxHsWtiVulWFGIl8ozg=', CAST(N'2021-04-14T12:13:41.117' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (86, 1, N'L3ngVEqQJ7LGWShFVsURMule+d18O63fwkTUUJtnUJ8=', CAST(N'2021-04-14T12:19:01.880' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (87, 1, N'lhY7ARuMEJbgTzdtzel+xsSX/u8VvRU6rIa7kvCVcBo=', CAST(N'2021-04-14T12:49:57.983' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (88, 1, N'EiU6aQ6ypaTpzTH8vvc9Z4PXYNXjiM4Ifdn+bHVz2cQ=', CAST(N'2021-04-14T23:52:23.260' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (89, 1, N'L3eztQK9ml5RIBVtwKSDG0AhYi43KuPynLY28aD+XHY=', CAST(N'2021-04-15T00:35:45.913' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (90, 1, N'cpNoYUa4uppphnfreuJlj4dj516dELN6YbESygcoQCM=', CAST(N'2021-04-15T01:09:14.157' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (91, 1, N'PxZMQcoQPBfN93G1SVDtcFfHwKiENmFh8Xq3uZmw5v8=', CAST(N'2021-04-15T07:05:44.890' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (92, 1, N'+RBRTDO5fk6++xeEO8J1drYmqt1IKSUo/P19exTqLp4=', CAST(N'2021-04-15T13:44:46.630' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (93, 1, N'Gxlwdwr363M2gW8w5cCQtucevkvwGtP15OoruhKCW5Q=', CAST(N'2021-04-16T02:39:00.163' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (94, 1, N'wMFpU7WkfNi5i4NLDkyakHAzXIKYBofyivn/m+0JSSg=', CAST(N'2021-04-17T05:34:23.450' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (95, 1, N'fGwIEps2rn+r+0gSp8kgcsJL/jX8iqqqy/hdXWerV5I=', CAST(N'2021-04-19T04:28:04.663' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (96, 1, N'tnvw+uW2EqCsBDiLhSIG2zacxrBVE4++ojulJX9cEQM=', CAST(N'2021-04-21T01:26:24.033' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (97, 1, N'ARwEF5UyeIsnGHyrykpRs66wWp/NlUI9IFN6qHNV0j8=', CAST(N'2021-04-21T15:49:23.903' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (98, 1, N'sxxKcgS53dKi8q+2TLQ4mi4eVJAwEYrP/kXM84Vype4=', CAST(N'2021-04-21T15:50:24.053' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (99, 1, N'Ia9EP9GDIST1pDsRoi2H2Okmf0k4J/hclx7hSy2OW8k=', CAST(N'2021-04-22T03:48:51.210' AS DateTime))
GO
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (100, 1, N'oq7yUmgwx7KwmSNd2o0iZA5Yb1iBBwKXR7GsIXpzU8c=', CAST(N'2021-04-27T05:58:35.150' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (101, 1, N'ND6rYyBdxJRtbMZtb1on9VyAM+YIx+1auWo2G6RnoL0=', CAST(N'2021-04-27T06:08:02.547' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (102, 1, N'P6rPXbmxPnn4h93zLbiobWuDcshOEypkgOSuj0VRYa8=', CAST(N'2021-04-27T11:22:37.890' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (103, 1, N'bVRlQ/Jt6cogx86WNXCuPSsD3xUqu+cxJOfqzFahd+c=', CAST(N'2021-04-27T12:50:56.477' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (104, 1, N'hXvy02jVxvTKirMY/hxbWzezfWBNk2sJxieRf6BLLbA=', CAST(N'2021-04-27T12:52:01.107' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (105, 1, N'56C2IFVJQLnCken0Lqt5x/oLcWCzD7WBOhFRJl9hlYs=', CAST(N'2021-04-27T12:54:44.300' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (106, 1, N'OM+928vDcd7B+v2tzMDM2QCWDvKGQ94acrlRK1OgXzM=', CAST(N'2021-04-27T12:57:58.240' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (107, 1, N'ecNBo89xZA/l5FCviCXHukiHaRukuuoeSMdP76Hvez8=', CAST(N'2021-04-27T13:03:56.590' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (108, 1, N'ZRAPKK7PEHpPVXjev0eap0oRqHPooMF121DMKgOaYwQ=', CAST(N'2021-04-27T13:13:47.250' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (109, 1, N'G6+3LloNbM9CRz5ar1JV3Y/2PFCMl6G5Y5k7ixR6Ncw=', CAST(N'2021-04-27T13:15:50.547' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (110, 1, N'a86Q2UwXVFXBgVIhK8+hmqRlVoeLKdPCFxuUhAZEF9c=', CAST(N'2021-04-27T13:29:25.970' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (111, 1, N'2Zj4AZ/BrW0OJsGtqJtWlP+4UKCNo5gWh1tn8YkKnzs=', CAST(N'2021-04-27T13:41:04.240' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (112, 1, N'AXM9yE/IZw/jzIQvgB0cPBzT+8AMV7iZSGL9IKfMtto=', CAST(N'2021-05-01T07:33:11.720' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (113, 1, N'tXY6eGEt3r+wCWiuAEpm37DyrryJ7f9V3cZeWRbO9P8=', CAST(N'2021-05-01T13:22:27.010' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (114, 16, N'YLhz4EPjwViFDi/Dyv0f7bxT6Pz59tWzNV2BBkC91JI=', CAST(N'2021-05-01T13:33:59.083' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (115, 16, N'3jitSDW2ZFr+zNM8YWnkURcAQ6nt7X7P23QBP3U3+FA=', CAST(N'2021-05-01T13:39:47.267' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (116, 16, N'MBDQvTUVaxwvFTGcyrmM7LUGkru2jE2tfQHKH8+LjTU=', CAST(N'2021-05-01T13:52:52.597' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (117, 16, N'AV4ir4hmbs91BhCtYXwqhF/vS+nKaJS5RHdXpFo/LW4=', CAST(N'2021-05-01T14:40:10.697' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (118, 16, N't4YRDtZc559Cw3HYbt/YnF43iTy2+3mHbw2NIbGgD0Q=', CAST(N'2021-05-01T14:53:09.953' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (119, 16, N'E/svr1b5cnSVF01J8k4CWIRJOfb/GMlyCKXdu/Pi4dE=', CAST(N'2021-05-01T14:53:58.173' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (120, 1, N'S5I0E14u1pccWa/wiluc50QmMxG+es9vAhVQdckgck8=', CAST(N'2021-05-01T14:55:11.547' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (121, 16, N'x1CtADgCN5I28A8wpBGkN9FNTZRqU9PPGdgI3+tWmXA=', CAST(N'2021-05-01T14:55:47.110' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (122, 1, N'7QmnWguQw4C84Lbn9YmDZ9ujl5xtF6FHKIzaSnEoLYo=', CAST(N'2021-05-02T04:59:04.397' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (123, 1, N'hmeN7bulXDro4/29itnI77pvrpVk2/4gGKH92qKbvck=', CAST(N'2021-05-05T01:03:11.933' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (124, 1, N'cpJlSwhNGOs3uLOtk0+K2k+uiYcCXNBdDhVR7GJSMf4=', CAST(N'2021-05-05T01:25:00.843' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (125, 1, N'qniRW0Edyj+VxoVcXxDBpks9YIhqyt9amJ6dWaoIji8=', CAST(N'2021-05-05T10:50:16.393' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (126, 1, N'zIArI8DK/TBcXKplGYRMWhnS9+ytjS8pk4qhdKOxFSw=', CAST(N'2021-05-05T11:01:42.573' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (128, 1, N'n3V7BVRsoUGRhISL8PVmO5AZ2KsDH6MPYU6IX90FaLw=', CAST(N'2021-05-05T23:54:21.180' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (129, 1, N'0OoeafowqBnqCMtRgj5mOyllLcdSnpnrIWbVUj5lmTI=', CAST(N'2021-05-06T00:38:27.823' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (130, 1, N'4Sha7RZHhKKzranmO3kbz61iwp9lRYY+KfyB6KL65JU=', CAST(N'2021-05-06T00:44:27.557' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (131, 1, N'GHKSZAvR94m22WoBplGFP94q8zQXzOazos/nQ22Falk=', CAST(N'2021-05-06T00:45:31.960' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (132, 1, N'x3xZ1b+HSGpNXZ8lq/SCJGuN40P6gOUqGUMyMYJ4+FA=', CAST(N'2021-05-06T02:53:06.173' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (133, 1, N'JnNu+8X4K0JmOPuj87HZdif2q6Tg5V2TSaerkvnPRZ8=', CAST(N'2021-05-11T08:51:17.300' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (134, 1, N'gaWG7Xa8PweC0OCxn+fZgcj3vTxpdM/UwYEAQfVm1zs=', CAST(N'2021-05-11T08:52:16.537' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (135, 21, N'+fJk+IowzXF/9jZXU8jBzzWKxPBZVxwqaKIEJmc9UIM=', CAST(N'2021-05-11T14:21:48.707' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (136, 21, N'4JdO25y55CXhqdE4gfRFkewpsvngFeFOdlhsXDbjo8I=', CAST(N'2021-05-11T14:23:18.923' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (137, 21, N'Oxg7obWpphDYavf6NREhmnM8zN20VdwNcv1ehGF8vuw=', CAST(N'2021-05-11T14:32:41.207' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (138, 1, N'VV3ajeeuHRR+yNpHm7rE3lkHxTqOVOx1F5sc4lcRJTw=', CAST(N'2021-05-12T06:11:31.717' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (139, 1, N'3tpQ0PlVIO6QWNbgp+ZyTZ9Y4pNzVbmZ7UOeBnArizQ=', CAST(N'2021-05-12T06:11:50.043' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (140, 1, N'M6j358tXlscNBtEeHOU+psA90gQM4fTiGcqGMyEwADY=', CAST(N'2021-05-12T06:12:08.347' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (141, 1, N'KTQapYt57avmBu4dTdNMpLfM9SqHQC1yZycD24lOegs=', CAST(N'2021-05-12T13:54:39.050' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (142, 1, N'DYWoTUNjkaCdK9tLliSxFXvWMM4HS8q3j9D4FmOkxX0=', CAST(N'2021-05-13T00:58:17.243' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (143, 1, N'FUUw1uGDXBwSpeLZpyMu6UrND9uR0e+cYSPSkoDjpKk=', CAST(N'2021-05-14T13:48:05.043' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (144, 1, N'uWbyaT+1pDlHKHXBL+r6SRHRkAD392foE5j8iDhLwNU=', CAST(N'2021-05-14T13:52:48.023' AS DateTime))
INSERT [dbo].[RefreshTokenCustomer] ([tokenId], [customerId], [token], [expiryDate]) VALUES (145, 1, N'59GWhF/F8r8TfTEpMKa6uwDY1ZbwiHJlO3fTunrRmhY=', CAST(N'2021-05-14T13:57:04.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[RefreshTokenCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshTokenEmployee] ON 

INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (1, 1, N'0sCtHvLpqcDNdgfZuwiwHoYTWXWdtSVDDXerVIfYUho=', CAST(N'2021-04-13T17:46:56.583' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (2, 1, N'w/yvS0eKpFuI49JKU/p4EssIZdvhxD5IvDhQcyE7dD4=', CAST(N'2021-04-13T17:47:37.023' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (3, 1, N'VO/wbvIjqLY3y3M8dyIsU2L7uhB9bbrlk6ZgXSw2ONA=', CAST(N'2021-04-13T17:47:44.677' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (4, 2, N'fZaqFQZot7TxcpZ9ZhFjzCSfxK8o46UXbqJs/sEPijE=', CAST(N'2021-04-20T05:54:37.613' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (5, 1, N'bGuD/4z0Uy6oBByczXg/yjPrO9qYfHfwwS7Ea51BHAg=', CAST(N'2021-04-21T08:49:25.300' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (6, 2, N'kNbmEhyhK2Cp/MnyOk4rXpZ1G1XHMpCGqtEvCtIhRW0=', CAST(N'2021-04-21T08:52:39.687' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (7, 3, N'SkTyLq8lrQtplde9PM0BCArooKFo+SdgZX4RGR5XFVs=', CAST(N'2021-04-21T15:25:13.247' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (8, 3, N'XYHL7zPKfUBUv4UA2J/AgkCPh/xddyImkeuGa1B+uk4=', CAST(N'2021-04-21T15:25:29.747' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (9, 3, N'BkhsncVtkHiLHC7P12RsRAYY7Seun7ZgMJ+YyHWICaQ=', CAST(N'2021-04-21T15:25:29.843' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (10, 3, N'FH+I8SKQH6Qp5H9q77mjuFrm2U/pYq+sknq5LJGLNLE=', CAST(N'2021-04-21T15:25:29.843' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (11, 3, N'YCO4Iqvdo8jnOuCLfWLWp3ivoNk2Pi5LcY7RfNcim2s=', CAST(N'2021-04-21T15:25:29.857' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (12, 3, N'd6tpMSS8RCEZVnnQvsRM+IegSfCBxe+wNNxi4X1hmwk=', CAST(N'2021-04-21T15:26:52.257' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (13, 3, N'dh3PvSbFzHWFDKZRWApThVwVlfyQrOJrl3hrQ5rumH8=', CAST(N'2021-04-21T15:28:05.787' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (14, 3, N'LPCdMIqZe//3cW1cr7AwvJSr92UCIdeAUO+JpGlYmFQ=', CAST(N'2021-04-21T15:31:19.817' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (15, 3, N'T2cMcBhZOFT74TVH11yryT6moe7qU1W4hXjEVQCumJM=', CAST(N'2021-04-21T15:32:41.763' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (16, 3, N'ZHHQriIawZxkLuUJJ/ohRjsXCNcawJMbb85tOOWIdLQ=', CAST(N'2021-04-21T15:36:15.987' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (17, 3, N'NkO5uRYt5jAOTGSCMZ3gFuQdd6TBAQYlNyMcjXm191A=', CAST(N'2021-04-21T15:39:01.343' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (18, 3, N's87Or3pi0YOxrzGuurof9IxEbKBYkNI4Ga8B4KbLfls=', CAST(N'2021-04-21T15:41:39.463' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (19, 3, N'6KmrbXchd5oJ4PHBbJuD68XfzBiR2Vkc6oM5pEQUlCU=', CAST(N'2021-04-21T15:43:04.883' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (20, 3, N'FJPyJpVTBVP+WKxI0tSR7/e0au3rkUdORILFCL8bdwc=', CAST(N'2021-04-21T15:45:50.070' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (21, 3, N'FirkrC1tTAOMf+SEVnMnBiemWgpyZyVrXV2ZcgC9zZI=', CAST(N'2021-04-21T15:51:56.590' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (22, 3, N'wU9pu1nrh6CFjrZkSvltSsXhXSM35cGDtS8f0sZTM1U=', CAST(N'2021-04-22T03:54:42.560' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (23, 3, N'52/Zhm+uEg60BH74TEAnbRn4tww+9zRXZVn2Fo58bCc=', CAST(N'2021-04-23T15:21:32.487' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (24, 3, N'ssS2bWEXuoFb2HFrAfU5+C11aecLBBznF/V2UlCzT6Y=', CAST(N'2021-04-28T00:20:52.697' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (25, 3, N'4K6DhA0PW/bReYtjvIf9eqTOUXiWefsiCaO2yWwgY0g=', CAST(N'2021-04-28T08:32:27.043' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (26, 3, N'KeSX10JpOtWGJz8uSwlZPvgjbGK9qkun/UiIgMXDLNI=', CAST(N'2021-04-28T08:32:38.287' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (27, 3, N'gmRHamEoBY4kR+oiBoCNJqLvbf1MucJID2LIOsxESTY=', CAST(N'2021-04-28T08:32:39.520' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (28, 3, N'WbbeEpfVvXpI/ucGZhchaYM4TaREca3klHXKHfFA0I4=', CAST(N'2021-04-28T23:57:16.920' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (29, 3, N'Xqy0xgT5Vsd9tKYN+xpzeLtUZrnqM/SDFY5iXGVmh38=', CAST(N'2021-04-29T03:14:53.940' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (30, 3, N'1YUJGTt8AhddWO9WbY4lxtpY0nikQE+2imQ0Jy1lN4w=', CAST(N'2021-04-29T03:14:54.410' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (31, 3, N'SO/ovKD6bqaAi/mBlDV5A7Gv4NoqlwLVfm32ekuLo38=', CAST(N'2021-04-29T15:20:54.467' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (32, 3, N'nUw6veZtPHom/K7pqs+qxhNEmnT2sxwVD9Xdd32qbCg=', CAST(N'2021-04-30T01:37:33.147' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (33, 3, N'g6msCBNgLudhaitIoDM9y4UDHZW7HCu2syGgjtLIH6c=', CAST(N'2021-04-30T02:26:48.397' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (34, 3, N'GYzx5c4aOgr7ctGqyTXS2hMn3IN7rjL0Ijut+oxy7NM=', CAST(N'2021-05-01T15:01:28.213' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (35, 3, N'i1WDP+ANsxo0ToCcaJ92un+Ltn7UnOOUZu8MAZ2qZ1M=', CAST(N'2021-05-02T04:45:14.143' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (36, 3, N'lY1xwz05rzSCbB3vauCU/NsDaV50xl6mrt5XIG/fNOc=', CAST(N'2021-05-02T05:01:13.230' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (37, 3, N'30w7MItmh1BssfVmSa5lv3oFYJzx+zoAQHqZX3tvv6U=', CAST(N'2021-05-02T05:53:24.030' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (38, 3, N's5Kerqc4Bp8uzZVbnV9AbHoi9yp/egcv3gj2VLuKt/Y=', CAST(N'2021-05-02T06:09:13.593' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (39, 3, N'p/RzJc6bK5L/aDtfPkLDYkjD65p3xh/ZGDKkUz6XYKE=', CAST(N'2021-05-04T03:29:05.583' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (40, 3, N'hkvodmprKRXv+yiAkN8e/J9X6oaqMRgFb51tIwuOBpw=', CAST(N'2021-05-04T04:35:04.590' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (41, 3, N'jyTZaWjXg5hqi4iCaCzSdx4tQLmNXRHlYbCO+nr9C/A=', CAST(N'2021-05-04T15:10:34.720' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (42, 3, N'lfdsXLmFMN+1D/LKLJ4EOK2VLjS2CF8OrSYNGf2fqCY=', CAST(N'2021-05-05T00:02:47.000' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (43, 3, N'05ZX94/gLUFDiwWwpezAHus4DDKC1kCILrJSjbzImWo=', CAST(N'2021-05-05T04:13:30.943' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (44, 3, N'ktn4X8wINtl96H0XH8gzEitKK3jF3JWa9zFYzV3wGCM=', CAST(N'2021-05-05T11:44:56.593' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (45, 3, N'tODapHi7pp+b1FVt7EV75D07GzsSpn+GVAPkqqZPqCc=', CAST(N'2021-05-05T14:26:36.013' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (46, 3, N'MYSAdP/4aUZUEAzIXyJO2eGgmuKHXQ5R7hZqfNBxemg=', CAST(N'2021-05-05T15:45:37.837' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (47, 4, N'6SmgUqOAs67XxHq0jE5BXf9Wa/EZLPr6IgNS8TPW7GU=', CAST(N'2021-05-05T16:03:45.477' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (48, 3, N'ura9Ml11qZDN/rIOF0mlFC2rLP+lRsgU085YLFw/C98=', CAST(N'2021-05-05T16:13:03.663' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (49, 4, N'b1B+kuHxWN03LXlQ33rCxk8xdl03B7xcPIvGSKDxydE=', CAST(N'2021-05-06T02:57:54.320' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (50, 4, N'jjzi74jxK2h4qqFI80/Ai3AIWElyPIYd+mPiyGSH6ps=', CAST(N'2021-05-06T02:59:48.200' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (51, 4, N'vimZacVNNDJEyKL5+O111Lq+nzmaCpudP37LNqFIgmo=', CAST(N'2021-05-06T03:00:54.543' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (52, 4, N'GMu4OCuYSj5QqO4ZXCyAjBIHLo331Lx4z+Jl3poBly0=', CAST(N'2021-05-09T07:37:10.510' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (53, 11, N'gZlkDf2+PdULSMfsoXIP9KEb5vY1s8pkSTZAc/f03VI=', CAST(N'2021-05-09T07:38:54.720' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (54, 4, N'sFYCzjGN/V8Ic34jIXjUgRceqHYshrIAmohRiQTIBWk=', CAST(N'2021-05-09T08:00:18.553' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (55, 4, N'neTwEf4gPpXhYkUrjYsPtaY74z+1InFExwFRJJR2lVk=', CAST(N'2021-05-11T05:48:43.773' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (56, 4, N'lM61Z+qUaNBarvjbYw18IH2g3kwtGSC8wu1qZsg/BGQ=', CAST(N'2021-05-11T08:58:18.403' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (57, 4, N'g6VvWfolYGPKOl+CJSvxzunu+E1e+biDUKI3VHW7CmY=', CAST(N'2021-05-11T14:37:56.700' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (58, 4, N'xC0Rl2NFZroRajAtJm+dDeyp/w3d04Afeha56p15nvE=', CAST(N'2021-05-12T03:09:50.167' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (59, 4, N'GCgQLIv8fd4J0ngSt4wx/RQ3ctMsm4YAX+xcpxtIv/c=', CAST(N'2021-05-12T05:42:03.673' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (60, 4, N'GiIEsY1DCOxXbreL2gr+A5lKQJXX+xR6/a5ON5Sqcu8=', CAST(N'2021-05-12T14:23:08.460' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (61, 4, N'c9CbRgS23TdNjWN0f8dYDiWCuYt6x3wz4AB79zZ04HA=', CAST(N'2021-05-12T14:44:56.833' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (62, 4, N'rL1CZBFWrl6g4Gen8cNIhltlhFvU8W7Dpfnlt5ZFgzY=', CAST(N'2021-05-12T14:45:48.913' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (63, 4, N'm0Lvrquvib3d9HtlTTysSmu85APOLn6Wjyh4QydVoF4=', CAST(N'2021-05-13T00:27:43.517' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (64, 4, N'pzjYbdWbEzhiWQkaIkG9GORmGhkQP76NFoah6bM6sQ8=', CAST(N'2021-05-14T02:53:28.450' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (65, 4, N'Xjpfkr38VJEbnwV9r6Sz3aGMDkoHpaOaengirFPbEW8=', CAST(N'2021-05-14T02:53:29.047' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (66, 4, N'hqBZTF3HJxzWiL7slYq/Lak1nMeZvNvQxGIT48Cd9is=', CAST(N'2021-05-14T02:56:49.290' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (67, 4, N'3P0fgNa4zihsssEyah4a1oe5HBmW3vtipQnfMeM+9IM=', CAST(N'2021-05-14T08:04:59.147' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (68, 4, N'jbCrEPjh4q25OauGlndRSV/ERMrBmhe2Wl+/S98zeO0=', CAST(N'2021-05-14T13:32:56.320' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (69, 4, N'BsyV3ySJcgNiOUx8tGR+m2Nu8kxXXZZsWhPQhQtHlRw=', CAST(N'2021-05-14T13:33:25.343' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (70, 4, N'T5bXg/vMdEK20lNeKiYvUtx3lkMcHQcN9g/21L1cclU=', CAST(N'2021-05-14T13:35:18.563' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (71, 4, N'zEfJjLkmGAVLG0+D4/mei0SuIFmR54EbCdIdRtKT8js=', CAST(N'2021-05-14T14:41:22.423' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (72, 4, N'fE80RrlptLjUZgMS6kM1kFCLGDfykuorve7kN8pnX2I=', CAST(N'2021-05-15T13:35:13.557' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (73, 4, N'O+CagbLwyygm4g6Xg3X2J0hmu/+4JCA9GC5rEzCSVXo=', CAST(N'2021-05-17T04:10:02.740' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (74, 4, N'542m0h2Yk2rqRbS3M3zCHoQaOmCQcnqJuYS5Fvvynwg=', CAST(N'2021-05-17T13:24:34.083' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (75, 4, N'sZ4Ui1s0lACT3RlbnwMXHuZJ8QHueh3eCf9kBinAliY=', CAST(N'2021-05-17T14:45:51.363' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (76, 4, N'gqOn9mdfL2qN8CypyZ1MgisLQD2fAcAvdaRRe08b60o=', CAST(N'2021-05-17T15:05:09.937' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (77, 4, N'ml5+6Mge8OH9zSKFNw8k7CPpWjfdbbBvDcJ4mzTgD6k=', CAST(N'2021-05-17T15:05:29.773' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (78, 4, N'kFVyn9MsPg25qZ0GqtEvuNsS72Va2g79oZlVvX+6GSo=', CAST(N'2021-05-17T15:35:57.610' AS DateTime))
INSERT [dbo].[RefreshTokenEmployee] ([tokenId], [employeeId], [token], [expiryDate]) VALUES (79, 4, N'2W07OhZ794BoWnNwpTp9uTSP5d2McBq9h+h5tSVeh5E=', CAST(N'2021-05-17T16:06:53.370' AS DateTime))
SET IDENTITY_INSERT [dbo].[RefreshTokenEmployee] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'ADMIN', N'Quản lý')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'NVBH', N'Nhân viên bán hàng')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (N'NVKHO', N'Nhân viên kho')
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (1, N'Đã hủy')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (2, N'Chờ xác nhận')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (3, N'Đã xác nhận')
INSERT [dbo].[Status] ([StatusId], [StatusName]) VALUES (4, N'Đã giao hàng')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Email], [Address], [PhoneNumber]) VALUES (N'CATCHIEN', N'Cát đá Minh Chiến', N'chiencat@catda.vn', N'234 đường Xuân Hợp, phường Phước Long B, Quận 9, TPHCM', N'0917101999')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Email], [Address], [PhoneNumber]) VALUES (N'HOASENGROUP', N'CÔNG TY CỔ PHẦN TẬP ĐOÀN HOA SEN', N'hoasen@hoasen.vn', N'183 Nguyễn Văn Trỗi, Phường 10, Quận Phú Nhuận, TPHCM', N'(028) 39990 111')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Email], [Address], [PhoneNumber]) VALUES (N'THEPVIETNHAT', N'Công ty thép Việt - Nhật', N'vietnhat@hoaphat.com.vn', N'643 Điện Biên Phủ, P. 25, Q. Bình Thạnh, TP. Hồ Chí Minh', N'028 629 75 599')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Email], [Address], [PhoneNumber]) VALUES (N'VLKHOA', N'Vật liệu Đình Khoa', N'khoadinh@xaydung.vn', N'244 An Dương Vương Quận 5 TPHCM', N'0942567454')
GO
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATBT1')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATBT2')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATDM')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATSL')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATV')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'CATXT')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DAS0x4')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DAS1x2D')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DAS1x2X')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DAS4x6')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DAS5x7')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DASMB')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DASMS')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DASST')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'DASSTN')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMCTL5050DT')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMCTL5050DT')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMCTL5050XC')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMCTL5050XC')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMPL8080X')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMPL8080X')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMTT3030CX')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMTT3030CX')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMVL3030D')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMVL3030D')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GAMVL3030SUGAR')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GAMVL3030SUGAR')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GDN4pt')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GDN4pt')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GDN4tq')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GDN4tq')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GDNB100x190x390')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GDNB100x190x390')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'CATCHIEN', N'GDNB6L')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'GDNB6L')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'HXMHATIEN')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'HXMHOLCIM')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'HXMNGHISON')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'HXMTHANGLONG')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLBC01')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLBC02')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLBC03')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLBC04')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLBT01')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'NTVLCB01')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD10')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD12')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD14')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD16')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD18')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD20')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD22')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD25')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD28')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD32')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD6')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPPOMINAD8')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD10')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD12')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD14')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD16')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD18')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD20')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD22')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD25')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD28')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD32')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD6')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'THEPVIETNHAT', N'TEPVIETNHATD8')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM2-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM3-00')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM3-20')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM3-50')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM3-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM4')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM4-30')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM4-50')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM4-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM5')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSKM6')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM2-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM3-00')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM3-20')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM3-50')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM3-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM4')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM4-30')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM4-50')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM4-80')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM5')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'HOASENGROUP', N'TONHSM6')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK408015')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK408018')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK40802')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK5010015')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK5010018')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK501002')
INSERT [dbo].[Supplies] ([SupplierId], [ProductId]) VALUES (N'VLKHOA', N'XAGCMK5010024')
GO
SET IDENTITY_INSERT [dbo].[WareHouse] ON 

INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (90, 63, CAST(N'2021-02-23T02:44:01.347' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (91, 90, CAST(N'2021-02-23T02:44:01.350' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (92, 45, CAST(N'2021-02-23T02:44:01.360' AS DateTime), N'CATXT')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (93, 55, CAST(N'2021-02-23T02:44:01.360' AS DateTime), N'CATSL')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (94, 39, CAST(N'2021-02-23T02:44:01.363' AS DateTime), N'CATV')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (95, 11, CAST(N'2021-02-23T02:44:01.363' AS DateTime), N'CATDM')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (96, 79, CAST(N'2021-02-23T02:44:01.370' AS DateTime), N'DASMS')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (97, 74, CAST(N'2021-02-23T02:44:01.373' AS DateTime), N'DASMB')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (98, 12, CAST(N'2021-02-23T02:44:01.377' AS DateTime), N'DAS5x7')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (99, 27, CAST(N'2021-02-23T02:44:01.377' AS DateTime), N'DAS4x6')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (100, 53, CAST(N'2021-02-23T02:44:01.380' AS DateTime), N'DAS0x4')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (101, 42, CAST(N'2021-02-23T02:44:01.380' AS DateTime), N'DAS1x2X')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (102, 98, CAST(N'2021-02-23T02:44:01.380' AS DateTime), N'DAS1x2D')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (103, 80, CAST(N'2021-02-23T02:44:01.387' AS DateTime), N'DASST')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (104, 31, CAST(N'2021-02-23T02:44:01.387' AS DateTime), N'DASSTN')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (105, 48, CAST(N'2021-02-23T02:44:01.390' AS DateTime), N'GDN4pt')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (106, 76, CAST(N'2021-02-23T02:44:01.390' AS DateTime), N'GDN4tq')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (107, 93, CAST(N'2021-02-23T02:44:01.390' AS DateTime), N'GDNB100x190x390')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (108, 62, CAST(N'2021-02-23T02:44:01.390' AS DateTime), N'GDNB6L')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (109, 36, CAST(N'2021-02-23T02:44:01.390' AS DateTime), N'HXMHOLCIM')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (110, 42, CAST(N'2021-02-23T02:44:01.393' AS DateTime), N'HXMNGHISON')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (111, 14, CAST(N'2021-02-23T02:44:01.393' AS DateTime), N'HXMHATIEN')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (112, 75, CAST(N'2021-02-23T02:44:01.393' AS DateTime), N'HXMTHANGLONG')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (113, 16, CAST(N'2021-02-23T02:44:01.393' AS DateTime), N'TEPPOMINAD6')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (114, 85, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD8')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (115, 26, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD10')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (116, 21, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD12')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (117, 58, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD14')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (118, 86, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD16')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (119, 32, CAST(N'2021-02-23T02:44:01.397' AS DateTime), N'TEPPOMINAD18')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (120, 29, CAST(N'2021-02-23T02:44:01.400' AS DateTime), N'TEPPOMINAD20')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (121, 50, CAST(N'2021-02-23T02:44:01.403' AS DateTime), N'TEPPOMINAD22')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (122, 65, CAST(N'2021-02-23T02:44:01.403' AS DateTime), N'TEPPOMINAD25')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (123, 91, CAST(N'2021-02-23T02:44:01.403' AS DateTime), N'TEPPOMINAD28')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (124, 17, CAST(N'2021-02-23T02:44:01.403' AS DateTime), N'TEPPOMINAD32')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (125, 57, CAST(N'2021-02-23T02:44:01.407' AS DateTime), N'TEPVIETNHATD6')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (126, 31, CAST(N'2021-02-23T02:44:01.407' AS DateTime), N'TEPVIETNHATD8')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (127, 83, CAST(N'2021-02-23T02:44:01.407' AS DateTime), N'TEPVIETNHATD10')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (128, 55, CAST(N'2021-02-23T02:44:01.407' AS DateTime), N'TEPVIETNHATD12')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (129, 11, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD14')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (130, 53, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD16')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (131, 37, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD18')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (132, 57, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD20')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (133, 74, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD22')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (134, 95, CAST(N'2021-02-23T02:44:01.410' AS DateTime), N'TEPVIETNHATD25')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (135, 16, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TEPVIETNHATD28')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (136, 89, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TEPVIETNHATD32')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (137, 60, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TONHSKM2-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (138, 11, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TONHSKM3-00')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (139, 28, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TONHSKM3-20')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (140, 30, CAST(N'2021-02-23T02:44:01.413' AS DateTime), N'TONHSKM3-50')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (141, 48, CAST(N'2021-02-23T02:44:01.417' AS DateTime), N'TONHSKM3-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (142, 57, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM4')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (143, 52, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM4-30')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (144, 65, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM4-50')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (145, 59, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM4-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (146, 25, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM5')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (147, 38, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSKM6')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (148, 70, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSM2-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (149, 22, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSM3-00')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (150, 89, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSM3-20')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (151, 30, CAST(N'2021-02-23T02:44:01.420' AS DateTime), N'TONHSM3-50')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (152, 87, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM3-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (153, 79, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM4')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (154, 97, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM4-30')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (155, 12, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM4-50')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (156, 77, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM4-80')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (157, 17, CAST(N'2021-02-23T02:44:01.423' AS DateTime), N'TONHSM5')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (158, 73, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'TONHSM6')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (159, 74, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'XAGCMK408015')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (160, 27, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'XAGCMK408018')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (161, 93, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'XAGCMK40802')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (162, 47, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'XAGCMK5010015')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (163, 61, CAST(N'2021-02-23T02:44:01.427' AS DateTime), N'XAGCMK5010018')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (164, 83, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'XAGCMK501002')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (165, 14, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'XAGCMK5010024')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (166, 56, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMVL3030D')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (167, 10, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMVL3030SUGAR')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (168, 21, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMCTL5050DT')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (169, 78, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMCTL5050XC')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (170, 36, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMTT3030CX')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (171, 61, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'GAMPL8080X')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (172, 57, CAST(N'2021-02-23T02:44:01.430' AS DateTime), N'NTVLBC01')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (173, 67, CAST(N'2021-02-23T02:44:01.433' AS DateTime), N'NTVLBC02')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (174, 12, CAST(N'2021-02-23T02:44:01.433' AS DateTime), N'NTVLBC03')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (175, 80, CAST(N'2021-02-23T02:44:01.437' AS DateTime), N'NTVLBC04')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (176, 93, CAST(N'2021-02-23T02:44:01.437' AS DateTime), N'NTVLBT01')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (177, 23, CAST(N'2021-02-23T02:44:01.437' AS DateTime), N'NTVLCB01')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (179, 50, CAST(N'2021-04-10T15:24:26.280' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (180, 45, CAST(N'2021-04-10T15:50:24.297' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (181, 178, CAST(N'2021-04-12T01:07:34.400' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (182, 89, CAST(N'2021-04-12T01:07:34.727' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (183, 176, CAST(N'2021-04-12T01:26:23.863' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (184, 87, CAST(N'2021-04-12T01:26:24.137' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (185, 174, CAST(N'2021-04-12T13:26:56.190' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (186, 85, CAST(N'2021-04-12T13:26:59.767' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (187, 172, CAST(N'2021-04-12T13:29:23.003' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (188, 83, CAST(N'2021-04-12T13:29:26.747' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (189, 162, CAST(N'2021-04-13T14:48:37.663' AS DateTime), N'CATBT1')
GO
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (190, 82, CAST(N'2021-04-13T14:48:38.333' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (191, 10, CAST(N'2021-04-13T14:48:38.337' AS DateTime), N'CATDM')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (192, 160, CAST(N'2021-04-13T15:06:03.247' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (193, 80, CAST(N'2021-04-13T15:06:03.820' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (194, 157, CAST(N'2021-04-15T02:41:50.430' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (195, 79, CAST(N'2021-04-15T02:41:50.443' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (196, 154, CAST(N'2021-04-15T02:49:06.630' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (197, 78, CAST(N'2021-04-15T02:49:06.650' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (198, 151, CAST(N'2021-04-15T05:10:42.693' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (199, 77, CAST(N'2021-04-15T05:10:42.710' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (200, 148, CAST(N'2021-04-15T05:19:17.750' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (201, 76, CAST(N'2021-04-15T05:19:18.057' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (202, 146, CAST(N'2021-04-17T14:02:11.797' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (203, 74, CAST(N'2021-04-17T14:02:13.547' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (204, 144, CAST(N'2021-04-17T14:04:44.127' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (205, 72, CAST(N'2021-04-17T14:04:44.430' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (206, 142, CAST(N'2021-04-17T14:07:57.367' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (207, 70, CAST(N'2021-04-17T14:07:57.637' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (208, 144, CAST(N'2021-04-17T14:10:18.083' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (209, 72, CAST(N'2021-04-17T14:10:18.380' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (212, 66, CAST(N'2021-04-20T01:26:58.233' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (213, 129, CAST(N'2021-04-20T01:26:58.247' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (214, 9, CAST(N'2021-04-20T01:26:58.247' AS DateTime), N'CATDM')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (215, 64, CAST(N'2021-04-26T11:23:10.967' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (216, 124, CAST(N'2021-04-26T11:23:10.983' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (220, 129, CAST(N'2021-05-04T00:07:06.163' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (221, 66, CAST(N'2021-05-04T00:07:06.180' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (225, 109, CAST(N'2021-05-05T01:35:34.407' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (226, 129, CAST(N'2021-05-05T01:45:58.933' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (227, 124, CAST(N'2021-05-05T02:54:21.703' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (228, 129, CAST(N'2021-05-05T02:56:34.977' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (231, 122, CAST(N'2021-05-10T15:52:44.477' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (232, 129, CAST(N'2021-05-10T15:53:00.413' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (234, 117, CAST(N'2021-05-11T14:16:13.270' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (235, 8, CAST(N'2021-05-11T14:16:13.283' AS DateTime), N'CATDM')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (236, 58, CAST(N'2021-05-11T14:16:13.283' AS DateTime), N'CATBT2')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (237, 110, CAST(N'2021-05-12T00:58:58.833' AS DateTime), N'CATBT1')
INSERT [dbo].[WareHouse] ([id], [Quantity], [Date], [ProductId]) VALUES (238, 57, CAST(N'2021-05-12T00:58:58.840' AS DateTime), N'CATBT2')
SET IDENTITY_INSERT [dbo].[WareHouse] OFF
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [isBlocked]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT ((0)) FOR [isBlocked]
GO
ALTER TABLE [dbo].[OrderStatus] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[CheckDetails]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetailsCheck] FOREIGN KEY([CheckId])
REFERENCES [dbo].[Checks] ([CheckId])
GO
ALTER TABLE [dbo].[CheckDetails] CHECK CONSTRAINT [FK_CheckDetailsCheck]
GO
ALTER TABLE [dbo].[CheckDetails]  WITH CHECK ADD  CONSTRAINT [FK_CheckDetailsProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[CheckDetails] CHECK CONSTRAINT [FK_CheckDetailsProduct]
GO
ALTER TABLE [dbo].[Checks]  WITH CHECK ADD  CONSTRAINT [FK_ChecksEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Checks] CHECK CONSTRAINT [FK_ChecksEmployee]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_EmployeesRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_EmployeesRole]
GO
ALTER TABLE [dbo].[ImportDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetailsImport] FOREIGN KEY([ImportId])
REFERENCES [dbo].[Imports] ([ImportId])
GO
ALTER TABLE [dbo].[ImportDetails] CHECK CONSTRAINT [FK_ImportDetailsImport]
GO
ALTER TABLE [dbo].[ImportDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportDetailsProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ImportDetails] CHECK CONSTRAINT [FK_ImportDetailsProduct]
GO
ALTER TABLE [dbo].[Imports]  WITH CHECK ADD  CONSTRAINT [FK_ImportsEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Imports] CHECK CONSTRAINT [FK_ImportsEmployee]
GO
ALTER TABLE [dbo].[Imports]  WITH CHECK ADD  CONSTRAINT [FK_ImportsSupplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Imports] CHECK CONSTRAINT [FK_ImportsSupplier]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsOrder]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetailsProduct]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersCustomer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersCustomer]
GO
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_OrderId]
GO
ALTER TABLE [dbo].[OrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatus_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[OrderStatus] CHECK CONSTRAINT [FK_OrderStatus_Status]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductsCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductsCategory]
GO
ALTER TABLE [dbo].[RefreshTokenCustomer]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshTokenEmployee]  WITH CHECK ADD FOREIGN KEY([employeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_SuppliesProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_SuppliesProduct]
GO
ALTER TABLE [dbo].[Supplies]  WITH CHECK ADD  CONSTRAINT [FK_SuppliesSupplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Supplies] CHECK CONSTRAINT [FK_SuppliesSupplier]
GO
ALTER TABLE [dbo].[WareHouse]  WITH CHECK ADD  CONSTRAINT [FK_WareHouseProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[WareHouse] CHECK CONSTRAINT [FK_WareHouseProduct]
GO
USE [master]
GO
ALTER DATABASE [BuildingMaterialsShop] SET  READ_WRITE 
GO
