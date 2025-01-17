USE [master]
GO
/****** Object:  Database [MWC_Shop_Up]    Script Date: 11/10/2022 12:42:00 PM ******/
CREATE DATABASE [MWC_Shop_Up]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MWC_Shop_Up', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\MWC_Shop_Up.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MWC_Shop_Up_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\MWC_Shop_Up_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MWC_Shop_Up] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MWC_Shop_Up].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MWC_Shop_Up] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET ARITHABORT OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MWC_Shop_Up] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MWC_Shop_Up] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MWC_Shop_Up] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MWC_Shop_Up] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET RECOVERY FULL 
GO
ALTER DATABASE [MWC_Shop_Up] SET  MULTI_USER 
GO
ALTER DATABASE [MWC_Shop_Up] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MWC_Shop_Up] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MWC_Shop_Up] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MWC_Shop_Up] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MWC_Shop_Up] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MWC_Shop_Up] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MWC_Shop_Up', N'ON'
GO
ALTER DATABASE [MWC_Shop_Up] SET QUERY_STORE = OFF
GO
USE [MWC_Shop_Up]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAD] [int] NOT NULL,
	[TenAD] [nvarchar](50) NULL,
	[DiaChiAD] [nvarchar](500) NULL,
	[DienThoaiAD] [varchar](10) NULL,
	[TenDNAD] [nvarchar](50) NULL,
	[MatKhauAD] [nvarchar](50) NULL,
	[NgaysinhAD] [smalldatetime] NULL,
	[GioiTinhAD] [nvarchar](50) NULL,
	[EmailAD] [varchar](50) NULL,
	[QuyenAD] [int] NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[MaAD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDATHANG]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDATHANG](
	[SoDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 3) NULL,
	[ThanhTien]  AS ([SoLuong]*[DonGia]),
 CONSTRAINT [PK_CTDATHANG] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANHMUC_SP]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC_SP](
	[MaDM] [int] NOT NULL,
	[TenDM] [nvarchar](100) NULL,
 CONSTRAINT [PK_DANHMUC_SP] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[TriGia] [decimal](18, 3) NULL,
	[NgayGiaoHang] [smalldatetime] NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[NgayDH] [smalldatetime] NULL,
	[DiaChiNhan] [nvarchar](500) NULL,
	[DienThoaiNhan] [varchar](10) NULL,
	[HTThanhToan] [nvarchar](50) NULL,
	[HTGiaoHang] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiachiKH] [nvarchar](500) NULL,
	[DienThoaiKH] [varchar](10) NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Daduyet] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAISANPHAM]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISANPHAM](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[MaDM] [int] NULL,
 CONSTRAINT [PK_LOAISANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSp] [nvarchar](50) NULL,
	[MoTa] [ntext] NULL,
	[DonGia] [decimal](18, 3) NULL,
	[Hinh] [varchar](50) NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[SoluongBan] [int] NULL,
	[MaDM] [int] NULL,
	[MaLoai] [int] NULL,
	[MaTTSP] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRANGTHAISP]    Script Date: 11/10/2022 12:42:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAISP](
	[MaTTSP] [int] NOT NULL,
	[TenTTSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_TRANGTHAISP] PRIMARY KEY CLUSTERED 
(
	[MaTTSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ADMIN] ([MaAD], [TenAD], [DiaChiAD], [DienThoaiAD], [TenDNAD], [MatKhauAD], [NgaysinhAD], [GioiTinhAD], [EmailAD], [QuyenAD]) VALUES (1, N'DAO VAN THANH', N'Bình Dương', N'0929342783', N'vanthanh1411', N'12345', NULL, N'Nam', N'daothanh1411@gmail.com', 1)
GO
INSERT [dbo].[DANHMUC_SP] ([MaDM], [TenDM]) VALUES (1, N'Quần và Áo')
INSERT [dbo].[DANHMUC_SP] ([MaDM], [TenDM]) VALUES (2, N'Phụ kiện')
INSERT [dbo].[DANHMUC_SP] ([MaDM], [TenDM]) VALUES (3, N'Giày, dép')
GO
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiachiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [Daduyet]) VALUES (1, N'Đào Văn Thanh', N'Bình Dương', N'0929342783', N'vanthanh1411', N'123', CAST(N'2002-12-12T00:00:00' AS SmallDateTime), N'Nam', N'daothanh1411@gmail.com', NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [TenKH], [DiachiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [Daduyet]) VALUES (2, N'ly thi thao', N'Bình Dương', N'1234567789', N'thao123', N'123', CAST(N'2005-12-27T00:00:00' AS SmallDateTime), N'Nữ', N'dao@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
GO
SET IDENTITY_INSERT [dbo].[LOAISANPHAM] ON 

INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (1, N'Quần Short', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (2, N'Quần dài', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (3, N'Áo thun', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (4, N'Áo Polo', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (5, N'Áo khoác', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (6, N'Unisex', 1)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (7, N'Mũ', 2)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (8, N'Balo', 2)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (9, N'Dây nịch', 2)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (10, N'Giày thể thao', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (11, N'Sneaker', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (12, N'Adidas', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (13, N'Jordan', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (14, N'Dép Slide Black', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (15, N'Dép Fancy Emboss Black', 3)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (17, N'Khăn', 2)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (19, N'Túi xách', 2)
INSERT [dbo].[LOAISANPHAM] ([MaLoai], [TenLoai], [MaDM]) VALUES (20, N'Ví', 2)
SET IDENTITY_INSERT [dbo].[LOAISANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (97, N'Quần jean ống suông', N' Quần jean cắt thẳng m&agrave;u xanh với năm t&uacute;i v&agrave; nh&atilde;n hiệu Jacron Sandro dập nổi.<br><br>&bull; Quần jean thẳng nam Sandro<br>&bull; Vải denim $$<br>&bull; 5 t&uacute;i<br>&bull; Da Sandro Da Jacron dập nổi<br>&bull; May denim cotton được sản xuất hữu cơ n&agrave;y được sản xuất bằng c&aacute;ch sử dụng một quy tr&igrave;nh chịu tr&aacute;ch nhiệm sinh th&aacute;i l&agrave;m giảm mức ti&ecirc;u thụ nước bằng 95% v&agrave; hạn chế đ&aacute;ng kể việc sử dụng năng lượng v&agrave; h&oacute;a chất.</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>', CAST(300.000 AS Decimal(18, 3)), N'MEN_Quan_3.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 9, 1, 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (98, N'Quần short organic cotton', N' Quần short với một v&ograve;ng eo d&acirc;y r&uacute;t co gi&atilde;n.<br><br>&bull; Quần short nam Sandro<br>&bull; eo đ&agrave;n hồi<br>&bull; D&acirc;y r&uacute;t.<br>&bull; 2 t&uacute;i b&ecirc;n<br>&bull; 2 t&uacute;i v&aacute; ở mặt sau<br><br>M&ocirc; h&igrave;nh đang mặc cỡ 40 v&agrave; c&aacute;c biện ph&aacute;p 185 cm<br><br>May n&agrave;y được l&agrave;m bằng b&ocirc;ng được sản xuất hữu cơ. Trồng trọt của n&oacute; giảm thiểu ti&ecirc;u thụ nước v&agrave; h&oacute;a chất, l&agrave;m cho n&oacute; trở th&agrave;nh một sản phẩm t&ocirc;n trọng cả hai người v&agrave; m&ocirc;i trường.</p>', CAST(300.000 AS Decimal(18, 3)), N'MEN_Quan_4.jpg', CAST(N'2022-11-08T00:00:00' AS SmallDateTime), 123, 1, 1, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (99, N'Quần short phối thêu', NULL, CAST(300.000 AS Decimal(18, 3)), N'MEN_Quan_5.jpg', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (100, N'Quần jogger phối thêu Sandro', NULL, CAST(300.000 AS Decimal(18, 3)), N'MEN_Quan_6.jpg', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (101, N'Áo thun cotton organic', NULL, CAST(300.000 AS Decimal(18, 3)), N'AO_1.jpg', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (102, N'Áo thun cotton hữu cơ', N'', CAST(400.000 AS Decimal(18, 3)), N'AO_2.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 1, 3, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (103, N'Áo polo thêu họa tiết hoa tulip', N'', CAST(400.000 AS Decimal(18, 3)), N'AO_3.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 12, 1, 4, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (104, N'Áo thun polo thêu hoa bồ công anh', NULL, CAST(400.000 AS Decimal(18, 3)), N'AO_4.jpg', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (105, N'Áo khoác len dài', NULL, CAST(400.000 AS Decimal(18, 3)), N'AO_5.jpg', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (106, N'Áo khoác zip', NULL, CAST(400.000 AS Decimal(18, 3)), N'AO_6.jpg', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (107, N'Áo len thêu hoa tulip', NULL, CAST(400.000 AS Decimal(18, 3)), N'AO_7.jpg', NULL, NULL, 1, 6, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (108, N'Áo len thêu hoa bồ công anh', NULL, CAST(400.000 AS Decimal(18, 3)), N'AO_8.jpg', NULL, NULL, 1, 6, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (109, N'Quần jeans slim-fit', NULL, CAST(400.000 AS Decimal(18, 3)), N'QUAN_1.jpg', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (110, N'Quần jeans thô ống suông hẹp', NULL, CAST(300.000 AS Decimal(18, 3)), N'QUAN_2.jpg', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (111, N'Áo thun họa tiết mặt cười', NULL, CAST(300.000 AS Decimal(18, 3)), N'AO_9.jpg', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (112, N'Áo thun in họa tiết
', NULL, CAST(500.000 AS Decimal(18, 3)), N'AO_10.jpg', NULL, NULL, 1, 3, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (113, N'Áo polo dệt kim
', NULL, CAST(500.000 AS Decimal(18, 3)), N'AO_11.jpg', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (114, N'Áo polo Jacquard', NULL, CAST(500.000 AS Decimal(18, 3)), N'AO_12.jpg', NULL, NULL, 1, 4, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (115, N'Áo khoác len', NULL, CAST(500.000 AS Decimal(18, 3)), N'AO_13.jpg', NULL, NULL, 1, 5, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (116, N'Áo khoác coat len', N'', CAST(500.000 AS Decimal(18, 3)), N'AO_14.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 133, 1, 5, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (117, N'Quần short phối thêu', NULL, CAST(500.000 AS Decimal(18, 3)), N'QUAN_3.jpg', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (121, N'Giày thể thao da', N' Gi&agrave;y thể thao nam Sandro<br>&bull; Gi&agrave;y thể thao da<br>&bull; Cổ thấp<br>&bull; Chất liệu tổng hợp<br>&bull; Chiều cao đế: 3 cm</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>', CAST(500.000 AS Decimal(18, 3)), N'Giay_3.jpg', CAST(N'2022-11-07T00:00:00' AS SmallDateTime), 63, 3, 12, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (122, N'Giày sneaker', N' Gi&agrave;y thể thao nam Sandro<br>&bull; Gi&agrave;y da<br>&bull; Gi&agrave;y buộc d&acirc;y phối logo Sandro<br>&bull; Đế bọc da<br>&bull; Đế cao su</p>
 &nbsp;</p>', CAST(350.000 AS Decimal(18, 3)), N'Sneaker_1.jpg', CAST(N'2022-10-29T00:00:00' AS SmallDateTime), 13, 3, 11, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (126, N'Mũ Hot Stuff', N' Mũ lưỡi trai Hot Stuff<br>&bull; Mũ lưỡi trai Sandro nam<br>&bull; C&oacute; thể điều chỉnh k&iacute;ch cỡ<br>&bull; Sản phẩm n&agrave;y được l&agrave;m từ sợi b&ocirc;ng hữu cơ. Việc sản xuất loại sợi b&ocirc;ng n&agrave;y gi&uacute;p giảm thiểu ti&ecirc;u thụ nước v&agrave; h&oacute;a chất v&agrave; gi&uacute;p cho sản phẩm n&agrave;y th&acirc;n thiện với m&ocirc;i trường v&agrave; con người</p>', CAST(100.000 AS Decimal(18, 3)), N'Mu_1.jpg', CAST(N'2022-10-28T00:00:00' AS SmallDateTime), 1, 2, 7, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (130, N'Quần short Bermuda in họa tiết', N' Quần short Bermuda in họa tiết<br>Quần short Bermuda<br>Lưng co gi&atilde;n<br>Hai t&uacute;i ở hai b&ecirc;n<br>Hai t&uacute;i đắp ở mặt sau<br>Người mẫu mặc size 40 v&agrave; cao 185 cm<br>Sản phẩm n&agrave;y được l&agrave;m bằng viscose c&oacute; tr&aacute;ch nhiệm sinh th&aacute;i. C&aacute;c nh&agrave; thiết kế của ch&uacute;ng t&ocirc;i đ&atilde; chọn sợi n&agrave;y c&oacute; nguồn gốc từ bột gỗ v&igrave; n&oacute; đảm bảo quản l&yacute; rừng bền vững.<br>Reference : SHPBE00034</p>', CAST(300.000 AS Decimal(18, 3)), N'MEN_Quan_1.jpg', CAST(N'2022-11-07T00:00:00' AS SmallDateTime), 1, 1, 1, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (131, N'Quần swim shorts in hoa', N' Quần swim shorts với lưng co gi&atilde;n v&agrave; d&acirc;y r&uacute;t, trang tr&iacute; họa tiết hoa.<br><br>&bull; Quần short bơi in hoa nam Sandro<br>&bull; C&oacute; d&acirc;y r&uacute;t<br>&bull; Lưng quần co gi&atilde;n<br>&bull; 2 t&uacute;i<br>&bull; Quần l&oacute;t lưới b&ecirc;n trong<br>&bull; C&oacute; t&uacute;i sau<br><br>Sản phẩm được l&agrave;m từ c&aacute;c vật liệu t&aacute;i chế, hạn chế ảnh hưởng đến m&ocirc;i trường v&agrave; th&uacute;c đẩy phương ph&aacute;p thời trang tuần ho&agrave;n bền vững.</p>
 &nbsp;</p>', CAST(350.000 AS Decimal(18, 3)), N'MEN_Quan_2.jpg', CAST(N'2022-11-08T00:00:00' AS SmallDateTime), 12, 1, 1, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (133, N'Quần len', N' Quần len nam Sandro<br />
&bull; D&aacute;ng đứng, ống thẳng<br />
&bull; C&oacute; thun ở eo<br />
&bull; T&uacute;i ở ph&iacute;a sau<br />
&nbsp;</p>
', CAST(300.000 AS Decimal(18, 3)), N'QUAN_4.jpg', CAST(N'2022-11-08T00:00:00' AS SmallDateTime), 123, 1, 2, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (139, N'Áo cardigan kẻ viền', N' &Aacute;o cardigan kẻ viền</p>
', CAST(500.000 AS Decimal(18, 3)), N'AO_15.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 25, 1, 3, NULL)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (140, N'Áo cardigan cashmere thêu', N' &Aacute;o cardigan len cashmere c&oacute; n&uacute;t c&agrave;i, tay d&agrave;i v&agrave; th&ecirc;u họa tiết hoa bồ c&ocirc;ng anh.<br><br>&bull; &Aacute;o cardigan nam Sandro.<br>&bull; Len v&agrave; cashmere.<br>&bull; Cổ V.<br>&bull; Tay d&agrave;i.<br>&bull; N&uacute;t c&agrave;i.<br>&bull; H&igrave;nh th&ecirc;u hoa bồ c&ocirc;ng anh</p>
 &nbsp;</p>', CAST(500.000 AS Decimal(18, 3)), N'AO_16.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 123, 1, 3, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (141, N'Áo khoác len', N' &Aacute;o kho&aacute;c nam Sandro<br>&bull; &Aacute;o kho&aacute;c len<br>&bull; Cổ sơ mi<br>&bull; Tay d&agrave;i v&agrave; v&aacute; t&uacute;i ngực c&oacute; vạt<br>&bull; C&agrave;i c&uacute;c<br>&bull; Người mẫu cao 1m80 v&agrave; mặc size S</p>
 &nbsp;</p>', CAST(350.000 AS Decimal(18, 3)), N'AO_17.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 1, 1, 5, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (142, N'Áo khoác len có khóa', N' &Aacute;o kho&aacute;c len cao cổ<br>&bull; &Aacute;o kho&aacute;c nam Sandro<br>&bull; C&oacute; kh&oacute;a k&eacute;o<br>&bull; T&uacute;i c&oacute; ch&oacute;p tr&ograve;n<br>&bull; Người mẫu mặc &aacute;o size M</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>', CAST(450.000 AS Decimal(18, 3)), N'AO_18.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 1, 1, 5, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (143, N'Khăn quàng Alpaca', N' Khăn qu&agrave;ng Alpaca phối patch da Sandro<br><br>&bull; Khăn qu&agrave;ng nam Sandro<br>&nbsp;</p>
 &nbsp;</p>', CAST(79.000 AS Decimal(18, 3)), N'PK_1.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 1, 1, 17, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (144, N'ÁO SƠ MI REGULAR TÚI MỔ ASM117 MÀU BÒ', N'<h1><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14px">&Aacute;O SƠ MI REGULAR T&Uacute;I MỔ ASM117 M&Agrave;U B&Ograve;</span></span></h1>
', CAST(500.000 AS Decimal(18, 3)), N'A0_20.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 12, 1, 3, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (148, N'ÁO POLO SLIMFIT MASC', N' &Aacute;O POLO SLIMFIT MASCULINE PHỐI BO PO094 M&Agrave;U N&Acirc;U NHẠT</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>
 &nbsp;</p>', CAST(200.000 AS Decimal(18, 3)), N'AO_22.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 1, 1, 4, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (149, N'ÁO THUN TAY DÀI REGULAR SỌC GÂN AT114 MÀU ĐEN', N' &Aacute;O THUN TAY D&Agrave;I REGULAR SỌC G&Acirc;N AT114 M&Agrave;U ĐEN</p>
', CAST(340.000 AS Decimal(18, 3)), N'AO_21.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 3, 1, 3, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (150, N'QUẦN TÂY SLIMFIT - CROPPED TÚI NHỎ QT048 MÀU ĐEN', N'<h3><span style="font-size: 12.0pt; font-weight: normal;">QUẦN T&Acirc;Y SLIMFIT - CROPPED T&Uacute;I NHỎ QT048 M&Agrave;U ĐEN</span></h3>', CAST(250.000 AS Decimal(18, 3)), N'QUAN_5.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 3, 1, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (151, N'QUẦN JEANS REGULAR MID - BLUE GEOMETRIC QJ071', N'<p class="MsoNormal" style="mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; line-height: normal; mso-outline-level: 3;"><span style="font-size: 13.5pt; font-family: ''Times New Roman'',serif; mso-fareast-font-family: ''Times New Roman'';">QUẦN JEANS REGULAR MID - BLUE GEOMETRIC QJ071</span></p>', CAST(290.000 AS Decimal(18, 3)), N'QUAN_6.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 4, 1, 2, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (152, N'QUẦN SHORT REGULAR PHỐI SỌC QS038 MÀU BÒ', N'<h3><span style="font-size: 12.0pt; font-weight: normal;">QUẦN SHORT REGULAR PHỐI SỌC QS038 M&Agrave;U B&Ograve;</span></h3>', CAST(300.000 AS Decimal(18, 3)), N'QUAN_7.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 7, 1, 1, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (153, N'ÁO POLO REGULAR LEN SỌC DỆT KIM PO088 MÀU BE', N'<h3><span style="font-size:14px">&Aacute;O POLO REGULAR LEN SỌC DỆT KIM PO088 M&Agrave;U BE</span></h3>
', CAST(300.000 AS Decimal(18, 3)), N'AO_19.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 12, 1, 4, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (154, N'ÁO SƠ MI REGULAR ABSTRACT ASM122 MÀU XÁM ĐẬM', N'<h3><span style="font-size:14px">&Aacute;O SƠ MI REGULAR ABSTRACT ASM122 M&Agrave;U X&Aacute;M ĐẬM</span></h3>
', CAST(300.000 AS Decimal(18, 3)), N'AO_20.jpg', CAST(N'2022-11-09T00:00:00' AS SmallDateTime), 8, 1, 3, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (155, N'Túi tote lớn bằng da', N' T&uacute;i tote nam Sandro<br>&bull; T&uacute;i tote da lớn<br>&bull; In nổi monogram logo Sandro<br>&bull; C&oacute; tay cầm để đeo t&uacute;i tr&ecirc;n vai<br>&bull; Chất liệu da n&agrave;y đến từ xưởng thực hiện c&aacute;c quy tr&igrave;nh an to&agrave;n, chất lượng v&agrave; m&ocirc;i trường tốt nhất&bull; Việc giảm ti&ecirc;u thụ h&oacute;a chất v&agrave; nước l&agrave; ưu ti&ecirc;n h&agrave;ng đầu của ch&uacute;ng t&ocirc;i</p>
 &nbsp;</p>', CAST(250.000 AS Decimal(18, 3)), N'TUI_1.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 45, 2, 19, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (156, N'Túi da trơn nhỏ', N' T&uacute;i da trơn nhỏ<br />
&bull; T&uacute;i nam Sandro<br />
&bull; D&acirc;y đeo vai d&agrave;i c&oacute; thể điều chỉnh<br />
&bull; Chất liệu da n&agrave;y đến từ xưởng thực hiện c&aacute;c quy tr&igrave;nh an to&agrave;n, chất lượng v&agrave; m&ocirc;i trường tốt nhất&bull; Việc giảm ti&ecirc;u thụ h&oacute;a chất v&agrave; nước l&agrave; ưu ti&ecirc;n h&agrave;ng đầu của ch&uacute;ng t&ocirc;i</p>
', CAST(100.000 AS Decimal(18, 3)), N'TUI_2.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 2, 19, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (157, N'Túi da trơn nhỏ', N' T&uacute;i da trơn nhỏ c&oacute; d&acirc;y đeo d&agrave;i<br />
&bull; T&uacute;i da nam Sandro<br />
&bull; D&acirc;y da<br />
&bull; In logo Sandro</p>
', CAST(100.000 AS Decimal(18, 3)), N'TUI_3.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 2, 19, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (158, N'Túi da nhỏ', N' T&uacute;i da nhỏ Sandro<br />
&bull; Họa tiết chữ S nổi<br />
&bull; D&acirc;y đeo d&agrave;i<br />
&bull; D&acirc;y da<br />
&bull; Chất liệu da đến từ xưởng da thực hiện c&aacute;c quy tr&igrave;nh an to&agrave;n, chất lượng v&agrave; m&ocirc;i trường tốt nhất. Việc giảm thiểu c&aacute;c chất h&oacute;a học v&agrave; ti&ecirc;u thụ nước được ưu ti&ecirc;n cao nhất.</p>
', CAST(150.000 AS Decimal(18, 3)), N'TUI_4.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 2, 19, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (159, N'Túi đeo hông da vân cá sấu', N' T&uacute;i đeo h&ocirc;ng nam Sandro<br />
&bull; T&uacute;i đeo h&ocirc;ng da v&acirc;n c&aacute; sấu<br />
&bull; D&acirc;y đeo c&oacute; thể điều chỉnh<br />
&bull; Kh&eacute;o kh&oacute;a zip<br />
&bull; K&iacute;ch thước: 12.5 cm x 21 cm</p>
', CAST(130.000 AS Decimal(18, 3)), N'TUI_5.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 12, 2, 19, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (160, N'Cặp tài liệu da trơn hình Snoopy', N' Cặp t&agrave;i liệu nam Sandro<br />
&bull; Cặp t&agrave;i liệu da trơn<br />
&bull; Kh&oacute;a k&eacute;o zip<br />
&bull; In h&igrave;nh Snoopy print ở ph&iacute;a trước phối logo Sandro<br />
&bull; K&iacute;ch thước: L 33 cm x H 23 cm<br />
&nbsp;</p>
', CAST(100.000 AS Decimal(18, 3)), N'TUI_6.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 12, 2, 19, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (161, N'Túi đựng đồ da', N' T&uacute;i đựng đồ nam Sandro</p>

 &bull; T&uacute;i đựng đồ c&oacute; kh&oacute;a</p>

 &bull; K&iacute;ch thước: 22 x 11 cm</p>

 &bull; Sản phẩm được l&agrave;m từ c&aacute;c vật liệu t&aacute;i chế, hạn chế ảnh hưởng đến m&ocirc;i trường v&agrave; th&uacute;c đẩy phương ph&aacute;p thời trang tuần ho&agrave;n bền vững.</p>
', CAST(150.000 AS Decimal(18, 3)), N'TUI_8.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 11, 2, 19, 4)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (162, N'Giày thể thao', N' Gi&agrave;y thể thao chất liệu tổng hợp v&agrave; h&igrave;nh ng&ocirc;i sao tr&ecirc;n đế<br />
<br />
&bull; Gi&agrave;y thể thao chất liệu tổng hợp cho nữ Sandro<br />
&bull; C&oacute; d&acirc;y buộc<br />
&bull; Đế cao su<br />
&bull; Ng&ocirc;i sao tr&ecirc;n đế c&ugrave;ng t&ocirc;ng m&agrave;u<br />
&bull; Chiều cao đế: 4 cm</p>
', CAST(700.000 AS Decimal(18, 3)), N'GIAY_1.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 13, 3, 10, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (163, N'Giày thể thao Flame', N' Gi&agrave;y nữ Sandro<br />
&bull; Gi&agrave;y thể thao chất liệu tổng hợp<br />
&bull; Đế flame đặc trựng<br />
&bull; Để cao su<br />
&bull; Chiều cao đế: 3 cm<br />
&nbsp;</p>
', CAST(500.000 AS Decimal(18, 3)), N'GIAY_2.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 121, 3, 10, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (164, N'Giày Flame sneaker', N' Gi&agrave;y trainer Sandro<br />
&bull; Chất liệu tổng hợp<br />
&bull; Đế flame đặc trưng<br />
&bull; Chiều cao đế: 3 cm<br />
<br />
&bull; Sản phẩm được l&agrave;m từ c&aacute;c vật liệu t&aacute;i chế, hạn chế ảnh hưởng đến m&ocirc;i trường v&agrave; th&uacute;c đẩy phương ph&aacute;p thời trang tuần ho&agrave;n bền vững.</p>
', CAST(500.000 AS Decimal(18, 3)), N'GIAY_4.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 153, 3, 11, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (165, N'Giày trainer Flame', N' Gi&agrave;y trainer Sandro<br />
&bull; Chất liệu tổng hợp<br />
&bull; Đế flame đặc trưng<br />
&bull; D&acirc;y buộc k&eacute;p<br />
&bull; Chiều cao đế gi&agrave;y: 3 cm<br />
&nbsp;</p>
', CAST(400.000 AS Decimal(18, 3)), N'GIAY_5.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 3, 12, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSp], [MoTa], [DonGia], [Hinh], [NgayCapNhat], [SoluongBan], [MaDM], [MaLoai], [MaTTSP]) VALUES (166, N'Giày trainer Flame', N' Gi&agrave;y trainer Sandro<br />
&bull; Chất liệu tổng hợp<br />
&bull; Đế flame đặc trưng<br />
&bull; D&acirc;y buộc k&eacute;p<br />
&bull; Chiều cao đế: 3 cm<br />
<br />
&nbsp;</p>
', CAST(500.000 AS Decimal(18, 3)), N'GIAY_6.jpg', CAST(N'2022-11-10T00:00:00' AS SmallDateTime), 123, 3, 12, 4)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
INSERT [dbo].[TRANGTHAISP] ([MaTTSP], [TenTTSP]) VALUES (1, N'Sản phẩm mới')
INSERT [dbo].[TRANGTHAISP] ([MaTTSP], [TenTTSP]) VALUES (2, N'Sản phẩm bán chạy')
INSERT [dbo].[TRANGTHAISP] ([MaTTSP], [TenTTSP]) VALUES (3, N'Sản phẩm liên quan')
INSERT [dbo].[TRANGTHAISP] ([MaTTSP], [TenTTSP]) VALUES (4, N'Sản phẩm bình thường')
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [t2] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DONDATHANG] ([SoDH])
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [t2]
GO
ALTER TABLE [dbo].[CTDATHANG]  WITH CHECK ADD  CONSTRAINT [t3] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTDATHANG] CHECK CONSTRAINT [t3]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [fk2] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [fk2]
GO
ALTER TABLE [dbo].[LOAISANPHAM]  WITH CHECK ADD  CONSTRAINT [fk_5] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DANHMUC_SP] ([MaDM])
GO
ALTER TABLE [dbo].[LOAISANPHAM] CHECK CONSTRAINT [fk_5]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [fk_1] FOREIGN KEY([MaTTSP])
REFERENCES [dbo].[TRANGTHAISP] ([MaTTSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [fk_1]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_3] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DANHMUC_SP] ([MaDM])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_3]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [fk_6] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAISANPHAM] ([MaLoai])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [fk_6]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [t1] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [t1]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CO_1] CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CO_1]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [CO_2] CHECK  (([SoluongBan]>=(0)))
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [CO_2]
GO
USE [master]
GO
ALTER DATABASE [MWC_Shop_Up] SET  READ_WRITE 
GO
