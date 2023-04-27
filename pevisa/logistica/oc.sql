select *
  from orden_de_compra
 where serie = 3
   and num_ped in (
                   43359
   );

select *
  from itemord
 where serie = 4
   and num_ped in (
   60331
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
   2554
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

select oc.cod_proveed, p.nombre, oc.serie, oc.num_ped, oc.fecha, oc.codigo_grupo_compra
     , g.descripcion, oc.moneda, oc.tot_valvta, oc.tot_impu, oc.tot_orden
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

insert into pevisa.lg_pedjam ( num_importa, cod_proveed, fecha, fecha_envio, fecha_embarque
                             , fecha_prov, fecha_aduana, fecha_almacen, total_pedido, total_saldo
                             , estado, moneda, cond_pago, glosa, marca, cod_vende, embarque, agencia
                             , centro_costo, seguro, tipo, banco, doc_banco, fecha_apertura
                             , flag_pedido, prioridad, tiempo_entrega, nro_emb, inc_flete
                             , valor_flete, fecha_embarque2, fecha_aduana2, gastos_documentacion
                             , gastos_bancarios, gastos_varios, importe_a_favor, condicion
                             , documento_referencia_pago, dias_referencia_pago
                             , fecha_programacion_embarque, tipo_mercaderia, sistema_origen
                             , programa, porcentaje_adelanto, porcentaje_embarque
                             , porcentaje_credito, documento_credito, total_pagado, fecha_aprobacion
                             , ncomercial, referencia_proveedor, importe_adelanto, transporte_medio
                             , tipo_de_compra, medio_de_pago)
values ( 'PVC23023', '23739', to_date('2023-04-13', 'YYYY-MM-DD HH24:MI:SS'), null, null, null, null
       , null, 1780.80, 1780.80, '0', 'D', '06I', null, null, 'FOB', '00', '00', null, '00', 'PVC'
       , null, null, null, 'I', null, 90, 0, 'N', 0.00, null, null, null, null, null, null
       , 'ADELANTO', 'PEDIDO', 0, null, null, null, 'PVC230401', 100, null, 0, 'PROFORMA', null
       , null, 'INTIDE', null, null, 'MARITIMA', null, null);

select *
  from lg_itemjam
 where num_importa = 'PVC23023';

insert into pevisa.lg_itemjam ( num_importa, item, cod_art, cod_prov, cantidad, precio, unidad
                              , unidad_prv, detalle, saldo, fob, cif, estado, fecha, material
                              , cant_ped, factor_uc, precio_uc, cod_oem, cod_art_transf
                              , codigo_pais_origen, fecha_estimada_despacho)
values ( 'PVC23023', 1, 'BAX C201 0.25-298', '0.25 X 298 MM   3/4 hard', 30.0000, 3.10000000, 'KG'
       , 'KG', null, 30.0000, null, null, null, to_date('2023-04-13', 'YYYY-MM-DD HH24:MI:SS'), null
       , 30.0000, 1.000000, 3.10000000, null, null, '19', null);
insert into pevisa.lg_itemjam ( num_importa, item, cod_art, cod_prov, cantidad, precio, unidad
                              , unidad_prv, detalle, saldo, fob, cif, estado, fecha, material
                              , cant_ped, factor_uc, precio_uc, cod_oem, cod_art_transf
                              , codigo_pais_origen, fecha_estimada_despacho)
values ( 'PVC23023', 2, 'BAX C201 0.25-620', '0.23 X 620 MM   1/2 hard', 30.0000, 3.10000000, 'KG'
       , 'KG', null, 30.0000, null, null, null, to_date('2023-04-13', 'YYYY-MM-DD HH24:MI:SS'), null
       , 30.0000, 1.000000, 3.10000000, null, null, '19', null);
insert into pevisa.lg_itemjam ( num_importa, item, cod_art, cod_prov, cantidad, precio, unidad
                              , unidad_prv, detalle, saldo, fob, cif, estado, fecha, material
                              , cant_ped, factor_uc, precio_uc, cod_oem, cod_art_transf
                              , codigo_pais_origen, fecha_estimada_despacho)
values ( 'PVC23023', 3, 'HOJ 0.23', '0.23 X 781 X 852 MM', 1772.0000, 0.90000000, 'KG', 'KG', null
       , 1772.0000, null, null, null, to_date('2023-04-13', 'YYYY-MM-DD HH24:MI:SS'), null
       , 1772.0000, 1.000000, 0.90000000, null, null, '19', null);

