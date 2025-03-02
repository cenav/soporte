select *
  from orden_de_compra
 where serie = 4
   and num_ped in (
   64028
   );

select * from orden_de_compra_estado;

select *
  from orden_de_compra
 where num_ped = 64103;

select *
  from orden_de_compra
 where serie = 3
   and extract(year from fecha) = 2025
   and c_resp in ('E001', 'E139', 'E830', 'E832');

select *
  from planilla10.personal
 where nombres like '%ANNIE%';

select *
  from orden_de_compra
 where num_ped = 23278;

select *
  from itemord
 where serie = 30
   and num_ped in (
   788
   );

select *
  from orden_de_compra_historia
 where serie = 3
   and num_ped in (
   45752
   );

select *
  from orden_matriceria
 where num_ped = 240108;

select *
  from itemord
 where otm_tipo = 'PY'
   and otm_serie = 1
   and otm_numero = 24;


select *
  from itemmatri
 where num_ped = 240099;

select * from orden_de_compra_estado;

select to_date('18/10/2024', 'dd/mm/yyyy') from dual;

select *
  from lg_condpag
 where tipo = 'A';

select distinct o.num_ped, o.cod_proveed, p.nombre, o.cond_pag, o.moneda, o.moneda as moneda_factura
              , o.por_desc1, o.por_desc2, c.descripcion as descripcion_pago, o.fecha, p.ruc
              , o.impsto, o.tot_valvta, o.tot_impu, o.tot_orden, c.v01
              , decode(o.moneda, 'D', 'US$', 'S', 'S/.', 'XXX') as simbolo_moneda
              , o.tot_valvta as tot_valvta_back, o.total_facturado
  from orden_de_compra o
     , itemord i
     , proveed p
     , lg_condpag c
 where o.tipo_docto = (82)
   and o.estado >= '2'
   and o.estado <= '7'
   and i.serie = o.serie
   and i.num_ped = o.num_ped
   and nvl(i.saldo, 0) > 0
   and o.cod_proveed = p.cod_proveed
   and o.cond_pag = c.cond_pag
   and o.serie = :kardex_g.ser_doc_ref
   and c.tipo = 'A'
 order by o.num_ped;

select *
  from itemord
 where serie = 11
   and num_ped in (
   1629
   );

select *
  from almacen
 where cod_art = 'PUB116-0201001';

select *
  from kardex_d
 where cod_art = 'PUB144-0122001';

select *
  from kardex_d
 where cod_art = 'PUB116-0201001';

select *
  from articul
 where cod_art in (
                   'PUB116-0302001', 'PUB116-0201001'
   );

select *
  from kardex_d
 where cod_art in (
                   'PUB116-0302001', 'PUB116-0201001'
   )
   and tp_transac != '11';

select g.*
  from kardex_g g
       join kardex_g_historia h
            on g.cod_alm = h.cod_alm
              and g.tp_transac = h.tp_transac
              and g.serie = h.serie
              and g.numero = h.numero
 where trunc(h.fecha) = to_date('10/09/2024', 'dd/mm/yyyy')
   and h.usuario = 'PEVISA'
 order by ing_sal desc;


-- F0	51	1	25282
-- F0	51	1	25283
-- F0	51	1	25284
-- F0	08	1	25081
-- F0	08	1	25082
-- F0	08	1	25080

select *
  from itemord
 where serie = 30
   and num_ped in (
   643
   );

select *
  from orden_de_compra
 where num_ped = 62444;

select * from orden_de_compra_estado;

select *
  from itemord
 where serie = 4
   and num_ped in (
   62337
   );

select *
  from orden_de_compra
 where num_ped = 44222
 order by fecha desc;

select *
  from proveed
 where nombre like '%BORHUA%';

select *
  from orden_de_compra
 where cod_proveed = '20600735668'
 order by fecha desc;

select *
  from proveed
 where cod_proveed = '20600735668';

select *
  from proveed
 where nombre like '%LINUX%';


