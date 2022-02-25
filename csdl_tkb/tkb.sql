create database if not exists tkb;
use tkb;

drop table if exists b_tkb;
drop table if exists b_sinh_vien;
create table b_sinh_vien(
	ma_sv varchar(10) not null primary key unique,
    ten_sv varchar(30) COLLATE utf8mb4_unicode_ci not null,
    mk varchar(10) not null
);

insert into b_sinh_vien values
('admin','Admin','123'),
('b19dccn000','Phạm Duy Tuấn','123'),
('b18dccn001','Trần Văn ÂN','123'),
('b18dccn002','Nguyễn Văn Hoài','123'),
('b18dccn003','Phạm Việt Hóa','123'),
('b18dccn004','Vũ Nam','123'),
('b18dccn005','Thế Lữ','123'),
('b18dccn006','Hàn Mặc Cảm','123'),
('b17dccn007','Nguyễn Y Vân','123');

drop table if exists b_lop_hoc_phan;
create table b_lop_hoc_phan(
	id_lhp int not null primary key unique,
    ten_mon_hoc varchar(50) COLLATE utf8mb4_unicode_ci not null,
    giang_vien varchar(30) COLLATE utf8mb4_unicode_ci not null,
    si_so int not null,
    phong_hoc varchar(5) not null,
    tin_chi int not null,
    tuan_hoc varchar(35) not null,
    ma_mon_hoc varchar(10) not null,
    nhom_lop int not null,
    thu int not null,
    tiet_hoc int not null
);

insert into b_lop_hoc_phan values
(0,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,1),
(1,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,2),
(2,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,3),
(3,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,4),
(4,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,5),
(5,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,2,6),
(6,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,3,1),
(7,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,3,2),
(8,'Toán cao cấp','Nguyễn Văn Tân',23,'507A2',3,'*******89012345','tcc',10,3,3),
(9,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,2,1),
(10,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,2,2),
(11,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,2,3),
(12,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,2,4),
(13,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,5,1),
(14,'Đại số 1','Trần Hoa',23,'103A1',3,'1234567********','ds1',10,5,2),
(15,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,2,2),
(16,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,2,3),
(17,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,2,5),
(18,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,5,2),
(19,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,5,5),
(20,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,5,6),
(21,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,7,2),
(22,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,7,4),
(23,'Cơ sở dữ liệu','Trần Văn Điệp',23,'403A3',3,'1234********345','csdl',10,7,5),
(24,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,2,3),
(25,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,2,4),
(26,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,2,5),
(27,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,2,6),
(28,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,6,3),
(29,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,6,4),
(30,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,6,6),
(31,'Hệ điều hành','Huỳnh Văn Cước',23,'702A2',3,'***456789012***','hdh',10,7,3),
(32,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,2,4),
(33,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,2,5),
(34,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,2,6),
(35,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,3,4),
(36,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,3,5),
(37,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,3,6),
(38,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,4,4),
(39,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,4,5),
(40,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,4,6),
(41,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,7,4),
(42,'Lập trình python','Ngọc Anh',23,'102A1',3,'123****89012***','ltp',10,7,6),
(43,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,2,2),
(44,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,2,3),
(45,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,2,4),
(46,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,2,5),
(47,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,2,6),
(48,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,3,2),
(49,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,3,3),
(50,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,3,4),
(51,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,3,5),
(52,'Tiếng anh a12','Nguyễn Văn Phúc',23,'502A1',3,'**345**89012***','taa12',10,4,6);

create table b_tkb(
    ma_sv varchar(10),
	id_lhp int,
    foreign key (id_lhp) references b_lop_hoc_phan(id_lhp),
    foreign key (ma_sv) references b_sinh_vien(ma_sv)
);