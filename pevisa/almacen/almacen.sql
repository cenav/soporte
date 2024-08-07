select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero in (
                  744551, 744552, 744553, 744554
   );

select *
  from kardex_d
 where cod_alm = 'FT'
   and tp_transac = '29'
   and serie = 1
   and numero in (
   1797694
   );

select *
  from almacen
 where cod_art = 'R-3804304';

select *
  from kardex_g_movglos
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   31796
   );

select *
  from kardex_g_movglos
 where guia_bf_numero is not null
 order by fecha_ingreso_almacen desc;

select *
  from almacen
 where cod_alm = '01'
   and cod_art = 'R-3883620';


select *
  from kardex_d
 where cod_art = 'SB CH 30015 MLS'
   and extract(year from fch_transac) = 2024
 order by fch_transac desc;

select *
  from despacho_guias
 where cod_alm_kardex = 'F0'
   and tp_transac_kardex = 21
   and serie_kardex = 25
   and numero_kardex = 17446;

select *
  from kardex_g_movglos
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   31664
   );

select *
  from kardex_g_historia
 where cod_alm = '03'
   and tp_transac = '18'
   and serie = 2
   and numero in (
   565559
   );


select *
  from kardex_d
 where cod_alm = 'F8'
   and cod_art = 'FSP 95067 GR'
   and estado != '9'
 order by fch_transac desc;

select *
  from almacen
 where cod_art = 'FSP 95067 GR';

-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( 'F8', '10', 18, 4204, 'FSP 95067 GR', 35.0000, 0.000000, 0.000000, date '2022-11-10', 0.00
--        , 0.00, 0.000, '6', null, '*', 'I', null, null, null, null, null, null, null, null, null
--        , null, null, null, null, null, null, null);


select *
  from almacen
 where cod_art = 'RP 50S-54316-N';

select *
  from kardex_d
 where cod_alm = '17'
   and tp_transac = '10'
   and serie = 1
   and numero = 27;

-- descarga almacen de transito
select *
  from kardex_g
 where cod_alm = 'D3'
   and tp_transac = '35'
   and serie = 39
   and numero = 2323
   and estado <= 7
   and tp_transac = '10'
   and ing_sal = 'I'
--    and cod_relacion = '20100084768' and nro_sucur in ('04', '05', '06', '11', '03')
   and cod_alm in (
   select cod_alm_transito
     from almacenes
    where cod_alm_transito is not null
      and cod_alm_transito = kardex_g.cod_alm
   );

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 532531;

select *
  from kardex_g_movglos
 where cod_alm = 'SS'
   and tp_transac = '11'
   and serie = 1
   and numero = 29807;

select *
  from almacenes
 where cod_alm = 'D3';


select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero = 178279;

select *
  from instrumento_asigna
 where id_instrumento = 16;

select *
  from movglos
 where ano = 2022
   and mes = 11
   and libro = '39'
   and voucher = 11004;

-- 2022 11 39 110004
-- 2022 12 39 120004

select cod_art
     , sum(case ing_sal when 'I' then cantidad when 'S' then cantidad * -1 else 0 end) as total
  from kardex_d
 where cod_art = 'SLIM380.1092SIL'
 group by cod_art;

select *
  from pr_for_ins
 where formu_art_cod_art = '95037/22TG';

select *
  from solimat_g
 where numero = 181100;

select *
  from solimat_d
 where numero = 193984;

select *
  from kardex_g
 where num_importa = 'SM 1 179926';

select *
  from kardex_d d
 where exists(
   select *
     from kardex_g g
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
      and g.num_importa = 'SM 1 179922'
   );

select *
  from kardex_g
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 525055;

select *
  from kardex_d
 where cod_alm = 'D2'
   and tp_transac = '18'
   and serie = 2
   and numero = 525055;

select *
  from transacciones_almacen
 where tp_transac = '22';

select *
  from pr_usualma
 where usuario = 'MGUIELAC'
 order by cod_alm;

select *
  from usuarios_almacenes_perfil
 where usuario = 'MGUIELAC'
   and cod_alm = '30';

-- 58 -> 30

select *
  from kardex_g
 where cod_alm = '62'
   and extract(year from fch_transac) = 2023
   and extract(month from fch_transac) = 7
 order by fch_transac desc;

select *
  from solimat_g
 where cod_alm01 = '62'
 order by fecha desc;