-- aprueba orden de servicio
select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and serie in (3, 4, 8)
--    and serie = 3
   and num_ped = :p_numero
   and (exists (
   select 1
     from usuarios u
    where orden_de_compra.c_resp = u.codigo_trabajador
      and u.usuario = user
   ) or user = 'PEVISA')
   and not exists (
   select 1
     from orden_de_compra_calificacion
    where orden_de_compra.num_ped =
          orden_de_compra_calificacion.num_ped
      and orden_de_compra.serie =
          orden_de_compra_calificacion.serie
   );

select *
  from usuarios
 where usuario = 'EMESTANZA';

select *
  from orden_de_compra_calificacion
 where num_ped = 44934
   and serie = 3;

select *
  from itemord
 where serie = 6
   and num_ped in (
   2762
   );

select *
  from orden_de_compra_historia
 where serie = 2
   and num_ped in (
   23278
   )
 order by num_ped;

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
 where nro_oc = 61608;

select *
  from itemmatri
 where num_ped = 240004;

select *
  from orden_matriceria
 where num_ped in (
   61608
   );


select *
  from itemmatri
 where serie = 1
   and num_ped in (
                   230186, 240002
   );

select *
  from caja_chica
 where serie = 2
   and numero in (240047);

select *
  from caja_chica_d
 where serie = 1
   and numero in (240074);

select *
  from caja_chica_d
 where serie = 2
   and numero in (230107, 240001)
 order by numero;

select *
  from orden_de_compra
 where cod_proveed = '20600735668'
 order by fecha desc;

select *
  from orden_de_compra
 where c_resp = 'E590';

select *
  from itemord
 where serie = 3
   and num_ped = 42672;

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
   and numero = 230104;

select *
  from caja_chica_d
 where serie = 2
   and numero = 230103;

select *
  from gastos_de_viaje_habilitado
 where id_vendedor = '35'
   and numero = '203';

select *
  from gastos_de_viaje
 where id_vendedor = '34'
   and numero = '230';

select *
  from gastos_de_viaje_m
 where id_vendedor = '34'
   and numero = '230';

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
 where cod_proveed = '20600735668';

select *
  from proveed
 where nombre like '%LINUX%';

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

select *
  from lg_personal_compras_series
 where codigo_personal = 'E618';

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

select *
  from orden_de_compra
 where serie = 30
   and num_ped = 24;

select *
  from tab_lineas
 where linea between '800' and '899'
   and length(linea) = 3;

select * from planilla10.personal where apellido_paterno = 'CABEZAS';

select *
  from orden_de_compra
 where c_resp = 'E230'
   and fecha > to_date('01/01/2023', 'dd/mm/yyyy')
   and estado in ('0', '1', '2');

select * from pr_ot_sec;

select * from pr_proceso;

select *
  from pr_forsec
 where cod_art = '180.1382ZN';

select *
  from pr_for_ins
 where formu_art_cod_art = '180.1382ZN';

select *
  from pr_forsec
 where cod_art = 'FOR3555R';

select *
  from orden_de_compra
 where c_resp = 'E172'
   and serie = 3
   and fecha >= to_date('01/01/2023', 'dd/mm/yyyy')
 order by fecha;

select *
  from planilla10.personal
 where apellido_paterno like '%CASTILLA%';

select *
  from planilla10.personal
 where c_codigo = 'E017';

select * from f_buen_contribuyente();


select codigo_grupo_compra, descripcion
  from lg_grupos_compras
 where nvl(estado, 0) = 0
   and codigo_grupo_compra in (
   select codigo_grupo_compra
     from lg_grupos_compras_series
    where serie_orden_de_compra = 22
   )
 order by descripcion;


