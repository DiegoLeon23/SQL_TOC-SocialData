
create procedure sp_registry_detail_insert(
@id_registry int,
@id_student int,
@carrera_profesionalid int,
@moduloid int
)
as
begin
	insert into registro_detalle(registroid,estudianteid,fec_reg,fec_mod,carrera_profesionalId,moduloId)
	values(@id_registry,@id_student,getdate(),getdate(),@carrera_profesionalid,@moduloid);
	-- @@identity captura el codigo generado en la anterior consulta (insert)
	--
	declare @id_registry_detail int =@@identity;
		insert into notas(registro_detalleId) values (@id_registry_detail);
	-- 
	declare @date datetime = (select fecha_inicial from registro where id=@id_registry);
	declare @date_end datetime = DATEADD(week,12,getdate());
	while (@date < @date_end)
	begin
	INSERT INTO asistencia(registro_detalleId,[fecha],Estado)
	values (@id_registry_detail,@date,'F');
	set @date =DATEADD(week,1,@date)
	end

	
end

execute sp_registry_detail_insert 1,1
exec sp_registry_detail_insert 1,1
select * from asistencia;