select *
  from kardex_g
 where cod_alm = '62'
   and nro_doc_ref = 183217;

select *
  from kardex_g
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select *
  from view_salidas_pre_guias
 where cod_alm = '62'
   and tp_transac = '22'
   and serie = 1
   and numero = 256952;

select g.tp_transac, x.descripcion, g.serie, g.numero
  from kardex_g g
     , tablas_auxiliares x
 where g.estado not in ('6', '9')
   and g.ing_sal = 'S'
   and g.tp_transac > 20
   and x.tipo = 32
   and x.codigo = g.tp_transac
   and g.tp_transac = '30'
   and g.serie = 45
   and g.numero = 7
 order by g.tp_transac, g.serie, g.numero;


select *
  from kardex_g
 where estado <> '9'
   and tp_transac in ('21', '30')
--    and tp_transac = '30'
   and serie = 45
   and numero = 7
   and cod_alm in (
   select codigo
     from tablas_auxiliares
    where tipo = 33
      and indicador1 = 'T'
   )
   and to_number(to_char(fch_transac, 'YYYYMM')) > to_number(2023 || lpad(4, 2, 0));


select *
  from icierre
 where tp_art = 'T';

select *
  from kardex_g
 where serie = 1
   and numero = 8157
   and fch_transac = to_date('14/07/2023', 'dd/mm/yyyy');

select *
  from kardex_g
 where tip_doc_ref = 'P2'
   and ser_doc_ref = '21'
   and nro_doc_ref = '474';

select * from tmp_carga_data;

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped)
values ( 'TA', '10', 29, 9237, date '2023-06-30', '35', 29, 9237, null, 'C', '20100084768', '05'
       , null, 1, 'D', '17', null, 0.00, 0.00, '6', '3', '*', 'I', '0', null, null, null, null
       , 'PEVISA AUTO PARTS S.A.C.', null, null, null, null, null, null, null, 0, '6', null, null
       , null, null, null);

insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( 'TA', '10', 29, 9237, 'SOL 830', 586.4400, 0.000000, 0.000000, date '2023-06-30', 0.00
       , 0.00, 0.000, '6', null, '*', 'I', null, null, null, null, null, null, null, null, null
       , null, null, null, null, null, null, null);

-- Luis Arias 21/07/2023
select *
  from kardex_g
 where cod_alm = 'TA'
   and tp_transac = '10'
   and serie = 29
   and numero = 9696;

select *
  from kardex_d
 where cod_alm = 'TA'
   and tp_transac = '10'
   and serie = 29
   and numero = 9021
   and cod_art = 'CAR 485';


-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( '17', '10', 1, 27, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
--        , 0.000, '6', null, '*', 'I', null, null, null, null, null, null, null, null, null, null
--        , null, null, null, null, null, null);
--
--
-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( 'TA', '35', 29, 25, 'CAR 485', 40.0000, 0.000000, 0.000000, date '2023-03-03', 0.00, 0.00
--        , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
--        , null, null, null, null, null, null);
--
--
-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( 'TA', '10', 29, 9696, 'CAR 485', 40.0000, 0.000000, 0.000000, date '2023-03-03', 0.00, 0.00
--        , 0.000, '6', null, '*', 'I', null, null, 0.00, null, null, null, null, null, null, null
--        , null, null, 40.0000, null, null, null);
--
--
-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( 'TA', '35', 29, 28, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
--        , 0.000, '6', null, '*', 'S', null, null, null, null, null, null, null, null, null, null
--        , null, null, null, null, null, null);
--
--
-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( 'TA', '10', 29, 9021, 'CAR 485', 20.0000, 0.000000, 0.000000, date '2023-03-22', 0.00, 0.00
--        , 0.000, '6', null, '*', 'I', null, null, 0.00, null, null, null, null, null, null, null
--        , null, null, 20.0000, null, null, null);


select *
  from solimat_g
 where numero in (
                  184128, 184129, 184132
   );


select *
  from view_salidas_pre_guias_nac
 where cod_alm in ('F0') and enviada = 0
   and not exists (
   select 1
     from kardex_g_guia_remision r
    where cod_alm = view_salidas_pre_guias_nac.cod_alm
      and tp_transac = view_salidas_pre_guias_nac.tp_transac
      and serie = view_salidas_pre_guias_nac.serie
      and numero = view_salidas_pre_guias_nac.numero
      and guia_serie like 'T%'
   );

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 5851;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 4556;

