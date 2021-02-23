CREATE TABLE PROVEEDOR (
	codProveedor int IDENTITY NOT NULL, 
	razonSocial varchar(50) NULL, 
	direccion varchar(50) NULL, 
	telefono varchar(15) NULL, 
	email varchar(50) NULL, 
	PRIMARY KEY (codProveedor)
);

CREATE TABLE CATEGORIA (
	codigoCategoria int IDENTITY NOT NULL, 
	nombreCategoria varchar(50) NULL, 
	PRIMARY KEY (codigoCategoria)
);

CREATE TABLE PRODUCTO (
	codigoProducto int IDENTITY NOT NULL, 
	nombreProducto varchar(50) NULL, 
	precioUnitario numeric(19, 2) NULL, 
	stockMaximo int NULL, 
	stockMinimo int NULL, 
	PROVEEDORcodProveedor int NOT NULL, 
	CATEGORIAcodigoCategoria int NOT NULL, 
	PRIMARY KEY (codigoProducto)
);

ALTER TABLE PRODUCTO ADD CONSTRAINT FKPRODUCTO341590 FOREIGN KEY (PROVEEDORcodProveedor) REFERENCES PROVEEDOR (codProveedor);
ALTER TABLE PRODUCTO ADD CONSTRAINT FKPRODUCTO495994 FOREIGN KEY (CATEGORIAcodigoCategoria) REFERENCES CATEGORIA (codigoCategoria);
