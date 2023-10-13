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
  from kardex_g as of timestamp to_timestamp('11-02-2023 08:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29810;

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
  from permiso_idtecflex as of timestamp to_timestamp('20-11-2019 18:00:00',
                                                      'DD-MM-YYYY HH24:MI:SS')
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

select distinct ot_numero
  from ot_saos as of timestamp to_timestamp('14-06-2022 19:40', 'DD-MM-YYYY HH24:MI');

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

insert into kardex_g
select *
  from kardex_g as of timestamp to_timestamp('11-02-2023 08:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29810;

select *
  from usuario_modulo_alterno as of timestamp to_timestamp('21-02-2023 08:00:00',
                                                           'DD-MM-YYYY HH24:MI:SS')
 where id_alterno = 'KCASTILLO';


select *
  from saldosc_tmp as of timestamp to_timestamp('13-03-2023 15:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ctactble = '123106'
   and fecha_dif = to_date('31/01/2023', 'dd/mm/yyyy');

insert into saldosc_tmp
select *
  from saldosc_tmp as of timestamp to_timestamp('13-03-2023 15:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from movglos as of timestamp to_timestamp('13-03-2023 14:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 1
   and libro = '38'
   and voucher = 10011;

select *
  from analisis_consumo as of timestamp to_timestamp('18-04-2023 09:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 2;

select *
  from movglos as of timestamp to_timestamp('16-05-2023 14:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 4
   and libro = '08'
   and voucher in (40182);


select *
  from movdeta as of timestamp to_timestamp('16-05-2023 14:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 4
   and libro = '08'
   and voucher in (40182);

insert into pevisa.movglos ( ano, mes, libro, voucher, glosa, fecha, tipo_cambio, estado
                           , tipo_referencia, nro_referencia, sistema, pase_ctacte, tipo_operacion
                           , relacion, usuario, fec_reg, tipo_mov, serie, numliq, fecliq
                           , pase_cta_cte_pro, cod_proveed, moneda, item, serie_orden, numero_order
                           , c_resp, nro_planilla)
values ( 2023, 4, '08', 40182, 'NI19 FCI2300016 JIANGSU EASYLAND', date '2023-04-26', 'V', '1', '01'
       , '0000246', 'CONT', 'S', '10', null, 'GJARAMILLO', date '2023-04-25', 'CRE', 'E001', null
       , null, 'S', '20510942559', 'D', '30', null, null, null, '25/04/2023');


insert into pevisa.movdeta ( ano, mes, libro, voucher, cuenta, tipo_cambio, tipo_relacion, relacion
                           , tipo_referencia, nro_referencia, fecha, detalle, cargo_s, abono_s
                           , cargo_d, abono_d, estado, columna, generado, usuario, fec_reg, tipo_mov
                           , serie, f_vencto, cambio, file_cta_cte)
values ( 2023, 4, '08', 40182, '42122000', 'V', 'P', '20510942559', '01', '0000246'
       , date '2023-02-10', 'TALLERES LUCAS PERÚ S.A.C.', 0.00, 327.73, 0.00, 85.19, '1', 6, 'N'
       , 'GJARAMILLO', timestamp '2023-05-03 17:05:41', 'MOD', 'E001', date '2023-05-25', 3.8690
       , 'P');
insert into pevisa.movdeta ( ano, mes, libro, voucher, cuenta, tipo_cambio, tipo_relacion, relacion
                           , tipo_referencia, nro_referencia, fecha, detalle, cargo_s, abono_s
                           , cargo_d, abono_d, estado, columna, generado, usuario, fec_reg, tipo_mov
                           , serie, f_vencto, cambio, file_cta_cte)
values ( 2023, 4, '08', 40182, '28111002', 'V', 'P', '20510942559', '01', '0000246'
       , date '2023-02-06', 'TALLERES LUCAS PERÚ S.A.C.', 211.47, 0.00, 54.97, 0.00, '1', 1, 'N'
       , 'GJARAMILLO', date '2023-04-26', 'CRE', 'E001', null, 3.8470, 'P');
insert into pevisa.movdeta ( ano, mes, libro, voucher, cuenta, tipo_cambio, tipo_relacion, relacion
                           , tipo_referencia, nro_referencia, fecha, detalle, cargo_s, abono_s
                           , cargo_d, abono_d, estado, columna, generado, usuario, fec_reg, tipo_mov
                           , serie, f_vencto, cambio, file_cta_cte)
values ( 2023, 4, '08', 40182, '28111003', 'V', 'P', '20510942559', '01', '0000246'
       , date '2023-02-06', 'TALLERES LUCAS PERÚ S.A.C.', 116.26, 0.00, 30.22, 0.00, '1', 1, 'N'
       , 'GJARAMILLO', date '2023-04-26', 'CRE', 'E001', null, 3.8470, 'P');

select *
  from kardex_d as of timestamp to_timestamp('19-05-2023 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;


select *
  from kardex_g as of timestamp to_timestamp('18-05-2023 16:45:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;

select *
  from kardex_d as of timestamp to_timestamp('19-05-2023 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 91
   and numero = 298;


select *
  from kardex_g as of timestamp to_timestamp('15-06-2023 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'TA'
   and tp_transac = '35'
   and serie = 29
   and numero in (
   28
   )
 order by ing_sal desc, numero_pguia;


select *
  from kardex_d as of timestamp to_timestamp('15-06-2023 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'TA'
   and tp_transac = '35'
   and serie = 29
   and numero in (
   28
   );

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped)
values ( 'TA', '35', 29, 28, date '2023-03-22', '10', 29, 9021, null, 'C', '20100084768', '00', null
       , 1, 'D', null, null, 0.00, 0.00, '0', '3', '*', 'S', '0', null, null, null, null
       , 'PEVISA AUTO PARTS S.A.C.', null, null, null, null, null, null, null, 0, 'GN29-9021', null
       , null, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '35', 29, 28, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);
insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '35', 29, 28, 'RES 733', 22.7000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);
insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '35', 29, 28, 'SOL 831', 13.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
       , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null);

select *
  from kardex_d as of timestamp to_timestamp('21-07-2023 10:00:00', 'DD-MM-YYYY HH24:MI:SS')
 where cod_alm = 'TA'
   and tp_transac = '10'
   and serie = 29
   and numero = 9696
   and cod_art = 'CAR 485';

select *
  from excomision_repre_fact as of timestamp to_timestamp('22-08-2023 09:25:00',
                                                          'DD-MM-YYYY HH24:MI:SS')
 where codigo = 170
   and numero_factura not in (
                              55012855, 55013440, 55013497, 55013606, 55012969, 55013072, 55013127,
                              55013420, 55013659, 55013884, 55012854, 55013612, 55013534, 55013713,
                              55013793, 55013855, 55013858, 55013921, 55013958, 55014032, 55014034,
                              55014052, 55014078, 55014214, 55014241, 55014341, 55014354, 55014416,
                              55014462, 55014463, 55013116, 55013297, 55013334, 55013425, 55013681,
                              55013959, 55013966, 55013970, 55013976, 55013977, 55013989, 55014021,
                              55014033, 55014039, 55014040, 55014045, 55014070, 55014071, 55014072,
                              55014147, 55014154, 55014216, 55014236, 55014270, 55014327, 55014364,
                              55014365, 55014366, 55014377, 55014414, 55014427, 55012633, 55013026,
                              55013451, 55013957
   );

select *
  from movfide_situacion_banco
 where p_ano = 2023;

select * from movfide_situacion_banco;


select *
  from produccion_armado
 where numero_oa = 993912;

select *
  from produccion_armado
 where estado = 2;

select *
  from movglos as of timestamp to_timestamp('07-09-2023 11:30:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 6
   and libro = '11'
   and voucher = 60065;

select *
  from movdeta as of timestamp to_timestamp('07-09-2023 11:30:00', 'DD-MM-YYYY HH24:MI:SS')
 where ano = 2023
   and mes = 6
   and libro = '11'
   and voucher = 60065;

select *
  from orden_de_compra as of timestamp to_timestamp('15-09-2023 11:30:00', 'DD-MM-YYYY HH24:MI:SS')
 where serie = 30
   and num_ped = 24;
