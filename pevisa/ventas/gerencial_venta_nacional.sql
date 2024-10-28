select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
              '4000', '04-NEUMATICOS', '5000', '05-OTROS',
              decode(v.ind_vta1, null,
                     decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                            '01-EMPAQUES'), '05-OTROS')) as divi_grupo
     , to_char(v.grupo) as grupo, v.des_grupo, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 not in ('3000', '4000')
 group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                 '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                 decode(v.ind_vta1, null,
                        decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                               '01-EMPAQUES'), '05-OTROS'))
        , to_char(v.grupo), v.des_grupo
 union
select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000', '03-BATERIAS',
              '4000', '04-NEUMATICOS', '5000', '05-OTROS',
              decode(v.ind_vta1, null,
                     decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                            '01-EMPAQUES'), '05-OTROS')) as divi_grupo
     , v.cod_lin, v.des_linea, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 in ('3000', '4000')
 group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                 '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                 decode(v.ind_vta1, null,
                        decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                               '01-EMPAQUES'), '05-OTROS'))
        , v.cod_lin, v.des_linea
 order by 1;


select sum(decode(d.moneda, 'D', i.imp_vvta, round(i.imp_vvta / d.import_cam, 2))) as dolares
  from docuvent d
       join itemdocu i
            on d.tipodoc = i.tipodoc
              and d.serie = i.serie
              and d.numero = i.numero
       join tab_lineas l on i.cod_lin = l.linea
       left join tab_grupos g on l.grupo = g.grupo
       left join vendedores v on d.cod_vende = v.cod_vendedor
 where i.fecha_vta between :p_fecha1 and :p_fecha2
   and g.grupo = 13
   and d.estado != '9'
   and d.tipodoc != '08'
   and v.tipo = 'NACIONAL'
   and g.ind_vta1 not in ('3000', '4000');


select decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
              '02-COMERCIAL',
              decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                     '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                     decode(v.ind_vta1, null,
                            decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                   '01-EMPAQUES'), '05-OTROS'))) as divi_grupo
     , to_char(v.grupo) as grupo, v.des_grupo, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 not in ('3000', '4000')
 group by decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
                 '02-COMERCIAL',
                 decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                        '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                        decode(v.ind_vta1, null,
                               decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                      '01-EMPAQUES'), '05-OTROS')))
        , to_char(v.grupo), v.des_grupo
 union
select decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
              '02-COMERCIAL',
              decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                     '03-BATERIAS',
                     '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                     decode(v.ind_vta1, null,
                            decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                   '01-EMPAQUES'), '05-OTROS'))) as divi_grupo
     , v.cod_lin, v.des_linea, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 in ('3000', '4000')
 group by decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
                 '02-COMERCIAL',
                 decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                        '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                        decode(v.ind_vta1, null,
                               decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                      '01-EMPAQUES'), '05-OTROS')))
        , v.cod_lin, v.des_linea
 order by 1;


select decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
              '02-COMERCIAL',
              decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                     '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                     decode(v.ind_vta1, null,
                            decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                   '01-EMPAQUES'), '05-OTROS'))) as divi_grupo
     , to_char(v.grupo) as grupo, v.des_grupo, sum(v.dolares) as dolares
  from view_vendedor_grupo v
     , vendedores d
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2
   and v.cod_vende = d.cod_vendedor
   and v.tipo = 'NACIONAL'
   and v.ind_vta1 not in ('3000', '4000')
 group by decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
                 '02-COMERCIAL',
                 decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                        '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                        decode(v.ind_vta1, null,
                               decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                      '01-EMPAQUES'), '05-OTROS')))
        , to_char(v.grupo), v.des_grupo;


