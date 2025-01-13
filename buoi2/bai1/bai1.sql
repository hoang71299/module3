use buoi2;

create table sach(
	id int auto_increment primary key,
    ten varchar(220) not null,
    gia decimal(10,2) not null
        
);

ALTER TABLE sach 
ADD COLUMN tacgia_id INT NOT NULL,
ADD COLUMN nhanvien_id INT NOT NULL;

ALTER TABLE sach 
ADD CONSTRAINT fk_tacgia
FOREIGN KEY (tacgia_id) REFERENCES tacgia(id),
ADD CONSTRAINT fk_nhanvien
FOREIGN KEY (nhanvien_id) REFERENCES nhanvien(id);

create table tacgia(
	id int auto_increment primary key,
    ten varchar(220) not null
);
create table nhanvien(
	id int auto_increment primary key,
    ten varchar(220)  not null,
    diachi text not null
)
