create database Sistema_Bancario;
use Sistema_Bancario;
--CREACION TABLAS

	--TABLA USUARIO
	create table usuario(
		id_usuario int primary key identity,
		primerApellido varchar(50),
		segundoApellido varchar(50),
		nombres varchar(50),
		create_at datetime,
		update_at datetime
	);

	--TABLA MODALIDAD
	create table modalidad(
		id_modalidad int primary key identity,
		[descripcion] varchar(70),
		detalle varchar(50),
		create_at datetime,
		update_at datetime
	);

	--TABLA GARANTIA
	create table garantia(
		id_garantia  int primary key identity,
		[descripcion] varchar(50),
		detalle varchar(50),
		create_at datetime,
		update_at datetime
	);

	--TABLA REGISTRO DEUDAS
	create table registroDeudas(
		id_registro int primary key identity,
		id_garantia int,
		foreign key(id_garantia) references garantia(id_garantia),
		id_modalidad int,
		foreign key(id_modalidad) references modalidad(id_modalidad),
		create_at datetime,
		update_at datetime
	);

	--TABLA DETALLE DE REGISTRO DEUDAS
	create table detalle_registroDeudas(
		id_detalle_registro int primary key identity,
		id_registro int,
		foreign key(id_registro) references registroDeudas(id_registro),
		id_usuario int,
		foreign key(id_usuario) references usuario(id_usuario),
		create_at datetime,
		update_at datetime
	);

	--TABLA REVISION DE PAGOS
	create table revision_pagos(
		id_pagos int primary key identity,
		id_detalle_registro int,
		foreign key(id_detalle_registro) references
		detalle_registroDeudas(id_detalle_registro),
		cuota1 int default 0,
		cuota2 int default 0,
		cuota3 int default 0,
		cuota4 int default 0,
		cuota5 int default 0,
		cuota6 int default 0,
		cuota7 int default 0,
		cuota8 int default 0,
		cuota9 int default 0,
		cuota10 int default 0,
		cuota11 int default 0,
		cuota12 int default 0,
		create_at datetime,
		update_at datetime
	);

	--TABLA CUOTAS CUMPLIDAS
	create table cuotasCumplidas(
		id_cuotasCumplidas int primary key identity,
		id_detalle_registro int,
		cuota_cumplida varchar(2) default 'NO'
		foreign key(id_detalle_registro) references
		detalle_registroDeudas(id_detalle_registro),
		[date] date,
		update_at datetime
	);

--INSERCIONES
	--Insercion a tabla usuario
	insert into usuario(primerApellido,segundoApellido,nombres,create_at,update_at)
	values
	('Leon','Ortiz','Diego',getdate(),getdate());

	--Insercion a tabla modalidad 
	insert into modalidad([descripcion],detalle,create_at,update_at)
	values
	('Prestamo en cuotas','mensual x 1 año',getdate(),getdate());

	--Insercion de garantia 
	insert into garantia([descripcion],detalle,create_at,update_at)
	values
	('Hipoteca','Local Comercial',getdate(),getdate());

	--Insercion a tabla registroDeudas
	insert into registroDeudas(id_garantia,id_modalidad,create_at,update_at)
	values
	(1,1,getdate(),getdate());


---CREACION STORE PROCEDURE 
	--2. Crear un procedimiento almacenado de manera libre donde aplicarias lo 
	 --aprendido en la pregunta 1 "Crear un procedimiento almacenado para generar registros"
			go
			CREATE PROCEDURE SP_DetalleCuotas_insert(
				@id_registro int,
				@id_usuario int 
			)
			AS
			BEGIN
				declare @id_detalle_registro int = @@identity
				declare @date  datetime = getdate();
				declare @date_end  datetime = dateadd(month,12,getdate());

				INSERT INTO detalle_registroDeudas(id_registro,id_usuario,create_at,update_at)
				VALUES(@id_registro,@id_usuario,GETDATE(),GETDATE())

				INSERT INTO revision_pagos(id_detalle_registro,create_at,update_at)
				VALUES(@id_detalle_registro,GETDATE(),GETDATE());
 
				while @date<@date_end 
				begin
				insert into cuotasCumplidas (id_detalle_registro,[date],update_at)
				values (@id_detalle_registro,@date,getdate())
				set @date = dateadd(month,1,@date);
				end
			END
			--EXECUTE SP
			EXEC SP_DetalleCuotas_insert 1, 1
			--SELECT 
			SELECT * FROM cuotasCumplidas
			SELECT * FROM detalle_registroDeudas
			SELECT * FROM revision_pagos

	--STORE PROCEDURE : Eliminacion de usuario del Sistema
			go
			CREATE PROCEDURE SP_eliminacion_Deudor(
				@id_detalle_registro int,
				@id_usuario int
			)
			as
			BEGIN	
				DELETE FROM revision_pagos 
					WHERE id_detalle_registro=@id_detalle_registro
				DELETE FROM cuotasCumplidas 
					WHERE id_detalle_registro=@id_detalle_registro
				DELETE FROM detalle_registroDeudas 
					WHERE id_detalle_registro=@id_detalle_registro
				DELETE FROM usuario 
					WHERE id_usuario=@id_usuario
			END





 
