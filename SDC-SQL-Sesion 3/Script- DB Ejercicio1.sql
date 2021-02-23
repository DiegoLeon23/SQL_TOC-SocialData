--CREANDO BASE DE DATOS
Create database Ejercicio1;
--USANDO BD
Use Ejercicio1;
--CREANDO TABLA DEPARTAMENTO
Create table Departamento(
Depto_no int primary key,
Nombre_depto varchar(40),
localizacion varchar(45)
);

--CREANDO TABLA EMPLEADO Y RELACIONANDOLA CON DEPARTAMENTO
Create table Empleado(
Codigo_c varchar(40) primary key,
Nombre varchar(100),
Edad varchar(2),
Oficio varchar(30),
Dir varchar(30),
Fecha_Alt date,
Salario numeric(10,2),
Comision numeric(10,2),
Depto_no int,
Foreign key(Depto_no) references Departamento(Depto_no)
);

--INSERTANDO REGISTROS EN LA TABLA DEPARTAMENTO
Insert into  Departamento(Depto_no,Nombre_depto,localizacion)
values  (10,'Desarrollo Software','El Coyolar'),
        (20,'Analisis Sistema','Guadalupe'),
        (30,'Contabilidad','Subtiava'),
        (40,'Ventas','San Felipe');

--INSERTANDO REGISTROS EN LA TABLA EMPLEADO
Insert into Empleado(Codigo_c,Nombre,Edad,Oficio,Dir,Fecha_Alt,Salario,Comision,Depto_no)
values  ('Emp001','Rocha Vargas Hector','27','Vendedor','Leon','1983-05-12',12000,0,40),
        ('Emp002','Lopez Hernandez Julio','27','Analista','Chinandega','1982-07-14',13000,1500,20),
        ('Emp003','Esquivel Jose','31','Director','Juigalpa','1981-06-05',16700,1200,30),
        ('Emp004','Delgado Carmen','37','Vendedor','Leon','1983-03-02',13400,0,40),
        ('Emp005','Castillo Montes Luis','17','Vendedor','Masaya','1982-08-12',16309,1000,40),
        ('Emp006','Esquivel Leonel alfonso','26','Presidente','Nagarote','1981-09-12',15000,0,30),
        ('Emp007','Perez Luis','32','Empleado','Managua','1980-03-02',16890,0,10);

--8
SELECT E.nombre, E.salario , D.localizacion FROM  Empleado E INNER JOIN Departamento D ON (E.Depto_no=D.Depto_no)
WHERE Salario BETWEEN 10000 and 13000

--9
SELECT D.Nombre_depto,COUNT(*) as NumeroEmpleados FROM Departamento D INNER JOIN Empleado E ON (D.Depto_no=E.Depto_no)
GROUP BY  D.Nombre_depto
HAVING COUNT(*)>2
--10
SELECT E.Nombre,E.Salario, D.Nombre_depto FROM Empleado E INNER JOIN Departamento D ON (E.Depto_no=D.Depto_no)
WHERE oficio= (SELECT oficio FROM Empleado WHERE Nombre LIKE 'CASTILLO MONTES LUIS')
---11
SELECT E.*, D.Nombre_depto FROM Empleado E INNER JOIN Departamento D ON (E.Depto_no=D.Depto_no)
WHERE D.Nombre_depto='CONTABILIDAD'
ORDER BY E.Nombre
--12
SELECT E.Nombre, E.Oficio FROM Empleado E 
WHERE E.Oficio IN ('ANALISTA','EMPLEADO')
--13
SELECT CAST(AVG(Salario) AS decimal(19,2)) as [Salario Promedio]
FROM Empleado 
--14
SELECT MAX(Tabla.salario) [Maximo Salario] 
FROM 
	(SELECT E.Nombre,E.Salario as salario , D.Nombre_depto 
	FROM Empleado E INNER JOIN Departamento D ON (E.Depto_no=D.Depto_no)
	WHERE D.Depto_no=40) as Tabla
	
--15

Create Table [user] (cod_user  smallint identity primary key,[name] varchar(50),Pass nvarchar(100) COLLATE Latin1_General_CS_AI NULL);goinsert into [user](name,pass)values('anthony01','A01');goinsert into [user](name,pass)values('anthony03',ENCRYPTBYPASSPHRASE('1','1234')); ---Para encriptar contraseñasgo

SELECT cod_user,[name], convert(varchar(max),DECRYPTBYPASSPHRASE('1',pass)) FROM [user] --´para visualizar contraseñas encriptadas




