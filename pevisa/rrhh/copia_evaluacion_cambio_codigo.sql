select *
  from planilla10.personal
 where nombres like '%LUZ%'
   and apellido_paterno like '%LOPEZ%'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

-- E42791 -> nuevo codigo
select *
  from evaluacion
 where id_evaluado = 'E1352'
 order by fecha desc;


insert into evaluacion
select 12774, fecha, 'E42791', id_evaluador, periodo_del, periodo_al, renovar_contrato
     , meses_renovacion, id_motivo_no_renovacion, otro_motivo_no_renovacion, id_estado, id_encuesta
     , no_firma_contrato_continua, id_seccion, clasificacion_final, puntaje_total
  from evaluacion
 where id_evaluacion = 12610;


insert into respuesta
select id_encuesta, id_pregunta, 12774, respuesta_numerica, respuesta_texto, respuesta_sn
     , id_calificacion, nro_orden
  from respuesta
 where id_evaluacion = 12610;

select nvl(max(id_evaluacion), 100) + 1 as new_id
  from evaluacion;


select * from respuesta;


select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = :id_evaluador
   and per.situacion not in ('8', '9')
   and per.c_codigo not in (
   select id_personal
     from cese_personal
   )
   and to_char(per.confin, 'MM') = to_char(sysdate, 'MM')
   and pevisa.sf_eval(per.c_codigo, trunc(last_day(sysdate))) is null
 order by per.apellido_paterno;

select *
  from planilla10.personal
 where c_codigo = 'E1301';