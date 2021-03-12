-- instituciones
insert into marca(Descripcion)values('Social Data');
-- carreras
insert into carrera_profesional(Descripcion)values('Desarrollo de software');

-- en el campo DISCRIMINATOR permitira identificar que tipo de usuario es
-- 1 = estudiante
-- 2 = profesor
-- 3 = cordinador academico
insert into usuario(Paterno,Materno,Nombres,
Email,[Password],Discriminator,Fecha_nacimiento,celular)
values('cardenas','aquino','anthony','logicainformatica18@gmail.com',
'1234',1,getdate(),'99999999'),
('vargas','sotomayor','miguel','miguel18@gmail.com',
'1234',1,getdate(),'99999999'),
('barrientos','mendez','iridian','iridian8@gmail.com',
'1234',2,getdate(),'99999999');

-- curso
insert into curso(Descripcion,creditos,
Horas_semana,Ciclo
)values('Javascript',4,4,'I');
-- modulo
insert into modulo(Descripcion)values('I');
-- programacion horaria
insert into programacion_horaria(Hora_inicial,Hora_final,Descripcion)
values('08:00:00','10:00:00','08:00:00 - 10:00:00')
-- registro
insert into registro(profesorid,programacion_horariaId,
marcaId,cursoId,Fecha_inicial,Turno,Entregado)
values(6,1,1,3,getdate(),'M','no');
go


-- agregamos a los estudiantes a un registro (registro detalle)
-- agregamos las notas al estudiante
-- programamos las asistencias al estudiante
-- le damos una carrera profesional
-- le damos un modulo
execute sp_registry_detail_insert 1,4,1,1;
-- 
select * from programacion_horaria;
select * from marca;
select * from carrera_profesional;
select * from usuario;
select * from curso;
select * from carrera_profesional;
select * from registro_detalle;
select * from registro;
select * from asistencia