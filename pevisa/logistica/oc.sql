select *
  from orden_de_compra
 where serie = 30
   and num_ped in (
   556
   );

select * from proveed where cod_proveed = '20546450075';

select *
  from itemord
 where serie = 30
   and num_ped in (
   556
   );

select *
  from factpag
 where cod_proveedor = '20546450075'
 order by fecha desc;

-- 1
-- 470

select *
  from factpag
 where nro_referencia = '60971'
   and serie_ref = '4';

select *
  from itemord
 where serie = 11
   and num_ped in (
   1475
   );

select *
  from nrodoc
 where tipodoc = '82'
   and serie = 4;

select max(num_ped)
  from orden_de_compra
 where serie = 4;

-- estado 7
select *
  from lg_condpag
 where cond_pag = '96';

select *
  from orden_matriceria
 where num_ped in (
   230093
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
 where serie = 4
   and num_ped in (
   60932
   );

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
   and numero = 230068;

select *
  from caja_chica_d
 where serie = 7
   and numero = 22219;

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

select * from vendedores;

select *
  from orden_de_compra
 where num_ped = 137
 order by fecha desc;

select *
  from proveed
 where cod_proveed = '20251505111';

select * from solicita_emision;

select * from cierre_caja;

select *
  from pagos_i
 where numero_planilla = 8
   and serie_planilla = 22;


select *
  from kardex_d
 where cod_art = 'EQ DIV404';

select *
  from kardex_g
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30597;

select *
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 30597;

select * from paramaf;

select *
  from factpag
 where serie_ref = '001'
   and nro_referencia = '85224';

select *
  from factpag
 where nro_referencia like '%85224%';

select * from caja_chica_d;

select *
  from orden_de_compra
 where cod_proveed = '20524791936'
   and fecha > to_date('01/01/2022', 'dd/mm/yyyy');

select *
  from lg_itemjam
 where num_importa = 'PVM23029'
   and cod_art = 'BLAF 0.25-612N-T5';

select codigo, descripcion, indicador1
  from tablas_auxiliares
 where tipo = 33
   and codigo in
       ('01', '02', '03', '05', '06', '09', '15', '17', '18', '20', '21', '23', '30', '36', '37',
        '40', '41', '48', '62', 'A1', 'L1', 'D5', 'DM', 'DB', 'DQ', 'D2', 'D4')
 order by codigo;


select *
  from linea_cambio_cantidad
 where cod_lin in (
                   1620, 1621, 1622, 1623, 1628, 1629
   );

select h.c_codigo, planilla10.pr_nombre(h.c_codigo) as nombre
  from planilla10.personal h
 where h.tipo_tra = 'E'
   and h.c_codigo in (
   select lg.codigo_personal
     from lg_personal_compras_series lg
    where lg.serie_orden_de_compra = 3
   )
 order by 1;

select * from lg_personal_compras_series;

select *
  from orden_de_compra
 where estado = 5;

select *
  from orden_de_compra
 where detalle like '%MAESTRIA%'
 order by fecha desc;

select * from proveed where cod_proveed = '20155945860';

select * from proveed where nombre like '%CIENCIAS APLICADAS%';

select * from planilla10.personal where c_codigo = 'E253';

