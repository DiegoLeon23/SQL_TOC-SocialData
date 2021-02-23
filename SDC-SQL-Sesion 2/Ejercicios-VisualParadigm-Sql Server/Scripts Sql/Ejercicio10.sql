CREATE TABLE CLIENTE (
	codigoCliente int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	apellido varchar(50) NULL, 
	direccion varchar(50) NULL, 
	razonSocial varchar(50) NULL, 
	RUC varchar(20) NULL, 
	PRIMARY KEY (codigoCliente)
);

CREATE TABLE PRODUCTO (
	codigoProducto int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	precioUnitario numeric(19, 2) NULL, 
	stockMaximo int NULL, 
	stockMinimo int NULL, 
	codigoCategoria int NOT NULL, 
	PRIMARY KEY (codigoProducto)
);

CREATE TABLE CATEGORIA (
	codigoCategoria int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	PRIMARY KEY (codigoCategoria)
);

CREATE TABLE BOLETA (
	numBoleta int IDENTITY NOT NULL, 
	fechaEmision date NULL, 
	total numeric(19, 2) NULL, 
	codigoEmpleado int NULL, 
	codigoCliente int NOT NULL, 
	PRIMARY KEY (numBoleta)
);

CREATE TABLE DETALLE_PRODUCTO (
	numBoleta int NOT NULL, 
	codigoProducto int NOT NULL, 
	cantidad int NULL, 
	PRIMARY KEY (numBoleta, codigoProducto)
);

ALTER TABLE DETALLE_PRODUCTO ADD CONSTRAINT FKDETALLE_PR885840 FOREIGN KEY (numBoleta) REFERENCES BOLETA (numBoleta);
ALTER TABLE DETALLE_PRODUCTO ADD CONSTRAINT FKDETALLE_PR869529 FOREIGN KEY (codigoProducto) REFERENCES PRODUCTO (codigoProducto);
ALTER TABLE BOLETA ADD CONSTRAINT FKBOLETA496591 FOREIGN KEY (codigoCliente) REFERENCES CLIENTE (codigoCliente);
ALTER TABLE PRODUCTO ADD CONSTRAINT FKPRODUCTO66908 FOREIGN KEY (codigoCategoria) REFERENCES CATEGORIA (codigoCategoria);