select sum(
           decode(moneda,
                  'S', (nvl(oc.tot_orden, 0) / c.import_cam),
                  nvl(oc.tot_orden, 0)))
  from orden_de_compra oc
     , cambdol c
     , lg_grupos_compras gc
     , lg_grupos_compras_gerencial_d gd
     , lg_grupos_compras_gerencial gh
 where oc.estado > '0'
   and oc.estado < '9'
   and to_char(oc.fecha, 'YYYYMM') =
       to_char(:p_fecha, 'YYYYMM')
   and oc.fecha = c.fecha
   and c.tipo_cambio = 'V'
   and oc.codigo_grupo_compra = gc.codigo_grupo_compra
   and gc.codigo_grupo_compra = gd.codigo_grupo_compra
   and gd.codigo_grupo_compra_h = gh.codigo_grupo_compra_h
   and gd.codigo_grupo_compra_d = gh.codigo_grupo_compra_d
   and gh.codigo_grupo_compra_h >= '00'
   and gh.codigo_grupo_compra_h <= '18';

select *
  from itemord
 where serie = 30
   and num_ped = 572;

select *
  from itemord
 where serie = 6
   and num_ped = 2238;

select * from itemord;

select *
  from orden_de_compra
 where fecha = to_date('10/11/2023', 'dd/mm/yyyy');

select *
  from vw_compra_otm
 where serie = 6
   and num_ped in (2735, 2775);

select *
  from ot_mantto
 where id_tipo = 'PY'
   and id_serie = 2
   and id_numero = 728;

select *
  from transporte
 where cod_transp = '20601166861';

select *
  from vendedores
 where cod_vendedor = 'P1';

select *
  from tablas_auxiliares
 where tipo = 29
 order by codigo;

select *
  from orden_de_compra
 where num_ped = 1519
 order by fecha desc;

select * from kardex_d;

select * from kardex_d;

select *
  from articul
 where cod_art = 'AT-NI-064-CH-MLS';


select *
  from pcarticul
 where cod_art = 'AT-NI-064-CH MLS';

select *
  from embarques_g
 where numero_embarque = 4449;

