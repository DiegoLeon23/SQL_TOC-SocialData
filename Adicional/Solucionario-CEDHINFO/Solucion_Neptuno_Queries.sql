USE Neptuno;
SELECT * FROM productos;
select * from CLIENTES
select * from Empleados
SELECT top 3 * FROM Pedidos
SELECT * FROM detallesdepedidos

---1. Mostrar los clientes que residen en el país de Alemania (NombreCompañia,Dirección y CodPostal).
SELECT NombreCompañia,
	  Direccion, 
	  CodPostal as [Codigo Postal] 
FROM clientes 


---2. Listar los productos cuyo precio de unidad este entre 45 y 90 soles (nombreProducto, PrecioUnidad).

SELECT nombreProducto, 
	   precioUnidad 
FROM productos 
WHERE precioUnidad BETWEEN 45 and 90
---3. Listar a los clientes que no tienen Fax. (nombre compañia, ciudad y país).SELECT 	NombreCompañia, 	Ciudad, 	Pais FROM clientes WHERE Fax is null ---4. Seleccionar los clientes (nombre de compañía, dirección y país), cuyo nombre compañía empiecen con las letras A, B, C o D, 
---pertenezcan al país de Alemania y ordenarlos de manera ascendente por el campo dirección.

SELECT NombreCompañia, Direccion, Pais 
FROM clientes 
WHERE (NombreCompañia like '[A-D]%') 
		and Pais= 'Alemania'
ORDER BY 2     

---5. Total de empleados nacidos antes del 1 de enero de 1960

SELECT COUNT(*) 
	CantidadEmpleados 
FROM Empleados 
WHERE FechaNacimiento < CAST('1960-01-01' AS DATE)

--- 6. Mostrar la cantidad de cliente por país y ordenarlos de manera descendente.
SELECT 
	Pais, 
	Count(*) as NroCliente 
FROM clientes 
GROUP BY Pais
ORDER BY Pais DESC

--- 7. Mostrar la cantidad de cliente por país donde dicha cantidad sea mayor igual 6.

SELECT 
	Pais, 
	Count(*) as NroCliente 
FROM clientes 
GROUP BY Pais
HAVING Count(*)>6

--- 8. Seleccionar los pedidos que ser realizaron en agosto de cualquier año por
---los empleados con código (idempleado) 2 y 5 y cuyo código de clientes
---comiencen con las letras de la A hasta la G

SELECT * FROM Pedidos 
WHERE month(FechaPedido)='08' and  IdEmpleado IN(2,5) and IdCliente LIKE '[A-G]%'


---9. Mostrar los 5 mejores productos con precio de unidad.

SELECT TOP 5 nombreProducto,precioUnidad 
FROM productos 
ORDER BY precioUnidad DESC
	---SOLUCION USANDO RANK
SELECT top 5 nombreProducto,
			precioUnidad ,
			RANK() OVER (ORDER BY precioUnidad DESC) as Ranking 
FROM productos 

---10. Listar los campos nombrecategoria y descripción de la tabla Categoria, de
---los productos cuyo precioUnidad este entre 45 y 55. Toda esta información
---debe ser ordenada de manera descendente por el campo nombrecategoria

SELECT nombrecategoria, descripcion 
FROM categorias
WHERE idcategoria in (SELECT idCategoria 
					  FROM productos 
					  WHERE precioUnidad BETWEEN 45 and 55)
ORDER BY 1

---11. Listar los campos nombreproducto, categoriaproducto, preciounidad y
---unidadesenexistencia de todos los productos vendidos en una cantidad
---mayor e igual a 100.SELECT 	nombreProducto,	categoriaProducto,	precioUnidad,	unidadesEnExistencia FROM productos WHERE idproducto in ( SELECT  idproducto 					  FROM detallesdepedidos 					  WHERE cantidad>=100					  GROUP BY idproducto					 )order by 1--- 12. Listar los campos nombreproducto y categoriaproducto de aquellos
---productos que pertenecen a la categoría bebidas.

SELECT nombreProducto,categoriaProducto 
FROM productos
WHERE idCategoria in (SELECT idCategoria 
					  FROM categorias 
					  WHERE nombrecategoria= 'Bebidas')

--- 13. Mostrar los clientes (nombrecompañia, telefono) que hayan pasado al
--- menos un pedido en el año 1996.SELECT NombreCompañia,Telefono FROM clientes WHERE idCliente in (SELECT idCliente 					FROM Pedidos 					WHERE year(FechaPedido)='1996')---19. Mostrar los campos “Nombre y Apellidos” y “Cargo” de empleados de sexo masculino.

SELECT CONCAT(Nombre,' ',Apellidos) as [Nombre y Apellido],
	   cargo , 
	   Tratamiento 
FROM Empleados 
WHERE Tratamiento in ('Dr.','Sr.')

--- 20. Mostrar los campos “nombreproducto” y la última letra del campo “categoría producto” de la tabla productos.

SELECT nombreProducto,RIGHT(categoriaProducto,1) as [Categoria Producto] 
FROM productos

