select *
  from kardex_g
 where cod_alm = '01'
   and tp_transac = '25'
   and serie = 118
   and numero in (
   428
   );

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   294084
   );

select *
  from kardex_dpk
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 1
   and numero in (
   294084
   );

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 150
   and numero in (
   714
   );

select *
  from numdoc
 where tp_transac = '35'
   and serie = 141;

select *
  from kardex_g_historia
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero in (
   522
   );

select *
  from kardex_g_historia
 where cod_alm = '02'
   and usuario = 'ETAIPE'
   and extract(year from fecha) = 2024
   and extract(month from fecha) = 8;

select t.descripcion, kgh.*
  from kardex_g_historia kgh
       join transacciones_almacen t on kgh.tp_transac = t.tp_transac
 where kgh.usuario = 'ETAIPE'
   and trunc(kgh.fecha) = to_date('24/08/2024', 'dd/mm/yyyy');

select *
  from transacciones_almacen
 where tp_transac in ('27', '29', '22', '18');

select tp_transac, descripcion
  from transacciones_almacen
 where estado = '1'
 order by tp_transac;

select *
  from kardex_d_historia
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero in (
   522
   );

select *
  from almacen
 where cod_art = 'R-4955665';

select *
  from articul
 where cod_art = 'R-4955665';

select *
  from transacciones_almacen
 where tp_transac = '18';

  with log as (
    select cod_alm, tp_transac, serie, numero, min(fecha) as fecha
      from kardex_g_historia
     group by cod_alm, tp_transac, serie, numero
    )
select kg.cod_alm, a.descripcion as almacen, kg.tp_transac, t.descripcion as transaccion, kg.serie
     , kg.numero, l.fecha, kg.ing_sal
  from kardex_g kg
       join almacenes a on kg.cod_alm = a.cod_alm
       join transacciones_almacen t on kg.tp_transac = t.tp_transac
       left join log l
                 on kg.cod_alm = l.cod_alm
                   and kg.tp_transac = l.tp_transac
                   and kg.serie = l.serie
                   and kg.numero = l.numero
 where kg.tipo_pguia = 'AR'
   and kg.serie_pguia = 3
   and kg.numero_pguia = 1031238
   and kg.serie = 2
 order by l.fecha, ing_sal desc;

select *
  from kardex_g
 where nro_doc_ref = 4734
   and tip_doc_ref = '82';

-- F0	17	1	744551
-- F0	17	1	744552
-- F0	17	1	744553
-- F0	17	1	744554
select *
  from kardex_d
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   744551
   )
 union all
select *
  from kardex_d
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   31796
   );


select *
  from almacen
 where cod_art = 'R-3883620';

select *
  from kardex_g_movglos
 where cod_alm = '30'
   and tp_transac = '11'
   and serie = 1
   and numero in (
   31796
   );

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

-- F0	17	1	744551
-- F0	17	1	744552
-- F0	17	1	744553
-- F0	17	1	744554
select *
  from kardex_g_historia
 where cod_alm = '37'
   and tp_transac = '16'
   and serie = 1
   and numero in (
   204493
   );

select *
  from solimat_g
 where serie = 1
   and numero = 196082;

select serie, numero, cod_art, cantidad
  from solimat_d
 where serie = 1
   and numero = 196082;

-- solicitudes
select g.numero, g.fecha, g.cod_alm01, g.cod_alm02, d.cod_art, d.cantidad
  from solimat_g g
       join solimat_d d on g.serie = d.serie and g.numero = d.numero
 where d.cod_art = 'BH 0.32-222'
   and extract(year from g.fecha) = 2024
 order by g.fecha desc;

select *
  from solicita_cambio_trx_det
 where cod_alm = '37'
   and extract(year from fch_transac_old) = 2024
 order by fch_transac_old desc;

select *
  from kardex_g
 where ser_doc_ref = 1
   and nro_doc_ref = 196082;

select *
  from kardex_g
 where cod_alm = '37'
   and tp_transac = '16'
   and serie = 1
   and numero in (
   204493
   );

select *
  from kardex_d
 where cod_alm = '37'
   and tp_transac = '16'
   and serie = 1
   and numero in (
   204493
   );

select cod_alm, tp_transac, serie, numero, cod_art, cantidad, fch_transac, ing_sal
  from kardex_d
 where cod_art = 'BH 0.32-222'
   and extract(year from fch_transac) = 2024
   and ing_sal = 'I'
 order by fch_transac desc;

