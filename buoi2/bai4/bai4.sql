use buoi2;
create table giaovien(
	id int auto_increment primary key,
    ten varchar(220) not null

);

create table hocsinh(
	id int auto_increment primary key,
    ten varchar(220) not null,
    id_giaovien int,
    foreign key (id_giaovien) references giaovien(id)

);