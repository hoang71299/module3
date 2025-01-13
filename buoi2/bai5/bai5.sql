use buoi2;

create table vi_tri(
    id int auto_increment primary key ,
    ten_vi_tri varchar(255)
);
create table cau_thu(
    id int auto_increment primary key ,
    ten_cau_thu varchar(255)
);
alter table cau_thu
add column id_doi int;
alter table cau_thu
add constraint foreign key (id_doi) references doi(id);
create table vi_tri_cau_thu(
    id_vi_tri int ,
    id_cau_thu int ,
    primary key (id_vi_tri,id_cau_thu),
    foreign key (id_vi_tri) references vi_tri(id),
    foreign key (id_cau_thu) references cau_thu(id)
);
create table doi(
    id int auto_increment primary key ,
    ten_doi varchar(255)
);
alter table doi
add  column id_hlv int;
alter table doi
add constraint foreign key (id_hlv) references hlv(id);
create table hlv(
    id int auto_increment primary key ,
    ten_hlv varchar(255)
);
create table tran_dau(
    id int auto_increment primary key ,
    doi_a int,
    doi_b int,
    foreign key (doi_a) references doi(id),
    foreign key (doi_b) references doi(id),
    ngay_bat_dau timestamp
);
create table tran_dau_cau_thu(
    id_tran_dau int,
    id_cau_thu int,
    primary key (id_tran_dau,id_cau_thu),
    foreign key (id_tran_dau) references tran_dau(id),
    foreign key (id_cau_thu) references cau_thu(id)
)