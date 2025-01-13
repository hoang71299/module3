use buoi2;

create table nguoi(
	id int auto_increment primary key,
    ten varchar(220) not null
);
create table so_dien_thoai(
	id int auto_increment primary key,
    so_dien_thoai varchar(15)not null,
	id_nguoi  int  not null,
    foreign key(id_nguoi) references nguoi(id)
);
create table email(
	id int auto_increment primary key,
    email varchar(150) not null,
	id_nguoi  int  not null,
    foreign key(id_nguoi) references nguoi(id)
)

