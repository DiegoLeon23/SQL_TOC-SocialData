CREATE TABLE institute (
	idInstitute int PRIMARY KEY, 
	[description] varchar(100),
	created_at datetime ,
	updated_at datetime
)

CREATE TABLE person (
	idPerson int PRIMARY KEY, 
	dni varchar(10),
	firstname varchar(30),
	lastname varchar(30),
	names varchar(30),
	[password] varchar(30),
	datebirth datetime,
	cellphone varchar(10),
	photo image,
	email varchar(30),
	sex varchar(10),
	created_at datetime,
	updated_at datetime
)

CREATE TABLE course (
	idCourse int PRIMARY KEY,
	specialityid int,
	[description] varchar(100),
	cicle int,
	created_at datetime,
	updated_at datetime,
	photo image,
	detail varchar(20)
)
