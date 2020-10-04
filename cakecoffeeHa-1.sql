
--CREATE DATABASE Website Bán Bánh & Coffee
CREATE DATABASE BanBanh 
GO

--T?o b?ng Lo?i s?n ph?m
go
CREATE TABLE LOAISP
(
	MALOAISP varchar(10) NOT NULL PRIMARY KEY,
	TENLOAISP nvarchar(100) UNIQUE
)
---------------------------------------------
--T?o b?ng s?n ph?m
go
CREATE TABLE SANPHAM
(
	MASP	varchar(10) NOT NULL,
	TENSP	nvarchar(50),
	DVT	nvarchar(20),
	NOISX	varchar(50),
	GIA	int,
	MOTA ntext,
	NGAYCAPNHAT date NULL,
	MALOAISP varchar(10) references LOAISP(MALOAISP),
	HINH varchar(50),
	constraint pk_sp PRIMARY KEY (MASP)	
)
----------------------------------------------
--T?o b?ng User
go
CREATE TABLE USERS
(
	USER_ID varchar(10) PRIMARY KEY, --C?ng là mã khách hàng
	USER_NAME nvarchar(50),
	[PASSWORD] nvarchar(30),
	EMAIL nvarchar(50) UNIQUE,
	SODT varchar(10) UNIQUE,
	DCHI nvarchar(100) UNIQUE,
	Allowed int DEFAULT(1)
)
---------------------------------------------
-- T?o b?ng ??n hàng
go
CREATE TABLE DONHANG
(
	SODH varchar(10) NOT NULL,
	USER_ID varchar(10),
	NGAYDAT smalldatetime,
	NGAYGIAO smalldatetime,
	TONGGIATIEN int,
	constraint pk_hd primary key(SODH),
	foreign key (USER_ID) references USERS(USER_ID)
)
---------------------------------------------
-- T?o b?ng chi ti?t ??n hàng

CREATE TABLE CTDH
(
	SODH varchar(10) NOT NULL,
	MASP varchar(10) NOT NULL,
	SL int,
	THANHTIEN int,
	primary key(SODH, MASP),
	foreign key (SODH) references DONHANG(SODH),
	foreign key (MASP) references SANPHAM(MASP)
)
----------------------------------------------------------
----------------------------------------------------------



