select *
  from orden_de_compra
 where serie = 13
   and num_ped in (4254);

select *
  from itemord
 where serie = 3
   and num_ped in (43129);

select *
  from orden_de_compra
 where cod_proveed = '10407285056'
 order by fecha;

select *
  from itemord
 where serie = 3
   and num_ped = 42672;

select *
  from orden_de_compra_historia
 where serie = 6
   and num_ped in (2069)
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