-- 4698 4697

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 4697;

select *
  from clientes
 where cod_cliente = '20100814162';

select *
  from view_salidas_pre_guias_nac
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero = 4556;


insert into pevisa.kardex_g_guia_remision ( guia_serie, guia_numero, fecha_traslado, ubigeo_partida
                                          , ubigeo_llegada, direccion_llegada, ruc, cod_alm
                                          , tp_transac, serie, numero, motivo_traslado
                                          , transporte_empresa, transporte_chofer, transporte_unidad
                                          , bultos, peso, nro_sucursal_partida, nro_sucursal_llegada
                                          , modalidad_traslado, detalle, contenedor, precinto
                                          , numero_documento_relacionado
                                          , codigo_documento_relacionado
                                          , descri_documento_relacionado, peso_items, pk_serie
                                          , pk_numero, pk_tipo, ruc_llegada
                                          , descripcion_motivo_traslado
                                          , codigo_establecimiento_partida
                                          , codigo_establecimiento_llegada, fecha_emision
                                          , precinto_linea, carreta, marca_1, cartones, marca_2
                                          , marca_3)
values ( 'T001', 4395, date '2023-09-14', '070101', '050101', 'ASOC. WARI ACCOPAMPA MZA. B LOTE. 1'
       , '10465247555', 'F0', '21', 25, 4556, '01', '20604418934', null, null, 123.00, 2291.9800
       , '03', '00', '01', null, null, null, 'F050-00183120', '01', 'FACTURA', null, null, null
       , null, null, null, null, null, null, null, null, null, null, null, null);

insert into pevisa.kardex_g_guia_remision ( guia_serie, guia_numero, fecha_traslado, ubigeo_partida
                                          , ubigeo_llegada, direccion_llegada, ruc, cod_alm
                                          , tp_transac, serie, numero, motivo_traslado
                                          , transporte_empresa, transporte_chofer, transporte_unidad
                                          , bultos, peso, nro_sucursal_partida, nro_sucursal_llegada
                                          , modalidad_traslado, detalle, contenedor, precinto
                                          , numero_documento_relacionado
                                          , codigo_documento_relacionado
                                          , descri_documento_relacionado, peso_items, pk_serie
                                          , pk_numero, pk_tipo, ruc_llegada
                                          , descripcion_motivo_traslado
                                          , codigo_establecimiento_partida
                                          , codigo_establecimiento_llegada, fecha_emision
                                          , precinto_linea, carreta, marca_1, cartones, marca_2
                                          , marca_3)
values ( 'T001', 4557, date '2023-09-16', '070101', '150115', 'AV.REP.PANAMA 2457 URB STA CATALINA'
       , '20100814162', 'F0', '21', 25, 4704, '01', '20491988682', '03', '03', 6.00, 180.0000, '03'
       , '01', '02', null, null, null, 'F050-00183266', '01', 'FACTURA', null, null, null, null
       , null, null, null, null, null, null, null, null, null, null, null);

select *
  from kardex_d
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   31044
   );


select *
  from almacen
 where cod_alm = '03'
   and stock > 0;

select *
  from cotizacion
 where num_ped = 206025;

select *
  from almacen
 where cod_art = 'ETIQ R-EFB Q85-90D23L';

select *
  from expedidos
 where numero = 15959;

select * from packing_agrupar;

select *
  from kardex_d
 where cod_alm = '90'
   and tp_transac = '27'
   and serie = 180
   and numero = 42;

select *
  from articul
 where cod_art in ('MQ2CORTLASER-003', 'MQ2MATR-047');

select *
  from kardex_g
 where cod_alm = '90'
   and tp_transac = '27'
   and serie = 180
   and numero = 38;

select *
  from kardex_d
 where cod_alm = '90'
   and tp_transac = '27'
   and serie = 180
   and numero = 38;


select *
  from kardex_g_historia
 where cod_alm = '90'
   and tp_transac = '27'
   and serie = 180
   and numero = 38;

select *
  from solicita_cambio_trx_det
 where cod_alm = 'A1'
   and tp_transac = '11'
   and serie = 1
   and numero = 30363;

select *
  from pedido_flujo
 where extract(year from fecha_envio) = 2024;