-- detalle empaques nacional
  with venta as (
    select d.tipodoc, d.serie, d.numero, d.cod_vende, v.supervisor, v.gerente, v.tipo, d.fecha
         , l.grupo, g.descripcion as des_grupo, i.cod_lin, l.descripcion as des_linea, i.cod_art
         , to_char(d.fecha, 'yyyy') as ano, to_char(d.fecha, 'mm') as mes, g.ind_vta1, g.ind_vta2
         , g.ind_vta3, sum(decode(d.moneda,
                                  'D', i.imp_vvta,
                                  round(i.imp_vvta / d.import_cam, 2)
                           )
                       ) as dolares
         , sum(decode(d.moneda,
                      'S', i.imp_vvta,
                      round(i.imp_vvta * d.import_cam, 2)
               )
           ) as soles
         , sum(i.cantidad) as cantidad
      from docuvent d
         , itemdocu i
         , tab_lineas l
         , tab_grupos g
         , vendedores v
     where i.tipodoc = d.tipodoc
       and i.serie = d.serie
       and i.numero = d.numero
       and d.estado <> '9'
---and d.cod_vende like :p_vende and  to_char(d.fecha,'mm/yyyy') =  '07/2013'
       and l.linea(+) = i.cod_lin
       and g.grupo(+) = l.grupo
       and v.cod_vendedor = d.cod_vende
--        AND v.tipo = 'NACIONAL'   se comento 05/05/2017
       and d.tipodoc <> '08' -- se agrego 05/05/2017...
       and l.grupo <> '33'   --- se agrego  14/06/2017....
     group by d.cod_vende, v.supervisor, v.gerente, v.tipo, d.fecha, l.grupo, g.descripcion
            , i.cod_lin, l.descripcion, l.grupo, i.cod_art, to_char(d.fecha, 'yyyy')
            , to_char(d.fecha, 'mm'), g.ind_vta1, g.ind_vta2, g.ind_vta3, d.tipodoc, d.serie
            , d.numero
    )
     , division as (
    select v.tipodoc, v.serie, v.numero, v.fecha, v.ano, v.mes, v.cod_art
         , decode(v.grupo, 13, '02-COMERCIAL', 26, '02-COMERCIAL', 28, '02-COMERCIAL', 37,
                  '02-COMERCIAL',
                  decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                         '03-BATERIAS', '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                         decode(v.ind_vta1, null,
                                decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                       '01-EMPAQUES'), '05-OTROS'))) as divi_grupo
         , to_char(v.grupo) as grupo, v.des_grupo, v.dolares as dolares
      from venta v
         , vendedores d
     where v.cod_vende like :p_vende
       and v.fecha between :p_fecha1 and :p_fecha2
       and v.cod_vende = d.cod_vendedor
       and v.tipo = 'NACIONAL'
       and v.ind_vta1 not in ('3000', '4000')
    )
select d.ano, d.mes, d.divi_grupo, d.grupo, d.des_grupo, d.tipodoc, d.serie, d.numero, d.fecha
     , d.cod_art, d.dolares
  from division d
 where d.divi_grupo = '01-EMPAQUES'
 order by ano, mes, lpad(grupo, 3, '0');


select *
  from view_vendedor_grupo v
 where v.cod_vende like :p_vende
   and v.fecha between :p_fecha1 and :p_fecha2;



select x.ano, x.mes, sum(x.total), sum(x.total_nac), sum(x.total_expo), sum(x.total_despacho)
  from (
         select to_char(fecha, 'yyyy') as ano, to_char(fecha, 'mm') as mes, (decode(moneda,
                                                                                    'D', imp_neto,
                                                                                    round(imp_neto / import_cam, 2)))
           as total
              , (decode(
             origen,
             'EXPO', 0,
             decode(moneda,
                    'D', imp_neto,
                    round(imp_neto / import_cam, 2))))
           as total_nac
              , (decode(
             origen,
             'EXPO', decode(moneda,
                            'D', imp_neto,
                            round(imp_neto / import_cam, 2)),
             0))
           as total_expo
              , 0 as total_despacho
---   FROM docuvent      se modifico 02/08/2017---
           from v_docuvent
          where estado <> '9' and not (tipodoc = '01' and origen = 'EXPO')
          union all
         select to_char(f.fecha, 'YYYY') as ano, to_char(f.fecha, 'MM') as mes, 0, 0
              , nvl(d.cif, 0) as total_expo, 0 as total_despacho
           from exfacturas f
              , exfactura_d d
          where f.estado <> '9' and d.numero = f.numero and d.canti > 0
          union all
         select to_char(f.fecemb, 'YYYY') as ano, to_char(f.fecemb, 'MM') as mes, 0 as total
              , 0 as total_nac, 0 as total_expo, nvl(d.cif, 0) as total_despacho
           from exfacturas f
              , exfactura_d d
          where f.estado <> '9' and d.numero = f.numero and d.canti > 0
         ) x
 group by x.ano, x.mes
 order by x.ano, x.mes;

