select *
  from movfigl
 where ano = 2024
   and mes = 10
   and tipo = '2'
   and voucher = 103634;

select *
  from movfide
 where ano = 2024
   and mes = 11
   and tipo = '2'
   and voucher = 113361;

select *
  from factpag
 where cod_proveedor = '20611401486'
   and numero = '0000043'
 union all
select *
  from factpag
 where cod_proveedor = '20611401486'
   and numero = '0000037';

select *
  from orden_de_compra
 where serie = 5
   and num_ped in (2916, 2912, 2926, 2929, 2942);

-- 0337221

select *
  from factpag
 where tipdoc = '54'
   and serie_num = '118'
   and numero = '0005038';

select *
  from cabfpag
 where tipdoc = 'LC'
   and serie_num = '1'
   and numero = '367504';

select *
  from cabfpag
 where tipdoc = 'LC'
   and serie_num = '1'
   and numero = '367504';

select *
  from nrotipo
 where ano = 2024
   and mes = 9
   and tipo = '2';

-- 93546

select *
  from movfigl
 where ano = 2024
   and mes = 9
   and tipo = '2'
   and numero = 93546;

select *
  from movfigl
 where ano = 2024
   and mes = 9
   and tipo = '2'
 order by voucher desc;

--17/11/2024 al  23/11/2024
select *
  from tab_semanas
 where extract(year from del) = 2025
 order by al;

select *
  from pagos_h
 where serie_planilla = 34
   and numero_planilla in (2327);

select *
  from pagos_h
 where serie_planilla in (:serie_planilla, :serie_planilla_d)
   and estado = 2
   and forma_de_pago = 'TRAN'
   and (
         select count(1)
           from pagos_i
          where serie_planilla = pagos_h.serie_planilla
            and numero_planilla = pagos_h.numero_planilla
            and tipdoc in ('AV', 'CV')
         ) > 0;

select distinct estado
  from pagos_h;

select *
  from pagos_i
 where serie_planilla = 42
   and numero_planilla in (135)
   and numero in ('0165597', '0015596');

select sum(importe_documento)
     , sum(importe_saldo)
     , sum(importe_cancelacion)
  from pagos_i
 where serie_planilla = 42
   and numero_planilla in (135)
   and numero in ('0165597', '0015596');

select *
  from ctabnco_cheques
 where serie_planilla = 3
   and numero_planilla in (3157, 3158, 3159);

select user as usuario, tpo.descripcion as tipo_pago,
  tpo.titulo || ' ' || dense_rank() over (order by der.fecha_pago) as descripcion
     , tpo.abreviada || ' ' || dense_rank() over (order by der.fecha_pago) as cod_proveedor,
  'DERECHOS ADUANA SEM. ' || dense_rank() over (order by der.fecha_pago) as proveedor_desc
     , der.fecha_pago as fecha_emision, der.fecha_pago as fecha_vcto, der.moneda as moneda
     , der.moneda_desc as moneda_desc, sum(der.importe) as importe, sum(der.saldo) as saldo
     , sum(der.importe_equidol) as importe_equidol, sum(der.saldo_equidol) as saldo_equidol
  from view_pago_derechos der
       left join rol_de_pagos_tipo tpo on (tpo.id_tipo_pago = 6)
 where fecha_pago between to_date('01/06/2023', 'dd/mm/yyyy') and to_date('30/06/2023', 'dd/mm/yyyy')
 group by tpo.descripcion
        , tpo.titulo
        , tpo.abreviada
        , der.fecha_pago
        , der.moneda
        , der.moneda_desc;


