CREATE TABLE INSTRUMENTOS (
	cod_instrumento int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	precio numeric(19, 2) NULL, 
	stock int NULL, 
	fecha_fabricacion date NULL, 
	CATEGORIAcod_categoria int NOT NULL, 
	PRIMARY KEY (cod_instrumento)
);

CREATE TABLE CATEGORIA (
	cod_categoria int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	PRIMARY KEY (cod_categoria)
);

ALTER TABLE INSTRUMENTOS ADD CONSTRAINT FKINSTRUMENT403841 FOREIGN KEY (CATEGORIAcod_categoria) REFERENCES CATEGORIA (cod_categoria);
