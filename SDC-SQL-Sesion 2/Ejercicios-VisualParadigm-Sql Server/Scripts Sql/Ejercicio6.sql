CREATE TABLE LIBRO (
	codigo_libro int IDENTITY NOT NULL, 
	titulo varchar(50) NULL, 
	fechaPublicacion date NULL, 
	numeroPagina int NULL, 
	AUTORcodigoAutor int NOT NULL, 
	GENEROcodigoGenero int NOT NULL, PRIMARY KEY (codigo_libro)
);


CREATE TABLE AUTOR (
	codigoAutor int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	apellido varchar(50) NULL, 
	PRIMARY KEY (codigoAutor)
);

CREATE TABLE GENERO (
	codigoGenero int IDENTITY NOT NULL, 
	nombreGenero varchar(50) NULL, 
	LIBROcodigo_libro int NOT NULL, 
	PRIMARY KEY (codigoGenero)
);

ALTER TABLE LIBRO ADD CONSTRAINT FKLIBRO601622 FOREIGN KEY (AUTORcodigoAutor) REFERENCES AUTOR (codigoAutor);
ALTER TABLE LIBRO ADD CONSTRAINT FKLIBRO930572 FOREIGN KEY (GENEROcodigoGenero) REFERENCES GENERO (codigoGenero);
