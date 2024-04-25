/*

██╗   ██╗██╗   ██╗███████╗██╗    ██╗   ██╗███████╗     █████╗
██║   ██║██║   ██║██╔════╝██║    ██║   ██║██╔════╝    ██╔══██╗
██║   ██║██║   ██║█████╗  ██║    ██║   ██║█████╗      ███████║
╚██╗ ██╔╝██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██╔══╝      ██╔══██║
 ╚████╔╝ ╚██████╔╝███████╗███████╗╚████╔╝ ███████╗    ██║  ██║
  ╚═══╝   ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚══════╝    ╚═╝  ╚═╝

 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██████╗      ██████╗ ██╗   ██╗██╗ █████╗
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗██╔══██╗    ██╔════╝ ██║   ██║██║██╔══██╗
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║██████╔╝    ██║  ███╗██║   ██║██║███████║
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║██╔══██╗    ██║   ██║██║   ██║██║██╔══██║
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║██║  ██║    ╚██████╔╝╚██████╔╝██║██║  ██║
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═╝

 */
--::::::::::::::::::::::::::::--
-- query pantalla principal   --
--::::::::::::::::::::::::::::--
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
   )
   and cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (15824);

-- F0	21	25	14665

-- 20601550327	JR. JULIO MENDOZA MERINO NRO. 880 BAR. BARRIO MENDOZA
--::::::::::::::::::::::::::::--
--        tara_bo = 0         --
--::::::::::::::::::::::::::::--
select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (15826);

-- TARRILLO PEREZ MARIA HILDA	AV AUGUSTO B LEGUIA 1287 URB SAN LORENZO
select *
  from clientes
 where cod_cliente = '10418069738';

select *
  from pedido
 where num_ped = 238518;

select *
  from transporte
 where cod_transp = '20534452251';

--:::::::::::::::::::::::::::::::::::::::::--
--    elimina de kardex_g_guia_remision    --
--:::::::::::::::::::::::::::::::::::::::::--
select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (15824);

--:::::::::::::::::::::::::::::::::::::::::--

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '11'
   and fch_transac > to_date('01/10/2023', 'dd/mm/yyyy');


select *
  from transporte
 where cod_transp = '20601550327';


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7371);


select *
  from kardex_g_guia_remision
 where cod_alm = 'T'
   and tp_transac = '21'
   and serie = 25
   and numero in (12380);

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
values ( 'T001', 7030, date '2023-10-26', '070101', '150115', 'AV. IQUITOS NRO. 353', '20566560900'
       , 'F0', '21', 25, 7371, '01', '20100084768', '01', '12', 3.00, 42.3000, '03', '00', '02'
       , null, null, null, 'F050-00185857', '01', 'FACTURA', null, null, null, null, null, null
       , null, null, null, null, null, null, null, null, null);


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (12433);

select *
  from kardex_g
 where ser_doc_ref = 20
   and nro_doc_ref = 235441;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 12380;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
   and guia_numero = 11879;

select *
  from clientes
 where cod_cliente = '20566560900';


select *
  from clientes
 where cod_cliente = '20516422018';

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);

-- 7447

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7447);

select *
  from kardex_g_guia_remision
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 140
   and numero in (664);

select *
  from kardex_g_guia_remision
 where guia_serie = 'T040'
   and numero in (206, 205, 197)
 order by fecha_traslado desc;


select *
  from kardex_g
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);


select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '21'
   and serie = 25
   and numero in (7498);

select *
  from kardex_g_guia_remision
 where guia_serie = 'T001'
 order by guia_numero desc;

select *
  from nrodoc
 where serie = 'T128';

select *
  from kardex_g
 where serie_pguia = 'F050'
   and numero_pguia = '00186080';

select * from view_salidas_pre_guias_nac;

-- -Mal diseño.
-- -Cambio muestra patrón.
-- -Cambio de numero de cavidades.
-- -Calado laser defectuoso.

select * from pr_proceso;

select prs.codigo_proceso, pr.descripcion
  from pr_ot_sec prs
     , pr_proceso pr
 where prs.ot_numero = 10338
   and prs.codigo_proceso = pr.codigo
 order by prs.secuencia;

select n.serie, n.automatico
  from numdoc n
     , almacen_trasaccion_serie t
 where n.tp_transac = '35'
   and n.tp_transac = t.tp_transac
   and t.cod_alm = 'V0'
   and n.serie = t.serie
 order by 1;


select *
  from almacen_trasaccion_serie
 where cod_alm = 'V0';

select *
  from numdoc
 where serie in (127, 128);

select max(numero)
  from kardex_g
 where tp_transac = '35'
   and serie = 128;

select *
  from almacen_trasaccion_serie
 where cod_alm = 'FP';

select *
  from pr_usualma
 where usuario = 'PEVISA'
   and cod_alm in ('02', '03', 'V0');

select t.codigo, t.descripcion, t.indicador1
  from tablas_auxiliares t
 where t.tipo = 33
   and t.codigo in (
   select cod_alm
     from pr_usualma
    where cod_alm = t.codigo
      and usuario = 'LARIAS'
   )
   and t.codigo in (
   select distinct cod_alm_origen
     from traslados_almacenes
   );

select *
  from traslados_almacenes
 where cod_alm_origen = '02';

select m.cod_art, a.descripcion, m.stock, a.tp_c_stck, f.cuenta69, a.tp_art, a.unidad, a.cod_lin
  from almacen m
     , articul a
     , tfamlin f
 where m.cod_alm = 'V0'
   and a.cod_art = m.cod_art
   and f.tp_art = a.tp_art
   and f.cod_fam = a.cod_fam
   and f.cod_lin = a.cod_lin
   and m.stock > 0;