select *
  from transacciones_almacen
 where tp_transac = '16';

select *
  from kardex_d_historia
 where cod_alm = '37'
   and tp_transac = '16'
   and serie = 1
   and numero in (
   204493
   );

select *
  from kardex_d_historia
 where cod_alm = 'F0'
   and tp_transac = '17'
   and serie = 1
   and numero in (
   744551
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
 where numero = 195640;

select *
  from solimat_d
 where numero = 195640;

select *
  from kardex_g
 where tip_doc_ref = 'P2'
   and ser_doc_ref = 1
   and nro_doc_ref = 195640;

select *
  from kardex_g
 where nro_doc_ref = 195640;

select *
  from kardex_g
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204221;

select *
  from kardex_d
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 204221;

select *
  from transacciones_almacen
 where tp_transac in ('16', '27');


select *
  from kardex_d
 where cod_art = 'BOLSA 22.27'
 order by fch_transac desc;

-- 02	27	1	1542698
select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1542698;

-- 02	27	1	1542698
select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '27'
   and serie = 1
   and numero = 1542698;


select *
  from almacen
 where cod_art = 'BOLSA 22.27';

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
 where cod_alm like '%B%'
 order by cod_alm;

select *
  from almacenes
 where upper(descripcion) like '%TRANSITO%'
 order by cod_alm;

select distinct tp_transac
  from kardex_g
 where cod_alm = '58';

select *
  from transacciones_almacen
 where tp_transac in ('10', '27', '35');


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

select kd.*
  from kardex_g kg
       join kardex_d kd
            on kg.cod_alm = kd.cod_alm
              and kg.tp_transac = kd.tp_transac
              and kg.serie = kd.serie
              and kg.numero = kd.numero
 where kg.cod_alm = 'F0'
   and kg.tp_transac = '17'
   and kg.serie = 1
   and kg.numero in (
   744551
   );

select *
  from kardex_g
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and numero = 884496;

select *
  from kardex_d
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and numero = 884496;

select *
  from kardex_g
 where cod_alm = '57'
   and tp_transac = '27'
   and serie = 2
   and numero = 884496;


-- stock almacen M4
  with ingresos as (
    select cod_alm, cod_art, max(d.fch_transac) as ultimo_ingreso
      from kardex_d d
     where d.estado != '9'
       and d.ing_sal = 'I'
       and d.cod_alm = :p_almacen
     group by d.cod_alm, d.cod_art
    )
select d.cod_alm, d.cod_art, a.cod_lin, i.ultimo_ingreso
     , sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) as stock
  from kardex_d d
       join ingresos i on d.cod_alm = i.cod_alm and d.cod_art = i.cod_art
       join articul a on d.cod_art = a.cod_art
 where d.estado != '9'
   and d.cod_alm = :p_almacen
having sum(decode(d.ing_sal, 'S', (d.cantidad * -1), d.cantidad)) > 0
 group by d.cod_alm, d.cod_art, i.ultimo_ingreso, a.cod_lin;

select *
  from articul
 where cod_art like 'PUB116-0122001';

select *
  from articul
 where cod_art in (
                   'PUB116-0122001', 'PUB144-0122001', 'PUB116-0201001', 'PUB144-0201001',
                   'PUB116-0302001', 'PUB144-0302001'
   )
 order by cod_art;

select *
  from itemord
 where cod_art = 'PUB116-0122001';

select *
  from itemord
 where serie = 11
   and num_ped = 1629;

select *
  from kardex_d
 where cod_art = 'PUB116-0201001';

select *
  from kardex_d
 where cod_art like 'PUB116%';

select *
  from transacciones_almacen
 where tp_transac = '51';

select al.cod_alm, a.descripcion as almacen, l.descripcion as local
  from almacen_local al
       left join almacenes a on al.cod_alm = a.cod_alm
       left join locales l on al.cod_local = l.cod_local;

