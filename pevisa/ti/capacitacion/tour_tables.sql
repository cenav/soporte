-- pedidos de importacion (como la tabla orden de compra)
select * from lg_pedjam;

-- pedidos de importacion detalle
select * from lg_itemjam;

select * from articul;

select * from tab_lineas;

select * from tab_grupos;

-- se relaciona con la tabla tab_grupos columna ind_vta1
select * from grupo_venta;

select *
  from pr_grupos
 where programa_produccion is null;