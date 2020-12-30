CREATE TABLE Venta(
	idVenta int,
	idProducto int,
	cantidad int,
	fechaVenta datetime,
	CONSTRAINT PK_VENTA PRIMARY KEY(idVenta)
)