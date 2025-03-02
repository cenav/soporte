-- contabilidad maestro
select *
  from movglos
 where ano = 2024
   and mes = 9
   and libro = '10'
   and voucher = 29336501;

select *
  from movdeta
 where ano = 2024
   and mes = 12
   and libro = '08'
   and voucher = 121120;

select *
  from tmp_moviart_dos
 where docto = 'FCN24327';

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and numero = 10758;

select *
  from movdeta
 where ano = 2024
   and mes = 9
   and libro = '33'
   and voucher = 90024
   and cuenta = '253105';

select *
  from plancta
 where cuenta = '92260208';

select *
  from movdeta
 where ano = 2024
   and mes = 2
   and libro = '33'
   and voucher = 20028
   and cuenta in ('333101');

select *
  from factpag
 where numero = '0000652'
   and cod_proveedor = '20603183933';

select *
  from factpag
 where numero = '3981486'
   and cod_proveedor = '20100047218'
   and serie_num = '096';

select *
  from cabfpag
 where numero = '3981486'
   and cod_proveedor = '20100047218'
   and serie_num = '096';

select *
  from cabfpag
 where numero = '3981486'
   and cod_proveedor = '20100047218'
   and serie_num = '003';

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3981486'
   and nro_cuota = 97;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3981486'
   and nro_cuota = 97;

select *
  from factpag
 where numero = '3981486'
   and serie_num = '096';

select *
  from movglos_anexos
 where ano = 2024
   and mes = 3
   and libro = '08'
   and voucher = 30450;

select *
  from movglos_historia
 where ano = 2023
   and mes = 1
   and libro = '08'
   and voucher in (
   11865
   )
 order by creacion_cuando;

update movdeta m
   set m.cargo_s = round(m.cargo_d * 3.838, 2)
     , m.abono_s = round(m.abono_d * 3.838, 2)
     , m.cambio  = 3.838
 where m.ano = 2022
   and m.mes = 8
   and m.libro = '14'
   and m.voucher in (
                     80187, 80188, 80203, 80204, 80205, 80238, 80239, 80241, 80242, 80243, 80244
   )
   and m.cuenta in (
   '759502'
   );


select *
  from relacion
 where tipodoc = 'PR'
   and numero = 465638;

select *
  from factpag
 where cod_proveedor = '20100047218'
   and serie_num = '041'
   and numero in (
   '45858AFB'
   );

select *
  from movfide_situacion_banco
 where voucher = '81041'
   and p_ano = 2022
   and p_mes = 8;

select *
  from activo_fijo
 where cod_activo_fijo in (
                           '05MUEB102', '05MUEB103', '05MUEB104', '05MUEB105'
   );

select *
  from kardex_d
 where cod_art = '05RELO1';

select *
  from nrolibr
 where ano = 2022
   and mes = 6
   and libro = '05';

select *
  from serie_caja
 order by id_serie;
select *
  from nrolibr
 where ano = 2023
   and mes = 3
   and libro = '14';

select * from cierre_contabilidad;

select *
  from cambdol
 where fecha = to_date('24/03/2024', 'dd/mm/yyyy');

select *
  from caja_chica
 where serie = 7
   and numero = 25018;

select *
  from caja_chica_d
 where serie = 2
   and numero = 240134;

select *
  from caja_chica
 where estado = '1'
   and creacion_quien = 'DACOSTA';

select *
  from caja_chica
 where serie = 7
   and numero = 24083;

select *
  from kardex_g_movglos
 where numero_oc = '44585'
   and serie_oc = '003';

select *
  from orden_de_compra
 where num_ped = 44585
   and serie = 3;

select *
  from activo_fijo
 where cod_activo_fijo like 'MQ1PJEB-040-3%';

select *
  from activo_fijo
 where cod_activo_fijo like 'MQ1PJEB-040 3%';

select *
  from pr_tabmaq
 where codigo like 'MQ1PJEB-038-1%';

select *
  from activo_fijo
 where cod_activo_fijo like 'MQ1PJEB-038 1%';

select *
  from pr_tabmaq
 where codigo = 'MQ1PJEB-038 1A';

