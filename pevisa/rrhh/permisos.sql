select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, a.idpersonal
     , enc.nombre as encargado
     , trunc(months_between(sysdate, per.f_ingreso) / 12) || ' años' as anos_servicio, per.sector
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
     , asistencia.personal a
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and per.c_codigo = a.cod_personal(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :mi_usuario and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :mi_usuario and id_modulo = :modulo
   ) or :mi_usuario in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by enc.nombre, per.apellido_paterno;

select *
  from planilla10.tar_encarga
 where codigo = '060';

select *
  from planilla10.personal
 where encargado = '060';

select *
  from planilla10.personal
 where c_codigo = 'E937';

select *
  from usuarios
 where usuario = 'DNUNEZ';

select *
  from usuario_modulo
 where usuario = 'DNUNEZM'
   and modulo in ('AMONESTACION', 'PERMISO', 'VACACIONES');

select *
  from usuario_modulo_alterno
 where (id_usuario = 'DNUNEZM'
   or id_alterno = 'DNUNEZM')
   and id_modulo in ('AMONESTACION', 'PERMISO', 'VACACIONES')
 order by id_modulo;

select *
  from usuario_modulo_alterno
 where id_modulo = 'EVALUACION';

-- SVAGAS
-- JVILLON
-- YORGAN ACUÑA

select *
  from modulo
 where id_modulo = 'EVALUACION';

select *
  from planilla10.tar_encarga;