--- 21. De la tabla Clientes mostrar el campo “nombrecompañia” en mayúsculas y el campo “direccion” en minúsculas.

SELECT UPPER(NombreCompañia) as [Nombre Compañia], 
	   LOWER(Direccion) as [Direccion] 
FROM clientes

--- 23. Mostrar el nombre de los productos y sus unidades en existencia de aquellos
---productos que pertenecen a la categoría Bebidas y con unidades en
---existencia menor a 25.

SELECT P.nombreProducto, 
	   P.unidadesEnExistencia 
FROM productos as P 
	INNER JOIN categorias as C ON (P.idCategoria=C.idcategoria)
WHERE C.nombrecategoria='Bebidas' and P.unidadesEnExistencia<25
 

---24. Mostrar el nombre del empleado y cuantos pedidos realizo.

SELECT E.Nombre as Empleado, 
		 COUNT(P.IdPedido) as NroPedido
FROM Empleados as E INNER JOIN Pedidos as P ON (E.IdEmpleado=P.IdEmpleado)
GROUP BY E.Nombre
ORDER BY 1


--- 25. Seleccionar las categorías que tengan más 5 productos y el precio de unidad
---de cada producto sea mayor igual a 15. Mostrar el nombre de la categoría y
---el número de productos.

SELECT C.nombrecategoria as NombreCategoria, 
	   COUNT(P.idproducto) as CantidadProductos 
FROM categorias AS C 
	INNER JOIN productos as P ON (C.idcategoria=P.idCategoria)
WHERE  P.precioUnidad>=15
GROUP BY C.nombrecategoria
HAVING COUNT(P.idproducto)>5


---26. Mostrar el total pagado por cada orden de compras solo del mes de enero del 1996.

SELECT P.IdPedido, 
	 SUM(DP.preciounidad*DP.cantidad-DP.descuento) as TotalPagado 
FROM Pedidos P INNER JOIN detallesdepedidos as DP ON (P.IdPedido=DP.idpedido)
WHERE YEAR(FechaPedido)=1996 and MONTH(FechaPedido)=01 
GROUP BY P.IdPedido


---27. Crear un procedimiento almacenado que cuente los productos que empiezan con un determinado carácter.
---Ejemplo: Los productos que empiezan con “T
GO
CREATE PROCEDURE ContarProductosxCaracter (
	@caracter varchar(2)
)
AS
SELECT COUNT(*) as CantidadProductos
FROM productos
WHERE nombreProducto LIKE CONCAT(@caracter,'%')

EXEC ContarProductosxCaracter 'T'

	---DROP PROCEDURE ContarProductosxCaracter

---28. Realizar un procedimiento almacenado que devuelva el precio mayor y el precio menor de según la categoría.

GO 
CREATE PROCEDURE SP_Precios_Mayor_Menor (@nombreCategoria varchar(30))
AS 
	SELECT 
		   C.nombrecategoria,
		   MAX(DP.preciounidad) as PrecioMayor,
		   MIN(DP.preciounidad) as PrecioMenor  
	FROM categorias as C INNER JOIN productos as P ON(C.idcategoria=P.idCategoria) 
						 INNER JOIN detallesdepedidos as DP ON (P.idproducto = DP.idproducto)
	WHERE C.nombrecategoria=@nombreCategoria
	GROUP BY C.nombrecategoria
	
EXEC SP_Precios_Mayor_Menor 'Bebidas'

----29. Realizar un procedimiento que permita eliminar el cliente según su
---identificación (idcliente). Si el cliente realizo algún pedido mostrar el siguiente
---mensaje “No se puede eliminar al cliente” caso contrario se procede a
---eliminar al cliente y mostrar el siguiente mensaje “Cliente eliminado”.
GO
CREATE PROCEDURE SP_eliminarCliente (@idcliente varchar(20))
AS	
	IF  EXISTS(SELECT IdCliente FROM clientes WHERE @idcliente=IdCliente)
	BEGIN
		IF NOT EXISTS (SELECT IdCliente FROM Pedidos WHERE @idcliente=IdCliente)
		BEGIN
			DELETE FROM clientes WHERE idCliente=@idcliente
			PRINT('SE ELIMINO AL CLIENTE')
		END
		ELSE
		BEGIN
			PRINT('NO SE PUEDE ELIMINAR AL CLIENTE')
		END
	END
	ELSE
	BEGIN
		PRINT('EL CLIENTE NO EXISTE')
	END

EXEC SP_eliminarCliente 'PARIS'
	---Los clientes que no tienen pedidos
	---SELECT C.idcliente FROM clientes as C LEFT JOIN Pedidos as P ON(C.idCliente=P.IdCliente) WHERE P.IdCliente is NULL

---30. crear un procedimiento almacenado que muestre los productos que se encuentra en un rango de precio.
---Ejemplo: Productos con un rango de precio de unidad entre 10 y 20.

GO
CREATE PROCEDURE rangoPrecios (@rangMin int , @rangMax int)
AS
	SELECT * 
	FROM productos 
	WHERE precioUnidad BETWEEN @rangMin and @rangMax
	ORDER BY precioUnidad

EXEC rangoPrecios 10,20
	


