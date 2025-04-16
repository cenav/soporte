select *
  from evaluacion
 where id_evaluado = 'E43232';

select *
  from vw_personal
 where nombre like '%NUNJAR%';

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = :evaluacion.id_evaluador
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;

select *
  from evaluacion
 where id_evaluacion = 10277;