select case when dua.dua_fecha_real is not null then 'REAL' else 'SIMULADO' end as proyeccion
     , dua.numero_embarque, dua.proforma_numero, dua.cod_proveedor, dua.nombre, dua.oc_serie
     , dua.oc_numero, nvl(dol.import_cam, hoy.import_cam) as cambio, mon.id_moneda as moneda
     , mon.simbolo as moneda_desc, dua.dua_fecha, dua.fecha_pago, dua.documento, dua.importe
     , dua.saldo
     , round(dua.importe / nvl(dol.import_cam, hoy.import_cam), 2) as importe_equidol
     , round(dua.saldo / nvl(dol.import_cam, hoy.import_cam), 2) as saldo_equidol
  from (
         select dua.numero_embarque
              , dua.proforma_numero
              , dua.proforma_empresa as cod_proveedor
              , pro.nombre
              , dua.orden_compra_serie as oc_serie
              , dua.orden_compra_numero as oc_numero
              , dua.dua_fecha as dua_fecha_real
              , nvl(dua.dua_fecha, fn_fecha_numeracion_dua(dua.numero_embarque)) as dua_fecha
              , next_day(
             next_day(trunc(nvl(dua.dua_fecha, fn_fecha_numeracion_dua(dua.numero_embarque))) - 1,
                      'MIÉRCOLES'), 'VIERNES') as fecha_pago
              , max(pag.tipdoc || '   ' || pag.serie_num || '   ' || pag.numero) as documento
              , nvl(dua.dua_derechos_aduana_soles,
                    fn_importe_estimado_derechos(dua.numero_embarque)) as importe
           --                   , ABS(SUM(COALESCE(CASE pag.moneda WHEN 'S' THEN pag.saldo ELSE dua.dua_derechos_aduana_soles END, dua.dua_derechos_aduana_soles))) AS saldo
              , case
                  when max(pag.numero) is null then nvl(dua.dua_derechos_aduana_soles,
                                                        fn_importe_estimado_derechos(dua.numero_embarque))
                  else 0
                end as saldo
           from lg_dua dua
                left join proveed pro on (dua.proforma_empresa = pro.cod_proveed)
                left join factpag pag
                          on (pag.cod_proveedor = dua.proforma_empresa
                            and pag.serie_ref = to_char(dua.orden_compra_serie)
                            and pag.nro_referencia = to_char(dua.orden_compra_numero))
          group by dua.numero_embarque
                 , dua.proforma_numero
                 , dua.proforma_empresa
                 , pro.nombre
                 , dua.orden_compra_serie
                 , dua.orden_compra_numero
                 , dua.dua_fecha
                 , next_day(next_day(trunc(dua.dua_fecha) - 1, 'MIÉRCOLES'), 'VIERNES')
                 , dua.dua_derechos_aduana_soles
         ) dua
       left join moneda mon on (mon.id_moneda = 'S')
       left join cambdol dol
                 on (fecha = dua.fecha_pago
                   and tipo_cambio = 'V')
       left join cambdol hoy
                 on (hoy.fecha = trunc(sysdate)
                   and hoy.tipo_cambio = 'V');

--  union all
select 'SIMULADO' as proyeccion
     , emb.numero_embarque
     , null as proforma_numero
     , emb.aduana_proforma_empresa
     , pro.nombre
     , null as oc_serie
     , null as oc_numero
     , 0 as cambio
     , mon.id_moneda as moneda
     , mon.simbolo as moneda_desc
     , fn_fecha_numeracion_dua(emb.numero_embarque) as fecha
     , next_day(next_day(trunc(fn_fecha_numeracion_dua(emb.numero_embarque)) - 1, 'WEDNESDAY'),
                'FRIDAY') as fecha_pago
     , null as documento
     , fn_importe_estimado_derechos(emb.numero_embarque) as importe
     , fn_importe_estimado_derechos(emb.numero_embarque) as saldo
     , round(fn_importe_estimado_derechos(emb.numero_embarque) / hoy.import_cam,
             2) as importe_equidol
     , round(fn_importe_estimado_derechos(emb.numero_embarque) / hoy.import_cam, 2) as saldo_equidol
  from embarques_g emb
       left join lg_dua dua on (emb.numero_embarque = dua.numero_embarque)
       left join proveed pro on (emb.aduana_proforma_empresa = pro.cod_proveed)
       left join moneda mon on (mon.id_moneda = 'S')
       left join cambdol hoy
                 on (hoy.fecha = trunc(sysdate)
                   and hoy.tipo_cambio = 'V')
 where dua.numero_embarque is null
   and fn_importe_estimado_derechos(emb.numero_embarque) is not null
   and emb.bl_fecha is not null;

select next_day(sysdate, 'MIÉRCOLES') from dual;

select *
  from view_pago_derechos
 where fecha_pago between to_date('01/06/2023', 'dd/mm/yyyy') and to_date('30/06/2023', 'dd/mm/yyyy');


select *
  from movfigl
 where ano = 2024
   and mes = 1
   and tipo = '1'
 order by voucher desc;

select *
  from nrotipo
 where ano = 2024
   and mes = 1
   and tipo = '1';

-- c_porc_igv             CONSTANT NUMBER := 0.16;
-- c_porc_promo_muni      CONSTANT NUMBER := 0.02;
-- c_servicio_despacho    CONSTANT NUMBER := 9;

select (sum(round(d.precio * d.cantidad_packing * (ep.factor / 100), 2))
  + sum(round(d.precio * d.cantidad_packing * 0.16))
  + sum(round(d.precio * d.cantidad_packing * 0.02))
  + 9)
         * pkg_contabilidad.get_importe_cambio(fn_fecha_numeracion_dua(4288))
         as derechos
  from packing_g g
     , embarques_d d
     , pcarticul a
     , expartidas ep
 where d.numero_embarque = 4288
   and g.num_importa = d.num_importa
   and g.numero_embarque = d.numero_embarque
   and nvl(d.cantidad_packing, 0) > 0
   and d.cod_art = a.cod_art
   and ep.partida = a.partida;

