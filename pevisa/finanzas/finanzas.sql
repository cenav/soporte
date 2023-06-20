select *
  from movfigl
 where ano = 2023
   and mes = 5
   and tipo = '9'
   and voucher = 50030;

select *
  from movfide
 where ano = 2023
   and mes = 5
   and tipo = '2'
   and voucher = 53388;

select *
  from factpag
 where tipdoc = '26'
   and serie_num = '008'
   and numero = '3484117';

select *
  from cabfpag
 where tipdoc = '26'
   and serie_num = '008'
   and numero = '3484117';

select * from ot_mantto where id_tipo = 'EQ' and id_serie = 2 and id_numero = 3;

select * from pevisa.tab_semanas order by al;

select *
  from pagos_h
 where serie_planilla = 1
   and numero_planilla = 24718;

select *
  from pagos_i
 where serie_planilla = 2
   and numero_planilla = 14108;


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


select * from nrotipo
where ano = 2023
and mes = 5
and tipo = '9';