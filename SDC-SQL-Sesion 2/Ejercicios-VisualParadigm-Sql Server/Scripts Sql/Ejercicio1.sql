CREATE TABLE Laboratorio (
	cod_laboratorio int IDENTITY NOT NULL, 
	ubicacion varchar(50) NOT NULL, 
	PRIMARY KEY (cod_laboratorio)
);

CREATE TABLE Computadora (
	cod_computadora int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	componentes varchar(100) NOT NULL, 
	cod_laboratorio int NOT NULL, 
	PRIMARY KEY (cod_computadora)
);

ALTER TABLE Computadora ADD CONSTRAINT FKComputador596046 FOREIGN KEY (cod_laboratorio) REFERENCES Laboratorio (cod_laboratorio);
