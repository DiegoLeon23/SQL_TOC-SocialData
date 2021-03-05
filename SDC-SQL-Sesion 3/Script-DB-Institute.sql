create database institute;
use institute;
create table student(
id_student int primary key identity,
firstname varchar(50),
lastname varchar(50),
names varchar(50),
create_at datetime,
update_at datetime
);
---INSERCIONES 
insert into student(firstname,lastname,names,create_at,update_at)
values
('Leon','Ortiz','Diego',getdate(),getdate());
select * from student;
create table specialty(
id_specialty int primary key identity,
[description] varchar(70),
detail varchar(50),
create_at datetime,
update_at datetime
);

insert into specialty([description],detail,create_at,update_at)
values
('Arquitectura y Dise�o de Interiores','',getdate(),getdate());
select * from specialty;

create table course(
id_course  int primary key identity,
[description] varchar(50),
detail varchar(50),
create_at datetime,
update_at datetime
);

insert into course([description],detail,create_at,update_at)
values
('MS SQL SERVER','',getdate(),getdate());

insert into course([description],detail,create_at,update_at)
values
('UML','',getdate(),getdate());

DECLARE @id_curso int  = @@identity
SELECT @id_curso;

select * from course;
create table registry(
id_registry int primary key identity,
id_course int,
foreign key(id_course) references course(id_course),
id_specialty int,
foreign key(id_specialty) references specialty(id_specialty),
create_at datetime,
update_at datetime
);

insert into registry(id_course,id_specialty,create_at,update_at)
values
(2,2,getdate(),getdate());
select * from registry;

create table registry_detail(
id_registry_detail int primary key identity,
id_registry int,
foreign key(id_registry) references registry(id_registry),
id_student int,
foreign key(id_student) references student(id_student),
create_at datetime,
update_at datetime
);

select * from registry_detail;
create table qualification(
id_qualification int primary key identity,
id_registry_detail int,
foreign key(id_registry_detail) references
registry_detail(id_registry_detail),
n1 int default 0,
n2 int default 0,
n3 int default 0,
n4 int default 0,
n5 int default 0,
ex1 int default 0,
n7 int default 0,
n8 int default 0,
n9 int default 0,
n10 int default 0,
n11 int default 0,
ex2 int default 0,
create_at datetime,
update_at datetime
);
select * from qualification


create table assistance(
id_assistance int primary key identity,
id_registry_detail int,
foreign key(id_registry_detail) references
registry_detail(id_registry_detail),
[date] date,
update_at datetime
);
select * from assistance;
go

