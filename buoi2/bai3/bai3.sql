use buoi2;

create table khachhang(
	id int auto_increment primary key,
    ten varchar(220) not null
);
create table taikhoan(
	id int auto_increment primary key,
    so_du decimal(15,2) not null,
    id_khach_hang int,
    foreign key(id_khach_hang) references khachhang(id)
);