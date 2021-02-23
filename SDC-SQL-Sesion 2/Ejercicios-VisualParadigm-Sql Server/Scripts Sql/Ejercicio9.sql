CREATE TABLE PASAJERO (
	DNI varchar(10) NOT NULL, 
	nombre varchar(50) NULL, 
	apellidos varchar(50) NULL, 
	razonSocial varchar(50) NULL, 
	RUC varchar(20) NULL, 
	PRIMARY KEY (DNI)
);

CREATE TABLE EMPLEADO (
	DNI varchar(10) NOT NULL, 
	nombres varchar(50) NULL, 
	apellidos varchar(50) NULL, 
	PRIMARY KEY (DNI)
);

CREATE TABLE BOLETO (
	numBoleto int IDENTITY NOT NULL, 
	fechaEmision date NULL, 
	fechaViaje date NULL, 
	horaViaje int NULL, 
	numeroAsiento int NULL, 
	origen varchar(50) NULL, 
	destino varchar(50) NULL, 
	valor numeric(19, 2) NULL, 
	PASAJERODNI varchar(10) NOT NULL, 
	EMPLEADODNI varchar(10) NOT NULL, 
	PRIMARY KEY (numBoleto)
);

ALTER TABLE BOLETO ADD CONSTRAINT FKBOLETO142995 FOREIGN KEY (PASAJERODNI) REFERENCES PASAJERO (DNI);
ALTER TABLE BOLETO ADD CONSTRAINT FKBOLETO920490 FOREIGN KEY (EMPLEADODNI) REFERENCES EMPLEADO (DNI);