select d.ano, d.mes, d.tipo, d.voucher, d.item, d.banco, to_date(b.fecha, 'DD/MM/YY') as fecha
     , g.numero, d.cargo_d - d.abono_d as regmov, b.monto, b.cta_cte_banco
  from movfigl g
     , movfide d
     , movfide_situacion_banco b
 where d.banco in (
   select x.codigo from ctabnco x where x.n_cta_cte = b.cta_cte_banco
   )
   and d.estado <> '9'
   and d.estado_banco is null
   and d.fecha <= to_date('31/08/2024', 'dd/mm/yyyy')
   ----AND D.FECHA BETWEEN XFECI AND XFECF
   and d.ano = g.ano
   and d.mes = g.mes
   and d.tipo = g.tipo
   and d.voucher = g.voucher
   and d.item = g.item
   -----	AND LENGTH(G.NUMERO) <= 6
   -----	AND LPAD(G.NUMERO,6,'0') = LPAD(B.NUM_OPER,6,'0')
   and b.p_ano = 2024
   and b.p_mes = 8
   and b.cta_cte_banco = '850200-0001'
   and b.fecha is not null
   and length(b.fecha) = 10
   and to_date(d.fecha, 'DD/MM/YY') = to_date(b.fecha, 'DD/MM/YY');
--    and (d.cargo_d - d.abono_d) = b.monto;

select * from movfide_situacion_banco;

-- Karen almacén TD
-- Daniel almacén TG
-- Jorge almacén TE

select * from kardex_d;

select *
  from almacen
 where cod_art = 'PUB144-0101001';

select *
  from articul
 where cod_art = 'PUB144-0101001';

select *
  from kardex_d
 where cod_art = 'PUB144-0101001';

select ta.descripcion, kd.*
  from kardex_d kd
       join transacciones_almacen ta on kd.tp_transac = ta.tp_transac
 where kd.cod_art = '03COMP25-MONI2'
 order by trunc(kd.fch_transac), kd.ing_sal desc;

select *
  from transacciones_almacen
 where tp_transac = '73';

select min(fch_transac)
  from kardex_d
 where cod_art = 'BL450.539SIL NKS';

select distinct d.tp_transac, t.descripcion
  from kardex_d d
       join transacciones_almacen t on d.tp_transac = t.tp_transac
 where d.cod_art = 'BL450.539SIL NKS';

select a.cod_alm, t.descripcion, a.nombre
  from pr_usualma a
     , tablas_auxiliares t
 where a.cod_alm = t.codigo
   and t.tipo = '33'
   and a.usuario = :PR_OT.xusuario
 order by a.cod_alm;

select *
  from pr_usualma
 where usuario = 'MDIAZH'
   and cod_alm like 'D%';

select *
  from kardex_d
 where cod_art = 'CSIL 359-PR';

select *
  from almacen
 where cod_art in ('CSIL 359-PR', 'CSIL 360-PR');


declare
  l_linea   articul.cod_lin%type   := '800';
  l_almacen almacenes.cod_alm%type := '48';
  l_ingsal  kardex_d.ing_sal%type  := 'S';
begin
  if ((length(l_linea) = 3 and l_linea not between '900' and '999')
    or length(l_linea) != 3)
    and l_almacen = '48' and l_ingsal = 'I'
  then
    dbms_output.put_line('Error');
  else
    dbms_output.put_line('Ok');
  end if;
end;

select *
  from kardex_d
 where cod_alm = '48'
   and ing_sal = 'I'
   and extract(year from fch_transac) = 2024
 order by fch_transac;

select *
  from kardex_d
 where cod_art = '200.4081NA';

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero = 522;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero = 522;

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 1
   and numero = 293142;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '22'
   and serie = 1
   and numero = 293142;

select *
  from numdoc
 where tp_transac = '22';

select *
  from kardex_d
 where cod_art = 'SOL 815'
   and tp_transac = '22'
 order by fch_transac desc;

select *
  from kardex_g
 where tp_transac = '22'
   and numero = 293141;

select *
  from kardex_d
 where cod_alm = '01'
   and tp_transac = '28'
   and fch_transac = to_date('29/10/2024', 'dd/mm/yyyy')
 order by fch_transac desc;

-- salida por servicio
select os.numero, os.nuot_serie, os.nuot_tipoot_codigo, os.oc_numero, os.oc_serie
     , oc.fecha as fecha_oc, oc.cod_proveed, proveedor(oc.cod_proveed) as nombre
     , op.formu_art_cod_art
     , op.cant_prog, op.fecha as fecha_op, i.cod_art, i.cantidad
  from orden_de_compra oc
     , itemord i
     , pr_ot_orden_de_servicio os