-- detalle empaques exportacion
select to_char(f.fecemb, 'YYYY') as ano, to_char(f.fecemb, 'MM') as mes, 0 as total
     , 0 as total_nac, 0 as total_expo, nvl(d.cif, 0) as total_despacho
  from exfacturas f
     , exfactura_d d
 where f.estado <> '9' and d.numero = f.numero and d.canti > 0
   and extract(year from f.fecemb) = 2020;


  with detalle as (
    select x.ano, x.mes, sum(x.total), sum(x.total_nac), sum(x.total_expo), sum(x.total_despacho)
      from (
             select to_char(fecha, 'yyyy') as ano, to_char(fecha, 'mm') as mes
                  , (decode(moneda, 'D', imp_neto, round(imp_neto / import_cam, 2))) as total
                  , (decode(origen, 'EXPO', 0, decode(moneda, 'D', imp_neto,
                                                      round(imp_neto / import_cam, 2)))) as total_nac
                  , /*(DECODE (
                       origen,
                       'EXPO', DECODE (moneda,
                                       'D', imp_neto,
                                       ROUND (imp_neto / import_cam, 2)),
                       0))*/
               0 as total_expo, 0 as total_despacho
---   FROM docuvent      se modifico 02/08/2017---
               from v_docuvent
              where estado <> '9'
                and not (tipodoc = '01'
                and origen = 'EXPO')
              union all
             select to_char(fecha, 'YYYY') as ano, to_char(fecha, 'MM') as mes, 0 as total
                  , 0 as total_nac
                  , ---TIPODOC,SERIE,NUMERO,
               --DECODE(IMP_IGV,0,(DECODE(MONEDA, 'D', DECODE(MONEDA, 'S', (IMP_NETO/IMPORT_CAM), IMP_NETO),SIMP_NETO)),0) total_expo,
               decode(imp_igv, 0,
                      (decode(moneda, 'D', imp_neto, (imp_neto / import_cam)))) as total_expo
                  , 0 as total_despacho
               from v_docuvent
              where estado <> '9'
                and (origen = 'EXPO')
                and serie not in ('F057')
              union all
             select to_char(f.fecemb, 'YYYY') as ano, to_char(f.fecemb, 'MM') as mes, 0 as total
                  , 0 as total_nac
                  , 0 as total_expo, nvl(d.cif, 0) as total_despacho
               from exfacturas f
                  , exfactura_d d
              where f.estado <> '9'
                and d.numero = f.numero
                and d.canti > 0
             ) x
     group by x.ano, x.mes
     order by x.ano, x.mes
    )
select *
  from detalle
 where ano = 2020;

select *
  from v_docuvent_ano_expo_embarcado2
 where ano = 2020;



select to_char(fecha, 'yyyy') as ano, to_char(fecha, 'mm') as mes
     , tipodoc, serie, numero, fecha, moneda
     , (decode(moneda, 'D', imp_neto, round(imp_neto / import_cam, 2))) as total
     , (decode(origen, 'EXPO', 0, decode(moneda, 'D', imp_neto,
                                         round(imp_neto / import_cam, 2)))) as total_nac
     , /*(DECODE (
                       origen,
                       'EXPO', DECODE (moneda,
                                       'D', imp_neto,
                                       ROUND (imp_neto / import_cam, 2)),
                       0))*/
  0 as total_expo, 0 as total_despacho
---   FROM docuvent      se modifico 02/08/2017---
  from v_docuvent
 where estado <> '9'
   and not (tipodoc = '01'
   and origen = 'EXPO')
 union all
select to_char(fecha, 'YYYY') as ano, to_char(fecha, 'MM') as mes
     , tipodoc, serie, numero, fecha, moneda
     , 0 as total
     , 0 as total_nac
     , ---TIPODOC,SERIE,NUMERO,
  --DECODE(IMP_IGV,0,(DECODE(MONEDA, 'D', DECODE(MONEDA, 'S', (IMP_NETO/IMPORT_CAM), IMP_NETO),SIMP_NETO)),0) total_expo,
  decode(imp_igv, 0,
         (decode(moneda, 'D', imp_neto, (imp_neto / import_cam)))) as total_expo
     , 0 as total_despacho
  from v_docuvent
 where estado <> '9'
   and (origen = 'EXPO')
   and serie not in ('F057');


-- detalle empaques exportacion
select to_char(fecha, 'YYYY') as ano, to_char(fecha, 'MM') as mes
     , tipodoc, serie, numero, fecha, moneda
     , decode(imp_igv, 0,
              (decode(moneda, 'D', imp_neto, (imp_neto / import_cam)))) as total_expo
  from v_docuvent
 where estado <> '9'
   and (origen = 'EXPO')
   and serie not in ('F057')
   and extract(year from fecha) in (2020, 2021, 2023)
 order by ano, mes;
