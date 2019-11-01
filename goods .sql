drop database if exists dbgoods;
create database dbgoods default character set utf8;
use dbgoods;
create table tb_goods(
     id bigint primary key,
     name varchar(100) not null,
     remark text,
     createdTime datetime not null
   )engine=InnoDB;
insert into tb_goods values (1,'java','very good',now());
insert into tb_goods values (2,'mysql','RDBMS',now());
insert into tb_goods values (3,'Oracle','RDBMS',now());
