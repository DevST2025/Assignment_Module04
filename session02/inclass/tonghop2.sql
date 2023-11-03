create database `quanlybanhang`;

use `quanlybanhang`;
SET SQL_SAFE_UPDATES=OFF;

create table `NhaCungCap`(
`MaNCC` varchar(5),
`TenNCC` varchar(50) not null,
`Diachi` varchar(50) not null,
`Dienthoai` varchar(15) not null unique,
`Email` varchar(30) unique,
`Website` varchar(30),
primary key(MaNCC)
);

create table `KhachHang`(
`MaKH` varchar(4),
`TenKH` varchar(30) not null,
`Diachi` varchar(50),
`Ngaysinh` date,
`Email` varchar(30) unique,
`SoDT` varchar(15) unique,
primary key(MaKH)
);

create table `NhanVien`(
`MaNV` varchar(4),
`HoTen` varchar(30) not null,
`GioiTinh` bit not null,
`Diachi` varchar(50) not null,
`Ngaysinh` date not null,
`DienThoai` varchar(15) unique,
`Email` varchar(30) unique,
`NoiSinh` varchar(20) not null,
`NgayVaoLam` date,
`MaNQL` varchar(4),
primary key(MaNV)
);

create table `LoaiSP`(
`MaloaiSP` varchar(4),
`TenloaiSP` varchar(30) not null,
`Ghichu` varchar(100) not null,
primary key(MaloaiSP)
);

create table `SanPham`(
`MaSP` varchar(4),
`MaloaiSP` varchar(4) not null,
`TenSP` varchar(50) not null,
`Donvitinh` varchar(10) not null,
`Ghichu` varchar(100),
primary key(MaSP)
);

create table `PhieuNhap`(
`SoPN` varchar(5),
`MaNV` varchar(4) not null,
`MaNCC` varchar(5) not null,
`Ngaynhap` datetime not null default now(),
`Ghichu` varchar(100),
primary key(SoPN)
);

create table `CTPhieuNhap`(
`MaSP` varchar(4) not null,
`SoPN` varchar(5) not null,
`Soluong` int not null default 0,
`Gianhap` decimal not null check(Gianhap>=0),
primary key(MaSP, SoPN)
);

create table `PhieuXuat`(
`SoPX` varchar(5),
`MaNV` varchar(4) not null,
`MaKH` varchar(4) not null,
`NgayBan` datetime not null default now(),
`Ghichu` text,
primary key(SoPX)
);

create table `CTPhieuXuat`(
`MaSP` varchar(4) not null,
`SoPX` varchar(5) not null,
`Soluong` int not null check(Soluong > 0),
`Giaban` decimal not null check(Giaban > 0),
primary key(MaSP, SoPX)
);

-- Bài 2

alter table `SanPham`
add constraint FK_LoaiSP 
foreign key (MaloaiSP) references LoaiSP(MaloaiSP);

alter table `PhieuNhap`
add foreign key (MaNV) references NhanVien(MaNV),
add foreign key (MaNCC) references NhaCungCap(MaNCC);

alter table `CTPhieuNhap`
add foreign key (MaSP) references SanPham(MaSP),
add foreign key (SoPN) references PhieuNhap(SoPN);

alter table `PhieuXuat`
add foreign key (MaNV) references NhanVien(MaNV),
add foreign key (MaKH) references KhachHang(MaKH);

alter table `CTPhieuXuat`
add foreign key (MaSP) references SanPham(MaSP),
add foreign key (SoPX) references PhieuXuat(SoPX);

insert into `NhanVien` values ('NV01','Tran Hong Son',1,'Binh Tan','1998-01-25','0908250198','son@gmail.com','HCM',null,null); 
insert into NhanVien values ('NV02','Tran Son Nguyen',1,'Binh Tan','2004-10-27','0908250197','nguyen@gmail.com','HCM',null,'NV01'); 
insert into NhanVien values ('NV03','Pham Tuan Hung',1,'Go Vap','2005-04-22','0908250196','hung@gmail.com','HCM',null,'NV01'); 
insert into NhanVien values ('NV05','Tran Thanh Ngan',0,'Long Bien','1998-12-20','0908250194','ngan@gmail.com','HN',null,'NV01'); 

