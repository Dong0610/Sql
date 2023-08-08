CREATE DATABASE BTL_QuanLiCuaHangDia
GO
USE BTL_QuanLiCuaHangDia
GO

CREATE TABLE tblLoaiDia(
PK_sMaloaiDia VARCHAR(10) CONSTRAINT PK_SLoaiDia PRIMARY KEY,
sTenLoaiDia NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE tblDia(
Pk_MaDia VARCHAR(10) CONSTRAINT PK_Dia PRIMARY KEY,
sTenDia NVARCHAR(50)  NOT NULL,
sNamPhatHanh DATE NOT NULL,
sTenNhaCC NVARCHAR(50) NULL,
fSoluong FLOAT,
sMaLoai VARCHAR(10) CONSTRAINT FK_MaLoaiDia FOREIGN KEY (sMaLoai) REFERENCES dbo.tblLoaiDia(PK_sMaloaiDia)
)
GO


CREATE TABLE tblKhachHang (
PK_sMaKH INT IDENTITY(1,1) CONSTRAINT PK_KhachHang PRIMARY KEY,
sTenKH NVARCHAR(50) NOT NULL,
dNgaySinh DATE NOT NULL,
sGioiTinh NVARCHAR(5) NOT NULL,
sCanCuoc VARCHAR(20) CONSTRAINT CK_KhachHang UNIQUE,
sDiaChi NVARCHAR(50) NULL,
sSoDT VARCHAR(15) NULL
)
GO


CREATE TABLE tblNhanVien(
PK_sMaNV INT IDENTITY(1,1) CONSTRAINT PK_NhanVien PRIMARY KEY ,
sTenNV NVARCHAR(50) NOT NULL,
sGioiTinh NVARCHAR(5) NOT NULL,
sDiaChi NVARCHAR(50) NULL,
sSoDT VARCHAR(15) NOT NULL,
fLuongCB FLOAT NOT NULL,
fPhuCap FLOAT NULL
)
GO

CREATE TABLE tblNhap(
PK_sMaHD VARCHAR(10) CONSTRAINT PK_Nhap PRIMARY KEY,
sTenHD NVARCHAR(50) NOT NULL,
sTenNhaCC NVARCHAR(50) NULL,
sMaNV  int CONSTRAINT Fk_NhanVien_Nhap FOREIGN KEY(sMaNV) REFERENCES dbo.tblNhanVien(PK_sMaNV),
sNgayLap DATE NOT NULL
)
GO


CREATE TABLE tblCTNhap(
sMaHDN VARCHAR(10) CONSTRAINT FK_ChiTietNhap_HoaDon FOREIGN KEY(sMaHDN) REFERENCES dbo.tblNhap(PK_sMaHD),
sMaDia VARCHAR(10) CONSTRAINT FK_ChiTietNHap_Dia FOREIGN KEY (sMaDia) REFERENCES dbo.tblDia(Pk_MaDia),
fSoLuong INT NOT NULL,
fGiaNhap FLOAT NOT NULL,
fGiamGia FLOAT NULL,
CONSTRAINT PK_ChiTietNhap PRIMARY KEY(sMaHDN,sMaDia)
)
GO


CREATE TABLE tblBan(
PK_sMaHD VARCHAR(10) CONSTRAINT PK_Ban PRIMARY KEY,
sTenHD NVARCHAR(50) NOT NULL,
sTenNoiCC NVARCHAR(50) NULL,
sMaNV  INT CONSTRAINT Fk_NhanVien_Ban FOREIGN KEY(sMaNV) REFERENCES dbo.tblNhanVien(PK_sMaNV),
sMaKH INT  CONSTRAINT FK_KhachHang_Mua FOREIGN KEY(sMaKH) REFERENCES dbo.tblKhachHang(PK_sMaKH),
sNgayLap DATE NOT NULL
)
GO

CREATE TABLE tblCTBan(
sMaHDN VARCHAR(10) CONSTRAINT FK_ChiTietBan_HoaDon FOREIGN KEY(sMaHDN) REFERENCES dbo.tblBan(PK_sMaHD),
sMaDia VARCHAR(10) CONSTRAINT FK_ChiTietBan_Dia FOREIGN KEY (sMaDia) REFERENCES dbo.tblDia(Pk_MaDia),
fSoLuong INT NOT NULL DEFAULT 1,
fGiaBan FLOAT NOT NULL,
fGiamGia FLOAT NULL,
CONSTRAINT PK_ChiTietBan PRIMARY KEY(sMaHDN,sMaDia)
)
GO

----nhập dữ liệu cho bảng----
-----bảng loại đĩa-----
insert into tblLoaiDia(PK_sMaloaiDia,sTenLoaiDia)
VALUES
SELECT * FROM tblLoaiDia

-----bảng đĩa-------
INSERT INTO tblDia(Pk_MaDia,sTenDia,sNamPhatHanh,sTenNhaCC,fSoluong,sMaLoai)
VALUES ('001',N'siêu nhân gao','1999/10/20',N'NCC1','2','Loai1'),
       ('002',N'hệ mặt trời','1945/09/19',N'NCC3','3','Loai3'),
	   ('003',N'cá mập','1990/06/05',N'NCC2','1','Loai2'),
	   ('004',N'sư tử','1980/10/19',N'NCC2','5','Loai2'),
	   ('005',N'doraemon','2001/08/01',N'NCC4','2','Loai4'),
	   ('006',N'hoa mộc lan','2004/05/04',N'NCC5','4','Loai5'),
	   ('007',N'pokemon','2016/06/16',N'NCC4','1','Loai4'),
	   ('008',N'siêu nhân cuồng phong','1998/12/18',N'NCC1','2','Loai1'),
	   ('009',N'hài tết','2001/01/01',N'NCC5','2','Loai5'),
	   ('010',N'núi lửa','1978/10/18',N'NCC3','1','Loai3')
SELECT * FROM tblDia

--- bảng khách hàng-----.
INSERT INTO tblKhachHang(sTenKH,dNgaySinh,sGioiTinh,sCanCuoc,sDiaChi,sSoDT)
VALUES (N'nguyễn văn an','2000/08/20',N'nam','092012345',N'hà nội','0324789420'),
       (N'nguyễn vân anh','2001/01/15',N'nữ','092012346',N'hà nội','0324645001'),
	   (N'trần bảo ngọc','2002/10/28',N'nữ','092012347',N'hà nội','0320201420'),
	   (N'đào văn sơn','2002/11/20',N'nam','092012348',N'hà nội','0324789002'),
	   (N'hoàng lan anh','2002/12/02',N'nữ','092012349',N'hà nội','0380779420')
SELECT *FROM tblKhachHang

--- bảng nhân viên ---
INSERT INTO tblNhanVien(sTenNV,sGioiTinh,sDiaChi,sSoDT,fLuongCB,fPhuCap)
VALUES (N'trần đức tuấn',N'nam',N'hà nội','09123456','2000000','500000'),
       (N'dương lan ngọc',N'nữ',N'hà nội','09123457','2200000','510000'),
	   (N'nguyễn tuấn minh',N'nam',N'hà nội','09123458','1800000','200000')
SELECT *FROM tblNhanVien

--- bảng nhập hàng---
INSERT INTO tblNhap (PK_sMaHD,sTenHD,sTenNhaCC,sMaNV,sNgayLap)
VALUES ('11',N'thuê',N'NCC1','1','2021/10/10'),
       ('22',N'thuê',N'NCC2','2','2021/01/10'),
	   ('33',N'mua',N'NCC3','3','2021/05/28')
SELECT*FROM tblNhap

---bảng chi tiết nhập---
INSERT INTO tblCTNhap (sMaHDN,sMaDia,fSoLuong,fGiaNhap,fGiamGia)
VALUES ('11','001','2','25000','0'),
       ('22','003','4','20000','10'),
	   ('33','010','5','30000','0')
SELECT*FROM tblCTNhap

--- bảng bán/thuê---
INSERT INTO tblBan(PK_sMaHD,sTenHD,sTenNoiCC,sMaNV,sMaKH,sNgayLap)
VALUES ('A01',N'mua',N'NCC2','1','3','2021/10/12'),
       ('A02',N'mua',N'NCC1','2','5','2021/08/21'),
	   ('A03',N'thuê',N'NCC4','3','4','2021/09/02'),
	   ('A04',N'thuê',N'NCC3','1','1','2021/03/29'),
	   ('A05',N'mua',N'NCC5','2','2','2021/03/17'),
	   ('A06',N'mua',N'NCC2','1','4','2021/10/21')
SELECT *FROM tblBan

--- bảng chi tiết bán ---
INSERT INTO tblCTBan(sMaHDN,sMaDia,fSoLuong,fGiaBan,fGiamGia)
VALUES ('A01','004','1','30000','0'),
       ('A02','008','10','35000','10'),
	   ('A03','005','6','15000','0'),
	   ('A04','010','2','15000','0'),
	   ('A05','009','3','35000','0'),
	   ('A06','002','2','35000','0')
SELECT *FROM tblCTBan
go
-- Taoj view
-- danh dach khach hang nam sinh nam 2002
CREATE VIEW vw_DSKH2002
AS 
SELECT dbo.tblKhachHang.sTenKH FROM dbo.tblKhachHang WHERE sGioiTinh LIKE 'nam' AND YEAR(dbo.tblKhachHang.dNgaySinh)=2002
GO

SELECT*FROM dbo.vw_DSKH2002
GO

-- cho danh sach cac khach hang thue dia

CREATE VIEW vv_ThueDia
AS
SELECT dbo.tblKhachHang.sTenKH FROM dbo.tblKhachHang INNER JOIN dbo.tblBan ON dbo.tblBan.sMaKH= dbo.tblKhachHang.PK_sMaKH WHERE  dbo.tblBan.sTenHD LIKE N'thuê'
GO
SELECT* FROM dbo.vv_ThueDia
GO

--cac dia da ban co gia tre 20000

CREATE VIEW vw_sp20k
AS
SELECT dbo.tblDia.Pk_MaDia, dbo.tblDia.sTenDia FROM dbo.tblDia INNER JOIN dbo.tblCTBan ON tblCTBan.sMaDia= dbo.tblDia.Pk_MaDia
WHERE dbo.tblCTBan.fGiaBan >20000
GO

SELECT*FROM dbo.vw_sp20k
GO
-- ten hoa don co so tien nhap vao nhieu nhat
CREATE VIEW vw_tienNN
AS
SELECT TOP 1 dbo.tblNhap.PK_sMaHD, dbo.tblNhap.sTenHD, (dbo.tblCTNhap.fSoLuong*dbo.tblCTNhap.fGiaNhap) AS Tien FROM dbo.tblNhap INNER JOIN dbo.tblCTNhap  ON dbo.tblCTNhap.sMaHDN= dbo.tblNhap.PK_sMaHD
GROUP BY PK_sMaHD,sTenHD, (dbo.tblCTNhap.fSoLuong*dbo.tblCTNhap.fGiaNhap) ORDER BY Tien DESC 
GO

SELECT *FROM dbo.vw_tienNN

GO




---Tim Dia theo loai dia
CREATE PROC SP_TimTheoLoai
(@mal VARCHAR(10))

AS 
BEGIN
    IF(@mal NOT IN (SELECT dbo.tblLoaiDia.PK_sMaloaiDia FROM dbo.tblLoaiDia))
	BEGIN
	    PRINT(N'Khong co loai dia nao la: '+@mal)
	END
	ELSE
	BEGIN
	    SELECT * FROM dbo.tblDia WHERE sMaLoai= @mal
	END
END
GO
EXEC dbo.SP_TimTheoLoai @mal = 'Loai1' -- varchar(10)