select *
  from kardex_g_guia_remision
 where serie = 140
   and numero in (664);

select *
  from kardex_g
 where serie = 145
   and numero = 2;

select *
  from transacciones_almacen
 where tp_transac = '35';

select * from numdoc;

select c.cod_cliente as ruc_llegada, c.nombre as nombre_llegada, s.nro_sucur, s.direccion, u.cod_ubc
     , u.nom_dpt, u.nom_pvc, u.nom_dtt, u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
  from ubigeo u
     , sucursales s
     , clientes c
 where s.cod_cliente = c.cod_cliente
   and u.nacional_internacional = 'N'
   and s.cod_ubc = u.cod_ubc
   and nvl(s.estado, 0) < 9
   and c.cod_cliente = '41189181'
 order by c.cod_cliente, s.nro_sucur;

select *
  from sucursales
 where cod_cliente = '41189181';

select *
  from sucursales
 where direccion like '%SOL DE VITARTE%';

-- 150103

select *
  from clientes
 where cod_cliente = '41189181';

select s.nro_sucur, s.direccion, u.cod_ubc, u.nom_dpt, u.nom_pvc, u.nom_dtt
     , u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
     , nvl(s.codigo_establecimiento_sunat, '0000') as codigo_establecimiento_sunat
  from ubigeo u
     , sucursales s
 where s.cod_cliente = '41189181'
   and u.nacional_internacional = 'N'
   and s.cod_ubc = u.cod_ubc
   and nvl(s.estado, 0) < 9
--    and s.nro_sucur <> :X_GUIA_ENTRE_ALMACENES.nro_sucursal_partida
 order by u.nom_dtt;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T171'
   and guia_numero = 1;

select *
  from clientes
 where cod_cliente in ('41189181', '10411891815');

select *
  from kardex_g
 where cod_alm = 'A2'
   and tp_transac = '73'
   and serie = 171
   and numero = 1;

select c.cod_cliente as ruc_llegada, c.nombre as nombre_llegada, s.nro_sucur, s.direccion, u.cod_ubc
     , u.nom_dpt, u.nom_pvc, u.nom_dtt, u.nom_dtt || ' ' || u.nom_pvc || ' ' || u.nom_dpt as nombre
  from ubigeo u
     , sucursales s
     , clientes c
 where s.cod_cliente = c.cod_cliente
   and u.nacional_internacional = 'N'
   and s.cod_ubc = u.cod_ubc
   and nvl(s.estado, 0) < 9
   and c.cod_cliente in ('41189181', '10411891815')
 order by c.cod_cliente, s.nro_sucur;

select *
  from sucursales
 where cod_cliente = '41189181';

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
values ( 'T171', 1, date '2023-12-06', '150103', '150103', 'Calle siriu 127-urb. Sol de vitarte'
       , '20100084768', 'A2', '73', 171, 1, '01', '.', null, null, 1.00, 200.0000, '05', '01', '02'
       , null, null, null, null, null, null, 200.0000, null, null, null, '41189181', 'VENTA', '0004'
       , '0000', timestamp '2023-12-06 07:44:37', null, null, null, null, null, null);

select * from activo_fijo_area;

select *
  from activo_fijo_ubicacion
 where cod_area = 'EXTER';

select *
  from vendedores
 where nombre like '%HERNANDE%';

select *
  from vendedores
 where cod_vendedor = '42';

select add_months(trunc(sysdate, 'MM'), -1) from dual;

select *
  from kardex_g_guia_remision
 where guia_serie = 'T183'
   and guia_numero = 44;

select *
  from kardex_g_guia_remision
 where serie = 171;

-- INSERT INTO PEVISA.KARDEX_G_GUIA_REMISION (GUIA_SERIE, GUIA_NUMERO, FECHA_TRASLADO, UBIGEO_PARTIDA, UBIGEO_LLEGADA, DIRECCION_LLEGADA, RUC, COD_ALM, TP_TRANSAC, SERIE, NUMERO, MOTIVO_TRASLADO, TRANSPORTE_EMPRESA, TRANSPORTE_CHOFER, TRANSPORTE_UNIDAD, BULTOS, PESO, NRO_SUCURSAL_PARTIDA, NRO_SUCURSAL_LLEGADA, MODALIDAD_TRASLADO, DETALLE, CONTENEDOR, PRECINTO, NUMERO_DOCUMENTO_RELACIONADO, CODIGO_DOCUMENTO_RELACIONADO, DESCRI_DOCUMENTO_RELACIONADO, PESO_ITEMS, PK_SERIE, PK_NUMERO, PK_TIPO, RUC_LLEGADA, DESCRIPCION_MOTIVO_TRASLADO, CODIGO_ESTABLECIMIENTO_PARTIDA, CODIGO_ESTABLECIMIENTO_LLEGADA, FECHA_EMISION, PRECINTO_LINEA, CARRETA, MARCA_1, CARTONES, MARCA_2, MARCA_3) VALUES ('T183', 44, DATE '2024-03-25', '150103', '070101', 'AV. FAUCETT NRO.717 PROV. CONST.DEL CALLAO CALLAO', '20100084768', '99', 'T183', 999, 44, '17', '20605415050', '02', '01', 1.00, 2.3000, '05', '03', '02', 'REJILLA', null, null, null, null, null, null, null, null, null, '20100036101', 'Traslado de bienes para transf', '0004', '0003', TIMESTAMP '2024-03-25 12:03:24', null, null, null, null, null, null);

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  556494, 556495, 556496, 556513, 556497, 556498, 556500, 556501, 556503, 556504,
                  556505, 556509, 556510, 556511, 556512
   );