insert into NhaCungCap values ('NCC01','SamSung','HCM','0900000000','SS@gmail.com',null);
insert into NhaCungCap values ('NCC02','Apple','HCM','0900000001','AP@gmail.com',null);

insert into LoaiSP value('LSP1','Quần','alo');
insert into LoaiSP value('LSP2','Áo','alo');

insert into SanPham values ('SP01','LSP1','Quần Hoa','Cai','new');
insert into SanPham values ('SP02','LSP1','Quần sọc','Cai','Hot');
insert into SanPham values ('SP03','LSP2','Áo Hoa','Cai','Hot');
insert into SanPham values ('SP04','LSP1','Quần Bông','Cai','New');

insert into KhachHang(MaKH, TenKH, Email, SoDT) values 
('KH01','A','a@gmail.com','0988888888'),
('KH02','B','b@gmail.com','0988888887'),
('KH03','C','c@gmail.com','0988888886'),
('KH10','D','d@gmail.com','0988888885');

-- Bài 3

select * from ctphieuxuat;

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN01','NV02','NCC01');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP01','PN01',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN01',20,20000);

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN02','NV03','NCC02');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN02',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP03','PN02',20,20000);

insert into PhieuXuat(SoPX, MaNV, MaKH) values('PX01','NV02','KH01');
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP01','PX01',5,15000);
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP02','PX01',10,25000);
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP03','PX01',10,22000);

insert into PhieuXuat(SoPX, MaNV, MaKH) values('PX02','NV03','KH02');
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP02','PX02',5,15000);
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP03','PX02',10,25000);
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP04','PX02',10,25000);

insert into NhanVien values ('NV04','Pham Dao Bich Huyen',0,'Go Vap','2005-04-22','0908250195','huyen@gmail.com','HCM',null,'NV03'); 

-- Bài 4

update KhachHang set SoDT = '0908123456' where MaKH like 'KH10';

update NhanVien  set Diachi = 'Go Vap' where manv like 'NV04';  

-- Bài 5:

delete from  NhanVien where MaNV like 'NV04';

delete from SanPham where MaSP like 'SP03';

-- Bài 6:

-- 1
SELECT MaNV, HoTen, 
CASE
WHEN Gioitinh = 1 THEN 'Nam'
ELSE 'Nu'
END 
AS Gioitinh,
Ngaysinh, Diachi, DienThoai, (YEAR(now()) - YEAR(Ngaysinh)) AS Tuoi 
FROM NhanVien ORDER BY Tuoi;

-- 2
SELECT pn.SoPN, pn.MaNV, nv.HoTen, ncc.TenNCC, pn.NgayNhap, pn.Ghichu FROM PhieuNhap pn 
JOIN NhanVien nv ON pn.MaNV LIKE nv.MaNV
JOIN NhaCungCap ncc ON pn.MaNCC LIKE ncc.MaNCC;

-- 3
SELECT * FROM SanPham WHERE Donvitinh = 'Cai';

-- 4
SELECT ctpn.SoPN, ctpn.MaSP, sp.TenSP, lsp.TenloaiSP, sp.Donvitinh, ctpn.Soluong, ctpn.Gianhap, ctpn.Soluong * ctpn.Gianhap as ThanhTien FROM CTPhieuNhap ctpn 
JOIN PhieuNhap pn ON ctpn.SoPN = pn.SoPN
JOIN SanPham sp ON ctpn.MaSP = sp.MaSP
JOIN LoaiSP lsp ON lsp.MaloaiSP = sp.MaloaiSP
WHERE MONTH(pn.Ngaynhap) LIKE MONTH(now())
;

-- 5
SELECT ncc.MaNCC, ncc.TenNCC, ncc.Diachi, ncc.Dienthoai, ncc.Email, pn.SoPN, pn.Ngaynhap FROM NhaCungCap ncc 
JOIN PhieuNhap pn ON ncc.MaNCC = pn.MaNCC
WHERE MONTH(pn.Ngaynhap) LIKE MONTH(now());

