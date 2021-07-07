-- PARTE I --


USE emarket;

SELECT * FROM categorias;

SELECT CategoriaNombre AS CategoriaNom, 
		Descripcion AS Descrição 
FROM categorias;

SELECT * FROM productos;

SELECT * FROM productos 
WHERE Discontinuado>0; 

SELECT * FROM productos 
WHERE ProveedorID = 8;

SELECT * FROM productos 
WHERE PrecioUnitario BETWEEN 10 AND 22;

SELECT * FROM productos 
WHERE UnidadesStock < NivelReorden;

SELECT * FROM productos 
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas=0;

SELECT Contacto, Compania, Titulo, Pais 
FROM clientes ORDER BY Pais;

SELECT * FROM clientes 
WHERE Titulo = "Owner";

SELECT * FROM clientes 
WHERE Contacto LIKE 'C%';

SELECT * FROM facturas 
ORDER BY FechaFactura;

SELECT * FROM facturas 
WHERE PaisEnvio = 'USA' AND EnvioVia !=3;

SELECT * FROM facturas 
WHERE ClienteID = 'GOURL';

SELECT * FROM facturas 
WHERE EmpleadoID = 2 
OR EmpleadoID = 3 
OR EmpleadoID = 5 
OR EmpleadoID = 8 
OR EmpleadoID = 9;

SELECT * FROM facturas 
WHERE EmpleadoID IN (2,3,5,8,9);



-- Parte II --



SELECT * FROM productos 
ORDER BY preciounitario DESC;

SELECT * FROM productos 
ORDER BY preciounitario DESC LIMIT 5;

SELECT * FROM productos 
ORDER BY unidadesStock DESC LIMIT 10;

SELECT facturaID, productoID, cantidad FROM facturadetalle;

SELECT facturaID, productoID, cantidad FROM facturadetalle 
ORDER BY cantidad DESC;

SELECT facturaID, productoID, cantidad FROM facturadetalle 
WHERE cantidad BETWEEN 50 AND 100
ORDER BY cantidad DESC;

SELECT facturaID AS 'InvoiceID', 
		productoID AS 'Product(ProductID)', 
		preciounitario * cantidad AS 'Total(UnitPrice*Quantity)' 
FROM facturadetalle;



-- EXTRAS --



SELECT * FROM clientes 
WHERE pais IN ('Brazil','Mexico') 
OR titulo LIKE 'sales%';

SELECT * FROM clientes WHERE compania LIKE 'a%';

SELECT ciudad AS Cidade, contacto AS 'Nome e Sobrenome' FROM clientes; 

SELECT * FROM facturas WHERE facturaID BETWEEN 10000 AND 10500;

SELECT * FROM facturas WHERE facturaID BETWEEN 10000 AND 10500 
OR clienteID LIKE 'b%';

SELECT * FROM facturas WHERE ciudadenvio = 'vancouver'
OR envioVia = 3;

SELECT empleadoID, apellido FROM empleados WHERE apellido = 'Buchanan';

SELECT * FROM facturas WHERE empleadoID = 5;