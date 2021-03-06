USE [master]
GO
/****** Object:  Database [ShopMotoBike]    Script Date: 10/2/2021 4:29:44 PM ******/
CREATE DATABASE [ShopMotoBike] 
GO
USE [ShopMotoBike]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/2/2021 4:29:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaHang] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[SoLuongDat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 10/2/2021 4:29:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](60) NOT NULL,
	[MoTa] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/2/2021 4:29:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[MaTK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hang]    Script Date: 10/2/2021 4:29:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NOT NULL,
	[TenHang] [nvarchar](100) NOT NULL,
	[ThuongHieu] [nvarchar](50) NULL,
	[LoaiXe] [nvarchar](100) NULL,
	[GiaTien] [money] NOT NULL,
	[MoTaHang] [ntext] NULL,
	[MauSac] [nvarchar](50) NULL,
	[SoLuong] [int] NOT NULL,
	[Anh] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/2/2021 4:29:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[TenDN] [nvarchar](20) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[Quyen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (1, 1, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (3, 2, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (5, 4, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (14, 3, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (20, 5, 1)
INSERT [dbo].[ChiTietDonHang] ([MaHang], [MaDH], [SoLuongDat]) VALUES (30, 6, 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (1, N'XE NHẬP KHẨU', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (2, N'HONDA', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (3, N'YAMAHA', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (4, N'KYMCO', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [MoTa]) VALUES (5, N'BENELLI', NULL)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (1, CAST(N'2021-01-01 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (2, CAST(N'2021-08-09 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (3, CAST(N'2021-12-06 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (4, CAST(N'2021-03-07 00:00:00.000' AS DateTime), 5)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (5, CAST(N'2021-07-05 00:00:00.000' AS DateTime), 6)
INSERT [dbo].[DonHang] ([MaDH], [NgayDat], [MaTK]) VALUES (6, CAST(N'2021-05-06 00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[Hang] ON 

INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (1, 1, N'HONDA BEAT', N'NHẬP KHẨU', N'XE TAY GA', 35000000.0000, NULL, NULL, 2, N'xe1.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (2, 1, N'HONDA GENIO', N'NHẬP KHẨU', N'XE TAY GA', 36500000.0000, NULL, NULL, 4, N'xe2.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (3, 1, N'HONDA SCOOPY', N'NHẬP KHẨU', N'XE TAY GA', 38500000.0000, NULL, NULL, 2, N'xe3.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (4, 1, N'HONDA SONIC', N'NHẬP KHẨU', N'XE CÔN TAY', 55000000.0000, NULL, NULL, 4, N'xe4.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (5, 1, N'HONDA VARIO 125', N'NHẬP KHẨU', N'XE TAY GA', 39500000.0000, NULL, NULL, 3, N'xe5.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (6, 1, N'HONDA VARIO 150', N'NHẬP KHẨU', N'XE TAY GA', 51000000.0000, NULL, NULL, 2, N'xe6.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (7, 1, N'SUZUKI SATRIA', N'NHẬP KHẨU', N'XE CÔN TAY', 57500000.0000, NULL, NULL, 2, N'xe7.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (8, 1, N'YAMAHA MT-15', N'NHẬP KHẨU', N'XE CÔN TAY', 71000000.0000, NULL, NULL, 3, N'xe8.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (9, 1, N'YAMAHA MX - KING', N'NHẬP KHẨU', N'XE CÔN TAY', 47000000.0000, NULL, NULL, 2, N'xe9.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (10, 1, N'YAMAHA R15', N'NHẬP KHẨU', N'XE CÔN TAY', 71000000.0000, NULL, NULL, 3, N'xe10.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (11, 2, N'AIR BLADE 125', N'HONDA', N'XE TAY GA', 42000000.0000, NULL, NULL, 3, N'xe11.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (12, 2, N'AIR BLADE 150', N'HONDA', N'XE TAY GA', 52500000.0000, NULL, NULL, 2, N'xe12.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (13, 2, N'FUTURE', N'HONDA', N'XE SỐ', 36000000.0000, NULL, NULL, 6, N'xe13.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (14, 2, N'LEAD', N'HONDA', N'XE TAY GA', 43000000.0000, NULL, NULL, 4, N'xe14.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (15, 2, N'SH 125', N'HONDA', N'XE TAY GA', 83500000.0000, NULL, NULL, 3, N'xe15.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (16, 2, N'SH 150', N'HONDA', N'XE TAY GA', 11200000.0000, NULL, NULL, 2, N'xe16.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (17, 2, N'SH MODE', N'HONDA', N'XE TAY GA', 73500000.0000, NULL, NULL, 3, N'xe17.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (18, 2, N'VISION 2021', N'HONDA', N'XE TAY GA', 83500000.0000, NULL, NULL, 3, N'xe18.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (19, 2, N'WAVE ALPHA', N'HONDA', N'XE SỐ', 19000000.0000, NULL, NULL, 2, N'xe19.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (20, 2, N'WAVE BLADE', N'HONDA', N'XE SỐ', 18000000.0000, NULL, NULL, 4, N'xe20.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (21, 2, N'WAVE RSX', N'HONDA', N'XE SỐ', 22300000.0000, NULL, NULL, 4, N'xe21.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (22, 2, N'WINNER X', N'HONDA', N'XE CÔN TAY', 41000000.0000, NULL, NULL, 2, N'xe22.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (23, 2, N'AIR BLADE 125', N'HONDA', N'XE TAY GA', 42000000.0000, NULL, NULL, 5, N'xe23.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (24, 2, N'FUTURE', N'HONDA', N'XE SỐ', 36000000.0000, NULL, NULL, 3, N'xe24.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (25, 2, N'LEAD', N'HONDA', N'XE TAY GA', 43000000.0000, NULL, NULL, 3, N'xe25.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (27, 3, N'ACRUZO', N'YAMAHA', N'XE TAY GA', 34000000.0000, NULL, NULL, 3, N'xe26.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (28, 3, N'EXCITER 150', N'YAMAHA', N'XE CÔN TAY', 46500000.0000, NULL, NULL, 5, N'xe27.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (29, 3, N'EXCITER 155 VVA', N'YAMAHA', N'XE CÔN TAY', 45000000.0000, NULL, NULL, 3, N'xe28.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (30, 3, N'FREEGO', N'YAMAHA', N'XE TAY GA', 33500000.0000, NULL, NULL, 5, N'xe29.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (31, 3, N'GRANDE BLUE CORE HYBRID', N'YAMAHA', N'XE TAY GA', 46000000.0000, NULL, NULL, 2, N'xe30.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (32, 3, N'JANUS', N'YAMAHA', N'XE TAY GA', 31500000.0000, NULL, NULL, 5, N'xe31.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (33, 3, N'JUPITER', N'YAMAHA', N'XE SỐ', 29900000.0000, NULL, NULL, 3, N'xe32.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (34, 4, N'CANDY HERMOSA 50CC', N'KYMCO', N'XE TAY GA', 26500000.0000, NULL, NULL, 5, N'xe33.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (35, 4, N'CANDY HI 50CC', N'KYMCO', N'XE TAY GA', 24500000.0000, NULL, NULL, 4, N'xe34.jpg')
INSERT [dbo].[Hang] ([MaHang], [MaDM], [TenHang], [ThuongHieu], [LoaiXe], [GiaTien], [MoTaHang], [MauSac], [SoLuong], [Anh]) VALUES (36, 4, N'K-PIPE 50CC', N'KYMCO', N'XE CÔN TAY', 22500000.0000, NULL, NULL, 5, N'xe35.jpg')
SET IDENTITY_INSERT [dbo].[Hang] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (2, N'Trần Thị Hằng', N'hang2812', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (3, N'Nguyễn Hà Hương Dịu', N'diu0210', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (4, N'Phạm Thị Hoài', N'hoai123', N'12345678', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (5, N'Hà Thị Huệ', N'hue1234', N'12345', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (6, N'Nguyễn Thị Huyền Trang', N'trang234', N'23456', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
USE [master]
GO
ALTER DATABASE [ShopMotoBike] SET  READ_WRITE 
GO