select *
  from pedido_flujo
 where numero_kardex = '645'
   and num_ped = '229749'
 order by fecha_envio;

select *
  from kardex_d
 where cod_art in (
                   'RIMTGELTNCLP300M-002', 'RIMTGELTNCLP300M-003', 'RIMTGELTNCLP300M-004'
   )
 order by cod_art, fch_transac;

select guia_serie || '-' || to_char(guia_numero)
  from kardex_g_guia_remision
 where tp_transac = 'F0'
   and serie = 25
   and numero = 6659;

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = 21
   and serie = 25
   and numero = 6658;

select numero
  from nrodoc
 where tipodoc = '09'
   and serie = 'T001'
   for update of numero;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 6396;

declare
  x_numero_despacho number;
begin
  x_numero_despacho := pkg_guia_sunat.get_fnumero_guiad('09', 'T001');
  dbms_output.put_line(x_numero_despacho);
end;

select * from view_oc_y_op_servicios_enviar;

select *
  from pr_ot_orden_de_servicio
 where numero = 527802;

select *
  from pr_ot_orden_de_servicio
 where kardex_cod_alm = '90'
   and kardex_tp_transac = '27'
   and kardex_serie = 180
   and kardex_numero = 40;


select *
  from pk_gnumero
 where pk_numero = 56112;

select * from pk_glosa;

select *
  from numdoc
 where tp_transac = '27'
   and serie = 1;

select *
  from numdoc
 where tp_transac = '16'
   and serie = 1;

select *
  from numdoc
 where tp_transac = '16'
   and serie = 1;

-- resumen vacaciones excel

select *
  from kardex_g
 where tp_transac = '16'
   and serie = 1
 order by numero desc;

select *
  from kardex_g
 where tp_transac = '16'
   and serie = 1
   and numero = 202868;

select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '15'
   and serie = 1
   and numero = 1378
   and cod_art = '380.912';


select * from transacciones_almacen;


select *
  from kardex_g
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and numero = 885
 order by fch_transac desc;


select *
  from kardex_d
 where cod_alm = '03'
   and tp_transac = '28'
   and serie = 1
   and numero = 885
   and rownum = 1
 order by fch_transac desc;


select *
  from numdoc
 where tp_transac = '28'
   and serie = 1;

insert into pevisa.kardex_g ( cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref
                            , ser_doc_ref, nro_doc_ref, glosa, tp_relacion, cod_relacion, nro_sucur
                            , cond_pag, nro_lista, moneda, cod_vende, cliente_afecto, por_desc1
                            , por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion
                            , cod_transp, domicilio, ruc_transp, nombre, direccion, ruc, tara_co
                            , tara_bo, tara_ca, placa_transp, le_transp, cant_item, num_importa
                            , tipo_pguia, serie_pguia, numero_pguia, pr_procedencia, pr_numped)
values ( '03', '28', 1, 886, date '2023-10-30', null, null, null, null, null, null, null, null, 1
       , null, null, 'S', 0.00, 0.00, '1', '3', 'D', 'S', '0', null, null, null, null, null, null
       , null, null, null, 1.0000, null, null, null, 'BD2310', null, null, null, null, null);


insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
                            , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
                            , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
                            , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
                            , pr_canthabi, pr_tipot, pr_numot, pr_numped)
values ( '03', '28', 1, 886, '380.912', 59, 0.000000, 0.000000, date '2023-10-30', 0.00
       , 0.00, 0.000, '0', '6910101', 'D', 'S', null, null, null, null, null, null, null
       , 'SALIDA POR AJUSTE', null, null, null, null, null, null, null, null);

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero in (712503, 712504, 712505, 712506, 712507, 712508, 712509, 712510, 712511, 712512);

select * from docuvent;

select * from kardex_d;

select *
  from traslados_almacenes
 where cod_alm_origen = '30'
   and cod_alm_destino = '62';

select *
  from almacen_punto_partida_llegada
 where cod_alm = '62';

select *
  from almacenes
 where cod_alm in ('03', '62');

select *
  from planilla10.personal
 where apellido_paterno = 'RAMOS'
   and nombres like '%ADAN%';


select * from pagos_h;

select *
  from pagos_i
 where detraccion = 1
   and ano = 2023;
-- and mes = 9;

