create database `quanlybanhang`;

use `quanlybanhang`;

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
`NgayBan` datetime not null,
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

insert into NhanVien values ('NV01','Tran Hong Son',1,'Binh Tan','1998-01-25','0908250198','son@gmail.com','HCM',null,null); 
insert into NhanVien values ('NV02','Tran Son Nguyen',1,'Binh Tan','2004-10-27','0908250197','nguyen@gmail.com','HCM',null,'NV01'); 
insert into NhanVien values ('NV03','Pham Tuan Hung',1,'Go Vap','2005-04-22','0908250196','hung@gmail.com','HCM',null,'NV01'); 

insert into NhaCungCap values ('NCC01','SamSung','HCM','0900000000','SS@gmail.com',null);
insert into NhaCungCap values ('NCC02','Apple','HCM','0900000001','AP@gmail.com',null);

insert into LoaiSP value('LSP1','Quần','alo');
insert into LoaiSP value('LSP2','Áo','alo');

insert into SanPham values ('SP01','LSP1','Quần Hoa','vnd','new');
insert into SanPham values ('SP02','LSP1','Quần sọc','vnd','Hot');
insert into SanPham values ('SP03','LSP2','Áo Hoa','vnd','Hot');

-- Bài 3

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN01','NV02','NCC01');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP01','PN01',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN01',20,20000);

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN02','NV03','NCC02');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN02',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP03','PN02',20,20000);

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN01','NV02','NCC01');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP01','PN01',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN01',20,20000);

insert into PhieuNhap(SoPN, MaNV, MaNCC) values('PN02','NV03','NCC02');
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP02','PN02',10,10000);
insert into CTPhieuNhap(MaSP, SoPN, Soluong, Gianhap) values('SP03','PN02',20,20000);



-- Bài 4

update khachhang set soDT = 1111 where MaKH like 'KH01';

update nhanvien  set diachi = 'Hà nội' where manv like 'NV01';  

-- Bài 5:
delete from  nhanvien where manv like 'NV03';

delete from SanPham where MaSP like 'SP03';


