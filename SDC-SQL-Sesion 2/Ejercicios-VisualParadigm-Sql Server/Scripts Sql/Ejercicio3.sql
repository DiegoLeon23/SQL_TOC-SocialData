CREATE TABLE POKEMON (
	cod_pokemon int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	fechaNacimiento date NULL, 
	tamaño int NULL, 
	cantidadEvoluciones int NULL, 
	PRIMARY KEY (cod_pokemon)
);

CREATE TABLE ESPECIE (
	cod_especie int IDENTITY NOT NULL, 
	nombre varchar(100) NULL, 
	descripcion varchar(100) NULL, 
	PRIMARY KEY (cod_especie)
);

CREATE TABLE POKEMON_ESPECIE (
	cod_pokemon int NOT NULL, 
	cod_especie int NOT NULL, 
	PRIMARY KEY (cod_pokemon, cod_especie)
);

ALTER TABLE POKEMON_ESPECIE ADD CONSTRAINT FKPOKEMON_ES503041 FOREIGN KEY (cod_pokemon) REFERENCES POKEMON (cod_pokemon);
ALTER TABLE POKEMON_ESPECIE ADD CONSTRAINT FKPOKEMON_ES944603 FOREIGN KEY (cod_especie) REFERENCES ESPECIE (cod_especie);
