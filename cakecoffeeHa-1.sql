
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

--Code t?o d? li?u
go
INSERT INTO LOAISP (MALOAISP, TENLOAISP)
VALUES
	('LSP1', 'DIET'),
	('LSP2', 'BIRTHDAY'),
	('LSP3', 'CUPCAKE'),
	('LSP4', 'DRINK'),
	('LSP5', 'COMBO');
go
	
INSERT INTO SANPHAM (MASP, TENSP, DVT, NOISX, GIA, MOTA, NGAYCAPNHAT, MALOAISP, HINH)
VALUES
	('SP1', 'High Fiber Bread', N'?', 'Lappetit', 75000, N'High Fiber ???c làm t? b?t mì thô giàu 
	ch?t x? c?a ??c v?i hàm l??ng ch?t x? cao, nhi?u h?t dinh d??ng', '2019-10-22', 'LSP1', 'm1.jpg'),

	('SP2', 'Rye Caraway Bagels', N'túi', 'Lappetit', 160000, N'Rye Bagel ???c làm t? b?t mì ?en, 
	thêm b?t mì protein cao và h?t thì là ba t? n?i ti?ng', '2019-10-23', 'LSP1', 'm2.jpg'),
	
	('SP3', 'Mocha Hazelnut Chiffon Cake ', N'cái', 'Lappetit', 250000, N'???c làm t? b?t bánh Chiffon th??ng h?ng
	k?t h?p cùng v? th?m béo c?a h?t d?', '2019-10-28', 'LSP2', 'm3.jpg'),
	
	('SP4', 'Crown Birthday Cake ', N'cái', 'Lappetit', 690000, N'Bánh Sinh Nh?t Cao T?ng V??ng Mi?n
	 sang ch?nh v?i bánh bông lan m?n x?p cùng l?p kem m?m m?n', '2019-10-22', 'LSP2', 'm4.jpg'),
	
	('SP5', 'American Apple Pie ', N'cái', 'Lappetit', 398000, N'Chi?c bánh th?m ngon v?i l?p v? ngoài giòn r?m
	 k?t h?p v?i nhân bánh táo m?m m?m ??c tr?ng c?a táo M?.', '2019-10-22', 'LSP2', 'm2.jpg'),
	
	('SP6', 'BlueBerry Coffee Cake', N'cái', 'Lappetit', 400000, N'Chi?c bánh v? ngoài giòn r?m k?t h?p v?i
	 nh?ng trái vi?t qu?t c?ng m?ng ??c tr?ng khi?n th?c khách nh? mãi.', '2019-11-5', 'LSP2', 's2.jpg'),
	
	('SP7', 'Orange Cranbery Tart', N'cái', 'Lappetit', 355000, N'Bánh Tart Cam làm món ??c tr?ng c?a Lappetit. 
	V?i h??ng v? th?m mát c?a cam k?t h?p v?i v?n bánh Cookie tr?i ??u trên b? m?t ??p m?t', '2019-10-25', 'LSP2', 's7.jpg'),
	
	('SP8', 'Red Velvet Cupcake', N'cup', 'Lappetit', 38000, N'Red Velvet Cupcake v?i ch?t bánh m?m m?i ???c làm t?
	tinh ch?t Dâu ngâm nhi?u tháng, cho ra n??c Dâu th?m l?ng và an toàn cho th?c khách', '2019-10-24', 'LSP3', 's3.jpg'),
	
	('SP9', 'Vanilla Cupcake', N'cup', 'Lappetit', 38000, N'Vanila Cupcake v?i ch?t bánh m?m m?i ???c làm t? tinh ch?t 
	trái Vani ngâm nhi?u tháng, cho ra n??c Vani th?m và an toàn cho th?c khách', '2019-10-25', 'LSP3', 's4.jpg'),
	
	('SP10', 'Latte', N'ly', 'Lappetit', 45000, N'Mang h??ng v? th?m ngon t? cà phê Ý
	 và v? th?m béo t? s?a t?o nên th?c u?ng tuy?t v?i này', '2019-10-22', 'LSP4', 's8.jpg'),
	 
	('SP11', 'Mango Sorbet', N'ly', 'Lappetit', 40000, N'V? chua ng?t thanh mát c?a trái xoài chín m?ng k?t h?p v?i 
	 v? mát l?nh c?a ?á xay là s? l?a ch?n hoàn h?o cho mùa hè nóng b?c', '2019-10-22', 'LSP4', 's9.jpg'),
	 
	('SP12', 'WaterMelon Sorbet', N'ly', 'Lappetit', 35000, N'S? thanh mát c?a d?a h?u k?t h?p v?i 
	 v? mát l?nh c?a ?á xay là s? l?a ch?n hoàn h?o cho mùa hè nóng b?c', '2019-11-17', 'LSP4', 's10.jpg'),
	 
	('SP13', 'Green Sorbet', N'ly', 'Lappetit', 45000, N'H??ng v? mát l?nh c?a Táo xanh c?ng v?i ?á xay 
	 qu? là s? l?a ch?n không th? tuy?t v?i h?n ', '2019-11-18', 'LSP4', 's11.jpg'),

	('SP14', 'Combo Diet Detox', N'h?p', 'Lappetit', 45000, N'Bao g?m các món bánh ?n kiêng', '2019-10-22', 'LSP5', 's5.jpg'),

	('SP15', 'Combo Frozen & Donut', N'ly', 'Lappetit', 45000, N'Bao g?m: 1 ly Oreo Ice-blended kem cheese
	 và 2 bánh Donut Socola', '2019-11-20', 'LSP5', 's6.jpg');
go

INSERT INTO USERS (USER_ID, USER_NAME, PASSWORD,  EMAIL, SODT, DCHI)
VALUES
	('AD', 'admin', '1234', 'admin@gmail.com', '0123456789', N'1 Võ V?n Ngân'),
	('US1', 'qui2410', '2410', 'qui2410@gmail.com', '0917288663', N'Gò V?p'),
	('US2', 'xunha1007', '1007', 'xunha1007@gmail.com', '0815962742', N'Th? ??c'),
	('US3', 'thanhld1511', '1511', 'thanhld1511@gmail.com', '0843827477', N'Qu?n 12'),
	('US4', 'nd01', '4321', 'nd01@gmail.com', '0987654321', N'Qu?n 9');
go

INSERT INTO DONHANG (SODH, USER_ID, NGAYDAT, NGAYGIAO)
VALUES 
	('DH1', 'US1', '2019-10-25', '2019-10-26'),
	('DH2', 'US2', '2019-10-30', '2019-11-1'),
	('DH3', 'US4', '2019-11-7', '2019-11-1'),
	('DH4', 'US1', '2019-11-10', '2019-11-12'),
	('DH5', 'US3', '2019-11-14', '2019-11-15'),
	('DH6', 'US2', '2019-11-20', '2019-11-21');
	delete from CTDH
go


INSERT INTO CTDH (SODH, MASP)
VALUES
	('DH1', 'SP2'),
	('DH1', 'SP9'),
	('DH1', 'SP4'),
	('DH2', 'SP4'),
	('DH3', 'SP9'),
	('DH3', 'SP4'),
	('DH4', 'SP15'),
	('DH4', 'SP4'),
	('DH4', 'SP9'),
	('DH5', 'SP11'),
	('DH5', 'SP4'),
	('DH5', 'SP9'),
	('DH6', 'SP4'),
	('DH6', 'SP9');
	
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

