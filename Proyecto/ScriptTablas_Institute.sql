--- CREACION DE LAS TABLAS DE BASE DE DATOS
CREATE TABLE institute(
	idInstitute int PRIMARY KEY IDENTITY, 
	[description] varchar(100),
	created_at datetime default GETDATE(),
	updated_at datetime default GETDATE()
);
INSERT INTO institute([description]) VALUES ('UNMSM')
SELECT * FROM institute
----------------------------------
CREATE TABLE person(
	idPerson int PRIMARY KEY IDENTITY, 
    idCargo int,
	dni varchar(10),
	firstname varchar(30),
	lastname varchar(30),
	names varchar(30),
	[password] varchar(30),
	datebirth date,
	cellphone varchar(10),
	photo image default null,
	email varchar(30),
	sex varchar(10),
	created_at datetime default GETDATE(),
	updated_at datetime default GETDATE(),
    FOREIGN KEY (idCargo) REFERENCES cargo(idCargo)
);

INSERT INTO 
    person(idCargo,dni,firstname,lastname,[names],[password],datebirth,cellphone,email,sex) 
VALUES (1,'72179861','LEON','ORTIZ','DIEGO ENRIQUE','1213124','20000213','959837200','diego15leon@gmail.com','MASCULINO') 
SELECT * FROM person
-------------------------------------
CREATE TABLE cargo(
    idCargo int PRIMARY KEY IDENTITY,
    detalleCargo varchar(20) 
);

INSERT INTO cargo(detalleCargo) VALUES('ESTUDIANTE')
INSERT INTO cargo(detalleCargo) VALUES('PROFESOR')
SELECT * FROM cargo
----------------------------------------
CREATE TABLE schedule(
    idSchedule int PRIMARY KEY IDENTITY,
    time_start time,
    time_end time,
    [description] varchar(100),
    created_at datetime default GETDATE() ,
	updated_at datetime default GETDATE()
);

INSERT INTO 
    schedule(time_start,time_end,[description])
VALUES ('14:02','22:07','Calendario')
SELECT * FROM schedule
----------------------------------------------
CREATE TABLE specialty(
    idSpecialty int PRIMARY KEY IDENTITY,
    [description] varchar(70),
    idInstitute int, 
    created_at datetime default GETDATE(),
    updated_at datetime default GETDATE(),
    FOREIGN KEY(idInstitute) REFERENCES institute(idInstitute) 
);
INSERT INTO 
    specialty([description],idInstitute)
VALUES ('CIENCIAS',1)
SELECT * FROM specialty
-------------------------------------------------
CREATE TABLE course (
	idCourse int PRIMARY KEY IDENTITY,
	idSpecialty int, 
	[description] varchar(100),
	cicle int,
	created_at datetime default GETDATE(),
	updated_at datetime default GETDATE(),
	photo image default null,
	detail varchar(50),
    FOREIGN KEY(idSpecialty) REFERENCES specialty(idSpecialty) 
);
INSERT INTO 
    course(idSpecialty,[description],cicle,detail)
VALUES (1,'MATEMATICAS',2,'Introduccion a las mateamticas')
SELECT C.*,S.[description] Descripcion_Specialty FROM course C inner join specialty S ON (C.idSpecialty=S.idSpecialty)
----------------------------------------------------
CREATE TABLE registry(
    idRegistry int PRIMARY KEY IDENTITY,
    idTeacher int,
    idCourse int, 
    idSchedule int, 
    date_start date,
    date_end  date,
    created_at datetime default GETDATE(),
    updated_at datetime default GETDATE(),
    FOREIGN KEY(idCourse) REFERENCES course(idCourse),
    FOREIGN KEY(idSchedule) REFERENCES schedule(idSchedule),
    FOREIGN KEY(idTeacher) REFERENCES person(idPerson)
);

------------------------------------------------------------
CREATE TABLE registryDetail(
    idregistryDetail int PRIMARY KEY IDENTITY,
    idRegistry int,
    idStudent int,
    idSpecialty int,
    module varchar(20),
    created_at datetime default GETDATE(),
    updated_at datetime default GETDATE(),
    FOREIGN KEY(idRegistry) REFERENCES registry(idRegistry),
    FOREIGN KEY(idStudent) REFERENCES person(idPerson),
    FOREIGN KEY(idSpecialty) REFERENCES specialty(idSpecialty)
);

---------------------------------------------------------------
CREATE TABLE assistance(
    idAssistance int PRIMARY KEY IDENTITY,
    idregistryDetail int,
    [state] varchar(10) default 'F',
    created_at datetime default GETDATE(),
    update_at datetime default GETDATE(),
    FOREIGN KEY(idregistryDetail) REFERENCES registryDetail(idregistryDetail)
);

------------------------------------------------------------------
CREATE TABLE notes(
    idNotes int PRIMARY KEY IDENTITY,
    idregistryDetail int,
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
    created_at datetime default GETDATE(),
    updated_at datetime default GETDATE(),
    FOREIGN KEY(idregistryDetail) REFERENCES registryDetail(idregistryDetail)
);

-----------------------------------------------------------------
CREATE TABLE homework(
    idHomework int PRIMARY KEY IDENTITY,
    idCourse int,
    title varchar(30),
    post varchar(50),
    delivery varchar(50),
    created_at datetime default GETDATE(),
    updated_at datetime default GETDATE(),
    FOREIGN KEY (idCourse) REFERENCES course(idCourse)
);

-----------------------------------------------------------------