select g.numero_embarque, h.num_importa, lg.numero as factura, eg.bl_numero, h.cod_proveed, p.nombre
     , lg.total, p.direccion, p.cod_proveed as ruc, g.estado, eg.fecha_recepcion_almacen
  from lg_pedjam h
     , proveed p
     , embarques_g eg
     , packing_g g
     , lg_factura_comercial lg
 where h.num_importa = g.num_importa
   and p.cod_proveed = h.cod_proveed
   and eg.numero_embarque = g.numero_embarque
   and eg.estado >= 2
   and eg.estado < 8
   and nvl(h.estado, 0) > 0 and nvl(h.estado, 0) < 8
   and lg.numero_embarque = eg.numero_embarque
   and g.factura_comercial_numero = lg.numero
   and exists
   (
     select 1
       from embarques_d dd
          , lg_itemjam ii
      where dd.numero_embarque = g.numero_embarque
        and dd.num_importa = g.num_importa
        and dd.factura_comercial_numero =
            g.factura_comercial_numero
        and dd.num_importa = ii.num_importa
        and nvl(dd.estado, 0) < 9
        and dd.cod_art = ii.cod_art
        and dd.saldo > 0
     )
 order by 1, 2;

-- 252
select *
  from kardex_d
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 2
   and numero = 7345;

select *
  from embarques_d
 where numero_embarque = 252
   and cod_art in (
                   'MAQ-SEMI-AUTO MOLDING PB14/017', 'RISHADOUPRESSCONTPB14/017'
   );

select g.numero_embarque, g.packing_numero, g.packing_fecha, d.cod_art, d.cod_prov
     , d.num_importa, d.precio, d.cantidad_packing, d.unidad, d.cant_ped
     , d.unidad_prv, d.factor_uc, d.saldo, d.cantidad_packing * d.factor_uc as cantidad_a_recibir
  from packing_g g
     , embarques_d d
 where d.numero_embarque = 252
   and d.num_importa = 'PB 14/017'
   and d.factura_comercial_numero = 'SX1412003'
   and g.num_importa = d.num_importa
   and g.numero_embarque = d.numero_embarque
   and g.factura_comercial_numero = d.factura_comercial_numero
   and nvl(d.cantidad_packing, 0) > 0
 order by d.num_importa, d.cod_art;

select * from logger_logs;

select *
  from cambdol
 where fecha = to_date('16/11/2023', 'dd/mm/yyyy');

select *
  from kardex_d
 where cod_alm = '62'
   and tp_transac = '11'
   and serie = 2
   and numero = 7346;

select g.numero_embarque, h.num_importa, lg.numero as factura, eg.bl_numero, h.cod_proveed, p.nombre
     , lg.total, p.direccion, p.cod_proveed as ruc, g.estado, eg.fecha_recepcion_almacen
  from lg_pedjam h
     , proveed p
     , embarques_g eg
     , packing_g g
     , lg_factura_comercial lg
 where h.num_importa = g.num_importa
   and p.cod_proveed = h.cod_proveed
   and eg.numero_embarque = g.numero_embarque
   and eg.estado >= 2
   and eg.estado < 8
   and nvl(h.estado, 0) > 0 and nvl(h.estado, 0) < 8
   and lg.numero_embarque = eg.numero_embarque
   and g.factura_comercial_numero = lg.numero
   and eg.numero_embarque = 4493
   and exists
   (
     select 1
       from embarques_d dd
          , lg_itemjam ii
      where dd.numero_embarque = g.numero_embarque
        and dd.num_importa = g.num_importa
        and dd.factura_comercial_numero =
            g.factura_comercial_numero
        and dd.num_importa = ii.num_importa
        and nvl(dd.estado, 0) < 9
        and dd.cod_art = ii.cod_art
        and dd.saldo > 0
     )
 order by 1, 2;

select *
  from embarques_d
 where numero_embarque = 4493;
--    and cantidad_packing != cant_ped;

select * from articul;

select *
  from expedidos
 where numero = 16092;

select *
  from almacen
 where cod_art = 'KIT';

select *
  from kardex_g
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and numero = 824231;

select *
  from kardex_d
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and numero = 824231;

