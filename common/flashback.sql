select *
  from pk_detal as of timestamp sysdate - 1 / 24
 where pk_numero = 36809 -- numero
   and caja = 'A5';

select *
  from excomision_repre as of timestamp to_timestamp('17-05-2017 14:30:00', 'DD-MM-YYYY HH24:MI:SS')
 where codigo = 15;


select *
  from orden_de_compra as of timestamp sysdate - 1 / 24
 where serie = 6
   and num_ped in (
   631
   );


select *
  from itemord as of timestamp to_timestamp('06-02-2020 09:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where serie = 1
   and num_ped in (
   82193
   );


select *
  from proceso_bono_oa as of timestamp to_timestamp('24-09-2018 09:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where to_char(periodo_ini, 'YYYYMM') = '201808';


select *
  from proceso_bono_oa as of timestamp to_timestamp('24-09-2018 09:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where to_char(periodo_ini, 'YYYYMM') = '201808';


select *
  from proceso_bono_oa b
 where to_char(b.periodo_ini, 'YYYYMM') = '201808';



select *
  from ot_mantto as of timestamp sysdate - 1 / 24
 where id_serie = 2
   and id_numero = 77;


select *
  from orden_de_compra as of timestamp sysdate - 1 / 24
 where num_ped = 80459;


select *
  from orden_de_compra
 where num_ped = 80459;


select *
  from itemord as of timestamp sysdate - 1 / 24
 where num_ped = 80459;


select *
  from itemord
 where num_ped = 80459;


select *
  from tablas_auxiliares as of timestamp sysdate - 1 / 24
 where tipo = 4;



select distinct estado
  from itemord as of timestamp sysdate - 1 / 24
 where cod_art = 'COMPRA REPUESTOS'
   and saldo != 0
   and serie = 5;

select *
  from kardex_d_otm as of timestamp to_timestamp('30-04-2019 12:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where costo_d is null;

-- 39	18	2	459080
select *
  from kardex_d as of timestamp to_timestamp('29-09-2022 16:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'SS'
   and tp_transac = '22'
   and serie = 1
   and numero = 233822;

select *
  from kardex_d as of timestamp to_timestamp('12-09-2022 11:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = '15'
   and tp_transac = '29'
   and serie = 1
   and numero = 1568711;

select *
  from pr_ot as of timestamp to_timestamp('12-08-2019 11:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where nuot_tipoot_codigo = 'AR'
   and numero = 613165;


select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero = 613165;


select *
  from pr_ot_det
 where ot_nuot_tipoot_codigo = 'AR'
   and ot_numero in (
   613165
   );

select *
  from kardex_g as of timestamp to_timestamp('08-01-2021 11:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = '06'
   and tp_transac = '18'
   and serie = 2
   and numero = 437289;


select *
  from kardex_d as of timestamp to_timestamp('08-01-2021 11:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = '06'
   and tp_transac = '18'
   and serie = 2
   and numero = 437289;


select *
  from exfacturas as of timestamp to_timestamp('04-09-2019 06:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where numero = 5954;


select *
  from activo_fijo as of timestamp to_timestamp('01-10-2019 15:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_activo_fijo = 'MAQ3ALM-009';


select *
  from activo_fijo_asiento
 where cod_activo_fijo = 'MAQ3ALM-009';


select *
  from movglos
 where ano = 2019
   and mes = 6
   and libro = '05'
   and voucher = 60064;


select *
  from movdeta as of timestamp to_timestamp('01-10-2019 15:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2019
   and mes = 6
   and libro = '05'
   and voucher = 60064;



select *
  from ot_mantto as of timestamp to_timestamp('09-10-2019 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where id_tipo = 'MQ'
   and id_serie = 2
   and id_numero = 30;


select *
  from orden_de_compra as of timestamp to_timestamp('11-11-2019 12:15:00', 'DD-MM-YYYY HH24:MI:SS')
 where serie = 30
   and num_ped in (62);


insert into permiso
select *
  from permiso as of timestamp to_timestamp('20-11-2019 18:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where numero = 43032;


insert into permiso_idtecflex
select *
  from permiso_idtecflex as of timestamp to_timestamp('20-11-2019 18:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where numero = 43032;



select *
  from movfide as of timestamp to_timestamp('29-11-2019 17:18', 'DD-MM-YYYY HH24:MI')
 where ano = 2019
   and mes = 11
   and tipo = '2'
   and voucher in (114076);


select *
  from movfide as of timestamp to_timestamp('29-11-2019 17:1', 'DD-MM-YYYY HH24:MI')
 where ano = 2019
   and mes = 11
   and tipo = '2'
   and voucher in (114076);


select *
  from movglos as of timestamp to_timestamp('16-12-2019 16:00', 'DD-MM-YYYY HH24:MI')
 where ano = 2019
   and mes = 11
   and libro = '08'
   and voucher in (
   110752
   );


insert into movglos
select *
  from movglos as of timestamp to_timestamp('16-12-2019 14:00', 'DD-MM-YYYY HH24:MI')
 where ano = 2019
   and mes = 11
   and libro = '08'
   and voucher in (
   110752
   );



select *
  from movdeta as of timestamp to_timestamp('16-12-2019 14:00', 'DD-MM-YYYY HH24:MI')
 where ano = 2019
   and mes = 11
   and libro = '08'
   and voucher in (
   110752
   );


select *
  from movglos
 where ano = 2019
   and mes = 11
   and libro = '08'
   and voucher in (
   110752
   );


select *
  from caja_chica_d as of timestamp to_timestamp('10-03-2020 15:00', 'DD-MM-YYYY HH24:MI')
 where serie = 2
   and numero = 200016;


select *
  from caja_chica_d
 where serie = 2
   and numero = 200016;


select *
  from factcob as of timestamp to_timestamp('09-05-2020 18:00', 'DD-MM-YYYY HH24:MI')
 where tipdoc = 'LV'
   and numero in (12594, 12597, 12600, 12603, 12606);


select *
  from kardex_g_movglos as of timestamp to_timestamp('09-09-2020 18:00', 'DD-MM-YYYY HH24:MI')
 where cod_alm = '02'
   and tp_transac = '11'
   and serie = 1
   and numero = 24353;


select *
  from itemord as of timestamp to_timestamp('12-09-2022 12:00', 'DD-MM-YYYY HH24:MI')
 where serie = 3
   and num_ped in (
   666
   );


select *
  from itemord as of timestamp to_timestamp('08-10-2020 15:00', 'DD-MM-YYYY HH24:MI')
 where num_ped = 82624
   and serie = 1;


select *
  from programa_capacitacion_tema as of timestamp to_timestamp('30-10-2020 11:00', 'DD-MM-YYYY HH24:MI')
 where id_programa = 2;

-- 05-27-3-126237
-- 20-16-3-126158

insert into kardex_d
select *
  from kardex_d as of timestamp to_timestamp('31-10-2020 12:00', 'DD-MM-YYYY HH24:MI')
 where cod_alm = '20'
   and tp_transac = '16'
   and serie = 3
   and numero = 126158;



select *
  from kardex_g as of timestamp to_timestamp('17-08-2021 15:30', 'DD-MM-YYYY HH24:MI')
 where cod_alm = '15'
   and tp_transac = '29'
   and serie = 1
   and numero = 1449891;

-- PR	8	413213

select *
  from relacion
 where tipodoc = 'PR'
   and serie = 8
   and numero = 413213;


select *
  from itemord as of timestamp to_timestamp('02-11-2020 17:45', 'DD-MM-YYYY HH24:MI')
 where serie = 1
   and num_ped in (82784);


select *
  from itemord as of timestamp sysdate - 1 / 24
 where serie = 1
   and num_ped in (82784);


select *
  from pr_ot as of timestamp sysdate - 1 / 24
 where numero = 403473
   and nuot_tipoot_codigo = 'PR';

select *
  from ot_mantto as of timestamp to_timestamp('01-12-2020 14:15', 'DD-MM-YYYY HH24:MI')
 where id_tipo = 'MQ'
   and id_serie = 3
   and id_numero = 960;


select *
  from ot_mantto as of timestamp to_timestamp('01/12/2020 11:59', 'DD/MM/YYYY HH24:MI')
 where id_tipo = 'MQ'
   and id_serie = 3
   and id_numero = 960;


select *
  from ot_mantto as of timestamp to_timestamp('01-12-2020 11:59 am', 'DD-MM-YYYY HH:MI AM')
 where id_tipo = 'MQ'
   and id_serie = 3
   and id_numero = 960;


select *
  from pedido_flujo as of timestamp to_timestamp('11-12-2020 17:00', 'DD-MM-YYYY HH:MI')
 where numero_kardex = '0272245';


select *
  from itemord as of timestamp to_timestamp('16-12-2020 17:00', 'DD-MM-YYYY HH24:MI')
 where serie = 1
   and num_ped in (
   82965
   );


select *
  from activo_fijo_asiento as of timestamp to_timestamp('19-03-2021 17:00', 'DD-MM-YYYY HH24:MI')
 where cod_activo_fijo = 'CEL941236863';


select *
  from movdeta as of timestamp to_timestamp('27-04-2021 15:30', 'DD-MM-YYYY HH24:MI')
 where ano = 2021
   and mes = 0
   and libro = '05'
   and voucher in (
   13
   );

select *
  from despacho_guias as of timestamp to_timestamp('05-04-2021 10:00', 'DD-MM-YYYY HH24:MI')
 where numero_kardex = '0284951';


select *
  from oc_registro_facturas as of timestamp to_timestamp('05-05-2021 17:25', 'DD-MM-YYYY HH24:MI')
 where serie_oc = 30
   and numero_oc = 186;

select *
  from orden_de_compra as of timestamp to_timestamp('21-05-2021 15:00', 'DD-MM-YYYY HH24:MI')
 where serie = 3
   and num_ped = 441;

select *
  from activo_fijo as of timestamp to_timestamp('04-07-2021 19:00', 'DD-MM-YYYY HH24:MI')
 where cod_activo_fijo like 'AREA COMUN COMERC%';


select *
  from itemord as of timestamp to_timestamp('10-08-2021 08:30', 'DD-MM-YYYY HH24:MI')
 where serie = 1
   and num_ped in (
   83643
   );


select *
  from lg_detalle_gastos as of timestamp to_timestamp('29-08-2021 11:00', 'DD-MM-YYYY HH24:MI')
 where numero_embarque = 3296;



select *
  from tmp_moviart_dos as of timestamp to_timestamp('15-09-2021 09:00', 'DD-MM-YYYY HH24:MI')
 where ano = 2021
   and mes in (7)
   and id in ('S')
   and motivo = '1'
   and (cta like '26%')
   and docto like 'PK%';


select *
  from vacaciones as of timestamp to_timestamp('17-09-2021 15:45', 'DD-MM-YYYY HH24:MI')
 where numero = 16862;


select *
  from pevisa.lg_factura_comercial as of timestamp to_timestamp('29-09-2021 12:00', 'DD-MM-YYYY HH24:MI')
 where numero_embarque = 1259;


select *
  from gastos_de_viaje_habilitado as of timestamp to_timestamp('07-10-2021 16:00', 'DD-MM-YYYY HH24:MI')
 where fecha between to_date('01/10/2021', 'DD/MM/YYYY') and to_date('31/10/2021', 'DD/MM/YYYY');

select *
  from gastos_de_viaje_d as of timestamp to_timestamp('15-10-2021 18:00', 'DD-MM-YYYY HH24:MI')
 where id_vendedor = '38'
   and numero = 108
   and numero_documento = '0390158';

select *
  from caja_chica as of timestamp to_timestamp('20-10-2021 12:30', 'DD-MM-YYYY HH24:MI')
 where serie = 1
   and numero = 21063;


select *
  from kardex_d as of timestamp to_timestamp('22-10-2021 13:30', 'DD-MM-YYYY HH24:MI')
 where cod_alm = 'A1'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   205496
   );


select *
  from movglos as of timestamp to_timestamp('28-10-2021 11:30', 'DD-MM-YYYY HH24:MI')
 where ano = 2021
   and mes = 7
   and libro = '33'
   and voucher in (
   70043
   );

select *
  from movdeta as of timestamp to_timestamp('28-10-2021 11:30', 'DD-MM-YYYY HH24:MI')
 where ano = 2021
   and mes = 7
   and libro = '33'
   and voucher in (
   70043
   );

select *
  from lg_detalle_gastos as of timestamp to_timestamp('10-11-2021 10:00', 'DD-MM-YYYY HH24:MI')
 where numero_embarque = 3420;


select *
  from pedido_flujo as of timestamp to_timestamp('14-06-2022 08:30', 'DD-MM-YYYY HH24:MI')
 where numero_kardex in (
   437068
   );

select distinct ot_numero from ot_saos as of timestamp to_timestamp('14-06-2022 19:40', 'DD-MM-YYYY HH24:MI');

select *
  from pr_ot as of timestamp to_timestamp('26-09-2022 08:45', 'DD-MM-YYYY HH24:MI')
 where nuot_tipoot_codigo = 'PR'
   and numero in (
   437068
   );

select *
  from pr_ot_det as of timestamp to_timestamp('23-09-2022 13:45', 'DD-MM-YYYY HH24:MI')
 where ot_nuot_tipoot_codigo = 'PR'
   and ot_numero in (
   465951
   );

select *
  from activo_fijo_depreciacion as of timestamp to_timestamp('08-08-2022 11:00', 'DD-MM-YYYY HH24:MI')
 where cod_activo_fijo = 'EQ MEDIC8'
   and cod_tipo_depreciacion = 'TRB'
   and fecha != to_date('31/12/2018', 'dd/mm/yyyy')
 order by fecha;

select *
  from pedido_flujo as of timestamp to_timestamp('08-09-2022 15:00', 'DD-MM-YYYY HH24:MI')
 where numero_kardex in (
   317695
   )
 order by numero_kardex, fecha_envio;
