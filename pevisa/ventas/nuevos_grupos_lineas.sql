-- agrega a la tabla tab_descuento_gpolin los nuevos grupos y lineas creados
select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.cod_linea as linea
     , l.cod_grupo as grupo, v.importe as precio, pr_medpza as cod_ing, t.grupo_venta
  from articul a
     , tab_descuento_gpolin l
     , lispred v
     , lispreg g
     , tab_lineas t
     , almacen n
 where a.tp_art in ('T', 'S')
   and l.cod_linea = a.cod_lin
   and l.cod_grupo is not null
   and g.nro_lista = :nro_lista
   and l.moneda = g.moneda
   and v.cod_art = a.cod_art
   and v.nro_lista = g.nro_lista
   and t.linea = l.cod_linea
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_art = '0221504464'
 order by l.cod_grupo, a.cod_art;

select *
  from articul
 where cod_art = '0221504464';

select *
  from tab_descuento_gpolin
 where cod_linea = '254';

select *
  from tab_descuento_gpolin
 where cod_grupo = '27';

select *
  from lispred
 where cod_art = '0221504464';

select *
  from tab_lineas
 where linea = '254';

select *
  from tab_lineas
 where grupo = '42';

select *
  from tab_grupos
 where grupo = '42';

select *
  from tab_grupos
 where descripcion like '%BOSCH%';

select *
  from tab_descuento_gpolin
 where cod_grupo = '42';

select * from grupo_venta;

select *
  from tab_descuento_comercial
 order by cod_grupo_venta;

-- insert into tab_descuento_gpolin(cod_grupo_venta, cod_grupo, cod_linea, moneda)
-- select '70', '42', linea, 'D'
--   from tab_lineas
--  where grupo = '42';