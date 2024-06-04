select *
  from lispreg
 order by nro_lista;

select *
  from lispred
 where cod_art = '66450-OSRAM';

select *
  from lispred
 where cod_art in ('S4 70D-25-B', '0092S47028');

select *
  from tab_lineas
 where linea = '203';

select cod_art, importe_igv
  from tmp_carga_data
 where importe_igv is null;

select t.cod_art, t.importe_igv
  from tmp_carga_data t
       left join articul a on t.cod_art = a.cod_art
 where a.cod_art is null;

select *
  from lispred
 where nro_lista = '95';

select * from tab_descuento_gpolin;

select *
  from tab_descuento_gpolin
 where cod_grupo = '39';

select * from tab_grupo_venta;

select a.cod_art, a.descripcion, a.unidad, n.stock, a.u_eqv, l.cod_linea as linea, g.moneda
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
   and g.nro_lista = 1
   and l.moneda = g.moneda
   and v.cod_art = a.cod_art
   and v.nro_lista = g.nro_lista
   and t.linea = l.cod_linea
   and n.cod_art(+) = a.cod_art
   and n.cod_alm(+) = 'F0'
   and a.cod_art = 'GC4252'
 order by l.cod_grupo, a.cod_art;

select *
  from tab_lineas
 where linea = '01';

select *
  from tab_grupos
 where grupo = '39';

select *
  from pedido
 where num_ped = 222285;

select *
  from itemped
 where num_ped = 219792;

select * from categoria;

select * from clientes_categoria;

select * from tab_lineas where linea = '253';

select * from lpred_fam where cod_lin = '114';
select * from lpred_fam where cod_lin = '253';
select cod_lin from articul where cod_lin = '253';
select * from tab_lineas where linea = '253';
select * from tab_lineas where descripcion like '%BOSCH%' order by linea;
select * from lpred_fam;
select * from lista_de_precios;