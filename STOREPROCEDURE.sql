select * from Producto

EXEC SP_INS_Producto 'blusa sin manga','Gris',7

CREATE PROC SP_INS_Producto(
	@descripcion varchar(50),
	@color varchar(20),
	@precio money
)
AS

INSERT INTO Producto VALUES(@descripcion,@color,@precio)


-------nuevo producto-------

EXEC SP_SEL_Productos 4

CREATE PROC SP_SEL_Productos(
	@idProducto int = 0
)
AS
if @idProducto > 0
	SELECT * FROM Producto WHERE idProducto = @idProducto
else
	SELECT * FROM Producto ORDER BY descripcion


-----ventas------

EXEC SP_INS_Venta 2,10

SELECT * FROM Venta

CREATE PROC SP_INS_Venta(
	@idProducto int,
	@cantidad int
)
AS

INSERT INTO Venta VALUES(@idProducto,@cantidad,getdate())


------total de ventas y descripcion de producto--------
EXEC SP_SEL_Ventas

ALTER PROC SP_SEL_Ventas(
	@idProducto int = 0

)
AS
if @idProducto > 0
	SELECT * FROM Venta V
	INNER JOIN Producto P
	ON P.idProducto = V.idProducto
	WHERE V.idProducto = @idProducto
else
	SELECT * FROM Venta V
	INNER JOIN Producto P
	ON P.idProducto = V.idProducto


-------------obtener el total de ventas------------------------
EXEC SP_SEL_VentasTotales


ALTER PROC SP_SEL_VentasTotales
AS

SELECT SUM(precio * cantidad) VentasTotales FROM Venta  V
INNER JOIN Producto P
ON P.idProducto = V.idProducto


----procedimiento para actualizar las ventas------
select  * from Venta

EXEC SP_UPD_Ventas 1,1,50,'2020-12-30'


CREATE PROC SP_UPD_Ventas(
	@idVenta int,
	@idProducto int,
	@cantidad int,
	@fechaVenta datetime
)
AS

UPDATE Venta
SET idProducto = @idProducto,
cantidad = @cantidad,
fechaVenta = @fechaVenta
WHERE idVenta = @idVenta