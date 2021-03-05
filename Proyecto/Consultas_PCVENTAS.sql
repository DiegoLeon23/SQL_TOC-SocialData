---CONSULTA 1 
SELECT 
    F.IdFactura, 
    C.NomCliente, 
    C.Email, 
    F.Fecha
FROM Clientes C INNER JOIN Facturas F ON C.Idcliente = F.IdCliente
WHERE (F.Fecha='20020814');

---CONSULTA 2

SELECT 
    D.IdFactura, 
    A.NomArticulo, 
    D.Cantidad, 
    D.PreVenta
FROM Articulos A INNER JOIN Detalles D ON A.IdArticulo = D.IdArticulo
WHERE (D.IdFactura=10325);

---CONSULTA 3
SELECT 
    F.IdFactura, 
    C.NomCliente, 
    C.Email, 
    F.Fecha
FROM Clientes C INNER JOIN Facturas  F ON C.Idcliente = F.IdCliente
WHERE (F.Fecha<'20000101');

---CONSULTA 4
SELECT 
    A.IdArticulo, 
    A.NomArticulo, 
    A.Stock, 
    C.Nombre
FROM Categorias C INNER JOIN Articulos A ON C.Categoria = A.Categ
WHERE (A.Stock Between 50 And 100);

---CONSULTA 5
SELECT 
    F.IdFactura, 
    C.NomCliente, 
    C.Email, 
    F.Fecha
FROM Clientes C INNER JOIN Facturas F ON C.Idcliente = F.IdCliente
WHERE (F.Fecha Between '20020110' AND '20020115');

---CONSULTA 6
SELECT 
    C.Idcliente,
    C.NomCliente, 
    C.Email
FROM Clientes C
WHERE (C.Email Like '%pe');

---CONSULTA 7

SELECT 
    C.Idcliente, 
    C.NomCliente, 
    C.Email
FROM Clientes C
WHERE (C.NomCliente Like '%Garcia%');


---CONSULTA 8

SELECT 
    A.IdArticulo, 
    A.NomArticulo, 
    A.Stock, 
    C.Nombre
FROM Categorias C INNER JOIN Articulos A ON C.Categoria = A.Categ
WHERE (A.IdArticulo Like 'A002%');

---CONSULTA 9

SELECT 
    C.Idcliente, 
    C.NomCliente, 
    C.Email
FROM Clientes C
WHERE CHARINDEX(' ',C.NomCliente)=4;


---CONSULTA 10

SELECT 
    IdFactura, 
    IdArticulo, 
    PreVenta, 
    Cantidad, 
   CONVERT(decimal(18,2), [Preventa]*[Cantidad]) AS Monto
FROM Detalles;


