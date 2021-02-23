CREATE TABLE PUBLICACION (
	cod_publicacion int IDENTITY NOT NULL, 
	titulo varchar(30) NOT NULL, 
	semana int NULL, fecha date NULL, 
	cod_curso int NOT NULL, 
	cod_curso2 int NOT NULL, 
	PRIMARY KEY (cod_publicacion)
);

CREATE TABLE CURSO (
	cod_curso int IDENTITY NOT NULL, 
	nombre varchar(50) NOT NULL UNIQUE, 
	descripcion varchar(100) NULL, 
	PRIMARY KEY (cod_curso)
);

ALTER TABLE PUBLICACION ADD CONSTRAINT FKPUBLICACIO566117 FOREIGN KEY (cod_curso2) REFERENCES CURSO (cod_curso);