insert into pevisa.pr_tabmaq
  ( codigo, descripcion, fecha_fabricacion, numero_serie, id_tipo, estado
  , centro_costo, id_seccion, id_modelo, id_marca, local
  , fecha_adquisicion, id_pais, consumo_energia, consumo_energia_unidad
  , capacidad, alto, largo, ancho, peso, num_importa, linea_maquina
  , abreviatura, cod_padre, id_seccion_prod, id_prioridad, observaciones)
values
  ( 'MQ1PJEB-038 1A', 'PRENSA CUADRUPLE PAN STONE 1A', date '2024-05-21', null, null, null
  , '9002', 'C1', null, null, 'SEP', date '2024-05-21', null, null, 'kW', null, null, null
  , null, null, null, null, 'PRENSA PAN STONE 1A', null, '01', 'S', null);

select *
  from pr_tabmaq
 where codigo = 'MQ1PJEB-038 1A';

select cod_activo_fijo, detalle from tmp_carga_data;

select *
  from caja
 where id_numero = 160;

select *
  from factcob
 where tipdoc = '07'
   and serie_num = 'F056'
   and numero in (
   5522
   );

select *
  from docuvent
 where tipodoc = '07'
   and serie = 'F056'
   and numero = 5522;

select *
  from movglos
 where ano = 2024
   and mes = 11
   and libro = '60'
   and voucher = 111320;

select *
  from movdeta
 where ano = 2024
   and mes = 11
   and libro = '60'
   and voucher = 111320;

select *
  from movdeta
 where ano = 2024
   and tipo_referencia = '07'
   and nro_referencia = '5522';

select * from ruta_docvirtual;

select * from doc_sunat_xml;

select *
  from movglos
 where ano = 2024
   and mes = 4
   and libro = '08'
   and voucher in (
                   42392, 42393, 42394, 42395, 42396, 42397, 42398, 42399, 42400, 42401, 42402,
                   42403, 42404, 42405, 42406, 42407, 42408, 42409, 42410, 42411, 42412, 42413,
                   42414, 42415
   );

select *
  from usuarios
 where usuario = 'MMIRANDA';

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = 'B11'
   and numero = 101;

select * from estado_gasto_viaje;

select *
  from gastos_de_viaje_m
 where id_vendedor = 'B11'
   and numero = 100;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '23'
   and numero = 244;

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = '34'
   and numero = 230;

insert into gastos_de_viaje_m(numero, id_motivo, total_habilitado, id_vendedor)
select 230, id_motivo, sum(valor), '34'
  from gastos_de_viaje_habilitado_d
 where id_vendedor = '34'
   and numero = 230
 group by id_motivo;

select *
  from gastos_de_viaje
 where id_vendedor = 'Z10'
   and numero = 101;

select *
  from gastos_de_viaje_m
 where id_vendedor = 'Z10'
   and numero = 101;

select *
  from gastos_de_viaje_d
 where id_vendedor = 'Z10'
   and numero = 101;

select * from vw_gasto_viaje;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = 'A2'
   and numero = 102;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = 'A2'
   and numero = 102;

select numero, id_motivo, item, cod_ubc, cod_ubc_destino
     , fecha_del
     , fecha_al
     , dias, valor, id_vendedor
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'A2'
   and numero = 102;

select * from estado_gasto_viaje;

select *
  from gastos_de_viaje_habilitado
 where estado = 5 and movilidad = 'S' and (
   (fecha_del between :fecha_del and :fecha_al) or
   (:fecha_del is null and :fecha_al is null));

select *
  from kardex_g_movglos
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 32071;

select *
  from kardex_d
 where cod_alm = 'A3'
   and tp_transac = '11'
   and serie = 1
   and numero = 32071;

select *
  from centro_de_costos
 where centro_costo like ('730505%');

select *
  from caja_d
 where centro_costo = '73050521E4';

select *
  from centro_de_costos
 where centro_costo in (
                        '730505', '73050521E4 ', '73050521F6', '73050521H6'
   )
 order by centro_costo;

