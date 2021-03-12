---Sesion 3
 --1 -Crear un procedimiento almacenado para generar registros.
CREATE PROCEDURE SP_registro_Detalle_insert(
 @id_registry int,
 @id_student int 
 )
 as
	 INSERT INTO registry_detail(id_registry,id_student,create_at,update_at)
	 VALUES(@id_registry,@id_student,GETDATE(),GETDATE())

	 declare @id_registry_detail int =@@identity
	 INSERT INTO qualification(id_registry_detail,create_at,update_at)
	 VALUES(@id_registry_detail,GETDATE(),GETDATE());
 
	 declare @date  datetime = (select fecha_inicial from registry where id=@id_registry);
	 declare @date_end  datetime = dateadd(week,12,getdate());

	 while @date<@date_end 
	 begin
		insert into assistance (id_registry_detail,[date],update_at,estado)
		values (@id_registry_detail,@date,getdate(),'F')
		set @date = dateadd(week,1,@date);
	 end
	 

 execute SP_registro_Detalle_insert 2,2;

 select * from assistance
 select * from qualification
 select * from registry_detail
 select * from student
 select * from registry




