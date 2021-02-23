CREATE DATABASE educacion;
use educacion;

create table usuario(
	cod_usuario int primary key,
	paterno varchar(50),
	materno varchar(50),
	nombres varchar(50),
	[password] varchar(50),
	nombre_usuario varchar(50)
);
go

INSERT INTO usuario(cod_usuario,paterno,materno,nombres,[password],nombre_usuario) 
			VALUES (1,'LEON','ORTIZ','DIEGO ENRIQUE','DiegoLeon23','DiegoLO');

SELECT * FROM usuario;

go --SEPARADOR DE LOTES
--procedimiento almacenado insert-create en CRUD
CREATE PROCEDURE SP_usuario_insert(
	@cod_usuario int ,
	@paterno varchar(50),
	@materno varchar(50),
	@nombres varchar(50),
	@password varchar(50),
	@nombre_usuario varchar(50)
)
as 
	INSERT INTO usuario(cod_usuario,paterno,materno,nombres,[password],nombre_usuario) 
				VALUES (@cod_usuario,@paterno,@materno,@nombres,@password,@nombre_usuario);
go 


EXEC SP_usuario_insert 2,'NAVARRO','GUTIERREZ','NICOLE RACHELL','NicoNavarro23','Nicozzz1505'

go
--procedimiento almacenado select-read en CRUD
CREATE PROCEDURE SP_usuario_select
as 
	SELECT * FROM usuario;
go 

--procedimiento almacenado update-update(actualizar) en CRUD
CREATE PROCEDURE SP_usuario_update(
	@cod_usuario int ,
	@paterno varchar(50),
	@materno varchar(50),
	@nombres varchar(50),
	@password varchar(50),
	@nombre_usuario varchar(50)
)
as 
	UPDATE usuario set 
		paterno=@paterno,
		materno=@materno,
		nombres=@nombres,
		[password]=@password,
		nombre_usuario=@nombre_usuario
	WHERE cod_usuario=@cod_usuario
go 

--procedimiento almacenado delete-delete(eliminar) en CRUD
CREATE PROCEDURE SP_usuario_eliminar (@cod_usuario int)
as
	DELETE FROM usuario 
	WHERE cod_usuario=@cod_usuario
go

-- procedimiento almacenada para login de usuario 
CREATE PROCEDURE SP_usuario_login(
	@nombre_usuario varchar(50),
	@password varchar(50)
)
as
	SELECT * 
	FROM usuario 
	WHERE nombre_usuario=@nombre_usuario and [password]=@password
go