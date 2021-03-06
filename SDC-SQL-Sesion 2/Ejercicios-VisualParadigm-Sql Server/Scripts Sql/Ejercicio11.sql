CREATE TABLE PROVEEDOR (
	COD_PROVEEDOR int IDENTITY NOT NULL, 
	RAZON_SOCIAL varchar(100) NULL UNIQUE, 
	RUC varchar(15) NULL, 
	DIRECCION varchar(100) NULL, 
	TELEFONO varchar(13) NULL, 
	CORREO_ELECTRONICO varchar(100) NULL, 
	PRIMARY KEY (COD_PROVEEDOR)
);

CREATE TABLE PRODUCTOS(
	cod_producto int IDENTITY NOT NULL, 
	nombre varchar(70) NULL, 
	precio numeric(19, 2) NOT NULL, 
	stockMinimo int NULL, 
	stockMaximo int NULL, 
	COD_PROVEEDOR int NOT NULL, 
	CATEGORIAcod_Categoria int NOT NULL, 
	PRIMARY KEY (cod_producto)
);

CREATE TABLE CATEGORIA (
	cod_Categoria int IDENTITY NOT NULL, 
	descripcion varchar(100) NULL, 
	PRIMARY KEY (cod_Categoria)
);

CREATE TABLE EMPLEADO (
	cod_empleado int IDENTITY NOT NULL, 
	nombre varchar(50) NULL, 
	apellido varchar(50) NULL, 
	direccion varchar(100) NULL, 
	telefono varchar(10) NULL UNIQUE, 
	PRIMARY KEY (cod_empleado)
);

CREATE TABLE PEDIDO (
	codigoPedido int IDENTITY NOT NULL, 
	fechaEmision date NULL, 
	fechaPedido date NULL, 
	fechaEntrega date NULL, 
	cod_empleado int NOT NULL, 
	cod_transporte int NOT NULL, 
	PRIMARY KEY (codigoPedido)
);

CREATE TABLE TRANSPORTE (
	cod_transporte int IDENTITY NOT NULL, 
	nombreCompany varchar(50) NOT NULL, 
	direccion varchar(100) NULL, 
	telefono varchar(10) NULL UNIQUE, 
	PRIMARY KEY (cod_transporte)
);

CREATE TABLE PRODUCTOS_PEDIDO (
	PRODUCTOScod_producto int NOT NULL, 
	PEDIDOcodigoPedido int NOT NULL, 
	cantidad int NULL, 
	PRIMARY KEY (PRODUCTOScod_producto, PEDIDOcodigoPedido)
);

ALTER TABLE PRODUCTOS_PEDIDO ADD CONSTRAINT FKPRODUCTOS_464283 FOREIGN KEY (PRODUCTOScod_producto) REFERENCES PRODUCTOS (cod_producto);
ALTER TABLE PRODUCTOS_PEDIDO ADD CONSTRAINT FKPRODUCTOS_77735 FOREIGN KEY (PEDIDOcodigoPedido) REFERENCES PEDIDO (codigoPedido);
ALTER TABLE PEDIDO ADD CONSTRAINT FKPEDIDO339013 FOREIGN KEY (cod_empleado) REFERENCES EMPLEADO (cod_empleado);
ALTER TABLE PRODUCTOS ADD CONSTRAINT FKPRODUCTOS269170 FOREIGN KEY (COD_PROVEEDOR) REFERENCES PROVEEDOR (COD_PROVEEDOR);
ALTER TABLE PRODUCTOS ADD CONSTRAINT FKPRODUCTOS49602 FOREIGN KEY (CATEGORIAcod_Categoria) REFERENCES CATEGORIA (cod_Categoria);
ALTER TABLE PEDIDO ADD CONSTRAINT FKPEDIDO211613 FOREIGN KEY (cod_transporte) REFERENCES TRANSPORTE (cod_transporte);
