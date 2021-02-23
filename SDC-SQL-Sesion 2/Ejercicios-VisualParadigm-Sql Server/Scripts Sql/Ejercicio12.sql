CREATE TABLE ALUMNO (
	codigoAlumno int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	apellido varchar(50) NULL, 
	direccion varchar(100) NULL, 
	telefono varchar(10) NULL, 
	PRIMARY KEY (codigoAlumno)
);

CREATE TABLE SECRETARIA (
	codigoSecretaria int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	apellido varchar(50) NULL, 
	direccion varchar(100) NULL, 
	telefono varchar(10) NULL, 
	PRIMARY KEY (codigoSecretaria)
);

CREATE TABLE SERVICIO (
	codigoConcepto int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	monto numeric(19, 2) NULL,
	PRIMARY KEY (codigoConcepto)
);

CREATE TABLE MATRICULA (
	numero int IDENTITY NOT NULL, 
	fecha date NULL, 
	AcodigoAlumno int NOT NULL, 
	codigoSecretaria int NOT NULL, 
	codigoCarrera int NOT NULL, 
	PRIMARY KEY (numero)
);

CREATE TABLE CARRERA (
	codigoCarrera int IDENTITY NOT NULL, 
	nombreCarrera varchar(50) NULL, 
	PRIMARY KEY (codigoCarrera)
);

CREATE TABLE RECIBO_PAGO (
	numeroRecibo int IDENTITY NOT NULL, 
	fecha date NULL, total numeric(19, 2) NULL, 
	MATRICULA_numero int NOT NULL, 
	codigoConcepto int NOT NULL, 
	PRIMARY KEY (numeroRecibo)
);

ALTER TABLE RECIBO_PAGO ADD CONSTRAINT FKRECIBO_PAG224861 FOREIGN KEY (MATRICULA_numero) REFERENCES MATRICULA (numero);
ALTER TABLE MATRICULA ADD CONSTRAINT FKMATRICULA692179 FOREIGN KEY (AcodigoAlumno) REFERENCES ALUMNO (codigoAlumno);
ALTER TABLE MATRICULA ADD CONSTRAINT FKMATRICULA823825 FOREIGN KEY (codigoSecretaria) REFERENCES SECRETARIA (codigoSecretaria);
ALTER TABLE MATRICULA ADD CONSTRAINT FKMATRICULA425698 FOREIGN KEY (codigoCarrera) REFERENCES CARRERA (codigoCarrera);
ALTER TABLE RECIBO_PAGO ADD CONSTRAINT FKRECIBO_PAG474339 FOREIGN KEY (codigoConcepto) REFERENCES SERVICIO (codigoConcepto);