-- 6
SELECT ctpx.SoPX, nv.HoTen, px.NgayBan, ctpx.MaSP, sp.TenSP, sp.Donvitinh, ctpx.Soluong, ctpx.Soluong * ctpx.GiaBan as DoanhThu FROM CTPhieuXuat ctpx
JOIN PhieuXuat px ON ctpx.SoPX = px.SoPX
JOIN SanPham sp ON ctpx.MaSP = sp.MaSP
JOIN NhanVien nv ON nv.MaNV = px.MaNV
WHERE NgayBan BETWEEN  '2023-06-01' AND '2023-12-30'
;

-- 7
UPDATE KhachHang SET Ngaysinh = '2004-11-01' WHERE MaKH LIKE 'KH01';
UPDATE KhachHang SET Ngaysinh = '2002-10-01' WHERE MaKH LIKE 'KH02';
UPDATE KhachHang SET Ngaysinh = '1998-07-01' WHERE MaKH LIKE 'KH03';
UPDATE KhachHang SET Ngaysinh = '1999-11-23' WHERE MaKH LIKE 'KH10';

SELECT * FROM KhachHang WHERE MONTH(Ngaysinh) LIKE MONTH(now());

-- 8
SELECT px.SoPX, nv.HoTen, px.NgayBan, ctpx.MaSP, sp.TenSP, sp.Donvitinh, ctpx.Soluong, ctpx.Soluong * ctpx.GiaBan as DoanhThu FROM PhieuXuat px
JOIN CTPhieuXuat ctpx ON ctpx.SoPX = px.SoPX
JOIN SanPham sp ON ctpx.MaSP = sp.MaSP
JOIN NhanVien nv ON nv.MaNV = px.MaNV
WHERE NgayBan BETWEEN  '2023-11-01' AND '2023-12-30'
;

-- 9
SELECT PX.SOPX, PX.NGAYBAN, PX.MAKH, KH.TENKH, CTPX.SOLUONG * CTPX.GIABAN AS TriGia FROM PHIEUXUAT PX
JOIN KHACHHANG KH ON KH.MAKH LIKE PX.MAKH
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
ORDER BY KH.TENKH
;

-- 10
SELECT SUM(CTPX.SOLUONG) AS `Số cái` FROM PHIEUXUAT PX 
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
WHERE (NGAYBAN BETWEEN '2023-06-01' AND '2023-12-30') AND CTPX.MASP LIKE 'SP02';

-- 11
SELECT MONTH(PX.NGAYBAN) AS Thang, KH.MaKH, KH.TenKH, KH.DIACHI, SUM(CTPX.SOLUONG * CTPX.GIABAN) AS TongTien FROM KHACHHANG KH
JOIN PHIEUXUAT PX ON PX.MAKH LIKE KH.MAKH
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
GROUP BY  KH.MAKH, MONTH(PX.NGAYBAN)
;

-- 12
SELECT YEAR(PX.NGAYBAN) AS NAM, MONTH(PX.NGAYBAN) AS THANG, SP.MASP, SP.TENSP, SP.DONVITINH, SUM(CTPX.SOLUONG) AS TONGSOLUONG FROM SANPHAM SP
JOIN CTPHIEUXUAT CTPX ON SP.MASP LIKE CTPX.MASP
JOIN PHIEUXUAT PX ON CTPX.SOPX LIKE PX.SOPX
GROUP BY  YEAR(PX.NGAYBAN), MONTH(PX.NGAYBAN), SP.MASP
;

-- 13
SELECT YEAR(PX.NGAYBAN) AS NAM, MONTH(PX.NGAYBAN) AS THANG, SUM(CTPX.SOLUONG * CTPX.GIABAN) AS DOANHTHU FROM CTPHIEUXUAT CTPX
JOIN PHIEUXUAT PX ON PX.SOPX LIKE CTPX.SOPX
GROUP BY YEAR(PX.NGAYBAN), MONTH(PX.NGAYBAN)
;