select *
  from embarques_d
 where numero_embarque = 4449
   and cod_art = 'AT-NI-064-CH MLS';


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
   and exists (
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
   and g.numero_embarque = 4449
   and g.num_importa = 'PVC23013'
 order by 1, 2;

select * from lg_itemjam_otros;

select *
  from gastos_de_viaje_habilitado
 where numero = 210
   and id_vendedor = '42';

select *
  from gastos_de_viaje_habilitado
 where numero = 210
   and id_vendedor = '42';


select *
  from orden_de_compra
 where cod_proveed = '10427461179';


select *
  from proveed
 where nombre like '%JUDITH%';

-- E1124

select *
  from planilla10.personal
 where c_codigo = 'E1124';

select *
  from planilla10.t_cargo
 where c_cargo = 'RP';

-- jgavelan@hdi.com.pe

select *
  from vendedores
 where cod_vendedor = 'N1';

select *
  from proveed
 where nombre like '%CHAVEZ VILCAPOMA%';

select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and serie in (3, 4, 8)
   and serie = 3
   and num_ped = 44309
--    and exists (
--    select 1
--      from usuarios u
--     where orden_de_compra.c_resp = u.codigo_trabajador
--       and u.usuario = user
--    )
   and not exists (
   select 1
     from orden_de_compra_calificacion
    where orden_de_compra.num_ped =
          orden_de_compra_calificacion.num_ped
      and orden_de_compra.serie =
          orden_de_compra_calificacion.serie
   );


select *
  from orden_de_compra_calificacion
 where serie = 3
   and num_ped = 44336;

insert into orden_de_compra_calificacion( num_ped, serie, c_resp, fecha_calificacion
                                        , detalle_servicio_recibido, evaluacion_a, evaluacion_b
                                        , usuario_calificacion, aprueba_pago)
select num_ped, serie, c_resp, sysdate, 'A', 'A', 'A', 'PEVISA', 'SI'
  from orden_de_compra
 where serie = 3
   and num_ped = 44336;

select *
  from orden_de_compra_calificacion
 where usuario_calificacion = 'PEVISA'
 order by fecha_calificacion desc;

select *
  from orden_de_compra_historia
 where glosa = 'RESPONSABLE CALIFICO SERVICIO'
 order by creacion_cuando desc;

select *
  from vw_gasto_viaje
 where id_vendedor = '60';

select * from estado_vacaciones;

select * from pagos_h;

select h.serie, h.num_ped, o.moneda, h.creacion_cuando, o.estado, o.tot_orden, o.tot_impu
     , o.tot_orden
  from orden_de_compra_historia h
       join orden_de_compra o on h.serie = o.serie and h.num_ped = o.num_ped
 where creacion_quien = 'JAIME'
   and glosa = 'APROBADO'
   and trim(creacion_cuando) = to_date('06/02/2024', 'dd/mm/yyyy')
 order by creacion_cuando desc;

select *
  from solicita_cambio_ot
 where usuario = 'DCONTRERAS'
 order by fch_solicitud desc;


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.c_codigo = enc.c_codigo
   and per.situacion not in ('8', '9')
   and (upper(enc.usuario) = (
   select usuario
     from usuario_modulo
    where usuario = user and modulo = 'EVALIACION'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = user and id_modulo = 'EVALUACION'
   ) or
        user in (
          select usuario from usuario_modulo where modulo = 'EVALUACION' and maestro = 'SI'
          ))
 order by per.apellido_paterno;

select *
  from usuario_modulo
 where usuario = 'LILY';


select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and serie in (3, 4, 8)
   and exists (
   select 1
     from usuarios u
    where orden_de_compra.c_resp = u.codigo_trabajador
      and u.usuario = user
   )
   and not exists (
   select 1
     from orden_de_compra_calificacion
    where orden_de_compra.num_ped =
          orden_de_compra_calificacion.num_ped
      and orden_de_compra.serie =
          orden_de_compra_calificacion.serie
   );

select *
  from orden_de_compra
 where serie = 3
   and num_ped in (
   44123
   );

select *
  from orden_de_compra_calificacion
 where serie = 3
   and num_ped = 44123;

select * from usuarios;

select *
  from tab_lineas
 where linea = '1079';

select *
  from itemord
 where cod_art = 'IMPR ROTUL04';

select *
  from orden_de_compra
 where serie = 30
   and num_ped = 587;

select *
  from itemord
 where serie = 30
   and num_ped = 587;

select *
  from docuvent
 where numero = 201425;

select *
  from exfacturas_enviados
 where numero = 201467
 order by creacion_cuando desc;

select * from locales;

select *
  from campana
 where periodo <= 2023
   and cod_estado != '8';

select *
  from lg_condpag
 where grupo_cp = 0
 order by cond_pag;

select *
  from lg_condpag
 where cond_pag = '221';

select cod_art, descripcion, unidad, tp_art, cod_alm
  from articul a
 where exists (
   select 1
     from almacen l
    where l.cod_art = a.cod_art
      and l.cod_alm = :cod_alm01
   )
   and exists (
   select 1
     from linea_solicitud_material s
    where s.tipo = 'EMBALAJE'
      and a.cod_lin = s.cod_lin
   )
   and a.cod_art = 'PLANCHA NYLON 6MM'
 order by cod_art;

select *
  from articul
 where cod_art = 'PLANCHA NYLON 6MM';

select *
  from linea_solicitud_material s
 where s.tipo = 'EMBALAJE'
   and a.cod_lin = s.cod_lin;

select *
  from linea_solicitud_material
 where cod_lin = '2062';

select *
  from lg_condpag
 where cond_pag = '28';



-- SALDO_SOLES_GASTO := TOPE_SOLES_MES - GASTO_SOLES_MES;
-- COSTO_SOLES_TOTAL := COSTO_SOLES_ARTICULO * G_CANT_DESPACHO;
-- 3228.896 = 4000 - (10 * 77.1104)
-- 154.2208 = 77.1104 * 2

select nvl(tope_consumo, 0)
  from articul_consumo
 where cod_art = :x_articulo;

select nvl(sum(cantidad), 0)
  from kardex_d
 where tp_transac = '22'
   and estado < 9
   and cod_art = :x_articulo
   and to_char(fch_transac, 'MM/YYYY') = to_char(sysdate, 'MM/YYYY');

select get_costos(:x_articulo, '03') from dual;

select *
  from proceso_rsc
 where id_proceso = 9;

select *
  from proveed
 where nombre like '%DAYZ%';

select *
  from orden_de_compra
 where upper(detalle) like '%GRIP%';

select *
  from itemord
 where upper(observacion) like '%GRIP%';

select *
  from orden_de_compra
 where cod_proveed = '20600735668'
 order by fecha desc;

select a.cod_art, a.cod_orig, a.descripcion, l.presentacion, l.multiplo_de_compra, l.c_unimed
     , a.unidad, a.descripcion as observa, l.u_eqv, l.marca, l.porcentaje_tolerancia
     , a.cod_lin
  from articul a
     , artiprov l
     , activo_fijo f
 where l.proveedor = :cod_proveed
   and l.cod_art = a.cod_art
   and a.cod_art = f.cod_activo_fijo
   and a.tp_art <> 'Z'
   and nvl(a.estado, 0) < 8
   and nvl(l.u_eqv, 1) <> 0
   and f.cod_estado = '0'
   and not exists (
   select 1
     from orden_de_compra o
        , itemord i
    where o.serie = i.serie
      and o.num_ped = i.num_ped
      and i.cod_art = f.cod_activo_fijo
      and i.estado != '9'
   )
 order by a.cod_art;

select *
  from artiprov
 where proveedor = '20545323002';

select *
  from activo_fijo
 where cod_activo_fijo = 'PIST42';

select *
  from embarques_liberacion
 where numero_embarque = 4957
   and cod_art = 'KIT MISC87866-1';

select * from estados_liberacion_producto;

select *
  from capacitacion
 where id_capacitacion in (5020, 5026);

select *
  from caja_chica
 where numero = 25001;

select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and fecha between add_months(sysdate, -6) and sysdate
   and serie in (3, 4, 8)
   and (exists (
   select 1
     from usuarios u
    where orden_de_compra.c_resp =
          u.codigo_trabajador
      and u.usuario = :p_user
   )
   or :p_user = 'PEVISA')
   and not exists (
   select 1
     from orden_de_compra_calificacion
    where orden_de_compra.num_ped =
          orden_de_compra_calificacion.num_ped
      and orden_de_compra.serie =
          orden_de_compra_calificacion.serie
   )
   and serie = 3
   and num_ped = 45751;

select *
  from orden_de_compra
 where serie = 3
   and num_ped = 45751;

select *
  from orden_de_compra
 where estado = '2'
   and c_resp = 'E017'
   and extract(year from fecha) = 2025;

select *
  from orden_de_compra
 where estado in ('2', '3', '4')
   and fecha between add_months(sysdate, -6) and sysdate
   and serie in (3, 4, 8)
   and (exists (
   select 1
     from usuarios u
    where orden_de_compra.c_resp =
          u.codigo_trabajador
      and u.usuario = :p_user
   )
   or :p_user = 'PEVISA')
   and not exists (
   select 1
     from orden_de_compra_calificacion
    where orden_de_compra.num_ped =
          orden_de_compra_calificacion.num_ped
      and orden_de_compra.serie =
          orden_de_compra_calificacion.serie
   );

select *
  from usuarios
 where codigo_trabajador = 'E159';

select *
  from planilla10.personal
 where apellido_paterno like '%WOLFENZON%'
   and situacion not in ('8', '9');

select *
  from planilla10.personal
 where apellido_paterno like '%PASTRANA%'
   and situacion not in ('8', '9');

select *
  from orden_de_compra
 where estado = '2'
   and c_resp in ('E832', 'E830');

select *
  from lg_personal_compras_series
 where serie_orden_de_compra in (3, 13)
   and codigo_personal in ('E139', 'E001');

select *
  from lg_personal_compras_series s
       join vw_personal p on s.codigo_personal = p.c_codigo
 where s.serie_orden_de_compra in (3, 13);


select * from proceso_cominac_concepto;

select sysdate from dual;