--      , articul_servicios arts
     , pr_ot op
 where i.num_ped = oc.num_ped
   and i.serie = oc.serie
   and oc.estado < '9'
   and i.num_ped = os.oc_numero
   and i.serie = os.oc_serie
--    and i.cod_art = arts.cod_art
   and os.numero = op.numero
   and os.nuot_serie = op.nuot_serie
   and os.nuot_tipoot_codigo = op.nuot_tipoot_codigo
--    and op.formu_art_cod_art = arts.cod_art_produccion
   and op.estado = 1
   and os.kardex_numero is null
   and oc.serie = 2
   and oc.num_ped = 23214;

select *
  from itemord
 where serie = 2
   and num_ped = 23214
 order by cod_art;

select *
  from pr_ot_orden_de_servicio
 where oc_serie = 2
   and oc_numero = 23214
 order by numero;

select *
  from articul_servicios
 where cod_art in (
                   'SERV MHL 510.700-2/17X49-F', 'SERV MHL 510.700-2/17X49-FD',
                   'SERV MHL 510.700-2/16X29-F', 'SERV MHL 510.700-2/16X29-FD',
                   'SERV MHL 510.700-2/23X33-F', 'SERV MHL 510.700-2/23X33-FD',
                   'SERV MHL 510.700-2/15X20-F', 'SERV MHL 510.700-2/15X20-FD',
                   'SERV MHL 790.590-2/19X72-F', 'SERV MHL 790.590-2/19X72-FD',
                   'SERV MHL 790.590-2/24X52-F', 'SERV MHL 790.590-2/24X52-FD',
                   'SERV MHL 790.590-2/19X38-F', 'SERV MHL 790.590-2/19X38-FD',
                   'SERV MHL 790.590-2/23X56-F', 'SERV MHL 790.590-2/23X56-FD',
                   'SERV MHL 920.700-2/22.5X86-F', 'SERV MHL 920.700-2/22.5X86-FD',
                   'SERV MHL 700.690-2/33.5X67-F', 'SERV MHL 700.690-2/33.5X67-FD',
                   'SERV MHL 550.1150-2/31X105 -F', 'SERV MHL 550.1150-2/31X105 -FD'
   )
 order by cod_art;

select *
  from articul_servicios
 where cod_art in (
                   'SERV MHL 510.700-2/17X49-F', 'SERV MHL 510.700-2/17X49-FD'
   );

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and formu_art_cod_art in (
                             'MHL 510.700-2/17X49', 'MHL 510.700-2/17X49', 'MHL 510.700-2/16X29',
                             'MHL 510.700-2/16X29', 'MHL 510.700-2/23X33', 'MHL 510.700-2/23X33',
                             'MHL 510.700-2/15X20', 'MHL 510.700-2/15X20', 'MHL 790.590-2/19X72',
                             'MHL 790.590-2/19X72', 'MHL 790.590-2/24X52', 'MHL 790.590-2/24X52',
                             'MHL 790.590-2/19X38', 'MHL 790.590-2/19X38', 'MHL 790.590-2/23X56',
                             'MHL 790.590-2/23X56', 'MHL 920.700-2/22.5X86',
                             'MHL 920.700-2/22.5X86', 'MHL 700.690-2/33.5X67',
                             'MHL 700.690-2/33.5X67', 'MHL 550.1150-2/31X105',
                             'MHL 550.1150-2/31X105'
   )
   and estado = '1';

select *
  from pr_ot
 where nuot_tipoot_codigo = 'PR'
   and numero in (
                  584730, 584731
   );

delete
  from kardex_d d
 where not exists (
   select *
     from kardex_g g
    where d.cod_alm = g.cod_alm
      and d.tp_transac = g.tp_transac
      and d.serie = g.serie
      and d.numero = g.numero
   )
   and extract(year from d.fch_transac) < 2010;

select *
  from kardex_d
 where cod_alm = '08'
   and tp_transac = '16'
   and serie = 1
   and numero = 2625;

select *
  from kardex_g
 where fch_transac >= to_date('01/11/2024', 'dd/mm/yyyy');

select *
  from kardex_g
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero = 552;

select *
  from kardex_d
 where cod_alm = '02'
   and tp_transac = '35'
   and serie = 141
   and numero = 552;

select *
  from numdoc
 where tp_transac = '35'
   and serie = 141;

select *
  from numdoc
 where tp_transac = '22'
   and serie = 1;

