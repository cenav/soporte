-- nacional
select nvl(grupo, '100') as grupo
     , nvl(des_grupo, '--') as des_grupo
     , sum(soles) as total_soles
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
              , sum(v.soles) as soles
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
        , des_grupo;


-- exportacion
select total_expo
  from v_docuvent_ano
 where to_number(ano || lpad(mes, 2, '0')) between to_number(to_char(:g_fecha_ini, 'YYYY') ||
                                                             lpad(to_char(:g_fecha_ini, 'MM'), 2, '0'))
         and to_number(to_char(:g_fecha_fin, 'YYYY') || lpad(to_char(:g_fecha_fin, 'MM'), 2, '0'));


select sum(dolares) as total_empaques_nac_dol
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
              , sum(v.soles) as soles
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
 where divi_grupo = '01-EMPAQUES';

select trunc(to_date(:p_anio || lpad(:p_mes, 2, '0'), 'YYYYMM'), 'MM') from dual;
select last_day(trunc(to_date(:p_anio || lpad(:p_mes, 2, '0'), 'YYYYMM'), 'MM')) from dual;

select sysdate from dual;

select *
  from proceso_bono_oa
 where periodo_ini = to_date('01/12/2026', 'dd/mm/yyyy')
   and periodo_fin = to_date('31/12/2026', 'dd/mm/yyyy')
 order by fecha_creacion desc;