select * from expartidas;

select d.*
  from packing_g g
     , embarques_d d
     , pcarticul a
     , expartidas ep
 where g.num_importa = d.num_importa
   and g.numero_embarque = d.numero_embarque
   and d.numero_embarque = 4288;

select * from packing_g;

select * from embarques_d;

select *
  from docu_ag
 where numero in (
   5835
   );

select *
  from item_ag
 where numero in (
                  5477, 5555
   );

select *
  from tab_lineas
 where linea between '800' and '899'
   and length(linea) = 3;

select * from lg_monedas;

select * from moneda;


select *
  from pagos_h
 where serie_planilla in (61, 62)
   and numero_planilla = 826
   and (estado = 6 or
        (estado = 2 and documentos_con_detraccion = 0))
   and forma_de_pago = 'TRAN';

select *
  from pagos_i
 where serie_planilla = 61
   and numero_planilla = 826;

select * from cabfpag;

select i.cod_proveedor, h.apellido_paterno, h.apellido_materno, h.nombres, i.importe_cancelacion,
  ' ' || '2' || decode(h.tipo_cta, 'CA', 'A', 'C') || h.sucursal || h.num_cta || '      ' ||
  rpad(h.nombres || ' ' || h.apellido_paterno || ' ' || h.apellido_materno, 40, ' ') ||
  decode(mone_cta, 'S', 'S/', 'U$') ||
  rtrim(ltrim(to_char(i.importe_cancelacion * 100, '099999999999999'))) || lpad(' ', 40, ' ') ||
  '0' || decode(d.num_doc, null, 'CE ', 'DNI') || rpad(nvl(d.num_doc, c.num_doc), 12, ' ') ||
  '1' as deta_abono
     , h.c_codigo
  from pagos_i i
     , pagos_h h
     , vendedores p
     , planilla10.personal h
     , planilla10.doc_per d
     , planilla10.doc_per c
 where i.serie_planilla = h.serie_planilla
   and i.numero_planilla = h.numero_planilla
   and h.serie_planilla = 21
   and h.numero_planilla = 1162
   and i.cod_proveedor = h.c_codigo
   and h.c_codigo = p.cod_personal
   and d.c_codigo(+) = p.cod_personal
   and d.c_doc(+) = 'LE'
   and c.c_codigo(+) = p.cod_personal
   and c.c_doc(+) = 'CE'
   and h.for_pago = 'C'
   and h.c_banco = '02'
   and p.estado = 1;

select *
  from docu_ag
 where numero = 5258;

select *
  from item_ag
 where numero = 5258;

select *
  from pagos_i
 where serie_planilla = 3
   and numero_planilla = 3466
   and cod_proveedor = 'E43495';

select *
  from pagos_h
 where generado_por_usuario = 'ODOMINGUEZ'
   and extract(year from fecha_generacion) = 2024
   and extract(month from fecha_generacion) = 10;

select to_date('18/10/2024', 'dd/mm/yyyy') from dual;

select c.fecha, c.tipo_cambio, c.import_cam
  from cambdol c
     , (
    select case
             when pkg_pagos_mes_anterior.habilitado() = 1 then pkg_pagos_mes_anterior.get_fecha()
             else trunc(sysdate)
           end as xxx
      from dual
    ) s
 where to_number(to_char(fecha, 'YYYY')) = 2024
   and to_number(to_char(fecha, 'MM')) = 11
   and tipo_cambio = 'V'
   and fecha = s.xxx
 order by fecha desc;

select *
  from movfide_situacion_banco
 where cta_cte_banco = '191-9411292-0-54'
   and p_ano = 2024
   and p_mes = 12;

select *
  from orden_de_compra
 where serie = 13
   and num_ped = 5495;

select c.fecha, c.tipo_cambio, c.import_cam
  from cambdol c
     , (
    select to_date('13/02/2025', 'dd/mm/yyyy') as xxx
      from dual
    ) s
 where to_number(to_char(fecha, 'YYYY')) = 2025
   and to_number(to_char(fecha, 'MM')) = 1
   and tipo_cambio = 'VG'
   and fecha <= s.xxx
 order by fecha desc;

select *
  from cambdol
 where tipo_cambio = 'C'
   and fecha = to_date('05/02/2025', 'dd/mm/yyyy');

select *
  from pagos_i
 where serie_planilla = 80
   and numero_planilla = 44465;

select *
  from prestamo_banco_cuota
 where cod_banco = '09'
   and cod_prestamo = '43667'
 order by nro_cuota;