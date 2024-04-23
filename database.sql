USE [master]
GO
/****** Object:  Database [QuanLyBanHang]    Script Date: 12/18/2023 10:12:57 AM ******/
CREATE DATABASE [QuanLyBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyBanHang.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLyBanHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyBanHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyBanHang]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungBL] [nvarchar](max) NULL,
	[MaThanhVien] [int] NULL,
	[MaSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[TenSP] [nvarchar](255) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPN] [int] IDENTITY(1,1) NOT NULL,
	[MaPN] [int] NULL,
	[MaSP] [int] NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[MaKH] [int] NULL,
	[UuDai] [int] NULL,
	[DaHuy] [bit] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [nvarchar](255) NULL,
	[MaThanhVien] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
	[Icon] [nvarchar](max) NULL,
	[BiDanh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThanhVien_Quyen]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien_Quyen](
	[MaLoaiTV] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiThanhVien_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](10) NULL,
	[Fax] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](255) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](255) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhap] [datetime] NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[Moi] [int] NULL,
	[MaNCC] [int] NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[DaXoa] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 12/18/2023 10:12:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[MaLoaiTV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1, 1, 1, N'Laptop Lenovo Legion 5 ', 1, CAST(2700000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (2, 1, 5, N'Điện thoại iPhone 15 Pro Max 256GB', 1, CAST(3300000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (3, 2, 1, N'Laptop Lenovo Legion 5 ', 1, CAST(2700000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (4, 3, 13, N'Laptop Lenovo Legion 5 ', 1, CAST(2700000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (5, 4, 9, N'Máy tính bảng Samsung Galaxy', 1, CAST(400000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (6, 5, 7, N'Điện thoại Xiaomi Redmi 12', 2, CAST(4000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] ON 

INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (1, 1, 8, CAST(12000 AS Decimal(18, 0)), 12)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (2, 1, 7, CAST(13000 AS Decimal(18, 0)), 2)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (3, 1, 1, CAST(15900 AS Decimal(18, 0)), 4)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (4, 2, 1, CAST(15000000 AS Decimal(18, 0)), 8)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (5, 3, 21, CAST(50000 AS Decimal(18, 0)), 12)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (6, 4, 18, NULL, 12)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (7, 5, 19, NULL, 9)
INSERT [dbo].[ChiTietPhieuNhap] ([MaChiTietPN], [MaPN], [MaSP], [DonGiaNhap], [SoLuongNhap]) VALUES (8, 6, 19, CAST(50000 AS Decimal(18, 0)), 10)
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (1, CAST(N'2023-11-30 14:36:49.307' AS DateTime), 0, NULL, 0, NULL, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (2, CAST(N'2023-11-30 20:57:25.817' AS DateTime), 0, NULL, 0, 4, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (3, CAST(N'2023-11-30 21:27:42.537' AS DateTime), 1, NULL, 1, 5, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (4, CAST(N'2023-11-30 21:37:12.697' AS DateTime), 0, NULL, 1, 6, 0, 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [MaKH], [UuDai], [DaHuy], [DaXoa]) VALUES (5, CAST(N'2023-12-18 08:14:28.337' AS DateTime), 0, NULL, 0, 7, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1, N'Le Hai Nam', N'Lai Vung', N'lehainam@gmail.com', N'0328297517', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (2, N'Nguyen Van B', N'Cao Lanh', N'vanb@gmail.com', N'0328297618', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (3, N'Nguyen Thi C', N'Tan Hong', N'hong@gmail.com', N'0327816890', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (4, N'Nguyễn Thị D', N'Lai Vung', NULL, NULL, 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (5, N'Dinh Nhut Hao', N'Cao Lãnh', N'nam@gmail.com', N'123456789', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (6, N'Lê Hải Nam', N'Đồng Tháp', N'thanhvien1@gmail.com', N'0328297517', NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (7, N'Lê Hải Nam', N'Đồng Tháp', N'thanhvien1@gmail.com', N'0328297517', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Điện Thoại', N'fa fa-mobile-phone', N'Dien-Thoai')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Laptop', N'fa fa-laptop', N'May-Tinh-Xach-Tay')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (3, N'Máy Tính Bảng', N'fa fa-tablet', N'May-Tinh-Bang')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'Admin', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'Member', 0)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (3, N'Vip', 20)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (4, N'Thường', 10)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'DangKy', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLyDonHang', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLySanPham', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTri', NULL)
INSERT [dbo].[LoaiThanhVien_Quyen] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'QuanLySanPham', NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'Japan', N'abc/abc', N'japan@gmail.com', N'0328297517', N'09982372')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'Bình Chánh', N'123/123 Bình Chính', N'qqwe@gmail.com', N'1232113344', N'12413434')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (3, N'Hàn Quốc', N'123/646 Hàn Quốc', N'korean@gmail.com', N'1231414133', N'12414324')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'Acer', N'Acer_Pro', N'Acer.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (2, N'Asus', N'Asus_Vivobok', N'Asus.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (3, N'Dell', N'Dell Vistro', N'Dell.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (4, N'HP', N'HP_Pro', N'HP.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (5, N'Lenovo', N'Lenovo_Pro', N'Lenovo.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (6, N'MSI', N'MSI_Game', N'MSI.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (7, N'ViVo', N'ViVo', N'ViVo.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (8, N'SamSung', N'SamSung', N'SamSung.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (9, N'Redmi', N'Redmi', N'Redmi.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (10, N'Iphone', N'Iphone', N'Iphone.png')
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (11, N'SamSung Galaxy', N'SamSung_Galaxy', NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (1, 1, NULL, 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (2, 1, NULL, 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (3, 2, CAST(N'2023-12-05 17:41:55.727' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (4, 2, CAST(N'2023-12-05 17:52:09.137' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (5, 2, CAST(N'2023-12-05 18:00:17.937' AS DateTime), 0)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNCC], [NgayNhap], [DaXoa]) VALUES (6, 2, CAST(N'2023-12-05 18:00:29.873' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangKy', N'Đăng ký')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyDonHang', N'Quản lý đơn hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyQuyen', N'Quản Lý Quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLySanPham', N'Quản lý sản phẩm')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quản Trị')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (1, N'Laptop Lenovo Ideapad 4', CAST(23700000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'Lenovo.png', 20, 1, 1, 5, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (2, N'Laptop HP 15s fq5229TU ', CAST(1100000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11 (8U237PA)</p>', N'<p style="color:blue; font-size:20px;">Laptop HP 15s fq5229TU i3 1215U/8GB/512GB/Win11 (8U237PA)</p>', N'HP.png', 12, 1, 2, 4, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (3, N'Laptop Acer Nitro 5', CAST(1700000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Acer Nitro 5 Gaming AN515 57 5669 i5 11400H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QEHSV.001)</p>', N'<p style="color:blue; font-size:20px;">Laptop Acer Nitro 5 Gaming AN515 57 5669 i5 11400H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QEHSV.001)</p>', N'Acer.png', 12, 1, 2, 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (4, N'Laptop Dell Inspiron 15 3520 ', CAST(1200000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Dell Inspiron 15 3520 i3 1215U/8GB/256GB/OfficeHS/Win11 (i3U082W11BLU))</p>', N'<p style="color:blue; font-size:20px;">Laptop Dell Inspiron 15 3520 i3 1215U/8GB/256GB/OfficeHS/Win11 (i3U082W11BLU))</p>', N'Dell.png', 12, 1, 2, 3, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (5, N'Điện thoại iPhone 15 Pro Max 256GB', CAST(33000000 AS Decimal(18, 0)), CAST(N'2023-12-05 00:00:00.000' AS DateTime), N'<p><strong>M&agrave;n h&igrave;nh:</strong> OLED6.7"Super Retina XDR</p>
<p><strong>Hệ điều h&agrave;nh: </strong>iOS 17</p>
<p><strong>Camera sau:</strong> Ch&iacute;nh 48 MP &amp; Phụ 12 MP, 12 MP</p>
<p><strong>Camera trước: </strong>12 MP</p>
<p><strong>Chip:</strong> Apple A17 Pro 6 nh&acirc;n</p>
<p><strong>RAM: </strong>8 GB</p>
<p><strong>Dung lượng lưu trữ: </strong>1 TB</p>
<p><strong>SIM: </strong>1 Nano SIM &amp; 1 eSIMHỗ trợ 5G</p>
<p><strong>Pin, Sạc:</strong> 4422 mAh20 W</p>', N'<h3>Trong thế giới c&ocirc;ng nghệ ng&agrave;y c&agrave;ng ph&aacute;t triển,&nbsp;<a title="Tham khảo iPhone 15 Pro Max 1TB tại Thegioididong.com" href="https://www.thegioididong.com/dtdd/iphone-15-pro-max-1tb" target="_blank" rel="noopener">iPhone 15&nbsp;Pro&nbsp;Max&nbsp;1 TB</a>&nbsp;nổi bật như một điện thoại th&ocirc;ng minh ho&agrave;n hảo, kết hợp sự mạnh mẽ của c&ocirc;ng nghệ v&agrave; sự s&aacute;ng tạo kh&ocirc;ng giới hạn. Chiếc điện thoại n&agrave;y kh&ocirc;ng chỉ đem lại hiệu năng vượt trội m&agrave; c&ograve;n mang đến khả năng chụp ảnh xuất sắc, tạo n&ecirc;n một trải nghiệm ho&agrave;n hảo cho người d&ugrave;ng.</h3>
<h3>Diện mạo sang trọng, cứng c&aacute;p</h3>
<p>iPhone 15 Pro Max&nbsp;1 TB vẫn duy tr&igrave; thiết kế vu&ocirc;ng vắn v&agrave; đẳng cấp đ&atilde; l&agrave;m n&ecirc;n t&ecirc;n tuổi của d&ograve;ng sản phẩm n&agrave;y. Việc giữ nguy&ecirc;n d&aacute;ng vẻ truyền thống kh&ocirc;ng chỉ thể hiện sự sang trọng, thanh lịch m&agrave; c&ograve;n gi&uacute;p người d&ugrave;ng nhận ra ngay lập tức rằng đ&acirc;y l&agrave; một chiếc iPhone.<br>&nbsp;<br>L&agrave; một sự thay đổi quan trọng, iPhone 15 Pro Max&nbsp;1 TB đ&atilde; từ bỏ chất liệu khung th&eacute;p kh&ocirc;ng gỉ quen thuộc để chuyển sang sử dụng khung Titanium. Điều n&agrave;y kh&ocirc;ng chỉ l&agrave;m cho chiếc điện thoại trở n&ecirc;n cứng c&aacute;p hơn m&agrave; c&ograve;n gi&uacute;p giảm khối lượng tổng thể, mang lại sự thoải m&aacute;i hơn khi sử dụng trong thời gian d&agrave;i.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg"><img class=" lazyloaded" title="Thiết kế điện thoại - iPhone 15 Pro Max" src="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg" alt="Thiết kế điện thoại - iPhone 15 Pro Max" data-src="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-102854.jpg"></a></p>
<p>Mặt lưng của iPhone 15 Pro Max&nbsp;1 TB được l&agrave;m từ k&iacute;nh cường lực cao cấp v&agrave; chế tạo theo kiểu nh&aacute;m, tạo n&ecirc;n một vẻ đẹp độc đ&aacute;o v&agrave; tạo điểm nhấn cho thiết kế tổng thể. Đồng thời, vật liệu n&agrave;y cũng l&agrave;m cho chiếc điện thoại trở n&ecirc;n kh&aacute;ng trầy xước v&agrave; hạn chế b&aacute;m v&acirc;n tay tốt hơn.</p>
<p>Dynamic Island l&agrave; một t&iacute;nh năng độc đ&aacute;o tr&ecirc;n iPhone 15 Pro Max&nbsp;1 TB. Đ&acirc;y l&agrave; t&iacute;nh năng hoạt động tr&ecirc;n phần h&igrave;nh notch dạng vi&ecirc;n thuốc của m&agrave;n h&igrave;nh, cho ph&eacute;p người d&ugrave;ng truy cập nhanh c&aacute;c ứng dụng v&agrave; chức năng th&ocirc;ng qua c&aacute;c biểu tượng động. Điều n&agrave;y gi&uacute;p tối ưu h&oacute;a sự tiện lợi v&agrave; tăng hiệu suất của người d&ugrave;ng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103025.jpg"><img class=" lazyloaded" title="Thiết kế điện thoại - iPhone 15 Pro Max" src="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103025.jpg" alt="Thiết kế điện thoại - iPhone 15 Pro Max" data-src="https://cdn.tgdd.vn/Products/Images/42/299033/iphone-15-pro-130923-103025.jpg"></a></p>
<h3>Sử dụng cổng Type-C thay v&igrave; Lightning</h3>
<p>Một trong những sự thay đổi quan trọng nhất trong thiết kế của iPhone 15 Pro Max&nbsp;1 TB l&agrave; việc chuyển từ cổng Lightning quen thuộc sang cổng Type-C ti&ecirc;u chuẩn. Quyết định n&agrave;y đ&aacute;nh dấu sự tiến bộ v&agrave; sự đổi mới của Apple trong việc cung cấp cho người d&ugrave;ng một trải nghiệm kết nối hiện đại v&agrave; linh hoạt hơn.</p>
<p>Xem th&ecirc;m:&nbsp;<a title="USB Type C l&agrave; g&igrave;? C&oacute; ưu nhược điểm g&igrave; so với những USB truyền thống?" href="https://www.thegioididong.com/hoi-dap/usb-type-c-chuan-muc-cong-ket-noi-moi-723760" target="_blank" rel="noopener">USB Type C l&agrave; g&igrave;? C&oacute; ưu nhược điểm g&igrave; so với những USB truyền thống?</a></p>
<p>Với cổng Type-C tr&ecirc;n iPhone 15 Pro Max 1 TB, người d&ugrave;ng c&oacute; thể nhanh ch&oacute;ng chia sẻ dữ liệu, sạc pin v&agrave; kết nối với c&aacute;c phụ kiện m&agrave; họ c&oacute; thể sử dụng hằng ng&agrave;y m&agrave; kh&ocirc;ng cần phải t&igrave;m kiếm c&aacute;p chuyển đổi.</p>', N'Iphone.png', 12, 1, 2, 10, 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (6, N'Samsung Galaxy A05', CAST(4000000 AS Decimal(18, 0)), CAST(N'2023-12-13 00:00:00.000' AS DateTime), N'<p><strong>M&agrave;n h&igrave;nh: </strong>PLS LCD6.7"HD+</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Android 13</p>
<p><strong>Camera sau:</strong> Ch&iacute;nh 50 MP &amp; Phụ 2 MP</p>
<p><strong>Camera trước:</strong> 8 MP</p>
<p><strong>Chip:</strong> MediaTek Helio G85</p>
<p><strong>RAM: </strong>6 GB</p>
<p><strong>Dung lượng lưu trữ: </strong>128 GB</p>
<p><strong>SIM: </strong>2 Nano SIMHỗ trợ 4G</p>
<p><strong>Pin, Sạc:</strong> 5000 mAh25 W</p>', N'<h3><a title="Tham khảo điện thoại Samsung Galaxy A05 tại Thế Giới Di Động" href="https://www.thegioididong.com/dtdd/samsung-galaxy-a05" target="_blank" rel="noopener">Samsung Galaxy A05</a>&nbsp;được ra mắt v&agrave; thu h&uacute;t nhiều sự ch&uacute; &yacute; nhờ c&oacute; mức gi&aacute; b&aacute;n phải chăng nhưng được trang bị bộ cấu h&igrave;nh ổn trong ph&acirc;n kh&uacute;c, nổi bật nhất c&oacute; thể kể đến như m&agrave;n h&igrave;nh k&iacute;ch thước lớn 6.7 inch, camera 50 MP v&agrave; cuối c&ugrave;ng l&agrave; vi&ecirc;n pin khủng cho thời gian sử dụng d&agrave;i l&acirc;u.</h3>
<h3>Ngoại h&igrave;nh trẻ trung hiện đại</h3>
<p>Samsung đ&atilde; cho ra mắt chiếc điện thoại Galaxy A05 với một thiết kế vu&ocirc;ng vức được bo cong ở c&aacute;c g&oacute;c, tạo n&ecirc;n một sự sang trọng v&agrave; hợp thời đầy ấn tượng. Với vẻ ngoại h&igrave;nh thời thượng n&agrave;y, chiếc Galaxy A05 kh&ocirc;ng chỉ g&acirc;y ấn tượng về mặt h&igrave;nh thức m&agrave; c&ograve;n mang lại trải nghiệm cầm nắm l&yacute; tưởng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a050-goccanh.jpg"><img class=" ls-is-cached lazyloaded" title="G&oacute;c cạnh điện thoại - Samsung Galaxy A05 6GB" src="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a050-goccanh.jpg" alt="G&oacute;c cạnh điện thoại - Samsung Galaxy A05 6GB" data-src="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a050-goccanh.jpg"></a></p>
<p>M&aacute;y được l&agrave;m từ chất liệu nhựa cao cấp, gi&uacute;p tạo ra cảm gi&aacute;c cầm nắm nhẹ nh&agrave;ng v&agrave; thoải m&aacute;i trong tay người d&ugrave;ng. Điểm đ&aacute;ng khen l&agrave; điện thoại kh&ocirc;ng c&oacute; trường hợp ọp ẹp khi g&otilde; v&agrave;o mặt lưng, cảm gi&aacute;c như b&ecirc;n trong được l&agrave;m đặc v&agrave; kh&ocirc;ng c&oacute; phần rỗng qu&aacute; nhiều.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a05-270923-112338.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế điện thoại - Samsung Galaxy A05 6GB" src="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a05-270923-112338.jpg" alt="Thiết kế điện thoại - Samsung Galaxy A05 6GB" data-src="https://cdn.tgdd.vn/Products/Images/42/313194/samsung-galaxy-a05-270923-112338.jpg"></a></p>
<p>Mặt lưng của Galaxy A05 được thiết kế theo kiểu nh&aacute;m với c&aacute;c v&acirc;n nổi chạy dọc theo mặt lưng, tạo n&ecirc;n một sự h&agrave;i h&ograve;a v&agrave; sự sang trọng đầy th&uacute; vị. Mặt lưng n&agrave;y kh&ocirc;ng chỉ gi&uacute;p tr&aacute;nh b&aacute;m dấu v&acirc;n tay m&agrave; c&ograve;n tạo th&ecirc;m một lớp độc đ&aacute;o cho thiết kế tổng thể của điện thoại.</p>
<p>Kh&ocirc;ng chỉ l&agrave; một thiết kế đẹp mắt, Galaxy A05 c&ograve;n c&oacute; t&iacute;ch hợp jack tai nghe 3.5 mm, cho ph&eacute;p người d&ugrave;ng thỏa sức thưởng thức &acirc;m nhạc y&ecirc;u th&iacute;ch m&agrave; kh&ocirc;ng cần sử dụng c&aacute;c bộ chuyển đổi phức tạp. Điều n&agrave;y đ&aacute;nh dấu sự lắng nghe v&agrave; quan t&acirc;m đến sự tiện lợi của người d&ugrave;ng từ Samsung.</p>', N'SamSung.png', 12, 1, 2, 8, 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (7, N'Điện thoại Xiaomi Redmi 12', CAST(4000000 AS Decimal(18, 0)), CAST(N'2023-11-04 00:00:00.000' AS DateTime), N'<p><strong>M&agrave;n h&igrave;nh:</strong> IPS LCD6.79"Full HD+</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Android 13</p>
<p><strong>Camera sau:</strong> Ch&iacute;nh 50 MP &amp; Phụ 8 MP, 2 MP</p>
<p><strong>Camera trước:</strong> 8 MP</p>
<p><strong>Chip:</strong> MediaTek Helio G88</p>
<p><strong>RAM:</strong> 4 GB</p>
<p><strong>Dung lượng lưu trữ:</strong> 128 GB</p>', N'<h3>Xiaomi Redmi 12 mẫu điện thoại mới nhất được nh&agrave;&nbsp;<a title="Tham khảo một số mẫu điện thoại Xiaomi tại Thế Giới Di Động " href="https://www.thegioididong.com/dtdd-xiaomi" target="_blank" rel="noopener">Xiaomi</a>&nbsp;tung ra v&agrave;o th&aacute;ng 06/2023 khiến cho cộng đồng đam m&ecirc; c&ocirc;ng nghệ v&ocirc; c&ugrave;ng th&iacute;ch th&uacute;. M&aacute;y kho&aacute;c l&ecirc;n m&igrave;nh một vẻ ngo&agrave;i c&aacute; t&iacute;nh, m&agrave;n h&igrave;nh lớn đem đến trải nghiệm đ&atilde; mắt c&ugrave;ng một hiệu năng ổn định với mọi t&aacute;c vụ.</h3>
<h3>Vẻ ngo&agrave;i đơn giản</h3>
<p>Thiết kế của&nbsp;<a title="Tham khảo một số mẫu điện thoại Xiaomi Redmi 12 4GB tại Thế Giới Di Động " href="https://www.thegioididong.com/dtdd/xiaomi-redmi-12-4gb" target="_blank" rel="noopener">Xiaomi Redmi 12 4GB&nbsp;</a>được lấy cảm hứng từ sự tối giản khi mặt lưng được l&agrave;m từ k&iacute;nh b&oacute;ng bẩy đi c&ugrave;ng với th&acirc;n m&aacute;y kh&aacute; mỏng nhẹ mang đến vẻ ngo&agrave;i thời trang, trẻ trung c&ugrave;ng khả năng cầm nắm tốt hơn khi sử dụng trong thời gian d&agrave;i.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044751.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế đẹp mắt - Xiaomi Redmi 12 4GB" src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044751.jpg" alt="Thiết kế đẹp mắt - Xiaomi Redmi 12 4GB" data-src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044751.jpg"></a></p>
<p>Mặt trước của điện thoại thiết kế kiểu nốt ruồi, đồng thời c&aacute;c viền xung quanh được h&atilde;ng tối ưu kh&aacute; mỏng hứa hẹn mang đến cho bạn g&oacute;c nh&igrave;n rộng hơn gi&uacute;p việc giải tr&iacute; trở n&ecirc;n trọn vẹn.</p>
<h3>M&agrave;n h&igrave;nh lớn giải tr&iacute; vui</h3>
<p>Với mong muốn đem lại sự thư gi&atilde;n sau giờ l&agrave;m việc căng thẳng hoặc một g&oacute;c nh&igrave;n r&otilde; r&agrave;ng sắc n&eacute;t hơn. Xiaomi đ&atilde; trang bị tấm nền IPS LCD với k&iacute;ch thước l&ecirc;n đến 6.79 inch&nbsp;c&ugrave;ng độ ph&acirc;n giải Full HD+ (1080 x 2460 Pixels)&nbsp;gi&uacute;p bạn xem c&aacute;c nội dung tr&ecirc;n YouTube hoặc Netflix tốt hơn. M&agrave;n h&igrave;nh n&agrave;y cho chất lượng hiển thị tốt, m&agrave;u sắc ch&acirc;n thực, độ tương phản cao v&agrave; g&oacute;c nh&igrave;n rộng.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044750.jpg"><img class=" ls-is-cached lazyloaded" title="M&agrave;n h&igrave;nh sắc n&eacute;t - Xiaomi Redmi 12 4GB" src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044750.jpg" alt="M&agrave;n h&igrave;nh sắc n&eacute;t - Xiaomi Redmi 12 4GB" data-src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-190523-044750.jpg"></a></p>
<p>Redmi 12 hiển thị h&igrave;nh ảnh kh&aacute; tốt khi ở ngo&agrave;i trời nắng, kh&ocirc;ng bị mờ khi m&aacute;y c&oacute; độ s&aacute;ng tối đa l&ecirc;n đến 550 nits một con số ổn trong ph&acirc;n kh&uacute;c. Ngo&agrave;i ra, m&agrave;n h&igrave;nh n&agrave;y c&ograve;n được hỗ trợ tần số qu&eacute;t 90 Hz gi&uacute;p cho c&aacute;c thao t&aacute;c vuốt chạm tr&ecirc;n m&aacute;y được diễn ra mượt m&agrave; v&agrave; nhanh ch&oacute;ng hơn.</p>
<h3>Trải nghiệm ổn định với c&aacute;c t&aacute;c vụ thường ng&agrave;y</h3>
<p>Cung cấp sức mạnh cho m&aacute;y l&agrave; chip xử l&yacute; Helio G88 đến từ nh&agrave; MediaTek, c&oacute; tốc độ xử l&yacute; 2.0 GHz cho khả năng xử l&yacute; kh&aacute; ổn định v&agrave; mượt m&agrave; với c&aacute;c t&aacute;c vụ lướt web, nghe nhạc, xem phim, chỉnh sửa ảnh,&hellip; thậm ch&iacute; bạn c&oacute; thể chơi với c&aacute;c tựa game như: Li&ecirc;n Qu&acirc;n Mobile, PUBG Mobile ở mức cấu h&igrave;nh tầm trung.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-cpu.jpeg"><img class=" lazyloaded" title="Hiệu năng mượt m&agrave; - Xiaomi Redmi 12" src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-cpu.jpeg" alt="Hiệu năng mượt m&agrave; - Xiaomi Redmi 12" data-src="https://cdn.tgdd.vn/Products/Images/42/307556/xiaomi-redmi-12-4gb-cpu.jpeg"></a></p>
<p><a title="Tham khảo một số mẫu điện thoại RAM 4 GB tại Thế Giới Di Động " href="https://www.thegioididong.com/dtdd-ram-4gb" target="_blank" rel="noopener">Điện thoại RAM 4 GB</a> tuy mức RAM kh&ocirc;ng qu&aacute; cao nhưng h&atilde;ng cũng đ&atilde; t&iacute;ch hợp t&iacute;nh năng mở rộng RAM n&ecirc;n vấn đề đa nhiệm tr&ecirc;n m&aacute;y kh&ocirc;ng c&ograve;n qu&aacute; bận t&acirc;m nữa. Khi c&aacute;c thao t&aacute;c chuyển đổi qua lại giữa tab kh&ocirc;ng phải đợi load lại cũng như gặp hiện tượng giật lag.</p>
<p><strong>SIM:</strong> 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G</p>
<p><strong>Pin, Sạc:</strong> 5000 mAh18 W</p>', N'Redmi.png', 12, 1, 2, 9, 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (8, N'Điện thoại vivo Y17', CAST(400000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Điện thoại vivo Y17</p>', N'<p style="color:blue; font-size:20px;">Điện thoại vivo Y17</p>', N'ViVo.png', 12, 1, 2, 7, 1, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (9, N'Samsung Galaxy Tab A9+', CAST(7490000 AS Decimal(18, 0)), CAST(N'2023-12-01 00:00:00.000' AS DateTime), N'<p style="color: blue; font-size: 20px;">&nbsp;</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 11"TFT LCD</p>
<p><strong>Hệ điều h&agrave;nh: </strong>Android 13</p>
<p><strong>Chip:</strong> Snapdragon 695</p>
<p><strong>RAM:</strong> 4 GB</p>
<p><strong>Dung lượng lưu trữ:</strong> 64 GB</p>
<p><strong>Kết nối: </strong>5GC&oacute; nghe gọi</p>
<p><strong>SIM: </strong>1 Nano SIM</p>
<p><strong>Camera sau:</strong> 8 MP</p>
<p><strong>Camera trước:</strong> 5 MP</p>
<p><strong>Pin, Sạc: </strong>7040 mAh15 W</p>
<p>&nbsp;</p>', N'<h3>Với gi&aacute; cả phải chăng,&nbsp;<a title="Tham khảo Samsung Galaxy Tab A9+ 5G tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-a9-plus-5g" target="_blank" rel="noopener">Samsung Galaxy Tab A9+ 5G</a>&nbsp;l&agrave; một sản phẩm m&aacute;y t&iacute;nh bảng của Samsung d&agrave;nh cho người d&ugrave;ng muốn sở hữu một thiết bị giải tr&iacute; cơ bản với m&agrave;n h&igrave;nh rộng v&agrave; khả năng kết nối mạng to&agrave;n diện để truy cập internet bất kỳ l&uacute;c n&agrave;o v&agrave; ở bất kỳ đ&acirc;u.</h3>
<h3>Ngoại h&igrave;nh sang trọng, cứng c&aacute;p</h3>
<p>Thiết kế của Galaxy Tab A9+ 5G đem đến một sự tươi mới v&agrave; tinh tế. M&aacute;y sở hữu một ngoại h&igrave;nh hiện đại v&agrave; thanh lịch với mặt lưng phẳng v&agrave; khung kim loại. C&aacute;c g&oacute;c bo tr&ograve;n mềm mại l&agrave;m cho m&aacute;y c&oacute; sự đối lập với những đường n&eacute;t phẳng phiu n&ecirc;n tr&ocirc;ng kh&aacute; th&uacute; vị.&nbsp;</p>
<p>Vỏ ngo&agrave;i của Galaxy Tab A9+&nbsp;5G&nbsp;được l&agrave;m từ kim loại, tạo n&ecirc;n một vẻ ngo&agrave;i sang trọng v&agrave; đẳng cấp. Chất liệu kim loại cung cấp sự cứng c&aacute;p v&agrave; độ bền cho m&aacute;y t&iacute;nh bảng, gi&uacute;p tăng th&ecirc;m độ bền bỉ để hạn chế hư hại cho va đập. Đặc biệt, việc l&agrave;m nh&aacute;m bề mặt n&agrave;y gi&uacute;p ngăn m&aacute;y trượt tay v&agrave; mang lại cảm gi&aacute;c thoải m&aacute;i khi cầm m&aacute;y.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103947.jpg"><img class=" ls-is-cached lazyloaded" title="Thiết kế m&aacute;y t&iacute;nh bảng - Samsung Galaxy Tab A9+ 5G" src="https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103947.jpg" alt="Thiết kế m&aacute;y t&iacute;nh bảng - Samsung Galaxy Tab A9+ 5G" data-src="https://cdn.tgdd.vn/Products/Images/522/315390/samsung-galaxy-tab-a9-251023-103947.jpg"></a></p>
<p>Galaxy Tab A9+ 5G c&oacute; sự đa dạng trong lựa chọn m&agrave;u sắc, bao gồm X&aacute;m, Bạc v&agrave; Xanh Navy. Điều n&agrave;y cho ph&eacute;p người d&ugrave;ng thể hiện c&aacute; t&iacute;nh của họ th&ocirc;ng qua m&agrave;u sắc y&ecirc;u th&iacute;ch. C&aacute;c t&ugrave;y chọn m&agrave;u sắc n&agrave;y mang đến sự đa dạng v&agrave; th&uacute; vị trong việc t&ugrave;y chỉnh m&aacute;y t&iacute;nh bảng theo phong c&aacute;ch c&aacute; nh&acirc;n.</p>', N'Galaxy1.png', 12, 1, 3, 11, 3, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (10, N'Samsung Galaxy Tab S9', CAST(950000 AS Decimal(18, 0)), CAST(N'2023-12-01 00:00:00.000' AS DateTime), N'<p style="color: blue; font-size: 20px;">&nbsp;</p>
<p style="color: blue; font-size: 20px;">&nbsp;</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 11"TFT LCD</p>
<p><strong>Hệ điều h&agrave;nh: </strong>Android 13</p>
<p><strong>Chip:</strong> Snapdragon 695</p>
<p><strong>RAM:</strong> 4 GB</p>
<p><strong>Dung lượng lưu trữ:</strong> 64 GB</p>
<p><strong>Kết nối: </strong>5GC&oacute; nghe gọi</p>
<p><strong>SIM: </strong>1 Nano SIM</p>
<p><strong>Camera sau:</strong> 8 MP</p>
<p><strong>Camera trước:</strong> 5 MP</p>
<p><strong>Pin, Sạc: </strong>7040 mAh15 W</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', N'<p style="color: blue; font-size: 20px;">&nbsp;</p>
<h3>Tại sự kiện Unpacked 2023 Samsung đ&atilde; cho ra mắt&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S9+ 5G 256GB tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-s9-plus-5g" target="_blank" rel="noopener">Samsung Galaxy Tab S9+ 5G 256GB</a>&nbsp;với hiệu năng mạnh mẽ, m&agrave;n h&igrave;nh hiển thị sắc n&eacute;t v&agrave; l&agrave; m&aacute;y t&iacute;nh bảng đầu ti&ecirc;n của h&atilde;ng được trang bị kh&aacute;ng nước.</h3>
<h3>Vẻ ngo&agrave;i đẹp mắt xứng danh flagship</h3>
<p>Galaxy Tab S9+ 5G mang trong m&igrave;nh lối thiết kế của người đ&agrave;n anh Galaxy Tab S8+, tuy nhi&ecirc;n điểm kh&aacute;c biệt l&agrave; ở cụm camera sau v&agrave; viền d&agrave;i, được l&agrave;m mờ để tạo cảm gi&aacute;c dịu d&agrave;ng hơn.</p>
<p>Galaxy Tab S9+ 5G&nbsp;được ho&agrave;n thiện nguy&ecirc;n khối, mang đến sự chắc chắn v&agrave; sang trọng khi cầm nắm v&agrave; sử dụng. Đồng thời Samsung đ&atilde; tối ưu v&agrave; tinh chỉnh ở ph&iacute;a trước, gi&uacute;p c&aacute;c cạnh viền mỏng hơn, mang lại g&oacute;c nh&igrave;n rộng r&atilde;i để dễ d&agrave;ng quan s&aacute;t.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg"><img class=" ls-is-cached lazyloaded" title="Vẻ ngo&agrave;i đẹp mắt - Samsung Galaxy Tab S9+ 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg" alt="Vẻ ngo&agrave;i đẹp mắt - Samsung Galaxy Tab S9+ 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg"></a></p>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Samsung tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-samsung">Samsung</a> tập trung v&agrave;o việc mang đến cho kh&aacute;ch h&agrave;ng một sản phẩm thanh lịch v&agrave; mỏng nhẹ. Với độ mỏng chỉ 5.7 mm v&agrave; trọng lượng nhẹ 581 g, Galaxy Tab S9+ 5G gi&uacute;p cầm nắm dễ d&agrave;ng v&agrave; thao t&aacute;c trở n&ecirc;n thoải m&aacute;i hơn.</p>
<p>&nbsp;</p>', N'Galaxy4.png', 12, 1, 3, 11, 3, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (11, N'Samsung Galaxy Tab S9+ 5G', CAST(24900000 AS Decimal(18, 0)), CAST(N'2023-12-01 00:00:00.000' AS DateTime), N'<p style="color: blue; font-size: 20px;">&nbsp;</p>
<p style="color: blue; font-size: 20px;">&nbsp;</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 11"TFT LCD</p>
<p><strong>Hệ điều h&agrave;nh: </strong>Android 13</p>
<p><strong>Chip:</strong> Snapdragon 695</p>
<p><strong>RAM:</strong> 4 GB</p>
<p><strong>Dung lượng lưu trữ:</strong> 64 GB</p>
<p><strong>Kết nối: </strong>5GC&oacute; nghe gọi</p>
<p><strong>SIM: </strong>1 Nano SIM</p>
<p><strong>Camera sau:</strong> 8 MP</p>
<p><strong>Camera trước:</strong> 5 MP</p>
<p><strong>Pin, Sạc: </strong>7040 mAh15 W</p>
<p>&nbsp;</p>
<p>&nbsp;</p>', N'<p style="color: blue; font-size: 20px;">&nbsp;</p>
<h3>Tại sự kiện Unpacked 2023 Samsung đ&atilde; cho ra mắt&nbsp;<a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Samsung Galaxy Tab S9+ 5G 256GB tại Thế Giới Di Động" href="https://www.thegioididong.com/may-tinh-bang/samsung-galaxy-tab-s9-plus-5g" target="_blank" rel="noopener">Samsung Galaxy Tab S9+ 5G 256GB</a>&nbsp;với hiệu năng mạnh mẽ, m&agrave;n h&igrave;nh hiển thị sắc n&eacute;t v&agrave; l&agrave; m&aacute;y t&iacute;nh bảng đầu ti&ecirc;n của h&atilde;ng được trang bị kh&aacute;ng nước.</h3>
<h3>Vẻ ngo&agrave;i đẹp mắt xứng danh flagship</h3>
<p>Galaxy Tab S9+ 5G mang trong m&igrave;nh lối thiết kế của người đ&agrave;n anh Galaxy Tab S8+, tuy nhi&ecirc;n điểm kh&aacute;c biệt l&agrave; ở cụm camera sau v&agrave; viền d&agrave;i, được l&agrave;m mờ để tạo cảm gi&aacute;c dịu d&agrave;ng hơn.</p>
<p>Galaxy Tab S9+ 5G&nbsp;được ho&agrave;n thiện nguy&ecirc;n khối, mang đến sự chắc chắn v&agrave; sang trọng khi cầm nắm v&agrave; sử dụng. Đồng thời Samsung đ&atilde; tối ưu v&agrave; tinh chỉnh ở ph&iacute;a trước, gi&uacute;p c&aacute;c cạnh viền mỏng hơn, mang lại g&oacute;c nh&igrave;n rộng r&atilde;i để dễ d&agrave;ng quan s&aacute;t.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg"><img class=" ls-is-cached lazyloaded" title="Vẻ ngo&agrave;i đẹp mắt - Samsung Galaxy Tab S9+ 5G 256GB" src="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg" alt="Vẻ ngo&agrave;i đẹp mắt - Samsung Galaxy Tab S9+ 5G 256GB" data-src="https://cdn.tgdd.vn/Products/Images/522/311074/samsung-galaxy-tab-s9-plus-5g-260723-101153.jpg"></a></p>
<p><a title="Tham khảo một số mẫu m&aacute;y t&iacute;nh bảng Samsung tại Thế Giới Di Động " href="https://www.thegioididong.com/may-tinh-bang-samsung">Samsung</a> tập trung v&agrave;o việc mang đến cho kh&aacute;ch h&agrave;ng một sản phẩm thanh lịch v&agrave; mỏng nhẹ. Với độ mỏng chỉ 5.7 mm v&agrave; trọng lượng nhẹ 581 g, Galaxy Tab S9+ 5G gi&uacute;p cầm nắm dễ d&agrave;ng v&agrave; thao t&aacute;c trở n&ecirc;n thoải m&aacute;i hơn.</p>
<p>&nbsp;</p>', N'Galaxy2.png', 12, 1, 3, 11, 3, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (12, N'Laptop Lenovo Legion 4 ', CAST(27000000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'Lenovo.png', 12, 1, 1, 5, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (13, N'Laptop Lenovo Legion 7 ', CAST(25000000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'Lenovo.png', 12, 1, 1, 5, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (14, N'Laptop Lenovo Legion 5 ', CAST(23200000 AS Decimal(18, 0)), CAST(N'2023-11-21 00:00:00.000' AS DateTime), N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'<p style="color:blue; font-size:20px;">Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN)</p>', N'Lenovo.png', 12, 1, 1, 5, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (17, N'Laptop Lenovo Ideapad 3', CAST(13000000 AS Decimal(18, 0)), CAST(N'2023-12-04 00:00:00.000' AS DateTime), N'<p><strong>CPU:</strong> i51240P1.7GHz</p>
<p><strong>RAM:</strong> 16 GBLPDDR4X (Onboard)4267 MHz</p>
<p><strong>Ổ cứng: </strong>512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1 TB)</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 14"QHD (2160 x 1440)</p>
<p><strong>Card m&agrave;n h&igrave;nh:</strong> Card t&iacute;ch hợpIntel Iris Xe</p>
<p><strong>Cổng kết nối:</strong> HDMI2 x Thunderbolt 42 x USB 3.2Jack tai nghe 3.5 mm</p>
<p><strong>Đặc biệt:</strong> C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Windows 11 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại</p>
<p><strong>K&iacute;ch thước, khối lượng:</strong> D&agrave;i 321 mm - Rộng 210.8 mm - D&agrave;y 15.9 mm - Nặng 1.2 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2022</p>', N'<h3><a title="Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN) đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop/lenovo-ideapad-3-15iau7-i3-82rk005lvn" target="_blank" rel="noopener">Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN)</a>&nbsp;đ&atilde; trở th&agrave;nh một người bạn đồng h&agrave;nh đắc lực, c&ugrave;ng m&igrave;nh giải quyết mọi vấn đề trong c&ocirc;ng việc cũng như học tập nhờ hiệu năng mạnh mẽ đến từ bộ vi xử l&yacute; Intel thế hệ 12 t&acirc;n tiến.</h3>
<h3>M&agrave;n h&igrave;nh lớn l&agrave;m việc th&ecirc;m chuy&ecirc;n nghiệp hơn</h3>
<p>K&iacute;ch thước m&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch</strong>&nbsp;với độ ph&acirc;n giải&nbsp;<strong>Full HD</strong>&nbsp;gi&uacute;p c&aacute;c chi tiết hiển thị tr&ecirc;n m&agrave;n h&igrave;nh được r&otilde; r&agrave;ng, sắc n&eacute;t. Tấm nền&nbsp;<strong>TN</strong>&nbsp;cho tốc độ phản hồi nhanh ch&oacute;ng hơn, đồng thời hạn chế tối đa hiện tượng nhức mỏi mắt nhờ c&ocirc;ng nghệ chống ch&oacute;i&nbsp;<strong>Anti Glare</strong>.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/287769/lenovo-ideapad-3-15iau7-i3-82rk005lvn-270223-110807.jpg"><img class=" ls-is-cached lazyloaded" title="Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN) - M&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/287769/lenovo-ideapad-3-15iau7-i3-82rk005lvn-270223-110807.jpg" alt="Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN) - M&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/287769/lenovo-ideapad-3-15iau7-i3-82rk005lvn-270223-110807.jpg"></a></p>
<p>M&agrave;n h&igrave;nh c&oacute; độ s&aacute;ng&nbsp;<strong>250 nits</strong>&nbsp;n&ecirc;n khi sử dụng m&aacute;y trong m&ocirc;i trường văn ph&ograve;ng hoặc ph&ograve;ng ri&ecirc;ng trong nh&agrave;, nội dung vẫn được hiển thị r&otilde; n&eacute;t nhưng khi m&igrave;nh d&ugrave;ng ở những nơi c&oacute; độ s&aacute;ng cao như ngo&agrave;i qu&aacute;n c&agrave; ph&ecirc; sẽ hơi tối một ch&uacute;t.&nbsp;</p>
<p>Những th&ocirc;ng số m&agrave;n h&igrave;nh đo đạc bằng Spyder 5 Pro được&nbsp;<strong>61% sRGB</strong>,&nbsp;<strong>45% Adobe RGB</strong>&nbsp;v&agrave;&nbsp;<strong>45% DCI-P3</strong> vẫn ph&ugrave; hợp với nhu cầu sử dụng thường ng&agrave;y của m&igrave;nh đối với c&aacute;c t&aacute;c vụ học tập v&agrave; l&agrave;m việc văn ph&ograve;ng, lướt web v&agrave; xem phim giải tr&iacute; nhưng sẽ kh&ocirc;ng đủ chuẩn x&aacute;c nếu bạn c&oacute; nhu cầu l&agrave;m việc với h&igrave;nh ảnh hoặc thiết kế đồ họa.</p>', N'Lenovo1.png', 12, 1, 1, 5, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (18, N'Laptop Acer TravelMate P4', CAST(13000000 AS Decimal(18, 0)), CAST(N'2023-12-07 00:00:00.000' AS DateTime), N'<p><strong>CPU:</strong> i51240P1.7GHz</p>
<p><strong>RAM:</strong> 16 GBLPDDR4X (Onboard)4267 MHz</p>
<p><strong>Ổ cứng: </strong>512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1 TB)</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 14"QHD (2160 x 1440)</p>
<p><strong>Card m&agrave;n h&igrave;nh:</strong> Card t&iacute;ch hợpIntel Iris Xe</p>
<p><strong>Cổng kết nối:</strong> HDMI2 x Thunderbolt 42 x USB 3.2Jack tai nghe 3.5 mm</p>
<p><strong>Đặc biệt:</strong> C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Windows 11 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại</p>
<p><strong>K&iacute;ch thước, khối lượng:</strong> D&agrave;i 321 mm - Rộng 210.8 mm - D&agrave;y 15.9 mm - Nặng 1.2 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2022</p>', N'<h3>Một sự lựa chọn mới mẻ nằm trong ph&acirc;n kh&uacute;c&nbsp;<a title="Tham khảo c&aacute;c mẫu laptop học tập - văn ph&ograve;ng tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=hoc-tap-van-phong" target="_blank" rel="noopener">laptop học tập - văn ph&ograve;ng</a>&nbsp;tầm trung, ph&ugrave; hợp với mọi đối tượng người d&ugrave;ng từ sinh vi&ecirc;n đến người đi l&agrave;m.&nbsp;<a title="Tham khảo Laptop Acer TravelMate P4 TMP414 51 50HX i5 1135G7 (NX.VP2SV.00T) tại thegiodidong.com" href="https://www.thegioididong.com/laptop/acer-travelmate-p4-tmp414-51-50hx-i5-nxvp2sv00t" target="_blank" rel="noopener">Laptop Acer TravelMate P4 TMP414 51 50HX i5 1135G7&nbsp;(NX.VP2SV.00T)</a>&nbsp;với hiệu năng ổn định từ con chip Intel i5, ổ cứng SSD 512 GB, đ&aacute;p ứng đầy đủ mọi nhu cầu bạn cần.</h3>
<p>&bull;&nbsp;<a title="Tham khảo c&aacute;c mẫu laptop tại thegiodidong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">Laptop</a>&nbsp;được trang bị bộ vi xử l&yacute;&nbsp;<strong>Intel Core i5 1135G7&nbsp;</strong>kết hợp c&ugrave;ng card&nbsp;<strong>Intel Iris Xe Graphics</strong>&nbsp;mang đến hiệu suất xử l&yacute; mượt m&agrave; đối với c&aacute;c t&aacute;c vụ doanh nghiệp, học tập tr&ecirc;n Word, Excel, PowerPoint,... đồng thời th&ocirc;ng số kỹ thuật tr&ecirc;n vẫn đủ để bạn giải tr&iacute; vui vẻ với tựa game hot như LOL.</p>
<p>&bull;&nbsp;<strong>RAM&nbsp;8 GB</strong>&nbsp;được hỗ trợ n&acirc;ng l&ecirc;n tối đa&nbsp;<strong>32 GB</strong>&nbsp;cho ph&eacute;p bạn mở c&ugrave;ng l&uacute;c h&agrave;ng chục tab Chrome, vừa l&agrave;m việc vừa nghe nhạc thư gi&atilde;n, chuyển qua lại giữa c&aacute;c ứng dụng m&agrave; kh&ocirc;ng gặp độ trễ qu&aacute; l&acirc;u.</p>
<p>&bull; Ổ cứng&nbsp;<strong>SSD 512 GB NVMe PCIe</strong>&nbsp;gi&uacute;p khởi động hệ thống, ứng dụng nhanh ch&oacute;ng chỉ trong v&agrave;i gi&acirc;y, bạn cũng c&oacute; thể dễ d&agrave;ng n&acirc;ng dung lượng l&ecirc;n 1 TB bằng c&aacute;ch th&aacute;o lắp thanh kh&aacute;c, mở rộng khả năng lưu trữ t&agrave;i liệu, h&igrave;nh ảnh,...</p>
<p>&bull; Giải tr&iacute;, l&agrave;m việc với khung h&igrave;nh&nbsp;<strong>14 inch&nbsp;</strong>hiển thị đầy đủ đa nội dung, độ ph&acirc;n giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;cũng mang đến h&igrave;nh ảnh r&otilde; n&eacute;t khi trải nghiệm với phim ảnh v&agrave; video. M&aacute;y c&ograve;n hỗ trợ bạn duy tr&igrave; hiệu suất l&agrave;m việc ổn định v&agrave; &iacute;t bị nhức mỏi mắt hơn với c&ocirc;ng nghệ giảm ch&oacute;i s&aacute;ng&nbsp;<strong>Acer ComfyView.</strong></p>
<p>&bull; N&acirc;ng cao trải nghiệm &acirc;m thanh với c&ocirc;ng nghệ&nbsp;<strong>Acer Purified Voice</strong>&nbsp;v&agrave;&nbsp;<strong>Acer TrueHarmony</strong>&nbsp;gi&uacute;p t&aacute;i tạo c&aacute;c dải &acirc;m chi tiết, trầm bổng cho những giờ ph&uacute;t giải tr&iacute; th&ecirc;m th&uacute; vị.</p>
<p>&bull;&nbsp;<a title="Tham khảo c&aacute;c mẫu laptop Acer tại thegiodidong.com" href="https://www.thegioididong.com/laptop-acer" target="_blank" rel="noopener">Laptop Acer</a>&nbsp;được phủ với lớp&nbsp;<strong>sơn xanh</strong>&nbsp;trầm, đường n&eacute;t thanh mảnh c&ugrave;ng khối lượng nhẹ nh&agrave;ng chỉ&nbsp;<strong>1.4 kg</strong>, linh động mang theo mọi nơi. Th&ecirc;m v&agrave;o đ&oacute;, b&agrave;n ph&iacute;m c&ograve;n được t&iacute;ch hợp th&ecirc;m&nbsp;<strong>đ&egrave;n nền đơn sắc</strong>, dễ d&agrave;ng soạn thảo văn bản hay nhập số liệu ch&iacute;nh x&aacute;c trong b&oacute;ng tối.</p>
<p>&bull; T&iacute;nh năng&nbsp;<strong>bảo mật v&acirc;n tay</strong> đảm bảo an to&agrave;n cho quyền ri&ecirc;ng tư của người d&ugrave;ng hơn với thao t&aacute;c đăng nhập đơn giản bằng 1 chạm. M&aacute;y cũng hỗ trợ đầy đủ c&aacute;c cổng kết nối th&ocirc;ng dụng như USB Type-C, Jack tai nghe 3.5 mm, USB 3.2, HDMI, khe Micro SD v&agrave; LAN (RJ45).</p>', N'Acer4.png', 13, 1, 3, 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (19, N'Laptop Acer Aspire 3 A315 58', CAST(12000000 AS Decimal(18, 0)), CAST(N'2023-12-27 00:00:00.000' AS DateTime), N'<p><strong>CPU:</strong> i51240P1.7GHz</p>
<p><strong>RAM:</strong> 16 GBLPDDR4X (Onboard)4267 MHz</p>
<p><strong>Ổ cứng: </strong>512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1 TB)</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 14"QHD (2160 x 1440)</p>
<p><strong>Card m&agrave;n h&igrave;nh:</strong> Card t&iacute;ch hợpIntel Iris Xe</p>
<p><strong>Cổng kết nối:</strong> HDMI2 x Thunderbolt 42 x USB 3.2Jack tai nghe 3.5 mm</p>
<p><strong>Đặc biệt:</strong> C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Windows 11 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại</p>
<p><strong>K&iacute;ch thước, khối lượng:</strong> D&agrave;i 321 mm - Rộng 210.8 mm - D&agrave;y 15.9 mm - Nặng 1.2 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2022</p>', N'<h3>Nếu đang t&igrave;m kiếm một chiếc&nbsp;<a title="M&aacute;y t&iacute;nh laptop văn ph&ograve;ng, sinh vi&ecirc;n ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop?g=hoc-tap-van-phong" target="_blank" rel="noopener">laptop học tập - văn ph&ograve;ng</a>&nbsp;sở hữu thiết kế thanh lịch, hiện đại c&ugrave;ng th&ocirc;ng số cấu h&igrave;nh đủ mạnh để vận h&agrave;nh mượt m&agrave; c&aacute;c t&aacute;c vụ c&ocirc;ng việc th&igrave;&nbsp;<a title="Acer Aspire 3 A315 58 54XF i5 1135G7 (NX.AM0SV.007) đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop/acer-aspire-3-a315-58-54xf-i5-nxam0sv007" target="_blank" rel="noopener">laptop&nbsp;Acer Aspire 3 A315 58 54XF i5 (NX.AM0SV.007)</a>&nbsp;l&agrave; sự lựa chọn l&yacute; tưởng d&agrave;nh cho bạn.</h3>
<p>&bull;&nbsp;<a title="M&aacute;y t&iacute;nh laptop Acer Aspire ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-acer-aspire" target="_blank" rel="noopener">Laptop Acer Aspire</a>&nbsp;được trang bị bộ vi xử l&yacute;&nbsp;<strong>Intel Core i5 1135G7</strong>&nbsp;mang đến sức mạnh vượt trội c&oacute; thể xử l&yacute; nhanh gọn c&aacute;c t&aacute;c vụ học tập, văn ph&ograve;ng tr&ecirc;n Word, Excel, PowerPoint,...&nbsp;</p>
<p>&bull;&nbsp;Card t&iacute;ch hợp&nbsp;<strong>Intel Iris Xe</strong>&nbsp;hỗ trợ bạn xử l&yacute; mượt m&agrave; c&aacute;c t&aacute;c vụ về đồ họa như thiết kế PowerPoint, chỉnh sửa h&igrave;nh ảnh tr&ecirc;n Photoshop, Canva,... cũng như giải tr&iacute; chơi một số tựa game MOBA ở mức cấu h&igrave;nh trung b&igrave;nh.</p>
<p>&bull;&nbsp;<a title="Laptop, m&aacute;y t&iacute;nh x&aacute;ch tay RAM 8 GB đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-8-gb" target="_blank" rel="noopener">Laptop RAM&nbsp;8 GB</a>&nbsp;đảm bảo đa nhiệm trơn tru, bạn c&oacute; thể n&acirc;ng cấp l&ecirc;n tối đa&nbsp;<strong>12 GB</strong>&nbsp;để chạy những ứng dụng nặng. Ổ cứng&nbsp;<strong>SSD 512 GB</strong>&nbsp;cung cấp kh&ocirc;ng gian đủ lớn để bạn lưu trữ mọi t&agrave;i liệu học tập v&agrave; l&agrave;m việc, tối ưu để tốc độ mở m&aacute;y v&agrave; ứng dụng đều nhanh chỉ trong v&agrave;i gi&acirc;y.</p>
<p>&bull; M&agrave;n h&igrave;nh&nbsp;<strong>15.6 inch</strong>&nbsp;độ ph&acirc;n giải&nbsp;<strong>Full HD (1920 x 1080)</strong>&nbsp;hiển thị h&igrave;nh ảnh sắc n&eacute;t, độ chi tiết cao. Tấm nền&nbsp;<strong>TFT</strong>&nbsp;v&agrave;&nbsp;kết hợp c&ugrave;ng c&ocirc;ng nghệ&nbsp;<strong>LED Backlit</strong>&nbsp;v&agrave;&nbsp;<strong>Acer ComfyView</strong>&nbsp;cho bạn trải nghiệm giải tr&iacute; trọn vẹn, m&agrave;u sắc được thể hiện ch&acirc;n thực, sống động, kh&ocirc;ng bị ch&oacute;i khi sử dụng ở những nơi c&oacute; &aacute;nh s&aacute;ng cao.</p>
<p>&bull;&nbsp;<a title="M&aacute;y t&iacute;nh laptop Acer ch&iacute;nh h&atilde;ng đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-acer" target="_blank" rel="noopener">Laptop Acer</a>&nbsp;sở hữu c&ocirc;ng nghệ &acirc;m thanh&nbsp;<strong>Stereo speakers</strong>&nbsp;cho bạn tận hưởng chất &acirc;m to r&otilde;, mạnh mẽ, thể hiện được từng chi tiết hay h&agrave;nh động của một bộ phim.</p>
<p>&bull;&nbsp;<a title="C&aacute;c sản phẩm laptop hiện đang kinh doanh tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">Laptop</a>&nbsp;c&oacute; thiết kế&nbsp;<strong>vỏ nhựa</strong>&nbsp;sơn&nbsp;<strong>m&agrave;u v&agrave;ng</strong>&nbsp;tạo vẻ sang trọng, khối lượng&nbsp;<strong>1.7 kg</strong>&nbsp;vẫn c&oacute; thể bỏ gọn v&agrave;o balo mang theo đi học, đi l&agrave;m.&nbsp;</p>
<p>&bull; Đa dạng c&aacute;c cổng kết nối như USB 2.0, Jack tai nghe 3.5 mm, USB 3.2, HDMI, LAN (RJ45) đ&aacute;p ứng mọi nhu cầu kết nối với thiết bị ngoại vi của bạn.</p>', N'Acer3.png', 20, 1, 3, 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (20, N'Laptop Acer Aspire 3 A314 35', CAST(7990000 AS Decimal(18, 0)), CAST(N'2023-12-07 00:00:00.000' AS DateTime), N'<p><strong>CPU:</strong> i51240P1.7GHz</p>
<p><strong>RAM:</strong> 16 GBLPDDR4X (Onboard)4267 MHz</p>
<p><strong>Ổ cứng: </strong>512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1 TB)</p>
<p><strong>M&agrave;n h&igrave;nh:</strong> 14"QHD (2160 x 1440)</p>
<p><strong>Card m&agrave;n h&igrave;nh:</strong> Card t&iacute;ch hợpIntel Iris Xe</p>
<p><strong>Cổng kết nối:</strong> HDMI2 x Thunderbolt 42 x USB 3.2Jack tai nghe 3.5 mm</p>
<p><strong>Đặc biệt:</strong> C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Windows 11 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại</p>
<p><strong>K&iacute;ch thước, khối lượng:</strong> D&agrave;i 321 mm - Rộng 210.8 mm - D&agrave;y 15.9 mm - Nặng 1.2 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2022</p>', N'<h3><a title="Xem th&ecirc;m laptop Acer Aspire 3 A341 35 P3G9 N6000 (NX.A7SSV.007) đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop/acer-aspire-3-a314-35-p3g9-n6000-nxa7ssv007" target="_blank" rel="noopener">Laptop Acer Aspire 3 A314 35 P3G9&nbsp;(NX.A7SSV.007)</a>&nbsp;l&agrave; chiếc m&aacute;y ph&ugrave; hợp với học sinh, sinh vi&ecirc;n với thiết kế mỏng nhẹ v&agrave; hiệu năng ổn định của chip Intel v&agrave; card t&iacute;ch hợp tr&ecirc;n m&aacute;y đ&aacute;p ứng tốt c&aacute;c nhu cầu cơ bản hằng ng&agrave;y của một chiếc&nbsp;<a title="Xem th&ecirc;m laptop học tập - văn ph&ograve;ng đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop?g=hoc-tap-van-phong" target="_blank" rel="noopener">laptop học tập - văn ph&ograve;ng</a>.</h3>
<p>&bull;&nbsp;<a title="Xem th&ecirc;m laptop Acer đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop-acer" target="_blank" rel="noopener">Laptop Acer</a>&nbsp;được trang bị&nbsp;<strong>CPU Intel Pentium N6000</strong>&nbsp;cho hiệu năng tốt c&ugrave;ng card m&agrave;n h&igrave;nh t&iacute;ch hợp&nbsp;<strong>Intel UHD Graphics</strong>&nbsp;gi&uacute;p chiếc m&aacute;y vận h&agrave;nh tiết kiệm điện năng nhưng vẫn đảm bảo ổn định c&aacute;c ứng dụng như Word, Excel, PowerPoint,...</p>
<p>&bull;&nbsp;<strong>RAM 4 GB</strong>&nbsp;cho khả năng đa nhiệm c&aacute;c t&aacute;c vụ tốt c&ugrave;ng&nbsp;<strong>SSD 256 GB</strong>&nbsp;tăng tốc độ truy xuất dữ liệu, khởi động ứng dụng v&agrave; m&aacute;y t&iacute;nh nhanh ch&oacute;ng.</p>
<p>&bull; Diện mạo&nbsp;<a title="Xem th&ecirc;m laptop đang b&aacute;n tại thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">laptop</a>&nbsp;được ho&agrave;n thiện bằng lớp&nbsp;<strong>vỏ nhựa</strong>, tạo n&ecirc;n tổng thể h&agrave;i ho&agrave; gi&uacute;p chiếc m&aacute;y chỉ vỏn vẹn&nbsp;<strong>1.45 kg</strong>&nbsp;v&agrave; d&agrave;y&nbsp;<strong>19.9 mm</strong>, kh&aacute;&nbsp;nhỏ gọn v&agrave; tiện lợi để mang theo b&ecirc;n người.</p>
<p>&bull;&nbsp;<a title="Xem th&ecirc;m laptop Acer Aspire đang b&aacute;n tại thegioidiong.com" href="https://www.thegioididong.com/laptop-acer-aspire" target="_blank" rel="noopener">Laptop Acer Aspire</a>&nbsp;c&oacute; m&agrave;n h&igrave;nh&nbsp;<strong>14 inch</strong>, độ ph&acirc;n giải&nbsp;<strong>HD (1366 x 768)</strong>&nbsp;cho chất lượng hiển thị r&otilde; r&agrave;ng đi k&egrave;m c&ocirc;ng nghệ&nbsp;<strong>TFT</strong>,&nbsp;<strong>LED Blacklit</strong>,&nbsp;<strong>Acer ComfyView</strong>&nbsp;giảm t&igrave;nh trạng ch&oacute;i, lo&aacute;, &aacute;nh s&aacute;ng xanh, bảo vệ thị gi&aacute;c người d&ugrave;ng.</p>
<p>&bull; Đa dạng cổng kết nối tiện lợi cho người d&ugrave;ng để kết nối với thiết bị ngoại vi như 2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0.</p>
<p>&bull; C&ocirc;ng nghệ &acirc;m thanh&nbsp;<strong>Stereo speakers</strong> gi&uacute;p t&aacute;i tạo &acirc;m thanh tốt, mang lại trải nghiệm nghe nhạc hay hơn với &acirc;m thanh di chuyển giữa 2 loa.</p>', N'Acer2.png', 1, 1, 3, 1, 2, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhap], [CauHinh], [MoTa], [HinhAnh], [SoLuongTon], [Moi], [MaNCC], [MaNSX], [MaLoaiSP], [DaXoa]) VALUES (21, N'Laptop Acer Swift 3', CAST(18490000 AS Decimal(18, 0)), CAST(N'2023-12-10 00:00:00.000' AS DateTime), N'<p>CPU: i51240P1.7GHz</p>
<p>RAM: 16 GBLPDDR4X (Onboard)4267 MHz</p>
<p>Ổ cứng: 512 GB SSD NVMe PCIe (C&oacute; thể th&aacute;o ra, lắp thanh kh&aacute;c tối đa 1 TB)</p>
<p><strong>M&agrave;n h&igrave;nh: </strong>14"QHD (2160 x 1440)</p>
<p><strong>Card m&agrave;n h&igrave;nh:</strong> Card t&iacute;ch hợpIntel Iris Xe</p>
<p><strong>Cổng kết nối:</strong> HDMI2 x Thunderbolt 42 x USB 3.2Jack tai nghe 3.5 mm</p>
<p><strong>Đặc biệt:</strong> C&oacute; đ&egrave;n b&agrave;n ph&iacute;m</p>
<p><strong>Hệ điều h&agrave;nh:</strong> Windows 11 Home SL</p>
<p><strong>Thiết kế: </strong>Vỏ kim loại</p>
<p><strong>K&iacute;ch thước, khối lượng:</strong> D&agrave;i 321 mm - Rộng 210.8 mm - D&agrave;y 15.9 mm - Nặng 1.2 kg</p>
<p><strong>Thời điểm ra mắt: </strong>2022</p>', N'<h3><a title="Acer Swift 3 SF314 512 56QN i5 1240P (NX.K0FSV.002) đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002" target="_blank" rel="noopener">Laptop Acer Swift 3 SF314 512 56QN i5 (NX.K0FSV.002)</a>&nbsp;l&agrave; một t&acirc;n binh đ&aacute;ng gờm trong ph&acirc;n kh&uacute;c&nbsp;<a title="M&aacute;y t&iacute;nh laptop văn ph&ograve;ng, sinh vi&ecirc;n ch&iacute;nh h&atilde;ng, trả g&oacute;p 0% đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop?g=hoc-tap-van-phong" target="_blank" rel="noopener">laptop học tập - văn ph&ograve;ng</a>&nbsp;khi sở hữu sức mạnh vượt trội đến từ con chip Intel Gen 12 t&acirc;n tiến c&ugrave;ng ngoại h&igrave;nh mang phong c&aacute;ch tối giản, hiện đại.</h3>
<h3>Ngoại h&igrave;nh tối giản tạo sự hiện đại</h3>
<p><a title="Laptop | M&aacute;y t&iacute;nh x&aacute;ch tay Gi&aacute; rẻ, Trả g&oacute;p 0% đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop" target="_blank" rel="noopener">Laptop</a>&nbsp;được thiết kế gọn nhẹ với khung&nbsp;<strong>vỏ kim loại</strong>&nbsp;phủ&nbsp;<strong>m&agrave;u bạc</strong>&nbsp;trang nh&atilde;, cho m&igrave;nh cảm gi&aacute;c cứng c&aacute;p khi sờ v&agrave;o, đồng thời cũng rất m&aacute;t v&agrave; sướng tay. M&aacute;y c&oacute; khối lượng nhẹ chỉ&nbsp;<strong>1.2 kg</strong>&nbsp;mang t&iacute;nh di động cao, m&igrave;nh c&oacute; thể bỏ vừa v&agrave;o balo mang theo khi đi học, đi l&agrave;m. Logo &ldquo;<strong>Acer</strong>&rdquo; thay v&igrave; nằm ch&iacute;nh giữa nắp lưng nay đ&atilde; được bố tr&iacute; l&ecirc;n vị tr&iacute; ph&iacute;a cạnh tr&ecirc;n, tạo sự mới mẻ, tr&ocirc;ng gọn g&agrave;ng v&agrave; cũng bắt mắt hơn.</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032024.jpg"><img class=" ls-is-cached lazyloaded" title="Acer Swift 3 SF314 512 56QN i5 1240P - Thiết kế" src="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032024.jpg" alt="Acer Swift 3 SF314 512 56QN i5 1240P - Thiết kế" data-src="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032024.jpg"></a></p>
<p>Viền m&agrave;n h&igrave;nh của m&aacute;y được thiết kế mỏng ở hai cạnh b&ecirc;n, tuy nhi&ecirc;n hai cạnh tr&ecirc;n v&agrave; dưới lại tương đối d&agrave;y nhưng đối với m&igrave;nh n&oacute; lại gi&uacute;p m&igrave;nh tr&aacute;nh được c&aacute;c t&aacute;c động từ b&ecirc;n ngo&agrave;i, hạn chế hư hỏng khi m&igrave;nh v&ocirc; t&igrave;nh l&agrave;m va đập m&aacute;y.&nbsp;</p>
<p><a class="preventdefault" href="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032023.jpg"><img class=" ls-is-cached lazyloaded" title="Acer Swift 3 SF314 512 56QN i5 1240P - Thiết kế m&agrave;n h&igrave;nh" src="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032023.jpg" alt="Acer Swift 3 SF314 512 56QN i5 1240P - Thiết kế m&agrave;n h&igrave;nh" data-src="https://cdn.tgdd.vn/Products/Images/44/285765/acer-swift-3-sf314-512-56qn-i5-nxk0fsv002-100922-032023.jpg"></a></p>
<p><strong>Cảm biến v&acirc;n tay</strong>&nbsp;được t&iacute;ch hợp tr&ecirc;n n&uacute;t nguồn gi&uacute;p m&igrave;nh mở kh&oacute;a m&aacute;y nhanh ch&oacute;ng, đồng thời c&oacute; thể thay thế cho mật khẩu để đăng nhập v&agrave;o c&aacute;c trang web hoặc ứng dụng một c&aacute;ch thuận tiện hơn.</p>
<p>B&agrave;n ph&iacute;m của&nbsp;<a title="Laptop, m&aacute;y t&iacute;nh Acer Swift ch&iacute;nh h&atilde;ng, gi&aacute; rẻ đang kinh doanh tại Thegioididong.com" href="https://www.thegioididong.com/laptop-acer-swift" target="_blank" rel="noopener">laptop Acer Swift</a>&nbsp;c&oacute; bố cục r&uacute;t gọn, c&aacute;c ph&iacute;m được thiết kế rộng r&atilde;i, h&agrave;nh tr&igrave;nh ph&iacute;m tương đối s&acirc;u v&agrave; độ nảy ổn định, hơn nữa c&ograve;n c&oacute;&nbsp;<strong>đ&egrave;n nền</strong> mang lại cho m&igrave;nh trải nghiệm soạn thảo văn bản thoải m&aacute;i, &ecirc;m tay. B&agrave;n di chuột được Acer ho&agrave;n thiện tốt, cảm gi&aacute;c chạm, vuốt rất mượt m&agrave; v&agrave; sướng tay. Tuy nhi&ecirc;n k&iacute;ch thước hơi nhỏ n&ecirc;n khi m&igrave;nh di vuốt sẽ kh&ocirc;ng thể cuộn được hết một trang web.</p>', N'Acer1.png', 12, 1, 3, 1, 2, 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (1, N'Admin', N'123456', N'Lê Hải Nam', N'Đồng Tháp', N'thanhvien1@gmail.com', N'0328297517', N'câu 1', N'abc', 1)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (2, N'Member', N'123456', N'Lê Hải Nam', N'Đồng Tháp', N'thanhvien1@gmail.com', N'0328297517', N'câu 1', N'abc', 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (3, N'Thanhvin2', N'123456', N'Lê Hải Nam', N'Đồng Tháp', N'thanhvien1@gmail.com', N'0328297517', N'câu 1', N'abc', 3)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (4, N'ThanhVien3', N'123456', N'Lê Phi Giao', N'Đồng Tháp', N'thanhvien#@gmail.com', N'0328297517', N'câu 1', N'abc', 4)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (5, N'hainam10989', N'123456', N'Nam', N'Cao Lãnh', N'hainam@gmail.com', N'0328297517', N'câu 2', N'ác', 1)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPha,] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPha,]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_ThanhVien]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_LoaiThanhVien]
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen]  WITH CHECK ADD  CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[LoaiThanhVien_Quyen] CHECK CONSTRAINT [FK_LoaiThanhVien_Quyen_Quyen]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
USE [master]
GO
ALTER DATABASE [QuanLyBanHang] SET  READ_WRITE 
GO