select *
  from caja_chica_d
 where centro_costo in (
                        '730505', '73050521E4 ', '73050521F6', '73050521H6'
   );
--    and codigo_motivo = 'AN';

select *
  from pr_tabmaq
 where centro_costo = '730505';


select *
  from proveed
 where cod_proveed = '10476312316';

select *
  from orden_de_compra
 where cod_proveed = '10476312316'
 order by fecha desc;

select *
  from movglos
 where cod_proveed = '10476312316'
 order by fecha desc;

select *
  from factpag
 where cod_proveedor = '10476312316'
 order by fecha desc;

select *
  from campana_cliente
 where cod_campana = 'C24-DC1';

select *
  from nrodoc
 where tipodoc = 'FN';

select *
  from tablas_auxiliares
 where codigo = 'FN';


select * from docu_fact_nego;

select * from usuarios_libros;

select * from cierre_contabilidad;

select *
  from prestamo_banco_cuota
 where cod_prestamo = '3981486'
   and nro_cuota = 97;

select extract(year from fecha) as anio
     , extract(month from fecha) as mes
     , sum(case id_moneda when 'S' then importe_solicitado else 0 end) as soles
     , sum(case id_moneda when 'D' then importe_solicitado else 0 end) as dolares
  from vw_aprueba_caja
 where id_estado in (2, 4, 5, 6, 7)
   and trunc(fecha) between trunc(add_months(sysdate, -2), 'MM') and last_day(trunc(sysdate))
 group by extract(year from fecha), extract(month from fecha)
 order by anio, mes;

select trunc(add_months(sysdate, -2), 'MM')
     , last_day(trunc(sysdate))
  from dual;

select *
  from estado_caja
 order by id_estado;

select *
  from activo_fijo
 where cod_activo_fijo in (
                           '02LAPT9', 'CPUC16-CPU', 'CPUC16-MONI', 'CPUC17-CPU', 'CPUC17-MONI',
                           '01SILL60', '01SILL61', '02COCH38', '02COCH41', '02COCH42', '02COCH43',
                           '02COCH44', '02COCH45', 'AC1PJEB-011', 'AC1PJEB-012', '04ELEV1',
                           '02BALA56', '02BALA57', '02BALA58', '04BALA1', '04BALA2', '02RELO2',
                           '02LOCK5', '02LOCK6', 'AC1ARMPT-009', '02CAMA5', '02CAMA6', 'AC1RET-008',
                           'EQ DIV159', 'ALM COMP Y PZS MAN3', 'AC1ACAB-003', 'AC2SPAPL-006'
   );

select * from movfide;

select *
  from vendedores
 where nombre like '%ARANDA%';

select *
  from factpag
 where tipdoc = 'PO';

select to_date('23/09/2024', 'dd/mm/yyyy') + 30 from dual;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '83'
   and numero = 234;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '83'
   and numero = 234;

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = '83'
   and numero = 234;

select *
  from gastos_de_viaje_m
 where id_vendedor = '83'
   and numero = 234;

select max((ano * 100) + mes)
  from cierre_contabilidad;

select * from cierre_contabilidad;

select 2024 * 100 + 9 from dual;

select *
  from proveed
 where cod_proveed = '10466236638';



select *
  from proveed_bancos
 where cod_proveed = '10466236638';

create public synonym cancelacion_auto_factura_no for cancelacion_auto_factura_no;

select *
  from factpag
 where cod_proveedor = '20182246078'
   and extract(year from fecha) = 2023;


select *
  from pagos_i i
     , proveed_pagos_especiales e
 where i.serie_planilla = 1
   and i.numero_planilla = 27939
   and i.cod_proveedor = e.cod_proveed;

select *
  from proveed
 where cod_proveed = '20265681299';

select *
  from proveed_pagos_especiales
 where cod_proveed = '20265681299';

insert into pevisa.proveed_pagos_especiales
  ( cod_proveed, fecha_modificacion, modificado_por
  , creado_por, fecha_creacion, motivo)
values
  ('20265681299', null, null, 'MSOTO', timestamp '2024-02-13 15:31:00', null);

