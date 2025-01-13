create database store_management;

use store_management;


create table product(
	id int primary key auto_increment,
    name varchar(255) not null ,
    description text,
    price double ,
    amount int 
);
alter table product add stock int;

insert into product VALUE  (null,'Product A', 'Description of Product A', 100, 10, 5);
INSERT INTO product (name, description, price, amount, stock) VALUES ('Product B', 'Description of Product B', 5, 10, 5);
INSERT INTO product (name, description, price, amount, stock) VALUES ('Product C', null, null, null,null);


select * from product ;

select id ,name ,price from product;

select id ,name ,price from product
where price < 10;

update product
set price = 6;

update product
set price = 7
where id = 2;

set sql_safe_updates = 0;


ALTER TABLE product ADD COLUMN Barcode VARCHAR(255) DEFAULT NULL;
ALTER TABLE product ADD COLUMN Warranty VARCHAR(50) DEFAULT '6 tháng';


delete from product ;

delete from product where id = 1;
select * from product ;

drop table product;

drop database if exists store_management;