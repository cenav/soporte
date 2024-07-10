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

select * from concepto_permiso;

select descripcion as dsc_concepto, id_concepto as idconcepto
  from pevisa.concepto_permiso
 where ((:maestro = 'NO' and flg_solorrhh = 0) or :maestro = 'SI')
 order by descripcion;

select serie, numero, cod_personal, nombre, seccion, fecha, desde, hasta, id_concepto, dsc_concepto
     , hora_inicio, hora_fin, observacion, cod_encargado, encargado, usuario, id_estado, desc_estado
     , nro_fisico, usuario_creacion, citt, doctor, ruta_documento, id_tipo, dsc_tipo
     , nro_especie_valorada, color, colorindex
  from vw_permisos_mismo_dia
 where (usuario = (
   select usuario
     from usuario_modulo
    where usuario = user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = user and id_modulo = :modulo
   ) or user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and (cod_personal = :id_trabajador or :id_trabajador is null)
   and (id_estado = :estado or :estado is null)
   and (id_concepto = :concepto or :concepto is null)
   and (fecha between :fecha_del and :fecha_al or
        (:fecha_del is null and :fecha_al is null));


  with permisos as (
    select serie, numero, cod_personal, nombre, seccion, fecha, desde, hasta, id_concepto
         , dsc_concepto, hora_inicio, hora_fin, observacion, cod_encargado, encargado, usuario
         , id_estado, desc_estado, nro_fisico, usuario_creacion, citt, doctor, ruta_documento
         , id_tipo, dsc_tipo, nro_especie_valorada, color, colorindex
         , count(*) over (partition by cod_personal, trunc(desde)) as cant_dia
      from vw_permisos
     where id_estado != 9
     order by cod_personal, id_concepto, fecha
    )
select p.serie, p.numero, p.cod_personal, p.nombre, p.seccion, p.fecha, p.desde, p.hasta
     , p.id_concepto, p.dsc_concepto, p.hora_inicio, p.hora_fin, p.observacion, p.cod_encargado
     , p.encargado, p.usuario, p.id_estado, p.desc_estado, p.nro_fisico, p.usuario_creacion, p.citt
     , p.doctor, p.ruta_documento, p.id_tipo, p.dsc_tipo, p.nro_especie_valorada, p.color
     , p.colorindex, p.cant_dia
  from permisos p
--  where p.cant_dia > 1
 where p.cod_personal = 'E1136'
 order by fecha;

select count(*)
  from permiso
 where id_personal = 'E43259'
   and trunc(desde) = to_date('31/05/2024', 'dd/mm/yyyy')
   and id_concepto = 'DMS'
 order by fecha desc;

select *
  from permiso
 where numero = 64617;

select *
  from permiso
 where numero = 63268;

select * from vw_permisos;

select count(*)
  from permiso
 where id_personal = 'E42422'
   and trunc(desde) = to_date('10/04/2024', 'dd/mm/yyyy')
   and id_concepto = 'DMS'
 order by fecha desc;