select *
  from caja
 where id_serie = 1
   and id_numero = 208;

select *
  from caja
 where id_serie = 1
   and id_numero = 208;

select *
  from nrodoc
 where tipodoc = '00';

select *
  from factpag
 where tipdoc = '00';

select *
  from activo_fijo_asigna
 where cod_activo_fijo = 'CPUC15-MONI';

select *
  from activo_fijo_asigna
 where cod_empleado = 'E998';

select *
  from tablas_auxiliares
 where codigo != '....'
   and tipo = 1
   and codigo = '49'
 order by codigo;

select *
  from hallazgo_importacion
 where id_hallazgo = 385;

select *
  from caja_chica
 where serie = 2
   and numero = 250001;

select *
  from caja_chica_d
 where numero = 250001;

select *
  from caja_chica
 where estado = '1';

select *
  from caja_chica_d
 where serie = 2
   and numero = 240134;

insert into pevisa.caja_chica_d
  ( serie, numero, item, codigo_motivo, tipo_relacion, codigo_relacion, tipo_referencia
  , serie_referencia, nro_referencia, fecha_referencia, detalle, importe, valor_compra, impuesto
  , estado, usuario, fecha_registro, f_vencto, cuenta_contable, moneda, igv, afecto, inafecto
  , importe_d, ruta, centro_costo, ano, mes, libro, voucher, libro_caja, voucher_caja, item_caja
  , cuenta_contable_analizada, id_maquina, id_tipo_mantto, codigo_grupo_compra, otm_serie
  , otm_numero, otm_tipo, cod_art, cantidad, unidad_prv, alm_transac, tpo_transac, ser_transac
  , nro_transac, saldo, nombre_archivo, nombre_xml, nombre_cdr, tipo_bien)
values
  ( 2, 250001, 1, 'A5', 'P', '20601218942', '01', 'E001', '0002726', date '2024-12-27'
  , 'TAXI - ALMC. PUNTA HERMOSA (IDA/VUELTA) LUIS ARIAS', 270.00, null, null, null, null
  , date '2025-01-06', null, '9125', 'S', null, null, 270.00, null, null, '9800', null, null, null
  , null, null, null, null, null, null, null, '033', null, null, null, null, null, null, null, null
  , null, null, null, null, null, null, null);
insert into pevisa.caja_chica_d
  ( serie, numero, item, codigo_motivo, tipo_relacion, codigo_relacion, tipo_referencia
  , serie_referencia, nro_referencia, fecha_referencia, detalle, importe, valor_compra, impuesto
  , estado, usuario, fecha_registro, f_vencto, cuenta_contable, moneda, igv, afecto, inafecto
  , importe_d, ruta, centro_costo, ano, mes, libro, voucher, libro_caja, voucher_caja, item_caja
  , cuenta_contable_analizada, id_maquina, id_tipo_mantto, codigo_grupo_compra, otm_serie
  , otm_numero, otm_tipo, cod_art, cantidad, unidad_prv, alm_transac, tpo_transac, ser_transac
  , nro_transac, saldo, nombre_archivo, nombre_xml, nombre_cdr, tipo_bien)
values
  ( 2, 250001, 2, 'A7', 'P', '20606428309', '01', 'F201', '0006230', date '2025-01-02'
  , 'ALMUERZO (J.W.)', 32.40, null, null, null, null, date '2025-01-06', null, '9125', 'S', 4.88
  , 27.11, 0.41, null, null, '9800', null, null, null, null, null, null, null, null, null, null
  , '033', null, null, null, null, null, null, null, null, null, null, null, null, null, null
  , null);
insert into pevisa.caja_chica_d
  ( serie, numero, item, codigo_motivo, tipo_relacion, codigo_relacion, tipo_referencia
  , serie_referencia, nro_referencia, fecha_referencia, detalle, importe, valor_compra, impuesto
  , estado, usuario, fecha_registro, f_vencto, cuenta_contable, moneda, igv, afecto, inafecto
  , importe_d, ruta, centro_costo, ano, mes, libro, voucher, libro_caja, voucher_caja, item_caja
  , cuenta_contable_analizada, id_maquina, id_tipo_mantto, codigo_grupo_compra, otm_serie
  , otm_numero, otm_tipo, cod_art, cantidad, unidad_prv, alm_transac, tpo_transac, ser_transac
  , nro_transac, saldo, nombre_archivo, nombre_xml, nombre_cdr, tipo_bien)
