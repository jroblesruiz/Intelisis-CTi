USE PRESTIGE

/*
SELECT o.name,
  ddps.row_count 
FROM sys.indexes AS i
  INNER JOIN sys.objects AS o ON i.OBJECT_ID = o.OBJECT_ID
  INNER JOIN sys.dm_db_partition_stats AS ddps ON i.OBJECT_ID = ddps.OBJECT_ID
  AND i.index_id = ddps.index_id 
WHERE i.index_id < 2  AND o.is_ms_shipped = 0 and ddps.row_count > 0 --and o.name like '%cfd%'
ORDER BY ddps.row_count desc

SELECT * FROM art

SELECT distinct mov  FROM Mov where modulo = 'VTAS'

select * from CFD where movid = '112926'
select * from cxc where movid = '112926'

SELECT *  FROM Mov where modulo = 'VTAS'
select * from ventaD where id = 62869

SELECT * FROM VENTA WHERE MovID = '112926'
Select * from Empresa
select * from EmpresaCFD


select * from cte
where cliente = 99999

select * from art where articulo = '10056'


EXEC sp_helptext 'ValeExportacion';  
select * from VentaArt

*/

-- Consulta inicial para la factura 

SELECT * FROM empresa AS emp
INNER JOIN EmpresaCFD as ecfd
ON emp.Empresa = ecfd.Empresa
WHERE emp.Empresa = 'PREST'

SELECT * FROM EmpresaCFD
WHERE Empresa = 'PREST'

SELECT *  FROM Mov 
WHERE modulo = 'VTAS' AND MovID = '105845'


SELECT * FROM Venta AS vta
INNER JOIN VentaD AS vtad
ON vta.ID = vtad.ID 
INNER JOIN  cte
ON vta.Cliente = cte.cliente
INNER JOIN Art
on vtad.Articulo = art.Articulo
WHERE MovID = '105845'


-- Datos de la empresa
SELECT emp.Nombre, emp.Direccion, emp.RFC, emp.DireccionNumero, emp.DireccionNumeroInt,
	emp.Colonia, emp.Poblacion, emp.Estado, emp.Pais, emp.CodigoPostal, emp.Telefonos,
	emp.FiscalRegimen, ecfd.noCertificado 
FROM empresa AS emp
	INNER JOIN EmpresaCFD as ecfd
	ON emp.Empresa = ecfd.Empresa
WHERE emp.Empresa = 'PREST'

-- Factura 105845
-- Datos de la factura
SELECT 
-- Datos del cliente
	cte.Cliente, cte.RFC, cte.Nombre, cte.Direccion, cte.DireccionNumero, cte.DireccionNumeroInt,
	cte.Colonia, cte.Poblacion, cte.Estado, cte.Pais, cte.CodigoPostal, cte.Telefonos,
	cte.Condicion, 
-- Datos de la factura
	vta.mov, vta.MovID, vta.FechaEmision, vta.OrdenCompra, vta.FormaEnvio, vta.Atencion,
	vta.Moneda, vta.Impuestos, vta.Importe, vta.Descuento, vta.DescuentoGlobal, vta.DescuentoLineal,
	vta.ServicioGarantia, vta.Impuestos, vta.FormaPagoTipo, vta.Estatus,
-- Datos de movimientos
	vtad.Articulo, art.Descripcion1, art.Descripcion2, vtad.Impuesto1, vtad.Unidad, vtad.Cantidad, vtad.Precio
FROM Venta AS vta
INNER JOIN VentaD AS vtad
ON vta.ID = vtad.ID 
INNER JOIN  cte
ON vta.Cliente = cte.cliente
INNER JOIN Art
on vtad.Articulo = art.Articulo
WHERE Mov = 'Factura' AND FechaEmision BETWEEN '2014/01/01' AND '2014/31/01' AND MovID = '105845'


-- Factura 105847
-- Datos de la factura
SELECT 
-- Datos del cliente
	cte.Cliente, cte.RFC, cte.Nombre, cte.Direccion, cte.DireccionNumero, cte.DireccionNumeroInt,
	cte.Colonia, cte.Poblacion, cte.Estado, cte.Pais, cte.CodigoPostal, cte.Telefonos,
	cte.Condicion, 
-- Datos de la factura
	vta.mov, vta.MovID, vta.FechaEmision, vta.OrdenCompra, vta.FormaEnvio, vta.Atencion,
	vta.Moneda, vta.Impuestos, vta.Importe, vta.Descuento, vta.DescuentoGlobal, vta.DescuentoLineal,
	vta.ServicioGarantia, vta.Impuestos, vta.FormaPagoTipo,
-- Datos de movimientos
	vtad.Articulo, art.Descripcion1, art.Descripcion2, vtad.Impuesto1, vtad.Unidad, vtad.Cantidad, vtad.Precio
FROM Venta AS vta
INNER JOIN VentaD AS vtad
ON vta.ID = vtad.ID 
INNER JOIN  cte
ON vta.Cliente = cte.cliente
INNER JOIN Art
on vtad.Articulo = art.Articulo
WHERE MovID = '105847'


-- Datos del anticipo
SELECT 
-- Datos del cliente
	cte.Cliente, cte.RFC, cte.Nombre, cte.Direccion, cte.DireccionNumero, cte.DireccionNumeroInt,
	cte.Colonia, cte.Poblacion, cte.Estado, cte.Pais, cte.CodigoPostal, cte.Telefonos,
	cte.Condicion, cxc.Concepto, cxc.observaciones,
-- Datos de la factura
	cxc.mov, cxc.MovID, cxc.FechaEmision, 
	cxc.Moneda, cxc.Impuestos, cxc.Importe, 
	cxc.Impuestos
FROM cxc AS cxc
INNER JOIN  cte
ON cxc.Cliente = cte.cliente
WHERE cxc.MovID = '112926' and cxc.mov = 'Factura Anticipo'

-- Datos del anticipo
SELECT 
-- Datos del cliente
	cte.Cliente, cte.RFC, cte.Nombre, cte.Direccion, cte.DireccionNumero, cte.DireccionNumeroInt,
	cte.Colonia, cte.Poblacion, cte.Estado, cte.Pais, cte.CodigoPostal, cte.Telefonos,
	cte.Condicion, cxc.Concepto, cxc.observaciones,
-- Datos de la factura
	cxc.mov, cxc.MovID, cxc.FechaEmision, 
	cxc.Moneda, cxc.Impuestos, cxc.Importe, 
	cxc.Impuestos
FROM cxc AS cxc 
INNER JOIN  cte
ON cxc.Cliente = cte.cliente

WHERE cxc.MovID = '10339' and cxc.mov = 'Nota Credito'

-- Datos del anticipo
SELECT 
-- Datos del cliente
	cte.Cliente, cte.RFC, cte.Nombre, cte.Direccion, cte.DireccionNumero, cte.DireccionNumeroInt,
	cte.Colonia, cte.Poblacion, cte.Estado, cte.Pais, cte.CodigoPostal, cte.Telefonos,
	cte.Condicion, cxc.Concepto, cxc.observaciones,
-- Datos de la factura
	cxc.mov, cxc.MovID, cxc.FechaEmision, 
	cxc.Moneda, cxc.Impuestos, cxc.Importe, 
	cxc.Impuestos
FROM cxc AS cxc
INNER JOIN  cte
ON cxc.Cliente = cte.cliente
WHERE cxc.MovID = '10339' and cxc.mov = 'Nota Credito Dev'