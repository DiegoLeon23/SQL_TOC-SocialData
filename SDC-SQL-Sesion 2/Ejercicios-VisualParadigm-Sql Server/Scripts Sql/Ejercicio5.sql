CREATE TABLE MILITANTE (
	DNI varchar(10) NOT NULL, 
	nombres varchar(50) NULL, 
	apellidoPaterno varchar(50) NULL, 
	apellidoMaterno varchar(50) NULL, 
	codigo varchar(10) NOT NULL, 
	PRIMARY KEY (DNI)
);


CREATE TABLE PARTIDO_POLITICO (
	codigo varchar(10) NOT NULL, 
	nombre varchar(50) NULL, 
	fechaFundacion date NULL, 
	PRIMARY KEY (codigo)
);

ALTER TABLE MILITANTE ADD CONSTRAINT FKMILITANTE961319 FOREIGN KEY (codigo) REFERENCES PARTIDO_POLITICO (codigo);
