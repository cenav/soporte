select *
  from orden_de_compra
 where serie = 13
   and num_ped in (
   4423
   );

select *
  from orden_matriceria
 where serie = 1
   and num_ped in (
   230076
   );

select *
  from itemord
 where serie = 4
   and num_ped in (
   60390
   );


select *
  from itemmatri
 where serie = 1
   and num_ped in (
   230076
   );

select *
  from orden_de_compra
 where cod_proveed = '10427461179'
 order by fecha;

select *
  from orden_de_compra
 where c_resp = 'E590';

select *
  from itemord
 where serie = 3
   and num_ped = 42672;

select *
  from orden_de_compra_historia
 where serie = 6
   and num_ped in (
   2644
   )
   and glosa = 'APROBADO';

select *
  from oc_registro_facturas
 where serie_oc = 5
   and numero_oc = 2137;

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 29913;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 29913;

select *
  from caja_chica
 where serie = 2
   and numero = 230013;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '21'
   and numero = '168';

select * from gastos_de_viaje_motivos;

select *
  from activo_fijo
 where cod_activo_fijo = '02FRIO6';

select *
  from planilla10.personal
 where nombres like '%JOEL%'
   and apellido_paterno = 'JUAREZ';

select *
  from vacaciones
 where numero = 17935;

select *
  from concepto_permiso
 where id_concepto = 'HE2';

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = 'Z3'
   and numero = 104;

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'Z3'
   and numero = 104
   and id_motivo = '06';

select oc.cod_proveed
     , p.nombre
     , oc.serie
     , oc.num_ped
     , oc.fecha
     , oc.codigo_grupo_compra
     , g.descripcion
     , oc.moneda
     , oc.tot_valvta
     , oc.tot_impu
     , oc.tot_orden
  from orden_de_compra oc
       join proveed p on oc.cod_proveed = p.cod_proveed
       join lg_grupos_compras g on oc.codigo_grupo_compra = g.codigo_grupo_compra
 where oc.codigo_grupo_compra = '021'
   and extract(year from oc.fecha) >= 2018
   and oc.estado != '9'
 order by oc.fecha;

select *
  from lg_pedjam
 where num_importa = 'PVC23023';

select *
  from caja_chica
 where serie = 7
   and numero = 22191;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22191;

select *
  from lg_factura_comercial
 where total < 0;