/*
Created		9/29/2021
Modified		9/30/2021
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/
create database ShopMotoBike
go
use ShopMotoBike
go

Create table [DanhMuc]
(
	[MaDM] Integer Identity NOT NULL,
	[TenDM] Nvarchar(60) NOT NULL,
	[MoTa] Ntext NULL,
Primary Key ([MaDM])
) 
go

Create table [Hang]
(
	[MaHang] Integer Identity NOT NULL,
	[MaDM] Integer NOT NULL,
	[TenHang] Nvarchar(100) NOT NULL,
	[ThuongHieu] Nvarchar(50) NULL,
	[LoaiXe] Nvarchar(100) NULL,
	[GiaTien] Money NOT NULL,
	[MoTaHang] Ntext NULL,
	[MauSac] Nvarchar(50) NULL,
	[SoLuong] Integer NOT NULL,
	[Anh] Nvarchar(50) NULL,
Primary Key ([MaHang])
) 
go

Create table [DonHang]
(
	[MaDH] Integer Identity NOT NULL,
	[NgayDat] Datetime NOT NULL,
	[MaTK] Integer NOT NULL,
Primary Key ([MaDH])
) 
go

Create table [ChiTietDonHang]
(
	[MaHang] Integer NOT NULL,
	[MaDH] Integer NOT NULL,
	[SoLuongDat] Integer NOT NULL,
Primary Key ([MaHang],[MaDH])
) 
go

Create table [TaiKhoan]
(
	[MaTK] Integer Identity NOT NULL,
	[HoTen] Nvarchar(30) NOT NULL,
	[TenDN] Nvarchar(20) NOT NULL,
	[MatKhau] Nvarchar(30) NOT NULL,
	[Quyen] Bit NOT NULL,
Primary Key ([MaTK])
) 
go


Alter table [Hang] add  foreign key([MaDM]) references [DanhMuc] ([MaDM])  on update no action on delete no action 
go
Alter table [ChiTietDonHang] add  foreign key([MaHang]) references [Hang] ([MaHang])  on update no action on delete no action 
go
Alter table [ChiTietDonHang] add  foreign key([MaDH]) references [DonHang] ([MaDH])  on update no action on delete no action 
go
Alter table [DonHang] add  foreign key([MaTK]) references [TaiKhoan] ([MaTK])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


