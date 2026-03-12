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
   and a.cod_art = '0341002003'
--    and exists(
--    select *
--      from tab_lineas lin
--           join tab_grupos gpo on lin.grupo = gpo.grupo
--     where lin.linea = l.cod_linea
--       and gpo.ind_vta1 in ('1000', '2000', '5000')
--    )
 order by l.cod_grupo, a.cod_art;

select *
  from articul
 where cod_art in ('0341002003', '0341003004');


select * from lispreg;


select *
  from lispred
 where cod_art = '0341002003'
   and nro_lista = 1;


select *
  from almacen
 where cod_alm = 'F0'
   and cod_art = '0341002003';


select *
  from tab_descuento_gpolin
 where cod_linea in ('256', '283');


select *
  from tab_grupos
 where grupo = 42;


select *
  from tab_descuento_comercial
 where descripcion like '%BOSCH';

begin
  pr_reordena_cotiza();
end;