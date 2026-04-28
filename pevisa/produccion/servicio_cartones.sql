select *
  from orden_de_compra
 where cod_proveed = '20301734574'
   and num_ped = 23576;

  with servicios_cartones as (
    select os.numero, os.nuot_serie, os.nuot_tipoot_codigo, os.oc_numero, os.oc_serie
         , oc.fecha as fecha_oc, oc.cod_proveed, proveedor(oc.cod_proveed) as nombre
         , op.formu_art_cod_art
         , op.cant_prog, op.fecha as fecha_op, i.cod_art, i.cantidad
      from orden_de_compra oc
         , itemord i
         , pr_ot_orden_de_servicio os
         , articul_servicios arts
         , pr_ot op
     where i.num_ped = oc.num_ped
       and i.serie = oc.serie
       and oc.estado < '9'
       and i.num_ped = os.oc_numero
       and i.serie = os.oc_serie
       and i.cod_art = arts.cod_art
       and os.numero = op.numero
       and os.nuot_serie = op.nuot_serie
       and os.nuot_tipoot_codigo = op.nuot_tipoot_codigo
       and op.formu_art_cod_art = arts.cod_art_produccion
       and op.estado = 1
       and os.kardex_numero is null
    )
select *
  from servicios_cartones
--  where cod_proveed = '20301734574'
 where oc_numero = 23596;

select *
  from pr_ot_orden_de_servicio
 where oc_serie = 2
   and oc_numero = 23592;

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 654672;


select s.oc_serie, s.oc_numero, s.numero as op_numero, trunc(o.fecha) as fecha
  from pr_ot_orden_de_servicio s
       join pr_ot o
            on s.numero = o.numero
              and s.nuot_serie = o.nuot_serie
              and s.nuot_tipoot_codigo = o.nuot_tipoot_codigo
 where s.kardex_numero is null
   and o.estado = '9'
   and o.fecha > to_date('01/01/2025', 'dd/mm/yyyy');

select *
  from almacenes
 where es_stock = 0
 order by cod_alm;

select *
  from pr_ot_orden_de_servicio
 where oc_numero = 23589;

select *
  from pr_ot_orden_de_servicio
 where numero = 655028;

select *
  from itemord
 where serie = 2
   and num_ped = 23589
 order by item;

select *
  from pr_ot_det d
 where d.ot_nuot_tipoot_codigo = 'PR'
   and d.ot_nuot_serie = 8
   and d.art_cod_art = 'SERV PEV 460.660-R'
   and exists(
   select 1
     from pr_ot o
    where d.ot_nuot_tipoot_codigo = o.nuot_tipoot_codigo
      and d.ot_nuot_serie = o.nuot_serie
      and d.ot_numero = o.numero
      and o.estado = '1'
   )
 order by d.ot_numero desc;

select *
  from view_oc_y_op_servicios_pend
 where numero = 655633;

-- DUR 1000.700
select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and nuot_serie = 8
   and numero = 655598;

select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_nuot_serie = 8
   and ot_numero = 655598;

select numero from tmp_carga_data;

select *
  from almacenes
 where cod_alm = 'TM';

select *
  from almacenes
 where cod_alm = 'DM';

select *
  from itemord
 where serie = 2
   and num_ped = 23592;

select *
  from pr_ot_orden_de_servicio
 where extract(year from creacion_cuando) = 2025
   and extract(month from creacion_cuando) = 10;

select *
  from pr_ot_orden_de_servicio
 where oc_numero = 656696;

select *
  from pr_ot_orden_de_servicio
 where numero = 656696;

select *
  from view_oc_y_op_servicios_pend
 where oc_numero = 23592;

select *
  from articul_servicios
 where cod_art = 'SERV TROQ DUR 160.435';

select *
  from articul_servicios
 where cod_art_produccion = 'DUR 160.435';

select *
  from itemord i
 where i.serie = 2
   and i.num_ped = 23592
   and not exists(
   select 1
     from articul_servicios s
    where s.cod_art = i.cod_art
   );

select *
  from itemord
 where num_ped = 23592
   and serie = 2
   and cod_art = 'SERV TROQ DUR 160.435';

select * from prod_subgrupo_linea_rel;

select * from kardex_d_otros;

select * from pr_estados;

select user, d.art_cod_art, d.cant_formula, 0, 0, 0
  from pr_ot_det d
     , articul a
 where d.ot_numero = 655230
   and d.ot_nuot_serie = 8
   and d.ot_nuot_tipoot_codigo = 'PR'
   and d.art_cod_art = a.cod_art
   and d.estado <> '9'
   and a.cod_lin not in ('889');


select user, d.art_cod_art, d.cant_formula, 0, 0, 0
  from pr_ot_det d
     , articul a
 where d.ot_numero = 655230
   and d.ot_nuot_serie = 8
   and d.ot_nuot_tipoot_codigo = 'PR'
   and d.art_cod_art = a.cod_art
   and d.estado <> '9'
   and d.cod_lin not in ('889', '832');

select *
  from almacenes
 where cod_alm = '98';

select *
  from kardex_d
 where cod_alm = 'DC'
   and fch_transac >= to_date('01/01/2026', 'dd/mm/yyyy');