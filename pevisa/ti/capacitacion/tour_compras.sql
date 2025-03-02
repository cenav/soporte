-- masetro de artículos
select * from articul;

-- se relaciona con articul por el campo cod_lin
select * from tab_lineas;

select * from tab_grupos;

-- se relaciona con la tabla tab_grupos columna ind_vta1
select * from grupo_venta;

-- proformas, cotizaciones
select * from orden_de_compra;

-- proformas, cotizaciones detalle (items, artículos, cantidad)
select * from itemord;

select * from lg_grupos_compras;

-- maestro de proveedores
select * from proveed;