values
  ( 2, 250001, 3, 'A7', 'P', '20606428309', '01', 'F201', '0006241', date '2025-01-03'
  , 'BEBIDA (J.W.)', 8.90, null, null, null, null, date '2025-01-06', null, '9125', 'S', 1.34, 7.45
  , 0.11, null, null, '9800', null, null, null, null, null, null, null, null, null, null, '033'
  , null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into pevisa.caja_chica_d
  ( serie, numero, item, codigo_motivo, tipo_relacion, codigo_relacion, tipo_referencia
  , serie_referencia, nro_referencia, fecha_referencia, detalle, importe, valor_compra, impuesto
  , estado, usuario, fecha_registro, f_vencto, cuenta_contable, moneda, igv, afecto, inafecto
  , importe_d, ruta, centro_costo, ano, mes, libro, voucher, libro_caja, voucher_caja, item_caja
  , cuenta_contable_analizada, id_maquina, id_tipo_mantto, codigo_grupo_compra, otm_serie
  , otm_numero, otm_tipo, cod_art, cantidad, unidad_prv, alm_transac, tpo_transac, ser_transac
  , nro_transac, saldo, nombre_archivo, nombre_xml, nombre_cdr, tipo_bien)
values
  ( 2, 250001, 4, 'A7', 'P', '20505322674', '01', 'F012', '0025619', date '2025-01-03'
  , 'ALMUERZO (J.W.)', 39.00, null, null, null, null, date '2025-01-06', null, '9125', 'S', 5.95
  , 33.05, null, null, null, '9800', null, null, null, null, null, null, null, null, null, null
  , '033', null, null, null, null, null, null, null, null, null, null, null, null, null, null
  , null);
insert into pevisa.caja_chica_d
  ( serie, numero, item, codigo_motivo, tipo_relacion, codigo_relacion, tipo_referencia
  , serie_referencia, nro_referencia, fecha_referencia, detalle, importe, valor_compra, impuesto
  , estado, usuario, fecha_registro, f_vencto, cuenta_contable, moneda, igv, afecto, inafecto
  , importe_d, ruta, centro_costo, ano, mes, libro, voucher, libro_caja, voucher_caja, item_caja
  , cuenta_contable_analizada, id_maquina, id_tipo_mantto, codigo_grupo_compra, otm_serie
  , otm_numero, otm_tipo, cod_art, cantidad, unidad_prv, alm_transac, tpo_transac, ser_transac
  , nro_transac, saldo, nombre_archivo, nombre_xml, nombre_cdr, tipo_bien)
values
  ( 2, 250001, 5, 'SOAT', 'P', '20418896915', '01', 'F226', '0450931', date '2025-01-06'
  , 'FORLAND - PLACA D3E829 / PRODUCCION (H.O.)', 160.00, null, null, null, null, date '2025-01-06'
  , null, '1821', 'S', 24.41, 135.59, null, null, null, '9800', null, null, null, null, null, null
  , null, null, null, null, '033', null, null, null, null, null, null, null, null, null, null, null
  , null, null, null, null);

select * from paramfa;

select * from paramco;

select c.cod_linea, l.descripcion
  from cominac_concepto_linea c
       join tab_lineas l on c.cod_linea = l.linea
 where c.cod_concepto = '19'
 order by lpad(c.cod_linea, 4, '0');

select * from tab_lineas;

select l.linea, l.descripcion
  from tab_grupos g
       join tab_lineas l on g.grupo = l.grupo
 where g.ind_vta1 = '1000'
 order by lpad(l.linea, 4, '0');


select l.linea, l.descripcion
  from tab_grupos g
       join tab_lineas l on g.grupo = l.grupo
 where g.grupo = '42'
 order by lpad(l.linea, 4, '0');

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_numero = 574;

-- OT sin cerrar
select lpad(a.id_serie, 3, '0') as id_serie, lpad(a.id_numero, 6, '0') as id_numero
     , c.descripcion as tipo, a.fecha_solicitud, a.estado, b.descripcion
     , trunc(sysdate - a.fecha_solicitud) as dias
     , trunc(months_between(sysdate, a.fecha_solicitud)) as meses, a.desc_solicitud
  from ot_mantto a
     , estado_otm b
     , ot_mantto_tipo c
 where a.estado = b.id_estado
   and trunc(months_between(sysdate, a.fecha_solicitud)) >= 4
   and a.fecha_cierre_mantto is null
   and a.estado not in (4, 8, 9)
   and a.id_tipo = c.id_tipo
   and not exists (
   select 1
     from ot_mantto_justifica j
    where j.id_tipo = a.id_tipo
      and j.id_serie = a.id_serie
      and j.id_numero = a.id_numero
   )
 order by 3;

select *
  from usuarios_caja_chica
 where usuario = 'YDOMINGUEZ';

select *
  from usuarios_caja_chica
 where usuario = 'EESPINO';

select * from ruta_docvirtual;


select h.c_codigo, planilla10.pr_nombre(h.c_codigo) as nombre
  from planilla10.personal h
 where h.tipo_tra = 'E'
   and h.situacion < '8'
   and h.c_codigo in (
   select lg.codigo_personal
     from lg_personal_compras_series lg
    where lg.serie_orden_de_compra = :ORDEN.serie
   )
 order by 1;

select * from lg_personal_compras_series;

-- usuarios aprobacion oc
select l.serie_orden_de_compra, l.codigo_personal, p.nombre
  from lg_personal_compras_series l
       join vw_personal p on l.codigo_personal = p.c_codigo
 order by codigo_personal, serie_orden_de_compra;

select * from paramlg;

select user, a.cod_art, 1, 0
  from tmp_articul_costos_pais a
 where usuario = user
 group by user, a.cod_art;


insert into tmp_articul_costos_pais
  (usuario, cod_art, pais, cantidad, vta01, vta02, vta03, ventas, costo, detalle_1, detalle_2)
values
  ( user, :EXFACTORES_VTA.cod_art, :EXFACTORES_VTA.pais, 1, :EXFACTORES_VTA.vta01
  , :EXFACTORES_VTA.vta02, :EXFACTORES_VTA.vta03, x_venta, x_costo_nn, :EXFACTORES_VTA.pais
  , :EXFACTORES_VTA.x_abreviada);

insert into tmp_articul_costos_pais
  (usuario, cod_art, pais, cantidad, vta01, vta02, vta03, ventas, costo, detalle_1, detalle_2)
values
  ( user, :EXFACTORES_VTA.cod_art, :EXFACTORES_VTA.pais, 1, :EXFACTORES_VTA.vta01
  , :EXFACTORES_VTA.vta02, :EXFACTORES_VTA.vta03, x_venta, x_costo_nn, :EXFACTORES_VTA.pais
  , :EXFACTORES_VTA.x_abreviada);

insert into tmp_articul_costos_pais
  (usuario, cod_art, pais, cantidad, vta01, vta02, vta03, ventas, costo, detalle_1, detalle_2)
select user, cod_art, pais, 1, pvta1, pvta2, pvta3, catalogo, estado, vta01, vta02, vta03, vta04
     , vta05, c2, c3
  from exfactores_vta
 where nvl(estado, '0') = '0'
   and cod_art in (
   select cod_art
     from articul_pev
    where linea <> 'ZZ'
   )
   and pais = 1;


select *
  from tmp_articul_costos_pais
 where usuario = 'PEVISA';

delete tmp_ventas
 where usuario = user;

begin
  insert into tmp_ventas
  select user, a.cod_art, 1, 0
    from tmp_articul_costos_pais a
   where usuario = user
   group by user, a.cod_art;
exception
  when others then null;
end;

begin
  pr_explosion_para_costear_1niv();
end;

select * from log_auditoria;

select *
  from vendedores
 where cod_vendedor = 'E1';
