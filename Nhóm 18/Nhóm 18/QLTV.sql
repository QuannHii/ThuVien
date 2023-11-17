create database QLTV
use QLTV

create table DocGia
(
MaDG int not null primary key,
TenDG nvarchar(50) not null,
GioiTinh nvarchar(4),
DiaChi nvarchar(256),
SDT int not null
)
create table NhanVien
(
MaNV int primary key,
TenNV nvarchar(50) not null,
NamSinh int not null,
GioiTinh nvarchar(50) not null,
SDT numeric(18, 0)
)
create table Sach
(
MaSach int not null primary key,
TenSach nvarchar(50) not null,
MaTL int, 
MaNXB int, 
MaTG int, 
NamXB int not null,
SoLuong int,
)
create table TacGia
(
MaTG int primary key,
TenTG nvarchar(50) not null,
NamSinh int not null,
QueQuan nvarchar(50)
)
create table TheLoai
(
MaTL int primary key,
TenTL nvarchar(50) not null
)
create table NhaXuatBan
(
MaNXB int not null primary key ,
TenNXB nvarchar(50) not null,
DiaChi nvarchar(256),
SDT int
)
create table Taikhoan
(
MATK int primary key,
MaDG int,
Taikhoan nvarchar(50) not null,
Matkhau nvarchar(50) not null,
Quyen int
)
create table NhaCungCap
(
MaNCC int primary key,
TenNCC nvarchar(50) not null
)
create table PhieuMuon
(
MaPM int not null primary key,
CTPM nvarchar(50) not null,
MaNV int,
MaDG int,
NgayMuon nvarchar(50) not null
)
create table CTPM
(
MaCTPM int primary key,
MaPM int, 
MaSach int, 
SoLuong nvarchar(50) not null,
GhiChu nvarchar(50),
NgayMuon nvarchar(50) not null

)
create table PhieuNhap
(
MaPN int primary key,
MaNCC int,
MaNV int,
NgayNhap nvarchar(256) not null
)
create table CTPN
(
MaCTPN int primary key,
MaPN int,
MaSach int,
Gia int not null,
Soluong nvarchar(256) not null,
ThanhTien int not null
)

create table Phat
(
MaPhat int primary key,
MaPM int,
Lydo nvarchar(50),
BoiThuong nvarchar(50)
)

alter table TaiKhoan add constraint FK_TaiKhoan_DocGia foreign key (MaDG) references DocGia(MaDG)
alter table PhieuMuon add constraint FK_PhieuMuon_NhanVien foreign key (MaNV) references NhanVien(MaNV)
alter table PhieuMuon add constraint FK_PhieuMuon_DocGia foreign key (MaDG) references DocGia(MaDG)
alter table PhieuNhap add constraint FK_PhieuNhap_NhanVien foreign key (MaNV) references NhanVien(MaNV)
alter table PhieuNhap add constraint FK_PhieuNhap_NhaCungCap foreign key (MaNCC) references NhaCungCap(MaNCC)
alter table CTPM add constraint FK_CTPM_Sach foreign key (MaSach) references Sach(MaSach)
alter table CTPM add constraint FK_CTPM_PhieuMuon foreign key (MaPM) references PhieuMuon(MaPM)
alter table CTPN add constraint FK_CTPN_Sach foreign key (MaSach) references Sach(MaSach)
alter table CTPN add constraint FK_CTPM_PhieuNhap foreign key (MaPN) references PhieuNhap(MaPN)
alter table Sach add constraint FK_Sach_TacGia foreign key (MaTG) references TacGia(MaTG)
alter table Sach add constraint FK_Sach_TheLoai foreign key (MaTL) references TheLoai(MaTL)
alter table Sach add constraint FK_Sach_NhaXuatBan foreign key (MaNXB) references NhaXuatBan(MaNXB)
alter table Phat add constraint FK_Phat_PhieuMuon foreign key (MaPM) references PhieuMuon(MaPM)

