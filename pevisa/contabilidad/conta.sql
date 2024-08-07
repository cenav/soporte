-- contabilidad maestro
select *
  from movglos
 where ano = 2024
   and mes = 4
   and libro = '08'
   and voucher = 40085;

select *
  from movdeta
 where ano = 2024
   and mes = 3
   and libro = '20'
   and voucher = 30007
   and serie = '096';

-- insert into pevisa.movdeta ( ano, mes, libro, voucher, cuenta, tipo_cambio, tipo_relacion, relacion
--                            , tipo_referencia, nro_referencia, fecha, detalle, cargo_s, abono_s
--                            , cargo_d, abono_d, estado, columna, generado, usuario, fec_reg, tipo_mov
--                            , serie, f_vencto, cambio, file_cta_cte)
-- values ( 2024, 3, '20', 30007, '451102', 'V', 'P', '20100047218', '26', '3981486', date '2023-10-18'
--        , null, 48214.42, 0.00, 12698.03, 0.00, '1', null, 'N', 'PEGUILUZ', date '2024-04-11', 'CRE'
--        , '096', null, 3.7970, 'N');

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
 where numero = 240031;

select *
  from caja_chica_d
 where numero = 240031;

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

insert into pevisa.pr_tabmaq ( codigo, descripcion, fecha_fabricacion, numero_serie, id_tipo, estado
                             , centro_costo, id_seccion, id_modelo, id_marca, local
                             , fecha_adquisicion, id_pais, consumo_energia, consumo_energia_unidad
                             , capacidad, alto, largo, ancho, peso, num_importa, linea_maquina
                             , abreviatura, cod_padre, id_seccion_prod, id_prioridad, observaciones)
values ( 'MQ1PJEB-038 1A', 'PRENSA CUADRUPLE PAN STONE 1A', date '2024-05-21', null, null, null
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
 where tipdoc = 'LV'
   and numero in (
                  22781, 22784, 22787
   );

-- PRIMER VCTO. 15/06/2024
-- SEGUNDO VCTO. 15/07/2024
-- TERCER VCTO. 14/08/2024.

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
 where id_vendedor = '34'
   and numero = 230;

select *
  from gastos_de_viaje_habilitado_m
 where id_vendedor = '34'
   and numero = 230;

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
 where id_vendedor = '34'
   and numero = 230;

select *
  from gastos_de_viaje_m
 where id_vendedor = '34'
   and numero = 230;

select *
  from gastos_de_viaje_d
 where id_vendedor = '34'
   and numero = 230;

select * from vw_gasto_viaje;

select *
  from gastos_de_viaje
 where id_vendedor = 'B10'
   and numero = 108;

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
 order by centro_costo;

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

select * from nrodoc;