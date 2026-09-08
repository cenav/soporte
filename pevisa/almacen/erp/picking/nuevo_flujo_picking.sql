select *
  from vw_batch_avance
 where (fecha_corta between :fecha_del and :fecha_al or
        (:fecha_del is null and :fecha_al is null));

select * from tmp_batch_plan;

select * from vw_batch_avance;

select *
  from batch_planeamiento
 where usuario = '';

select * from vw_batch_avance_dia;

select trunc(b.fecha) as fecha
     , to_char(trunc(b.fecha), 'DD-MON-RR', 'NLS_DATE_LANGUAGE=SPANISH') as nom_fecha
     , count(*) as total_registros
     , count(*) - count(oap.id_batch) as procesados
     , count(oap.id_batch) as pendientes, round(
    (count(*) - count(oap.id_batch)) / nullif(count(*), 0) * 100,
    2)
  as porcentaje_procesado
  from pevisa.batch_planeamiento b
       join pevisa.tmp_batch_plan tmp
            on tmp.id_batch = b.id_batch
              and tmp.tipo = b.tipo
              and tmp.serie = b.serie
              and tmp.numero = b.numero
              and tmp.usuario = user
       left join pevisa.ordenes_ar_print oap
                 on oap.tipo = b.tipo
                   and oap.serie = b.serie
                   and oap.numero = b.numero
                   and oap.id_batch = b.id_batch
 group by trunc(b.fecha)
        , to_char(trunc(b.fecha), 'DD-MON-RR', 'NLS_DATE_LANGUAGE=SPANISH');


select to_char(trunc(sysdate, 'MM'), 'DD-MON-RR', 'NLS_DATE_LANGUAGE=SPANISH') as fecha_inicio_mes
  from dual;

-- ordenes enviadas por planeamiento
select *
  from pr_ot
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1176916, 1177391, 1176937, 1177063, 1177371, 1177360, 1177065, 1176521, 1176675
   );

select *
  from pr_ot_impresion
 where nuot_tipoot_codigo = 'AR'
   and numero in (
                  1176916, 1177391, 1176937, 1177063, 1177371, 1177360, 1177065, 1176521, 1176675
   )
 order by fecha;