-- 14
SELECT PX.SOPX, PX.NGAYBAN, NV.HOTEN, KH.TENKH, SUM(CTPX.SOLUONG * CTPX.GIABAN) AS TONGGIATRI FROM PHIEUXUAT PX
JOIN NHANVIEN NV ON NV.MANV LIKE PX.MANV
JOIN KHACHHANG KH ON KH.MAKH LIKE PX.MAKH
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
GROUP BY PX.SOPX, NV.HOTEN, KH.TENKH
HAVING YEAR(PX.NGAYBAN) LIKE '2023' AND MONTH(PX.NGAYBAN) LIKE '11'
;

-- 15
SELECT PX.SOPX, KH.MAKH, KH.TENKH, NV.HOTEN, PX.NGAYBAN, SUM(CTPX.SOLUONG * CTPX.GIABAN) AS GIATRI FROM PHIEUXUAT PX
JOIN NHANVIEN NV ON NV.MANV LIKE PX.MANV
JOIN KHACHHANG KH ON KH.MAKH LIKE PX.MAKH
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
GROUP BY PX.SOPX, KH.MAKH, NV.HOTEN, KH.TENKH
HAVING DAY(PX.NGAYBAN) LIKE DAY(NOW())
;

-- 16
SELECT NV.MANV, NV.HOTEN, SP.MASP, SP.TENSP, SP.DONVITINH, SUM(CTPX.SOLUONG) AS TONGSOLUONG FROM NHANVIEN NV
JOIN PHIEUXUAT PX ON PX.MANV LIKE NV.MANV
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
JOIN SANPHAM SP ON SP.MASP LIKE CTPX.MASP
GROUP BY NV.MANV, SP.MASP
ORDER BY NV.MANV
;

-- 17
SELECT PX.SOPX, PX.NGAYBAN, SP.MASP, SP.TENSP, SP.DONVITINH, SUM(CTPX.SOLUONG) AS SOLUONG, SUM(CTPX.GIABAN) AS DONGIA, SUM(CTPX.SOLUONG * CTPX.GIABAN) AS THANHTIEN FROM NHANVIEN NV
JOIN PHIEUXUAT PX ON PX.MANV LIKE NV.MANV
JOIN CTPHIEUXUAT CTPX ON CTPX.SOPX LIKE PX.SOPX
JOIN SANPHAM SP ON SP.MASP LIKE CTPX.MASP
JOIN KHACHHANG KH ON KH.MAKH LIKE PX.MAKH
WHERE KH.MAKH LIKE 'KH01'
GROUP BY PX.SOPX, PX.NGAYBAN, SP.MASP, SP.TENSP
HAVING PX.NGAYBAN BETWEEN '2023-09-01' AND '2023-12-30'
;

-- 18
INSERT INTO SANPHAM VALUES ('SP05','LSP2','ÁO Bông','Cai','HOT');
insert into PhieuXuat(SoPX, MaNV, MaKH, NGAYBAN) values('PX03','NV01','KH03', '2023-01-25');
insert into CTPhieuXuat(MaSP, SoPX, Soluong, Giaban) values('SP01','PX03',2,15000);

SELECT SP.MASP, SP.TENSP, LSP.TENLOAISP, SP.DONVITINH FROM SANPHAM SP
JOIN LOAISP LSP ON LSP.MALOAISP LIKE SP.MALOAISP
WHERE SP.MASP NOT IN (
SELECT CTPX.MASP FROM CTPHIEUXUAT CTPX 
JOIN PHIEUXUAT PX ON PX.SOPX LIKE CTPX.SOPX
WHERE PX.NGAYBAN BETWEEN '2023-01-01' AND '2023-06-30'
);

-- 19
SELECT NCC.MANCC, NCC.TENNCC, NCC.DIACHI, NCC.DIENTHOAI FROM NHACUNGCAP NCC
WHERE NCC.MANCC NOT IN (
SELECT CTPX.MASP FROM CTPHIEUXUAT CTPX 
JOIN PHIEUXUAT PX ON PX.SOPX LIKE CTPX.SOPX
WHERE PX.NGAYBAN BETWEEN '2023-04-01' AND '2023-06-30'
);

