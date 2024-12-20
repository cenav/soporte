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
   and mes = 9
   and libro = '28'
   and voucher = 90043;

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
 where serie = 2
   and numero = 240127;

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
  from gastos_de_viaje_habilitado
 where id_vendedor = 'Z10'
   and numero = 100;

select *
  from gastos_de_viaje_m
 where id_vendedor = 'Z10'
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
  from caja
 where id_serie = 2
   and id_numero = 17;
