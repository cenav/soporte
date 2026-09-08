select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado in ('1')
   and extract(year from fecha) = 2025;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and estado in ('2')
   and extract(year from fecha) = 2025;


select *
  from almacenes
 where cod_alm = '06';


select *
  from vw_ordenes_pedido_pendiente;


select *
  from vw_stock_almacen;


select *
  from pr_ot_impresion i
 where i.nuot_tipoot_codigo = 'AR'
   and trunc(i.fecha) >= to_date('01/01/2026', 'dd/mm/yyyy')
   and exists(
   select 1
     from pr_ot o
    where o.nuot_tipoot_codigo = i.nuot_tipoot_codigo
      and o.nuot_serie = i.nuot_serie
      and o.numero = i.numero
      and o.estado in ('1')
   );


select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and extract(year from fecha) = 2026;


select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero = 1122925;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and extract(year from fecha) = 2025;


select *
  from kardex_d
 where cod_art = 'VKBC 20014 AT-SKF'
   and fch_transac = to_date('30/12/2025', 'dd/mm/yyyy');


select id_linea
  from lineas_armado
 where ip_linea = '10.0.0.139'
   and programa = 'PRODUCCION_ARMADO_PRODUCCION';


select *
  from lineas_armado
 where programa = 'PRODUCCION_ARMADO_PRODUCCION';

-- linea 08 = 10.0.0.209