-- insert into pevisa.kardex_d ( cod_alm, tp_transac, serie, numero, cod_art, cantidad, costo_d
--                             , costo_s, fch_transac, por_desc1, por_desc2, imp_vvb, estado, cuenta69
--                             , origen, ing_sal, lote, conos, tara, flag, autonum, orden, pr_proveedor
--                             , pr_referencia, pr_ordcomp, pr_codpza, pr_valvta, pr_cosfob
--                             , pr_canthabi, pr_tipot, pr_numot, pr_numped)
-- values ( '57', '27', 2, 824231, '30048MLS', 390, 0.000000, 0.000000, date '2023-07-19', 0.00
--        , 0.00, 0.000, '2', null, 'P', 'S', null, null, null, null, null, null, null, null, null
--        , null, 0.00, 0.0000, 0.0000, 'AR', 981584, null);

select *
  from kardex_g_historia
 where usuario = 'LARIAS'
 order by fecha desc;

select *
  from kardex_d
 where cod_art = 'EQ COMER16';

select *
  from itemord
 where cod_art = 'EQ COMER16';

select *
  from numdoc
 where tp_transac = '16'
   and serie = 1;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and numero = 9427;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and nro_doc_ref = 4500
   and pr_procedencia = 'BT23002';

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and domicilio = '4-13737';

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and numero = 9430;

select *
  from embarques_d
 where numero_embarque = 4500
   and num_importa = 'BT23002'
   and factura_comercial_numero = '4-13739';

-- 730
select *
  from almacen
 where cod_art = 'RW 70 TAXI';

select *
  from embarques_d
 where numero_embarque = 4500
   and kardex_numero = 9430;


-- F0                         11          010        9427
-- F0                         11          010        9428
-- F0                         11          010        9429
-- F0                         11          010        9430

select g.cod_alm, g.tp_transac, g.serie, g.numero, g.fch_transac, g.nro_doc_ref as numero_embarque
     , g.cod_relacion, g.pr_procedencia, d.cod_art, d.cantidad as cantidad, p.nombre
  from kardex_g g
     , kardex_d d
     , embarques_g eg
     , proveed p
 where g.tp_transac = '11'
   and g.estado < 9
   and g.nro_doc_ref = eg.numero_embarque and g.cod_relacion = eg.cod_proveed
   and d.cod_alm = g.cod_alm and d.tp_transac = g.tp_transac and d.serie = g.serie
   and d.numero = g.numero and eg.cod_proveed = p.cod_proveed
   and g.pr_procedencia like :p_importacion;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '11'
   and serie = 10
   and numero in (9534, 9535);

select *
  from vendedores
 order by cod_vendedor;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = 'B10';

select *
  from gastos_de_viaje_habilitado_d
 where id_vendedor = 'B10';

select *
  from tab_semanas
 order by del;

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1467557;


select *
  from kardex_g_historia
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1467557;


select *
  from kardex_d_historia
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1467557;

select *
  from solicita_cambio_trx_det
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1467557;

select * from marca_vehiculo;

select *
  from amonestacion
 where numero = 379;

select *
  from pr_trasab_estado
 where tipo = 'AR'
   and serie = 3
   and numero = 102811
 order by fecha desc;

select *
  from almacenes
 where cod_alm = 'TI';

select *
  from solimat_d
 where numero in (
                  189647, 188989, 188505, 188225, 187671, 187087, 187736, 186102, 185309, 185216,
                  184307, 183889
   );


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 1813;

-- ingreso por ajuste
select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 1813
   and cod_art in (
                   'CVJ 1005-DW', 'CVJ 1005-NAB-HY', 'CVJ 1006-DW', 'CVJ 1006-NI', 'CVJ 1006-SB',
                   'CVJ 1007-DW', 'CVJ 1008-NI', 'CVJ 1008-SB', 'CVJ 1011-A-HO', 'CVJ 1012-SK',
                   'CVJ 1014-TY', 'CVJ 1015-NAB-HO', 'CVJ 1018-NAB-NI', 'CVJ 1019-A-KA',
                   'CVJ 1019-TY', 'CVJ 1021-A-SB', 'CVJ 1021-A-VO', 'CVJ 1021-MI', 'CVJ 1024-MI',
                   'CVJ 1028-NI', 'CVJ 1032-A-RN', 'CVJ 1032-HY', 'CVJ 1033-SB', 'CVJ 1035-A-KA',
                   'CVJ 1036-A-RN', 'CVJ 1037-DA', 'CVJ 1039-SK', 'CVJ 1044-NI', 'CVJ 1047-HY',
                   'CVJ 1053-TY', 'CVJ 1057-NI', 'CVJ 1058-TY', 'CVJ 1061-NI', 'CVJ 1067-HY',
                   'CVJ 1075-TY', 'CVJ 1076-A-TY', 'CVJ 1079-TY', 'CVJ 1091-A-TY', 'CVJ 1092-A-SK',
                   'CVJ 1099-SK', 'CVJ 1102-A-TY', 'CVJ 1103-NI', 'CVJ 1107-TY', 'CVJ 1108-TY',
                   'CVJ 1134-NI', 'CVJ 1199-TY', 'CVJ 1211-TY', 'CVJ 5009-TY', 'CVJ 5043-TY',
                   'CVJ 5173-TY', 'CVJ 5212-NI'
   );

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '15';

