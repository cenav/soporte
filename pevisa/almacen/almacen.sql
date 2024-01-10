select *
  from kardex_g
 where cod_alm = '05'
   and tp_transac = '11'
   and serie = 2
   and numero in (
   7853
   );

select *
  from kardex_d
 where cod_alm = '05'
   and tp_transac = '11'
   and serie = 2
   and numero in (
   7853
   );

select *
  from almacen
 where cod_art = 'KIT AUT MS 5887 SR A';

select *
  from kardex_d
 where cod_alm = 'F8'
   and cod_art = 'FSP 95067 GR'
   and estado != '9'
 order by fch_transac desc;


select *
  from kardex_d
 where cod_alm = 'F8'
   and tp_transac = '10'
   and serie = 18
   and numero = 4204
   and cod_art = 'FSP 95067 GR';

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
 where numero = 181100;

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
 where cod_art = 'DUPL 74.69';


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
 where tp_transac = '27'
   and serie = 1;

select *
  from numdoc
 where tp_transac = '16'
   and serie = 1;

select *
  from kardex_g
 where tp_transac = '16'
   and serie = 1
 order by numero desc;

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