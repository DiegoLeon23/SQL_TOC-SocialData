SELECT top 1* FROM categorias
SELECT top 1 * FROM productos

select * from pedidos

CREATE FUNCTION FN_Pedidos (
@idcliente varchar(10)
)
RETURNS TABLE
AS
	RETURN (SELECT C.IdCliente, COUNT(*) as NumPedidos FROM pedidos P INNER JOIN clientes C ON (P.IdCliente=C.IdCliente)
		WHERE C.IdCliente=@idcliente GROUP BY C.IdCliente)

SELECT * FROM FN_Pedidos('ALFAA')
go

CREATE FUNCTION FN_MINUTO(
@hora int,
@minuto int
)
RETURNS int
AS
BEGIN
	declare @minutos int
	SET @minutos = (@hora*60 + @minuto)
	RETURN @minutos
END
		
-- CREAR UNA FUNCION QUE PERMITA  ASIGNAR 


			--CREAR UNA FUNCION QUE DEVUELVA UN PORCENTAJE ingresado


--CANTIDAD DE A�OS DE LOS EMPLEADOS 

SELECT nombre, (YEAR(GETDATE()) - year(FechaNacimiento)) as a�o_nacimiento FROM empleados

--CANTIDAD DE A�OS DE CONTRATADO

SELECT nombre, DATEDIFF(year,Fechacontratacion,GETDATE()) as a�o_contratacion FROM empleados


--FUNCIONES DE CADENA DE TEXTO


SELECT (nombre + SPACE(3) + Apellido) as nombres into Tabla1 FROM empleados


SELECT LEFT(nombres,CHARINDEX('',nombres)), SUBSTRING(nombres,CHARINDEX('',nombres),20) from Tabla1


-- FUNCIONES DE CADENA DE TEXTO

CREATE TABLE DATOS(