select *
  from transacciones_almacen
 where tp_transac in ('15', '28');

select cod_alm, cod_art
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
 where d.estado != '9'
   and d.cod_alm = 'F0'
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) < 0
 group by d.cod_alm, d.cod_art;

-- códigos sin stock
select d.cod_alm, tp_transac, serie, numero, d.cod_art, cantidad, a.stock
  from kardex_d d
       join almacen a on d.cod_alm = a.cod_alm and d.cod_art = a.cod_art
 where d.cod_alm = 'F0'
   and d.tp_transac = '15'
   and d.serie = 1
   and d.numero = 1813
   and cantidad <= a.stock;

-- salida por ajuste
select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '28'
   and serie = 1
   and numero = 991;

select *
  from inventario_fisico_d
 where cod_alm = 'F0'
   and cod_art = 'CVJ 1097-SK';

select *
  from articul
 where cod_art = 'CVJ 1097-SK';

select *
  from inventario_fisico
 where cod_alm = 'F0'
   and extract(year from fecha) = 2024
   and fecha = to_date('06/03/2024', 'dd/mm/yyyy')
   and usuario = '';

select *
  from almacen
 where cod_art in (
                   'CAJA EXT 059X32X48', 'CAJA EXT 085X32X48'
   )
   and cod_alm in ('03', '24')
 order by cod_art;

select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero = 739551;

select *
  from kardex_d
 where cod_art = 'R-AGM L3-N'
   and fch_transac = to_date('24/04/2024', 'dd/mm/yyyy');

-- ingreso_baterias_armadas
select g.cod_alm, g.tp_transac, g.serie, g.numero, g.fch_transac, g.numero_pguia as orden
     , d.cod_art, d.cantidad
  from kardex_g g
       join kardex_d d
            on g.cod_alm = d.cod_alm
              and g.tp_transac = d.tp_transac
              and g.serie = d.serie
              and g.numero = d.numero
 where g.tipo_pguia = 'FC'
   and g.estado != '9'
   and g.numero_pguia in (
                          380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 397, 398, 399,
                          400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410
   );

select *
  from kardex_g
 where cod_alm = 'FT'
   and tp_transac = '29'
   and serie = 1
   and numero = 1791771;

select *
  from kardex_g
 where cod_alm = 'FT'
   and tp_transac = '29'
   and serie = 1
   and numero = 1791771;

select *
  from kardex_d
 where cod_alm = 'FJ'
   and tp_transac = '29'
   and serie = 1
   and numero = 1789406;

select *
  from kardex_d
 where cod_alm = 'FT'
   and tp_transac = '29'
   and serie = 1
   and numero = 1791771;

select *
  from numdoc
 where tp_transac = '29'
   and serie = 1;

select *
  from numdoc
 where tp_transac = '27'
   and serie = 1;

select *
  from kardex_g
 where tp_transac = '27'
   and serie = 1
   and extract(year from fch_transac) = 2024
 order by numero desc;

select * from tmp_carga_data;

select *
  from kardex_g g
 where exists(
   select 1
     from tmp_carga_data t
    where g.cod_alm = t.cod_alm
      and g.tp_transac = t.tp_transac
      and g.serie = t.serie
      and g.numero = t.numero
   );

select *
  from kardex_d g
 where exists(
   select 1
     from tmp_carga_data t
    where g.cod_alm = t.cod_alm
      and g.tp_transac = t.tp_transac
      and g.serie = t.serie
      and g.numero = t.numero
   );

select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 1911;

