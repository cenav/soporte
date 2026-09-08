-- venta nacional para bono ingenieros
select nvl(grupo, '100') as grupo
     , nvl(des_grupo, '--') as des_grupo
     , sum(dolares) as total_dolares
  from (
         select decode(
             v.ind_vta1
           , '1000', '01-EMPAQUES'
           , '2000', '02-COMERCIAL'
           , '3000', '03-BATERIAS'
           , '4000', '04-NEUMATICOS'
           , '5000', '05-ILUMINACION'
           , decode(
                 v.ind_vta1
               , null, decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS', '01-EMPAQUES')
               , '05-ILUMINACION'
             )
                )
           as divi_grupo
              , v.grupo
              , v.des_grupo
              , sum(v.dolares) as dolares
           from view_vendedor_grupo v
              , vendedores d
          where v.fecha between :g_fecha_ini and :g_fecha_fin
            and v.cod_vende = d.cod_vendedor
            and v.tipo = 'NACIONAL'
          group by decode(
              v.ind_vta1
            , '1000', '01-EMPAQUES'
            , '2000', '02-COMERCIAL'
            , '3000', '03-BATERIAS'
            , '4000', '04-NEUMATICOS'
            , '5000', '05-ILUMINACION'
            , decode(
                  v.ind_vta1
                , null,
                  decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS', '01-EMPAQUES')
                , '05-ILUMINACION'
              )
                   )
                 , v.grupo
                 , v.des_grupo
         ) venta_nacional
 where divi_grupo = '01-EMPAQUES'
 group by grupo
        , des_grupo
 union all
select 99
     , 'VENTA EXPO'
     , total_expo
  from v_docuvent_ano
 where to_number(ano || lpad(mes, 2, '0')) between to_number(to_char(:g_fecha_ini, 'YYYY') ||
                                                             lpad(to_char(:g_fecha_ini, 'MM'), 2, '0'))
         and to_number(to_char(:g_fecha_fin, 'YYYY') || lpad(to_char(:g_fecha_fin, 'MM'), 2, '0'));

select *
  from sistabgen
 where sisdatdes like '%CONSULTA VENTAS POR VENDEDOR%';


-- version 2026 venta pnc
select anio
     , 'EMPAQUES NACIONAL' as descripcion
     , sum(dolares) as total_dolares
  from (
         select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                       '03-BATERIAS',
                       '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                       '7000', '07-ADITIVOS Y LUBRICANTES',
                       decode(v.ind_vta1, null,
                              decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                     '01-EMPAQUES'),
                              '05-OTROS')) as divi_grupo
              , extract(year from v.fecha) as anio
              , sum(v.dolares) as dolares
           from view_vendedor_grupo v
              , vendedores d
          where v.fecha between :g_fecha_ini and :g_fecha_fin
            and v.cod_vende = d.cod_vendedor
            and v.tipo = 'NACIONAL'
            and v.ind_vta1 not in ('3000', '4000')
          group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                          '03-BATERIAS',
                          '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                          '7000', '07-ADITIVOS Y LUBRICANTES',
                          decode(v.ind_vta1, null,
                                 decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                        '01-EMPAQUES'), '05-OTROS'))
                 , extract(year from v.fecha)
          union
         select decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                       '03-BATERIAS',
                       '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                       '7000', '07-ADITIVOS Y LUBRICANTES',
                       decode(v.ind_vta1, null,
                              decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                     '01-EMPAQUES'),
                              '05-OTROS')) as divi_grupo
              , extract(year from v.fecha) as anio
              , sum(v.dolares) as dolares
           from view_vendedor_grupo v
              , vendedores d
          where v.fecha between :g_fecha_ini and :g_fecha_fin
            and v.cod_vende = d.cod_vendedor
            and v.tipo = 'NACIONAL'
            and v.ind_vta1 in ('3000', '4000')
          group by decode(v.ind_vta1, '1000', '01-EMPAQUES', '2000', '02-COMERCIAL', '3000',
                          '03-BATERIAS',
                          '4000', '04-NEUMATICOS', '5000', '05-OTROS',
                          '7000', '07-ADITIVOS Y LUBRICANTES',
                          decode(v.ind_vta1, null,
                                 decode(v.supervisor, '01', '01-EMPAQUES', '42', '03-BATERIAS',
                                        '01-EMPAQUES'), '05-OTROS'))
                 , extract(year from v.fecha)
         ) venta_nacional
 where divi_grupo = '01-EMPAQUES'
 group by anio
 order by anio;


-- venta expo pnc
select ano
     , 'VENTA EXPO' as descripcion
     , sum(total_expo) as total_dol
  from v_docuvent_ano
 where to_number(ano || lpad(mes, 2, '0')) between to_number(to_char(:g_fecha_ini, 'YYYY') ||
                                                             lpad(to_char(:g_fecha_ini, 'MM'), 2, '0'))
         and to_number(to_char(:g_fecha_fin, 'YYYY') || lpad(to_char(:g_fecha_fin, 'MM'), 2, '0'))
 group by ano
 order by ano;


select * from vw_planilla_mensual;

select *
  from planilla10.parampla
 where flag_pla = '9'
   and ano = 2026
 order by mes;