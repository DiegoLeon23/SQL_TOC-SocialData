CREATE TABLE POKEMON (
	cod_pokemon int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	fechaNacimiento date NULL, 
	tamaño int NULL, 
	cantidadEvoluciones int NULL, 
	ESPECIEcod_especie int NOT NULL, 
	PRIMARY KEY (cod_pokemon)
);

CREATE TABLE ESPECIE (
	cod_especie int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	descripcion varchar(100) NULL, 
	PRIMARY KEY (cod_especie)
);

ALTER TABLE POKEMON ADD CONSTRAINT FKPOKEMON161232 FOREIGN KEY (ESPECIEcod_especie) REFERENCES ESPECIE (cod_especie);