select *
  from kardex_d_historia
 where cod_alm = 'F0'
   and tp_transac = '15'
   and serie = 1
   and numero = 1911;

select d.ing_sal as id
--a.cod_unx CODIGO,
     , a.cod_art as codigo
--a.linea_cos LINEA,
     , a.linea as linea, 0 as provee, decode(d.tp_transac, '11', g.num_importa, '18', g.num_importa,
                                             '17', g.num_importa, '21', to_char(g.numero),
                                             g.num_importa) as docto
     , to_char(d.fch_transac, 'ddmmyyyy') as fechav, nvl(a.undexp, 0) as familia, a.cta
     , decode(pr_numot, null, pr_referencia, to_char(pr_numot)) as ordtra, null as codpza
     , 0 as canprod, :p_motivo as motivo, cantidad as canti, costo_s as costo
     , round(costo_s / cantidad, 4) as costo_un, round(costo_d / cantidad, 4) as costod_un
     , 0 as pvta, d.fch_transac as fecha, :p_ano as ano, :p_mes as mes, decode(lpad(a.cta, 2, '0'),
                                                                               '00', 'T', '20', 'T',
                                                                               '21', 'T', '23', 'T',
                                                                               '26', 'T', '24',
                                                                               decode(nvl(a.id, '2'), '1', 'T', 'M')) as tp_art
---x_tp_Art TP_ART,
     , null as cod_ope, null as tip_doc, null as ser_doc, null as nro_doc, d.cod_art, 0 as secuencia
     , null as cod_tipoart, null as serie_fact, null as numero_fact, d.tp_transac, d.serie, d.numero
     , d.cod_alm
  from kardex_d d
     , pcarticul a
     , kardex_g g
 where d.tp_transac = :p_transa
   and d.estado <> '9'
   and to_number(to_char(d.fch_transac, 'yyyy')) = :p_ano
   and to_number(to_char(d.fch_transac, 'mm')) = :p_mes
   and a.cod_art = d.cod_art
----And NVL(a.ID,'1') = X_TIPO
   and d.cod_alm = g.cod_alm
   and d.tp_transac = g.tp_transac
   and d.serie = g.serie
   and d.numero = g.numero
   and not (nvl(a.cta, '0') like '20%');

select * from pla_control;

select *
  from solimat_d
 where numero = 193984;

select *
  from kardex_g_historia
 where usuario = 'DCONTRERAS'
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 6;

select distinct glosa
  from kardex_g_historia
 where usuario = 'DCONTRERAS'
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 6;

select cod_alm, tp_transac, serie, numero, fch_transac, tip_doc_ref, ser_doc_ref, nro_doc_ref, glosa
     , tp_relacion, cod_relacion, nro_sucur, cond_pag, nro_lista, moneda, cod_vende, cliente_afecto
     , por_desc1, por_desc2, motivo, estado, origen, ing_sal, flg_impr, ubicacion, cod_transp
     , domicilio, ruc_transp, nombre, direccion, ruc, tara_co, tara_bo, tara_ca, placa_transp
     , le_transp, cant_item, num_importa, tipo_pguia, serie_pguia, numero_pguia, pr_procedencia
     , pr_numped
  from kardex_g;

select *
  from almacen
 where cod_art = 'ETIQ E-58 REC HEX';

select * from kardex_g;

select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   753150
   )
 order by ing_sal desc, numero_pguia;

select *
  from kardex_d
 where cod_alm = 'F7531500'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   753150
   );

select *
  from kardex_g g
 where exists(
   select 1
     from tmp_carga_data t
    where g.cod_alm = t.cod_alm
      and g.tp_transac = t.tp_transac
      and g.serie = t.serie
      and g.numero = t.numero
   );

select * from tmp_carga_data;

select * from exproforma_libre;

select * from tipo_linea;

select *
  from tab_lineas_tipo_linea
 where cod_tipo = 4;

-- 03-11-2-8692
-- 03-11-2-8693

-- 03-11-2-8692
-- 03-11-2-8693


select *
  from kardex_g
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 2
   and numero = 8692;

select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 2
   and numero = 8693;

select *
  from almacen
 where cod_art in (
                   'MAT1 180.761CS-1 -2', 'MAT1 180.761CS-3 -2', 'MAT1 180.789ZN-2',
                   'MAT1 200.1535CS-1 -2', 'MAT1 200.1703CS-1 -2'
   );
